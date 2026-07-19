object frm_usuario: Tfrm_usuario
  Left = 304
  Top = 208
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela de Usu'#225'rios'
  ClientHeight = 512
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
  object SpeedButton1: TSpeedButton
    Left = 234
    Top = 229
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
    OnClick = btn_co_chefiaClick
  end
  object Label34: TLabel
    Left = 40
    Top = 216
    Width = 86
    Height = 13
    Caption = 'Superior Direto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pgctrl_usuario: TPageControl
    Left = 0
    Top = 49
    Width = 742
    Height = 463
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_usuarioChange
    OnChanging = pgctrl_usuarioChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_usuario: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 435
        Align = alClient
        DataSource = datm_usuario.ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_usuarioDblClick
        OnKeyPress = dbg_usuarioKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_USUARIO'
            Title.Caption = 'C'#243'digo'
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
            FieldName = 'NM_USUARIO'
            Title.Caption = 'Nome'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 256
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_USUARIO'
            Title.Caption = 'Apelido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CARGO'
            Title.Caption = 'Cargo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 210
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcativo'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcSelecionado'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Selec.'
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
      Caption = '&Dados B'#225'sicos'
      object TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 435
        Align = alClient
        BevelOuter = bvLowered
        Ctl3D = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 12
          Top = 14
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 66
          Top = 14
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 358
          Top = 14
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Apelido'
          FocusControl = dbedt_ap_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cargo: TLabel
          Left = 12
          Top = 100
          Width = 34
          Height = 13
          Caption = 'Cargo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cargo: TSpeedButton
          Left = 247
          Top = 113
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
          OnClick = btn_co_cargoClick
        end
        object lbl_ativo: TLabel
          Left = 450
          Top = 14
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
        object lbl_nm_email: TLabel
          Left = 12
          Top = 54
          Width = 42
          Height = 13
          AutoSize = False
          Caption = 'Email'
          FocusControl = dbedt_nm_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 182
          Width = 59
          Height = 13
          Caption = 'Avisos PO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 86
          Top = 182
          Width = 36
          Height = 13
          Caption = 'C'#233'lula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_celula: TSpeedButton
          Left = 471
          Top = 195
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
          OnClick = btn_co_celulaClick
        end
        object lblTransportadora: TLabel
          Left = 21
          Top = 342
          Width = 87
          Height = 13
          Caption = 'Transportadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnConsultaTransportadora: TSpeedButton
          Left = 480
          Top = 355
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
          OnClick = btnConsultaTransportadoraClick
        end
        object Label47: TLabel
          Left = 21
          Top = 384
          Width = 38
          Height = 13
          Caption = 'Idioma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_chefia: TSpeedButton
          Left = 471
          Top = 153
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
          OnClick = btn_co_chefiaClick
        end
        object Label22: TLabel
          Left = 13
          Top = 140
          Width = 189
          Height = 13
          Caption = 'Quem aprova minhas ocorr'#234'ncias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 123
          Top = 384
          Width = 141
          Height = 13
          Caption = 'Grupo (Detalhes do Site)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 424
          Top = 385
          Width = 72
          Height = 13
          Caption = 'Grupo (RAP)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 276
          Top = 100
          Width = 86
          Height = 13
          Caption = 'Superior Direto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_superior_direto: TSpeedButton
          Left = 470
          Top = 112
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
          OnClick = btn_co_superior_diretoClick
        end
        object dbedt_cd_usuario: TDBEdit
          Left = 12
          Top = 28
          Width = 50
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CD_USUARIO'
          DataSource = datm_usuario.ds_usuario
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_nm_usuarioChange
        end
        object dbedt_nm_usuario: TDBEdit
          Left = 66
          Top = 28
          Width = 286
          Height = 21
          DataField = 'NM_USUARIO'
          DataSource = datm_usuario.ds_usuario
          TabOrder = 1
          OnChange = dbedt_nm_usuarioChange
        end
        object dbedt_ap_usuario: TDBEdit
          Left = 356
          Top = 28
          Width = 88
          Height = 21
          DataField = 'AP_USUARIO'
          DataSource = datm_usuario.ds_usuario
          TabOrder = 2
          OnChange = dbedt_nm_usuarioChange
        end
        object dbedt_cd_cargo: TDBEdit
          Left = 12
          Top = 114
          Width = 50
          Height = 21
          DataField = 'CD_CARGO'
          DataSource = datm_usuario.ds_usuario
          TabOrder = 5
          OnChange = dbedt_nm_usuarioChange
          OnExit = dbedt_cd_cargoExit
          OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
        end
        object dbedt_nm_cargo: TDBEdit
          Left = 66
          Top = 114
          Width = 175
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LK_NM_CARGO'
          DataSource = datm_usuario.ds_usuario
          ReadOnly = True
          TabOrder = 8
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 448
          Top = 28
          Width = 49
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_usuario.ds_usuario
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_usuario.ds_yesno
          TabOrder = 3
          OnClick = dbedt_nm_usuarioChange
        end
        object dblckpbox_aviso_po: TDBLookupComboBox
          Left = 15
          Top = 196
          Width = 50
          Height = 21
          DataField = 'IN_AVISO_PO'
          DataSource = datm_usuario.ds_usuario
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_usuario.ds_yesno
          TabOrder = 6
          OnClick = dbedt_nm_usuarioChange
        end
        object dbedt_cd_celula: TDBEdit
          Left = 86
          Top = 196
          Width = 31
          Height = 21
          DataField = 'CD_CELULA'
          DataSource = datm_usuario.ds_usuario
          TabOrder = 7
          OnChange = dbedt_nm_usuarioChange
          OnExit = dbedt_cd_celulaExit
          OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
        end
        object dbedt_nm_celula: TDBEdit
          Left = 120
          Top = 196
          Width = 345
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCelula'
          DataSource = datm_usuario.ds_usuario
          ReadOnly = True
          TabOrder = 18
        end
        object dbedtCodigoTransportadora: TDBEdit
          Left = 21
          Top = 356
          Width = 50
          Height = 21
          DataField = 'CD_TRANSP_ROD'
          DataSource = datm_usuario.ds_usuario
          TabOrder = 15
          OnChange = btnConsultaTransportadoraClick
          OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
        end
        object edtNomeTransportadora: TEdit
          Left = 75
          Top = 356
          Width = 401
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 17
        end
        object dbchkSelecionado: TDBCheckBox
          Left = 21
          Top = 226
          Width = 310
          Height = 17
          Caption = 'Ver apenas selecionados'
          DataField = 'IN_SELECIONADO'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object dbchkIN_ALT_STATUS_RECEB: TDBCheckBox
          Left = 21
          Top = 243
          Width = 420
          Height = 17
          Caption = 
            'Permitir que este usu'#225'rio altere o status do recebimento para ba' +
            'ixado'
          DataField = 'IN_ALT_STATUS_RECEB'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object dblck_tp_lingua: TDBLookupComboBox
          Left = 21
          Top = 399
          Width = 100
          Height = 21
          DataField = 'CD_IDIOMA'
          DataSource = datm_usuario.ds_usuario
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_usuario.ds_lingua
          TabOrder = 16
          OnClick = dbedt_nm_usuarioChange
        end
        object dbedt_nm_chefia: TEdit
          Left = 67
          Top = 154
          Width = 398
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 19
        end
        object dbedt_cd_chefia: TDBEdit
          Left = 13
          Top = 154
          Width = 50
          Height = 21
          DataField = 'CD_CHEFIA'
          DataSource = datm_usuario.ds_usuario
          TabOrder = 20
          OnChange = btn_co_chefiaClick
          OnExit = dbedt_cd_chefiaExit
        end
        object DBCheckBox1: TDBCheckBox
          Left = 21
          Top = 259
          Width = 420
          Height = 17
          Caption = 'Permitir apenas c'#225'lculo de faturamento em modo preview'
          DataField = 'IN_MODO_PREVIEW'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object DBCheckBox2: TDBCheckBox
          Left = 21
          Top = 275
          Width = 420
          Height = 17
          Caption = 'Permitir Fechar e Reabrir movimentos no Financeiro'
          DataField = 'IN_FECHAR_MOV_FINANC'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object DBCheckBox3: TDBCheckBox
          Left = 21
          Top = 291
          Width = 420
          Height = 17
          Caption = 'Permitir que usu'#225'rio preencha o evento 092 no followup'
          DataField = 'IN_PERMITE_FATURAMENTO'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object DBCheckBox4: TDBCheckBox
          Left = 22
          Top = 309
          Width = 452
          Height = 17
          Caption = 
            'Permitir Limpar o Numero do Despacho para Desbloquear altera'#231#227'o ' +
            'na DDE'
          DataField = 'IN_PERMITE_ALTERA_REG_DDE'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object DBCheckBox5: TDBCheckBox
          Left = 22
          Top = 325
          Width = 452
          Height = 17
          Caption = 'Permitir Zerar liquida'#231#245'es canceladas'
          DataField = 'IN_ZERA_LIQUIDACAO'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object dbedt_nm_email: TDBMemo
          Left = 11
          Top = 67
          Width = 378
          Height = 23
          DataField = 'NM_EMAIL'
          DataSource = datm_usuario.ds_usuario
          MaxLength = 2000
          TabOrder = 4
          WordWrap = False
          OnChange = dbedt_nm_usuarioChange
        end
        object dblck_grupo_detalhes: TDBLookupComboBox
          Left = 123
          Top = 399
          Width = 293
          Height = 21
          DataField = 'CD_GRUPO_DETALHES'
          DataSource = datm_usuario.ds_usuario
          KeyField = 'CD_GRUPO'
          ListField = 'NM_GRUPO'
          ListSource = datm_usuario.ds_grupo
          TabOrder = 22
          OnClick = dbedt_nm_usuarioChange
        end
        object dblck_grupo_rap: TDBLookupComboBox
          Left = 425
          Top = 399
          Width = 299
          Height = 21
          DataField = 'GRUPO_RAP'
          DataSource = datm_usuario.ds_usuario
          KeyField = 'CD_GRUPO'
          ListField = 'NM_GRUPO'
          ListSource = datm_usuario.ds_grupo
          TabOrder = 23
          OnClick = dbedt_nm_usuarioChange
        end
        object dbchk_inmanager: TDBCheckBox
          Left = 394
          Top = 70
          Width = 103
          Height = 17
          Caption = 'Manager (Site)'
          DataField = 'IN_MANAGER_SITE'
          DataSource = datm_usuario.ds_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_usuarioChange
        end
        object dbedt_cd_superior_direto: TDBEdit
          Left = 276
          Top = 114
          Width = 50
          Height = 21
          DataField = 'CD_SUPERIOR_DIRETO'
          DataSource = datm_usuario.ds_usuario
          TabOrder = 25
          OnChange = btn_co_superior_diretoClick
          OnExit = dbedt_cd_superior_diretoExit
        end
        object dbedt_nm_superior_direto: TEdit
          Left = 330
          Top = 114
          Width = 134
          Height = 21
          TabStop = False
          Color = clMenu
          TabOrder = 26
        end
        object gpbAcesso: TGroupBox
          Left = 512
          Top = 14
          Width = 217
          Height = 155
          Caption = 'Acesso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
          object Label36: TLabel
            Left = 12
            Top = 22
            Width = 75
            Height = 13
            Caption = 'Nova Senha:'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 12
            Top = 46
            Width = 58
            Height = 13
            Caption = 'Confirmar:'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtNovaSenha: TEdit
            Left = 90
            Top = 19
            Width = 119
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 0
            OnKeyPress = edtNovaSenhaKeyPress
          end
          object edtConfirmaSenha: TEdit
            Left = 90
            Top = 43
            Width = 119
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 16
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 1
            OnKeyPress = edtNovaSenhaKeyPress
          end
          object btnAlterarSenha: TBitBtn
            Left = 104
            Top = 72
            Width = 105
            Height = 25
            Hint = 
              'Atualiza a senha do usu'#225'rio e remove a Flag de Expira'#231#227'o de Senh' +
              'a'
            Caption = 'Altera Senha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btnAlterarSenhaClick
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
          object btnRecriarAcessos: TBitBtn
            Left = 8
            Top = 116
            Width = 202
            Height = 25
            Hint = 'Remove e cria novamente o acesso do usu'#225'rios aos bancos de dados'
            Caption = 'Recriar Acessos aos Bancos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = btnRecriarAcessosClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
              33333333333F8888883F33330000324334222222443333388F3833333388F333
              000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
              F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
              223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
              3338888300003AAAAAAA33333333333888888833333333330000333333333333
              333333333333333333FFFFFF000033333333333344444433FFFF333333888888
              00003A444333333A22222438888F333338F3333800003A2243333333A2222438
              F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
              22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
              33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object btnBloquearUsuario: TBitBtn
            Left = 11
            Top = 72
            Width = 89
            Height = 25
            Caption = 'Bloquear'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = btnBloquearUsuarioClick
            Glyph.Data = {
              5E010000424D5E010000000000005E0000002800000010000000100000000100
              08000000000000010000120B0000120B00000A0000000A000000000000006A6A
              6A002A98AB00067BC0002AC0EA00FF00FF0040D4FF0084E0FF0098F4FF00FFFF
              FF00050505050505030303030305050505050505050502020406060604030305
              0505050505020407070700060606040305050505020407070707000707060604
              0305050502080707070700070707060603050505020808070700000007070706
              0305050502080808070100010707070603050505020408080808070707070704
              0305050505020202020202020202020205050505050502070305050502070305
              0505050505050207030505050207030505050505050502040403030304040305
              0505050505050502040707070403050505050505050505050202020203050505
              0505050505050505050505050505050505050505050505050505050505050505
              0505}
          end
          object btnDesbloquearUsuario: TBitBtn
            Left = 11
            Top = 72
            Width = 89
            Height = 25
            Caption = 'Desbloquear'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = btnDesbloquearUsuarioClick
            Glyph.Data = {
              5E010000424D5E010000000000005E0000002800000010000000100000000100
              08000000000000010000210B0000210B00000A0000000A000000000000006A6A
              6A002A98AB00067BC0002AC0EA00FF00FF0040D4FF0084E0FF0098F4FF00FFFF
              FF00050505050505030303030305050505050505050502020406060604030305
              0505050505020407070700060606040305050505020407070707000707060604
              0305050502080707070700070707060603050505020808070700000007070706
              0305050502080808070100010707070603050505020408080808070707070704
              0305050505020202020202020202020205050505050505050505050502070305
              0505050505050303030505050207030505050505050502070305050502070305
              0505050505050207030505050207030505050505050502040403030304040305
              0505050505050502040707070403050505050505050505050202020203050505
              0505}
          end
        end
      end
    end
    object ts_habilitacao: TTabSheet
      Caption = '&Habilita'#231#227'o'
      object pgctrl_habilitacao: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 435
        ActivePage = ts_lista_habilitacao
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_usuarioChange
        OnChanging = pgctrl_usuarioChanging
        object ts_lista_habilitacao: TTabSheet
          Caption = '&Lista'
          object Label7: TLabel
            Left = 8
            Top = 9
            Width = 67
            Height = 13
            AutoSize = False
            Caption = 'Usu'#225'rio'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_habilitacao: TDBGrid
            Left = 9
            Top = 48
            Width = 600
            Height = 264
            DataSource = datm_usuario.ds_usuario_habilitacao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_UNID_NEG'
                Title.Caption = 'C'#243'd. '
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
                FieldName = 'look_unidade'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 187
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_PRODUTO'
                Title.Caption = 'C'#243'd.'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_produto'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 148
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_HABILITACAO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_ativo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'look_default'
                Title.Caption = 'Padr'#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = True
              end>
          end
          object dbedt_cd_usuario2: TDBEdit
            Left = 8
            Top = 23
            Width = 33
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_USUARIO'
            DataSource = datm_usuario.ds_usuario_habilitacao
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_usuario2: TDBEdit
            Left = 49
            Top = 23
            Width = 558
            Height = 21
            TabStop = False
            DataField = 'NM_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ParentColor = True
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ts_dados_basicos_habilitacao: TTabSheet
          Caption = '&Dados B'#225'sicos'
          object pnl_habilitacao: TPanel
            Left = 8
            Top = 3
            Width = 605
            Height = 324
            BevelOuter = bvLowered
            Ctl3D = True
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object Label8: TLabel
              Left = 30
              Top = 25
              Width = 55
              Height = 13
              AutoSize = False
              Caption = 'Usu'#225'rio'
              FocusControl = dbedt_cd_usuario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_produto: TSpeedButton
              Left = 492
              Top = 144
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
            object btn_co_unidade: TSpeedButton
              Left = 493
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
              OnClick = btn_co_unidadeClick
            end
            object Label17: TLabel
              Left = 30
              Top = 73
              Width = 29
              Height = 13
              AutoSize = False
              Caption = 'C'#243'd.'
              FocusControl = dbedt_cd_usuario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 86
              Top = 73
              Width = 119
              Height = 13
              AutoSize = False
              Caption = 'Desc. Unidade'
              FocusControl = dbedt_cd_usuario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 30
              Top = 129
              Width = 29
              Height = 13
              AutoSize = False
              Caption = 'C'#243'd.'
              FocusControl = dbedt_cd_usuario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 86
              Top = 129
              Width = 96
              Height = 13
              AutoSize = False
              Caption = 'Desc. Produto'
              FocusControl = dbedt_cd_usuario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 30
              Top = 181
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
            object Label10: TLabel
              Left = 86
              Top = 181
              Width = 41
              Height = 13
              Caption = 'Padr'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 142
              Top = 181
              Width = 106
              Height = 13
              Caption = 'Acesso Admin.Site'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_nm_usuario_habilitacao: TDBEdit
              Left = 86
              Top = 41
              Width = 401
              Height = 21
              TabStop = False
              DataField = 'NM_USUARIO'
              DataSource = datm_usuario.ds_usuario
              ParentColor = True
              TabOrder = 4
            end
            object dbedt_cd_usuario_habilitacao: TDBEdit
              Left = 30
              Top = 41
              Width = 47
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_USUARIO'
              DataSource = datm_usuario.ds_usuario_habilitacao
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_cd_produto_habilitacao: TDBEdit
              Left = 30
              Top = 145
              Width = 47
              Height = 21
              DataField = 'CD_PRODUTO'
              DataSource = datm_usuario.ds_usuario_habilitacao
              ReadOnly = True
              TabOrder = 1
              OnChange = dbedt_cd_unidade_habilitacaoChange
              OnExit = dbedt_cd_produto_habilitacaoExit
              OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
            end
            object dbedt_nm_produto_habilitacao: TDBEdit
              Left = 86
              Top = 145
              Width = 402
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'look_produto'
              DataSource = datm_usuario.ds_usuario_habilitacao
              ReadOnly = True
              TabOrder = 6
            end
            object dbedt_cd_unidade_habilitacao: TDBEdit
              Left = 30
              Top = 89
              Width = 47
              Height = 21
              DataField = 'CD_UNID_NEG'
              DataSource = datm_usuario.ds_usuario_habilitacao
              ReadOnly = True
              TabOrder = 0
              OnChange = dbedt_cd_unidade_habilitacaoChange
              OnExit = dbedt_cd_unidade_habilitacaoExit
              OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
            end
            object dbedt_nm_unidade_habilitacao: TDBEdit
              Left = 86
              Top = 89
              Width = 403
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'look_unidade'
              DataSource = datm_usuario.ds_usuario_habilitacao
              ReadOnly = True
              TabOrder = 7
            end
            object dblkpcbox_ativo_hab: TDBLookupComboBox
              Left = 30
              Top = 194
              Width = 47
              Height = 21
              DataField = 'IN_ATIVO'
              DataSource = datm_usuario.ds_usuario_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_usuario.ds_yesno
              TabOrder = 2
              OnClick = dblkpcbox_ativo_habClick
              OnExit = dblkpcbox_ativo_habExit
            end
            object dblkpcbox_default_habilitacao: TDBLookupComboBox
              Left = 86
              Top = 194
              Width = 45
              Height = 21
              DataField = 'IN_DEFAULT'
              DataSource = datm_usuario.ds_usuario_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_usuario.ds_yesno
              TabOrder = 3
              OnClick = dblkpcbox_default_habilitacaoClick
              OnExit = dblkpcbox_default_habilitacaoExit
            end
            object dblkpcbox_acesso_site: TDBLookupComboBox
              Left = 142
              Top = 194
              Width = 107
              Height = 21
              DataField = 'look_acesso_site'
              DataSource = datm_usuario.ds_usuario_habilitacao
              DropDownRows = 3
              ListSource = datm_usuario.ds_yesno
              TabOrder = 8
              OnClick = dblkpcbox_default_habilitacaoClick
              OnExit = dblkpcbox_default_habilitacaoExit
            end
          end
        end
        object ts_permissoes_mi_grupo: TTabSheet
          Caption = 'Permiss'#245'es - Grupos'
          ImageIndex = 5
          object Label26: TLabel
            Left = 30
            Top = 25
            Width = 55
            Height = 13
            AutoSize = False
            Caption = 'Usu'#225'rio'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 30
            Top = 73
            Width = 43
            Height = 13
            AutoSize = False
            Caption = 'Grupo'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_grupo: TSpeedButton
            Left = 493
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
            OnClick = btn_grupoClick
          end
          object Label28: TLabel
            Left = 528
            Top = 73
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
          object DBEdit3: TDBEdit
            Left = 30
            Top = 41
            Width = 47
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit4: TDBEdit
            Left = 86
            Top = 41
            Width = 401
            Height = 21
            TabStop = False
            DataField = 'NM_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ParentColor = True
            TabOrder = 1
          end
          object dbedt_nm_grupo: TDBEdit
            Left = 86
            Top = 89
            Width = 403
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmGrupo'
            DataSource = datm_usuario.ds_permissao_grupo_
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_grupo: TDBEdit
            Left = 30
            Top = 89
            Width = 47
            Height = 21
            DataField = 'CD_GRUPO'
            DataSource = datm_usuario.ds_permissao_grupo_
            ReadOnly = True
            TabOrder = 3
            OnChange = dbedt_cd_grupoChange
            OnExit = dbedt_cd_grupoExit
            OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
          end
          object dbg_grupo: TDBGrid
            Left = 30
            Top = 128
            Width = 459
            Height = 177
            DataSource = datm_usuario.ds_permissao_grupo_
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                DropDownRows = 10
                Expanded = False
                FieldName = 'CD_GRUPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'C'#243'digo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                DropDownRows = 10
                Expanded = False
                FieldName = 'LookNmGrupo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Nome'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 343
                Visible = True
              end
              item
                DropDownRows = 10
                Expanded = False
                FieldName = 'LookAtivo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Ativo'
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
          object dblkpcbox_grupoativo: TDBLookupComboBox
            Left = 528
            Top = 88
            Width = 65
            Height = 21
            DataField = 'IN_ATIVO'
            DataSource = datm_usuario.ds_permissao_grupo_
            DropDownRows = 3
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_usuario.ds_yesno
            TabOrder = 5
            OnClick = dbedt_cd_grupoChange
          end
        end
        object ts_permissoes_mi_habilitacao: TTabSheet
          Caption = '&Permiss'#245'es - Empresas'
          object Label13: TLabel
            Left = 30
            Top = 25
            Width = 55
            Height = 13
            AutoSize = False
            Caption = 'Usu'#225'rio'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 30
            Top = 73
            Width = 43
            Height = 13
            AutoSize = False
            Caption = 'Cliente'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_cliente: TSpeedButton
            Left = 493
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
            OnClick = btn_co_clienteClick
          end
          object lbl_cliente_ativo: TLabel
            Left = 528
            Top = 73
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
          object dbedt_cd_usuario_permissao: TDBEdit
            Left = 30
            Top = 41
            Width = 47
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_usuario_permissao: TDBEdit
            Left = 86
            Top = 41
            Width = 401
            Height = 21
            TabStop = False
            DataField = 'NM_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ParentColor = True
            TabOrder = 1
          end
          object dbedt_nm_cliente: TDBEdit
            Left = 86
            Top = 89
            Width = 403
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmCliente'
            DataSource = datm_usuario.ds_usuario_permissao
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_cliente: TDBEdit
            Left = 30
            Top = 89
            Width = 47
            Height = 21
            DataField = 'CD_CLIENTE'
            DataSource = datm_usuario.ds_usuario_permissao
            ReadOnly = True
            TabOrder = 3
            OnChange = dbedt_cd_clienteChange
            OnExit = dbedt_cd_clienteExit
            OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
          end
          object dbg_cliente: TDBGrid
            Left = 30
            Top = 128
            Width = 459
            Height = 177
            DataSource = datm_usuario.ds_usuario_permissao
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                DropDownRows = 10
                Expanded = False
                FieldName = 'CD_CLIENTE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'C'#243'digo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                DropDownRows = 10
                Expanded = False
                FieldName = 'LookNmCliente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Nome'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 343
                Visible = True
              end
              item
                DropDownRows = 10
                Expanded = False
                FieldName = 'LookAtivo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Ativo'
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
          object dblkpcbox_clienteativo: TDBLookupComboBox
            Left = 528
            Top = 88
            Width = 65
            Height = 21
            DataField = 'IN_ATIVO'
            DataSource = datm_usuario.ds_usuario_permissao
            DropDownRows = 3
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_usuario.ds_yesno
            TabOrder = 5
            OnClick = dbedt_cd_clienteChange
          end
        end
        object ts_permissoes_mi_habilitacao_area: TTabSheet
          Caption = 'Permiss'#245'es - '#193'rea'
          ImageIndex = 3
          object Label19: TLabel
            Left = 30
            Top = 25
            Width = 55
            Height = 13
            AutoSize = False
            Caption = 'Usu'#225'rio'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 30
            Top = 73
            Width = 43
            Height = 13
            AutoSize = False
            Caption = #193'rea'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_area: TSpeedButton
            Left = 493
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
            OnClick = btn_co_areaClick
          end
          object Label21: TLabel
            Left = 528
            Top = 73
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
          object dbedt_cd_usuario_area: TDBEdit
            Left = 30
            Top = 41
            Width = 47
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_usuario_area: TDBEdit
            Left = 86
            Top = 41
            Width = 401
            Height = 21
            TabStop = False
            DataField = 'NM_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ParentColor = True
            TabOrder = 1
          end
          object dbedt_nm_area: TDBEdit
            Left = 86
            Top = 89
            Width = 403
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmArea'
            DataSource = datm_usuario.ds_permissao_area
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_area: TDBEdit
            Left = 30
            Top = 89
            Width = 47
            Height = 21
            DataField = 'CD_AREA'
            DataSource = datm_usuario.ds_permissao_area
            ReadOnly = True
            TabOrder = 3
            OnChange = dbedt_cd_areaChange
            OnExit = dbedt_cd_areaExit
            OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
          end
          object dblkpcbox_areaativa: TDBLookupComboBox
            Left = 528
            Top = 88
            Width = 65
            Height = 21
            DataField = 'IN_ATIVO'
            DataSource = datm_usuario.ds_permissao_area
            DropDownRows = 3
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_usuario.ds_yesno
            TabOrder = 5
            OnClick = dbedt_cd_areaChange
          end
          object dbg_area: TDBGrid
            Left = 32
            Top = 128
            Width = 473
            Height = 177
            DataSource = datm_usuario.ds_permissao_area
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_AREA'
                Title.Caption = 'C'#243'digo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookNmArea'
                Title.Caption = 'Nome'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 343
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookAtivo'
                Title.Caption = 'Ativo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 70
                Visible = True
              end>
          end
        end
        object ts_permissoes_mi_habilitacao_Empresa: TTabSheet
          Caption = 'Permiss'#245'es - Empresa Estrangeira'
          ImageIndex = 4
          object Label23: TLabel
            Left = 30
            Top = 25
            Width = 55
            Height = 13
            AutoSize = False
            Caption = 'Usu'#225'rio'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 30
            Top = 73
            Width = 125
            Height = 13
            AutoSize = False
            Caption = 'Empresa Estrangeira'
            FocusControl = dbedt_cd_usuario
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnConsultaEmpresaEst: TSpeedButton
            Left = 493
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
            OnClick = btnConsultaEmpresaEstClick
          end
          object Label25: TLabel
            Left = 528
            Top = 73
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
          object DBEdit1: TDBEdit
            Left = 30
            Top = 41
            Width = 47
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 86
            Top = 41
            Width = 401
            Height = 21
            TabStop = False
            DataField = 'NM_USUARIO'
            DataSource = datm_usuario.ds_usuario
            ParentColor = True
            TabOrder = 1
          end
          object dbedt_nm_empresa: TDBEdit
            Left = 86
            Top = 89
            Width = 403
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmEmpresa'
            DataSource = datm_usuario.DtsPermissao_EmpresaEst
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_empresa: TDBEdit
            Left = 30
            Top = 89
            Width = 47
            Height = 21
            DataField = 'CD_EMPRESA'
            DataSource = datm_usuario.DtsPermissao_EmpresaEst
            ReadOnly = True
            TabOrder = 3
            OnChange = btnConsultaEmpresaEstClick
            OnExit = dbedt_cd_empresaExit
            OnKeyDown = dbedt_cd_unidade_habilitacaoKeyDown
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 528
            Top = 88
            Width = 65
            Height = 21
            DataField = 'IN_ATIVO'
            DataSource = datm_usuario.DtsPermissao_EmpresaEst
            DropDownRows = 3
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_usuario.ds_yesno
            TabOrder = 4
            OnClick = DBLookupComboBox1Click
          end
          object DBGrid1: TDBGrid
            Left = 32
            Top = 128
            Width = 489
            Height = 177
            DataSource = datm_usuario.DtsPermissao_EmpresaEst
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_EMPRESA'
                Title.Caption = 'C'#243'digo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookNmEmpresa'
                Title.Caption = 'Nome'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 310
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookAtivo'
                Title.Caption = 'Ativo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 70
                Visible = True
              end>
          end
        end
        object ts_permissoes_mi_myindaiaweb: TTabSheet
          Caption = 'Permiss'#245'es  - myIndai'#225' Web'
          ImageIndex = 6
          object WebBrowser1: TWebBrowser
            Left = 0
            Top = 18
            Width = 726
            Height = 389
            Align = alClient
            TabOrder = 0
            ControlData = {
              4C000000094B0000342800000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E12620A000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 18
            Align = alTop
            BevelOuter = bvNone
            Color = 8404992
            TabOrder = 1
            object Label29: TLabel
              Left = 40
              Top = 2
              Width = 38
              Height = 13
              Caption = 'Menus'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label30: TLabel
              Left = 678
              Top = 3
              Width = 24
              Height = 13
              Caption = 'N'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label31: TLabel
              Left = 642
              Top = 3
              Width = 21
              Height = 13
              Caption = 'Sim'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
    end
  end
  object pnl_modulo_rotina: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 36
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
      Left = 113
      Top = 5
      Width = 36
      Height = 40
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
      Left = 399
      Top = 4
      Width = 36
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
      Width = 36
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 77
      Top = 4
      Width = 36
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
      OnClick = btn_cancelarClick
    end
    object dbnvg: TDBNavigator
      Left = 305
      Top = 13
      Width = 80
      Height = 21
      DataSource = datm_usuario.ds_usuario_lista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 438
      Top = 2
      Width = 302
      Height = 45
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 6
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
        Left = 142
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
        Left = 7
        Top = 18
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 143
        Top = 18
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object CheckBox1: TCheckBox
    Left = 627
    Top = 51
    Width = 118
    Height = 18
    Caption = 'Mostrar Inativos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = CheckBox1Click
  end
  object menu_cadastro: TMainMenu
    Left = 252
    Top = 28
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

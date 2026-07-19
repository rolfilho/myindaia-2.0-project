object frm_cliente: Tfrm_cliente
  Left = 543
  Top = 160
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Empresa Nacional'
  ClientHeight = 589
  ClientWidth = 750
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
  object pgctrl_cliente: TPageControl
    Left = 0
    Top = 48
    Width = 750
    Height = 541
    ActivePage = ts_habilitacao
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_clienteChange
    OnChanging = pgctrl_clienteChanging
    object ts_lista: TTabSheet
      BorderWidth = 4
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 22
        Width = 734
        Height = 483
        Align = alClient
        DataSource = datm_cliente.ds_empresa_nac
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_EMPRESA'
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
            FieldName = 'NM_EMPRESA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 318
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGC_EMPRESA'
            Title.Caption = 'C.N.P.J.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookINCliente'
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
            FieldName = 'LookINImportador'
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
            FieldName = 'LookINExportador'
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'LookAtivo'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 22
        Align = alTop
        TabOrder = 1
        object chk_cliente: TCheckBox
          Left = 602
          Top = 4
          Width = 115
          Height = 15
          Caption = 'Mostrar Inativos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = chk_clienteClick
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object cv: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 513
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cd_empresa: TLabel
          Left = 8
          Top = 5
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
        object lbl_nm_empresa: TLabel
          Left = 62
          Top = 5
          Width = 76
          Height = 13
          Caption = 'Raz'#227'o Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ap_empresa: TLabel
          Left = 458
          Top = 5
          Width = 43
          Height = 13
          Caption = 'Apelido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_end_empresa: TLabel
          Left = 8
          Top = 44
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
        object lbl_end_numero: TLabel
          Left = 458
          Top = 44
          Width = 44
          Height = 13
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_end_bairro: TLabel
          Left = 524
          Top = 44
          Width = 34
          Height = 13
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_end_cidade: TLabel
          Left = 8
          Top = 83
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
        object lbl_end_uf: TLabel
          Left = 231
          Top = 83
          Width = 17
          Height = 13
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_end_cep: TLabel
          Left = 294
          Top = 83
          Width = 37
          Height = 13
          Caption = 'C.E.P.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_tipo_pessoa: TLabel
          Left = 618
          Top = 5
          Width = 89
          Height = 13
          Caption = 'Tipo de Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cnpj_empresa: TLabel
          Left = 8
          Top = 122
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
        object lbl_cpf_empresa: TLabel
          Left = 127
          Top = 122
          Width = 36
          Height = 13
          Caption = 'C.P.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ie_empresa: TLabel
          Left = 300
          Top = 161
          Width = 79
          Height = 13
          Caption = 'Inscri'#231#227'o Est.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_outro_doc: TLabel
          Left = 8
          Top = 201
          Width = 74
          Height = 13
          Caption = 'Outro Docto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_inclusao: TLabel
          Left = 311
          Top = 201
          Width = 49
          Height = 13
          Caption = 'Inclus'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_grupo: TLabel
          Left = 8
          Top = 241
          Width = 35
          Height = 13
          Caption = 'Grupo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_grupo: TSpeedButton
          Left = 244
          Top = 253
          Width = 25
          Height = 23
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          ParentFont = False
          OnClick = btn_co_grupoClick
        end
        object lbl_in_ativo: TLabel
          Left = 576
          Top = 84
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
        object lbl_restricao: TLabel
          Left = 155
          Top = 201
          Width = 56
          Height = 13
          Caption = 'Restr Fin.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_eventual: TLabel
          Left = 638
          Top = 84
          Width = 51
          Height = 13
          Caption = 'Eventual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_tipo_ref: TLabel
          Left = 220
          Top = 201
          Width = 54
          Height = 13
          Caption = 'Tipo Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 282
          Top = 241
          Width = 72
          Height = 13
          Caption = 'Indicado por'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ct_contabil: TLabel
          Left = 99
          Top = 319
          Width = 84
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          FocusControl = dbedt_cd_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil: TSpeedButton
          Left = 413
          Top = 331
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
          OnClick = btn_co_ct_contabilClick
        end
        object lbl_pais: TLabel
          Left = 384
          Top = 83
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
        object btn_co_pais: TSpeedButton
          Left = 547
          Top = 95
          Width = 25
          Height = 23
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          ParentFont = False
          OnClick = btn_co_paisClick
        end
        object lbl_acesso: TLabel
          Left = 8
          Top = 319
          Width = 42
          Height = 13
          Caption = 'Acesso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_aux: TLabel
          Left = 53
          Top = 319
          Width = 22
          Height = 13
          Caption = 'Aux'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cae: TLabel
          Left = 219
          Top = 122
          Width = 25
          Height = 13
          Caption = 'CAE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 314
          Top = 122
          Width = 61
          Height = 13
          Caption = 'Tab. Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_juros: TSpeedButton
          Left = 547
          Top = 134
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
          OnClick = btn_co_moeda_jurosClick
        end
        object Label12: TLabel
          Left = 8
          Top = 161
          Width = 51
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 155
          Top = 161
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
        object lbl_libera_di: TLabel
          Left = 398
          Top = 201
          Width = 163
          Height = 13
          Caption = 'Libera DI'#180's automaticamente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ativ_economica: TLabel
          Left = 8
          Top = 280
          Width = 120
          Height = 13
          Caption = 'Atividade Econ'#244'mica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ativ_economica: TSpeedButton
          Left = 244
          Top = 293
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
          OnClick = btn_co_ativ_economicaClick
        end
        object btn_co_indicado_por: TSpeedButton
          Left = 543
          Top = 253
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
          OnClick = btn_co_indicado_porClick
        end
        object lbl_logotipo: TLabel
          Left = 282
          Top = 281
          Width = 50
          Height = 13
          Caption = 'Logotipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 440
          Top = 161
          Width = 85
          Height = 13
          Caption = 'Inscri'#231#227'o Mun.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_acc_number: TLabel
          Left = 448
          Top = 320
          Width = 95
          Height = 13
          Caption = 'Account Number'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 448
          Top = 358
          Width = 113
          Height = 13
          Caption = '% Prote'#231#227'o Cambial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 99
          Top = 358
          Width = 159
          Height = 13
          Caption = 'Conta Cont'#225'bil PIS/COFINS'
          FocusControl = dbedt_cd_ct_contabil_pis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil_pis: TSpeedButton
          Left = 413
          Top = 370
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
          OnClick = btn_co_ct_contabil_pisClick
        end
        object Label34: TLabel
          Left = 8
          Top = 358
          Width = 42
          Height = 13
          Caption = 'Acesso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 54
          Top = 358
          Width = 22
          Height = 13
          Caption = 'Aux'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel4: TBevel
          Left = 9
          Top = 396
          Width = 560
          Height = 32
          Shape = bsFrame
          Style = bsRaised
        end
        object lbl24: TLabel
          Left = 448
          Top = 281
          Width = 116
          Height = 13
          Caption = 'C'#243'd. Campo Tot. NF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object bvlConfereNF: TBevel
          Left = 574
          Top = 375
          Width = 151
          Height = 25
          Shape = bsFrame
          Style = bsRaised
        end
        object bvlInEmissaoFatura: TBevel
          Left = 574
          Top = 402
          Width = 151
          Height = 25
          Shape = bsFrame
          Style = bsRaised
        end
        object btn_uf: TSpeedButton
          Left = 262
          Top = 95
          Width = 25
          Height = 23
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          ParentFont = False
          OnClick = btn_ufClick
        end
        object lbl_fund: TLabel
          Left = 214
          Top = 405
          Width = 65
          Height = 13
          Caption = 'Disp. Legal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_disp_legal: TSpeedButton
          Left = 538
          Top = 402
          Width = 25
          Height = 21
          Enabled = False
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
          OnClick = btn_co_disp_legalClick
        end
        object SpeedButton1: TSpeedButton
          Left = 203
          Top = 95
          Width = 25
          Height = 23
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object Label54: TLabel
          Left = 10
          Top = 435
          Width = 100
          Height = 13
          Caption = 'Licen'#231'a Sanit'#225'ria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 210
          Top = 434
          Width = 76
          Height = 13
          Caption = 'End. Fiesp Id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 305
          Top = 448
          Width = 25
          Height = 20
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
          OnClick = SpeedButton3Click
        end
        object dbedt_cd_empresa: TDBEdit
          Left = 8
          Top = 18
          Width = 44
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 46
        end
        object dbedt_nm_empresa: TDBEdit
          Left = 62
          Top = 18
          Width = 385
          Height = 21
          DataField = 'NM_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 0
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_ap_empresa: TDBEdit
          Left = 458
          Top = 18
          Width = 150
          Height = 21
          DataField = 'AP_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 1
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_end_empresa: TDBEdit
          Left = 8
          Top = 57
          Width = 431
          Height = 21
          DataField = 'END_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 3
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_end_numero: TDBEdit
          Left = 458
          Top = 57
          Width = 54
          Height = 21
          DataField = 'END_NUMERO'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 4
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_end_bairro: TDBEdit
          Left = 524
          Top = 57
          Width = 202
          Height = 21
          DataField = 'END_BAIRRO'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 5
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_end_cidade: TDBEdit
          Left = 8
          Top = 96
          Width = 193
          Height = 21
          DataField = 'END_CIDADE'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 6
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_end_uf: TDBEdit
          Left = 231
          Top = 96
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'END_UF'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 7
          OnChange = dbedt_end_ufChange
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_end_cep: TDBEdit
          Left = 294
          Top = 96
          Width = 84
          Height = 21
          DataField = 'END_CEP'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 8
          OnChange = dbedt_nm_empresaChange
        end
        object dblkpcbox_tipo_pessoa: TDBLookupComboBox
          Left = 619
          Top = 18
          Width = 109
          Height = 21
          DataField = 'CD_TIPO_PESSOA'
          DataSource = datm_cliente.ds_empresa_nac
          DropDownRows = 4
          DropDownWidth = 120
          KeyField = 'CD_TIPO_PESSOA'
          ListField = 'NM_TIPO_PESSOA'
          ListSource = datm_cliente.ds_tipo_pessoa
          TabOrder = 2
          OnClick = dbedt_nm_empresaChange
          OnCloseUp = dblkpcbox_tipo_pessoaCloseUp
          OnExit = dblkpcbox_tipo_pessoaExit
        end
        object dbedt_cnpj_empresa: TDBEdit
          Left = 8
          Top = 135
          Width = 109
          Height = 21
          DataField = 'CGC_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 12
          OnChange = dbedt_nm_empresaChange
          OnExit = dbedt_cnpj_empresaExit
        end
        object dbedt_cpf_empresa: TDBEdit
          Left = 127
          Top = 135
          Width = 83
          Height = 21
          DataField = 'CPF_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 13
          OnChange = dbedt_nm_empresaChange
          OnExit = dbedt_cpf_empresaExit
        end
        object dbedt_ie_empresa: TDBEdit
          Left = 300
          Top = 174
          Width = 127
          Height = 21
          Hint = 'Utilize apenas n'#250'meros e/ou letras'
          DataField = 'IE_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 44
          OnChange = dbedt_nm_empresaChange
          OnExit = dbedt_ie_empresaExit
          OnKeyPress = dbedt_ie_empresaKeyPress
        end
        object dbedt_outro_doc: TDBEdit
          Left = 8
          Top = 214
          Width = 133
          Height = 21
          DataField = 'OUTRO_DOC'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 17
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_dt_inclusao: TDBEdit
          Left = 311
          Top = 214
          Width = 73
          Height = 21
          DataField = 'DT_INCLUSAO'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 20
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_nm_grupo: TEdit
          Left = 56
          Top = 254
          Width = 187
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 47
        end
        object pnl_classifica_cliente: TPanel
          Left = 574
          Top = 119
          Width = 154
          Height = 196
          BevelInner = bvLowered
          TabOrder = 16
          object Bevel2: TBevel
            Left = 2
            Top = 2
            Width = 150
            Height = 24
            Shape = bsFrame
            Style = bsRaised
          end
          object dbchkbox_in_cliente: TDBCheckBox
            Left = 10
            Top = 6
            Width = 57
            Height = 13
            Caption = 'Cliente'
            DataField = 'IN_CLIENTE'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_clienteClick
          end
          object dbchkbox_in_importador: TDBCheckBox
            Left = 10
            Top = 29
            Width = 73
            Height = 13
            Caption = 'Importador'
            DataField = 'IN_IMPORTADOR'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_importadorClick
          end
          object dbchkbox_in_exportador: TDBCheckBox
            Left = 10
            Top = 46
            Width = 81
            Height = 13
            Caption = 'Exportador'
            DataField = 'IN_EXPORTADOR'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_empresaChange
          end
          object dbchkbox_in_outros: TDBCheckBox
            Left = 10
            Top = 113
            Width = 60
            Height = 13
            Caption = 'Outros'
            DataField = 'IN_OUTROS'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_empresaChange
          end
          object dbchkbox_in_representante: TDBCheckBox
            Left = 10
            Top = 63
            Width = 93
            Height = 13
            Caption = 'Representante'
            DataField = 'IN_REPRESENTANTE'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_representanteClick
          end
          object dbchkbox_in_seguradora: TDBCheckBox
            Left = 10
            Top = 80
            Width = 94
            Height = 13
            Caption = 'Seguradora'
            DataField = 'IN_SEGURADORA'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_empresaChange
          end
          object dbchkbox_in_comprador: TDBCheckBox
            Left = 10
            Top = 97
            Width = 94
            Height = 13
            Caption = 'Comprador'
            DataField = 'IN_COMPRADOR'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbedt_nm_empresaChange
          end
          object dbchkbox_in_comercial: TDBCheckBox
            Left = 66
            Top = 6
            Width = 78
            Height = 13
            Caption = 'N'#227'o Cliente'
            DataField = 'IN_COMERCIAL'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 8
            ValueChecked = 'true'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_in_comercialClick
          end
          object DBCheckBox3: TDBCheckBox
            Left = 10
            Top = 130
            Width = 109
            Height = 13
            Caption = 'Verifica ICMS - DI'
            DataField = 'IN_VERIF_ICMS_TRANSM'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbedt_nm_empresaChange
          end
          object dbchkbox_in_cotacao: TDBCheckBox
            Left = 11
            Top = 147
            Width = 109
            Height = 13
            Caption = 'Cota'#231#227'o'
            DataField = 'IN_COTACAO'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbedt_nm_empresaChange
          end
          object dbchkbox_in_envia_boleto_dda: TDBCheckBox
            Left = 11
            Top = 162
            Width = 118
            Height = 17
            Caption = 'Envia Boleto DDA'
            DataField = 'IN_ENVIA_BOLETO_DDA'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbedt_nm_empresaChange
          end
          object dbchkIN_MARINHA_MERCANTE_ICMS: TDBCheckBox
            Left = 11
            Top = 178
            Width = 118
            Height = 17
            Caption = 'AFRMM no ICMS'
            DataField = 'IN_MARINHA_MERCANTE_ICMS'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbedt_nm_empresaChange
          end
        end
        object dblkpcbox_in_ativo: TDBLookupComboBox
          Left = 576
          Top = 97
          Width = 55
          Height = 21
          DataField = 'LookAtivo'
          DataSource = datm_cliente.ds_empresa_nac
          DropDownRows = 3
          TabOrder = 10
          OnClick = dbedt_nm_empresaChange
        end
        object dblkpcbox_in_restricao: TDBLookupComboBox
          Left = 155
          Top = 214
          Width = 54
          Height = 21
          DataField = 'LookRestricao'
          DataSource = datm_cliente.ds_empresa_nac
          DropDownRows = 3
          TabOrder = 18
          OnClick = dbedt_nm_empresaChange
        end
        object dblkpcbox_in_eventual: TDBLookupComboBox
          Left = 639
          Top = 97
          Width = 64
          Height = 21
          DataField = 'LookEventual'
          DataSource = datm_cliente.ds_empresa_nac
          DropDownRows = 3
          TabOrder = 11
          OnClick = dbedt_nm_empresaChange
        end
        object dblkpcbox_cd_tipo_ref: TDBLookupComboBox
          Left = 220
          Top = 214
          Width = 78
          Height = 21
          DataField = 'LookTipoRef'
          DataSource = datm_cliente.ds_empresa_nac
          DropDownRows = 3
          TabOrder = 19
          OnClick = dbedt_nm_empresaChange
        end
        object dbedt_nm_indicado_por: TEdit
          Left = 328
          Top = 254
          Width = 214
          Height = 21
          TabStop = False
          Color = clMenu
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          ReadOnly = True
          TabOrder = 51
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_nm_ct_contabil: TEdit
          Left = 192
          Top = 332
          Width = 220
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 48
        end
        object dbedt_nm_pais: TEdit
          Left = 425
          Top = 96
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 49
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 8
          Top = 332
          Width = 36
          Height = 21
          DataField = 'CD_ACESSO'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 28
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object dbedt_cd_aux: TDBEdit
          Left = 53
          Top = 332
          Width = 38
          Height = 21
          DataField = 'CD_AUX'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 29
          OnEnter = dbedt_cd_auxEnter
          OnExit = dbedt_cd_auxExit
        end
        object dbedt_nr_cae: TDBEdit
          Left = 219
          Top = 135
          Width = 85
          Height = 21
          DataField = 'NR_CAE'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 14
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_nm_moeda_juros: TEdit
          Left = 352
          Top = 135
          Width = 194
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 50
        end
        object dbedt_nr_telefone: TDBEdit
          Left = 8
          Top = 174
          Width = 132
          Height = 21
          DataField = 'NR_TELEFONE'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 42
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_nr_fax: TDBEdit
          Left = 155
          Top = 174
          Width = 132
          Height = 21
          DataField = 'NR_FAX'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 43
          OnChange = dbedt_nm_empresaChange
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 398
          Top = 214
          Width = 50
          Height = 21
          DataField = 'LookLiberaDI'
          DataSource = datm_cliente.ds_empresa_nac
          DropDownRows = 3
          TabOrder = 21
          OnClick = dbedt_nm_empresaChange
        end
        object dbedt_nm_ativ_economica: TEdit
          Left = 56
          Top = 294
          Width = 187
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 52
        end
        object dbedt_nm_logotipo: TDBEdit
          Left = 282
          Top = 294
          Width = 154
          Height = 21
          DataField = 'PATH_LOGO'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 26
          OnChange = dbedt_nm_empresaChange
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_im_empresa: TDBEdit
          Left = 440
          Top = 174
          Width = 128
          Height = 21
          DataField = 'IM_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 45
          OnChange = dbedt_nm_empresaChange
          OnExit = dbedt_ie_empresaExit
        end
        object dbedt_nr_rg: TDBEdit
          Left = 464
          Top = 214
          Width = 80
          Height = 21
          DataField = 'NR_RG'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 22
          Visible = False
          OnChange = dbedt_nm_empresaChange
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 574
          Top = 318
          Width = 155
          Height = 56
          Caption = 'Recolhimento MP164'
          Columns = 2
          DataField = 'TP_RECOLHE_MP164'
          DataSource = datm_cliente.ds_empresa_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'Integral'
            'Redu'#231#227'o'
            'Isen'#231#227'o'
            'Suspens'#227'o')
          ParentFont = False
          TabOrder = 37
          Values.Strings = (
            '1'
            '2'
            '3'
            '4')
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_accont_number: TDBEdit
          Left = 448
          Top = 332
          Width = 117
          Height = 21
          DataField = 'NR_ACCOUNT'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 31
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_prt_cambial: TDBEdit
          Left = 448
          Top = 371
          Width = 117
          Height = 21
          DataField = 'PROTECAO_MOEDA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 35
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_nm_ct_contabil_pis: TEdit
          Left = 192
          Top = 371
          Width = 220
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 53
        end
        object dbedt_cd_acesso_pis: TDBEdit
          Left = 8
          Top = 371
          Width = 36
          Height = 21
          DataField = 'CD_ACESSO_PIS'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 32
          OnEnter = dbedt_cd_acesso_pisEnter
          OnExit = dbedt_cd_acesso_pisExit
        end
        object dbedt_cd_aux_pis: TDBEdit
          Left = 54
          Top = 371
          Width = 38
          Height = 21
          DataField = 'CD_AUX_PIS'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 33
          OnEnter = dbedt_cd_aux_pisEnter
          OnExit = dbedt_cd_aux_pisExit
        end
        object dbedt_cd_ct_contabil_pis: TDBEdit
          Left = 99
          Top = 371
          Width = 93
          Height = 21
          DataField = 'CD_CT_CONTABIL_PIS'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 34
          OnChange = btn_co_ct_contabil_pisClick
          OnExit = dbedt_cd_ct_contabil_pisExit
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 99
          Top = 332
          Width = 93
          Height = 21
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 30
          OnChange = btn_co_ct_contabilClick
          OnExit = dbedt_cd_ct_contabilExit
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_cd_ativ_economica: TDBEdit
          Left = 8
          Top = 294
          Width = 49
          Height = 21
          DataField = 'CD_ATIV_ECONOMICA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 25
          OnChange = btn_co_ativ_economicaClick
          OnExit = dbedt_cd_ativ_economicaExit
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_cd_grupo: TDBEdit
          Left = 8
          Top = 254
          Width = 49
          Height = 21
          DataField = 'CD_GRUPO'
          DataSource = datm_cliente.ds_empresa_nac
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          OnChange = btn_co_grupoClick
          OnExit = dbedt_cd_grupoExit
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_cd_indicado_por: TDBEdit
          Left = 282
          Top = 254
          Width = 47
          Height = 21
          DataField = 'CD_INDICADO_POR'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 24
          OnChange = btn_co_indicado_porClick
          OnExit = dbedt_cd_indicado_porExit
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_cd_moeda_juros: TDBEdit
          Left = 314
          Top = 135
          Width = 39
          Height = 21
          DataField = 'CD_MOEDA_JUROS'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 15
          OnChange = btn_co_moeda_jurosClick
          OnExit = dbedt_cd_moeda_jurosExit
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object dbedt_cd_pais: TDBEdit
          Left = 384
          Top = 96
          Width = 42
          Height = 21
          DataField = 'CD_PAIS_IMPORTADOR'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 9
          OnChange = btn_co_paisClick
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object ChkCat63: TDBCheckBox
          Left = 15
          Top = 405
          Width = 58
          Height = 15
          Caption = 'CAT63'
          DataField = 'IN_CAT63'
          DataSource = datm_cliente.ds_empresa_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 40
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = ChkCat63Click
          OnEnter = ChkCat63Enter
        end
        object dbedtTotalNF: TDBEdit
          Left = 448
          Top = 294
          Width = 117
          Height = 21
          Hint = 
            'Indica o c'#243'digo do campo no DDNota que representa o total da Not' +
            'a (Padr'#227'o: 000099)'
          DataField = 'CD_TOTAL_NF_DDNOTA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 27
          OnChange = dbedt_nm_empresaChange
          OnExit = dbedtTotalNFExit
        end
        object dbchkInConfereNF: TDBCheckBox
          Left = 582
          Top = 380
          Width = 123
          Height = 15
          Caption = 'Confere NF'
          DataField = 'IN_CONFERE_NF'
          DataSource = datm_cliente.ds_empresa_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 38
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_empresaChange
        end
        object dbchkInEmissaoFatura: TDBCheckBox
          Left = 582
          Top = 408
          Width = 123
          Height = 15
          Hint = 
            'Para preencher com o evento 117 com a data da fatura mencionada ' +
            'na Capa do Processo de exporta'#231#227'o, marque este check.'#13#10'Para pree' +
            'ncher com a data da emiss'#227'o da fatura, desmarque esta op'#231#227'o.'
          Caption = 'Emiss'#227'o Fatura'
          DataField = 'IN_PRENCHE_FATURA'
          DataSource = datm_cliente.ds_empresa_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 39
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_empresaChange
        end
        object ChkRegimeEsp: TDBCheckBox
          Left = 91
          Top = 405
          Width = 101
          Height = 15
          Caption = 'Reg. Especial'
          DataField = 'IN_REGIME_ESP'
          DataSource = datm_cliente.ds_empresa_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 41
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = ChkRegimeEspClick
          OnEnter = ChkRegimeEspEnter
        end
        object dbedt_nm_disp_legal: TEdit
          Left = 322
          Top = 402
          Width = 214
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 54
        end
        object dbedt_cd_disp_legal: TDBEdit
          Left = 281
          Top = 402
          Width = 42
          Height = 21
          DataField = 'CD_FUND_LEGAL_ICMS'
          DataSource = datm_cliente.ds_empresa_nac
          Enabled = False
          TabOrder = 36
          OnChange = btn_co_disp_legalClick
          OnExit = dbedt_cd_disp_legalExit
          OnKeyDown = dbedt_cd_grupoKeyDown
        end
        object DBCheckBox2: TDBCheckBox
          Left = 736
          Top = 288
          Width = 97
          Height = 17
          Caption = 'DBCheckBox2'
          TabOrder = 55
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBEdit16: TDBEdit
          Left = 10
          Top = 448
          Width = 190
          Height = 21
          DataField = 'DS_LICENCA_SANITARIA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 56
          OnChange = dbedt_nm_empresaChange
        end
        object dbedt_Fiesp: TDBEdit
          Left = 210
          Top = 448
          Width = 91
          Height = 21
          DataField = 'FIESP_ID_END'
          DataSource = datm_cliente.ds_empresa_nac
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 57
          OnChange = dbedt_nm_empresaChange
        end
      end
    end
    object ts_obs: TTabSheet
      Caption = 'Obs.Particulares'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 742
        Height = 513
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label4: TLabel
        Left = 16
        Top = 67
        Width = 75
        Height = 13
        Caption = 'Observa'#231#245'es'
        FocusControl = DBMemo1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 80
        Width = 703
        Height = 339
        DataField = 'TX_OBS'
        DataSource = datm_cliente.ds_empresa_nac
        TabOrder = 0
        OnChange = dbedt_nm_empresaChange
      end
      object Panel7: TPanel
        Left = 16
        Top = 12
        Width = 701
        Height = 49
        BevelInner = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Left = 11
          Top = 8
          Width = 40
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit2: TDBEdit
          Left = 56
          Top = 23
          Width = 313
          Height = 21
          TabStop = False
          DataField = 'NM_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          ParentColor = True
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 11
          Top = 23
          Width = 45
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_EMPRESA'
          DataSource = datm_cliente.ds_empresa_nac
          TabOrder = 1
        end
      end
    end
    object ts_habilitacao: TTabSheet
      BorderWidth = 6
      Caption = '   Habilita'#231#227'o   '
      object pgctrl_cliente_hab: TPageControl
        Left = 0
        Top = 0
        Width = 730
        Height = 453
        ActivePage = ts_dados_basicos_hab
        Align = alClient
        HotTrack = True
        TabOrder = 0
        OnChange = pgctrl_clienteChange
        OnChanging = pgctrl_clienteChanging
        object ts_lista_hab: TTabSheet
          Caption = '    Lista    '
          DesignSize = (
            722
            425)
          object Shape3: TShape
            Left = 16
            Top = 4
            Width = 699
            Height = 54
            Anchors = [akTop, akRight]
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl_cd_empresa3: TLabel
            Left = 20
            Top = 13
            Width = 40
            Height = 13
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_lista_habilitacoes: TDBGrid
            Left = 7
            Top = 63
            Width = 701
            Height = 274
            DataSource = datm_cliente.ds_cliente_habilitacao
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
                FieldName = 'LookUnidNeg'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 284
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookProduto'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 225
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookAtivo'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
          object dbedt_cd_empresa3: TDBEdit
            Left = 20
            Top = 26
            Width = 42
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_EMPRESA'
            DataSource = datm_cliente.ds_empresa_nac
            TabOrder = 1
          end
          object dbedt_nm_empresa3: TDBEdit
            Left = 62
            Top = 26
            Width = 313
            Height = 21
            TabStop = False
            DataField = 'NM_EMPRESA'
            DataSource = datm_cliente.ds_empresa_nac
            ParentColor = True
            TabOrder = 2
          end
          object chk_hab_ativa: TCheckBox
            Left = 400
            Top = 30
            Width = 115
            Height = 17
            Caption = 'Mostrar Inativos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = chk_hab_ativaClick
          end
        end
        object ts_dados_basicos_hab: TTabSheet
          Caption = '   Dados B'#225'sicos  '
          object pnl_habilitacao: TPanel
            Left = 0
            Top = 0
            Width = 722
            Height = 425
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object lbl_in_ativo2: TLabel
              Left = 568
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
            object lbl_cd_unid_neg: TLabel
              Left = 8
              Top = 40
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
            object btn_co_unid_neg: TSpeedButton
              Left = 246
              Top = 51
              Width = 25
              Height = 25
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
            object btn_co_produto: TSpeedButton
              Left = 525
              Top = 50
              Width = 25
              Height = 25
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
            object lbl_cd_produto: TLabel
              Left = 288
              Top = 40
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
            object lbl_cd_tab_sda: TLabel
              Left = 8
              Top = 77
              Width = 52
              Height = 13
              Caption = 'Tab.SDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_tab_sda: TSpeedButton
              Left = 246
              Top = 88
              Width = 25
              Height = 25
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
              OnClick = btn_co_tab_sdaClick
            end
            object lbl_dt_captacao: TLabel
              Left = 266
              Top = 237
              Width = 55
              Height = 13
              Caption = 'Capta'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cd_empresa4: TLabel
              Left = 8
              Top = 3
              Width = 40
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_mod_followup: TLabel
              Left = 288
              Top = 149
              Width = 121
              Height = 13
              Caption = 'Modelo de Follow_up'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_cd_follow_up: TSpeedButton
              Left = 525
              Top = 158
              Width = 25
              Height = 25
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
              OnClick = btn_cd_follow_upClick
            end
            object Label3: TLabel
              Left = 8
              Top = 114
              Width = 121
              Height = 13
              Caption = 'Modelo de Numer'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_mod_numerario: TSpeedButton
              Left = 246
              Top = 125
              Width = 25
              Height = 25
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
              OnClick = btn_co_mod_numerarioClick
            end
            object lbl_tp_follow_up: TLabel
              Left = 8
              Top = 149
              Width = 105
              Height = 13
              Caption = 'Tipo de Follow_up'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_tp_followup: TSpeedButton
              Left = 246
              Top = 159
              Width = 25
              Height = 25
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
              OnClick = btn_tp_followupClick
            end
            object Label9: TLabel
              Left = 568
              Top = 40
              Width = 101
              Height = 13
              Caption = 'Resp. Pagto Trib.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_comp_sda: TLabel
              Left = 434
              Top = 77
              Width = 68
              Height = 13
              Caption = 'Compl. SDA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object lbl_cc_num: TLabel
              Left = 434
              Top = 114
              Width = 84
              Height = 13
              Caption = 'C/C Numer'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_obs_unica: TLabel
              Left = 568
              Top = 77
              Width = 64
              Height = 13
              Caption = 'Obs. '#218'nica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 568
              Top = 114
              Width = 51
              Height = 13
              Caption = 'Por Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 288
              Top = 77
              Width = 85
              Height = 13
              Caption = 'Tipo Tab. SDA'
              FocusControl = dblckpbox_tp_tab_sda
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 354
              Top = 237
              Width = 129
              Height = 13
              Caption = 'N'#186' Contrato de Seguro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_linhas: TLabel
              Left = 354
              Top = 279
              Width = 117
              Height = 26
              Caption = 'Espa'#231'o entre linhas Fatura Exporta'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label17: TLabel
              Left = 266
              Top = 279
              Width = 77
              Height = 26
              Caption = 'N'#186' Protocolo Mercante'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object lbl_num_fat_exp_aut: TLabel
              Left = 288
              Top = 114
              Width = 123
              Height = 13
              Caption = 'Num. Fat. Autom'#225'tico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_in_scx_icms: TLabel
              Left = 568
              Top = 149
              Width = 92
              Height = 13
              Caption = 'Tx Scx no ICMS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label40: TLabel
              Left = 288
              Top = 5
              Width = 59
              Height = 13
              Caption = 'Atendente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_atendente: TSpeedButton
              Left = 525
              Top = 15
              Width = 25
              Height = 25
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
              OnClick = btn_atendenteClick
            end
            object Label52: TLabel
              Left = 8
              Top = 187
              Width = 35
              Height = 13
              Caption = 'E-mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object Label53: TLabel
              Left = 288
              Top = 187
              Width = 63
              Height = 13
              Caption = 'Conta DHL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object dblkpcbox_in_ativo2: TDBLookupComboBox
              Left = 568
              Top = 16
              Width = 116
              Height = 21
              DataField = 'IN_ATIVO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 20
              OnClick = dbedt_cd_unid_negChange
            end
            object dbedt_nm_unid_neg: TDBEdit
              Left = 43
              Top = 53
              Width = 202
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookUnidNeg'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_nm_produto: TDBEdit
              Left = 322
              Top = 53
              Width = 202
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookProduto'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 7
            end
            object grpbox_Cred: TGroupBox
              Left = 9
              Top = 236
              Width = 235
              Height = 88
              Caption = ' Procura'#231#245'es Geral / E-cac '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 25
              object lbl_dt_valid_cred_rf: TLabel
                Left = 14
                Top = 19
                Width = 50
                Height = 13
                Caption = 'Validade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object lbl22: TLabel
                Left = 14
                Top = 41
                Width = 57
                Height = 13
                Caption = 'Solicitada'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object Label57: TLabel
                Left = 14
                Top = 63
                Width = 55
                Height = 13
                Caption = 'Recebida'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object dbedt_dt_valid_cred_RF: TDBEdit
                Left = 95
                Top = 16
                Width = 116
                Height = 21
                DataField = 'DT_VALID_CRED_RF'
                DataSource = datm_cliente.ds_cliente_habilitacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = dbedtValidAnvisaChange
                OnExit = dbedt_dt_valid_cred_RFExit
              end
              object dbedtValidAnvisa: TDBEdit
                Left = 95
                Top = 38
                Width = 116
                Height = 21
                DataField = 'DT_VALID_ANVISA'
                DataSource = datm_cliente.ds_cliente_habilitacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = dbedtValidAnvisaChange
              end
              object dbedtProcuracaoRecebida: TDBEdit
                Left = 95
                Top = 60
                Width = 116
                Height = 21
                DataField = 'DT_PROCURACAO_RECEBIDA'
                DataSource = datm_cliente.ds_cliente_habilitacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnChange = dbedtValidAnvisaChange
              end
            end
            object dbedt_nm_tab_sda: TDBEdit
              Left = 43
              Top = 90
              Width = 202
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookSDA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_dt_captacao: TDBEdit
              Left = 266
              Top = 251
              Width = 83
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'DT_CAPTACAO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              ReadOnly = True
              TabOrder = 26
              OnChange = dbedt_cd_unid_negChange
            end
            object dbedt_nm_empresa4: TDBEdit
              Left = 49
              Top = 16
              Width = 224
              Height = 21
              TabStop = False
              DataField = 'LookCliente'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ParentColor = True
              TabOrder = 1
            end
            object dbedt_nm_mod_follow_up: TDBEdit
              Left = 322
              Top = 162
              Width = 202
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'look_nm_mod_follow_up'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 19
            end
            object dbedt_nm_mod_numerario: TDBEdit
              Left = 43
              Top = 127
              Width = 202
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'look_numerario'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 11
            end
            object dbedt_nm_tp_follow_up: TDBEdit
              Left = 43
              Top = 162
              Width = 202
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'look_nm_tp_follow_up'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 13
            end
            object dblkpcbox_responsavel: TDBLookupComboBox
              Left = 568
              Top = 53
              Width = 116
              Height = 21
              DataField = 'CD_RESPONSAVEL'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_RESPONSAVEL'
              ListField = 'NM_RESPONSAVEL'
              ListSource = datm_cliente.ds_responsavel
              TabOrder = 21
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_comp_sda: TDBLookupComboBox
              Left = 434
              Top = 90
              Width = 116
              Height = 21
              DataField = 'IN_COMP_SDA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 15
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_cc_num: TDBLookupComboBox
              Left = 434
              Top = 127
              Width = 116
              Height = 21
              DataField = 'IN_CC_NUM'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 17
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_obs_unica: TDBLookupComboBox
              Left = 568
              Top = 90
              Width = 116
              Height = 21
              DataField = 'IN_OBS_UNICA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 22
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_obs_por_data: TDBLookupComboBox
              Left = 568
              Top = 127
              Width = 116
              Height = 21
              DataField = 'IN_OBS_POR_DATA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 23
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_tp_tab_sda: TDBLookupComboBox
              Left = 288
              Top = 90
              Width = 116
              Height = 21
              DataField = 'Look_Tab_SDA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 4
              ListFieldIndex = 1
              TabOrder = 14
              OnClick = dblckpbox_tp_tab_sdaClick
            end
            object dbedt_nr_contrato_seguro: TDBEdit
              Left = 354
              Top = 251
              Width = 130
              Height = 21
              DataField = 'NR_CONTRATO_SEGURO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 27
              OnChange = dbedt_cd_unid_negChange
            end
            object dbedt_nr_alt_linha_fat_exp: TDBEdit
              Left = 354
              Top = 305
              Width = 130
              Height = 21
              DataField = 'NR_ALT_LINHA_FAT_EXP'
              DataSource = datm_cliente.ds_cliente_habilitacao
              MaxLength = 3
              TabOrder = 29
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_tab_sdaExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_nr_prot_mercante: TDBEdit
              Left = 266
              Top = 305
              Width = 81
              Height = 21
              DataField = 'NR_PROT_MERCANTE'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 28
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_tab_sdaExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dblckpbox_num_fat_exp_aut: TDBLookupComboBox
              Left = 288
              Top = 127
              Width = 114
              Height = 21
              DataField = 'LookNumFatExpAut'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              ListField = 'TX_YESNO'
              TabOrder = 16
              OnClick = dbedt_cd_unid_negChange
            end
            object dblkpcbox_in_scx_icms: TDBLookupComboBox
              Left = 568
              Top = 162
              Width = 116
              Height = 21
              DataField = 'IN_TX_SCX_ICMS'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 24
              Visible = False
              OnClick = dbedt_cd_unid_negChange
            end
            object dbedt_cd_mod_follow_up: TDBEdit
              Left = 288
              Top = 162
              Width = 35
              Height = 21
              DataField = 'CD_FOLLOW_UP'
              DataSource = datm_cliente.ds_cliente_habilitacao
              MaxLength = 3
              TabOrder = 18
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_mod_follow_upExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_cd_tp_follow_up: TDBEdit
              Left = 8
              Top = 162
              Width = 35
              Height = 21
              DataField = 'CD_TP_FOLLOW_UP'
              DataSource = datm_cliente.ds_cliente_habilitacao
              MaxLength = 3
              TabOrder = 12
              OnChange = dbedt_cd_unid_negChange
              OnEnter = dbedt_cd_tp_follow_upEnter
              OnExit = dbedt_cd_tp_follow_upExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_cd_tab_sda: TDBEdit
              Left = 8
              Top = 90
              Width = 35
              Height = 21
              DataField = 'CD_TAB_SDA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 8
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_tab_sdaExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_cd_produto: TDBEdit
              Left = 288
              Top = 53
              Width = 35
              Height = 21
              DataField = 'CD_PRODUTO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 6
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_produtoExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_cd_unid_neg: TDBEdit
              Left = 8
              Top = 53
              Width = 35
              Height = 21
              DataField = 'CD_UNID_NEG'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 4
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_unid_negExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_cd_empresa4: TDBEdit
              Left = 8
              Top = 16
              Width = 42
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 0
            end
            object dbedt_cd_mod_numerario: TDBEdit
              Left = 8
              Top = 127
              Width = 35
              Height = 21
              DataField = 'CD_NUMERARIO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              MaxLength = 3
              TabOrder = 10
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_tab_sdaExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_cd_atendente: TDBEdit
              Left = 288
              Top = 18
              Width = 35
              Height = 21
              DataField = 'CD_ATENDENTE'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 2
              OnChange = btn_atendenteClick
              OnExit = dbedt_cd_atendenteExit
            end
            object edt_nm_atendente: TEdit
              Left = 323
              Top = 18
              Width = 200
              Height = 21
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 3
            end
            object GroupBox2: TGroupBox
              Left = 8
              Top = 328
              Width = 235
              Height = 82
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 30
              object Label46: TLabel
                Left = 14
                Top = 16
                Width = 75
                Height = 26
                Caption = 'RADAR Val.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object Label47: TLabel
                Left = 14
                Top = 38
                Width = 57
                Height = 13
                Caption = 'Solicitado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object Label48: TLabel
                Left = 14
                Top = 60
                Width = 55
                Height = 13
                Caption = 'Recebido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object dbedtDT_RADAR: TDBEdit
                Left = 96
                Top = 13
                Width = 116
                Height = 21
                DataField = 'DT_RADAR'
                DataSource = datm_cliente.ds_cliente_habilitacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = dbedtValidAnvisaChange
                OnExit = dbedt_dt_valid_cred_RFExit
              end
              object dbedtDT_REAJUSTE_IMP: TDBEdit
                Left = 96
                Top = 35
                Width = 116
                Height = 21
                DataField = 'DT_REAJUSTE_IMP'
                DataSource = datm_cliente.ds_cliente_habilitacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = dbedtValidAnvisaChange
                OnExit = dbedt_dt_valid_cred_RFExit
              end
              object dbedtDT_REAJUSTE_EXP: TDBEdit
                Left = 96
                Top = 57
                Width = 116
                Height = 21
                DataField = 'DT_REAJUSTE_EXP'
                DataSource = datm_cliente.ds_cliente_habilitacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnChange = dbedtValidAnvisaChange
                OnExit = dbedt_dt_valid_cred_RFExit
              end
            end
            object dbedtNM_EMAIL_EMPRESA: TDBEdit
              Left = 8
              Top = 202
              Width = 263
              Height = 21
              DataField = 'NM_EMAIL_EMPRESA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 31
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_tab_sdaExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object GroupBox1: TGroupBox
              Left = 499
              Top = 236
              Width = 218
              Height = 82
              Caption = 'Refer'#234'ncias'
              TabOrder = 32
              object Label36: TLabel
                Left = 12
                Top = 35
                Width = 137
                Height = 13
                Caption = 'Tamanho da Referencia'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label37: TLabel
                Left = 8
                Top = 53
                Width = 194
                Height = 13
                Caption = '(p/ '#241' checar tamanho, deixe zero)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
                WordWrap = True
              end
              object DBCheckBox1: TDBCheckBox
                Left = 13
                Top = 15
                Width = 195
                Height = 17
                Caption = 'Aceitar barra (/) na refer'#234'ncia'
                DataField = 'IN_REF_ACEITA_BARRA'
                DataSource = datm_cliente.ds_cliente_habilitacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
                WordWrap = True
                OnClick = dbedt_cd_unid_negChange
              end
              object DBEdit9: TDBEdit
                Left = 158
                Top = 31
                Width = 43
                Height = 21
                DataField = 'NR_TAMANHO_REF'
                DataSource = datm_cliente.ds_cliente_habilitacao
                MaxLength = 3
                TabOrder = 1
                OnChange = dbedt_cd_unid_negChange
                OnExit = dbedt_cd_tab_sdaExit
                OnKeyDown = dbedt_cd_grupoKeyDown
              end
            end
            object dbrgrp_controle_ir: TDBRadioGroup
              Left = 500
              Top = 324
              Width = 106
              Height = 88
              Caption = 'Controle I.R.R.F.'
              DataField = 'IN_TP_RETENCAO_IR'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Items.Strings = (
                'N'#227'o Reter'
                'Data da Fatura'
                'Data de Venc.'
                'Sempre Reter')
              TabOrder = 33
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object dbrgrp_controle_cofins: TDBRadioGroup
              Left = 612
              Top = 324
              Width = 106
              Height = 88
              Caption = 'Controle Pis/Cofins'
              DataField = 'IN_TP_RETENCAO_COFINS'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Items.Strings = (
                'N'#227'o Reter'
                'Data da Fatura'
                'Data de Venc.'
                'Sempre Reter')
              TabOrder = 34
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
            object dbchkInBordero: TDBCheckBox
              Left = 267
              Top = 349
              Width = 215
              Height = 17
              Caption = 'Permite Border'#244
              DataField = 'IN_BORDERO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 35
              ValueChecked = '1'
              ValueUnchecked = '0'
              WordWrap = True
              OnClick = dbedt_cd_unid_negChange
            end
            object dbchkPermiteEmail: TDBCheckBox
              Left = 267
              Top = 390
              Width = 215
              Height = 17
              Caption = 'E-mail com Documentos Anexos'
              DataField = 'IN_ENVIA_PDF'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 36
              ValueChecked = '1'
              ValueUnchecked = '0'
              WordWrap = True
              OnClick = dbedt_cd_unid_negChange
            end
            object dbchkInAutoMercFabr: TDBCheckBox
              Left = 267
              Top = 368
              Width = 215
              Height = 17
              Caption = 'Preenche Auto. Merc. na F'#225'brica'
              DataField = 'IN_AUTO_MERC_FABR'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 37
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbedt_cd_unid_negChange
            end
            object dbedtDS_CONTA_DHL: TDBEdit
              Left = 288
              Top = 202
              Width = 218
              Height = 21
              DataField = 'DS_CONTA_DHL'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 38
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_tab_sdaExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
          end
        end
        object ts_cobranca_hab: TTabSheet
          Caption = ' Cobran'#231'a / Fatura '
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 722
            Height = 425
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            DesignSize = (
              722
              425)
            object Shape4: TShape
              Left = 15
              Top = 6
              Width = 700
              Height = 45
              Anchors = [akTop, akRight]
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object lbl_sd_fat_zero: TLabel
              Left = 16
              Top = 101
              Width = 135
              Height = 13
              Caption = 'Saldo da Fatura Zerado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_sd_nota_zero: TLabel
              Left = 16
              Top = 122
              Width = 126
              Height = 13
              Caption = 'Saldo da Nota Zerado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_diversos: TLabel
              Left = 16
              Top = 143
              Width = 146
              Height = 13
              Caption = 'Grupo Diversos na Fatura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_quadro_total_fat: TLabel
              Left = 16
              Top = 164
              Width = 133
              Height = 13
              Caption = 'Quadro Total na Fatura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_ir_fat: TLabel
              Left = 16
              Top = 206
              Width = 104
              Height = 13
              Caption = 'I.R.R.F. na Fatura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 17
              Top = 252
              Width = 96
              Height = 13
              Caption = 'Dias Vencto Fat.'
              FocusControl = db_ndias_vencto
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 16
              Top = 230
              Width = 153
              Height = 13
              Caption = 'Dia '#250'til na Emiss'#227'o da Fat.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 16
              Top = 59
              Width = 75
              Height = 13
              Caption = 'Cobrar CPMF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 20
              Top = 10
              Width = 40
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 16
              Top = 185
              Width = 183
              Height = 13
              Caption = 'I.R.R.F. abaixo do Valor M'#237'nimo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 16
              Top = 80
              Width = 62
              Height = 13
              Caption = 'Cobrar ISS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 327
              Top = 103
              Width = 198
              Height = 13
              Caption = 'Cobrar CPMF sobre o Saldo Credor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 327
              Top = 125
              Width = 202
              Height = 13
              Caption = 'Notas D'#233'b/Cr'#233'd c/ Liq. Autom'#225'tica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 327
              Top = 147
              Width = 175
              Height = 13
              Caption = 'Faturas somente com Receitas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_in_exp_nf: TLabel
              Left = 327
              Top = 169
              Width = 202
              Height = 13
              Caption = 'Nome do Exportador na Nota Fiscal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cpmf_total: TLabel
              Left = 327
              Top = 81
              Width = 151
              Height = 13
              Caption = 'CPMF Total ( Maior Valor )'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 327
              Top = 212
              Width = 185
              Height = 13
              Caption = 'Valor M'#237'nimo para DI ( em US$ )'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 327
              Top = 190
              Width = 130
              Height = 13
              Caption = 'Faturas Sem Despesas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cofins_retencao: TLabel
              Left = 327
              Top = 234
              Width = 211
              Height = 13
              Caption = 'Cobrar COFINS - LEI No.10833/2003'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_aliq_cofins_cliente: TLabel
              Left = 327
              Top = 256
              Width = 88
              Height = 13
              Caption = 'Al'#237'quota Cofins'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 327
              Top = 278
              Width = 114
              Height = 13
              Caption = 'Reten'#231#227'o na Fatura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label30: TLabel
              Left = 327
              Top = 300
              Width = 94
              Height = 13
              Hint = 'Emitir Nota D'#233'bito sem verificar follow-up'
              Caption = 'ND por Despesa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Image1: TImage
              Left = 623
              Top = 298
              Width = 17
              Height = 20
              Hint = 'Emitir Nota D'#233'bito sem verificar follow-up'
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000000F00
                000010000000010004000000000080000000C40E0000C40E0000100000000000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
                0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
                0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
                F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
                3330}
              ShowHint = True
              Transparent = True
            end
            object Label31: TLabel
              Left = 17
              Top = 298
              Width = 82
              Height = 13
              Caption = 'C/C Reten'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
            end
            object Image2: TImage
              Left = 298
              Top = 297
              Width = 17
              Height = 20
              Hint = 'Fazer conta corrente da Reten'#231#227'o'
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000000F00
                000010000000010004000000000080000000C40E0000C40E0000100000000000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
                0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
                0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
                F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
                3330}
              ShowHint = True
              Transparent = True
            end
            object Label32: TLabel
              Left = 17
              Top = 319
              Width = 142
              Height = 13
              Hint = 'Emitir Nota D'#233'bito sem verificar follow-up'
              Caption = 'Reten'#231#227'o na Nota Fiscal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Image3: TImage
              Left = 298
              Top = 318
              Width = 17
              Height = 20
              Hint = 
                'Sempre aparece a remessa na Nota Fiscal independente do valor tr' +
                'ibut'#225'vel'
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000000F00
                000010000000010004000000000080000000C40E0000C40E0000100000000000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
                0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
                0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
                F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
                3330}
              ShowHint = True
              Transparent = True
            end
            object Label39: TLabel
              Left = 327
              Top = 323
              Width = 218
              Height = 13
              Hint = 
                'Inclui documentos cadastrados para o cliente na aba Documentos t' +
                'ela Solicita'#231#227'o de Faturamento'
              Caption = 'Doctos na Solicita'#231#227'o de Faturamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Image4: TImage
              Left = 623
              Top = 321
              Width = 17
              Height = 20
              Hint = 
                'Inclui documentos cadastrados para o cliente na aba Documentos t' +
                'ela Solicita'#231#227'o de Faturamento'
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170F6000000424DF60000000000000076000000280000000F00
                000010000000010004000000000080000000C40E0000C40E0000100000000000
                0000000000000000800000800000008080008000000080008000808000007F7F
                7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
                0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
                0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
                F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
                3330}
              ShowHint = True
              Transparent = True
            end
            object Label42: TLabel
              Left = 16
              Top = 279
              Width = 254
              Height = 13
              Caption = 'Vencto dia      do mesmo m'#234's se Fat. at'#233' dia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcbox_in_sd_fat_zerado: TDBLookupComboBox
              Left = 224
              Top = 96
              Width = 74
              Height = 21
              DataField = 'IN_SD_FAT_ZERO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 2
              OnClick = dbedt_cd_unid_negChange
            end
            object dblkpcbox_in_sd_nota_zerado: TDBLookupComboBox
              Left = 224
              Top = 117
              Width = 74
              Height = 21
              DataField = 'IN_SD_NOTA_ZERO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 3
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_diversos: TDBLookupComboBox
              Left = 224
              Top = 138
              Width = 74
              Height = 21
              DataField = 'IN_DIVERSOS'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 4
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_quadro_total_fat: TDBLookupComboBox
              Left = 224
              Top = 159
              Width = 74
              Height = 21
              DataField = 'IN_QUADRO_TOTAL_FAT'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 5
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_ir_fat: TDBLookupComboBox
              Left = 155
              Top = 203
              Width = 143
              Height = 21
              DataField = 'CD_IR_FAT'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_IR_FAT'
              ListField = 'NM_IR_FAT'
              ListSource = datm_cliente.ds_ir_fat
              TabOrder = 7
              OnClick = dbedt_cd_unid_negChange
            end
            object db_ndias_vencto: TDBEdit
              Left = 232
              Top = 249
              Width = 64
              Height = 21
              DataField = 'NR_DIAS_VENCTO_FATURA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 9
              OnChange = dbedt_cd_unid_negChange
            end
            object dblckpbox_dia_util_emis_fat: TDBLookupComboBox
              Left = 198
              Top = 226
              Width = 100
              Height = 21
              DataField = 'IN_DIA_UTIL_EMISSAO_FAT'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 8
              OnClick = dbedt_cd_unid_negChange
            end
            object dblkpcbox_in_nao_cpmf: TDBLookupComboBox
              Left = 224
              Top = 54
              Width = 74
              Height = 21
              DataField = 'IN_COBRAR_CPMF'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 0
              OnClick = dblkpcbox_in_nao_cpmfClick
            end
            object dbedt_cd_cliente3: TDBEdit
              Left = 20
              Top = 23
              Width = 41
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 19
            end
            object dbedt_nm_cliente3: TDBEdit
              Left = 61
              Top = 23
              Width = 314
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCliente'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 20
            end
            object dblkpcbox_in_cpmf_saldo_credor: TDBLookupComboBox
              Left = 547
              Top = 99
              Width = 75
              Height = 21
              DataField = 'IN_CPMF_SALDO_CREDOR'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 13
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_calcula_irrf_vl_min: TDBLookupComboBox
              Left = 224
              Top = 180
              Width = 74
              Height = 21
              DataField = 'IN_CALCULA_IRRF_VL_MIN'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 6
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_nota_liq: TDBLookupComboBox
              Left = 547
              Top = 121
              Width = 75
              Height = 21
              DataField = 'IN_NOTA_LIQ'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 14
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_fat_rec: TDBLookupComboBox
              Left = 547
              Top = 143
              Width = 75
              Height = 21
              DataField = 'IN_FAT_REC'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 15
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_exp_nf: TDBLookupComboBox
              Left = 547
              Top = 165
              Width = 75
              Height = 21
              DataField = 'IN_EXP_NF'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 16
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_in_cobrar_iss: TDBLookupComboBox
              Left = 224
              Top = 75
              Width = 74
              Height = 21
              DataField = 'IN_COBRAR_ISS'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 1
              OnClick = dblkpcbox_in_nao_cpmfClick
            end
            object dblckpbox_in_cpmf_total: TDBLookupComboBox
              Left = 547
              Top = 77
              Width = 75
              Height = 21
              DataField = 'IN_CPMF_TOTAL'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 12
              OnClick = dblkpcbox_in_nao_cpmfClick
            end
            object dbedt_vl_min_di: TRxDBCalcEdit
              Left = 547
              Top = 208
              Width = 149
              Height = 21
              DataField = 'VL_MIN_DI'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DisplayFormat = '#0,.00'
              NumGlyphs = 2
              TabOrder = 18
              OnChange = dbedt_cd_unid_negChange
            end
            object dblckpbox_fat_sem_desp: TDBLookupComboBox
              Left = 547
              Top = 186
              Width = 75
              Height = 21
              DataField = 'IN_FAT_SEM_DESP'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 17
              OnClick = dbedt_cd_unid_negChange
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 547
              Top = 230
              Width = 75
              Height = 21
              DataField = 'IN_COBRAR_COFINS'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 21
              OnClick = dbedt_cd_unid_negChange
            end
            object dbedt_ali_cofins_cliente: TDBEdit
              Left = 547
              Top = 252
              Width = 95
              Height = 21
              DataField = 'VL_ALIQ_COFINS_CLIENTE'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 22
              OnChange = dbedt_cd_unid_negChange
            end
            object dblckpbox_ret_fat: TDBLookupComboBox
              Left = 547
              Top = 274
              Width = 147
              Height = 21
              DataField = 'CD_RET_FAT'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_RET_FAT'
              ListField = 'NM_RET_FAT'
              ListSource = datm_cliente.ds_ret_fat
              TabOrder = 23
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_nd_despesa: TDBLookupComboBox
              Left = 547
              Top = 296
              Width = 75
              Height = 21
              DataField = 'IN_ND'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 24
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_retencao: TDBLookupComboBox
              Left = 222
              Top = 295
              Width = 75
              Height = 21
              DataField = 'IN_AVISO_RETENCAO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 10
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_remessa: TDBLookupComboBox
              Left = 222
              Top = 318
              Width = 75
              Height = 21
              DataField = 'IN_REMESSA'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 11
              OnClick = dbedt_cd_unid_negChange
            end
            object dblckpbox_docto_solic: TDBLookupComboBox
              Left = 547
              Top = 319
              Width = 75
              Height = 21
              DataField = 'IN_DOCTO_SOLIC'
              DataSource = datm_cliente.ds_cliente_habilitacao
              DropDownRows = 3
              KeyField = 'CD_YESNO'
              ListField = 'TX_YESNO'
              ListSource = datm_cliente.ds_yesno
              TabOrder = 25
              OnClick = dbedt_cd_unid_negChange
            end
            object DBEdit10: TDBEdit
              Left = 79
              Top = 270
              Width = 22
              Height = 21
              DataField = 'NR_DIA_VENCTO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 26
              OnChange = dbedt_cd_unid_negChange
            end
            object DBEdit11: TDBEdit
              Left = 274
              Top = 272
              Width = 22
              Height = 21
              DataField = 'NR_DIA_VENCTO_BASE'
              DataSource = datm_cliente.ds_cliente_habilitacao
              TabOrder = 27
              OnChange = dbedt_cd_unid_negChange
            end
          end
        end
        object ts_num_usd: TTabSheet
          Caption = 'Numer'#225'rio em D'#243'lar'
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 722
            Height = 99
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label5: TLabel
              Left = 15
              Top = 15
              Width = 40
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 15
              Top = 51
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
            object Label7: TLabel
              Left = 364
              Top = 51
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
            object DBEdit3: TDBEdit
              Left = 15
              Top = 28
              Width = 41
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_CLIENTE'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 56
              Top = 28
              Width = 313
              Height = 21
              TabStop = False
              DataField = 'LookCliente'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ParentColor = True
              TabOrder = 1
            end
            object DBEdit5: TDBEdit
              Left = 15
              Top = 64
              Width = 34
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 2
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_unid_negExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object DBEdit6: TDBEdit
              Left = 49
              Top = 64
              Width = 301
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookUnidNeg'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit7: TDBEdit
              Left = 364
              Top = 64
              Width = 37
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_PRODUTO'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 4
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_produtoExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object DBEdit8: TDBEdit
              Left = 401
              Top = 64
              Width = 301
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookProduto'
              DataSource = datm_cliente.ds_cliente_habilitacao
              ReadOnly = True
              TabOrder = 5
            end
          end
          object dbg_item: TDBGrid
            Left = 10
            Top = 110
            Width = 368
            Height = 226
            DataSource = datm_cliente.ds_num_usd
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ITEM'
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
                FieldName = 'LookItem'
                Title.Caption = 'Descri'#231#227'o'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 293
                Visible = True
              end>
          end
          object pnl_item: TPanel
            Left = 390
            Top = 111
            Width = 317
            Height = 66
            BevelOuter = bvLowered
            Enabled = False
            TabOrder = 2
            object lbl_item: TLabel
              Left = 18
              Top = 16
              Width = 25
              Height = 13
              Caption = 'Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_item: TSpeedButton
              Left = 273
              Top = 28
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
              OnClick = btn_co_itemClick
            end
            object dbedt_cd_item: TDBEdit
              Left = 18
              Top = 28
              Width = 38
              Height = 21
              DataField = 'CD_ITEM'
              DataSource = datm_cliente.ds_num_usd
              TabOrder = 0
              OnExit = dbedt_cd_itemExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
            object dbedt_nm_item: TDBEdit
              Left = 56
              Top = 28
              Width = 216
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookItem'
              DataSource = datm_cliente.ds_num_usd
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
        object tbsOutros: TTabSheet
          Caption = 'Outros'
          ImageIndex = 4
          DesignSize = (
            722
            425)
          object gpbDFJanelas: TGroupBox
            Left = 8
            Top = 8
            Width = 238
            Height = 409
            Anchors = [akLeft, akTop, akBottom]
            Caption = 'Daily Followup Janelas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            DesignSize = (
              238
              409)
            object Label44: TLabel
              Left = 8
              Top = 32
              Width = 44
              Height = 13
              Caption = 'e-mails:'
            end
            object Label45: TLabel
              Left = 56
              Top = 32
              Width = 93
              Height = 13
              Caption = '(um e-mail por linha)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbmmoNM_EMAILS: TDBMemo
              Left = 8
              Top = 48
              Width = 221
              Height = 353
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataField = 'NM_EMAILS'
              DataSource = datm_cliente.ds_cliente_habilitacao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object GroupBox3: TGroupBox
            Left = 260
            Top = 8
            Width = 237
            Height = 66
            Caption = 'Integra'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label49: TLabel
              Left = 9
              Top = 17
              Width = 208
              Height = 13
              Caption = 'C'#243'digo Interno no sistema do cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEdit12: TDBEdit
              Left = 7
              Top = 32
              Width = 210
              Height = 21
              DataField = 'COD_INTERNO'
              DataSource = datm_cliente.ds_empresa_nac
              TabOrder = 0
              OnChange = dbedt_nm_empresaChange
            end
          end
          object GroupBox4: TGroupBox
            Left = 260
            Top = 80
            Width = 333
            Height = 113
            Caption = 'Integra'#231#227'o com Anvisa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Label50: TLabel
              Left = 8
              Top = 16
              Width = 129
              Height = 13
              Caption = 'Id da pessoa representada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label51: TLabel
              Left = 8
              Top = 60
              Width = 132
              Height = 13
              Caption = 'Id do usu'#225'rio representante:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit13: TDBEdit
              Left = 7
              Top = 32
              Width = 310
              Height = 21
              DataField = 'ID_REPRESENTADA'
              DataSource = datm_cliente.ds_empresa_nac
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_nm_empresaChange
            end
            object DBEdit14: TDBEdit
              Left = 7
              Top = 76
              Width = 310
              Height = 21
              DataField = 'ID_REPRESENTANTE'
              DataSource = datm_cliente.ds_empresa_nac
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = dbedt_nm_empresaChange
            end
          end
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 460
        Width = 730
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object btn_contato: TButton
          Left = 17
          Top = 7
          Width = 90
          Height = 26
          Caption = '&Contato'
          Enabled = False
          TabOrder = 0
          OnClick = btn_contatoClick
        end
        object btn_transp: TButton
          Left = 111
          Top = 7
          Width = 90
          Height = 26
          Caption = '&Transp.'
          Enabled = False
          TabOrder = 1
          OnClick = btn_transpClick
        end
        object btn_CPMF: TButton
          Left = 677
          Top = 7
          Width = 14
          Height = 26
          Caption = 'CPM&F'
          Enabled = False
          TabOrder = 2
          Visible = False
          OnClick = btn_CPMFClick
        end
        object btn_servico: TButton
          Left = 299
          Top = 7
          Width = 90
          Height = 26
          Caption = 'Ser&vi'#231'o'
          Enabled = False
          TabOrder = 3
          OnClick = btn_servicoClick
        end
        object btn_cc_propria: TButton
          Left = 694
          Top = 7
          Width = 14
          Height = 26
          Caption = '&C/C Pr'#243'pria'
          Enabled = False
          TabOrder = 4
          Visible = False
          OnClick = btn_cc_propriaClick
        end
        object btn_documentos: TButton
          Left = 393
          Top = 7
          Width = 90
          Height = 26
          Caption = '&Doctos.'
          Enabled = False
          TabOrder = 5
          OnClick = btn_documentosClick
        end
        object btn_icms_sul: TButton
          Left = 710
          Top = 7
          Width = 14
          Height = 26
          Caption = '&Base Icms'
          Enabled = False
          TabOrder = 6
          Visible = False
          OnClick = btn_icms_sulClick
        end
        object btn_agente: TButton
          Left = 205
          Top = 7
          Width = 90
          Height = 26
          Caption = '&Agentes'
          Enabled = False
          TabOrder = 7
          OnClick = btn_agenteClick
        end
        object btn_conta_contabil: TButton
          Left = 488
          Top = 7
          Width = 90
          Height = 26
          Caption = 'Co&nta Cont'#225'bil'
          Enabled = False
          TabOrder = 8
          OnClick = btn_conta_contabilClick
        end
        object btn_acesso_externo: TButton
          Left = 583
          Top = 7
          Width = 90
          Height = 26
          Caption = 'Ac&esso Externo'
          Enabled = False
          TabOrder = 9
          OnClick = btn_acesso_externoClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 453
        Width = 730
        Height = 7
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object ts_armazenagem: TTabSheet
      Caption = 'Armazenagem'
      ImageIndex = 4
      object pgctrl_despesas: TPageControl
        Left = 0
        Top = 0
        Width = 742
        Height = 513
        ActivePage = ts_despesas_lista
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_despesasChange
        OnChanging = pgctrl_despesasChanging
        object ts_despesas_lista: TTabSheet
          Caption = 'Listagem de Armaz'#233'ns'
          object shp1: TShape
            Left = 0
            Top = 0
            Width = 734
            Height = 52
            Align = alTop
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl2: TLabel
            Left = 0
            Top = 52
            Width = 250
            Height = 13
            Align = alTop
            Caption = 'Listagem de Armaz'#233'ns cadastrados para esse cliente'
            Color = clBtnFace
            ParentColor = False
          end
          object lbl9: TLabel
            Left = 10
            Top = 10
            Width = 32
            Height = 13
            Caption = 'Cliente'
          end
          object dbgrdListaArm: TDBGrid
            Left = 0
            Top = 65
            Width = 734
            Height = 420
            Align = alClient
            DataSource = dsArmazensCliente
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_ARMAZEM'
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'calcArmazem'
                Title.Caption = 'Nome do Armaz'#233'm'
                Width = 500
                Visible = True
              end>
          end
          object ed1: TDBEdit
            Left = 10
            Top = 23
            Width = 100
            Height = 19
            BevelInner = bvLowered
            BevelOuter = bvNone
            BevelKind = bkSoft
            Ctl3D = False
            DataField = 'CD_EMPRESA'
            DataSource = datm_cliente.ds_empresa_nac
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnChange = ed1Change
          end
          object ed2: TEdit
            Left = 110
            Top = 23
            Width = 606
            Height = 19
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = True
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object pnlIncluirArmazem: TPanel
            Left = 123
            Top = 176
            Width = 497
            Height = 77
            TabOrder = 3
            Visible = False
            object shp8: TShape
              Left = 8
              Top = 8
              Width = 481
              Height = 61
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object lbl1: TLabel
              Left = 19
              Top = 22
              Width = 207
              Height = 13
              Caption = 'Selecione o armaz'#233'm e clique em " Salvar "'
            end
            object btn_co_amz_atr_im: TSpeedButton
              Left = 451
              Top = 35
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
              OnClick = btn_co_amz_atr_imClick
            end
            object ed_nm_amz: TEdit
              Tag = 666
              Left = 69
              Top = 35
              Width = 381
              Height = 21
              TabStop = False
              Color = clMenu
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_cd_amz_atr_im: TDBEdit
              Tag = 666
              Left = 20
              Top = 35
              Width = 50
              Height = 21
              DataField = 'CD_ARMAZEM'
              DataSource = dsArmazensCliente
              TabOrder = 0
              OnExit = dbedt_cd_amz_atr_imExit
              OnKeyDown = dbedt_cd_grupoKeyDown
            end
          end
        end
        object ts_despesas_config: TTabSheet
          Caption = 'Configura'#231#227'o de Despesas'
          ImageIndex = 1
          object pgc_config: TPageControl
            Left = 0
            Top = 0
            Width = 734
            Height = 485
            ActivePage = tsTabelas
            Align = alClient
            TabOrder = 0
            OnChange = pgc_configChange
            OnChanging = pgc_configChanging
            object tsTabelas: TTabSheet
              Caption = 'Tabelas'
              ImageIndex = 2
              object shp10: TShape
                Left = 5
                Top = 3
                Width = 709
                Height = 51
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object lbl16: TLabel
                Left = 16
                Top = 13
                Width = 43
                Height = 13
                Caption = 'Armaz'#233'm'
              end
              object dbgrdTabela: TDBGrid
                Left = 5
                Top = 57
                Width = 710
                Height = 315
                DataSource = dsTabelas
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
                PopupMenu = pmAtivo
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
                    FieldName = 'CD_TABELA'
                    Title.Caption = 'C'#243'digo'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TX_DESCRICAO_TABELA'
                    Title.Caption = 'Identifica'#231#227'o da Tabela'
                    Width = 198
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CD_TABELA_ORIGEM'
                    Title.Caption = 'Tabela Padr'#227'o'
                    Width = 78
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DT_VALIDADE'
                    Title.Caption = 'Validade'
                    Width = 79
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'calcUsuario'
                    Title.Caption = 'Autorizada por:'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'calcAtivo'
                    Font.Charset = SYMBOL_CHARSET
                    Font.Color = clGreen
                    Font.Height = -13
                    Font.Name = 'Wingdings'
                    Font.Style = [fsBold]
                    Title.Caption = 'Ativo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'calcENT'
                    Font.Charset = SYMBOL_CHARSET
                    Font.Color = clGreen
                    Font.Height = -13
                    Font.Name = 'Wingdings'
                    Font.Style = [fsBold]
                    Title.Caption = 'Contar Entrada'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'calcSAIDA'
                    Font.Charset = SYMBOL_CHARSET
                    Font.Color = clGreen
                    Font.Height = -13
                    Font.Name = 'Wingdings'
                    Font.Style = [fsBold]
                    Title.Caption = 'Contar Sa'#237'da'
                    Visible = True
                  end>
              end
              object edtArmazem: TEdit
                Left = 15
                Top = 26
                Width = 101
                Height = 19
                BevelInner = bvLowered
                BevelKind = bkSoft
                BevelOuter = bvNone
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                OnChange = edtArmazemChange
              end
              object ed7: TEdit
                Left = 115
                Top = 26
                Width = 590
                Height = 19
                BevelInner = bvLowered
                BevelKind = bkSoft
                BevelOuter = bvNone
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = True
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object pnlDadosTabelas: TPanel
                Left = 141
                Top = 21
                Width = 441
                Height = 213
                BevelInner = bvLowered
                TabOrder = 3
                Visible = False
                object shp11: TShape
                  Left = 6
                  Top = 6
                  Width = 429
                  Height = 24
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object lbl17: TLabel
                  Left = 12
                  Top = 13
                  Width = 407
                  Height = 13
                  Caption = 
                    'Selecione a tabela do qual deseja configurar a espec'#237'fica deste ' +
                    'cliente'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object shp12: TShape
                  Left = 6
                  Top = 31
                  Width = 429
                  Height = 176
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object lbl18: TLabel
                  Left = 29
                  Top = 53
                  Width = 277
                  Height = 13
                  Caption = 'Tabela ( ser'#225' baseada em qual tabela padr'#227'o ? )'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnCoTabela: TSpeedButton
                  Left = 386
                  Top = 67
                  Width = 25
                  Height = 21
                  Flat = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
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
                  ParentFont = False
                  OnClick = btnCoTabelaClick
                end
                object lbl19: TLabel
                  Left = 29
                  Top = 101
                  Width = 151
                  Height = 13
                  Caption = 'Validade para esse cliente'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl20: TLabel
                  Left = 29
                  Top = 146
                  Width = 220
                  Height = 13
                  Caption = 'Descri'#231#227'o da Tabela para esse cliente'
                  FocusControl = dbedt_descricao_tabela
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edt_nm_tabela: TEdit
                  Tag = 666
                  Left = 79
                  Top = 67
                  Width = 306
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  Ctl3D = True
                  Enabled = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object edt_cd_tabela: TEdit
                  Tag = 666
                  Left = 30
                  Top = 67
                  Width = 50
                  Height = 21
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnChange = btnCoTabelaClick
                  OnExit = edt_cd_tabelaExit
                  OnKeyDown = dbedt_cd_grupoKeyDown
                end
                object medt_data_validade: TMaskEdit
                  Tag = 666
                  Left = 30
                  Top = 115
                  Width = 83
                  Height = 21
                  EditMask = '99/99/9999;1;_'
                  MaxLength = 10
                  TabOrder = 2
                  Text = '  /  /    '
                end
                object dbedt_descricao_tabela: TDBEdit
                  Tag = 666
                  Left = 30
                  Top = 160
                  Width = 382
                  Height = 21
                  DataField = 'TX_DESCRICAO_TABELA'
                  DataSource = dsTabelas
                  TabOrder = 3
                end
              end
              object pnlDadosTabela2: TPanel
                Left = 141
                Top = 234
                Width = 441
                Height = 86
                BevelInner = bvLowered
                TabOrder = 4
                Visible = False
                object Shape5: TShape
                  Left = 6
                  Top = 6
                  Width = 429
                  Height = 24
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object Label38: TLabel
                  Left = 12
                  Top = 13
                  Width = 243
                  Height = 13
                  Caption = 'Configura'#231#227'o do Per'#237'odo de Armazenagem'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Shape6: TShape
                  Left = 6
                  Top = 31
                  Width = 429
                  Height = 49
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object lblx: TLabel
                  Left = 411
                  Top = 11
                  Width = 19
                  Height = 16
                  Caption = '[x]'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                  OnClick = lblxClick
                end
                object btnPost2: TSpeedButton
                  Left = 393
                  Top = 37
                  Width = 36
                  Height = 38
                  Hint = 'Salvar'
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
                  Visible = False
                  OnClick = btnPost2Click
                end
                object dbchkDiaEnt: TDBCheckBox
                  Left = 13
                  Top = 37
                  Width = 193
                  Height = 17
                  Caption = 'Contar dia de Entrada '
                  DataField = 'IN_CONTAR_DIA_ENTRADA'
                  DataSource = dsTabelas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object dbchkDiaSaida: TDBCheckBox
                  Left = 13
                  Top = 56
                  Width = 193
                  Height = 17
                  Caption = 'Contar dia de Sa'#237'da'
                  DataField = 'IN_CONTAR_DIA_SAIDA'
                  DataSource = dsTabelas
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
            end
            object ts1: TTabSheet
              Caption = 'Listagem das Despesas'
              object lbl13: TLabel
                Left = 8
                Top = 62
                Width = 112
                Height = 13
                Caption = 'Listagem das Despesas'
              end
              object shp7: TShape
                Left = 8
                Top = 6
                Width = 709
                Height = 51
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object lbl14: TLabel
                Left = 19
                Top = 16
                Width = 43
                Height = 13
                Caption = 'Armaz'#233'm'
              end
              object dbgrdDespesa: TDBGrid
                Left = 8
                Top = 76
                Width = 710
                Height = 299
                DataSource = dsDespesas
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
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
                    FieldName = 'NM_ITEM'
                    Title.Caption = 'Item'
                    Width = 201
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TX_DESCRICAO_DESPESA'
                    Title.Caption = 'Descri'#231#227'o da Despesa'
                    Width = 262
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TX_VALOR_LIMITE'
                    Title.Caption = 'Valor Limite'
                    Width = 103
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TX_PERIODO'
                    Title.Caption = 'Per'#237'odo'
                    Width = 46
                    Visible = True
                  end>
              end
              object dbedtArmazemDespesas: TDBEdit
                Left = 18
                Top = 29
                Width = 100
                Height = 19
                BevelInner = bvLowered
                BevelOuter = bvNone
                BevelKind = bkSoft
                Ctl3D = False
                DataField = 'CD_ARMAZEM'
                DataSource = dsArmazensCliente
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                OnChange = dbedtArmazemDespesasChange
              end
              object ed5: TEdit
                Left = 118
                Top = 29
                Width = 590
                Height = 19
                BevelInner = bvLowered
                BevelKind = bkSoft
                BevelOuter = bvNone
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = True
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
            end
            object tsConfigValores: TTabSheet
              Caption = 'Configura'#231#227'o / Valores / Per'#237'odos'
              ImageIndex = 1
              object shp2: TShape
                Left = 8
                Top = 6
                Width = 709
                Height = 368
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object shp9: TShape
                Left = 397
                Top = 239
                Width = 312
                Height = 20
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object shp13: TShape
                Left = 632
                Top = 233
                Width = 77
                Height = 26
                Brush.Color = clBtnFace
                Pen.Color = clGray
              end
              object shp4: TShape
                Left = 16
                Top = 63
                Width = 693
                Height = 169
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object shp6: TShape
                Left = 223
                Top = 117
                Width = 156
                Height = 22
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object shp5: TShape
                Left = 33
                Top = 117
                Width = 155
                Height = 22
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object shp3: TShape
                Left = 16
                Top = 14
                Width = 693
                Height = 48
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object lbl4: TLabel
                Left = 26
                Top = 21
                Width = 20
                Height = 13
                Caption = 'Item'
                FocusControl = dbedtCdItem
                Transparent = True
              end
              object lbl6: TLabel
                Left = 223
                Top = 104
                Width = 75
                Height = 13
                Caption = 'Limitar por Valor'
                FocusControl = edt_valor_inicial
                Transparent = True
              end
              object lbl8: TLabel
                Left = 411
                Top = 105
                Width = 62
                Height = 13
                Caption = 'Qtde de Dias'
                FocusControl = dbedtQtdDias
                Transparent = True
              end
              object lbl10: TLabel
                Left = 224
                Top = 251
                Width = 67
                Height = 13
                Caption = 'Valor Principal'
                FocusControl = dbedtValorPrincipal
              end
              object lbl11: TLabel
                Left = 224
                Top = 291
                Width = 132
                Height = 13
                Caption = 'M'#237'nimo para Containers 20"'
                FocusControl = dbedtCntr20
              end
              object lbl12: TLabel
                Left = 224
                Top = 328
                Width = 132
                Height = 13
                Caption = 'M'#237'nimo para Containers 40"'
                FocusControl = dbedtCntr40
              end
              object lbl3: TLabel
                Left = 33
                Top = 69
                Width = 108
                Height = 13
                Caption = 'Descri'#231#227'o da Despesa'
                FocusControl = dbedtDescDesp
                Transparent = True
              end
              object lbl5: TLabel
                Left = 33
                Top = 104
                Width = 38
                Height = 13
                Caption = 'Per'#237'odo'
                FocusControl = edt_periodo
                Transparent = True
              end
              object btnCoItem: TSpeedButton
                Left = 675
                Top = 33
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
                OnClick = btnCoItemClick
              end
              object img2: TImage
                Left = 380
                Top = 117
                Width = 19
                Height = 20
                Hint = 
                  'Nesse campo voc'#234' limita per'#237'odos pelo valor do CIF.'#13#10'Se quiser p' +
                  'or exemplo, limitar para CIF entre'#13#10'0 e 5000, preencha o primeir' +
                  'o campo com " 0 " e o '#13#10'segundo com " 5000 ".'#13#10'Se quiser limitar' +
                  ' um segundo per'#237'odo para maior'#13#10'de 5000, coloque " 5000 " e " ..' +
                  '. ".'#13#10'Se n'#227'o desejar limitar, deixe os dois campos em branco.'
                Center = True
                ParentShowHint = False
                Picture.Data = {
                  07544269746D6170F6000000424DF60000000000000076000000280000000F00
                  000010000000010004000000000080000000C40E0000C40E0000100000000000
                  0000000000000000800000800000008080008000000080008000808000007F7F
                  7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
                  0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
                  0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
                  F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
                  3330}
                ShowHint = True
                Transparent = True
              end
              object img1: TImage
                Left = 190
                Top = 117
                Width = 19
                Height = 20
                Hint = 
                  'Nesse campo '#233' colocado o per'#237'odo para esses valores. '#13#10'Caso voc'#234 +
                  ' queira colocar esses valor para o per'#237'odo 1, 2 ou 3 em diante, ' +
                  #13#10'basta clicar em " em diante ".'#13#10
                Center = True
                ParentShowHint = False
                Picture.Data = {
                  07544269746D6170F6000000424DF60000000000000076000000280000000F00
                  000010000000010004000000000080000000C40E0000C40E0000100000000000
                  0000000000000000800000800000008080008000000080008000808000007F7F
                  7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF0033333CCCCC333330CCCCCC808CCCCCC000888807088880000F0770F7F077
                  0F0070FFFFF7FFFFF07070FFFB99FBFFF07030FFBF99BFBFF030370BFBF7FBFB
                  0730370FBF98BFBF07303B0BFB990BFB03303FB000B99000B3303BFBFBFB99FB
                  F3303FBF99BF99BFB33033FB99FB99FB3330333FB9999FB333303333FBFBFB33
                  3330}
                ShowHint = True
                Transparent = True
              end
              object lbl7: TLabel
                Left = 292
                Top = 122
                Width = 15
                Height = 13
                Caption = 'at'#233
                FocusControl = edt_valor_inicial
                Transparent = True
              end
              object lbl15: TLabel
                Left = 401
                Top = 243
                Width = 131
                Height = 13
                Caption = 'Servi'#231'os para esta despesa'
              end
              object btnExcluirServico: TSpeedButton
                Left = 684
                Top = 236
                Width = 22
                Height = 21
                Hint = 'Excluir Servi'#231'o'
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
                Layout = blGlyphBottom
                Margin = 1
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = btnExcluirServicoClick
              end
              object btnImportarServicos: TSpeedButton
                Left = 660
                Top = 236
                Width = 22
                Height = 21
                Hint = 'Importar Servi'#231'os'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
                  FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
                  00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
                  F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
                  00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
                  F033777777777337F73309999990FFF0033377777777FFF77333099999000000
                  3333777777777777333333399033333333333337773333333333333903333333
                  3333333773333333333333303333333333333337333333333333}
                Layout = blGlyphBottom
                Margin = 1
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = btnImportarServicosClick
              end
              object btnExportarServicos: TSpeedButton
                Left = 636
                Top = 236
                Width = 22
                Height = 21
                Hint = 'Exportar Servi'#231'os'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000130B0000130B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
                  333333333333337FF3333333333333903333333333333377FF33333333333399
                  03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
                  99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
                  99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
                  03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
                  33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
                  33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
                  3333777777333333333333333333333333333333333333333333}
                Layout = blGlyphBottom
                Margin = 1
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = btnExportarServicosClick
              end
              object edt_valor_inicial: TEdit
                Left = 223
                Top = 117
                Width = 59
                Height = 21
                TabOrder = 4
                OnChange = edt_periodoChange
                OnEnter = edt_periodoEnter
                OnExit = edt_valor_inicialExit
              end
              object dbedtQtdDias: TDBEdit
                Tag = 666
                Left = 411
                Top = 118
                Width = 105
                Height = 21
                DataField = 'QT_DIAS'
                DataSource = dsDespesas
                TabOrder = 6
                OnChange = dbedtDescDespChange
              end
              object dbedtValorPrincipal: TDBEdit
                Tag = 666
                Left = 224
                Top = 264
                Width = 134
                Height = 21
                DataField = 'VL_PRINCIPAL'
                DataSource = dsDespesas
                TabOrder = 11
                OnChange = dbedtDescDespChange
              end
              object dbedtCntr20: TDBEdit
                Tag = 666
                Left = 224
                Top = 304
                Width = 134
                Height = 21
                DataField = 'VL_MINIMO_20'
                DataSource = dsDespesas
                TabOrder = 12
                OnChange = dbedtDescDespChange
              end
              object dbedtCntr40: TDBEdit
                Tag = 666
                Left = 224
                Top = 341
                Width = 134
                Height = 21
                DataField = 'VL_MINIMO_40'
                DataSource = dsDespesas
                TabOrder = 13
                OnChange = dbedtDescDespChange
              end
              object dbedtDescDesp: TDBEdit
                Tag = 666
                Left = 32
                Top = 82
                Width = 662
                Height = 22
                AutoSize = False
                BevelInner = bvLowered
                BevelOuter = bvNone
                BevelKind = bkFlat
                Color = clWhite
                Ctl3D = False
                DataField = 'TX_DESCRICAO_DESPESA'
                DataSource = dsDespesas
                ParentCtl3D = False
                TabOrder = 1
                OnChange = dbedtDescDespChange
              end
              object edt_periodo: TEdit
                Tag = 666
                Left = 33
                Top = 117
                Width = 56
                Height = 21
                TabOrder = 2
                OnChange = edt_periodoChange
                OnEnter = edt_periodoEnter
                OnExit = edt_periodoExit
              end
              object edtNmItem: TEdit
                Tag = 666
                Left = 68
                Top = 34
                Width = 606
                Height = 21
                TabStop = False
                Enabled = False
                ParentColor = True
                ReadOnly = True
                TabOrder = 15
              end
              object dbedtCdItem: TDBEdit
                Tag = 666
                Left = 26
                Top = 34
                Width = 43
                Height = 21
                DataField = 'CD_ITEM'
                DataSource = dsDespesas
                TabOrder = 0
                OnChange = btnCoItemClick
                OnExit = dbedtCdItemExit
                OnKeyDown = dbedt_cd_grupoKeyDown
              end
              object dbrgrpTpCalculo: TDBRadioGroup
                Left = 25
                Top = 259
                Width = 176
                Height = 56
                Caption = 'Tipo de Calculo'
                Columns = 2
                DataField = 'TX_TIPO_CALCULO'
                DataSource = dsDespesas
                Items.Strings = (
                  '% CIF'
                  'FIXO')
                TabOrder = 10
                Values.Strings = (
                  '%CIF'
                  'FIXO')
                OnChange = dbedtDescDespChange
              end
              object chk_emdiante: TCheckBox
                Left = 106
                Top = 120
                Width = 69
                Height = 17
                Caption = 'em diante'
                TabOrder = 3
                OnClick = edt_periodoChange
              end
              object edt_valor_final: TEdit
                Left = 317
                Top = 117
                Width = 59
                Height = 21
                TabOrder = 5
                OnChange = edt_periodoChange
                OnEnter = edt_periodoEnter
                OnExit = edt_valor_finalExit
              end
              object dbgrdServicos: TDBGrid
                Left = 397
                Top = 259
                Width = 313
                Height = 108
                DataSource = dsDespesasServico
                Enabled = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 14
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = dbgrdServicosDblClick
                OnEnter = dbgrdServicosEnter
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'CD_SERVICO'
                    Title.Caption = 'C'#243'digo'
                    Width = 51
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'calcServico'
                    Title.Caption = 'Servi'#231'o'
                    Width = 223
                    Visible = True
                  end>
              end
              object dbrgrpCalcular: TDBRadioGroup
                Left = 33
                Top = 152
                Width = 113
                Height = 68
                Caption = 'Calcular'
                DataField = 'IN_POR_DIA'
                DataSource = dsDespesas
                Items.Strings = (
                  'Por Per'#237'odo'
                  'Por Registro')
                TabOrder = 7
                Values.Strings = (
                  '0'
                  '1')
                OnChange = dbrgrpCalcularChange
              end
              object dbrgrpDespesa: TDBRadioGroup
                Left = 154
                Top = 152
                Width = 113
                Height = 68
                Caption = 'Despesa para'
                DataField = 'TP_REGISTRO'
                DataSource = dsDespesas
                Items.Strings = (
                  'Cont'#226'iner'
                  'Carga Solta')
                TabOrder = 8
                Values.Strings = (
                  'CO'
                  'CS')
                OnChange = dbedtDescDespChange
              end
              object pnlImportarServicos: TPanel
                Left = 444
                Top = 270
                Width = 223
                Height = 89
                BevelOuter = bvNone
                BorderWidth = 2
                Color = clBlack
                TabOrder = 16
                Visible = False
                object pnl1: TPanel
                  Left = 2
                  Top = 2
                  Width = 219
                  Height = 85
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  object btnImportar: TSpeedButton
                    Left = 146
                    Top = 55
                    Width = 65
                    Height = 23
                    Caption = 'Importar'
                    OnClick = btnImportarClick
                  end
                  object lbl21: TLabel
                    Left = 7
                    Top = 9
                    Width = 204
                    Height = 13
                    Caption = 'De que despesa quer importar os servi'#231'os?'
                    FocusControl = edtDespesaImportar
                    Transparent = True
                  end
                  object btnCoTabelas: TSpeedButton
                    Left = 186
                    Top = 24
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
                    OnClick = btnCoTabelasClick
                  end
                  object btnCancelarImportacao: TSpeedButton
                    Left = 80
                    Top = 55
                    Width = 65
                    Height = 23
                    Caption = 'Cancelar'
                    OnClick = btnCancelarImportacaoClick
                  end
                  object edt1: TEdit
                    Tag = 666
                    Left = 50
                    Top = 24
                    Width = 135
                    Height = 21
                    TabStop = False
                    Enabled = False
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 1
                  end
                  object edtDespesaImportar: TEdit
                    Tag = 666
                    Left = 8
                    Top = 24
                    Width = 43
                    Height = 21
                    TabOrder = 0
                    OnChange = btnCoTabelasClick
                  end
                end
              end
              object dbrgrpTpTamanho: TDBRadioGroup
                Left = 276
                Top = 152
                Width = 157
                Height = 68
                Caption = 'Tamanho CNTR'
                Columns = 2
                DataField = 'TP_TAMANHO'
                DataSource = dsDespesas
                Items.Strings = (
                  'Cntr 20'#39
                  'Cntr 40'#39
                  'Ambos')
                TabOrder = 9
                Values.Strings = (
                  '2'
                  '4'
                  'A')
              end
              object dbrgrpMargem: TDBRadioGroup
                Left = 442
                Top = 152
                Width = 222
                Height = 68
                Caption = 'Margem'
                Columns = 2
                DataField = 'IN_MARGEM'
                DataSource = dsDespesas
                Items.Strings = (
                  'Mesma margem'
                  'Entre margens'
                  'Indiferente')
                TabOrder = 17
                Values.Strings = (
                  'M'
                  'E'
                  'I')
              end
            end
            object tsDistancia: TTabSheet
              Caption = 'Dist'#226'ncia/Tempo'
              ImageIndex = 3
              object Label41: TLabel
                Left = 16
                Top = 16
                Width = 82
                Height = 13
                Caption = 'Dist'#226'ncia (km)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label43: TLabel
                Left = 16
                Top = 61
                Width = 82
                Height = 13
                Caption = 'Tempo (horas)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_distancia: TDBEdit
                Left = 16
                Top = 30
                Width = 121
                Height = 19
                Ctl3D = False
                DataField = 'NM_DISTANCIA'
                DataSource = dsArmazemClienteDistancia
                ParentCtl3D = False
                TabOrder = 0
                OnChange = dbedt_distanciaChange
              end
              object dbedt_tempo: TDBEdit
                Left = 16
                Top = 75
                Width = 121
                Height = 19
                Ctl3D = False
                DataField = 'NM_TEMPO'
                DataSource = dsArmazemClienteDistancia
                ParentCtl3D = False
                TabOrder = 1
                OnChange = dbedt_tempoChange
              end
            end
          end
        end
      end
    end
    object ts_despachante: TTabSheet
      Caption = 'Despachantes Respons'#225'veis'
      ImageIndex = 5
      object DBGrid1: TDBGrid
        Left = 88
        Top = 17
        Width = 559
        Height = 354
        DataSource = datm_cliente.ds_despachante_cliente
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            DropDownRows = 15
            Expanded = False
            FieldName = 'NM_DESPACHANTE'
            Title.Caption = 'Despachante'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 409
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIPO'
            PickList.Strings = (
              'DDE'
              'RE'
              'DI')
            Title.Alignment = taCenter
            Title.Caption = 'Tipo de Acesso'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 115
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 88
        Top = 372
        Width = 396
        Height = 33
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
        Hints.Strings = (
          'Primeiro registro'
          'anterior registro'
          'proximo registro'
          #250'ltimo registro'
          'Adiciona registro'
          'Exclui registro'
          'Salva'
          'Cancela'
          'Refresh')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 488
        Top = 372
        Width = 75
        Height = 33
        Cursor = crHandPoint
        Caption = 'Salva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 569
        Top = 372
        Width = 75
        Height = 33
        Cursor = crHandPoint
        Caption = 'Cancela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
    object tbs_ParametrosDi: TTabSheet
      Caption = 'DI - Parametros'
      ImageIndex = 6
      object Label68: TLabel
        Left = 8
        Top = 8
        Width = 105
        Height = 13
        Caption = 'C'#225'lculo do Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label82: TLabel
        Left = 61
        Top = 76
        Width = 10
        Height = 13
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit15: TDBEdit
        Left = 8
        Top = 71
        Width = 47
        Height = 21
        DataField = 'PC_SEGURO_MLE_DI'
        DataSource = datm_cliente.ds_empresa_nac
        TabOrder = 0
        OnChange = dbedt_nm_empresaChange
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 7
        Top = 24
        Width = 381
        Height = 41
        Caption = 'Base'
        Columns = 3
        DataField = 'CD_TIPO_BASE_SEGURO_DI'
        DataSource = datm_cliente.ds_empresa_nac
        Items.Strings = (
          'VMLE'
          'VMLE + Frete'
          'VMLE + Frete + L.E')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2'
          '4')
        OnChange = dbedt_nm_empresaChange
      end
    end
    object tbsDadosExtras: TTabSheet
      Caption = 'Extras'
      ImageIndex = 7
      object Label55: TLabel
        Left = 4
        Top = 7
        Width = 204
        Height = 13
        Caption = 'Dados Banc'#225'rios - Fatura Comercial'
        FocusControl = DBMemo2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo2: TDBMemo
        Left = 4
        Top = 20
        Width = 329
        Height = 117
        DataField = 'TX_DADOS_BANCARIOS_FATCOM'
        DataSource = datm_cliente.ds_empresa_nac
        TabOrder = 0
        OnChange = dbedt_nm_empresaChange
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object pnl_pesquisa: TPanel
      Left = 447
      Top = 2
      Width = 301
      Height = 44
      Align = alRight
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object lbl_pesquisa: TLabel
        Left = 7
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
      object lbl_ordem_pesquisa: TLabel
        Left = 143
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
        Width = 143
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
    object pnl_cadastro: TPanel
      Left = 2
      Top = 2
      Width = 445
      Height = 44
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        445
        44)
      object btn_incluir: TSpeedButton
        Left = 4
        Top = 3
        Width = 36
        Height = 38
        Hint = 'Incluir'
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
        Left = 112
        Top = 3
        Width = 36
        Height = 38
        Hint = 'Excluir'
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
        Left = 404
        Top = 3
        Width = 36
        Height = 38
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
        Left = 40
        Top = 3
        Width = 36
        Height = 38
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
        Left = 76
        Top = 3
        Width = 36
        Height = 38
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
      object Shape1: TShape
        Left = 281
        Top = 8
        Width = 107
        Height = 27
        Anchors = [akTop, akRight]
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object dbnvg: TDBNavigator
        Left = 283
        Top = 10
        Width = 104
        Height = 24
        DataSource = datm_cliente.ds_empresa_nac
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Anchors = [akTop, akRight]
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
    end
  end
  object menu_cadastro: TMainMenu
    Left = 684
    Top = 100
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
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
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object updDespesas: TUpdateSQL
    ModifySQL.Strings = (
      'update TARMAZEM_DESPESAS_CLIENTE'
      'set'
      '  CD_ARMAZEM = :CD_ARMAZEM,'
      '  CD_ITEM = :CD_ITEM,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_DESPESA = :CD_DESPESA,'
      '  TX_DESCRICAO_DESPESA = :TX_DESCRICAO_DESPESA,'
      '  TX_VALOR_LIMITE = :TX_VALOR_LIMITE,'
      '  CD_MARGEM = :CD_MARGEM,'
      '  TX_PERIODO = :TX_PERIODO,'
      '  QT_DIAS = :QT_DIAS,'
      '  TX_TIPO_CALCULO = :TX_TIPO_CALCULO,'
      '  VL_PRINCIPAL = :VL_PRINCIPAL,'
      '  VL_MINIMO_20 = :VL_MINIMO_20,'
      '  VL_MINIMO_40 = :VL_MINIMO_40,'
      '  VL_DESP_CIF = :VL_DESP_CIF,'
      '  VL_DESP_VALOR = :VL_DESP_VALOR,'
      '  CD_TABELA = :CD_TABELA,'
      '  TP_REGISTRO = :TP_REGISTRO,'
      '  IN_POR_DIA = :IN_POR_DIA,'
      '  TP_TAMANHO = :TP_TAMANHO,'
      '  IN_MARGEM = :IN_MARGEM'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_DESPESA = :OLD_CD_DESPESA and'
      '  CD_TABELA = :OLD_CD_TABELA')
    InsertSQL.Strings = (
      'insert into TARMAZEM_DESPESAS_CLIENTE'
      
        '  (CD_ARMAZEM, CD_ITEM, CD_CLIENTE, CD_DESPESA, TX_DESCRICAO_DES' +
        'PESA, TX_VALOR_LIMITE, '
      
        '   CD_MARGEM, TX_PERIODO, QT_DIAS, TX_TIPO_CALCULO, VL_PRINCIPAL' +
        ', VL_MINIMO_20, '
      
        '   VL_MINIMO_40, VL_DESP_CIF, VL_DESP_VALOR, CD_TABELA, TP_REGIS' +
        'TRO, IN_POR_DIA, '
      '   TP_TAMANHO, IN_MARGEM)'
      'values'
      
        '  (:CD_ARMAZEM, :CD_ITEM, :CD_CLIENTE, :CD_DESPESA, :TX_DESCRICA' +
        'O_DESPESA, '
      
        '   :TX_VALOR_LIMITE, :CD_MARGEM, :TX_PERIODO, :QT_DIAS, :TX_TIPO' +
        '_CALCULO, '
      
        '   :VL_PRINCIPAL, :VL_MINIMO_20, :VL_MINIMO_40, :VL_DESP_CIF, :V' +
        'L_DESP_VALOR, '
      
        '   :CD_TABELA, :TP_REGISTRO, :IN_POR_DIA, :TP_TAMANHO, :IN_MARGE' +
        'M)')
    DeleteSQL.Strings = (
      'delete from TARMAZEM_DESPESAS_CLIENTE'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_DESPESA = :OLD_CD_DESPESA and'
      '  CD_TABELA = :OLD_CD_TABELA')
    Left = 200
    Top = 511
  end
  object qryDespesas: TQuery
    CachedUpdates = True
    AfterPost = qryDespesasAfterPost
    AfterDelete = qryDespesasAfterDelete
    AfterScroll = qryDespesasAfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = dsTabelas
    SQL.Strings = (
      'SELECT     *'
      'FROM                      TARMAZEM_DESPESAS_CLIENTE ADC (NOLOCK)'
      
        ' INNER JOIN           TITEM                                     ' +
        '       IT     (NOLOCK) ON ADC.CD_ITEM      = IT.CD_ITEM'
      
        ' LEFT OUTER JOIN  TMARGEM                                     MA' +
        '   (NOLOCK) ON ADC.CD_MARGEM = MA.CD_MARGEM'
      'WHERE    (ADC.CD_ARMAZEM = :CD_ARMAZEM)'
      '      AND   (ADC.CD_CLIENTE = :CD_CLIENTE)'
      '      AND   (ADC.CD_TABELA = :CD_TABELA)'
      '')
    UpdateObject = updDespesas
    Left = 200
    Top = 517
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftInteger
        Name = 'CD_TABELA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryDespesasCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryDespesasCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryDespesasCD_CLIENTE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryDespesasCD_DESPESA: TIntegerField
      FieldName = 'CD_DESPESA'
    end
    object qryDespesasTX_DESCRICAO_DESPESA: TStringField
      FieldName = 'TX_DESCRICAO_DESPESA'
      FixedChar = True
      Size = 200
    end
    object qryDespesasTX_VALOR_LIMITE: TStringField
      FieldName = 'TX_VALOR_LIMITE'
      FixedChar = True
    end
    object qryDespesasCD_MARGEM: TStringField
      FieldName = 'CD_MARGEM'
      FixedChar = True
      Size = 1
    end
    object qryDespesasTX_PERIODO: TStringField
      FieldName = 'TX_PERIODO'
      FixedChar = True
      Size = 10
    end
    object qryDespesasQT_DIAS: TIntegerField
      FieldName = 'QT_DIAS'
    end
    object qryDespesasTX_TIPO_CALCULO: TStringField
      FieldName = 'TX_TIPO_CALCULO'
      FixedChar = True
      Size = 10
    end
    object qryDespesasVL_PRINCIPAL: TFloatField
      FieldName = 'VL_PRINCIPAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryDespesasVL_MINIMO_20: TFloatField
      FieldName = 'VL_MINIMO_20'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryDespesasVL_MINIMO_40: TFloatField
      FieldName = 'VL_MINIMO_40'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryDespesasVL_DESP_CIF: TStringField
      FieldName = 'VL_DESP_CIF'
      FixedChar = True
      Size = 50
    end
    object qryDespesasVL_DESP_VALOR: TStringField
      FieldName = 'VL_DESP_VALOR'
      FixedChar = True
      Size = 50
    end
    object qryDespesasCD_TABELA: TIntegerField
      FieldName = 'CD_TABELA'
    end
    object qryDespesasIN_POR_DIA: TStringField
      FieldName = 'IN_POR_DIA'
      FixedChar = True
      Size = 1
    end
    object qryDespesasTP_REGISTRO: TStringField
      FieldName = 'TP_REGISTRO'
      FixedChar = True
      Size = 2
    end
    object qryDespesasNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qryDespesasTP_TAMANHO: TStringField
      FieldName = 'TP_TAMANHO'
      FixedChar = True
      Size = 1
    end
    object qryDespesasIN_MARGEM: TStringField
      FieldName = 'IN_MARGEM'
      FixedChar = True
      Size = 1
    end
  end
  object dsDespesas: TDataSource
    DataSet = qryDespesas
    OnStateChange = dsDespesasStateChange
    OnDataChange = dsDespesasDataChange
    Left = 193
    Top = 513
  end
  object dsArmazensCliente: TDataSource
    DataSet = qryArmazensCliente
    OnStateChange = dsDespesasStateChange
    OnDataChange = dsArmazensClienteDataChange
    Left = 370
    Top = 513
  end
  object qryArmazensCliente: TQuery
    OnCalcFields = qryArmazensClienteCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = datm_cliente.ds_empresa_nac
    RequestLive = True
    SQL.Strings = (
      'SELECT     *'
      'FROM         TCLIENTE_ARMAZEM (NOLOCK)'
      'WHERE     (CD_CLIENTE = :CD_EMPRESA)')
    Left = 368
    Top = 516
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
        Size = 6
      end>
    object qryArmazensClienteCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TCLIENTE_ARMAZEM.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryArmazensClienteCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'DBBROKER.TCLIENTE_ARMAZEM.CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryArmazensClientecalcArmazem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcArmazem'
      Size = 100
      Calculated = True
    end
  end
  object qryTabelas: TQuery
    OnCalcFields = qryTabelasCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = dsArmazensCliente
    RequestLive = True
    SQL.Strings = (
      'SELECT     *'
      'FROM         TARMAZEM_TABELAS_CLIENTE (NOLOCK)'
      'WHERE     (CD_ARMAZEM = :CD_ARMAZEM)'
      '      AND     (CD_CLIENTE = :CD_CLIENTE)')
    Left = 472
    Top = 526
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
        Size = 6
      end>
    object qryTabelasCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryTabelasCD_TABELA: TIntegerField
      FieldName = 'CD_TABELA'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.CD_TABELA'
    end
    object qryTabelasDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.DT_VALIDADE'
    end
    object qryTabelasTX_DESCRICAO_TABELA: TStringField
      FieldName = 'TX_DESCRICAO_TABELA'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_BASICAS.TX_DESCRICAO_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryTabelasCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_CLIENTE.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryTabelasCD_TABELA_ORIGEM: TIntegerField
      FieldName = 'CD_TABELA_ORIGEM'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_CLIENTE.CD_TABELA_ORIGEM'
    end
    object qryTabelasIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_CLIENTE.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryTabelascalcAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAtivo'
      Size = 1
      Calculated = True
    end
    object qryTabelasCD_USUARIO_ATIVACAO: TStringField
      FieldName = 'CD_USUARIO_ATIVACAO'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_CLIENTE.CD_USUARIO_ATIVACAO'
      FixedChar = True
      Size = 4
    end
    object qryTabelascalcUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUsuario'
      Size = 100
      Calculated = True
    end
    object qryTabelasIN_CONTAR_DIA_ENTRADA: TStringField
      FieldName = 'IN_CONTAR_DIA_ENTRADA'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_CLIENTE.IN_CONTAR_DIA_ENTRADA'
      FixedChar = True
      Size = 1
    end
    object qryTabelasIN_CONTAR_DIA_SAIDA: TStringField
      FieldName = 'IN_CONTAR_DIA_SAIDA'
      Origin = 'DBBROKER.TARMAZEM_TABELAS_CLIENTE.IN_CONTAR_DIA_SAIDA'
      FixedChar = True
      Size = 1
    end
    object qryTabelascalcENT: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcENT'
      Size = 3
      Calculated = True
    end
    object qryTabelascalcSAIDA: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSAIDA'
      Size = 3
      Calculated = True
    end
  end
  object dsTabelas: TDataSource
    DataSet = qryTabelas
    OnStateChange = dsDespesasStateChange
    OnDataChange = dsTabelasDataChange
    Left = 479
    Top = 532
  end
  object pmAtivo: TPopupMenu
    Left = 675
    Top = 101
    object mi_ativar: TMenuItem
      Caption = 'Ativar esta tabela'
      OnClick = mi_ativarClick
    end
    object mniDesativarestatabela1: TMenuItem
      Caption = 'Desativar esta tabela'
      OnClick = mniDesativarestatabela1Click
    end
    object editarperodo1: TMenuItem
      Caption = 'Editar Config. do Per'#237'odo'
      OnClick = editarperodo1Click
    end
  end
  object dsDespesasServico: TDataSource
    DataSet = qryDespesasServicos
    OnDataChange = dsDespesasServicoDataChange
    Left = 76
    Top = 521
  end
  object qryDespesasServicos: TQuery
    BeforePost = qryDespesasServicosBeforePost
    AfterPost = qryDespesasServicosAfterPost
    OnCalcFields = qryDespesasServicosCalcFields
    OnPostError = qryDespesasServicosPostError
    DatabaseName = 'DBBROKER'
    DataSource = dsDespesas
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TARMAZEM_DESPESAS_CLIENTE_SERVICO  (NOLOCK)'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_ARMAZEM     = :CD_ARMAZEM AND'
      '       CD_TABELA         = :CD_TABELA  AND'
      '       CD_ITEM             = :CD_ITEM    AND'
      '       CD_DESPESA      = :CD_DESPESA')
    Left = 79
    Top = 525
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
        Size = 5
      end
      item
        DataType = ftInteger
        Name = 'CD_TABELA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ITEM'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_DESPESA'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryDespesasServicosCD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'DBBROKER.TARMAZEM_DESPESAS_CLIENTE_SERVICO.CD_ARMAZEM'
      FixedChar = True
      Size = 4
    end
    object qryDespesasServicosCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TARMAZEM_DESPESAS_CLIENTE_SERVICO.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryDespesasServicosCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TARMAZEM_DESPESAS_CLIENTE_SERVICO.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryDespesasServicosCD_DESPESA: TIntegerField
      FieldName = 'CD_DESPESA'
      Origin = 'DBBROKER.TARMAZEM_DESPESAS_CLIENTE_SERVICO.CD_DESPESA'
    end
    object qryDespesasServicosCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TARMAZEM_DESPESAS_CLIENTE_SERVICO.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qryDespesasServicosCD_TABELA: TIntegerField
      FieldName = 'CD_TABELA'
      Origin = 'DBBROKER.TARMAZEM_DESPESAS_CLIENTE_SERVICO.CD_TABELA'
    end
    object qryDespesasServicoscalcServico: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcServico'
      Size = 100
      Calculated = True
    end
  end
  object updDespesasServicos: TUpdateSQL
    ModifySQL.Strings = (
      'update TARMAZEM_DESPESAS_CLIENTE_SERVICO'
      'set'
      '  CD_ARMAZEM = :CD_ARMAZEM,'
      '  CD_ITEM = :CD_ITEM,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_DESPESA = :CD_DESPESA,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_TABELA = :CD_TABELA'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_DESPESA = :OLD_CD_DESPESA and'
      '  CD_TABELA = :OLD_CD_TABELA')
    InsertSQL.Strings = (
      'insert into TARMAZEM_DESPESAS_CLIENTE_SERVICO'
      '  (CD_ARMAZEM, CD_ITEM, CD_CLIENTE, CD_DESPESA, CD_SERVICO, '
      'CD_TABELA)'
      'values'
      
        '  (:CD_ARMAZEM, :CD_ITEM, :CD_CLIENTE, :CD_DESPESA, :CD_SERVICO,' +
        ' '
      ':CD_TABELA)')
    DeleteSQL.Strings = (
      'delete from TARMAZEM_DESPESAS_CLIENTE_SERVICO'
      'where'
      '  CD_ARMAZEM = :OLD_CD_ARMAZEM and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_DESPESA = :OLD_CD_DESPESA and'
      '  CD_TABELA = :OLD_CD_TABELA')
    Left = 81
    Top = 516
  end
  object dsArmazemClienteDistancia: TDataSource
    DataSet = qryArmazemClienteDistancia
    OnStateChange = dsDespesasStateChange
    Left = 577
    Top = 540
  end
  object qryArmazemClienteDistancia: TQuery
    OnCalcFields = qryTabelasCalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT     *'
      'FROM         TEMPRESA_ARMAZEM_DISTANCIA (NOLOCK)'
      'WHERE     (CD_TERMINAL = :CD_TERMINAL)'
      '      AND     (CD_EMPRESA = :CD_EMPRESA)')
    Left = 563
    Top = 532
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TERMINAL'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
        Size = 5
      end>
    object qryArmazemClienteDistanciaNM_DISTANCIA: TStringField
      FieldName = 'NM_DISTANCIA'
      Origin = 'DBBROKER.TEMPRESA_ARMAZEM_DISTANCIA.NM_DISTANCIA'
      FixedChar = True
      Size = 50
    end
    object qryArmazemClienteDistanciaNM_TEMPO: TStringField
      FieldName = 'NM_TEMPO'
      Origin = 'DBBROKER.TEMPRESA_ARMAZEM_DISTANCIA.NM_TEMPO'
      FixedChar = True
      Size = 50
    end
  end
end

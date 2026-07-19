object frm_relatorios_mail_aut: Tfrm_relatorios_mail_aut
  Left = 315
  Top = 170
  Width = 756
  Height = 688
  Caption = 'Cadastro de Documentos ( email autom'#225'tico )'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = menu_manut_cadastro
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_documento: TPageControl
    Left = 0
    Top = 57
    Width = 740
    Height = 573
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_documentoChange
    OnChanging = pgctrl_documentoChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 62
        Width = 732
        Height = 483
        Align = alClient
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Color = 15466470
            Expanded = False
            FieldName = 'CD_RELATORIO'
            Title.Caption = 'C'#243'digo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_RELATORIO'
            Title.Caption = 'Nome'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 526
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EVENTO'
            Title.Caption = 'Evento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 47
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calc_ATIVO'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -19
            Font.Name = 'Wingdings'
            Font.Style = []
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end>
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 62
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 12
          Top = 4
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
        object Label114: TLabel
          Left = 14
          Top = 20
          Width = 44
          Height = 13
          Caption = 'Codigo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label147: TLabel
          Left = 94
          Top = 20
          Width = 58
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_chave: TEdit
          Left = 13
          Top = 36
          Width = 72
          Height = 21
          TabOrder = 0
          OnChange = edt_chaveChange
        end
        object edtDescricao: TEdit
          Left = 93
          Top = 36
          Width = 376
          Height = 21
          TabOrder = 1
        end
        object btnPesquisar: TBitBtn
          Left = 482
          Top = 31
          Width = 90
          Height = 25
          Caption = 'Buscar'
          TabOrder = 2
          OnClick = btnPesquisarClick
          Glyph.Data = {
            52020000424D5202000000000000520100002800000010000000100000000100
            08000000000000010000340B0000340B00004700000047000000405058009860
            580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
            7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
            8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
            8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
            9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
            AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
            CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
            E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
            F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
            4242424242422B39180B42424242424242424242424243443C180B4242424242
            42424242424242444438180B424242424242424242424242444339180A424242
            424242424242424242444335004201101A114242424242424242453D05072F34
            3434291942424242424242221A2D34343437403E0442424242424206231C3034
            37404146284242424242421B210F30373A414140310D42424242421F20032434
            373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
            2430333429424242424242421E463F0F0316252E08424242424242424227312D
            21252314424242424242424242420E141B1B42424242}
        end
        object chk_ativo_disparo: TCheckBox
          Left = 356
          Top = 17
          Width = 114
          Height = 17
          Caption = 'Somente Ativos'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 3
          OnClick = chk_ativo_disparoClick
        end
      end
    end
    object ts_dados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      DesignSize = (
        732
        545)
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 732
        Height = 545
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label5: TLabel
        Left = 72
        Top = 10
        Width = 185
        Height = 13
        AutoSize = False
        Caption = 'Documento ( Assunto do Email )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 302
        Top = 10
        Width = 86
        Height = 13
        AutoSize = False
        Caption = 'Modelo ( .doc )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label3: TLabel
        Left = 16
        Top = 46
        Width = 211
        Height = 13
        AutoSize = False
        Caption = 'Descri'#231#227'o do Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 10
        Width = 47
        Height = 13
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 106
        Width = 105
        Height = 13
        AutoSize = False
        Caption = 'Tipo do Relat'#243'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape1: TShape
        Left = 16
        Top = 257
        Width = 705
        Height = 284
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object SpeedButton2: TSpeedButton
        Left = 307
        Top = 118
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
      object Shape3: TShape
        Left = 554
        Top = 21
        Width = 58
        Height = 26
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 554
        Top = 5
        Width = 58
        Height = 17
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label13: TLabel
        Left = 563
        Top = 7
        Width = 37
        Height = 13
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Shape5: TShape
        Left = 624
        Top = 5
        Width = 88
        Height = 42
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lblSql: TLabel
        Left = 313
        Top = 60
        Width = 28
        Height = 13
        AutoSize = False
        Caption = 'SQL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label149: TLabel
        Left = 16
        Top = 145
        Width = 211
        Height = 13
        AutoSize = False
        Caption = 'Corpo do Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object nb_config: TNotebook
        Left = 19
        Top = 260
        Width = 699
        Height = 275
        Anchors = [akLeft, akTop, akRight, akBottom]
        PageIndex = 1
        TabOrder = 8
        OnPageChanged = nb_configPageChanged
        object TPage
          Left = 0
          Top = 0
          object Label14: TLabel
            Left = 144
            Top = 81
            Width = 418
            Height = 13
            Alignment = taCenter
            Caption = 
              'escolha o tipo do relat'#243'rio desejado para que apare'#231'am as config' +
              'ura'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '001'
          object SpeedButton1: TSpeedButton
            Left = 658
            Top = 26
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
          object Label12: TLabel
            Left = 15
            Top = 14
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
          object SpeedButton3: TSpeedButton
            Left = 658
            Top = 66
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
            OnClick = SpeedButton3Click
          end
          object Label15: TLabel
            Left = 15
            Top = 54
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
          object Edit6: TEdit
            Left = 72
            Top = 27
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit5: TEdit
            Left = 16
            Top = 27
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton1Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit1: TEdit
            Left = 72
            Top = 67
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit3: TEdit
            Left = 16
            Top = 67
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton3Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '002'
          object SpeedButton4: TSpeedButton
            Left = 318
            Top = 59
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
            OnClick = SpeedButton4Click
          end
          object Label16: TLabel
            Left = 13
            Top = 47
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
          object Label17: TLabel
            Left = 349
            Top = 47
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
          object SpeedButton5: TSpeedButton
            Left = 656
            Top = 59
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
            OnClick = SpeedButton5Click
          end
          object Label18: TLabel
            Left = 13
            Top = 6
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
          object SpeedButton6: TSpeedButton
            Left = 318
            Top = 18
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
            OnClick = SpeedButton6Click
          end
          object Label42: TLabel
            Left = 14
            Top = 131
            Width = 71
            Height = 13
            Caption = #193'rea (grupo)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton36: TSpeedButton
            Left = 318
            Top = 143
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
            OnClick = SpeedButton36Click
          end
          object Label50: TLabel
            Left = 352
            Top = 131
            Width = 52
            Height = 13
            Caption = 'Sub-area'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton37: TSpeedButton
            Left = 656
            Top = 143
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
            OnClick = SpeedButton37Click
          end
          object lbl23: TLabel
            Left = 14
            Top = 171
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
          object btn21: TSpeedButton
            Left = 318
            Top = 183
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
            OnClick = btn21Click
          end
          object lbl24: TLabel
            Left = 352
            Top = 171
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
          object btn22: TSpeedButton
            Left = 656
            Top = 183
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
            OnClick = btn22Click
          end
          object Label89: TLabel
            Left = 14
            Top = 90
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
          object Label90: TLabel
            Left = 352
            Top = 90
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
          object SpeedButton63: TSpeedButton
            Left = 318
            Top = 104
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = SpeedButton63Click
          end
          object SpeedButton64: TSpeedButton
            Left = 656
            Top = 104
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = SpeedButton64Click
          end
          object Label92: TLabel
            Left = 352
            Top = 6
            Width = 35
            Height = 13
            Caption = 'Modal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton66: TSpeedButton
            Left = 656
            Top = 18
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = SpeedButton66Click
          end
          object Edit4: TEdit
            Left = 70
            Top = 60
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Edit8: TEdit
            Left = 14
            Top = 60
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 1
            OnChange = SpeedButton4Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit10: TEdit
            Left = 408
            Top = 60
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 10
          end
          object Edit12: TEdit
            Left = 70
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 11
          end
          object Edit9: TEdit
            Left = 352
            Top = 60
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton5Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit11: TEdit
            Left = 14
            Top = 19
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 0
            OnChange = SpeedButton6Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit72: TEdit
            Left = 70
            Top = 144
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 12
          end
          object Edit74: TEdit
            Left = 408
            Top = 144
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 13
          end
          object Edit71: TEdit
            Left = 14
            Top = 144
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 5
            OnChange = SpeedButton36Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit73: TEdit
            Left = 352
            Top = 144
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 6
            OnChange = SpeedButton37Click
            OnKeyDown = DBEdit1KeyDown
          end
          object edt1: TEdit
            Left = 70
            Top = 184
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 14
          end
          object edt2: TEdit
            Left = 14
            Top = 184
            Width = 57
            Height = 21
            MaxLength = 5
            TabOrder = 7
            OnChange = btn21Click
            OnKeyDown = DBEdit1KeyDown
          end
          object edt3: TEdit
            Left = 408
            Top = 184
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 15
          end
          object edt4: TEdit
            Left = 352
            Top = 184
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 8
            OnChange = btn22Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit127: TEdit
            Left = 14
            Top = 104
            Width = 57
            Height = 21
            TabOrder = 3
            OnChange = SpeedButton63Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit128: TEdit
            Left = 352
            Top = 104
            Width = 57
            Height = 21
            TabOrder = 4
            OnChange = SpeedButton64Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit129: TEdit
            Left = 71
            Top = 104
            Width = 247
            Height = 21
            Color = clBtnFace
            TabOrder = 16
          end
          object Edit130: TEdit
            Left = 408
            Top = 104
            Width = 247
            Height = 21
            Color = clBtnFace
            TabOrder = 17
          end
          object Edit133: TEdit
            Left = 352
            Top = 19
            Width = 57
            Height = 21
            TabOrder = 18
            OnChange = SpeedButton66Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit134: TEdit
            Left = 408
            Top = 19
            Width = 247
            Height = 21
            Color = clBtnFace
            TabOrder = 19
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '003'
          object SpeedButton7: TSpeedButton
            Left = 320
            Top = 19
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
            OnClick = SpeedButton7Click
          end
          object Label19: TLabel
            Left = 16
            Top = 7
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
          object Label20: TLabel
            Left = 354
            Top = 7
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
          object SpeedButton8: TSpeedButton
            Left = 658
            Top = 19
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
            OnClick = SpeedButton8Click
          end
          object Label21: TLabel
            Left = 16
            Top = 43
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
          object SpeedButton9: TSpeedButton
            Left = 658
            Top = 55
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
            OnClick = SpeedButton9Click
          end
          object Label22: TLabel
            Left = 16
            Top = 80
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
          object SpeedButton10: TSpeedButton
            Left = 320
            Top = 92
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
            OnClick = SpeedButton10Click
          end
          object Label23: TLabel
            Left = 354
            Top = 80
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
          object SpeedButton11: TSpeedButton
            Left = 658
            Top = 92
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
            OnClick = SpeedButton11Click
          end
          object Label24: TLabel
            Left = 16
            Top = 117
            Width = 71
            Height = 13
            Caption = #193'rea (grupo)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton12: TSpeedButton
            Left = 320
            Top = 129
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
            OnClick = SpeedButton12Click
          end
          object Label25: TLabel
            Left = 354
            Top = 117
            Width = 52
            Height = 13
            Caption = 'Sub-area'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton13: TSpeedButton
            Left = 658
            Top = 129
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
            OnClick = SpeedButton13Click
          end
          object lbl1: TLabel
            Left = 16
            Top = 154
            Width = 110
            Height = 13
            Caption = 'Analista Comiss'#225'ria'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn1: TSpeedButton
            Left = 320
            Top = 166
            Width = 25
            Height = 23
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
            OnClick = btn1Click
          end
          object lbl2: TLabel
            Left = 354
            Top = 154
            Width = 89
            Height = 13
            Caption = 'Analista Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn2: TSpeedButton
            Left = 658
            Top = 166
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
            OnClick = btn2Click
          end
          object Edit13: TEdit
            Left = 72
            Top = 20
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit14: TEdit
            Left = 16
            Top = 20
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton7Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit15: TEdit
            Left = 410
            Top = 20
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit16: TEdit
            Left = 72
            Top = 56
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit17: TEdit
            Left = 354
            Top = 20
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton8Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit18: TEdit
            Left = 16
            Top = 56
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton9Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit19: TEdit
            Left = 72
            Top = 93
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit20: TEdit
            Left = 16
            Top = 93
            Width = 57
            Height = 21
            MaxLength = 5
            TabOrder = 6
            OnChange = SpeedButton10Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit21: TEdit
            Left = 410
            Top = 93
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Edit22: TEdit
            Left = 354
            Top = 93
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 8
            OnChange = SpeedButton11Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit23: TEdit
            Left = 72
            Top = 130
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 11
          end
          object Edit24: TEdit
            Left = 16
            Top = 130
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 10
            OnChange = SpeedButton12Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit25: TEdit
            Left = 410
            Top = 130
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 13
          end
          object Edit26: TEdit
            Left = 354
            Top = 130
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 12
            OnChange = SpeedButton13Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed1: TEdit
            Left = 72
            Top = 167
            Width = 247
            Height = 21
            TabStop = False
            Enabled = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 15
          end
          object ed2: TEdit
            Left = 16
            Top = 167
            Width = 57
            Height = 21
            Enabled = False
            MaxLength = 4
            TabOrder = 14
            OnChange = SpeedButton12Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed3: TEdit
            Left = 410
            Top = 167
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 17
          end
          object ed4: TEdit
            Left = 354
            Top = 167
            Width = 57
            Height = 21
            MaxLength = 4
            TabOrder = 16
            OnChange = btn2Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '004'
          object SpeedButton14: TSpeedButton
            Left = 320
            Top = 19
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
            OnClick = SpeedButton14Click
          end
          object Label28: TLabel
            Left = 16
            Top = 7
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
          object Label29: TLabel
            Left = 354
            Top = 7
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
          object SpeedButton15: TSpeedButton
            Left = 658
            Top = 19
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
            OnClick = SpeedButton15Click
          end
          object Label30: TLabel
            Left = 16
            Top = 43
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
          object SpeedButton16: TSpeedButton
            Left = 658
            Top = 55
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
            OnClick = SpeedButton16Click
          end
          object Label31: TLabel
            Left = 16
            Top = 80
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
          object SpeedButton17: TSpeedButton
            Left = 320
            Top = 92
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
            OnClick = SpeedButton17Click
          end
          object Label32: TLabel
            Left = 354
            Top = 80
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
          object SpeedButton18: TSpeedButton
            Left = 658
            Top = 92
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
            OnClick = SpeedButton18Click
          end
          object Label33: TLabel
            Left = 16
            Top = 117
            Width = 71
            Height = 13
            Caption = #193'rea (grupo)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton19: TSpeedButton
            Left = 320
            Top = 129
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
            OnClick = SpeedButton19Click
          end
          object Label34: TLabel
            Left = 354
            Top = 117
            Width = 52
            Height = 13
            Caption = 'Sub-area'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton20: TSpeedButton
            Left = 658
            Top = 129
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
            OnClick = SpeedButton20Click
          end
          object lbl3: TLabel
            Left = 16
            Top = 155
            Width = 110
            Height = 13
            Caption = 'Analista Comiss'#225'ria'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn3: TSpeedButton
            Left = 320
            Top = 167
            Width = 25
            Height = 23
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
            OnClick = btn1Click
          end
          object lbl4: TLabel
            Left = 354
            Top = 155
            Width = 89
            Height = 13
            Caption = 'Analista Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn4: TSpeedButton
            Left = 658
            Top = 167
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
            OnClick = btn4Click
          end
          object Edit27: TEdit
            Left = 72
            Top = 20
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit28: TEdit
            Left = 16
            Top = 20
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton14Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit29: TEdit
            Left = 410
            Top = 20
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit30: TEdit
            Left = 72
            Top = 56
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit31: TEdit
            Left = 354
            Top = 20
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton15Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit32: TEdit
            Left = 16
            Top = 56
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton16Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit33: TEdit
            Left = 72
            Top = 93
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit34: TEdit
            Left = 16
            Top = 93
            Width = 57
            Height = 21
            MaxLength = 5
            TabOrder = 6
            OnChange = SpeedButton17Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit35: TEdit
            Left = 410
            Top = 93
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Edit36: TEdit
            Left = 354
            Top = 93
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 8
            OnChange = SpeedButton18Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit37: TEdit
            Left = 72
            Top = 130
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 11
          end
          object Edit38: TEdit
            Left = 16
            Top = 130
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 10
            OnChange = SpeedButton19Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit39: TEdit
            Left = 410
            Top = 130
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 13
          end
          object Edit40: TEdit
            Left = 354
            Top = 130
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 12
            OnChange = SpeedButton20Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed5: TEdit
            Left = 72
            Top = 168
            Width = 247
            Height = 21
            TabStop = False
            Enabled = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 15
          end
          object ed6: TEdit
            Left = 16
            Top = 168
            Width = 57
            Height = 21
            Enabled = False
            MaxLength = 4
            TabOrder = 14
            OnChange = SpeedButton12Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed7: TEdit
            Left = 410
            Top = 168
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 17
          end
          object ed8: TEdit
            Left = 354
            Top = 168
            Width = 57
            Height = 21
            MaxLength = 4
            TabOrder = 16
            OnChange = btn4Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '005'
          object SpeedButton21: TSpeedButton
            Left = 320
            Top = 19
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
            OnClick = SpeedButton21Click
          end
          object Label26: TLabel
            Left = 16
            Top = 7
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
          object Label35: TLabel
            Left = 354
            Top = 7
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
          object SpeedButton22: TSpeedButton
            Left = 658
            Top = 19
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
            OnClick = SpeedButton22Click
          end
          object Label36: TLabel
            Left = 16
            Top = 43
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
          object SpeedButton23: TSpeedButton
            Left = 658
            Top = 55
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
            OnClick = SpeedButton23Click
          end
          object Label37: TLabel
            Left = 16
            Top = 80
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
          object SpeedButton24: TSpeedButton
            Left = 320
            Top = 92
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
            OnClick = SpeedButton24Click
          end
          object Label38: TLabel
            Left = 354
            Top = 80
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
          object SpeedButton25: TSpeedButton
            Left = 658
            Top = 92
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
            OnClick = SpeedButton25Click
          end
          object Label39: TLabel
            Left = 16
            Top = 117
            Width = 71
            Height = 13
            Caption = #193'rea (grupo)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton26: TSpeedButton
            Left = 320
            Top = 129
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
            OnClick = SpeedButton26Click
          end
          object Label40: TLabel
            Left = 354
            Top = 117
            Width = 52
            Height = 13
            Caption = 'Sub-area'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton27: TSpeedButton
            Left = 658
            Top = 129
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
            OnClick = SpeedButton27Click
          end
          object lbl5: TLabel
            Left = 16
            Top = 155
            Width = 110
            Height = 13
            Caption = 'Analista Comiss'#225'ria'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn5: TSpeedButton
            Left = 320
            Top = 167
            Width = 25
            Height = 23
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
            OnClick = btn1Click
          end
          object lbl6: TLabel
            Left = 354
            Top = 155
            Width = 89
            Height = 13
            Caption = 'Analista Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn6: TSpeedButton
            Left = 658
            Top = 167
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
            OnClick = btn6Click
          end
          object Edit41: TEdit
            Left = 72
            Top = 20
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit42: TEdit
            Left = 16
            Top = 20
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton21Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit43: TEdit
            Left = 410
            Top = 20
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit44: TEdit
            Left = 72
            Top = 56
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit45: TEdit
            Left = 354
            Top = 20
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton22Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit46: TEdit
            Left = 16
            Top = 56
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton23Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit47: TEdit
            Left = 72
            Top = 93
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit48: TEdit
            Left = 16
            Top = 93
            Width = 57
            Height = 21
            MaxLength = 5
            TabOrder = 6
            OnChange = SpeedButton24Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit49: TEdit
            Left = 410
            Top = 93
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Edit50: TEdit
            Left = 354
            Top = 93
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 8
            OnChange = SpeedButton25Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit51: TEdit
            Left = 72
            Top = 130
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 11
          end
          object Edit52: TEdit
            Left = 16
            Top = 130
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 10
            OnChange = SpeedButton26Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit53: TEdit
            Left = 410
            Top = 130
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 13
          end
          object Edit54: TEdit
            Left = 354
            Top = 130
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 12
            OnChange = SpeedButton27Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed9: TEdit
            Left = 72
            Top = 168
            Width = 247
            Height = 21
            TabStop = False
            Enabled = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 15
          end
          object ed10: TEdit
            Left = 16
            Top = 168
            Width = 57
            Height = 21
            Enabled = False
            MaxLength = 4
            TabOrder = 14
            OnChange = SpeedButton12Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed11: TEdit
            Left = 410
            Top = 168
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 17
          end
          object ed12: TEdit
            Left = 354
            Top = 168
            Width = 57
            Height = 21
            MaxLength = 4
            TabOrder = 16
            OnChange = btn6Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '006'
          object SpeedButton30: TSpeedButton
            Left = 658
            Top = 17
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
            OnClick = SpeedButton30Click
          end
          object Label44: TLabel
            Left = 15
            Top = 5
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
          object SpeedButton31: TSpeedButton
            Left = 658
            Top = 57
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
            OnClick = SpeedButton31Click
          end
          object Label45: TLabel
            Left = 15
            Top = 45
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
          object Label41: TLabel
            Left = 16
            Top = 122
            Width = 127
            Height = 13
            Caption = 'Armaz'#233'm de Descarga'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton32: TSpeedButton
            Left = 658
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
            OnClick = SpeedButton32Click
          end
          object Label47: TLabel
            Left = 16
            Top = 84
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
          object SpeedButton34: TSpeedButton
            Left = 658
            Top = 96
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
            OnClick = SpeedButton34Click
          end
          object Edit59: TEdit
            Left = 72
            Top = 18
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit60: TEdit
            Left = 16
            Top = 18
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton30Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit61: TEdit
            Left = 72
            Top = 58
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit62: TEdit
            Left = 16
            Top = 58
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton31Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit64: TEdit
            Left = 72
            Top = 135
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit68: TEdit
            Left = 72
            Top = 97
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit67: TEdit
            Left = 16
            Top = 97
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton34Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit63: TEdit
            Left = 16
            Top = 135
            Width = 57
            Height = 21
            MaxLength = 4
            TabOrder = 6
            OnChange = SpeedButton32Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '007'
          object SpeedButton28: TSpeedButton
            Left = 658
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
            OnClick = SpeedButton28Click
          end
          object Label43: TLabel
            Left = 15
            Top = 13
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
          object SpeedButton29: TSpeedButton
            Left = 658
            Top = 65
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
            OnClick = SpeedButton29Click
          end
          object Label46: TLabel
            Left = 15
            Top = 53
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
          object Label48: TLabel
            Left = 16
            Top = 130
            Width = 41
            Height = 13
            Caption = 'Agente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton33: TSpeedButton
            Left = 658
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
            OnClick = SpeedButton33Click
          end
          object Label49: TLabel
            Left = 16
            Top = 92
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
          object SpeedButton35: TSpeedButton
            Left = 658
            Top = 104
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
            OnClick = SpeedButton35Click
          end
          object Edit55: TEdit
            Left = 72
            Top = 26
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit56: TEdit
            Left = 16
            Top = 26
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton28Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit57: TEdit
            Left = 72
            Top = 66
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit58: TEdit
            Left = 16
            Top = 66
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton29Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit66: TEdit
            Left = 72
            Top = 143
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit70: TEdit
            Left = 72
            Top = 105
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit65: TEdit
            Left = 16
            Top = 143
            Width = 57
            Height = 21
            MaxLength = 4
            TabOrder = 6
            OnChange = SpeedButton33Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit69: TEdit
            Left = 16
            Top = 105
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton35Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '008'
          DesignSize = (
            699
            275)
          object Shape11: TShape
            Left = 1
            Top = 1
            Width = 311
            Height = 272
            Anchors = [akLeft, akTop, akBottom]
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape10: TShape
            Left = 314
            Top = 1
            Width = 383
            Height = 272
            Anchors = [akLeft, akTop, akRight, akBottom]
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape8: TShape
            Left = 452
            Top = 101
            Width = 26
            Height = 28
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape9: TShape
            Left = 452
            Top = 72
            Width = 26
            Height = 28
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape7: TShape
            Left = 480
            Top = 4
            Width = 214
            Height = 19
            Anchors = [akLeft, akTop, akRight]
            Brush.Color = clNavy
            Pen.Color = clInfoBk
          end
          object Shape6: TShape
            Left = 317
            Top = 4
            Width = 133
            Height = 19
            Brush.Color = clNavy
            Pen.Color = clInfoBk
          end
          object Label51: TLabel
            Left = 321
            Top = 7
            Width = 114
            Height = 13
            Caption = 'Campos dispon'#237'veis'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clInfoBk
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label52: TLabel
            Left = 484
            Top = 7
            Width = 123
            Height = 13
            Caption = 'Campos selecionados'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clInfoBk
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object SpeedButton38: TSpeedButton
            Left = 453
            Top = 74
            Width = 24
            Height = 25
            Flat = True
            Glyph.Data = {
              7E000000424D7E000000000000003E0000002800000013000000100000000100
              01000000000040000000C40E0000C40E0000020000000000000000000000FFFF
              FF00FFFFE000FFFFE000FFFFE000DFFEE000C7FEE000C1FEE000C07EE000C01E
              E000C01EE000C07EE000C1FEE000C7FEE000DFFEE000FFFFE000FFFFE000FFFF
              E000}
            OnClick = SpeedButton38Click
          end
          object SpeedButton39: TSpeedButton
            Left = 453
            Top = 103
            Width = 24
            Height = 25
            Flat = True
            Glyph.Data = {
              7E000000424D7E000000000000003E0000002800000013000000100000000100
              01000000000040000000C40E0000C40E0000020000000000000000000000FFFF
              FF00FFFFE000FFFFE000FFFFE000DFFEE000DFF8E000DFE0E000DF80E000DE00
              E000DE00E000DF80E000DFE0E000DFF8E000DFFEE000FFFFE000FFFFE000FFFF
              E000}
            OnClick = SpeedButton39Click
          end
          object lbl13: TLabel
            Left = 9
            Top = 28
            Width = 48
            Height = 13
            Caption = 'Unidade'
            FocusControl = DBCheckBox1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl14: TLabel
            Left = 156
            Top = 28
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
          object btn12: TSpeedButton
            Left = 124
            Top = 39
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
            OnClick = btn12Click
          end
          object btn13: TSpeedButton
            Left = 271
            Top = 39
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
            OnClick = btn13Click
          end
          object Panel5: TPanel
            Left = 318
            Top = 23
            Width = 131
            Height = 248
            Anchors = [akLeft, akTop, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Caption = 'Panel5'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 2
            object lstDisponiveis: TListBox
              Left = 0
              Top = 0
              Width = 129
              Height = 246
              Align = alClient
              BorderStyle = bsNone
              Color = clInfoBk
              ItemHeight = 13
              TabOrder = 0
              OnDblClick = lstDisponiveisDblClick
            end
          end
          object Panel6: TPanel
            Left = 481
            Top = 23
            Width = 212
            Height = 248
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Caption = 'Panel5'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 3
            object lstSelecionados: TListBox
              Left = 0
              Top = 0
              Width = 210
              Height = 246
              Align = alClient
              BorderStyle = bsNone
              Color = clInfoBk
              ItemHeight = 13
              PopupMenu = popSelecionados
              TabOrder = 0
              OnDblClick = lstSelecionadosDblClick
            end
          end
          object pnlNomeAmigavel: TPanel
            Left = 376
            Top = 60
            Width = 265
            Height = 89
            BevelInner = bvLowered
            BorderWidth = 1
            Color = clBlack
            TabOrder = 9
            Visible = False
            object Panel8: TPanel
              Left = 3
              Top = 3
              Width = 259
              Height = 83
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Panel9: TPanel
                Left = 6
                Top = 6
                Width = 248
                Height = 71
                BevelInner = bvLowered
                TabOrder = 0
                object Label57: TLabel
                  Left = 10
                  Top = 7
                  Width = 219
                  Height = 13
                  Caption = 'Nome amigavel para o campo ( tecle ENTER )'
                end
                object Label58: TLabel
                  Left = 10
                  Top = 23
                  Width = 223
                  Height = 13
                  AutoSize = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Edit79: TEdit
                  Left = 10
                  Top = 38
                  Width = 228
                  Height = 21
                  TabOrder = 0
                  OnKeyPress = Edit79KeyPress
                end
              end
            end
          end
          object pnlLookup: TPanel
            Left = 489
            Top = 30
            Width = 195
            Height = 158
            BevelInner = bvLowered
            BorderWidth = 1
            Color = clBlack
            TabOrder = 4
            Visible = False
            object Panel10: TPanel
              Left = 3
              Top = 3
              Width = 189
              Height = 152
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Panel11: TPanel
                Left = 3
                Top = 3
                Width = 183
                Height = 147
                BevelInner = bvLowered
                TabOrder = 0
                object Tabela: TLabel
                  Left = 7
                  Top = 4
                  Width = 33
                  Height = 13
                  Caption = 'Tabela'
                end
                object Label59: TLabel
                  Left = 7
                  Top = 38
                  Width = 67
                  Height = 13
                  Caption = 'Campo Chave'
                end
                object Label60: TLabel
                  Left = 7
                  Top = 72
                  Width = 89
                  Height = 13
                  Caption = 'Campo de Retorno'
                end
                object lbl7: TLabel
                  Left = 7
                  Top = 107
                  Width = 153
                  Height = 13
                  Caption = 'Filtro SQL Extra ( se necess'#225'rio )'
                end
                object Edit80: TEdit
                  Left = 8
                  Top = 16
                  Width = 167
                  Height = 21
                  TabOrder = 0
                  OnKeyPress = Edit80KeyPress
                end
                object Edit81: TEdit
                  Left = 7
                  Top = 50
                  Width = 168
                  Height = 21
                  TabOrder = 1
                  OnKeyPress = Edit80KeyPress
                end
                object Edit82: TEdit
                  Left = 7
                  Top = 84
                  Width = 168
                  Height = 21
                  TabOrder = 2
                  OnKeyPress = Edit80KeyPress
                end
                object ed23: TEdit
                  Left = 7
                  Top = 119
                  Width = 168
                  Height = 21
                  TabOrder = 3
                  OnKeyPress = Edit80KeyPress
                end
              end
            end
          end
          object pnlSubstring: TPanel
            Left = 389
            Top = 73
            Width = 169
            Height = 62
            BevelInner = bvLowered
            BorderWidth = 1
            Color = clBlack
            TabOrder = 11
            Visible = False
            object Panel12: TPanel
              Left = 3
              Top = 3
              Width = 163
              Height = 56
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Panel13: TPanel
                Left = 3
                Top = 3
                Width = 157
                Height = 49
                BevelInner = bvLowered
                TabOrder = 0
                object Label61: TLabel
                  Left = 8
                  Top = 7
                  Width = 27
                  Height = 13
                  Caption = 'In'#237'cio'
                end
                object Label62: TLabel
                  Left = 56
                  Top = 7
                  Width = 92
                  Height = 13
                  Caption = 'Qtde de Caracteres'
                end
                object Edit83: TEdit
                  Left = 8
                  Top = 20
                  Width = 40
                  Height = 21
                  TabOrder = 0
                  OnKeyPress = Edit83KeyPress
                end
                object Edit84: TEdit
                  Left = 57
                  Top = 20
                  Width = 41
                  Height = 21
                  TabOrder = 1
                  OnKeyPress = Edit83KeyPress
                end
              end
            end
          end
          object nbTipoConfig: TNotebook
            Left = 5
            Top = 64
            Width = 305
            Height = 150
            PageIndex = 1
            TabOrder = 10
            object TPage
              Left = 0
              Top = 0
              Caption = '0'
              object Label53: TLabel
                Left = 4
                Top = 2
                Width = 40
                Height = 13
                Caption = 'Tabela'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label54: TLabel
                Left = 5
                Top = 38
                Width = 39
                Height = 13
                Caption = 'Campo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label55: TLabel
                Left = 5
                Top = 74
                Width = 276
                Height = 13
                Caption = 'Prazo ( a partir de qtos dias ir'#225' sair no relat'#243'rio )'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label56: TLabel
                Left = 5
                Top = 111
                Width = 224
                Height = 13
                Caption = 'Instru'#231#245'es SQL extras ( se necess'#225'rio )'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Edit75: TEdit
                Left = 5
                Top = 14
                Width = 151
                Height = 21
                TabOrder = 0
                OnExit = Edit75Exit
              end
              object Edit76: TEdit
                Left = 5
                Top = 50
                Width = 151
                Height = 21
                TabOrder = 1
                OnExit = Edit76Exit
              end
              object Edit77: TEdit
                Left = 5
                Top = 86
                Width = 68
                Height = 21
                TabOrder = 2
                OnExit = Edit76Exit
              end
              object Edit78: TEdit
                Left = 5
                Top = 124
                Width = 295
                Height = 21
                TabOrder = 3
                OnExit = Edit76Exit
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = '1'
              object lbl15: TLabel
                Left = 5
                Top = 3
                Width = 93
                Height = 13
                AutoSize = False
                Caption = 'Instru'#231#245'es SQL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object mmo1: TMemo
                Left = 5
                Top = 15
                Width = 295
                Height = 130
                Lines.Strings = (
                  '')
                TabOrder = 0
                OnChange = mmo1Change
                OnExit = Edit76Exit
              end
            end
          end
          object rb1: TRadioButton
            Left = 8
            Top = 7
            Width = 113
            Height = 17
            Caption = 'Modo F'#225'cil'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rb1Click
          end
          object rb2: TRadioButton
            Left = 96
            Top = 7
            Width = 113
            Height = 17
            Caption = 'Modo SQL'
            TabOrder = 1
            OnClick = rb2Click
          end
          object ed26: TEdit
            Left = 43
            Top = 40
            Width = 80
            Height = 21
            ParentColor = True
            TabOrder = 6
            OnExit = Edit75Exit
          end
          object ed27: TEdit
            Left = 190
            Top = 40
            Width = 80
            Height = 21
            ParentColor = True
            TabOrder = 8
            OnExit = Edit75Exit
          end
          object ed24: TEdit
            Left = 10
            Top = 40
            Width = 34
            Height = 21
            TabOrder = 5
            OnChange = btn12Click
            OnExit = Edit75Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object ed25: TEdit
            Left = 157
            Top = 40
            Width = 34
            Height = 21
            TabOrder = 7
            OnChange = btn13Click
            OnExit = Edit75Exit
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'IVP'
          object lbl12: TLabel
            Left = 16
            Top = 12
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
          object btn7: TSpeedButton
            Left = 658
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
            OnClick = btn7Click
          end
          object lbl8: TLabel
            Left = 16
            Top = 53
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
          object btn8: TSpeedButton
            Left = 320
            Top = 65
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
            OnClick = btn8Click
          end
          object lbl9: TLabel
            Left = 354
            Top = 53
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
          object btn9: TSpeedButton
            Left = 658
            Top = 65
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
            OnClick = btn9Click
          end
          object lbl10: TLabel
            Left = 16
            Top = 93
            Width = 71
            Height = 13
            Caption = #193'rea (grupo)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn10: TSpeedButton
            Left = 320
            Top = 105
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
            OnClick = btn10Click
          end
          object lbl11: TLabel
            Left = 354
            Top = 93
            Width = 52
            Height = 13
            Caption = 'Sub-area'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn11: TSpeedButton
            Left = 658
            Top = 105
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
            OnClick = btn11Click
          end
          object Label79: TLabel
            Left = 16
            Top = 133
            Width = 102
            Height = 13
            Caption = 'Via de Transporte'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton55: TSpeedButton
            Left = 320
            Top = 145
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
            OnClick = SpeedButton55Click
          end
          object Label80: TLabel
            Left = 353
            Top = 133
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
          object SpeedButton56: TSpeedButton
            Left = 658
            Top = 145
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
            OnClick = SpeedButton56Click
          end
          object ed14: TEdit
            Left = 72
            Top = 25
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object ed16: TEdit
            Left = 72
            Top = 66
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object ed18: TEdit
            Left = 410
            Top = 66
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object ed20: TEdit
            Left = 72
            Top = 106
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object ed22: TEdit
            Left = 410
            Top = 106
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object ed13: TEdit
            Left = 16
            Top = 25
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = btn7Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed15: TEdit
            Left = 16
            Top = 66
            Width = 57
            Height = 21
            MaxLength = 5
            TabOrder = 2
            OnChange = btn8Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed19: TEdit
            Left = 16
            Top = 106
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 6
            OnChange = btn10Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed21: TEdit
            Left = 354
            Top = 106
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 8
            OnChange = btn11Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed17: TEdit
            Left = 354
            Top = 66
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = btn9Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit113: TEdit
            Left = 72
            Top = 146
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 10
          end
          object Edit114: TEdit
            Left = 16
            Top = 146
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 11
            OnChange = SpeedButton55Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit116: TEdit
            Left = 410
            Top = 146
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 13
          end
          object Edit115: TEdit
            Left = 354
            Top = 146
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 12
            OnChange = SpeedButton56Click
            OnKeyDown = DBEdit1KeyDown
          end
          object chkEspecifico: TCheckBox
            Left = 16
            Top = 185
            Width = 640
            Height = 17
            Caption = 
              'Espec'#237'fico ( Espec'#237'fico s'#227'o os que s'#227'o gerados a'#243's a consulta no' +
              'rmal de hora em hora.)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 14
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'IVN'
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'IVL'
          object Label98: TLabel
            Left = 31
            Top = 10
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
          object SpeedButton72: TSpeedButton
            Left = 293
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
            OnClick = Edit144Change
          end
          object Label99: TLabel
            Left = 360
            Top = 10
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
          object SpeedButton73: TSpeedButton
            Left = 637
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
            OnClick = Edit146Change
          end
          object Edit144: TEdit
            Left = 31
            Top = 23
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = Edit144Change
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit145: TEdit
            Left = 88
            Top = 23
            Width = 205
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit146: TEdit
            Left = 360
            Top = 23
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 2
            OnChange = Edit146Change
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit147: TEdit
            Left = 417
            Top = 23
            Width = 218
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'E01'
          object lbl17: TLabel
            Left = 16
            Top = 40
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
          object btn14: TSpeedButton
            Left = 320
            Top = 51
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
            OnClick = btn14Click
          end
          object lbl18: TLabel
            Left = 354
            Top = 40
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
          object btn15: TSpeedButton
            Left = 658
            Top = 51
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
            OnClick = btn15Click
          end
          object lbl19: TLabel
            Left = 16
            Top = 77
            Width = 71
            Height = 13
            Caption = #193'rea (grupo)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn16: TSpeedButton
            Left = 320
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
            OnClick = btn16Click
          end
          object lbl20: TLabel
            Left = 354
            Top = 77
            Width = 52
            Height = 13
            Caption = 'Sub-area'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn17: TSpeedButton
            Left = 658
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
            OnClick = btn17Click
          end
          object lbl21: TLabel
            Left = 16
            Top = 112
            Width = 110
            Height = 13
            Caption = 'Analista Comiss'#225'ria'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn18: TSpeedButton
            Left = 320
            Top = 123
            Width = 25
            Height = 23
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
            OnClick = btn1Click
          end
          object lbl22: TLabel
            Left = 354
            Top = 112
            Width = 89
            Height = 13
            Caption = 'Analista Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn19: TSpeedButton
            Left = 658
            Top = 123
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
            OnClick = btn19Click
          end
          object lbl16: TLabel
            Left = 16
            Top = 4
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
          object btn20: TSpeedButton
            Left = 320
            Top = 15
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
            OnClick = btn20Click
          end
          object Label86: TLabel
            Left = 16
            Top = 148
            Width = 35
            Height = 13
            Caption = 'Modal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton60: TSpeedButton
            Left = 320
            Top = 159
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = SpeedButton60Click
          end
          object Label87: TLabel
            Left = 354
            Top = 148
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
          object SpeedButton61: TSpeedButton
            Left = 658
            Top = 159
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = SpeedButton61Click
          end
          object Label93: TLabel
            Left = 354
            Top = 4
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
          object SpeedButton67: TSpeedButton
            Left = 658
            Top = 15
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
            OnClick = SpeedButton67Click
          end
          object Label85: TLabel
            Left = 16
            Top = 181
            Width = 186
            Height = 13
            Caption = 'Evento para Conrole no follwoup'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton59: TSpeedButton
            Left = 320
            Top = 192
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
            OnClick = SpeedButton59Click
          end
          object ed28: TEdit
            Left = 72
            Top = 52
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 14
          end
          object ed29: TEdit
            Left = 16
            Top = 52
            Width = 57
            Height = 21
            MaxLength = 5
            TabOrder = 2
            OnChange = btn14Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed30: TEdit
            Left = 410
            Top = 52
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 15
          end
          object ed31: TEdit
            Left = 354
            Top = 52
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 3
            OnChange = btn15Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed32: TEdit
            Left = 72
            Top = 89
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 16
          end
          object ed33: TEdit
            Left = 16
            Top = 89
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 4
            OnChange = btn16Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed34: TEdit
            Left = 410
            Top = 89
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 17
          end
          object ed35: TEdit
            Left = 354
            Top = 89
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 5
            OnChange = btn17Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed36: TEdit
            Left = 72
            Top = 124
            Width = 247
            Height = 21
            TabStop = False
            Enabled = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 18
          end
          object ed37: TEdit
            Left = 16
            Top = 124
            Width = 57
            Height = 21
            Enabled = False
            MaxLength = 4
            TabOrder = 6
            OnChange = SpeedButton12Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed38: TEdit
            Left = 410
            Top = 124
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 19
          end
          object ed39: TEdit
            Left = 354
            Top = 124
            Width = 57
            Height = 21
            MaxLength = 4
            TabOrder = 7
            OnChange = btn19Click
            OnKeyDown = DBEdit1KeyDown
          end
          object ed41: TEdit
            Left = 72
            Top = 16
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 13
          end
          object ed40: TEdit
            Left = 16
            Top = 16
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = btn20Click
            OnKeyDown = DBEdit1KeyDown
          end
          object dbedtModal: TDBEdit
            Left = 16
            Top = 160
            Width = 57
            Height = 21
            DataField = 'CD_VIA_TRANSPORTE'
            DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
            TabOrder = 8
            OnChange = SpeedButton60Click
            OnExit = dbedtModalExit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit123: TEdit
            Left = 72
            Top = 160
            Width = 247
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 21
          end
          object dbedtIdioma: TDBEdit
            Left = 354
            Top = 160
            Width = 57
            Height = 21
            DataField = 'TP_IDIOMA'
            DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
            TabOrder = 9
            OnChange = SpeedButton61Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit124: TEdit
            Left = 410
            Top = 160
            Width = 247
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 22
          end
          object Edit135: TEdit
            Left = 354
            Top = 16
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 1
            OnChange = Edit135Change
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit136: TEdit
            Left = 410
            Top = 16
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 23
          end
          object Edit121: TEdit
            Left = 16
            Top = 193
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 10
            OnChange = SpeedButton59Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit122: TEdit
            Left = 72
            Top = 193
            Width = 247
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 20
          end
          object chkAtendente: TCheckBox
            Left = 355
            Top = 186
            Width = 148
            Height = 17
            Caption = 'Enviar Email ao Atendente'
            TabOrder = 11
            OnEnter = habilita_botoes
          end
          object chkContato: TCheckBox
            Left = 355
            Top = 206
            Width = 142
            Height = 17
            Caption = 'Enviar Email ao Contato'
            TabOrder = 12
            OnEnter = habilita_botoes
          end
          object chkTransportador: TCheckBox
            Left = 519
            Top = 187
            Width = 165
            Height = 17
            Caption = 'Enviar Email ao Transportador'
            TabOrder = 24
            OnEnter = habilita_botoes
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'E02'
          object Label2: TLabel
            Left = 13
            Top = 11
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
          object SpeedButton40: TSpeedButton
            Left = 318
            Top = 23
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
            OnClick = SpeedButton40Click
          end
          object Label63: TLabel
            Left = 353
            Top = 11
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
          object SpeedButton41: TSpeedButton
            Left = 658
            Top = 23
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
            OnClick = SpeedButton41Click
          end
          object Label64: TLabel
            Left = 13
            Top = 56
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
          object SpeedButton42: TSpeedButton
            Left = 318
            Top = 68
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
            OnClick = SpeedButton42Click
          end
          object Label65: TLabel
            Left = 354
            Top = 56
            Width = 334
            Height = 13
            Caption = 'Tipo do Pedido ( filtro dispon'#237'vel apenas para produto 06 )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton43: TSpeedButton
            Left = 658
            Top = 68
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
            OnClick = SpeedButton43Click
          end
          object Label66: TLabel
            Left = 13
            Top = 102
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
          object SpeedButton44: TSpeedButton
            Left = 318
            Top = 114
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
            OnClick = SpeedButton44Click
          end
          object Shape12: TShape
            Left = 14
            Top = 149
            Width = 331
            Height = 57
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label67: TLabel
            Left = 14
            Top = 140
            Width = 112
            Height = 13
            Caption = 'N'#237'veis de Inspe'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton62: TSpeedButton
            Left = 658
            Top = 114
            Width = 25
            Height = 23
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = SpeedButton62Click
          end
          object Label88: TLabel
            Left = 354
            Top = 102
            Width = 35
            Height = 13
            Caption = 'Modal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label91: TLabel
            Left = 354
            Top = 140
            Width = 85
            Height = 13
            Caption = 'Analista Indaia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton65: TSpeedButton
            Left = 658
            Top = 156
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = SpeedButton65Click
          end
          object Edit86: TEdit
            Left = 70
            Top = 24
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit88: TEdit
            Left = 410
            Top = 24
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit90: TEdit
            Left = 70
            Top = 69
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit85: TEdit
            Left = 14
            Top = 24
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton40Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit87: TEdit
            Left = 354
            Top = 24
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton41Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit89: TEdit
            Left = 14
            Top = 69
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton42Click
            OnKeyDown = DBEdit1KeyDown
          end
          object chk1: TCheckBox
            Left = 21
            Top = 159
            Width = 121
            Height = 17
            Caption = 'N'#237'vel de Inspe'#231#227'o 1'
            TabOrder = 10
          end
          object chk2: TCheckBox
            Left = 21
            Top = 183
            Width = 121
            Height = 17
            Caption = 'N'#237'vel de Inspe'#231#227'o 2'
            TabOrder = 11
          end
          object chk3: TCheckBox
            Left = 157
            Top = 159
            Width = 121
            Height = 17
            Caption = 'N'#237'vel de Inspe'#231#227'o 3'
            TabOrder = 12
          end
          object Edit91: TEdit
            Left = 410
            Top = 69
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit92: TEdit
            Left = 354
            Top = 69
            Width = 57
            Height = 21
            MaxLength = 1
            TabOrder = 6
            OnChange = SpeedButton43Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit93: TEdit
            Left = 70
            Top = 115
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Edit94: TEdit
            Left = 14
            Top = 115
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 8
            OnChange = SpeedButton44Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit125: TEdit
            Left = 354
            Top = 115
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 13
            OnChange = SpeedButton62Click
            OnExit = Edit125Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit126: TEdit
            Left = 411
            Top = 115
            Width = 247
            Height = 21
            TabStop = False
            Color = clBtnFace
            TabOrder = 14
          end
          object Edit131: TEdit
            Left = 354
            Top = 156
            Width = 57
            Height = 21
            TabOrder = 15
            OnChange = SpeedButton65Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit132: TEdit
            Left = 411
            Top = 156
            Width = 247
            Height = 21
            TabStop = False
            Color = clBtnFace
            TabOrder = 16
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'E03'
          object Label69: TLabel
            Left = 15
            Top = 6
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
          object SpeedButton45: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = SpeedButton45Click
          end
          object Label70: TLabel
            Left = 354
            Top = 6
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
          object SpeedButton46: TSpeedButton
            Left = 659
            Top = 18
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
            OnClick = Edit97Change
          end
          object Label73: TLabel
            Left = 15
            Top = 85
            Width = 229
            Height = 26
            Caption = 'Qtos dias at'#233' hoje?'#13#10'(deixe 0 para trazer s'#243' o que ocorreu hj)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label74: TLabel
            Left = 15
            Top = 144
            Width = 47
            Height = 13
            Caption = 'Eventos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton50: TSpeedButton
            Left = 658
            Top = 186
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
            OnClick = SpeedButton50Click
          end
          object Label68: TLabel
            Left = 15
            Top = 44
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
          object SpeedButton49: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = SpeedButton49Click
          end
          object SpeedButton53: TSpeedButton
            Left = 658
            Top = 57
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
            OnClick = SpeedButton53Click
          end
          object Label77: TLabel
            Left = 353
            Top = 45
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
          object Edit96: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit98: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 6
          end
          object Edit97: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 1
            OnChange = Edit97Change
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit95: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton45Click
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object SpinEdit1: TSpinEdit
            Left = 15
            Top = 113
            Width = 61
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
          object Memo1: TMemo
            Left = 15
            Top = 157
            Width = 642
            Height = 52
            TabOrder = 4
          end
          object Edit104: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit109: TEdit
            Left = 410
            Top = 58
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 8
          end
          object Edit110: TEdit
            Left = 354
            Top = 58
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton53Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit103: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 9
            OnChange = SpeedButton49Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'E04'
          object Label71: TLabel
            Left = 16
            Top = 6
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
          object Label72: TLabel
            Left = 16
            Top = 48
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
          object SpeedButton47: TSpeedButton
            Left = 658
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
            OnClick = SpeedButton47Click
          end
          object SpeedButton48: TSpeedButton
            Left = 658
            Top = 18
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
            OnClick = SpeedButton48Click
          end
          object Label76: TLabel
            Left = 16
            Top = 131
            Width = 198
            Height = 13
            Caption = 'Os processos devem aparecer at'#233':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton52: TSpeedButton
            Left = 321
            Top = 143
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
            OnClick = SpeedButton52Click
          end
          object Label75: TLabel
            Left = 16
            Top = 90
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
          object SpeedButton51: TSpeedButton
            Left = 321
            Top = 102
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
            OnClick = SpeedButton51Click
          end
          object Label78: TLabel
            Left = 354
            Top = 91
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
          object SpeedButton54: TSpeedButton
            Left = 658
            Top = 103
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
            OnClick = SpeedButton54Click
          end
          object Shape13: TShape
            Left = 356
            Top = 143
            Width = 181
            Height = 23
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape14: TShape
            Left = 544
            Top = 143
            Width = 139
            Height = 23
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label81: TLabel
            Left = 16
            Top = 173
            Width = 71
            Height = 13
            Caption = #193'rea (grupo)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton57: TSpeedButton
            Left = 320
            Top = 185
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
            OnClick = SpeedButton57Click
          end
          object Label82: TLabel
            Left = 354
            Top = 173
            Width = 52
            Height = 13
            Caption = 'Sub-area'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton58: TSpeedButton
            Left = 658
            Top = 185
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
            OnClick = SpeedButton58Click
          end
          object Label83: TLabel
            Left = 354
            Top = 130
            Width = 42
            Height = 13
            Caption = 'Quebra'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label84: TLabel
            Left = 543
            Top = 130
            Width = 63
            Height = 13
            Caption = 'Ordena'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Edit100: TEdit
            Left = 72
            Top = 19
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit102: TEdit
            Left = 72
            Top = 61
            Width = 585
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 6
          end
          object Edit101: TEdit
            Left = 16
            Top = 61
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 1
            OnChange = SpeedButton47Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit99: TEdit
            Left = 16
            Top = 19
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton48Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit108: TEdit
            Left = 72
            Top = 144
            Width = 248
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit107: TEdit
            Left = 16
            Top = 144
            Width = 57
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton52Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit106: TEdit
            Left = 73
            Top = 103
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 8
          end
          object Edit112: TEdit
            Left = 411
            Top = 104
            Width = 246
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Edit105: TEdit
            Left = 16
            Top = 103
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 2
            OnChange = SpeedButton51Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit111: TEdit
            Left = 355
            Top = 104
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 3
            OnChange = SpeedButton54Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Panel7: TPanel
            Left = 357
            Top = 145
            Width = 178
            Height = 19
            BevelOuter = bvNone
            TabOrder = 10
            object rdQuebra2: TRadioButton
              Left = 121
              Top = 2
              Width = 56
              Height = 17
              Caption = 'Status'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TabStop = True
              OnMouseDown = rdQuebra0MouseDown
            end
            object rdQuebra1: TRadioButton
              Left = 62
              Top = 2
              Width = 54
              Height = 17
              Caption = 'Modal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnMouseDown = rdQuebra0MouseDown
            end
            object rdQuebra0: TRadioButton
              Left = 4
              Top = 2
              Width = 43
              Height = 17
              Caption = 'N'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnMouseDown = rdQuebra0MouseDown
            end
          end
          object Panel14: TPanel
            Left = 545
            Top = 144
            Width = 134
            Height = 21
            BevelOuter = bvNone
            TabOrder = 11
            object rdOrdena1: TRadioButton
              Left = 76
              Top = 3
              Width = 62
              Height = 17
              Caption = 'Pedido'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TabStop = True
              OnMouseDown = rdQuebra0MouseDown
            end
            object rdOrdena0: TRadioButton
              Left = 2
              Top = 3
              Width = 74
              Height = 17
              Caption = 'Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnMouseDown = rdQuebra0MouseDown
            end
          end
          object Edit117: TEdit
            Left = 72
            Top = 186
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 12
          end
          object Edit118: TEdit
            Left = 16
            Top = 186
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 13
            OnChange = SpeedButton57Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit119: TEdit
            Left = 410
            Top = 186
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 14
          end
          object Edit120: TEdit
            Left = 354
            Top = 186
            Width = 57
            Height = 21
            MaxLength = 2
            TabOrder = 15
            OnChange = SpeedButton58Click
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'E05'
          object Label94: TLabel
            Left = 15
            Top = 6
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
          object SpeedButton68: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = SpeedButton68Click
          end
          object Label95: TLabel
            Left = 354
            Top = 6
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
          object SpeedButton69: TSpeedButton
            Left = 659
            Top = 18
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
            OnClick = SpeedButton69Click
          end
          object Label96: TLabel
            Left = 15
            Top = 44
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
          object SpeedButton71: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = SpeedButton71Click
          end
          object Label111: TLabel
            Left = 354
            Top = 44
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
          object SpeedButton79: TSpeedButton
            Left = 659
            Top = 56
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
            OnClick = edtCdClienteChange
          end
          object Label110: TLabel
            Left = 15
            Top = 84
            Width = 27
            Height = 13
            Caption = #193'rea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton75: TSpeedButton
            Left = 320
            Top = 96
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
            OnClick = edtCdAreaChange
          end
          object Label97: TLabel
            Left = 15
            Top = 124
            Width = 47
            Height = 13
            Caption = 'Eventos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton70: TSpeedButton
            Left = 658
            Top = 167
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
            OnClick = SpeedButton70Click
          end
          object Edit137: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton68Click
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit138: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit139: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 2
            OnChange = SpeedButton69Click
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit140: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object Edit141: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton71Click
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit142: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object edtCdCliente: TEdit
            Left = 354
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 6
            OnChange = edtCdClienteChange
            OnKeyDown = DBEdit1KeyDown
          end
          object edtNmCliente: TEdit
            Left = 411
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object edtCdArea: TEdit
            Left = 15
            Top = 97
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 8
            OnChange = edtCdAreaChange
            OnKeyDown = DBEdit1KeyDown
          end
          object edtNmArea: TEdit
            Left = 72
            Top = 97
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Memo2: TMemo
            Left = 15
            Top = 138
            Width = 642
            Height = 52
            TabOrder = 10
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'E06'
          object Label101: TLabel
            Left = 15
            Top = 6
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
          object SpeedButton74: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = SpeedButton74Click
          end
          object Label102: TLabel
            Left = 354
            Top = 6
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
          object Label103: TLabel
            Left = 15
            Top = 44
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
          object SpeedButton77: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = SpeedButton77Click
          end
          object Label100: TLabel
            Left = 353
            Top = 44
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
          object SpeedButton78: TSpeedButton
            Left = 658
            Top = 56
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
            OnClick = SpeedButton78Click
          end
          object Label112: TLabel
            Left = 15
            Top = 84
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
          object btn_E06_Cliente: TSpeedButton
            Left = 320
            Top = 96
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
            OnClick = btn_E06_ClienteClick
          end
          object Label113: TLabel
            Left = 353
            Top = 84
            Width = 155
            Height = 13
            Caption = 'Transportador (Mercadoria)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_E06_Tranp_Merc: TSpeedButton
            Left = 658
            Top = 96
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
            OnClick = btn_E06_Tranp_MercClick
          end
          object Label104: TLabel
            Left = 15
            Top = 124
            Width = 47
            Height = 13
            Caption = 'Eventos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton76: TSpeedButton
            Left = 658
            Top = 167
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
            OnClick = SpeedButton76Click
          end
          object Edit143: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton74Click
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit148: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit149: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 2
            Text = '02'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit150: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
            Text = 'EXPORTA'#199#195'O'
          end
          object Edit151: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton77Click
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit152: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit153: TEdit
            Left = 353
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 5
            TabOrder = 6
            OnChange = SpeedButton78Click
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit154: TEdit
            Left = 410
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object edt_E06_Cod_Cliente: TEdit
            Left = 15
            Top = 97
            Width = 58
            Height = 21
            MaxLength = 5
            TabOrder = 8
            OnChange = btn_E06_ClienteClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_E06_Nome_Cliente: TEdit
            Left = 72
            Top = 97
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object edt_E06_Cod_Tranp_Merc: TEdit
            Left = 353
            Top = 97
            Width = 58
            Height = 21
            MaxLength = 4
            TabOrder = 10
            OnChange = btn_E06_Tranp_MercClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_E06_Nome_Tranp_Merc: TEdit
            Left = 410
            Top = 97
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 11
          end
          object Memo3: TMemo
            Left = 16
            Top = 138
            Width = 642
            Height = 52
            TabOrder = 12
            OnKeyDown = DBEdit1KeyDown
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'EDI'
          object pnlEdi: TPanel
            Left = 7
            Top = 5
            Width = 684
            Height = 265
            TabOrder = 0
            object Label107: TLabel
              Left = 9
              Top = 3
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
            object btn_EDI_GRUPO: TSpeedButton
              Left = 310
              Top = 15
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
              OnClick = btn_EDI_GRUPOClick
            end
            object Label105: TLabel
              Left = 9
              Top = 74
              Width = 186
              Height = 13
              Caption = 'Evento para Conrole no follwoup'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_EDI_EVENTO: TSpeedButton
              Left = 310
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
              OnClick = btn_EDI_EVENTOClick
            end
            object Label106: TLabel
              Left = 9
              Top = 38
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
            object btn_EDI_PRODUTO: TSpeedButton
              Left = 310
              Top = 51
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
              OnClick = btn_EDI_PRODUTOClick
            end
            object edt_EDI_NM_GRUPO: TEdit
              Left = 66
              Top = 15
              Width = 240
              Height = 21
              TabStop = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 0
            end
            object edt_EDI_CD_GRUPO: TEdit
              Left = 9
              Top = 15
              Width = 57
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 3
              TabOrder = 1
              OnChange = btn_EDI_GRUPOClick
              OnKeyDown = DBEdit1KeyDown
            end
            object rg_EDI_extensao: TRadioGroup
              Left = 219
              Top = 132
              Width = 200
              Height = 92
              Caption = 'Tipo de Extens'#227'o'
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemIndex = 0
              Items.Strings = (
                'TXT'
                'DOC'
                'DAT'
                'Outra')
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnClick = rg_EDI_extensaoClick
              OnEnter = habilita_botoes
            end
            object edt_edi_extensao: TEdit
              Left = 296
              Top = 198
              Width = 34
              Height = 18
              AutoSize = False
              CharCase = ecUpperCase
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 3
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              Visible = False
              OnEnter = habilita_botoes
            end
            object rg_EDI_envio: TRadioGroup
              Left = 14
              Top = 132
              Width = 200
              Height = 92
              Caption = 'Tipo de Envio'
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ItemIndex = 0
              Items.Strings = (
                'EMAIL'
                'FTP'
                'LOCAL')
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnClick = rg_EDI_envioClick
              OnEnter = habilita_botoes
            end
            object edt_EDI_path: TEdit
              Left = 12
              Top = 239
              Width = 670
              Height = 17
              AutoSize = False
              CharCase = ecUpperCase
              Ctl3D = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
              Visible = False
              OnEnter = habilita_botoes
            end
            object edt_EDI_CD_EVENTO: TEdit
              Left = 9
              Top = 86
              Width = 57
              Height = 21
              MaxLength = 3
              TabOrder = 6
              OnChange = btn_EDI_EVENTOClick
              OnKeyDown = DBEdit1KeyDown
            end
            object edt_EDI_NM_EVENTO: TEdit
              Left = 66
              Top = 86
              Width = 240
              Height = 21
              TabStop = False
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 7
            end
            object edt_EDI_CD_PRODUTO: TEdit
              Left = 9
              Top = 51
              Width = 57
              Height = 21
              MaxLength = 2
              TabOrder = 8
              OnChange = btn_EDI_PRODUTOClick
              OnKeyDown = DBEdit1KeyDown
            end
            object edt_EDI_NM_PRODUTO: TEdit
              Left = 66
              Top = 51
              Width = 240
              Height = 21
              TabStop = False
              ParentColor = True
              ReadOnly = True
              TabOrder = 9
            end
            object GroupBox1: TGroupBox
              Left = 423
              Top = 132
              Width = 254
              Height = 92
              Caption = 'Nome do Arquivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 10
              object Label108: TLabel
                Left = 8
                Top = 24
                Width = 38
                Height = 13
                Caption = 'Variavel'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label109: TLabel
                Left = 11
                Top = 59
                Width = 120
                Height = 10
                Caption = 'ex:   \EDI_NM_ARQ_000/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 8421440
                Font.Height = -8
                Font.Name = 'Small Fonts'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbVAR_ARQ: TDBEdit
                Left = 9
                Top = 38
                Width = 225
                Height = 21
                DataField = 'VARIAVEL_CARTAS_CONFIG'
                DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
                TabOrder = 0
                OnKeyDown = DBEdit1KeyDown
              end
            end
            object chkEnviarParaDigitalizacao: TCheckBox
              Left = 354
              Top = 16
              Width = 219
              Height = 17
              Caption = 'Enviar para Digitaliza'#231#227'o (F1)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
              OnClick = chkEnviarParaDigitalizacaoClick
              OnEnter = habilita_botoes
            end
            object pnlTipoArquivo: TPanel
              Left = 351
              Top = 35
              Width = 327
              Height = 43
              BevelOuter = bvNone
              TabOrder = 12
              object spTpArquivo: TSpeedButton
                Left = 300
                Top = 14
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
                OnClick = spTpArquivoClick
              end
              object Label148: TLabel
                Left = 2
                Top = 3
                Width = 91
                Height = 13
                Caption = 'Tipo de Arquivo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object edtTPDocto: TEdit
                Left = 2
                Top = 16
                Width = 57
                Height = 21
                TabOrder = 0
                OnChange = spTpArquivoClick
                OnEnter = habilita_botoes
                OnKeyPress = edtTPDoctoKeyPress
              end
              object edtDocumento: TEdit
                Left = 59
                Top = 16
                Width = 240
                Height = 21
                Color = clBtnFace
                TabOrder = 1
              end
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DFF'
          object Label115: TLabel
            Left = 15
            Top = 6
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
          object btn_DFF_UNID_NEG: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = btn_DFF_UNID_NEGClick
          end
          object Label116: TLabel
            Left = 354
            Top = 6
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
          object Label117: TLabel
            Left = 15
            Top = 44
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
          object btn_DFF_GRUPO: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = btn_DFF_GRUPOClick
          end
          object Label118: TLabel
            Left = 354
            Top = 44
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
          object btn_DFF_CLIENTE: TSpeedButton
            Left = 659
            Top = 56
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
            OnClick = btn_DFF_CLIENTEClick
          end
          object edt_DFF_CD_UNID_NEG: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = btn_DFF_UNID_NEGClick
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFF_NM_UNID_NEG: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object edt_DFF_CD_PRODUTO: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 2
            Text = '02'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFF_NM_PRODUTO: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
            Text = 'EXPORTA'#199#195'O'
          end
          object edt_DFF_CD_GRUPO: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = btn_DFF_GRUPOClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFF_NM_GRUPO: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object edt_DFF_CD_CLIENTE: TEdit
            Left = 354
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 5
            TabOrder = 6
            OnChange = btn_DFF_CLIENTEClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFF_NM_CLIENTE: TEdit
            Left = 411
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DFT'
          object Label119: TLabel
            Left = 15
            Top = 6
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
          object btn_DFT_UNID_NEG: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = btn_DFT_UNID_NEGClick
          end
          object Label120: TLabel
            Left = 354
            Top = 6
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
          object Label121: TLabel
            Left = 15
            Top = 44
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
          object btn_DFT_GRUPO: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = btn_DFT_GRUPOClick
          end
          object Label122: TLabel
            Left = 353
            Top = 44
            Width = 155
            Height = 13
            Caption = 'Transportador (Mercadoria)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_DFT_TRANSPORTADOR: TSpeedButton
            Left = 659
            Top = 56
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
            OnClick = btn_DFT_TRANSPORTADORClick
          end
          object edt_DFT_CD_UNID_NEG: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = btn_DFT_UNID_NEGClick
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFT_NM_UNID_NEG: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object edt_DFT_CD_PRODUTO: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 2
            Text = '02'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFT_NM_PRODUTO: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
            Text = 'EXPORTA'#199#195'O'
          end
          object edt_DFT_CD_GRUPO: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = btn_DFT_GRUPOClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFT_NM_GRUPO: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object edt_DFT_CD_TRANSPORTADOR: TEdit
            Left = 354
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 4
            TabOrder = 6
            OnChange = btn_DFT_TRANSPORTADORClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFT_NM_TRANSPORTADOR: TEdit
            Left = 411
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DFJ'
          object Label123: TLabel
            Left = 15
            Top = 6
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
          object btn_DFJ_UNID_NEG: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = edt_DFJ_CD_UNID_NEGChange
          end
          object Label124: TLabel
            Left = 354
            Top = 6
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
          object Label125: TLabel
            Left = 15
            Top = 44
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
          object btn_DFJ_GRUPO: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = edt_DFJ_CD_GRUPOChange
          end
          object edt_DFJ_CD_UNID_NEG: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = edt_DFJ_CD_UNID_NEGChange
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFJ_NM_UNID_NEG: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object edt_DFJ_CD_PRODUTO: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 2
            Text = '02'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFJ_NM_PRODUTO: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
            Text = 'EXPORTA'#199#195'O'
          end
          object edt_DFJ_CD_GRUPO: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = edt_DFJ_CD_GRUPOChange
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFJ_NM_GRUPO: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'FDT'
          object Label126: TLabel
            Left = 15
            Top = 6
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
          object btn_FDT_UNID_NEG: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = btn_FDT_UNID_NEGClick
          end
          object Label127: TLabel
            Left = 354
            Top = 6
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
          object Label128: TLabel
            Left = 15
            Top = 44
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
          object btn_FDT_GRUPO: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = btn_FDT_GRUPOClick
          end
          object Label129: TLabel
            Left = 354
            Top = 44
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
          object btn_FDT_CLIENTE: TSpeedButton
            Left = 659
            Top = 56
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
            OnClick = btn_FDT_CLIENTEClick
          end
          object lblFDTTransportador: TLabel
            Left = 15
            Top = 84
            Width = 80
            Height = 13
            Caption = 'Transportador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_FDT_TRANSPORTADOR: TSpeedButton
            Left = 320
            Top = 96
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
            OnClick = btn_FDT_TRANSPORTADORClick
          end
          object edt_FDT_CD_UNID_NEG: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = btn_FDT_UNID_NEGClick
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_FDT_NM_UNID_NEG: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object edt_FDT_CD_GRUPO: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 2
            OnChange = btn_FDT_GRUPOClick
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_FDT_NM_GRUPO: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object edt_FDT_CD_CLIENTE: TEdit
            Left = 354
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = btn_FDT_CLIENTEClick
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_FDT_NM_CLIENTE: TEdit
            Left = 411
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object edt_FDT_CD_TRANSPORTADOR: TEdit
            Left = 15
            Top = 97
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 6
            OnChange = btn_FDT_TRANSPORTADORClick
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_FDT_NM_TRANSPORTADOR: TEdit
            Left = 72
            Top = 97
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object edt_FDT_CD_PRODUTO: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 8
            Text = '01'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_FDT_NM_PRODUTO: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
            Text = 'IMPORTA'#199#195'O'
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DFA'
          object Label130: TLabel
            Left = 15
            Top = 6
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
          object btn_DFA_UNID_NEG: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = btn_DFA_UNID_NEGClick
          end
          object Label131: TLabel
            Left = 354
            Top = 6
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
          object Label132: TLabel
            Left = 15
            Top = 44
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
          object btn_DFA_GRUPO: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = btn_DFA_GRUPOClick
          end
          object Label134: TLabel
            Left = 354
            Top = 44
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
          object edt_DFA_CLIENTE: TSpeedButton
            Left = 659
            Top = 56
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
            OnClick = edt_DFA_CLIENTEClick
          end
          object Label133: TLabel
            Left = 15
            Top = 81
            Width = 47
            Height = 13
            Caption = 'Armador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edt_DFA_ARMADOR: TSpeedButton
            Left = 320
            Top = 93
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
            OnClick = edt_DFA_ARMADORClick
          end
          object edt_DFA_CD_UNID_NEG: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = btn_DFA_UNID_NEGClick
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFA_NM_UNID_NEG: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object edt_DFA_CD_PRODUTO: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 2
            Text = '02'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFA_NM_PRODUTO: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
            Text = 'EXPORTA'#199#195'O'
          end
          object edt_DFA_CD_GRUPO: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = btn_DFA_GRUPOClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFA_NM_GRUPO: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object edt_DFA_CD_CLIENTE: TEdit
            Left = 354
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 6
            OnChange = edt_DFA_CLIENTEClick
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFA_NM_CLIENTE: TEdit
            Left = 411
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object edt_DFA_CD_ARMADOR: TEdit
            Left = 15
            Top = 94
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 8
            OnChange = edt_DFA_ARMADORClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DFA_NM_ARMADOR: TEdit
            Left = 72
            Top = 94
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DF0'
          object Label136: TLabel
            Left = 15
            Top = 6
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
          object btn_DF0_UNID_NEG: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = btn_DF0_UNID_NEGClick
          end
          object Label137: TLabel
            Left = 354
            Top = 6
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
          object Label138: TLabel
            Left = 15
            Top = 44
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
          object btn_DF0_GRUPO: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = btn_DF0_GRUPOClick
          end
          object Label139: TLabel
            Left = 354
            Top = 44
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
          object btn_DF0_CLIENTE: TSpeedButton
            Left = 659
            Top = 56
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
            OnClick = btn_DF0_CLIENTEClick
          end
          object Label141: TLabel
            Left = 15
            Top = 81
            Width = 49
            Height = 13
            Caption = 'Terminal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_DF0_TERMINAL: TSpeedButton
            Left = 320
            Top = 93
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
            OnClick = btn_DF0_TERMINALClick
          end
          object edt_DF0_CD_UNID_NEG: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = btn_DF0_UNID_NEGClick
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DF0_CD_PRODUTO: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 1
            Text = '02'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DF0_NM_PRODUTO: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 2
            Text = 'EXPORTA'#199#195'O'
          end
          object edt_DF0_CD_GRUPO: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 3
            OnChange = btn_DF0_GRUPOClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DF0_NM_GRUPO: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 4
          end
          object edt_DF0_CD_CLIENTE: TEdit
            Left = 354
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 5
            OnChange = btn_DF0_CLIENTEClick
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DF0_NM_CLIENTE: TEdit
            Left = 411
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 6
          end
          object edt_DF0_CD_TERMINAL: TEdit
            Left = 15
            Top = 94
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 7
            OnChange = btn_DF0_TERMINALClick
            OnKeyDown = DBEdit1KeyDown
          end
          object edt_DF0_NM_TERMINAL: TEdit
            Left = 72
            Top = 94
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 8
          end
          object edt_DF0_NM_UNID_NEG: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'E07'
          object Label135: TLabel
            Left = 15
            Top = 6
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
          object SpeedButton80: TSpeedButton
            Left = 320
            Top = 18
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
            OnClick = SpeedButton74Click
          end
          object Label140: TLabel
            Left = 354
            Top = 6
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
          object Label142: TLabel
            Left = 15
            Top = 44
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
          object SpeedButton81: TSpeedButton
            Left = 320
            Top = 56
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
            OnClick = SpeedButton77Click
          end
          object Label143: TLabel
            Left = 353
            Top = 44
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
          object SpeedButton82: TSpeedButton
            Left = 658
            Top = 56
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
            OnClick = SpeedButton78Click
          end
          object Label144: TLabel
            Left = 15
            Top = 84
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
          object SpeedButton83: TSpeedButton
            Left = 320
            Top = 96
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
            OnClick = btn_E06_ClienteClick
          end
          object Label145: TLabel
            Left = 353
            Top = 84
            Width = 155
            Height = 13
            Caption = 'Transportador (Mercadoria)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton84: TSpeedButton
            Left = 658
            Top = 96
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
            OnClick = btn_E06_Tranp_MercClick
          end
          object Label146: TLabel
            Left = 15
            Top = 124
            Width = 47
            Height = 13
            Caption = 'Eventos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton85: TSpeedButton
            Left = 658
            Top = 167
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
            OnClick = SpeedButton76Click
          end
          object Edit155: TEdit
            Left = 15
            Top = 19
            Width = 58
            Height = 21
            MaxLength = 2
            TabOrder = 0
            OnChange = SpeedButton74Click
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit156: TEdit
            Left = 72
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 1
          end
          object Edit157: TEdit
            Left = 354
            Top = 19
            Width = 58
            Height = 21
            Color = clBtnFace
            MaxLength = 2
            ReadOnly = True
            TabOrder = 2
            Text = '02'
            OnExit = Edit_Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit158: TEdit
            Left = 411
            Top = 19
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
            Text = 'EXPORTA'#199#195'O'
          end
          object Edit159: TEdit
            Left = 15
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 3
            TabOrder = 4
            OnChange = SpeedButton77Click
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit160: TEdit
            Left = 72
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 5
          end
          object Edit161: TEdit
            Left = 353
            Top = 57
            Width = 58
            Height = 21
            MaxLength = 5
            TabOrder = 6
            OnChange = SpeedButton78Click
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit162: TEdit
            Left = 410
            Top = 57
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 7
          end
          object Edit163: TEdit
            Left = 15
            Top = 97
            Width = 58
            Height = 21
            MaxLength = 5
            TabOrder = 8
            OnChange = btn_E06_ClienteClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit164: TEdit
            Left = 72
            Top = 97
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 9
          end
          object Edit165: TEdit
            Left = 353
            Top = 97
            Width = 58
            Height = 21
            MaxLength = 4
            TabOrder = 10
            OnChange = btn_E06_Tranp_MercClick
            OnExit = Edit153Exit
            OnKeyDown = DBEdit1KeyDown
          end
          object Edit166: TEdit
            Left = 410
            Top = 97
            Width = 247
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 11
          end
          object Memo4: TMemo
            Left = 15
            Top = 138
            Width = 642
            Height = 52
            TabOrder = 12
            OnKeyDown = DBEdit1KeyDown
          end
        end
      end
      object dbedt_descricao: TDBEdit
        Left = 71
        Top = 23
        Width = 225
        Height = 21
        DataField = 'NM_RELATORIO'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        TabOrder = 1
        OnKeyDown = DBEdit1KeyDown
      end
      object file_path: TFilenameEdit
        Left = 301
        Top = 23
        Width = 246
        Height = 21
        OnButtonClick = file_pathButtonClick
        Filter = 'Documento do Microsoft Word|*.doc'
        InitialDir = 'H:\DDBroker\DocumentosWORD'
        NumGlyphs = 1
        TabOrder = 2
        Visible = False
        OnKeyDown = DBEdit1KeyDown
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 60
        Width = 289
        Height = 40
        DataField = 'TX_RELATORIO'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        TabOrder = 4
        OnKeyDown = DBEdit1KeyDown
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 23
        Width = 49
        Height = 21
        DataField = 'CD_RELATORIO'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        TabOrder = 0
        OnKeyDown = DBEdit1KeyDown
      end
      object Panel1: TPanel
        Left = 16
        Top = 231
        Width = 705
        Height = 25
        BevelInner = bvLowered
        TabOrder = 7
        object Label8: TLabel
          Left = 7
          Top = 6
          Width = 476
          Height = 13
          Caption = 
            'Configura'#231#227'o do Relat'#243'rio ( tipo / unidade / produto / '#225'rea / re' +
            'stante dos campos )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Edit7: TEdit
        Left = 63
        Top = 119
        Width = 242
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 119
        Width = 48
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_TIPO_RELATORIO'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        TabOrder = 5
        OnChange = SpeedButton2Click
        OnExit = DBEdit2Exit
        OnKeyDown = DBEdit1KeyDown
      end
      object DBCheckBox1: TDBCheckBox
        Left = 560
        Top = 26
        Width = 45
        Height = 17
        TabStop = False
        Caption = 'Ativo'
        Ctl3D = True
        DataField = 'IN_ATIVO'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        ParentCtl3D = False
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object mmSql: TMemo
        Left = 343
        Top = 58
        Width = 371
        Height = 83
        TabOrder = 9
        OnChange = mmSqlChange
      end
      object dbchkIN_SABADO: TDBCheckBox
        Left = 633
        Top = 7
        Width = 69
        Height = 20
        Caption = 'S'#225'bado'
        Ctl3D = True
        DataField = 'IN_SABADO'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkIN_DOMINGO: TDBCheckBox
        Left = 633
        Top = 26
        Width = 73
        Height = 20
        Caption = 'Domingo'
        Ctl3D = True
        DataField = 'IN_DOMINGO'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbmCorpoEmail: TDBMemo
        Left = 16
        Top = 159
        Width = 703
        Height = 66
        DataField = 'TX_CORPO_EMAIL'
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
        TabOrder = 12
        OnKeyDown = DBEdit1KeyDown
      end
    end
    object ts_usuarios: TTabSheet
      BorderWidth = 8
      Caption = 'Usu'#225'rios'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 716
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 83
          Height = 13
          Caption = 'Usu'#225'rios para:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 145
          Top = 8
          Width = 568
          Height = 15
          DataField = 'NM_RELATORIO'
          DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
          Transparent = True
        end
        object DBText1: TDBText
          Left = 93
          Top = 8
          Width = 52
          Height = 15
          DataField = 'CD_RELATORIO'
          DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
          Transparent = True
        end
        object Label27: TLabel
          Left = 139
          Top = 8
          Width = 3
          Height = 13
          Caption = '-'
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 84
        Width = 716
        Height = 322
        TabStop = False
        Align = alTop
        DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut_usuarios
        PopupMenu = popGridUsuarios
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_USUARIO'
            Title.Caption = 'C'#243'digo Usu'#225'rio'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_NM_USUARIO'
            Title.Caption = 'Nome do Usu'#225'rio'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 191
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_HORARIOS_ENVIO'
            Title.Caption = 'Horario de Envio'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 391
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 410
        Width = 716
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
      end
      object Panel4: TPanel
        Left = 0
        Top = 406
        Width = 716
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
      object pnlCampos: TPanel
        Left = 0
        Top = 27
        Width = 716
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 1
        object Shape2: TShape
          Left = 4
          Top = 4
          Width = 708
          Height = 49
          Align = alClient
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object btn_co_usuario: TSpeedButton
          Left = 379
          Top = 25
          Width = 24
          Height = 23
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
          OnClick = btn_co_usuarioClick
        end
        object Label10: TLabel
          Left = 11
          Top = 13
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
          Left = 415
          Top = 13
          Width = 101
          Height = 13
          Caption = 'Hor'#225'rios de envio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Edit2: TEdit
          Left = 58
          Top = 26
          Width = 319
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 2
        end
        object edt_horarios: TEdit
          Left = 458
          Top = 25
          Width = 251
          Height = 22
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object MaskEdit1: TMaskEdit
          Left = 415
          Top = 26
          Width = 42
          Height = 21
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 3
          Text = '  :  '
          OnKeyDown = DBEdit3KeyDown
          OnKeyPress = MaskEdit1KeyPress
        end
        object DBEdit3: TDBEdit
          Left = 11
          Top = 26
          Width = 48
          Height = 21
          DataField = 'CD_USUARIO'
          DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut_usuarios
          Enabled = False
          TabOrder = 1
          OnChange = btn_co_usuarioClick
          OnExit = DBEdit3Exit
          OnKeyDown = DBEdit3KeyDown
        end
      end
    end
  end
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    OnDblClick = pnl_btn_agDblClick
    DesignSize = (
      740
      57)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 5
      Width = 40
      Height = 43
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
      Left = 125
      Top = 5
      Width = 40
      Height = 43
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
      Left = 688
      Top = 5
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
      Left = 45
      Top = 5
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
      Left = 85
      Top = 5
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
    object btnReconfiguraTudo: TSpeedButton
      Left = 169
      Top = 5
      Width = 40
      Height = 43
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F333FFFFF337F330FFF70007FF
        F03337F33777773F37F330FF08FFF80FF03337F373333373F7F330F78FFFFF87
        F03337F7F3333337F7F330F0FFFFFFF0F03337F7F333FFF7F7F330F0FFF900F0
        F03337F7F3377737F7F330F0FFF0FFF0F03337F7F337F337F7F330F78FF0FF87
        F03337F73F37F33737F330FF08F0F80FF03337F373F7FF7337F330FFF70007FF
        F03337F33777773FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      OnClick = btnReconfiguraTudoClick
    end
    object dbnvg: TDBNavigator
      Left = 586
      Top = 19
      Width = 80
      Height = 20
      DataSource = datm_relatorios_mail_aut.ds_relatorios_mail_aut
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
      OnClick = dbnvgClick
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 608
    Top = 160
    object mi_novo: TMenuItem
      Caption = '&Novo'
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Hint = 'Excluir'
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
    end
  end
  object popGridUsuarios: TPopupMenu
    Left = 473
    Top = 158
    object Aplicarhorriosparatodososusurios1: TMenuItem
      Caption = '&Aplicar hor'#225'rios para todos os usu'#225'rios'
      OnClick = Aplicarhorriosparatodososusurios1Click
    end
  end
  object popSelecionados: TPopupMenu
    Left = 539
    Top = 159
    object Moverpcima1: TMenuItem
      Caption = 'Mover p/ cima'
      OnClick = Moverpcima1Click
    end
    object Moverpbaixo1: TMenuItem
      Caption = 'Mover p/ baixo'
      OnClick = Moverpbaixo1Click
    end
    object Deletar1: TMenuItem
      Caption = 'Deletar'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object DefinircomoChaveparaLookUp1: TMenuItem
      Caption = '&Definir como Chave para LookUp'
      OnClick = DefinircomoChaveparaLookUp1Click
    end
    object InserirCampoLookup1: TMenuItem
      Caption = 'Configurar Campo Lookup...'
      OnClick = InserirCampoLookup1Click
    end
    object CortarResultado1: TMenuItem
      Caption = '"Cortar" Resultado...'
      OnClick = CortarResultado1Click
    end
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 657
    Top = 161
  end
end

object frm_evento: Tfrm_evento
  Left = 340
  Top = 190
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Tabela de Eventos'
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
  object bvl1: TBevel
    Left = 0
    Top = 46
    Width = 742
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pgctrl_evento: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 453
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_eventoChange
    OnChanging = pgctrl_eventoChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        DataSource = datm_evento.ds_evento
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
            FieldName = 'CD_EVENTO'
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
            FieldName = 'NM_EVENTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 364
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_RESPONSAVEL'
            Title.Caption = 'Respons'#225'vel'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 219
            Visible = True
          end
          item
            Alignment = taCenter
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
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Shape15: TShape
          Left = 22
          Top = 225
          Width = 699
          Height = 196
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape8: TShape
          Left = 576
          Top = 58
          Width = 148
          Height = 148
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape7: TShape
          Left = 582
          Top = 50
          Width = 132
          Height = 20
          Brush.Color = clBtnFace
          Pen.Color = clGray
        end
        object Shape5: TShape
          Left = 306
          Top = 241
          Width = 130
          Height = 170
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label16: TLabel
          Left = 314
          Top = 236
          Width = 49
          Height = 13
          Caption = ' Gest'#227'o '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object Shape2: TShape
          Left = 38
          Top = 241
          Width = 130
          Height = 170
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape1: TShape
          Left = 172
          Top = 241
          Width = 130
          Height = 170
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl_descricao: TLabel
          Left = 21
          Top = 45
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
        object lbl_prazo_inspecao: TLabel
          Left = 182
          Top = 287
          Width = 98
          Height = 13
          Caption = 'Ponto de Acomp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_codigo: TLabel
          Left = 21
          Top = 6
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
        object Label1: TLabel
          Left = 226
          Top = 305
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_etapa: TLabel
          Left = 587
          Top = 523
          Width = 34
          Height = 13
          Caption = 'Etapa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn_co_etapa: TSpeedButton
          Left = 922
          Top = 537
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
          Visible = False
          OnClick = btn_co_etapaClick
        end
        object lblAtivo: TLabel
          Left = 70
          Top = 6
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
        object Label2: TLabel
          Left = 407
          Top = 45
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
        object Label3: TLabel
          Left = 407
          Top = 110
          Width = 53
          Height = 13
          Caption = 'Espanhol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 407
          Top = 77
          Width = 35
          Height = 13
          Caption = 'Ingl'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNomeIngles: TLabel
          Left = 21
          Top = 77
          Width = 104
          Height = 13
          Caption = 'Descri'#231#227'o (Ingl'#234's)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNomeEspanhol: TLabel
          Left = 21
          Top = 110
          Width = 122
          Height = 13
          Caption = 'Descri'#231#227'o (Espanhol)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 182
          Top = 327
          Width = 103
          Height = 13
          Caption = 'Ponto de Controle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 226
          Top = 345
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 182
          Top = 367
          Width = 76
          Height = 13
          Caption = 'Ponto Cr'#237'tico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 226
          Top = 388
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 48
          Top = 287
          Width = 98
          Height = 13
          Caption = 'Ponto de Acomp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 92
          Top = 305
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 48
          Top = 327
          Width = 103
          Height = 13
          Caption = 'Ponto de Controle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 92
          Top = 345
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 48
          Top = 367
          Width = 76
          Height = 13
          Caption = 'Ponto Cr'#237'tico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 92
          Top = 388
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 45
          Top = 236
          Width = 72
          Height = 13
          Caption = ' Importa'#231#227'o '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object Label10: TLabel
          Left = 316
          Top = 287
          Width = 98
          Height = 13
          Caption = 'Ponto de Acomp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 360
          Top = 305
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 316
          Top = 327
          Width = 103
          Height = 13
          Caption = 'Ponto de Controle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 360
          Top = 345
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 316
          Top = 367
          Width = 76
          Height = 13
          Caption = 'Ponto Cr'#237'tico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 360
          Top = 388
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 590
          Top = 53
          Width = 78
          Height = 13
          Caption = 'MyIndaiaWeb'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object Gauge: TGauge
          Left = 430
          Top = 7
          Width = 294
          Height = 22
          BackColor = clBtnFace
          ForeColor = clHotLight
          Progress = 0
          ShowText = False
          Visible = False
        end
        object Shape9: TShape
          Left = 582
          Top = 78
          Width = 136
          Height = 53
          Brush.Color = clBtnFace
          Pen.Color = clGray
        end
        object Label18: TLabel
          Left = 590
          Top = 73
          Width = 118
          Height = 13
          Caption = 'Tracking Importa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object Shape10: TShape
          Left = 582
          Top = 150
          Width = 136
          Height = 48
          Brush.Color = clBtnFace
          Pen.Color = clGray
        end
        object Label19: TLabel
          Left = 590
          Top = 139
          Width = 119
          Height = 13
          Caption = 'Tracking Exporta'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object Shape6: TShape
          Left = 313
          Top = 233
          Width = 51
          Height = 20
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape3: TShape
          Left = 45
          Top = 233
          Width = 72
          Height = 20
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl_reponsavel: TLabel
          Left = 21
          Top = 176
          Width = 74
          Height = 13
          Caption = 'Respons'#225'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 194
          Top = 176
          Width = 99
          Height = 13
          Caption = 'Prest. de Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblbarra: TLabel
          Left = 430
          Top = 11
          Width = 261
          Height = 15
          Alignment = taCenter
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Shape11: TShape
          Left = 574
          Top = 241
          Width = 130
          Height = 170
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape12: TShape
          Left = 440
          Top = 241
          Width = 130
          Height = 170
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label20: TLabel
          Left = 588
          Top = 288
          Width = 98
          Height = 13
          Caption = 'Ponto de Acomp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 633
          Top = 306
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 588
          Top = 328
          Width = 103
          Height = 13
          Caption = 'Ponto de Controle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 633
          Top = 346
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 588
          Top = 368
          Width = 76
          Height = 13
          Caption = 'Ponto Cr'#237'tico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 633
          Top = 389
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 580
          Top = 237
          Width = 92
          Height = 13
          Caption = ' FI - Exporta'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object Label27: TLabel
          Left = 448
          Top = 237
          Width = 91
          Height = 13
          Caption = ' FI - Importa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lbl_inspecionavel: TLabel
          Left = 179
          Top = 236
          Width = 77
          Height = 13
          Caption = ' Exporta'#231#227'o  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object Shape4: TShape
          Left = 179
          Top = 233
          Width = 78
          Height = 20
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape13: TShape
          Left = 580
          Top = 234
          Width = 94
          Height = 20
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label28: TLabel
          Left = 454
          Top = 288
          Width = 98
          Height = 13
          Caption = 'Ponto de Acomp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 499
          Top = 306
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 454
          Top = 328
          Width = 103
          Height = 13
          Caption = 'Ponto de Controle'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 499
          Top = 346
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 454
          Top = 368
          Width = 76
          Height = 13
          Caption = 'Ponto Cr'#237'tico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 499
          Top = 389
          Width = 24
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape14: TShape
          Left = 447
          Top = 234
          Width = 94
          Height = 20
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label34: TLabel
          Left = 48
          Top = 217
          Width = 88
          Height = 13
          Caption = ' Inspecion'#225'vel '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 21
          Top = 144
          Width = 232
          Height = 13
          Caption = 'Observa'#231#227'o Autom'#225'tica para o FollowUp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_descricao: TDBEdit
          Left = 21
          Top = 56
          Width = 381
          Height = 21
          DataField = 'NM_EVENTO'
          DataSource = datm_evento.ds_evento
          TabOrder = 2
        end
        object dbedtInspecao1Exp: TDBEdit
          Left = 182
          Top = 301
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 22
        end
        object dbedt_codigo: TDBEdit
          Left = 21
          Top = 20
          Width = 41
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'CD_EVENTO'
          DataSource = datm_evento.ds_evento
          TabOrder = 0
        end
        object dbedt_cd_etapa: TDBEdit
          Left = 587
          Top = 537
          Width = 33
          Height = 21
          TabOrder = 37
          Visible = False
          OnExit = dbedt_cd_etapaExit
          OnKeyDown = dbedt_cd_etapaKeyDown
        end
        object dbedt_nm_etapa: TDBEdit
          Left = 623
          Top = 537
          Width = 297
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 38
          Visible = False
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 70
          Top = 20
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_evento.ds_evento
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_evento.ds_yesno
          TabOrder = 1
        end
        object dbedt_ap_evento: TDBEdit
          Left = 405
          Top = 56
          Width = 123
          Height = 21
          DataField = 'AP_EVENTO'
          DataSource = datm_evento.ds_evento
          TabOrder = 3
        end
        object dbedt_ap_espanhol: TDBEdit
          Left = 405
          Top = 121
          Width = 123
          Height = 21
          DataField = 'AP_EVENTO_ESPANHOL'
          DataSource = datm_evento.ds_evento
          TabOrder = 7
        end
        object dbedt_ap_ingles: TDBEdit
          Left = 405
          Top = 89
          Width = 123
          Height = 21
          DataField = 'AP_EVENTO_INGLES'
          DataSource = datm_evento.ds_evento
          TabOrder = 5
        end
        object dbedtNomeIngles: TDBEdit
          Left = 21
          Top = 89
          Width = 381
          Height = 21
          DataField = 'NM_INGLES'
          DataSource = datm_evento.ds_evento
          TabOrder = 4
        end
        object dbedtNomeEspanhol: TDBEdit
          Left = 21
          Top = 121
          Width = 381
          Height = 21
          DataField = 'NM_ESPANHOL'
          DataSource = datm_evento.ds_evento
          TabOrder = 6
        end
        object dbedtInspecao2Exp: TDBEdit
          Left = 182
          Top = 341
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO2'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 23
        end
        object dbedtInspecao3Exp: TDBEdit
          Left = 182
          Top = 381
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO3'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 24
        end
        object dbedtInspecao1Imp: TDBEdit
          Left = 48
          Top = 301
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO1_IMP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 18
        end
        object dbedtInspecao2Imp: TDBEdit
          Left = 48
          Top = 341
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO2_IMP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 19
        end
        object dbedtInspecao3Imp: TDBEdit
          Left = 48
          Top = 381
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO3_IMP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 20
        end
        object dbedtInspecao1Gp: TDBEdit
          Left = 316
          Top = 301
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO1_GP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 26
        end
        object dbedtInspecao2Gp: TDBEdit
          Left = 316
          Top = 341
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO2_GP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 27
        end
        object dbedtInspecao3Gp: TDBEdit
          Left = 316
          Top = 381
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO3_GP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 28
        end
        object ChkTrackingImp: TDBCheckBox
          Left = 590
          Top = 92
          Width = 67
          Height = 17
          Caption = 'Campo'
          DataField = 'IN_MOSTRAR_WEB_IMP'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object ChkTrackingExp: TDBCheckBox
          Left = 590
          Top = 158
          Width = 70
          Height = 17
          Caption = 'Campo'
          DataField = 'IN_MOSTRAR_WEB_EXP'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object ChkTrackingImpFiltro: TDBCheckBox
          Left = 590
          Top = 111
          Width = 67
          Height = 17
          Caption = 'Filtro'
          DataField = 'IN_MOSTRAR_WEB_IMP_FILTRO'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object ChkTrackingExpFiltro: TDBCheckBox
          Left = 590
          Top = 177
          Width = 67
          Height = 17
          Caption = 'Filtro'
          DataField = 'IN_MOSTRAR_WEB_EXP_FILTRO'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 395
          Top = 194
          Width = 154
          Height = 17
          Caption = 'Evento Aceita Desvios'
          DataField = 'IN_ACEITA_DESVIOS'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dblkpcbox_responsavel: TDBLookupComboBox
          Left = 21
          Top = 190
          Width = 170
          Height = 21
          DataField = 'CD_RESPONSAVEL'
          DataSource = datm_evento.ds_evento
          DropDownRows = 3
          KeyField = 'CD_RESPONSAVEL'
          ListField = 'NM_RESPONSAVEL'
          ListSource = datm_evento.ds_responsavel
          TabOrder = 10
        end
        object dblkpcbox_ttp_prest_serv: TDBLookupComboBox
          Left = 194
          Top = 190
          Width = 189
          Height = 21
          DataField = 'CD_PREST_SERV'
          DataSource = datm_evento.ds_evento
          KeyField = 'CD_PREST_SERV'
          ListField = 'NM_PREST_SERV'
          ListSource = datm_evento.ds_ttp_prest_serv
          TabOrder = 11
        end
        object dbedtInspecao1fi_exp: TDBEdit
          Left = 588
          Top = 302
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO1_FI_EXP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 34
        end
        object dbedtInspecao2fi_exp: TDBEdit
          Left = 588
          Top = 342
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO2_FI_EXP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 35
        end
        object dbedtInspecao3fi_exp: TDBEdit
          Left = 588
          Top = 382
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO3_FI_EXP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 36
        end
        object dbedtInspecao1fi_imp: TDBEdit
          Left = 454
          Top = 302
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO1_FI_IMP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 30
        end
        object dbedtInspecao2fi_imp: TDBEdit
          Left = 454
          Top = 342
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO2_FI_IMP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 31
        end
        object dbedtInspecao3fi_imp: TDBEdit
          Left = 454
          Top = 382
          Width = 41
          Height = 21
          DataField = 'PRZ_INSPECAO3_FI_IMP'
          DataSource = datm_evento.ds_evento
          MaxLength = 15
          TabOrder = 32
        end
        object dbcheck_insp_exp: TDBCheckBox
          Left = 182
          Top = 264
          Width = 105
          Height = 17
          Caption = 'Inspecion'#225'vel'
          DataField = 'IN_INSPECIONAVEL'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcheck_insp_expClick
        end
        object dbcheck_insp_imp: TDBCheckBox
          Left = 48
          Top = 264
          Width = 105
          Height = 17
          Caption = 'Inspecion'#225'vel'
          DataField = 'IN_INSPECIONAVEL_IMP'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcheck_insp_impClick
        end
        object dbcheck_insp_gp: TDBCheckBox
          Left = 316
          Top = 264
          Width = 105
          Height = 17
          Caption = 'Inspecion'#225'vel'
          DataField = 'IN_INSPECIONAVEL_GP'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcheck_insp_gpClick
        end
        object dbcheck_insp_fi_imp: TDBCheckBox
          Left = 454
          Top = 264
          Width = 105
          Height = 17
          Caption = 'Inspecion'#225'vel'
          DataField = 'IN_INSPECIONAVEL_FI_IMP'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 29
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcheck_insp_fi_impClick
        end
        object dbcheck_insp_fi_exp: TDBCheckBox
          Left = 588
          Top = 264
          Width = 105
          Height = 17
          Caption = 'Inspecion'#225'vel'
          DataField = 'IN_INSPECIONAVEL_FI_EXP'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 33
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbcheck_insp_fi_expClick
        end
        object dbedtOBS_AUT: TDBEdit
          Left = 21
          Top = 155
          Width = 381
          Height = 21
          DataField = 'NM_OBS_AUT'
          DataSource = datm_evento.ds_evento
          TabOrder = 8
        end
        object cb_IN_OBS_AUT: TDBCheckBox
          Left = 407
          Top = 157
          Width = 58
          Height = 17
          Caption = 'Ativar'
          DataField = 'IN_OBS_AUT'
          DataSource = datm_evento.ds_evento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object pnl_cadastro: TPanel
      Left = 0
      Top = 0
      Width = 469
      Height = 46
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 0
      DesignSize = (
        469
        46)
      object btn_incluir: TSpeedButton
        Left = 5
        Top = 4
        Width = 37
        Height = 37
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
        Left = 116
        Top = 4
        Width = 37
        Height = 37
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
        Left = 426
        Top = 4
        Width = 37
        Height = 37
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
        Left = 42
        Top = 4
        Width = 37
        Height = 37
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
        Width = 37
        Height = 37
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
      object dbnvg: TDBNavigator
        Left = 305
        Top = 9
        Width = 112
        Height = 28
        DataSource = datm_evento.ds_evento
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
    object pnl_pesquisa: TPanel
      Left = 473
      Top = 0
      Width = 269
      Height = 46
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      TabStop = True
      object lbl_pesquisa: TLabel
        Left = 5
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
        Left = 136
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
        Left = 5
        Top = 20
        Width = 125
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnExit = edt_chaveExit
      end
      object cb_ordem: TComboBox
        Left = 136
        Top = 20
        Width = 125
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = edt_chaveChange
        OnExit = edt_chaveExit
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 160
    Top = 8
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

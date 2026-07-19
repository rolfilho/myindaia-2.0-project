object frm_dse: Tfrm_dse
  Left = 202
  Top = 99
  Width = 702
  Height = 519
  Caption = 
    'DSE - Declara'#231#227'o Simplificada de Exporta'#231#227'o - [M'#243'dulo de Exporta' +
    #231#227'o]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgDSE: TPageControl
    Left = 0
    Top = 44
    Width = 694
    Height = 448
    ActivePage = ts_dados
    Align = alClient
    TabOrder = 0
    OnChange = pgDSEChange
    OnChanging = pgDSEChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbgrd_principal: TDBGrid
        Left = 0
        Top = 37
        Width = 686
        Height = 383
        Align = alClient
        DataSource = datm_dse.ds_dse
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = 14150891
            Expanded = False
            FieldName = 'NR_PROCESSO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DSE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_EXPORTADOR'
            Width = 231
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_TP_EXPORTADOR'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_SITUACAO'
            Title.Caption = 'Situa'#231#227'o'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TP_COURRIER'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CNPJ_COURRIER'
            Title.Caption = 'CNPJ C/P'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_PAIS_FINAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PESO_BRUTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_AP_MOEDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOTAL_MOEDA'
            Title.Caption = 'Valor Total das NCM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ABERTURA_DSE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_REGISTRO_DSE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NATUREZA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_URF_DESPACHO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_URF_EMBARQUE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_PAIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_VIA_TRANSPORTE'
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 686
        Height = 37
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Shape24: TShape
          Left = 1
          Top = 0
          Width = 684
          Height = 35
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label51: TLabel
          Left = 6
          Top = 11
          Width = 52
          Height = 13
          Caption = 'Unidade:'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object btn1_unid_neg: TSpeedButton
          Left = 322
          Top = 7
          Width = 25
          Height = 22
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
          OnClick = btn1_unid_negClick
        end
        object btn1_produto: TSpeedButton
          Left = 656
          Top = 7
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
          OnClick = btn1_produtoClick
        end
        object Label52: TLabel
          Left = 364
          Top = 11
          Width = 49
          Height = 13
          Caption = 'Produto:'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object edt1_cd_unid_neg: TEdit
          Left = 59
          Top = 7
          Width = 34
          Height = 21
          MaxLength = 2
          TabOrder = 1
          OnExit = edt2_cd_exportadorExit
          OnKeyDown = edt1_cd_unid_negKeyDown
        end
        object edt1_cd_produto: TMaskEdit
          Left = 416
          Top = 7
          Width = 33
          Height = 21
          Color = clWhite
          EditMask = '!99;0; '
          MaxLength = 2
          TabOrder = 2
          OnExit = edt2_cd_exportadorExit
          OnKeyDown = edt1_cd_unid_negKeyDown
        end
        object edt1_nm_unid_neg: TEdit
          Left = 93
          Top = 7
          Width = 225
          Height = 21
          Color = clSilver
          MaxLength = 100
          ReadOnly = True
          TabOrder = 0
        end
        object edt1_nm_produto: TEdit
          Left = 449
          Top = 7
          Width = 203
          Height = 21
          Color = clSilver
          MaxLength = 100
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object ts_dados: TTabSheet
      Caption = 'Dados Globais'
      ImageIndex = 1
      object Shape7: TShape
        Left = 5
        Top = 6
        Width = 673
        Height = 50
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object Shape2: TShape
        Left = 5
        Top = 60
        Width = 673
        Height = 355
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label1: TLabel
        Left = 21
        Top = 13
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 21
        Top = 36
        Width = 62
        Height = 13
        Caption = 'Exportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 366
        Top = 13
        Width = 123
        Height = 13
        Caption = 'N'#250'mero do Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn2_exportador: TSpeedButton
        Left = 421
        Top = 31
        Width = 25
        Height = 22
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
        OnClick = btn2_exportadorClick
      end
      object Label14: TLabel
        Left = 16
        Top = 102
        Width = 77
        Height = 13
        Caption = 'URF Despacho:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label22: TLabel
        Left = 355
        Top = 102
        Width = 76
        Height = 13
        Caption = 'URF Embarque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label23: TLabel
        Left = 355
        Top = 70
        Width = 111
        Height = 13
        Caption = 'Natureza da Opera'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label24: TLabel
        Left = 16
        Top = 70
        Width = 93
        Height = 13
        Caption = 'Tipo de Exportador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object btn2_nr_processo: TSpeedButton
        Left = 252
        Top = 8
        Width = 25
        Height = 22
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
        OnClick = btn2_nr_processoClick
      end
      object Label53: TLabel
        Left = 16
        Top = 134
        Width = 89
        Height = 13
        Caption = 'Pa'#237's Destino Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label56: TLabel
        Left = 16
        Top = 197
        Width = 112
        Height = 14
        AutoSize = False
        Caption = 'Carga Sujeita a Armaz.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label57: TLabel
        Left = 355
        Top = 134
        Width = 72
        Height = 13
        Caption = 'Via Transporte:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object btn2_tpexportador: TSpeedButton
        Left = 321
        Top = 67
        Width = 25
        Height = 19
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
        OnClick = btn2_tpexportadorClick
      end
      object btn2_urfdespacho: TSpeedButton
        Left = 321
        Top = 99
        Width = 25
        Height = 19
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
        OnClick = btn2_urfdespachoClick
      end
      object btn2_urfembarque: TSpeedButton
        Left = 645
        Top = 99
        Width = 25
        Height = 19
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
        OnClick = btn2_urfembarqueClick
      end
      object btn2_natureza: TSpeedButton
        Left = 645
        Top = 67
        Width = 25
        Height = 19
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
        OnClick = btn2_naturezaClick
      end
      object Label32: TLabel
        Left = 181
        Top = 198
        Width = 82
        Height = 13
        AutoSize = False
        Caption = 'Tipo Exportador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object btn2_paisdestino: TSpeedButton
        Left = 321
        Top = 131
        Width = 25
        Height = 19
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
        OnClick = btn2_paisdestinoClick
      end
      object btn2_via: TSpeedButton
        Left = 645
        Top = 131
        Width = 25
        Height = 19
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
        OnClick = btn2_viaClick
      end
      object Label2: TLabel
        Left = 16
        Top = 166
        Width = 109
        Height = 13
        Caption = 'Ve'#237'culo Transportador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label34: TLabel
        Left = 16
        Top = 326
        Width = 106
        Height = 13
        Caption = 'Total Peso Bruto - KG:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label35: TLabel
        Left = 355
        Top = 166
        Width = 105
        Height = 13
        Caption = 'Moeda da Transa'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label42: TLabel
        Left = 256
        Top = 326
        Width = 54
        Height = 13
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object btn2_moeda: TSpeedButton
        Left = 645
        Top = 163
        Width = 25
        Height = 19
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
        OnClick = btn2_moedaClick
      end
      object Label38: TLabel
        Left = 16
        Top = 230
        Width = 70
        Height = 13
        Caption = 'D.I. Eletr'#244'nica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label39: TLabel
        Left = 256
        Top = 230
        Width = 80
        Height = 13
        Caption = 'D.S.I. Eletr'#244'nica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label40: TLabel
        Left = 546
        Top = 230
        Width = 24
        Height = 13
        Caption = 'Dias:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label41: TLabel
        Left = 16
        Top = 262
        Width = 93
        Height = 13
        Caption = 'D.I. N'#227'o Eletr'#244'nica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label43: TLabel
        Left = 16
        Top = 294
        Width = 103
        Height = 13
        Caption = 'D.S.I. N'#227'o Eletr'#244'nica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label44: TLabel
        Left = 256
        Top = 262
        Width = 59
        Height = 13
        Caption = 'UL Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label46: TLabel
        Left = 256
        Top = 294
        Width = 59
        Height = 13
        Caption = 'UL Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label47: TLabel
        Left = 546
        Top = 294
        Width = 26
        Height = 13
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label48: TLabel
        Left = 546
        Top = 262
        Width = 26
        Height = 13
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object btn2_ul_dsine: TSpeedButton
        Left = 515
        Top = 291
        Width = 25
        Height = 19
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
        OnClick = btn2_ul_dsineClick
      end
      object btn2_ul_dine: TSpeedButton
        Left = 515
        Top = 259
        Width = 25
        Height = 19
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
        OnClick = btn2_ul_dineClick
      end
      object Label49: TLabel
        Left = 546
        Top = 326
        Width = 50
        Height = 13
        Caption = 'Qtd. Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label50: TLabel
        Left = 16
        Top = 358
        Width = 40
        Height = 13
        Caption = 'Recinto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label55: TLabel
        Left = 256
        Top = 358
        Width = 28
        Height = 13
        Caption = 'Setor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label58: TLabel
        Left = 546
        Top = 358
        Width = 39
        Height = 13
        Caption = 'Usuario:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label59: TLabel
        Left = 16
        Top = 390
        Width = 220
        Height = 13
        Caption = 'Outros Documentos Informados na Recep'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label60: TLabel
        Left = 436
        Top = 390
        Width = 150
        Height = 13
        Caption = 'Informa'#231#227'o Presen'#231'a de Carga:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label54: TLabel
        Left = 452
        Top = 36
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
      object edt2_nr_processo: TDBEdit
        Left = 123
        Top = 9
        Width = 126
        Height = 21
        DataField = 'CALC_NR_PROCESSO'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 0
        OnExit = edt2_nr_processoExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_nr_despacho: TDBEdit
        Left = 496
        Top = 9
        Width = 178
        Height = 21
        DataField = 'NR_DSE'
        DataSource = datm_dse.ds_dse
        TabOrder = 1
      end
      object edt2_cd_exportador: TDBEdit
        Left = 123
        Top = 32
        Width = 50
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        TabOrder = 2
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_cd_tpexportador: TDBEdit
        Left = 125
        Top = 67
        Width = 49
        Height = 21
        DataField = 'TP_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        TabOrder = 5
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_nm_tpexportador: TDBEdit
        Left = 177
        Top = 67
        Width = 140
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_TP_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 33
      end
      object edt2_cd_urfdespacho: TDBEdit
        Left = 125
        Top = 99
        Width = 49
        Height = 21
        DataField = 'CD_URF_DESPACHO'
        DataSource = datm_dse.ds_dse
        TabOrder = 7
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_nm_urfdespacho: TDBEdit
        Left = 177
        Top = 99
        Width = 140
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_URF_DESPACHO'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 34
      end
      object edt2_cd_urfembarque: TDBEdit
        Left = 472
        Top = 99
        Width = 49
        Height = 21
        DataField = 'CD_URF_EMBARQUE'
        DataSource = datm_dse.ds_dse
        TabOrder = 8
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_nm_urfembarque: TDBEdit
        Left = 523
        Top = 99
        Width = 119
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_URF_EMBARQUE'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 35
      end
      object edt2_nm_natureza: TDBEdit
        Left = 523
        Top = 67
        Width = 119
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_NATUREZA'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 36
      end
      object edt2_cd_natureza: TDBEdit
        Left = 472
        Top = 67
        Width = 49
        Height = 21
        DataField = 'CD_NATUREZA'
        DataSource = datm_dse.ds_dse
        TabOrder = 6
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_tpcourrier: TDBComboBox
        Left = 266
        Top = 194
        Width = 79
        Height = 21
        DataField = 'TP_COURRIER'
        DataSource = datm_dse.ds_dse
        ItemHeight = 13
        Items.Strings = (
          ''
          'P - Postal'
          'C - Courrier')
        TabOrder = 14
        OnChange = edt2_tpcourrierChange
      end
      object edt2_cd_paisdestino: TDBEdit
        Left = 125
        Top = 131
        Width = 49
        Height = 21
        DataField = 'CD_PAIS_FINAL'
        DataSource = datm_dse.ds_dse
        TabOrder = 9
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_nm_paisdestino: TDBEdit
        Left = 177
        Top = 131
        Width = 140
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_PAIS'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 37
      end
      object edt2_cd_via: TDBEdit
        Left = 472
        Top = 131
        Width = 49
        Height = 21
        DataField = 'CD_VIA_TRANSPORTE'
        DataSource = datm_dse.ds_dse
        TabOrder = 10
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_nm_via: TDBEdit
        Left = 523
        Top = 131
        Width = 119
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_VIA_TRANSPORTE'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 38
      end
      object pnl_cnpj: TPanel
        Left = 349
        Top = 192
        Width = 327
        Height = 25
        BevelOuter = bvNone
        TabOrder = 15
        Visible = False
        object lbl_cnpj: TLabel
          Left = 7
          Top = 7
          Width = 66
          Height = 13
          Caption = 'CNPJ Courrier'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btn2_cnpj_courrier: TSpeedButton
          Left = 296
          Top = 4
          Width = 25
          Height = 19
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
          OnClick = btn2_cnpj_courrierClick
        end
        object edt2_cnpj_courrier: TDBEdit
          Left = 122
          Top = 3
          Width = 171
          Height = 21
          DataField = 'CD_CNPJ_COURRIER'
          DataSource = datm_dse.ds_dse
          MaxLength = 18
          TabOrder = 0
          OnKeyDown = edt1_cd_unid_negKeyDown
        end
      end
      object edt2_identificador: TDBEdit
        Left = 125
        Top = 163
        Width = 220
        Height = 21
        DataField = 'CD_IDENT_VEICULO'
        DataSource = datm_dse.ds_dse
        TabOrder = 11
      end
      object edt2_totalpesobruto: TDBEdit
        Left = 125
        Top = 323
        Width = 124
        Height = 21
        DataField = 'VL_PESO_BRUTO'
        DataSource = datm_dse.ds_dse
        TabOrder = 25
      end
      object edt2_cd_moeda: TDBEdit
        Left = 472
        Top = 163
        Width = 49
        Height = 21
        DataField = 'CD_MOEDA'
        DataSource = datm_dse.ds_dse
        TabOrder = 12
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_totalmoeda: TDBEdit
        Left = 339
        Top = 323
        Width = 201
        Height = 21
        DataField = 'VL_TOTAL_MOEDA'
        DataSource = datm_dse.ds_dse
        TabOrder = 26
      end
      object edt2_nm_moeda: TDBEdit
        Left = 523
        Top = 163
        Width = 119
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_MOEDA'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 39
      end
      object edt2_nm_exportador: TDBEdit
        Left = 177
        Top = 32
        Width = 114
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'LK_NM_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 3
      end
      object edt2_cnpj_exportador: TDBEdit
        Left = 294
        Top = 32
        Width = 123
        Height = 21
        Color = clSilver
        DataField = 'CNPJ_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        MaxLength = 18
        ReadOnly = True
        TabOrder = 4
      end
      object edt2_carga_armaz: TRxDBComboBox
        Left = 125
        Top = 194
        Width = 50
        Height = 21
        Style = csDropDownList
        DataField = 'IN_CARGA_ARMAZ'
        DataSource = datm_dse.ds_dse
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 13
        Values.Strings = (
          'S'
          'N')
      end
      object edt2_die: TDBEdit
        Left = 125
        Top = 227
        Width = 124
        Height = 21
        DataField = 'NR_DIE'
        DataSource = datm_dse.ds_dse
        TabOrder = 16
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_dine: TDBEdit
        Left = 125
        Top = 259
        Width = 124
        Height = 21
        DataField = 'NR_DI'
        DataSource = datm_dse.ds_dse
        TabOrder = 19
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_dsine: TDBEdit
        Left = 125
        Top = 291
        Width = 124
        Height = 21
        DataField = 'NR_DSI'
        DataSource = datm_dse.ds_dse
        TabOrder = 22
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_cd_ul_dsine: TDBEdit
        Left = 339
        Top = 291
        Width = 60
        Height = 21
        DataField = 'CD_UL_EMISSAO_DSI'
        DataSource = datm_dse.ds_dse
        TabOrder = 23
      end
      object edt2_cd_ul_dine: TDBEdit
        Left = 339
        Top = 259
        Width = 60
        Height = 21
        DataField = 'CD_UL_EMISSAO_DI'
        DataSource = datm_dse.ds_dse
        TabOrder = 20
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_dsie: TDBEdit
        Left = 339
        Top = 227
        Width = 198
        Height = 21
        DataField = 'NR_DSIE'
        DataSource = datm_dse.ds_dse
        TabOrder = 17
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_dt_dsine: TDBEdit
        Left = 599
        Top = 291
        Width = 68
        Height = 21
        DataField = 'DT_EMISSAO_DSI'
        DataSource = datm_dse.ds_dse
        MaxLength = 10
        TabOrder = 24
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_dt_dine: TDBEdit
        Left = 599
        Top = 259
        Width = 68
        Height = 21
        DataField = 'DT_EMISSAO_DI'
        DataSource = datm_dse.ds_dse
        MaxLength = 10
        TabOrder = 21
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_dias: TDBEdit
        Left = 599
        Top = 227
        Width = 68
        Height = 21
        DataField = 'DIAS'
        DataSource = datm_dse.ds_dse
        TabOrder = 18
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_qtd_total: TDBEdit
        Left = 599
        Top = 323
        Width = 68
        Height = 21
        DataField = 'VL_QTD_TOTAL'
        DataSource = datm_dse.ds_dse
        TabOrder = 27
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_recinto: TDBEdit
        Left = 125
        Top = 355
        Width = 124
        Height = 21
        DataField = 'STR_RECINTO'
        DataSource = datm_dse.ds_dse
        TabOrder = 28
      end
      object edt2_usuario: TDBEdit
        Left = 599
        Top = 355
        Width = 68
        Height = 21
        DataField = 'STR_USUARIO'
        DataSource = datm_dse.ds_dse
        TabOrder = 30
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_setor: TDBEdit
        Left = 339
        Top = 355
        Width = 201
        Height = 21
        DataField = 'STR_SETOR'
        DataSource = datm_dse.ds_dse
        TabOrder = 29
      end
      object edt2_doc_inf: TRxDBComboBox
        Left = 245
        Top = 386
        Width = 54
        Height = 21
        Style = csDropDownList
        DataField = 'IN_OUTROS_DOC'
        DataSource = datm_dse.ds_dse
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 31
        Values.Strings = (
          'S'
          'N')
      end
      object edt2_inf_pres_carga: TRxDBComboBox
        Left = 600
        Top = 386
        Width = 69
        Height = 21
        Style = csDropDownList
        DataField = 'IN_INF_PRES_CARGA'
        DataSource = datm_dse.ds_dse
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 32
        Values.Strings = (
          'S'
          'N')
      end
      object edt2_nm_ul_dsine: TDBEdit
        Left = 400
        Top = 291
        Width = 113
        Height = 21
        Color = clBtnFace
        DataField = 'LK_UL_DSI'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 40
      end
      object edt2_nm_ul_dine: TDBEdit
        Left = 400
        Top = 259
        Width = 113
        Height = 21
        Color = clBtnFace
        DataField = 'LK_UL_DI'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 41
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt2_status: TDBMemo
        Left = 496
        Top = 32
        Width = 178
        Height = 21
        Color = clSilver
        DataField = 'TX_SITUACAO_DSE'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 42
        OnMouseMove = edt2_statusMouseMove
      end
    end
    object ts_ncm: TTabSheet
      Caption = 'NCM(s) do Despacho'
      ImageIndex = 2
      object Shape3: TShape
        Left = 5
        Top = 6
        Width = 673
        Height = 50
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object Shape15: TShape
        Left = 5
        Top = 282
        Width = 673
        Height = 31
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object Shape10: TShape
        Left = 5
        Top = 67
        Width = 673
        Height = 211
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label25: TLabel
        Left = 87
        Top = 478
        Width = 99
        Height = 13
        Caption = 'Recinto Alfandeg'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object SpeedButton4: TSpeedButton
        Left = 719
        Top = 474
        Width = 25
        Height = 22
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
      end
      object Label26: TLabel
        Left = 15
        Top = 144
        Width = 170
        Height = 13
        Caption = 'Unidade de Medida Comercializada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label27: TLabel
        Left = 463
        Top = 144
        Width = 90
        Height = 13
        Caption = 'Peso L'#237'quido (KG):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label28: TLabel
        Left = 14
        Top = 291
        Width = 110
        Height = 13
        Caption = 'Valor Total Acumulado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Shape11: TShape
        Left = 5
        Top = 312
        Width = 673
        Height = 101
        Brush.Color = clBtnFace
        Pen.Color = clGray
      end
      object Label13: TLabel
        Left = 15
        Top = 115
        Width = 193
        Height = 13
        Caption = 'Qtde. na Unidade de Medida Estat'#237'stica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label16: TLabel
        Left = 103
        Top = 531
        Width = 37
        Height = 13
        Caption = 'Recinto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label15: TLabel
        Left = 103
        Top = 553
        Width = 25
        Height = 13
        Caption = 'Setor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label21: TLabel
        Left = 442
        Top = 553
        Width = 101
        Height = 13
        Caption = 'Usu'#225'rio Respons'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label20: TLabel
        Left = 442
        Top = 575
        Width = 131
        Height = 13
        Caption = 'Nacionalidade Embarca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 103
        Top = 575
        Width = 96
        Height = 13
        Caption = 'C'#243'digo Embarca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label18: TLabel
        Left = 103
        Top = 597
        Width = 118
        Height = 13
        Caption = 'Data Validade Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 103
        Top = 619
        Width = 97
        Height = 13
        Caption = 'Regimes Aduaneiros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label36: TLabel
        Left = 15
        Top = 86
        Width = 63
        Height = 13
        Caption = 'C'#243'digo NCM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object btn3_ncm: TSpeedButton
        Left = 429
        Top = 77
        Width = 25
        Height = 22
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
        OnClick = btn3_ncmClick
      end
      object Label37: TLabel
        Left = 463
        Top = 86
        Width = 76
        Height = 13
        Caption = 'Destaque NCM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object btn3_unid_med: TSpeedButton
        Left = 429
        Top = 135
        Width = 25
        Height = 22
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
        OnClick = btn3_unid_medClick
      end
      object Label8: TLabel
        Left = 15
        Top = 173
        Width = 147
        Height = 13
        Caption = 'Valor na Moeda de Transa'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 15
        Top = 208
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 254
        Top = 291
        Width = 107
        Height = 13
        Caption = 'Peso Acumulado (KG):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label61: TLabel
        Left = 463
        Top = 115
        Width = 103
        Height = 13
        Caption = 'Qtde. Comercializada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 21
        Top = 13
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 21
        Top = 36
        Width = 62
        Height = 13
        Caption = 'Exportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 366
        Top = 13
        Width = 123
        Height = 13
        Caption = 'N'#250'mero do Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label62: TLabel
        Left = 452
        Top = 36
        Width = 37
        Height = 13
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBGrid3: TDBGrid
        Left = 11
        Top = 320
        Width = 662
        Height = 88
        DataSource = datm_dse.ds_dse_item
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Color = 14150891
            Expanded = False
            FieldName = 'ID_ITEM'
            Visible = True
          end
          item
            Color = 14150891
            Expanded = False
            FieldName = 'NR_PROCESSO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_CD_NCM'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TOTAL_ITEM'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_PESO_LIQUIDO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_UNIDADE_MEDIDA'
            Width = 106
            Visible = True
          end>
      end
      object DBEdit23: TDBEdit
        Left = 321
        Top = 474
        Width = 56
        Height = 21
        DataField = 'CD_RECINTO_ALFANDEG'
        DataSource = datm_dde.ds_dde
        TabOrder = 13
      end
      object Edit9: TEdit
        Left = 377
        Top = 474
        Width = 342
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 14
      end
      object edt3_pesoliquido: TDBEdit
        Left = 568
        Top = 136
        Width = 103
        Height = 21
        DataField = 'VL_PESO_LIQUIDO'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 5
      end
      object edt3_cd_unid_med: TDBEdit
        Left = 217
        Top = 136
        Width = 48
        Height = 21
        DataField = 'CD_UNID_MED_COMERCIALIZADA'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 4
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt3_valor_acumulado: TDBEdit
        Left = 127
        Top = 287
        Width = 122
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'VL_TOTAL_ACUMULADO'
        DataSource = datm_dse.ds_dse_item
        ReadOnly = True
        TabOrder = 10
      end
      object edt3_qtd: TDBEdit
        Left = 217
        Top = 107
        Width = 208
        Height = 21
        DataField = 'QT_UNID_MED_ESTATISTICA'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 2
      end
      object DBEdit15: TDBEdit
        Left = 312
        Top = 528
        Width = 121
        Height = 21
        DataField = 'CD_RECINTO'
        DataSource = datm_dde.ds_dde
        TabOrder = 15
      end
      object DBEdit14: TDBEdit
        Left = 312
        Top = 550
        Width = 121
        Height = 21
        DataField = 'CD_SETOR'
        DataSource = datm_dde.ds_dde
        TabOrder = 16
      end
      object DBEdit21: TDBEdit
        Left = 642
        Top = 550
        Width = 121
        Height = 21
        DataField = 'CD_PROPRIETARIO'
        DataSource = datm_dde.ds_dde
        TabOrder = 17
      end
      object DBEdit22: TDBEdit
        Left = 579
        Top = 572
        Width = 184
        Height = 21
        DataField = 'TX_NACIONALIDADE_EMBARCACAO'
        DataSource = datm_dde.ds_dde
        TabOrder = 18
      end
      object DBEdit17: TDBEdit
        Left = 312
        Top = 572
        Width = 121
        Height = 21
        DataSource = datm_dde.ds_dde
        TabOrder = 19
      end
      object DBEdit16: TDBEdit
        Left = 312
        Top = 594
        Width = 121
        Height = 21
        DataField = 'DT_VALIDADE_EMBARQUE'
        DataSource = datm_dde.ds_dde
        TabOrder = 20
      end
      object DBEdit18: TDBEdit
        Left = 312
        Top = 616
        Width = 451
        Height = 21
        DataField = 'TX_REGIMES_ADUANEIROS'
        DataSource = datm_dde.ds_dde
        TabOrder = 21
      end
      object edt3_cd_ncm: TDBEdit
        Left = 81
        Top = 78
        Width = 80
        Height = 21
        DataField = 'CD_NCM'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 0
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object edt3_destaquencm: TDBEdit
        Left = 568
        Top = 78
        Width = 104
        Height = 21
        DataField = 'CD_DESTAQUE_NCM'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 1
      end
      object edt3_peso_acumulado: TDBEdit
        Left = 367
        Top = 287
        Width = 122
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'VL_PESO_ACUMULADO'
        DataSource = datm_dse.ds_dse_item
        ReadOnly = True
        TabOrder = 11
      end
      object pnl_navitem: TPanel
        Left = 497
        Top = 283
        Width = 180
        Height = 29
        BevelOuter = bvNone
        BorderWidth = 1
        Color = clSilver
        TabOrder = 22
        object Shape5: TShape
          Left = 1
          Top = 1
          Width = 178
          Height = 27
          Align = alClient
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Registros: TLabel
          Left = 102
          Top = 8
          Width = 54
          Height = 13
          Alignment = taCenter
          Caption = 'Registros'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object nav3_itens: TDBNavigator
          Left = 6
          Top = 5
          Width = 92
          Height = 21
          DataSource = datm_dse.ds_dse_item
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 0
        end
      end
      object edt3_valor: TDBEdit
        Left = 217
        Top = 165
        Width = 208
        Height = 21
        DataField = 'VL_TOTAL_ITEM'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 6
      end
      object edt3_linha1: TDBEdit
        Left = 81
        Top = 204
        Width = 497
        Height = 21
        DataField = 'TX_DESC_MERCADORIA_L1'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 7
      end
      object edt3_linha2: TDBEdit
        Left = 81
        Top = 226
        Width = 497
        Height = 21
        DataField = 'TX_DESC_MERCADORIA_L2'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 8
      end
      object edt3_linha3: TDBEdit
        Left = 81
        Top = 248
        Width = 497
        Height = 21
        DataField = 'TX_DESC_MERCADORIA_L3'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 9
      end
      object edt3_nm_unid_med: TDBEdit
        Left = 265
        Top = 136
        Width = 160
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_UNIDADE_MEDIDA'
        DataSource = datm_dse.ds_dse_item
        ReadOnly = True
        TabOrder = 23
        OnExit = edt2_cd_exportadorExit
      end
      object edt3_nm_ncm: TDBEdit
        Left = 161
        Top = 78
        Width = 264
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'LK_CD_NCM'
        DataSource = datm_dse.ds_dse_item
        ReadOnly = True
        TabOrder = 24
        OnExit = edt2_cd_exportadorExit
      end
      object edt3_qtd_comerc: TDBEdit
        Left = 568
        Top = 107
        Width = 103
        Height = 21
        DataField = 'QT_COMERCIALIZADA'
        DataSource = datm_dse.ds_dse_item
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 123
        Top = 9
        Width = 126
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CALC_NR_PROCESSO'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 25
        OnExit = edt2_nr_processoExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object DBEdit2: TDBEdit
        Left = 496
        Top = 9
        Width = 178
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'NR_DSE'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 26
      end
      object DBEdit3: TDBEdit
        Left = 123
        Top = 32
        Width = 50
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 27
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object DBEdit4: TDBEdit
        Left = 177
        Top = 32
        Width = 114
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'LK_NM_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 28
      end
      object DBEdit5: TDBEdit
        Left = 294
        Top = 32
        Width = 123
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CNPJ_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        MaxLength = 18
        ReadOnly = True
        TabOrder = 29
      end
      object DBMemo1: TDBMemo
        Left = 496
        Top = 32
        Width = 178
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'TX_SITUACAO_DSE'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 30
      end
    end
    object ts_complementares: TTabSheet
      Caption = 'Informa'#231#245'es Complementares'
      ImageIndex = 3
      object Shape6: TShape
        Left = 5
        Top = 67
        Width = 673
        Height = 211
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 5
        Top = 6
        Width = 673
        Height = 50
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object Shape12: TShape
        Left = 5
        Top = 282
        Width = 673
        Height = 31
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object Label30: TLabel
        Left = 527
        Top = 290
        Width = 145
        Height = 16
        Alignment = taRightJustify
        Caption = 'Inclus'#227'o de Volumes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label45: TLabel
        Left = 526
        Top = 289
        Width = 145
        Height = 16
        Alignment = taRightJustify
        Caption = 'Inclus'#227'o de Volumes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Shape13: TShape
        Left = 5
        Top = 312
        Width = 673
        Height = 101
        Brush.Color = clBtnFace
        Pen.Color = clGray
      end
      object Label31: TLabel
        Left = 11
        Top = 72
        Width = 111
        Height = 13
        Caption = 'Documentos Instrutivos'
      end
      object Label33: TLabel
        Left = 11
        Top = 175
        Width = 139
        Height = 13
        Caption = 'Informa'#231#245'es Complementares'
      end
      object btn4_incluir: TSpeedButton
        Left = 12
        Top = 286
        Width = 28
        Height = 24
        Hint = 'Novo'
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
        OnClick = btn4_incluirClick
      end
      object btn4_salvar: TSpeedButton
        Left = 40
        Top = 286
        Width = 28
        Height = 24
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
        OnClick = btn4_salvarClick
      end
      object btn4_cancelar: TSpeedButton
        Left = 68
        Top = 286
        Width = 28
        Height = 24
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
        OnClick = btn4_cancelarClick
      end
      object btn4_excluir: TSpeedButton
        Left = 96
        Top = 286
        Width = 28
        Height = 24
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
        OnClick = btn4_excluirClick
      end
      object Label11: TLabel
        Left = 21
        Top = 13
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 21
        Top = 36
        Width = 62
        Height = 13
        Caption = 'Exportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label29: TLabel
        Left = 366
        Top = 13
        Width = 123
        Height = 13
        Caption = 'N'#250'mero do Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label63: TLabel
        Left = 452
        Top = 36
        Width = 37
        Height = 13
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edt4_tx_doc_instrutivos: TDBMemo
        Left = 11
        Top = 88
        Width = 661
        Height = 77
        DataField = 'TX_DOC_INSTRUTIVOS'
        DataSource = datm_dse.ds_dse
        TabOrder = 0
      end
      object edt4_tx_inf_complementares: TDBMemo
        Left = 11
        Top = 191
        Width = 661
        Height = 77
        DataField = 'TX_INF_COMPLEMENTARES'
        DataSource = datm_dse.ds_dse
        TabOrder = 1
      end
      object dbgrd_volumes: TDBGrid
        Left = 11
        Top = 320
        Width = 662
        Height = 89
        DataSource = datm_dse.ds_dse_volume
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = dbgrd_volumesKeyDown
        Columns = <
          item
            Color = 14150891
            Expanded = False
            FieldName = 'NR_SEQUENCIA'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ESPECIE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_NM_ESPECIE'
            ReadOnly = True
            Width = 202
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_QUANTIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_MARCA'
            Width = 209
            Visible = True
          end>
      end
      object DBEdit6: TDBEdit
        Left = 123
        Top = 9
        Width = 126
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CALC_NR_PROCESSO'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 3
        OnExit = edt2_nr_processoExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object DBEdit7: TDBEdit
        Left = 496
        Top = 9
        Width = 178
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'NR_DSE'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit8: TDBEdit
        Left = 123
        Top = 32
        Width = 50
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 5
        OnExit = edt2_cd_exportadorExit
        OnKeyDown = edt1_cd_unid_negKeyDown
      end
      object DBEdit9: TDBEdit
        Left = 177
        Top = 32
        Width = 114
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'LK_NM_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 294
        Top = 32
        Width = 123
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CNPJ_EXPORTADOR'
        DataSource = datm_dse.ds_dse
        MaxLength = 18
        ReadOnly = True
        TabOrder = 7
      end
      object DBMemo2: TDBMemo
        Left = 496
        Top = 32
        Width = 178
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'TX_SITUACAO_DSE'
        DataSource = datm_dse.ds_dse
        ReadOnly = True
        TabOrder = 8
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 44
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 1
    DesignSize = (
      694
      44)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 5
      Width = 33
      Height = 34
      Hint = 'Novo'
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
    object btn_salvar: TSpeedButton
      Left = 38
      Top = 5
      Width = 33
      Height = 34
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
      Left = 71
      Top = 5
      Width = 33
      Height = 34
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
    object btn_excluir: TSpeedButton
      Left = 104
      Top = 5
      Width = 33
      Height = 34
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
      Left = 291
      Top = 5
      Width = 33
      Height = 34
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
    object Shape1: TShape
      Left = 326
      Top = 5
      Width = 362
      Height = 33
      Anchors = [akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
      Visible = False
    end
    object btn_transmitir: TSpeedButton
      Left = 140
      Top = 5
      Width = 32
      Height = 34
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_transmitirClick
    end
    object btn_consulta: TSpeedButton
      Left = 175
      Top = 5
      Width = 32
      Height = 34
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_consultaClick
    end
    object noteNavegacao: TNotebook
      Left = 328
      Top = 7
      Width = 359
      Height = 29
      Anchors = [akTop, akRight]
      PageIndex = 1
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Capa'
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lista'
        object Label71: TLabel
          Left = 15
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Pesquisar'
          Visible = False
        end
        object Label72: TLabel
          Left = 205
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Ordenar'
          Visible = False
        end
        object edt_chave: TEdit
          Left = 67
          Top = 4
          Width = 131
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          Visible = False
        end
        object cb_ordem: TComboBox
          Left = 248
          Top = 4
          Width = 107
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
end

object frm_dde: Tfrm_dde
  Left = 306
  Top = 114
  Width = 748
  Height = 574
  Caption = 
    'DDE - Declara'#231#227'o de Despacho de Exporta'#231#227'o - [M'#243'dulo de Exporta'#231 +
    #227'o]'
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 43
    Width = 740
    Height = 504
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object pgDDE: TPageControl
      Left = 2
      Top = 2
      Width = 736
      Height = 500
      ActivePage = tabComplementares
      Align = alClient
      TabOrder = 0
      OnChange = pgDDEChange
      OnChanging = pgDDEChanging
      object tabLista: TTabSheet
        Caption = 'Lista'
        object gridDDE: TDBGrid
          Left = 0
          Top = 82
          Width = 728
          Height = 335
          Align = alClient
          Ctl3D = False
          DataSource = datm_dde.ds_dde
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = gridDDEDrawColumnCell
          OnDblClick = gridDDEDblClick
          OnKeyDown = bloqueia_ctrl_delete
          OnKeyUp = bloqueia_ctrl_delete
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_SD_REDUZIDO'
              Title.Caption = 'Processo'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeExportador'
              Title.Caption = 'Exportador'
              Width = 364
              Visible = True
            end
            item
              Color = 16440779
              Expanded = False
              FieldName = 'NR_REGISTRO_SD'
              Title.Caption = 'N'#250'mero do Despacho'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_DATA_SD'
              Title.Caption = 'Data'
              Width = 107
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 728
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Bevel1: TBevel
            Left = 0
            Top = 0
            Width = 324
            Height = 50
            Align = alClient
            Shape = bsFrame
            Style = bsRaised
          end
          object Label51: TLabel
            Left = 7
            Top = 8
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
          object btn_co_unidade: TSpeedButton
            Left = 294
            Top = 21
            Width = 24
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
            OnClick = btn_co_unidadeClick
          end
          object edt_nm_unidade: TEdit
            Left = 41
            Top = 21
            Width = 252
            Height = 21
            TabStop = False
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 1
          end
          object edt_cd_unidade: TEdit
            Left = 7
            Top = 21
            Width = 33
            Height = 21
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            MaxLength = 2
            TabOrder = 0
            OnChange = btn_co_unidadeClick
            OnExit = edt_cd_unidadeExit
            OnKeyDown = edt_cd_unidadeKeyDown
          end
          object PnlSituacao: TPanel
            Left = 324
            Top = 0
            Width = 404
            Height = 50
            Align = alRight
            Color = 13027009
            TabOrder = 2
            object lblSituacao: TDBText
              Left = 9
              Top = 15
              Width = 388
              Height = 30
              DataField = 'TX_SITUCAO_DDE'
              DataSource = datm_dde.ds_dde
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
              WordWrap = True
            end
            object lblTitSituacao: TLabel
              Left = 9
              Top = 2
              Width = 104
              Height = 18
              AutoSize = False
              Caption = 'Situa'#231#227'o da DDE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
          end
        end
        object captura_telas: TMemo
          Left = 0
          Top = 417
          Width = 728
          Height = 55
          Hint = 'Clique duas Vezes para Fechar este Aviso'
          Align = alBottom
          BorderStyle = bsNone
          Color = 15792119
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 2
          Visible = False
          OnDblClick = captura_telasDblClick
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 50
          Width = 728
          Height = 32
          Align = alTop
          Color = 14211288
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            728
            32)
          object Shape24: TShape
            Left = 261
            Top = 11
            Width = 16
            Height = 16
            Anchors = [akLeft]
            Brush.Color = 12189625
            Pen.Color = clGray
          end
          object Label34: TLabel
            Left = 278
            Top = 13
            Width = 62
            Height = 13
            Anchors = [akLeft]
            Caption = 'Registrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Shape25: TShape
            Left = 373
            Top = 11
            Width = 16
            Height = 16
            Anchors = [akLeft]
            Brush.Color = 8454143
            Pen.Color = clGray
          end
          object Label53: TLabel
            Left = 390
            Top = 13
            Width = 39
            Height = 13
            Anchors = [akLeft]
            Caption = 'na Fila'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Shape26: TShape
            Left = 121
            Top = 11
            Width = 16
            Height = 16
            Anchors = [akLeft]
            Pen.Color = clGray
          end
          object Label54: TLabel
            Left = 138
            Top = 13
            Width = 89
            Height = 13
            Anchors = [akLeft]
            Caption = 'N'#227'o Registrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Shape28: TShape
            Left = 463
            Top = 11
            Width = 16
            Height = 16
            Anchors = [akLeft]
            Brush.Color = clRed
            Pen.Color = clGray
          end
          object Label55: TLabel
            Left = 480
            Top = 13
            Width = 128
            Height = 13
            Anchors = [akLeft]
            Caption = 'Problemas no Registro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
      end
      object tabGlobais: TTabSheet
        Caption = 'Dados Globais'
        ImageIndex = 1
        OnShow = tabGlobaisShow
        object pControle2: TPanel
          Left = 0
          Top = 40
          Width = 730
          Height = 428
          TabOrder = 0
          object Shape2: TShape
            Left = 5
            Top = 174
            Width = 719
            Height = 250
            Brush.Color = clBtnFace
            Pen.Color = clGray
          end
          object Shape18: TShape
            Left = 5
            Top = 173
            Width = 719
            Height = 27
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object Shape7: TShape
            Left = 5
            Top = 65
            Width = 719
            Height = 106
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape3: TShape
            Left = 5
            Top = 6
            Width = 719
            Height = 56
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object Label3: TLabel
            Left = 11
            Top = 41
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
          object btn_co_exportador: TSpeedButton
            Left = 514
            Top = 37
            Width = 24
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
            OnClick = btn_co_exportadorClick
          end
          object Label14: TLabel
            Left = 15
            Top = 99
            Width = 216
            Height = 13
            Caption = 'Total do Peso L'#237'quido dos R.E. do Despacho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label22: TLabel
            Left = 15
            Top = 143
            Width = 356
            Height = 13
            Caption = 
              'Total Condi'#231#227'o de Venda dos R.E. do Despacho ( na moeda negociad' +
              'a ) : '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label23: TLabel
            Left = 15
            Top = 121
            Width = 161
            Height = 13
            Caption = 'Total do Peso Bruto do Despacho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label24: TLabel
            Left = 15
            Top = 77
            Width = 148
            Height = 13
            Caption = 'Via de Transporte Internacional'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 341
            Top = 99
            Width = 27
            Height = 13
            Caption = '(KG) :'
          end
          object Label32: TLabel
            Left = 341
            Top = 121
            Width = 27
            Height = 13
            Caption = '(KG) :'
          end
          object Label33: TLabel
            Left = 542
            Top = 101
            Width = 72
            Height = 13
            Caption = '( calculado )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 542
            Top = 147
            Width = 72
            Height = 13
            Caption = '( calculado )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton10: TSpeedButton
            Left = 7
            Top = 175
            Width = 22
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
            OnClick = SpeedButton10Click
          end
          object SpeedButton13: TSpeedButton
            Left = 30
            Top = 175
            Width = 22
            Height = 24
            Hint = 'Excluir item'
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
            OnClick = SpeedButton13Click
          end
          object btn_co_viatransporte: TSpeedButton
            Left = 593
            Top = 75
            Width = 24
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
            OnClick = btn_co_viatransporteClick
          end
          object Label42: TLabel
            Left = 451
            Top = 180
            Width = 269
            Height = 16
            Alignment = taRightJustify
            Caption = 'Registros de Exporta'#231#227'o no Despacho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label45: TLabel
            Left = 449
            Top = 178
            Width = 269
            Height = 16
            Alignment = taRightJustify
            Caption = 'Registros de Exporta'#231#227'o no Despacho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl2: TLabel
            Left = 546
            Top = 42
            Width = 48
            Height = 13
            Caption = 'C.N.P.J.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label52: TLabel
            Left = 11
            Top = 16
            Width = 76
            Height = 13
            Caption = 'Despachante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object btnDesp: TSpeedButton
            Left = 514
            Top = 13
            Width = 24
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
            OnClick = btnDespClick
          end
          object DBGrid2: TDBGrid
            Left = 8
            Top = 203
            Width = 713
            Height = 215
            DataSource = datm_dde.ds_dde_re
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = 15457999
                Expanded = False
                FieldName = 'NR_RE_SISCOMEX'
                Title.Caption = 'N'#250'mero do RE'
                Width = 109
                Visible = True
              end
              item
                Color = 14150891
                Expanded = False
                FieldName = 'NR_ANEXO_INICIAL'
                Title.Caption = 'In'#237'cio'
                Width = 43
                Visible = True
              end
              item
                Color = 14150891
                Expanded = False
                FieldName = 'NR_ANEXO_FINAL'
                Title.Caption = 'Fim'
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_SOMA_COND_VENDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Valor'
                Width = 131
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_SOMA_PESO_LIQUIDO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Peso'
                Width = 126
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_PROCESSO_RE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Caption = 'Processo'
                Width = 101
                Visible = True
              end>
          end
          object edt_nm_exportador: TEdit
            Left = 150
            Top = 37
            Width = 362
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clSilver
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit13: TDBEdit
            Left = 376
            Top = 97
            Width = 162
            Height = 21
            AutoSize = False
            Color = clSilver
            DataField = 'VL_TOTAL_PESO_LIQUIDO'
            DataSource = datm_dde.ds_dde
            TabOrder = 2
          end
          object DBEdit19: TDBEdit
            Left = 376
            Top = 119
            Width = 162
            Height = 21
            AutoSize = False
            DataField = 'VL_TOTAL_PESO_BRUTO'
            DataSource = datm_dde.ds_dde
            TabOrder = 3
          end
          object DBEdit20: TDBEdit
            Left = 376
            Top = 141
            Width = 162
            Height = 21
            AutoSize = False
            Color = clSilver
            DataField = 'VL_TOTAL_COND_VENDA'
            DataSource = datm_dde.ds_dde
            TabOrder = 4
          end
          object edt_cnpj: TMaskEdit
            Left = 598
            Top = 37
            Width = 120
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clSilver
            EditMask = '99.999.999/9999-99;0;_'
            MaxLength = 18
            ReadOnly = True
            TabOrder = 5
          end
          object edt_nm_via_transporte: TEdit
            Left = 402
            Top = 75
            Width = 190
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 6
          end
          object edt_cd_exportador: TDBEdit
            Left = 94
            Top = 37
            Width = 55
            Height = 21
            AutoSize = False
            DataField = 'CD_EXPORTADOR'
            DataSource = datm_dde.ds_dde
            TabOrder = 7
            OnChange = btn_co_exportadorClick
            OnExit = edt_cd_exportadorExit
            OnKeyDown = edt_cd_unidadeKeyDown
          end
          object edt_cd_via_transporte: TDBEdit
            Left = 376
            Top = 75
            Width = 25
            Height = 21
            AutoSize = False
            DataField = 'CD_VIA_TRANSPORTE'
            DataSource = datm_dde.ds_dde
            TabOrder = 8
            OnChange = btn_co_viatransporteClick
            OnExit = edt_cd_exportadorExit
            OnKeyDown = edt_cd_unidadeKeyDown
          end
          object EditCPFDesp: TDBEdit
            Left = 94
            Top = 13
            Width = 120
            Height = 21
            AutoSize = False
            DataField = 'CPF_USUARIO'
            DataSource = datm_dde.ds_dde
            TabOrder = 9
            OnChange = btnDespClick
            OnExit = dbedtDtDDEExit
          end
          object EditDesp: TEdit
            Left = 216
            Top = 13
            Width = 297
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clSilver
            ReadOnly = True
            TabOrder = 10
          end
        end
        object pControle1: TPanel
          Left = 0
          Top = 0
          Width = 730
          Height = 43
          TabOrder = 1
          object Shape27: TShape
            Left = 5
            Top = 3
            Width = 719
            Height = 36
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object Label1: TLabel
            Left = 11
            Top = 16
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
          object btn_co_processo: TSpeedButton
            Left = 168
            Top = 12
            Width = 24
            Height = 22
            Enabled = False
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
            OnClick = btn_co_processoClick
          end
          object Label4: TLabel
            Left = 228
            Top = 15
            Width = 127
            Height = 13
            Caption = 'N'#250'mero do  Despacho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl1: TLabel
            Left = 546
            Top = 14
            Width = 48
            Height = 13
            Caption = 'Dt. DDE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object edt_nr_processo: TDBEdit
            Left = 94
            Top = 12
            Width = 72
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'NR_SD_REDUZIDO'
            DataSource = datm_dde.ds_dde
            ReadOnly = True
            TabOrder = 0
            OnExit = edt_nr_processoExit
            OnKeyDown = edt_cd_unidadeKeyDown
          end
          object EditNumDespacho: TDBEdit
            Left = 362
            Top = 11
            Width = 176
            Height = 21
            AutoSize = False
            DataField = 'NR_REGISTRO_SD'
            DataSource = datm_dde.ds_dde
            TabOrder = 1
          end
          object dbedtDtDDE: TDBDateEdit
            Left = 601
            Top = 12
            Width = 105
            Height = 19
            DataField = 'DT_DATA_SD'
            DataSource = datm_dde.ds_dde
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnExit = dbedtDtDDEExit
          end
        end
      end
      object tabComplementares: TTabSheet
        Caption = 'Dados Complementares'
        ImageIndex = 2
        OnShow = tabComplementaresShow
        object Shape15: TShape
          Left = 5
          Top = 249
          Width = 721
          Height = 27
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape10: TShape
          Left = 5
          Top = 94
          Width = 721
          Height = 129
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape6: TShape
          Left = 5
          Top = 62
          Width = 721
          Height = 31
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape4: TShape
          Left = 5
          Top = 6
          Width = 721
          Height = 57
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label5: TLabel
          Left = 16
          Top = 16
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
        object Label6: TLabel
          Left = 16
          Top = 40
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
        object Label7: TLabel
          Left = 287
          Top = 16
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
          Top = 176
          Width = 310
          Height = 13
          Caption = 'N'#250'mero da Solicita'#231#227'o de Despacho em Local n'#227'o Alfandegado :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label27: TLabel
          Left = 15
          Top = 199
          Width = 182
          Height = 13
          Caption = 'Identificador do Ve'#237'culo Transportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label28: TLabel
          Left = 13
          Top = 256
          Width = 149
          Height = 13
          Caption = 'Quantidade Total de Volumes : '
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
          Top = 275
          Width = 721
          Height = 168
          Brush.Color = clBtnFace
          Pen.Color = clGray
        end
        object Label13: TLabel
          Left = 15
          Top = 152
          Width = 258
          Height = 13
          Caption = 'Qtde. de Estabelecimentos Participantes do Despacho'
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
          Top = 106
          Width = 74
          Height = 13
          Caption = 'URF Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btn_co_urfdespacho: TSpeedButton
          Left = 545
          Top = 103
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
          OnClick = btn_co_urfdespachoClick
        end
        object Label37: TLabel
          Left = 15
          Top = 129
          Width = 73
          Height = 13
          Caption = 'URF Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btn_co_urfembarque: TSpeedButton
          Left = 545
          Top = 126
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
          OnClick = btn_co_urfembarqueClick
        end
        object Label38: TLabel
          Left = 15
          Top = 71
          Width = 138
          Height = 13
          Caption = 'Via de Transporte Internac. : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Shape14: TShape
          Left = 5
          Top = 224
          Width = 721
          Height = 24
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Label39: TLabel
          Left = 14
          Top = 230
          Width = 94
          Height = 13
          Caption = 'Assinale para SIM : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label43: TLabel
          Left = 481
          Top = 256
          Width = 241
          Height = 16
          Alignment = taRightJustify
          Caption = 'Inclus'#227'o de Volumes no Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label46: TLabel
          Left = 480
          Top = 255
          Width = 241
          Height = 16
          Alignment = taRightJustify
          Caption = 'Inclus'#227'o de Volumes no Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label50: TLabel
          Left = 245
          Top = 254
          Width = 72
          Height = 13
          Caption = '( calculado )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object DBEdit4: TDBEdit
          Left = 153
          Top = 12
          Width = 128
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'NR_SD_REDUZIDO'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 424
          Top = 12
          Width = 174
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'NR_REGISTRO_SD'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 1
        end
        object DBGrid3: TDBGrid
          Left = 8
          Top = 278
          Width = 715
          Height = 162
          DataSource = datm_dde.ds_dde_espec
          TabOrder = 18
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_ESPECIE'
              Title.Caption = 'C'#243'digo'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calcTipoEmbalagem'
              Title.Caption = 'Descri'#231#227'o'
              Width = 283
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QT_ESPECIE'
              Title.Caption = 'Quantidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TX_MARCACAO_VOLUME'
              Title.Caption = 'Marca'#231#227'o'
              Width = 197
              Visible = True
            end>
        end
        object DBEdit23: TDBEdit
          Left = 321
          Top = 474
          Width = 56
          Height = 19
          DataField = 'CD_RECINTO_ALFANDEG'
          DataSource = datm_dde.ds_dde
          TabOrder = 19
        end
        object Edit9: TEdit
          Left = 377
          Top = 474
          Width = 342
          Height = 19
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 20
        end
        object DBEdit24: TDBEdit
          Left = 329
          Top = 172
          Width = 176
          Height = 21
          AutoSize = False
          DataField = 'TX_LOCAL_NAO_ALFANDEG'
          DataSource = datm_dde.ds_dde
          TabOrder = 11
        end
        object DBEdit25: TDBEdit
          Left = 329
          Top = 195
          Width = 176
          Height = 21
          AutoSize = False
          DataField = 'TX_IDENT_VEIC_TRANSP'
          DataSource = datm_dde.ds_dde
          MaxLength = 23
          TabOrder = 12
        end
        object DBEdit26: TDBEdit
          Left = 171
          Top = 252
          Width = 70
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          DataField = 'QT_TOTAL_VOLUMES'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 17
        end
        object edt_cnpj2: TMaskEdit
          Left = 599
          Top = 36
          Width = 121
          Height = 21
          AutoSize = False
          Color = clSilver
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit12: TDBEdit
          Left = 329
          Top = 149
          Width = 55
          Height = 21
          AutoSize = False
          DataField = 'QT_ESTAB_DESPACHO'
          DataSource = datm_dde.ds_dde
          TabOrder = 10
        end
        object DBEdit15: TDBEdit
          Left = 312
          Top = 528
          Width = 121
          Height = 19
          DataField = 'CD_RECINTO'
          DataSource = datm_dde.ds_dde
          TabOrder = 21
        end
        object DBEdit14: TDBEdit
          Left = 312
          Top = 550
          Width = 121
          Height = 19
          DataField = 'CD_SETOR'
          DataSource = datm_dde.ds_dde
          TabOrder = 22
        end
        object DBEdit21: TDBEdit
          Left = 642
          Top = 550
          Width = 121
          Height = 19
          DataField = 'CD_PROPRIETARIO'
          DataSource = datm_dde.ds_dde
          TabOrder = 23
        end
        object DBEdit22: TDBEdit
          Left = 579
          Top = 572
          Width = 184
          Height = 19
          DataField = 'TX_NACIONALIDADE_EMBARCACAO'
          DataSource = datm_dde.ds_dde
          TabOrder = 24
        end
        object DBEdit17: TDBEdit
          Left = 312
          Top = 572
          Width = 121
          Height = 19
          DataSource = datm_dde.ds_dde
          TabOrder = 25
        end
        object DBEdit16: TDBEdit
          Left = 312
          Top = 594
          Width = 121
          Height = 19
          DataField = 'DT_VALIDADE_EMBARQUE'
          DataSource = datm_dde.ds_dde
          TabOrder = 26
        end
        object DBEdit18: TDBEdit
          Left = 312
          Top = 616
          Width = 451
          Height = 19
          DataField = 'TX_REGIMES_ADUANEIROS'
          DataSource = datm_dde.ds_dde
          TabOrder = 27
        end
        object edt_nm_urf_despacho: TEdit
          Left = 385
          Top = 103
          Width = 159
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 13
        end
        object edt_nm_urf_embarque: TEdit
          Left = 385
          Top = 126
          Width = 159
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 14
        end
        object DBCheckBox7: TDBCheckBox
          Left = 329
          Top = 229
          Width = 185
          Height = 14
          Caption = 'Despacho de Carga Fracionada'
          DataField = 'IN_INF_DESP_CARGA_FRACIONADA'
          DataSource = datm_dde.ds_dde
          TabOrder = 15
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 524
          Top = 229
          Width = 119
          Height = 14
          Caption = 'Despacho Posterior'
          DataField = 'IN_INF_DESPACHO_POSTERIOR'
          DataSource = datm_dde.ds_dde
          TabOrder = 16
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object edt_nm_via_transporte2: TEdit
          Left = 179
          Top = 67
          Width = 198
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          ReadOnly = True
          TabOrder = 7
        end
        object edt_nm_exportador2: TEdit
          Left = 211
          Top = 36
          Width = 387
          Height = 21
          AutoSize = False
          Color = clSilver
          ReadOnly = True
          TabOrder = 4
        end
        object edt_cd_via_transporte2: TDBEdit
          Left = 153
          Top = 67
          Width = 25
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          DataField = 'CD_VIA_TRANSPORTE'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 6
          OnChange = edt_cd_via_transporte2Change
          OnExit = edt_cd_exportadorExit
        end
        object edt_cd_exportador2: TDBEdit
          Left = 153
          Top = 36
          Width = 55
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'CD_EXPORTADOR'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 3
          OnChange = edt_cd_exportador2Change
        end
        object edt_cd_urf_embarque: TDBEdit
          Left = 329
          Top = 126
          Width = 55
          Height = 21
          AutoSize = False
          DataField = 'CD_URF_EMBARQUE'
          DataSource = datm_dde.ds_dde
          TabOrder = 9
          OnChange = btn_co_urfembarqueClick
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object edt_cd_urf_despacho: TDBEdit
          Left = 329
          Top = 103
          Width = 55
          Height = 21
          AutoSize = False
          DataField = 'CD_URF_DESPACHO'
          DataSource = datm_dde.ds_dde
          TabOrder = 8
          OnChange = btn_co_urfdespachoClick
          OnKeyDown = edt_cd_unidadeKeyDown
        end
        object dbedtDTDDE2: TDBEdit
          Left = 600
          Top = 12
          Width = 120
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'DT_DATA_SD'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 2
        end
      end
      object tabNF: TTabSheet
        Caption = 'Notas Fiscais'
        ImageIndex = 3
        OnShow = tabNFShow
        object Shape12: TShape
          Left = 5
          Top = 133
          Width = 719
          Height = 308
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape23: TShape
          Left = 16
          Top = 162
          Width = 296
          Height = 165
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape8: TShape
          Left = 5
          Top = 126
          Width = 719
          Height = 25
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape13: TShape
          Left = 5
          Top = 94
          Width = 719
          Height = 31
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape16: TShape
          Left = 5
          Top = 62
          Width = 719
          Height = 31
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape5: TShape
          Left = 5
          Top = 6
          Width = 719
          Height = 57
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label8: TLabel
          Left = 16
          Top = 16
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
        object Label9: TLabel
          Left = 16
          Top = 40
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
        object Label10: TLabel
          Left = 287
          Top = 16
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
        object Label29: TLabel
          Left = 16
          Top = 70
          Width = 74
          Height = 13
          Caption = 'URF Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label40: TLabel
          Left = 351
          Top = 70
          Width = 73
          Height = 13
          Caption = 'URF Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 16
          Top = 104
          Width = 331
          Height = 13
          Caption = 
            'Notas Fiscais por Estabelecimento. Qtde. Estabelecimento Informa' +
            'do :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label12: TLabel
          Left = 59
          Top = 205
          Width = 78
          Height = 13
          Caption = 'Estabelecimento'
          Transparent = True
        end
        object Shape9: TShape
          Left = 60
          Top = 219
          Width = 49
          Height = 23
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape17: TShape
          Left = 121
          Top = 219
          Width = 49
          Height = 23
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label30: TLabel
          Left = 113
          Top = 222
          Width = 4
          Height = 16
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label31: TLabel
          Left = 492
          Top = 102
          Width = 72
          Height = 13
          Caption = '( calculado )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 59
          Top = 248
          Width = 127
          Height = 13
          Caption = 'CGC do Estabelecimento : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Shape19: TShape
          Left = 176
          Top = 219
          Width = 84
          Height = 23
          Brush.Color = clBtnFace
          Pen.Color = clGray
        end
        object Shape20: TShape
          Left = 60
          Top = 262
          Width = 143
          Height = 21
          Brush.Color = clBtnFace
          Pen.Color = clGray
        end
        object Shape21: TShape
          Left = 132
          Top = 263
          Width = 70
          Height = 20
          Pen.Color = clGray
          Pen.Style = psClear
        end
        object Label44: TLabel
          Left = 303
          Top = 133
          Width = 417
          Height = 16
          Alignment = taRightJustify
          Caption = 'Inclus'#227'o de Estabelecimentos e Notas Fiscais no Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object DBText1: TDBText
          Left = 126
          Top = 225
          Width = 41
          Height = 14
          Alignment = taCenter
          DataField = 'QT_ESTAB_DESPACHO'
          DataSource = datm_dde.ds_dde
          Transparent = True
        end
        object DBText2: TDBText
          Left = 64
          Top = 225
          Width = 41
          Height = 14
          Alignment = taCenter
          DataField = 'NR_ESTABELECIMENTO'
          DataSource = datm_dde.ds_dde_estab
          Transparent = True
        end
        object Label47: TLabel
          Left = 302
          Top = 132
          Width = 417
          Height = 16
          Alignment = taRightJustify
          Caption = 'Inclus'#227'o de Estabelecimentos e Notas Fiscais no Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Shape22: TShape
          Left = 16
          Top = 331
          Width = 296
          Height = 35
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object btn_excluir_estab: TSpeedButton
          Left = 101
          Top = 336
          Width = 27
          Height = 26
          Hint = 'Excluir item'
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
          OnClick = btn_excluir_estabClick
        end
        object btn_cancelar_estab: TSpeedButton
          Left = 74
          Top = 336
          Width = 27
          Height = 26
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
          OnClick = btn_cancelar_estabClick
        end
        object btn_salvar_estab: TSpeedButton
          Left = 47
          Top = 336
          Width = 27
          Height = 26
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
          OnClick = btn_salvar_estabClick
        end
        object btn_incluir_estab: TSpeedButton
          Left = 20
          Top = 336
          Width = 27
          Height = 26
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
          OnClick = btn_incluir_estabClick
        end
        object DBEdit7: TDBEdit
          Left = 153
          Top = 12
          Width = 128
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'NR_SD_REDUZIDO'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit8: TDBEdit
          Left = 424
          Top = 12
          Width = 174
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'NR_REGISTRO_SD'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 1
        end
        object edtSufixoCGC: TDBEdit
          Left = 135
          Top = 266
          Width = 65
          Height = 14
          BorderStyle = bsNone
          DataField = 'NR_SUFIXO_CGC'
          DataSource = datm_dde.ds_dde_estab
          TabOrder = 10
        end
        object edt_cnpj3: TMaskEdit
          Left = 599
          Top = 36
          Width = 121
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          ReadOnly = True
          TabOrder = 4
          OnChange = edt_cnpj3Change
        end
        object DBGrid4: TDBGrid
          Left = 322
          Top = 162
          Width = 392
          Height = 265
          DataSource = datm_dde.ds_dde_nf
          TabOrder = 11
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_NF_INICIAL'
              Title.Caption = 'NF - Inicial'
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_NF_FINAL'
              Title.Caption = 'NF - Final'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_SERIE_NF'
              Title.Caption = 'S'#233'rie'
              Width = 40
              Visible = True
            end>
        end
        object edt_nm_urf_despacho2: TEdit
          Left = 153
          Top = 67
          Width = 185
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          ReadOnly = True
          TabOrder = 6
        end
        object edt_nm_urf_embarque2: TEdit
          Left = 488
          Top = 67
          Width = 185
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit11: TDBEdit
          Left = 368
          Top = 99
          Width = 120
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DataField = 'QT_ESTAB_DESPACHO'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 9
          OnChange = btn_co_urfdespachoClick
        end
        object DBNavigator1: TDBNavigator
          Left = 179
          Top = 221
          Width = 80
          Height = 20
          DataSource = datm_dde.ds_dde_estab
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          TabOrder = 12
        end
        object mkedt_cnpj: TMaskEdit
          Left = 65
          Top = 266
          Width = 67
          Height = 13
          BorderStyle = bsNone
          Color = clBtnFace
          EditMask = '00.000.000 / ;0;_'
          MaxLength = 13
          TabOrder = 13
        end
        object pnlEstabelecimentos: TPanel
          Left = 16
          Top = 370
          Width = 296
          Height = 57
          BevelOuter = bvNone
          TabOrder = 14
          object Label49: TLabel
            Left = 12
            Top = 10
            Width = 271
            Height = 39
            Alignment = taCenter
            Caption = 
              'Voc'#234' informou na DDE, que teria        estabelecimentos, '#13#10'mas s' +
              #243' cadastrou         . Dessa forma os dados n'#227'o est'#227'o'#13#10'corretos, ' +
              'impossibilitando o envio do DDE ao emulador.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DBText3: TDBText
            Left = 171
            Top = 10
            Width = 19
            Height = 14
            Alignment = taCenter
            DataField = 'QT_ESTAB_DESPACHO'
            DataSource = datm_dde.ds_dde
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label48: TLabel
            Left = 100
            Top = 23
            Width = 20
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Label48'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object shp1: TShape
            Left = 0
            Top = 0
            Width = 296
            Height = 57
            Align = alClient
            Brush.Style = bsClear
            Pen.Color = clGray
          end
        end
        object edt_cd_urf_embarque2: TDBEdit
          Left = 432
          Top = 67
          Width = 55
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          DataField = 'CD_URF_EMBARQUE'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 7
          OnChange = edt_cd_urf_embarque2Change
        end
        object edt_nm_exportador3: TEdit
          Left = 209
          Top = 36
          Width = 389
          Height = 21
          AutoSize = False
          Color = clSilver
          ReadOnly = True
          TabOrder = 3
        end
        object edt_cd_exportador3: TDBEdit
          Left = 153
          Top = 36
          Width = 55
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'CD_EXPORTADOR'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 2
          OnChange = edt_cd_exportador3Change
        end
        object edt_cd_urf_despacho2: TDBEdit
          Left = 97
          Top = 67
          Width = 55
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          DataField = 'CD_URF_DESPACHO'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 5
          OnChange = edt_cd_urf_despacho2Change
        end
        object dbedtDTDDE3: TDBEdit
          Left = 600
          Top = 12
          Width = 120
          Height = 21
          AutoSize = False
          Color = clSilver
          DataField = 'DT_DATA_SD'
          DataSource = datm_dde.ds_dde
          ReadOnly = True
          TabOrder = 15
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 1
    DesignSize = (
      740
      43)
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
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
      Left = 37
      Top = 4
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
      Left = 70
      Top = 4
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
      Left = 103
      Top = 4
      Width = 33
      Height = 34
      Hint = 'Excluir item'
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
      Left = 338
      Top = 4
      Width = 33
      Height = 34
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
    object Shape1: TShape
      Left = 374
      Top = 3
      Width = 362
      Height = 36
      Anchors = [akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object BtnGeraArquivo: TSpeedButton
      Left = 139
      Top = 4
      Width = 32
      Height = 34
      Hint = 'Gera arquivo para Siscomex'
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
      OnClick = BtnGeraArquivoClick
    end
    object BtnConsultaSiscomex: TSpeedButton
      Left = 173
      Top = 4
      Width = 32
      Height = 34
      Hint = 'Consulta DDE'
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
      OnClick = BtnConsultaSiscomexClick
    end
    object btnConsultaFila: TSpeedButton
      Left = 208
      Top = 4
      Width = 32
      Height = 34
      Hint = 'Consulta Fila de DDEs'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB03BB77F33FFFFFFF7377E0BF00000000
        33BB77FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnConsultaFilaClick
    end
    object noteNavegacao: TNotebook
      Left = 376
      Top = 7
      Width = 357
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
        end
        object Label72: TLabel
          Left = 205
          Top = 8
          Width = 38
          Height = 13
          Caption = 'Ordenar'
        end
        object edt_chave: TEdit
          Left = 67
          Top = 4
          Width = 131
          Height = 19
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edt_chaveChange
        end
        object cb_ordem: TComboBox
          Left = 248
          Top = 4
          Width = 107
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 1
          OnClick = cb_ordemClick
        end
      end
    end
  end
end

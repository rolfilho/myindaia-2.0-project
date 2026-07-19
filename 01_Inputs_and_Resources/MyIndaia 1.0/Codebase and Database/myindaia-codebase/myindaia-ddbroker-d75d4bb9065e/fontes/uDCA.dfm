object frmDCA: TfrmDCA
  Left = 391
  Top = 221
  Width = 753
  Height = 607
  Caption = 'Emiss'#227'o de DCA / MDGF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mmDCA
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 0
    Top = 45
    Width = 745
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 45
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      745
      45)
    object shp2: TShape
      Left = 581
      Top = 4
      Width = 160
      Height = 37
      Anchors = [akTop, akRight, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btnInsert: TSpeedButton
      Left = 4
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
      OnClick = btnInsertClick
    end
    object btnDelete: TSpeedButton
      Left = 115
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
      OnClick = btnDeleteClick
    end
    object btnClose: TSpeedButton
      Left = 542
      Top = 4
      Width = 37
      Height = 37
      Hint = 'Sair'
      Anchors = [akTop, akRight, akBottom]
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
      OnClick = btnCloseClick
    end
    object btnPost: TSpeedButton
      Left = 41
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
      OnClick = btnPostClick
    end
    object btnCancel: TSpeedButton
      Left = 78
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
      OnClick = btnCancelClick
    end
    object lblBusca: TLabel
      Left = 583
      Top = 5
      Width = 56
      Height = 13
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPrint: TSpeedButton
      Left = 156
      Top = 4
      Width = 37
      Height = 37
      Hint = 'Imprimir'
      Enabled = False
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
      OnClick = btnPrintClick
    end
    object shp1: TShape
      Left = 434
      Top = 9
      Width = 103
      Height = 28
      Anchors = [akTop, akRight, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp3: TShape
      Left = 644
      Top = 6
      Width = 10
      Height = 11
      Anchors = [akTop, akRight, akBottom]
      Brush.Color = 14548949
      Pen.Color = clGray
    end
    object dbnvgr: TDBNavigator
      Left = 436
      Top = 11
      Width = 100
      Height = 25
      DataSource = dsLista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight, akBottom]
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
    object edtBusca: TEdit
      Left = 584
      Top = 19
      Width = 154
      Height = 19
      Anchors = [akTop, akRight, akBottom]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnChange = edtBuscaChange
    end
  end
  object pgctrlDCA: TPageControl
    Left = 0
    Top = 50
    Width = 745
    Height = 511
    ActivePage = tsDados
    Align = alClient
    TabOrder = 1
    OnChange = pgctrlDCAChange
    OnChanging = pgctrlDCAChanging
    object tsLista: TTabSheet
      Caption = '    Lista    '
      object bvl2: TBevel
        Left = 0
        Top = 43
        Width = 734
        Height = 5
        Align = alTop
        Shape = bsSpacer
      end
      object dbgrdLista: TDBGrid
        Left = 0
        Top = 48
        Width = 734
        Height = 378
        Align = alClient
        Ctl3D = False
        DataSource = dsLista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = dbgrdListaTitleClick
        Columns = <
          item
            Color = 14548949
            Expanded = False
            FieldName = 'NR_PROC'
            Title.Caption = 'Processo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_TIPO_IMO'
            Title.Caption = 'Tipo Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_PROPER_SHIPPING'
            Title.Caption = 'Proper Shipping Name'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_CNTR_TYPE'
            Title.Caption = 'Cont'#226'iner'
            Width = 250
            Visible = True
          end>
      end
      object pnlUnidade: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 43
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object lbl1: TLabel
          Left = 8
          Top = 15
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
        object btnUnid: TSpeedButton
          Left = 334
          Top = 11
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
          OnClick = btnUnidClick
        end
        object edtCdUnid: TEdit
          Left = 61
          Top = 12
          Width = 35
          Height = 19
          Ctl3D = False
          MaxLength = 2
          ParentCtl3D = False
          TabOrder = 0
          OnChange = btnUnidClick
          OnExit = edtCdUnidExit
          OnKeyDown = edtCdUnidKeyDown
        end
        object edtNmUnid: TEdit
          Left = 97
          Top = 12
          Width = 234
          Height = 19
          TabStop = False
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object tsDados: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnlDados: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 483
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
        end
        object bvl3: TBevel
          Left = 2
          Top = 43
          Width = 733
          Height = 4
          Align = alTop
          Shape = bsSpacer
        end
        object pnlTopo: TPanel
          Left = 2
          Top = 2
          Width = 733
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object shp4: TShape
            Left = 0
            Top = 0
            Width = 733
            Height = 41
            Align = alClient
            Pen.Color = clGray
          end
          object lbl2: TLabel
            Left = 4
            Top = 4
            Width = 74
            Height = 13
            Caption = 'Nr. Processo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl3: TLabel
            Left = 303
            Top = 4
            Width = 27
            Height = 13
            Caption = 'Seq.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl4: TLabel
            Left = 158
            Top = 4
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object btnProcesso: TSpeedButton
            Left = 128
            Top = 16
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
            OnClick = btnProcessoClick
          end
          object dbedtSeq: TDBEdit
            Left = 303
            Top = 17
            Width = 44
            Height = 19
            Color = clMenu
            Ctl3D = False
            DataField = 'NR_SEQ_IMO'
            DataSource = dsDCA
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 2
          end
          object dblkcbbTpDocto: TDBLookupComboBox
            Left = 158
            Top = 17
            Width = 131
            Height = 19
            Ctl3D = False
            DataField = 'NR_TIPO_IMO'
            DataSource = dsDCA
            KeyField = 'NR_TIPO_IMO'
            ListField = 'TX_TIPO_IMO'
            ListSource = dsTpIMO
            ParentCtl3D = False
            TabOrder = 1
            OnClick = dblkcbbTpDoctoClick
          end
          object edtNrProcesso: TEdit
            Left = 5
            Top = 17
            Width = 121
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            OnExit = edtNrProcessoExit
          end
        end
        object nbDados: TNotebook
          Left = 2
          Top = 47
          Width = 733
          Height = 434
          Align = alClient
          TabOrder = 1
          object TPage
            Left = 0
            Top = 0
            Caption = 'Basicos'
            object lbl7: TLabel
              Left = 11
              Top = 4
              Width = 44
              Height = 13
              Caption = 'Shipper'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl8: TLabel
              Left = 11
              Top = 67
              Width = 92
              Height = 13
              Caption = 'Consignee Type'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl9: TLabel
              Left = 11
              Top = 36
              Width = 38
              Height = 13
              Caption = 'Carrier'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl10: TLabel
              Left = 517
              Top = 35
              Width = 38
              Height = 13
              Caption = 'Vessel'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl11: TLabel
              Left = 643
              Top = 68
              Width = 47
              Height = 13
              Caption = 'Booking'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl13: TLabel
              Left = 304
              Top = 4
              Width = 88
              Height = 13
              Caption = 'Port of Loading'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl14: TLabel
              Left = 517
              Top = 4
              Width = 100
              Height = 13
              Caption = 'Port of Discharge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl15: TLabel
              Left = 304
              Top = 36
              Width = 96
              Height = 13
              Caption = 'Final Destination'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl16: TLabel
              Left = 304
              Top = 101
              Width = 51
              Height = 13
              Caption = 'LCL/FCL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl17: TLabel
              Left = 480
              Top = 101
              Width = 77
              Height = 13
              Caption = 'Gross Weight'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl18: TLabel
              Left = 364
              Top = 101
              Width = 65
              Height = 13
              Caption = 'Net Weight'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl19: TLabel
              Left = 546
              Top = 68
              Width = 90
              Height = 13
              Caption = 'Voyage Number'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object btnConsignee: TSpeedButton
              Left = 270
              Top = 113
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
              OnClick = btnConsigneeClick
            end
            object lbl5: TLabel
              Left = 304
              Top = 68
              Width = 172
              Height = 13
              Caption = 'Container Type / Qty / GRWT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl6: TLabel
              Left = 11
              Top = 100
              Width = 60
              Height = 13
              Caption = 'Consignee'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lbl12: TLabel
              Left = 590
              Top = 100
              Width = 107
              Height = 13
              Caption = 'Shipper Reference'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object dbedtShipper: TDBEdit
              Left = 57
              Top = 17
              Width = 237
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_SHIPPER'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 6
            end
            object dbedtCarrier: TDBEdit
              Left = 57
              Top = 49
              Width = 237
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_CARRIER'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 7
            end
            object dbedtCdShipper: TDBEdit
              Left = 11
              Top = 17
              Width = 45
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'CD_SHIPPER'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 8
            end
            object dbedtCdConsignee: TDBEdit
              Left = 11
              Top = 114
              Width = 45
              Height = 19
              Ctl3D = False
              DataField = 'CD_CONSIGNEE'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 1
              OnChange = btnConsigneeClick
              OnExit = dbedtCdConsigneeExit
              OnKeyDown = edtCdUnidKeyDown
            end
            object dbedtCdCarrier: TDBEdit
              Left = 11
              Top = 49
              Width = 45
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'CD_CARRIER'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 9
            end
            object dbedtCdVessel: TDBEdit
              Left = 517
              Top = 48
              Width = 45
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'CD_VESSEL'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 10
            end
            object dbedtVessel: TDBEdit
              Left = 563
              Top = 48
              Width = 157
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_VESSEL'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 11
            end
            object dbedtBooking: TDBEdit
              Left = 643
              Top = 81
              Width = 77
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'BOOKING'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 12
            end
            object dbedtCdPortLoading: TDBEdit
              Left = 304
              Top = 17
              Width = 45
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'CD_PORT_LOADING'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 13
            end
            object dbedtPortLoading: TDBEdit
              Left = 350
              Top = 17
              Width = 157
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_PORT_LOADING'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 14
            end
            object dbedtCdPortDischarge: TDBEdit
              Left = 517
              Top = 17
              Width = 45
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'CD_PORT_DISCHARGE'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 15
            end
            object dbedtPortDischarge: TDBEdit
              Left = 563
              Top = 17
              Width = 157
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_PORT_DISCHARGE'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 16
            end
            object dbedtCdFinalDest: TDBEdit
              Left = 304
              Top = 48
              Width = 45
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'CD_FINAL_DESTINATION'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 17
            end
            object dbedtFinalDest: TDBEdit
              Left = 350
              Top = 48
              Width = 157
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_FINAL_DESTINATION'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 18
            end
            object dbedtEstufagem: TDBEdit
              Left = 304
              Top = 114
              Width = 53
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'ESTUFAGEM'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 19
            end
            object dbedtGrossWeight: TDBEdit
              Left = 480
              Top = 114
              Width = 103
              Height = 19
              Ctl3D = False
              DataField = 'VL_GROSS_WEIGHT'
              DataSource = dsDCA
              ParentCtl3D = False
              TabOrder = 5
              OnChange = dbedtGrossWeightChange
            end
            object dbedtNetWeight: TDBEdit
              Left = 365
              Top = 114
              Width = 107
              Height = 19
              Ctl3D = False
              DataField = 'VL_NET_WEIGHT'
              DataSource = dsDCA
              ParentCtl3D = False
              TabOrder = 4
            end
            object dbedtVoyage: TDBEdit
              Left = 546
              Top = 81
              Width = 91
              Height = 19
              Ctl3D = False
              DataField = 'NR_VOYAGE'
              DataSource = dsDCA
              ParentCtl3D = False
              TabOrder = 3
            end
            object dbedtCntrType: TDBEdit
              Left = 304
              Top = 81
              Width = 233
              Height = 19
              Ctl3D = False
              DataField = 'TX_CNTR_TYPE'
              DataSource = dsDCA
              ParentCtl3D = False
              TabOrder = 2
            end
            object dblkcbbConsignee: TDBLookupComboBox
              Left = 11
              Top = 81
              Width = 166
              Height = 19
              Ctl3D = False
              DataField = 'TP_CONSIGNEE'
              DataSource = dsDCA
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = dsTpConsignee
              ParentCtl3D = False
              TabOrder = 0
              OnExit = dblkcbbConsigneeExit
            end
            object nbDados2: TNotebook
              Left = 0
              Top = 139
              Width = 733
              Height = 295
              Align = alBottom
              TabOrder = 20
              object TPage
                Left = 0
                Top = 0
                Caption = 'DCA'
                object lbl20: TLabel
                  Left = 12
                  Top = 1
                  Width = 127
                  Height = 13
                  Caption = 'Proper Shipping Name'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl22: TLabel
                  Left = 12
                  Top = 34
                  Width = 158
                  Height = 13
                  Caption = 'Technical / Chemical Name'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl21: TLabel
                  Left = 305
                  Top = 32
                  Width = 120
                  Height = 13
                  Caption = 'Combiantion Packing'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl23: TLabel
                  Left = 305
                  Top = 65
                  Width = 82
                  Height = 13
                  Caption = 'Outer Packing'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl25: TLabel
                  Left = 174
                  Top = 219
                  Width = 103
                  Height = 13
                  Caption = 'Emergency Phone'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl26: TLabel
                  Left = 13
                  Top = 257
                  Width = 113
                  Height = 13
                  Caption = 'Responsible Person'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl27: TLabel
                  Left = 174
                  Top = 176
                  Width = 118
                  Height = 13
                  Caption = 'EMS/ MFAG Number'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object btnEMSMFAG: TSpeedButton
                  Left = 267
                  Top = 189
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
                  OnClick = btnEMSMFAGClick
                end
                object lbl28: TLabel
                  Left = 547
                  Top = -1
                  Width = 84
                  Height = 13
                  Caption = 'Last Inspecion'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl29: TLabel
                  Left = 639
                  Top = 0
                  Width = 86
                  Height = 13
                  Caption = 'Next Inspecion'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object shp5: TShape
                  Left = 305
                  Top = 166
                  Width = 412
                  Height = 36
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object lbl30: TLabel
                  Left = 315
                  Top = 175
                  Width = 82
                  Height = 13
                  Alignment = taRightJustify
                  Caption = ' Temperaturas'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                end
                object lbl31: TLabel
                  Left = 415
                  Top = 167
                  Width = 64
                  Height = 13
                  Caption = 'Flash Point'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl32: TLabel
                  Left = 489
                  Top = 167
                  Width = 41
                  Height = 13
                  Caption = 'Control'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl33: TLabel
                  Left = 636
                  Top = 167
                  Width = 51
                  Height = 13
                  Caption = 'Elevated'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl34: TLabel
                  Left = 563
                  Top = 167
                  Width = 63
                  Height = 13
                  Caption = 'Emergency'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl36: TLabel
                  Left = 594
                  Top = 130
                  Width = 102
                  Height = 13
                  Caption = 'Limited Quantities'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object Label1: TLabel
                  Left = 12
                  Top = 176
                  Width = 88
                  Height = 13
                  Caption = 'Subsidiary Risk'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl44: TLabel
                  Left = 306
                  Top = 0
                  Width = 72
                  Height = 13
                  Caption = 'Container ID'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl45: TLabel
                  Left = 304
                  Top = 97
                  Width = 80
                  Height = 13
                  Caption = 'Inner Packing'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl46: TLabel
                  Left = 306
                  Top = 129
                  Width = 86
                  Height = 13
                  Caption = 'Single Packing'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object Label2: TLabel
                  Left = 307
                  Top = 240
                  Width = 50
                  Height = 13
                  Caption = 'Remarks'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object Label3: TLabel
                  Left = 13
                  Top = 69
                  Width = 190
                  Height = 13
                  Caption = 'Technical / Chemical Description'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object dbedtProperShippingName: TDBEdit
                  Left = 12
                  Top = 14
                  Width = 283
                  Height = 19
                  Ctl3D = False
                  DataField = 'NM_PROPER_SHIPPING'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 0
                end
                object dbedtChemicalName: TDBEdit
                  Left = 12
                  Top = 46
                  Width = 283
                  Height = 19
                  Ctl3D = False
                  DataField = 'NM_CHEMICAL'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 1
                end
                object dbedtOuterPacking: TDBEdit
                  Left = 304
                  Top = 45
                  Width = 283
                  Height = 19
                  Ctl3D = False
                  DataField = 'TX_COMBINATION_PACK'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 5
                end
                object dbedtInnerPackng: TDBEdit
                  Left = 304
                  Top = 78
                  Width = 283
                  Height = 19
                  Ctl3D = False
                  DataField = 'TX_OUTER_PACK'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 6
                end
                object dbchkMarine: TDBCheckBox
                  Left = 595
                  Top = 110
                  Width = 116
                  Height = 21
                  Caption = 'Marine Pollutant'
                  DataField = 'FL_MARINE_POLLUTANT'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 10
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                  WordWrap = True
                end
                object dbedtPhone: TDBEdit
                  Left = 174
                  Top = 233
                  Width = 120
                  Height = 19
                  Ctl3D = False
                  DataField = 'TX_PHONE'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 13
                end
                object dbedtResponsible: TDBEdit
                  Left = 12
                  Top = 269
                  Width = 285
                  Height = 19
                  Ctl3D = False
                  DataField = 'NM_RESPONSIBLE_PERSON'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 14
                end
                object dbrgrpState: TDBRadioGroup
                  Left = 308
                  Top = 204
                  Width = 222
                  Height = 33
                  Caption = 'State of Aggregate'
                  Columns = 3
                  DataField = 'FL_STATE_AGGREGATE'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Items.Strings = (
                    'Liquid'
                    'Solid'
                    'Gaseous')
                  ParentFont = False
                  TabOrder = 19
                  Values.Strings = (
                    '0'
                    '1'
                    '2')
                end
                object dbedtLastInsp: TDBEdit
                  Left = 547
                  Top = 12
                  Width = 86
                  Height = 19
                  Ctl3D = False
                  DataField = 'DT_LAST_INSPECION'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 3
                  OnChange = dbedtLastInspChange
                end
                object dbedtNextInsp: TDBEdit
                  Left = 639
                  Top = 13
                  Width = 86
                  Height = 19
                  Ctl3D = False
                  DataField = 'DT_NEXT_INSPECION'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 4
                  OnChange = dbedtNextInspChange
                end
                object dbedtFlashPoint: TDBEdit
                  Left = 416
                  Top = 180
                  Width = 71
                  Height = 19
                  Ctl3D = False
                  DataField = 'VL_FLASH_POINT'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 15
                end
                object dbedtControlTemp: TDBEdit
                  Left = 490
                  Top = 180
                  Width = 71
                  Height = 19
                  Ctl3D = False
                  DataField = 'VL_CONTROL_TEMP'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 16
                end
                object dbedtEmergency: TDBEdit
                  Left = 637
                  Top = 180
                  Width = 71
                  Height = 19
                  Ctl3D = False
                  DataField = 'VL_ELEVATED_TEMP'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 18
                end
                object dbedtElevated: TDBEdit
                  Left = 564
                  Top = 180
                  Width = 71
                  Height = 19
                  Ctl3D = False
                  DataField = 'VL_EMERGENCY_TEMP'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 17
                end
                object dbedtLimitedQuant: TDBEdit
                  Left = 594
                  Top = 143
                  Width = 125
                  Height = 19
                  Ctl3D = False
                  DataField = 'VL_LIMITED_QUANTITIES'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 11
                end
                object dbrgrpPackingGroup: TDBRadioGroup
                  Left = 595
                  Top = 36
                  Width = 102
                  Height = 67
                  Caption = 'Packing Group'
                  DataField = 'FL_PACKING_GROUP'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Items.Strings = (
                    'I'
                    'II'
                    'III')
                  ParentFont = False
                  TabOrder = 9
                  Values.Strings = (
                    'I'
                    'II'
                    'III')
                end
                object DBRadioGroup1: TDBRadioGroup
                  Left = 556
                  Top = 204
                  Width = 165
                  Height = 33
                  Caption = 'Poison Inhalation Hazard'
                  Columns = 4
                  DataField = 'FL_POISON_HAZARD'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Items.Strings = (
                    'A'
                    'B'
                    'C'
                    'D')
                  ParentFont = False
                  TabOrder = 20
                  Values.Strings = (
                    'A'
                    'B'
                    'C'
                    'D')
                end
                object dbgrdRisk: TDBGrid
                  Left = 12
                  Top = 190
                  Width = 160
                  Height = 64
                  Ctl3D = False
                  DataSource = dsIMDG
                  Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
                  ParentCtl3D = False
                  TabOrder = 21
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = dbgrdRiskDblClick
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'NR_IMDG_CLASS'
                      Title.Caption = 'IMDG Class'
                      Width = 63
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NR_UN'
                      Title.Caption = 'UN Number'
                      Width = 66
                      Visible = True
                    end>
                end
                object dbedtNREmsMfag: TDBEdit
                  Left = 174
                  Top = 190
                  Width = 22
                  Height = 19
                  Ctl3D = False
                  DataField = 'NR_EMS_MFAG'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 12
                  OnChange = btnEMSMFAGClick
                  OnExit = dbedtNREmsMfagExit
                  OnKeyDown = edtCdUnidKeyDown
                end
                object edtEMSMFAG: TEdit
                  Left = 197
                  Top = 190
                  Width = 69
                  Height = 19
                  Color = clMenu
                  Ctl3D = False
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 22
                end
                object dbedtCntr2: TDBEdit
                  Left = 304
                  Top = 13
                  Width = 233
                  Height = 19
                  Ctl3D = False
                  DataField = 'NR_CNTR'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 2
                  OnChange = btnCntrClick
                  OnKeyDown = edtCdUnidKeyDown
                end
                object dbedtCombinationPack: TDBEdit
                  Left = 304
                  Top = 110
                  Width = 283
                  Height = 19
                  Ctl3D = False
                  DataField = 'TX_INNER_PACK'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 7
                end
                object dbedtSinglePack: TDBEdit
                  Left = 304
                  Top = 143
                  Width = 283
                  Height = 19
                  Ctl3D = False
                  DataField = 'TX_SINGLE_PACK'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 8
                end
                object DBMemo1: TDBMemo
                  Left = 307
                  Top = 253
                  Width = 414
                  Height = 36
                  DataField = 'TX_REMARKS'
                  DataSource = dsDCA
                  ScrollBars = ssVertical
                  TabOrder = 23
                end
                object dbmmotechnicalDescription: TDBMemo
                  Left = 13
                  Top = 81
                  Width = 283
                  Height = 89
                  DataField = 'TX_DESCRIPTION_GOODS'
                  DataSource = dsDCA
                  ScrollBars = ssVertical
                  TabOrder = 24
                end
              end
              object TPage
                Left = 0
                Top = 0
                HelpContext = 1
                Caption = 'MDGF'
                object lbl37: TLabel
                  Left = 10
                  Top = 38
                  Width = 120
                  Height = 13
                  Caption = 'Description of Goods'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl38: TLabel
                  Left = 549
                  Top = 3
                  Width = 173
                  Height = 13
                  Caption = 'Freight Forwarder'#180's Reference'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl39: TLabel
                  Left = 9
                  Top = 0
                  Width = 103
                  Height = 13
                  Caption = 'Name of Company'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object lbl40: TLabel
                  Left = 303
                  Top = 3
                  Width = 89
                  Height = 13
                  Caption = 'Place and Date'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object shp6: TShape
                  Left = 305
                  Top = 92
                  Width = 227
                  Height = 196
                  Brush.Style = bsClear
                  Pen.Color = clGray
                end
                object lbl24: TLabel
                  Left = 304
                  Top = 84
                  Width = 63
                  Height = 13
                  Caption = ' Container '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                end
                object lbl_tipo: TLabel
                  Left = 311
                  Top = 126
                  Width = 82
                  Height = 13
                  Caption = 'Type and Size'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl35: TLabel
                  Left = 311
                  Top = 168
                  Width = 33
                  Height = 13
                  Caption = 'Lacre'
                  FocusControl = dbedtSeal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnCntr: TSpeedButton
                  Left = 432
                  Top = 100
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
                  OnClick = btnCntrClick
                end
                object lbl41: TLabel
                  Left = 311
                  Top = 209
                  Width = 86
                  Height = 13
                  Caption = 'Tare Mass (kg)'
                  FocusControl = dbedtVlTare
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl43: TLabel
                  Left = 311
                  Top = 250
                  Width = 66
                  Height = 13
                  Caption = 'Total Gross'
                  FocusControl = dbedtGrossTotal
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl47: TLabel
                  Left = 303
                  Top = 46
                  Width = 105
                  Height = 13
                  Caption = 'Name of declarant'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object dbedtFreightForwardersRef: TDBEdit
                  Left = 550
                  Top = 16
                  Width = 111
                  Height = 19
                  Ctl3D = False
                  DataField = 'NR_FREIGHT_FORWARDERS_REF'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 0
                end
                object dbedtNameCompany: TDBEdit
                  Left = 9
                  Top = 13
                  Width = 286
                  Height = 19
                  Ctl3D = False
                  DataField = 'NM_COMPANY'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 1
                end
                object dbedtPlaceDate: TDBEdit
                  Left = 303
                  Top = 16
                  Width = 232
                  Height = 19
                  Ctl3D = False
                  DataField = 'TX_PLACE_DATE'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 2
                end
                object dbmmoDescription: TDBMemo
                  Left = 10
                  Top = 51
                  Width = 282
                  Height = 238
                  Ctl3D = False
                  DataField = 'TX_DESCRIPTION_GOODS'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  ScrollBars = ssVertical
                  TabOrder = 3
                end
                object dbedtNrCntr: TDBEdit
                  Left = 313
                  Top = 101
                  Width = 119
                  Height = 19
                  CharCase = ecUpperCase
                  Ctl3D = False
                  DataField = 'NR_CNTR'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 4
                  OnChange = btnCntrClick
                  OnKeyDown = edtCdUnidKeyDown
                end
                object dblkcbbTpCntr: TDBLookupComboBox
                  Left = 313
                  Top = 140
                  Width = 147
                  Height = 19
                  Ctl3D = False
                  DataField = 'TP_CNTR'
                  DataSource = dsDCA
                  DropDownRows = 5
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyField = 'TP_CNTR'
                  ListField = 'NM_TP_CNTR'
                  ListSource = dsTpCntr
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 5
                end
                object dbedtSeal: TDBEdit
                  Left = 313
                  Top = 181
                  Width = 147
                  Height = 19
                  Ctl3D = False
                  DataField = 'NR_LACRE'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 6
                end
                object dbedtVlTare: TDBEdit
                  Left = 313
                  Top = 222
                  Width = 80
                  Height = 19
                  Ctl3D = False
                  DataField = 'VL_TARE'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 7
                  OnChange = dbedtGrossWeightChange
                end
                object dbedtGrossTotal: TDBEdit
                  Left = 313
                  Top = 264
                  Width = 80
                  Height = 19
                  Ctl3D = False
                  DataField = 'VL_CNTR'
                  DataSource = dsDCA
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 8
                end
                object dbedtNmDeclarant: TDBEdit
                  Left = 304
                  Top = 59
                  Width = 230
                  Height = 19
                  Ctl3D = False
                  DataField = 'NM_RESPONSIBLE_PERSON'
                  DataSource = dsDCA
                  ParentCtl3D = False
                  TabOrder = 9
                end
              end
            end
            object dbedtRefeence: TDBEdit
              Left = 591
              Top = 114
              Width = 131
              Height = 19
              Color = clMenu
              Ctl3D = False
              DataField = 'PEDIDO'
              DataSource = dsDCA
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 21
            end
            object edtConsignee: TEdit
              Left = 57
              Top = 114
              Width = 211
              Height = 19
              Color = clMenu
              Ctl3D = False
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 22
            end
          end
          object TPage
            Left = 0
            Top = 0
            HelpContext = 3
            Caption = 'Vazio'
            object lbl42: TLabel
              Left = 134
              Top = 159
              Width = 456
              Height = 36
              Alignment = taCenter
              Caption = 
                'Escolha o Nr. de Processo, o tipo de Documento e salve as altera' +
                #231#245'es para habilita'#231#227'o dos demais campos!'
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
          end
        end
      end
    end
  end
  object mmDCA: TMainMenu
    Left = 284
    Top = 33
    object mniInsert: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = btnInsertClick
    end
    object mniPost: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btnPostClick
    end
    object mniCancel: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btnCancelClick
    end
    object mniDelete: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
      OnClick = btnDeleteClick
    end
    object mniClose: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btnCloseClick
    end
  end
  object qryLista: TQuery
    AfterOpen = qryListaAfterOpen
    AfterScroll = qryListaAfterOpen
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IMO.NR_PROCESSO, IMO.NR_SEQ_IMO, IMO.NR_TIPO_IMO,'
      '       SUBSTRING(IMO.NR_PROCESSO, 5, 14) AS NR_PROC,'
      '       T.TX_TIPO_IMO,'
      '       IMO.NM_PROPER_SHIPPING,'
      '       IMO.TX_CNTR_TYPE,'
      '       IMO.TX_REMARKS'
      '  FROM TPROCESSO_IMO IMO (NOLOCK)'
      
        ' INNER JOIN TTP_IMO   T (NOLOCK) ON IMO.NR_TIPO_IMO = T.NR_TIPO_' +
        'IMO'
      
        ' INNER JOIN TPROCESSO P (NOLOCK) ON IMO.NR_PROCESSO = P.NR_PROCE' +
        'SSO'
      ' WHERE P.CD_UNID_NEG = :UNID'
      '   AND P.CD_PRODUTO = '#39'02'#39)
    Left = 675
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'UNID'
        ParamType = ptInput
        Value = '01'
      end>
    object qryListaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 10
    end
    object qryListaNR_SEQ_IMO: TIntegerField
      FieldName = 'NR_SEQ_IMO'
    end
    object qryListaNR_TIPO_IMO: TIntegerField
      FieldName = 'NR_TIPO_IMO'
    end
    object qryListaNR_PROC: TStringField
      FieldName = 'NR_PROC'
      FixedChar = True
      Size = 10
    end
    object qryListaTX_TIPO_IMO: TStringField
      FieldName = 'TX_TIPO_IMO'
      FixedChar = True
    end
    object qryListaNM_PROPER_SHIPPING: TStringField
      FieldName = 'NM_PROPER_SHIPPING'
      FixedChar = True
      Size = 255
    end
    object qryListaTX_CNTR_TYPE: TStringField
      FieldName = 'TX_CNTR_TYPE'
      FixedChar = True
      Size = 200
    end
    object qryListaTX_REMARKS: TStringField
      FieldName = 'TX_REMARKS'
      FixedChar = True
      Size = 255
    end
  end
  object dsLista: TDataSource
    DataSet = qryLista
    Left = 645
    Top = 6
  end
  object dsDCA: TDataSource
    DataSet = qryDCA
    OnStateChange = dsDCAStateChange
    Left = 642
    Top = 71
  end
  object qryDCA: TQuery
    CachedUpdates = True
    AfterOpen = qryDCAAfterOpen
    AfterPost = qryDCAAfterDelete
    AfterDelete = qryDCAAfterDelete
    OnPostError = qryDCAPostError
    DatabaseName = 'DBBROKER'
    DataSource = dsLista
    SQL.Strings = (
      'SELECT I.*,'
      '       P.CD_CLIENTE AS CD_SHIPPER,'
      
        '       (SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = P.CD_CLIENTE) AS NM_SHIPPER,'
      '       P.CD_AGENTE AS CD_CARRIER,'
      
        '       (SELECT NM_AGENTE FROM TAGENTE (NOLOCK) WHERE CD_AGENTE =' +
        ' P.CD_AGENTE) AS NM_CARRIER,'
      
        '       (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WH' +
        'ERE NR_PROCESSO = I.NR_PROCESSO AND TP_REFERENCIA = '#39'05'#39') AS BOO' +
        'KING,'
      
        '       (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WH' +
        'ERE NR_PROCESSO = I.NR_PROCESSO AND TP_REFERENCIA = '#39'01'#39') AS PED' +
        'IDO,'
      '       P.CD_EMBARCACAO AS CD_VESSEL,'
      
        '       (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_' +
        'EMBARCACAO = P.CD_EMBARCACAO) AS NM_VESSEL,'
      
        '       (SELECT NR_VIAGEM_ARMADOR FROM TVIAGEM (NOLOCK) WHERE CD_' +
        'UNID_NEG = P.CD_UNID_NEG AND CD_PRODUTO = '#39'02'#39' AND CD_EMBARCACAO' +
        ' = P.CD_EMBARCACAO AND NR_VIAGEM = P.NR_VIAGEM) AS NR_VOYAGE,'
      '       P.CD_LOCAL_EMBARQUE AS CD_PORT_LOADING,'
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE COD' +
        'IGO = P.CD_LOCAL_EMBARQUE) AS NM_PORT_LOADING,'
      '       P.CD_LOCAL_DESEMBARQUE AS CD_PORT_DISCHARGE,'
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE COD' +
        'IGO = P.CD_LOCAL_DESEMBARQUE) AS NM_PORT_DISCHARGE,'
      '       P.CD_PAIS_DESTINO AS CD_FINAL_DESTINATION,'
      
        '       (SELECT NM_PAIS FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS ' +
        '= P.CD_PAIS_DESTINO) AS NM_FINAL_DESTINATION,'
      
        '       CASE ISNULL(P.TP_ESTUFAGEM, '#39#39') WHEN '#39'0'#39' THEN '#39'LCL'#39' WHEN ' +
        #39'1'#39' THEN '#39'FCL'#39' END AS ESTUFAGEM'
      '  FROM TPROCESSO_IMO I (NOLOCK)'
      
        ' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = I.NR_PROCESS' +
        'O'
      ' WHERE I.NR_PROCESSO = :NR_PROCESSO'
      '   AND I.NR_SEQ_IMO  = :NR_SEQ_IMO')
    UpdateObject = updDCA
    Left = 675
    Top = 71
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ_IMO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryDCANR_SEQ_IMO: TIntegerField
      FieldName = 'NR_SEQ_IMO'
    end
    object qryDCANR_TIPO_IMO: TIntegerField
      FieldName = 'NR_TIPO_IMO'
    end
    object qryDCATX_CNTR_TYPE: TStringField
      FieldName = 'TX_CNTR_TYPE'
      FixedChar = True
      Size = 200
    end
    object qryDCATX_OUTER_PACK: TStringField
      FieldName = 'TX_OUTER_PACK'
      FixedChar = True
      Size = 200
    end
    object qryDCATX_INNER_PACK: TStringField
      FieldName = 'TX_INNER_PACK'
      FixedChar = True
      Size = 200
    end
    object qryDCANM_PROPER_SHIPPING: TStringField
      FieldName = 'NM_PROPER_SHIPPING'
      FixedChar = True
      Size = 255
    end
    object qryDCANM_CHEMICAL: TStringField
      FieldName = 'NM_CHEMICAL'
      FixedChar = True
      Size = 255
    end
    object qryDCAFL_MARINE_POLLUTANT: TStringField
      FieldName = 'FL_MARINE_POLLUTANT'
      FixedChar = True
      Size = 1
    end
    object qryDCAFL_PACKING_GROUP: TStringField
      FieldName = 'FL_PACKING_GROUP'
      FixedChar = True
      Size = 3
    end
    object qryDCANR_EMS_MFAG: TIntegerField
      FieldName = 'NR_EMS_MFAG'
    end
    object qryDCATX_PHONE: TStringField
      FieldName = 'TX_PHONE'
      FixedChar = True
      Size = 15
    end
    object qryDCANM_RESPONSIBLE_PERSON: TStringField
      FieldName = 'NM_RESPONSIBLE_PERSON'
      FixedChar = True
      Size = 50
    end
    object qryDCAFL_STATE_AGGREGATE: TStringField
      FieldName = 'FL_STATE_AGGREGATE'
      FixedChar = True
      Size = 1
    end
    object qryDCADT_LAST_INSPECION: TDateTimeField
      FieldName = 'DT_LAST_INSPECION'
      OnSetText = qryDCADT_LAST_INSPECIONSetText
      EditMask = '99/99/9999;1;_'
    end
    object qryDCADT_NEXT_INSPECION: TDateTimeField
      FieldName = 'DT_NEXT_INSPECION'
      OnSetText = qryDCADT_LAST_INSPECIONSetText
      EditMask = '99/99/9999;1;_'
    end
    object qryDCAVL_GROSS_WEIGHT: TFloatField
      FieldName = 'VL_GROSS_WEIGHT'
    end
    object qryDCAVL_NET_WEIGHT: TFloatField
      FieldName = 'VL_NET_WEIGHT'
    end
    object qryDCAFL_POISON_HAZARD: TStringField
      FieldName = 'FL_POISON_HAZARD'
      FixedChar = True
      Size = 1
    end
    object qryDCAVL_LIMITED_QUANTITIES: TFloatField
      FieldName = 'VL_LIMITED_QUANTITIES'
    end
    object qryDCANR_FREIGHT_FORWARDERS_REF: TStringField
      FieldName = 'NR_FREIGHT_FORWARDERS_REF'
      FixedChar = True
      Size = 30
    end
    object qryDCANM_COMPANY: TStringField
      FieldName = 'NM_COMPANY'
      FixedChar = True
      Size = 100
    end
    object qryDCATX_PLACE_DATE: TStringField
      FieldName = 'TX_PLACE_DATE'
      FixedChar = True
      Size = 150
    end
    object qryDCACD_SHIPPER: TStringField
      FieldName = 'CD_SHIPPER'
      FixedChar = True
      Size = 5
    end
    object qryDCANM_SHIPPER: TStringField
      FieldName = 'NM_SHIPPER'
      FixedChar = True
      Size = 50
    end
    object qryDCACD_CARRIER: TStringField
      FieldName = 'CD_CARRIER'
      FixedChar = True
      Size = 4
    end
    object qryDCANM_CARRIER: TStringField
      FieldName = 'NM_CARRIER'
      FixedChar = True
      Size = 60
    end
    object qryDCABOOKING: TStringField
      FieldName = 'BOOKING'
      FixedChar = True
      Size = 15
    end
    object qryDCAPEDIDO: TStringField
      FieldName = 'PEDIDO'
      FixedChar = True
      Size = 15
    end
    object qryDCACD_VESSEL: TStringField
      FieldName = 'CD_VESSEL'
      FixedChar = True
      Size = 4
    end
    object qryDCANM_VESSEL: TStringField
      FieldName = 'NM_VESSEL'
      FixedChar = True
      Size = 40
    end
    object qryDCANR_VOYAGE: TStringField
      FieldName = 'NR_VOYAGE'
      FixedChar = True
      Size = 15
    end
    object qryDCANM_PORT_LOADING: TStringField
      FieldName = 'NM_PORT_LOADING'
      FixedChar = True
      Size = 50
    end
    object qryDCANM_PORT_DISCHARGE: TStringField
      FieldName = 'NM_PORT_DISCHARGE'
      FixedChar = True
      Size = 50
    end
    object qryDCANM_FINAL_DESTINATION: TStringField
      FieldName = 'NM_FINAL_DESTINATION'
      FixedChar = True
      Size = 120
    end
    object qryDCAESTUFAGEM: TStringField
      FieldName = 'ESTUFAGEM'
      FixedChar = True
      Size = 3
    end
    object qryDCACD_PORT_LOADING: TStringField
      FieldName = 'CD_PORT_LOADING'
      FixedChar = True
      Size = 4
    end
    object qryDCACD_PORT_DISCHARGE: TStringField
      FieldName = 'CD_PORT_DISCHARGE'
      FixedChar = True
      Size = 4
    end
    object qryDCACD_FINAL_DESTINATION: TStringField
      FieldName = 'CD_FINAL_DESTINATION'
      FixedChar = True
      Size = 3
    end
    object qryDCACD_CONSIGNEE: TStringField
      FieldName = 'CD_CONSIGNEE'
      FixedChar = True
      Size = 5
    end
    object qryDCANR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryDCATP_CONSIGNEE: TStringField
      FieldName = 'TP_CONSIGNEE'
      FixedChar = True
      Size = 1
    end
    object qryDCATP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qryDCANR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      FixedChar = True
    end
    object qryDCAVL_TARE: TFloatField
      FieldName = 'VL_TARE'
    end
    object qryDCAVL_CNTR: TFloatField
      FieldName = 'VL_CNTR'
    end
    object qryDCATX_DESCRIPTION_GOODS: TMemoField
      FieldName = 'TX_DESCRIPTION_GOODS'
      BlobType = ftMemo
    end
    object qryDCANR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
      Size = 150
    end
    object qryDCATX_COMBINATION_PACK: TStringField
      FieldName = 'TX_COMBINATION_PACK'
      FixedChar = True
      Size = 50
    end
    object qryDCATX_SINGLE_PACK: TStringField
      FieldName = 'TX_SINGLE_PACK'
      FixedChar = True
      Size = 200
    end
    object qryDCAVL_FLASH_POINT: TStringField
      FieldName = 'VL_FLASH_POINT'
      FixedChar = True
      Size = 15
    end
    object qryDCAVL_CONTROL_TEMP: TStringField
      FieldName = 'VL_CONTROL_TEMP'
      FixedChar = True
      Size = 15
    end
    object qryDCAVL_EMERGENCY_TEMP: TStringField
      FieldName = 'VL_EMERGENCY_TEMP'
      FixedChar = True
      Size = 15
    end
    object qryDCAVL_ELEVATED_TEMP: TStringField
      FieldName = 'VL_ELEVATED_TEMP'
      FixedChar = True
      Size = 15
    end
    object qryDCATX_REMARKS: TStringField
      FieldName = 'TX_REMARKS'
      FixedChar = True
      Size = 255
    end
  end
  object updDCA: TUpdateSQL
    ModifySQL.Strings = (
      'update tprocesso_IMO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_SEQ_IMO = :NR_SEQ_IMO,'
      '  NR_TIPO_IMO = :NR_TIPO_IMO,'
      '  TX_CNTR_TYPE = :TX_CNTR_TYPE,'
      '  TX_OUTER_PACK = :TX_OUTER_PACK,'
      '  TX_INNER_PACK = :TX_INNER_PACK,'
      '  NM_PROPER_SHIPPING = :NM_PROPER_SHIPPING,'
      '  NM_CHEMICAL = :NM_CHEMICAL,'
      '  VL_FLASH_POINT = :VL_FLASH_POINT,'
      '  FL_MARINE_POLLUTANT = :FL_MARINE_POLLUTANT,'
      '  FL_PACKING_GROUP = :FL_PACKING_GROUP,'
      '  NR_EMS_MFAG = :NR_EMS_MFAG,'
      '  TX_PHONE = :TX_PHONE,'
      '  NM_RESPONSIBLE_PERSON = :NM_RESPONSIBLE_PERSON,'
      '  FL_STATE_AGGREGATE = :FL_STATE_AGGREGATE,'
      '  DT_LAST_INSPECION = :DT_LAST_INSPECION,'
      '  DT_NEXT_INSPECION = :DT_NEXT_INSPECION,'
      '  VL_GROSS_WEIGHT = :VL_GROSS_WEIGHT,'
      '  VL_NET_WEIGHT = :VL_NET_WEIGHT,'
      '  FL_POISON_HAZARD = :FL_POISON_HAZARD,'
      '  VL_LIMITED_QUANTITIES = :VL_LIMITED_QUANTITIES,'
      '  VL_CONTROL_TEMP = :VL_CONTROL_TEMP,'
      '  VL_EMERGENCY_TEMP = :VL_EMERGENCY_TEMP,'
      '  VL_ELEVATED_TEMP = :VL_ELEVATED_TEMP,'
      '  TX_DESCRIPTION_GOODS = :TX_DESCRIPTION_GOODS,'
      '  NR_FREIGHT_FORWARDERS_REF = :NR_FREIGHT_FORWARDERS_REF,'
      '  NM_COMPANY = :NM_COMPANY,'
      '  TX_PLACE_DATE = :TX_PLACE_DATE,'
      '  CD_CONSIGNEE = :CD_CONSIGNEE,'
      '  TP_CONSIGNEE = :TP_CONSIGNEE,'
      '  NR_CNTR = :NR_CNTR,'
      '  TP_CNTR = :TP_CNTR,'
      '  NR_LACRE = :NR_LACRE,'
      '  VL_TARE = :VL_TARE,'
      '  VL_CNTR = :VL_CNTR,'
      '  TX_COMBINATION_PACK = :TX_COMBINATION_PACK,'
      '  TX_SINGLE_PACK = :TX_SINGLE_PACK,'
      '  TX_REMARKS = :TX_REMARKS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQ_IMO = :OLD_NR_SEQ_IMO')
    InsertSQL.Strings = (
      'insert into tprocesso_IMO'
      
        '  (NR_PROCESSO, NR_SEQ_IMO, NR_TIPO_IMO, TX_CNTR_TYPE, TX_OUTER_' +
        'PACK, TX_INNER_PACK, '
      
        '   NM_PROPER_SHIPPING, NM_CHEMICAL, VL_FLASH_POINT, FL_MARINE_PO' +
        'LLUTANT, '
      
        '   FL_PACKING_GROUP, NR_EMS_MFAG, TX_PHONE, NM_RESPONSIBLE_PERSO' +
        'N, FL_STATE_AGGREGATE, '
      
        '   DT_LAST_INSPECION, DT_NEXT_INSPECION, VL_GROSS_WEIGHT, VL_NET' +
        '_WEIGHT, '
      
        '   FL_POISON_HAZARD, VL_LIMITED_QUANTITIES, VL_CONTROL_TEMP, VL_' +
        'EMERGENCY_TEMP, '
      
        '   VL_ELEVATED_TEMP, TX_DESCRIPTION_GOODS, NR_FREIGHT_FORWARDERS' +
        '_REF, NM_COMPANY, '
      
        '   TX_PLACE_DATE, CD_CONSIGNEE, TP_CONSIGNEE, NR_CNTR, TP_CNTR, ' +
        'NR_LACRE, '
      
        '   VL_TARE, VL_CNTR, TX_COMBINATION_PACK, TX_SINGLE_PACK, TX_REM' +
        'ARKS)'
      'values'
      
        '  (:NR_PROCESSO, :NR_SEQ_IMO, :NR_TIPO_IMO, :TX_CNTR_TYPE, :TX_O' +
        'UTER_PACK, '
      
        '   :TX_INNER_PACK, :NM_PROPER_SHIPPING, :NM_CHEMICAL, :VL_FLASH_' +
        'POINT, '
      
        '   :FL_MARINE_POLLUTANT, :FL_PACKING_GROUP, :NR_EMS_MFAG, :TX_PH' +
        'ONE, :NM_RESPONSIBLE_PERSON, '
      
        '   :FL_STATE_AGGREGATE, :DT_LAST_INSPECION, :DT_NEXT_INSPECION, ' +
        ':VL_GROSS_WEIGHT, '
      
        '   :VL_NET_WEIGHT, :FL_POISON_HAZARD, :VL_LIMITED_QUANTITIES, :V' +
        'L_CONTROL_TEMP, '
      
        '   :VL_EMERGENCY_TEMP, :VL_ELEVATED_TEMP, :TX_DESCRIPTION_GOODS,' +
        ' :NR_FREIGHT_FORWARDERS_REF, '
      
        '   :NM_COMPANY, :TX_PLACE_DATE, :CD_CONSIGNEE, :TP_CONSIGNEE, :N' +
        'R_CNTR, '
      
        '   :TP_CNTR, :NR_LACRE, :VL_TARE, :VL_CNTR, :TX_COMBINATION_PACK' +
        ', :TX_SINGLE_PACK, '
      '   :TX_REMARKS)')
    DeleteSQL.Strings = (
      'delete from tprocesso_IMO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQ_IMO = :OLD_NR_SEQ_IMO')
    Left = 706
    Top = 72
  end
  object dsIMDG: TDataSource
    DataSet = qryIMDG
    Left = 641
    Top = 40
  end
  object qryIMDG: TQuery
    CachedUpdates = True
    BeforePost = qryIMDGBeforePost
    AfterPost = qryIMDGAfterPost
    AfterDelete = qryIMDGAfterDelete
    OnPostError = qryIMDGPostError
    DatabaseName = 'DBBROKER'
    DataSource = dsDCA
    SQL.Strings = (
      'SELECT I.*, IC.TX_PORTUGUES'
      '  FROM TPROCESSO_IMO_IMDG I (NOLOCK)'
      
        ' INNER JOIN TTP_IMDG_CLASS IC (NOLOCK) ON IC.NR_IMDG_CLASS = I.N' +
        'R_IMDG_CLASS'
      ' WHERE I.NR_PROCESSO = :NR_PROCESSO'
      '   AND I.NR_SEQ_IMO  = :NR_SEQ_IMO')
    UpdateObject = updIMDG
    Left = 671
    Top = 38
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ_IMO'
        ParamType = ptInput
        Size = 4
      end>
    object qryIMDGNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryIMDGNR_SEQ_IMO: TIntegerField
      FieldName = 'NR_SEQ_IMO'
    end
    object qryIMDGNR_SEQ: TIntegerField
      FieldName = 'NR_SEQ'
    end
    object qryIMDGNR_IMDG_CLASS: TStringField
      FieldName = 'NR_IMDG_CLASS'
      FixedChar = True
      Size = 3
    end
    object qryIMDGNR_UN: TIntegerField
      FieldName = 'NR_UN'
    end
    object qryIMDGTX_PORTUGUES: TStringField
      FieldName = 'TX_PORTUGUES'
      FixedChar = True
      Size = 255
    end
  end
  object dsTpIMO: TDataSource
    DataSet = qryTpIMO
    Left = 217
    Top = 3
  end
  object qryTpIMO: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_IMO')
    Left = 251
    Top = 3
    object qryTpIMONR_TIPO_IMO: TIntegerField
      FieldName = 'NR_TIPO_IMO'
      Origin = 'DBBROKER.TTP_IMO.NR_TIPO_IMO'
    end
    object qryTpIMOTX_TIPO_IMO: TStringField
      FieldName = 'TX_TIPO_IMO'
      Origin = 'DBBROKER.TTP_IMO.TX_TIPO_IMO'
      FixedChar = True
    end
  end
  object dsTpConsignee: TDataSource
    DataSet = tblTpConsignee
    Left = 301
    Top = 107
  end
  object tblTpConsignee: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TTP_PESSOA_EXP'
    Left = 319
    Top = 3
    object tblTpConsigneeCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 1
    end
    object tblTpConsigneeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 40
    end
  end
  object updIMDG: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_IMO_IMDG'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_SEQ_IMO = :NR_SEQ_IMO,'
      '  NR_SEQ = :NR_SEQ,'
      '  NR_IMDG_CLASS = :NR_IMDG_CLASS,'
      '  NR_UN = :NR_UN'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQ_IMO = :OLD_NR_SEQ_IMO and'
      '  NR_SEQ = :OLD_NR_SEQ')
    InsertSQL.Strings = (
      'insert into TPROCESSO_IMO_IMDG'
      '  (NR_PROCESSO, NR_SEQ_IMO, NR_SEQ, NR_IMDG_CLASS, NR_UN)'
      'values'
      '  (:NR_PROCESSO, :NR_SEQ_IMO, :NR_SEQ, :NR_IMDG_CLASS, :NR_UN)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_IMO_IMDG'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQ_IMO = :OLD_NR_SEQ_IMO and'
      '  NR_SEQ = :OLD_NR_SEQ')
    Left = 704
    Top = 39
  end
  object dsTpCntr: TDataSource
    DataSet = qryTpCntr
    Left = 217
    Top = 33
  end
  object qryTpCntr: TQuery
    BeforePost = qryIMDGBeforePost
    AfterPost = qryIMDGAfterPost
    AfterDelete = qryIMDGAfterDelete
    OnPostError = qryIMDGPostError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR'
      '  FROM TTP_CNTR'
      ' WHERE TP_CNTR <> '#39'01'#39
      '   AND IN_ATIVO = '#39'1'#39)
    Left = 251
    Top = 33
    object qryTpCntrTP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qryTpCntrNM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.NM_TP_CNTR'
      FixedChar = True
    end
  end
  object dsRel: TDataSource
    DataSet = qryRel
    Left = 358
    Top = 2
  end
  object qryRel: TQuery
    OnCalcFields = qryRelCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.TX_OUTER_PACK + '#39' - NET WEIGHT : '#39' + convert(char,I.VL_' +
        'NET_WEIGHT) as TX_OUTER_PACK,  '
      '       I.*,'
      '       SUBSTRING(I.NR_PROCESSO, 5, 14) AS NR_PROC,'
      '       EN.NM_EMPRESA AS SHIPPER_NAME,'
      '       ISNULL(EN.END_EMPRESA, '#39#39') AS SHIPPER_END,'
      '       ISNULL(EN.END_NUMERO, '#39#39')  AS SHIPPER_NUM,'
      '       ISNULL(EN.END_BAIRRO, '#39#39')  AS SHIPPER_BAIRRO,'
      '       ISNULL(EN.END_CIDADE, '#39#39')  AS SHIPPER_CID,'
      '       ISNULL(EN.END_UF, '#39#39')      AS SHIPPER_UF,'
      '       ISNULL(EN.NR_TELEFONE, '#39#39') AS SHIPPER_TEL,'
      '       ISNULL(EN.NR_FAX, '#39#39')      AS SHIPPER_FAX,'
      
        '       CASE ISNULL(EN.END_CEP, '#39#39') WHEN '#39#39' THEN '#39#39' ELSE  SUBSTRI' +
        'NG(ISNULL(EN.END_CEP, '#39#39'), 1,5) + '#39'-'#39' + SUBSTRING(ISNULL(EN.END_' +
        'CEP, '#39#39'), 6,3) END AS SHIPPER_CEP,'
      '       CASE'
      
        '        WHEN I.TP_CONSIGNEE IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT NM_EMP' +
        'RESA FROM TEMPRESA_EST EE1 (NOLOCK) WHERE EE1.CD_EMPRESA = I.CD_' +
        'CONSIGNEE)'
      
        '        WHEN I.TP_CONSIGNEE = '#39'2'#39' THEN (SELECT DESCRICAO FROM TT' +
        'RANSPORTADOR_ITL (NOLOCK) WHERE CODIGO = I.CD_CONSIGNEE)'
      
        '        WHEN I.TP_CONSIGNEE = '#39'4'#39' THEN (SELECT NM_DESPACHANTE FR' +
        'OM TDESPACHANTE (NOLOCK) WHERE CD_DESPACHANTE = I.CD_CONSIGNEE)'
      '        ELSE '#39#39
      '       END AS CONSIGNEE_NAME,'
      '       CASE'
      
        '        WHEN I.TP_CONSIGNEE IN ('#39'0'#39','#39'1'#39','#39'3'#39') THEN (SELECT ISNULL' +
        '(END_NUMERO, '#39#39')+'#39' '#39'+ISNULL(END_EMPRESA,'#39#39')+'#39' '#39'+ISNULL(END_COMPL' +
        ','#39#39') FROM TEMPRESA_EST EE2 (NOLOCK) WHERE EE2.CD_EMPRESA = I.CD_' +
        'CONSIGNEE)'
      
        '        WHEN I.TP_CONSIGNEE = '#39'2'#39' THEN (SELECT END_CIA_TRANSP FR' +
        'OM TTRANSPORTADOR_ITL (NOLOCK) WHERE CODIGO = I.CD_CONSIGNEE)'
      '        ELSE '#39#39
      '       END AS CONSIGNEE_END,'
      '       CASE'
      
        '        WHEN I.TP_CONSIGNEE IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN (SELECT NM_P' +
        'AIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_P' +
        'AIS FROM TEMPRESA_EST EE4 (NOLOCK) WHERE EE4.CD_EMPRESA = I.CD_C' +
        'ONSIGNEE))'
      
        '        WHEN I.TP_CONSIGNEE = '#39'2'#39' THEN (SELECT NM_PAIS_ING FROM ' +
        'TPAIS_BROKER (NOLOCK)  WHERE CD_PAIS = (SELECT CD_PAIS FROM TTRA' +
        'NSPORTADOR_ITL TI2 (NOLOCK) WHERE TI2.CODIGO = I.CD_CONSIGNEE))'
      '        ELSE '#39#39
      '       END AS CONSIGNEE_PAIS,'
      '      CASE'
      
        '       WHEN I.TP_CONSIGNEE IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN (SELECT ISNUL' +
        'L(END_CIDADE, '#39#39') FROM TEMPRESA_EST  EE6 (NOLOCK) WHERE EE6.CD_E' +
        'MPRESA = I.CD_CONSIGNEE)'
      
        '       WHEN I.TP_CONSIGNEE = '#39'2'#39' THEN (SELECT CD_CIDADE FROM TTR' +
        'ANSPORTADOR_ITL WHERE CODIGO = I.CD_CONSIGNEE)'
      '       ELSE '#39#39
      '      END AS CONSIGNEE_CID,'
      
        '      (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMPRESA_EST EE7 (NOLO' +
        'CK) WHERE EE7.CD_EMPRESA = I.CD_CONSIGNEE) AS CONSIGNEE_UF,'
      '       V.NR_VIAGEM_ARMADOR AS NR_VOYAGE,'
      '       CASE ISNULL(V.NR_VIAGEM_ARMADOR, '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NO' +
        'LOCK) WHERE CD_EMBARCACAO = P.CD_EMBARCACAO)'
      
        '         ELSE (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WH' +
        'ERE CD_EMBARCACAO = P.CD_EMBARCACAO) + '#39' Vg. '#39' + V.NR_VIAGEM_ARM' +
        'ADOR'
      '       END AS VESSEL_VOYAGE,'
      
        '       CASE ISNULL(I.FL_MARINE_POLLUTANT, '#39'0'#39') WHEN '#39'1'#39' THEN '#39'YE' +
        'S'#39' ELSE '#39'NO'#39' END AS MARINE,'
      
        '       CASE ISNULL(I.FL_STATE_AGGREGATE, '#39#39') WHEN '#39'0'#39' THEN '#39'LIQU' +
        'ID'#39' WHEN '#39'1'#39' THEN '#39'SOLID'#39' WHEN '#39'2'#39' THEN '#39'GASEOUS'#39' ELSE '#39#39' END AS' +
        ' ESTADO,'
      '       CASE ISNULL(I.TX_PHONE, '#39#39')'
      '         WHEN '#39#39' THEN I.NM_RESPONSIBLE_PERSON'
      
        '         ELSE CASE ISNULL(I.NM_RESPONSIBLE_PERSON, '#39#39') WHEN '#39#39' T' +
        'HEN I.TX_PHONE ELSE I.TX_PHONE + '#39' / '#39' + I.NM_RESPONSIBLE_PERSON' +
        ' END'
      '       END AS TEL_RESP,'
      
        '       (SELECT TX_EMS_MFAG FROM TTP_EMS_MFAG E (NOLOCK) WHERE E.' +
        'NR_EMS_MFAG = I.NR_EMS_MFAG) AS EMSMFAG,'
      ''
      
        '       (SELECT NM_AGENTE FROM TAGENTE (NOLOCK) WHERE CD_AGENTE =' +
        ' P.CD_AGENTE) AS NM_CARRIER,'
      
        '       (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WH' +
        'ERE NR_PROCESSO = I.NR_PROCESSO AND TP_REFERENCIA = '#39'05'#39') AS BOO' +
        'KING,'
      
        '       (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WH' +
        'ERE NR_PROCESSO = I.NR_PROCESSO AND TP_REFERENCIA = '#39'01'#39') AS PED' +
        'IDO,'
      
        '       (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) WHERE CD_' +
        'EMBARCACAO = P.CD_EMBARCACAO) AS NM_VESSEL,'
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE COD' +
        'IGO = P.CD_LOCAL_EMBARQUE) AS NM_PORT_LOADING,'
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE COD' +
        'IGO = P.CD_LOCAL_DESEMBARQUE) AS NM_PORT_DISCHARGE,'
      
        '       (SELECT NM_PAIS FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS ' +
        '= P.CD_PAIS_DESTINO) AS NM_FINAL_DESTINATION,'
      
        '       CASE ISNULL(P.TP_ESTUFAGEM, '#39#39') WHEN '#39'0'#39' THEN '#39'LCL'#39' WHEN ' +
        #39'1'#39' THEN '#39'FCL'#39' END AS ESTUFAGEM'
      '  FROM TPROCESSO_IMO I (NOLOCK)'
      
        ' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = I.NR_PROCESS' +
        'O'
      
        ' LEFT  JOIN TVIAGEM V (NOLOCK) ON V.CD_UNID_NEG = P.CD_UNID_NEG ' +
        'AND V.CD_PRODUTO = '#39'02'#39' AND V.CD_EMBARCACAO = P.CD_EMBARCACAO AN' +
        'D V.NR_VIAGEM = P.NR_VIAGEM'
      
        ' LEFT  JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLI' +
        'ENTE'
      ' WHERE I.NR_PROCESSO = :NR_PROCESSO'
      '   AND I.NR_SEQ_IMO  = :NR_SEQ_IMO')
    Left = 390
    Top = 3
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ_IMO'
        ParamType = ptInput
        Size = 4
      end>
    object qryRelNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryRelNR_SEQ_IMO: TIntegerField
      FieldName = 'NR_SEQ_IMO'
    end
    object qryRelNR_TIPO_IMO: TIntegerField
      FieldName = 'NR_TIPO_IMO'
    end
    object qryRelTX_CNTR_TYPE: TStringField
      FieldName = 'TX_CNTR_TYPE'
      FixedChar = True
      Size = 200
    end
    object qryRelTX_OUTER_PACK: TStringField
      FieldName = 'TX_OUTER_PACK'
      FixedChar = True
      Size = 200
    end
    object qryRelTX_INNER_PACK: TStringField
      FieldName = 'TX_INNER_PACK'
      FixedChar = True
      Size = 200
    end
    object qryRelNM_PROPER_SHIPPING: TStringField
      FieldName = 'NM_PROPER_SHIPPING'
      FixedChar = True
      Size = 255
    end
    object qryRelNM_CHEMICAL: TStringField
      FieldName = 'NM_CHEMICAL'
      FixedChar = True
      Size = 255
    end
    object qryRelFL_MARINE_POLLUTANT: TStringField
      FieldName = 'FL_MARINE_POLLUTANT'
      FixedChar = True
      Size = 1
    end
    object qryRelFL_PACKING_GROUP: TStringField
      FieldName = 'FL_PACKING_GROUP'
      FixedChar = True
      Size = 3
    end
    object qryRelNR_EMS_MFAG: TIntegerField
      FieldName = 'NR_EMS_MFAG'
    end
    object qryRelTX_PHONE: TStringField
      FieldName = 'TX_PHONE'
      FixedChar = True
      Size = 15
    end
    object qryRelNM_RESPONSIBLE_PERSON: TStringField
      FieldName = 'NM_RESPONSIBLE_PERSON'
      FixedChar = True
      Size = 50
    end
    object qryRelFL_STATE_AGGREGATE: TStringField
      FieldName = 'FL_STATE_AGGREGATE'
      FixedChar = True
      Size = 1
    end
    object qryRelDT_LAST_INSPECION: TDateTimeField
      FieldName = 'DT_LAST_INSPECION'
    end
    object qryRelDT_NEXT_INSPECION: TDateTimeField
      FieldName = 'DT_NEXT_INSPECION'
    end
    object qryRelVL_GROSS_WEIGHT: TFloatField
      DefaultExpression = '#0.,000'
      FieldName = 'VL_GROSS_WEIGHT'
    end
    object qryRelVL_NET_WEIGHT: TFloatField
      DefaultExpression = '#0.,000'
      FieldName = 'VL_NET_WEIGHT'
    end
    object qryRelFL_POISON_HAZARD: TStringField
      FieldName = 'FL_POISON_HAZARD'
      FixedChar = True
      Size = 1
    end
    object qryRelVL_LIMITED_QUANTITIES: TFloatField
      FieldName = 'VL_LIMITED_QUANTITIES'
    end
    object qryRelTX_DESCRIPTION_GOODS: TMemoField
      FieldName = 'TX_DESCRIPTION_GOODS'
      BlobType = ftMemo
    end
    object qryRelNR_FREIGHT_FORWARDERS_REF: TStringField
      FieldName = 'NR_FREIGHT_FORWARDERS_REF'
      FixedChar = True
      Size = 30
    end
    object qryRelNM_COMPANY: TStringField
      FieldName = 'NM_COMPANY'
      FixedChar = True
      Size = 100
    end
    object qryRelTX_PLACE_DATE: TStringField
      FieldName = 'TX_PLACE_DATE'
      FixedChar = True
      Size = 150
    end
    object qryRelCD_CONSIGNEE: TStringField
      FieldName = 'CD_CONSIGNEE'
      FixedChar = True
      Size = 5
    end
    object qryRelTP_CONSIGNEE: TStringField
      FieldName = 'TP_CONSIGNEE'
      FixedChar = True
      Size = 1
    end
    object qryRelTP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qryRelNR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      FixedChar = True
    end
    object qryRelVL_TARE: TFloatField
      FieldName = 'VL_TARE'
      DisplayFormat = '#0.,00'
    end
    object qryRelVL_CNTR: TFloatField
      FieldName = 'VL_CNTR'
      DisplayFormat = '#0.,00'
    end
    object qryRelMARINE: TStringField
      FieldName = 'MARINE'
      FixedChar = True
      Size = 3
    end
    object qryRelESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 6
    end
    object qryRelTEL_RESP: TStringField
      FieldName = 'TEL_RESP'
      FixedChar = True
      Size = 68
    end
    object qryRelEMSMFAG: TStringField
      FieldName = 'EMSMFAG'
      FixedChar = True
      Size = 10
    end
    object qryRelNM_CARRIER: TStringField
      FieldName = 'NM_CARRIER'
      FixedChar = True
      Size = 60
    end
    object qryRelBOOKING: TStringField
      FieldName = 'BOOKING'
      FixedChar = True
      Size = 15
    end
    object qryRelPEDIDO: TStringField
      FieldName = 'PEDIDO'
      FixedChar = True
      Size = 15
    end
    object qryRelNM_VESSEL: TStringField
      FieldName = 'NM_VESSEL'
      FixedChar = True
      Size = 40
    end
    object qryRelNR_VOYAGE: TStringField
      FieldName = 'NR_VOYAGE'
      FixedChar = True
      Size = 15
    end
    object qryRelNM_PORT_LOADING: TStringField
      FieldName = 'NM_PORT_LOADING'
      FixedChar = True
      Size = 50
    end
    object qryRelNM_PORT_DISCHARGE: TStringField
      FieldName = 'NM_PORT_DISCHARGE'
      FixedChar = True
      Size = 50
    end
    object qryRelNM_FINAL_DESTINATION: TStringField
      FieldName = 'NM_FINAL_DESTINATION'
      FixedChar = True
      Size = 120
    end
    object qryRelESTUFAGEM: TStringField
      FieldName = 'ESTUFAGEM'
      FixedChar = True
      Size = 3
    end
    object qryRelNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
      Size = 150
    end
    object qryRelSHIPPER_NAME: TStringField
      FieldName = 'SHIPPER_NAME'
      FixedChar = True
      Size = 50
    end
    object qryRelSHIPPER_END: TStringField
      FieldName = 'SHIPPER_END'
      FixedChar = True
      Size = 50
    end
    object qryRelSHIPPER_NUM: TStringField
      FieldName = 'SHIPPER_NUM'
      FixedChar = True
      Size = 6
    end
    object qryRelSHIPPER_CID: TStringField
      FieldName = 'SHIPPER_CID'
      FixedChar = True
      Size = 30
    end
    object qryRelSHIPPER_UF: TStringField
      FieldName = 'SHIPPER_UF'
      FixedChar = True
      Size = 2
    end
    object qryRelSHIPPER_TEL: TStringField
      FieldName = 'SHIPPER_TEL'
      FixedChar = True
      Size = 15
    end
    object qryRelSHIPPER_FAX: TStringField
      FieldName = 'SHIPPER_FAX'
      FixedChar = True
      Size = 15
    end
    object qryRelSHIPPER_CEP: TStringField
      FieldName = 'SHIPPER_CEP'
      FixedChar = True
      Size = 9
    end
    object qryRelCONSIGNEE_NAME: TStringField
      FieldName = 'CONSIGNEE_NAME'
      FixedChar = True
      Size = 60
    end
    object qryRelCONSIGNEE_END: TStringField
      FieldName = 'CONSIGNEE_END'
      FixedChar = True
      Size = 109
    end
    object qryRelCONSIGNEE_PAIS: TStringField
      FieldName = 'CONSIGNEE_PAIS'
      FixedChar = True
      Size = 50
    end
    object qryRelCONSIGNEE_CID: TStringField
      FieldName = 'CONSIGNEE_CID'
      FixedChar = True
      Size = 30
    end
    object qryRelCONSIGNEE_UF: TStringField
      FieldName = 'CONSIGNEE_UF'
      FixedChar = True
      Size = 30
    end
    object qryRelVESSEL_VOYAGE: TStringField
      FieldName = 'VESSEL_VOYAGE'
      FixedChar = True
      Size = 60
    end
    object qryRelSHIPPER_BAIRRO: TStringField
      FieldName = 'SHIPPER_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qryRelSHIPPER_END1: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHIPPER_END1'
      Size = 255
      Calculated = True
    end
    object qryRelSHIPPER_END2: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHIPPER_END2'
      Size = 255
      Calculated = True
    end
    object qryRelSHIPPER_END3: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHIPPER_END3'
      Size = 255
      Calculated = True
    end
    object qryRelSHIPPER_END4: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHIPPER_END4'
      Size = 255
      Calculated = True
    end
    object qryRelSHIPPER_END5: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHIPPER_END5'
      Size = 255
      Calculated = True
    end
    object qryRelSHIPPER_END6: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHIPPER_END6'
      Size = 255
      Calculated = True
    end
    object qryRelSHIPPER_END7: TStringField
      FieldKind = fkCalculated
      FieldName = 'SHIPPER_END7'
      Size = 255
      Calculated = True
    end
    object qryRelCONSIGNEE_END1: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONSIGNEE_END1'
      Size = 255
      Calculated = True
    end
    object qryRelCONSIGNEE_END2: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONSIGNEE_END2'
      Size = 255
      Calculated = True
    end
    object qryRelTX_COMBINATION_PACK: TStringField
      FieldName = 'TX_COMBINATION_PACK'
      FixedChar = True
      Size = 50
    end
    object qryRelTX_SINGLE_PACK: TStringField
      FieldName = 'TX_SINGLE_PACK'
      FixedChar = True
      Size = 200
    end
    object qryRelcalcIMDG: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcIMDG'
      Size = 255
      Calculated = True
    end
    object qryRelNR_PROC: TStringField
      FieldName = 'NR_PROC'
      FixedChar = True
      Size = 14
    end
    object qryRelVL_FLASH_POINT: TStringField
      FieldName = 'VL_FLASH_POINT'
      FixedChar = True
      Size = 15
    end
    object qryRelVL_CONTROL_TEMP: TStringField
      FieldName = 'VL_CONTROL_TEMP'
      FixedChar = True
      Size = 15
    end
    object qryRelVL_EMERGENCY_TEMP: TStringField
      FieldName = 'VL_EMERGENCY_TEMP'
      FixedChar = True
      Size = 15
    end
    object qryRelVL_ELEVATED_TEMP: TStringField
      FieldName = 'VL_ELEVATED_TEMP'
      FixedChar = True
      Size = 15
    end
    object qryRelTX_OUTER_PACK_1: TStringField
      FieldName = 'TX_OUTER_PACK_1'
      FixedChar = True
      Size = 200
    end
    object qryRelTX_REMARKS: TStringField
      FieldName = 'TX_REMARKS'
      FixedChar = True
      Size = 255
    end
  end
  object BDERel: TppBDEPipeline
    DataSource = dsRel
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDERel'
    Left = 424
    Top = 3
    object BDERelppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDERelppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_SEQ_IMO'
      FieldName = 'NR_SEQ_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object BDERelppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_TIPO_IMO'
      FieldName = 'NR_TIPO_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object BDERelppField4: TppField
      FieldAlias = 'TX_CNTR_TYPE'
      FieldName = 'TX_CNTR_TYPE'
      FieldLength = 200
      DisplayWidth = 200
      Position = 3
    end
    object BDERelppField5: TppField
      FieldAlias = 'TX_OUTER_PACK'
      FieldName = 'TX_OUTER_PACK'
      FieldLength = 200
      DisplayWidth = 200
      Position = 4
    end
    object BDERelppField6: TppField
      FieldAlias = 'TX_INNER_PACK'
      FieldName = 'TX_INNER_PACK'
      FieldLength = 200
      DisplayWidth = 200
      Position = 5
    end
    object BDERelppField7: TppField
      FieldAlias = 'NM_PROPER_SHIPPING'
      FieldName = 'NM_PROPER_SHIPPING'
      FieldLength = 255
      DisplayWidth = 255
      Position = 6
    end
    object BDERelppField8: TppField
      FieldAlias = 'NM_CHEMICAL'
      FieldName = 'NM_CHEMICAL'
      FieldLength = 255
      DisplayWidth = 255
      Position = 7
    end
    object BDERelppField9: TppField
      FieldAlias = 'FL_MARINE_POLLUTANT'
      FieldName = 'FL_MARINE_POLLUTANT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object BDERelppField10: TppField
      FieldAlias = 'FL_PACKING_GROUP'
      FieldName = 'FL_PACKING_GROUP'
      FieldLength = 3
      DisplayWidth = 3
      Position = 9
    end
    object BDERelppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_EMS_MFAG'
      FieldName = 'NR_EMS_MFAG'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object BDERelppField12: TppField
      FieldAlias = 'TX_PHONE'
      FieldName = 'TX_PHONE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object BDERelppField13: TppField
      FieldAlias = 'NM_RESPONSIBLE_PERSON'
      FieldName = 'NM_RESPONSIBLE_PERSON'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object BDERelppField14: TppField
      FieldAlias = 'FL_STATE_AGGREGATE'
      FieldName = 'FL_STATE_AGGREGATE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object BDERelppField15: TppField
      FieldAlias = 'DT_LAST_INSPECION'
      FieldName = 'DT_LAST_INSPECION'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object BDERelppField16: TppField
      FieldAlias = 'DT_NEXT_INSPECION'
      FieldName = 'DT_NEXT_INSPECION'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object BDERelppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_GROSS_WEIGHT'
      FieldName = 'VL_GROSS_WEIGHT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object BDERelppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_NET_WEIGHT'
      FieldName = 'VL_NET_WEIGHT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object BDERelppField19: TppField
      FieldAlias = 'FL_POISON_HAZARD'
      FieldName = 'FL_POISON_HAZARD'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object BDERelppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_LIMITED_QUANTITIES'
      FieldName = 'VL_LIMITED_QUANTITIES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object BDERelppField21: TppField
      FieldAlias = 'TX_DESCRIPTION_GOODS'
      FieldName = 'TX_DESCRIPTION_GOODS'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 20
      Searchable = False
      Sortable = False
    end
    object BDERelppField22: TppField
      FieldAlias = 'NR_FREIGHT_FORWARDERS_REF'
      FieldName = 'NR_FREIGHT_FORWARDERS_REF'
      FieldLength = 30
      DisplayWidth = 30
      Position = 21
    end
    object BDERelppField23: TppField
      FieldAlias = 'NM_COMPANY'
      FieldName = 'NM_COMPANY'
      FieldLength = 100
      DisplayWidth = 100
      Position = 22
    end
    object BDERelppField24: TppField
      FieldAlias = 'TX_PLACE_DATE'
      FieldName = 'TX_PLACE_DATE'
      FieldLength = 150
      DisplayWidth = 150
      Position = 23
    end
    object BDERelppField25: TppField
      FieldAlias = 'CD_CONSIGNEE'
      FieldName = 'CD_CONSIGNEE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 24
    end
    object BDERelppField26: TppField
      FieldAlias = 'TP_CONSIGNEE'
      FieldName = 'TP_CONSIGNEE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
    object BDERelppField27: TppField
      FieldAlias = 'TP_CNTR'
      FieldName = 'TP_CNTR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 26
    end
    object BDERelppField28: TppField
      FieldAlias = 'NR_LACRE'
      FieldName = 'NR_LACRE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 27
    end
    object BDERelppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TARE'
      FieldName = 'VL_TARE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object BDERelppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CNTR'
      FieldName = 'VL_CNTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object BDERelppField31: TppField
      FieldAlias = 'MARINE'
      FieldName = 'MARINE'
      FieldLength = 3
      DisplayWidth = 3
      Position = 30
    end
    object BDERelppField32: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 31
    end
    object BDERelppField33: TppField
      FieldAlias = 'TEL_RESP'
      FieldName = 'TEL_RESP'
      FieldLength = 68
      DisplayWidth = 68
      Position = 32
    end
    object BDERelppField34: TppField
      FieldAlias = 'EMSMFAG'
      FieldName = 'EMSMFAG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 33
    end
    object BDERelppField35: TppField
      FieldAlias = 'NM_CARRIER'
      FieldName = 'NM_CARRIER'
      FieldLength = 60
      DisplayWidth = 60
      Position = 34
    end
    object BDERelppField36: TppField
      FieldAlias = 'BOOKING'
      FieldName = 'BOOKING'
      FieldLength = 15
      DisplayWidth = 15
      Position = 35
    end
    object BDERelppField37: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 36
    end
    object BDERelppField38: TppField
      FieldAlias = 'NM_VESSEL'
      FieldName = 'NM_VESSEL'
      FieldLength = 40
      DisplayWidth = 40
      Position = 37
    end
    object BDERelppField39: TppField
      FieldAlias = 'NR_VOYAGE'
      FieldName = 'NR_VOYAGE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 38
    end
    object BDERelppField40: TppField
      FieldAlias = 'NM_PORT_LOADING'
      FieldName = 'NM_PORT_LOADING'
      FieldLength = 50
      DisplayWidth = 50
      Position = 39
    end
    object BDERelppField41: TppField
      FieldAlias = 'NM_PORT_DISCHARGE'
      FieldName = 'NM_PORT_DISCHARGE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 40
    end
    object BDERelppField42: TppField
      FieldAlias = 'NM_FINAL_DESTINATION'
      FieldName = 'NM_FINAL_DESTINATION'
      FieldLength = 120
      DisplayWidth = 120
      Position = 41
    end
    object BDERelppField43: TppField
      FieldAlias = 'ESTUFAGEM'
      FieldName = 'ESTUFAGEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 42
    end
    object BDERelppField44: TppField
      FieldAlias = 'NR_CNTR'
      FieldName = 'NR_CNTR'
      FieldLength = 150
      DisplayWidth = 150
      Position = 43
    end
    object BDERelppField45: TppField
      FieldAlias = 'SHIPPER_NAME'
      FieldName = 'SHIPPER_NAME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 44
    end
    object BDERelppField46: TppField
      FieldAlias = 'SHIPPER_END'
      FieldName = 'SHIPPER_END'
      FieldLength = 50
      DisplayWidth = 50
      Position = 45
    end
    object BDERelppField47: TppField
      FieldAlias = 'SHIPPER_NUM'
      FieldName = 'SHIPPER_NUM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 46
    end
    object BDERelppField48: TppField
      FieldAlias = 'SHIPPER_CID'
      FieldName = 'SHIPPER_CID'
      FieldLength = 30
      DisplayWidth = 30
      Position = 47
    end
    object BDERelppField49: TppField
      FieldAlias = 'SHIPPER_UF'
      FieldName = 'SHIPPER_UF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 48
    end
    object BDERelppField50: TppField
      FieldAlias = 'SHIPPER_TEL'
      FieldName = 'SHIPPER_TEL'
      FieldLength = 15
      DisplayWidth = 15
      Position = 49
    end
    object BDERelppField51: TppField
      FieldAlias = 'SHIPPER_FAX'
      FieldName = 'SHIPPER_FAX'
      FieldLength = 15
      DisplayWidth = 15
      Position = 50
    end
    object BDERelppField52: TppField
      FieldAlias = 'SHIPPER_CEP'
      FieldName = 'SHIPPER_CEP'
      FieldLength = 9
      DisplayWidth = 9
      Position = 51
    end
    object BDERelppField53: TppField
      FieldAlias = 'CONSIGNEE_NAME'
      FieldName = 'CONSIGNEE_NAME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 52
    end
    object BDERelppField54: TppField
      FieldAlias = 'CONSIGNEE_END'
      FieldName = 'CONSIGNEE_END'
      FieldLength = 109
      DisplayWidth = 109
      Position = 53
    end
    object BDERelppField55: TppField
      FieldAlias = 'CONSIGNEE_PAIS'
      FieldName = 'CONSIGNEE_PAIS'
      FieldLength = 50
      DisplayWidth = 50
      Position = 54
    end
    object BDERelppField56: TppField
      FieldAlias = 'CONSIGNEE_CID'
      FieldName = 'CONSIGNEE_CID'
      FieldLength = 30
      DisplayWidth = 30
      Position = 55
    end
    object BDERelppField57: TppField
      FieldAlias = 'CONSIGNEE_UF'
      FieldName = 'CONSIGNEE_UF'
      FieldLength = 30
      DisplayWidth = 30
      Position = 56
    end
    object BDERelppField58: TppField
      FieldAlias = 'VESSEL_VOYAGE'
      FieldName = 'VESSEL_VOYAGE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 57
    end
    object BDERelppField59: TppField
      FieldAlias = 'SHIPPER_BAIRRO'
      FieldName = 'SHIPPER_BAIRRO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 58
    end
    object BDERelppField60: TppField
      FieldAlias = 'SHIPPER_END1'
      FieldName = 'SHIPPER_END1'
      FieldLength = 255
      DisplayWidth = 255
      Position = 59
    end
    object BDERelppField61: TppField
      FieldAlias = 'SHIPPER_END2'
      FieldName = 'SHIPPER_END2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 60
    end
    object BDERelppField62: TppField
      FieldAlias = 'SHIPPER_END3'
      FieldName = 'SHIPPER_END3'
      FieldLength = 255
      DisplayWidth = 255
      Position = 61
    end
    object BDERelppField63: TppField
      FieldAlias = 'SHIPPER_END4'
      FieldName = 'SHIPPER_END4'
      FieldLength = 255
      DisplayWidth = 255
      Position = 62
    end
    object BDERelppField64: TppField
      FieldAlias = 'SHIPPER_END5'
      FieldName = 'SHIPPER_END5'
      FieldLength = 255
      DisplayWidth = 255
      Position = 63
    end
    object BDERelppField65: TppField
      FieldAlias = 'SHIPPER_END6'
      FieldName = 'SHIPPER_END6'
      FieldLength = 255
      DisplayWidth = 255
      Position = 64
    end
    object BDERelppField66: TppField
      FieldAlias = 'SHIPPER_END7'
      FieldName = 'SHIPPER_END7'
      FieldLength = 255
      DisplayWidth = 255
      Position = 65
    end
    object BDERelppField67: TppField
      FieldAlias = 'CONSIGNEE_END1'
      FieldName = 'CONSIGNEE_END1'
      FieldLength = 255
      DisplayWidth = 255
      Position = 66
    end
    object BDERelppField68: TppField
      FieldAlias = 'CONSIGNEE_END2'
      FieldName = 'CONSIGNEE_END2'
      FieldLength = 255
      DisplayWidth = 255
      Position = 67
    end
    object BDERelppField69: TppField
      FieldAlias = 'TX_COMBINATION_PACK'
      FieldName = 'TX_COMBINATION_PACK'
      FieldLength = 50
      DisplayWidth = 50
      Position = 68
    end
    object BDERelppField70: TppField
      FieldAlias = 'TX_SINGLE_PACK'
      FieldName = 'TX_SINGLE_PACK'
      FieldLength = 200
      DisplayWidth = 200
      Position = 69
    end
    object BDERelppField71: TppField
      FieldAlias = 'calcIMDG'
      FieldName = 'calcIMDG'
      FieldLength = 255
      DisplayWidth = 255
      Position = 70
    end
    object BDERelppField72: TppField
      FieldAlias = 'NR_PROC'
      FieldName = 'NR_PROC'
      FieldLength = 14
      DisplayWidth = 14
      Position = 71
    end
    object BDERelppField73: TppField
      FieldAlias = 'VL_FLASH_POINT'
      FieldName = 'VL_FLASH_POINT'
      FieldLength = 15
      DisplayWidth = 15
      Position = 72
    end
    object BDERelppField74: TppField
      FieldAlias = 'VL_CONTROL_TEMP'
      FieldName = 'VL_CONTROL_TEMP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 73
    end
    object BDERelppField75: TppField
      FieldAlias = 'VL_EMERGENCY_TEMP'
      FieldName = 'VL_EMERGENCY_TEMP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 74
    end
    object BDERelppField76: TppField
      FieldAlias = 'VL_ELEVATED_TEMP'
      FieldName = 'VL_ELEVATED_TEMP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 75
    end
    object BDERelppField77: TppField
      FieldAlias = 'TX_OUTER_PACK_1'
      FieldName = 'TX_OUTER_PACK_1'
      FieldLength = 200
      DisplayWidth = 200
      Position = 76
    end
    object BDERelppField78: TppField
      FieldAlias = 'TX_REMARKS'
      FieldName = 'TX_REMARKS'
      FieldLength = 255
      DisplayWidth = 255
      Position = 77
    end
  end
  object ppReport1: TppReport
    DataPipeline = BDERel
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 6000
    PrinterSetup.mmMarginTop = 25000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ddbroker\RelDCA4.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 486
    Top = 58
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDERel'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 189707
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDERelIMDG'
        mmHeight = 11642
        mmLeft = 0
        mmTop = 118269
        mmWidth = 194000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = BDERelIMDG
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 10000
          PrinterSetup.mmMarginLeft = 10000
          PrinterSetup.mmMarginRight = 6000
          PrinterSetup.mmMarginTop = 25000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDERelIMDG'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'NR_IMDG_CLASS'
              DataPipeline = BDERelIMDG
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'BDERelIMDG'
              mmHeight = 3969
              mmLeft = 88106
              mmTop = 0
              mmWidth = 11642
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDERelUN'
        mmHeight = 11642
        mmLeft = 0
        mmTop = 118004
        mmWidth = 194000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = BDERelUN
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 10000
          PrinterSetup.mmMarginLeft = 10000
          PrinterSetup.mmMarginRight = 6000
          PrinterSetup.mmMarginTop = 25000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDERelUN'
          object ppHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'NR_UN'
              DataPipeline = BDERelUN
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'BDERelUN'
              mmHeight = 3969
              mmLeft = 117475
              mmTop = 0
              mmWidth = 11906
              BandType = 4
            end
          end
          object ppFooterBand2: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 184944
        mmLeft = 0
        mmTop = 2381
        mmWidth = 142875
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 22754
        mmLeft = 2910
        mmTop = 164307
        mmWidth = 135996
        BandType = 4
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D61701ACA0000424D1ACA0000000000003600000028000000EB00
          0000490000000100180000000000E4C900000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFE
          FEFFFFE5E7E7F5F7F7FDFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFFFFFFFFFF8E9090D5D7D7FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFDFEFEFFFFFF656767C8CACAFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFCFEFEFFFFFF656767C9CBCBFFFFFFFDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDFFFFFF6E7070CECECEFFFFFFFCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF3F3F34F5050B3B3B3FFFFFF
          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E93535359494
          94FFFFFFFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E7E734
          3131807F7FFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFD
          FDFDFCFCFCFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFBFBFBFFFFFFFDFDFDFFFFFF
          BEBCBD0909094C4849FFFFFFFFFFFFFEFCFCFFFFFFFBFBFBFDFDFDFEFEFEFEFE
          FEFDFDFDFFFFFFFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFE
          FEFDFDFDFFFFFFFEFEFEFDFDFDFEFEFEFDFDFDFEFEFEFBFBFBFEFEFEFFFFFFFE
          FEFEFDFDFDFEFEFEFDFDFDFCFCFCFEFEFEFBFBFBFEFEFEFFFFFFFEFEFEFDFDFD
          FDFDFDFDFDFDFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBFFFFFFFDFDFDFEFEFEFFFF
          FFFDFDFDFFFFFFFDFDFDFEFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFDFDFDFD
          FDFDFDFDFDFFFFFFFDFDFDFBFBFBFEFEFEFBFBFBFDFDFDFFFFFFFEFEFEFDFDFD
          FFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFDFDFDFEFEFEFDFDFDFEFEFEFCFC
          FCFEFEFEFFFFFFFEFEFEFDFDFDFEFEFEFFFFFFFCFCFCFEFEFEFDFDFDFFFFFFFE
          FEFEFFFFFFFEFEFEFEFEFEFFFFFFFDFDFDFFFFFFFDFDFDFFFFFFFEFEFEFDFDFD
          FCFCFCFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFF
          FFFEFEFEFCFCFCFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFEFFFFFFFDFDFDFEFEFEFDFDFDFEFEFEFFFFFFFEFEFEFEFEFEFEFEFEFFFFFF
          FFFFFFFCFCFCFBFBFBFEFEFEFBFBFBFEFEFEFCFCFCFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFEFEFEFDFDFDFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFB
          FBFBFEFEFEFFFFFFFAFAFAFCFCFCFCFCFCFCFCFCFDFDFDFDFDFDFEFEFEFEFEFE
          FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFCFCFCFCFCFCFCFCFBFBFBFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFBAB5B7000000403C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FFFFFDFDFDFCFCFCFBFBFBFCFCFCFCFCFCFCFCFCFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFD
          FDFDFCFCFCF8F8F8FFFFFFFEFEFEF8F8F8FAFAFAFDFDFDFEFEFEFCFCFCFEFEFE
          FAFAFAFCFCFCFDFDFDFBFBFBFEFEFEFBFBFBFEFEFEFDFDFDFAFAFAFBFBFBFDFD
          FDFEFEFEFCFCFCFDFDFDFDFDFDFCFCFCFCFCFCFDFDFDF9F9F9FCFCFCFDFDFDFD
          FDFDFDFDFDFEFEFEFCFCFCFBFBFBFBFBFBFDFDFDFDFDFDFCFCFCFEFEFEFCFCFC
          FDFDFDFBFBFBFEFEFEFEFEFEFAFAFAFCFCFCFDFDFDFDFDFDFCFCFCFFFFFFFEFE
          FEFBFBFBFCFCFCFDFDFDFDFDFDFBFBFBFEFEFEFCFCFCFDFDFDFDFDFDFBFBFBFC
          FCFCFAFAFAFDFDFDFCFCFCFCFCFCFBFBFBFBFBFBFCFCFCFCFCFCFAFAFAFDFDFD
          FDFDFDFCFCFCFCFCFCFEFEFEFCFCFCFDFDFDFCFCFCFCFCFCFEFEFEFDFDFDF9F9
          F9FBFBFBFFFFFFFBFBFBFDFDFDFCFCFCFBFBFBFDFDFDFFFFFFFBFBFBFCFCFCFA
          FAFAFAFAFAFDFDFDFBFBFBFCFCFCFEFEFEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFBFBFBFEFEFEFDFDFDFCFCFCFEFEFEFCFCFCFCFCFCFBFBFBFCFC
          FCFDFDFDFEFEFEFBFBFBFDFDFDFDFDFDFCFCFCF9F9F9FCFCFCFEFEFEFBFBFBFE
          FEFEFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFBFBFBFCFCFCFAFAFAF9F9F9
          F8F8F8FEFEFEFAFAFAFAFAFAFDFDFDFCFCFCF9F9F9FBFBFBF8F8F8FDFDFDFDFD
          FDFDFDFDFFFFFFFEFEFEFCFCFCFFFFFFFCFCFCFBFBFBFAFAFAFDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDFCFCFCFEFEFEFBFBFBFFFFFFFFFFFFF6F6F6DFDFDFE3E3E37E
          7E7E6464646664644C4646070202221D1E6967676764656464646F6F6FDBDBDB
          DFDFDFEDEFEFFFFFFFFFFFFFFBFBFBFDFDFDFEFEFEFDFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFDFDFD
          FBFBFBFCFCFCFBFBFBFDFDFDFBFBFBF9F9F9FBFBFBFEFEFEFCFCFCFEFEFEFDFD
          FDFAFAFAFAFAFAFEFEFEFDFDFDFCFCFCFBFBFBFCFCFCFCFCFCFDFDFDFAFAFAFB
          FBFBFDFDFDFCFCFCFCFCFCFDFDFDFDFDFDFBFBFBFDFDFDFEFEFEF7F7F7FBFBFB
          FDFDFDFCFCFCFBFBFBFDFDFDFAFAFAFCFCFCFDFDFDFAFAFAFEFEFEFCFCFCFEFE
          FEFBFBFBFDFDFDFBFBFBF9F9F9FAFAFAF8F8F8FBFBFBFBFBFBFCFCFCF9F9F9FC
          FCFCFCFCFCFCFCFCFCFCFCF9F9F9FCFCFCFFFFFFFCFCFCFAFAFAFBFBFBFBFBFB
          FCFCFCFEFEFEFCFCFCFEFEFEF8F8F8FAFAFAFEFEFEFBFBFBFDFDFDF7F7F7FFFF
          FFFAFAFAFCFCFCFAFAFAF8F8F8FDFDFDF8F8F8FCFCFCFCFCFCF7F7F7FBFBFBFC
          FCFCF9F9F9FBFBFBFDFDFDFCFCFCFBFBFBFCFCFCFCFCFCFCFCFCF8F8F8FBFBFB
          FBFBFBF9F9F9FCFCFCFBFBFBFCFCFCFCFCFCFDFDFDFBFBFBFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFAFAFAFEFEFEFDFDFDFCFCFCF9F9F9FCFCFCF8F8F8FB
          FBFBF9F9F9FDFDFDFCFCFCF8F8F8FCFCFCFBFBFBFBFBFBF9F9F9FBFBFBFDFDFD
          FCFCFCFBFBFBFCFCFCFAFAFAFCFCFCFDFDFDFAFAFAFDFDFDFDFDFDFCFCFCF7F7
          F7FCFCFCFCFCFCF7F7F7FDFDFDF9F9F9FAFAFAFAFAFAFCFCFCFDFDFDFDFDFDFC
          FCFCFCFCFCFCFCFCFDFDFDFBFBFBFCFCFCF8F8F8FBFBFBFBFBFBFAFAFAFDFDFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFCFBFBFBFFFFFFFFFFFFCBCBCBA2A2A27E7E7E606060
          606060B7B7B7D2D3D2D4D4D49C9495010001342D2ECAC8C8D6D4D5D3D3D3C6C5
          C5666767606060717373A2A2A2BABABAFFFFFFFFFFFFFBFBFBFCFCFCFEFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAFBFBFBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDF8F8F8FEFEFEFCFCFCFCFCFCFBFBFBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFBFBFBFCFCFCFAFAFAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFBFBFBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFBFBFBFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDF9F9F9FDFDFDFBFBFBFDFDFDFFFFFFFFFFFFFE
          FEFEFAFAFAFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFCFCFCFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
          FBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E36B6B6B7C7C7C878787C9C9
          C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C93940600012D2526E6E0E1FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDADCDC8787878181816C6C6CD3D3D3FAFAFAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFFFFFFEFEFEF6F6F6F5F5F5F6060606D6D6DEAEAEAFFFFFFFAFAFA
          FFFFFF9090906565655C5C5C686868BDBDBDFFFFFFFFFFFF8080806767676666
          669D9D9DA4A4A46969696B6B6B8A8A8AB2B2B26767676C6C6C6E6E6EF7F7F7F9
          F9F97D7D7D6464645A5A5AA2A2A2FFFFFFF8F8F8FDFDFDFAFAFAF8F8F8FFFFFF
          FFFFFFE4E4E46666665959595D5D5DC3C3C3FFFFFFFFFFFFFFFFFFFFFFFF8A8A
          8A6464645C5C5C696969C6C6C6FFFFFFA4A4A4666666646464818181BDBDBD64
          64646A6A6A686868EDEDEDFAFAFA8484846363635A5A5A989898FDFDFDD3D3D3
          6666665E5E5EAEAEAEEFEFEF6C6C6C5D5D5DA0A0A09F9F9F6A6A6A6B6B6B8D8D
          8DB3B3B3676767696969797979C0C0C06464646E6E6E5F5F5FE6E6E6FFFFFF8A
          8A8A6464645D5D5D8E8E8EFFFFFFFFFFFFA7A7A76565656A6A6A717171F9F9F9
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF9292926A6A6A6363635D5D
          5D5D5D5D858585FFFFFFFFFFFFFFFFFF9696966565655D5D5D848484FFFFFFFF
          FFFFB1B1B16565656C6C6C6A6A6AF4F4F4FDFDFDF8F8F8FCFCFCFEFEFEB6B6B6
          707070F6F6F6FDFDFDFCFCFCFDFDFD757575686868676767A2A2A2FFFFFFFEFE
          FE9D9D9D5E5E5E5B5B5B868686FFFFFFFFFFFFFFFFFF9393936464645D5D5D85
          8585FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3868686595959BBBBBBF5F5F5FF
          FFFFFFFFFFFEFEFEFCFCFCFBFBFBFFFFFFFFFBFC5F57570C040436292BDED8D9
          FFFFFFFEFFFEFDFBFBFBFBFBFCFDFDFFFFFFFFFFFFFFFFFFC5C5C56565657676
          76B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDE7E7E74848480000000D0D0D121212000000424242E6E6
          E6FAFAFA7F7F7F000000000000232323000000101010BCBCBCFFFFFF4E4E4E00
          0000000000797979848484000000000000565656969696000000000000232323
          FBFBFB808080000000090909232323868686FFFFFFFBFBFBFDFDFDFDFDFDFCFC
          FCF4F4F47777771818180000002424242525251616164E4E4EF6F6F6FCFCFC79
          7979000000000000232323000000161616D1D1D18A8A8A000000000000414141
          A6A6A6000000000000131313EFEFEF939393000000050505232323797979FCFC
          FC2525250000002A2A2A4848482D2D2D0000001414147E7E7E7B7B7B00000000
          0000585858989898000000000000363636ABABAB0000000000000E0E0EE2E2E2
          8080800000000000002525251E1E1E747474F5F5F58C8C8C0000000000002C2C
          2CF7F7F7FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEE8E8E82828280000000A
          0A0A262626262626010101767676ECECEC898989000000000000262626212121
          6D6D6DF2F2F2979797000000000000232323EFEFEFFFFFFFF9F9F9FFFFFFE5E5
          E50A0A0A0000007A7A7AFFFFFFFEFEFEFCFCFC363636000000000000868686D3
          D3D33030300000001C1C1C2323230000005F5F5FE6E6E6898989000000000000
          2525252020206B6B6BF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFCFCFCFCFCFCFFFFFFFDFDFDB6B6B6646464A7A7A7FDFDFDFFFFFF
          FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF9F966636212100E240E
          11B4B4B5F8FFFFFBFFFFFFFCFFFFFDFFFEFEFFF7FFFFF8FEFDFFFFFFFFFFFFFF
          FFFFBFBFBF666666A6A6A6FBFBFBFFFFFFFCFCFCFBFBFBFDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF838383000000323232E1E1E1E9E9E936363600
          0000878787EDEDED000000080808ADADADFFFFFF6D6D6D0000002D2D2DFFFFFF
          E1E1E1000000141414F8F8F8FFFFFF1A1A1A000000D7D7D7FFFFFF3D3D3D0000
          00B5B5B5FFFFFF5A5A5A000000898989FFFFFFFFFFFFFEFEFEFAFAFAFDFDFDFD
          FDFDFFFFFFC8C8C8000000070707B9B9B9FFFFFFFFFFFFA3A3A3000000454545
          C0C0C00000000F0F0FBBBBBBFFFFFF5E5E5E000000444444FFFFFF3030300000
          00C7C7C7FFFFFF5151510000009E9E9EFFFFFF737373000000777777FFFFFFFF
          FFFFEFEFEF050505000000929292FFFFFF2D2D2D000000C1C1C1FFFFFFF5F5F5
          171717000000DBDBDBFFFFFF3C3C3C000000B7B7B7FFFFFF6262620000009E9E
          9EE3E3E30000000C0C0CADADADFFFFFFDBDBDB808080ECECECFFFFFF31313100
          0000C2C2C2FFFFFFFEFEFEFAFAFAFBFBFBFEFEFEFDFDFDFFFFFF8C8C8C000000
          2A2A2ADDDDDDFFFFFFFFFFFF252525000000A0A0A0080808040404A2A2A2FFFF
          FFE4E4E47C7C7CE9E9E9FFFFFF3E3E3E000000B5B5B5FFFFFFFAFAFAFAFAFAFF
          FFFF7C7C7C0000004F4F4F282828D6D6D6FFFFFFFFFFFFCACACA000000292929
          FFFFFF424242000000575757FAFAFAFFFFFF9F9F9F848484BCBCBC0000000505
          05A1A1A1FFFFFFE3E3E37F7F7FE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFCFCFCFFFFFFE0E0E05A5A5A7E7E7EFAFAFAFFFFFFFAFA
          FAFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F0EF504F4D2D
          2C2B1200008A8988FBFFFFFAFEFFFFFDFFFFFCFFFEFEFFF6FFFFF8FEFEFDFDFD
          FEFEFEFCFCFCFFFFFFFFFFFF959595555555CACACAFFFFFFFCFCFCFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A000000515151FFFFFFFFFFFF
          7171710000008C8C8CE7E7E70000001D1D1DFFFFFFFFFFFFD1D1D10000003131
          31FFFFFFE9E9E9030303141414F4F4F4FFFFFF1F1F1F010101E7E7E7FFFFFF3A
          3A3A000000B1B1B1FFFFFF636363000000858585FFFFFFFFFFFFFBFBFBFDFDFD
          FEFEFEFEFEFEFDFDFD424242000000AEAEAEFFFFFFFEFEFEFCFCFCFFFFFF9595
          957C7C7CCBCBCB000000292929FFFFFFFFFFFFC7C7C7000000424242FFFFFF30
          3030000000D1D1D1FFFFFF5151510000009F9F9FFFFFFF7B7B7B000000757575
          FFFFFFFEFEFEFDFDFDB1B1B13D3D3D0000002323230C0C0C000000BCBCBCFFFF
          FFFFFFFF1A1A1A000000D7D7D7FFFFFF3F3F3F000000C4C4C4FFFFFF60606000
          00009B9B9BE3E3E30000001414147878786161613C3C3C4A4A4AE3E3E3FFFFFF
          323232000000BEBEBEFFFFFFFFFFFFFBFBFBFCFCFCFAFAFAFAFAFAFFFFFF9A9A
          9A2F2F2FF1F1F1F5F5F5D6D6D67D7D7D0808080000009A9A9A0F0F0F0A0A0A70
          70705E5E5E3F3F3F4E4E4EDDDDDDFFFFFF3E3E3E000000ADADADFFFFFFFFFFFF
          FFFFFFE8E8E81A1A1A121212BFBFBF1C1C1C838383FCFCFCFFFFFFD4D4D40000
          00282828FFFFFF3B3B3B000000BFBFBFFFFFFFFFFFFFF1F1F1EAEAEAD4D4D400
          00000D0D0D7575756363633E3E3E474747DFDFDFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3727272D2D2D2FCFCFCFFFFFFFB
          FBFBFAFAFAFEFEFEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E3E2
          4242413C3A390800008C8888FDFFFFFBFEFFFFFDFFFFFDFFFEFEFFF6FFFFF9FF
          FFFCFDFDFFFFFFFAFAFAFAFAFAFDFDFDFFFFFFE3E3E3787878C3C3C3FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF8B8B8B9D9D9DFBFB
          FBFFFFFF6868680000008E8E8EECECEC000000050505B0B0B0FFFFFF72727200
          00002D2D2DFFFFFF909090000000161616F9F9F9B3B3B30A0A0A0000008B8B8B
          FFFFFF424242000000ABABABFFFFFF6767670000008E8E8EFFFFFFFFFFFFF9F9
          F9FCFCFCFCFCFCFEFEFEF7F7F71A1A1A000000D2D2D2FFFFFFFEFEFEF9F9F9FB
          FBFBFFFFFFFFFFFFCCCCCC0000000B0B0BC4C4C4FFFFFF656565000000444444
          C2C2C2111111000000777777FFFFFF5A5A5A000000959595FFFFFF7F7F7F0000
          00797979FFFFFFFFFFFFF6F6F69A9A9A8B8B8B7E7E7E707070181818000000B6
          B6B6FFFFFFAAAAAA090909000000E2E2E2C9C9C91919190000006D6D6DFFFFFF
          676767000000969696E3E3E3000000101010B6B6B6F2F2F2000000000000DBDB
          DBFFFFFF333333000000CCCCCCE1E1E18A8A8AF1F1F1FCFCFCFAFAFAFCFCFCFE
          FEFEFFFFFFFEFEFE9D9D9D313131000000000000000000383838C2C2C2010101
          070707A1A1A1FDFDFD0D0D0D000000D2D2D2FFFFFF3D3D3D000000BFBFBFE8E8
          E88D8D8DFDFDFD7F7F7F000000797979FFFFFFA0A0A0000000F2F2F2FFFFFF77
          7777000000292929FFFFFF8E8E8E0000005F5F5FFFFFFFC7C7C7141414000000
          A1A1A10505050A0A0AA9A9A9FCFCFC0C0C0C000000D0D0D0FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB737373E0E0E0FFFFFFFEFEFE
          FCFCFCFBFBFBFCFCFCFCFCFCFEFEFEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFE5E4E43F4240373535100000898282FDFFFFFDFFFFFFFDFFFFFDFFFDFFFFF8
          FFFFF8FCFCFEFEFEFDFDFDFCFCFCFBFBFBFCFCFCFEFEFEFFFFFFEDEDED777777
          C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFCFCFCFFFFFF6C6C6C000000888888FAFAFA797979141414000000313131
          0000001D1D1DB2B2B2FFFFFF414141070707050505FCFCFC6666660B0B0B0000
          000B0B0B313131000000000000C2C2C2C3C3C312121203030318181830303089
          8989FFFFFFFBFBFBFDFDFDFEFEFEF7F7F71A1A1A000000D5D5D5FFFFFFFEFEFE
          FBFBFBF8F8F8E3E3E3F1F1F1F1F1F16C6C6C1111110303032F2F2F0000002020
          20CFCFCF8484840E0E0E000000090909353535050505000000ADADADDADADA17
          1717000000171717303030828282F9F9F91E1E1E000000363636464646000000
          000000BEBEBEFFFFFF6161610D0D0D000000E8E8E89090900F0F0F0000000303
          033636360909090000009C9C9CF8F8F86F6F6F0000000404043535350000007C
          7C7CF6F6F6ABABAB020202000000444444151515000000E4E4E4FFFFFFFCFCFC
          FDFDFDFFFFFFF5F5F56868680000000000001414141B1B1BB4B4B4F5F5F5FFFF
          FF7A7A7A000000000000333333020202717171F5F5F5B4B4B40909090000003E
          3E3E1E1E1E000000B0B0B01313130000000D0D0DB6B6B62A2A2A0000006E6E6E
          FFFFFF353535020202151515FDFDFDF4F4F42525250000002D2D2D0101010000
          001B1B1BCFCFCF868686000000000000373737010101727272F4F4F4FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7727272D8D8D8FFFFFFF9F9
          F9FDFDFDFDFDFDFEFEFEFCFCFCFBFBFBFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD9D9D9444846464240120000645A58F1FEFCFFFFFFFFFEFFFFFEFF
          FFFFFFFAFFFFFBFFFFFCFCFCFAFAFAFCFCFCFFFFFFFEFEFEFDFDFDF9F9F9FFFF
          FFEDEDED787878C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
          FFFFFFFCFCFCFEFEFEFFFFFF6C6C6C000000838383FFFFFFFFFFFFE6E6E66363
          634F4F4F878787F7F7F7FFFFFFFDFDFDF9F9F9C3C3C36E6E6EF4F4F4F7F7F7C6
          C6C6606060BBBBBB5454545B5B5B9B9B9BFEFEFEC8C8C81515150000002A2A2A
          4F4F4F9C9C9CFBFBFBFBFBFBFBFBFBFFFFFFFDFDFD646464000000919191FFFF
          FFFFFFFFFFFFFFFFFFFF0E0E0E8D8D8DFFFFFFFFFFFFDEDEDE5D5D5D4E4E4E8E
          8E8EF7F7F7FFFFFFFAFAFAD5D5D55D5D5DBBBBBB5C5C5C5959598D8D8DFCFCFC
          D5D5D51D1D1D0000002626264F4F4F919191FDFDFDF5F5F59A9A9A5151515151
          515B5B5B9B9B9BFCFCFCFBFBFBFAFAFADADADA707070E6E6E6FAFAFADFDFDF5E
          5E5EB8B8B8616161575757868686FAFAFAFFFFFFFFFFFF8282825858584F4F4F
          8C8C8CFFFFFFFFFFFFF2F2F27979795B5B5BB2B2B25E5E5E656565EEEEEEFCFC
          FCFBFBFBFBFBFBFFFFFF9393930000002323236F6F6FF1F1F1FFFFFFB0B0B0CD
          CDCDFFFFFFFFFFFF8989895858584F4F4F868686FFFFFFFFFFFFF2F2F27D7D7D
          5F5F5FAFAFAF6767676B6B6BC3C3C35A5A5A5E5E5E575757BEBEBE6464645C5C
          5C858585FFFFFFFAFAFAB4B4B4787878FBFBFBFBFBFBF6F6F69494944F4F4F57
          57577D7D7DF5F5F5FDFDFDFFFFFF8B8B8B5959594F4F4F838383FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD4D4D4727272DBDBDBFFFFFFFC
          FCFCFEFEFEFEFEFEFFFFFFFEFEFEFCFCFCFDFDFDFCFCFCFDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFB9BAB83B403C4A4441170000564747F1FDFBFFFFFFFFFE
          FFFFFEFFFFFFFFFBFFFFFBFEFEFCFCFCFFFFFFFCFCFCFAFAFAFCFCFCFEFEFEFE
          FEFEFCFCFCFFFFFFEAEAEA787878BCBCBCFFFFFFFDFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFDFDFDFFFFFFFEFEFEFDFDFDF0F0F0656565000000787878F2F2F2FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDEAEAEA5C5C5C6F6F6FF3F3F3
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCD0000
          00838383FFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFDFDFDFFFFFFD3D3D300000000
          0000969696F0F0F0B8B8B8464646000000878787FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFDEDEDE030303696969FFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFAFAFA676767646464E7E7E7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFCFCFDFDFDFEFEFEFFFFFF969696000000595959FFFFFFCBCBCB555555
          000000757575FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDCDCDC5E5E5E7A7A7AFEFEFEFBFBFBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFCFCFCFDFDFDFFFFFFDADADA787878DFDFDFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFCFCFCF9F9F9FAFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF8B8F8C3D433E534D4A1E0000513E3ECED7D4FE
          FFFFFFFEFFFFFEFFFFFFFFFDFFFFFBFCFCFAFAFAFCFCFCFDFDFDFFFFFFFCFCFC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F47D7D7DC6C6C6FFFFFFFDFDFDFCFC
          FCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFCFCFBFBFBFEFEFEFFFFFFEEEEEE181818000000000000000000292929
          FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD6D6D60000000000
          00EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFF
          FFFF5A5A5AA5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFCFCFCFBFBFB
          9C9C9C3C3C3C000000010101000000151515171717B3B3B3FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF626262959595FBFBFBF8F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFFFFFFEAEAEA000000000000CDCD
          CDFFFFFFFBFBFBFBFBFBFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF7F7F77171710000000202020000
          00000000212121F6F6F6FFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBFBFBFAFAFAFBFBFBFFFFFFB9B9B9000000080808F9F9F9FFFFFFFEFE
          FEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFEFEFE7E7E7EA4A4A4FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE9E9E9EEEEEEEFFFFFFFFFFFFFCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF44484547524A4F4A462600002E1817
          464B48FEFFFFFFFFFFFFFFFEFFFFFEFEFFFFFBFCFCFBFBFBFFFFFFFFFFFFEFEF
          EFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8636363FDFDFDFC
          FCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFCFCFFFFFFFCFCFCFDFDFDF6F6F69B9B9B9999999B9B9B9595
          95A5A5A5FCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF9B
          9B9BA4A4A4F3F3F3FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFE
          FDFDFDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFEFE
          FEFFFFFFFFFFFFFAFAFA969696959595909090D5D5D5C9C9C9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFAFAFAFCFCFCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFAFAFAF1F1F1A3A3A39C
          9C9CE9E9E9FAFAFAFAFAFAFAFAFAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFCFCFC9F9F9F91
          91919797979C9C9CAEAEAEFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFCFCFCF9F9F9FAFAFAFAFAFAE2E2E29B9B9BA9A9A9F9F9F9FC
          FCFCFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD2D2D2656565F3
          F3F3FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABA0F0F0F949494FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555B575B675F3B33303909
          0B140000393E3BFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFDFDFDFFFFFFE6E6E68E
          8E8EA0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF7F7F7797979
          B0B0B0FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEF9F9F9FCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC
          FFFFFFFFFFFFFFFFFFFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFD
          FDFBFBFBFEFEFEFDFDFDFCFCFCFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFB
          FBFBFBFBFBFCFCFCFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB
          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFCFCFCFC
          FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFBFBFBFBFBFB
          FFFFFFFFFFFFFEFEFEFBFBFBFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAFAFAFA
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F7F7F7FDFDFDFEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFAFAFAFFFFFFFFFFFFFFFFFF
          FDFDFDF9F9F9FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF7F7F7898988
          B3B3B3FFFFFFFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F34444430000
          006B6B6BCCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555C586370683E
          37333C090C180000484E4AFFFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFE3E3E3
          292929656565FDFDFDFEFEFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFF
          FFC9C9C9797979EBEBEBFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFBFBFBFAFAFAFCFCFC
          FFFFFFF9F9F9FDFDFDFEFEFEFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFDFDFDFCFCFCFCFCFCFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFCFCFCFCFCFBFBFBFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEFDFDFDFCFCFCFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFDFDFDF8F8F8FCFC
          FCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBFEFEFEFCFCFC
          FBFBFBFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFDFDFDFCFC
          FCFAFAFAF9F9F9FCFCFCFDFDFDFCFCFCFCFCFCFBFBFBFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFBFB
          FBFCFCFCFBFBFBFAFAFAFBFBFBFCFCFCF9F9F9FDFDFDFDFDFDFCFCFCFCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFDFDFDFBFBFBFDFDFDFBFB
          FBF9F9F9FAFAFAFBFBFBFBFBFBFAFAFAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE888A
          8A9B9C9CFFFFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF6
          F7F75452520400004B4747CAC8C7FFFFFFFFFFFFFDFDFDFFFFFFFFFFFF5E5E5C
          6266613D36332D04051F05054A4E4AFCFFFFFCFFFFFAFFFEFFFFFFFEFDFDCFCD
          CD302F2F030303E0E0E0FFFFFFFBFCFCFDFEFEFEFFFFFEFFFFFEFFFFFFFFFFFD
          FEFEFCFCFCFFFFFFBCBCBC737373FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFCFCFCFEFE
          FEFCFCFCFDFDFDFDFDFDFDFDFDFCFCFCFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEFEFEFEFDFDFDFBFBFBFAFAFAFBFBFBFEFEFEFDFDFDFEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFEFEFEFBFBFBFEFEFEFCFCFCFDFDFDFDFDFDFEFEFEFEFEFEFD
          FDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFCFC
          FCF9F9F9FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFE
          FEFEFEFEFEFBFBFBFCFCFCFDFDFDFCFCFCFCFCFCFAFAFAFEFEFEFBFBFBFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFDFDFDFFFFFFFFFFFFFE
          FEFEFEFEFEFBFBFBFEFEFEFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFDFDFD
          FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFF
          FFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFEFEFEFAFAFAFCFCFCFC
          FCFCFDFDFDFCFCFCFBFBFBFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6D7071B2B5B5FFFFFFF8FAFBFBFCFDFFFEFFFFFEFFFFFEFFFFFEFFFFFEFF
          F6FBFBFFFFFFF0ECED0C00004D403F635C5B838383E6EBE9FFFFFFFFFFFFD1CD
          CF4836397C6C6E4239391C02021803024E4D48F9FFFDF8FFFEFFFFFFFFFFFF85
          686E0400000C0D0DBEC0C0FFFFFFFDFFFFFDFEFEFCFFFFFCFFFFFCFFFFFCFFFF
          FDFFFFFBFCFCFAFAFAFFFFFFDADADA5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFBFB
          FBFFFFFFFAFAFAFDFDFDFFFFFFFCFCFCFDFDFDFCFCFCFBFBFBFCFCFCFDFDFDFB
          FBFBFBFBFBFEFEFEFEFEFEF9F9F9FAFAFAFCFCFCFBFBFBFDFDFDFBFBFBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFEFE
          FEFDFDFDFDFDFDF8F8F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFCFCFCFCFCFCFEFEFEFEFEFEFEFEFEFBFBFBFEFEFEFCFCFCFBFBFBFDFDFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFE
          FEFEFEFEFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFDFDFDFDFDFDFDFDFDFFFFFFFCFCFCFDFDFDFCFCFCFBFBFBFDFDFD
          FDFDFDFCFCFCFEFEFEFBFBFBFBFBFBFAFAFAFCFCFCFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBFBFBFDFDFDFCFCFCFCFCFCFBFBFBFCFCFCFDFDFDFDFDFDFBFBFBFB
          FBFBFDFDFDFCFCFCFCFCFCFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC2C3C477797AEEEFEEFFFEFFF8F8FAFEFDFEFFFEFFFFFEFFFFFEFFFFFE
          FFFFFFFFF9F9FAF5F4F6FAF7F89992932E2423372D2C4843416D6A6AE0E0DFFF
          FFFF939193110F108886873E32322C06081F00003B312FFFFFFFFFFFFFA8A1A1
          3E37372201062F1F215E5E60FFFFFFFFFFFFF6F5F7FBFAFBFFFFFFFFFEFFFFFE
          FFFFFEFFFEFEFFFEFEFFFAFAFAFFFFFFF6F6F68A8A8AAAAAAAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFAFAFAFCFCFCFBFBFBFCFCFCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFEFEFEFCFCFCFDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFCFCFCFEFEFEFBFBFBF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDF9F9F9FDFDFDFCFCFCFAFAFAFCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFF8F8F8FCFCFCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF8F8F8FCFCFCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB0B1B2767577FFFFFFFAF8F9FFFDFFFEFDFEFFFEFFFFFEFFFF
          FEFFFEFEFFFFFEFFFFFCFEFEFBFEFEFAFBFFFFFF615754030000503D3B897979
          5E5657999B9B9C9F9F0418157E96913F3635330205350405503838DCD8D79B86
          862E10110700003A2C2D665F60E1E1E2FCFBFCFFFEFEFEFCFEFDFBFCFFFDFFFF
          FDFFFFFDFFFFFDFFFFFDFFFFFDFDFEFEFEF8F8F8FFFFFF9898988C8C8CFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEE5E5E5989898969696CACACAFFFFFFFFFFFFBABABA9595959595959898
          98979797939393999999EEEEEEFFFFFFFFFFFFFDFDFDFFFFFFF9F9F9FFFFFFE9
          E9E99A9A9A989898989898989898989898989898989898989898999999969696
          A1A1A1F5F5F5FEFEFEE4E4E49898989898989898989898989898989898989898
          98989898989898989898A9A9A9FBFBFBFCFCFCFBFBFBFBFBFBFDFDFDFFFFFFF1
          F1F1979797979797989898989898989898989898989898989898989898989898
          989898989898989898989898989898999999969696AAAAAAFBFBFBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFF9B9B9B97979798
          9898979797979797D6D6D6FFFFFFFFFFFFFFFFFFFDFDFDFAFAFAFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF5F5F59A9A9A979797B4B4B4FFFFFFFFFFFFD8D8
          D8979797979797989898999999989898979797D6D6D6FFFFFFFFFFFFFEFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF4F4F4757375D4D2D3FAF9FAFBF9FAFCFBFDFFFEFFFFFEFF
          FFFEFFFEFFFFFDFFFFFEFFFFFFFCFEFFF9FBFFFDFDFFFFFECDC9C73423221E00
          004F30308977776B6C6C56605E00191360837C3738363205074D1015491B1C49
          23242700002103044C46474F4A4BA3A0A1FFFFFFFCFBFCFBF9FAFAF7F8FDFBFC
          FFFEFFFFFDFFFFFDFFFFFDFFFFFDFFFFFEFFFDFEFDFAFAFAFAFAFAE2E2E27070
          70DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFC4C4C4000000000000707070DDDDDD5050500D0D0D00000000
          0000000000000000000000000000343434888888EAEAEAFFFFFFFDFDFDFDFDFD
          FFFFFFD6D6D60000000000000000000000000000000000000000000000000000
          00000000050505EEEEEEFFFFFFB7B7B700000000000000000000000000000000
          00000000000000000000000000001C1C1CFEFEFEFFFFFFFBFBFBFDFDFDFFFFFF
          F4F4F45454540000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000202020FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9CFCFCF4E4E4E424242000000
          0000000000000000000000001F1F1F4D4D4D8B8B8BECECECFFFFFFFCFCFCFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3000000000000303030EBEBEB68
          68682121210000000000000000000000000000000000001F1F1F6C6C6CE8E8E8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1585455FFFFFFFEFEFEFFFFFFFBFAFAFFFF
          FFFFFFFFFFFFFFFEFFFFFDFFFFFEFFFFFFFFFFFCFDFDF5FEFCF1FBF8FFFFFFD2
          CECC472929240000422A2B868887394C4816211D69827D2D38351F010142070C
          490B0F3802042D05074F4544616E6B494B4BF8F8F8F8FBFBFAFCFCFAFBFBF7F8
          F8F9FAFAFFFFFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFAFAFAFDFDFDFDFDFDFF
          FFFF616161D1D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFC8686860000000000000A0A0A131313000000000000
          010101000000000000000000000000000000000000000000181818BBBBBBFFFF
          FFFEFEFEFFFFFFD6D6D600000000000000000000000000000000000001010103
          0303010101000000121212EFEFEFFFFFFFBBBBBB000000010101000000000000
          000000000000000000000000000000000000292929FEFEFEFCFCFCFEFEFEFCFC
          FCF0F0F04D4D4D00000003030302020200000000000000000000000000000000
          00000000000000000000000000000000000101010404040101010000002C2C2C
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F75858580909090000000000
          000202020000000000000000000000000000000000000000001E1E1EC6C6C6FF
          FFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B40C0C0C020202080808
          1111110000000000000303030101010000000000000101010101010000000000
          000E0E0E8B8B8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FEFE
          FEFEFEFEFDFDFDFBFBFBFFFFFFFFFFFFE9E9E9635F60FDF9FAFEFCFDFFFEFFFF
          FFFFFDFBFBFDFDFDFCFCFCFFFEFEFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFA68F8F3403042C0206403131424343555555828A882A322F1200
          003B0F113C0D0F300B0C604B4A838984465853BABFBEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFEFFFDFDFDFCFBFCFFFFFFFEFEFEFDFDFD
          FFFFFFFFFFFF6E6E6ECBCBCBFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFEFE
          FEFDFDFDFFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF5F5F51010100000000606060000000000000101
          010000000000000000000B0B0B0A0A0A0A0A0A0000000000000101010000000F
          0F0FB9B9B9FEFEFEFFFFFFD9D9D90A0A0A0A0A0A070707010101000000000000
          0101010000000707070A0A0A1F1F1FF1F1F1FFFFFFBFBFBF0909090B0B0B0606
          060101010000000000000202020404040808080A0A0A343434FCFCFCFFFFFFFE
          FEFEFFFFFF4949490000000202020202020101010000000000000909090B0B0B
          0D0D0D0A0A0A0A0A0A0606060101010000000000000101010000000909090A0A
          0A373737FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF5C5C5C00000000000001
          01010000000000000505050C0C0C0C0C0C050505000000000000000000000000
          181818D0D0D0FFFFFFFEFEFEFEFEFEFCFCFCFFFFFFFFFFFF4141410000000505
          050303030202020101010000000000000000000B0B0B0B0B0B0F0F0F05050500
          0000020202000000000000929292FCFCFCFFFFFFFEFEFEFEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FEFEFEFEFEFEFCFCFCFBFBFBFBFBFBFFFFFF787878B4B3B3FFFEFEFFFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCECDB6BAB9AFBC
          B7B0BBB6B8BBB4BEB9B4B8A8A7471B1C34050723080A0C04044D414298909036
          33321C07062B12110B0000271D1967605D2C322E52645EBABDBCAFB4B3B2B9B8
          B0B5B4AEB4B3B3B7B7BDC2C1FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFF
          FFFDFDFDFEFEFEFFFFFFDBDBDB686868FEFEFEFEFEFEFCFCFCFEFEFEFFFFFFFC
          FCFCFDFDFDFCFCFCFBFBFBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F21B1B1B00000003030309090905
          0505000000292929464646A4A4A4E6E6E6E6E6E6E4E4E49F9F9F050505000000
          0303030000000A0A0AECECECFFFFFFF9F9F9E5E5E5E5E5E59494940000000101
          01030303000000000000AFAFAFE5E5E5E7E7E7FDFDFDFCFCFCF4F4F4E1E1E1E5
          E5E57A7A7A0000000202020202020202020B0B0BC5C5C5E5E5E5E6E6E6F7F7F7
          FFFFFFFFFFFFCBCBCB0606060303030B0B0B0000000404040000003D3D3DDFDF
          DFE2E2E2DBDBDBE5E5E5E5E5E5767676000000030303030303000000080808C9
          C9C9E5E5E5E9E9E9FDFDFDFCFCFCFCFCFCFDFDFDFFFFFFCFCFCF0A0A0A000000
          0606060303030000000D0D0DB4B4B4E5E5E5E5E5E5C3C3C34545450202020202
          02030303000000747474FBFBFBFFFFFFFCFCFCFDFDFDFBFBFBFFFFFF4E4E4E00
          00000B0B0B040404020202000000161616454545828282E4E4E4E3E3E3E5E5E5
          BFBFBF161616000000050505020202000000C0C0C0FFFFFFFAFAFAFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C6C6CCECECDFFFF
          FFFFFFFFFFFFFFF9F9F8FEFEFDF1EEEDC5C2C1C8C5C3B4B0AF757070140F0F00
          00000000000000000300001300002300003D0E103308092A080A20080A130102
          7667695242431F07071107052F3C353E4B433B3733201A1A3D4541323D3B2E35
          331116130D0F0D1215130001000001006769688F908FA7ACAAAFB4B2CFD4D2F3
          F7F6F6F6F6FAFAFAFAFAFAFFFFFFEEEEEE5F5F5FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFBFBFBFAFAFAFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F71F1F1F000000010101
          070707000000383838E2E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D
          9D0909090404040404040000007C7C7CFFFFFFFAFAFAFFFFFFFFFFFFABABAB00
          0000030303020202010101000000CCCCCCFFFFFFFDFDFDFDFDFDFEFEFEFEFEFE
          FFFFFFFFFFFF838383000000010101030303010101080808E5E5E5FFFFFFFFFF
          FFFCFCFCFFFFFFCCCCCC1C1C1C0000000404040404040404040000003E3E3EEB
          EBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878787000000030303020202000000
          0D0D0DEAEAEAFFFFFFFCFCFCFDFDFDFEFEFEFAFAFAFCFCFCFFFFFF5959590000
          000202020202020404040A0A0AB7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91
          9191000000020202000000090909E4E4E4FFFFFFFBFBFBFBFBFBFAFAFAFFFFFF
          4F4F4F0000000101010202020000001C1C1CCBCBCBFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFCBCBCB212121020202010101000000505050F2F2F2FAFAFAFC
          FCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFF5F5F5FBFBFBE2E2E2C5C5C5C9C9C951515169
          6C6A9497958A8C8B6667652E2D2C2D2B2B2C27261E18171D1515150B0B090000
          300B103B090F3D0D113F0F113E0C0C4910114A0D0E4F0E12500F14520F164D0D
          162B070D1408092B1F201D0808514E497D918786948C9286838B7B7A90919088
          8C8B8B8C8B7C7776827D7C918D8C7D7A796F6D6C5555535D5E5C383938373837
          4F5250595B5A4847485050507D7D7D8A8A8A777777444444CACACAC8C8C8C9C9
          C9D1D1D1ECECECEEEEEEF3F3F3FFFFFFFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2020200000
          00010101000000383838EAEAEAFFFFFFFEFEFEFEFEFEFAFAFAF9F9F9FFFFFFFF
          FFFFFAFAFA0C0C0C0000000202020000002E2E2EFFFFFFFDFDFDF9F9F9FFFFFF
          A1A1A1000000070707000000030303000000C6C6C6FFFFFFFAFAFAFCFCFCFEFE
          FEF7F7F7FCFCFCFFFFFF838383000000010101080808000000090909DDDDDDFF
          FFFFFBFBFBFFFFFFC4C4C41616160000000202020404040303030000003F3F3F
          F0F0F0FFFFFFFDFDFDFCFCFCFCFCFCFBFBFBFFFFFF7E7E7E0000000505050000
          000101010A0A0AE3E3E3FFFFFFFAFAFAFAFAFAFDFDFDFCFCFCFFFFFFC0C0C00D
          0D0D000000050505000000020202434343FFFFFFFFFFFFFAFAFAFAFAFAFDFDFD
          FFFFFFEEEEEE1F1F1F0000000202020303035F5F5FFFFFFFFDFDFDFDFDFDF8F8
          F8FFFFFF525252000000060606000000121212C7C7C7FFFFFFFDFDFDFAFAFAFC
          FCFCFBFBFBFDFDFDFFFFFFFFFFFF383838000000000000000000050505E6E6E6
          FFFFFFFDFDFDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000006E6E6E4747474F4F4F262626000000000000
          0000000000000000000000000000000C0B090602010000001008081107071105
          051C0D0E2A0A0D30070B33090C2E06072A05052506052208042007051D010027
          01032F03092B0F12110B0B000100170E0D4C474440433E453F3C533D3D524040
          454040473B3C4C3D3D5040414F41424A3E3E4A3F3F4B42424C45454642414845
          444C4A484D4B4A302F2E2727272E2E2E0D0D0D00000000000000000000000000
          00000000000E0E0E3E3E3E4040404343439A9A9AFFFFFFFBFBFBFCFCFCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADAD11
          1111010101000000383838E6E6E6FFFFFFFDFDFDFBFBFBFBFBFBFAFAFAFFFFFF
          FFFFFFFFFFFF9494940404040101010000000000003C3C3CFFFFFFFFFFFFFDFD
          FDFFFFFFA3A3A3000000000000060606030303000000C4C4C4FFFFFFF9F9F9FB
          FBFBFEFEFEFCFCFCFBFBFBFFFFFF8585850000000A0A0A010101000000080808
          DCDCDCFFFFFFFEFEFEFFFFFF4242420000000000000707070303030000003B3B
          3BECECECFFFFFFFBFBFBF8F8F8FEFEFEFBFBFBFBFBFBFFFFFF80808000000001
          01010707070000000A0A0AE1E1E1FFFFFFF9F9F9FCFCFCFFFFFFFCFCFCFFFFFF
          A6A6A6000000010101030303020202010101C1C1C1FFFFFFFDFDFDFBFBFBFDFD
          FDFEFEFEFBFBFBFFFFFF9393930000000505050000003D3D3DFFFFFFFDFDFDFD
          FDFDFBFBFBC7C7C72525250404040505051B1B1BC6C6C6FFFFFFFBFBFBFDFDFD
          FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFBBBBBB1717170202020202020000001212
          12E7E7E7FFFFFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007373738686866F6F6F4A4A4A3030
          305757572B2B2B2F3331454A474346443F403F323230232120413D3C443F3E43
          3B3B4036365C52527877746867636B6662706A666C6A64676C65647369566A61
          61736C606D695F65627C706F3A32300A0C0A10100D0500001A09061D03032304
          061A06061107061602031F090A16030510000012030417090903000000000000
          00000804040604030100001818182323242121212E2E2E4646463E3E3E222222
          7373736B6B6B595959949494BBBBBBBEBEBEBBBBBBD2D2D2FCFCFCF7F7F7FEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          4A4A4A000000000000181818EDEDEDFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFD9D9D9BABABA3535350000000202020000000000000000002A2A2AFFFFFFFF
          FFFFFAFAFAFFFFFFA7A7A7000000020202030303010101000000C4C4C4FFFFFF
          FDFDFDFFFFFFFFFFFFFDFDFDFDFDFDFFFFFF8585850000000404040000000000
          00070707DEDEDEFFFFFFFFFFFF8A8A8A0D0D0D01010104040404040404040400
          0000A1A1A1FFFFFFFEFEFEFDFDFDFBFBFBFFFFFFFFFFFFFEFEFEFFFFFF848484
          000000030303040404000000090909E1E1E1FFFFFFFDFDFDFFFFFFFEFEFEFCFC
          FCFFFFFFACACAC000000020202050505010101000000BCBCBCFFFFFFFDFDFDFC
          FCFCFFFFFFFEFEFEFEFEFEFFFFFF939393000000020202000000474747FFFFFF
          FDFDFDFDFDFDFFFFFF838383000000010101000000C5C5C5FFFFFFFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFDCDCDCD1D1D14C4C4C0B0B0B03030302020200000000
          0000030303E7E7E7FFFFFFFAFAFAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFBFBFBFFFFFF6D6D6DC4C5C5FFFFFFFFFFFFF7F7F7BBBBBBB2B2B2B9B8B8
          A09F9F787676777575565555171C190F1A122227213D3C384B47444643415756
          555D6361525D5B5568666376733B332F1F0B07261C17827C773328271A09082F
          10122C090B250A0A1605031106031106060E02030800000000000A04055C5858
          707070717272A6AAA9BAC0C0A8AFAEE0E4E4FFFFFFFBFBFBFAFAFAFFFFFFE7E7
          E75E5E5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFA5A5A54E4E4E000000757575FFFFFFFFFFFFFFFFFFFFFFFF98989891
          91917070700202020000000000000202020101010000000101010000007D7D7D
          FFFFFFFDFDFDFFFFFFFFFFFFA6A6A6000000000000000000000000000000C6C6
          C6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF86868600000003030303
          0303000000050505EAEAEAFFFFFF8F8F8F000000000000050505020202020202
          000000878787FFFFFFFEFEFEFDFDFDF9F9F9FEFEFEFEFEFEFAFAFAFEFEFEFFFF
          FF838383000000000000000000000000080808E4E4E4FFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFFFFFFB0B0B0000000000000000000010101000000BFBFBFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9292920000000202020000004545
          45FFFFFFFDFDFDFFFFFFFAFAFAC4C4C4626262000000434343FBFBFBFFFFFFFF
          FFFFFFFFFFADADAD9090908686860E0E0E000000000000000000030303000000
          010101000000515151F3F3F3FDFDFDFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFEFEFEFFFFFFFFFFFF6C6C6CC5C5C5FEFEFEFFFFFFFEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E6B5B4B4797C77191A191E1F1D15171512
          12121514141F2121090C0B1319191217161E0E0A280F062B1C177F7672857C79
          1B0F0F1B0205270A0B462D2D36272628211E56504EB2ABADBCB7B9BAB9B9B7B8
          B8F9F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE7E7E75C5C5CFFFFFFFFFFFFFDFDFDFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAFAFABABABAFFFFFFFBFBFBD1D1D14F4F4F3E3E3E
          0000000000000000000000000101010202020606060202020505050000000C0C
          0CE9E9E9FFFFFFFCFCFCFFFFFFFFFFFFA6A6A600000000000000000000000000
          0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF868686000000
          0303030404040303030505053D3D3D4545450000000202020505050606060303
          030000005C5C5CE9E9E9FCFCFCFFFFFFFEFEFEF9F9F9FBFBFBFEFEFEFBFBFBFE
          FEFEFFFFFF838383000000000000000000000000080808E4E4E4FFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDFFFFFFAFAFAF000000000000000000010101000000BEBE
          BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92929200000002020200
          0000454545FFFFFFFFFFFFFEFEFEFAFAFAFFFFFFFFFFFFB9B9B9FAFAFAFFFFFF
          E2E2E26161614545450202020000000000000202020000000202020404040404
          04020202000000000000C2C2C2FFFFFFFCFCFCFAFAFAFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFCFCFCFCFCFCFAFAFAFFFFFF5D5D5DCCCCCCFFFFFFF9F9F9FDFDFDFB
          FBFBFCFCFCF9F9F9FCFCFCFBFBFBF9F9F9FEFDFDFFFFFFFFFFFFF5F3F4F4F6F5
          EBF3F1EEF8F6F6FDFC6B6E6D777574716969120304260A073415111C0B0A7974
          6F64625F221C1C291A1B1200004F3C3CE1DFDEF6F5F3FDFBFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFDFDFDFDFBFCFCF9FCFCFBFEFEFAFCFCFEFEFEFEFDFD
          FAFAFAFDFDFDEEEEEE515151FCFCFCFCFCFCFBFBFBFCFCFCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFB9B9B95454540808080000
          0000000007070705050502020200000002020205050506060603030300000010
          1010B8B8B8FCFCFCFCFCFCFAFAFAFEFEFEFFFFFFA6A6A6000000000000000000
          000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF8686
          8600000005050505050507070704040400000000000000000004040402020203
          03030505050101010F0F0F0D0D0D555555B2B2B2FFFFFFFEFEFEF8F8F8FCFCFC
          FDFDFDFDFDFDFFFFFF838383000000000000000000000000080808E4E4E4FFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFAFAFAF00000000000000000001010100
          0000BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF929292000000
          020202000000464646FFFFFFFDFDFDF9F9F9FBFBFBFCFCFCFFFFFFFFFFFFD2D2
          D27B7B7B0B0B0B00000000000000000001010104040408080805050505050502
          02020303030000000000008F8F8FFCFCFCFDFDFDFBFBFBFDFDFDFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFDFDFDFAFAFAFDFDFDFCFCFCFAFAFABEBEBE818181FAFAFAFBFBFB
          FEFEFEFAFAFAFCFCFCFDFDFDF6F6F6FBFBFBFBFCFBFFFFFFFFFAFCFFFBFCFFFF
          FFFDFFFFFCFFFFFFFFFF969D9A52514F83797754403F24090A2B0604320F0C2B
          18157977735C625E1B1E1C655F5E332526010000ABA6A3FFFFFFFFFFFFFEFCFC
          FEFBFCFEFBFCFEFBFCFFFEFEFFFFFFFFFFFFF9F9F9FAFBFBFDFEFDFBFBFBF9F9
          F9FAFAFAF9F9F9FFFFFF8D8D8DA8A8A8FAFAFAFBFBFBFEFEFEFBFBFBFBFBFBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF98989801010100000000
          00000303030505050C0C0C060606020202010101020202000000000000000000
          1D1D1DB8B8B8FFFFFFFEFEFEFCFCFCFEFEFEFEFEFEFFFFFFA6A6A60000000000
          00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFF
          FFFF868686000000030303030303030303020202000000000000000000000000
          000000000000000000010101000000000000000000000000989898FFFFFFF9F9
          F9FAFAFAFBFBFBFDFDFDFFFFFF838383000000000000000000000000080808E4
          E4E4FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFAFAFAF000000000000000000
          010101000000BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9292
          92000000020202000000454545FFFFFFF8F8F8FCFCFCFDFDFDFCFCFCFFFFFFC0
          C0C0141414000000020202030303030303030303040404020202020202040404
          0101010000000000000D0D0D8E8E8EFFFFFFFFFFFFF9F9F9FCFCFCFCFCFCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFEFEFEFCFCFCFAFAFAFCFCFCFEFEFEF4F4F4545454FDFD
          FDFFFFFFFAFAFAFCFCFCFEFEFEFAFAFAFCFCFCFBFBFBFBFCFBFEFDFDFFFAFBFF
          FCFDFDFAFBFEFEFEFBFBFB8F8F90514E4D5F5755231312260F0C1900002D0302
          37100C23100D6667637F8B86262D2B4C4E4D453F3F231C1B201A18C3C2BEFFFF
          FFFFFFFFFDFCFCFFFEFEFDFCFCFEFEFEFFFFFFFFFFFFFFFEFEFFFEFEFEFBFCFD
          FDFDFBFBFBFCFCFCF9F9F9FFFFFF5D5D5DD6D6D6FFFFFFFCFCFCFAFAFAFBFBFB
          FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF939393000000000000
          0303030808080202020101010101010303030000000000000000001818184D4D
          4D878787F0F0F0FFFFFFFEFEFEFCFCFCFDFDFDF8F8F8FEFEFEFFFFFFA6A6A600
          0000000000000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFEFEFFFFFF8686860000000101010404040303030505054545455050504F4F
          4F4E4E4E4E4E4E4E4E4E47474700000000000002020205050500000000000090
          9090FBFBFBFCFCFCFCFCFCFEFEFEFFFFFF838383000000000000000000000000
          080808E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFAFAFAF0000000000
          00000000010101000000BEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF929292000000020202000000424242FFFFFFFEFEFEFAFAFAFEFEFEFFFFFF
          BDBDBD1212120000000101010202020000000000000202020000000000000000
          000000000404044C4C4C686868EAEAEAFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFD
          FDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFDFDFDFFFFFFFEFEFEFFFFFFEFEFEF5E
          5E5EFAFAFAFFFFFFFCFCFCFFFFFFFFFFFFFCFCFCFEFEFEFFFFFFFEFEFEFEFFFF
          FBFEFEF7F9FAFDFCFEFFFFFFF6F2F56E5F616450511C07071100003627266254
          521D0000370E0C2A17147376715D6C67434F4CD0D2D2848383463F3F14111016
          1413C3C3C2FFFFFFFDFDFDF9F9F9FDFCFCFDFCFCFFFFFFFFFEFFFFFEFFFFFEFF
          FFFEFFFFFFFFFFFFFFFCFCFCFEFEFEFDFDFD686868D1D1D1FFFFFFFDFDFDFFFF
          FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F21414140000
          00010101040404010101000000000000000000050505040404535353989898CD
          CDCDFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFEFEFCFCFCFFFFFFFEFEFEFFFFFF
          A6A6A6000000000000000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFEFEFEFFFFFF868686000000040404020202000000080808EBEBEBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2414141030303040404050505
          0000000C0C0CEFEFEFFFFFFFFCFCFCFFFFFFFFFFFF8383830000000000000000
          00000000080808E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFAFAFAF00
          0000010101010101000000000000BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF929292000000020202000000454545FFFFFFFEFEFEFEFEFEFEFE
          FEFDFDFD3E3E3E00000003030305050503030300000000000000000008080806
          0606343434989898B3B3B3FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFDFDFD
          FEFEFEFCFCFCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFDFDA6A6A6878787FFFFFFFEFEFEFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFFFFF4FFFFF3FDFDFFFFFFF3F1F27F6E7165464A2C0A0E130000908685E8
          E7E6C3BEBB251312300C0B2B191670736F4C5B582D3633FFFFFFFFFFFFA7A5A5
          3C3837121310121211B8B9B9FFFFFFFAFAFAFAFAFAFFFFFFFFFFFFFFFEFFFFFE
          FFFFFEFFFFFEFFFFFFFFFCFCFCFEFEFEFFFFFFA3A3A38A8A8AF9F9F9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73737304
          04040404040505050606060000000C0C0C3D3D3D6E6E6EDCDCDCDDDDDDF7F7F7
          FFFFFFFFFFFFFFFFFFF3F3F34C4C4C444444C2C2C2F2F2F2FFFFFFFCFCFCFFFF
          FFFFFFFFA6A6A6000000000000000000000000000000C6C6C6FFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEFFFFFF8686860000000A0A0A010101000000060606
          DEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F02020200000
          000303030303030303036D6D6DFFFFFFFDFDFDFFFFFFFFFFFF83838300000000
          0000000000000000080808E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFF
          AFAFAF000000010101020202030303000000B9B9B9FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF929292000000020202000000444444FFFFFFFDFDFDFC
          FCFCFFFFFFA0A0A00909090000000202020505050303030000003B3B3B4F4F4F
          D6D6D6DDDDDDE9E9E9FFFFFFFFFFFFFEFEFEFFFFFF747474292929B6B6B6EDED
          EDFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB1B1B1757575FFFFFFFFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFDFFFFF3FFFEF7FFFEF2F3F3766C6D4B2F322B090C1B0000948789
          FFFFFFFFFFFFFFFFFF6D55531C00002517146F747043514E2C3332F7FDFDFEFD
          FEFFFFFFADADAC3939380506062C2C2CFFFFFFFFFFFFFCFBFBFCFCFCFFFFFFFF
          FFFFFFFFFFFFFEFFFFFEFFFEFEFEFCFCFCFFFFFFFFFFFF9494948E8E8EFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5A5A5A0000000505050202020404040E0E0EB6B6B6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFAFAFAFFFFFFF4F4F44E4E4E000000000000000000D7D7D7FFFFFFFD
          FDFDFFFFFFFFFFFFA6A6A6000000000000000000000000000000C6C6C6FFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF8686860000000303030707070000
          00090909DDDDDDFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFBFBFBFBFBFBFFFFFF28
          2828000000020202010101000000545454FFFFFFFEFEFEFDFDFDFFFFFF838383
          000000000000000000000000080808E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFFFFFAFAFAF000000010101020202030303000000BDBDBDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF929292000000020202000000454545FFFFFF
          FCFCFCFBFBFBFFFFFF909090000000040404020202040404000000848484FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFF7D7D7D00000000000000
          0000A5A5A5FFFFFFFCFCFCFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF1F1F1747474C3C3C3FFFFFFFEFEFEFCFCFCFFFFFF
          FFFFFFFFFFFFFFFFFFFEFFFFF6FBFAFFFFFF7A7776392E2E1501025D4B4BD4CE
          CFFFFEFFFFFBFCFBFBFAFFFFFF6452511A00001F13116D716F3D47442A2E2EFC
          FCFCFFFCFDFEFAFBFFFFFFADAFAE373737000000828282FFFFFFFDFCFCFEFDFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFEFEFEFFFFFFDEDEDE6A6A6AEBEB
          EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF535353000000010101010101000000ACACACFFFFFFFBFBFBFFFFFFFE
          FEFEF8F8F8FCFCFCFFFFFFF5F5F55151510000000101010000007D7D7DF9F9F9
          FCFCFCFBFBFBFDFDFDFFFFFFA6A6A6000000000000000000000000000000C6C6
          C6FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFF86868600000000000004
          0404010101090909DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E9E9E91F1F1F0000000202020000000000005A5A5AFFFFFFFDFDFDFBFBFBFFFF
          FF838383000000000000000000000000080808E4E4E4FFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFFFFFFAFAFAF000000010101030303020202000000B9B9B9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9292920000000202020000004545
          45FFFFFFF8F8F8FBFBFBFFFFFF8D8D8D000000030303030303000000797979FF
          FFFFFFFFFFFBFBFBFDFDFDFBFBFBFDFDFDFFFFFFFFFFFF7A7A7A000000000000
          0000004C4C4CECECECFAFAFAFBFBFBFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF707070B2B2B2FFFFFFF9F9F9FDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D5D31E1B1B000000514948F5
          F4F4FFFFFFFEFBFCFDFCFDFCFBFDFFFFFF625050180201261C1A777B78353B3A
          212324FFFEFFFEF8FAFDF6F9FEFDFDFFFFFFFDFDFD6B6969000000817F7FFFFF
          FFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFEFFFFFDFEFEF9F9F9FFFFFFD9D9D959
          5959FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFA5A5A5070707000000010101000000D0D0D0FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFA8A8A84646460000000606060303030000009696
          96FFFFFFFCFCFCFBFBFBFFFFFFFFFFFFACACAC00000000000000000000000000
          0000CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B000000
          0303030303030202020B0B0BE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF969696353535010101030303010101030303000000535353FFFFFFFFFFFFFF
          FFFFFFFFFF888888000000000000000000000000080808ECECECFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFB5B5B5000000030303060606010101000000C0C0
          C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97979700000002020200
          0000484848FFFFFFFFFFFFFDFDFDFBFBFBC7C7C71C1C1C000000070707000000
          969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD6565650000000000
          000202020000005D5D5DFFFFFFF9F9F9FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB7E7E7EE4E4E4FC
          FCFCFDFDFDFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFD4D2D01A14131A1614B8B8B6
          F3F2F2FFFFFFF9FDFCFAFEFDFAFBFCFDFBFDFFFFFF534343110000180D0B6F71
          6F303433171718FFFEFFFFFEFFFFFBFDFFFDFEFDFFFEFFFFFFFFFFFF6E6C6D00
          0000817F7FF6F6F6FFFFFFFEFEFEFFFFFFFFFFFFFDFFFFFDFEFEFAFAFAF1F1F1
          858585C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C2C2C0000000303030202022D2D2D7E7E
          7EDFDFDFDADADADFDFDFB9B9B93E3E3E00000000000000000002020200000009
          0909A2A2A2FFFFFFFBFBFBF6F6F6DEDEDEE0E0E0929292000000000000000000
          010101010101AEAEAEE0E0E0E2E2E2FDFDFDFFFFFFF6F6F6DFDFDFE0E0E07676
          760000000202020202020202020707073434343E3E3E3E3E3E3E3E3E3E3E3E3E
          3E3E3A3A3A000000000000060606030303010101010101060606CDCDCDFFFFFF
          F5F5F5DFDFDFE0E0E0737373000000000000000000010101080808C9C9C9E0E0
          E0E5E5E5FFFFFFFCFCFCDEDEDEE0E0E09A9A9A00000000000001010101010100
          00003E3E3ED9D9D9E1E1E1FCFCFCFFFFFFF8F8F8E0E0E0E0E0E0808080000000
          0202020000001010109B9B9BE0E0E0EDEDEDFCFCFCFFFFFF6363630000000101
          010101012323235C5C5CE0E0E0DFDFDFE0E0E0D2D2D24A4A4A0C0C0C00000000
          0000050505010101040404717171FFFFFFFCFCFCFCFCFCFDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFB4B4B4
          707070FFFFFFFEFEFEFCFCFCFBFBFBFEFEFEFDFDFDFFFFFF292727111111D1D0
          CFFFFFFFFFFFFFFCFCFCFEFFFFFDFFFFFFFFFFFFFFFFFFFFFF958D8E1405061B
          0F107A7675313231606262FFFFFFFEFFFFFFFEFFFFFEFFFFFFFFFCFBFBFFFFFF
          FFFFFF6C6B6B000000BEBEBEFFFFFFFBFBFBFEFEFEFEFEFEFDFDFDFEFEFEFFFF
          FF8D8D8D8F8F8FFFFFFFFBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCD1D1D124242400000003030300
          0000000000050505050505050505000000000000000000000000000000010101
          000000464646FDFDFDFDFDFDFEFEFED7D7D70707070505050303030000000000
          000000000202020303030505050505051B1B1BF0F0F0FFFFFFBCBCBC05050508
          08080A0A0A000000000000000000000000000000000000000000000000000000
          000000000000000000000000020202040404030303000000000000535353FFFF
          FFFFFFFFBABABA05050505050503030300000000000000000003030302020207
          0707050505343434FFFFFFE0E0E00E0E0E050505040404010101000000000000
          000000000000000000040404131313EAEAEAFFFFFFC7C7C70505050505050303
          03000000000000000000000000000000050505808080FFFFFFFEFEFEF0F0F046
          4646000000030303000000000000050505050505050505040404000000000000
          000000000000040404000000181818F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFDFD
          FDEDEDED717171C6C6C6FFFFFFFBFBFBF9F9F9FBFBFBF2F2F2999999878787D3
          D3D3FFFFFFF8F8F8FCFCFCFCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5F6
          2315161F13136F6A69424140DBDEDEFFFFFFFCFFFFFEFFFFFFFEFFFFFDFFFEFE
          FEFCFCFCFFFFFFFEFEFEB0B0B07E7E7ED7D7D7FFFFFFFEFEFEFEFEFEFDFCFCFE
          FEFEDFDFDF666666E1E1E1FEFEFEFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD9D9D92E2E2E
          0000000000000000000000000000000000000000000202020000000202020A0A
          0A020202010101595959FFFFFFF9F9F9FFFFFFD7D7D700000000000000000000
          0000000000000000000000000000010101000000121212EEEEEEFFFFFFBBBBBB
          0000000000000101010000000000000000000000000000000000000000000000
          000000000000000000000000000000000202020000000000000B0B0B575757F6
          F6F6FEFEFEFFFFFFB9B9B9000000000000000000000000000000000000000000
          0000000101010000002D2D2DFFFFFFDEDEDE0808080000000000000101010000
          000000000000000000000000000000000A0A0AE9E9E9FFFFFFC4C4C400000000
          00000000000000000000000000000101010000000000007A7A7AFFFFFFFDFDFD
          FFFFFFF2F2F24E4E4E0000000000000000000000000000000000000000000000
          000000000000000C0C0C0202020000002A2A2AFAFAFAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
          FCFCFDFDFDFFFFFFADADAD7E7E7EFEFEFEFCFCFCFBFBFBFCFCFCD1D1D1999999
          FFFFFFFFFFFFFCFCFCFBFBFBFCFCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFEDE9EA221515180E0E666160444343EAECECFFFFFFFCFFFFFEFFFFFFFEFFFF
          FEFFFEFDFDFEFEFEF9F9F9FFFFFFFFFFFFD2D2D29C9C9CFEFEFEFAFAFAFBFBFB
          FCFCFCFFFFFF989898929292FFFFFFFDFDFDFCFCFCFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFFFF
          FFD8D8D85555554646460000000000000000000000000000000000003E3E3EA2
          A2A2414141000000000000DFDFDFFFFFFFFBFBFBFFFFFFD5D5D5000000000000
          0000000000000000000000000000000000000000000000000A0A0AEFEFEFFFFF
          FFB5B5B500000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000060606545454CFCFCF
          FDFDFDFFFFFFFDFDFDFFFFFFB6B6B60000000000000000000000000000000000
          00000000000000000000000000252525FFFFFFDFDFDF00000000000000000000
          0000000000000000000000000000000000000000000000E8E8E8FFFFFFC2C2C2
          000000000000000000000000000000000000000000000000000000737373FFFF
          FFFCFCFCF9F9F9FFFFFFF6F6F665656552525200000000000000000000000000
          00000000002828288585856D6D6D000000000000B0B0B0FEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBFBFBF9F9F9FCFCFCFFFFFFA4A4A48B8B8BFFFFFFFFFFFFFBFBFBFCFC
          FCFFFFFFFEFEFEFCFCFCFDFDFDFEFEFEFCFCFCFDFDFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFECE8E92417181C131364605F3E3D3DEAEDEDFFFFFFFCFFFFFEFFFF
          FFFEFFFFFEFFFEFEFEFFFFFFF9F9F9FAFAFAFCFCFCFFFFFFFFFFFFF8F8F8FBFB
          FBFEFEFEFFFFFFA2A2A28C8C8CFFFFFFFDFDFDFBFBFBFAFAFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFD
          FDFDFEFEFEFFFFFFFFFFFFFFFFFFA3A3A3A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
          F9F9F9FFFFFFB9B9B9A0A0A0A2A2A2F9F9F9FDFDFDFBFBFBFFFFFFECECECA0A0
          A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09D9D9D9E9E9E9F9F9FA5A5A5F8
          F8F8FEFEFEDEDEDE9B9B9BA0A0A09E9E9EA1A1A1A0A0A0A0A0A0A0A0A0A0A0A0
          A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09E9E9EA2A2A29E9E9EB5B5B5FFFF
          FFFFFFFFFFFFFFFCFCFCFCFCFCF9F9F9E3E3E39E9E9EA0A0A0A0A0A0A0A0A0A0
          A0A0A0A0A0A0A0A09C9C9C9F9F9F9F9F9FAFAFAFFDFDFDF2F2F29F9F9F9F9F9F
          A0A0A0A1A1A1A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09E9E9EA3A3A3F3F3F3FFFF
          FFE6E6E69D9D9D9F9F9FA0A0A0A0A0A0A0A0A0A0A0A09F9F9F9D9D9D9E9E9ECA
          CACAFBFBFBFDFDFDF8F8F8F7F7F7FFFFFFFFFFFFFFFFFFB2B2B2A0A0A0A0A0A0
          A0A0A0A0A0A0A0A0A0E0E0E0FFFFFFCECECE9C9C9CA0A0A0EAEAEAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFCFCFCFBFBFBFEFEFEFDFDFDFFFFFFA0A0A0898989FDFDFDFD
          FDFDFDFDFDFDFDFDFEFEFEFAFAFAFCFCFCFEFEFEFCFCFCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFEAE7E71F16161813125652515C5B5AF7F8F8FFFFFFFDFF
          FFFEFFFFFFFEFFFFFEFFFFFFFFFDFDFDF8F8F8F8F8F8F8F8F8FBFBFBFDFDFDFB
          FBFBFEFEFEFFFFFF9D9D9D8D8D8DFDFDFDFEFEFEFDFDFDFCFCFCFCFCFCFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEFAFAFAFEFEFEFDFDFDFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFCFCFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEF9F9F9FBFBFBFDFDFDFDFDFDFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FDFDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFCFCFDFDFDFDFDFDFCFCFCFCFCFCFBFBFBFDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFA5A5A5
          8B8B8BFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF3F1F12C2726191514413F3E7E7D7CFFFFFFFE
          FFFFFEFEFFFFFEFFFFFEFFFFFEFFFEFEFEFAFBFAFDFDFDFBFBFBFEFEFEFEFEFE
          FDFDFDFFFFFFFFFFFF9F9F9F909090FFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFCFCFC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFD
          FDFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFFFFFFA3A3A3878787FFFFFFFFFFFFFEFEFEFBFBFBFBFBFBFCFCFCFCFCFCFD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD686464110E0D424140858584
          FFFFFFFDFFFFFEFEFFFFFEFFFFFEFFFFFEFFFDFDFDFCFCFCFCFCFCFDFDFDFDFD
          FDFEFEFEFFFFFFFFFFFF9A9A9A909090FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFCFCFCFFFFFFAAAAAA646464B6B6B6FFFFFFFFFFFFF9F9F9FEFEFE
          FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE5B5A591819173D3E
          3C858685FFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFEFFFEFEFEFCFCFCFFFFFFFA
          FAFAFFFFFFFFFFFFCDCDCD6B6B6B969696FFFFFFFEFEFEFEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFBEBEBE8080809C9C9CE0E0E0FFFF
          FFFDFDFDFAFAFAFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8083810E
          110F2F302EA9AAA9FFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFEFFFCFCFCFBFBFB
          FBFBFBFFFFFFEFEFEFABABAB7D7D7DB5B5B5FEFEFEFFFFFFFCFCFCFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFAFAFAFCFCFCFFFFFFFBFBFB7D7D7D6D
          6D6D898989FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          ACAFAE020503262725CDCECDFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFFFFFFFF
          FFFFFFFFFFFFFF9898987474746C6C6CF0F0F0FFFFFFFEFEFEFAFAFAFDFDFDFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFCFCFCFEFEFEFCFCFCFBFBFB
          FFFFFFE3E3E39797975A5A5AA5A5A5D3D3D3F6F6F6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFABADAC010101212220D8D8D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFD3D3D3B6B6B65F5F5F8F8F8FD0D0D0FFFFFFFCFCFCFBFBFBFFFFFFFDFDFD
          FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDFFFFFFFFFFFFE5E5E59292926464647E7E7E949494949494ED
          EDEDFFFFFFFFFFFFB7B7B7020102343434F4F3F3FFFFFFFFFFFFFCFCFC999999
          9494948686866464647F7F7FE5E5E5FFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFDFDFDFEFEFEFDFDFDFFFFFFFFFFFFCBCBCB959595
          9595956E6E6E6464646767674848480000001B1B1B6F6F6F6868686464646868
          68939393959595B8B8B8FFFFFFFFFFFFFCFCFCFFFFFFFDFDFDFDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFAFAFAFBFBFBFEFEFEFFFF
          FFFFFFFFFFFFFFE2E2E2D4D4D4D7D7D7C3C3C32323232A2A2AD9D9D9D5D5D5D4
          D4D4D9D9D9FFFFFFFFFFFFFFFFFFFEFEFEFBFBFBFAFAFAFEFEFEFDFDFDFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFEFEFEFDFDFDFCFCFCFAFAFAFE
          FEFEFAFAFAF9F9F9FEFEFEFFFFFFFFFFFFFFFFFFE9E9E9292929474747FFFFFF
          FFFFFFFFFFFFFFFFFFFCFCFCFBFBFBF9F9F9FEFEFEFAFAFAFCFCFCFCFCFCFFFF
          FFFCFCFCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFBFBFBFAFAFAFDFDFD
          FEFEFEFEFEFEFDFDFDFCFCFCF7F7F7FAFAFAFCFCFCFEFEFEC8C8C81919195353
          53FFFFFFFEFEFEFCFCFCFCFCFCF5F5F5F9F9F9FCFCFCFDFDFDFEFEFEFDFDFDFB
          FBFBFCFCFCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFEFE
          FEFCFCFCFFFFFFFFFFFFFEFEFEFCFCFCFFFFFFFCFCFCFDFDFDFDFDFDFFFFFF60
          6060767676FFFFFFFCFCFCFDFDFDFCFCFCFFFFFFFCFCFCFEFEFEFFFFFFFFFFFF
          FCFCFCFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF6262628E8E8EFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFDFDFFFFFF696969BEBEBEFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFFFFFF646464CCCCCCFFFFFFFDFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080D3D3D3FFFFFFFDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDEEEEEEF8F8F8FBFBFBFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000}
        mmHeight = 15081
        mmLeft = 89429
        mmTop = 3175
        mmWidth = 52388
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DCA - DANGEROUS CARGO APPLICATION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5969
        mmLeft = 23257
        mmTop = 29369
        mmWidth = 96097
        BandType = 4
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170B6310000424DB63100000000000036000000280000007F00
          0000210000000100180000000000803100000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFD
          FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFD
          FDFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFF
          FFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFF
          FEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFEFEFEFFFFFF
          FFFFFFFEFEFEFDFDFDFCFCFCF8F8F8FDFDFDFEFEFEFDFDFDFDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFE
          FEFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFFFEFEFEFEFEFEFAFAFAFDFDFDFEFEFEFDFDFDFCFCFCFEFEFEFEFE
          FEFEFEFEFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFCFCFCFCFCFCFDFDFDFDFDFDFFFFFFFFFFFFFDFDFDFBFBFBFBFBFB
          FEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFFFF
          FFFFFFFFFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFDFDFDFEFEFEFEFEFFFCFCFCFCFCFCFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFE
          FEFDFDFEFDFDFEFDFDFDFCFCFCFBFBFCFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFEFEFEFEFEFEFBFBFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFAF9FAFAFA
          FAFBFBFBFBFBFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFEFEFDFEFEFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFE
          FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFEFCFCFCFDFDFEFEFEFEFDFDFDFDFDFCFAFAFAFDFDFDFBFCFCFBFBFBFBFBFB
          FEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFE
          FFFEFEFEFDFDFDFBFBFBFCFCFDFBFCFCFDFDFDFDFDFDFDFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFCFCFCFFFFFFFFFFFFFCFEFFFBFDFDFDFDFEFDFDFEFEFCFD
          FEFDFEFEFCFDFDFCFDFEFDFCFEFCFEFCFDFFFCFEFFFEFEFFFEFFFFFAFEFFFCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFCFDFEFDFDFDFE
          FDFDFDFDFDFDFDFDFAFAFAFCFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFCFFFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFBFEFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFFFDFDFFFFFDFFFFFFFEFFFDFDFDFDFDFDFEFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFCFDFDFCFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFCFDFE
          FEFEFEFEFFFFFDFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFCFC
          FCFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFDFDFDFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFAFCFDF7EDE9F4E5D0FDF1DBFCFFF7FEFFFFFDFFFEFBFFFF
          FBFEFFFDFFFFFDFFFFF6FCF3FBFCF8FBFAF8F8FBF1F7FBE8F0F5E2F1ECE0F5E9
          D9F3E3CAEEDBC3E5D6C6E2D5C8E8D9CDE7D6CDF0E0DEFCF4F1FFFFFFFAFCFCF6
          FCFCFCFDFDFDFDFDFBFCF9EFF1EBE9EBE6F1E9E5F0E6E3F0E7E4F2E9E6F3EAE6
          EFE9E5F4E8E5F8E7E7EDDEE1F0E1E5F3E6E5F1E6E2F1E3E2F1E7E8F6FBF3F3F7
          F2E7E4E1E3DED5E4DDD8F5EAE7FBFCFAFEFFFFFDFEFEEDECEDEBDEE1E9DCDCEF
          DDDBEFDCDAF3DFDEEDD8D7F3E0DEEDDDDAEDDDDAF0E2DFF4E1DFF0D9D6ECE0D9
          F9F0E9FDFDF9FEFFFFFBFFFFFCFDFDFDFDFDFEFDFBECF2EBDCD6D1E5D6D3DCCE
          CBEFE5E4F8FEFDF8FBFBFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDF8
          F5F4E4D2CFEACDCCE9CFD1DCD1D4E3D8D9D9CDCAD7C7C5E1CCC8E6CFC9FCEDE7
          FFFDFDFBFDFDF9FEFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFBFE
          FAF4F3EED5CBC7D7C4C2DAC7C4D9CAC3F4EFEAF7FDFDFCFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFCFCFBFEFEE4CFC9CDA07FE9B587EAD2B0EADAC3F5E5CEFBEED7
          F9ECD5F6E8CFF4E6D1F1E8C1F1DCB3EFD3AAF2C99EF4BC8BE7AE7DE4A671DA9F
          6DCF9165C5835EB47A5DB0755DA96D57AA6B55B47864BC9981D4BFACF4ECE6F6
          FAFBFCFDFDFEFEFEF5F8F5A8A6A081706D8D6E6D8B6B6B8E6F6E8F6F6E907070
          8A716F966E6E9E6E708B65638F69678F6968946D6E89696AA06F77F6D4D2D3DE
          D8867D7B836660826260A77B7DF6DDE0FFFFFFFBFCFCABABAA86656B8B636791
          5F6293636599696B9665679768699165669166678F666799676A9863658C6762
          987570A18580D8B3B1FBEEE9FFFFFFFEFEFFFCFCFBB4B6AF7E6160845C5C7B55
          56B0918AFBF9EDF9FCFBFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFD3
          CFCE7E5D5D8753568757577A5D58C49B9A8876737F50528255527E574EC3918B
          FFF3EAFFFCFFFEFBFFFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFDFF
          FCCACAC46C5F5B7353527655547F5552D4B8B5FDFDFEFCFDFDFDFDFDFFFFFF00
          0000FDFDFDFCFBFBFCFDFEEEE4DBC49B7AD1925ED59B64D39C60E1AC6CEAB873
          E9B97CDFB269E2AB65E9B06CF0BA67ECB26CF0B35EF3A659EEA154E89C59E098
          5DCE8A52C47E4ABB7149BB714CBC714BBA6C48B469478F653C8E6244E0B9ABFE
          FAFBFDFDFEFEFEFFF6F9F68F8C875A403F6543436644446A4649694449644542
          6D444568454863474566463F65453F6345436745456044447A484DEFB9B6D3D7
          CF5B504E654543624442764547DFB4B1F9FFFBF9F9FC9392955F3E436D434469
          46446A4A476745486C464B6F484B6C46466A4545654946664B47664946624746
          624443694542844A4AAF7C7BECDBD9FFFFFEFEFEFBB9B1AD704D4E6C47476644
          448F655EF8EADBFBFDFBFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFC8
          C3C36B4C4B674545684B49744E49D9ACA3A19D946644486D3E416C47497D4C4F
          D7B2ACFDFAF9FCFCFFFEFEFEFEFEFEFDFDFDFEFEFEFDFDFDFEFEFEFEFEFEFDFE
          FBA99F9B6047456C4949684D4C784A47DDBAB9FFFEFFFDFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFFFFFFF4F2E6CEA282DE8F5CEBA554E9A94DE7A84CE0AB50
          DDAE5DE0B765E0BC73E4BF78F4CB80F6CF96EDCD81EFC786E9C181E4C088DBB7
          81D7B17CD7A97AD39A71BF885FB4764DBF784EBD7446A3694B8F5C44D8A58BF8
          FAF3FDFDFFFEFEFEFDFDFA9C9E985F4746714C4C704B4B704C4D6D49496E4743
          6645415F443F5E464060453F60453F6344436D4344694143664141CDADA3E9EB
          E0786D6A624847724C4C744547D49D94F8FEF8FCF9FEC0BBC2694F51724C4A6C
          4B466F48446C4548664246674749634746684B4A6A4B466848426A4B46654644
          6D4444754949744C4D704444936562DCD2CAFAFFF8D6D0CB6E5654704C4C6E4A
          4B80504DE4C9C0FAFDF8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2
          E1E07D646377494A744D507D4B4BE5B4A9EAE4D7897A806A4344704B4B624745
          946764F3E4E3FEFEFFFEFFFFFEFEFFFCFCFDFFFFFFFCFCFDFDFDFEFEFEFFF8F6
          F39784816E4849774C4D714E4F985F5EF0D4D1F8FFFFFCFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFFFFFFF8F9F1D2B29BDB895EEB9E4EE99E59E79C57E09F55
          D9A059E8BB7EF9F4D6FBF7E7F6F9E9F8F8F1FAF9F1F9F8F1F9F8F1FBF9F0F9F8
          F0FAF9F1F7F7F0FCF7EADED2B2A37E5CAA6F4DB27148AA6D4A966341D59273F4
          F4E6FDFEFFFDFDFDFFFFFEBBBBB56A5351724C4C6E4B4B835851B38C7EB6A49C
          A8A094AB9D8FB29F95B0A19BAFA09AB1A29FB29E9DB9A1A1B9A5A4E4D9CEF5F6
          ECA197946A4E4D7A4B4D704849C48580F7F5F0FCF7FDE2DCE27960626F4E4B66
          4C467F504DA87F7BC0B0A8BCB2ABBCADAAC1B3B0BFB0ABC2B3ACC2B3ABBDAB9E
          9A7D71754F4A774C4D754E4E684642A07975F1EFE8E4EAE47C6D686E4C4C6F4B
          4C744B47CAAAA1FCFDF9FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFF4
          F7F68C85816F4747764E517B4C4CCA9990FDF7EBCECBCE755F5E6548475B4844
          6E4A45C19A9CFFFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0ED
          EA7B69666D4747764D4E724848B57D7CF7EDE8FAFAFCFCFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFDFDFEFDFFFDD9C6B2D38A5AED915FE99164E9955BE69C51
          DE9C55DD9D69F6D8BBFCFEEFFAFFFCF8FCF9F8F9FAF7FAFEFCFEFFFAFCFFFAFC
          FFFAFDFFF6FBFCF9FEFDF3F4E2AE9076B4684DBA6B48B96C47A36A43B1765DF4
          E4D8FDFFFFFDFDFDFFFFFEDCD5D0786562754D4A70504B7F5151E2BAB1FFFFF8
          FCFEFDFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFEFFFEFBFA
          FBB1B0AD6A524B7B514D704B488E6761EBE1DCFEFEFFF1E7EB7A6F6B734C4769
          4B46714E49C79390FFFBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F0EBE5AF9F99785450754E4B6D4F4A87504EDDBCBAF3FAF595908A6C4C4B764D
          4E6D4648C99590FCFBF1FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFF
          FFFDAB9F98684843784F4E6F4B4B956465F5E7E3F7FCF7B1AAA66C4F4E6A4C4B
          6F4A47855A58C4A49ECEB9ADC9BCAECDBEB6CBB8B2C7B5B0C5B3AEC7B4AFAF9D
          9772565177504E755051734942CC938DFCF8F2F8FDFDFDFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFDFDFEFDFFFCE6DCC7BD8662DE8456EB8E57EE9454EC9A55
          E19457D1915DE1A57EFEEFD6FAFEF8FCFDF7F8FEF8F5FCF1FAF9E4F8F6E6F6F6
          E8F9F6E7FAF1DEF7F2DFF4EED6BD9A7ABA6B4ABD6E4CCD6D4CA368439D664EF1
          D2C9FFFFFFFEFDFEFBFEFBEBEEE7807671734C4872524C724B4ABE8F89FBF8EF
          F8FDFDFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFEFEFEFDFDFEFBFBFBFDFDFEFFFF
          FFC5C6C26D554C794F4B6D48456E524BD9C8C4FEFFFFF8F0F39C88846D4A4469
          4B4663443FAB7473F9EAEAFCFFFFFEFEFFFEFEFFFEFFFFFEFFFFFFFDFEFBFDFF
          F8FFFFEBECE883776E7C4E4B7E514E7C4A48C18F8BFDFAF3A6A6A9664647794F
          4F654C4CA56D68F6EAE1FEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFD
          FEFCA89D95684944734B4A6A48488A595BEADCD9FDFFFCEBEDE78D757372494A
          744D4B79504D784B497D525074514E714E4977514C734D48724C47724B476E4D
          48754F4C7B4F4D744D4F83504BDDB4ABFBFDF7F9FEFDFDFDFDFDFDFDFFFFFF00
          0000FDFDFDFDFDFDFDFDFEFDFEFAF0E9D5AF8B6DBC7950D8874CD98F4EE39256
          D59453CE9459D58D65EAC29AFDFAE9F8FCF6FCFDF8FCFCEBEDD6B1E2B88DE8B7
          8BD8AF84D4AE86CCA97AC89E75B5875CB8784DBB764EC1714F9F6A469A6449E6
          C0B1FFFFFBFAFDFEF8FEFCF5FAF68F8C896F4847754E4C694545A96F6AF8F0E8
          F6FCFBFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFDFF
          FEE4E6E17B6B64714B47704B476F4B48D0B4AEFAFFFCFBFAFBC8B0B071535067
          4B466948439E675DF2DDD8FCFFFFFEFFFEFEFFFEFEFFFFFDFDFEFDFCFDF4F7FC
          F3FFFFF1F8F482837A7046447D4D4C724B48A66D68FBEFE7B3BEC16D52537849
          4B674B4A8D5552ECD0CAFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9
          D4D4816F686C4844774C4B684B497F5454E4D2D2FDFEFCFEFFFDD0C0BE7D5654
          7A4C4A7C524F774F4D70494C63484861434265434366414265434166443D734D
          4677504C784F4E684D4B8F5C58F0D7D1FAFFFCFCFDFDFEFEFEFEFEFEFFFFFF00
          0000FDFDFDFDFDFDFDFDFDFCFEFBF3EDDFAF967BAB7251D8824CD88A4EE18E51
          E49550E49350DF8C5CE69F68F8D9B4F8F9EBF8F7F7FAFCF4ECD8BED8A174EC9F
          67E2A162D39C5FCD9754D38B50CD834BD77D49CB7B4BB8714BA96C499A6447CB
          9983FEFAF0FAFBFEF9FDFAFFFFFFB2B2B1674B4B754A4C694548A3645FF6DFD9
          FBFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF8FE
          F9F6F9F487817C6B4B47754D49734949C09088FCF8F0FBFFFED8CED16B565662
          48426C4944925648F1C6BDFFFFFFFFFFFEFFFFFFFFFFFDFEFDFCFFFFFFFFFCFA
          FFFDFBE0D3D1796A676E4A49764D496E4A469F6A67F9EEE9D7E3E2776C6A7749
          4A784D4C855351AD8481AE9A92B19E9CB9A6ABBAA0A5B99EA3B09C9EA38A8C84
          63656F4F4A76504C764C496C4B468A6360E5D2D5FAFAFBFAF9FBFCF7F7B6A099
          784F4B734D4974504B744D4682615A946E72956D75976971946A6C887568785E
          4F72504A724D4E694A469E6262F6DFDFFEFFFFFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FDFDFDFDFDFDFDFDFDFBFEFEF2F2EBB4A08CA47151DB824CE6874AEE8F4B
          E89155E8984CEA9A53E3975AE3AB7CFBF0D7FBF7F9F7F9FDF9F4EBEDC79BEEA9
          66F2AC57ECA254EA9B58EA9653E29048E48644CA7D46BA7444B56E49976446BA
          7B68F9ECE3FEFBFFFBFBF9FEFEFFD6D7D6645C586F4B4B6647488B514DE5C1BD
          FFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF8FD
          F9F9FCF798928D6B4945754D496B4A49B27570FEE9E4FDFFFFE3E4E469625F61
          46406D4C487B5049BE7C77B9A399B1A09CB6A5A2BCA39EBFA19BBFA19CBC9E98
          B0928C8D6361724D4E774A4B784F4C7D4F4DCE9F9CF9FBF5F2F6F58288827049
          4A794E4D76514D784B486548426343456F434D70474F6B424A66454465433D71
          4542784E4B70504C714E4A8E5554D4AEABF3EEEEF3FBFAF3F8F9FEFFFFEEE2D9
          8D78716A4B47745048734E3EAC7C6FF4DDDCF4E8EBF6E7E9F6E1E0E5E0D48979
          696D49446F4B4C714C49C38989FDF4F1FDFFFEFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFEFEFEFDFDFDFCFEFCF9FDF2D1BEACA47352CB7B48E28547E98549
          E38E52E39453E59450E99B58D89866ECC8A6F8F7E8F9FAFDF8F9F6F5E9CEE7BC
          78E8A458F1A25AEA9C57E68E53E98F50DE8749CC8249C17445B770449A6845B1
          7460F8DED0FAFEFEFCFCFBFDFDFEEEEFEE716A666E49496A4F4D77464AD8A09C
          FFFFFBFEFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFAFB
          FAFCFDFCB2ADAB75504C724D49684847946967F7E8DEFCFFFDF5F7F789878563
          4543784F4F744F4C7948456E49435E4842624C466A48457249486F4947664541
          6E4642744845794F4C794F4D82534DB7877BF8E5E3FCFEFEFAFCFC989A957448
          49764F4E734D4972524D664B465D46436A45466D474A6B464966464565474469
          47456E4546714E4E734D48A8645EECC3BBFBF8F0F2FBF8F9FAFBFDFEFDFFFEFC
          D2CDCC74615D6E4C456F4C45905653E7BEBBFDFFFCF9FFFDFAFDF7DAD6D07860
          5A734A466B4D49745351CCA6A6FDFCFAFDFDFEFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFEFEFEFDFDFDFEFCFCFCFFFAE6DDD2B27E65CF7149E17F48DD8548
          E3874DE99250E5924DE9955BDC9762D9A371F5E4BCFAFDF6F9FBF9F5F9F3F2E3
          B3EFAC6CE89D5EF0A155E99061E28A58D88550CB8048C57647B66F42996743A4
          6753ECCBBBF7FDFDFCFEFCFCFCFCF7F8F78E85816C46466F4E4C6A4146CC908B
          FFFCF6FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFBFB
          FBFFFEFFD7D5D4735F586C4B456848477E5353E8C6BCFCFEFCFEFEFFA5A7A55A
          45436C4647744C4A734B486F47446C45416E484366413F69434366434160413D
          704743734844784F4B764C4A936058E7C8B7FFFFFEFAFBFCFCFDFCBAB5B17450
          507C4C4C76524E815653AC7F779D897BA48B7FAC9087AC9087A489859F86859D
          8583856E6C734E4F6B4B48754C4A895A57D3ACA7FCFAFAF5FEFDFEFDFDFDFDFE
          F9FDFEB2A9A4634B42724C48714340A06A66F2E0E0F1FBFAFBFFFBC1BEB9674D
          487B504C6A4B477D5254E3C2C3FEFFFEFDFDFDFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFEFEFEFDFDFDFEFBFCFBFEFCEDEDE7AE826DC7724DD87A49E27D4A
          D98847DD904BE38E50EC9A56E79C5FD69553E7BD83F8F5E0F7FAF4F4F7F4F6F8
          E4E8BD8DEDA560F49963EC9567DD9254D4854FC87E4DC37849B874459F6B469A
          624AD8B2A0F8FCF6FCFEFDFCFCFCFCFCFCB5ADA9684B4A694746674647B17976
          FAF0EDFAFBFDFDFBFDFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFD
          FDFEFEFEE8E8E7756B656A4A466B4A4A734848D1A49CFEFFFCFDFFFDBAB5B360
          4C4A6648476F4A48804F4F926E68987C78987C798C71708D7373937A788E746C
          9D7D76926D6A7A4F507348496D4D46957166E0CAC8FEFEFCFCFCFCD4D1CC705B
          58794B4B73514C8B5C59E8C0BBF4F5EFF8F7F6FEFCFCFFFCFCFBFAF8F9F9F5FA
          FAF6F2ECE8B59D9C734F526B4B4D5E4543825252EBCACBFBFEFFFDFDFDFCFDFD
          F7FDFCEBEAE683746E6D47456B4846704A46B88F8FFAF8F6FCFEF9B2ADA9654E
          4A744E4B6C4A489F6B6AF1E2DDFBFEFEFEFEFDFEFEFEFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFEFEFEFDFDFDFDFDFBF7FBF5F5F3EFBD9581BE704AD67E4ADA8046
          D58447DF8F4DE69055EA9753F0A25DE69E5AE1A65FF2D7ABFDFBE5F8F8FDFFFE
          F7F6E3C8EBAC76ED9B68E39156D8924AD7864DCB814FC77856B77549A46D4694
          6244D2A18EFBFBEDFBFEFFFFFFFFFEFEFEC2C0BC614E4B6B4B49694B4A8C5659
          EAD3D0F7FBFCFBFAFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFEFE
          FEFCFCFCF3F3F2928783694A4A6D4B4D694543B98A81FEF4EFFAFFF8DFD4D077
          63616A4B4A6C4A49894F54E3C1B6FCFEF8FBFBF7FAF8F7F9F8F9FBFAF8F8F6EE
          FCFCF3F5EDEBB19DA0684C506749486B43459F6A6AF0D8D4F8FFFFE4E9E46E63
          5E684C49724F4B724C48CFAA9CFFFFF8FDFCFFFEFFFFFFFFFFFFFFFFFDFEFEFA
          FCFAFFFFFEF6F3EE9986886D484C6B4F49664444AF7C79F9EFF0FDFFFEFDFDFD
          FBFBFBFFFFFFCFC8C77259576D49496E4A478D5957ECC9C6F4F2ED9383806548
          47684A49694545B7827BF5F9EDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFEFEFEFDFDFDFDFDFCF9FCF8FCFBF8C8AE9EAF694CD2794BD58744
          DC824CDF834FE9925BEB9D4EEDA454F6A559EEA854ECB573F9E6BAFCFDFBFDFE
          FFF9FBF6ECD1ABE5A061EC9B59D7924AD9864ED17D4DCC7451B87347A36C4596
          6244C58776F9EEE2FDFDFFFEFFFEFDFDFDD3DCD6715A58714849674948824A4D
          E3BCB4FEFFF7F8FCFAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFD
          FDFCFCFCFEFEFFA8A4A05A46446448486A4644A06D64F4E1DDFDFFFEE6ECE679
          7570684746694B4978494CD5A79DFAFEF8FBFFF9FAFFFEF9FFFFF9FEFEFCFEFE
          FCFEFEFDFFFFE7E6E6716667654747704849764645C59B9AFAFBFBF2F9F48D81
          7D674B4973514D6F4844C28C80FDF8EFF9FBFEFCFDFDFCFDFDFCFDFDFBFBFBF9
          FAF9FDFFFAFFFFFDB3ADAD5F484A6B4E46554A3C855351F0D5CEFFFFFFFDFDFD
          FDFDFDFEFEFEFBFDFBADA4A0704C4C714E4B714C48B27777E5D1CF766D696748
          476C4D4C6A4545C3938CF5FEF1FCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FDFDFDFEFEFEFEFEFEFEFEFDFBFCFAFFFFFED3CBC0996A52C7704DD57E4C
          E08B4AE18A4CE79156EC9C51EFA452F8A454F5A956E9A657EBCB7FFCFAD9FAFB
          FDFAFCFDF8F2DFE1B686DC9858D4914ED5874FCB7A4CC27047BF7449AD704A97
          664AAB6D61F3D9CFFDFEFFFDFDFDFDFDFDEBF3F0837B7B6B484B6A4747764A4B
          D3A49FFAFBF4FAFAFAFEFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFD
          FDFEFEFEFFFFFFBFBDB85F4C4A6B4B4B6B46467B4F4DE8CCC6F9FEFEE6F3EC85
          847E6748476E49496B4547AF8280F8F9F6FDFFFFFAFEFDFCFFFFFCFFFFFEFFFF
          FDFFFFFFFFFFF1F1F17B6D706D4748744A4A6C4648B77D7CFEF0EFFDFFFEACA9
          A8674D4E714D4C6D4847A77B72FCF1E8FFFFFFFFFFFFFFFFFFFCFFFFFFFFFFFF
          FDFEFFFFFFFFFFFDB8ADAB644B4A714F4D5E4943824F4FE7C2B8FEFFFEFEFDFE
          FCFCFCFCFCFCFEFFFFEEEEE98D7D7A6C4A49724E4C874E50B786856F605A6D49
          486F504F7E5452DDBEB8FAFCFAFDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFFFFFFE0DED4A17A63C57251DA7E4F
          DB8745E59250E89254EE9D56EFA059F7A05AF8AB62F2AD5DE9B562FADAAAFDFB
          E6FCFBF9F8FCF5EDDBC6C4946ACD834FCF834ACC7946C9724ABD734BAB6E489C
          64499F6553EBC8B7FCFFFDFDFDFDFEFEFEF7FCFB91909167474A724D4D6F4848
          AD7A78FAEFEEFEFEFEFDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFD
          FDFDFDFDFFFFFFD6D4CF745E5C704D4D6F4B4B744C4BDBB4ADFBFCFEF5FDF7A6
          A39D6B4B4A7048486C4949A26A6CF2CCC9EEDADDF5DCDAF1DBD4EED9D4F1DCDA
          F4DFDDE8DCD9B5AAA76F5856744A4B774C4C6D474BB47171FCEEEBFFFFFFBCBD
          BE644A4C724E4F704C4C7F5D54CEB7B1E6DDDBE1D8D5E7E0DCE9DFDCEDDCDAF1
          DAD8E4D8CFBBA59F8669666E4B4B784C4D6F494B7B4C4DDFBFB3FCFFFCFCFBFF
          FDFCFDFDFDFDFCFDFBFFFFFDDAD3CF75615E754D4E7D4C4D7D54507D514E734C
          4B6448478E5C5AF0DCD5F9FEFFFAFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FEFEFEFEFEFEFFFFFFFEFEFEFDFDFDFFFEFFEEEEE6B3947CBD714CDC8151
          DA8543E69352EA995AEA9C54EDA04FFAA658F4AB5BF4AD5FF0AF62F2BA7DFBF1
          BCF8FEF8F6FFFFFFFEFCDDC3AACD8559D4864CD27F4CCC744EB76F46A76C43A7
          674A9E674DDBB79FFBFDF6FDFDFFFDFDFDF8FCFCB2AEAF6A4A4D754F50694948
          915E5DF6DCDBFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFD
          FDFDFDFDFEFEFEF0EFEA8C7D796748476F4C4D704948C59893FBFBFCFBFFFDC5
          C3BF6F5351714A4B6F4B4C8854539A645E9963649E6A6699696196675F916762
          91676185655F6C504A6F4C47754D4D744B4C6D4648B17575FEF2F1FFFFFFD4D3
          D371575776504E7A54537250497C5B588266647B675F7C665E81635D89615D91
          676288665D784F46724B47764D4D7A4C4C734846845350EBDACEFEFFFEFBFAFD
          FDFDFDFDFDFDFBFCFBFAFAF7FEFBF8B1ABA7674E4C784A4B7C4D4C764D4A684D
          4C604645A06969F5ECE6F5FDFDF9FDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFEFEFAF8F6BAA893AC6D48D37E4C
          E28A46ED9657EA975EEB9C58EEA050F1A057F1AA5AEEAE64F1B36AEFAD68F1C6
          7CF4E6CAF1E9DCEFE0CDE6C7ADC78762C87647B97244B46B46B9714AA56F48A2
          6748916546C99E87FEF8EFFDFEFFFDFDFDFBFDFDDBD6D77057596E4A4A634B4A
          805554EDC9BFFFFFFEFDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFD
          FDFDFDFDFEFDFDF8FAF58F8E895D4442684948674745A07571F1F5F2FCFFFEDE
          DFDA725E5B6A4546704B4C6B4B4A6F4A496D47476544416B47436B4844694843
          6A49436C49476B46466D4848704C4C674344794D4AD3ACABF9FCFCF7FCF8F1ED
          E989736F704744784F4C734E4D6C47486A48466C4B467449466D4544744F4F71
          4C4C6944446E49496E4A486E4A466A47427E4943BE8780F8F1EBFDFFFFFDFDFD
          FDFDFDFDFDFDFDFDFDFBFAFBFEFEFEF3F3EF8F89836B4747764B4B6D4B4B6345
          48684042C48484F9F7F6FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFCFFF8E4E0D1BF9C86BD8D6D
          C68355D78757E0905EE69B5DE8A250EBA156EDAC5DE8AD6AE7AB69ECA86AE9A9
          6BCFA56ED2A477C69D76CFA282C89677BF8C6CC08E6DB6865EB47F58956D4C8E
          634A7D6343AB816AF8F0E7FEFFFFFDFDFDFDFCFCE7EFED716C6A624442664444
          7B4B4CD2ABA0FDFEFBFDFDFEFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFD
          FDFDFDFDFDFCFCFCFEF9AAA9A4614745624240664443955F5DEFE7E5FEFEFEEF
          F1EB8874716A4444704A4A6948476F4747724A4B6948456E4A466E4A466D4845
          704B47724D4B6C47476C47477651518C6667C19F9BF9F3EEF3FDFCF6FAF5FDFA
          F5AA96926C4C47704F4A724D4D724D4D714E4D77534F7C4F4C744A49734E4E76
          5151744F50714B4C724E4C7C5853987471C9A7A7F8E5E2FDF9F6FDFDFEFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFFFDCFD2CC7A615F725050795051724F
          547E5054DDAFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFCFEFBFCFDF9F8F0EEEFE0DB
          DCC6AFDDBB96E1B78EE3BB8EEABB87F1C08EF1C992F0D098F5D69DF4DBA3F5D8
          B5E6CDB2F0DBBCF4E4C9F5ECD6F0EBD8F0EDDCF4EFDDECEAD2EFE1C9DACAB5CA
          B9A6B49F8AC0A18FF4EBE1FBFEFAFDFEFAFDFCFCF6FBFBC4C2C2B9A8A9BDA7A9
          C1ABACE7D5D2FDFBFAFDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFEFE
          FEFEFEFEFEFDFDFDFEFCE8E7E5C4B9B8C2B2B2C0B0B0D9C4C4F9F4F4FDFDFDFA
          FBFAE2DAD9CAB8B8C8B3B4CBB8B9CFBBBDCFBBBDC8B9B5C8B9B3C9B9B2CDBBB2
          CDBCB4C7B6B2D1C0C1D1C1C1D4C7C7F1E5E5FFFDFBF5FBF7F9F9FAFCFCFBFCFC
          FAE9E4E2D4CBC9D1C8C6CFC3C3D3C6C6D3C8C7D8D1CFD3C8C6CFC2BBDACCC4D6
          C7BFD6C7BFD7C8C0D9CCC8E3D7D5F5EBE9FFFFFFFEFFFFFDFCFCFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFF8FAF9F8FAF8E6E0DDDBD3CADED0C8E3D6
          D5DDD0D1F4F1EFFDFEFEFEFEFEFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFEFCFDFFFCFCFF
          FBFFFCFFFFF6FEF9EFFBF6EDFDF8F0FCF9F1FBFBEEFBFEECFCFFEDF8FEF1F9FE
          FBFDFFFFFFFFFEFFFFFDFDFFFBFCFFFCFDFFFBFDFFFCFFFFFFFEFFF9FFFFF7FF
          FFF9FDFAF0F2F1E6F9F9F1FCFEF8FFFFFAFEFEFEFFFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFFFFFBFBFCFDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFBFCFCFAFAFAF9
          F9FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFDFCFDFCFCFCFDFCFDFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFEFEFEFEFDFDFDFBFBFBFBFBFBFFFFFF
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFEFDFEFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFDFEFFFBFCFCFCFCFCFEFEFEFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFFFCFCFB
          FDFEFEFEFFFFFFFFFFFEFFFFFAFFFFF9FFFFF9FFFFFAFFFFF9FFFFFAFEFFFBFF
          FEF9FCFAFAFCF8FDFFFAFDFDFDFFFEFFFDFDFEFEFDFEFEFDFEFCFDFCFDFEFCFC
          FEFBFDFFFCFDFFFDFDFEFBFFFFFBFEFFFBFEFEFEFFFEFEFEFEFEFCFEFEFBFCFC
          FAFFFEF8FEFDF9FDFCFDFDFDFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFCFCFBFEFDF6FDFCF8FDFDFAFBFBFEFDFDFBFBFBFB
          FBFBFDFEFEFDFEFEFCFDFDFBFDFDFCFEFEFCFEFEFAFEFFF9FDFFFAFDFFFAFEFE
          FAFDFEFAFEFEF9FEFEF9FEFEFCFCFCFCFCFCFDFDFDFEFEFEFEFEFEFEFEFEFEFE
          FEFCFCFCFDFDFDFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFCFFFFF8FDFDF8
          FDFDF8FDFDF8FDFCFAFDFCFDFDFDFCFCFCFDFDFDFDFDFDFCFCFCFCFCFCFEFEFE
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFCFBFDFCFBFDFDFD
          FDFFFFFFFEFEFEFCFCFCFEFEFEFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFDFDFDFEFDFC
          FDFDFDFEFEFEFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFDFDFDFCFC
          FBFCFCFBFBFBFAFBFBFAFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFEFDFDFDFDFDFDFDFDFDFFFFFEFFFFFFFEFEFEFDFDFDFCFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFCFDFDFCFDFDFCFCFCFDFDFDFCFCFCFC
          FCFCFBFBFBFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFF
          FFFFFFFEFEFEFCFDFDFCFDFDFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFEFBFBFBFBFBFCFCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCFDFDFDFDFDFD
          FDFDFDFEFEFEFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFEFEFEFDFD
          FEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFE
          FEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFF
          FFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFE
          FEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFF
          FFFFFFFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFCFDFDFAFDFDFAFDFDFCFDFDFDFD
          FDFDFDFDFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFFFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFF
          FFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFEFDF7FEFDF7FEFDFCFDFDFDFD
          FDFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFF
          FFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFEFDF8FEFDF8FEFDFCFDFDFDFD
          FDFEFEFEFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFFFFFFFFFF
          FFFEFEFEFCFCFCFDFDFDFEFEFEFFFFFFFEFEFEFDFDFDFDFDFDFEFEFEFFFFFFFF
          FFFFFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFEFEFEFD
          FDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFEFEFEFDFDFDFDFDFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000}
        mmHeight = 6879
        mmLeft = 55000
        mmTop = 7673
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = '01.NUMBER OF CONTROL           :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 47361
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = '02.VESSEL'#180'S NAME               :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 51858
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'LINE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 57165
        mmTop = 39423
        mmWidth = 11642
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = '03.VOYAGE NUMBER               :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 56356
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = '05.PORT OF DISCHARGE           :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 65352
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = '07.OUTER PACKAGING             :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 74613
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = '06.FINAL DESTINATION           :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 69850
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = '08.INNER PACKAGING             :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 81492
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = '04.PORT OF LOADING             :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 60854
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = '09.PROPER SHIPPING NAME        :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 89429
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = '09A.CHEMICAL NAME (FOR NOS)    :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 98425
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = '        AND THE NEXT INSPECTION:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 155311
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = '10.MARINE POLLUTANT (Y/N)      :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 102394
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = '11.GROSS CARGO WEIGHT          :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 106363
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = '12.FLASH POINT (If applicable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 110331
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = '   But mandatory for class 3)  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 114300
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = '13.IMDG CLASS / UN NUMBER      :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 118269
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'SUBSIDIARY RISK:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 122238
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'SUBSIDIARY RISK:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 126207
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = '14.PACKING GROUP               :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 130175
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = '15.EmS                         :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 134144
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = '16.EMERGENCY TELEPHONE NUMBER  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 138377
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = '17.CNTR TYPE / QTY / GRWT      :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 146315
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = '18.FOR THANKS , INFORM THE LAST:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3598
        mmLeft = 6879
        mmTop = 150813
        mmWidth = 60061
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'REMARKS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 47096
        mmTop = 164836
        mmWidth = 16933
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 50271
        mmWidth = 68000
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 54240
        mmWidth = 67998
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 58208
        mmWidth = 67998
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 82021
        mmWidth = 67998
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 66146
        mmWidth = 67998
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 62177
        mmWidth = 67998
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 78052
        mmWidth = 67998
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 74083
        mmWidth = 67998
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 70115
        mmWidth = 67998
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 85990
        mmWidth = 67998
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 89959
        mmWidth = 67998
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 93927
        mmWidth = 67998
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 117740
        mmWidth = 67998
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 101865
        mmWidth = 67998
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 97896
        mmWidth = 67998
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 153988
        mmWidth = 67998
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 109802
        mmWidth = 67998
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 105834
        mmWidth = 67998
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 121709
        mmWidth = 67998
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 125677
        mmWidth = 67998
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 129646
        mmWidth = 67998
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 158486
        mmWidth = 67998
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 137584
        mmWidth = 67998
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 133615
        mmWidth = 67998
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 149490
        mmWidth = 67998
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 145521
        mmWidth = 67998
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 72000
        mmTop = 141552
        mmWidth = 67998
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 71438
        mmTop = 43392
        mmWidth = 15000
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label22'
        Caption = 'LIBRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 72761
        mmTop = 39158
        mmWidth = 11726
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'BOOKING'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72496
        mmTop = 46302
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NM_VESSEL'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 3979
        mmLeft = 72496
        mmTop = 50536
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NR_VOYAGE'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72496
        mmTop = 54240
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NM_PORT_LOADING'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 3979
        mmLeft = 72496
        mmTop = 58473
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NM_PORT_DISCHARGE'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72496
        mmTop = 62706
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NM_PORT_DISCHARGE'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 3979
        mmLeft = 72496
        mmTop = 66411
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NM_FINAL_DESTINATION'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72496
        mmTop = 70115
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TX_OUTER_PACK'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BDERel'
        mmHeight = 7938
        mmLeft = 72496
        mmTop = 74348
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TX_INNER_PACK'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BDERel'
        mmHeight = 7938
        mmLeft = 72231
        mmTop = 82021
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'MARINE'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 3979
        mmLeft = 72231
        mmTop = 102394
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VL_GROSS_WEIGHT'
        DataPipeline = BDERel
        DisplayFormat = '#0.,00 KGS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 106098
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'NM_CHEMICAL'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 98161
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'NM_PROPER_SHIPPING'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BDERel'
        mmHeight = 8202
        mmLeft = 71967
        mmTop = 89959
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VL_FLASH_POINT'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 71967
        mmTop = 113506
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DT_NEXT_INSPECION'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 154517
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'FL_PACKING_GROUP'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 129646
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'EMSMFAG'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 3979
        mmLeft = 72231
        mmTop = 133879
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'TX_PHONE'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 137584
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'NM_RESPONSIBLE_PERSON'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 3979
        mmLeft = 72231
        mmTop = 141817
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'TX_CNTR_TYPE'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 4233
        mmLeft = 72231
        mmTop = 145521
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'DT_LAST_INSPECION'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 3979
        mmLeft = 72231
        mmTop = 150019
        mmWidth = 67469
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'IMDG:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 74613
        mmTop = 118269
        mmWidth = 12171
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'IMDG:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 74613
        mmTop = 121973
        mmWidth = 12171
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'IMDG:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 74613
        mmTop = 125677
        mmWidth = 12171
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'UN:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 107950
        mmTop = 118269
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'UN:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 107950
        mmTop = 121973
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'UN:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 107950
        mmTop = 125942
        mmWidth = 7408
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 6000
        mmLeft = 122000
        mmTop = 37306
        mmWidth = 17000
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label28'
        Caption = 'For JOCO use'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2117
        mmLeft = 124090
        mmTop = 34660
        mmWidth = 11906
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Version 7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2117
        mmLeft = 0
        mmTop = 265
        mmWidth = 8001
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TX_REMARKS'
        DataPipeline = BDERel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDERel'
        mmHeight = 17463
        mmLeft = 4233
        mmTop = 168805
        mmWidth = 134409
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsRelIMDG: TDataSource
    DataSet = qryRelIMDG
    Left = 358
    Top = 32
  end
  object qryRelIMDG: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsRel
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, I.NR_SEQ_IMO, I.NR_IMDG_CLASS, I.NR_UN, IC' +
        '.TX_PORTUGUES, IC.TX_INGLES, IC.TX_ESPANHOL,'
      '       CASE ISNULL(IC.TX_PORTUGUES, '#39#39')'
      '        WHEN '#39#39' THEN CONVERT(VARCHAR, I.NR_IMDG_CLASS)'
      
        '        ELSE CONVERT(VARCHAR, I.NR_IMDG_CLASS) + '#39' / '#39' + LTRIM(R' +
        'TRIM(IC.TX_PORTUGUES))'
      '       END AS DESC_PORT,'
      '       CASE ISNULL(IC.TX_ESPANHOL, '#39#39')'
      '        WHEN '#39#39' THEN CONVERT(VARCHAR, I.NR_IMDG_CLASS)'
      
        '        ELSE CONVERT(VARCHAR, I.NR_IMDG_CLASS) + '#39' / '#39' + LTRIM(R' +
        'TRIM(IC.TX_ESPANHOL))'
      '       END AS DESC_ESP,'
      '       CASE ISNULL(IC.TX_INGLES, '#39#39')'
      '        WHEN '#39#39' THEN CONVERT(VARCHAR, I.NR_IMDG_CLASS)'
      
        '        ELSE CONVERT(VARCHAR, I.NR_IMDG_CLASS) + '#39' / '#39' + LTRIM(R' +
        'TRIM(IC.TX_INGLES))'
      '       END AS DESC_ING'
      '  FROM TPROCESSO_IMO_IMDG I (NOLOCK)'
      
        ' INNER JOIN TTP_IMDG_CLASS IC (NOLOCK) ON IC.NR_IMDG_CLASS = I.N' +
        'R_IMDG_CLASS'
      ' WHERE I.NR_PROCESSO = :NR_PROCESSO'
      '   AND I.NR_SEQ_IMO  = :NR_SEQ_IMO'
      ' ORDER BY I.NR_SEQ')
    Left = 391
    Top = 31
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ_IMO'
        ParamType = ptInput
        Size = 4
      end>
    object qryRelIMDGNR_IMDG_CLASS: TStringField
      FieldName = 'NR_IMDG_CLASS'
      FixedChar = True
      Size = 3
    end
    object qryRelIMDGTX_PORTUGUES: TStringField
      FieldName = 'TX_PORTUGUES'
      FixedChar = True
      Size = 255
    end
    object qryRelIMDGTX_INGLES: TStringField
      FieldName = 'TX_INGLES'
      FixedChar = True
      Size = 255
    end
    object qryRelIMDGTX_ESPANHOL: TStringField
      FieldName = 'TX_ESPANHOL'
      FixedChar = True
      Size = 255
    end
    object qryRelIMDGDESC_PORT: TStringField
      FieldName = 'DESC_PORT'
      FixedChar = True
      Size = 255
    end
    object qryRelIMDGDESC_ESP: TStringField
      FieldName = 'DESC_ESP'
      FixedChar = True
      Size = 255
    end
    object qryRelIMDGDESC_ING: TStringField
      FieldName = 'DESC_ING'
      FixedChar = True
      Size = 255
    end
    object qryRelIMDGNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryRelIMDGNR_SEQ_IMO: TIntegerField
      FieldName = 'NR_SEQ_IMO'
    end
    object qryRelIMDGNR_UN: TIntegerField
      FieldName = 'NR_UN'
    end
  end
  object BDERelIMDG: TppBDEPipeline
    DataSource = dsRelIMDG
    UserName = 'BDERel1'
    Left = 424
    Top = 32
    MasterDataPipelineName = 'BDERel'
    object BDERelIMDGppField1: TppField
      FieldAlias = 'NR_IMDG_CLASS'
      FieldName = 'NR_IMDG_CLASS'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDERelIMDGppField2: TppField
      FieldAlias = 'TX_PORTUGUES'
      FieldName = 'TX_PORTUGUES'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
    object BDERelIMDGppField3: TppField
      FieldAlias = 'TX_INGLES'
      FieldName = 'TX_INGLES'
      FieldLength = 255
      DisplayWidth = 255
      Position = 2
    end
    object BDERelIMDGppField4: TppField
      FieldAlias = 'TX_ESPANHOL'
      FieldName = 'TX_ESPANHOL'
      FieldLength = 255
      DisplayWidth = 255
      Position = 3
    end
    object BDERelIMDGppField5: TppField
      FieldAlias = 'DESC_PORT'
      FieldName = 'DESC_PORT'
      FieldLength = 255
      DisplayWidth = 255
      Position = 4
    end
    object BDERelIMDGppField6: TppField
      FieldAlias = 'DESC_ESP'
      FieldName = 'DESC_ESP'
      FieldLength = 255
      DisplayWidth = 255
      Position = 5
    end
    object BDERelIMDGppField7: TppField
      FieldAlias = 'DESC_ING'
      FieldName = 'DESC_ING'
      FieldLength = 255
      DisplayWidth = 255
      Position = 6
    end
    object BDERelIMDGppField8: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 7
    end
    object BDERelIMDGppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_SEQ_IMO'
      FieldName = 'NR_SEQ_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object BDERelIMDGppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_UN'
      FieldName = 'NR_UN'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object BDERelIMDGppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'NR_PROCESSO'
      DetailFieldName = 'NR_PROCESSO'
      DetailSortOrder = soAscending
    end
    object BDERelIMDGppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'NR_SEQ_IMO'
      DetailFieldName = 'NR_SEQ_IMO'
      DetailSortOrder = soAscending
    end
  end
  object dsRelUN: TDataSource
    DataSet = qryRelUN
    Left = 358
    Top = 62
  end
  object qryRelUN: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = dsRel
    SQL.Strings = (
      'SELECT I.NR_UN, I.NR_PROCESSO, I.NR_SEQ_IMO'
      '  FROM TPROCESSO_IMO_IMDG I (NOLOCK)'
      ' WHERE I.NR_PROCESSO = :NR_PROCESSO'
      '   AND I.NR_SEQ_IMO  = :NR_SEQ_IMO'
      ' ORDER BY I.NR_SEQ')
    Left = 391
    Top = 62
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftInteger
        Name = 'NR_SEQ_IMO'
        ParamType = ptInput
        Size = 4
      end>
    object qryRelUNNR_UN: TIntegerField
      FieldName = 'NR_UN'
    end
    object qryRelUNNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryRelUNNR_SEQ_IMO: TIntegerField
      FieldName = 'NR_SEQ_IMO'
    end
  end
  object BDERelUN: TppBDEPipeline
    DataSource = dsRelUN
    UserName = 'BDERelUN'
    Left = 424
    Top = 62
    MasterDataPipelineName = 'BDERel'
    object BDERelUNppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_UN'
      FieldName = 'NR_UN'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object BDERelUNppField2: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object BDERelUNppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_SEQ_IMO'
      FieldName = 'NR_SEQ_IMO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object BDERelUNppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'NR_PROCESSO'
      DetailFieldName = 'NR_PROCESSO'
      DetailSortOrder = soAscending
    end
    object BDERelUNppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'NR_SEQ_IMO'
      DetailFieldName = 'NR_SEQ_IMO'
      DetailSortOrder = soAscending
    end
  end
end

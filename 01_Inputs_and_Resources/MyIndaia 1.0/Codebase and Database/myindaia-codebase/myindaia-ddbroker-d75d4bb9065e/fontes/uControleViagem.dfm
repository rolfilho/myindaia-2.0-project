object frmControleViagem: TfrmControleViagem
  Left = 152
  Top = 125
  Width = 750
  Height = 550
  BorderWidth = 1
  Caption = 'Controle Autom'#225'tico de Viagens'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    740
    521)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl10: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 0
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
  end
  object pnl8: TPanel
    Left = 0
    Top = 1
    Width = 740
    Height = 0
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
  end
  object pnl9: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 1
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 2
  end
  object pgctrlAlternaModos: TPageControl
    Left = 0
    Top = 1
    Width = 740
    Height = 520
    ActivePage = tsDias
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 3
    OnChange = pgctrlAlternaModosChange
    object tsNavio: TTabSheet
      Caption = '      Modo Classico'
      object pnlMenu: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        DesignSize = (
          732
          28)
        object shp3: TShape
          Left = 2
          Top = 2
          Width = 728
          Height = 24
          Align = alClient
          Brush.Color = clSilver
          Pen.Color = clGray
          Pen.Style = psClear
        end
        object lbl1: TLabel
          Left = 9
          Top = 8
          Width = 238
          Height = 13
          Caption = 'Informativo Geral das Viagens dos Navios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object shp6: TShape
          Left = 497
          Top = 6
          Width = 16
          Height = 16
          Anchors = [akTop, akRight]
          Brush.Color = 14540253
        end
        object shp7: TShape
          Left = 274
          Top = 6
          Width = 16
          Height = 16
          Anchors = [akTop, akRight]
        end
        object shp8: TShape
          Left = 385
          Top = 6
          Width = 16
          Height = 16
          Anchors = [akTop, akRight]
          Brush.Color = 16444883
        end
        object lbl18: TLabel
          Left = 292
          Top = 7
          Width = 85
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Viagem em aberto'
          Transparent = True
        end
        object lbl20: TLabel
          Left = 403
          Top = 7
          Width = 85
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Prevista para hoje'
          Transparent = True
        end
        object lbl21: TLabel
          Left = 515
          Top = 7
          Width = 86
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Viagem encerrada'
          Transparent = True
        end
        object shp9: TShape
          Left = 608
          Top = 6
          Width = 16
          Height = 16
          Anchors = [akTop, akRight]
          Brush.Color = 14680031
        end
        object lbl22: TLabel
          Left = 626
          Top = 7
          Width = 60
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Atracou hoje'
          Transparent = True
        end
      end
      object pnl3: TPanel
        Left = 0
        Top = 28
        Width = 732
        Height = 181
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnl3'
        TabOrder = 1
        object pnl6: TPanel
          Left = 0
          Top = 0
          Width = 187
          Height = 181
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            187
            181)
          object lbl6: TLabel
            Left = 4
            Top = 141
            Width = 110
            Height = 13
            Caption = 'Todos atracados entre:'
          end
          object lbl7: TLabel
            Left = 90
            Top = 121
            Width = 3
            Height = 13
            Caption = '-'
          end
          object lbl8: TLabel
            Left = 4
            Top = 105
            Width = 126
            Height = 13
            Caption = 'Todos com previs'#227'o entre:'
          end
          object lbl9: TLabel
            Left = 90
            Top = 157
            Width = 3
            Height = 13
            Caption = '-'
          end
          object shp5: TShape
            Left = 1
            Top = 46
            Width = 183
            Height = 17
            Brush.Color = 14211288
            Pen.Color = clGray
          end
          object lbl17: TLabel
            Left = 4
            Top = 49
            Width = 27
            Height = 13
            Caption = 'Filtros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lbl5: TLabel
            Left = 6
            Top = 25
            Width = 28
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Navio'
          end
          object shp4: TShape
            Left = 1
            Top = 3
            Width = 183
            Height = 16
            Align = alCustom
            Brush.Color = 14211288
            Pen.Color = clGray
          end
          object lbl4: TLabel
            Left = 4
            Top = 5
            Width = 43
            Height = 13
            Caption = 'Pesquisa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lbl_cd_produto: TLabel
            Left = 4
            Top = 69
            Width = 37
            Height = 13
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object btn_co_produto: TSpeedButton
            Left = 155
            Top = 82
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
          object mskDtPrevInicio: TMaskEdit
            Left = 5
            Top = 118
            Width = 81
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '  /  /    '
            OnExit = msk_cd_produtoExit
          end
          object mskDtPrevFim: TMaskEdit
            Left = 98
            Top = 118
            Width = 81
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
            OnExit = msk_cd_produtoExit
          end
          object mskDtAtracadosInicio: TMaskEdit
            Left = 5
            Top = 154
            Width = 81
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 2
            Text = '  /  /    '
            OnExit = msk_cd_produtoExit
          end
          object mskDtAtracadosFim: TMaskEdit
            Left = 98
            Top = 154
            Width = 81
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 3
            Text = '  /  /    '
            OnExit = msk_cd_produtoExit
          end
          object edtNavio: TEdit
            Left = 37
            Top = 23
            Width = 143
            Height = 19
            Anchors = [akTop, akRight]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 4
            OnChange = edted1Change
          end
          object edt_nm_produto: TEdit
            Left = 34
            Top = 82
            Width = 120
            Height = 21
            TabStop = False
            BevelInner = bvLowered
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            ReadOnly = True
            TabOrder = 6
          end
          object msk_cd_produto: TMaskEdit
            Left = 5
            Top = 82
            Width = 28
            Height = 21
            BevelInner = bvLowered
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99;0; '
            MaxLength = 2
            TabOrder = 5
            OnChange = btn_co_produtoClick
            OnExit = msk_cd_produtoExit
          end
        end
        object pnl4: TPanel
          Left = 187
          Top = 0
          Width = 545
          Height = 181
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnl4'
          TabOrder = 1
          object shp1: TShape
            Left = 0
            Top = 3
            Width = 1060
            Height = 16
            Align = alCustom
            Anchors = [akLeft, akTop, akRight]
            Brush.Color = 12105398
          end
          object lbl2: TLabel
            Left = 3
            Top = 5
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lbl3: TLabel
            Left = 45
            Top = 5
            Width = 106
            Height = 13
            Caption = 'Nome da Embarca'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lbl16: TLabel
            Left = 419
            Top = 5
            Width = 42
            Height = 13
            Caption = 'Bandeira'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 20
            Width = 545
            Height = 161
            Align = alBottom
            Ctl3D = False
            DataSource = ds_embarcacao
            Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CD_EMBARCACAO'
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_EMBARCACAO'
                Width = 375
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_BANDEIRA'
                Width = 115
                Visible = True
              end>
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 214
        Width = 732
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object shp2: TShape
          Left = 0
          Top = 0
          Width = 732
          Height = 17
          Align = alClient
          Brush.Color = 12105398
        end
        object lbl10: TLabel
          Left = 4
          Top = 2
          Width = 35
          Height = 13
          Caption = 'Viagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbl11: TLabel
          Left = 60
          Top = 2
          Width = 71
          Height = 13
          Caption = 'Data Esperada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbl12: TLabel
          Left = 147
          Top = 2
          Width = 78
          Height = 13
          Caption = 'Data de Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbl13: TLabel
          Left = 241
          Top = 2
          Width = 110
          Height = 13
          Caption = 'Local de Desembarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbl14: TLabel
          Left = 437
          Top = 2
          Width = 110
          Height = 13
          Caption = 'Armaz'#233'm de Atraca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object lbl15: TLabel
          Left = 644
          Top = 2
          Width = 61
          Height = 13
          Caption = 'N'#186' Manifesto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
      end
      object dbgrd2: TDBGrid
        Left = 0
        Top = 232
        Width = 732
        Height = 257
        Align = alClient
        Ctl3D = False
        DataSource = ds_viagem
        Options = [dgEditing, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd2DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_VIAGEM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Width = 57
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DT_ESPERADA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 87
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DT_ENT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ARMAZEM_ATRACACAO'
            Width = 195
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_LOCAL'
            Width = 207
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_MANIFESTO'
            Width = 76
            Visible = True
          end>
      end
      object pnl1: TPanel
        Left = 0
        Top = 231
        Width = 732
        Height = 1
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
      end
      object pnl5: TPanel
        Left = 0
        Top = 209
        Width = 732
        Height = 5
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
      end
    end
    object tsDias: TTabSheet
      Caption = '      Modo Gr'#225'fico ( movimenta'#231#227'o geral dos navios )'
      ImageIndex = 1
      TabVisible = False
      object pnl32: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 25
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object lbl23: TLabel
          Left = 8
          Top = 7
          Width = 495
          Height = 13
          Caption = 
            'Visualiza'#231#227'o Total da Movimenta'#231#227'o dos Navios ( fontes : Semaf'#243'r' +
            'ico e Santos Brasil )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
      object scbBaseGeral: TScrollBox
        Left = 0
        Top = 25
        Width = 732
        Height = 464
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object pnl16: TPanel
          Left = 0
          Top = 0
          Width = 732
          Height = 20
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object pnl21: TPanel
            Left = 740
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 0
          end
          object pnl25: TPanel
            Left = 488
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 1
          end
          object pnl26: TPanel
            Left = 452
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 2
          end
          object pnl27: TPanel
            Left = 416
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 3
          end
          object pnl28: TPanel
            Left = 333
            Top = 0
            Width = 83
            Height = 20
            Align = alLeft
            Color = 11578540
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object dtpPrevisao: TDateTimePicker
              Left = 0
              Top = 0
              Width = 84
              Height = 19
              Date = 38874.464236643520000000
              Time = 38874.464236643520000000
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'Small Fonts'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnChange = dtpPrevisaoChange
              OnExit = dtpPrevisaoExit
            end
          end
          object pnl29: TPanel
            Left = 297
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 5
          end
          object pnl30: TPanel
            Left = 261
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 6
          end
          object pnl14: TPanel
            Left = 0
            Top = 0
            Width = 189
            Height = 20
            Align = alLeft
            TabOrder = 7
            object lbl19: TLabel
              Left = 4
              Top = 4
              Width = 74
              Height = 13
              Caption = 'Nome do Navio'
            end
          end
          object pnl38: TPanel
            Left = 668
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 8
          end
          object pnl39: TPanel
            Left = 632
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 9
          end
          object pnl40: TPanel
            Left = 596
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 10
          end
          object pnl41: TPanel
            Left = 560
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 11
          end
          object pnl42: TPanel
            Left = 524
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 12
          end
          object pnl43: TPanel
            Left = 704
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 13
          end
          object pnl7: TPanel
            Left = 225
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 14
          end
          object pnl11: TPanel
            Left = 189
            Top = 0
            Width = 36
            Height = 20
            Align = alLeft
            TabOrder = 15
          end
        end
      end
    end
  end
  object pnl12: TPanel
    Left = 7
    Top = 5
    Width = 16
    Height = 13
    BevelOuter = bvNone
    TabOrder = 4
    object img1: TImage
      Left = 0
      Top = -2
      Width = 16
      Height = 15
      Picture.Data = {
        07544269746D617076010000424D760100000000000076000000280000002000
        000010000000010004000000000000010000120B0000120B0000100000000000
        0000000000000000800000800000008080008000000080008000808000007F7F
        7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF0033333333333333333FFFFFFFFFFFFFFF0000000000000000777777777777
        77770FFFFFFFFFFFFFF07F3FF3FF3FF3FFF70F00F00F00F000F07F7737737737
        77370FFFFFFFFFFFFFF07F3FF3FF3FF3FFF70F00F00F00F000F07F7737737737
        77370FFFFFFFFFFFFFF07F3FF3FF3FF3FFF70F00F00F00F000F07F7737737737
        77370FFFFFFFFFFFFFF07F3FF3FF3FF3FFF70F00F00F00F000F07F7737737737
        77370FFFFFFFFFFFFFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC0777777777777
        7777088CCCCCCCCCC8807FF7777777777FF70000000000000000777777777777
        7777333333333333333333333333333333333333333333333333333333333333
        3333}
    end
  end
  object pnl13: TPanel
    Left = 116
    Top = 5
    Width = 16
    Height = 13
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object img2: TImage
      Left = 0
      Top = -2
      Width = 16
      Height = 15
      Picture.Data = {
        07544269746D617076010000424D760100000000000076000000280000002000
        000010000000010004000000000000010000120B0000120B0000100000000000
        0000000000000000800000800000008080008000000080008000808000007F7F
        7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF0033333333333333333FFFFFFFFFFFFFFF0000000000000000777777777777
        77770FFFFFFFFFFFFFF07F3FF3FF3FFF3FF70F00F00F000F00F07F7737737773
        77370FFFFFFFFFFFFFF07F3FF3FF33FFFFF70F00F00FF00000F07F7737733777
        77F70FEEEEEFF0F9FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F7
        37F70F0000FFF0FFFCF07F7777F337F337370F0000FFF0FFFFF07F7777333733
        33370FFFFFFFFFFFFFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC0777777777777
        7777088CCCCCCCCCC88073377777777773370000000000000000777777777777
        7777333333333333333333333333333333333333333333333333333333333333
        3333}
    end
  end
  object pnl15: TPanel
    Left = 696
    Top = 0
    Width = 44
    Height = 46
    Anchors = [akTop, akRight]
    BevelInner = bvLowered
    TabOrder = 6
    DesignSize = (
      44
      46)
    object btn_sair: TSpeedButton
      Left = 3
      Top = 2
      Width = 38
      Height = 41
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
  end
  object pnlAguarde: TPanel
    Left = 194
    Top = 224
    Width = 353
    Height = 89
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    Caption = 'aguarde... verificando previs'#245'es !'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Visible = False
    DesignSize = (
      353
      89)
    object shp10: TShape
      Left = 16
      Top = 16
      Width = 321
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
  end
  object pnlHelp: TPanel
    Left = 200
    Top = 240
    Width = 401
    Height = 209
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    TabOrder = 8
    Visible = False
    DesignSize = (
      401
      209)
    object shp11: TShape
      Left = 12
      Top = 36
      Width = 377
      Height = 161
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 14940665
    end
    object shp13: TShape
      Left = 23
      Top = 125
      Width = 354
      Height = 60
      Anchors = [akLeft, akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp12: TShape
      Left = 23
      Top = 54
      Width = 354
      Height = 60
      Anchors = [akLeft, akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl24: TLabel
      Left = 29
      Top = 48
      Width = 97
      Height = 13
      Caption = '[ Ultima Importa'#231#227'o ]'
      Color = 14940665
      ParentColor = False
      Transparent = False
    end
    object lbl25: TLabel
      Left = 29
      Top = 118
      Width = 98
      Height = 13
      Caption = '[ Ultima Exporta'#231#227'o ]'
      Color = 14940665
      ParentColor = False
      Transparent = False
    end
    object shp14: TShape
      Left = 12
      Top = 12
      Width = 377
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = 15596008
    end
    object lbl26: TLabel
      Left = 18
      Top = 17
      Width = 37
      Height = 13
      Caption = 'Navio : '
      Transparent = True
    end
  end
  object pnlProcessos: TPanel
    Left = 170
    Top = 179
    Width = 400
    Height = 189
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvLowered
    TabOrder = 9
    Visible = False
    DesignSize = (
      400
      189)
    object nbProcessos: TNotebook
      Left = 5
      Top = 5
      Width = 390
      Height = 179
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Visualizar'
        DesignSize = (
          390
          179)
        object shp15: TShape
          Left = 0
          Top = 0
          Width = 390
          Height = 21
          Align = alTop
          Brush.Color = 15596008
        end
        object lbl27: TLabel
          Left = 5
          Top = 5
          Width = 46
          Height = 13
          Caption = 'Navio : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblNomeNavio1: TLabel
          Left = 51
          Top = 5
          Width = 334
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object pnl18: TPanel
          Left = 0
          Top = 149
          Width = 390
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            390
            30)
          object btnOk2: TSpeedButton
            Left = 323
            Top = 4
            Width = 64
            Height = 23
            Anchors = [akRight, akBottom]
            Caption = 'Fechar'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
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
            OnClick = btnOk2Click
          end
        end
        object pnl22: TPanel
          Left = 0
          Top = 21
          Width = 390
          Height = 2
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
        object chklstVisualizaProcessos: TCheckListBox
          Left = 0
          Top = 23
          Width = 390
          Height = 63
          Align = alClient
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ItemHeight = 16
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object pnl17: TPanel
          Left = 0
          Top = 86
          Width = 390
          Height = 63
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 3
          DesignSize = (
            390
            63)
          object shp16: TShape
            Left = 3
            Top = 3
            Width = 384
            Height = 59
            Anchors = [akLeft, akTop, akRight]
            Brush.Style = bsClear
            Pen.Color = clSilver
          end
          object shp20: TShape
            Left = 194
            Top = 23
            Width = 96
            Height = 36
            Brush.Style = bsClear
            Pen.Color = clSilver
          end
          object shp19: TShape
            Left = 100
            Top = 23
            Width = 93
            Height = 36
            Brush.Style = bsClear
            Pen.Color = clSilver
          end
          object shp18: TShape
            Left = 6
            Top = 23
            Width = 93
            Height = 36
            Brush.Style = bsClear
            Pen.Color = clSilver
          end
          object shp17: TShape
            Left = 5
            Top = 5
            Width = 380
            Height = 15
            Anchors = [akLeft, akTop, akRight]
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl28: TLabel
            Left = 8
            Top = 6
            Width = 36
            Height = 13
            Caption = 'A'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object btnIncluiProcesso: TSpeedButton
            Left = 9
            Top = 26
            Width = 88
            Height = 31
            Hint = 'Atribuir esta viagem a um processo'
            Caption = 'Inserir'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            Margin = 5
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 15
          end
          object btnExcluirSelecionado: TSpeedButton
            Left = 103
            Top = 26
            Width = 88
            Height = 31
            Hint = 'Retirar essa viagem do processos selecionado'
            Caption = 'Excluir'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333FF33333333333330003333333333333777333333333333
              300033FFFFFF3333377739999993333333333777777F3333333F399999933333
              3300377777733333337733333333333333003333333333333377333333333333
              3333333333333333333F333333333333330033333F33333333773333C3333333
              330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
              333333377F33333333FF3333C333333330003333733333333777333333333333
              3000333333333333377733333333333333333333333333333333}
            Margin = 5
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 15
          end
          object btnAlimentarFUP: TSpeedButton
            Left = 197
            Top = 26
            Width = 91
            Height = 31
            Hint = 'Alimentar o FollowUp dos processos selecionados'
            Caption = 'Alimentar Fup'
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
            Margin = 2
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Spacing = 2
          end
        end
        object pnlIncluirProcesso: TPanel
          Left = 113
          Top = 75
          Width = 165
          Height = 94
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvLowered
          TabOrder = 4
          Visible = False
          DesignSize = (
            165
            94)
          object lbl29: TLabel
            Left = 9
            Top = 12
            Width = 103
            Height = 13
            Caption = 'Selecione o Processo'
          end
          object btnProcesso: TSpeedButton
            Left = 132
            Top = 26
            Width = 23
            Height = 22
            Anchors = [akTop, akRight]
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
            OnClick = btnProcessoClick
          end
          object btnConfirmar: TSpeedButton
            Left = 84
            Top = 60
            Width = 73
            Height = 25
            Caption = 'Confirmar'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = btnConfirmarClick
          end
          object edtProcesso: TEdit
            Left = 10
            Top = 26
            Width = 121
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'edtProcesso'
          end
        end
      end
    end
  end
  object qry_viagem: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_embarcacao
    SQL.Strings = (
      
        'SELECT NR_VIAGEM, DT_ESPERADA, DT_ENT, (SELECT DESCRICAO FROM TL' +
        'OCAL_EMBARQUE WHERE CODIGO = CD_LOCAL) CD_LOCAL,'
      
        '  ( SELECT NM_ARMAZEM FROM TARMAZEM WHERE CD_ARMAZEM = CD_ARMAZE' +
        'M_ATRACACAO ) CD_ARMAZEM_ATRACACAO, NR_MANIFESTO'
      'FROM   TVIAGEM'
      'WHERE  CD_UNID_NEG = '#39'01'#39' AND'
      '       CD_PRODUTO = '#39'01'#39' AND'
      '       CD_EMBARCACAO = :CD_EMBARCACAO'
      
        'ORDER BY SUBSTRING(NR_VIAGEM,3,2) DESC, SUBSTRING(NR_VIAGEM,1,2)' +
        ' DESC ')
    Left = 656
    Top = 372
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_viagemNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TVIAGEM.NR_VIAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_viagemDT_ESPERADA: TDateTimeField
      FieldName = 'DT_ESPERADA'
      Origin = 'DBBROKER.TVIAGEM.DT_ESPERADA'
    end
    object qry_viagemDT_ENT: TDateTimeField
      FieldName = 'DT_ENT'
      Origin = 'DBBROKER.TVIAGEM.DT_ENT'
    end
    object qry_viagemCD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      Origin = 'DBBROKER.TVIAGEM.CD_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 4
    end
    object qry_viagemNR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'DBBROKER.TVIAGEM.NR_MANIFESTO'
      FixedChar = True
      Size = 15
    end
    object qry_viagemCD_LOCAL: TStringField
      FieldName = 'CD_LOCAL'
      Origin = 'DBBROKER.TVIAGEM.CD_LOCAL'
      FixedChar = True
      Size = 4
    end
  end
  object ds_viagem: TDataSource
    DataSet = qry_viagem
    Left = 656
    Top = 421
  end
  object qry_embarcacao: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT VI.CD_EMBARCACAO, EM.NM_EMBARCACAO, (SELECT NM_P' +
        'AIS FROM TPAIS_BROKER WHERE CD_PAIS = EM.CD_BANDEIRA) CD_BANDEIR' +
        'A'
      '  FROM TVIAGEM VI, TEMBARCACAO EM'
      ' WHERE EM.CD_EMBARCACAO = VI.CD_EMBARCACAO'
      ''
      ''
      '')
    Left = 648
    Top = 60
    object qry_embarcacaoCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TEMBARCACAO.CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qry_embarcacaoNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Origin = 'DBBROKER.TEMBARCACAO.NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qry_embarcacaoCD_BANDEIRA: TStringField
      FieldName = 'CD_BANDEIRA'
      Origin = 'DBBROKER.TEMBARCACAO.CD_BANDEIRA'
      FixedChar = True
      Size = 3
    end
  end
  object ds_embarcacao: TDataSource
    DataSet = qry_embarcacao
    Left = 648
    Top = 109
  end
  object popNavio: TPopupMenu
    OnPopup = popNavioPopup
    Left = 650
    Top = 241
    object VisualizarProcessos1: TMenuItem
      Caption = 'Visualizar Processos'
      OnClick = VisualizarProcessos1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Estenaviojchegou1: TMenuItem
      Caption = 'Este navio j'#225' chegou !!!'
    end
  end
end

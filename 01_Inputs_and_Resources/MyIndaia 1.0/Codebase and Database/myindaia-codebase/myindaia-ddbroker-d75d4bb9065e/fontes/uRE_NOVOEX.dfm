object frmRE_NovoEx: TfrmRE_NovoEx
  Left = 273
  Top = 180
  Width = 822
  Height = 566
  Caption = 'RE - NOVOEX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 190
    Top = 0
    Width = 2
    Height = 528
    Align = alLeft
  end
  object Splitter1: TSplitter
    Left = 188
    Top = 0
    Width = 2
    Height = 528
    Beveled = True
    Color = 14473400
    ParentColor = False
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 188
    Height = 528
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 3
    Color = 14473400
    TabOrder = 0
    DesignSize = (
      188
      528)
    object lblDiagnostico: TLabel
      Left = 29
      Top = 14
      Width = 68
      Height = 13
      Cursor = crHandPoint
      Caption = 'Diagn'#243'stico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblDiagnosticoClick
      OnMouseEnter = lblDiagnosticoMouseEnter
      OnMouseLeave = lblDiagnosticoMouseLeave
    end
    object lblExportador: TLabel
      Tag = 1
      Left = 29
      Top = 51
      Width = 120
      Height = 26
      Cursor = crHandPoint
      Caption = 'Dados Comerciais do'#13#10'Exportador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3775485
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblDiagnosticoClick
      OnMouseEnter = lblDiagnosticoMouseEnter
      OnMouseLeave = lblDiagnosticoMouseLeave
    end
    object lblEnquadramento: TLabel
      Tag = 2
      Left = 29
      Top = 84
      Width = 89
      Height = 26
      Cursor = crHandPoint
      Caption = 'Detalhes do'#13#10'Enquadramento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblDiagnosticoClick
      OnMouseEnter = lblDiagnosticoMouseEnter
      OnMouseLeave = lblDiagnosticoMouseLeave
    end
    object lblGerais: TLabel
      Tag = 3
      Left = 29
      Top = 117
      Width = 77
      Height = 13
      Cursor = crHandPoint
      Caption = 'Dados Gerais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblDiagnosticoClick
      OnMouseEnter = lblDiagnosticoMouseEnter
      OnMouseLeave = lblDiagnosticoMouseLeave
    end
    object lblMercadoria: TLabel
      Tag = 4
      Left = 29
      Top = 137
      Width = 122
      Height = 13
      Cursor = crHandPoint
      Caption = 'Dados da Mercadoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblDiagnosticoClick
      OnMouseEnter = lblDiagnosticoMouseEnter
      OnMouseLeave = lblDiagnosticoMouseLeave
    end
    object Bevel1: TBevel
      Left = 7
      Top = 38
      Width = 173
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Label1: TLabel
      Left = 11
      Top = 18
      Width = 6
      Height = 5
      Caption = 'g'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -5
      Font.Name = 'Webdings'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Tag = 1
      Left = 10
      Top = 51
      Width = 12
      Height = 13
      Caption = '1.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Tag = 1
      Left = 10
      Top = 84
      Width = 12
      Height = 13
      Caption = '2.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Tag = 1
      Left = 10
      Top = 117
      Width = 12
      Height = 13
      Caption = '3.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Tag = 1
      Left = 10
      Top = 137
      Width = 12
      Height = 13
      Caption = '4.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlSubMenuMercadoria: TPanel
      Left = 0
      Top = 152
      Width = 177
      Height = 65
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Label6: TLabel
        Tag = 1
        Left = 34
        Top = 5
        Width = 12
        Height = 13
        Caption = '5.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDrawback: TLabel
        Tag = 5
        Left = 53
        Top = 5
        Width = 58
        Height = 13
        Cursor = crHandPoint
        Caption = 'Drawback'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = lblDiagnosticoClick
        OnMouseEnter = lblDiagnosticoMouseEnter
        OnMouseLeave = lblDiagnosticoMouseLeave
      end
      object Label7: TLabel
        Tag = 1
        Left = 34
        Top = 25
        Width = 12
        Height = 13
        Caption = '6.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCCTPC: TLabel
        Tag = 6
        Left = 53
        Top = 25
        Width = 99
        Height = 13
        Cursor = crHandPoint
        Caption = 'CCPTC / CCROM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = lblDiagnosticoClick
        OnMouseEnter = lblDiagnosticoMouseEnter
        OnMouseLeave = lblDiagnosticoMouseLeave
      end
      object Label8: TLabel
        Tag = 1
        Left = 34
        Top = 45
        Width = 12
        Height = 13
        Caption = '7.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFabricante: TLabel
        Tag = 7
        Left = 53
        Top = 45
        Width = 119
        Height = 13
        Cursor = crHandPoint
        Caption = 'Dados do Fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = lblDiagnosticoClick
        OnMouseEnter = lblDiagnosticoMouseEnter
        OnMouseLeave = lblDiagnosticoMouseLeave
      end
      object Label117: TLabel
        Tag = 1
        Left = 12
        Top = 0
        Width = 18
        Height = 23
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'Wingdings 3'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label118: TLabel
        Tag = 1
        Left = 12
        Top = 20
        Width = 18
        Height = 23
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'Wingdings 3'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label119: TLabel
        Tag = 1
        Left = 12
        Top = 40
        Width = 18
        Height = 23
        Caption = '9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'Wingdings 3'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubMenuLinha: TLabel
        Tag = 1
        Left = 12
        Top = -12
        Width = 7
        Height = 60
        Caption = '|'#13#10'|'#13#10'|'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
    object pnlResumo: TPanel
      Left = 3
      Top = 209
      Width = 182
      Height = 316
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 14473400
      TabOrder = 1
      DesignSize = (
        182
        316)
      object Bevel7: TBevel
        Left = 2
        Top = 143
        Width = 178
        Height = 86
        Align = alTop
        Shape = bsBottomLine
      end
      object Bevel5: TBevel
        Left = 2
        Top = 54
        Width = 178
        Height = 89
        Align = alTop
        Shape = bsBottomLine
      end
      object Bevel6: TBevel
        Left = 2
        Top = 2
        Width = 178
        Height = 52
        Align = alTop
        Shape = bsBottomLine
      end
      object Label120: TLabel
        Left = 8
        Top = 79
        Width = 55
        Height = 13
        Caption = 'Valor RE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label121: TLabel
        Left = 8
        Top = 100
        Width = 50
        Height = 13
        Caption = 'Adi'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label122: TLabel
        Left = 8
        Top = 123
        Width = 37
        Height = 13
        Caption = 'Saldo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label123: TLabel
        Left = 8
        Top = 10
        Width = 33
        Height = 13
        Caption = 'Itens:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label124: TLabel
        Left = 8
        Top = 32
        Width = 50
        Height = 13
        Caption = 'Adi'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label125: TLabel
        Left = 8
        Top = 186
        Width = 67
        Height = 13
        Caption = 'Fabricantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label126: TLabel
        Left = 8
        Top = 207
        Width = 37
        Height = 13
        Caption = 'Saldo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label127: TLabel
        Left = 6
        Top = 58
        Width = 170
        Height = 13
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Valor MCV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label128: TLabel
        Left = 6
        Top = 146
        Width = 170
        Height = 13
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Valor MLE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label129: TLabel
        Left = 8
        Top = 251
        Width = 50
        Height = 13
        Caption = 'Adi'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label131: TLabel
        Left = 8
        Top = 274
        Width = 67
        Height = 13
        Caption = 'Fabricantes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label132: TLabel
        Left = 8
        Top = 295
        Width = 37
        Height = 13
        Caption = 'Saldo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label133: TLabel
        Left = 6
        Top = 231
        Width = 170
        Height = 13
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Peso L'#237'quido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label134: TLabel
        Left = 8
        Top = 164
        Width = 50
        Height = 13
        Caption = 'Adi'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblbl_Totais_ValorRE: TcxDBLabel
        Left = 92
        Top = 75
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'VL_TOTAL_CAPA'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 86
      end
      object dblbl_Totais_ValorAdicoes: TcxDBLabel
        Left = 92
        Top = 96
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'VL_MCV_TOTAL_ADICOES'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 107
      end
      object dblbl_Totais_SaldoRE: TcxDBLabel
        Left = 92
        Top = 118
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'VL_SALDO_CAPA'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = 4227327
        Style.BorderStyle = ebsSingle
        Style.Color = 15528703
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 129
      end
      object dblbl_Totais_Itens: TcxDBLabel
        Left = 92
        Top = 6
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'QTD_ITENS'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Style.Shadow = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 17
      end
      object dblbl_Totais_Adicoes: TcxDBLabel
        Left = 92
        Top = 28
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'QTD_ANEXOS'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 39
      end
      object dblbl_Totais_ValorFabricantes: TcxDBLabel
        Left = 92
        Top = 181
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'VL_TOTAL_FABRICANTES'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 192
      end
      object dblbl_Totais_SaldoValorFabricantes: TcxDBLabel
        Left = 92
        Top = 203
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'calcVL_SALDO_TOTAL_FABRICANTES'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = 4227327
        Style.BorderStyle = ebsSingle
        Style.Color = 15528703
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 214
      end
      object dblbl_Totais_PesoAdicoes: TcxDBLabel
        Left = 92
        Top = 247
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'PL_TOTAL_ADICOES'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 258
      end
      object dblbl_Totais_PesoFabricantes: TcxDBLabel
        Left = 92
        Top = 269
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'PL_TOTAL_FABRICANTES'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 280
      end
      object dblbl_Totais_SaldoPesoFabricantes: TcxDBLabel
        Left = 92
        Top = 291
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'calcPL_SALDO_TOTAL_FABRICANTES'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = 4227327
        Style.BorderStyle = ebsSingle
        Style.Color = 15528703
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 302
      end
      object dblbl_Totais_ValorMLEAdicoes: TcxDBLabel
        Left = 92
        Top = 160
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'VL_MLE_TOTAL_ADICOES'
        DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.LabelStyle = cxlsLowered
        Style.BorderColor = clBlue
        Style.BorderStyle = ebsSingle
        Style.Color = 15723998
        Style.HotTrack = False
        Height = 21
        Width = 85
        AnchorX = 177
        AnchorY = 171
      end
    end
  end
  object pnlDados: TPanel
    Left = 192
    Top = 0
    Width = 614
    Height = 528
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      614
      528)
    object Bevel3: TBevel
      Left = 0
      Top = 105
      Width = 614
      Height = 2
      Align = alTop
    end
    object nbTelas: TNotebook
      Left = 0
      Top = 107
      Width = 614
      Height = 421
      Align = alClient
      Color = 15723998
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      PageIndex = 4
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnPageChanged = nbTelasPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Diagn'#243'stico'
        object Label19: TLabel
          Left = 13
          Top = 11
          Width = 84
          Height = 16
          Caption = 'Diagn'#243'stico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbDiagnostico: TScrollBox
          Left = 0
          Top = 24
          Width = 614
          Height = 397
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = 15723998
          ParentColor = False
          TabOrder = 0
          object reDiagnostico: TRichEdit
            Left = 0
            Top = 0
            Width = 614
            Height = 397
            Align = alClient
            BorderStyle = bsNone
            Color = 15723998
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 1
        Caption = 'Dados Comerciais do Exportador'
        object Label13: TLabel
          Left = 13
          Top = 11
          Width = 247
          Height = 16
          Caption = '1. Dados Comerciais do Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbDadosExportador: TScrollBox
          Left = 0
          Top = 24
          Width = 614
          Height = 397
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            614
            397)
          object Label22: TLabel
            Left = 7
            Top = 51
            Width = 156
            Height = 13
            Caption = 'Nome do Gerente de Exporta'#231#227'o'
          end
          object Label23: TLabel
            Left = 7
            Top = 91
            Width = 56
            Height = 13
            Caption = 'Home Page'
          end
          object Panel1: TPanel
            Left = 5
            Top = 8
            Width = 610
            Height = 35
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            ParentColor = True
            ParentCtl3D = False
            TabOrder = 0
            DesignSize = (
              608
              33)
            object Label21: TLabel
              Left = 10
              Top = 1
              Width = 177
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              Caption = 
                'Mantenha essas informa'#231#245'es atualizadas, pois s'#227'o importantes par' +
                'a divulga'#231#227'o da empresa em programas de promo'#231#227'o comercial.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
          end
          object dbedt_1_GerenteExportacao: TDBEdit
            Left = 7
            Top = 66
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'lookupNM_EXPORTADOR'
            DataSource = datmRE_NOVOEX.ds_RE_Capa
            TabOrder = 1
          end
          object dbedt_1_HomePage: TDBEdit
            Left = 7
            Top = 106
            Width = 607
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'lookupNM_HOMEPAGE'
            DataSource = datmRE_NOVOEX.ds_RE_Capa
            TabOrder = 2
          end
          object gbTelefone: TcxGroupBox
            Left = 6
            Top = 142
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Telefone'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 105
            Width = 610
            object Label24: TLabel
              Left = 16
              Top = 18
              Width = 21
              Height = 13
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 120
              Top = 18
              Width = 30
              Height = 13
              Caption = '(DDD)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label27: TLabel
              Left = 114
              Top = 35
              Width = 4
              Height = 16
              Caption = '('
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label28: TLabel
              Left = 156
              Top = 35
              Width = 4
              Height = 16
              Caption = ')'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 176
              Top = 18
              Width = 37
              Height = 13
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbcbo_1_TelefoneTipo: TDBComboBox
              Left = 17
              Top = 34
              Width = 89
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              Items.Strings = (
                '1. Telefone'
                '2. Fax')
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_1_TelefoneDDD: TDBEdit
              Left = 122
              Top = 34
              Width = 30
              Height = 21
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_1_TelefoneNumero: TDBEdit
              Left = 176
              Top = 34
              Width = 121
              Height = 21
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
            end
            object btn_1_Telefone_Incluir: TButton
              Left = 160
              Top = 66
              Width = 75
              Height = 19
              Caption = 'Incluir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object btn_1_Telefone_Atualizar: TButton
              Left = 248
              Top = 66
              Width = 75
              Height = 19
              Caption = 'Atualizar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object btn_1_Telefone_Excluir: TButton
              Left = 336
              Top = 66
              Width = 75
              Height = 19
              Caption = 'Excluir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
          object gbCorreioEletronico: TcxGroupBox
            Left = 5
            Top = 253
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Correio Eletr'#244'nico'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 4
            DesignSize = (
              610
              105)
            Height = 105
            Width = 610
            object Label29: TLabel
              Left = 16
              Top = 18
              Width = 21
              Height = 13
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 176
              Top = 18
              Width = 147
              Height = 13
              Caption = 'Endere'#231'o de Correio Eletr'#244'nico'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbcbo_1_CorreioEletronicoTipo: TDBComboBox
              Left = 17
              Top = 34
              Width = 144
              Height = 21
              Style = csDropDownList
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              Items.Strings = (
                '1. '#193'rea de Exporta'#231#227'o'
                '2. Empresa')
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_1_CorreioEletronicoEndereco: TDBEdit
              Left = 176
              Top = 34
              Width = 418
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
            end
            object btn_1_CorreioEletronico_Incluir: TButton
              Left = 160
              Top = 66
              Width = 75
              Height = 19
              Caption = 'Incluir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object btn_1_CorreioEletronico_Atualizar: TButton
              Left = 248
              Top = 66
              Width = 75
              Height = 19
              Caption = 'Atualizar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object btn_1_CorreioEletronico_Excluir: TButton
              Left = 336
              Top = 66
              Width = 75
              Height = 19
              Caption = 'Excluir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 2
        Caption = 'Detalhes do Enquadramento'
        object Label20: TLabel
          Left = 13
          Top = 11
          Width = 214
          Height = 16
          Caption = '2. Detalhes do Enquadramento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbDetalhesEnquadramento: TScrollBox
          Left = 0
          Top = 24
          Width = 614
          Height = 397
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = 15723998
          ParentColor = False
          TabOrder = 0
          DesignSize = (
            597
            397)
          object cxGroupBox1: TcxGroupBox
            Left = 5
            Top = 2
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Dados do Importador'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            DesignSize = (
              594
              221)
            Height = 221
            Width = 594
            object Label33: TLabel
              Left = 12
              Top = 20
              Width = 80
              Height = 13
              Caption = 'Enquadramentos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 12
              Top = 148
              Width = 56
              Height = 13
              Caption = 'Data Limite:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 12
              Top = 172
              Width = 113
              Height = 13
              Caption = '% Margem n'#227'o Sacada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label34: TLabel
              Left = 12
              Top = 196
              Width = 62
              Height = 13
              Caption = 'N'#186' Processo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_2_Enquadramento1: TDBEdit
              Left = 12
              Top = 35
              Width = 65
              Height = 21
              DataField = 'CD_ENQUAD1'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dblcb_2_Enquadramento1: TDBLookupComboBox
              Left = 82
              Top = 35
              Width = 503
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_ENQUAD1'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_ENQUAD_OP'
              ListField = 'NM_ENQUAD_OP'
              ListSource = datmRE_NOVOEX.ds_Enquadramentos
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_2_Enquadramento2: TDBEdit
              Left = 12
              Top = 59
              Width = 65
              Height = 21
              DataField = 'CD_ENQUAD2'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dblcb_2_Enquadramento2: TDBLookupComboBox
              Left = 82
              Top = 59
              Width = 503
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_ENQUAD2'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_ENQUAD_OP'
              ListField = 'NM_ENQUAD_OP'
              ListSource = datmRE_NOVOEX.ds_Enquadramentos
              ParentFont = False
              TabOrder = 3
            end
            object dbedt_2_Enquadramento3: TDBEdit
              Left = 12
              Top = 83
              Width = 65
              Height = 21
              DataField = 'CD_ENQUAD3'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dblcb_2_Enquadramento3: TDBLookupComboBox
              Left = 82
              Top = 83
              Width = 503
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_ENQUAD3'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_ENQUAD_OP'
              ListField = 'NM_ENQUAD_OP'
              ListSource = datmRE_NOVOEX.ds_Enquadramentos
              ParentFont = False
              TabOrder = 5
            end
            object dbedt_2_Enquadramento4: TDBEdit
              Left = 12
              Top = 107
              Width = 65
              Height = 21
              DataField = 'CD_ENQUAD4'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dblcb_2_Enquadramento4: TDBLookupComboBox
              Left = 82
              Top = 107
              Width = 503
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_ENQUAD4'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_ENQUAD_OP'
              ListField = 'NM_ENQUAD_OP'
              ListSource = datmRE_NOVOEX.ds_Enquadramentos
              ParentFont = False
              TabOrder = 7
            end
            object dbedt_2_DataLimite: TDBEdit
              Left = 146
              Top = 145
              Width = 87
              Height = 21
              DataField = 'DT_LIMITE_OPERACAO'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 8
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dbedt_2_MargemNaoSacada: TDBEdit
              Left = 146
              Top = 169
              Width = 111
              Height = 21
              DataField = 'PC_MARGEM_NAO_SACADA'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dbedt_2_NumeroProcesso: TDBEdit
              Left = 146
              Top = 193
              Width = 119
              Height = 21
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              OnChange = dbedt_2_Enquadramento1Change
            end
          end
          object cxGroupBox2: TcxGroupBox
            Left = 5
            Top = 233
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Dados do Importador'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 1
            Height = 177
            Width = 595
            object Label35: TLabel
              Left = 12
              Top = 26
              Width = 33
              Height = 13
              Caption = 'N'#186' RC:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 12
              Top = 50
              Width = 33
              Height = 13
              Caption = 'N'#186' RV:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label37: TLabel
              Left = 12
              Top = 74
              Width = 110
              Height = 13
              Caption = 'N'#186' RE/DSE Vinculado:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 12
              Top = 98
              Width = 79
              Height = 13
              Caption = 'N'#186' DI Vinculada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label80: TLabel
              Left = 12
              Top = 122
              Width = 86
              Height = 13
              Caption = 'N'#186' DSI Vinculada:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_2_NumeroRC: TDBEdit
              Left = 130
              Top = 21
              Width = 119
              Height = 21
              DataField = 'NR_REG_CREDITO'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dbedt_2_NumeroRV: TDBEdit
              Left = 130
              Top = 45
              Width = 119
              Height = 21
              DataField = 'NR_REG_VENDA'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dbedt_2_NumeroRE: TDBEdit
              Left = 130
              Top = 69
              Width = 111
              Height = 21
              DataField = 'NR_RE_VINCULADA'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_2_Enquadramento1Change
            end
            object dbedt_2_NumeroDI: TDBEdit
              Left = 130
              Top = 93
              Width = 135
              Height = 21
              DataField = 'NR_DI_VINCULADA'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnChange = dbedt_2_Enquadramento1Change
            end
            object Button7: TButton
              Tag = -1
              Left = 189
              Top = 150
              Width = 164
              Height = 19
              Caption = 'Vincular Informa'#231#245'es'
              Enabled = False
              TabOrder = 4
            end
            object dbedt_2_NumeroDSI: TDBEdit
              Left = 130
              Top = 117
              Width = 135
              Height = 21
              DataField = 'NR_DSI_VINCULADA'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnChange = dbedt_2_Enquadramento1Change
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 3
        Caption = 'Dados Gerais'
        object Label14: TLabel
          Left = 13
          Top = 11
          Width = 113
          Height = 16
          Caption = '3. Dados Gerais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbDadosGerais: TScrollBox
          Left = 0
          Top = 24
          Width = 614
          Height = 397
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            597
            397)
          object gbDadosImportador: TcxGroupBox
            Left = 5
            Top = 2
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Dados do Importador'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            DesignSize = (
              598
              163)
            Height = 163
            Width = 598
            object Label39: TLabel
              Left = 16
              Top = 24
              Width = 96
              Height = 13
              Caption = 'Nome do Importador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label40: TLabel
              Left = 16
              Top = 72
              Width = 114
              Height = 13
              Caption = 'Endere'#231'o do Importador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label41: TLabel
              Left = 16
              Top = 114
              Width = 90
              Height = 13
              Caption = 'Pa'#237's do Importador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_3_PaisImportador: TSpeedButton
              Left = 60
              Top = 129
              Width = 23
              Height = 22
              Hint = 'Consultar Pa'#237's do Importador'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_3_PaisImportadorClick
            end
            object dbedt_3_ImportadorNome: TDBEdit
              Left = 16
              Top = 40
              Width = 566
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'lookupNM_IMPORTADOR'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_3_ImportadorEndereco: TDBEdit
              Left = 16
              Top = 87
              Width = 566
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'lookupEND_IMPORTADOR'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_3_PaisImportador: TDBEdit
              Left = 16
              Top = 129
              Width = 38
              Height = 21
              DataField = 'CD_PAIS_IMPORTADOR'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbcbo_3_PaisImportador: TDBLookupComboBox
              Left = 89
              Top = 129
              Width = 493
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_PAIS_IMPORTADOR'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_PAIS'
              ListField = 'NM_PAIS'
              ListSource = datmRE_NOVOEX.ds_Pais
              ParentFont = False
              TabOrder = 3
            end
          end
          object gbDadosOperacaoExportacao: TcxGroupBox
            Left = 5
            Top = 174
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Dados da Opera'#231#227'o de Exporta'#231#227'o'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 1
            DesignSize = (
              598
              400)
            Height = 400
            Width = 598
            object Label44: TLabel
              Left = 16
              Top = 26
              Width = 101
              Height = 13
              Caption = 'Pa'#237's de Destino Final'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_3_PaisDestino: TSpeedButton
              Left = 60
              Top = 41
              Width = 23
              Height = 22
              Hint = 'Consultar Pa'#237's de Destino Final'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_3_PaisDestinoClick
            end
            object Label42: TLabel
              Left = 16
              Top = 66
              Width = 167
              Height = 13
              Caption = 'C'#243'digo Instrumento de Negocia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_3_InstrumentoNegociacao: TSpeedButton
              Left = 87
              Top = 81
              Width = 23
              Height = 22
              Hint = 'Consultar C'#243'digo Instrumento de Negocia'#231#227'o'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_3_InstrumentoNegociacaoClick
            end
            object Label43: TLabel
              Left = 16
              Top = 106
              Width = 124
              Height = 13
              Caption = 'Unidade RF de Despacho'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_3_RFDespacho: TSpeedButton
              Left = 103
              Top = 121
              Width = 23
              Height = 22
              Hint = 'Consultar Unidade RF de Despacho'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_3_RFDespachoClick
            end
            object Label45: TLabel
              Left = 16
              Top = 146
              Width = 123
              Height = 13
              Caption = 'Unidade RF de Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_3_RFEmbarque: TSpeedButton
              Left = 103
              Top = 161
              Width = 23
              Height = 22
              Hint = 'Consultar Unidade RF de Embarque'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_3_RFEmbarqueClick
            end
            object Label46: TLabel
              Left = 16
              Top = 186
              Width = 94
              Height = 13
              Caption = 'Condi'#231#227'o de Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label47: TLabel
              Left = 16
              Top = 226
              Width = 127
              Height = 13
              Caption = 'Modalidade de Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label48: TLabel
              Left = 16
              Top = 266
              Width = 33
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_3_Moeda: TSpeedButton
              Left = 60
              Top = 281
              Width = 23
              Height = 22
              Hint = 'Consultar Moeda'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_3_MoedaClick
            end
            object dbedt_3_PaisDestino: TDBEdit
              Left = 16
              Top = 41
              Width = 38
              Height = 21
              DataField = 'CD_PAIS_FINAL'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dblcb_3_PaisDestino: TDBLookupComboBox
              Left = 89
              Top = 41
              Width = 493
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_PAIS_FINAL'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_PAIS'
              ListField = 'NM_PAIS'
              ListSource = datmRE_NOVOEX.ds_Pais
              NullValueKey = 46
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_3_InstrumentoNegociacao: TDBEdit
              Left = 16
              Top = 81
              Width = 65
              Height = 21
              DataField = 'CD_INST_NEGO'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dblcb_3_InstrumentoNegociacao: TDBLookupComboBox
              Left = 116
              Top = 81
              Width = 466
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_INST_NEGO'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_INST_NEGOC'
              ListField = 'NM_INST_NEGOC'
              ListSource = datmRE_NOVOEX.ds_InstNegoc
              NullValueKey = 46
              ParentFont = False
              TabOrder = 3
            end
            object dbedt_3_RFDespacho: TDBEdit
              Left = 16
              Top = 121
              Width = 81
              Height = 21
              DataField = 'CD_URF_DESPACHO'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dblcb_3_RFDespacho: TDBLookupComboBox
              Left = 131
              Top = 121
              Width = 451
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_URF_DESPACHO'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = datmRE_NOVOEX.ds_RF
              NullValueKey = 46
              ParentFont = False
              TabOrder = 5
            end
            object dbedt_3_RFEmbarque: TDBEdit
              Left = 16
              Top = 161
              Width = 81
              Height = 21
              DataField = 'CD_URF_EMBARQUE'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object dblcb_3_RFEmbarque: TDBLookupComboBox
              Left = 131
              Top = 161
              Width = 451
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_URF_EMBARQUE'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = datmRE_NOVOEX.ds_RF
              NullValueKey = 46
              ParentFont = False
              TabOrder = 7
            end
            object dbedt_3_CondicaoVenda: TDBEdit
              Left = 16
              Top = 201
              Width = 45
              Height = 21
              DataField = 'CD_INCOTERM'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object dblcb_3_CondicaoVenda: TDBLookupComboBox
              Left = 64
              Top = 201
              Width = 518
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_INCOTERM'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = datmRE_NOVOEX.ds_Incoterm
              NullValueKey = 46
              ParentFont = False
              TabOrder = 9
            end
            object dbcbo_3_ModalidadePagamento: TDBLookupComboBox
              Left = 16
              Top = 241
              Width = 566
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_MODALIDADE_TRANS'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_MODALIDADE'
              ListField = 'NM_MODALIDADE'
              ListSource = datmRE_NOVOEX.ds_ModPag
              NullValueKey = 46
              ParentFont = False
              TabOrder = 10
            end
            object dbedt_3_Moeda: TDBEdit
              Left = 16
              Top = 281
              Width = 38
              Height = 21
              DataField = 'CD_MOEDA'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
            end
            object dblcb_3_Moeda: TDBLookupComboBox
              Left = 89
              Top = 281
              Width = 493
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_MOEDA'
              DataSource = datmRE_NOVOEX.ds_RE_Capa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_MOEDA'
              ListField = 'NM_MOEDA'
              ListSource = datmRE_NOVOEX.ds_Moeda
              NullValueKey = 46
              ParentFont = False
              TabOrder = 12
            end
            object gbValoresOperacaoExp: TcxGroupBox
              Left = 16
              Top = 310
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Valores da Opera'#231#227'o de Exporta'#231#227'o'
              Ctl3D = True
              ParentCtl3D = False
              ParentFont = False
              Style.BorderColor = clTeal
              Style.BorderStyle = ebsSingle
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.TransparentBorder = False
              TabOrder = 13
              Height = 83
              Width = 567
              object Label49: TLabel
                Left = 16
                Top = 24
                Width = 96
                Height = 26
                Caption = 'Valor com Cobertura'#13#10'Cambial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label50: TLabel
                Left = 138
                Top = 24
                Width = 95
                Height = 26
                Caption = 'Valor sem Cobertura'#13#10'Cambial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label51: TLabel
                Left = 261
                Top = 24
                Width = 66
                Height = 26
                Caption = 'Valor Total da'#13#10'Opera'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label52: TLabel
                Left = 385
                Top = 29
                Width = 92
                Height = 13
                Caption = 'Saldo da Opera'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label53: TLabel
                Left = 127
                Top = 53
                Width = 9
                Height = 20
                Caption = '+'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label54: TLabel
                Left = 249
                Top = 53
                Width = 9
                Height = 20
                Caption = '='
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label55: TLabel
                Left = 364
                Top = 53
                Width = 18
                Height = 20
                Caption = '>>'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object dbedt_3_ValorComCoberturaCambial: TDBEdit
                Left = 16
                Top = 52
                Width = 108
                Height = 21
                DataField = 'VL_VALOR_COBER_CAMBIAL'
                DataSource = datmRE_NOVOEX.ds_RE_Capa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object dbedt_3_ValorSemCoberturaCambial: TDBEdit
                Left = 138
                Top = 52
                Width = 108
                Height = 21
                DataField = 'VL_SEM_COB_CAMBIAL'
                DataSource = datmRE_NOVOEX.ds_RE_Capa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object dblbl_3_ValorTotalOperacao: TcxDBLabel
                Left = 261
                Top = 52
                DataBinding.DataField = 'VL_TOTAL_CAPA'
                DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
                ParentColor = False
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.LabelStyle = cxlsLowered
                Style.BorderColor = 4227327
                Style.BorderStyle = ebsSingle
                Style.Color = 15528703
                Style.HotTrack = False
                Height = 21
                Width = 99
                AnchorX = 360
                AnchorY = 63
              end
              object cxDBLabel3: TcxDBLabel
                Left = 388
                Top = 52
                DataBinding.DataField = 'VL_SALDO_CAPA'
                DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
                ParentColor = False
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.LabelStyle = cxlsLowered
                Style.BorderColor = 4227327
                Style.BorderStyle = ebsSingle
                Style.Color = 15528703
                Style.HotTrack = False
                Height = 21
                Width = 99
                AnchorX = 487
                AnchorY = 63
              end
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 4
        Caption = 'Dados da Mercadoria'
        object Label15: TLabel
          Left = 13
          Top = 11
          Width = 168
          Height = 16
          Caption = '4. Dados da Mercadoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbDadosMercadoria: TScrollBox
          Left = 0
          Top = 24
          Width = 614
          Height = 397
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            597
            397)
          object Label59: TLabel
            Left = 32
            Top = 3
            Width = 108
            Height = 26
            Alignment = taRightJustify
            Caption = 'O exportador '#233' o '#250'nico'#13#10'fabricante?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dblbl_4_NumeroRE: TDBText
            Left = 489
            Top = 16
            Width = 110
            Height = 13
            Anchors = [akTop, akRight]
            DataField = 'NR_RE'
            DataSource = datmRE_NOVOEX.ds_RE_Anexo
          end
          object Label130: TLabel
            Left = 464
            Top = 16
            Width = 22
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'RE:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbrg_4_ExportadorUnicoFabricante: TcxDBRadioGroup
            Left = 147
            Top = -6
            DataBinding.DataField = 'IN_EXPORTADOR_FABRICANTE'
            DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
            Properties.Columns = 2
            Properties.DefaultValue = '0'
            Properties.Items = <
              item
                Caption = 'Sim'
                Value = '1'
              end
              item
                Caption = 'N'#227'o'
                Value = '0'
              end>
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Height = 32
            Width = 129
          end
          object gbMercadoria: TcxGroupBox
            Left = 5
            Top = 41
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Mercadoria'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 1
            DesignSize = (
              594
              208)
            Height = 208
            Width = 594
            object Label56: TLabel
              Left = 16
              Top = 20
              Width = 60
              Height = 13
              Caption = 'C'#243'digo NCM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_4_NCM: TSpeedButton
              Left = 99
              Top = 34
              Width = 23
              Height = 22
              Hint = 'Consultar C'#243'digo NCM'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_4_NCMClick
            end
            object Label57: TLabel
              Left = 16
              Top = 63
              Width = 119
              Height = 13
              Caption = 'Descri'#231#227'o da Mercadoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label58: TLabel
              Left = 16
              Top = 164
              Width = 74
              Height = 13
              Caption = 'Validade do RE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 16
              Top = 101
              Width = 86
              Height = 13
              Caption = 'C'#243'digo Naladi/SH'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_4_NCM: TDBEdit
              Left = 16
              Top = 35
              Width = 57
              Height = 21
              DataField = 'CD_NCM'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_4_Naladi: TDBEdit
              Left = 16
              Top = 115
              Width = 81
              Height = 21
              DataField = 'CD_NALADI'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dblcb_4_Naladi: TDBLookupComboBox
              Left = 16
              Top = 137
              Width = 565
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_NALADI'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'Codigo'
              ListField = 'Descricao'
              ListSource = datmRE_NOVOEX.ds_NALADI
              ParentFont = False
              TabOrder = 2
            end
            object dblbl_4_NCM_Descricao: TcxDBLabel
              Left = 16
              Top = 77
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataField = 'lookupNM_NCM'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 563
              AnchorY = 88
            end
            object dblbl_4_ValidadeRE: TcxDBLabel
              Left = 16
              Top = 180
              DataBinding.DataField = 'DT_VALIDADE_EMBARQUE'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 89
              AnchorY = 191
            end
            object dbedt_4_SulfixoNCM: TDBEdit
              Left = 72
              Top = 35
              Width = 25
              Height = 21
              DataField = 'CD_SULF_NCM'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
          object gbConsolidacaoItensMercadoria: TcxGroupBox
            Left = 5
            Top = 256
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Consolida'#231#227'o dos Itens de Mercadoria'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 2
            DesignSize = (
              595
              260)
            Height = 260
            Width = 595
            object Label60: TLabel
              Left = 16
              Top = 25
              Width = 153
              Height = 13
              Caption = 'Un. Medida de Comercializa'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label61: TLabel
              Left = 16
              Top = 50
              Width = 150
              Height = 13
              Caption = 'Prazo de Pagamento (Em Dias):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Bevel4: TBevel
              Left = 15
              Top = 79
              Width = 564
              Height = 2
              Anchors = [akLeft, akTop, akRight]
            end
            object Label62: TLabel
              Left = 15
              Top = 90
              Width = 183
              Height = 28
              AutoSize = False
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label63: TLabel
              Left = 200
              Top = 90
              Width = 379
              Height = 13
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Valor'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label64: TLabel
              Left = 200
              Top = 105
              Width = 135
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Na Condi'#231#227'o de Venda'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label65: TLabel
              Left = 15
              Top = 120
              Width = 183
              Height = 13
              AutoSize = False
              Caption = 'Pre'#231'o Total'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label66: TLabel
              Left = 15
              Top = 135
              Width = 183
              Height = 28
              AutoSize = False
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label67: TLabel
              Left = 15
              Top = 165
              Width = 183
              Height = 13
              AutoSize = False
              Caption = 'Un. Medida na Comercializa'#231#227'o'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label68: TLabel
              Left = 15
              Top = 180
              Width = 183
              Height = 13
              AutoSize = False
              Caption = 'Un. Medida Estat'#237'stica'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label69: TLabel
              Left = 15
              Top = 195
              Width = 183
              Height = 13
              AutoSize = False
              Caption = 'Quilograma L'#237'quido'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label71: TLabel
              Left = 337
              Top = 105
              Width = 242
              Height = 13
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'No Local de Embarque'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label74: TLabel
              Left = 200
              Top = 135
              Width = 379
              Height = 13
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'NCM'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label75: TLabel
              Left = 200
              Top = 150
              Width = 135
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Quantidade'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label76: TLabel
              Left = 337
              Top = 150
              Width = 242
              Height = 13
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'Unidade'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label16: TLabel
              Left = 337
              Top = 195
              Width = 32
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = '100'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label18: TLabel
              Left = 371
              Top = 195
              Width = 208
              Height = 13
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 'QUILOGRAMA'
              Color = 14736316
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object dbedt_4_UnidadeMedidaComerc: TDBEdit
              Left = 175
              Top = 22
              Width = 42
              Height = 21
              DataField = 'CD_UNID_MEDIDA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_4_PrazoPagamento: TDBEdit
              Left = 175
              Top = 47
              Width = 50
              Height = 21
              DataField = 'QTD_PRAZO_PAGAMENTO'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dblbl_4_ValorCondicaoVenda: TcxDBLabel
              Left = 198
              Top = 118
              DataBinding.DataField = 'VL_COND_VENDA'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 139
              AnchorX = 337
              AnchorY = 127
            end
            object dblbl_4_ValorLocalEmbarque: TcxDBLabel
              Left = 335
              Top = 118
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataField = 'VL_LOCAL_VENDA'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 246
              AnchorX = 581
              AnchorY = 127
            end
            object dblbl_4_QuantidadeUnidadeComerc: TcxDBLabel
              Left = 198
              Top = 163
              DataBinding.DataField = 'QT_UNIDADE_COMERCIAL'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 139
              AnchorX = 337
              AnchorY = 172
            end
            object dblbl_4_QuantidadeUnidadeEstat: TcxDBLabel
              Left = 198
              Top = 178
              DataBinding.DataField = 'QT_MEDIA_NBM'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 139
              AnchorX = 337
              AnchorY = 187
            end
            object dblbl_4_QuantidadeQuilogramaLiquido: TcxDBLabel
              Left = 198
              Top = 193
              DataBinding.DataField = 'PESO_LIQUIDO'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 139
              AnchorX = 337
              AnchorY = 202
            end
            object cxDBLabel1: TcxDBLabel
              Left = 335
              Top = 163
              DataBinding.DataField = 'CD_UNID_MEDIDA'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 36
              AnchorX = 353
              AnchorY = 172
            end
            object cxDBLabel2: TcxDBLabel
              Left = 335
              Top = 178
              DataBinding.DataField = 'CD_UNID_MEDIDA_ESTAT'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 36
              AnchorX = 353
              AnchorY = 187
            end
            object cxDBLabel4: TcxDBLabel
              Left = 369
              Top = 163
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataField = 'lookupNM_UNID_MEDIDA'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 212
              AnchorX = 475
              AnchorY = 172
            end
            object cxDBLabel5: TcxDBLabel
              Left = 369
              Top = 178
              Anchors = [akLeft, akTop, akRight]
              DataBinding.DataField = 'lookupNM_UNID_MEDIDA_NCM'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsNone
              Style.Color = 14736316
              Style.HotTrack = False
              Height = 17
              Width = 212
              AnchorX = 475
              AnchorY = 187
            end
            object dblcb_4_UnidadeMedidaComerc: TDBLookupComboBox
              Left = 218
              Top = 22
              Width = 362
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CD_UNID_MEDIDA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_UNID_MEDIDA'
              ListField = 'NM_UNID_MEDIDA'
              ListSource = datmRE_NOVOEX.ds_UnidadeMedida
              ParentFont = False
              TabOrder = 11
            end
            object cxgMercadorias: TcxGrid
              Left = 14
              Top = 214
              Width = 565
              Height = 39
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 12
              object cxgdbbtvMercadorias: TcxGridDBBandedTableView
                Navigator.Buttons.First.Visible = True
                Navigator.Buttons.PriorPage.Visible = True
                Navigator.Buttons.Prior.Visible = True
                Navigator.Buttons.Next.Visible = True
                Navigator.Buttons.NextPage.Visible = True
                Navigator.Buttons.Last.Visible = True
                Navigator.Buttons.Insert.Visible = True
                Navigator.Buttons.Delete.Visible = True
                Navigator.Buttons.Edit.Visible = True
                Navigator.Buttons.Post.Visible = True
                Navigator.Buttons.Cancel.Visible = True
                Navigator.Buttons.Refresh.Visible = True
                Navigator.Buttons.SaveBookmark.Visible = True
                Navigator.Buttons.GotoBookmark.Visible = True
                Navigator.Buttons.Filter.Visible = True
                DataController.DataSource = datmRE_NOVOEX.ds_RE_Anexo_Itens
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnMoving = False
                OptionsCustomize.ColumnSorting = False
                OptionsCustomize.ColumnVertSizing = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.ScrollBars = ssNone
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Background = cxgBackGround
                Styles.Content = cxgBackGround
                Styles.Header = cxsHeader
                Styles.BandHeader = cxsHeader
                Bands = <
                  item
                    Caption = 'Mercadoria'
                  end
                  item
                    Caption = 'Valores, Pesos e Quantidades'
                  end>
                object cxgdbbtvMercadoriasDBBandedColumn1: TcxGridDBBandedColumn
                  Caption = 'C'#243'digo'
                  DataBinding.FieldName = 'CD_MERCADORIA'
                  Width = 90
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxgdbbtvMercadoriasDBBandedColumn2: TcxGridDBBandedColumn
                  Caption = 'Descri'#231#227'o'
                  DataBinding.FieldName = 'TX_MERCADORIA_ITEM'
                  Width = 185
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxgdbbtvMercadoriasDBBandedColumn3: TcxGridDBBandedColumn
                  Caption = 'Quantidade'
                  DataBinding.FieldName = 'QT_MERCADORIA'
                  Width = 73
                  Position.BandIndex = 1
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxgdbbtvMercadoriasDBBandedColumn4: TcxGridDBBandedColumn
                  Caption = 'Valor MCV'
                  DataBinding.FieldName = 'VL_MCV'
                  Width = 64
                  Position.BandIndex = 1
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxgdbbtvMercadoriasDBBandedColumn5: TcxGridDBBandedColumn
                  Caption = 'Valor MLE'
                  DataBinding.FieldName = 'VL_MLE'
                  Width = 64
                  Position.BandIndex = 1
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxgdbbtvMercadoriasDBBandedColumn6: TcxGridDBBandedColumn
                  Caption = 'Peso L'#237'quido'
                  DataBinding.FieldName = 'VL_TOT_PESO_LIQ'
                  Width = 74
                  Position.BandIndex = 1
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
              end
              object cxglMercadorias: TcxGridLevel
                GridView = cxgdbbtvMercadorias
              end
            end
          end
          object gbComissaoAgente: TcxGroupBox
            Left = 5
            Top = 522
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Comiss'#227'o do Agente'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 3
            Height = 69
            Width = 596
            object Label83: TLabel
              Left = 32
              Top = 20
              Width = 62
              Height = 13
              Caption = 'Comiss'#227'o (%)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label84: TLabel
              Left = 136
              Top = 20
              Width = 24
              Height = 13
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label85: TLabel
              Left = 280
              Top = 20
              Width = 101
              Height = 13
              Caption = 'Forma de Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_4_Comissao: TDBEdit
              Left = 33
              Top = 35
              Width = 49
              Height = 21
              DataField = 'PC_COMISSAO'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dblbl_4_ValorComissao: TcxDBLabel
              Left = 136
              Top = 36
              DataBinding.DataField = 'VL_COMISSAO'
              DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Vert = taVCenter
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 97
              AnchorY = 47
            end
            object dblcb_4_FormaPagamento: TDBLookupComboBox
              Left = 280
              Top = 35
              Width = 145
              Height = 21
              DataField = 'CD_FORMA_PGTO'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_FORMA_PAGAMENTO'
              ListField = 'NM_FORMA_PAGAMENTO'
              ListSource = datmRE_NOVOEX.ds_FormaPag
              ParentFont = False
              TabOrder = 2
            end
          end
          object gbCategoriaCota: TcxGroupBox
            Left = 5
            Top = 598
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Categoria da Cota'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 4
            DesignSize = (
              596
              69)
            Height = 69
            Width = 596
            object Label86: TLabel
              Left = 16
              Top = 20
              Width = 45
              Height = 13
              Caption = 'Categoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_4_CategoriaCota: TSpeedButton
              Left = 69
              Top = 35
              Width = 23
              Height = 22
              Hint = 'Consultar Categoria de Cota'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object dbedt_4_CategoriaCota: TDBEdit
              Left = 16
              Top = 35
              Width = 49
              Height = 21
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_4_CategoriaCotaNome: TDBEdit
              Left = 96
              Top = 35
              Width = 486
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object gbObservacao: TcxGroupBox
            Left = 5
            Top = 675
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Observa'#231#227'o'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 5
            DesignSize = (
              596
              96)
            Height = 96
            Width = 596
            object btn_4_Observacao: TSpeedButton
              Left = 566
              Top = 24
              Width = 23
              Height = 22
              Hint = 'Consultar Observa'#231#227'o'
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_4_ObservacaoClick
            end
            object dbedt_4_Descricao: TDBMemo
              Left = 16
              Top = 24
              Width = 547
              Height = 60
              Anchors = [akLeft, akTop, akRight]
              DataField = 'TX_DESC_MERCADORIA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 500
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 5
        Caption = 'Drawback'
        object lblTituloDrawback: TLabel
          Left = 13
          Top = 11
          Width = 86
          Height = 16
          Caption = '5. Drawback'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbDrawback: TScrollBox
          Left = 0
          Top = 24
          Width = 614
          Height = 397
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            597
            397)
          object gbDrawback: TcxGroupBox
            Left = 5
            Top = 121
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Informa'#231#245'es de Drawback'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 272
            Width = 226
            object Label88: TLabel
              Left = 16
              Top = 20
              Width = 27
              Height = 13
              Caption = 'CNPJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label89: TLabel
              Left = 16
              Top = 61
              Width = 24
              Height = 13
              Caption = 'NCM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label90: TLabel
              Left = 16
              Top = 101
              Width = 77
              Height = 13
              Caption = 'Ato Concess'#243'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label91: TLabel
              Left = 264
              Top = 101
              Width = 20
              Height = 13
              Caption = 'Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label92: TLabel
              Left = 16
              Top = 141
              Width = 190
              Height = 13
              Caption = 'Valor Moeda RE com Cobertura Cambial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label93: TLabel
              Left = 264
              Top = 141
              Width = 189
              Height = 13
              Caption = 'Valor Moeda RE sem Cobertura Cambial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label94: TLabel
              Left = 16
              Top = 181
              Width = 162
              Height = 13
              Caption = 'Vl com Cobertura Cambial em US$'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label95: TLabel
              Left = 264
              Top = 181
              Width = 161
              Height = 13
              Caption = 'Vl sem Cobertura Cambial em US$'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label96: TLabel
              Left = 16
              Top = 221
              Width = 55
              Height = 13
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_5_CNPJ: TDBEdit
              Left = 16
              Top = 35
              Width = 145
              Height = 21
              DataField = 'CNPJ'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_5_NCM: TDBEdit
              Left = 16
              Top = 75
              Width = 89
              Height = 21
              DataField = 'NCM'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_5_AtoConcessorio: TDBEdit
              Left = 16
              Top = 115
              Width = 113
              Height = 21
              DataField = 'NR_ATO_CONCESSORIO'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbedt_5_Item: TDBEdit
              Left = 264
              Top = 115
              Width = 49
              Height = 21
              DataField = 'NR_ITEM_ATO_CONCESSORIO'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbedt_5_ValorMoedaComCobertura: TDBEdit
              Left = 16
              Top = 155
              Width = 113
              Height = 21
              DataField = 'VL_MOEDA_RE_COM_COBERTURA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbedt_5_ValorMoedaSemCobertura: TDBEdit
              Left = 264
              Top = 155
              Width = 113
              Height = 21
              DataField = 'VL_MOEDA_RE_SEM_COBERTURA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object dbedt_5_ValorDolarComCobertura: TDBEdit
              Left = 16
              Top = 195
              Width = 113
              Height = 21
              DataField = 'VL_DOLAR_RE_COM_COBERTURA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object dbedt_5_ValorDolarSemCobertura: TDBEdit
              Left = 264
              Top = 195
              Width = 113
              Height = 21
              DataField = 'VL_DOLAR_RE_SEM_COBERTURA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object dbedt_5_Quantidade: TDBEdit
              Left = 16
              Top = 235
              Width = 113
              Height = 21
              DataField = 'QT_MERCADORIA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
          end
          object btn_5_Incluir: TButton
            Left = 128
            Top = 402
            Width = 75
            Height = 19
            Caption = 'Incluir'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btn_5_IncluirClick
          end
          object btn_5_Atualizar: TButton
            Left = 216
            Top = 402
            Width = 75
            Height = 19
            Caption = 'Atualizar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btn_5_AtualizarClick
          end
          object btn_5_Excluir: TButton
            Left = 392
            Top = 402
            Width = 145
            Height = 19
            Caption = 'Excluir Selecionados'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = btn_5_ExcluirClick
          end
          object cxgDrawback: TcxGrid
            Left = 5
            Top = 434
            Width = 226
            Height = 113
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            object cxgdbbtvDrawback: TcxGridDBBandedTableView
              Navigator.Buttons.First.Visible = True
              Navigator.Buttons.PriorPage.Visible = True
              Navigator.Buttons.Prior.Visible = True
              Navigator.Buttons.Next.Visible = True
              Navigator.Buttons.NextPage.Visible = True
              Navigator.Buttons.Last.Visible = True
              Navigator.Buttons.Insert.Visible = True
              Navigator.Buttons.Delete.Visible = True
              Navigator.Buttons.Edit.Visible = True
              Navigator.Buttons.Post.Visible = True
              Navigator.Buttons.Cancel.Visible = True
              Navigator.Buttons.Refresh.Visible = True
              Navigator.Buttons.SaveBookmark.Visible = True
              Navigator.Buttons.GotoBookmark.Visible = True
              Navigator.Buttons.Filter.Visible = True
              DataController.DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsCustomize.ColumnSorting = False
              OptionsCustomize.ColumnVertSizing = False
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = cxgBackGround
              Styles.Header = cxsHeader
              Styles.BandHeader = cxsHeader
              Bands = <
                item
                  Caption = 'Aos Concess'#243'rios'
                  Width = 535
                end>
              object cxgdbbcDrawbackCNPJ: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CNPJ'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 20
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackNCM: TcxGridDBBandedColumn
                DataBinding.FieldName = 'NCM'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 20
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackAtoConcessorio: TcxGridDBBandedColumn
                Caption = 'N'#186' Ato'
                DataBinding.FieldName = 'NR_ATO_CONCESSORIO'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 25
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackItem: TcxGridDBBandedColumn
                Caption = 'Item'
                DataBinding.FieldName = 'NR_ITEM_ATO_CONCESSORIO'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 20
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackQuantidade: TcxGridDBBandedColumn
                Caption = 'Quantidade'
                DataBinding.FieldName = 'QT_MERCADORIA'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 35
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackValorREComCobertura: TcxGridDBBandedColumn
                Caption = 'Vl. Moeda RE c/ Cob. Cambial'
                DataBinding.FieldName = 'VL_MOEDA_RE_COM_COBERTURA'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackValorRESemCobertura: TcxGridDBBandedColumn
                Caption = 'Vl. Moeda RE s/ Cob. Cambial'
                DataBinding.FieldName = 'VL_MOEDA_RE_SEM_COBERTURA'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackNF: TcxGridDBBandedColumn
                Caption = 'NF'
                DataBinding.FieldName = 'NR_NF'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 20
                Position.BandIndex = 0
                Position.ColIndex = 7
                Position.RowIndex = 0
              end
              object cxgdbbcDrawbackEditar: TcxGridDBBandedColumn
                Caption = 'Editar'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 20
                Position.BandIndex = 0
                Position.ColIndex = 8
                Position.RowIndex = 0
              end
            end
            object cxglDrawback: TcxGridLevel
              GridView = cxgdbbtvDrawback
            end
          end
          object btn_5_Cancelar: TButton
            Left = 304
            Top = 402
            Width = 75
            Height = 19
            Caption = 'Cancelar'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = btn_5_CancelarClick
          end
          object cxGroupBox3: TcxGroupBox
            Left = 5
            Top = 561
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Nota Fiscal'
            Ctl3D = True
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 6
            Height = 68
            Width = 226
            object Label70: TLabel
              Left = 16
              Top = 20
              Width = 53
              Height = 13
              Caption = 'Nota Fiscal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label73: TLabel
              Left = 136
              Top = 21
              Width = 23
              Height = 13
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label77: TLabel
              Left = 248
              Top = 21
              Width = 106
              Height = 13
              Caption = 'Quantidade Exportada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label79: TLabel
              Left = 384
              Top = 21
              Width = 24
              Height = 13
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_5_NR_NF: TDBEdit
              Left = 16
              Top = 35
              Width = 97
              Height = 21
              DataField = 'NR_NF'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_5_DT_NF: TDBEdit
              Left = 136
              Top = 35
              Width = 89
              Height = 21
              DataField = 'DT_NF'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_5_QTD_NF: TDBEdit
              Left = 248
              Top = 35
              Width = 113
              Height = 21
              DataField = 'QTD_NF'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbedt_5_VL_NF: TDBEdit
              Left = 384
              Top = 35
              Width = 113
              Height = 21
              DataField = 'VL_NF'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Drawback
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
          object cxGroupBox4: TcxGroupBox
            Left = 5
            Top = 5
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Saldos'
            Ctl3D = True
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Color = 15723998
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 7
            Height = 107
            Width = 404
            object Label78: TLabel
              Left = 16
              Top = 21
              Width = 85
              Height = 13
              Caption = 'Saldo Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label135: TLabel
              Left = 192
              Top = 21
              Width = 151
              Height = 13
              Caption = 'Saldo VL Moeda com Cobertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label136: TLabel
              Left = 16
              Top = 61
              Width = 82
              Height = 13
              Caption = 'Quantidade Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label138: TLabel
              Left = 192
              Top = 61
              Width = 148
              Height = 13
              Caption = 'VL Total Moeda com Cobertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label87: TLabel
              Left = 368
              Top = 21
              Width = 150
              Height = 13
              Caption = 'Saldo VL Moeda sem Cobertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label139: TLabel
              Left = 368
              Top = 61
              Width = 147
              Height = 13
              Caption = 'VL Total Moeda sem Cobertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object cxDBLabel6: TcxDBLabel
              Left = 15
              Top = 36
              DataBinding.DataField = 'calcQT_SALDO_DRAWBACK'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 142
              AnchorY = 47
            end
            object cxDBLabel8: TcxDBLabel
              Left = 191
              Top = 36
              DataBinding.DataField = 'calcVL_SALDO_DRAWBACK_COM_COB'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 318
              AnchorY = 47
            end
            object cxDBLabel9: TcxDBLabel
              Left = 15
              Top = 76
              DataBinding.DataField = 'calcQT_TOTAL_DRAWBACK'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 142
              AnchorY = 87
            end
            object cxDBLabel11: TcxDBLabel
              Left = 191
              Top = 76
              DataBinding.DataField = 'calcVL_TOTAL_DRAWBACK_COM_COB'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 318
              AnchorY = 87
            end
            object cxDBLabel12: TcxDBLabel
              Left = 367
              Top = 36
              DataBinding.DataField = 'calcVL_SALDO_DRAWBACK_SEM_COB'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 494
              AnchorY = 47
            end
            object cxDBLabel13: TcxDBLabel
              Left = 367
              Top = 76
              DataBinding.DataField = 'calcVL_TOTAL_DRAWBACK_SEM_COB'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 494
              AnchorY = 87
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 6
        Caption = 'CCPTC / CCROM'
        object lblTituloCCTPC: TLabel
          Left = 13
          Top = 11
          Width = 134
          Height = 16
          Caption = '6. CCPTC / CCROM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbCCPTC_CCROM: TScrollBox
          Left = 0
          Top = 24
          Width = 614
          Height = 397
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            614
            397)
          object gbCCPTC_CCROM: TcxGroupBox
            Left = 5
            Top = 1
            Anchors = [akLeft, akTop, akRight]
            Ctl3D = True
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Color = 15723998
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            DesignSize = (
              589
              321)
            Height = 321
            Width = 589
            object Label98: TLabel
              Left = 16
              Top = 21
              Width = 186
              Height = 13
              Caption = 'A mercadoria '#233' amparada por CCPTC ?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label99: TLabel
              Left = 16
              Top = 41
              Width = 313
              Height = 32
              AutoSize = False
              Caption = 
                'A mercadoria foi produzida no Brasil utilizando insumos estrange' +
                'iros amparados por CCPTC ?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label100: TLabel
              Left = 16
              Top = 74
              Width = 190
              Height = 13
              Caption = 'A mercadoria '#233' amparada por CCROM ?'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label102: TLabel
              Left = 46
              Top = 109
              Width = 71
              Height = 13
              Caption = 'C'#243'digo CCPTC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label103: TLabel
              Left = 181
              Top = 109
              Width = 24
              Height = 13
              Caption = 'NCM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label104: TLabel
              Left = 261
              Top = 109
              Width = 78
              Height = 13
              Caption = 'Unidade Medida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label105: TLabel
              Left = 381
              Top = 109
              Width = 111
              Height = 13
              Caption = 'Qtd. Medida Estat'#237'stica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_6_CCPTC: TDBEdit
              Left = 16
              Top = 123
              Width = 129
              Height = 21
              DataField = 'NM_CERTIFICADO'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_CCPTC
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_6_NCM: TDBEdit
              Left = 152
              Top = 123
              Width = 89
              Height = 21
              DataField = 'CD_NCM'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_6_UnidadeMedida: TDBEdit
              Left = 248
              Top = 123
              Width = 105
              Height = 21
              DataField = 'lookupNM_UNID_MEDIDA_NCM'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbedt_6_Quantidade: TDBEdit
              Left = 360
              Top = 123
              Width = 161
              Height = 21
              DataField = 'QTD_ESTATISTICA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_CCPTC
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object btn_6_Incluir: TButton
              Left = 112
              Top = 165
              Width = 75
              Height = 19
              Caption = 'Incluir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnClick = btn_6_IncluirClick
            end
            object btn_6_Atualizar: TButton
              Left = 200
              Top = 165
              Width = 75
              Height = 19
              Caption = 'Atualizar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = btn_6_AtualizarClick
            end
            object btn_6_Excluir: TButton
              Left = 376
              Top = 165
              Width = 145
              Height = 19
              Caption = 'Excluir Selecionados'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnClick = btn_6_ExcluirClick
            end
            object cxgCCPTC: TcxGrid
              Left = 16
              Top = 199
              Width = 556
              Height = 113
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 8
              object cxgdbtvCCPTC: TcxGridDBTableView
                DataController.DataSource = datmRE_NOVOEX.ds_RE_Anexo_CCPTC
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnHorzSizing = False
                OptionsCustomize.ColumnMoving = False
                OptionsCustomize.ColumnSorting = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.ScrollBars = ssNone
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Background = cxgBackGround
                Styles.Header = cxsHeader
                object cxgdbbcCCPTC: TcxGridDBColumn
                  Caption = 'C'#243'digo CCPTC'
                  DataBinding.FieldName = 'NM_CERTIFICADO'
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 60
                  Width = 60
                end
                object cxgdbbcNCM: TcxGridDBColumn
                  Caption = 'NCM'
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 50
                  Width = 50
                end
                object cxgdbbcUnidadeMedida: TcxGridDBColumn
                  Caption = 'Unidade de Medida'
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 60
                  Width = 60
                end
                object cxgdbbcQuantidade: TcxGridDBColumn
                  Caption = 'Qtd. Medida Estat'#237'stica'
                  DataBinding.FieldName = 'QTD_ESTATISTICA'
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 80
                  Width = 80
                end
                object cxgdbbcEditar: TcxGridDBColumn
                  Caption = 'Editar'
                  HeaderAlignmentHorz = taCenter
                  MinWidth = 30
                  Width = 30
                end
              end
              object cxglCCPTC: TcxGridLevel
                GridView = cxgdbtvCCPTC
              end
            end
            object Panel2: TPanel
              Left = 370
              Top = 16
              Width = 124
              Height = 22
              BevelOuter = bvNone
              Caption = 'Panel2'
              ParentColor = True
              TabOrder = 9
              object dbrg_6_CCPTC: TcxDBRadioGroup
                Left = 0
                Top = -12
                DataBinding.DataField = 'IN_CCPTC'
                DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
                ParentFont = False
                Properties.Columns = 2
                Properties.DefaultValue = '0'
                Properties.Items = <
                  item
                    Caption = 'Sim'
                    Value = True
                  end
                  item
                    Caption = 'N'#227'o'
                    Value = False
                  end>
                Style.BorderStyle = ebsNone
                TabOrder = 0
                Height = 32
                Width = 129
              end
            end
            object Panel3: TPanel
              Left = 370
              Top = 42
              Width = 124
              Height = 22
              BevelOuter = bvNone
              Caption = 'Panel2'
              ParentColor = True
              TabOrder = 10
              object dbrg_6_CCPTC_Insumos: TcxDBRadioGroup
                Left = 0
                Top = -12
                DataBinding.DataField = 'IN_INSUMO_CCPTC'
                DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
                ParentFont = False
                Properties.Columns = 2
                Properties.DefaultValue = '0'
                Properties.Items = <
                  item
                    Caption = 'Sim'
                    Value = True
                  end
                  item
                    Caption = 'N'#227'o'
                    Value = False
                  end>
                Style.BorderStyle = ebsNone
                TabOrder = 0
                Height = 32
                Width = 129
              end
            end
            object Panel4: TPanel
              Left = 370
              Top = 69
              Width = 124
              Height = 22
              BevelOuter = bvNone
              Caption = 'Panel2'
              ParentColor = True
              TabOrder = 11
              object dbrg_6_CCROM: TcxDBRadioGroup
                Left = 0
                Top = -12
                DataBinding.DataField = 'IN_CCROM'
                DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
                ParentFont = False
                Properties.Columns = 2
                Properties.DefaultValue = '0'
                Properties.Items = <
                  item
                    Caption = 'Sim'
                    Value = True
                  end
                  item
                    Caption = 'N'#227'o'
                    Value = False
                  end>
                Style.BorderStyle = ebsNone
                TabOrder = 0
                Height = 32
                Width = 129
              end
            end
            object btn_6_Cancelar: TButton
              Left = 288
              Top = 165
              Width = 75
              Height = 19
              Caption = 'Cancelar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnClick = btn_6_CancelarClick
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 7
        Caption = 'Dados do Fabricante'
        object lblTituloFabricante: TLabel
          Left = 13
          Top = 11
          Width = 163
          Height = 16
          Caption = '7. Dados do Fabricante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbDadosFabricante: TScrollBox
          Left = 0
          Top = 27
          Width = 614
          Height = 394
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            597
            394)
          object gbSaldos: TcxGroupBox
            Left = 5
            Top = 5
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Saldos'
            Ctl3D = True
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Color = 15723998
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Height = 107
            Width = 596
            object Label107: TLabel
              Left = 14
              Top = 21
              Width = 85
              Height = 13
              Caption = 'Saldo Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label97: TLabel
              Left = 174
              Top = 21
              Width = 93
              Height = 13
              Caption = 'Saldo Peso L'#237'quido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label101: TLabel
              Left = 334
              Top = 21
              Width = 146
              Height = 13
              Caption = 'Saldo Vl Total Local Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label106: TLabel
              Left = 14
              Top = 61
              Width = 82
              Height = 13
              Caption = 'Quantidade Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label108: TLabel
              Left = 174
              Top = 61
              Width = 112
              Height = 13
              Caption = 'Peso L'#237'quido Total (Kg)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label109: TLabel
              Left = 334
              Top = 61
              Width = 131
              Height = 13
              Caption = 'Valor Total Local Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dblbl_7_SaldoQuantidade: TcxDBLabel
              Left = 13
              Top = 36
              DataBinding.DataField = 'calcQT_SALDO_FABRICANTE'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 140
              AnchorY = 47
            end
            object dblbl_7_SaldoPesoLiquido: TcxDBLabel
              Left = 173
              Top = 36
              DataBinding.DataField = 'calcPL_SALDO_FABRICANTE'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 300
              AnchorY = 47
            end
            object dblbl_7_SaldoValorLE: TcxDBLabel
              Left = 333
              Top = 36
              DataBinding.DataField = 'calcVL_SALDO_FABRICANTE'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 460
              AnchorY = 47
            end
            object dblbl_7_QuantidadeTotal: TcxDBLabel
              Left = 13
              Top = 76
              DataBinding.DataField = 'calcQT_TOTAL_FABRICANTE'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 140
              AnchorY = 87
            end
            object dblbl_7_PesoLiquidoTotal: TcxDBLabel
              Left = 173
              Top = 76
              DataBinding.DataField = 'calcPL_TOTAL_FABRICANTE'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 300
              AnchorY = 87
            end
            object dblbl_7_ValorTotalLE: TcxDBLabel
              Left = 333
              Top = 76
              DataBinding.DataField = 'calcVL_TOTAL_FABRICANTE'
              DataBinding.DataSource = datmRE_NOVOEX.ds_Totais
              ParentColor = False
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.LabelStyle = cxlsLowered
              Style.BorderColor = 4227327
              Style.BorderStyle = ebsSingle
              Style.Color = 15528703
              Style.HotTrack = False
              Height = 21
              Width = 127
              AnchorX = 460
              AnchorY = 87
            end
          end
          object gbDadosFabricante: TcxGroupBox
            Left = 5
            Top = 125
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Dados do Fabricante'
            Ctl3D = True
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            Style.BorderColor = clTeal
            Style.BorderStyle = ebsSingle
            Style.Color = 15723998
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clTeal
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 1
            DesignSize = (
              596
              425)
            Height = 425
            Width = 596
            object Label110: TLabel
              Left = 402
              Top = 23
              Width = 52
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'CNPJ/CPF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_7_UF: TSpeedButton
              Left = 169
              Top = 67
              Width = 23
              Height = 22
              Hint = 'Consultar UF'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_7_UFClick
            end
            object Label111: TLabel
              Left = 14
              Top = 71
              Width = 14
              Height = 13
              Caption = 'UF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label112: TLabel
              Left = 14
              Top = 118
              Width = 126
              Height = 26
              Caption = 'Quantidade na unidade de'#13#10'medida estat'#237'stica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label113: TLabel
              Left = 303
              Top = 118
              Width = 86
              Height = 26
              Caption = 'Unidade de'#13#10'medida estat'#237'stica'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label114: TLabel
              Left = 14
              Top = 149
              Width = 85
              Height = 13
              Caption = 'Peso L'#237'quido (Kg)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label115: TLabel
              Left = 14
              Top = 173
              Width = 143
              Height = 13
              Caption = 'Vl Moeda RE Local Embarque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label116: TLabel
              Left = 14
              Top = 197
              Width = 63
              Height = 13
              Caption = 'Observa'#231#245'es'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label82: TLabel
              Left = 14
              Top = 23
              Width = 53
              Height = 13
              Caption = 'Fabricante:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_7_Fabricante: TSpeedButton
              Left = 222
              Top = 19
              Width = 23
              Height = 22
              Hint = 'Consultar Fabricante'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_7_FabricanteClick
            end
            object btn_7_Observacao: TSpeedButton
              Left = 564
              Top = 212
              Width = 23
              Height = 22
              Hint = 'Consultar Observa'#231#227'o'
              Anchors = [akTop, akRight]
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFB09683996C5CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFB89E92772719641A0BAA8A7FFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC9F907127
                146C14087D6969FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFC2A2947922165F0E0B8C7069FF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFDACCC5C7ABA7D4A9A9DECBCBFF00FFB5A09275211A6E110C9B7A
                72FF00FFFF00FFFF00FFFF00FFFF00FFD4B4B18453496F38276A251A75271F72
                3D30895F506B2B1959140CA1857AFF00FFFF00FFFF00FFFF00FFFF00FFBB9891
                742A1F7222089057359B71528B634B754025791A056D1906957C70FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF703A28863213D49364C7AF7BB6B083AA9D7CAF
                8F70A75D426B1C048A6B5FFF00FFFF00FFFF00FFFF00FFFF00FFAA8D765A2105
                CB8757EFC587C8B579BCB17BBFA47CBAA084A7977373442473291DCDABA9FF00
                FFFF00FFFF00FFFF00FF9144407D3415EEBB7CFACE86F6C583EFBC83CBB474CC
                A47DBBA7819D74515E1300AA8478FF00FFFF00FFFF00FFFF00FF7F4A3E783D20
                FFE4ADF7DFA0F7DFA0FFDDA6FCC18CE0B981D1B682B9815D5A1000A68782FF00
                FFFF00FFFF00FFFF00FFB291845B270AEFC39BFEFFD3F3F5C9F4F0BDF7D59DF2
                C984EABB7CAE653F5C1B0EBCA8A2FF00FFFF00FFFF00FFFF00FFFF00FF5B2514
                AA6E53FFF4D6FFFFEFF5F6CBECE7ABFFDA92E6A66B6D1E078F6154FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB8958F601B0FA3675AF7C6BDFFF5DEFCDBB0CD
                9761803E16612719CAB3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B9938A5B251E6B241D7E382B7A3A1F59250E6D3F31BDA39EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA918B80493F825940BB
                9693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = btn_7_ObservacaoClick
            end
            object dbedt_7_UF: TDBEdit
              Left = 169
              Top = 43
              Width = 35
              Height = 21
              CharCase = ecUpperCase
              DataField = 'UF'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_7_Quantidade: TDBEdit
              Left = 169
              Top = 119
              Width = 122
              Height = 21
              DataField = 'QT_MERCADORIA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dbedt_7_UnidadeMedida: TDBEdit
              Left = 400
              Top = 119
              Width = 180
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'NM_UNID_MEDIDA'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object dbedt_7_PesoLiquido: TDBEdit
              Left = 169
              Top = 147
              Width = 163
              Height = 21
              DataField = 'PL_TOTAL'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object dbedt_7_ValorRELE: TDBEdit
              Left = 169
              Top = 171
              Width = 163
              Height = 21
              DataField = 'VL_TOTAL'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object btn_7_Incluir: TButton
              Left = 112
              Top = 273
              Width = 75
              Height = 19
              Caption = 'Incluir'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnClick = btn_7_IncluirClick
            end
            object btn_7_Atualizar: TButton
              Left = 200
              Top = 273
              Width = 75
              Height = 19
              Caption = 'Atualizar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              OnClick = btn_7_AtualizarClick
            end
            object btn_7_Excluir: TButton
              Left = 376
              Top = 273
              Width = 145
              Height = 19
              Caption = 'Excluir Selecionados'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              OnClick = btn_7_ExcluirClick
            end
            object dbmm_7_Observacoes: TDBMemo
              Left = 15
              Top = 212
              Width = 542
              Height = 49
              Anchors = [akLeft, akTop, akRight]
              DataField = 'TX_OBSERVACAO'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 7
            end
            object cxgFabricante: TcxGrid
              Left = 14
              Top = 302
              Width = 570
              Height = 115
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 12
              object cxgdbbtvFabricante: TcxGridDBBandedTableView
                Navigator.Buttons.First.Visible = True
                Navigator.Buttons.PriorPage.Visible = True
                Navigator.Buttons.Prior.Visible = True
                Navigator.Buttons.Next.Visible = True
                Navigator.Buttons.NextPage.Visible = True
                Navigator.Buttons.Last.Visible = True
                Navigator.Buttons.Insert.Visible = True
                Navigator.Buttons.Delete.Visible = True
                Navigator.Buttons.Edit.Visible = True
                Navigator.Buttons.Post.Visible = True
                Navigator.Buttons.Cancel.Visible = True
                Navigator.Buttons.Refresh.Visible = True
                Navigator.Buttons.SaveBookmark.Visible = True
                Navigator.Buttons.GotoBookmark.Visible = True
                Navigator.Buttons.Filter.Visible = True
                DataController.DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnMoving = False
                OptionsCustomize.ColumnSorting = False
                OptionsCustomize.ColumnVertSizing = False
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.Background = cxgBackGround
                Styles.Header = cxsHeader
                Styles.BandHeader = cxsHeader
                Bands = <
                  item
                    Caption = 'Dados Fabricante'
                    Width = 535
                  end>
                object cxgdbbcFabricante_CNPJ: TcxGridDBBandedColumn
                  Caption = 'CPF/CNPJ'
                  DataBinding.FieldName = 'CNPJ_FABRICANTE'
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 20
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxgdbbcFabricante_UF: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'UF'
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  MinWidth = 10
                  Width = 10
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxgdbbcFabricante_Quantidade: TcxGridDBBandedColumn
                  Caption = 'Quantidade'
                  DataBinding.FieldName = 'QT_MERCADORIA'
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 25
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxgdbbcFabricante_PesoLiquido: TcxGridDBBandedColumn
                  Caption = 'Peso L'#237'quido (Kg)'
                  DataBinding.FieldName = 'PL_TOTAL'
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 30
                  Position.BandIndex = 0
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxgdbbcFabricante_ValorMoedaRE: TcxGridDBBandedColumn
                  Caption = 'Vl Moeda RE Local Embarque'
                  DataBinding.FieldName = 'VL_TOTAL'
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 50
                  Position.BandIndex = 0
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
                object cxgdbbcFabricante_Editar: TcxGridDBBandedColumn
                  Caption = 'Editar'
                  HeaderAlignmentHorz = taCenter
                  HeaderAlignmentVert = vaCenter
                  Width = 20
                  Position.BandIndex = 0
                  Position.ColIndex = 5
                  Position.RowIndex = 0
                end
              end
              object cxglFabricante: TcxGridLevel
                GridView = cxgdbbtvFabricante
              end
            end
            object dblcb_7_UF_Nome: TDBLookupComboBox
              Left = 169
              Top = 93
              Width = 413
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'UF'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'CD_UF'
              ListField = 'NM_UF'
              ListSource = datmRE_NOVOEX.ds_UF
              ParentFont = False
              TabOrder = 2
            end
            object dbedt_7_Fabricante: TDBEdit
              Left = 169
              Top = 19
              Width = 50
              Height = 21
              DataField = 'CD_FABRICANTE'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_7_FabricanteChange
            end
            object btn_7_Cancelar: TButton
              Left = 288
              Top = 273
              Width = 75
              Height = 19
              Caption = 'Cancelar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              OnClick = btn_7_CancelarClick
            end
            object dbedt_7_Nome_Fabricante: TDBEdit
              Left = 249
              Top = 19
              Width = 147
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'NM_FABRICANTE'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
            end
            object dbedt_7_CNPJ_Fabricante: TDBEdit
              Left = 460
              Top = 19
              Width = 128
              Height = 21
              Anchors = [akTop, akRight]
              DataField = 'CNPJ_FABRICANTE'
              DataSource = datmRE_NOVOEX.ds_RE_Anexo_Fabric
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
              OnKeyPress = dbedt_7_CNPJ_FabricanteKeyPress
            end
          end
        end
      end
    end
    object pnlInformacoes: TPanel
      Left = 0
      Top = 0
      Width = 614
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Color = 14473400
      TabOrder = 1
      DesignSize = (
        614
        105)
      object Label9: TLabel
        Left = 16
        Top = 4
        Width = 236
        Height = 16
        Caption = 'Registro de Exporta'#231#227'o - Inclus'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 16
        Top = 24
        Width = 58
        Height = 13
        Caption = 'N'#186' do RE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 40
        Width = 119
        Height = 13
        Caption = 'CNPJ do Exportador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 16
        Top = 56
        Width = 120
        Height = 13
        Caption = 'Nome do Exportador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblbl_Titulo_CNPJ_Exportador: TDBText
        Left = 139
        Top = 40
        Width = 144
        Height = 13
        AutoSize = True
        DataField = 'lookupCNPJ_EXPORTADOR'
        DataSource = datmRE_NOVOEX.ds_RE_Capa
      end
      object dblbl_Titulo_NM_Exportador: TDBText
        Left = 139
        Top = 56
        Width = 134
        Height = 13
        AutoSize = True
        DataField = 'lookupNM_EXPORTADOR'
        DataSource = datmRE_NOVOEX.ds_RE_Capa
      end
      object Label72: TLabel
        Left = 16
        Top = 72
        Width = 110
        Height = 13
        Caption = 'Identif. do Arquivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblbl_Titulo_IDArquivo: TDBText
        Left = 139
        Top = 72
        Width = 107
        Height = 13
        AutoSize = True
        DataField = 'ID_ARQUIVO_NOVOEX'
        DataSource = datmRE_NOVOEX.ds_RE_Capa
      end
      object Label81: TLabel
        Left = 16
        Top = 88
        Width = 95
        Height = 13
        Caption = 'N'#250'mero do Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblbl_Titulo_NumeroLote: TDBText
        Left = 139
        Top = 88
        Width = 118
        Height = 13
        Cursor = crHandPoint
        AutoSize = True
        DataField = 'NR_LOTE'
        DataSource = datmRE_NOVOEX.ds_RE_Capa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = dblbl_Titulo_NumeroLoteClick
      end
      object dblbl_Titulo_NumeroRE: TDBText
        Left = 139
        Top = 24
        Width = 112
        Height = 13
        AutoSize = True
        DataField = 'NR_RE_SISCOMEX'
        DataSource = datmRE_NOVOEX.ds_RE_Capa
      end
      object dblblProcessoSombra: TDBText
        Left = 444
        Top = 8
        Width = 174
        Height = 24
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        DataField = 'PROCESSO_REDUZIDO_COMPLEMENTO'
        DataSource = datmRE_NOVOEX.ds_RE_Capa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dblblProcesso: TDBText
        Left = 442
        Top = 7
        Width = 174
        Height = 24
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        DataField = 'PROCESSO_REDUZIDO_COMPLEMENTO'
        DataSource = datmRE_NOVOEX.ds_RE_Capa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object tbOpcoes: TToolBar
        Left = 474
        Top = 34
        Width = 143
        Height = 28
        Align = alNone
        Anchors = [akRight, akBottom]
        Caption = 'tbOpcoes'
        Color = 15723998
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        Images = ImageList1
        Indent = 3
        ParentColor = False
        TabOrder = 0
        object btnSalvar: TToolButton
          Left = 3
          Top = 2
          Hint = 'Salvar as altera'#231#245'es'
          Caption = 'btnSalvar'
          Enabled = False
          ImageIndex = 0
          ParentShowHint = False
          ShowHint = True
          OnClick = btnSalvarClick
        end
        object ToolButton4: TToolButton
          Left = 26
          Top = 2
          Width = 5
          Caption = 'ToolButton4'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object btnCancelar: TToolButton
          Left = 31
          Top = 2
          Hint = 'Cancelar as altera'#231#245'es'
          Caption = 'btnCancelar'
          Enabled = False
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = True
          OnClick = btnCancelarClick
        end
        object ToolButton1: TToolButton
          Left = 54
          Top = 2
          Width = 5
          Caption = 'ToolButton1'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object btnClassificar: TToolButton
          Left = 59
          Top = 2
          Hint = 'Classificar Itens e Calcular Total'
          Caption = 'btnClassificar'
          Enabled = False
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = btnClassificarClick
        end
        object ToolButton2: TToolButton
          Left = 82
          Top = 2
          Width = 5
          Caption = 'ToolButton2'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnTransmitir: TToolButton
          Left = 87
          Top = 2
          Hint = 'Transmitir RE'
          Caption = 'btnTransmitir'
          Enabled = False
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnTransmitirClick
        end
        object btnSeparadorReconsultar: TToolButton
          Left = 110
          Top = 2
          Width = 5
          Caption = 'btnSeparadorReconsultar'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnReconsultar: TToolButton
          Left = 115
          Top = 2
          Hint = 'Consultar RE Novamente'
          Caption = 'btnReconsultar'
          Enabled = False
          ImageIndex = 4
          ParentShowHint = False
          ShowHint = True
          OnClick = btnReconsultarClick
        end
      end
    end
    object pnlNavegacao: TPanel
      Left = 450
      Top = 112
      Width = 165
      Height = 27
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Color = 15723998
      TabOrder = 2
      object btnVoltar: TButton
        Tag = -1
        Left = 5
        Top = 4
        Width = 75
        Height = 19
        Caption = '<< Voltar'
        TabOrder = 0
        OnClick = btnVoltarClick
      end
      object btnAvancar: TButton
        Tag = 1
        Left = 85
        Top = 4
        Width = 75
        Height = 19
        Caption = 'Avan'#231'ar >>'
        TabOrder = 1
        OnClick = btnVoltarClick
      end
    end
  end
  object pnlNavegacaoAdicao: TPanel
    Left = 386
    Top = 112
    Width = 185
    Height = 28
    BevelOuter = bvLowered
    Color = 15723998
    TabOrder = 2
    object dbn_4_Mercadoria: TDBNavigator
      Left = 92
      Top = 5
      Width = 88
      Height = 18
      DataSource = datmRE_NOVOEX.ds_RE_Anexo
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
      OnClick = dbn_4_MercadoriaClick
    end
    object dblbl_4_PosicaoAnexo: TcxDBLabel
      Left = 5
      Top = 4
      DataBinding.DataField = 'calcTX_ANEXO'
      DataBinding.DataSource = datmRE_NOVOEX.ds_RE_Anexo
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = 4227327
      Style.BorderStyle = ebsSingle
      Style.Color = 15723998
      Style.HotTrack = False
      Height = 21
      Width = 82
      AnchorX = 46
      AnchorY = 15
    end
  end
  object ImageList1: TImageList
    Left = 499
    Top = 40
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4676900FEE9C700C6CC
      9300D5CE9600F2D0A000E7CA9100E9C58800EDC18200EBC17F00EBC18000EBC1
      8000F2C78200A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4676900FCEACE0099C0
      77002D9822006FAC4E0020911600219116005FA13900CAB77000E9BD7F00E9BD
      7F00EFC48100A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0675B00FEEFDA00BFCE
      9900108C0D000082010000820100008201000082010029921A00DEBB7D00E9BD
      7F00EFC48100A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0675B00FFF4E500BDD1
      9F00138F0F00008201001B911400A9BD750073AB4D000484030077A94800EABF
      8100EFC48000A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7756B00FFFBF000BCD5
      A7000A8A0A00008201000486040082B55F00F0D0A900A5B76E006DAD4E00EBC2
      8A00EFC58300A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7756B00FFFFFC00E1E7
      D000A4CC900099C6810093C1770099C07700EED4AF00F0D0A7009FC27900EBC7
      9300F2C98C00A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF00A7D9
      A400FAEFE600F4E9D5009DC6840095C1770097BF75009FBD7500EACFA300EECC
      9E00F3CE9700A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF0074C5
      7500B0D8A900FAEFE60084C1760005860400008201000A890900F3D4B000F0D0
      A600F6D3A000A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D1926D00FFFFFF0081CA
      8200058605007AC47500AFD4A0001C95180000820100138E0F00F3D9B800F4D8
      B100EBCFA400A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D1926D00FFFFFF00F3FA
      F3002DA12D0000820100008201000082010000820100118E0F00FBEACE00DECE
      B400B6AA9300A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00DDF2DD0067BF6700249C24002299210075BF6B002D992600956D5600A56B
      5F00A56B5F00A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E1F3E100E0F2DD00FFFEF700ACB692008B6E5100E19E
      5500E68F3100B56D4D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B5F00F8B5
      5C00BF7A5C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FBF4F000FBF4
      EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B5F00C183
      6C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000808080000000000080808000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C0000000000000000000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C0000000000000000000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF008080800000000000808080000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000BFBFBF00000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000000000000000FF000000FF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000800000000000000080000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000BFBFBF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000808080000000000080808000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008007000000000000
      800F000000000000801F000000000000FFFFFFFFFFFFFFFF8003FFFFFC00FFF8
      0001C631FC0020F80001E223FC00007F0001F007FC00007C0001F88FEC00003C
      0001FC1FE400000F0001FE3FE00000040001FC1F0000000C0001F80F000101FF
      0001F0070003E3FC0001E2230007FFFC0001C631000FFFFF0001FFFFE3FFFFF8
      0001FFFFE7FFFFF88003FFFFEFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object tmrJanela: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrJanelaTimer
    Left = 571
    Top = 51
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 381
    Top = 192
    PixelsPerInch = 96
    object cxsHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clTeal
    end
    object cxgBackGround: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
  end
end

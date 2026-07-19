object frm_reclassificacao_anexos: Tfrm_reclassificacao_anexos
  Left = 381
  Top = 182
  BorderIcons = []
  BorderStyle = bsSingle
  BorderWidth = 1
  Caption = 'Reclassifica'#231#227'o de Anexos'
  ClientHeight = 381
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 310
      Height = 379
      Align = alClient
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 194
        Top = 336
        Width = 98
        Height = 30
        Caption = '&Executar'
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
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 95
        Top = 336
        Width = 98
        Height = 30
        Caption = '&Cancelar'
        Flat = True
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
        OnClick = SpeedButton2Click
      end
      object Panel2: TPanel
        Left = 15
        Top = 14
        Width = 277
        Height = 54
        BevelInner = bvLowered
        Caption = 'Configura'#231#227'o da classifica'#231#227'o'
        Color = clScrollBar
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        object Bevel1: TBevel
          Left = 9
          Top = 9
          Width = 41
          Height = 37
          Shape = bsFrame
          Visible = False
        end
        object Label1: TLabel
          Left = 19
          Top = 9
          Width = 19
          Height = 36
          Caption = '6'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -32
          Font.Name = 'Wingdings'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
      end
      object Panel4: TPanel
        Left = 15
        Top = 70
        Width = 277
        Height = 259
        BevelInner = bvLowered
        Color = clScrollBar
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        object Shape15: TShape
          Left = 9
          Top = 140
          Width = 260
          Height = 109
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape14: TShape
          Left = 9
          Top = 28
          Width = 260
          Height = 87
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape13: TShape
          Left = 9
          Top = 121
          Width = 260
          Height = 18
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Shape12: TShape
          Left = 9
          Top = 9
          Width = 260
          Height = 18
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label2: TLabel
          Left = 15
          Top = 11
          Width = 40
          Height = 16
          Caption = 'Modo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Shape1: TShape
          Left = 16
          Top = 28
          Width = 1
          Height = 73
          Brush.Style = bsClear
        end
        object Label3: TLabel
          Left = 15
          Top = 123
          Width = 55
          Height = 16
          Caption = 'Op'#231#245'es'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Shape2: TShape
          Left = 16
          Top = 140
          Width = 1
          Height = 37
          Brush.Style = bsClear
        end
        object Shape3: TShape
          Left = 16
          Top = 40
          Width = 16
          Height = 2
          Brush.Style = bsClear
        end
        object Shape4: TShape
          Left = 16
          Top = 100
          Width = 16
          Height = 2
          Brush.Style = bsClear
        end
        object Shape5: TShape
          Left = 16
          Top = 156
          Width = 17
          Height = 2
          Brush.Style = bsClear
        end
        object Shape6: TShape
          Left = 16
          Top = 177
          Width = 17
          Height = 2
          Brush.Style = bsClear
        end
        object Shape7: TShape
          Left = 40
          Top = 45
          Width = 1
          Height = 33
          Brush.Style = bsClear
        end
        object Shape8: TShape
          Left = 40
          Top = 59
          Width = 9
          Height = 2
          Brush.Style = bsClear
        end
        object Shape9: TShape
          Left = 40
          Top = 77
          Width = 9
          Height = 2
          Brush.Style = bsClear
        end
        object Shape10: TShape
          Left = 42
          Top = 208
          Width = 1
          Height = 18
          Brush.Style = bsClear
        end
        object Shape11: TShape
          Left = 42
          Top = 225
          Width = 14
          Height = 2
          Brush.Style = bsClear
        end
        object Label4: TLabel
          Left = 59
          Top = 217
          Width = 121
          Height = 16
          Caption = 'Informe o separador'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Shape16: TShape
          Left = 17
          Top = 198
          Width = 17
          Height = 2
          Brush.Style = bsClear
        end
        object Shape17: TShape
          Left = 16
          Top = 163
          Width = 1
          Height = 37
          Brush.Style = bsClear
        end
        object rbAgruparSim: TRadioButton
          Left = 34
          Top = 34
          Width = 165
          Height = 17
          Caption = 'Agrupar em anexos'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          OnClick = rbAgruparSimClick
        end
        object rbAgruparNao: TRadioButton
          Left = 34
          Top = 93
          Width = 199
          Height = 17
          Caption = 'N'#227'o agrupar itens em anexos'
          Checked = True
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          TabStop = True
          OnClick = rbAgruparNaoClick
        end
        object cbNaoQuebraLinhas: TCheckBox
          Left = 36
          Top = 190
          Width = 222
          Height = 17
          Caption = 'N'#227'o quebrar descri'#231#245'es por linha'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 2
          OnClick = cbNaoQuebraLinhasClick
        end
        object cbTipoRecof: TCheckBox
          Left = 36
          Top = 149
          Width = 231
          Height = 17
          Caption = 'Incluir quantidade e unid de medida'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 3
          OnClick = cbTipoRecofClick
        end
        object cbQuebraValor: TCheckBox
          Left = 52
          Top = 52
          Width = 212
          Height = 17
          Caption = 'Itens com o mesmo NCM'
          Color = clSilver
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
        end
        object cbQuebraFabricante: TCheckBox
          Left = 52
          Top = 70
          Width = 212
          Height = 17
          Caption = 'Itens com o mesmo Fabricante'
          Color = clSilver
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 5
        end
        object edt_separador: TEdit
          Left = 184
          Top = 214
          Width = 17
          Height = 24
          Enabled = False
          MaxLength = 1
          TabOrder = 6
        end
        object cbDescricaoMercadoria: TCheckBox
          Left = 36
          Top = 169
          Width = 229
          Height = 17
          Caption = 'Incluir descri'#231#227'o completa da merc'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 7
          OnClick = cbNaoQuebraLinhasClick
        end
      end
    end
  end
  object sp_re_classifica_anexos: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'SP_RE_CLASSIFICA_ANEXOS'
    Left = 225
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
      end>
  end
end

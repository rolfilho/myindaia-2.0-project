object frmMyParametrizacao: TfrmMyParametrizacao
  Left = 232
  Top = 78
  Caption = 'Parametriza'#231#227'o Web'
  ClientHeight = 660
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object reLog: TRichEdit
    Left = 0
    Top = 101
    Width = 504
    Height = 538
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    OnChange = reLogChange
  end
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 101
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      824
      101)
    object btnExtratoCI: TSpeedButton
      Left = 241
      Top = 4
      Width = 100
      Height = 22
      AllowAllUp = True
      Caption = '     Extrato de CI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExtratoCIClick
    end
    object btnParametrizacao: TSpeedButton
      Left = 5
      Top = 4
      Width = 114
      Height = 22
      AllowAllUp = True
      Caption = '     Parametriza'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnParametrizacaoClick
    end
    object Label1: TLabel
      Left = 632
      Top = 8
      Width = 116
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pr'#243'xima Integra'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 728
    end
    object lblTempoRestante: TLabel
      Left = 753
      Top = 8
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '00:30'
    end
    object Image1: TImage
      Left = 792
      Top = 3
      Width = 24
      Height = 24
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Stretch = True
      OnClick = Image1Click
      ExplicitLeft = 888
    end
    object btnExtratoDI: TSpeedButton
      Left = 129
      Top = 4
      Width = 100
      Height = 22
      AllowAllUp = True
      Caption = '     Extrato de DI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExtratoDIClick
    end
    object btnTerminal: TSpeedButton
      Left = 353
      Top = 4
      Width = 91
      Height = 22
      AllowAllUp = True
      Caption = 'Terminal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnTerminalClick
    end
    object Label4: TLabel
      Left = 428
      Top = 67
      Width = 348
      Height = 11
      Caption = 
        'N'#227'o salvar automaticamente o extrato de  DI (usado para teste de' +
        ' pasta de destino)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label6: TLabel
      Left = 683
      Top = 84
      Width = 93
      Height = 11
      Caption = 'Mostrar log de sistema'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chkDerrubarDespachante: TcxCheckBox
      Left = 423
      Top = 5
      Hint = 'Derrubar Despachante'
      TabStop = False
      AutoSize = False
      Caption = 'Derrubar Despachante'
      ParentFont = False
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.OnEditValueChanged = chkDerrubarDespachantePropertiesEditValueChanged
      ShowHint = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 0
      Transparent = True
      OnMouseEnter = chkDerrubarDespachanteMouseEnter
      OnMouseLeave = chkDerrubarDespachanteMouseLeave
      Height = 21
      Width = 21
    end
    object chkParametrizacao: TcxCheckBox
      Left = 4
      Top = 5
      Hint = 'Executar Parametriza'#231#227'o'
      TabStop = False
      AutoSize = False
      Caption = 'Derrubar Despachante'
      ParentFont = False
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.OnEditValueChanged = chkParametrizacaoPropertiesEditValueChanged
      ShowHint = True
      State = cbsChecked
      Style.BorderColor = clRed
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      TabOrder = 1
      Transparent = True
      OnMouseEnter = chkDerrubarDespachanteMouseEnter
      OnMouseLeave = chkDerrubarDespachanteMouseLeave
      Height = 21
      Width = 21
    end
    object chkExtratoDI: TcxCheckBox
      Left = 128
      Top = 5
      Hint = 'Executar Extrato de DI'
      TabStop = False
      AutoSize = False
      Caption = 'Derrubar Despachante'
      ParentFont = False
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.OnEditValueChanged = chkParametrizacaoPropertiesEditValueChanged
      ShowHint = True
      State = cbsChecked
      Style.BorderColor = clRed
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      TabOrder = 2
      Transparent = True
      OnMouseEnter = chkDerrubarDespachanteMouseEnter
      OnMouseLeave = chkDerrubarDespachanteMouseLeave
      Height = 21
      Width = 21
    end
    object chkExtratoCI: TcxCheckBox
      Left = 240
      Top = 5
      Hint = 'Executar Extrato de CI'
      TabStop = False
      AutoSize = False
      Caption = 'Derrubar Despachante'
      ParentFont = False
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.OnEditValueChanged = chkParametrizacaoPropertiesEditValueChanged
      ShowHint = True
      State = cbsChecked
      Style.BorderColor = clRed
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      TabOrder = 3
      Transparent = True
      OnMouseEnter = chkDerrubarDespachanteMouseEnter
      OnMouseLeave = chkDerrubarDespachanteMouseLeave
      Height = 21
      Width = 21
    end
    object chkTerminal: TcxCheckBox
      Left = 352
      Top = 5
      Hint = 'Executar Consulta do Terminal'
      TabStop = False
      AutoSize = False
      Caption = 'Derrubar Despachante'
      ParentFont = False
      ParentShowHint = False
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.OnEditValueChanged = chkParametrizacaoPropertiesEditValueChanged
      ShowHint = True
      State = cbsChecked
      Style.BorderColor = clRed
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.Shadow = False
      Style.TextColor = clRed
      Style.TransparentBorder = True
      Style.IsFontAssigned = True
      TabOrder = 4
      Transparent = True
      OnMouseEnter = chkDerrubarDespachanteMouseEnter
      OnMouseLeave = chkDerrubarDespachanteMouseLeave
      Height = 21
      Width = 21
    end
    object btnDownloadDi: TBitBtn
      Left = 448
      Top = 3
      Width = 109
      Height = 25
      Caption = 'Digitalizar DI Avulsa'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = btnDownloadDiClick
    end
    object BitBtn1: TBitBtn
      Left = 560
      Top = 3
      Width = 49
      Height = 25
      Caption = 'Email'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 32
      Width = 299
      Height = 63
      Caption = ' Conf. de tempo de Consulta '
      TabOrder = 7
      object Label3: TLabel
        Left = 6
        Top = 23
        Width = 179
        Height = 13
        Caption = 'Intervalo por processo em segundos:'
      end
      object Label5: TLabel
        Left = 93
        Top = 45
        Width = 92
        Height = 13
        Caption = 'Processos por lote:'
      end
      object edtIntervalo: TEdit
        Left = 189
        Top = 17
        Width = 45
        Height = 21
        TabOrder = 0
      end
      object edtTotalProcessosLote: TEdit
        Left = 189
        Top = 39
        Width = 45
        Height = 21
        TabOrder = 1
      end
      object btnGravaConfTempoConsulta: TButton
        Left = 241
        Top = 33
        Width = 45
        Height = 25
        Caption = 'Grava'
        TabOrder = 2
        OnClick = btnGravaConfTempoConsultaClick
      end
    end
    object chkTestePasta: TCheckBox
      Left = 782
      Top = 63
      Width = 21
      Height = 17
      TabOrder = 8
      Visible = False
    end
    object chkLogSistema: TCheckBox
      Left = 782
      Top = 80
      Width = 21
      Height = 17
      TabOrder = 9
      OnClick = chkLogSistemaClick
    end
  end
  object pnlStatus: TPanel
    Left = 0
    Top = 639
    Width = 824
    Height = 21
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object pnlStatusMensagem: TPanel
      Left = 102
      Top = 2
      Width = 620
      Height = 17
      Align = alClient
      Alignment = taLeftJustify
      BevelEdges = [beLeft, beRight]
      BevelKind = bkFlat
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object pnlStatusAndamento: TPanel
      Left = 2
      Top = 2
      Width = 100
      Height = 17
      Align = alLeft
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
    end
    object pnlVersao: TPanel
      Left = 722
      Top = 2
      Width = 100
      Height = 17
      Hint = 'Vers'#227'o'
      Align = alRight
      BevelOuter = bvNone
      Caption = '1.00.10'
      Ctl3D = True
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object pnlAvulso: TPanel
    Left = 275
    Top = 94
    Width = 392
    Height = 364
    TabOrder = 3
    Visible = False
    object Label2: TLabel
      Left = 16
      Top = 37
      Width = 115
      Height = 13
      Caption = 'Informe o n'#250'mero da DI'
    end
    object SpeedButton1: TSpeedButton
      Left = 343
      Top = 300
      Width = 23
      Height = 21
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF05740BFF00FFFF00FFFF00FFFEFEFEFEFEFEFEFEFEFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FF2BACD8
        35B3DC23A9D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0574
        0B5BE78C05740BFF00FFFF00FF808080808080808080FEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FF42B4DC
        AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FF05740B50D7
        7A45D26C31C14F05740BFF00FF808080FEFEFEFF00FF80808080808080808080
        8080808080FEFEFEFEFEFE808080FEFEFEFF00FFFF00FF808080FF00FF26A8D6
        A6E9F59EFFFF97FCFF99FBFF95F7FF8DF2FE83EAFA49C2E449C2E43AB8DF168C
        2330C14C169824FF00FFFF00FF808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF808080808080808080808080FEFEFE808080FEFEFEFF00FF31B1DB
        23A9D7ABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF50C81
        161AAF2C088310FF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FF00FFFF00FF47BEE1
        23A9D7AAF0FA91FAFF91F6FF90F5FF8EF4FF8DF2FE8BF1FE8CF1FF77DFF60C90
        170EA01AFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FF4CC0E2
        7BE5F423A9D79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF0A89120EA1
        1A08810FFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
        00FFFEFEFEFEFEFEFEFEFE808080FEFEFE808080FEFEFEFF00FFFF00FF4BBFE1
        93F9FD23A9D7A8E9F5A8F0FAA4F1FBA1F7FF05710A09790F0B89160A8C13067A
        0D58CDEAFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFEFEFEFEFEFEFE
        FEFE808080808080808080808080808080808080FF00FFFEFEFEFF00FF4CC0E2
        9DFEFFB7818323A9D723A9D723A9D723A9D7AFF2FB6BD7ED88F2FF6CD9F381E9
        FB80EAFA1FA8D6FF00FFFF00FF808080FEFEFE80808080808080808080808080
        8080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FF4CC0E2
        9AFCFFBA8E85FEFEFEFEFEFEF7E6D0F7E6D023A9D79FE3F4A7EDFA94E1F4A2EC
        FAADF6FF47BCE0FF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
        00FF808080FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE808080FEFEFEFF00FF50C2E3
        9BFDFFCB9A82FEFEFEFEFEFEFEFEFEF7E6D0F7E6D029A9D423A9D723A9D723A9
        D74BB8DE34AFDAFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
        00FFFF00FF808080808080808080808080808080808080FF00FFFF00FF52BFE1
        A4FFFFDCA887FEFEFEFEFEFEFEFEFEFEFEFEFAEBDBAED3D5F2E6CAB78183FF00
        FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
        00FFFF00FFFF00FFFEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FF25A8D6
        23A9D7DCA887FEFEFEFEFEFEFEFEFEFEFEFEFBF2E79E8891B78183B78183FF00
        FFFF00FFFF00FFFF00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF
        00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE3B18EFEFEFEFEFEFEFEFEFEFEFEFEF8F3EFB78183DFA262DA9062FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FFFF
        00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFEDBD92FEFEFEFEFEFEFEFEFEFEFEFEF5F3F5B78183DA9C7DFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFE808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFEDBD92DCA887DCA887DCA887DCA887DCA887B78183FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080808080808080
        8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object lblPastaArquivo: TLabel
      Left = 16
      Top = 56
      Width = 170
      Height = 13
      Caption = 'myparametrizacao\DIS_Avulsas.txt'
    end
    object btnDownload: TBitBtn
      Left = 304
      Top = 331
      Width = 65
      Height = 25
      Caption = 'Download'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnDownloadClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 390
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      Caption = '    Digitalizar DI Avulsa'
      Color = clSilver
      ParentBackground = False
      TabOrder = 1
      object btnsair: TBitBtn
        Left = 360
        Top = -1
        Width = 23
        Height = 25
        DoubleBuffered = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
          9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
          00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
          FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
          00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
          00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
          F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
          00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
          FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
          9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
          6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
          A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
          A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
          ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
          ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
          9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
          6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
          00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
          F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
          00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
          00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
          FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
          00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
          FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
          9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = btnsairClick
      end
    end
    object memoListaDis: TMemo
      Left = 16
      Top = 80
      Width = 353
      Height = 209
      TabOrder = 2
    end
    object edtPasta: TEdit
      Left = 16
      Top = 300
      Width = 320
      Height = 21
      TabOrder = 3
    end
  end
  object pnlLogSistema: TPanel
    Left = 504
    Top = 101
    Width = 320
    Height = 538
    Align = alRight
    TabOrder = 4
    Visible = False
    object reLogSistema: TRichEdit
      Left = 1
      Top = 1
      Width = 318
      Height = 536
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      OnChange = reLogSistemaChange
    end
  end
  object tmrCertificado: TTimer
    OnTimer = tmrCertificadoTimer
    Left = 208
    Top = 136
  end
  object tmrIntegracao: TTimer
    OnTimer = tmrIntegracaoTimer
    Left = 88
    Top = 64
  end
  object MadExceptionHandler1: TMadExceptionHandler
    OnException = MadExceptionHandler1Exception
    Left = 144
    Top = 232
  end
  object tmrErroWeb: TTimer
    Enabled = False
    OnTimer = tmrErroWebTimer
    Left = 88
    Top = 136
  end
  object tmrDownloadParam: TTimer
    Enabled = False
    OnTimer = tmrDownloadParamTimer
    Left = 208
    Top = 64
  end
  object tmrConexao: TTimer
    Enabled = False
    OnTimer = tmrConexaoTimer
    Left = 72
    Top = 320
  end
  object tmsIntegracaoAvulsa: TTimer
    Enabled = False
    OnTimer = tmsIntegracaoAvulsaTimer
    Left = 536
    Top = 352
  end
end

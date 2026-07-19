object frmLi_Importa_XML: TfrmLi_Importa_XML
  Left = 288
  Top = 165
  BorderStyle = bsSingle
  Caption = 'LI - Importar XML'
  ClientHeight = 449
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 449
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 382
      Height = 86
      Align = alTop
      TabOrder = 0
      object lblCaminhoArquivo: TLabel
        Left = 8
        Top = 5
        Width = 96
        Height = 13
        Caption = 'Caminho Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 352
        Top = 24
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
      object btnImportarArquivoXMLLI: TSpeedButton
        Left = 208
        Top = 53
        Width = 170
        Height = 25
        Caption = 'Carregar Lis do Arquivo XML'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnImportarArquivoXMLLIClick
      end
      object edtCaminho: TEdit
        Left = 7
        Top = 24
        Width = 340
        Height = 21
        TabOrder = 0
      end
    end
    object dbgListaLis: TDBGrid
      Left = 1
      Top = 87
      Width = 382
      Height = 303
      Align = alClient
      DataSource = dsListaLis
      FixedColor = clBlack
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgListaLisDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NR_LI'
          Title.Caption = 'Nr. LI'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REGISTRO'
          Title.Caption = 'Data Registro'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Webdings'
          Font.Style = []
          Title.Caption = 'Status'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 47
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 390
      Width = 382
      Height = 58
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        382
        58)
      object btnSair: TSpeedButton
        Left = 344
        Top = 20
        Width = 30
        Height = 30
        Hint = 'Sair'
        Anchors = [akTop, akRight]
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_sairClick
      end
      object btnAceitar: TSpeedButton
        Left = 246
        Top = 20
        Width = 93
        Height = 30
        Caption = 'Importar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        ParentFont = False
        OnClick = btnAceitarClick
      end
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 13
        Height = 19
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Webdings'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 13
        Height = 19
        Caption = 'r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Webdings'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 37
        Width = 13
        Height = 19
        Caption = 'q'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 303805
        Font.Height = -12
        Font.Name = 'Webdings'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 28
        Top = 6
        Width = 109
        Height = 13
        Caption = 'LI inserida no processo'
      end
      object Label5: TLabel
        Left = 28
        Top = 23
        Width = 104
        Height = 13
        Caption = 'LI j'#225' est'#225' no processo'
      end
      object Label6: TLabel
        Left = 28
        Top = 40
        Width = 157
        Height = 13
        Caption = 'Erro ao inserir - Tente novamente'
      end
    end
  end
  object cdsListaLis: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 143
    object cdsListaLisNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object cdsListaLisNR_LI: TStringField
      FieldName = 'NR_LI'
      Size = 15
    end
    object cdsListaLisDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
    end
    object cdsListaLisSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dsListaLis: TDataSource
    DataSet = cdsListaLis
    Left = 160
    Top = 178
  end
  object qryInsereLi: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'INSERT INTO TPROCESSO_LI(NR_PROCESSO, NR_LI, DT_REGISTRO, IN_FIL' +
        'A_RECUPERAR)'
      'VALUES (:NR_PROCESSO, :NR_LI, :DT_REGISTRO,'#39'1'#39')')
    Left = 284
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_LI'
        ParamType = ptInput
        Size = 10
      end
      item
        DataType = ftDateTime
        Name = 'DT_REGISTRO'
        ParamType = ptInput
      end>
  end
  object qryVerificaLIExiste: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'SELECT NR_PROCESSO, NR_LI, DT_REGISTRO'
      '  FROM TPROCESSO_LI (NOLOCK)'
      ' WHERE NR_PROCESSO = :NR_PROCESSO'
      '   AND NR_LI       = :NR_LI')
    Left = 283
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_LI'
        ParamType = ptInput
        Size = 15
      end>
    object qryVerificaLIExisteNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_LI.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryVerificaLIExisteNR_LI: TStringField
      FieldName = 'NR_LI'
      Origin = 'DBBROKER.TPROCESSO_LI.NR_LI'
      FixedChar = True
      Size = 10
    end
    object qryVerificaLIExisteDT_REGISTRO: TDateTimeField
      FieldName = 'DT_REGISTRO'
      Origin = 'DBBROKER.TPROCESSO_LI.DT_REGISTRO'
    end
  end
end

object frmArquivoCroda: TfrmArquivoCroda
  Left = 367
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Arquivo Croda'
  ClientHeight = 395
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 537
    Top = 0
    Height = 292
    Cursor = crSizeWE
    Beveled = True
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 292
    Width = 819
    Height = 3
    Cursor = crSizeNS
    Align = alBottom
    Beveled = True
  end
  object pnlArquivos: TPanel
    Left = 540
    Top = 0
    Width = 279
    Height = 292
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 1
      Top = 1
      Width = 277
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Arquivos Gerados'
      Color = clBtnFace
      ParentColor = False
      Layout = tlCenter
    end
    object lbArquivos: TListBox
      Left = 1
      Top = 14
      Width = 277
      Height = 277
      Align = alClient
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnClick = lbArquivosClick
      OnDblClick = btnAbrirClick
      OnKeyUp = lbArquivosKeyUp
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 292
    Align = alLeft
    TabOrder = 0
    DesignSize = (
      537
      292)
    object Label1: TLabel
      Left = 136
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Unidade'
    end
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 535
      Height = 13
      Align = alTop
      Caption = '      Processos'
    end
    object Label3: TLabel
      Left = 136
      Top = 52
      Width = 140
      Height = 13
      Caption = 'Cod. SAP do Forn. do Seguro'
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 482
      Top = 25
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
      OnClick = btn_co_unid_negClick
    end
    object btnEnviar: TSpeedButton
      Left = 400
      Top = 96
      Width = 101
      Height = 33
      Caption = 'Enviar'
      Enabled = False
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
        FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
        9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
        0000777777777777777733333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnEnviarClick
    end
    object btnGeraComNF: TSpeedButton
      Left = 309
      Top = 139
      Width = 192
      Height = 33
      Caption = 'Gerar Arquivo Com NF'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      Visible = False
      OnClick = btnGeraComNFClick
    end
    object btnAbrir: TSpeedButton
      Left = 296
      Top = 96
      Width = 97
      Height = 33
      Caption = 'Abrir'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = btnAbrirClick
    end
    object btnGeraSemNF: TSpeedButton
      Left = 136
      Top = 96
      Width = 156
      Height = 33
      Caption = 'Gerar Arquivo'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnGeraSemNFClick
    end
    object Label5: TLabel
      Left = 135
      Top = 229
      Width = 95
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Progresso Geral:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 135
      Top = 251
      Width = 126
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Progresso do Arquivo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 135
      Top = 272
      Width = 106
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Status do Arquivo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 267
      Top = 272
      Width = 63
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = '                     '
    end
    object edt_nm_unid_neg: TEdit
      Left = 171
      Top = 25
      Width = 312
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object edt_cd_unid_neg: TEdit
      Left = 136
      Top = 25
      Width = 36
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnExit = edt_cd_unid_negExit
    end
    object edt_cd_sap: TEdit
      Left = 136
      Top = 66
      Width = 153
      Height = 21
      TabOrder = 3
      Text = '130575'
      OnExit = edt_cd_sapExit
    end
    object memProcessos: TMemo
      Left = 1
      Top = 14
      Width = 129
      Height = 277
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object pnlProgressoArquivo: TPanel
      Left = 267
      Top = 250
      Width = 264
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvLowered
      TabOrder = 4
      object pbProgressoArquivo: TGauge
        Left = 1
        Top = 1
        Width = 262
        Height = 15
        Align = alClient
        BackColor = clBtnFace
        BorderStyle = bsNone
        ForeColor = clBlue
        Progress = 0
      end
    end
    object pnlProgressoGeral: TPanel
      Left = 267
      Top = 224
      Width = 264
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvLowered
      TabOrder = 5
      object pbProgressoGeral: TGauge
        Left = 1
        Top = 1
        Width = 262
        Height = 15
        Align = alClient
        BackColor = clBtnFace
        BorderStyle = bsNone
        ForeColor = clBlue
        Progress = 0
      end
    end
    object rgTipoNota: TRadioGroup
      Left = 136
      Top = 135
      Width = 153
      Height = 81
      Caption = 'Tipo de Nota'
      ItemIndex = 2
      Items.Strings = (
        'Nota Fiscal de Servi'#231'o'
        'Nota de D'#233'bito'
        'Todas as Notas')
      TabOrder = 6
    end
  end
  object pnlMensagens: TPanel
    Left = 0
    Top = 295
    Width = 819
    Height = 100
    Align = alBottom
    TabOrder = 2
    object reMensagens: TRichEdit
      Left = 1
      Top = 18
      Width = 817
      Height = 81
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object pnlMensagensCaption: TPanel
      Left = 1
      Top = 1
      Width = 817
      Height = 17
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Mensagens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object btnMensagens: TSpeedButton
        Left = 797
        Top = 0
        Width = 19
        Height = 18
        Caption = 'q'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Wingdings 3'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnMensagensClick
      end
    end
  end
  object IBNF: TIBDatabase
    DatabaseName = 'indaia12:C:\DDBROKER\DDNota\NOTA.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 528
    Top = 29
  end
  object IBTransaction: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 608
    Top = 29
  end
  object qryDDAbreProcesso: TIBQuery
    Database = IBNF
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ABREPROCESSO'
      'where STR_CODIGOPROCESSO = :processo')
    Left = 528
    Top = 83
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'processo'
        ParamType = ptUnknown
      end>
    object qryDDAbreProcessoSTR_CODIGOTIPOUNIDADEOPER: TIBStringField
      FieldName = 'STR_CODIGOTIPOUNIDADEOPER'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOUNIDADEOPER'
      Required = True
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOUNIDADEOPER: TIBStringField
      FieldName = 'STR_CODIGOUNIDADEOPER'
      Origin = 'ABREPROCESSO.STR_CODIGOUNIDADEOPER'
      Required = True
      Size = 6
    end
    object qryDDAbreProcessoLI_SEQUENCIAPROCESSO: TIntegerField
      FieldName = 'LI_SEQUENCIAPROCESSO'
      Origin = 'ABREPROCESSO.LI_SEQUENCIAPROCESSO'
      Required = True
    end
    object qryDDAbreProcessoSTR_CODIGOPROCESSO: TIBStringField
      FieldName = 'STR_CODIGOPROCESSO'
      Origin = 'ABREPROCESSO.STR_CODIGOPROCESSO'
      Size = 30
    end
    object qryDDAbreProcessoSTR_TIPOPROCESSO: TIBStringField
      FieldName = 'STR_TIPOPROCESSO'
      Origin = 'ABREPROCESSO.STR_TIPOPROCESSO'
      Size = 6
    end
    object qryDDAbreProcessoDT_ABERTURAPROCESSO: TDateTimeField
      FieldName = 'DT_ABERTURAPROCESSO'
      Origin = 'ABREPROCESSO.DT_ABERTURAPROCESSO'
    end
    object qryDDAbreProcessoSTR_REFERENCIA: TIBStringField
      FieldName = 'STR_REFERENCIA'
      Origin = 'ABREPROCESSO.STR_REFERENCIA'
      Size = 25
    end
    object qryDDAbreProcessoSTR_VIATRANSPORTE: TIBStringField
      FieldName = 'STR_VIATRANSPORTE'
      Origin = 'ABREPROCESSO.STR_VIATRANSPORTE'
      Size = 2
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOEXPORTADOR: TIBStringField
      FieldName = 'STR_CODIGOTIPOEXPORTADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOEXPORTADOR'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOEXPORTADOR: TIBStringField
      FieldName = 'STR_CODIGOEXPORTADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOEXPORTADOR'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOPAISAQUIS: TIBStringField
      FieldName = 'STR_CODIGOPAISAQUIS'
      Origin = 'ABREPROCESSO.STR_CODIGOPAISAQUIS'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOTRANSP: TIBStringField
      FieldName = 'STR_CODIGOTIPOTRANSP'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOTRANSP'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOTRANSP: TIBStringField
      FieldName = 'STR_CODIGOTRANSP'
      Origin = 'ABREPROCESSO.STR_CODIGOTRANSP'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOIMPORTADOR: TIBStringField
      FieldName = 'STR_CODIGOTIPOIMPORTADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOIMPORTADOR'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOIMPORTADOR: TIBStringField
      FieldName = 'STR_CODIGOIMPORTADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOIMPORTADOR'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOARMADOR: TIBStringField
      FieldName = 'STR_CODIGOTIPOARMADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOARMADOR'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOARMADOR: TIBStringField
      FieldName = 'STR_CODIGOARMADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOARMADOR'
      Size = 6
    end
    object qryDDAbreProcessoSTR_MERCADORIA: TIBStringField
      FieldName = 'STR_MERCADORIA'
      Origin = 'ABREPROCESSO.STR_MERCADORIA'
      Size = 40
    end
    object qryDDAbreProcessoSTR_REGISTRODI: TIBStringField
      FieldName = 'STR_REGISTRODI'
      Origin = 'ABREPROCESSO.STR_REGISTRODI'
      Size = 10
    end
    object qryDDAbreProcessoDT_REGISTRODI: TDateTimeField
      FieldName = 'DT_REGISTRODI'
      Origin = 'ABREPROCESSO.DT_REGISTRODI'
    end
    object qryDDAbreProcessoSTR_NUMERODTA: TIBStringField
      FieldName = 'STR_NUMERODTA'
      Origin = 'ABREPROCESSO.STR_NUMERODTA'
    end
    object qryDDAbreProcessoDT_DTA: TDateTimeField
      FieldName = 'DT_DTA'
      Origin = 'ABREPROCESSO.DT_DTA'
    end
    object qryDDAbreProcessoDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'ABREPROCESSO.DT_RECEBIMENTO'
    end
    object qryDDAbreProcessoDT_PREVISAOCHEGADA: TDateTimeField
      FieldName = 'DT_PREVISAOCHEGADA'
      Origin = 'ABREPROCESSO.DT_PREVISAOCHEGADA'
    end
    object qryDDAbreProcessoDT_DATACHEGADA: TDateTimeField
      FieldName = 'DT_DATACHEGADA'
      Origin = 'ABREPROCESSO.DT_DATACHEGADA'
    end
    object qryDDAbreProcessoDT_SOLICITACAONUMERARIO: TDateTimeField
      FieldName = 'DT_SOLICITACAONUMERARIO'
      Origin = 'ABREPROCESSO.DT_SOLICITACAONUMERARIO'
    end
    object qryDDAbreProcessoDT_RECEBIMENTONUMERARIO: TDateTimeField
      FieldName = 'DT_RECEBIMENTONUMERARIO'
      Origin = 'ABREPROCESSO.DT_RECEBIMENTONUMERARIO'
    end
    object qryDDAbreProcessoDT_PREVISAOENTREGA: TDateTimeField
      FieldName = 'DT_PREVISAOENTREGA'
      Origin = 'ABREPROCESSO.DT_PREVISAOENTREGA'
    end
    object qryDDAbreProcessoDT_REALENTREGA: TDateTimeField
      FieldName = 'DT_REALENTREGA'
      Origin = 'ABREPROCESSO.DT_REALENTREGA'
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOCOMPANHIA: TIBStringField
      FieldName = 'STR_CODIGOTIPOCOMPANHIA'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOCOMPANHIA'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOCOMPANHIA: TIBStringField
      FieldName = 'STR_CODIGOCOMPANHIA'
      Origin = 'ABREPROCESSO.STR_CODIGOCOMPANHIA'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOTIPODESPACHANTE: TIBStringField
      FieldName = 'STR_CODIGOTIPODESPACHANTE'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPODESPACHANTE'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGODESPACHANTE: TIBStringField
      FieldName = 'STR_CODIGODESPACHANTE'
      Origin = 'ABREPROCESSO.STR_CODIGODESPACHANTE'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOAGENTE: TIBStringField
      FieldName = 'STR_CODIGOTIPOAGENTE'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOAGENTE'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOAGENTE: TIBStringField
      FieldName = 'STR_CODIGOAGENTE'
      Origin = 'ABREPROCESSO.STR_CODIGOAGENTE'
      Size = 6
    end
    object qryDDAbreProcessoSTR_VEICULO: TIBStringField
      FieldName = 'STR_VEICULO'
      Origin = 'ABREPROCESSO.STR_VEICULO'
      Size = 30
    end
    object qryDDAbreProcessoSTR_TIPODOCTOCARGA: TIBStringField
      FieldName = 'STR_TIPODOCTOCARGA'
      Origin = 'ABREPROCESSO.STR_TIPODOCTOCARGA'
      Size = 2
    end
    object qryDDAbreProcessoDT_RECEBTODOCTOCARGA: TDateTimeField
      FieldName = 'DT_RECEBTODOCTOCARGA'
      Origin = 'ABREPROCESSO.DT_RECEBTODOCTOCARGA'
    end
    object qryDDAbreProcessoSTR_MASTER: TIBStringField
      FieldName = 'STR_MASTER'
      Origin = 'ABREPROCESSO.STR_MASTER'
      Size = 18
    end
    object qryDDAbreProcessoSTR_HOUSE: TIBStringField
      FieldName = 'STR_HOUSE'
      Origin = 'ABREPROCESSO.STR_HOUSE'
      Size = 18
    end
    object qryDDAbreProcessoSTR_CODIGOPAISORIGEM: TIBStringField
      FieldName = 'STR_CODIGOPAISORIGEM'
      Origin = 'ABREPROCESSO.STR_CODIGOPAISORIGEM'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOCIDADEORIGEM: TIBStringField
      FieldName = 'STR_CODIGOCIDADEORIGEM'
      Origin = 'ABREPROCESSO.STR_CODIGOCIDADEORIGEM'
      Size = 4
    end
    object qryDDAbreProcessoSTR_CODIGOTERMCARGAORIGEM: TIBStringField
      FieldName = 'STR_CODIGOTERMCARGAORIGEM'
      Origin = 'ABREPROCESSO.STR_CODIGOTERMCARGAORIGEM'
      Size = 4
    end
    object qryDDAbreProcessoSTR_CODIGOPAISDESTIN: TIBStringField
      FieldName = 'STR_CODIGOPAISDESTIN'
      Origin = 'ABREPROCESSO.STR_CODIGOPAISDESTIN'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOCIDADEDESTIN: TIBStringField
      FieldName = 'STR_CODIGOCIDADEDESTIN'
      Origin = 'ABREPROCESSO.STR_CODIGOCIDADEDESTIN'
      Size = 4
    end
    object qryDDAbreProcessoSTR_CODIGOTERMCARGADESTIN: TIBStringField
      FieldName = 'STR_CODIGOTERMCARGADESTIN'
      Origin = 'ABREPROCESSO.STR_CODIGOTERMCARGADESTIN'
      Size = 4
    end
    object qryDDAbreProcessoSTR_CODIGOTRANSPNAC: TIBStringField
      FieldName = 'STR_CODIGOTRANSPNAC'
      Origin = 'ABREPROCESSO.STR_CODIGOTRANSPNAC'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOTRANSPNAC: TIBStringField
      FieldName = 'STR_CODIGOTIPOTRANSPNAC'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOTRANSPNAC'
      Size = 3
    end
    object qryDDAbreProcessoSTR_NUMEROCONHECIMENTO: TIBStringField
      FieldName = 'STR_NUMEROCONHECIMENTO'
      Origin = 'ABREPROCESSO.STR_NUMEROCONHECIMENTO'
      Size = 10
    end
    object qryDDAbreProcessoSTR_CODIGOTIPOAGENTECAMBIO: TIBStringField
      FieldName = 'STR_CODIGOTIPOAGENTECAMBIO'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPOAGENTECAMBIO'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOAGENTECAMBIO: TIBStringField
      FieldName = 'STR_CODIGOAGENTECAMBIO'
      Origin = 'ABREPROCESSO.STR_CODIGOAGENTECAMBIO'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOURFENTRADA: TIBStringField
      FieldName = 'STR_CODIGOURFENTRADA'
      Origin = 'ABREPROCESSO.STR_CODIGOURFENTRADA'
      Size = 7
    end
    object qryDDAbreProcessoSTR_CODIGOURFDESPACHO: TIBStringField
      FieldName = 'STR_CODIGOURFDESPACHO'
      Origin = 'ABREPROCESSO.STR_CODIGOURFDESPACHO'
      Size = 7
    end
    object qryDDAbreProcessoDT_CONHECIMENTONAC: TDateTimeField
      FieldName = 'DT_CONHECIMENTONAC'
      Origin = 'ABREPROCESSO.DT_CONHECIMENTONAC'
    end
    object qryDDAbreProcessoSTR_CODIGOPAISPROCED: TIBStringField
      FieldName = 'STR_CODIGOPAISPROCED'
      Origin = 'ABREPROCESSO.STR_CODIGOPAISPROCED'
      Size = 3
    end
    object qryDDAbreProcessoDT_DATAREMOCAO: TDateTimeField
      FieldName = 'DT_DATAREMOCAO'
      Origin = 'ABREPROCESSO.DT_DATAREMOCAO'
    end
    object qryDDAbreProcessoSTR_TIPOMANIFESTO: TIBStringField
      FieldName = 'STR_TIPOMANIFESTO'
      Origin = 'ABREPROCESSO.STR_TIPOMANIFESTO'
      Size = 1
    end
    object qryDDAbreProcessoSTR_NUMEROMANIFESTO: TIBStringField
      FieldName = 'STR_NUMEROMANIFESTO'
      Origin = 'ABREPROCESSO.STR_NUMEROMANIFESTO'
    end
    object qryDDAbreProcessoDT_TRANSMISSAO: TDateTimeField
      FieldName = 'DT_TRANSMISSAO'
      Origin = 'ABREPROCESSO.DT_TRANSMISSAO'
    end
    object qryDDAbreProcessoMEM_OBSERVACOESFOLLOWUP: TMemoField
      FieldName = 'MEM_OBSERVACOESFOLLOWUP'
      Origin = 'ABREPROCESSO.MEM_OBSERVACOESFOLLOWUP'
      BlobType = ftMemo
      Size = 8
    end
    object qryDDAbreProcessoSTR_ORIGEM: TIBStringField
      FieldName = 'STR_ORIGEM'
      Origin = 'ABREPROCESSO.STR_ORIGEM'
      Size = 10
    end
    object qryDDAbreProcessoSTR_CODIGOGRUPOPROCESSO: TIBStringField
      FieldName = 'STR_CODIGOGRUPOPROCESSO'
      Origin = 'ABREPROCESSO.STR_CODIGOGRUPOPROCESSO'
      Size = 2
    end
    object qryDDAbreProcessoSTR_CODIGOFILIALTRAFFIC: TIBStringField
      FieldName = 'STR_CODIGOFILIALTRAFFIC'
      Origin = 'ABREPROCESSO.STR_CODIGOFILIALTRAFFIC'
      Size = 6
    end
    object qryDDAbreProcessoSTR_CODIGOMASTERTRAFFIC: TIBStringField
      FieldName = 'STR_CODIGOMASTERTRAFFIC'
      Origin = 'ABREPROCESSO.STR_CODIGOMASTERTRAFFIC'
      Size = 30
    end
    object qryDDAbreProcessoSTR_CODIGOHOUSETRAFFIC: TIBStringField
      FieldName = 'STR_CODIGOHOUSETRAFFIC'
      Origin = 'ABREPROCESSO.STR_CODIGOHOUSETRAFFIC'
      Size = 30
    end
    object qryDDAbreProcessoSTR_AREAGRUPOIMPORTADOR: TIBStringField
      FieldName = 'STR_AREAGRUPOIMPORTADOR'
      Origin = 'ABREPROCESSO.STR_AREAGRUPOIMPORTADOR'
      Size = 4
    end
    object qryDDAbreProcessoSTR_TIPOPESSOA: TIBStringField
      FieldName = 'STR_TIPOPESSOA'
      Origin = 'ABREPROCESSO.STR_TIPOPESSOA'
      Size = 1
    end
    object qryDDAbreProcessoSTR_CODIGOTIPODEPARTAMENTO: TIBStringField
      FieldName = 'STR_CODIGOTIPODEPARTAMENTO'
      Origin = 'ABREPROCESSO.STR_CODIGOTIPODEPARTAMENTO'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGODEPARTAMENTO: TIBStringField
      FieldName = 'STR_CODIGODEPARTAMENTO'
      Origin = 'ABREPROCESSO.STR_CODIGODEPARTAMENTO'
      Size = 2
    end
    object qryDDAbreProcessoMEM_COMENTARIOSFOLLOWUP: TMemoField
      FieldName = 'MEM_COMENTARIOSFOLLOWUP'
      Origin = 'ABREPROCESSO.MEM_COMENTARIOSFOLLOWUP'
      BlobType = ftMemo
      Size = 8
    end
    object qryDDAbreProcessoLI_SEQPROCDOORTODOOR: TIntegerField
      FieldName = 'LI_SEQPROCDOORTODOOR'
      Origin = 'ABREPROCESSO.LI_SEQPROCDOORTODOOR'
    end
    object qryDDAbreProcessoLI_SEQUENCIAEXPORTACAODI: TIntegerField
      FieldName = 'LI_SEQUENCIAEXPORTACAODI'
      Origin = 'ABREPROCESSO.LI_SEQUENCIAEXPORTACAODI'
    end
    object qryDDAbreProcessoDT_ENVIOFATURAMENTO: TDateField
      FieldName = 'DT_ENVIOFATURAMENTO'
      Origin = 'ABREPROCESSO.DT_ENVIOFATURAMENTO'
    end
    object qryDDAbreProcessoTM_ENVIOFATURAMENTO: TDateTimeField
      FieldName = 'TM_ENVIOFATURAMENTO'
      Origin = 'ABREPROCESSO.TM_ENVIOFATURAMENTO'
    end
    object qryDDAbreProcessoSTR_MERCADORIACOMPLEMENTAR: TIBStringField
      FieldName = 'STR_MERCADORIACOMPLEMENTAR'
      Origin = 'ABREPROCESSO.STR_MERCADORIACOMPLEMENTAR'
      Size = 200
    end
    object qryDDAbreProcessoMEM_MERCADORIACOMPLEMENTAR: TBlobField
      FieldName = 'MEM_MERCADORIACOMPLEMENTAR'
      Origin = 'ABREPROCESSO.MEM_MERCADORIACOMPLEMENTAR'
      Size = 8
    end
    object qryDDAbreProcessoDT_FATURAMENTO: TDateTimeField
      FieldName = 'DT_FATURAMENTO'
      Origin = 'ABREPROCESSO.DT_FATURAMENTO'
    end
    object qryDDAbreProcessoSTR_CODIGOPROCESSOSISCOMEX: TIBStringField
      FieldName = 'STR_CODIGOPROCESSOSISCOMEX'
      Origin = 'ABREPROCESSO.STR_CODIGOPROCESSOSISCOMEX'
      Size = 30
    end
    object qryDDAbreProcessoSTR_CODIGOCIDADE: TIBStringField
      FieldName = 'STR_CODIGOCIDADE'
      Origin = 'ABREPROCESSO.STR_CODIGOCIDADE'
      Size = 4
    end
    object qryDDAbreProcessoSTR_CODIGOPAIS: TIBStringField
      FieldName = 'STR_CODIGOPAIS'
      Origin = 'ABREPROCESSO.STR_CODIGOPAIS'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOMOEDANEG: TIBStringField
      FieldName = 'STR_CODIGOMOEDANEG'
      Origin = 'ABREPROCESSO.STR_CODIGOMOEDANEG'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOMOEDAFRETE: TIBStringField
      FieldName = 'STR_CODIGOMOEDAFRETE'
      Origin = 'ABREPROCESSO.STR_CODIGOMOEDAFRETE'
      Size = 3
    end
    object qryDDAbreProcessoSTR_CODIGOMOEDASEG: TIBStringField
      FieldName = 'STR_CODIGOMOEDASEG'
      Origin = 'ABREPROCESSO.STR_CODIGOMOEDASEG'
      Size = 3
    end
    object qryDDAbreProcessoDT_PREVISAOREGISTRODI: TDateTimeField
      FieldName = 'DT_PREVISAOREGISTRODI'
      Origin = 'ABREPROCESSO.DT_PREVISAOREGISTRODI'
    end
  end
  object dsDDAbreProcesso: TDataSource
    DataSet = qryDDAbreProcesso
    Left = 691
    Top = 204
  end
  object qryDDAux: TIBQuery
    Database = IBNF
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 680
    Top = 27
  end
  object qryBrokerAux: TQuery
    DatabaseName = 'DBBROKER'
    Left = 760
    Top = 83
  end
  object qryDDItens: TIBQuery
    Database = IBNF
    Transaction = IBTransaction
    OnCalcFields = qryDDItensCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsDDAbreProcesso
    SQL.Strings = (
      
        'SELECT NFI.STR_CODIGOPRODUTO, NFI.LI_SEQUENCIACONTINUACAO, NFI.L' +
        'I_SEQUENCIAITEM, NFI.LI_SEQUENCIANFENTRADA,'
      
        '       NFE.MEM_DADOS AS MEM_DADOS_NF_ENTRADA, NFI.MEM_DADOS AS M' +
        'EM_DADOS_NF_ITEM,'
      
        '       ITEMDI.DBL_QTDEMEDIDAESTAT, ITEMDI.STR_NUMEROFATURADDIMPO' +
        'RT, ITEMDI.LI_ITEMPO, CAPADI.STR_CODIGOMOEDAFRETE,'
      
        '       ITEMDI.DBL_VALORORIGEMMOEDA, ITEMDI.DBL_VALORFRETEMOEDAPR' +
        'EPAID, ITEMDI.LI_SEQUENCIADI,'
      
        '       ITEMDI.DBL_VALORFRETEMOEDACOLLECT, ITEMDI.DBL_VALORSEGURO' +
        'MOEDA, CAPADI.STR_CODIGOMOEDANEG,'
      
        '       ITEMDI.DBL_TAXAMERCADORIA, ITEMDI.DBL_TAXASISCOMEX, ITEMD' +
        'I.DBL_ACRESCIMOSREAIS, CAPADI.DBL_TAXASEGURO,'
      
        '       ITEMDI.STR_NUMEROPO, ITEMDI.DBL_VALORSEGUROMOEDA, ITEMDI.' +
        'DBL_VALORIIRECOLHER, ITEMDI.DBL_VALORICMS,'
      
        '       ITEMDI.DBL_VALORIPIRECOLHER, ITEMDI.DBL_VALORPISPASEPAREC' +
        'OLHER, ITEMDI.DBL_VALORCOFINSARECOLHER, ITEMDI.DBL_PESOLIQUIDO, ' +
        'ITEMDI.DBL_PESOBRUTO'
      
        'FROM NOTAFISCALENTRADA NFE INNER JOIN DADOSITEMNOTAFISCALENTRADA' +
        ' NFI ON NFI.LI_SEQUENCIANFENTRADA = NFE.LI_SEQUENCIANFENTRADA'
      
        '                                                                ' +
        '    AND NFI.LI_SEQUENCIACONTINUACAO = NFE.LI_SEQUENCIACONTINUACA' +
        'O'
      
        '  INNER JOIN CAPADI ON CAPADI.LI_SEQUENCIADI = NFE.LI_SEQUENCIAP' +
        'ROCESSO'
      
        '  INNER JOIN ITEMDI ON ITEMDI.LI_SEQUENCIADI = CAPADI.LI_SEQUENC' +
        'IADI'
      
        '                    AND ITEMDI.STR_CODIGOPRODUTO = NFI.STR_CODIG' +
        'OPRODUTO'
      
        '                    AND NFI.LI_SEQUENCIANOTAFISCALITEMMONT = ITE' +
        'MDI.LI_NUMEROITEM'
      'WHERE NFE.LI_SEQUENCIAPROCESSO = :LI_SEQUENCIAPROCESSO'
      '    AND NFE.LI_SEQUENCIANFENTRADA <> :LI_SEQUENCIANFENTRADA'
      
        'ORDER BY NFI.LI_SEQUENCIACONTINUACAO, NFI.LI_SEQUENCIANFENTRADA,' +
        ' ITEMDI.LI_NUMEROITEM, ITEMDI.STR_NUMEROFATURADDIMPORT')
    Left = 608
    Top = 83
    ParamData = <
      item
        DataType = ftString
        Name = 'LI_SEQUENCIAPROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'LI_SEQUENCIANFENTRADA'
        ParamType = ptUnknown
      end>
    object qryDDItensCALC_DBL_PESOBRUTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOBRUTO'
      Calculated = True
    end
    object qryDDItensCALC_DBL_PESOLIQUIDO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOLIQUIDO'
      Calculated = True
    end
    object qryDDItensCALC_DBL_CIFREAISTOTAL_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_CIFREAISTOTAL_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_CIFREAISUNIT_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_CIFREAISUNIT_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_QTDITENS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_QTDITENS_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_ALIQUOTAICMS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_ALIQUOTAICMS_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_ALIQUOTAIPI_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_ALIQUOTAIPI_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_VALORIPI_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORIPI_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_VALORBASEICMS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORBASEICMS_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_VALORICMS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORICMS_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_VALORII_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORII_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_QTDITENSNOTA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_QTDITENSNOTA'
      Calculated = True
    end
    object qryDDItensCALC_DBL_PESOLIQUIDO_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOLIQUIDO_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_DBL_PESOBRUTO_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOBRUTO_ITEM'
      Calculated = True
    end
    object qryDDItensCALC_IN_ATIVO: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'CALC_IN_ATIVO'
      Calculated = True
    end
    object qryDDItensCALC_STR_SERIENOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_SERIENOTA'
      Size = 50
      Calculated = True
    end
    object qryDDItensCALC_STR_NRNOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_NRNOTA'
      Size = 50
      Calculated = True
    end
    object qryDDItensCALC_STR_DATANOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_DATANOTA'
      Size = 10
      Calculated = True
    end
    object qryDDItensCALC_STR_SIGLAUNIDADEMOEDA_ITEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_SIGLAUNIDADEMOEDA_ITEM'
      Size = 10
      Calculated = True
    end
    object qryDDItensCALC_STR_NRPEDIDO_ITEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_NRPEDIDO_ITEM'
      Size = 50
      Calculated = True
    end
    object qryDDItensCALC_STR_CFOP: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_CFOP'
      Size = 10
      Calculated = True
    end
    object qryDDItensDBL_QTDEMEDIDAESTAT: TFloatField
      FieldName = 'DBL_QTDEMEDIDAESTAT'
      Origin = 'ITEMDI.DBL_QTDEMEDIDAESTAT'
    end
    object qryDDItensDBL_VALORORIGEMMOEDA: TFloatField
      FieldName = 'DBL_VALORORIGEMMOEDA'
      Origin = 'ITEMDI.DBL_VALORORIGEMMOEDA'
    end
    object qryDDItensDBL_VALORFRETEMOEDAPREPAID: TFloatField
      FieldName = 'DBL_VALORFRETEMOEDAPREPAID'
      Origin = 'ITEMDI.DBL_VALORFRETEMOEDAPREPAID'
    end
    object qryDDItensDBL_VALORFRETEMOEDACOLLECT: TFloatField
      FieldName = 'DBL_VALORFRETEMOEDACOLLECT'
      Origin = 'ITEMDI.DBL_VALORFRETEMOEDACOLLECT'
    end
    object qryDDItensDBL_VALORSEGUROMOEDA: TFloatField
      FieldName = 'DBL_VALORSEGUROMOEDA'
      Origin = 'ITEMDI.DBL_VALORSEGUROMOEDA'
    end
    object qryDDItensDBL_TAXAMERCADORIA: TFloatField
      FieldName = 'DBL_TAXAMERCADORIA'
      Origin = 'ITEMDI.DBL_TAXAMERCADORIA'
    end
    object qryDDItensDBL_TAXASISCOMEX: TFloatField
      FieldName = 'DBL_TAXASISCOMEX'
      Origin = 'ITEMDI.DBL_TAXASISCOMEX'
    end
    object qryDDItensDBL_TAXASEGURO: TFloatField
      FieldName = 'DBL_TAXASEGURO'
      Origin = 'CAPADI.DBL_TAXASEGURO'
    end
    object qryDDItensDBL_ACRESCIMOSREAIS: TFloatField
      FieldName = 'DBL_ACRESCIMOSREAIS'
      Origin = 'ITEMDI.DBL_ACRESCIMOSREAIS'
    end
    object qryDDItensDBL_VALORSEGUROMOEDA1: TFloatField
      FieldName = 'DBL_VALORSEGUROMOEDA1'
      Origin = 'ITEMDI.DBL_VALORSEGUROMOEDA'
    end
    object qryDDItensDBL_VALORIIRECOLHER: TFloatField
      FieldName = 'DBL_VALORIIRECOLHER'
      Origin = 'ITEMDI.DBL_VALORIIRECOLHER'
    end
    object qryDDItensDBL_VALORICMS: TFloatField
      FieldName = 'DBL_VALORICMS'
      Origin = 'ITEMDI.DBL_VALORICMS'
    end
    object qryDDItensDBL_VALORIPIRECOLHER: TFloatField
      FieldName = 'DBL_VALORIPIRECOLHER'
      Origin = 'ITEMDI.DBL_VALORIPIRECOLHER'
    end
    object qryDDItensDBL_VALORPISPASEPARECOLHER: TFloatField
      FieldName = 'DBL_VALORPISPASEPARECOLHER'
      Origin = 'ITEMDI.DBL_VALORPISPASEPARECOLHER'
    end
    object qryDDItensDBL_VALORCOFINSARECOLHER: TFloatField
      FieldName = 'DBL_VALORCOFINSARECOLHER'
      Origin = 'ITEMDI.DBL_VALORCOFINSARECOLHER'
    end
    object qryDDItensDBL_PESOBRUTO: TFloatField
      FieldName = 'DBL_PESOBRUTO'
      Origin = 'ITEMDI.DBL_PESOBRUTO'
    end
    object qryDDItensDBL_PESOLIQUIDO: TFloatField
      FieldName = 'DBL_PESOLIQUIDO'
      Origin = 'ITEMDI.DBL_PESOLIQUIDO'
    end
    object qryDDItensLI_SEQUENCIACONTINUACAO: TIntegerField
      FieldName = 'LI_SEQUENCIACONTINUACAO'
      Origin = 'DADOSITEMNOTAFISCALENTRADA.LI_SEQUENCIACONTINUACAO'
      Required = True
    end
    object qryDDItensLI_SEQUENCIAITEM: TIntegerField
      FieldName = 'LI_SEQUENCIAITEM'
      Origin = 'DADOSITEMNOTAFISCALENTRADA.LI_SEQUENCIAITEM'
      Required = True
    end
    object qryDDItensLI_SEQUENCIANFENTRADA: TIntegerField
      FieldName = 'LI_SEQUENCIANFENTRADA'
      Origin = 'DADOSITEMNOTAFISCALENTRADA.LI_SEQUENCIANFENTRADA'
      Required = True
    end
    object qryDDItensLI_ITEMPO: TIntegerField
      FieldName = 'LI_ITEMPO'
      Origin = 'ITEMDI.LI_ITEMPO'
    end
    object qryDDItensLI_SEQUENCIADI: TIntegerField
      FieldName = 'LI_SEQUENCIADI'
      Origin = 'ITEMDI.LI_SEQUENCIADI'
      Required = True
    end
    object qryDDItensMEM_DADOS_NF_ENTRADA: TBlobField
      FieldName = 'MEM_DADOS_NF_ENTRADA'
      Origin = 'NOTAFISCALENTRADA.MEM_DADOS'
      Size = 8
    end
    object qryDDItensMEM_DADOS_NF_ITEM: TBlobField
      FieldName = 'MEM_DADOS_NF_ITEM'
      Origin = 'DADOSITEMNOTAFISCALENTRADA.MEM_DADOS'
      Size = 8
    end
    object qryDDItensSTR_CODIGOPRODUTO: TIBStringField
      FieldName = 'STR_CODIGOPRODUTO'
      Origin = 'DADOSITEMNOTAFISCALENTRADA.STR_CODIGOPRODUTO'
      Size = 50
    end
    object qryDDItensSTR_NUMEROFATURADDIMPORT: TIBStringField
      FieldName = 'STR_NUMEROFATURADDIMPORT'
      Origin = 'ITEMDI.STR_NUMEROFATURADDIMPORT'
      Size = 16
    end
    object qryDDItensSTR_NUMEROPO: TIBStringField
      FieldName = 'STR_NUMEROPO'
      Origin = 'ITEMDI.STR_NUMEROPO'
      Size = 18
    end
    object qryDDItensSTR_CODIGOMOEDANEG: TIBStringField
      FieldName = 'STR_CODIGOMOEDANEG'
      Origin = 'CAPADI.STR_CODIGOMOEDANEG'
      Size = 3
    end
    object qryDDItensSTR_CODIGOMOEDAFRETE: TIBStringField
      FieldName = 'STR_CODIGOMOEDAFRETE'
      Origin = 'CAPADI.STR_CODIGOMOEDAFRETE'
      Size = 3
    end
    object qryDDItensCALC_STR_CD_REFERENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_CD_REFERENCIA'
      Size = 28
      Calculated = True
    end
  end
  object dsDDItens: TDataSource
    DataSet = qryDDItens
    Left = 771
    Top = 204
  end
  object qryBrokerFrete: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  CASE WHEN ISNULL(VL_TOT_FRT_COLLECT, 0) > 0 THEN'
      '    (SELECT SUM(ii.price)'
      '      FROM MYINDAIAV2.DBO.Billing B '
      
        '        inner join MYINDAIAV2.DBO.Billing_ItemInvoiced  bii on b' +
        'ii.Billing_id=b.id'
      
        '        inner join MYINDAIAV2.DBO.ItemInvoiced ii on ii.id=bii.i' +
        'tensInvoiced_id'
      
        '        inner join MYINDAIAV2.DBO.CustomClearance cc on cc.id=ii' +
        '.customClearance_id'
      '        inner join MYINDAIAV2.DBO.Item i on i.id=ii.item_id'
      '      WHERE b.status='#39'INVOICED'#39
      
        '      AND i.aKey IN (1,29,421,475,521,524,549,646,657,813,879) A' +
        'ND cc.customID = DI.NR_PROCESSO)'
      '    ELSE'
      
        '    CONVERT(DECIMAL(28,2), ISNULL((DI.VL_TOT_FRT_PREPAID * ISNUL' +
        'L(TX_FRETE, 0)) / ISNULL(TX_MLE, 1), 0))'
      '  END AS VL_FRETE,'
      '  (SELECT CD_EXTERNO'
      '    FROM TDE_PARA DP'
      
        '    WHERE DP.CD_DDBROKER = CASE WHEN ISNULL(VL_TOT_FRT_COLLECT, ' +
        '0) > 0 THEN '#39'790'#39' ELSE ISNULL(DI.CD_MOEDA_MLE, DI.CD_MOEDA_FRETE' +
        ') END'
      
        '      AND DP.CD_TABELA   = '#39'25'#39' AND DP.CD_UNID_NEG = '#39'01'#39' AND DP' +
        '.CD_PRODUTO  = '#39'01'#39') AS MOEDA_FRETE,'
      
        '  CONVERT(DECIMAL(28, 5), CASE WHEN ISNULL(VL_TOT_FRT_COLLECT, 0' +
        ') > 0 THEN 1.00000 ELSE DI.TX_MLE END) AS TX_FRETE'
      'FROM TDECLARACAO_IMPORTACAO DI'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 680
    Top = 83
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    object qryBrokerFreteVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qryBrokerFreteMOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      FixedChar = True
      Size = 15
    end
    object qryBrokerFreteTX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
    end
  end
  object qryBrokerItens: TQuery
    CachedUpdates = True
    OnCalcFields = qryBrokerItensCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      
        'SELECT DM.CD_MERCADORIA                                  AS  STR' +
        '_CODIGOPRODUTO,'
      
        '       DM.QT_MERC_UN_COMERC                              AS  DBL' +
        '_QTDEMEDIDAESTAT,'
      
        '       DM.NR_FATURA                                      AS  STR' +
        '_NUMEROFATURADDIMPORT,'
      
        '       CONVERT(INT, DM.NR_ITEM_PO)                       AS  LI_' +
        'ITEMPO,'
      
        '       DI.CD_MOEDA_FRETE                                 AS  STR' +
        '_CODIGOMOEDAFRETE,'
      
        '       DM.VL_MLE_ITEM                                    AS  DBL' +
        '_VALORORIGEMMOEDA,'
      
        '       DM.FRETE_PREPAID_ITEM                             AS  DBL' +
        '_VALORFRETEMOEDAPREPAID,'
      
        '       DM.FRETE_COLLECT_ITEM                             AS  DBL' +
        '_VALORFRETEMOEDACOLLECT,'
      
        '       DM.VL_SEGURO_ITEM                                 AS  DBL' +
        '_VALORSEGUROMOEDA,'
      
        '       DI.CD_MOEDA_MLE                                   AS  STR' +
        '_CODIGOMOEDANEG,'
      
        '       0                                                 AS  DBL' +
        '_TAXAMERCADORIA,'
      
        '       DM.VL_TX_SCX_ITEM                                 AS  DBL' +
        '_TAXASISCOMEX,'
      
        '       DM.VL_ACRESCIMO_ITEM_MN                           AS  DBL' +
        '_ACRESCIMOSREAIS,'
      
        '       AI.TX_SEGURO                                      AS  DBL' +
        '_TAXASEGURO,'
      
        '       DM.NR_PROC_PO                                     AS  STR' +
        '_NUMEROPO,'
      
        '       DM.VL_II_ITEM                                     AS  DBL' +
        '_VALORIIRECOLHER,'
      
        '       ((AI.VL_ICMS_A_RECOLHER_AFRMM / AI.VL_ICMS_DEVIDO_AFRMM) ' +
        '* DM.VL_ICMS_ITEM)                                   AS  DBL_VAL' +
        'ORICMS,'
      
        '       DM.VL_IPI_ITEM                                    AS  DBL' +
        '_VALORIPIRECOLHER,'
      
        '       DM.VL_PIS_ITEM                                    AS  DBL' +
        '_VALORPISPASEPARECOLHER,'
      
        '       DM.VL_COFINS_ITEM                                 AS  DBL' +
        '_VALORCOFINSARECOLHER,'
      
        '       CONVERT(INT, AI.CD_CFOP)                          AS  LI_' +
        'CFOP,'
      
        '       DM.PB_MERCADORIA                                  AS  DBL' +
        '_PESOBRUTO,'
      
        '       DM.PL_MERCADORIA                                  AS  DBL' +
        '_PESOLIQUIDO,'
      '      (SELECT SUM(PL_MERCADORIA)'
      #9'     FROM TDETALHE_MERCADORIA (NOLOCK)'
      
        '        WHERE NR_PROCESSO = DI.NR_PROCESSO)              AS  DBL' +
        '_PESOLIQUIDOTOTAL,'
      
        '       AI.VL_BASE_CALC_II                                AS  DBL' +
        '_CIF,'
      
        '       AI.PC_ICMS                                        AS  DBL' +
        '_ALIQUOTA_ICMS,'
      '       ISNULL((SELECT TR.PC_ALIQ_NORM_ADVAL'
      '               FROM TRIBUTO TR (NOLOCK)'
      '               WHERE TR.NR_PROCESSO = AI.NR_PROCESSO'
      '                 AND TR.NR_ADICAO = AI.NR_ADICAO'
      
        '                 AND TR.CD_RECEITA_IMPOSTO = '#39'0002'#39'), 0) AS  DBL' +
        '_ALIQUOTA_IPI,'
      
        '       DM.VL_IPI_ITEM                                    AS  DBL' +
        '_VALOR_IPI,'
      
        '       DM.VL_BASE_ICMS_ITEM                              AS  DBL' +
        '_VALORBASEICMS,'
      
        '        ((AI.VL_ICMS_A_RECOLHER_AFRMM / AI.VL_ICMS_DEVIDO_AFRMM)' +
        ' * DM.VL_ICMS_ITEM)                                   AS  DBL_IC' +
        'MS,'
      
        '       DM.VL_II_ITEM                                     AS  DBL' +
        '_VALOR_II,'
      
        '       DM.NR_PEDIDO                                      AS  STR' +
        '_NRPEDIDO,'
      ''
      'CASE '
      'WHEN TP.NR_DI IS NOT NULL THEN '
      'SUBSTRING(TP.NR_DI,1,2) + '#39'/'#39' +'
      'SUBSTRING(TP.NR_DI,3,7) + '#39'-'#39' +'
      'SUBSTRING(TP.NR_DI,10,1) + '#39'- '#39
      'ELSE'
      'TP.CD_DUIMP '
      'END'
      '                              AS  STR_REGISTRODI,'
      ''
      
        '       DI.NR_TRANSMISSAO                          AS STR_NR_TRAN' +
        'SM,'
      
        '       CONVERT(INT, AI.NR_ADICAO)                        AS  LI_' +
        'SEQUENCIACONTINUACAO,'
      
        '       CONVERT(INT, DM.NR_ITEM)                          AS  LI_' +
        'SEQUENCIAITEM,'
      
        '       1                                                 AS  LI_' +
        'SEQUENCIANFENTRADA,'
      
        '       1                                                 AS  LI_' +
        'SEQUENCIADI,'
      
        '       DM.NR_PARCIAL                                     AS  NR_' +
        'PARCIAL,'
      
        '       CONVERT(CHAR(10),CONVERT(INT,DM.NR_DANFE))        AS  NR_' +
        'DANFE,'
      '         (SELECT SUM(IPR.PRICE)'
      
        '            FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                ' +
        '      PR   (NOLOCK)'
      
        '      INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 ' +
        '      CC   (NOLOCK) ON CC.ID=PR.CUSTOMCLEARANCE_ID'
      
        '      INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQU' +
        'ESTED PRIR (NOLOCK) ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        '      INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED            ' +
        '      IPR  (NOLOCK) ON IPR.ID = PRIR.ITEMS_ID'
      
        '      INNER JOIN MYINDAIAV2.DBO.ITEM                            ' +
        '      I    (NOLOCK) ON I.ID = IPR.ITEM_ID'
      '           WHERE CC.CUSTOMID=DI.NR_PROCESSO'
      #9#9'     AND I.AKEY IN ('#39'075'#39')'
      #9#9'     AND PR.STATUS='#39'APPROVED'#39' ) DBL_ICMS_COMPLEMENTAR'
      '    FROM TDECLARACAO_IMPORTACAO     DI (NOLOCK) '
      
        '   INNER JOIN TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = DI.NR_PR' +
        'OCESSO'
      
        '   INNER JOIN TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESS' +
        'O = DI.NR_PROCESSO'
      
        '   INNER JOIN TDETALHE_MERCADORIA   DM (NOLOCK) ON DM.NR_PROCESS' +
        'O = AI.NR_PROCESSO AND DM.NR_ADICAO = AI.NR_ADICAO'
      'WHERE DI.NR_PROCESSO = :NR_PROCESSO'
      
        'ORDER BY NR_DANFE, STR_NUMEROFATURADDIMPORT, DM.NR_ADICAO, DM.NR' +
        '_ITEM')
    Left = 760
    Top = 131
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 18
        Value = '0101IM-1860-09'
      end>
    object qryBrokerItensCALC_DBL_PESOBRUTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOBRUTO'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_PESOLIQUIDO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOLIQUIDO'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_QTDITENSNOTA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_QTDITENSNOTA'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_CIFREAISTOTAL_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_CIFREAISTOTAL_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_CIFREAISUNIT_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_CIFREAISUNIT_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_QTDITENS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_QTDITENS_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_ALIQUOTAICMS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_ALIQUOTAICMS_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_ALIQUOTAIPI_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_ALIQUOTAIPI_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_VALORIPI_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORIPI_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_VALORBASEICMS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORBASEICMS_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_VALORICMS_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORICMS_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_VALORII_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_VALORII_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_PESOLIQUIDO_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOLIQUIDO_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_DBL_PESOBRUTO_ITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALC_DBL_PESOBRUTO_ITEM'
      Calculated = True
    end
    object qryBrokerItensCALC_IN_ATIVO: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'CALC_IN_ATIVO'
      Calculated = True
    end
    object qryBrokerItensCALC_STR_NRNOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_NRNOTA'
      Size = 50
      Calculated = True
    end
    object qryBrokerItensCALC_STR_SERIENOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_SERIENOTA'
      Size = 50
      Calculated = True
    end
    object qryBrokerItensCALC_STR_DATANOTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_DATANOTA'
      Size = 10
      Calculated = True
    end
    object qryBrokerItensCALC_STR_SIGLAUNIDADEMOEDA_ITEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_SIGLAUNIDADEMOEDA_ITEM'
      Size = 10
      Calculated = True
    end
    object qryBrokerItensCALC_STR_NRPEDIDO_ITEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_NRPEDIDO_ITEM'
      Size = 50
      Calculated = True
    end
    object qryBrokerItensCALC_STR_CFOP: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_CFOP'
      Size = 10
      Calculated = True
    end
    object qryBrokerItensDBL_QTDEMEDIDAESTAT: TFloatField
      FieldName = 'DBL_QTDEMEDIDAESTAT'
    end
    object qryBrokerItensDBL_VALORORIGEMMOEDA: TFloatField
      FieldName = 'DBL_VALORORIGEMMOEDA'
    end
    object qryBrokerItensDBL_VALORFRETEMOEDAPREPAID: TFloatField
      FieldName = 'DBL_VALORFRETEMOEDAPREPAID'
    end
    object qryBrokerItensDBL_VALORFRETEMOEDACOLLECT: TFloatField
      FieldName = 'DBL_VALORFRETEMOEDACOLLECT'
    end
    object qryBrokerItensDBL_VALORSEGUROMOEDA: TFloatField
      FieldName = 'DBL_VALORSEGUROMOEDA'
    end
    object qryBrokerItensDBL_TAXAMERCADORIA: TIntegerField
      FieldName = 'DBL_TAXAMERCADORIA'
    end
    object qryBrokerItensDBL_TAXASISCOMEX: TFloatField
      FieldName = 'DBL_TAXASISCOMEX'
    end
    object qryBrokerItensDBL_ACRESCIMOSREAIS: TFloatField
      FieldName = 'DBL_ACRESCIMOSREAIS'
    end
    object qryBrokerItensDBL_TAXASEGURO: TFloatField
      FieldName = 'DBL_TAXASEGURO'
    end
    object qryBrokerItensDBL_VALORIIRECOLHER: TFloatField
      FieldName = 'DBL_VALORIIRECOLHER'
    end
    object qryBrokerItensDBL_VALORICMS: TFloatField
      FieldName = 'DBL_VALORICMS'
    end
    object qryBrokerItensDBL_VALORIPIRECOLHER: TFloatField
      FieldName = 'DBL_VALORIPIRECOLHER'
    end
    object qryBrokerItensDBL_VALORPISPASEPARECOLHER: TFloatField
      FieldName = 'DBL_VALORPISPASEPARECOLHER'
    end
    object qryBrokerItensDBL_VALORCOFINSARECOLHER: TFloatField
      FieldName = 'DBL_VALORCOFINSARECOLHER'
    end
    object qryBrokerItensDBL_PESOBRUTO: TFloatField
      FieldName = 'DBL_PESOBRUTO'
    end
    object qryBrokerItensDBL_PESOLIQUIDO: TFloatField
      FieldName = 'DBL_PESOLIQUIDO'
    end
    object qryBrokerItensDBL_CIF: TFloatField
      FieldName = 'DBL_CIF'
    end
    object qryBrokerItensDBL_ALIQUOTA_ICMS: TFloatField
      FieldName = 'DBL_ALIQUOTA_ICMS'
    end
    object qryBrokerItensDBL_ALIQUOTA_IPI: TFloatField
      FieldName = 'DBL_ALIQUOTA_IPI'
    end
    object qryBrokerItensDBL_VALOR_IPI: TFloatField
      FieldName = 'DBL_VALOR_IPI'
    end
    object qryBrokerItensDBL_VALORBASEICMS: TFloatField
      FieldName = 'DBL_VALORBASEICMS'
    end
    object qryBrokerItensDBL_ICMS: TFloatField
      FieldName = 'DBL_ICMS'
    end
    object qryBrokerItensDBL_VALOR_II: TFloatField
      FieldName = 'DBL_VALOR_II'
    end
    object qryBrokerItensLI_ITEMPO: TIntegerField
      FieldName = 'LI_ITEMPO'
    end
    object qryBrokerItensLI_CFOP: TIntegerField
      FieldName = 'LI_CFOP'
    end
    object qryBrokerItensLI_SEQUENCIACONTINUACAO: TIntegerField
      FieldName = 'LI_SEQUENCIACONTINUACAO'
    end
    object qryBrokerItensLI_SEQUENCIAITEM: TIntegerField
      FieldName = 'LI_SEQUENCIAITEM'
    end
    object qryBrokerItensLI_SEQUENCIANFENTRADA: TIntegerField
      FieldName = 'LI_SEQUENCIANFENTRADA'
    end
    object qryBrokerItensLI_SEQUENCIADI: TIntegerField
      FieldName = 'LI_SEQUENCIADI'
    end
    object qryBrokerItensSTR_CODIGOPRODUTO: TStringField
      FieldName = 'STR_CODIGOPRODUTO'
      FixedChar = True
      Size = 30
    end
    object qryBrokerItensSTR_NUMEROFATURADDIMPORT: TStringField
      FieldName = 'STR_NUMEROFATURADDIMPORT'
      FixedChar = True
      Size = 25
    end
    object qryBrokerItensSTR_CODIGOMOEDAFRETE: TStringField
      FieldName = 'STR_CODIGOMOEDAFRETE'
      FixedChar = True
      Size = 3
    end
    object qryBrokerItensSTR_CODIGOMOEDANEG: TStringField
      FieldName = 'STR_CODIGOMOEDANEG'
      FixedChar = True
      Size = 3
    end
    object qryBrokerItensSTR_NUMEROPO: TStringField
      FieldName = 'STR_NUMEROPO'
      FixedChar = True
      Size = 18
    end
    object qryBrokerItensSTR_NRPEDIDO: TStringField
      FieldName = 'STR_NRPEDIDO'
      FixedChar = True
      Size = 10
    end
    object qryBrokerItensSTR_REGISTRODI: TStringField
      FieldName = 'STR_REGISTRODI'
      FixedChar = True
      Size = 10
    end
    object qryBrokerItensNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qryBrokerItensCALC_STR_CD_REFERENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STR_CD_REFERENCIA'
      Size = 28
      Calculated = True
    end
    object qryBrokerItensNR_DANFE: TStringField
      FieldName = 'NR_DANFE'
      FixedChar = True
      Size = 10
    end
    object qryBrokerItensDBL_ICMS_COMPLEMENTAR: TFloatField
      FieldName = 'DBL_ICMS_COMPLEMENTAR'
    end
    object qryBrokerItensDBL_PESOLIQUIDOTOTAL: TFloatField
      FieldName = 'DBL_PESOLIQUIDOTOTAL'
    end
    object qryBrokerItensSTR_NR_TRANSM: TStringField
      FieldName = 'STR_NR_TRANSM'
      FixedChar = True
      Size = 15
    end
  end
  object dsBrokerItens: TDataSource
    DataSet = qryBrokerItens
    Left = 760
    Top = 29
  end
  object qryAcrescimo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(CASE AD.CD_MOEDA'
      '               WHEN '#39'790'#39' THEN AD.VL_MOEDA'
      '           ELSE ROUND(AD.VL_MOEDA * TC.TX_CAMBIO, 2)'
      '           END) AS VL_ACRESCIMO_MN'
      'FROM TACRESCIMO_DEDUCAO              AD'
      
        '   INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = AD.N' +
        'R_PROCESSO'
      
        '   LEFT  JOIN TTAXA_CAMBIO           TC ON TC.CD_MOEDA = AD.CD_M' +
        'OEDA AND CONVERT(DATE, DI.DT_CALCULO, 103) BETWEEN CONVERT(DATE,' +
        ' TC.DT_INICIO_VIGENCIA, 103) AND CONVERT(DATE, TC.DT_TERMINO_VIG' +
        'ENCIA, 103)'
      'WHERE AD.NR_PROCESSO = :NR_PROCESSO'
      '  AND AD.TP_DESPESA = '#39'A'#39)
    Left = 680
    Top = 131
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    object qryAcrescimoVL_ACRESCIMO_MN: TFloatField
      FieldName = 'VL_ACRESCIMO_MN'
    end
  end
end

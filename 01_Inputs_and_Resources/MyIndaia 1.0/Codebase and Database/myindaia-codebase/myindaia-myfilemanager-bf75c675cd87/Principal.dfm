object frmMyFileManager: TfrmMyFileManager
  Left = 324
  Top = 151
  Caption = 
    'MyFileManager - Utilit'#225'rio para manipula'#231#227'o dos arquivos do CTRL' +
    '+F1'
  ClientHeight = 449
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 224
    Width = 651
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Visible = False
    ExplicitLeft = 161
    ExplicitTop = 0
    ExplicitWidth = 539
  end
  object reMensagens: TRichEdit
    Left = 0
    Top = 227
    Width = 651
    Height = 222
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    Visible = False
    Zoom = 100
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 224
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object pnlProcessos: TPanel
      Left = 0
      Top = 0
      Width = 144
      Height = 206
      Align = alLeft
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      object Label4: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 134
        Height = 52
        Align = alTop
        Caption = 
          'Coloque os processos desejados, um por linha, com unidade e prod' +
          'uto na frente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        ExplicitWidth = 124
      end
      object memProcessos: TMemo
        Left = 0
        Top = 58
        Width = 140
        Height = 144
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object pnlCentral: TPanel
      Left = 144
      Top = 0
      Width = 507
      Height = 206
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 14
        Top = 38
        Width = 116
        Height = 13
        Caption = 'Diret'#243'rio de Destino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 14
        Top = 8
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 14
        Top = 90
        Width = 211
        Height = 13
        Caption = 'Estrutura de Diret'#243'rios a ser utilizada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCopiar: TSpeedButton
        Left = 383
        Top = 178
        Width = 78
        Height = 24
        Caption = 'Copiar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFA0756E7443427443427443427443427443427443427443
          42744342744342FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFFF8E5F7
          EDD9F7EBD5F4E9D1F4E9D0F4E7CFF6EAD0EEDDC4754443FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFA0756EF7EDDCF2D9BFF2D7BBF0D5BAEFD4B5EED3B2EED9
          BFE5D0BA754443FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFAEFDEFC
          C591FCC591FCC591FCC591FCC591FCC591E3D1BC754443FF00FFFF00FFA0756E
          744342744342744342A0756EFCF4E7F6D9BAF7D7B6F6D4B5F6D4B2F4D1ADF0DC
          C2E6D3C081524CFF00FFFF00FFA0756EFFF8E5F7EDD9F7EBD5A0756EFEF6EBF8
          DABCF8D9B8F8D8B7F7D5B6F7D4B2F3DEC7E7D7C581524DFF00FFFF00FFA0756E
          F7EDDCF2D9BFF2D7BBA0756EFEFAF2FCC591FCC591FCC591FCC591FCC591FCC5
          91EBDDCF8F5F5AFF00FFFF00FFA0756EFAEFDEFCC591FCC591A0756EFFFCFAFC
          E3CCFBE0C7FADEC6F8DEC4FCE2C6FCF0DEE1D7CE8F5E59FF00FFFF00FFA0756E
          FCF4E7F6D9BAF7D7B6A0756EFFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1
          AFA793959E675AFF00FFFF00FFA0756EFEF6EBF8DABCF8D9B8A0756EFFFFFFFF
          FFFFFFFEFEFFFCF8FFFEFAA0756EA0756EA0756EA0756EFF00FFFF00FFA0756E
          FEFAF2FCC591FCC591A0756EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A1
          54B6735DFF00FFFF00FFFF00FFA0756EFFFCFAFCE3CCFBE0C7A0756EA0756EA0
          756EA0756EA0756EA0756EA0756EAA6D68FF00FFFF00FFFF00FFFF00FFA0756E
          FFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1AFA793959E675AFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFA0756EFFFFFFFFFFFFFFFEFEFFFCF8FFFEFAA0
          756EA0756EA0756EA0756EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A154B6735DFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFA0756EA0756EA0756EA0756EA0756EA0756EA0
          756EAA6D68FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = btnCopiarClick
      end
      object SpeedButton1: TSpeedButton
        Left = 438
        Top = 57
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
      object edtDestino: TEdit
        Left = 15
        Top = 57
        Width = 423
        Height = 21
        TabOrder = 1
        Text = 'C:\Documents and Settings\michel.marques\Desktop\00-00-0000'
        OnExit = edtDestinoExit
      end
      object cboProduto: TComboBox
        Left = 153
        Top = 109
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnClick = cboProdutoClick
        Items.Strings = (
          ''
          'Exporta'#231#227'o'
          'Importa'#231#227'o')
      end
      object cboTipoProcesso: TComboBox
        Left = 153
        Top = 133
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 5
        OnClick = cboTipoProcessoClick
        Items.Strings = (
          ''
          'Comercial'
          'Planta')
      end
      object cboSubDir1: TComboBox
        Left = 153
        Top = 157
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        OnClick = cboSubDir1Click
        Items.Strings = (
          ''
          'Processo'
          'Refer'#234'ncia')
      end
      object cboSubDir2: TComboBox
        Left = 153
        Top = 181
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 9
        OnClick = cboSubDir2Click
        Items.Strings = (
          ''
          'Processo'
          'Refer'#234'ncia')
      end
      object cboTipoDocumento: TComboBox
        Left = 133
        Top = 5
        Width = 328
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object chkSubDirProduto: TCheckBox
        Left = 46
        Top = 111
        Width = 97
        Height = 17
        Caption = 'Sub diret'#243'rio 1'
        TabOrder = 2
        OnClick = chkSubDirProdutoClick
      end
      object chkSubDirTipoProc: TCheckBox
        Left = 46
        Top = 135
        Width = 97
        Height = 17
        Caption = 'Sub diret'#243'rio 2'
        TabOrder = 4
        OnClick = chkSubDirTipoProcClick
      end
      object chkSubDir1: TCheckBox
        Left = 46
        Top = 159
        Width = 97
        Height = 17
        Caption = 'Sub diret'#243'rio 3'
        TabOrder = 6
        OnClick = chkSubDir1Click
      end
      object chkSubDir2: TCheckBox
        Left = 46
        Top = 183
        Width = 97
        Height = 17
        Caption = 'Sub diret'#243'rio 4'
        TabOrder = 8
        OnClick = chkSubDir2Click
      end
      object chbManterNome: TCheckBox
        Left = 304
        Top = 89
        Width = 185
        Height = 17
        Caption = 'Manter nome do arquivo original'
        Checked = True
        State = cbChecked
        TabOrder = 10
        OnClick = chkSubDirProdutoClick
      end
    end
    object pnlStatus: TPanel
      Left = 0
      Top = 206
      Width = 651
      Height = 18
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object Panel3: TPanel
        Left = 137
        Top = 1
        Width = 212
        Height = 16
        Align = alLeft
        TabOrder = 0
        object Label6: TLabel
          Left = 1
          Top = 1
          Width = 110
          Height = 14
          Align = alLeft
          Caption = ' Processo Corrente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitHeight = 13
        end
        object lblProcesso: TLabel
          Left = 111
          Top = 1
          Width = 100
          Height = 14
          Align = alClient
          Alignment = taCenter
          Caption = '-'
          ExplicitWidth = 4
          ExplicitHeight = 13
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 136
        Height = 16
        Align = alLeft
        TabOrder = 1
        object Label7: TLabel
          Left = 1
          Top = 1
          Width = 57
          Height = 14
          Align = alLeft
          Caption = ' Copiados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitHeight = 13
        end
        object lblCopiados: TLabel
          Left = 58
          Top = 1
          Width = 77
          Height = 14
          Align = alClient
          Alignment = taCenter
          Caption = '0 / 0'
          ExplicitWidth = 22
          ExplicitHeight = 13
        end
      end
      object Panel5: TPanel
        Left = 349
        Top = 1
        Width = 301
        Height = 16
        Align = alClient
        TabOrder = 2
        object Gauge1: TGauge
          Left = 1
          Top = 1
          Width = 299
          Height = 14
          Align = alClient
          BorderStyle = bsNone
          ForeColor = clBlue
          Progress = 0
          ExplicitLeft = 115
          ExplicitTop = -5
          ExplicitWidth = 151
          ExplicitHeight = 21
        end
      end
    end
  end
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=BROKER;Data Source=INDAIA10'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    AfterConnect = cboProdutoClick
    Left = 256
    Top = 248
  end
  object qryArquivos: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end>
    SQL.Strings = (
      'SELECT PD.*,'
      '       TDD.NM_TIPO_DOCTO,'
      
        '       DBO.FN_PATH_DIGITALIZACAO(PD.NR_PROCESSO, '#39'1'#39') AS PATH_DI' +
        'GITALIZACAO'
      'FROM TPROCESSO_DOCTOS PD (NOLOCK)'
      
        ' INNER JOIN TTP_DOCTO_DIGITALIZADO TDD (NOLOCK) ON TDD.ID_TABELA' +
        ' = PD.ID_TABELA'
      
        '                                                              AN' +
        'D TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO'
      'WHERE PD.NR_PROCESSO = :NR_PROCESSO'
      '  AND PD.IN_ATIVO = '#39'1'#39
      '  AND TDD.IN_ENVIA_WEB = '#39'1'#39
      'ORDER BY PD.ID_TABELA, PD.CD_TIPO_DOCTO')
    Left = 368
    Top = 248
    object qryArquivosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qryArquivosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qryArquivosNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      FixedChar = True
      Size = 80
    end
    object qryArquivosNM_ARQUIVO: TStringField
      DisplayWidth = 200
      FieldName = 'NM_ARQUIVO'
      Size = 200
    end
    object qryArquivosCD_USUARIO_CRIACAO: TStringField
      FieldName = 'CD_USUARIO_CRIACAO'
      FixedChar = True
      Size = 4
    end
    object qryArquivosDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object qryArquivosCD_USUARIO_ALT: TStringField
      FieldName = 'CD_USUARIO_ALT'
      FixedChar = True
      Size = 4
    end
    object qryArquivosDT_ALT: TDateTimeField
      FieldName = 'DT_ALT'
    end
    object qryArquivosIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryArquivosNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      Size = 11
    end
    object qryArquivosNM_MOTIVO_ALTERACAO: TStringField
      FieldName = 'NM_MOTIVO_ALTERACAO'
      Size = 255
    end
    object qryArquivosID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qryArquivosNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Size = 100
    end
    object qryArquivosPATH_DIGITALIZACAO: TStringField
      FieldName = 'PATH_DIGITALIZACAO'
      ReadOnly = True
      Size = 500
    end
  end
  object qryTipoDoctos: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    AfterOpen = qryTipoDoctosAfterOpen
    Parameters = <
      item
        Name = 'CD_PRODUTO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_DOCTO_DIGITALIZADO (NOLOCK)'
      'WHERE CD_PRODUTO IN ('#39'AM'#39', :CD_PRODUTO)'
      'ORDER BY NM_TIPO_DOCTO')
    Left = 264
    Top = 320
    object qryTipoDoctosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qryTipoDoctosNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Size = 100
    end
    object qryTipoDoctosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryTipoDoctosIN_MULTIPLOS_ARQ: TIntegerField
      FieldName = 'IN_MULTIPLOS_ARQ'
    end
    object qryTipoDoctosNM_PREFIXO_ARQ: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Size = 4
    end
    object qryTipoDoctosIN_ENVIA_WEB: TStringField
      FieldName = 'IN_ENVIA_WEB'
      FixedChar = True
      Size = 1
    end
    object qryTipoDoctosID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
  end
  object qryReferencias: TADOQuery
    Connection = Connection
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = '0102JA-0242-10'
      end>
    SQL.Strings = (
      
        '--SELECT TOP 1 RC.CD_REFERENCIA AS CD_REFERENCIAS-- MASTER.DBO.R' +
        'OWCONCAT(DISTINCT RTRIM(RC.CD_REFERENCIA) + '#39' '#39') AS CD_REFERENCI' +
        'AS'
      
        'SELECT MASTER.DBO.ROWCONCAT(DISTINCT RTRIM(REPLACE(RC.CD_REFEREN' +
        'CIA, '#39'$NINT$'#39', '#39#39')) + '#39' '#39') AS CD_REFERENCIAS'
      'FROM TPROCESSO P (NOLOCK)'
      '  INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = P.CD_GRUPO'
      
        '  INNER JOIN TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO = P.NR_P' +
        'ROCESSO AND RC.TP_REFERENCIA = ISNULL(CASE WHEN P.CD_PRODUTO IN ' +
        '('#39'01'#39', '#39'03'#39', '#39'06'#39') THEN G.TP_PEDIDO_BUSCA_IMP'
      
        '                                                                ' +
        '                                           WHEN P.CD_PRODUTO IN ' +
        '('#39'02'#39', '#39'10'#39') THEN G.TP_PEDIDO_BUSCA'
      
        '                                                                ' +
        '                                      ELSE G.TP_PEDIDO_BUSCA_IMP'
      
        '                                                                ' +
        '                                      END, '#39'01'#39')'
      'WHERE RC.NR_PROCESSO = :NR_PROCESSO'
      '--ORDER BY RC.DT_REFERENCIA')
    Left = 368
    Top = 320
    object qryReferenciasCD_REFERENCIAS: TStringField
      FieldName = 'CD_REFERENCIAS'
      ReadOnly = True
      Size = 4000
    end
  end
end

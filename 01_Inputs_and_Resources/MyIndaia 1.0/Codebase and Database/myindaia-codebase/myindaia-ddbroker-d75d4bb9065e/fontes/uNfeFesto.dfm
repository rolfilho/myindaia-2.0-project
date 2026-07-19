object frmNfeFesto: TfrmNfeFesto
  Left = 454
  Top = 262
  Width = 386
  Height = 242
  Caption = 'Nfe Festo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOpcoes: TPanel
    Left = 0
    Top = 174
    Width = 378
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnAvancar: TBitBtn
      Left = 272
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Gerar DANFE'
      Default = True
      TabOrder = 0
      OnClick = btnAvancarClick
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblTituloSombra: TLabel
      Left = 6
      Top = 6
      Width = 91
      Height = 20
      Caption = 'Nota Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTitulo: TLabel
      Left = 4
      Top = 5
      Width = 153
      Height = 20
      Caption = 'Nota Fiscal - Festo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 0
      Top = 29
      Width = 378
      Height = 2
      Align = alBottom
    end
  end
  object nbNfe: TNotebook
    Left = 0
    Top = 31
    Width = 378
    Height = 143
    Align = alClient
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Nota Fiscal M'#227'e'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 52
        Height = 13
        Caption = 'Unidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 41
        Width = 49
        Height = 13
        Caption = 'Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 64
        Width = 57
        Height = 13
        Caption = 'Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnUNID_NEG: TSpeedButton
        Left = 321
        Top = 14
        Width = 21
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btnUNID_NEGClick
      end
      object btnPRODUTO: TSpeedButton
        Left = 321
        Top = 38
        Width = 21
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btnPRODUTOClick
      end
      object btnPROCESSO: TSpeedButton
        Left = 194
        Top = 62
        Width = 21
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btnPROCESSOClick
      end
      object edtCD_UNID_NEG: TEdit
        Left = 79
        Top = 14
        Width = 25
        Height = 21
        MaxLength = 2
        TabOrder = 0
        OnChange = edtCD_UNID_NEGChange
        OnExit = edtCD_UNID_NEGExit
      end
      object edtNM_UNID_NEG: TEdit
        Left = 104
        Top = 14
        Width = 216
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
        Text = '-'
      end
      object edtCD_PRODUTO: TEdit
        Left = 79
        Top = 38
        Width = 25
        Height = 21
        MaxLength = 2
        TabOrder = 2
        OnChange = edtCD_PRODUTOChange
        OnExit = edtCD_UNID_NEGExit
      end
      object edtNM_PRODUTO: TEdit
        Left = 104
        Top = 38
        Width = 216
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        Text = '-'
      end
      object edtNR_PROCESSO: TEdit
        Left = 79
        Top = 62
        Width = 114
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 14
        TabOrder = 4
      end
      object chkUltimosProcessos: TCheckBox
        Left = 220
        Top = 64
        Width = 108
        Height = 17
        Caption = #218'ltimos Processos'
        Checked = True
        Ctl3D = True
        ParentCtl3D = False
        State = cbChecked
        TabOrder = 5
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Nota Fiscal Filhote'
      object pnlCFOP_ITENS: TPanel
        Left = 0
        Top = 0
        Width = 378
        Height = 143
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Arquivos Gerados'
      object pnlArquivos: TPanel
        Left = 0
        Top = 0
        Width = 378
        Height = 143
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  object qryNfe: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM DBO.FN_NF_FESTO(:NR_PROCESSO)'
      'ORDER BY NR_LINHA')
    Left = 280
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryNfeNR_LINHA: TAutoIncField
      FieldName = 'NR_LINHA'
    end
    object qryNfeTX_LINHA: TStringField
      FieldName = 'TX_LINHA'
      FixedChar = True
      Size = 255
    end
  end
  object qryProcesso: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_CLIENTE, CD_GRUPO, IN_CANCELADO'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 248
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TPROCESSO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TPROCESSO.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
  end
end

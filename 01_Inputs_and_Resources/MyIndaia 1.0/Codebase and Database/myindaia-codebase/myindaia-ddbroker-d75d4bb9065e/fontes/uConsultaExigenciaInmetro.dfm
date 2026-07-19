object frmConsultaExigenciaInmetro: TfrmConsultaExigenciaInmetro
  Left = 270
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Exig'#234'ncia Inmetro'
  ClientHeight = 119
  ClientWidth = 534
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
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 119
    Align = alClient
    TabOrder = 0
    object pnlGrid: TPanel
      Left = 1
      Top = 121
      Width = 532
      Height = 726
      Align = alClient
      TabOrder = 0
      object grdConsulta: TDBGrid
        Left = 1
        Top = 1
        Width = 530
        Height = 724
        Align = alClient
        DataSource = dtsExigenciaInmetro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'Expira'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Empresa'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Processo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Li'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descri'#231#227'o'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'N'#250'mero Exig'#234'ncia'
            Width = 110
            Visible = True
          end>
      end
    end
    object pnlFiltro: TPanel
      Left = 1
      Top = 1
      Width = 532
      Height = 120
      Align = alTop
      TabOrder = 1
      DesignSize = (
        532
        120)
      object lblDataLote: TLabel
        Left = 12
        Top = 8
        Width = 111
        Height = 13
        Caption = 'Data de consulta (Lote)'
      end
      object lblNumeroResultConsulta: TLabel
        Left = 355
        Top = 64
        Width = 161
        Height = 13
        Caption = 'Total do resultado da consulta: 00'
        Visible = False
      end
      object Label1: TLabel
        Left = 12
        Top = 45
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object btn_sair: TSpeedButton
        Left = 486
        Top = 8
        Width = 38
        Height = 41
        Hint = 'Sa'#237'da'
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
        Layout = blGlyphBottom
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btn_sairClick
      end
      object cmbDataLote: TComboBox
        Left = 12
        Top = 22
        Width = 185
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbDataLoteChange
      end
      object cmbEmpresa: TComboBox
        Left = 12
        Top = 59
        Width = 337
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnChange = cmbEmpresaChange
      end
      object Panel1: TPanel
        Left = 1
        Top = 78
        Width = 530
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          530
          41)
        object BitBtn1: TBitBtn
          Left = 445
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&OK'
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 365
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Cancela'
          TabOrder = 1
          OnClick = BitBtn2Click
        end
      end
    end
  end
  object dtsExigenciaInmetro: TDataSource
    DataSet = cdsExigenciaInmetro
    Left = 305
    Top = 9
  end
  object qryExigenciaInmetro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DATALOTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DATA_HORA_EXPIRA Expira, T2.NM_EMPRESA Empresa, '
      'T4.NR_PROCESSO Processo, T3.NR_LI Li,'
      'DESCRICAO Descri'#231#227'o, NUMERO AS [N'#250'mero Exig'#234'ncia]'
      'FROM TEXIGENCIAS_INMETRO T1'
      'INNER JOIN TEMPRESA_NAC T2 ON T2.CD_EMPRESA = T1.CD_EMPRESA'
      'LEFT JOIN TPROCESSO_LI T3 ON T3.NR_INMETRO = T1.NUMERO'
      
        'LEFT JOIN TPROCESSO T4 ON T4.NR_PROCESSO = T3.NR_PROCESSO AND T4' +
        '.CD_CLIENTE = T1.CD_EMPRESA'
      'WHERE  CONVERT(VARCHAR(19),DATA_HORA_LOTE, 120) =   :DATALOTE')
    SQLConnection = datm_main.SQLConnection
    Left = 301
    Top = 9
    object qryExigenciaInmetroExpira: TSQLTimeStampField
      FieldName = 'Expira'
    end
    object qryExigenciaInmetroEmpresa: TStringField
      FieldName = 'Empresa'
      FixedChar = True
      Size = 80
    end
    object qryExigenciaInmetroProcesso: TStringField
      FieldName = 'Processo'
      FixedChar = True
      Size = 18
    end
    object qryExigenciaInmetroLi: TStringField
      FieldName = 'Li'
      FixedChar = True
      Size = 10
    end
    object qryExigenciaInmetroDescrio: TStringField
      FieldName = 'Descri'#231#227'o'
      FixedChar = True
      Size = 50
    end
    object qryExigenciaInmetroNmeroExigncia: TIntegerField
      FieldName = 'N'#250'mero Exig'#234'ncia'
    end
  end
  object cdsExigenciaInmetro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExigenciaInmetro'
    Left = 301
    Top = 9
    object cdsExigenciaInmetroExpira: TSQLTimeStampField
      FieldName = 'Expira'
    end
    object cdsExigenciaInmetroEmpresa: TStringField
      FieldName = 'Empresa'
      FixedChar = True
      Size = 80
    end
    object cdsExigenciaInmetroProcesso: TStringField
      FieldName = 'Processo'
      FixedChar = True
      Size = 18
    end
    object cdsExigenciaInmetroLi: TStringField
      FieldName = 'Li'
      FixedChar = True
      Size = 10
    end
    object cdsExigenciaInmetroDescrio: TStringField
      FieldName = 'Descri'#231#227'o'
      FixedChar = True
      Size = 50
    end
    object cdsExigenciaInmetroNmeroExigncia: TIntegerField
      FieldName = 'N'#250'mero Exig'#234'ncia'
    end
  end
  object dspExigenciaInmetro: TDataSetProvider
    DataSet = qryExigenciaInmetro
    Left = 301
    Top = 9
  end
  object qryDataLote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT DISTINCT DATA_HORA_LOTE FROM TEXIGENCIAS_INMETRO '
      'ORDER BY DATA_HORA_LOTE DESC')
    SQLConnection = datm_main.SQLConnection
    Left = 385
    Top = 5
    object qryDataLoteDATA_HORA_LOTE: TSQLTimeStampField
      FieldName = 'DATA_HORA_LOTE'
    end
  end
  object dspDataLote: TDataSetProvider
    DataSet = qryDataLote
    Left = 385
    Top = 5
  end
  object cdsDataLote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDataLote'
    Left = 377
    Top = 5
    object cdsDataLoteDATA_HORA_LOTE: TSQLTimeStampField
      FieldName = 'DATA_HORA_LOTE'
    end
  end
  object dtsDataLote: TDataSource
    DataSet = cdsDataLote
    Left = 381
    Top = 5
  end
  object qryEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DATALOTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT T2.NM_EMPRESA FROM TEXIGENCIAS_INMETRO T1'
      'INNER JOIN TEMPRESA_NAC T2 ON T2.CD_EMPRESA = T1.CD_EMPRESA'
      'WHERE  CONVERT(VARCHAR(19),DATA_HORA_LOTE, 120) =  :DATALOTE'
      'ORDER BY  T2.NM_EMPRESA')
    SQLConnection = datm_main.SQLConnection
    Left = 461
    Top = 5
    object strngfldEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qryEmpresa
    Left = 461
    Top = 5
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 461
    Top = 5
    object cdsEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object dtsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 457
    Top = 5
  end
end

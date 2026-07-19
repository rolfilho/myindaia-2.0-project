object frmConsultaMercanteDivergencias: TfrmConsultaMercanteDivergencias
  Left = 257
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Diverg'#234'ncias - Consulta Mercante'
  ClientHeight = 321
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 321
    Align = alClient
    TabOrder = 0
    object sgridDivergencias: TStringGrid
      Left = 1
      Top = 45
      Width = 455
      Height = 212
      Align = alClient
      Color = clWhite
      ColCount = 3
      DefaultColWidth = 60
      DefaultRowHeight = 18
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing]
      TabOrder = 0
      ColWidths = (
        60
        124
        140)
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 455
      Height = 44
      Align = alTop
      TabOrder = 1
      DesignSize = (
        455
        44)
      object Label1: TLabel
        Left = 8
        Top = 5
        Width = 193
        Height = 13
        Caption = 'Diverg'#234'ncias - Consulta Mercante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_sair: TSpeedButton
        Left = 417
        Top = 0
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
        OnClick = btn_sairClick
      end
      object lblProcessoNaoConsultado: TLabel
        Left = 11
        Top = 24
        Width = 183
        Height = 13
        Caption = 'Processo ainda n'#227'o consultado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 257
      Width = 455
      Height = 63
      Align = alBottom
      TabOrder = 2
      object mmNCMs: TMemo
        Left = 1
        Top = 1
        Width = 453
        Height = 61
        Align = alClient
        Color = clBtnFace
        Lines.Strings = (
          'mmNCMs')
        TabOrder = 0
      end
    end
    object pnlNenhumaDivergencia: TPanel
      Left = 78
      Top = 100
      Width = 281
      Height = 24
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 3
      object lblNenhumaDivergencia: TLabel
        Left = 10
        Top = 6
        Width = 258
        Height = 13
        Caption = '<Nenhuma diverg'#234'ncia de conhecimento encontrada>'
      end
    end
  end
end

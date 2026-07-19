object frmLeiauteLista: TfrmLeiauteLista
  Left = 192
  Top = 117
  Width = 630
  Height = 379
  Caption = 'Leiaute'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 299
    Width = 614
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      614
      41)
    object Button1: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 444
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Remover'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 360
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 299
    Align = alClient
    BorderWidth = 8
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 9
      Top = 9
      Width = 596
      Height = 281
      Align = alClient
      DataSource = dmdLeiaute.dsLeiaute
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CLASS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_REL'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LEIAUTE'
          Visible = False
        end>
    end
  end
end

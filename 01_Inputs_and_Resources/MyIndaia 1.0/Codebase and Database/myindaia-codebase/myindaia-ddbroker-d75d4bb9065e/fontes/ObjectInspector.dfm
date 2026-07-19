object frmObjectInspector: TfrmObjectInspector
  Left = 192
  Top = 61
  Width = 258
  Height = 653
  Caption = 'Object Inspector'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgObjectInspector: TPageControl
    Left = 0
    Top = 24
    Width = 250
    Height = 602
    ActivePage = tbsProperties
    Align = alClient
    TabOrder = 0
    object tbsProperties: TTabSheet
      Caption = 'Properties'
      object JvInspector1: TJvInspector
        Left = 0
        Top = 0
        Width = 242
        Height = 574
        Align = alClient
        RelativeDivider = True
        Divider = 48
        ItemHeight = 16
        BeforeItemCreate = JvInspector1BeforeItemCreate
        TabStop = True
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      250
      24)
    object cboItems: TcxComboBox
      Left = 1
      Top = 1
      Width = 248
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Properties.ReadOnly = False
      Style.BorderStyle = ebs3D
      TabOrder = 0
      Text = 'cboItems'
    end
  end
end

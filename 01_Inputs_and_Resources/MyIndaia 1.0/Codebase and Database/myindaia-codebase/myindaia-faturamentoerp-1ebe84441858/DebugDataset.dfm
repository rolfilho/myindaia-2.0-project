object frmDebugDataSet: TfrmDebugDataSet
  Left = 402
  Top = 64
  Caption = 'DebugDataset'
  ClientHeight = 358
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 317
    Align = alClient
    BorderWidth = 8
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 9
      Top = 9
      Width = 565
      Height = 299
      Align = alClient
      DataSource = dsMain
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 317
    Width = 583
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      583
      41)
    object Button1: TButton
      Left = 499
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = Button1Click
    end
    object cbxAborta: TCheckBox
      Left = 352
      Top = 12
      Width = 141
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Aborta Processamento'
      TabOrder = 1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 104
    object ContarRegistros1: TMenuItem
      Caption = 'Contar Registros'
      OnClick = ContarRegistros1Click
    end
    object GerarCSV1: TMenuItem
      Caption = 'Gerar CSV'
      OnClick = GerarCSV1Click
    end
  end
  object dsMain: TDataSource
    Left = 264
    Top = 80
  end
  object SaveDialogCSV: TSaveDialog
    Filter = 'CSV|*.CSV|Texto|*.TXT'
    Left = 372
    Top = 152
  end
end

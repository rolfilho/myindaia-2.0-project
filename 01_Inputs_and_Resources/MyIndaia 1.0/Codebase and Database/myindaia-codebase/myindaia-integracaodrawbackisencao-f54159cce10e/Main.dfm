object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Integra'#231#227'o Drawback Isen'#231#227'o'
  ClientHeight = 111
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnImportarExcel: TBitBtn
    Left = 56
    Top = 40
    Width = 153
    Height = 25
    Caption = 'Importar dados do Excel'
    TabOrder = 0
    OnClick = btnImportarExcelClick
  end
  object BitBtn1: TBitBtn
    Left = 248
    Top = 40
    Width = 153
    Height = 25
    Caption = 'Transmitir XMLs'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end

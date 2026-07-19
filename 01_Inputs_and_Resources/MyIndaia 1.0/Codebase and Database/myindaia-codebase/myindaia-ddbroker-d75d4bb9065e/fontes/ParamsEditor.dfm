object frmParamsEditor: TfrmParamsEditor
  Left = 479
  Top = 105
  BorderStyle = bsDialog
  Caption = 'Params Editor'
  ClientHeight = 314
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbParams: TListBox
    Left = 0
    Top = 0
    Width = 215
    Height = 314
    Align = alClient
    ItemHeight = 13
    Items.Strings = (
      '0 - CD_CARGO'
      '1 - CD_MODULO'
      '2 - CD_ROTINA')
    TabOrder = 0
    OnClick = lbParamsClick
  end
end

inherited frmWalletSelecionaImpostos: TfrmWalletSelecionaImpostos
  BorderIcons = [biSystemMenu]
  Caption = 'Selecionar Impostos'
  ClientHeight = 216
  ClientWidth = 360
  ExplicitWidth = 366
  ExplicitHeight = 244
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Top = 175
    Width = 360
    ParentFont = False
    ExplicitTop = 175
    ExplicitWidth = 360
    inherited btnCancela: TSpeedButton
      Left = 184
      ExplicitLeft = 171
    end
    inherited btnOk: TButton
      Left = 272
      ExplicitLeft = 272
    end
  end
  object rgDestino: TRadioGroup
    Left = 0
    Top = 4
    Width = 360
    Height = 57
    Align = alTop
    Caption = 'Conta Destino'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Indai'#225
      'Cliente')
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 0
  end
  object rgTipo: TRadioGroup
    Left = 0
    Top = 61
    Width = 360
    Height = 114
    Align = alClient
    Caption = 'Tipo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Impostos Federais (II,IPI, PIS,COFINS e Taxa Siscomex)'
      'ICMS'
      'Ambos')
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 57
    ExplicitHeight = 118
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 4
    Align = alTop
    BevelOuter = bvNone
    Color = 16758122
    ParentBackground = False
    TabOrder = 3
  end
end

inherited frmWalletCtx: TfrmWalletCtx
  Caption = 'Busca'
  ClientHeight = 159
  ClientWidth = 394
  ExplicitWidth = 400
  ExplicitHeight = 187
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 118
    Width = 394
    ExplicitTop = 118
    ExplicitWidth = 394
    inherited btnCancela: TSpeedButton
      Left = 218
      ExplicitLeft = 156
    end
    inherited btnOk: TButton
      Left = 306
      ExplicitLeft = 306
    end
  end
  object pnlNome: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 60
    Align = alTop
    TabOrder = 1
    object lblNome: TLabeledEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 0
      OnKeyDown = lblNomeKeyDown
    end
  end
  object pnlCliente: TPanel
    Left = 0
    Top = 60
    Width = 394
    Height = 60
    Align = alTop
    TabOrder = 2
    object lblcnpj: TLabeledEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'CNPJ/CPF'
      TabOrder = 0
      OnKeyDown = lblcnpjKeyDown
    end
  end
end

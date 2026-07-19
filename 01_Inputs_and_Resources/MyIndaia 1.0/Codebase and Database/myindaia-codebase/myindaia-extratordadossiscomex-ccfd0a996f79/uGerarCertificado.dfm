object frmGerarCertificado: TfrmGerarCertificado
  Left = 0
  Top = 0
  Caption = 'Intru'#231#227'o para gerar o certificado'
  ClientHeight = 352
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 500
    Height = 17
    Caption = 
      'Siga os passos para gerar os arquivos .pem e .key do certificado' +
      ' do despachante.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 63
    Width = 341
    Height = 17
    Caption = '1'#186' : Execute o programa OpenSSL pressionando o bot'#227'o: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 128
    Width = 524
    Height = 17
    Caption = 
      '2'#186' : Copiar o texto abaixo, copiar no programa OpenSSL (tela pre' +
      'ta) e pressionar ENTER.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 248
    Width = 528
    Height = 17
    Caption = 
      '4'#186' : Copiar o texto abaixo, copiar no programa OpenSSL (tela pre' +
      'ta)  e pressionar ENTER.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 206
    Width = 418
    Height = 17
    Caption = 
      '3'#186' : Digitar a senha do certificado do despachante e pressionar ' +
      'ENTER.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 82
    Width = 122
    Height = 29
    Caption = 'Abrir o OpenSSL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 830
    Top = 150
    Width = 80
    Height = 29
    Caption = 'Copiar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 830
    Top = 265
    Width = 80
    Height = 29
    Caption = 'Copiar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object edit1: TMemo
    Left = 24
    Top = 148
    Width = 800
    Height = 40
    Lines.Strings = (
      'edit1')
    TabOrder = 3
  end
  object edit2: TMemo
    Left = 24
    Top = 268
    Width = 800
    Height = 40
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 144
    Top = 304
  end
end

object FormGerenciamentoDeProcessos: TFormGerenciamentoDeProcessos
  Left = 212
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Gerenciamento de Processos'
  ClientHeight = 396
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 132
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 92
      Width = 46
      Height = 13
      Caption = 'Pesquisa:'
    end
    object edConsulta: TEdit
      Left = 8
      Top = 108
      Width = 345
      Height = 21
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 809
      Height = 78
      Caption = 'Pesquisar por:'
      TabOrder = 0
      object cbxNumeroProcesso: TCheckBox
        Left = 8
        Top = 20
        Width = 129
        Height = 17
        Caption = 'N'#250'mero do Processo'
        TabOrder = 0
      end
      object cbxReferenciaCliente: TCheckBox
        Left = 148
        Top = 20
        Width = 129
        Height = 17
        Caption = 'Refer'#234'ncia do Cliente'
        TabOrder = 1
      end
      object cbxNFSe: TCheckBox
        Left = 296
        Top = 20
        Width = 73
        Height = 17
        Caption = 'N'#186'. NFS-e'
        TabOrder = 2
      end
      object cbxNotaSenior: TCheckBox
        Left = 388
        Top = 20
        Width = 117
        Height = 17
        Caption = 'N'#186'. Nota no Senior'
        TabOrder = 3
      end
      object cbxNotaWallet: TCheckBox
        Left = 532
        Top = 20
        Width = 117
        Height = 17
        Caption = 'N'#186'. Nota no Wallet'
        TabOrder = 4
      end
      object cbxNumeroConhecimento: TCheckBox
        Left = 672
        Top = 20
        Width = 117
        Height = 17
        Caption = 'N'#186'. Conhecimento'
        TabOrder = 5
      end
      object cbxPagamentos: TCheckBox
        Left = 8
        Top = 52
        Width = 129
        Height = 17
        Caption = 'Pagamentos'
        TabOrder = 6
      end
      object cbxNumerarios: TCheckBox
        Left = 148
        Top = 52
        Width = 129
        Height = 17
        Caption = 'Numer'#225'rios'
        TabOrder = 7
      end
    end
    object Button1: TButton
      Left = 360
      Top = 106
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 361
    Width = 831
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      831
      35)
    object Button2: TButton
      Left = 747
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 662
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Numer'#225'rios'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 580
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Faturamento'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 132
    Width = 831
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 8
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 815
      Height = 213
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = dmdGerenciamentoProcessos.qryListaProcessos
    Left = 384
    Top = 180
  end
end

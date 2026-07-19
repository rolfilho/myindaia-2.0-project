object frmPreferencia: TfrmPreferencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 532
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 491
    Width = 456
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 293
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 375
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 456
    Height = 491
    ActivePage = tsGR
    Align = alClient
    TabOrder = 1
    object tsGR: TTabSheet
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 369
        Width = 96
        Height = 13
        Caption = 'Consulta - Terceiros'
      end
      object Label2: TLabel
        Left = 8
        Top = 300
        Width = 83
        Height = 13
        Caption = 'Consulta - Broker'
      end
      object Label3: TLabel
        Left = 8
        Top = 442
        Width = 78
        Height = 13
        Caption = #218'ltima Consulta:'
      end
      object Label4: TLabel
        Left = 8
        Top = 141
        Width = 95
        Height = 13
        Caption = 'Hor'#225'rio de Consulta'
      end
      object Label5: TLabel
        Left = 8
        Top = 160
        Width = 25
        Height = 13
        Caption = 'Inicio'
      end
      object Label6: TLabel
        Left = 71
        Top = 160
        Width = 16
        Height = 13
        Caption = 'Fim'
      end
      object leSenha: TLabeledEdit
        Left = 152
        Top = 63
        Width = 175
        Height = 21
        EditLabel.Width = 34
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha:'
        PasswordChar = '*'
        TabOrder = 3
      end
      object leBanco: TLabeledEdit
        Left = 152
        Top = 24
        Width = 175
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Banco:'
        TabOrder = 1
      end
      object leServidor: TLabeledEdit
        Left = 8
        Top = 24
        Width = 137
        Height = 21
        EditLabel.Width = 107
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o do Servidor:'
        TabOrder = 0
      end
      object leUsuario: TLabeledEdit
        Left = 8
        Top = 63
        Width = 137
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio:'
        TabOrder = 2
      end
      object btTestarGR: TBitBtn
        Left = 331
        Top = 61
        Width = 67
        Height = 25
        Caption = 'Testar'
        TabOrder = 4
        OnClick = btTestarGRClick
      end
      object leIntevalo: TLabeledEdit
        Left = 8
        Top = 111
        Width = 97
        Height = 21
        EditLabel.Width = 93
        EditLabel.Height = 13
        EditLabel.Caption = 'Intervalo Consulta:'
        TabOrder = 5
      end
      object leIndiceCertificado: TLabeledEdit
        Left = 128
        Top = 111
        Width = 106
        Height = 21
        EditLabel.Width = 103
        EditLabel.Height = 13
        EditLabel.Caption = 'Indice do Certificado:'
        TabOrder = 6
      end
      object lblUrl: TLabeledEdit
        Left = 8
        Top = 222
        Width = 390
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'URL Principal'
        TabOrder = 7
      end
      object lblPosicaoAtual: TLabeledEdit
        Left = 151
        Top = 335
        Width = 97
        Height = 21
        EditLabel.Width = 95
        EditLabel.Height = 13
        EditLabel.Caption = 'Posi'#231#227'o Atual (Fila):'
        TabOrder = 9
      end
      object lblProcessoAtual: TLabeledEdit
        Left = 8
        Top = 335
        Width = 125
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = 'Processo Atual:'
        TabOrder = 8
      end
      object lblEmailValidacao: TLabeledEdit
        Left = 8
        Top = 270
        Width = 390
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'E-mail - Valida'#231#227'o'
        TabOrder = 10
      end
      object lblCNPJAtual: TLabeledEdit
        Left = 8
        Top = 404
        Width = 125
        Height = 21
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'CNPJ Atual'
        TabOrder = 11
      end
      object lblPosicaoCNPJAtual: TLabeledEdit
        Left = 151
        Top = 404
        Width = 97
        Height = 21
        EditLabel.Width = 92
        EditLabel.Height = 13
        EditLabel.Caption = 'Posi'#231#227'o CNPJ Atual'
        TabOrder = 12
      end
      object chbAtivoBroker: TCheckBox
        Left = 272
        Top = 337
        Width = 97
        Height = 17
        Caption = 'Ativo'
        TabOrder = 13
      end
      object chbAtivoTerceiros: TCheckBox
        Left = 272
        Top = 405
        Width = 97
        Height = 17
        Caption = 'Ativo'
        TabOrder = 14
      end
      object edtUltimaConsulta: TEdit
        Left = 96
        Top = 439
        Width = 121
        Height = 21
        TabOrder = 15
      end
      object mskHoraInicial: TMaskEdit
        Left = 8
        Top = 176
        Width = 51
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 16
        Text = '  :  '
      end
      object mskHoraFinal: TMaskEdit
        Left = 71
        Top = 176
        Width = 51
        Height = 21
        EditMask = '!90:00;1;_'
        MaxLength = 5
        TabOrder = 17
        Text = '  :  '
      end
      object rgPeriodo: TRadioGroup
        Left = 128
        Top = 138
        Width = 313
        Height = 59
        Caption = 'Per'#237'odo de Consulta - Broker'
        Items.Strings = (
          'Dt Inicial = Evento 161 -2   e   Dt Final  = Evento 161 + 25'
          'Dt Inicial = Evento 161 -7   e   Dt Final  = Evento 161 + 2')
        TabOrder = 18
      end
    end
  end
end

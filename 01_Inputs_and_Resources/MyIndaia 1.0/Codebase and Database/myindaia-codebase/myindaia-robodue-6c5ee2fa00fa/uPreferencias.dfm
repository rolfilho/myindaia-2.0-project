object frmPreferencia: TfrmPreferencia
  Left = 0
  Top = 0
  Caption = 'Prefer'#234'ncias'
  ClientHeight = 291
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 250
    Width = 415
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 376
    object BitBtn1: TBitBtn
      Left = 234
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 316
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
    Width = 415
    Height = 250
    ActivePage = tsGR
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 376
    object tsGR: TTabSheet
      ImageIndex = 1
      ExplicitHeight = 348
      object leSenha: TLabeledEdit
        Left = 135
        Top = 63
        Width = 121
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
        Width = 121
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio:'
        TabOrder = 2
      end
      object btTestarGR: TBitBtn
        Left = 262
        Top = 61
        Width = 75
        Height = 25
        Caption = 'Testar'
        TabOrder = 4
        OnClick = btTestarGRClick
      end
      object leIntevalo: TLabeledEdit
        Left = 135
        Top = 111
        Width = 121
        Height = 21
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = 'Intervalo:'
        TabOrder = 5
      end
      object edtPosicaoConsulta: TLabeledEdit
        Left = 8
        Top = 167
        Width = 121
        Height = 21
        EditLabel.Width = 94
        EditLabel.Height = 13
        EditLabel.Caption = 'Posi'#231#227'o da consulta'
        TabOrder = 6
      end
      object edtUltimoProcesso: TLabeledEdit
        Left = 135
        Top = 167
        Width = 121
        Height = 21
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = #218'ltimo Processo'
        TabOrder = 7
      end
      object edtConsultasPorLote: TLabeledEdit
        Left = 8
        Top = 111
        Width = 121
        Height = 21
        EditLabel.Width = 119
        EditLabel.Height = 13
        EditLabel.Caption = 'Consultas por Lote (Qtd)'
        TabOrder = 8
      end
      object edtCdDespachante: TLabeledEdit
        Left = 262
        Top = 167
        Width = 121
        Height = 21
        EditLabel.Width = 95
        EditLabel.Height = 13
        EditLabel.Caption = #218'ltimo Despachante'
        TabOrder = 9
      end
    end
  end
end

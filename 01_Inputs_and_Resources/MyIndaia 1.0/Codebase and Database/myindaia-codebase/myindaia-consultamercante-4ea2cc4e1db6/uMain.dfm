object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Consulta Mercante'
  ClientHeight = 380
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 52
    Align = alTop
    TabOrder = 0
    DesignSize = (
      730
      52)
    object Label1: TLabel
      Left = 246
      Top = 4
      Width = 71
      Height = 13
      Caption = 'dias anteriores'
    end
    object Label2: TLabel
      Left = 253
      Top = 18
      Width = 68
      Height = 13
      Caption = 'Data inclus'#227'o:'
    end
    object lblDataInclusao: TLabel
      Left = 327
      Top = 18
      Width = 60
      Height = 13
      Caption = 'dd/mm/yyyy'
    end
    object btnBroker: TButton
      Left = 113
      Top = 4
      Width = 97
      Height = 25
      Caption = '&Broker'
      TabOrder = 1
      OnClick = btnBrokerClick
    end
    object btnSettings: TButton
      Left = 555
      Top = 4
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Prefer'#234'ncias'
      TabOrder = 2
      OnClick = btnSettingsClick
    end
    object btnFechar: TButton
      Left = 643
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
    end
    object cbxValidar: TCheckBox
      Left = 668
      Top = 31
      Width = 56
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Validar'
      TabOrder = 4
    end
    object btnTerceiros: TButton
      Left = 6
      Top = 4
      Width = 97
      Height = 25
      Caption = '&Terceiros'
      TabOrder = 0
      OnClick = btnTerceirosClick
    end
    object chbTerceiros: TCheckBox
      Left = 13
      Top = 8
      Width = 14
      Height = 17
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object chbBroker: TCheckBox
      Left = 119
      Top = 8
      Width = 14
      Height = 17
      TabOrder = 6
    end
    object edtDiasAnteriores: TEdit
      Left = 216
      Top = 6
      Width = 27
      Height = 21
      TabOrder = 7
      Text = '1'
      OnChange = edtDiasAnterioresChange
    end
    object cbxPorNrMercante: TCheckBox
      Left = 119
      Top = 31
      Width = 204
      Height = 17
      Caption = 'Consulta por n'#250'mero Mercante'
      TabOrder = 8
      Visible = False
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 361
    Width = 730
    Height = 19
    Panels = <
      item
        Text = 'Pr'#243'xima itera'#231#227'o'
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 200
      end
      item
        Text = 'Servidor'
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object Memo: TMemo
    Left = 0
    Top = 52
    Width = 730
    Height = 309
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 2
    OnChange = MemoChange
  end
  object tmrIntegracao: TTimer
    OnTimer = tmrIntegracaoTimer
    Left = 32
    Top = 56
  end
  object tmrErroWeb2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrErroWebTimer
    Left = 32
    Top = 200
  end
  object tmrImprimir: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmrImprimirTimer
    Left = 32
    Top = 128
  end
  object tmrSalvar: TTimer
    Enabled = False
    OnTimer = tmrSalvarTimer
    Left = 120
    Top = 128
  end
  object MadExceptionHandler1: TMadExceptionHandler
    OnExceptAction = MadExceptionHandler1ExceptAction
    Left = 208
    Top = 72
  end
  object tmrCertificado: TTimer
    Enabled = False
    OnTimer = tmrCertificadoTimer
    Left = 120
    Top = 56
  end
  object tmrConexao: TTimer
    Enabled = False
    OnTimer = tmrConexaoTimer
    Left = 120
    Top = 200
  end
  object tmrPaginaTravada: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tmrPaginaTravadaTimer
    Left = 208
    Top = 200
  end
end

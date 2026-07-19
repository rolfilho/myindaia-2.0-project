object frm_integracao_abertura_processo_nestle_Lean: Tfrm_integracao_abertura_processo_nestle_Lean
  Left = 777
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 378
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 378
    Align = alClient
    BevelInner = bvLowered
    Caption = 'eed();'
    TabOrder = 0
    DesignSize = (
      514
      378)
    object shpTitulo: TShape
      Left = 8
      Top = 10
      Width = 497
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lblTitulo: TLabel
      Left = 16
      Top = 15
      Width = 394
      Height = 16
      Caption = 'Integra'#231#227'o de Planilha para Abertura de Processos Lean'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblArquivoLog: TLabel
      Left = 13
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Arquivo log: '
    end
    object btnIntegrarPlanilha: TButton
      Left = 11
      Top = 342
      Width = 100
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Integrar Planilha'
      TabOrder = 0
      OnClick = btnIntegrarPlanilhaClick
    end
    object btn_fechar: TButton
      Left = 402
      Top = 342
      Width = 100
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 1
      OnClick = btn_fecharClick
    end
    object Memo1: TMemo
      Left = 11
      Top = 64
      Width = 494
      Height = 270
      Anchors = [akLeft, akTop, akBottom]
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 88
  end
end

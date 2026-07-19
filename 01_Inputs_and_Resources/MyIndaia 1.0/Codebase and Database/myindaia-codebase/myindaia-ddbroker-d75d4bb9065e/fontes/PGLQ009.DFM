object frm_imp_cheque_branco_baixado: Tfrm_imp_cheque_branco_baixado
  Left = 200
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Impressão de Cheques em Branco Baixados'
  ClientHeight = 138
  ClientWidth = 399
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 81
    Height = 13
    Caption = 'Data da Baixa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mskedt_dt_baixa: TMaskEdit
    Left = 40
    Top = 48
    Width = 105
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    OnExit = mskedt_dt_baixaExit
  end
  object btn_iniciar: TButton
    Left = 112
    Top = 97
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 1
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 220
    Top = 97
    Width = 75
    Height = 25
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object Crp_Cheque_Brancos_Baixados: TCrpe
    ReportName = 'C:\PROG\GSM\CRLQ009.rpt'
    LoadEngineOnUse = False
    Left = 264
    Top = 16
  end
end

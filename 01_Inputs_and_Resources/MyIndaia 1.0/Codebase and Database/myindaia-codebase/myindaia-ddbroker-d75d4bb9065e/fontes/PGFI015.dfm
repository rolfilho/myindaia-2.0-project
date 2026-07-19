object frm_financeiro_fech_data: Tfrm_financeiro_fech_data
  Left = 308
  Top = 265
  Width = 371
  Height = 166
  BorderIcons = [biSystemMenu]
  Caption = 'Fechamento/Reabertura do Movimento Financeiro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 345
    Height = 121
    BevelOuter = bvLowered
    TabOrder = 0
    object lbl_periodo: TLabel
      Left = 11
      Top = 18
      Width = 120
      Height = 13
      Caption = 'Selecione o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_a: TLabel
      Left = 236
      Top = 19
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msk_dt_inicio: TMaskEdit
      Left = 145
      Top = 11
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = msk_dt_inicioEnter
      OnExit = msk_dt_inicioExit
    end
    object msk_dt_fim: TMaskEdit
      Left = 257
      Top = 11
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = msk_dt_fimEnter
      OnExit = msk_dt_fimExit
    end
    object btn_sair: TButton
      Left = 259
      Top = 84
      Width = 71
      Height = 26
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 3
      OnClick = btn_sairClick
    end
    object btn_ok: TButton
      Left = 175
      Top = 85
      Width = 71
      Height = 25
      Caption = '&OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn_okClick
    end
  end
end

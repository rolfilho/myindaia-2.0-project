object frm_livro_iss: Tfrm_livro_iss
  Left = 235
  Top = 338
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Livro Fiscal'
  ClientHeight = 204
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_cd_unid_neg: TLabel
    Left = 16
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_cd_unid_neg: TSpeedButton
    Left = 245
    Top = 32
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      555555555555555555555555555555555555555FFFFFFFFFF555550000000000
      55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
      B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
      000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
      555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
      55555575FFF75555555555700007555555555557777555555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = btn_cd_unid_negClick
  end
  object lbl_mes_ano: TLabel
    Left = 16
    Top = 64
    Width = 52
    Height = 13
    Caption = 'M'#234's/Ano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 112
    Width = 107
    Height = 13
    Caption = 'Data de Impress'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_folha: TLabel
    Left = 112
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Folha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label1: TLabel
    Left = 272
    Top = 112
    Width = 90
    Height = 13
    Caption = 'N'#186' Nota p/ Arq.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 16
    Top = 32
    Width = 26
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 0
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 45
    Top = 32
    Width = 197
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 8
  end
  object msk_mes_ano: TMaskEdit
    Left = 16
    Top = 80
    Width = 57
    Height = 21
    EditMask = '!99/9999;1;_'
    MaxLength = 7
    TabOrder = 1
    Text = '  /    '
  end
  object OKBtn: TButton
    Left = 118
    Top = 171
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 6
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 198
    Top = 171
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
  end
  object cbo_folha: TComboBox
    Left = 112
    Top = 80
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Visible = False
    Items.Strings = (
      'Abertura'
      'Encerramento')
  end
  object msk_dt_impressao: TDateEdit
    Left = 16
    Top = 128
    Width = 92
    Height = 21
    DialogTitle = 'Selecione uma Data'
    NumGlyphs = 2
    TabOrder = 3
  end
  object chkGeraArquivo: TCheckBox
    Left = 124
    Top = 130
    Width = 129
    Height = 17
    Caption = 'Gera Arquivo GISS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object msk_nr_nota: TMaskEdit
    Left = 272
    Top = 128
    Width = 65
    Height = 21
    EditMask = '999999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 5
    OnExit = msk_nr_notaExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object Crp_pagto_ISS: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 328
    Top = 24
  end
end

object frm_AtualizaSISCOMEX: Tfrm_AtualizaSISCOMEX
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Caption = 'Atualiza'#231#227'o de Tabelas SISCOMEX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl_mensagem: TBevel
    Left = 8
    Top = 376
    Width = 617
    Height = 37
  end
  object Bevel2: TBevel
    Left = 8
    Top = 8
    Width = 405
    Height = 357
  end
  object lbl_box_mensagem: TLabel
    Left = 12
    Top = 369
    Width = 77
    Height = 13
    Caption = '[ Mensagem ]'
  end
  object Bevel1: TBevel
    Left = 416
    Top = 8
    Width = 209
    Height = 357
  end
  object lbl_mensagem: TLabel
    Left = 16
    Top = 388
    Width = 601
    Height = 17
    AutoSize = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object Lista_tabelas: TCheckListBox
    Left = 18
    Top = 23
    Width = 384
    Height = 252
    BorderStyle = bsNone
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 18
    Items.Strings = (
      'Acr'#233'scimos'
      'Aladi'
      'Atividade Econ'#244'mica'
      'Atributos'
      'Cap'#237'tulo'
      'Dedu'#231#245'es'
      'Documentos para Instru'#231#227'o de Embarque'
      'Embalagens'
      'Especifica'#231#245'es'
      'Fundamento Legal'
      'Fundamento Legal PIS/COFINS'
      'Incoterms'
      'Institui'#231#227'o Financiadora Internacional'
      'M'#233'todo de Valora'#231#227'o Aduaneira'
      'Modalidade de Pagamento (C'#226'mbio)'
      'Moedas'
      'Motivo de Admiss'#227'o Tempor'#225'ria'
      'Motivo sem cobertura Cambial'
      'NALADI/NCCA'
      'NALADI/SH'
      'NCM/SH'
      'N'#237'vel NVE'
      'Org'#227'o emissor'
      #211'rg'#227'os anuentes'
      'Paises'
      'Recinto Alfandegado'
      'Recinto Alfandegado x Setores'
      'Recipiente'
      'Regime Tribut'#225'rio'
      'Secex'
      'Taxa de C'#226'mbio'
      'Taxa de C'#226'mbio - HIST'
      'Tipo de Ato Legal'
      'Tipo de Declara'#231#227'o'
      'Unidade de Medida'
      'Unidades da Receita Federal')
    ParentCtl3D = False
    ParentFont = False
    Sorted = True
    Style = lbOwnerDrawFixed
    TabOrder = 0
    OnClick = Lista_tabelasClick
  end
  object rgrp_opcao: TRadioGroup
    Left = 428
    Top = 18
    Width = 185
    Height = 63
    Caption = '[ Op'#231#245'es ]'
    ItemIndex = 1
    Items.Strings = (
      'Todas'
      'Espec'#237'fica')
    TabOrder = 1
    OnClick = rgrp_opcaoClick
  end
  object btn_atualizar: TButton
    Left = 382
    Top = 423
    Width = 75
    Height = 25
    Caption = '&Atualizar'
    Default = True
    Enabled = False
    TabOrder = 2
    OnClick = btn_atualizarClick
  end
  object btn_cancelar: TButton
    Left = 466
    Top = 423
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    Enabled = False
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object gbox_monitor: TGroupBox
    Left = 428
    Top = 168
    Width = 185
    Height = 177
    Caption = '[ Monitor ]'
    TabOrder = 5
    object lbl_tabelas: TLabel
      Left = 39
      Top = 28
      Width = 50
      Height = 13
      Caption = 'Tabelas:'
    end
    object lbl_registros: TLabel
      Left = 31
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Registros:'
    end
    object lsl_Insercoes: TLabel
      Left = 29
      Top = 104
      Width = 60
      Height = 13
      Caption = 'Inser'#231#245'es:'
    end
    object lbl_atualizacoes: TLabel
      Left = 12
      Top = 140
      Width = 77
      Height = 13
      Caption = 'Atualiza'#231#245'es:'
    end
    object lbl_nr_tabelas: TLabel
      Left = 95
      Top = 28
      Width = 8
      Height = 13
      Caption = '0'
    end
    object lbl_nr_registros: TLabel
      Left = 95
      Top = 64
      Width = 8
      Height = 13
      Caption = '0'
    end
    object lbl_nr_insercoes: TLabel
      Left = 95
      Top = 104
      Width = 8
      Height = 13
      Caption = '0'
    end
    object lbl_nr_atualizacoes: TLabel
      Left = 95
      Top = 140
      Width = 8
      Height = 13
      Caption = '0'
    end
  end
  object btn_fechar: TButton
    Left = 550
    Top = 423
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    TabOrder = 4
    OnClick = btn_fecharClick
  end
  object chkBox_limpar: TCheckBox
    Left = 428
    Top = 92
    Width = 185
    Height = 17
    Caption = 'Limpar previamente a tabela'
    TabOrder = 6
    OnClick = chkBox_limparClick
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 419
    Width = 363
    Height = 30
    TabOrder = 7
  end
end

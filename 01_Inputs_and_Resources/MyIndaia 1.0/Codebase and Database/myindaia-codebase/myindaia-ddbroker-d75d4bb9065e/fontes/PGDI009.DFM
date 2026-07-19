object frm_contrato_cambio_avista: Tfrm_contrato_cambio_avista
  Left = 206
  Top = 139
  Width = 440
  Height = 274
  BorderIcons = []
  Caption = 'Contrato de Câmbio'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl_contato: TBevel
    Left = 8
    Top = 8
    Width = 417
    Height = 205
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 70
    Top = 45
    Width = 144
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Moeda Nacional'
  end
  object Label2: TLabel
    Left = 70
    Top = 67
    Width = 144
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Nº Contrato'
    FocusControl = EditNR_OP_CAMBIO
  end
  object Label3: TLabel
    Left = 70
    Top = 89
    Width = 144
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Banco'
    FocusControl = EditCD_BANCO_PAGAMENTO
  end
  object Label4: TLabel
    Left = 70
    Top = 111
    Width = 144
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Praça'
    FocusControl = EditCD_PRACA_PAGAMENTO
  end
  object Label5: TLabel
    Left = 70
    Top = 133
    Width = 144
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Valor vinculado'
    FocusControl = EditVL_VINC_MD_CAMBIO
  end
  object Label6: TLabel
    Left = 16
    Top = 171
    Width = 198
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Comprador da Moeda Estrangeira'
    FocusControl = EditNR_COMPR_CAMBIO
  end
  object btn_salvar: TButton
    Left = 131
    Top = 220
    Width = 73
    Height = 21
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 6
    OnClick = btn_salvarClick
  end
  object btn_cancelar: TButton
    Left = 227
    Top = 220
    Width = 73
    Height = 21
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
    OnClick = btn_cancelarClick
  end
  object EditNR_OP_CAMBIO: TDBEdit
    Left = 220
    Top = 64
    Width = 97
    Height = 21
    DataField = 'NR_OP_CAMBIO'
    DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
    MaxLength = 8
    TabOrder = 1
    OnChange = dblkpcbox_moeda_nacClick
  end
  object EditCD_BANCO_PAGAMENTO: TDBEdit
    Left = 220
    Top = 86
    Width = 49
    Height = 21
    DataField = 'CD_BANCO_PAGAMENTO'
    DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
    MaxLength = 5
    TabOrder = 2
    OnChange = dblkpcbox_moeda_nacClick
  end
  object EditCD_PRACA_PAGAMENTO: TDBEdit
    Left = 220
    Top = 108
    Width = 41
    Height = 21
    DataField = 'CD_PRACA_PAGAMENTO'
    DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
    MaxLength = 4
    TabOrder = 3
    OnChange = dblkpcbox_moeda_nacClick
  end
  object EditVL_VINC_MD_CAMBIO: TDBEdit
    Left = 220
    Top = 130
    Width = 137
    Height = 21
    DataField = 'VL_VINC_MD_CAMBIO'
    DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
    TabOrder = 4
    OnChange = dblkpcbox_moeda_nacClick
  end
  object EditNR_COMPR_CAMBIO: TDBEdit
    Left = 220
    Top = 168
    Width = 137
    Height = 21
    DataField = 'NR_COMPR_CAMBIO'
    DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
    MaxLength = 14
    TabOrder = 5
    OnChange = dblkpcbox_moeda_nacClick
    OnExit = EditNR_COMPR_CAMBIOExit
  end
  object dblkpcbox_moeda_nac: TDBLookupComboBox
    Left = 220
    Top = 40
    Width = 57
    Height = 21
    DataField = 'IN_PAGAMENTO_MN'
    DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
    KeyField = 'CD_YESNO'
    ListField = 'TX_YESNO'
    ListSource = datm_DI_Adicao.ds_yesno
    TabOrder = 0
    OnClick = dblkpcbox_moeda_nacClick
  end
end

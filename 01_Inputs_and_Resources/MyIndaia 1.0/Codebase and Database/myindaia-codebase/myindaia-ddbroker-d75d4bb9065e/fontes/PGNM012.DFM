object frm_receb_nao_solic_lanc: Tfrm_receb_nao_solic_lanc
  Left = 131
  Top = 246
  Width = 467
  Height = 209
  BorderIcons = [biSystemMenu]
  Caption = 'Lançamento de Recebimentos'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 4
    Width = 449
    Height = 145
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 23
    Top = 20
    Width = 75
    Height = 13
    Alignment = taRightJustify
    Caption = 'Recebimento'
  end
  object Label2: TLabel
    Left = 61
    Top = 96
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Banco'
  end
  object Label3: TLabel
    Left = 68
    Top = 64
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor'
  end
  object btn_gravar: TButton
    Left = 117
    Top = 156
    Width = 65
    Height = 21
    Caption = '&Gravar'
    Enabled = False
    TabOrder = 3
    OnClick = btn_gravarClick
  end
  object dbedt_nr_recebimento: TDBEdit
    Left = 108
    Top = 16
    Width = 41
    Height = 21
    TabStop = False
    Color = clMenu
    DataField = 'NR_RECEBIMENTO'
    DataSource = datm_receb_num_nao_solic.ds_recebimento
    TabOrder = 5
  end
  object dbedt_vl_recebimento: TDBEdit
    Left = 108
    Top = 60
    Width = 121
    Height = 21
    DataField = 'VL_RECEBIMENTO'
    DataSource = datm_receb_num_nao_solic.ds_recebimento
    TabOrder = 0
    OnChange = dbedt_vl_recebimentoChange
  end
  object dbcbox_cd_banco: TDBLookupComboBox
    Left = 108
    Top = 92
    Width = 53
    Height = 21
    DataField = 'CD_BANCO'
    DataSource = datm_receb_num_nao_solic.ds_recebimento
    DropDownWidth = 157
    KeyField = 'CD_BANCO'
    ListField = 'CD_BANCO;AP_BANCO'
    ListSource = datm_receb_num_nao_solic.ds_banco
    TabOrder = 1
    OnClick = dbedt_vl_recebimentoChange
  end
  object dbcbox_nm_banco: TDBLookupComboBox
    Left = 164
    Top = 92
    Width = 205
    Height = 21
    Color = clMenu
    DataField = 'CD_BANCO'
    DataSource = datm_receb_num_nao_solic.ds_recebimento
    DropDownWidth = 157
    KeyField = 'CD_BANCO'
    ListField = 'AP_BANCO;CD_BANCO'
    ListSource = datm_receb_num_nao_solic.ds_banco
    TabOrder = 2
    TabStop = False
    OnClick = dbedt_vl_recebimentoChange
  end
  object btn_cancelar: TButton
    Left = 277
    Top = 156
    Width = 65
    Height = 21
    Caption = '&Cancela'
    TabOrder = 4
    OnClick = btn_cancelarClick
  end
end

object frm_devolucao_lanc: Tfrm_devolucao_lanc
  Left = 249
  Top = 235
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Lançamento'
  ClientHeight = 223
  ClientWidth = 479
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 465
    Height = 181
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 25
    Top = 32
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Lançamento'
  end
  object Label2: TLabel
    Left = 70
    Top = 72
    Width = 25
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Item'
  end
  object Label3: TLabel
    Left = 60
    Top = 144
    Width = 35
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Valor'
    FocusControl = dbedt_vl_recebido
  end
  object Label4: TLabel
    Left = 24
    Top = 108
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Saldo (R-U)'
    FocusControl = DBEdit1
  end
  object btn_salvar: TButton
    Left = 133
    Top = 196
    Width = 73
    Height = 21
    Caption = '&Salvar'
    Enabled = False
    TabOrder = 0
    OnClick = btn_salvarClick
  end
  object btn_cancelar: TButton
    Left = 273
    Top = 196
    Width = 73
    Height = 21
    Caption = '&Cancelar'
    TabOrder = 1
    OnClick = btn_cancelarClick
  end
  object dbedt_nr_item: TDBEdit
    Left = 108
    Top = 28
    Width = 30
    Height = 21
    TabStop = False
    Color = clMenu
    DataField = 'NR_LANC_DEVOL'
    DataSource = datm_devolucao.dsq_itens_devolucao
    ReadOnly = True
    TabOrder = 2
  end
  object dbedt_vl_recebido: TDBEdit
    Left = 108
    Top = 140
    Width = 89
    Height = 21
    DataField = 'VL_DEVOLVIDO'
    DataSource = datm_devolucao.dsq_itens_devolucao
    TabOrder = 3
    OnExit = dbedt_vl_recebidoExit
  end
  object edt_cd_item: TEdit
    Left = 108
    Top = 68
    Width = 33
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
  object edt_nm_item: TEdit
    Left = 144
    Top = 68
    Width = 241
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit1: TDBEdit
    Left = 108
    Top = 104
    Width = 89
    Height = 21
    TabStop = False
    Color = clMenu
    DataField = 'Look_vl_Saldo'
    DataSource = frm_devolucao_itens.dsq_itens_solinum
    ReadOnly = True
    TabOrder = 6
  end
  object sp_proc_item_devolucao_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'dbo.sp_proc_devolucao_itens;1'
    Params.Data = {
      0100040006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000D406E725F6465766F6C7563616F0101020030000000
      0E406E725F6C616E635F6465766F6C0101020030000000}
    Left = 436
    Top = 16
  end
end

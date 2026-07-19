object frm_receb_num_registro: Tfrm_receb_num_registro
  Left = 330
  Top = 256
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
  OnClose = FormClose
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
    DataSource = datm_receb_num_solic.ds_recebimento
    TabOrder = 4
  end
  object dbedt_vl_recebimento: TDBEdit
    Left = 108
    Top = 60
    Width = 121
    Height = 21
    DataField = 'VL_RECEBIMENTO'
    DataSource = datm_receb_num_solic.ds_recebimento
    TabOrder = 0
    OnChange = dbedt_vl_recebimentoChange
  end
  object dbcbox_cd_banco: TDBLookupComboBox
    Left = 108
    Top = 92
    Width = 53
    Height = 21
    DataField = 'CD_BANCO'
    DataSource = datm_receb_num_solic.ds_recebimento
    DropDownWidth = 157
    KeyField = 'CD_BANCO'
    ListField = 'CD_BANCO;AP_BANCO'
    ListSource = datm_receb_num_solic.ds_banco
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
    DataSource = datm_receb_num_solic.ds_recebimento
    DropDownWidth = 157
    KeyField = 'CD_BANCO'
    ListField = 'AP_BANCO;CD_BANCO'
    ListSource = datm_receb_num_solic.ds_banco
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
    TabOrder = 5
    OnClick = btn_cancelarClick
  end
  object dsq_itens_solinum: TDataSource
    DataSet = qry_itens_solinum_
    Left = 388
    Top = 8
  end
  object qry_itens_solinum_: TQuery
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO , '
      ' NR_LANCAMENTO , CD_ITEM , NR_PRIORIDADE , '
      ' CD_TIPO_CALCULO , TP_SOLIC_INFORM , '
      ' VL_ITEM_CALCULADO , VL_SOLICITADO , '
      ' CD_STATUS , VL_RECEBIDO , VL_UTILIZADO'
      'FROM TNUMERARIO_ITEM_SOLIC TNUMERARIO_ITEM_SOLIC'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      ' CD_STATUS = "A" ')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 420
    Top = 8
    object qry_itens_solinum_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_solinum_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_solinum_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_solinum_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_solinum_NR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PRIORIDADE'
    end
    object qry_itens_solinum_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_solinum_TP_SOLIC_INFORM: TStringField
      FieldName = 'TP_SOLIC_INFORM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.TP_SOLIC_INFORM'
      Size = 3
    end
    object qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
    end
    object qry_itens_solinum_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
    end
    object qry_itens_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_STATUS'
      Size = 1
    end
    object qry_itens_solinum_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_RECEBIDO'
    end
    object qry_itens_solinum_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_UTILIZADO'
    end
  end
end

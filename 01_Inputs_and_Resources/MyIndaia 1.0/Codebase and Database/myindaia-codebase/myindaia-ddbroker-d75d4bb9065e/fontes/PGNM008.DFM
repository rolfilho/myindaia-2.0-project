object frm_receb_num_itens: Tfrm_receb_num_itens
  Left = 100
  Top = 68
  Width = 640
  Height = 478
  ActiveControl = btn_confirma
  BorderIcons = [biSystemMenu]
  Caption = 'Lançamento do Recebimento'
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
    Top = 396
    Width = 621
    Height = 53
  end
  object DBGrid2: TDBGrid
    Left = 4
    Top = 8
    Width = 621
    Height = 385
    Color = clSilver
    DataSource = datm_receb_num_solic.dsq_itens_receb
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'NR_SOLICITACAO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 75
      end
      item
        Alignment = taCenter
        FieldName = 'NR_LANCAMENTO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 58
      end
      item
        Alignment = taCenter
        FieldName = 'Look_nm_item'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 246
      end
      item
        FieldName = 'VL_SOLICITADO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 105
      end
      item
        FieldName = 'VL_RECEBIDO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 98
      end>
  end
  object btn_confirma: TButton
    Left = 21
    Top = 412
    Width = 82
    Height = 21
    Caption = '&Confirmar'
    TabOrder = 1
    OnClick = btn_confirmaClick
  end
  object btn_alterar_item_numerario: TButton
    Left = 184
    Top = 412
    Width = 82
    Height = 21
    Caption = '&Alterar'
    TabOrder = 2
    OnClick = btn_alterar_item_numerarioClick
  end
  object btn_cancelar: TButton
    Left = 525
    Top = 412
    Width = 82
    Height = 21
    Caption = '&Cancela'
    Default = True
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object btn_recombina: TButton
    Left = 276
    Top = 412
    Width = 82
    Height = 21
    Caption = '&Recombinar'
    TabOrder = 4
    OnClick = btn_recombinaClick
  end
  object btn_prioridade: TButton
    Left = 369
    Top = 412
    Width = 82
    Height = 21
    Caption = '&Prioridade'
    TabOrder = 5
    OnClick = btn_prioridadeClick
  end
  object dsq_itens_solinum: TDataSource
    DataSet = qry_itens_solinum_
    Left = 272
    Top = 212
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
      'NR_SOLICITACAO = :NR_SOLICITACAO AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO AND'
      'CD_STATUS = "A"')
    Params.Data = {
      010003000B4E525F50524F434553534F00010200300000000E4E525F534F4C49
      4349544143414F00010200300000000D4E525F4C414E43414D454E544F000102
      0030000000}
    Left = 304
    Top = 212
    object qry_itens_solinum_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_solinum_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Nº Solic.'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_solinum_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_solinum_CD_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_solinum_NR_PRIORIDADE: TIntegerField
      DisplayLabel = 'Prioridade'
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PRIORIDADE'
    end
    object qry_itens_solinum_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_solinum_TP_SOLIC_INFORM: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TP_SOLIC_INFORM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.TP_SOLIC_INFORM'
      Size = 3
    end
    object qry_itens_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField
      DisplayLabel = 'Calculado'
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
    end
    object qry_itens_solinum_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
    end
    object qry_itens_solinum_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_RECEBIDO'
    end
    object qry_itens_solinum_VL_UTILIZADO: TFloatField
      DisplayLabel = 'Utilizado'
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_UTILIZADO'
    end
  end
end

object frm_info_novoex: Tfrm_info_novoex
  Left = 338
  Top = 143
  BorderStyle = bsDialog
  Caption = 'RE Itens - Controle '
  ClientHeight = 291
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 3
    Top = 275
    Width = 347
    Height = 13
    Caption = 
      '(Desmarque os itens que n'#227'o dever'#227'o aparecer no Certificado de O' +
      'rigem)'
  end
  object cxgREItens: TcxGrid
    Left = 0
    Top = 0
    Width = 742
    Height = 273
    Align = alTop
    TabOrder = 0
    object cxgREItensDBTableView1: TcxGridDBTableView
      DataController.DataSource = datm_info_novoex.dsREitensNovoEx
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
      object cxgREItensIN_CO: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ImmediatePost = True
        Properties.ReadOnly = False
        Width = 20
        DataBinding.FieldName = 'IN_ITEM_CO'
        IsCaptionAssigned = True
      end
      object cxgREItensNR_RE: TcxGridDBColumn
        Caption = 'RE'
        PropertiesClassName = 'TcxLabelProperties'
        SortOrder = soAscending
        Width = 88
        DataBinding.FieldName = 'NR_RE'
      end
      object cxgREItensNR_NCM: TcxGridDBColumn
        Caption = 'NCM'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 78
        DataBinding.FieldName = 'NR_NCM'
      end
      object cxgREItensTX_ENQUADRAMENTO: TcxGridDBColumn
        Caption = 'Enquadramento'
        Width = 204
        DataBinding.FieldName = 'TX_ENQUADRAMENTO'
      end
      object cxgREItensTX_MERCADORIA: TcxGridDBColumn
        Caption = 'Mercadoria'
        Width = 335
        DataBinding.FieldName = 'TX_MERCADORIA'
      end
      object cxgREItensVL_COND_VENDA: TcxGridDBColumn
        Caption = 'Valor Condi'#231#227'o Venda'
        Width = 128
        DataBinding.FieldName = 'VL_COND_VENDA'
      end
      object cxgREItensVL_LOCAL_EMB: TcxGridDBColumn
        Caption = 'Valor Local Embarque'
        Width = 126
        DataBinding.FieldName = 'VL_LOCAL_EMB'
      end
      object cxgREItensQT_UNID_COMERC: TcxGridDBColumn
        Caption = 'Qtde. (Unidade Comercial)'
        Width = 146
        DataBinding.FieldName = 'QT_UNID_COMERC'
      end
      object cxgREItensTX_UNID_COMERC: TcxGridDBColumn
        Caption = 'Unidade Comercial'
        Width = 111
        DataBinding.FieldName = 'TX_UNID_COMERC'
      end
      object cxgREItensQT_UNID_ESTAT: TcxGridDBColumn
        Caption = 'Qtde. (Unidade Estat'#237'stica)'
        Width = 150
        DataBinding.FieldName = 'QT_UNID_ESTAT'
      end
      object cxgREItensTX_UNID_ESTAT: TcxGridDBColumn
        Caption = 'Unidade Estat'#237'stica'
        Width = 115
        DataBinding.FieldName = 'TX_UNID_ESTAT'
      end
      object cxgREItensQT_PESO_LIQ: TcxGridDBColumn
        Caption = 'Peso L'#237'quido'
        Width = 101
        DataBinding.FieldName = 'QT_PESO_LIQ'
      end
    end
    object cxgREItensLevel1: TcxGridLevel
      GridView = cxgREItensDBTableView1
    end
  end
end

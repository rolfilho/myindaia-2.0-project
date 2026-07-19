object frm_co_novoex: Tfrm_co_novoex
  Left = 348
  Top = 201
  Width = 750
  Height = 344
  Caption = 'RE Itens - Certificado de Origem'
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
  object cxgREItens: TcxGrid
    Left = 0
    Top = 0
    Width = 742
    Height = 288
    Align = alClient
    PopupMenu = pmREs
    TabOrder = 0
    object cxgREItensDBTableView1: TcxGridDBTableView
      DataController.DataSource = datm_co_novoex.dsREsNovoEx
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
      object cxgREsIN_RE_CO: TcxGridDBColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ImmediatePost = True
        Width = 22
        DataBinding.FieldName = 'IN_RE_CO'
        IsCaptionAssigned = True
      end
      object cxgREsNR_RE: TcxGridDBColumn
        Caption = 'RE'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 87
        DataBinding.FieldName = 'NR_RE'
      end
      object cxgREsNM_EMPRESA: TcxGridDBColumn
        Caption = 'Cliente'
        Width = 207
        DataBinding.FieldName = 'NM_EMPRESA'
      end
      object cxgREsCGC_EMPRESA: TcxGridDBColumn
        Caption = 'CNPJ'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 105
        DataBinding.FieldName = 'CGC_EMPRESA'
      end
      object cxgREsNM_EMPRESA2: TcxGridDBColumn
        Caption = 'Importador'
        SortOrder = soAscending
        Width = 167
        DataBinding.FieldName = 'NM_EMPRESA2'
      end
      object cxgREsTX_ENQUADRAMENTO: TcxGridDBColumn
        Caption = 'Enquadramento'
        Width = 137
        DataBinding.FieldName = 'TX_ENQUADRAMENTO'
      end
      object cxgREsNR_NCM: TcxGridDBColumn
        Caption = 'NCM'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 138
        DataBinding.FieldName = 'NR_NCM'
      end
      object cxgREsVL_COND_VENDA: TcxGridDBColumn
        Caption = 'Valor Condi'#231#227'o de Venda'
        DataBinding.FieldName = 'VL_COND_VENDA'
      end
      object cxgREsVL_LOCAL_EMB: TcxGridDBColumn
        Caption = 'Valor Local Embarque'
        DataBinding.FieldName = 'VL_LOCAL_EMB'
      end
      object cxgREsQT_UNID_COMERC: TcxGridDBColumn
        Caption = 'Qtde. (Unidade Comercial)'
        DataBinding.FieldName = 'QT_UNID_COMERC'
      end
      object cxgREsTX_UNID_COMERC: TcxGridDBColumn
        Caption = 'Unidade Comercial'
        DataBinding.FieldName = 'TX_UNID_COMERC'
      end
      object cxgREsQT_UNID_ESTAT: TcxGridDBColumn
        Caption = 'Qtde. (Unidade Estat'#237'stica)'
        DataBinding.FieldName = 'QT_UNID_ESTAT'
      end
      object cxgREsTX_UNID_ESTAT: TcxGridDBColumn
        Caption = 'Unidade Estat'#237'stica'
        DataBinding.FieldName = 'TX_UNID_ESTAT'
      end
      object cxgREsQT_PESO_LIQ: TcxGridDBColumn
        Caption = 'Peso L'#237'quido'
        DataBinding.FieldName = 'QT_PESO_LIQ'
      end
    end
    object cxgREItensLevel1: TcxGridLevel
      GridView = cxgREItensDBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 288
    Width = 742
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      742
      29)
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 306
      Height = 13
      Caption = '(Marque os REs que dever'#227'o aparecer no Certificado de Origem)'
    end
    object btnCO: TBitBtn
      Left = 604
      Top = 3
      Width = 137
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Certificado de Origem'
      TabOrder = 0
      OnClick = btnCOClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
  end
  object pmREs: TPopupMenu
    OnPopup = pmREsPopup
    Left = 704
    Top = 24
    object mi_marcar_todos_REs: TMenuItem
      Caption = 'Marcar todos os itens desta RE'
      OnClick = mi_marcar_todos_REsClick
    end
    object mi_desmarcar_todos_REs: TMenuItem
      Caption = 'Desmarcar todos os itens desta RE'
      OnClick = mi_desmarcar_todos_REsClick
    end
  end
end

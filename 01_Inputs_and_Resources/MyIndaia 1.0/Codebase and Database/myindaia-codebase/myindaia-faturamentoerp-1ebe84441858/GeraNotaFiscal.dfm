object frmGeraNotaFiscal: TfrmGeraNotaFiscal
  Left = 285
  Top = 214
  Caption = 'Gera Nota Fiscal'
  ClientHeight = 405
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object nbTelas: TNotebook
    Left = 0
    Top = 0
    Width = 785
    Height = 303
    Align = alClient
    PageIndex = 1
    TabOrder = 1
    OnPageChanged = nbTelasPageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'Tipo Fatura'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object rdbNotaFiscalServico: TRadioButton
        Left = 40
        Top = 40
        Width = 144
        Height = 17
        Caption = 'Nota Fiscal de Servi'#231'o'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rdbNotaFiscalDespesa: TRadioButton
        Left = 40
        Top = 79
        Width = 148
        Height = 17
        Caption = 'Nota Fiscal de Despesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Itens a Faturar'
      object cxgItensFaturar: TcxGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 303
        Align = alClient
        TabOrder = 0
        object cxgdbtvItensFaturar: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataModeController.GridMode = True
          DataController.DataSource = dtmFaturamentoERP.dsItensFaturar
          DataController.DetailKeyFieldNames = 'Tipo'
          DataController.KeyFieldNames = 'Tipo;id;status;item_id;item_name;Valor'
          DataController.MasterKeyFieldNames = 'Tipo'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnFilteredItemsList = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfAlwaysVisible
          Styles.Header = dtmFaturamentoERP.cxsHeader
          object cxgdbtvItensFaturarSelecionado: TcxGridDBColumn
            DataBinding.FieldName = 'Selecionado'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.OnChange = cxgdbtvItensFaturarSelecionadoPropertiesChange
            Options.Filtering = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 20
            IsCaptionAssigned = True
          end
          object cxgdbtvItensFaturarTipo: TcxGridDBColumn
            DataBinding.FieldName = 'Tipo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 89
          end
          object cxgdbtvItensFaturarparentID: TcxGridDBColumn
            Caption = 'Solicita'#231#227'o'
            DataBinding.FieldName = 'parentID'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            SortIndex = 0
            SortOrder = soAscending
          end
          object cxgdbtvItensFaturarid: TcxGridDBColumn
            DataBinding.FieldName = 'id'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
          end
          object cxgdbtvItensFaturarstatus: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'status'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 200
          end
          object cxgdbtvItensFaturaritem_id: TcxGridDBColumn
            Caption = 'Item'
            DataBinding.FieldName = 'item_id'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 350
            Properties.GridMode = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                MinWidth = 15
                Width = 100
                FieldName = 'id'
              end
              item
                MinWidth = 15
                Width = 100
                FieldName = 'type'
              end
              item
                MinWidth = 100
                Width = 500
                FieldName = 'name'
              end>
            Properties.ListFieldIndex = 2
            Properties.ListSource = dtmFaturamentoERP.dsItensReceita
            Properties.MaxLength = 300
            Width = 344
          end
          object cxgdbtvItensFaturarValor: TcxGridDBColumn
            DataBinding.FieldName = 'Valor'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.ReadOnly = False
            Width = 94
          end
          object cxgdbtvItensFaturarValor_Cliente: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'Valor_Cliente'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.ReadOnly = False
            Width = 88
          end
          object cxgdbtvItensFaturarValorSelecionado: TcxGridDBColumn
            DataBinding.FieldName = 'ValorSelecionado'
            Visible = False
          end
          object cxgdbtvItensFaturarItemFixo: TcxGridDBColumn
            Caption = 'Incluir Item'
            DataBinding.FieldName = 'ItemFixo'
            Visible = False
          end
          object cxgdbtvItensFaturarcustomID: TcxGridDBColumn
            Caption = 'Processo'
            DataBinding.FieldName = 'customID'
            Options.Editing = False
            Width = 103
          end
          object cxgdbtvItensFaturarcustomClearance_id: TcxGridDBColumn
            DataBinding.FieldName = 'customClearance_id'
            Visible = False
          end
          object cxgdbtvItensFaturardestino: TcxGridDBColumn
            DataBinding.FieldName = 'destino'
            Width = 45
          end
        end
        object cxgdbtvTipoFaturar: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dtmFaturamentoERP.dsTipoFaturar
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          Styles.OnGetContentStyle = cxgdbtvTipoFaturarStylesGetContentStyle
          Styles.Header = dtmFaturamentoERP.cxsTipoNumerario
          object cxgdbtvTipoFaturarTipo: TcxGridDBColumn
            DataBinding.FieldName = 'Tipo'
          end
        end
        object cxglItensFaturar: TcxGridLevel
          GridView = cxgdbtvItensFaturar
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Itens da Nota Fiscal'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxgItensNota: TcxGrid
        Left = 0
        Top = 0
        Width = 785
        Height = 303
        Align = alClient
        TabOrder = 0
        object cxgdbtvTipoItensNota: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dtmFaturamentoERP.dsTipoFaturar
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          Styles.OnGetContentStyle = cxgdbtvTipoItensNotaStylesGetContentStyle
          object cxgdbtvTipoItensNotaTipo: TcxGridDBColumn
            DataBinding.FieldName = 'Tipo'
            IsCaptionAssigned = True
          end
        end
        object cxgdbtvItensNota: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dtmFaturamentoERP.dsItensNota
          DataController.DetailKeyFieldNames = 'Tipo'
          DataController.KeyFieldNames = 'Tipo;id;status;item_id;item_name;Valor'
          DataController.MasterKeyFieldNames = 'Tipo'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Header = dtmFaturamentoERP.cxsHeader
          object cxgdbtvItensNotaTipo: TcxGridDBColumn
            DataBinding.FieldName = 'Tipo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
          end
          object cxgdbtvItensNotaparentID: TcxGridDBColumn
            Caption = 'Solicita'#231#227'o'
            DataBinding.FieldName = 'parentID'
            Visible = False
            GroupIndex = 0
          end
          object cxgdbtvItensNotaid: TcxGridDBColumn
            DataBinding.FieldName = 'id'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
          end
          object cxgdbtvItensNotastatus: TcxGridDBColumn
            Caption = 'Situa'#231#227'o'
            DataBinding.FieldName = 'status'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Visible = False
            Width = 200
          end
          object cxgdbtvItensNotaitem_id: TcxGridDBColumn
            Caption = 'Item'
            DataBinding.FieldName = 'item_id'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Width = 300
                FieldName = 'id'
              end
              item
                FieldName = 'name'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dtmFaturamentoERP.dsItensReceita
            Width = 500
          end
          object cxgdbtvItensNotaValor: TcxGridDBColumn
            DataBinding.FieldName = 'Valor'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 150
          end
          object cxgdbtvItensNotaValorTotal: TcxGridDBColumn
            DataBinding.FieldName = 'ValorTotal'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Visible = False
          end
          object cxgdbtvItensNotaValor_Cliente: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'Valor_Cliente'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.ReadOnly = False
          end
          object cxgdbtvItensNotaValorNumerarios: TcxGridDBColumn
            DataBinding.FieldName = 'ValorNumerarios'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Visible = False
          end
          object cxgdbtvItensNotaValorPagamentos: TcxGridDBColumn
            DataBinding.FieldName = 'ValorPagamentos'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Visible = False
          end
          object cxgdbtvItensNotaValorReceitas: TcxGridDBColumn
            DataBinding.FieldName = 'ValorReceitas'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Visible = False
          end
          object cxgdbtvItensNotaCustomId: TcxGridDBColumn
            Caption = 'Processo'
            DataBinding.FieldName = 'CustomId'
            Width = 150
          end
        end
        object cxglTipoItensNota: TcxGridLevel
          GridView = cxgdbtvTipoItensNota
          object cxglItensNota: TcxGridLevel
            GridView = cxgdbtvItensNota
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Log'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object reLog: TRichEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 779
        Height = 297
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        Zoom = 100
      end
    end
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 303
    Width = 785
    Height = 102
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      785
      102)
    object btnVoltar: TBitBtn
      Left = 705
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Voltar'
      TabOrder = 0
      OnClick = btnVoltarClick
    end
    object btnAvançar: TBitBtn
      Left = 705
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Avan'#231'ar'
      TabOrder = 1
      OnClick = btnAvançarClick
    end
    object btnConcluir: TBitBtn
      Left = 705
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Concluir'
      TabOrder = 2
      OnClick = btnConcluirClick
    end
    object Panel1: TPanel
      Left = 1
      Top = 10
      Width = 378
      Height = 83
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      Visible = False
      object Label1: TLabel
        Left = 11
        Top = 44
        Width = 194
        Height = 13
        AutoSize = False
        Caption = '__________________________________'
      end
      object Label2: TLabel
        Left = 11
        Top = 8
        Width = 100
        Height = 13
        Caption = 'Total Numer'#225'rios:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 202
        Top = 8
        Width = 3
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'ValorNumerarios'
        DataSource = dtmFaturamentoERP.dsItensNota
        Visible = False
      end
      object Label11: TLabel
        Left = 11
        Top = 24
        Width = 106
        Height = 13
        Caption = 'Total Pagamentos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 202
        Top = 24
        Width = 3
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'ValorPagamentos'
        DataSource = dtmFaturamentoERP.dsItensNota
        Visible = False
      end
      object Label12: TLabel
        Left = 11
        Top = 40
        Width = 84
        Height = 13
        Caption = 'Total Receitas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 202
        Top = 40
        Width = 3
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'ValorReceitas'
        DataSource = dtmFaturamentoERP.dsItensNota
        Visible = False
      end
      object DBText8: TDBText
        Left = 202
        Top = 59
        Width = 3
        Height = 13
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'ValorTotal'
        DataSource = dtmFaturamentoERP.dsItensNota
        Visible = False
      end
      object Label13: TLabel
        Left = 123
        Top = 8
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 123
        Top = 24
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 123
        Top = 40
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 123
        Top = 59
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlAgrupar: TPanel
      Left = 385
      Top = 10
      Width = 232
      Height = 83
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      Visible = False
      object Processo: TLabel
        Left = 15
        Top = 28
        Width = 43
        Height = 13
        Caption = 'Processo'
      end
      object Label3: TLabel
        Left = 5
        Top = 9
        Width = 106
        Height = 13
        Caption = 'Agrupar Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnAgruparProcesso: TSpeedButton
        Left = 179
        Top = 44
        Width = 29
        Height = 25
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnAgruparProcessoClick
      end
      object edtProcessoAgrupado: TEdit
        Left = 15
        Top = 45
        Width = 158
        Height = 21
        TabOrder = 0
        OnKeyPress = edtProcessoAgrupadoKeyPress
      end
    end
  end
end

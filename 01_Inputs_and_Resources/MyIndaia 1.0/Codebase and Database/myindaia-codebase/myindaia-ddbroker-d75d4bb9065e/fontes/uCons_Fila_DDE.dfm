object frm_cons_fila_dde: Tfrm_cons_fila_dde
  Left = 247
  Top = 135
  Width = 983
  Height = 660
  Caption = 'Consulta de DDEs na Fila de Registro do Siscomex'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_topo: TPanel
    Left = 0
    Top = 0
    Width = 975
    Height = 42
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      975
      42)
    object btn_fechar: TSpeedButton
      Left = 937
      Top = 9
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      OnClick = btn_fecharClick
    end
    object btn_Recarrega: TSpeedButton
      Left = 358
      Top = 8
      Width = 160
      Height = 28
      Cursor = crHandPoint
      Caption = 'Recarregar Dados'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btn_RecarregaClick
    end
    object cbAuto: TCheckBox
      Left = 522
      Top = 15
      Width = 97
      Height = 17
      Caption = 'Auto-Recarrega'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = cbAutoClick
    end
    object cb_limite_filtro: TCheckBox
      Left = 32
      Top = 16
      Width = 177
      Height = 17
      Caption = 'Exibe os '#250'ltimos 15 dias'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = cb_limite_filtroClick
    end
  end
  object cxGrid_Fila: TcxGrid
    Left = 0
    Top = 42
    Width = 975
    Height = 584
    Align = alClient
    TabOrder = 1
    object cxGrid_Tabela: TcxGridDBTableView
      DataController.DataSource = datm_dde.ds_fila_exp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          OnGetText = cxGrid_TabelaTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText
          FieldName = 'DATA_FILA'
          Column = cxGrid_TabelaDATA_FILA
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Filtering.CustomizeDialog = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.Footer = True
      OptionsView.GridLines = glVertical
      Styles.Header = cxTitulos
      OnColumnPosChanged = SalvaGrid
      OnColumnSizeChanged = SalvaGrid
      OnCustomDrawGroupCell = cxGrid_TabelaCustomDrawGroupCell
      object cxGrid_TabelaDATA_FILA: TcxGridDBColumn
        Caption = 'Entrou na Fila'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.InputKind = ikStandard
        HeaderAlignmentHorz = taCenter
        Width = 116
        DataBinding.FieldName = 'DATA_FILA'
      end
      object cxGrid_TabelaHORA_FILA: TcxGridDBColumn
        Caption = 'Hora Fila'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 82
        DataBinding.FieldName = 'HORA_FILA'
      end
      object cxGrid_TabelaNM_USUARIO: TcxGridDBColumn
        Caption = 'Usu'#225'rio'
        Width = 123
        DataBinding.FieldName = 'NM_USUARIO'
      end
      object cxGrid_TabelaNR_PROCESSO: TcxGridDBColumn
        Caption = 'Nr.Processo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Styles.Content = cxDestaque
        Width = 108
        DataBinding.FieldName = 'NR_PROCESSO'
      end
      object cxGrid_TabelaDATA_STATUS: TcxGridDBColumn
        Caption = 'Ocorrencia'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 98
        DataBinding.FieldName = 'DATA_STATUS'
      end
      object cxGrid_TabelaHORA_STATUS: TcxGridDBColumn
        Caption = 'Hora Ocorr'#234'ncia'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 103
        DataBinding.FieldName = 'HORA_STATUS'
      end
      object cxGrid_TabelaTX_STATUS: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        Styles.Content = cxDestaque
        Width = 324
        DataBinding.FieldName = 'TX_STATUS'
      end
    end
    object cxGrid_Fila_Nivel1: TcxGridLevel
      GridView = cxGrid_Tabela
    end
  end
  object tempo_recarrega: TTimer
    Interval = 10000
    OnTimer = tempo_recarregaTimer
    Left = 320
    Top = 8
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 792
    Top = 504
    object cxTitulos: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8404992
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxDestaque: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
  end
end

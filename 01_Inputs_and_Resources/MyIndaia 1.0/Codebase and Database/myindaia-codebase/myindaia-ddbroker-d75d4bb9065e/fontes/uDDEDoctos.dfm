object frm_dde_doctos: Tfrm_dde_doctos
  Left = 252
  Top = 168
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsNone
  Caption = 'frm_dde_doctos'
  ClientHeight = 195
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    529
    195)
  PixelsPerInch = 96
  TextHeight = 13
  object dxBevel1: TdxBevel
    Left = 0
    Top = 0
    Width = 529
    Height = 195
    Align = alClient
    LookAndFeel.SkinName = ''
  end
  object btnAdicionar: TcxButton
    Left = 253
    Top = 164
    Width = 187
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Selecionar Documento'
    TabOrder = 0
    OnClick = btnAdicionarClick
    LookAndFeel.SkinName = 'UserSkin'
  end
  object btnCancelar: TcxButton
    Left = 450
    Top = 164
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.SkinName = 'UserSkin'
  end
  object cxLabel1: TcxLabel
    Left = 6
    Top = 5
    Caption = 'Documentos Digitalizados'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxgDoctosDigitalizados: TcxGrid
    Left = 0
    Top = 64
    Width = 529
    Height = 89
    TabOrder = 3
    object cxtbDoctosDigitalizados: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = 'Sem Dados'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxtbDoctosDigitalizadosNM_DESCRICAO: TcxGridDBColumn
        Caption = 'Arquivo'
        DataBinding.FieldName = 'NM_DESCRICAO'
        Width = 217
      end
      object cxtbDoctosDigitalizadosDT_CRIACAO: TcxGridDBColumn
        Caption = 'Data de Cria'#231#227'o'
        DataBinding.FieldName = 'DT_CRIACAO'
        Width = 118
      end
      object cxtbDoctosDigitalizadosNM_USUARIO: TcxGridDBColumn
        Caption = 'Usu'#225'rio'
        DataBinding.FieldName = 'NM_USUARIO'
        Width = 192
      end
    end
    object cxlDoctosDigitalizados: TcxGridLevel
      GridView = cxtbDoctosDigitalizados
    end
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 34
    Caption = 'Tipo de Documento'
  end
  object cxlcp_tipo_docto: TcxLookupComboBox
    Left = 128
    Top = 32
    Enabled = False
    Properties.KeyFieldNames = 'CODIGO'
    Properties.ListColumns = <
      item
        FieldName = 'TEXTO'
      end>
    Style.Color = clBtnFace
    TabOrder = 5
    Width = 353
  end
end

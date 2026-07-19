object frm_dde_mercadoria_perigosa: Tfrm_dde_mercadoria_perigosa
  Left = 252
  Top = 168
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsNone
  Caption = 'frm_dde_mercadoria_perigosa'
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
  object Label3: TLabel
    Left = 18
    Top = 40
    Width = 15
    Height = 13
    Caption = 'RE'
  end
  object Label4: TLabel
    Left = 153
    Top = 40
    Width = 153
    Height = 13
    Caption = 'Anexo com Mercadoria Perigosa'
  end
  object Label1: TLabel
    Left = 18
    Top = 80
    Width = 31
    Height = 13
    Caption = 'Classe'
  end
  object Label2: TLabel
    Left = 18
    Top = 120
    Width = 80
    Height = 13
    Caption = 'C'#243'digo Indicador'
  end
  object Label5: TLabel
    Left = 329
    Top = 40
    Width = 67
    Height = 13
    Caption = 'Tipo de Carga'
  end
  object btnAdicionar: TcxButton
    Left = 253
    Top = 164
    Width = 187
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Adicionar Mercadoria Perigosa'
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
    Caption = 'Mercadoria Perigosa'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxdbedt_re: TcxDBTextEdit
    Left = 16
    Top = 55
    DataBinding.DataField = 'NR_RE_SISCOMEX'
    DataBinding.DataSource = datm_dde_novo.ds_dde_merc_perigosa
    Style.BorderStyle = ebsSingle
    TabOrder = 3
    Width = 121
  end
  object cxdblcp_classe: TcxDBLookupComboBox
    Left = 16
    Top = 95
    DataBinding.DataField = 'CD_CLASSE'
    DataBinding.DataSource = datm_dde_novo.ds_dde_merc_perigosa
    Properties.KeyFieldNames = 'CODIGO'
    Properties.ListColumns = <
      item
        FieldName = 'TEXTO'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = datm_dde_novo.ds_combo_classe
    Properties.OnEditValueChanged = cxdblcp_classePropertiesEditValueChanged
    Style.BorderStyle = ebsSingle
    TabOrder = 4
    Width = 451
  end
  object cxdbcb_anexo: TcxDBComboBox
    Left = 151
    Top = 55
    DataBinding.DataField = 'NR_ANEXO'
    DataBinding.DataSource = datm_dde_novo.ds_dde_merc_perigosa
    Style.BorderStyle = ebsSingle
    TabOrder = 5
    Width = 161
  end
  object cxdblcp_indicador: TcxDBLookupComboBox
    Left = 16
    Top = 135
    DataBinding.DataField = 'CD_INDICADOR'
    DataBinding.DataSource = datm_dde_novo.ds_dde_merc_perigosa
    Properties.KeyFieldNames = 'CODIGO'
    Properties.ListColumns = <
      item
        FieldName = 'TEXTO'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = datm_dde_novo.ds_combo_indicador
    Style.BorderStyle = ebsSingle
    TabOrder = 6
    Width = 451
  end
  object cxdblcp_tipo_carga: TcxDBLookupComboBox
    Left = 328
    Top = 55
    DataBinding.DataField = 'CD_TIPO_CARGA'
    DataBinding.DataSource = datm_dde_novo.ds_dde_merc_perigosa
    Properties.KeyFieldNames = 'CODIGO'
    Properties.ListColumns = <
      item
        FieldName = 'TEXTO'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = datm_dde_novo.ds_combo_carga
    Properties.OnEditValueChanged = cxdblcp_classePropertiesEditValueChanged
    Style.BorderStyle = ebsSingle
    TabOrder = 7
    Width = 137
  end
end

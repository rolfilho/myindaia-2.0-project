object frm_integra_nota_basf_filhotes: Tfrm_integra_nota_basf_filhotes
  Left = 299
  Top = 207
  Width = 740
  Height = 576
  BorderIcons = [biSystemMenu]
  Caption = 'Filhotes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFilhote: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 538
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object dbgrd_filhote: TDBGrid
      Left = 2
      Top = 110
      Width = 720
      Height = 365
      Align = alClient
      DataSource = frm_integra_nota_basf.ds_nota_filhote
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnMouseUp = dbgrd_filhoteMouseUp
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_ITEM'
          ReadOnly = True
          Title.Caption = 'Item'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_MERCADORIA'
          ReadOnly = True
          Title.Caption = 'C'#243'digo Mercadoria'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_MERCADORIA'
          ReadOnly = True
          Title.Caption = 'Mercadoria'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE_DISPONIVEL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtde Dispon'#237'vel'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PROC_PO'
          Title.Caption = 'PO'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ITEM_PO'
          Title.Caption = 'Item PO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARCIAL'
          Title.Caption = 'Parcial'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE_BAIXAR'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde a Baixar'
          Width = 93
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 475
      Width = 720
      Height = 61
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        720
        61)
      object lblTipoRel: TLabel
        Left = 347
        Top = 7
        Width = 81
        Height = 16
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = '--- EXCEL ---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label6: TLabel
        Left = 21
        Top = 13
        Width = 25
        Height = 13
        Caption = 'Qtd:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 65
        Top = 13
        Width = 50
        Height = 13
        Caption = 'Especie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCNTR_FILHOTE: TLabel
        Left = 218
        Top = 13
        Width = 28
        Height = 13
        Caption = 'Cntr:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnOk: TBitBtn
        Left = 345
        Top = 25
        Width = 83
        Height = 25
        Caption = 'Gerar Filhote'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancelBaixaEstorno: TBitBtn
        Left = 627
        Top = 26
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCancelBaixaEstornoClick
      end
      object edtQtd_Filhote: TEdit
        Left = 21
        Top = 26
        Width = 39
        Height = 21
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        Text = 'edtQtd_Filhote'
      end
      object edtEspecie_Filhote: TEdit
        Left = 65
        Top = 26
        Width = 146
        Height = 21
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object cbCNTR_FILHOTE: TComboBox
        Left = 217
        Top = 26
        Width = 105
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        CharCase = ecUpperCase
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 4
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 720
      Height = 108
      Align = alTop
      TabOrder = 2
      object shpTopoFilhote: TShape
        Left = 10
        Top = 7
        Width = 696
        Height = 44
        Brush.Color = clBtnFace
        Pen.Color = clTeal
      end
      object lblnrItem: TLabel
        Left = 24
        Top = 9
        Width = 45
        Height = 13
        Caption = 'Nr.Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMercadoria: TLabel
        Left = 85
        Top = 9
        Width = 64
        Height = 13
        Caption = 'Mercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQtdeDisp: TLabel
        Left = 300
        Top = 61
        Width = 97
        Height = 13
        Caption = 'Qtde. Dispon'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPesoLiq: TLabel
        Left = 415
        Top = 61
        Width = 76
        Height = 13
        Caption = 'Peso L'#237'quido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNrNota: TLabel
        Left = 28
        Top = 23
        Width = 32
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = '001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 12
        Top = 60
        Width = 131
        Height = 14
        AutoSize = False
        Caption = 'Natureza da Opera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_natureza_op_filhote: TSpeedButton
        Left = 157
        Top = 73
        Width = 23
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = btn_co_natureza_op_filhoteClick
      end
      object DBText1: TDBText
        Left = 533
        Top = 78
        Width = 47
        Height = 17
        Alignment = taRightJustify
        DataField = 'NR_ADICAO'
        DataSource = frm_integra_nota_basf.ds_nota_filhote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 539
        Top = 62
        Width = 40
        Height = 13
        Caption = 'Adi'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 603
        Top = 62
        Width = 61
        Height = 13
        Caption = 'CFOP M'#227'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 604
        Top = 78
        Width = 56
        Height = 17
        Alignment = taRightJustify
        DataField = 'CD_CFOP'
        DataSource = frm_integra_nota_basf.ds_nota_filhote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edt_cd_natureza_op_filhote: TEdit
        Left = 12
        Top = 73
        Width = 48
        Height = 21
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = btn_co_natureza_op_filhoteClick
      end
      object edt_nm_natureza_op_filhote: TEdit
        Left = 61
        Top = 73
        Width = 96
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbnav_filhote: TDBNavigator
        Left = 575
        Top = 22
        Width = 104
        Height = 20
        DataSource = frm_integra_nota_basf.ds_nota_filhote
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeira adi'#231#227'o'
          'Adi'#231#227'o Anterior'
          'Pr'#243'xima adi'#231#227'o'
          #218'ltima adi'#231#227'o')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object dbedt_qtde: TDBEdit
        Left = 415
        Top = 75
        Width = 104
        Height = 19
        Color = clSilver
        Ctl3D = False
        DataField = 'QTDE_COMERC'
        DataSource = frm_integra_nota_basf.ds_nota_filhote
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbedt_nm_mercadoria: TDBEdit
        Left = 85
        Top = 23
        Width = 434
        Height = 19
        Color = clSilver
        Ctl3D = False
        DataField = 'AP_MERCADORIA'
        DataSource = frm_integra_nota_basf.ds_nota_filhote
        ParentCtl3D = False
        TabOrder = 4
      end
      object dbedt_qtde_disponivel: TDBEdit
        Left = 299
        Top = 75
        Width = 100
        Height = 19
        Color = clSilver
        Ctl3D = False
        DataField = 'QTDE_DISPONIVEL'
        DataSource = frm_integra_nota_basf.ds_nota_filhote
        ParentCtl3D = False
        TabOrder = 5
      end
    end
  end
end

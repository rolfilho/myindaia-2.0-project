object frm_cons_frete: Tfrm_cons_frete
  Left = 296
  Top = 173
  Width = 631
  Height = 317
  VertScrollBar.Visible = False
  Caption = 'Pesquisa de Frete'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    623
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_aereo: TPanel
    Left = 0
    Top = 522
    Width = 623
    Height = 241
    Align = alTop
    TabOrder = 2
    Visible = False
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 621
      Height = 20
      Align = alTop
      Anchors = []
      AutoSize = False
      Caption = 'Tarifas'
      Color = 14211288
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 1
      Top = 93
      Width = 621
      Height = 20
      Align = alTop
      Anchors = []
      AutoSize = False
      Caption = 'Despesas'
      Color = 14211288
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object dbgrid_despesa_aerea: TDBGrid
      Left = 1
      Top = 113
      Width = 621
      Height = 120
      Align = alTop
      Anchors = []
      DataSource = ds_despesa
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NM_ITEM'
          Title.Caption = 'Descri'#231#227'o'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_MOEDA'
          Title.Caption = 'Moeda'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_BASE_CALC'
          Title.Caption = 'Tipo Base'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_AG'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra Agente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_CIA'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VENDA'
          Title.Alignment = taRightJustify
          Title.Caption = 'Venda'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IN_NM_DESPESA'
          Title.Caption = 'Despesa por'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 136
          Visible = True
        end>
    end
    object dbgrid_tarifa_aerea: TDBGrid
      Left = 1
      Top = 21
      Width = 621
      Height = 72
      Align = alTop
      Anchors = []
      DataSource = ds_tarifas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
          Title.Alignment = taCenter
          Title.Caption = 'Simbolo'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 141
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO_TAB_FRETE'
          Title.Caption = 'Peso (Kg)'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_CIA_ARMADOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_TAB_FRETE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra Agente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 151
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VENDA_TAB_FRETE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Venda'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 140
          Visible = True
        end>
    end
  end
  object pnl_maritima: TPanel
    Left = 0
    Top = 214
    Width = 623
    Height = 308
    Align = alTop
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Label5: TLabel
      Left = 0
      Top = 0
      Width = 623
      Height = 20
      Align = alTop
      AutoSize = False
      Caption = 'Tarifas'
      Color = 14211288
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 0
      Top = 170
      Width = 623
      Height = 20
      Align = alTop
      AutoSize = False
      Caption = 'Despesas'
      Color = 14211288
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object dbgrid_despesas_maritima: TDBGrid
      Left = 0
      Top = 190
      Width = 623
      Height = 113
      Align = alTop
      Ctl3D = False
      DataSource = ds_despesa
      ParentCtl3D = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'calc_tp_estufagem'
          Title.Caption = 'Estufagem'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_ITEM'
          Title.Caption = 'Descri'#231#227'o'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_MOEDA'
          Title.Caption = 'Moeda'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_BASE_CALC'
          Title.Caption = 'Tipo Base'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_AG'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra Agente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_CIA'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VENDA'
          Title.Alignment = taRightJustify
          Title.Caption = 'Venda'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_ORIGEM_DESP'
          Title.Caption = 'Origem Custo'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IN_NM_DESPESA'
          Title.Caption = 'Despesa por'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 126
          Visible = True
        end>
    end
    object dbgrid_tarifa_lcl: TDBGrid
      Left = 0
      Top = 97
      Width = 623
      Height = 73
      Align = alTop
      Ctl3D = False
      DataSource = ds_tarifas
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'SIMBOLO_FRETE'
          Title.Alignment = taCenter
          Title.Caption = 'S'#237'mbolo'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_CIA_ARMADOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_TAB_FRETE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra Agente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VENDA_TAB_FRETE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Venda'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 181
          Visible = True
        end>
    end
    object dbgrid_tarifa_fcl: TDBGrid
      Left = 0
      Top = 20
      Width = 623
      Height = 77
      Align = alTop
      Ctl3D = False
      DataSource = ds_tarifa_FCL
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'NM_CNTR'
          Title.Caption = 'Contanier'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 143
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_CIA_ARMADOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMPRA_TAB_FRETE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Compra Agente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VENDA_TAB_FRETE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Venda'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end>
    end
  end
  object pnl_principal: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 214
    Align = alTop
    Anchors = []
    TabOrder = 0
    object dbgrid_resultado: TDBGrid
      Left = 1
      Top = 1
      Width = 621
      Height = 206
      Align = alTop
      Anchors = [akTop]
      DataSource = ds_pesq_frete
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrid_resultadoDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_TAB_FRETE'
          Title.Caption = 'C'#243'd.'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_TAB_FRETE'
          Title.Caption = 'Descri'#231#227'o da Tabela'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 214
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_AGENTE'
          Title.Caption = 'Agente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 324
          Visible = True
        end>
    end
  end
  object btn_incluir: TButton
    Left = 527
    Top = 241
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btn_incluirClick
  end
  object btn_sair: TButton
    Left = 428
    Top = 241
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Sai&r'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btn_sairClick
  end
  object qry_pes_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  TT.CD_TAB_FRETE, TT.DESC_TAB_FRETE, TT.CD_MOEDA_TAB_FRET' +
        'E,'
      
        ' TT.CD_AGENTE_TAB_FRETE, TT.CD_CIA_TRANSP_TAB_FRETE, TT.CD_ARMAD' +
        'OR,'
      
        ' (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.CD_AGENTE = TT.CD' +
        '_AGENTE_TAB_FRETE) NM_AGENTE,'
      
        ' (SELECT TC.DESCRICAO FROM TTRANSPORTADOR_ITL TC WHERE TC.CODIGO' +
        ' = TT.CD_CIA_TRANSP_TAB_FRETE AND TP_TRANSPORTADOR = '#39'0'#39') NM_CIA' +
        '_TRANSP,'
      
        ' (SELECT TAR.DESCRICAO FROM TTRANSPORTADOR_ITL TAR WHERE TAR.COD' +
        'IGO = TT.CD_ARMADOR AND TP_TRANSPORTADOR = '#39'1'#39') NM_ARMADOR'
      ' FROM TTAB_FRETE TT WHERE'
      
        '   CD_ORIGEM_TAB_FRETE=:CD_ORIGEM AND CD_DESTINO_TAB_FRETE =:CD_' +
        'DESTINO'
      '   AND CD_VIA_TRANSP=:CD_VIA_TRANSP AND TP_EMP_FRETE=:TP_FRETE'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 16
    Top = 96
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_ORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_FRETE'
        ParamType = ptUnknown
      end>
    object qry_pes_frete_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_pes_frete_DESC_TAB_FRETE: TStringField
      FieldName = 'DESC_TAB_FRETE'
      FixedChar = True
      Size = 30
    end
    object qry_pes_frete_CD_AGENTE_TAB_FRETE: TStringField
      FieldName = 'CD_AGENTE_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_pes_frete_CD_CIA_TRANSP_TAB_FRETE: TStringField
      FieldName = 'CD_CIA_TRANSP_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_pes_frete_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_pes_frete_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_pes_frete_NM_CIA_TRANSP: TStringField
      FieldName = 'NM_CIA_TRANSP'
      FixedChar = True
      Size = 50
    end
    object qry_pes_frete_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_pes_frete_CD_MOEDA_TAB_FRETE: TStringField
      FieldName = 'CD_MOEDA_TAB_FRETE'
      FixedChar = True
      Size = 3
    end
  end
  object ds_pesq_frete: TDataSource
    DataSet = qry_pes_frete_
    Left = 48
    Top = 96
  end
  object qry_tarifas_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT PESO_TAB_FRETE, VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE' +
        ', VL_COMPRA_TAB_FRETE, VL_VENDA_TAB_FRETE,'
      '  VL_COMPRA_CIA_ARMADOR, TP_FRETE ,'
      '   CASE TTIPO_SIMBOLO_TAB_FRETE'
      '        WHEN '#39'0'#39'  THEN '#39'Tarifa LCL'#39
      '        WHEN '#39'1'#39'  THEN '#39'M'#237'nimo LCL'#39
      '        WHEN '#39'2'#39'  THEN '#39'Tarifa Break Bulk'#39
      '        WHEN '#39'3'#39'  THEN '#39'M'#237'nimo Break Bulk'#39
      '   END SIMBOLO_FRETE'
      '    FROM TTAB_FRETE_ITEM'
      '      WHERE CD_TAB_FRETE=:CD_TAB_FRETE AND TP_ESTUFAGEM='#39'0'#39
      ' '
      ''
      'ORDER BY TTIPO_SIMBOLO_TAB_FRETE')
    Left = 96
    Top = 96
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_tarifas_PESO_TAB_FRETE: TFloatField
      FieldName = 'PESO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.PESO_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_tarifas_VOLUME_TAB_FRETE: TStringField
      FieldName = 'VOLUME_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VOLUME_TAB_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_tarifas_TTIPO_SIMBOLO_TAB_FRETE: TStringField
      FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TTIPO_SIMBOLO_TAB_FRETE'
      FixedChar = True
      Size = 15
    end
    object qry_tarifas_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_tarifas_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_VENDA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_tarifas_VL_COMPRA_CIA_ARMADOR: TFloatField
      FieldName = 'VL_COMPRA_CIA_ARMADOR'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_CIA_ARMADOR'
      DisplayFormat = '0.00'
    end
    object qry_tarifas_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_tarifas_SIMBOLO_FRETE: TStringField
      FieldName = 'SIMBOLO_FRETE'
      FixedChar = True
      Size = 7
    end
  end
  object ds_tarifas: TDataSource
    DataSet = qry_tarifas_
    Left = 140
    Top = 96
  end
  object qry_despesa_: TQuery
    OnCalcFields = qry_despesa_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TD.CD_ITEM, (SELECT TI.NM_ITEM FROM TITEM TI WHERE TI.CD_' +
        'ITEM = TD.CD_ITEM)NM_ITEM,'
      '  TD.TP_BASE_CALCULO,'
      
        ' (SELECT TB.NM_TP_BASE_CALC_FRETE FROM TTP_BASE_CALC_FRETE TB WH' +
        'ERE TB.CD_TP_BASE_CALC_FRETE = TD.TP_BASE_CALCULO)NM_BASE_CALC,'
      
        '  TD.CD_MOEDA,(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM' +
        '.CD_MOEDA = TD.CD_MOEDA)NM_MOEDA,'
      '  TD.TP_ORIGEM_DESPESA,'
      
        '  (SELECT TOR.NM_ORIGEM_DESP FROM TORIGEM_DESPESA TOR WHERE TOR.' +
        'CD_ORIGEM_DESP = TD.TP_ORIGEM_DESPESA AND TOR.TP_DESCRICAO = "0"' +
        ')NM_ORIGEM_DESP,'
      
        '  TD.VL_BASE_DESPESA, TD.VL_COMPRA_AG, TD.VL_COMPRA_CIA, TD.VL_V' +
        'ENDA,'
      '  TD.IN_DESPESA,'
      
        ' (SELECT TORI.NM_ORIGEM_DESP FROM TORIGEM_DESPESA TORI WHERE TOR' +
        'I.CD_ORIGEM_DESP = TD.IN_DESPESA AND TORI.TP_DESCRICAO = "1")IN_' +
        'NM_DESPESA,'
      '  TD.TP_FRETE, TD.TP_ESTUFAGEM'
      '   FROM TTAB_FRETE_DESPESA TD'
      
        '    WHERE TD.CD_TAB_FRETE=:CD_TAB_FRETE AND TD.TP_ESTUFAGEM = :T' +
        'P_ESTUFAGEM'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 296
    Top = 96
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_despesa_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_despesa_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_BASE_DESPESA'
      DisplayFormat = '0.00'
    end
    object qry_despesa_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_COMPRA_AG'
      DisplayFormat = '0.00'
    end
    object qry_despesa_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.VL_COMPRA_CIA'
      DisplayFormat = '0.00'
    end
    object qry_despesa_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TTAB_FRETE_DESPESA.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_despesa_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_despesa_NM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_despesa_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_despesa_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      FixedChar = True
    end
    object qry_despesa_IN_NM_DESPESA: TStringField
      FieldName = 'IN_NM_DESPESA'
      FixedChar = True
    end
    object qry_despesa_calc_tp_estufagem: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'calc_tp_estufagem'
      Size = 15
      Calculated = True
    end
    object qry_despesa_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      DisplayFormat = '0.00'
    end
  end
  object ds_despesa: TDataSource
    DataSet = qry_despesa_
    Left = 336
    Top = 96
  end
  object ds_tarifa_FCL: TDataSource
    DataSet = qry_tarifa_FCL_
    Left = 240
    Top = 96
  end
  object qry_tarifa_FCL_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TT.CD_TAB_FRETE, TT.CD_ITEM_TAB_FRETE, TT.VOLUME_TAB_FRET' +
        'E,'
      
        '  TT.VL_COMPRA_TAB_FRETE,  TT.VL_VENDA_TAB_FRETE,  TT.VL_COMPRA_' +
        'CIA_ARMADOR,'
      
        '   TT.TP_FRETE, TT.CD_TAB_REF, (SELECT TC.NM_TP_CNTR FROM TTP_CN' +
        'TR TC WHERE TC.TP_CNTR =TT.VOLUME_TAB_FRETE )NM_CNTR'
      '     FROM TTAB_FRETE_ITEM TT'
      
        '   WHERE TT.CD_TAB_FRETE=:CD_TAB_FRETE   AND TT.TP_ESTUFAGEM ='#39'1' +
        #39
      ' '
      ' '
      ' '
      ' ')
    Left = 200
    Top = 96
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_tarifa_FCL_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_tarifa_FCL_CD_ITEM_TAB_FRETE: TStringField
      FieldName = 'CD_ITEM_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_ITEM_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_tarifa_FCL_VOLUME_TAB_FRETE: TStringField
      FieldName = 'VOLUME_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VOLUME_TAB_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_tarifa_FCL_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_tarifa_FCL_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_VENDA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_tarifa_FCL_VL_COMPRA_CIA_ARMADOR: TFloatField
      FieldName = 'VL_COMPRA_CIA_ARMADOR'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.VL_COMPRA_CIA_ARMADOR'
      DisplayFormat = '0.00'
    end
    object qry_tarifa_FCL_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_tarifa_FCL_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      Origin = 'DBBROKER.TTAB_FRETE_ITEM.CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_tarifa_FCL_NM_CNTR: TStringField
      FieldName = 'NM_CNTR'
      FixedChar = True
    end
  end
end

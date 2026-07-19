object FrmConserta: TFrmConserta
  Left = 9
  Top = 5
  Width = 1009
  Height = 694
  Caption = 'Corre'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 14
    Width = 26
    Height = 13
    Caption = 'TPO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 36
    Width = 63
    Height = 13
    Caption = 'TPO_ITEM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 15
    Top = 308
    Width = 92
    Height = 13
    Caption = 'TREF_CLIENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 15
    Top = 573
    Width = 137
    Height = 13
    Caption = 'TESTAGIO_PROCESSO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 15
    Top = 171
    Width = 92
    Height = 13
    Caption = 'TFLP_PO_ITEM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 15
    Top = 443
    Width = 155
    Height = 13
    Caption = 'TDETALHE_MERCADORIA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 598
    Top = 10
    Width = 7
    Height = 13
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblQtdTotal: TLabel
    Left = 613
    Top = 10
    Width = 38
    Height = 13
    Caption = 'LblQtd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 526
    Top = 10
    Width = 65
    Height = 17
    Alignment = taRightJustify
    DataField = 'Contador'
    DataSource = DtsProcessos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 179
    Top = 8
    Width = 224
    Height = 25
    DataSource = DtsProcessos
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 48
    Top = 10
    Width = 121
    Height = 21
    DataField = 'NR_REFERENCIA'
    DataSource = DtsProcessos
    TabOrder = 1
  end
  object Button1: TButton
    Left = 419
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OPEN'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 53
    Width = 964
    Height = 111
    DataSource = dtsPoItem
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 15
    Top = 324
    Width = 964
    Height = 113
    DataSource = dtsRefCliente
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 15
    Top = 587
    Width = 964
    Height = 129
    DataSource = dtsEstagioProcesso
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 16
    Top = 184
    Width = 964
    Height = 118
    DataSource = dtsTFLP_PO_ITEM
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid5: TDBGrid
    Left = 15
    Top = 458
    Width = 964
    Height = 111
    DataSource = dtsDetalheMerc
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object SqlProcessos: TQuery
    AfterScroll = SqlProcessosAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IDENTITY(int, 1,1) AS Contador, * INTO #PROCESSOS'
      'FROM TPROCESSO(NOLOCK)'
      
        'where  CD_GRUPO = '#39'028'#39' and CD_PRODUTO = '#39'06'#39' and IN_CANCELADO =' +
        ' '#39'0'#39
      'ORDER BY NR_REFERENCIA'
      'SELECT * FROM #PROCESSOS '
      ''
      ''
      ' ')
    Left = 741
    Top = 13
  end
  object DtsProcessos: TDataSource
    DataSet = SqlProcessos
    Left = 852
    Top = 8
  end
  object SqlPOItem: TQuery
    CachedUpdates = True
    AfterPost = SqlPOItemAfterPost
    AfterDelete = SqlPOItemAfterPost
    DatabaseName = 'DBBROKER'
    DataSource = DtsProcessos
    SQL.Strings = (
      'SELECT * FROM TPO_ITEM WHERE NR_PROCESSO =:NR_REFERENCIA ')
    UpdateObject = updTPO_ITENS
    Left = 56
    Top = 50
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_REFERENCIA'
        ParamType = ptUnknown
        Size = 19
      end>
    object SqlPOItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPO_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object SqlPOItemNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TPO_ITEM.NR_PARCIAL'
    end
    object SqlPOItemID_CODIGO_INSTR_DESEMB: TStringField
      FieldName = 'ID_CODIGO_INSTR_DESEMB'
      Origin = 'DBBROKER.TPO_ITEM.ID_CODIGO_INSTR_DESEMB'
      FixedChar = True
      Size = 13
    end
    object SqlPOItemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPO_ITEM.CD_EXPORTADOR'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object SqlPOItemCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'DBBROKER.TPO_ITEM.CD_NALADI_SH'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object SqlPOItemCD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_AQUISICAO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERCADORIA'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object SqlPOItemCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TPO_ITEM.CD_FABRICANTE'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object SqlPOItemCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_ORIGEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TPO_ITEM.CD_NCM_SH'
      Visible = False
      FixedChar = True
      Size = 11
    end
    object SqlPOItemCD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.CD_NALADI_NCCA'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object SqlPOItemCD_MET_VALOR_ADUANEIRA: TStringField
      FieldName = 'CD_MET_VALOR_ADUANEIRA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MET_VALOR_ADUANEIRA'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemCD_DISP_LEGAL_EXONERA: TStringField
      FieldName = 'CD_DISP_LEGAL_EXONERA'
      Origin = 'DBBROKER.TPO_ITEM.CD_DISP_LEGAL_EXONERA'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemCD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'DBBROKER.TPO_ITEM.CD_MOEDA_NEGOCIADA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'DBBROKER.TPO_ITEM.CD_INCOTERM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'DBBROKER.TPO_ITEM.CD_ACORDO_ALADI'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_REG_TRIB_II'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemCD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_FUND_LEGAL_II'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MEDIDA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_UNID_MED_II: TStringField
      FieldName = 'CD_UNID_MED_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MED_II'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_UNID_MED_IPI: TStringField
      FieldName = 'CD_UNID_MED_IPI'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MED_IPI'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_UNID_MED_AD: TStringField
      FieldName = 'CD_UNID_MED_AD'
      Origin = 'DBBROKER.TPO_ITEM.CD_UNID_MED_AD'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_AGENTE_CAMBIO: TStringField
      FieldName = 'CD_AGENTE_CAMBIO'
      Origin = 'DBBROKER.TPO_ITEM.CD_AGENTE_CAMBIO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemCD_MOD_PAGTO: TStringField
      FieldName = 'CD_MOD_PAGTO'
      Origin = 'DBBROKER.TPO_ITEM.CD_MOD_PAGTO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemCD_TX_JUROS: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'DBBROKER.TPO_ITEM.CD_TX_JUROS'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemCD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      Origin = 'DBBROKER.TPO_ITEM.CD_INSTITUICAO_FINANC'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemCD_MOT_SEM_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_MOT_SEM_COBERT_CAMBIAL'
      Origin = 'DBBROKER.TPO_ITEM.CD_MOT_SEM_COBERT_CAMBIAL'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemCD_EX_II: TStringField
      FieldName = 'CD_EX_II'
      Origin = 'DBBROKER.TPO_ITEM.CD_EX_II'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_EX_IPI: TStringField
      FieldName = 'CD_EX_IPI'
      Origin = 'DBBROKER.TPO_ITEM.CD_EX_IPI'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TPO_ITEM.CD_VIA_TRANSP'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemCD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'DBBROKER.TPO_ITEM.CD_PAIS_PROCEDENCIA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemCD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'DBBROKER.TPO_ITEM.CD_URF_ENTRADA'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object SqlPOItemIN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'DBBROKER.TPO_ITEM.IN_NECESSITA_LI'
      Visible = False
    end
    object SqlPOItemIN_INDICADOR_COND_MERC: TBooleanField
      FieldName = 'IN_INDICADOR_COND_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_INDICADOR_COND_MERC'
      Visible = False
    end
    object SqlPOItemIN_COND_MERC: TStringField
      FieldName = 'IN_COND_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_COND_MERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemIN_APLIC_MERC: TStringField
      FieldName = 'IN_APLIC_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_APLIC_MERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemNM_ORGAO_EMISSOR_AL_EX_NALADI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_AL_EX_NALADI'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_AL_EX_NALADI: TStringField
      FieldName = 'NM_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_EX_NALADI'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_ORGAO_EMISSOR_AL_NCM: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AL_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_AL_NCM'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_AL_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_EX_NALADI_NCCA'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_ORG_EMISSOR_EX_NALADI_NCCA: TStringField
      FieldName = 'NM_ORG_EMISSOR_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORG_EMISSOR_EX_NALADI_NCCA'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_AL_II: TStringField
      FieldName = 'NM_AL_II'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_II'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_ORGAO_EMISSOR_II: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_II'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_II'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_ORGAO_EMISSOR_IPI: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_IPI'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_AL_IPI: TStringField
      FieldName = 'NM_AL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_IPI'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_AL_AD: TStringField
      FieldName = 'NM_AL_AD'
      Origin = 'DBBROKER.TPO_ITEM.NM_AL_AD'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_ORGAO_EMISSOR_AD: TStringField
      FieldName = 'NM_ORGAO_EMISSOR_AD'
      Origin = 'DBBROKER.TPO_ITEM.NM_ORGAO_EMISSOR_AD'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNM_IDENTIFICACAO: TStringField
      FieldName = 'NM_IDENTIFICACAO'
      Origin = 'DBBROKER.TPO_ITEM.NM_IDENTIFICACAO'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNR_ANO_EMISSAO_AL_EX_NALADI: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EMISSAO_AL_EX_NALADI'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_AL_EX_NALADI: TStringField
      FieldName = 'NR_AL_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_EX_NALADI'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemNR_EX_NCM: TStringField
      FieldName = 'NR_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_NCM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemNR_AL_EX_NCM: TStringField
      FieldName = 'NR_AL_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_EX_NCM'
      Visible = False
      FixedChar = True
      Size = 9
    end
    object SqlPOItemNR_ANO_EMISSAO_AL: TStringField
      FieldName = 'NR_ANO_EMISSAO_AL'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EMISSAO_AL'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_ATO_LEGAL: TStringField
      FieldName = 'NR_ATO_LEGAL'
      Origin = 'DBBROKER.TPO_ITEM.NR_ATO_LEGAL'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemNR_EX_NALADI: TStringField
      FieldName = 'NR_EX_NALADI'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_NALADI'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemNR_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_NALADI_NCCA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemNR_ANO_EMISSAO_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_ANO_EMISSAO_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EMISSAO_EX_NALADI_NCCA'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_AL_EX_NALADI_NCCA: TStringField
      FieldName = 'NR_AL_EX_NALADI_NCCA'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_EX_NALADI_NCCA'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemNR_ANO_II: TStringField
      FieldName = 'NR_ANO_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_II'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_AL_II: TStringField
      FieldName = 'NR_AL_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_II'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemNR_ALIQ_NORMAL_II: TStringField
      FieldName = 'NR_ALIQ_NORMAL_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_NORMAL_II'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_ALIQ_ACORDO_II: TStringField
      FieldName = 'NR_ALIQ_ACORDO_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_ACORDO_II'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_ALIQ_REDUZIDA_II: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_REDUZIDA_II'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_ALIQ_PERC_RED_II: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_II'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_PERC_RED_II'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_ANO_IPI: TStringField
      FieldName = 'NR_ANO_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_IPI'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_AL_IPI: TStringField
      FieldName = 'NR_AL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_IPI'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemNR_NOTA_COMPL_IPI: TStringField
      FieldName = 'NR_NOTA_COMPL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_NOTA_COMPL_IPI'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemNR_ALIQ_NORMAL_IPI: TStringField
      FieldName = 'NR_ALIQ_NORMAL_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_NORMAL_IPI'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_ALIQ_REDUZIDA_IPI: TStringField
      FieldName = 'NR_ALIQ_REDUZIDA_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_REDUZIDA_IPI'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_ALIQ_PERC_RED_IPI: TStringField
      FieldName = 'NR_ALIQ_PERC_RED_IPI'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_PERC_RED_IPI'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_PROC_LI: TStringField
      FieldName = 'NR_PROC_LI'
      Origin = 'DBBROKER.TPO_ITEM.NR_PROC_LI'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object SqlPOItemNR_EX_AD: TStringField
      FieldName = 'NR_EX_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_EX_AD'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemNR_ANO_AD: TStringField
      FieldName = 'NR_ANO_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_AD'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_AL_AD: TStringField
      FieldName = 'NR_AL_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_AL_AD'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemNR_ALIQ_AD: TStringField
      FieldName = 'NR_ALIQ_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_ALIQ_AD'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNR_BASE_CALC_AD: TFloatField
      FieldName = 'NR_BASE_CALC_AD'
      Origin = 'DBBROKER.TPO_ITEM.NR_BASE_CALC_AD'
      Visible = False
    end
    object SqlPOItemNR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'DBBROKER.TPO_ITEM.NR_PARCELAS'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemNR_PERIODICIDADE: TStringField
      FieldName = 'NR_PERIODICIDADE'
      Origin = 'DBBROKER.TPO_ITEM.NR_PERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlPOItemNR_ROF_BACEN: TStringField
      FieldName = 'NR_ROF_BACEN'
      Origin = 'DBBROKER.TPO_ITEM.NR_ROF_BACEN'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object SqlPOItemNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.NR_FATURA'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object SqlPOItemPC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'DBBROKER.TPO_ITEM.PC_DESCONTO'
      Visible = False
    end
    object SqlPOItemPC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'DBBROKER.TPO_ITEM.PC_ICMS'
      Visible = False
    end
    object SqlPOItemPC_ICMS_REDUCAO: TFloatField
      FieldName = 'PC_ICMS_REDUCAO'
      Origin = 'DBBROKER.TPO_ITEM.PC_ICMS_REDUCAO'
      Visible = False
    end
    object SqlPOItemPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TPO_ITEM.PC_COMISSAO'
      Visible = False
    end
    object SqlPOItemPL_ITEM: TFloatField
      FieldName = 'PL_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.PL_ITEM'
      Visible = False
    end
    object SqlPOItemQT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'DBBROKER.TPO_ITEM.QT_INICIAL'
      Visible = False
    end
    object SqlPOItemQT_BAIXADA_DI: TFloatField
      FieldName = 'QT_BAIXADA_DI'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXADA_DI'
      Visible = False
    end
    object SqlPOItemQT_BAIXADA_LI: TFloatField
      FieldName = 'QT_BAIXADA_LI'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXADA_LI'
      Visible = False
    end
    object SqlPOItemQT_ESPEC_II: TFloatField
      FieldName = 'QT_ESPEC_II'
      Origin = 'DBBROKER.TPO_ITEM.QT_ESPEC_II'
      Visible = False
    end
    object SqlPOItemQT_ESPEC_IPI: TFloatField
      FieldName = 'QT_ESPEC_IPI'
      Origin = 'DBBROKER.TPO_ITEM.QT_ESPEC_IPI'
      Visible = False
    end
    object SqlPOItemQT_AD: TFloatField
      FieldName = 'QT_AD'
      Origin = 'DBBROKER.TPO_ITEM.QT_AD'
      Visible = False
    end
    object SqlPOItemQT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'DBBROKER.TPO_ITEM.QT_MED_ESTATISTICA'
      Visible = False
    end
    object SqlPOItemTP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      Origin = 'DBBROKER.TPO_ITEM.TP_CALCULO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTP_COMISSAO: TStringField
      FieldName = 'TP_COMISSAO'
      Origin = 'DBBROKER.TPO_ITEM.TP_COMISSAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTP_ACORDO_TARIFARIO: TStringField
      FieldName = 'TP_ACORDO_TARIFARIO'
      Origin = 'DBBROKER.TPO_ITEM.TP_ACORDO_TARIFARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTP_TRIBUTACAO_IPI: TStringField
      FieldName = 'TP_TRIBUTACAO_IPI'
      Origin = 'DBBROKER.TPO_ITEM.TP_TRIBUTACAO_IPI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'DBBROKER.TPO_ITEM.TP_CAMBIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTP_IND_TX_JUROS: TBooleanField
      FieldName = 'TP_IND_TX_JUROS'
      Origin = 'DBBROKER.TPO_ITEM.TP_IND_TX_JUROS'
      Visible = False
    end
    object SqlPOItemTP_IND_PERIODICIDADE: TStringField
      FieldName = 'TP_IND_PERIODICIDADE'
      Origin = 'DBBROKER.TPO_ITEM.TP_IND_PERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTP_RECIPIENTE: TStringField
      FieldName = 'TP_RECIPIENTE'
      Origin = 'DBBROKER.TPO_ITEM.TP_RECIPIENTE'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemTP_IND_MULTIMODAL: TStringField
      FieldName = 'TP_IND_MULTIMODAL'
      Origin = 'DBBROKER.TPO_ITEM.TP_IND_MULTIMODAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TPO_ITEM.TX_MERCADORIA'
      Visible = False
      BlobType = ftMemo
    end
    object SqlPOItemTX_JUROS_CAMBIO: TFloatField
      FieldName = 'TX_JUROS_CAMBIO'
      Origin = 'DBBROKER.TPO_ITEM.TX_JUROS_CAMBIO'
      Visible = False
    end
    object SqlPOItemVL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_DESPESA_MOEDA'
      Visible = False
    end
    object SqlPOItemVL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_DESCONTO_MOEDA'
      Visible = False
    end
    object SqlPOItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'DBBROKER.TPO_ITEM.VL_UNITARIO'
      Visible = False
    end
    object SqlPOItemVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'DBBROKER.TPO_ITEM.VL_TOTAL'
      Visible = False
    end
    object SqlPOItemVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TPO_ITEM.VL_DESCONTO'
      Visible = False
    end
    object SqlPOItemVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TPO_ITEM.VL_COMISSAO'
      Visible = False
    end
    object SqlPOItemVL_ESPEC_II: TFloatField
      FieldName = 'VL_ESPEC_II'
      Origin = 'DBBROKER.TPO_ITEM.VL_ESPEC_II'
      Visible = False
    end
    object SqlPOItemVL_ESPEC_IPI: TFloatField
      FieldName = 'VL_ESPEC_IPI'
      Origin = 'DBBROKER.TPO_ITEM.VL_ESPEC_IPI'
      Visible = False
    end
    object SqlPOItemVL_ESPEC_AD: TFloatField
      FieldName = 'VL_ESPEC_AD'
      Origin = 'DBBROKER.TPO_ITEM.VL_ESPEC_AD'
      Visible = False
    end
    object SqlPOItemVL_TOTAL_PARCELAS: TFloatField
      FieldName = 'VL_TOTAL_PARCELAS'
      Origin = 'DBBROKER.TPO_ITEM.VL_TOTAL_PARCELAS'
      Visible = False
    end
    object SqlPOItemVL_COBERT_ACIMA_360: TFloatField
      FieldName = 'VL_COBERT_ACIMA_360'
      Origin = 'DBBROKER.TPO_ITEM.VL_COBERT_ACIMA_360'
      Visible = False
    end
    object SqlPOItemVL_PAGTO_ANTECIPADO: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'DBBROKER.TPO_ITEM.VL_PAGTO_ANTECIPADO'
      Visible = False
    end
    object SqlPOItemVL_PAGTO_AVISTA: TFloatField
      FieldName = 'VL_PAGTO_AVISTA'
      Origin = 'DBBROKER.TPO_ITEM.VL_PAGTO_AVISTA'
      Visible = False
    end
    object SqlPOItemVL_FRETE_NAC_MOEDA: TFloatField
      FieldName = 'VL_FRETE_NAC_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_FRETE_NAC_MOEDA'
      Visible = False
    end
    object SqlPOItemVL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_SEGURO_MOEDA'
      Visible = False
    end
    object SqlPOItemVL_ACRESC_MOEDA: TFloatField
      FieldName = 'VL_ACRESC_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_ACRESC_MOEDA'
      Visible = False
    end
    object SqlPOItemVL_DEDUC_MOEDA: TFloatField
      FieldName = 'VL_DEDUC_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_DEDUC_MOEDA'
      Visible = False
    end
    object SqlPOItemVL_FRETE_PREPAID_MOEDA: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MOEDA'
      Origin = 'DBBROKER.TPO_ITEM.VL_FRETE_PREPAID_MOEDA'
      Visible = False
    end
    object SqlPOItemVL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'DBBROKER.TPO_ITEM.VL_FRETE_COLLECT'
      Visible = False
    end
    object SqlPOItemIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_SELECIONADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemQT_BAIXAR: TFloatField
      FieldName = 'QT_BAIXAR'
      Origin = 'DBBROKER.TPO_ITEM.QT_BAIXAR'
      Visible = False
    end
    object SqlPOItemQT_DISPONIVEL: TFloatField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'DBBROKER.TPO_ITEM.QT_DISPONIVEL'
      Visible = False
    end
    object SqlPOItemIN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_MONTADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemIN_FABR_EXP_PROD: TStringField
      FieldName = 'IN_FABR_EXP_PROD'
      Origin = 'DBBROKER.TPO_ITEM.IN_FABR_EXP_PROD'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemNR_ANO_EX_NCM: TStringField
      FieldName = 'NR_ANO_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_ANO_EX_NCM'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_NUM_EX_NCM: TStringField
      FieldName = 'NR_NUM_EX_NCM'
      Origin = 'DBBROKER.TPO_ITEM.NR_NUM_EX_NCM'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object SqlPOItemIN_IND_COND_MERC: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'DBBROKER.TPO_ITEM.IN_IND_COND_MERC'
      Visible = False
    end
    object SqlPOItemNM_LOCAL_INCOTERM: TStringField
      FieldName = 'NM_LOCAL_INCOTERM'
      Origin = 'DBBROKER.TPO_ITEM.NM_LOCAL_INCOTERM'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemNM_TIPO_AL_AD: TStringField
      FieldName = 'NM_TIPO_AL_AD'
      Origin = 'DBBROKER.TPO_ITEM.NM_TIPO_AL_AD'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlPOItemIN_IND_PERIODICIDADE: TStringField
      FieldName = 'IN_IND_PERIODICIDADE'
      Origin = 'DBBROKER.TPO_ITEM.IN_IND_PERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemIN_REG_TRIB_IPI: TStringField
      FieldName = 'IN_REG_TRIB_IPI'
      Origin = 'DBBROKER.TPO_ITEM.IN_REG_TRIB_IPI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemQT_INICIAL_EST: TFloatField
      FieldName = 'QT_INICIAL_EST'
      Origin = 'DBBROKER.TPO_ITEM.QT_INICIAL_EST'
      Visible = False
    end
    object SqlPOItemCD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'DBBROKER.TPO_ITEM.CD_USUARIO_MONTA'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemCD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      Origin = 'DBBROKER.TPO_ITEM.CD_MODALIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemNR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'DBBROKER.TPO_ITEM.NR_ATO_DRAWBACK'
      Visible = False
      FixedChar = True
      Size = 13
    end
    object SqlPOItemIN_AVISO_DB: TStringField
      FieldName = 'IN_AVISO_DB'
      Origin = 'DBBROKER.TPO_ITEM.IN_AVISO_DB'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemTX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'DBBROKER.TPO_ITEM.TX_OBSERVACAO'
      Visible = False
      BlobType = ftMemo
    end
    object SqlPOItemIN_REEIMPORTACAO: TStringField
      FieldName = 'IN_REEIMPORTACAO'
      Origin = 'DBBROKER.TPO_ITEM.IN_REEIMPORTACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemCD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TPO_ITEM.CD_AREA'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlPOItemCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TPO_ITEM.CD_LOCAL_DESEMBARQUE'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TPO_ITEM.CD_EMBARCACAO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TPO_ITEM.CD_AGENTE'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlPOItemNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TPO_ITEM.NR_VIAGEM'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object SqlPOItemNR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'DBBROKER.TPO_ITEM.NR_VOO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object SqlPOItemNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'DBBROKER.TPO_ITEM.NR_CONHECIMENTO'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object SqlPOItemNR_COURRIER: TStringField
      FieldName = 'NR_COURRIER'
      Origin = 'DBBROKER.TPO_ITEM.NR_COURRIER'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object SqlPOItemIN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      Origin = 'DBBROKER.TPO_ITEM.IN_CONSOLIDADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemIN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      Origin = 'DBBROKER.TPO_ITEM.IN_URGENTE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemIN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'DBBROKER.TPO_ITEM.IN_SEGURO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemCD_MERC_FORNEC: TStringField
      FieldName = 'CD_MERC_FORNEC'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERC_FORNEC'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object SqlPOItemTP_DRAWBACK: TStringField
      FieldName = 'TP_DRAWBACK'
      Origin = 'DBBROKER.TPO_ITEM.TP_DRAWBACK'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemIN_UTILIZADO_INSTR_DESEMB: TStringField
      FieldName = 'IN_UTILIZADO_INSTR_DESEMB'
      Origin = 'DBBROKER.TPO_ITEM.IN_UTILIZADO_INSTR_DESEMB'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlPOItemDT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.DT_FATURA'
      Visible = False
    end
    object SqlPOItemDT_ABERTURA_ITEM: TDateTimeField
      FieldName = 'DT_ABERTURA_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.DT_ABERTURA_ITEM'
      Visible = False
    end
    object SqlPOItemIN_CORRECAO: TStringField
      FieldName = 'IN_CORRECAO'
      Origin = 'DBBROKER.TPO_ITEM.IN_CORRECAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dtsPoItem: TDataSource
    DataSet = SqlPOItem
    Left = 138
    Top = 54
  end
  object SqlRefCliente: TQuery
    AfterPost = SqlRefClienteAfterPost
    AfterDelete = SqlRefClienteAfterPost
    DatabaseName = 'DBBROKER'
    DataSource = dtsPoItem
    SQL.Strings = (
      'select *  from TREF_CLIENTE'
      'where'
      '  CD_REFERENCIA =:NR_PROCESSO'
      '')
    UpdateObject = UpdateSQL1
    Left = 42
    Top = 315
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object SqlRefClienteNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object SqlRefClienteCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object SqlRefClienteNR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object SqlRefClienteNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_PARCIAL'
    end
    object SqlRefClienteNR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_SEQUENCIA'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlRefClienteCD_REF_EXP: TStringField
      FieldName = 'CD_REF_EXP'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_REF_EXP'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object SqlRefClienteDT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.DT_REFERENCIA'
      Visible = False
    end
    object SqlRefClienteTP_REFERENCIA: TStringField
      FieldName = 'TP_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.TP_REFERENCIA'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlRefClienteCD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_AREA'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlRefClienteIN_FLAG_LI: TStringField
      FieldName = 'IN_FLAG_LI'
      Origin = 'DBBROKER.TREF_CLIENTE.IN_FLAG_LI'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dtsRefCliente: TDataSource
    DataSet = SqlRefCliente
    Left = 124
    Top = 319
  end
  object SqlEstagioProcesso: TQuery
    AfterPost = SqlEstagioProcessoAfterPost
    AfterDelete = SqlEstagioProcessoAfterPost
    DatabaseName = 'DBBROKER'
    DataSource = dtsPoItem
    SQL.Strings = (
      'SELECT * FROM TESTAGIO_PROCESSO '
      'where'
      '  NR_REFERENCIA =:NR_PROCESSO'
      'order by NR_PARCIAL')
    UpdateObject = UpdateSQL2
    Left = 32
    Top = 572
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object SqlEstagioProcessoNR_REFERENCIA: TStringField
      DisplayWidth = 18
      FieldName = 'NR_REFERENCIA'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.NR_REFERENCIA'
      FixedChar = True
      Size = 18
    end
    object SqlEstagioProcessoNR_ITEM_CLIENTE: TStringField
      DisplayWidth = 14
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object SqlEstagioProcessoNR_PARCIAL: TIntegerField
      DisplayWidth = 10
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.NR_PARCIAL'
    end
    object SqlEstagioProcessoNR_PROCESSO_ADM: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROCESSO_ADM'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.NR_PROCESSO_ADM'
      FixedChar = True
      Size = 18
    end
    object SqlEstagioProcessoNR_PROCESSO_DES: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROCESSO_DES'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.NR_PROCESSO_DES'
      FixedChar = True
      Size = 18
    end
    object SqlEstagioProcessoDT_ULT_ALTERACAO: TDateTimeField
      DisplayWidth = 23
      FieldName = 'DT_ULT_ALTERACAO'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.DT_ULT_ALTERACAO'
    end
    object SqlEstagioProcessoNR_PROCESSO_FI: TStringField
      FieldName = 'NR_PROCESSO_FI'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.NR_PROCESSO_FI'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object SqlEstagioProcessoIN_SUBSTITUIDO: TStringField
      FieldName = 'IN_SUBSTITUIDO'
      Origin = 'DBBROKER.TESTAGIO_PROCESSO.IN_SUBSTITUIDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dtsEstagioProcesso: TDataSource
    DataSet = SqlEstagioProcesso
    Left = 131
    Top = 574
  end
  object SqlTFLP_PO_ITEM: TQuery
    AfterPost = SqlTFLP_PO_ITEMAfterPost
    AfterDelete = SqlTFLP_PO_ITEMAfterPost
    DatabaseName = 'DBBROKER'
    DataSource = dtsPoItem
    SQL.Strings = (
      'SELECT * FROM TFLP_PO_ITEM'
      'where'
      '  NR_PROCESSO =:NR_PROCESSO'
      'order by NR_PARCIAL')
    UpdateObject = UpdateSQL3
    Left = 49
    Top = 179
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object SqlTFLP_PO_ITEMNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TFLP_PO_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object SqlTFLP_PO_ITEMNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'DBBROKER.TFLP_PO_ITEM.NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object SqlTFLP_PO_ITEMNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TFLP_PO_ITEM.NR_PARCIAL'
    end
    object SqlTFLP_PO_ITEMNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TFLP_PO_ITEM.NR_ITEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlTFLP_PO_ITEMCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TFLP_PO_ITEM.CD_EVENTO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlTFLP_PO_ITEMIN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      Origin = 'DBBROKER.TFLP_PO_ITEM.IN_APLICAVEL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlTFLP_PO_ITEMCD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'DBBROKER.TFLP_PO_ITEM.CD_RESP_REALIZACAO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object SqlTFLP_PO_ITEMDT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'DBBROKER.TFLP_PO_ITEM.DT_REALIZACAO'
      Visible = False
    end
    object SqlTFLP_PO_ITEMDT_PREVISTA: TDateTimeField
      FieldName = 'DT_PREVISTA'
      Origin = 'DBBROKER.TFLP_PO_ITEM.DT_PREVISTA'
      Visible = False
    end
    object SqlTFLP_PO_ITEMDT_LIMITE: TDateTimeField
      FieldName = 'DT_LIMITE'
      Origin = 'DBBROKER.TFLP_PO_ITEM.DT_LIMITE'
      Visible = False
    end
    object SqlTFLP_PO_ITEMNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
      Origin = 'DBBROKER.TFLP_PO_ITEM.NR_ORDEM'
      Visible = False
    end
    object SqlTFLP_PO_ITEMTX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'DBBROKER.TFLP_PO_ITEM.TX_OBS'
      Visible = False
      BlobType = ftMemo
    end
    object SqlTFLP_PO_ITEMCD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.TFLP_PO_ITEM.CD_STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlTFLP_PO_ITEMCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TFLP_PO_ITEM.CD_UNID_NEG'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlTFLP_PO_ITEMCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TFLP_PO_ITEM.CD_PRODUTO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlTFLP_PO_ITEMNR_PROCESSO_INDAIA: TStringField
      FieldName = 'NR_PROCESSO_INDAIA'
      Origin = 'DBBROKER.TFLP_PO_ITEM.NR_PROCESSO_INDAIA'
      Visible = False
      FixedChar = True
      Size = 18
    end
  end
  object dtsTFLP_PO_ITEM: TDataSource
    DataSet = SqlTFLP_PO_ITEM
    Left = 176
    Top = 177
  end
  object SqlDetalheMerc: TQuery
    AfterPost = SqlDetalheMercAfterPost
    AfterDelete = SqlDetalheMercAfterPost
    DatabaseName = 'DBBROKER'
    DataSource = dtsPoItem
    SQL.Strings = (
      'select *  from TDETALHE_MERCADORIA'
      'where  NR_PROC_PO =:NR_PROCESSO ')
    UpdateObject = updDetalheMerc
    Left = 30
    Top = 443
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object SqlDetalheMercNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object SqlDetalheMercNR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_PROC_PO'
      FixedChar = True
      Size = 18
    end
    object SqlDetalheMercNR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object SqlDetalheMercNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_PARCIAL'
    end
    object SqlDetalheMercNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_ADICAO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlDetalheMercNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_ITEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlDetalheMercCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_EXPORTADOR'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object SqlDetalheMercCD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_FABR_EXPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlDetalheMercCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_FABRICANTE'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object SqlDetalheMercCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_MERCADORIA'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object SqlDetalheMercCD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_NALADI_NCCA'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object SqlDetalheMercCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_NALADI_SH'
      Visible = False
      FixedChar = True
      Size = 8
    end
    object SqlDetalheMercCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_NCM_SH'
      Visible = False
      FixedChar = True
      Size = 11
    end
    object SqlDetalheMercCD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_PAIS_AQUISICAO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlDetalheMercCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_PAIS_ORIGEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlDetalheMercCD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_TIPO_CALCULO_ITEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlDetalheMercCD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.CD_UN_MED_COMERC'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlDetalheMercNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_FATURA'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object SqlDetalheMercPC_DESCONTO_MERC: TFloatField
      FieldName = 'PC_DESCONTO_MERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.PC_DESCONTO_MERC'
      Visible = False
    end
    object SqlDetalheMercPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.PL_MERCADORIA'
      Visible = False
    end
    object SqlDetalheMercQT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.QT_MERC_UN_COMERC'
      Visible = False
    end
    object SqlDetalheMercQT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.QT_MERC_UN_ESTAT'
      Visible = False
    end
    object SqlDetalheMercTX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.TX_DESC_DET_MERC'
      Visible = False
      BlobType = ftMemo
    end
    object SqlDetalheMercVL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DESCONTO_MERC'
      Visible = False
    end
    object SqlDetalheMercVL_FRETE_ITEM: TFloatField
      FieldName = 'VL_FRETE_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_FRETE_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_MCV_ITEM: TFloatField
      FieldName = 'VL_MCV_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_MCV_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_MLE_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_SEGURO_ITEM: TFloatField
      FieldName = 'VL_SEGURO_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_SEGURO_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_UNID_COND_VENDA'
      Visible = False
    end
    object SqlDetalheMercVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_UNITARIO'
      Visible = False
    end
    object SqlDetalheMercNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_OPER_TRAT_PREV'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlDetalheMercNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_PEDIDO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object SqlDetalheMercVL_II_ITEM: TFloatField
      FieldName = 'VL_II_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_II_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_IPI_ITEM: TFloatField
      FieldName = 'VL_IPI_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_IPI_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_AD_ITEM: TFloatField
      FieldName = 'VL_AD_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_AD_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_ICMS_ITEM: TFloatField
      FieldName = 'VL_ICMS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_ICMS_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_MLE_ITEM_MN: TFloatField
      FieldName = 'VL_MLE_ITEM_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_MLE_ITEM_MN'
      Visible = False
    end
    object SqlDetalheMercVL_FRETE_ITEM_MN: TFloatField
      FieldName = 'VL_FRETE_ITEM_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_FRETE_ITEM_MN'
      Visible = False
    end
    object SqlDetalheMercVL_SEGURO_ITEM_MN: TFloatField
      FieldName = 'VL_SEGURO_ITEM_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_SEGURO_ITEM_MN'
      Visible = False
    end
    object SqlDetalheMercVL_MCV_ITEM_MN: TFloatField
      FieldName = 'VL_MCV_ITEM_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_MCV_ITEM_MN'
      Visible = False
    end
    object SqlDetalheMercVL_UNID_COND_VENDA_MN: TFloatField
      FieldName = 'VL_UNID_COND_VENDA_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_UNID_COND_VENDA_MN'
      Visible = False
    end
    object SqlDetalheMercVL_ACRESCIMO_ITEM: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_ACRESCIMO_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_DEDUCAO_ITEM: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DEDUCAO_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_ACRESCIMO_ITEM_MN: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_ACRESCIMO_ITEM_MN'
      Visible = False
    end
    object SqlDetalheMercVL_DEDUCAO_ITEM_MN: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DEDUCAO_ITEM_MN'
      Visible = False
    end
    object SqlDetalheMercVL_DESPESA_ITEM: TFloatField
      FieldName = 'VL_DESPESA_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DESPESA_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_DESPESA_ITEM_MN: TFloatField
      FieldName = 'VL_DESPESA_ITEM_MN'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DESPESA_ITEM_MN'
      Visible = False
    end
    object SqlDetalheMercNR_ORDEM: TSmallintField
      FieldName = 'NR_ORDEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_ORDEM'
      Visible = False
    end
    object SqlDetalheMercVL_DESPESAS_ITEM: TFloatField
      FieldName = 'VL_DESPESAS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DESPESAS_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_DED_CPT_MNEG: TFloatField
      FieldName = 'VL_DED_CPT_MNEG'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_DED_CPT_MNEG'
      Visible = False
    end
    object SqlDetalheMercNR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.NR_DESTAQUE_NCM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlDetalheMercIN_PROVEM_PO: TBooleanField
      FieldName = 'IN_PROVEM_PO'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.IN_PROVEM_PO'
      Visible = False
    end
    object SqlDetalheMercVL_TX_SCX_ITEM: TFloatField
      FieldName = 'VL_TX_SCX_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_TX_SCX_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_PIS_ITEM: TFloatField
      FieldName = 'VL_PIS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_PIS_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_COFINS_ITEM: TFloatField
      FieldName = 'VL_COFINS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_COFINS_ITEM'
      Visible = False
    end
    object SqlDetalheMercVL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_BASE_CALC_II'
      Visible = False
    end
    object SqlDetalheMercFRETE_COLLECT_ITEM: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_COLLECT_ITEM'
      Visible = False
    end
    object SqlDetalheMercFRETE_PREPAID_ITEM: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_PREPAID_ITEM'
      Visible = False
    end
    object SqlDetalheMercFRETE_TNAC_ITEM: TFloatField
      FieldName = 'FRETE_TNAC_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_TNAC_ITEM'
      Visible = False
    end
    object SqlDetalheMercFRETE_COLLECT_ITEM_REAL: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM_REAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_COLLECT_ITEM_REAL'
      Visible = False
    end
    object SqlDetalheMercFRETE_PREPAID_ITEM_REAL: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM_REAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_PREPAID_ITEM_REAL'
      Visible = False
    end
    object SqlDetalheMercFRETE_TNAC_ITEM_REAL: TFloatField
      FieldName = 'FRETE_TNAC_ITEM_REAL'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_TNAC_ITEM_REAL'
      Visible = False
    end
    object SqlDetalheMercFRETE_COLLECT_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_COLLECT_ITEM_DOLAR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_COLLECT_ITEM_DOLAR'
      Visible = False
    end
    object SqlDetalheMercFRETE_PREPAID_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_PREPAID_ITEM_DOLAR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_PREPAID_ITEM_DOLAR'
      Visible = False
    end
    object SqlDetalheMercFRETE_TNAC_ITEM_DOLAR: TFloatField
      FieldName = 'FRETE_TNAC_ITEM_DOLAR'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.FRETE_TNAC_ITEM_DOLAR'
      Visible = False
    end
    object SqlDetalheMercPB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.PB_MERCADORIA'
      Visible = False
    end
    object SqlDetalheMercVL_BASE_ICMS_ITEM: TFloatField
      FieldName = 'VL_BASE_ICMS_ITEM'
      Origin = 'DBBROKER.TDETALHE_MERCADORIA.VL_BASE_ICMS_ITEM'
      Visible = False
    end
  end
  object dtsDetalheMerc: TDataSource
    DataSet = SqlDetalheMerc
    Left = 129
    Top = 438
  end
  object updTPO_ITENS: TUpdateSQL
    ModifySQL.Strings = (
      'update TPO_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_NALADI_SH = :CD_NALADI_SH,'
      '  CD_PAIS_AQUISICAO = :CD_PAIS_AQUISICAO,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  CD_NALADI_NCCA = :CD_NALADI_NCCA,'
      '  CD_MET_VALOR_ADUANEIRA = :CD_MET_VALOR_ADUANEIRA,'
      '  CD_DISP_LEGAL_EXONERA = :CD_DISP_LEGAL_EXONERA,'
      '  CD_MOEDA_NEGOCIADA = :CD_MOEDA_NEGOCIADA,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  CD_ACORDO_ALADI = :CD_ACORDO_ALADI,'
      '  CD_REG_TRIB_II = :CD_REG_TRIB_II,'
      '  CD_FUND_LEGAL_II = :CD_FUND_LEGAL_II,'
      '  CD_UNID_MEDIDA = :CD_UNID_MEDIDA,'
      '  CD_UNID_MED_II = :CD_UNID_MED_II,'
      '  CD_UNID_MED_IPI = :CD_UNID_MED_IPI,'
      '  CD_UNID_MED_AD = :CD_UNID_MED_AD,'
      '  CD_AGENTE_CAMBIO = :CD_AGENTE_CAMBIO,'
      '  CD_MOD_PAGTO = :CD_MOD_PAGTO,'
      '  CD_TX_JUROS = :CD_TX_JUROS,'
      '  CD_INSTITUICAO_FINANC = :CD_INSTITUICAO_FINANC,'
      '  CD_MOT_SEM_COBERT_CAMBIAL = :CD_MOT_SEM_COBERT_CAMBIAL,'
      '  CD_EX_II = :CD_EX_II,'
      '  CD_EX_IPI = :CD_EX_IPI,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_PAIS_PROCEDENCIA = :CD_PAIS_PROCEDENCIA,'
      '  CD_URF_ENTRADA = :CD_URF_ENTRADA,'
      '  IN_NECESSITA_LI = :IN_NECESSITA_LI,'
      '  IN_INDICADOR_COND_MERC = :IN_INDICADOR_COND_MERC,'
      '  IN_COND_MERC = :IN_COND_MERC,'
      '  IN_APLIC_MERC = :IN_APLIC_MERC,'
      '  NM_ORGAO_EMISSOR_AL_EX_NALADI = '
      ':NM_ORGAO_EMISSOR_AL_EX_NALADI,'
      '  NM_AL_EX_NALADI = :NM_AL_EX_NALADI,'
      '  NM_ORGAO_EMISSOR_AL_NCM = :NM_ORGAO_EMISSOR_AL_NCM,'
      '  NM_AL_EX_NALADI_NCCA = :NM_AL_EX_NALADI_NCCA,'
      '  NM_ORG_EMISSOR_EX_NALADI_NCCA = '
      ':NM_ORG_EMISSOR_EX_NALADI_NCCA,'
      '  NM_AL_II = :NM_AL_II,'
      '  NM_ORGAO_EMISSOR_II = :NM_ORGAO_EMISSOR_II,'
      '  NM_ORGAO_EMISSOR_IPI = :NM_ORGAO_EMISSOR_IPI,'
      '  NM_AL_IPI = :NM_AL_IPI,'
      '  NM_AL_AD = :NM_AL_AD,'
      '  NM_ORGAO_EMISSOR_AD = :NM_ORGAO_EMISSOR_AD,'
      '  NM_IDENTIFICACAO = :NM_IDENTIFICACAO,'
      '  NR_ANO_EMISSAO_AL_EX_NALADI = :NR_ANO_EMISSAO_AL_EX_NALADI,'
      '  NR_AL_EX_NALADI = :NR_AL_EX_NALADI,'
      '  NR_EX_NCM = :NR_EX_NCM,'
      '  NR_AL_EX_NCM = :NR_AL_EX_NCM,'
      '  NR_ANO_EMISSAO_AL = :NR_ANO_EMISSAO_AL,'
      '  NR_ATO_LEGAL = :NR_ATO_LEGAL,'
      '  NR_EX_NALADI = :NR_EX_NALADI,'
      '  NR_EX_NALADI_NCCA = :NR_EX_NALADI_NCCA,'
      '  NR_ANO_EMISSAO_EX_NALADI_NCCA = '
      ':NR_ANO_EMISSAO_EX_NALADI_NCCA,'
      '  NR_AL_EX_NALADI_NCCA = :NR_AL_EX_NALADI_NCCA,'
      '  NR_ANO_II = :NR_ANO_II,'
      '  NR_AL_II = :NR_AL_II,'
      '  NR_ALIQ_NORMAL_II = :NR_ALIQ_NORMAL_II,'
      '  NR_ALIQ_ACORDO_II = :NR_ALIQ_ACORDO_II,'
      '  NR_ALIQ_REDUZIDA_II = :NR_ALIQ_REDUZIDA_II,'
      '  NR_ALIQ_PERC_RED_II = :NR_ALIQ_PERC_RED_II,'
      '  NR_ANO_IPI = :NR_ANO_IPI,'
      '  NR_AL_IPI = :NR_AL_IPI,'
      '  NR_NOTA_COMPL_IPI = :NR_NOTA_COMPL_IPI,'
      '  NR_ALIQ_NORMAL_IPI = :NR_ALIQ_NORMAL_IPI,'
      '  NR_ALIQ_REDUZIDA_IPI = :NR_ALIQ_REDUZIDA_IPI,'
      '  NR_ALIQ_PERC_RED_IPI = :NR_ALIQ_PERC_RED_IPI,'
      '  NR_PROC_LI = :NR_PROC_LI,'
      '  NR_EX_AD = :NR_EX_AD,'
      '  NR_ANO_AD = :NR_ANO_AD,'
      '  NR_AL_AD = :NR_AL_AD,'
      '  NR_ALIQ_AD = :NR_ALIQ_AD,'
      '  NR_BASE_CALC_AD = :NR_BASE_CALC_AD,'
      '  NR_PARCELAS = :NR_PARCELAS,'
      '  NR_PERIODICIDADE = :NR_PERIODICIDADE,'
      '  NR_ROF_BACEN = :NR_ROF_BACEN,'
      '  NR_FATURA = :NR_FATURA,'
      '  PC_DESCONTO = :PC_DESCONTO,'
      '  PC_ICMS = :PC_ICMS,'
      '  PC_ICMS_REDUCAO = :PC_ICMS_REDUCAO,'
      '  PC_COMISSAO = :PC_COMISSAO,'
      '  PL_ITEM = :PL_ITEM,'
      '  QT_INICIAL = :QT_INICIAL,'
      '  QT_BAIXADA_DI = :QT_BAIXADA_DI,'
      '  QT_BAIXADA_LI = :QT_BAIXADA_LI,'
      '  QT_ESPEC_II = :QT_ESPEC_II,'
      '  QT_ESPEC_IPI = :QT_ESPEC_IPI,'
      '  QT_AD = :QT_AD,'
      '  QT_MED_ESTATISTICA = :QT_MED_ESTATISTICA,'
      '  TP_CALCULO = :TP_CALCULO,'
      '  TP_COMISSAO = :TP_COMISSAO,'
      '  TP_ACORDO_TARIFARIO = :TP_ACORDO_TARIFARIO,'
      '  TP_TRIBUTACAO_IPI = :TP_TRIBUTACAO_IPI,'
      '  TP_CAMBIO = :TP_CAMBIO,'
      '  TP_IND_TX_JUROS = :TP_IND_TX_JUROS,'
      '  TP_IND_PERIODICIDADE = :TP_IND_PERIODICIDADE,'
      '  TP_RECIPIENTE = :TP_RECIPIENTE,'
      '  TP_IND_MULTIMODAL = :TP_IND_MULTIMODAL,'
      '  TX_MERCADORIA = :TX_MERCADORIA,'
      '  TX_JUROS_CAMBIO = :TX_JUROS_CAMBIO,'
      '  VL_DESPESA_MOEDA = :VL_DESPESA_MOEDA,'
      '  VL_DESCONTO_MOEDA = :VL_DESCONTO_MOEDA,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      '  VL_TOTAL = :VL_TOTAL,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  VL_COMISSAO = :VL_COMISSAO,'
      '  VL_ESPEC_II = :VL_ESPEC_II,'
      '  VL_ESPEC_IPI = :VL_ESPEC_IPI,'
      '  VL_ESPEC_AD = :VL_ESPEC_AD,'
      '  VL_TOTAL_PARCELAS = :VL_TOTAL_PARCELAS,'
      '  VL_COBERT_ACIMA_360 = :VL_COBERT_ACIMA_360,'
      '  VL_PAGTO_ANTECIPADO = :VL_PAGTO_ANTECIPADO,'
      '  VL_PAGTO_AVISTA = :VL_PAGTO_AVISTA,'
      '  VL_FRETE_NAC_MOEDA = :VL_FRETE_NAC_MOEDA,'
      '  VL_SEGURO_MOEDA = :VL_SEGURO_MOEDA,'
      '  VL_ACRESC_MOEDA = :VL_ACRESC_MOEDA,'
      '  VL_DEDUC_MOEDA = :VL_DEDUC_MOEDA,'
      '  VL_FRETE_PREPAID_MOEDA = :VL_FRETE_PREPAID_MOEDA,'
      '  VL_FRETE_COLLECT = :VL_FRETE_COLLECT,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  QT_BAIXAR = :QT_BAIXAR,'
      '  QT_DISPONIVEL = :QT_DISPONIVEL,'
      '  IN_MONTADO = :IN_MONTADO,'
      '  IN_FABR_EXP_PROD = :IN_FABR_EXP_PROD,'
      '  NR_ANO_EX_NCM = :NR_ANO_EX_NCM,'
      '  NR_NUM_EX_NCM = :NR_NUM_EX_NCM,'
      '  IN_IND_COND_MERC = :IN_IND_COND_MERC,'
      '  NM_LOCAL_INCOTERM = :NM_LOCAL_INCOTERM,'
      '  NM_TIPO_AL_AD = :NM_TIPO_AL_AD,'
      '  IN_IND_PERIODICIDADE = :IN_IND_PERIODICIDADE,'
      '  IN_REG_TRIB_IPI = :IN_REG_TRIB_IPI,'
      '  QT_INICIAL_EST = :QT_INICIAL_EST,'
      '  CD_USUARIO_MONTA = :CD_USUARIO_MONTA,'
      '  CD_MODALIDADE = :CD_MODALIDADE,'
      '  NR_ATO_DRAWBACK = :NR_ATO_DRAWBACK,'
      '  IN_AVISO_DB = :IN_AVISO_DB,'
      '  NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE,'
      '  TX_OBSERVACAO = :TX_OBSERVACAO,'
      '  IN_REEIMPORTACAO = :IN_REEIMPORTACAO,'
      '  CD_AREA = :CD_AREA,'
      '  CD_LOCAL_DESEMBARQUE = :CD_LOCAL_DESEMBARQUE,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  NR_VOO = :NR_VOO,'
      '  NR_CONHECIMENTO = :NR_CONHECIMENTO,'
      '  NR_COURRIER = :NR_COURRIER,'
      '  IN_CONSOLIDADO = :IN_CONSOLIDADO,'
      '  IN_URGENTE = :IN_URGENTE,'
      '  IN_SEGURO = :IN_SEGURO,'
      '  CD_MERC_FORNEC = :CD_MERC_FORNEC,'
      '  TP_DRAWBACK = :TP_DRAWBACK,'
      '  IN_UTILIZADO_INSTR_DESEMB = :IN_UTILIZADO_INSTR_DESEMB,'
      '  ID_CODIGO_INSTR_DESEMB = :ID_CODIGO_INSTR_DESEMB,'
      '  DT_FATURA = :DT_FATURA,'
      '  DT_ABERTURA_ITEM = :DT_ABERTURA_ITEM,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  IN_CORRECAO = :IN_CORRECAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TPO_ITEM'
      
        '  (NR_PROCESSO, NR_ITEM, CD_EXPORTADOR, CD_NALADI_SH, CD_PAIS_AQ' +
        'UISICAO, '
      
        '   CD_MERCADORIA, CD_FABRICANTE, CD_PAIS_ORIGEM, CD_NCM_SH, CD_N' +
        'ALADI_NCCA, '
      
        '   CD_MET_VALOR_ADUANEIRA, CD_DISP_LEGAL_EXONERA, CD_MOEDA_NEGOC' +
        'IADA, CD_INCOTERM, '
      
        '   CD_ACORDO_ALADI, CD_REG_TRIB_II, CD_FUND_LEGAL_II, CD_UNID_ME' +
        'DIDA, CD_UNID_MED_II, '
      
        '   CD_UNID_MED_IPI, CD_UNID_MED_AD, CD_AGENTE_CAMBIO, CD_MOD_PAG' +
        'TO, CD_TX_JUROS, '
      
        '   CD_INSTITUICAO_FINANC, CD_MOT_SEM_COBERT_CAMBIAL, CD_EX_II, C' +
        'D_EX_IPI, '
      
        '   CD_VIA_TRANSP, CD_PAIS_PROCEDENCIA, CD_URF_ENTRADA, IN_NECESS' +
        'ITA_LI, '
      
        '   IN_INDICADOR_COND_MERC, IN_COND_MERC, IN_APLIC_MERC, NM_ORGAO' +
        '_EMISSOR_AL_EX_NALADI, '
      
        '   NM_AL_EX_NALADI, NM_ORGAO_EMISSOR_AL_NCM, NM_AL_EX_NALADI_NCC' +
        'A, NM_ORG_EMISSOR_EX_NALADI_NCCA, '
      
        '   NM_AL_II, NM_ORGAO_EMISSOR_II, NM_ORGAO_EMISSOR_IPI, NM_AL_IP' +
        'I, NM_AL_AD, '
      
        '   NM_ORGAO_EMISSOR_AD, NM_IDENTIFICACAO, NR_ANO_EMISSAO_AL_EX_N' +
        'ALADI, '
      
        '   NR_AL_EX_NALADI, NR_EX_NCM, NR_AL_EX_NCM, NR_ANO_EMISSAO_AL, ' +
        'NR_ATO_LEGAL, '
      
        '   NR_EX_NALADI, NR_EX_NALADI_NCCA, NR_ANO_EMISSAO_EX_NALADI_NCC' +
        'A, NR_AL_EX_NALADI_NCCA, '
      
        '   NR_ANO_II, NR_AL_II, NR_ALIQ_NORMAL_II, NR_ALIQ_ACORDO_II, NR' +
        '_ALIQ_REDUZIDA_II, '
      
        '   NR_ALIQ_PERC_RED_II, NR_ANO_IPI, NR_AL_IPI, NR_NOTA_COMPL_IPI' +
        ', NR_ALIQ_NORMAL_IPI, '
      
        '   NR_ALIQ_REDUZIDA_IPI, NR_ALIQ_PERC_RED_IPI, NR_PROC_LI, NR_EX' +
        '_AD, NR_ANO_AD, '
      
        '   NR_AL_AD, NR_ALIQ_AD, NR_BASE_CALC_AD, NR_PARCELAS, NR_PERIOD' +
        'ICIDADE, '
      
        '   NR_ROF_BACEN, NR_FATURA, PC_DESCONTO, PC_ICMS, PC_ICMS_REDUCA' +
        'O, PC_COMISSAO, '
      
        '   PL_ITEM, QT_INICIAL, QT_BAIXADA_DI, QT_BAIXADA_LI, QT_ESPEC_I' +
        'I, QT_ESPEC_IPI, '
      
        '   QT_AD, QT_MED_ESTATISTICA, TP_CALCULO, TP_COMISSAO, TP_ACORDO' +
        '_TARIFARIO, '
      
        '   TP_TRIBUTACAO_IPI, TP_CAMBIO, TP_IND_TX_JUROS, TP_IND_PERIODI' +
        'CIDADE, '
      
        '   TP_RECIPIENTE, TP_IND_MULTIMODAL, TX_MERCADORIA, TX_JUROS_CAM' +
        'BIO, VL_DESPESA_MOEDA, '
      
        '   VL_DESCONTO_MOEDA, VL_UNITARIO, VL_TOTAL, VL_DESCONTO, VL_COM' +
        'ISSAO, '
      
        '   VL_ESPEC_II, VL_ESPEC_IPI, VL_ESPEC_AD, VL_TOTAL_PARCELAS, VL' +
        '_COBERT_ACIMA_360, '
      
        '   VL_PAGTO_ANTECIPADO, VL_PAGTO_AVISTA, VL_FRETE_NAC_MOEDA, VL_' +
        'SEGURO_MOEDA, '
      
        '   VL_ACRESC_MOEDA, VL_DEDUC_MOEDA, VL_FRETE_PREPAID_MOEDA, VL_F' +
        'RETE_COLLECT, '
      
        '   IN_SELECIONADO, QT_BAIXAR, QT_DISPONIVEL, IN_MONTADO, IN_FABR' +
        '_EXP_PROD, '
      
        '   NR_ANO_EX_NCM, NR_NUM_EX_NCM, IN_IND_COND_MERC, NM_LOCAL_INCO' +
        'TERM, NM_TIPO_AL_AD, '
      
        '   IN_IND_PERIODICIDADE, IN_REG_TRIB_IPI, QT_INICIAL_EST, CD_USU' +
        'ARIO_MONTA, '
      
        '   CD_MODALIDADE, NR_ATO_DRAWBACK, IN_AVISO_DB, NR_ITEM_CLIENTE,' +
        ' TX_OBSERVACAO, '
      
        '   IN_REEIMPORTACAO, CD_AREA, CD_LOCAL_DESEMBARQUE, CD_EMBARCACA' +
        'O, CD_AGENTE, '
      
        '   NR_VIAGEM, NR_VOO, NR_CONHECIMENTO, NR_COURRIER, IN_CONSOLIDA' +
        'DO, IN_URGENTE, '
      
        '   IN_SEGURO, CD_MERC_FORNEC, TP_DRAWBACK, IN_UTILIZADO_INSTR_DE' +
        'SEMB, ID_CODIGO_INSTR_DESEMB, '
      '   DT_FATURA, DT_ABERTURA_ITEM, NR_PARCIAL, IN_CORRECAO)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ITEM, :CD_EXPORTADOR, :CD_NALADI_SH, :CD_PA' +
        'IS_AQUISICAO, '
      
        '   :CD_MERCADORIA, :CD_FABRICANTE, :CD_PAIS_ORIGEM, :CD_NCM_SH, ' +
        ':CD_NALADI_NCCA, '
      
        '   :CD_MET_VALOR_ADUANEIRA, :CD_DISP_LEGAL_EXONERA, :CD_MOEDA_NE' +
        'GOCIADA, '
      
        '   :CD_INCOTERM, :CD_ACORDO_ALADI, :CD_REG_TRIB_II, :CD_FUND_LEG' +
        'AL_II, '
      
        '   :CD_UNID_MEDIDA, :CD_UNID_MED_II, :CD_UNID_MED_IPI, :CD_UNID_' +
        'MED_AD, '
      
        '   :CD_AGENTE_CAMBIO, :CD_MOD_PAGTO, :CD_TX_JUROS, :CD_INSTITUIC' +
        'AO_FINANC, '
      
        '   :CD_MOT_SEM_COBERT_CAMBIAL, :CD_EX_II, :CD_EX_IPI, :CD_VIA_TR' +
        'ANSP, :CD_PAIS_PROCEDENCIA, '
      
        '   :CD_URF_ENTRADA, :IN_NECESSITA_LI, :IN_INDICADOR_COND_MERC, :' +
        'IN_COND_MERC, '
      
        '   :IN_APLIC_MERC, :NM_ORGAO_EMISSOR_AL_EX_NALADI, :NM_AL_EX_NAL' +
        'ADI, :NM_ORGAO_EMISSOR_AL_NCM, '
      
        '   :NM_AL_EX_NALADI_NCCA, :NM_ORG_EMISSOR_EX_NALADI_NCCA, :NM_AL' +
        '_II, :NM_ORGAO_EMISSOR_II, '
      
        '   :NM_ORGAO_EMISSOR_IPI, :NM_AL_IPI, :NM_AL_AD, :NM_ORGAO_EMISS' +
        'OR_AD, '
      
        '   :NM_IDENTIFICACAO, :NR_ANO_EMISSAO_AL_EX_NALADI, :NR_AL_EX_NA' +
        'LADI, :NR_EX_NCM, '
      
        '   :NR_AL_EX_NCM, :NR_ANO_EMISSAO_AL, :NR_ATO_LEGAL, :NR_EX_NALA' +
        'DI, :NR_EX_NALADI_NCCA, '
      
        '   :NR_ANO_EMISSAO_EX_NALADI_NCCA, :NR_AL_EX_NALADI_NCCA, :NR_AN' +
        'O_II, :NR_AL_II, '
      
        '   :NR_ALIQ_NORMAL_II, :NR_ALIQ_ACORDO_II, :NR_ALIQ_REDUZIDA_II,' +
        ' :NR_ALIQ_PERC_RED_II, '
      
        '   :NR_ANO_IPI, :NR_AL_IPI, :NR_NOTA_COMPL_IPI, :NR_ALIQ_NORMAL_' +
        'IPI, :NR_ALIQ_REDUZIDA_IPI, '
      
        '   :NR_ALIQ_PERC_RED_IPI, :NR_PROC_LI, :NR_EX_AD, :NR_ANO_AD, :N' +
        'R_AL_AD, '
      
        '   :NR_ALIQ_AD, :NR_BASE_CALC_AD, :NR_PARCELAS, :NR_PERIODICIDAD' +
        'E, :NR_ROF_BACEN, '
      
        '   :NR_FATURA, :PC_DESCONTO, :PC_ICMS, :PC_ICMS_REDUCAO, :PC_COM' +
        'ISSAO, '
      
        '   :PL_ITEM, :QT_INICIAL, :QT_BAIXADA_DI, :QT_BAIXADA_LI, :QT_ES' +
        'PEC_II, '
      
        '   :QT_ESPEC_IPI, :QT_AD, :QT_MED_ESTATISTICA, :TP_CALCULO, :TP_' +
        'COMISSAO, '
      
        '   :TP_ACORDO_TARIFARIO, :TP_TRIBUTACAO_IPI, :TP_CAMBIO, :TP_IND' +
        '_TX_JUROS, '
      
        '   :TP_IND_PERIODICIDADE, :TP_RECIPIENTE, :TP_IND_MULTIMODAL, :T' +
        'X_MERCADORIA, '
      
        '   :TX_JUROS_CAMBIO, :VL_DESPESA_MOEDA, :VL_DESCONTO_MOEDA, :VL_' +
        'UNITARIO, '
      
        '   :VL_TOTAL, :VL_DESCONTO, :VL_COMISSAO, :VL_ESPEC_II, :VL_ESPE' +
        'C_IPI, '
      
        '   :VL_ESPEC_AD, :VL_TOTAL_PARCELAS, :VL_COBERT_ACIMA_360, :VL_P' +
        'AGTO_ANTECIPADO, '
      
        '   :VL_PAGTO_AVISTA, :VL_FRETE_NAC_MOEDA, :VL_SEGURO_MOEDA, :VL_' +
        'ACRESC_MOEDA, '
      
        '   :VL_DEDUC_MOEDA, :VL_FRETE_PREPAID_MOEDA, :VL_FRETE_COLLECT, ' +
        ':IN_SELECIONADO, '
      
        '   :QT_BAIXAR, :QT_DISPONIVEL, :IN_MONTADO, :IN_FABR_EXP_PROD, :' +
        'NR_ANO_EX_NCM, '
      
        '   :NR_NUM_EX_NCM, :IN_IND_COND_MERC, :NM_LOCAL_INCOTERM, :NM_TI' +
        'PO_AL_AD, '
      
        '   :IN_IND_PERIODICIDADE, :IN_REG_TRIB_IPI, :QT_INICIAL_EST, :CD' +
        '_USUARIO_MONTA, '
      
        '   :CD_MODALIDADE, :NR_ATO_DRAWBACK, :IN_AVISO_DB, :NR_ITEM_CLIE' +
        'NTE, :TX_OBSERVACAO, '
      
        '   :IN_REEIMPORTACAO, :CD_AREA, :CD_LOCAL_DESEMBARQUE, :CD_EMBAR' +
        'CACAO, '
      
        '   :CD_AGENTE, :NR_VIAGEM, :NR_VOO, :NR_CONHECIMENTO, :NR_COURRI' +
        'ER, :IN_CONSOLIDADO, '
      
        '   :IN_URGENTE, :IN_SEGURO, :CD_MERC_FORNEC, :TP_DRAWBACK, :IN_U' +
        'TILIZADO_INSTR_DESEMB, '
      
        '   :ID_CODIGO_INSTR_DESEMB, :DT_FATURA, :DT_ABERTURA_ITEM, :NR_P' +
        'ARCIAL, '
      '   :IN_CORRECAO)')
    DeleteSQL.Strings = (
      'delete from TPO_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 247
    Top = 56
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update TREF_CLIENTE'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_SEQUENCIA = :NR_SEQUENCIA,'
      '  CD_REFERENCIA = :CD_REFERENCIA,'
      '  CD_REF_EXP = :CD_REF_EXP,'
      '  DT_REFERENCIA = :DT_REFERENCIA,'
      '  TP_REFERENCIA = :TP_REFERENCIA,'
      '  CD_AREA = :CD_AREA,'
      '  NR_ITEM_PO = :NR_ITEM_PO,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  IN_FLAG_LI = :IN_FLAG_LI'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into TREF_CLIENTE'
      
        '  (NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, CD_REF_EXP, DT_REFE' +
        'RENCIA, '
      '   TP_REFERENCIA, CD_AREA, NR_ITEM_PO, NR_PARCIAL, IN_FLAG_LI)'
      'values'
      
        '  (:NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, :CD_REF_EXP, :DT' +
        '_REFERENCIA, '
      
        '   :TP_REFERENCIA, :CD_AREA, :NR_ITEM_PO, :NR_PARCIAL, :IN_FLAG_' +
        'LI)')
    DeleteSQL.Strings = (
      'delete from TREF_CLIENTE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SEQUENCIA = :OLD_NR_SEQUENCIA')
    Left = 250
    Top = 317
  end
  object UpdateSQL2: TUpdateSQL
    ModifySQL.Strings = (
      'update TESTAGIO_PROCESSO'
      'set'
      '  NR_REFERENCIA = :NR_REFERENCIA,'
      '  NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE,'
      '  DT_ULT_ALTERACAO = :DT_ULT_ALTERACAO,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  NR_PROCESSO_ADM = :NR_PROCESSO_ADM,'
      '  NR_PROCESSO_DES = :NR_PROCESSO_DES,'
      '  NR_PROCESSO_FI = :NR_PROCESSO_FI,'
      '  IN_SUBSTITUIDO = :IN_SUBSTITUIDO'
      'where'
      '  NR_REFERENCIA = :OLD_NR_REFERENCIA and'
      '  NR_ITEM_CLIENTE = :OLD_NR_ITEM_CLIENTE and'
      '  DT_ULT_ALTERACAO = :OLD_DT_ULT_ALTERACAO and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL')
    InsertSQL.Strings = (
      'insert into TESTAGIO_PROCESSO'
      
        '  (NR_REFERENCIA, NR_ITEM_CLIENTE, DT_ULT_ALTERACAO, NR_PARCIAL,' +
        ' NR_PROCESSO_ADM, '
      '   NR_PROCESSO_DES, NR_PROCESSO_FI, IN_SUBSTITUIDO)'
      'values'
      
        '  (:NR_REFERENCIA, :NR_ITEM_CLIENTE, :DT_ULT_ALTERACAO, :NR_PARC' +
        'IAL, :NR_PROCESSO_ADM, '
      '   :NR_PROCESSO_DES, :NR_PROCESSO_FI, :IN_SUBSTITUIDO)')
    DeleteSQL.Strings = (
      'delete from TESTAGIO_PROCESSO'
      'where'
      '  NR_REFERENCIA = :OLD_NR_REFERENCIA and'
      '  NR_ITEM_CLIENTE = :OLD_NR_ITEM_CLIENTE and'
      '  DT_ULT_ALTERACAO = :OLD_DT_ULT_ALTERACAO and'
      '  NR_PARCIAL = :OLD_NR_PARCIAL')
    Left = 256
    Top = 580
  end
  object UpdateSQL3: TUpdateSQL
    ModifySQL.Strings = (
      'update TFLP_PO_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_EVENTO = :CD_EVENTO,'
      '  IN_APLICAVEL = :IN_APLICAVEL,'
      '  CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO,'
      '  DT_REALIZACAO = :DT_REALIZACAO,'
      '  DT_PREVISTA = :DT_PREVISTA,'
      '  DT_LIMITE = :DT_LIMITE,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  TX_OBS = :TX_OBS,'
      '  CD_STATUS = :CD_STATUS,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_PROCESSO_INDAIA = :NR_PROCESSO_INDAIA,'
      '  NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE,'
      '  NR_PARCIAL = :NR_PARCIAL'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    InsertSQL.Strings = (
      'insert into TFLP_PO_ITEM'
      
        '  (NR_PROCESSO, NR_ITEM, CD_EVENTO, IN_APLICAVEL, CD_RESP_REALIZ' +
        'ACAO, DT_REALIZACAO, '
      
        '   DT_PREVISTA, DT_LIMITE, NR_ORDEM, TX_OBS, CD_STATUS, CD_UNID_' +
        'NEG, CD_PRODUTO, '
      '   NR_PROCESSO_INDAIA, NR_ITEM_CLIENTE, NR_PARCIAL)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ITEM, :CD_EVENTO, :IN_APLICAVEL, :CD_RESP_R' +
        'EALIZACAO, '
      
        '   :DT_REALIZACAO, :DT_PREVISTA, :DT_LIMITE, :NR_ORDEM, :TX_OBS,' +
        ' :CD_STATUS, '
      
        '   :CD_UNID_NEG, :CD_PRODUTO, :NR_PROCESSO_INDAIA, :NR_ITEM_CLIE' +
        'NTE, :NR_PARCIAL)')
    DeleteSQL.Strings = (
      'delete from TFLP_PO_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    Left = 283
    Top = 175
  end
  object updDetalheMerc: TUpdateSQL
    ModifySQL.Strings = (
      'update TDETALHE_MERCADORIA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_FABR_EXPO = :CD_FABR_EXPO,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  CD_NALADI_NCCA = :CD_NALADI_NCCA,'
      '  CD_NALADI_SH = :CD_NALADI_SH,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  CD_PAIS_AQUISICAO = :CD_PAIS_AQUISICAO,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  CD_TIPO_CALCULO_ITEM = :CD_TIPO_CALCULO_ITEM,'
      '  CD_UN_MED_COMERC = :CD_UN_MED_COMERC,'
      '  NR_FATURA = :NR_FATURA,'
      '  PC_DESCONTO_MERC = :PC_DESCONTO_MERC,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_MERC_UN_COMERC = :QT_MERC_UN_COMERC,'
      '  QT_MERC_UN_ESTAT = :QT_MERC_UN_ESTAT,'
      '  TX_DESC_DET_MERC = :TX_DESC_DET_MERC,'
      '  VL_DESCONTO_MERC = :VL_DESCONTO_MERC,'
      '  VL_FRETE_ITEM = :VL_FRETE_ITEM,'
      '  VL_MCV_ITEM = :VL_MCV_ITEM,'
      '  VL_MLE_ITEM = :VL_MLE_ITEM,'
      '  VL_SEGURO_ITEM = :VL_SEGURO_ITEM,'
      '  VL_UNID_COND_VENDA = :VL_UNID_COND_VENDA,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      '  NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV,'
      '  NR_PEDIDO = :NR_PEDIDO,'
      '  VL_II_ITEM = :VL_II_ITEM,'
      '  VL_IPI_ITEM = :VL_IPI_ITEM,'
      '  VL_AD_ITEM = :VL_AD_ITEM,'
      '  VL_ICMS_ITEM = :VL_ICMS_ITEM,'
      '  VL_MLE_ITEM_MN = :VL_MLE_ITEM_MN,'
      '  VL_FRETE_ITEM_MN = :VL_FRETE_ITEM_MN,'
      '  VL_SEGURO_ITEM_MN = :VL_SEGURO_ITEM_MN,'
      '  VL_MCV_ITEM_MN = :VL_MCV_ITEM_MN,'
      '  VL_UNID_COND_VENDA_MN = :VL_UNID_COND_VENDA_MN,'
      '  VL_ACRESCIMO_ITEM = :VL_ACRESCIMO_ITEM,'
      '  VL_DEDUCAO_ITEM = :VL_DEDUCAO_ITEM,'
      '  VL_ACRESCIMO_ITEM_MN = :VL_ACRESCIMO_ITEM_MN,'
      '  VL_DEDUCAO_ITEM_MN = :VL_DEDUCAO_ITEM_MN,'
      '  VL_DESPESA_ITEM = :VL_DESPESA_ITEM,'
      '  VL_DESPESA_ITEM_MN = :VL_DESPESA_ITEM_MN,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  NR_ITEM_PO = :NR_ITEM_PO,'
      '  NR_PROC_PO = :NR_PROC_PO,'
      '  VL_DESPESAS_ITEM = :VL_DESPESAS_ITEM,'
      '  VL_DED_CPT_MNEG = :VL_DED_CPT_MNEG,'
      '  NR_DESTAQUE_NCM = :NR_DESTAQUE_NCM,'
      '  IN_PROVEM_PO = :IN_PROVEM_PO,'
      '  VL_TX_SCX_ITEM = :VL_TX_SCX_ITEM,'
      '  VL_PIS_ITEM = :VL_PIS_ITEM,'
      '  VL_COFINS_ITEM = :VL_COFINS_ITEM,'
      '  VL_BASE_CALC_II = :VL_BASE_CALC_II,'
      '  FRETE_COLLECT_ITEM = :FRETE_COLLECT_ITEM,'
      '  FRETE_PREPAID_ITEM = :FRETE_PREPAID_ITEM,'
      '  FRETE_TNAC_ITEM = :FRETE_TNAC_ITEM,'
      '  FRETE_COLLECT_ITEM_REAL = :FRETE_COLLECT_ITEM_REAL,'
      '  FRETE_PREPAID_ITEM_REAL = :FRETE_PREPAID_ITEM_REAL,'
      '  FRETE_TNAC_ITEM_REAL = :FRETE_TNAC_ITEM_REAL,'
      '  FRETE_COLLECT_ITEM_DOLAR = :FRETE_COLLECT_ITEM_DOLAR,'
      '  FRETE_PREPAID_ITEM_DOLAR = :FRETE_PREPAID_ITEM_DOLAR,'
      '  FRETE_TNAC_ITEM_DOLAR = :FRETE_TNAC_ITEM_DOLAR,'
      '  PB_MERCADORIA = :PB_MERCADORIA,'
      '  VL_BASE_ICMS_ITEM = :VL_BASE_ICMS_ITEM,'
      '  NR_PARCIAL = :NR_PARCIAL'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TDETALHE_MERCADORIA'
      
        '  (NR_PROCESSO, NR_ADICAO, NR_ITEM, CD_EXPORTADOR, CD_FABR_EXPO,' +
        ' CD_FABRICANTE, '
      
        '   CD_MERCADORIA, CD_NALADI_NCCA, CD_NALADI_SH, CD_NCM_SH, CD_PA' +
        'IS_AQUISICAO, '
      
        '   CD_PAIS_ORIGEM, CD_TIPO_CALCULO_ITEM, CD_UN_MED_COMERC, NR_FA' +
        'TURA, PC_DESCONTO_MERC, '
      
        '   PL_MERCADORIA, QT_MERC_UN_COMERC, QT_MERC_UN_ESTAT, TX_DESC_D' +
        'ET_MERC, '
      
        '   VL_DESCONTO_MERC, VL_FRETE_ITEM, VL_MCV_ITEM, VL_MLE_ITEM, VL' +
        '_SEGURO_ITEM, '
      
        '   VL_UNID_COND_VENDA, VL_UNITARIO, NR_OPER_TRAT_PREV, NR_PEDIDO' +
        ', VL_II_ITEM, '
      
        '   VL_IPI_ITEM, VL_AD_ITEM, VL_ICMS_ITEM, VL_MLE_ITEM_MN, VL_FRE' +
        'TE_ITEM_MN, '
      
        '   VL_SEGURO_ITEM_MN, VL_MCV_ITEM_MN, VL_UNID_COND_VENDA_MN, VL_' +
        'ACRESCIMO_ITEM, '
      
        '   VL_DEDUCAO_ITEM, VL_ACRESCIMO_ITEM_MN, VL_DEDUCAO_ITEM_MN, VL' +
        '_DESPESA_ITEM, '
      
        '   VL_DESPESA_ITEM_MN, NR_ORDEM, NR_ITEM_PO, NR_PROC_PO, VL_DESP' +
        'ESAS_ITEM, '
      
        '   VL_DED_CPT_MNEG, NR_DESTAQUE_NCM, IN_PROVEM_PO, VL_TX_SCX_ITE' +
        'M, VL_PIS_ITEM, '
      
        '   VL_COFINS_ITEM, VL_BASE_CALC_II, FRETE_COLLECT_ITEM, FRETE_PR' +
        'EPAID_ITEM, '
      
        '   FRETE_TNAC_ITEM, FRETE_COLLECT_ITEM_REAL, FRETE_PREPAID_ITEM_' +
        'REAL, FRETE_TNAC_ITEM_REAL, '
      
        '   FRETE_COLLECT_ITEM_DOLAR, FRETE_PREPAID_ITEM_DOLAR, FRETE_TNA' +
        'C_ITEM_DOLAR, '
      '   PB_MERCADORIA, VL_BASE_ICMS_ITEM, NR_PARCIAL)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ADICAO, :NR_ITEM, :CD_EXPORTADOR, :CD_FABR_' +
        'EXPO, :CD_FABRICANTE, '
      
        '   :CD_MERCADORIA, :CD_NALADI_NCCA, :CD_NALADI_SH, :CD_NCM_SH, :' +
        'CD_PAIS_AQUISICAO, '
      
        '   :CD_PAIS_ORIGEM, :CD_TIPO_CALCULO_ITEM, :CD_UN_MED_COMERC, :N' +
        'R_FATURA, '
      
        '   :PC_DESCONTO_MERC, :PL_MERCADORIA, :QT_MERC_UN_COMERC, :QT_ME' +
        'RC_UN_ESTAT, '
      
        '   :TX_DESC_DET_MERC, :VL_DESCONTO_MERC, :VL_FRETE_ITEM, :VL_MCV' +
        '_ITEM, '
      
        '   :VL_MLE_ITEM, :VL_SEGURO_ITEM, :VL_UNID_COND_VENDA, :VL_UNITA' +
        'RIO, :NR_OPER_TRAT_PREV, '
      
        '   :NR_PEDIDO, :VL_II_ITEM, :VL_IPI_ITEM, :VL_AD_ITEM, :VL_ICMS_' +
        'ITEM, :VL_MLE_ITEM_MN, '
      
        '   :VL_FRETE_ITEM_MN, :VL_SEGURO_ITEM_MN, :VL_MCV_ITEM_MN, :VL_U' +
        'NID_COND_VENDA_MN, '
      
        '   :VL_ACRESCIMO_ITEM, :VL_DEDUCAO_ITEM, :VL_ACRESCIMO_ITEM_MN, ' +
        ':VL_DEDUCAO_ITEM_MN, '
      
        '   :VL_DESPESA_ITEM, :VL_DESPESA_ITEM_MN, :NR_ORDEM, :NR_ITEM_PO' +
        ', :NR_PROC_PO, '
      
        '   :VL_DESPESAS_ITEM, :VL_DED_CPT_MNEG, :NR_DESTAQUE_NCM, :IN_PR' +
        'OVEM_PO, '
      
        '   :VL_TX_SCX_ITEM, :VL_PIS_ITEM, :VL_COFINS_ITEM, :VL_BASE_CALC' +
        '_II, :FRETE_COLLECT_ITEM, '
      
        '   :FRETE_PREPAID_ITEM, :FRETE_TNAC_ITEM, :FRETE_COLLECT_ITEM_RE' +
        'AL, :FRETE_PREPAID_ITEM_REAL, '
      
        '   :FRETE_TNAC_ITEM_REAL, :FRETE_COLLECT_ITEM_DOLAR, :FRETE_PREP' +
        'AID_ITEM_DOLAR, '
      
        '   :FRETE_TNAC_ITEM_DOLAR, :PB_MERCADORIA, :VL_BASE_ICMS_ITEM, :' +
        'NR_PARCIAL)')
    DeleteSQL.Strings = (
      'delete from TDETALHE_MERCADORIA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 236
    Top = 436
  end
end

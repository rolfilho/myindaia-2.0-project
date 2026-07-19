object frmProcessoFatoresEvento: TfrmProcessoFatoresEvento
  Left = 352
  Top = 107
  Width = 809
  Height = 480
  Caption = 'Fatores do Followup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 801
    Height = 453
    Align = alClient
    TabOrder = 0
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = ds_Processo_Fatores_Evento
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Header = cxsHeader
      Styles.BandHeader = cxsHeader
      Bands = <
        item
          Caption = 'Fator'
        end
        item
          Caption = 'Evento'
        end
        item
          Caption = 'Evento Anterior'
        end
        item
          Caption = 'Servi'#231'o'
        end
        item
          Caption = 'Opera'#231#227'o'
        end>
      object cxGrid1DBBandedTableView1CD_FATOR: TcxGridDBBandedColumn
        Caption = 'C'#243'digo'
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'CD_FATOR'
      end
      object cxGrid1DBBandedTableView1NM_FATOR: TcxGridDBBandedColumn
        Caption = 'Nome'
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'NM_FATOR'
      end
      object cxGrid1DBBandedTableView1CD_EVENTO: TcxGridDBBandedColumn
        Caption = 'C'#243'digo'
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'CD_EVENTO'
      end
      object cxGrid1DBBandedTableView1NM_EVENTO: TcxGridDBBandedColumn
        Caption = 'Nome'
        Width = 150
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'NM_EVENTO'
      end
      object cxGrid1DBBandedTableView1CD_SERVICO: TcxGridDBBandedColumn
        Caption = 'C'#243'digo'
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'CD_SERVICO'
      end
      object cxGrid1DBBandedTableView1NM_SERVICO: TcxGridDBBandedColumn
        Caption = 'Nome'
        Width = 150
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'NM_SERVICO'
      end
      object cxGrid1DBBandedTableView1NM_OPERACAO: TcxGridDBBandedColumn
        Caption = 'Tipo'
        Width = 150
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'NM_OPERACAO'
      end
      object cxGrid1DBBandedTableView1DT_OPERACAO: TcxGridDBBandedColumn
        Caption = 'Data'
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'DT_OPERACAO'
      end
      object cxGrid1DBBandedTableView1CD_EVENTO_ANTERIOR: TcxGridDBBandedColumn
        Caption = 'C'#243'digo'
        Width = 100
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'CD_EVENTO_ANTERIOR'
      end
      object cxGrid1DBBandedTableView1NM_EVENTO_ANTERIOR: TcxGridDBBandedColumn
        Caption = 'Nome'
        Width = 150
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'NM_EVENTO_ANTERIOR'
      end
      object cxGrid1DBBandedTableView1NM_DESCRICAO: TcxGridDBBandedColumn
        Caption = 'Descri'#231#227'o da Opera'#231#227'o'
        Width = 600
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'NM_DESCRICAO'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object ds_Processo_Fatores_Evento: TDataSource
    AutoEdit = False
    DataSet = qry_Processo_Fatores_Evento
    Left = 64
    Top = 136
  end
  object qry_Processo_Fatores_Evento: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PFE.CD_FATOR, ISNULL(RTRIM(F.NM_FATOR), '#39'-'#39') AS NM_FATOR,'
      '       PFE.CD_EVENTO, RTRIM(E.NM_EVENTO) AS NM_EVENTO,'
      
        '       PFE.CD_SERVICO, ISNULL(RTRIM(SN.NM_SERVICO), '#39'Todos'#39') AS ' +
        'NM_SERVICO,'
      '       ISNULL(OFE.NM_OPERACAO, '#39'B'#225'sico'#39') AS NM_OPERACAO,'
      '       PFE.DT_OPERACAO,'
      
        '       PFE.CD_EVENTO_ANTERIOR, RTRIM(EA.NM_EVENTO) AS NM_EVENTO_' +
        'ANTERIOR,'
      '       PFE.NM_DESCRICAO'
      'FROM TPROCESSO_FATORES_EVENTO         PFE (NOLOCK)'
      
        '   LEFT JOIN TFATORES                 F   (NOLOCK) ON F.CD_FATOR' +
        ' = PFE.CD_FATOR'
      
        '   LEFT JOIN TEVENTO                  E   (NOLOCK) ON E.CD_EVENT' +
        'O = PFE.CD_EVENTO'
      
        '   LEFT JOIN TSERVICO_NOVO            SN  (NOLOCK) ON SN.CD_SERV' +
        'ICO = PFE.CD_SERVICO'
      
        '   LEFT JOIN VW_OPERACAO_FATOR_EVENTO OFE          ON OFE.CD_OPE' +
        'RACAO = PFE.CD_OPERACAO'
      
        '   LEFT JOIN TEVENTO                  EA  (NOLOCK) ON EA.CD_EVEN' +
        'TO = PFE.CD_EVENTO_ANTERIOR'
      'WHERE PFE.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY PFE.NR_ORDEM')
    Left = 112
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_Processo_Fatores_EventoCD_FATOR: TIntegerField
      FieldName = 'CD_FATOR'
    end
    object qry_Processo_Fatores_EventoNM_FATOR: TStringField
      FieldName = 'NM_FATOR'
      FixedChar = True
      Size = 255
    end
    object qry_Processo_Fatores_EventoCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qry_Processo_Fatores_EventoNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qry_Processo_Fatores_EventoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
    end
    object qry_Processo_Fatores_EventoNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_Processo_Fatores_EventoNM_OPERACAO: TStringField
      FieldName = 'NM_OPERACAO'
      FixedChar = True
      Size = 8
    end
    object qry_Processo_Fatores_EventoDT_OPERACAO: TDateTimeField
      FieldName = 'DT_OPERACAO'
    end
    object qry_Processo_Fatores_EventoCD_EVENTO_ANTERIOR: TStringField
      FieldName = 'CD_EVENTO_ANTERIOR'
      FixedChar = True
      Size = 3
    end
    object qry_Processo_Fatores_EventoNM_EVENTO_ANTERIOR: TStringField
      FieldName = 'NM_EVENTO_ANTERIOR'
      FixedChar = True
      Size = 50
    end
    object qry_Processo_Fatores_EventoNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      FixedChar = True
      Size = 255
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 272
    Top = 160
    object cxsHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 216
    object Editar1: TMenuItem
      Caption = 'Editar'
      Visible = False
      object Copiar1: TMenuItem
        Caption = 'Copiar'
        ShortCut = 16451
        OnClick = Copiar1Click
      end
      object CopiarLinha1: TMenuItem
        Caption = 'Copiar Linha'
        ShortCut = 24643
        OnClick = CopiarLinha1Click
      end
    end
  end
end

object frm_lead_time: Tfrm_lead_time
  Left = 332
  Top = 79
  Width = 725
  Height = 624
  Caption = 'Lead Time'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 4
    Top = 10
    Width = 709
    Height = 577
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds_lead_time_exp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object cxgridlead_cliente: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OEMConvert = True
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 150
        DataBinding.FieldName = 'CLIENTE'
      end
      object cxgridlead_local_desembarque: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OEMConvert = True
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 150
        DataBinding.FieldName = 'lOCAL_DESEMBARQUE'
      end
      object cxgridlead_vl_lead_time: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        SortOrder = soAscending
        Width = 115
        DataBinding.FieldName = 'VL_LEAD_TIME'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object qry_lead_time_exp: TQuery
    CachedUpdates = True
    AfterPost = qry_lead_time_expAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT LT.CD_CLIENTE, EN.NM_EMPRESA AS CLIENTE,'
      
        '       LT.CD_LOCAL_DESEMBARQUE, LD.DESCRICAO AS LOCAL_DESEMBARQU' +
        'E,'
      '       LT.VL_LEAD_TIME, LT.CD_USUARIO, LT.NR_PROCESSO_CRIACAO'
      'FROM TLEAD_TIME_EXP LT'
      '   LEFT JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = LT.CD_CLIENTE'
      
        '   LEFT JOIN TLOCAL_EMBARQUE LD ON LD.CODIGO = LT.CD_LOCAL_DESEM' +
        'BARQUE')
    UpdateObject = up_lead_time_exp
    Left = 448
    Top = 184
    object qry_lead_time_expCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qry_lead_time_expCLIENTE: TStringField
      FieldName = 'CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_lead_time_expCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_lead_time_expLOCAL_DESEMBARQUE: TStringField
      FieldName = 'LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qry_lead_time_expVL_LEAD_TIME: TIntegerField
      FieldName = 'VL_LEAD_TIME'
    end
    object qry_lead_time_expCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_lead_time_expNR_PROCESSO_CRIACAO: TStringField
      FieldName = 'NR_PROCESSO_CRIACAO'
      FixedChar = True
      Size = 18
    end
  end
  object ds_lead_time_exp: TDataSource
    DataSet = qry_lead_time_exp
    Left = 336
    Top = 184
  end
  object up_lead_time_exp: TUpdateSQL
    ModifySQL.Strings = (
      'update TLEAD_TIME_EXP'
      'set'
      '  VL_LEAD_TIME = :VL_LEAD_TIME'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_LOCAL_DESEMBARQUE = :OLD_CD_LOCAL_DESEMBARQUE')
    InsertSQL.Strings = (
      'insert into TLEAD_TIME_EXP'
      '  (VL_LEAD_TIME)'
      'values'
      '  (:VL_LEAD_TIME)')
    DeleteSQL.Strings = (
      'delete from TLEAD_TIME_EXP'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_LOCAL_DESEMBARQUE = :OLD_CD_LOCAL_DESEMBARQUE')
    Left = 184
    Top = 272
  end
end

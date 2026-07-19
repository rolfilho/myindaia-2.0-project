object frm_transit_time: Tfrm_transit_time
  Left = 333
  Top = 109
  Width = 725
  Height = 624
  Caption = 'Transit Time'
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
    Left = 0
    Top = 29
    Width = 709
    Height = 557
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds_transit_time_exp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Header = cxsHeader
      object cxgridtransit_local_desembarque: TcxGridDBColumn
        Caption = 'Local de Desembarque'
        DataBinding.FieldName = 'lOCAL_DESEMBARQUE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OEMConvert = True
        Properties.ReadOnly = True
        Options.Editing = False
        Width = 150
      end
      object cxgridtransit_local_embarque: TcxGridDBColumn
        Caption = 'Local de Embarque'
        DataBinding.FieldName = 'LOCAL_EMBARQUE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OEMConvert = True
        Options.Editing = False
        Width = 145
      end
      object cxgridtransit_local_transbordo: TcxGridDBColumn
        Caption = 'Local de Transbordo'
        DataBinding.FieldName = 'LOCAL_TRANSBORDO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OEMConvert = True
        Options.Editing = False
        Width = 144
      end
      object cxgridtransit_agente: TcxGridDBColumn
        Caption = 'Agente'
        DataBinding.FieldName = 'NM_AGENTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OEMConvert = True
        Options.Editing = False
        Width = 127
      end
      object cxggridtransit_via_transporte: TcxGridDBColumn
        Caption = 'Via de Transporte'
        DataBinding.FieldName = 'NM_VIA_TRANSPORTE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OEMConvert = True
        Options.Editing = False
        Width = 150
      end
      object cxgridtransit_vl_transit_time: TcxGridDBColumn
        Caption = 'Transit Time'
        DataBinding.FieldName = 'VL_TRANSIT_TIME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 115
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 29
    Align = alTop
    TabOrder = 1
    object btnExcel: TSpeedButton
      Left = 3
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Exportar para Excel'
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006A006A6A6A006A006A6A6A006A
        006A6A6A006A006A6A6A006A006A6A6A006A006A6A6A006A006A6A6A006A006A
        6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A6A6A006A00
        6A6A6A006A006A6A6A006A006A6A6A006A006A6A6A006A006A6A6A006A006A6A
        6A006A006A6A6A006A0092635DA6696BA6696BA6696AA5696AA5696AA5696AA5
        696A006A006A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF006A006A6A6A966760F8E0BCFBE2BAF8DAB1F6D7
        A6F4D39FF3D098F3CC916A6A6A006A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6A006A00966762F2D9BD
        F4DABBF2D4B1F0D0AAEFCEA1EECA9CEDC695006A006A6A6AFFFFFF006A00006A
        00006A00FFFFFFFFFFFFFFFFFFFFFFFF006A00006A00006A00FFFFFF006A006A
        6A6A966762F2DDC6F6E1C1F2D8B8F2D4B1F0D0A9EFCEA3EECA9C6A6A6A006A00
        FFFFFFFFFFFF006A00006A00006A00FFFFFFFFFFFF006A00006A00006A00FFFF
        FFFFFFFF6A6A6A006A00966762F3E1CBF7E3C7F3DCC0F2D8B7F2D4B0F0D1AAEF
        CEA3006A006A6A6AFFFFFFFFFFFFFFFFFF006A00006A00006A00006A00006A00
        006A00FFFFFFFFFFFFFFFFFF006A006A6A6A966763F4E6D4F8E7D0F6E0C7F3DC
        BFF2D8B8F2D5B1F0D1AA6A6A6A006A00FFFFFFFFFFFFFFFFFFFFFFFF006A0000
        6A00006A00006A00FFFFFFFFFFFFFFFFFFFFFFFF6A6A6A006A00986A63F6EADA
        FAEBD9F6E3CFF4DEC6F3DCC0F2D8B8F0D4B1006A006A6A6AFFFFFFFFFFFFFFFF
        FFFFFFFF006A00006A00006A00006A00FFFFFFFFFFFFFFFFFFFFFFFF006A006A
        6A6A9D6D66F7EEE2FAEFE1F7E7D4F6E2CCF4E0C6F3DCBFF2D8B76A6A6A006A00
        FFFFFFFFFFFFFFFFFF006A00006A00006A00006A00006A00006A00FFFFFFFFFF
        FFFFFFFF6A6A6A006A00A37268F8F2EBFBF3E9F8EBDDF7E6D4F6E2CEF4E0C6F3
        DCBF006A006A6A6AFFFFFFFFFFFF006A00006A00006A00FFFFFFFFFFFF006A00
        006A00006A00FFFFFFFFFFFF006A006A6A6AA7766AFBF7F3FCF8F0FAEFE6F7EA
        DDF8E7D4F6E3CCF4DEC66A6A6A006A00FFFFFF006A00006A00006A00FFFFFFFF
        FFFFFFFFFFFFFFFF006A00006A00006A00FFFFFF6A6A6A006A00AC7A6CFEFBFA
        FFFEFBFCF4EDF8EEE6F8EBDDF8E9D4F7E3CE006A006A6A6AFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006A006A
        6A6AB07E6DFEFCFBFFFFFFFFFAF6FCF3EBFAEFE5FAEDDDF8E7D46A6A6A006A00
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF6A6A6A006A00B5826FFCFBFBFFFFFFFFFEFEFFF8F6FCF4EDFAF0E5F8
        EBDD006A006A6A6A006A006A6A6A006A006A6A6A006A006A6A6A006A006A6A6A
        006A006A6A6A006A006A6A6A006A006A6A6ABA8670FCFBFBFFFFFFFFFFFFFFFE
        FEFFFAF4FBF4EDFAF0E56A6A6A006A006A6A6A006A006A6A6A006A006A6A6A00
        6A006A6A6A006A006A6A6A006A006A6A6A006A006A6A6A006A00BF8A73FEFCFB
        FFFFFFFFFFFFFFFFFFFFFFFEFEFAF4FCF3EDFAEFE5FAEBDCF7E7D4F6E2CCF4DD
        C4F6DDBFF2D9B7E0C6A5BAA78C897068FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFC58E74FEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF8F6FBF4EBFAEFE3
        F8EADCF7E7D4FFF2DAFAEED3D5C9B2B6AC98A9A18E87726BFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFCB9275FEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFEFAF4FBF3EAFBF2E5FAEEDDCCA696A4766A986F6A926C69916C6D92695D
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF9777FEFCFCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFEF8F3FFFBF2F4E7DCB0827AB47A5CD09159D0
        8745E68823B06D58FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD59A78FEFCFC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFFFCF4E9E2AF81
        7AC68E67EFB062FFAB35C27952FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFD59A78FEFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF4EDEAAF827EC58E66FFBB59C2805CFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFD59A79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF8F6F7B18784D19762C4886DFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68D0906BD0906BD0906BD090
        6BD0906BD0906BD0906BD0906BD0906BD0906BD5936CB27760A06664FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExcelClick
    end
  end
  object qry_transit_time_exp: TQuery
    CachedUpdates = True
    AfterPost = qry_transit_time_expAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_LOCAL_EMBARQUE,'
      '       TL.DESCRICAO AS LOCAL_EMBARQUE,'
      '       CD_LOCAL_DESEMBARQUE,'
      '       TLO.DESCRICAO AS LOCAL_DESEMBARQUE,'
      '       CD_LOCAL_TRANSBORDO,'
      '       TLOC.DESCRICAO AS LOCAL_TRANSBORDO,'
      '       TT.CD_AGENTE,'
      '       TA.NM_AGENTE,'
      '       TT.CD_VIA_TRANSPORTE,'
      '       TV.NM_VIA_TRANSPORTE,'
      '       VL_TRANSIT_TIME,'
      '       CD_USUARIO,'
      '       NR_PROCESSO_CRIACAO'
      'FROM TTRANSIT_TIME_EXP TT'
      
        '   LEFT JOIN TLOCAL_EMBARQUE TL ON TL.CODIGO=TT.CD_LOCAL_EMBARQU' +
        'E '
      
        '   LEFT JOIN TLOCAL_EMBARQUE TLO ON TLO.CODIGO=TT.CD_LOCAL_DESEM' +
        'BARQUE'
      
        '   LEFT JOIN TLOCAL_EMBARQUE TLOC ON TLOC.CODIGO=TT.CD_LOCAL_TRA' +
        'NSBORDO'
      '   LEFT JOIN TAGENTE TA ON TA.CD_AGENTE = TT.CD_AGENTE'
      
        '   LEFT JOIN TVIA_TRANSPORTE TV ON TV.CD_VIA_TRANSPORTE = TT.CD_' +
        'VIA_TRANSPORTE'
      'ORDER BY VL_TRANSIT_TIME')
    UpdateObject = up_transit_time_exp
    Left = 448
    Top = 184
    object qry_transit_time_expCD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_transit_time_expLOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qry_transit_time_expCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_transit_time_expLOCAL_DESEMBARQUE: TStringField
      FieldName = 'LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qry_transit_time_expCD_LOCAL_TRANSBORDO: TStringField
      FieldName = 'CD_LOCAL_TRANSBORDO'
      FixedChar = True
      Size = 4
    end
    object qry_transit_time_expLOCAL_TRANSBORDO: TStringField
      FieldName = 'LOCAL_TRANSBORDO'
      FixedChar = True
      Size = 50
    end
    object qry_transit_time_expCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_transit_time_expNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_transit_time_expCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_transit_time_expNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      FixedChar = True
    end
    object qry_transit_time_expVL_TRANSIT_TIME: TIntegerField
      FieldName = 'VL_TRANSIT_TIME'
    end
    object qry_transit_time_expCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_transit_time_expNR_PROCESSO_CRIACAO: TStringField
      FieldName = 'NR_PROCESSO_CRIACAO'
      FixedChar = True
      Size = 18
    end
  end
  object ds_transit_time_exp: TDataSource
    DataSet = qry_transit_time_exp
    Left = 336
    Top = 184
  end
  object up_transit_time_exp: TUpdateSQL
    ModifySQL.Strings = (
      'update TTRANSIT_TIME_EXP'
      'set'
      '  VL_TRANSIT_TIME = :VL_TRANSIT_TIME'
      'where'
      '  CD_LOCAL_EMBARQUE = :OLD_CD_LOCAL_EMBARQUE and'
      '  CD_LOCAL_DESEMBARQUE = :OLD_CD_LOCAL_DESEMBARQUE and'
      '  CD_LOCAL_TRANSBORDO = :OLD_CD_LOCAL_TRANSBORDO and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  CD_VIA_TRANSPORTE = :OLD_CD_VIA_TRANSPORTE')
    InsertSQL.Strings = (
      'insert into TTRANSIT_TIME_EXP'
      '  (VL_TRANSIT_TIME)'
      'values'
      '  (:VL_TRANSIT_TIME)')
    DeleteSQL.Strings = (
      'delete from TTRANSIT_TIME_EXP'
      'where'
      '  CD_LOCAL_EMBARQUE = :OLD_CD_LOCAL_EMBARQUE and'
      '  CD_LOCAL_DESEMBARQUE = :OLD_CD_LOCAL_DESEMBARQUE and'
      '  CD_LOCAL_TRANSBORDO = :OLD_CD_LOCAL_TRANSBORDO and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  CD_VIA_TRANSPORTE = :OLD_CD_VIA_TRANSPORTE')
    Left = 184
    Top = 272
  end
  object sdExcel: TSaveDialog
    DefaultExt = '||*.xls'
    Filter = 'Excel (*.xls)|*.xls'
    Left = 168
    Top = 104
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 376
    Top = 304
    PixelsPerInch = 96
    object cxsHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end

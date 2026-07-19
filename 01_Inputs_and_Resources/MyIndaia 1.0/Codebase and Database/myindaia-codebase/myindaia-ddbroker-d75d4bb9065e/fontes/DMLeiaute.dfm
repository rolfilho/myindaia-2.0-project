object dmdLeiaute: TdmdLeiaute
  OldCreateOrder = False
  Left = 207
  Top = 187
  Height = 282
  Width = 333
  object qryLeiauteGrid: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT ID, CLASSE, NOME, TITULO_REL, LEIAUTE'
      'FROM LEAIUTE_GRID'
      'WHERE CLASSE = :CLASSE')
    UpdateObject = updLeiauteGrid
    Left = 65
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CLASSE'
        ParamType = ptInput
      end>
    object qryLeiauteGridID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.LEAIUTE_GRID.ID'
    end
    object qryLeiauteGridCLASSE: TIntegerField
      FieldName = 'CLASSE'
      Origin = 'DBBROKER.LEAIUTE_GRID.CLASSE'
      Visible = False
    end
    object qryLeiauteGridNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'DBBROKER.LEAIUTE_GRID.NOME'
      FixedChar = True
      Size = 50
    end
    object qryLeiauteGridTITULO_REL: TStringField
      DisplayLabel = 'T'#237'tulo Relat'#243'rio'
      FieldName = 'TITULO_REL'
      Origin = 'DBBROKER.LEAIUTE_GRID.TITULO_REL'
      FixedChar = True
      Size = 100
    end
    object qryLeiauteGridLEIAUTE: TMemoField
      FieldName = 'LEIAUTE'
      Origin = 'DBBROKER.LEAIUTE_GRID.LEIAUTE'
      BlobType = ftMemo
    end
  end
  object dsLeiaute: TDataSource
    DataSet = qryLeiauteGrid
    Left = 136
    Top = 12
  end
  object updLeiauteGrid: TUpdateSQL
    ModifySQL.Strings = (
      'update LEAIUTE_GRID'
      'set'
      '  CLASSE = :CLASSE,'
      '  NOME = :NOME,'
      '  TITULO_REL = :TITULO_REL,'
      '  LEIAUTE = :LEIAUTE'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LEAIUTE_GRID'
      '  (CLASSE, NOME, TITULO_REL, LEIAUTE)'
      'values'
      '  (:CLASSE, :NOME, :TITULO_REL, :LEIAUTE)')
    DeleteSQL.Strings = (
      'delete from LEAIUTE_GRID'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 116
  end
  object qryLeiauteGridInsert: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CLASSE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TITULO_REL'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = 'LEIAUTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'INSERT INTO LEAIUTE_GRID (CLASSE, NOME, TITULO_REL, LEIAUTE)  VA' +
        'LUES(:CLASSE, :NOME, :TITULO_REL, :LEIAUTE)')
    SQLConnection = datm_main.SQLConnection
    Left = 228
    Top = 16
  end
end

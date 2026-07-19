object datm_notificador: Tdatm_notificador
  OldCreateOrder = False
  Left = 222
  Top = 107
  Height = 168
  Width = 399
  object qry_notificador_: TQuery
    CachedUpdates = True
    BeforePost = qry_notificador_BeforePost
    AfterPost = qry_notificador_AfterPost
    AfterDelete = qry_notificador_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TN.CD_NOTIFICADOR, TN.NM_NOTIFICADOR, TN.END_NOTIFICADOR,' +
        ' TN.CGC_NOTIFICADOR,'
      
        'TN.END_NUMERO,  TN.CD_CIDADE, (SELECT TL.DESCRICAO FROM TLOCAL_E' +
        'MBARQUE TL WHERE TL.CODIGO = TN.CD_CIDADE) NM_CIDADE,'
      
        ' TN.CD_PAIS, (SELECT TP.NM_PAIS FROM TPAIS_BROKER TP WHERE TP.CD' +
        '_PAIS = TN.CD_PAIS) NM_PAIS,'
      ' TN.END_FONE, TN.END_FAX, TN.NM_CONTATO,'
      ' TN.END_EMAIL,TN.END_COMPL, TN.IN_ATIVO  FROM TNOTIFICADOR TN'
      'ORDER BY'
      '  TN.NM_NOTIFICADOR'
      ' '
      ' ')
    UpdateObject = UpDAte_Notificador
    Left = 40
    Top = 16
    object qry_notificador_CD_NOTIFICADOR: TStringField
      FieldName = 'CD_NOTIFICADOR'
      Origin = 'DBBROKER.TNOTIFICADOR.CD_NOTIFICADOR'
      FixedChar = True
      Size = 4
    end
    object qry_notificador_NM_NOTIFICADOR: TStringField
      FieldName = 'NM_NOTIFICADOR'
      Origin = 'DBBROKER.TNOTIFICADOR.NM_NOTIFICADOR'
      FixedChar = True
      Size = 50
    end
    object qry_notificador_END_NOTIFICADOR: TStringField
      FieldName = 'END_NOTIFICADOR'
      Origin = 'DBBROKER.TNOTIFICADOR.END_NOTIFICADOR'
      FixedChar = True
      Size = 30
    end
    object qry_notificador_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'DBBROKER.TNOTIFICADOR.END_NUMERO'
      FixedChar = True
      Size = 5
    end
    object qry_notificador_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Origin = 'DBBROKER.TNOTIFICADOR.CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_notificador_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TNOTIFICADOR.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_notificador_END_FONE: TStringField
      DisplayWidth = 10
      FieldName = 'END_FONE'
      Origin = 'DBBROKER.TNOTIFICADOR.END_FONE'
      FixedChar = True
      Size = 10
    end
    object qry_notificador_END_FAX: TStringField
      FieldName = 'END_FAX'
      Origin = 'DBBROKER.TNOTIFICADOR.END_FAX'
      FixedChar = True
      Size = 10
    end
    object qry_notificador_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TNOTIFICADOR.NM_CONTATO'
      FixedChar = True
    end
    object qry_notificador_END_EMAIL: TStringField
      FieldName = 'END_EMAIL'
      Origin = 'DBBROKER.TNOTIFICADOR.END_EMAIL'
      FixedChar = True
      Size = 30
    end
    object qry_notificador_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
    end
    object qry_notificador_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_notificador_NM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_notificador_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qry_notificador_CGC_NOTIFICADOR: TStringField
      FieldName = 'CGC_NOTIFICADOR'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 18
    end
  end
  object ds_notificador: TDataSource
    DataSet = qry_notificador_
    Left = 144
    Top = 16
  end
  object qry_ult_notificador_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_NOTIFICADOR) AS ULTIMO FROM TNOTIFICADOR')
    Left = 40
    Top = 64
    object qry_ult_notificador_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TNOTIFICADOR.CD_NOTIFICADOR'
      FixedChar = True
      Size = 4
    end
  end
  object UpDAte_Notificador: TUpdateSQL
    ModifySQL.Strings = (
      'update TNOTIFICADOR'
      'set'
      '  CD_NOTIFICADOR = :CD_NOTIFICADOR,'
      '  NM_NOTIFICADOR = :NM_NOTIFICADOR,'
      '  END_NOTIFICADOR = :END_NOTIFICADOR,'
      '  END_NUMERO = :END_NUMERO,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  CD_PAIS = :CD_PAIS,'
      '  END_FONE = :END_FONE,'
      '  END_FAX = :END_FAX,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  END_EMAIL = :END_EMAIL,'
      '  END_COMPL = :END_COMPL,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  CGC_NOTIFICADOR = :CGC_NOTIFICADOR'
      'where'
      '  CD_NOTIFICADOR = :OLD_CD_NOTIFICADOR')
    InsertSQL.Strings = (
      'insert into TNOTIFICADOR'
      
        '  (CD_NOTIFICADOR, NM_NOTIFICADOR, END_NOTIFICADOR, END_NUMERO, ' +
        'CD_CIDADE, '
      
        '   CD_PAIS, END_FONE, END_FAX, NM_CONTATO, END_EMAIL, END_COMPL,' +
        ' IN_ATIVO, '
      '   CGC_NOTIFICADOR)'
      'values'
      
        '  (:CD_NOTIFICADOR, :NM_NOTIFICADOR, :END_NOTIFICADOR, :END_NUME' +
        'RO, :CD_CIDADE, '
      
        '   :CD_PAIS, :END_FONE, :END_FAX, :NM_CONTATO, :END_EMAIL, :END_' +
        'COMPL, '
      '   :IN_ATIVO, :CGC_NOTIFICADOR)')
    DeleteSQL.Strings = (
      'delete from TNOTIFICADOR'
      'where'
      '  CD_NOTIFICADOR = :OLD_CD_NOTIFICADOR')
    Left = 144
    Top = 64
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 320
    Top = 64
  end
  object qry_armador_: TQuery
    CachedUpdates = True
    AfterPost = qry_armador_AfterPost
    AfterDelete = qry_armador_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TAN.CD_NOTIFICADOR, TAN.CD_ARMADOR,'
      '(SELECT TA.DESCRICAO FROM TTRANSPORTADOR_ITL TA WHERE'
      '      TA.CODIGO = TAN.CD_ARMADOR) NM_ARMADOR'
      '  FROM TARMADOR_NOTIFICADOR TAN'
      '    WHERE TAN.CD_NOTIFICADOR=:CD_NOTIFICADOR'
      'ORDER BY'
      '  NM_ARMADOR'
      ' ')
    UpdateObject = UpDate_Armador
    Left = 240
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_NOTIFICADOR'
        ParamType = ptUnknown
      end>
    object qry_armador_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_armador_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_armador_CD_NOTIFICADOR: TStringField
      FieldName = 'CD_NOTIFICADOR'
      FixedChar = True
      Size = 4
    end
  end
  object ds_armador: TDataSource
    DataSet = qry_armador_
    Left = 320
    Top = 8
  end
  object UpDate_Armador: TUpdateSQL
    ModifySQL.Strings = (
      'update TARMADOR_NOTIFICADOR'
      'set'
      '  CD_NOTIFICADOR = :CD_NOTIFICADOR,'
      '  CD_ARMADOR = :CD_ARMADOR'
      'where'
      '  CD_NOTIFICADOR = :OLD_CD_NOTIFICADOR and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    InsertSQL.Strings = (
      'insert into TARMADOR_NOTIFICADOR'
      '  (CD_NOTIFICADOR, CD_ARMADOR)'
      'values'
      '  (:CD_NOTIFICADOR, :CD_ARMADOR)')
    DeleteSQL.Strings = (
      'delete from TARMADOR_NOTIFICADOR'
      'where'
      '  CD_NOTIFICADOR = :OLD_CD_NOTIFICADOR and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    Left = 240
    Top = 64
  end
end

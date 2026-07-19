object datm_emp_est: Tdatm_emp_est
  OldCreateOrder = True
  Left = 467
  Top = 147
  Height = 444
  Width = 706
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
    Top = 20
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 72
  end
  object qry_emp_est_: TQuery
    AfterPost = qry_emp_est_AfterPost
    DatabaseName = 'DBBROKER'
    DataSource = ds_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      '  FROM TEMPRESA_EST'
      ' WHERE CD_EMPRESA = :CD_EMPRESA')
    Left = 136
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
        Size = 6
      end>
    object qry_emp_est_CD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_est_NM_EMPRESA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 100
    end
    object qry_emp_est_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      DisplayWidth = 30
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_EST.AP_EMPRESA'
      Size = 30
    end
    object qry_emp_est_END_EMPRESA: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 100
      FieldName = 'END_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 100
    end
    object qry_emp_est_END_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'END_NUMERO'
      Origin = 'TEMPRESA_EST.END_NUMERO'
      Size = 6
    end
    object qry_emp_est_END_COMPL: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'END_COMPL'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 41
    end
    object qry_emp_est_END_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_EST.END_CIDADE'
      Size = 30
    end
    object qry_emp_est_END_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'END_ESTADO'
      Origin = 'TEMPRESA_EST.END_ESTADO'
      Size = 30
    end
    object qry_emp_est_CD_PAIS: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'CD_PAIS'
      Origin = 'TEMPRESA_EST.CD_PAIS'
      OnSetText = qry_emp_est_CD_PAISSetText
      Size = 3
    end
    object qry_emp_est_NR_TELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'NR_TELEFONE'
      Origin = 'TEMPRESA_EST.NR_TELEFONE'
      Size = 15
    end
    object qry_emp_est_NR_FAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'NR_FAX'
      Origin = 'TEMPRESA_EST.NR_FAX'
      Size = 15
    end
    object qry_emp_est_DT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Data Inclus'#227'o'
      FieldName = 'DT_INCLUSAO'
      Origin = 'TEMPRESA_EST.DT_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_emp_est_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMPRESA_EST.IN_ATIVO'
      Size = 1
    end
    object qry_emp_est_look_pais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldKind = fkLookup
      FieldName = 'look_pais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS'
      Size = 25
      Lookup = True
    end
    object qry_emp_est_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_emp_est_IN_AGENTE: TBooleanField
      FieldName = 'IN_AGENTE'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
    end
    object qry_emp_est_IN_BANCO: TBooleanField
      FieldName = 'IN_BANCO'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
    end
    object qry_emp_est_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Origin = 'TEMPRESA_EST.AP_EMPRESA'
    end
    object qry_emp_est_IN_SEGURADORA: TBooleanField
      FieldName = 'IN_SEGURADORA'
      Origin = 'TEMPRESA_EST.END_EMPRESA'
    end
    object qry_emp_est_TX_OBS_AGENTE: TMemoField
      FieldName = 'TX_OBS_AGENTE'
      Origin = 'TEMPRESA_EST.END_NUMERO'
      BlobType = ftMemo
    end
    object qry_emp_est_TX_OBS_BANCO: TMemoField
      FieldName = 'TX_OBS_BANCO'
      Origin = 'TEMPRESA_EST.END_COMPL'
      BlobType = ftMemo
    end
    object qry_emp_est_TX_OBS_IMP: TMemoField
      FieldName = 'TX_OBS_IMP'
      Origin = 'TEMPRESA_EST.END_CIDADE'
      BlobType = ftMemo
    end
    object qry_emp_est_TX_OBS_SEG: TMemoField
      FieldName = 'TX_OBS_SEG'
      Origin = 'TEMPRESA_EST.END_ESTADO'
      BlobType = ftMemo
    end
    object qry_emp_est_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
    end
    object qry_emp_est_NR_CLIENTE: TStringField
      FieldName = 'NR_CLIENTE'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 15
    end
    object qry_emp_est_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 50
    end
    object qry_emp_est_IN_COMPRADOR: TBooleanField
      FieldName = 'IN_COMPRADOR'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
    end
    object qry_emp_est_NR_RUC: TStringField
      FieldName = 'NR_RUC'
      Origin = 'DBBROKER.TEMPRESA_EST.NR_RUC'
      FixedChar = True
      Size = 25
    end
    object qry_emp_est_NR_NIT: TStringField
      FieldName = 'NR_NIT'
      Origin = 'DBBROKER.TEMPRESA_EST.NR_NIT'
      FixedChar = True
      Size = 25
    end
    object qry_emp_est_NR_CUIT: TStringField
      FieldName = 'NR_CUIT'
      Origin = 'DBBROKER.TEMPRESA_EST.NR_CUIT'
      FixedChar = True
      Size = 25
    end
    object qry_emp_est_IN_DECLARACAO_DETENTOR: TStringField
      FieldName = 'IN_DECLARACAO_DETENTOR'
      Origin = 'DBBROKER.TEMPRESA_EST.IN_DECLARACAO_DETENTOR'
      FixedChar = True
      Size = 1
    end
  end
  object ds_emp_est: TDataSource
    DataSet = qry_emp_est_
    Left = 136
    Top = 72
  end
  object qry_ult_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(EE.CD_EMPRESA) ULTIMO'
      'FROM  TEMPRESA_EST EE')
    Left = 272
    Top = 148
    object qry_ult_emp_est_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TPAIS')
    Left = 200
    Top = 272
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
  object ds_pais: TDataSource
    DataSet = qry_pais_
    Left = 200
    Top = 324
  end
  object qry_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NR_CLIENTE, NM_EMPRESA, AP_EMPRESA, IN_ATIVO,' +
        ' IN_IMPORTADOR, IN_AGENTE, IN_BANCO FROM'
      'TEMPRESA_EST'
      'WHERE   ( 1=1'
      '  AND ( ( IN_IMPORTADOR ='
      '      CASE :PRODUTO'
      '          WHEN '#39'01'#39' THEN '#39'0'#39
      #9#9'     '#9'WHEN '#39'02'#39' THEN '#39'1'#39
      #9#9'     '#9'WHEN '#39'03'#39' THEN '#39'0'#39
      #9#9'     '#9'WHEN '#39'06'#39' THEN '#39'0'#39
      #9'     '#9#9'WHEN '#39'10'#39' THEN '#39'1'#39
      #9#9#9'END'
      '  AND IN_EXPORTADOR ='
      '      CASE :PRODUTO'
      '          WHEN '#39'01'#39' THEN '#39'1'#39
      #9#9'     '#9'WHEN '#39'02'#39' THEN '#39'0'#39
      #9#9'     '#9'WHEN '#39'03'#39' THEN '#39'1'#39
      #9#9'     '#9'WHEN '#39'06'#39' THEN '#39'1'#39
      #9#9'     '#9'WHEN '#39'10'#39' THEN '#39'0'#39
      #9#9#9'END )'
      
        '   OR ( IN_IMPORTADOR = '#39'1'#39' AND IN_EXPORTADOR = '#39'1'#39' ) OR ( IN_IM' +
        'PORTADOR = '#39'0'#39' AND IN_EXPORTADOR = '#39'0'#39' )  )  ) AND ( IN_ATIVO='#39'1' +
        #39'  OR ( :IN_ATIVO is not null )   )    '
      'ORDER BY'
      'NM_EMPRESA')
    Left = 32
    Top = 148
    ParamData = <
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_ATIVO'
        ParamType = ptInput
      end>
    object qry_lista_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_lista_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
    object qry_lista_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_EST.AP_EMPRESA'
      Size = 10
    end
    object qry_lista_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMPRESA_EST.IN_ATIVO'
      Size = 1
    end
    object qry_lista_Look_Ativo: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_lista_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
    end
    object qry_lista_IN_AGENTE: TBooleanField
      FieldName = 'IN_AGENTE'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
    end
    object qry_lista_IN_BANCO: TBooleanField
      FieldName = 'IN_BANCO'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
    end
    object qry_lista_NR_CLIENTE: TStringField
      FieldName = 'NR_CLIENTE'
      FixedChar = True
      Size = 15
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 32
    Top = 200
  end
  object qryEmpEstGrupo: TQuery
    BeforePost = qryEmpEstGrupoBeforePost
    AfterPost = qryEmpEstGrupoAfterPost
    OnCalcFields = qryEmpEstGrupoCalcFields
    OnPostError = qryEmpEstGrupoPostError
    DatabaseName = 'DBBROKER'
    DataSource = ds_emp_est
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TEMPRESA_EST_GRUPO'
      'WHERE CD_EMPRESA = :CD_EMPRESA'
      '')
    Left = 136
    Top = 148
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
        Size = 6
      end>
    object qryEmpEstGrupoCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_EST_GRUPO.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryEmpEstGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TEMPRESA_EST_GRUPO.CD_GRUPO'
      OnSetText = qryEmpEstGrupoCD_GRUPOSetText
      FixedChar = True
      Size = 3
    end
    object qryEmpEstGrupocalcNmGrupo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNmGrupo'
      Size = 30
      Calculated = True
    end
  end
  object dsEmpEstGrupo: TDataSource
    DataSet = qryEmpEstGrupo
    Left = 136
    Top = 200
  end
  object sqlAux: TQuery
    DatabaseName = 'DBBROKER'
    Left = 232
    Top = 220
  end
  object dsFiespImportador: TDataSource
    AutoEdit = False
    DataSet = qryFiespInterveniente
    Left = 480
    Top = 44
  end
  object updFiespImportador: TUpdateSQL
    ModifySQL.Strings = (
      'update FIESP_IMPORTADOR'
      'set'
      '  CD_EMPRESA_EST = :CD_EMPRESA_EST,'
      '  CD_EMPRESA_NAC = :CD_EMPRESA_NAC,'
      '  FIESP_ID = :FIESP_ID'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into FIESP_IMPORTADOR'
      '  (CD_EMPRESA_EST, CD_EMPRESA_NAC, FIESP_ID)'
      'values'
      '  (:CD_EMPRESA_EST, :CD_EMPRESA_NAC, :FIESP_ID)')
    DeleteSQL.Strings = (
      'delete from FIESP_IMPORTADOR'
      'where'
      '  ID = :OLD_ID')
    Left = 480
    Top = 132
  end
  object updFiespInterveniente: TUpdateSQL
    ModifySQL.Strings = (
      'update FIESP_INTERVENIENTE'
      'set'
      '  CD_EMPRESA_EST = :CD_EMPRESA_EST,'
      '  CD_EMPRESA_NAC = :CD_EMPRESA_NAC,'
      '  FIESP_ID = :FIESP_ID'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into FIESP_INTERVENIENTE'
      '  (CD_EMPRESA_EST, CD_EMPRESA_NAC, FIESP_ID)'
      'values'
      '  (:CD_EMPRESA_EST, :CD_EMPRESA_NAC, :FIESP_ID)')
    DeleteSQL.Strings = (
      'delete from FIESP_INTERVENIENTE'
      'where'
      '  ID = :OLD_ID')
    Left = 484
    Top = 304
  end
  object qryFiespInterveniente: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ID, CD_EMPRESA_EST,CD_EMPRESA_NAC, FIESP_ID FROM FIESP_IN' +
        'TERVENIENTE'
      'WHERE CD_EMPRESA_EST = :CD_EMPRESA')
    UpdateObject = updFiespInterveniente
    Left = 484
    Top = 252
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qryFiespIntervenienteID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.FIESP_INTERVENIENTE.ID'
      Visible = False
    end
    object qryFiespIntervenienteCD_EMPRESA_EST: TStringField
      FieldName = 'CD_EMPRESA_EST'
      Origin = 'DBBROKER.FIESP_INTERVENIENTE.CD_EMPRESA_EST'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryFiespIntervenienteCD_EMPRESA_NAC: TStringField
      DisplayLabel = 'Interveniente'
      FieldName = 'CD_EMPRESA_NAC'
      Origin = 'DBBROKER.FIESP_INTERVENIENTE.CD_EMPRESA_NAC'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryFiespIntervenientenm_empresa: TStringField
      DisplayLabel = 'Interveniente'
      FieldKind = fkLookup
      FieldName = 'nm_empresa'
      LookupDataSet = qryEmrpesaNac
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EMPRESA_NAC'
      Size = 30
      Lookup = True
    end
    object qryFiespIntervenienteFIESP_ID: TIntegerField
      DisplayLabel = 'Fiesp Id'
      DisplayWidth = 6
      FieldName = 'FIESP_ID'
      Origin = 'DBBROKER.FIESP_INTERVENIENTE.FIESP_ID'
    end
  end
  object dsFiespInterveniente: TDataSource
    AutoEdit = False
    DataSet = qryFiespInterveniente
    Left = 484
    Top = 204
  end
  object qryFiespImportador: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT ID, CD_EMPRESA_EST, CD_EMPRESA_NAC, FIESP_ID FROM FIESP_I' +
        'MPORTADOR'
      'WHERE CD_EMPRESA_EST = :CD_EMPRESA')
    UpdateObject = updFiespImportador
    Left = 480
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qryFiespImportadorID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.FIESP_IMPORTADOR.ID'
      Visible = False
    end
    object qryFiespImportadorCD_EMPRESA_EST: TStringField
      FieldName = 'CD_EMPRESA_EST'
      Origin = 'DBBROKER.FIESP_IMPORTADOR.CD_EMPRESA_EST'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryFiespImportadorCD_EMPRESA_NAC: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'CD_EMPRESA_NAC'
      Origin = 'DBBROKER.FIESP_IMPORTADOR.CD_EMPRESA_NAC'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object qryFiespImportadornm_emprsa: TStringField
      DisplayLabel = 'Importador'
      FieldKind = fkLookup
      FieldName = 'nm_emprsa'
      LookupDataSet = qryEmrpesaNac
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EMPRESA_NAC'
      Size = 30
      Lookup = True
    end
    object qryFiespImportadorFIESP_ID: TIntegerField
      DisplayLabel = 'Fiesp Id'
      FieldName = 'FIESP_ID'
      Origin = 'DBBROKER.FIESP_IMPORTADOR.FIESP_ID'
    end
  end
  object qryEmrpesaNac: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_NAC')
    Left = 388
    Top = 40
  end
  object dsEmpresaNac: TDataSource
    DataSet = qryEmrpesaNac
    Left = 316
    Top = 40
  end
  object qryClientesRaizCNPJ: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      'CD_EMPRESA_EST,'
      'RAIZ_CNPJ,'
      'EN.NM_EMPRESA AS DESCRICAO,'
      'CD_OPE_ESTRANGEIRO,'
      'NR_VERSAO_OPE_ESTRANGEIRO'
      'FROM TEMPRESA_EST_OPE_ESTR EE'
      
        'CROSS APPLY (SELECT TOP 1 NM_EMPRESA FROM TEMPRESA_NAC WHERE SUB' +
        'STRING(CGC_EMPRESA, 1, 8) = EE.RAIZ_CNPJ) AS EN'
      'WHERE CD_EMPRESA_EST = :CD_EMPRESA_EST')
    UpdateObject = updClientesRaizCNPJ
    Left = 592
    Top = 252
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA_EST'
        ParamType = ptInput
      end>
    object qryClientesRaizCNPJCD_EMPRESA_EST: TStringField
      FieldName = 'CD_EMPRESA_EST'
      Size = 5
    end
    object qryClientesRaizCNPJRAIZ_CNPJ: TStringField
      DisplayLabel = 'Raiz CNPJ'
      FieldName = 'RAIZ_CNPJ'
      Size = 8
    end
    object qryClientesRaizCNPJCD_OPE_ESTRANGEIRO: TStringField
      DisplayLabel = 'C'#243'digo Operador Estrangeiro'
      FieldName = 'CD_OPE_ESTRANGEIRO'
      Size = 35
    end
    object qryClientesRaizCNPJNR_VERSAO_OPE_ESTRANGEIRO: TStringField
      DisplayLabel = 'Vers'#227'o Operador Estrangeiro'
      FieldName = 'NR_VERSAO_OPE_ESTRANGEIRO'
      Size = 7
    end
    object qryClientesRaizCNPJDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
  object dsClientesRaizCNPJ: TDataSource
    AutoEdit = False
    DataSet = qryClientesRaizCNPJ
    Left = 592
    Top = 204
  end
  object updClientesRaizCNPJ: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TEMPRESA_EST_OPE_ESTR'
      'SET'
      ' CD_OPE_ESTRANGEIRO = :CD_OPE_ESTRANGEIRO,'
      ' NR_VERSAO_OPE_ESTRANGEIRO = :NR_VERSAO_OPE_ESTRANGEIRO'
      'WHERE '
      'CD_EMPRESA_EST = :OLD_CD_EMPRESA_EST AND'
      'RAIZ_CNPJ = :OLD_RAIZ_CNPJ')
    InsertSQL.Strings = (
      'INSERT INTO TEMPRESA_EST_OPE_ESTR'
      
        ' (CD_EMPRESA_EST, RAIZ_CNPJ, CD_OPE_ESTRANGEIRO, NR_VERSAO_OPE_E' +
        'STRANGEIRO)'
      'VALUES'
      
        ' (:CD_EMPRESA_EST, :RAIZ_CNPJ, :CD_OPE_ESTRANGEIRO, :NR_VERSAO_O' +
        'PE_ESTRANGEIRO)')
    DeleteSQL.Strings = (
      'DELETE FROM TEMPRESA_EST_OPE_ESTR'
      'WHERE '
      'CD_EMPRESA_EST = :OLD_CD_EMPRESA_EST AND'
      'RAIZ_CNPJ = :OLD_RAIZ_CNPJ')
    Left = 592
    Top = 304
  end
end

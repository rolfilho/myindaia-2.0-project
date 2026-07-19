object datm_trans_LI: Tdatm_trans_LI
  Left = 76
  Top = 102
  Height = 362
  Width = 619
  object REGIMP: TDatabase
    AliasName = 'DBLicenca'
    DatabaseName = 'REGIMP'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 56
    Top = 16
  end
  object qry_li_scx_: TQuery
    AutoCalcFields = False
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM OPERAÇÃO_COM_TRATAMENTO '
      'WHERE NR_TRAT_IMP_MICRO = :NR_TRAT_IMP_MICRO'
      'ORDER BY NR_IDENT_USUARIO')
    Params.Data = {01000100114E525F545241545F494D505F4D4943524F0001020030000000}
    Left = 176
    Top = 16
  end
  object tbl_Numerador_LI_: TTable
    DatabaseName = 'REGIMP'
    TableName = 'NUMERADOR_REG_IMP'
    Left = 56
    Top = 131
  end
  object qry_li_itens_scx_: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM DETALHE_MERC_COM_TRATAMENTO'
      'WHERE NR_TRAT_IMP_MICRO = :NR_PROCESSO'
      'AND NR_SEQ_PRODUTO = :NR_ITEM')
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000000074E525F4954454D
      0001020030000000}
    Left = 176
    Top = 72
  end
  object qry_dest_NCM_: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM DESTAQUE_NCM'
      'WHERE NR_TRAT_IMP_MICRO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 176
    Top = 192
  end
  object qry_proc_anuentes_scx_: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM PROCESSO_ANUENTE'
      'WHERE NR_TRAT_IMP_MICRO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 176
    Top = 131
  end
  object RS_Diag_LI: TQuery
    DatabaseName = 'REGIMP'
    RequestLive = True
    Left = 56
    Top = 248
  end
  object TABSISCO: TDatabase
    AliasName = 'DBTabelas'
    DatabaseName = 'DBSISCOMEX'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 56
    Top = 72
  end
  object RS_TB: TQuery
    DatabaseName = 'TABSISCO'
    SQL.Strings = (
      'SELECT * FROM TAB_CONVERSAO_CAMBIO ')
    Left = 56
    Top = 192
  end
  object qry_li_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    DataSource = ds_li_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY '
      'NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 400
    Top = 16
  end
  object qry_li_itens_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    DataSource = ds_li_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ITEM')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 400
    Top = 72
  end
  object ds_li_lista: TDataSource
    DataSet = qry_li_lista_
    Left = 264
    Top = 16
  end
  object qry_li_lista_: TQuery
    AutoCalcFields = False
    OnCalcFields = qry_li_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT L.NR_PROCESSO, L.DT_PROCESSO_LI, E.NM_EMPRESA, L.NR_REGIS' +
        'TRO_LI, L.DT_REGISTRO_LI'
      'FROM TLICENCA_IMPORTACAO L, TEMPRESA_NAC E'
      'WHERE L.CD_IMPORTADOR *= E.CD_EMPRESA AND L.IN_MONTADA = '#39'1'#39
      'ORDER BY'
      'L.NR_PROCESSO')
    Left = 333
    Top = 16
    object qry_li_lista_CalcNrProcesso: TFloatField
      DisplayLabel = 'Nº Processo'
      FieldName = 'CalcNrProcesso'
      Calculated = True
    end
    object qry_li_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_li_lista_NM_EMPRESA: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_li_lista_DT_PROCESSO_LI: TDateTimeField
      DisplayLabel = 'Data Processo'
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
    end
    object qry_li_lista_NR_REGISTRO_LI: TStringField
      DisplayLabel = 'Registro LI'
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      Size = 10
    end
    object qry_li_lista_DT_REGISTRO_LI: TDateTimeField
      DisplayLabel = 'Data Registro'
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
    end
  end
  object qry_emp_nac_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TOP 1 E.CD_EMPRESA, E.NM_EMPRESA, E.CD_TIPO_PESSOA, E.CD_' +
        'PAIS_IMPORTADOR,'
      
        'E.CD_ATIV_ECONOMICA, E.END_EMPRESA, E.END_NUMERO, E.END_BAIRRO, ' +
        'E.END_CIDADE,'
      
        'E.END_UF, E.END_CEP, E.CGC_EMPRESA, E.CPF_EMPRESA, E.OUTRO_DOC, ' +
        'C.NR_FONE'
      'FROM TEMPRESA_NAC E'
      'LEFT OUTER JOIN TCLIENTE_CONTATO C'
      'ON ( E.CD_EMPRESA = C.CD_CLIENTE )'
      'WHERE'
      'E.CD_EMPRESA = :CD_CLIENTE')
    Params.Data = {010001000A43445F434C49454E54450001020030000000}
    Left = 512
    Top = 131
  end
  object qry_emp_est_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_NUMERO, END_COMP' +
        'L,'
      'END_CIDADE, END_ESTADO, CD_PAIS'
      'FROM TEMPRESA_EST'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 512
    Top = 72
  end
  object qry_unid_med_broker_: TQuery
    AutoCalcFields = False
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA'
      'FROM TUNID_MEDIDA_BROKER'
      'WHERE CD_UNID_MEDIDA = :CD_UNID_MEDIDA')
    Params.Data = {010001000E43445F554E49445F4D45444944410001020030000000}
    Left = 512
    Top = 16
  end
  object qry_proc_anuentes_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPROC_ANUENTES'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 400
    Top = 131
  end
  object qry_ag_secex_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TAB_AGENCIA_SECEX'
      'WHERE CODIGO = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 400
    Top = 184
  end
end

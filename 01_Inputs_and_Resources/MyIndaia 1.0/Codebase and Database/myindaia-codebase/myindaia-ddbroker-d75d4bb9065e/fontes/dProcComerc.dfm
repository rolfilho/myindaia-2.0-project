object datm_proc_comerc: Tdatm_proc_comerc
  OldCreateOrder = True
  Left = 283
  Top = 161
  Height = 560
  Width = 741
  object ds_proc_comerc: TDataSource
    DataSet = qry_proc_comerc_
    Left = 151
    Top = 8
  end
  object qry_ult_proc_comerc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROC_COMERC) AS ULTIMO '
      'FROM TPROC_COMERC'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG'
      '   AND SUBSTRING(NR_PROC_COMERC,11,2)=:ANO'
      '')
    Left = 373
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'ANO'
        ParamType = ptUnknown
      end>
    object qry_ult_proc_comerc_ULTIMO: TStringField
      DisplayWidth = 18
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROC_COMERC.NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
  end
  object upd_qry_proc_comerc_: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROC_COMERC'
      'set'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  TP_CLIENTE = :TP_CLIENTE,'
      '  TP_SALES = :TP_SALES,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_VENDEDOR = :CD_VENDEDOR,'
      '  NM_EMAIL = :NM_EMAIL,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  CD_USUARIO = :CD_USUARIO'
      'where'
      '  NR_PROC_COMERC = :OLD_NR_PROC_COMERC')
    InsertSQL.Strings = (
      'insert into TPROC_COMERC'
      
        '  (NR_PROC_COMERC, DT_ABERTURA, TP_CLIENTE, TP_SALES, CD_UNID_NE' +
        'G, CD_EMPRESA, '
      '   CD_VENDEDOR, NM_EMAIL, NM_CONTATO, CD_USUARIO)'
      'values'
      
        '  (:NR_PROC_COMERC, :DT_ABERTURA, :TP_CLIENTE, :TP_SALES, :CD_UN' +
        'ID_NEG, '
      
        '   :CD_EMPRESA, :CD_VENDEDOR, :NM_EMAIL, :NM_CONTATO, :CD_USUARI' +
        'O)')
    DeleteSQL.Strings = (
      'delete from TPROC_COMERC'
      'where'
      '  NR_PROC_COMERC = :OLD_NR_PROC_COMERC')
    Left = 509
    Top = 8
  end
  object qry_proc_comerc_: TQuery
    CachedUpdates = True
    BeforePost = qry_proc_comerc_BeforePost
    AfterPost = qry_proc_comerc_AfterPost
    AfterDelete = qry_proc_comerc_AfterDelete
    AfterScroll = qry_proc_comerc_AfterScroll
    OnNewRecord = qry_proc_comerc_NewRecord
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  TP.NR_PROC_COMERC,TP.DT_ABERTURA, TP.TP_CLIENTE, TP.TP_SALES,'
      
        '  TP.CD_UNID_NEG, TP.CD_EMPRESA,TE.NM_EMPRESA, TE.END_EMPRESA, T' +
        'E.END_NUMERO, TE.END_CIDADE,'
      
        '  TE.END_BAIRRO, TE.END_UF, TE.END_CEP, TE.NR_TELEFONE, TE.NR_FA' +
        'X, TPA.NM_PAIS, TG.NM_GRUPO,'
      
        '  TP.CD_VENDEDOR,TP.NM_EMAIL, TP.NM_CONTATO, TP.CD_USUARIO,TE.IN' +
        '_RESTRICAO'
      'FROM TPROC_COMERC TP'
      '  LEFT JOIN TEMPRESA_NAC TE'
      '    ON(TE.CD_EMPRESA = TP.CD_EMPRESA)'
      '  LEFT JOIN TGRUPO TG'
      '    ON(TG.CD_GRUPO = TE.CD_GRUPO)'
      '  LEFT JOIN TPAIS_BROKER TPA'
      '    ON(TPA.CD_PAIS = TE.CD_PAIS_IMPORTADOR)'
      'WHERE NR_PROC_COMERC=:NR_PROC_COMERC'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd_qry_proc_comerc_
    Left = 263
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
      end>
    object qry_proc_comerc_NR_PROC_COMERC: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TPROC_COMERC.NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_proc_comerc_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TPROC_COMERC.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_proc_comerc_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'DBBROKER.TPROC_COMERC.DT_ABERTURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_proc_comerc_TP_SALES: TStringField
      FieldName = 'TP_SALES'
      Origin = 'DBBROKER.TPROC_COMERC.TP_SALES'
      FixedChar = True
      Size = 1
    end
    object qry_proc_comerc_TP_CLIENTE: TStringField
      FieldName = 'TP_CLIENTE'
      Origin = 'DBBROKER.TPROC_COMERC.TP_CLIENTE'
      FixedChar = True
    end
    object qry_proc_comerc_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPROC_COMERC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_proc_comerc_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TPROC_COMERC.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_proc_comerc_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TPROC_COMERC.NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Origin = 'DBBROKER.TPROC_COMERC.NM_EMAIL'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPROC_COMERC.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_proc_comerc_look_nm_unid_neg: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 35
      Lookup = True
    end
    object qry_proc_comerc_look_nm_vendedor: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_vendedor'
      LookupDataSet = qry_vendedor_
      LookupKeyFields = 'CD_VENDEDOR'
      LookupResultField = 'NM_VENDEDOR'
      KeyFields = 'CD_VENDEDOR'
      Size = 35
      Lookup = True
    end
    object qry_proc_comerc_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_proc_comerc_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_proc_comerc_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_proc_comerc_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_proc_comerc_END_CEP: TStringField
      FieldName = 'END_CEP'
      EditMask = '00000-000;0;_'
      FixedChar = True
      Size = 8
    end
    object qry_proc_comerc_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_proc_comerc_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_proc_comerc_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qry_proc_comerc_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_pais_broker_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_comerc
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS_BROKER ')
    Left = 37
    Top = 208
    object qry_pais_broker_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_pais_broker_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS'
      FixedChar = True
      Size = 120
    end
  end
  object ds_proc_comerc_lista: TDataSource
    DataSet = qry_proc_comerc_lista_
    Left = 47
    Top = 74
  end
  object qry_vendedor_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select *'
      'from TVENDEDOR WHERE CD_UNID_NEG=:CD_UNID_NEG')
    Left = 221
    Top = 136
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_vendedor_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TVENDEDOR.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_vendedor_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      Origin = 'DBBROKER.TVENDEDOR.NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select *'
      'from TUNID_NEG with(nolock) '
      'where IN_ATIVO = '#39'1'#39' '
      'AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG'
      'from TUSUARIO_HABILITACAO '
      'where CD_USUARIO =:CD_USUARIO)')
    Left = 245
    Top = 72
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TUNID_NEG.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select DISTINCT TE.NM_EMPRESA,TE.CD_EMPRESA, TP.NM_PAIS ,'
      '        TE.END_EMPRESA,TE.CD_PAIS_IMPORTADOR,'
      '        TE.END_NUMERO,'
      '        TE.END_CIDADE,'
      '        TE.END_BAIRRO,TE.IN_RESTRICAO,'
      '        TE.END_UF,'
      '        TE.END_CEP, TE.DT_INCLUSAO,TE.IN_CLIENTE, TE.IN_OUTROS,'
      '        TE.IN_ATIVO,'
      '        TE.NR_TELEFONE,TG.NM_GRUPO,'
      '        TE.NR_FAX'
      'from  TEMPRESA_NAC TE'
      ''
      'LEFT JOIN TPAIS_BROKER TP'
      '  ON(TP.CD_PAIS = TE.CD_PAIS_IMPORTADOR)'
      'LEFT JOIN TGRUPO TG'
      '  ON(TG.CD_GRUPO = TE.CD_GRUPO)'
      
        'LEFT JOIN TCLIENTE_HABILITACAO TH ON (TH.CD_CLIENTE = TE.CD_EMPR' +
        'ESA)'
      'where TE.CD_EMPRESA =:CD_EMPRESA  AND TE.IN_ATIVO = '#39'1'#39
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 35
    Top = 152
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_empresa_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_empresa_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_empresa_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_empresa_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_empresa_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_empresa_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_empresa_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_empresa_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_empresa_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_empresa_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'DBBROKER.TEMPRESA_NAC.DT_INCLUSAO'
    end
    object qry_empresa_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_CLIENTE'
    end
    object qry_empresa_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_OUTROS'
    end
    object qry_empresa_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'DBBROKER.TEMPRESA_NAC.NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_empresa_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'DBBROKER.TEMPRESA_NAC.NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_empresa_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qry_empresa_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
    object qry_empresa_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, TU.NM_UNID_NEG, UH.IN_ATIV' +
        'O, UH.IN_DEFAULT'
      'FROM TUSUARIO_HABILITACAO UH with(nolock)'
      'LEFT JOIN TUNID_NEG TU'
      '  ON(TU.CD_UNID_NEG = UH.CD_UNID_NEG)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 35
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.IN_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
  end
  object qry_tp_sales_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_comerc
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_SALES')
    Left = 101
    Top = 400
    object qry_tp_sales_CD_SALES: TStringField
      FieldName = 'CD_SALES'
      Origin = 'DBBROKER.TTP_SALES.CD_SALES'
      FixedChar = True
      Size = 1
    end
    object qry_tp_sales_NM_SALES: TStringField
      FieldName = 'NM_SALES'
      Origin = 'DBBROKER.TTP_SALES.NM_SALES'
      FixedChar = True
      Size = 50
    end
  end
  object ds_tp_sales: TDataSource
    DataSet = qry_tp_sales_
    Left = 19
    Top = 400
  end
  object qry_proc_comerc_lista_: TQuery
    CachedUpdates = True
    AfterScroll = qry_proc_comerc_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TPC.NR_PROC_COMERC,TPC.DT_ABERTURA,TPC.CD_UNID_NEG, TPC.C' +
        'D_EMPRESA, TE.CD_PAIS_IMPORTADOR, TPC.NM_EMAIL,TPC.NM_CONTATO,TP' +
        'C.CD_USUARIO,TE.NM_EMPRESA, TE.CGC_EMPRESA'
      'FROM TPROC_COMERC TPC, TEMPRESA_NAC TE'
      
        'WHERE TPC.CD_UNID_NEG=:CD_UNID_NEG AND TPC.CD_EMPRESA = TE.CD_EM' +
        'PRESA'
      'ORDER BY'
      ' NM_EMPRESA'
      ''
      ' '
      ''
      ' ')
    Left = 141
    Top = 56
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_proc_comerc_lista_NR_PROC_COMERC: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TPROC_COMERC.NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_proc_comerc_lista_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'DBBROKER.TPROC_COMERC.DT_ABERTURA'
    end
    object qry_proc_comerc_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TPROC_COMERC.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_proc_comerc_lista_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPROC_COMERC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_proc_comerc_lista_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Origin = 'DBBROKER.TPROC_COMERC.NM_EMAIL'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_lista_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TPROC_COMERC.NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_lista_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPROC_COMERC.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_proc_comerc_lista_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_lista_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CGC_EMPRESA'
      EditMask = '!99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object qry_proc_comerc_lista_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
  end
  object qry_agenda_comerc_: TQuery
    CachedUpdates = True
    BeforePost = qry_agenda_comerc_BeforePost
    AfterPost = qry_agenda_comerc_AfterPost
    AfterDelete = qry_agenda_comerc_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'select top 1 *  from TAGENDA_COMERC ')
    UpdateObject = upd_qry_agenda_comerc_
    Left = 359
    Top = 200
    object qry_agenda_comerc_look_nm_vendedor: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_vendedor'
      LookupDataSet = qry_vendedor_
      LookupKeyFields = 'CD_VENDEDOR'
      LookupResultField = 'NM_VENDEDOR'
      KeyFields = 'CD_VENDEDOR'
      Size = 35
      Lookup = True
    end
    object qry_agenda_comerc_look_nm_contato: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_contato'
      LookupDataSet = qry_proc_comerc_historico_
      LookupKeyFields = 'CD_AGENDA'
      LookupResultField = 'NM_CONTATO'
      KeyFields = 'CD_AGENDA'
      Size = 35
      Lookup = True
    end
    object qry_agenda_comerc_CD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
    end
    object qry_agenda_comerc_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_comerc_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comerc_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
    end
    object qry_agenda_comerc_HR_AGENDA: TDateTimeField
      FieldName = 'HR_AGENDA'
    end
    object qry_agenda_comerc_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comerc_OBS_AGENDA: TMemoField
      FieldName = 'OBS_AGENDA'
      BlobType = ftMemo
    end
    object qry_agenda_comerc_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_agenda_comerc_TP_AGENDA: TStringField
      FieldName = 'TP_AGENDA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comerc_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 30
    end
  end
  object ds_agenda_comerc: TDataSource
    DataSet = qry_agenda_comerc_
    Left = 229
    Top = 200
  end
  object qry_proc_comerc_historico_: TQuery
    CachedUpdates = True
    BeforePost = qry_proc_comerc_historico_BeforePost
    AfterPost = qry_proc_comerc_historico_AfterPost
    AfterDelete = qry_proc_comerc_historico_AfterDelete
    OnCalcFields = qry_proc_comerc_historico_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_comerc
    RequestLive = True
    SQL.Strings = (
      'SELECT PCH.* , AC.CD_VENDEDOR'
      'FROM TPROC_COMERC_HISTORICO PCH'
      'LEFT JOIN TAGENDA_COMERC AC ON AC.CD_AGENDA = PCH.CD_AGENDA'
      'WHERE PCH.NR_PROC_COMERC=:NR_PROC_COMERC'
      'ORDER BY PCH.DT_HISTORICO DESC'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = upd_qry_proc_comerc_historico_
    Left = 365
    Top = 136
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_proc_comerc_historico_CD_HIST_PROC_COMERC: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CD_HIST_PROC_COMERC'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.CD_HIST_PROC_COMERC'
      DisplayFormat = '0000'
    end
    object qry_proc_comerc_historico_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_proc_comerc_historico_HR_HISTORICO: TDateTimeField
      FieldName = 'HR_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.HR_HISTORICO'
      DisplayFormat = 'hh:nn'
      EditMask = '!99:99;1;_'
    end
    object qry_proc_comerc_historico_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.NM_HISTORICO'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_historico_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_proc_comerc_historico_TX_OBS_HISTORICO: TMemoField
      FieldName = 'TX_OBS_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.TX_OBS_HISTORICO'
      BlobType = ftMemo
    end
    object qry_proc_comerc_historico_CD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.CD_AGENDA'
    end
    object qry_proc_comerc_historico_DT_HISTORICO: TDateTimeField
      FieldName = 'DT_HISTORICO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.DT_HISTORICO'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_proc_comerc_historico_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_proc_comerc_historico_calc_tp_historico: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_historico'
      Size = 15
      Calculated = True
    end
    object qry_proc_comerc_historico_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_proc_comerc_historico_calcVendedor: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcVendedor'
      Size = 150
      Calculated = True
    end
  end
  object ds_proc_comerc_historico: TDataSource
    DataSet = qry_proc_comerc_historico_
    Left = 373
    Top = 72
  end
  object upd_qry_agenda_comerc_: TUpdateSQL
    ModifySQL.Strings = (
      'update TAGENDA_COMERC'
      'set'
      '  CD_AGENDA = :CD_AGENDA,'
      '  CD_VENDEDOR = :CD_VENDEDOR,'
      '  IN_PERIODO = :IN_PERIODO,'
      '  DT_AGENDA = :DT_AGENDA,'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  OBS_AGENDA = :OBS_AGENDA,'
      '  TP_AGENDA = :TP_AGENDA,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  HR_AGENDA = :HR_AGENDA'
      'where'
      '  CD_AGENDA = :OLD_CD_AGENDA and'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  IN_PERIODO = :OLD_IN_PERIODO and'
      '  DT_AGENDA = :OLD_DT_AGENDA')
    InsertSQL.Strings = (
      'insert into TAGENDA_COMERC'
      
        '  (CD_AGENDA, CD_VENDEDOR, IN_PERIODO, DT_AGENDA, NR_PROC_COMERC' +
        ', IN_CANCELADO, '
      '   OBS_AGENDA, TP_AGENDA, NM_CONTATO, HR_AGENDA)'
      'values'
      
        '  (:CD_AGENDA, :CD_VENDEDOR, :IN_PERIODO, :DT_AGENDA, :NR_PROC_C' +
        'OMERC, '
      
        '   :IN_CANCELADO, :OBS_AGENDA, :TP_AGENDA, :NM_CONTATO, :HR_AGEN' +
        'DA)')
    DeleteSQL.Strings = (
      'delete from TAGENDA_COMERC'
      'where'
      '  CD_AGENDA = :OLD_CD_AGENDA and'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  IN_PERIODO = :OLD_IN_PERIODO and'
      '  DT_AGENDA = :OLD_DT_AGENDA')
    Left = 509
    Top = 200
  end
  object upd_qry_proc_comerc_historico_: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROC_COMERC_HISTORICO'
      'set'
      '  CD_HIST_PROC_COMERC = :CD_HIST_PROC_COMERC,'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  DT_HISTORICO = :DT_HISTORICO,'
      '  HR_HISTORICO = :HR_HISTORICO,'
      '  NM_HISTORICO = :NM_HISTORICO,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  TX_OBS_HISTORICO = :TX_OBS_HISTORICO,'
      '  CD_AGENDA = :CD_AGENDA,'
      '  IN_PERIODO = :IN_PERIODO'
      'where'
      '  CD_HIST_PROC_COMERC = :OLD_CD_HIST_PROC_COMERC and'
      '  NR_PROC_COMERC = :OLD_NR_PROC_COMERC')
    InsertSQL.Strings = (
      'insert into TPROC_COMERC_HISTORICO'
      
        '  (CD_HIST_PROC_COMERC, NR_PROC_COMERC, DT_HISTORICO, HR_HISTORI' +
        'CO, NM_HISTORICO, '
      '   NM_CONTATO, TX_OBS_HISTORICO, CD_AGENDA, IN_PERIODO)'
      'values'
      
        '  (:CD_HIST_PROC_COMERC, :NR_PROC_COMERC, :DT_HISTORICO, :HR_HIS' +
        'TORICO, '
      
        '   :NM_HISTORICO, :NM_CONTATO, :TX_OBS_HISTORICO, :CD_AGENDA, :I' +
        'N_PERIODO)')
    DeleteSQL.Strings = (
      'delete from TPROC_COMERC_HISTORICO'
      'where'
      '  CD_HIST_PROC_COMERC = :OLD_CD_HIST_PROC_COMERC and'
      '  NR_PROC_COMERC = :OLD_NR_PROC_COMERC')
    Left = 525
    Top = 144
  end
  object qry_ult_proc_comerc_historico_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_comerc
    SQL.Strings = (
      'select max(CD_HIST_PROC_COMERC) as ULTIMO '
      'from TPROC_COMERC_HISTORICO'
      'where NR_PROC_COMERC=:NR_PROC_COMERC'
      '')
    Left = 517
    Top = 72
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
      end>
    object qry_ult_proc_comerc_historico_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROC_COMERC_HISTORICO.CD_HIST_PROC_COMERC'
      DisplayFormat = '0000'
    end
  end
  object ds_vendedor: TDataSource
    DataSet = qry_vendedor_
    Left = 139
    Top = 120
  end
  object qry_ult_agenda_comerc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select max(CD_AGENDA) as ULTIMO '
      'from TAGENDA_COMERC'
      '')
    Left = 365
    Top = 264
    object qry_ult_agenda_comerc_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
    end
  end
  object qry_agenda_comerc_lista_: TQuery
    CachedUpdates = True
    BeforePost = qry_agenda_comerc_lista_BeforePost
    AfterPost = qry_agenda_comerc_lista_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'select * from TAGENDA_COMERC'
      
        'where CD_AGENDA in (select TPCH.CD_AGENDA  from TPROC_COMERC_HIS' +
        'TORICO TPCH '
      
        'where TPCH.CD_AGENDA IS NOT NULL and TPCH.NR_PROC_COMERC=:NR_PRO' +
        'C_COMERC) '
      
        'and IN_CANCELADO = 0   AND (DT_AGENDA > :DT_AGENDA OR DT_AGENDA ' +
        '= :DT_AGENDA)'
      'ORDER BY DT_AGENDA DESC'
      ' '
      ' '
      ' ')
    UpdateObject = upd_qry_agenda_comerc_lista_
    Left = 208
    Top = 336
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_AGENDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_AGENDA'
        ParamType = ptUnknown
      end>
    object qry_agenda_comerc_lista_CD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
    end
    object qry_agenda_comerc_lista_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_comerc_lista_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comerc_lista_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_agenda_comerc_lista_HR_AGENDA: TDateTimeField
      FieldName = 'HR_AGENDA'
      DisplayFormat = 'hh:nn'
      EditMask = '!99:99;1;_'
    end
    object qry_agenda_comerc_lista_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comerc_lista_OBS_AGENDA: TMemoField
      FieldName = 'OBS_AGENDA'
      BlobType = ftMemo
    end
    object qry_agenda_comerc_lista_look_nm_vendedor: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_vendedor'
      LookupDataSet = qry_vendedor_
      LookupKeyFields = 'CD_VENDEDOR'
      LookupResultField = 'NM_VENDEDOR'
      KeyFields = 'CD_VENDEDOR'
      Size = 35
      Lookup = True
    end
    object qry_agenda_comerc_lista_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_agenda_comerc_lista_TP_AGENDA: TStringField
      FieldName = 'TP_AGENDA'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_comerc_lista_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 30
    end
  end
  object ds_agenda_comerc_lista: TDataSource
    DataSet = qry_agenda_comerc_lista_
    Left = 205
    Top = 280
  end
  object upd_qry_agenda_comerc_lista_: TUpdateSQL
    ModifySQL.Strings = (
      'update TAGENDA_COMERC'
      'set'
      '  CD_AGENDA = :CD_AGENDA,'
      '  CD_VENDEDOR = :CD_VENDEDOR,'
      '  IN_PERIODO = :IN_PERIODO,'
      '  DT_AGENDA = :DT_AGENDA,'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  OBS_AGENDA = :OBS_AGENDA,'
      '  TP_AGENDA = :TP_AGENDA,'
      '  NM_CONTATO = :NM_CONTATO,'
      '  HR_AGENDA = :HR_AGENDA'
      'where'
      '  CD_AGENDA = :OLD_CD_AGENDA and'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  IN_PERIODO = :OLD_IN_PERIODO and'
      '  DT_AGENDA = :OLD_DT_AGENDA')
    InsertSQL.Strings = (
      'insert into TAGENDA_COMERC'
      
        '  (CD_AGENDA, CD_VENDEDOR, IN_PERIODO, DT_AGENDA, NR_PROC_COMERC' +
        ', IN_CANCELADO, '
      '   OBS_AGENDA, TP_AGENDA, NM_CONTATO, HR_AGENDA)'
      'values'
      
        '  (:CD_AGENDA, :CD_VENDEDOR, :IN_PERIODO, :DT_AGENDA, :NR_PROC_C' +
        'OMERC, '
      
        '   :IN_CANCELADO, :OBS_AGENDA, :TP_AGENDA, :NM_CONTATO, :HR_AGEN' +
        'DA)')
    DeleteSQL.Strings = (
      'delete from TAGENDA_COMERC'
      'where'
      '  CD_AGENDA = :OLD_CD_AGENDA and'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  IN_PERIODO = :OLD_IN_PERIODO and'
      '  DT_AGENDA = :OLD_DT_AGENDA')
    Left = 366
    Top = 360
  end
  object qry_agenda_: TQuery
    AfterPost = qry_agenda_comerc_AfterPost
    AfterDelete = qry_agenda_comerc_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_AGENDA, CD_VENDEDOR, IN_PERIODO, DT_AGENDA  '
      'from TAGENDA_COMERC '
      
        'where CD_VENDEDOR=:CD_VENDEDOR and IN_PERIODO=:IN_PERIODO and DT' +
        '_AGENDA=:DT_AGENDA and IN_CANCELADO = 0'
      '')
    Left = 503
    Top = 272
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'IN_PERIODO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_AGENDA'
        ParamType = ptUnknown
      end>
    object qry_agenda_CD_AGENDA: TIntegerField
      FieldName = 'CD_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_AGENDA'
    end
    object qry_agenda_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TAGENDA_COMERC.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_agenda_IN_PERIODO: TStringField
      FieldName = 'IN_PERIODO'
      Origin = 'DBBROKER.TAGENDA_COMERC.IN_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qry_agenda_DT_AGENDA: TDateTimeField
      FieldName = 'DT_AGENDA'
      Origin = 'DBBROKER.TAGENDA_COMERC.DT_AGENDA'
    end
  end
  object qry_gera_proposta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'INSERT INTO TPROPOSTA(NR_PROPOSTA, CD_UNID_NEG, CD_EMPRESA, CD_V' +
        'ENDEDOR, NR_PROC_COMERC,DT_ABERTURA,'
      '     CD_STATUS, DT_STATUS, CD_USUARIO, TP_PROPOSTA )'
      'VALUES'
      
        '  (:NR_PROPOSTA, :CD_UNID_NEG, :CD_EMPRESA, :CD_VENDEDOR, :NR_PR' +
        'OC_COMERC, :DT_ABERTURA,'
      '     :CD_STATUS, :DT_STATUS, :CD_USUARIO, :TP_PROPOSTA )'
      ' ')
    Left = 40
    Top = 280
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_ABERTURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_PROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qry_ult_proposta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROPOSTA) AS ULTIMO FROM TPROPOSTA'
      '  WHERE CD_UNID_NEG=:CD_UNID_NEG')
    Left = 48
    Top = 336
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ult_proposta_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROPOSTA.NR_PROPOSTA'
      FixedChar = True
    end
  end
  object qry_proposta_: TQuery
    OnCalcFields = qry_proposta_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROPOSTA,'
      '    CD_UNID_NEG,'
      '    CD_EMPRESA,'
      '    DT_ABERTURA,'
      '    DT_VALIDADE,'
      '    CD_STATUS,'
      '    DT_STATUS,'
      '    NM_RESPONSAVEL,'
      '    NR_PROC_COMERC,'
      '    CASE TP_PROPOSTA'
      '     WHEN '#39'0'#39' THEN '#39'Proposta'#39
      '     WHEN '#39'1'#39' THEN '#39'Cota'#231#227'o'#39
      '    END AS TIPO_PROPOSTA,'
      '    CD_USUARIO'
      '  FROM TPROPOSTA'
      ' WHERE CD_EMPRESA=:CD_EMPRESA   AND CD_UNID_NEG=:CD_UNID_NEG'
      ' '
      ' ')
    Left = 496
    Top = 328
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_proposta_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA.NR_PROPOSTA'
      FixedChar = True
    end
    object qry_proposta_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TPROPOSTA.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPROPOSTA.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_proposta_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'DBBROKER.TPROPOSTA.DT_ABERTURA'
    end
    object qry_proposta_DT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'DBBROKER.TPROPOSTA.DT_VALIDADE'
    end
    object qry_proposta_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.TPROPOSTA.CD_STATUS'
      FixedChar = True
      Size = 15
    end
    object qry_proposta_DT_STATUS: TDateTimeField
      FieldName = 'DT_STATUS'
      Origin = 'DBBROKER.TPROPOSTA.DT_STATUS'
    end
    object qry_proposta_NM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Origin = 'DBBROKER.TPROPOSTA.NM_RESPONSAVEL'
      FixedChar = True
    end
    object qry_proposta_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TPROPOSTA.NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_proposta_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPROPOSTA.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_calc_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_status'
      Calculated = True
    end
    object qry_proposta_TIPO_PROPOSTA: TStringField
      FieldName = 'TIPO_PROPOSTA'
      FixedChar = True
      Size = 8
    end
  end
  object ds_proposta: TDataSource
    DataSet = qry_proposta_
    Left = 576
    Top = 328
  end
  object qry_proc_vendedor_: TQuery
    CachedUpdates = True
    AfterPost = qry_proc_vendedor_AfterPost
    AfterDelete = qry_proc_vendedor_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.CD_VENDEDOR,(SELECT TV.NM_VENDEDOR FROM TVENDEDOR TV W' +
        'HERE TV.CD_VENDEDOR = TP.CD_VENDEDOR) NM_VENDEDOR,'
      
        'TP.NR_PROC_COMERC, TP.TP_CALC_COMIS_IMP_AEREA, TP.TP_CALC_COMIS_' +
        'IMP_MARITIMA, TP_CALC_COMIS_EXP_AEREA,'
      
        '   TP.TP_CALC_COMIS_EXP_MARITIMA, TP.TP_CALC_DESEMBARACO, TP.VL_' +
        'CALC_IMP_AEREA, TP.VL_CALC_IMP_MARITIMA, TP.VL_CALC_EXP_AEREA,'
      
        '     TP.VL_CALC_DESEMBARACO,TP.VL_CALC_EXP_MARITIMA FROM TPROC_V' +
        'ENDEDOR TP WHERE TP.NR_PROC_COMERC=:NR_PROC_COMERC'
      ' ')
    UpdateObject = UpDate_proc_vendedor
    Left = 344
    Top = 424
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROC_COMERC'
        ParamType = ptUnknown
      end>
    object qry_proc_vendedor_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TPROC_VENDEDOR.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_proc_vendedor_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      Origin = 'DBBROKER.TPROC_VENDEDOR.NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_proc_vendedor_TP_CALC_COMIS_IMP_AEREA: TStringField
      FieldName = 'TP_CALC_COMIS_IMP_AEREA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.TP_CALC_COMIS_IMP_AEREA'
      FixedChar = True
      Size = 2
    end
    object qry_proc_vendedor_TP_CALC_COMIS_IMP_MARITIMA: TStringField
      FieldName = 'TP_CALC_COMIS_IMP_MARITIMA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.TP_CALC_COMIS_IMP_MARITIMA'
      FixedChar = True
      Size = 2
    end
    object qry_proc_vendedor_TP_CALC_COMIS_EXP_AEREA: TStringField
      FieldName = 'TP_CALC_COMIS_EXP_AEREA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.TP_CALC_COMIS_EXP_AEREA'
      FixedChar = True
      Size = 2
    end
    object qry_proc_vendedor_TP_CALC_COMIS_EXP_MARITIMA: TStringField
      FieldName = 'TP_CALC_COMIS_EXP_MARITIMA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.TP_CALC_COMIS_EXP_MARITIMA'
      FixedChar = True
      Size = 2
    end
    object qry_proc_vendedor_TP_CALC_DESEMBARACO: TStringField
      FieldName = 'TP_CALC_DESEMBARACO'
      Origin = 'DBBROKER.TPROC_VENDEDOR.TP_CALC_DESEMBARACO'
      FixedChar = True
      Size = 2
    end
    object qry_proc_vendedor_VL_CALC_IMP_AEREA: TFloatField
      FieldName = 'VL_CALC_IMP_AEREA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.VL_CALC_IMP_AEREA'
      DisplayFormat = '0.00'
    end
    object qry_proc_vendedor_VL_CALC_IMP_MARITIMA: TFloatField
      FieldName = 'VL_CALC_IMP_MARITIMA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.VL_CALC_IMP_MARITIMA'
      DisplayFormat = '0.00'
    end
    object qry_proc_vendedor_VL_CALC_EXP_AEREA: TFloatField
      FieldName = 'VL_CALC_EXP_AEREA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.VL_CALC_EXP_AEREA'
      DisplayFormat = '0.00'
    end
    object qry_proc_vendedor_VL_CALC_DESEMBARACO: TFloatField
      FieldName = 'VL_CALC_DESEMBARACO'
      Origin = 'DBBROKER.TPROC_VENDEDOR.VL_CALC_DESEMBARACO'
      DisplayFormat = '0.00'
    end
    object qry_proc_vendedor_VL_CALC_EXP_MARITIMA: TFloatField
      FieldName = 'VL_CALC_EXP_MARITIMA'
      Origin = 'DBBROKER.TPROC_VENDEDOR.VL_CALC_EXP_MARITIMA'
      DisplayFormat = '0.00'
    end
    object qry_proc_vendedor_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
    object qry_proc_vendedor_Look_tp_calc_imp_aerea: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_calc_imp_aerea'
      LookupDataSet = qry_base_calc_vendedor_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_IMP_AEREA'
      Size = 10
      Lookup = True
    end
    object qry_proc_vendedor_Look_tp_calc_imp_maritima: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_calc_imp_maritima'
      LookupDataSet = qry_base_calc_vendedor_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_IMP_MARITIMA'
      Size = 10
      Lookup = True
    end
    object qry_proc_vendedor_Look_tp_exp_aerea: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_exp_aerea'
      LookupDataSet = qry_base_calc_vendedor_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_EXP_AEREA'
      Size = 10
      Lookup = True
    end
    object qry_proc_vendedor_Look_tp_calc_exp_maritima: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_calc_exp_maritima'
      LookupDataSet = qry_base_calc_vendedor_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_EXP_MARITIMA'
      Size = 10
      Lookup = True
    end
    object qry_proc_vendedor_look_tp_calc_desembaraco: TStringField
      FieldKind = fkLookup
      FieldName = 'look_tp_calc_desembaraco'
      LookupDataSet = qry_base_calc_vendedor_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_DESEMBARACO'
      Size = 10
      Lookup = True
    end
  end
  object ds_proc_vendedor: TDataSource
    DataSet = qry_proc_vendedor_
    Left = 488
    Top = 424
  end
  object UpDate_proc_vendedor: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROC_VENDEDOR'
      'set'
      '  CD_VENDEDOR = :CD_VENDEDOR,'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  TP_CALC_COMIS_IMP_AEREA = :TP_CALC_COMIS_IMP_AEREA,'
      '  TP_CALC_COMIS_IMP_MARITIMA = :TP_CALC_COMIS_IMP_MARITIMA,'
      '  TP_CALC_COMIS_EXP_AEREA = :TP_CALC_COMIS_EXP_AEREA,'
      '  TP_CALC_COMIS_EXP_MARITIMA = :TP_CALC_COMIS_EXP_MARITIMA,'
      '  TP_CALC_DESEMBARACO = :TP_CALC_DESEMBARACO,'
      '  VL_CALC_IMP_AEREA = :VL_CALC_IMP_AEREA,'
      '  VL_CALC_IMP_MARITIMA = :VL_CALC_IMP_MARITIMA,'
      '  VL_CALC_EXP_AEREA = :VL_CALC_EXP_AEREA,'
      '  VL_CALC_EXP_MARITIMA = :VL_CALC_EXP_MARITIMA,'
      '  VL_CALC_DESEMBARACO = :VL_CALC_DESEMBARACO'
      'where'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  NR_PROC_COMERC = :OLD_NR_PROC_COMERC')
    InsertSQL.Strings = (
      'insert into TPROC_VENDEDOR'
      
        '  (CD_VENDEDOR, NR_PROC_COMERC, TP_CALC_COMIS_IMP_AEREA, TP_CALC' +
        '_COMIS_IMP_MARITIMA, '
      
        '   TP_CALC_COMIS_EXP_AEREA, TP_CALC_COMIS_EXP_MARITIMA, TP_CALC_' +
        'DESEMBARACO, '
      
        '   VL_CALC_IMP_AEREA, VL_CALC_IMP_MARITIMA, VL_CALC_EXP_AEREA, V' +
        'L_CALC_EXP_MARITIMA, '
      '   VL_CALC_DESEMBARACO)'
      'values'
      
        '  (:CD_VENDEDOR, :NR_PROC_COMERC, :TP_CALC_COMIS_IMP_AEREA, :TP_' +
        'CALC_COMIS_IMP_MARITIMA, '
      
        '   :TP_CALC_COMIS_EXP_AEREA, :TP_CALC_COMIS_EXP_MARITIMA, :TP_CA' +
        'LC_DESEMBARACO, '
      
        '   :VL_CALC_IMP_AEREA, :VL_CALC_IMP_MARITIMA, :VL_CALC_EXP_AEREA' +
        ', :VL_CALC_EXP_MARITIMA, '
      '   :VL_CALC_DESEMBARACO)')
    DeleteSQL.Strings = (
      'delete from TPROC_VENDEDOR'
      'where'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  NR_PROC_COMERC = :OLD_NR_PROC_COMERC')
    Left = 584
    Top = 408
  end
  object qry_base_calc_vendedor_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *  FROM TTP_BASE_CALC_VENDEDOR')
    Left = 192
    Top = 432
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 584
    Top = 72
  end
end

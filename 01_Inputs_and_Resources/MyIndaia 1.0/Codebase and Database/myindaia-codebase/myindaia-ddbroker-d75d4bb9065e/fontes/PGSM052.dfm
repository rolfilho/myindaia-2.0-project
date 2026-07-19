object datm_transp_rod: Tdatm_transp_rod
  OldCreateOrder = True
  Left = 212
  Top = 104
  Height = 425
  Width = 561
  object ds_transp_rod: TDataSource
    DataSet = qry_transp_rod_
    Left = 63
    Top = 17
  end
  object qry_transp_rod_: TQuery
    CachedUpdates = True
    AfterPost = qry_transp_rod_AfterPost
    AfterDelete = qry_transp_rod_AfterPost
    AfterScroll = qry_transp_rod_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TRANSP_ROD, NM_TRANSP_ROD, AP_TRANSP_ROD, IN_ATIVO, CN' +
        'PJ_TRANSP_ROD, CONVERT(TEXT, NM_EMAIL) AS NM_EMAIL, END_TRANSP_R' +
        'OD, END_CIDADE, END_UF, IE_TRANSP_ROD, CPF_TRANSP_ROD, CD_PAIS_T' +
        'RANSP, CD_TRANSP_ARMAZEM_FABRICA FROM TTRANSP_ROD'
      'ORDER BY'
      'CD_TRANSP_ROD')
    UpdateObject = upd_transp_rod
    Left = 162
    Top = 17
    object qry_transp_rod_CD_TRANSP_ROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_TRANSP_ROD'
      Origin = 'TTRANSPORTADOR_RODOV.CD_TRANSP_ROD'
      Size = 4
    end
    object qry_transp_rod_NM_TRANSP_ROD: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_TRANSP_ROD'
      Origin = 'TTRANSPORTADOR_RODOV.NM_TRANSP_ROD'
      Size = 60
    end
    object qry_transp_rod_AP_TRANSP_ROD: TStringField
      DisplayLabel = 'Nome Resumido'
      FieldName = 'AP_TRANSP_ROD'
      Origin = 'TTRANSPORTADOR_RODOV.AP_TRANSP_ROD'
    end
    object qry_transp_rod_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TTRANSPORTADOR_RODOV.IN_ATIVO'
      Size = 1
    end
    object qry_transp_rod_LookTranspAtivo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookTranspAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_transp_rod_CNPJ_TRANSP_ROD: TStringField
      FieldName = 'CNPJ_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.CD_TRANSP_ROD'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_transp_rod_END_TRANSP_ROD: TStringField
      FieldName = 'END_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.CD_TRANSP_ROD'
      Size = 50
    end
    object qry_transp_rod_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TTRANSP_ROD.NM_TRANSP_ROD'
      Size = 30
    end
    object qry_transp_rod_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TTRANSP_ROD.AP_TRANSP_ROD'
      Size = 2
    end
    object qry_transp_rod_IE_TRANSP_ROD: TStringField
      FieldName = 'IE_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.CD_TRANSP_ROD'
    end
    object qry_transp_rod_CPF_TRANSP_ROD: TStringField
      FieldName = 'CPF_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.CD_TRANSP_ROD'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_transp_rod_CD_PAIS_TRANSP: TStringField
      FieldName = 'CD_PAIS_TRANSP'
      Origin = 'TTRANSP_ROD.CD_TRANSP_ROD'
      Size = 3
    end
    object qry_transp_rod_LookPais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldKind = fkLookup
      FieldName = 'LookPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CD_PAIS'
      LookupResultField = 'NM_PAIS'
      KeyFields = 'CD_PAIS_TRANSP'
      Size = 120
      Lookup = True
    end
    object qry_transp_rod_NM_EMAIL: TMemoField
      FieldName = 'NM_EMAIL'
      BlobType = ftMemo
    end
    object qry_transp_rod_CD_TRANSP_ARMAZEM_FABRICA: TStringField
      FieldName = 'CD_TRANSP_ARMAZEM_FABRICA'
      FixedChar = True
      Size = 4
    end
  end
  object qry_ult_transp_rod_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_TRANSP_ROD) AS ULTIMO'
      'FROM TTRANSP_ROD')
    Left = 374
    Top = 65
    object qry_ult_transp_rod_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTRANSPORTADOR_RODOV.CD_TRANSP_ROD'
      Size = 4
    end
  end
  object tbl_yesno_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 162
    Top = 112
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 63
    Top = 112
  end
  object qry_ult_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_TAXA) AS ULTIMO'
      'FROM TTAXA_TRANSP_ROD'
      'WHERE CD_TRANSP_ROD = :CD_TRANSP_ROD')
    Left = 262
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TRANSP_ROD'
        ParamType = ptUnknown
      end>
    object qry_ult_taxa_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTAXA_TRANSP_ROD.CD_TAXA'
      Size = 3
    end
  end
  object ds_taxa: TDataSource
    DataSet = qry_taxa_
    Left = 63
    Top = 164
  end
  object qry_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TTAXA_TRANSP_ROD'
      'WHERE CD_TRANSP_ROD = :CD_TRANSP_ROD'
      'ORDER BY CD_TAXA')
    Left = 162
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TRANSP_ROD'
        ParamType = ptUnknown
      end>
    object qry_taxa_CD_TRANSP_ROD: TStringField
      FieldName = 'CD_TRANSP_ROD'
      Origin = 'TTAXA_TRANSP_ROD.CD_TRANSP_ROD'
      Size = 4
    end
    object qry_taxa_CD_TAXA: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 3
      FieldName = 'CD_TAXA'
      Origin = 'TTAXA_TRANSP_ROD.CD_TAXA'
      Size = 3
    end
    object qry_taxa_VL_CNTR_20_MD: TFloatField
      FieldName = 'VL_CNTR_20_MD'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_20_MD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_CNTR_20_ME: TFloatField
      FieldName = 'VL_CNTR_20_ME'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_20_ME'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_CNTR_20_MD_RORO: TFloatField
      FieldName = 'VL_CNTR_20_MD_RORO'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_20_MD_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_CNTR_20_ME_RORO: TFloatField
      FieldName = 'VL_CNTR_20_ME_RORO'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_20_ME_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_CNTR_40_MD: TFloatField
      FieldName = 'VL_CNTR_40_MD'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_40_MD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_CNTR_40_ME: TFloatField
      FieldName = 'VL_CNTR_40_ME'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_40_ME'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_CNTR_40_MD_RORO: TFloatField
      FieldName = 'VL_CNTR_40_MD_RORO'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_40_MD_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_CNTR_40_ME_RORO: TFloatField
      FieldName = 'VL_CNTR_40_ME_RORO'
      Origin = 'TTAXA_TRANSP_ROD.VL_CNTR_40_ME_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_C_SOLTA_MD: TFloatField
      FieldName = 'VL_C_SOLTA_MD'
      Origin = 'TTAXA_TRANSP_ROD.VL_C_SOLTA_MD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_C_SOLTA_ME: TFloatField
      FieldName = 'VL_C_SOLTA_ME'
      Origin = 'TTAXA_TRANSP_ROD.VL_C_SOLTA_ME'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_C_SOLTA_MD_RORO: TFloatField
      FieldName = 'VL_C_SOLTA_MD_RORO'
      Origin = 'TTAXA_TRANSP_ROD.VL_C_SOLTA_MD_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_VL_C_SOLTA_ME_RORO: TFloatField
      FieldName = 'VL_C_SOLTA_ME_RORO'
      Origin = 'TTAXA_TRANSP_ROD.VL_C_SOLTA_ME_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_taxa_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TTAXA_TRANSP_ROD.IN_ATIVO'
      Size = 1
    end
    object qry_taxa_LookTaxaAtivo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookTaxaAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_taxa_NM_TAXA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_TAXA'
      Origin = 'TTAXA_TRANSP_ROD.CD_TRANSP_ROD'
      Size = 30
    end
    object qry_taxa_LookTranspRod: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTranspRod'
      LookupDataSet = qry_transp_rod_
      LookupKeyFields = 'CD_TRANSP_ROD'
      LookupResultField = 'NM_TRANSP_ROD'
      KeyFields = 'CD_TRANSP_ROD'
      Size = 60
      Lookup = True
    end
  end
  object qry_dner_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TTRANSP_ROD_DNER'
      'WHERE CD_TRANSP_ROD = :CD_TRANSP_ROD')
    Left = 161
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TRANSP_ROD'
        ParamType = ptUnknown
      end>
    object qry_dner_CD_TRANSP_ROD: TStringField
      DisplayLabel = 'Transportador Rodovi'#225'rio'
      FieldName = 'CD_TRANSP_ROD'
      Origin = 'TTRANSP_ROD_DNER.CD_TRANSP_ROD'
      Size = 4
    end
    object qry_dner_CD_TRANSP_ROD_DNER: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'DNER'
      FieldName = 'CD_TRANSP_ROD_DNER'
      Origin = 'TTRANSP_ROD_DNER.CD_TRANSP_ROD_DNER'
      EditMask = '9999;0; '
      Size = 4
    end
  end
  object ds_dner: TDataSource
    DataSet = qry_dner_
    Left = 61
    Top = 223
  end
  object qry_pais_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_PAIS, NM_PAIS '
      'FROM TPAIS_BROKER')
    Left = 263
    Top = 164
    object qry_pais_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TPAIS_BROKER.CD_PAIS'
      Size = 3
    end
    object qry_pais_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'TPAIS_BROKER.NM_PAIS'
      Size = 120
    end
  end
  object qry_transp_rod_contato: TQuery
    CachedUpdates = True
    AfterPost = qry_transp_rod_contatoAfterPost
    AfterDelete = qry_transp_rod_contatoAfterDelete
    OnNewRecord = qry_transp_rod_contatoNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_transp_rod
    SQL.Strings = (
      'select CD_TRANSP_ROD'
      ','#9'CD_GRUPO'
      ','#9'CD_EMPRESA'
      ','#9'CD_VIA_TRANSP'
      ','#9'convert(TEXT,nm_email) NM_EMAIL'
      '  from ttransp_rod_contato'
      '  where CD_TRANSP_ROD= :CD_TRANSP_ROD')
    UpdateObject = upd_transp_rod_contato
    Left = 159
    Top = 63
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TRANSP_ROD'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_transp_rod_contatoCD_TRANSP_ROD: TStringField
      FieldName = 'CD_TRANSP_ROD'
      Origin = 'DBBROKER.ttransp_rod_contato.CD_TRANSP_ROD'
      FixedChar = True
      Size = 4
    end
    object qry_transp_rod_contatoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.ttransp_rod_contato.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_transp_rod_contatoCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.ttransp_rod_contato.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_transp_rod_contatoCD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.ttransp_rod_contato.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_transp_rod_contatolookGrupo: TStringField
      FieldKind = fkLookup
      FieldName = 'lookGrupo'
      LookupDataSet = qry_grupo
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      ProviderFlags = []
      Size = 30
      Lookup = True
    end
    object qry_transp_rod_contatolookEmpresa: TStringField
      FieldKind = fkLookup
      FieldName = 'lookEmpresa'
      LookupDataSet = qry_empresa
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EMPRESA'
      ProviderFlags = []
      Size = 50
      Lookup = True
    end
    object qry_transp_rod_contatolookVIA_TRANSPORTE: TStringField
      FieldKind = fkLookup
      FieldName = 'lookVIA_TRANSPORTE'
      LookupDataSet = qry_via_transp
      LookupKeyFields = 'CD_VIA_TRANSPORTE'
      LookupResultField = 'NM_VIA_TRANSPORTE'
      KeyFields = 'CD_VIA_TRANSP'
      Size = 30
      Lookup = True
    end
    object qry_transp_rod_contatoNM_EMAIL: TMemoField
      FieldName = 'NM_EMAIL'
      BlobType = ftMemo
    end
  end
  object ds_transp_rod_contato: TDataSource
    DataSet = qry_transp_rod_contato
    Left = 63
    Top = 63
  end
  object qry_empresa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_EMPRESA,NM_EMPRESA FROM TEMPRESA_NAC')
    Left = 288
    Top = 288
    object qry_empresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_empresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object qry_grupo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_GRUPO,NM_GRUPO FROM TGRUPO')
    Left = 408
    Top = 288
    object qry_grupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TGRUPO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_grupoNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'DBBROKER.TGRUPO.NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_via_transp: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_VIA_TRANSPORTE,NM_VIA_TRANSPORTE FROM TVIA_TRANSPORTE')
    Left = 344
    Top = 344
    object qry_via_transpCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TVIA_TRANSPORTE.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_via_transpNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TVIA_TRANSPORTE.NM_VIA_TRANSPORTE'
      FixedChar = True
    end
  end
  object upd_transp_rod_contato: TUpdateSQL
    ModifySQL.Strings = (
      'update ttransp_rod_contato'
      'set'
      '  CD_TRANSP_ROD = :CD_TRANSP_ROD,'
      '  CD_GRUPO = :CD_GRUPO,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  NM_EMAIL = :NM_EMAIL'
      'where'
      '  CD_TRANSP_ROD = :OLD_CD_TRANSP_ROD and'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP and'
      '  NM_EMAIL = :OLD_NM_EMAIL')
    InsertSQL.Strings = (
      'insert into ttransp_rod_contato'
      '  (CD_TRANSP_ROD, CD_GRUPO, CD_EMPRESA, CD_VIA_TRANSP, NM_EMAIL)'
      'values'
      
        '  (:CD_TRANSP_ROD, :CD_GRUPO, :CD_EMPRESA, :CD_VIA_TRANSP, :NM_E' +
        'MAIL)')
    DeleteSQL.Strings = (
      'delete from ttransp_rod_contato'
      'where'
      '  CD_TRANSP_ROD = :OLD_CD_TRANSP_ROD and'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  CD_VIA_TRANSP = :OLD_CD_VIA_TRANSP and'
      '  NM_EMAIL = :OLD_NM_EMAIL')
    Left = 232
    Top = 64
  end
  object upd_transp_rod: TUpdateSQL
    ModifySQL.Strings = (
      'update TTRANSP_ROD'
      'set'
      '  CD_TRANSP_ROD = :CD_TRANSP_ROD,'
      '  NM_TRANSP_ROD = :NM_TRANSP_ROD,'
      '  AP_TRANSP_ROD = :AP_TRANSP_ROD,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  CNPJ_TRANSP_ROD = :CNPJ_TRANSP_ROD,'
      '  NM_EMAIL = :NM_EMAIL,'
      '  END_TRANSP_ROD = :END_TRANSP_ROD,'
      '  END_CIDADE = :END_CIDADE,'
      '  END_UF = :END_UF,'
      '  IE_TRANSP_ROD = :IE_TRANSP_ROD,'
      '  CPF_TRANSP_ROD = :CPF_TRANSP_ROD,'
      '  CD_PAIS_TRANSP = :CD_PAIS_TRANSP,'
      '  CD_TRANSP_ARMAZEM_FABRICA = :CD_TRANSP_ARMAZEM_FABRICA'
      'where'
      '  CD_TRANSP_ROD = :OLD_CD_TRANSP_ROD')
    InsertSQL.Strings = (
      'insert into TTRANSP_ROD'
      
        '  (CD_TRANSP_ROD, NM_TRANSP_ROD, AP_TRANSP_ROD, IN_ATIVO, CNPJ_T' +
        'RANSP_ROD, '
      
        '   NM_EMAIL, END_TRANSP_ROD, END_CIDADE, END_UF, IE_TRANSP_ROD, ' +
        'CPF_TRANSP_ROD, '
      '   CD_PAIS_TRANSP, CD_TRANSP_ARMAZEM_FABRICA)'
      'values'
      
        '  (:CD_TRANSP_ROD, :NM_TRANSP_ROD, :AP_TRANSP_ROD, :IN_ATIVO, :C' +
        'NPJ_TRANSP_ROD, '
      
        '   :NM_EMAIL, :END_TRANSP_ROD, :END_CIDADE, :END_UF, :IE_TRANSP_' +
        'ROD, :CPF_TRANSP_ROD, '
      '   :CD_PAIS_TRANSP, :CD_TRANSP_ARMAZEM_FABRICA)')
    DeleteSQL.Strings = (
      'delete from TTRANSP_ROD'
      'where'
      '  CD_TRANSP_ROD = :OLD_CD_TRANSP_ROD')
    Left = 248
    Top = 16
  end
end

object datm_sel_cli_periodo: Tdatm_sel_cli_periodo
  Left = 258
  Top = 195
  Height = 256
  Width = 547
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 27
    Top = 16
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 112
    Top = 16
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
  end
  object sp_proc_pag_desemb: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_pag_desemb'
    Params.Data = {
      0100090006526573756C74040304000000000000000C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000940
      63645F677275706F01010200300000000B4063645F636C69656E746501010200
      30000000094063645F63616E616C01010200300000000F40506572696F646F49
      6E696369616C01010200300000000D40506572696F646F46696E616C01010200
      3000000011406E725F6964656E746966696361646F7202030400000000000000}
    Left = 229
    Top = 80
  end
  object qry_apaga_dados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TAUX_PROC_PAG_DES_DI'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 229
    Top = 144
    object StringField1: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object sp_processos_abertos_fat: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_ab_fat'
    Params.Data = {
      0100090006526573756C74040304000000000000010C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000B40
      63645F636C69656E74650101020030000000094063645F677275706F01010200
      300000000A4064745F696E6963696F010B080000002C845D40CB420000074064
      745F66696D010B080000002C845D40CB42000007407374617475730101020030
      00000011406E725F6964656E746966696361646F7202030400050000000001}
    Left = 68
    Top = 85
  end
  object qry_limpa_proc_abfat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TAUX_PROC_AB_FAT'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 68
    Top = 141
    object StringField3: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object StringField4: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object sp_proc_pag_des_li: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_pag_desemb_li'
    Params.Data = {
      0100080006526573756C74040304000000000000000C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000940
      63645F677275706F01010200300000000B4063645F636C69656E746501010200
      300000000F40506572696F646F496E696369616C01010200300000000D405065
      72696F646F46696E616C010102003000000011406E725F6964656E7469666963
      61646F7202030400000000000000}
    Left = 405
    Top = 80
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG '
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 240
    Top = 16
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'dbbroker'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {010001000A43445F50524F4455544F0001020030000000}
    Left = 344
    Top = 16
  end
  object ds_tp_canal_: TDataSource
    DataSet = qry_tp_canal_
    Left = 320
    Top = 144
  end
  object qry_tp_canal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CANAL, NM_CANAL'
      'FROM TTP_CANAL'
      'ORDER BY NM_CANAL')
    Left = 400
    Top = 144
    object qry_tp_canal_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TTP_CANAL.CD_CANAL'
      Size = 1
    end
    object qry_tp_canal_NM_CANAL: TStringField
      FieldName = 'NM_CANAL'
      Origin = 'TTP_CANAL.NM_CANAL'
      Size = 10
    end
  end
end

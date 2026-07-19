object datm_relatorios_mail_aut: Tdatm_relatorios_mail_aut
  OldCreateOrder = False
  Left = 357
  Top = 172
  Height = 419
  Width = 355
  object qry_relatorios_mail_aut_: TQuery
    CachedUpdates = True
    AfterPost = qry_relatorios_mail_aut_AfterPost
    AfterDelete = qry_relatorios_mail_aut_AfterDelete
    AfterScroll = qry_relatorios_mail_aut_AfterScroll
    OnCalcFields = qry_relatorios_mail_aut_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' /* alterado no codigo */'
      'SELECT  CD_RELATORIO, NM_RELATORIO, TX_RELATORIO, TX_MODELO, '
      
        '        CD_TIPO_RELATORIO, TX_CONFIGURACAO, IN_ATIVO, IN_FIMDESE' +
        'MANA,'
      
        '        SUBSTRING(TX_CONFIGURACAO,7,3) EVENTO, TP_IDIOMA, CD_VIA' +
        '_TRANSPORTE, '
      
        '        VARIAVEL_CARTAS_CONFIG, IN_SABADO, IN_DOMINGO, IN_GRAVAR' +
        '_DIGITALIZACAO, CD_TP_DOCTO_GRAVAR, TX_CORPO_EMAIL'
      'FROM TRELATORIOS_MAIL_AUT (NOLOCK)'
      'WHERE CD_TIPO_RELATORIO <> '#39'E01'#39
      'AND ( ( :ATIVO = '#39#39' ) OR  ( IN_ATIVO = :ATIVO ))'
      ''
      '')
    UpdateObject = upd_relatorios_mail_aut_
    Left = 73
    Top = 39
    ParamData = <
      item
        DataType = ftString
        Name = 'ATIVO'
        ParamType = ptInput
        Size = 1
      end
      item
        DataType = ftString
        Name = 'ATIVO'
        ParamType = ptInput
      end>
    object qry_relatorios_mail_aut_CD_RELATORIO: TStringField
      FieldName = 'CD_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.CD_RELATORIO'
      FixedChar = True
      Size = 5
    end
    object qry_relatorios_mail_aut_NM_RELATORIO: TStringField
      FieldName = 'NM_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.NM_RELATORIO'
      FixedChar = True
      Size = 100
    end
    object qry_relatorios_mail_aut_TX_RELATORIO: TStringField
      FieldName = 'TX_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.TX_RELATORIO'
      FixedChar = True
      Size = 255
    end
    object qry_relatorios_mail_aut_TX_MODELO: TStringField
      FieldName = 'TX_MODELO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.TX_MODELO'
      FixedChar = True
      Size = 200
    end
    object qry_relatorios_mail_aut_CD_TIPO_RELATORIO: TStringField
      FieldName = 'CD_TIPO_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.CD_TIPO_RELATORIO'
      FixedChar = True
      Size = 3
    end
    object qry_relatorios_mail_aut_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_mail_aut_calc_ATIVO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ATIVO'
      Size = 1
      Calculated = True
    end
    object qry_relatorios_mail_aut_IN_FIMDESEMANA: TStringField
      FieldName = 'IN_FIMDESEMANA'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.IN_FIMDESEMANA'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_mail_aut_TX_CONFIGURACAO: TMemoField
      FieldName = 'TX_CONFIGURACAO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.TX_CONFIGURACAO'
      BlobType = ftMemo
    end
    object qry_relatorios_mail_aut_EVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 3
    end
    object qry_relatorios_mail_aut_TP_IDIOMA: TStringField
      FieldName = 'TP_IDIOMA'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_mail_aut_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_relatorios_mail_aut_VARIAVEL_CARTAS_CONFIG: TStringField
      FieldName = 'VARIAVEL_CARTAS_CONFIG'
      FixedChar = True
      Size = 200
    end
    object qry_relatorios_mail_aut_IN_SABADO: TBooleanField
      FieldName = 'IN_SABADO'
    end
    object qry_relatorios_mail_aut_IN_DOMINGO: TBooleanField
      FieldName = 'IN_DOMINGO'
    end
    object qry_relatorios_mail_aut_IN_GRAVAR_DIGITALIZACAO: TBooleanField
      FieldName = 'IN_GRAVAR_DIGITALIZACAO'
    end
    object qry_relatorios_mail_aut_CD_TP_DOCTO_GRAVAR: TStringField
      FieldName = 'CD_TP_DOCTO_GRAVAR'
      FixedChar = True
      Size = 3
    end
    object qry_relatorios_mail_aut_TX_CORPO_EMAIL: TMemoField
      FieldName = 'TX_CORPO_EMAIL'
      BlobType = ftMemo
    end
  end
  object ds_relatorios_mail_aut: TDataSource
    DataSet = qry_relatorios_mail_aut_
    OnStateChange = ds_relatorios_mail_autStateChange
    Left = 72
    Top = 93
  end
  object qry_relatorios_mail_aut_usuarios_: TQuery
    AfterScroll = qry_relatorios_mail_aut_usuarios_AfterScroll
    OnCalcFields = qry_relatorios_mail_aut_usuarios_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TRELATORIOS_MAIL_AUT_USUARIOS'
      'WHERE CD_RELATORIO = :CD_RELATORIO')
    Left = 80
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    object qry_relatorios_mail_aut_usuarios_CD_RELATORIO: TStringField
      FieldName = 'CD_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT_USUARIOS.CD_RELATORIO'
      FixedChar = True
      Size = 5
    end
    object qry_relatorios_mail_aut_usuarios_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT_USUARIOS.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO: TStringField
      FieldName = 'TX_HORARIOS_ENVIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT_USUARIOS.TX_HORARIOS_ENVIO'
      FixedChar = True
      Size = 200
    end
    object qry_relatorios_mail_aut_usuarios_calc_NM_USUARIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_NM_USUARIO'
      Size = 50
      Calculated = True
    end
  end
  object ds_relatorios_mail_aut_usuarios: TDataSource
    DataSet = qry_relatorios_mail_aut_usuarios_
    OnStateChange = ds_relatorios_mail_autStateChange
    Left = 80
    Top = 264
  end
  object upd_relatorios_mail_aut_: TUpdateSQL
    ModifySQL.Strings = (
      'update TRELATORIOS_MAIL_AUT'
      'set'
      '  CD_RELATORIO = :CD_RELATORIO,'
      '  NM_RELATORIO = :NM_RELATORIO,'
      '  TX_RELATORIO = :TX_RELATORIO,'
      '  TX_MODELO = :TX_MODELO,'
      '  CD_TIPO_RELATORIO = :CD_TIPO_RELATORIO,'
      '  TX_CONFIGURACAO = :TX_CONFIGURACAO,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  IN_FIMDESEMANA = :IN_FIMDESEMANA,'
      '  TP_IDIOMA = :TP_IDIOMA,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE,'
      '  VARIAVEL_CARTAS_CONFIG = :VARIAVEL_CARTAS_CONFIG,'
      '  IN_SABADO = :IN_SABADO,'
      '  IN_DOMINGO = :IN_DOMINGO ,'
      '  IN_GRAVAR_DIGITALIZACAO = :IN_GRAVAR_DIGITALIZACAO ,'
      '  CD_TP_DOCTO_GRAVAR = :CD_TP_DOCTO_GRAVAR,'
      'TX_CORPO_EMAIL = :TX_CORPO_EMAIL'
      'where'
      '  CD_RELATORIO = :OLD_CD_RELATORIO')
    InsertSQL.Strings = (
      'insert into TRELATORIOS_MAIL_AUT'
      
        '  (CD_RELATORIO, NM_RELATORIO, TX_RELATORIO, TX_MODELO, CD_TIPO_' +
        'RELATORIO, '
      
        '   TX_CONFIGURACAO, IN_ATIVO, IN_FIMDESEMANA, TP_IDIOMA, CD_VIA_' +
        'TRANSPORTE, '
      
        '   VARIAVEL_CARTAS_CONFIG, IN_SABADO, IN_DOMINGO, IN_GRAVAR_DIGI' +
        'TALIZACAO, CD_TP_DOCTO_GRAVAR, TX_CORPO_EMAIL)'
      'values'
      
        '  (:CD_RELATORIO, :NM_RELATORIO, :TX_RELATORIO, :TX_MODELO, :CD_' +
        'TIPO_RELATORIO, '
      
        '   :TX_CONFIGURACAO, :IN_ATIVO, :IN_FIMDESEMANA, :TP_IDIOMA, :CD' +
        '_VIA_TRANSPORTE, '
      
        '   :VARIAVEL_CARTAS_CONFIG, :IN_SABADO, :IN_DOMINGO, :IN_GRAVAR_' +
        'DIGITALIZACAO, :CD_TP_DOCTO_GRAVAR, :TX_CORPO_EMAIL)')
    DeleteSQL.Strings = (
      'delete from TRELATORIOS_MAIL_AUT'
      'where'
      '  CD_RELATORIO = :OLD_CD_RELATORIO')
    Left = 209
    Top = 36
  end
end

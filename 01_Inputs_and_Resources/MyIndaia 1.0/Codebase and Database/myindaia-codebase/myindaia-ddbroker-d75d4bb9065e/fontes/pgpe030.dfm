object datm_exp_impr_fatura: Tdatm_exp_impr_fatura
  OldCreateOrder = True
  Left = 319
  Top = 119
  Height = 568
  Width = 798
  object ppDesigner: TppDesigner
    Caption = 'Relat'#243'rios'
    DataSettings.DatabaseName = 'DbBroker'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtMSSQLServer
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000330000000000000000000000033303303303300000000000000
      0003303330333003003300000000000000033003330330002333000000000000
      0030000033003033333000000000000033333330000003330003330000000803
      33333333333333300233330000000F033333333333333302333BB03000004F83
      33333333333333333BB003BB00004FF3333333333333B33BB0033BBB00004FF3
      33333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBBBB0300F04FFF
      33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB0033330FF044FF
      F8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B330003333330FF44444F
      F88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33BB38FF4444444
      FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBBBBFF44444444
      0000000303BBB3300000BFF444444400000000000000000000000FF444440000
      0000000000000000000000444444000000000000000000000000000044440000
      0000000000000000000000000444000000000000000000000000000000040000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007FE000003F0000
      001F0000001F0000000F00000007000000070000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000C0
      00000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFEFFFFFFFF}
    Position = poScreenCenter
    ShowData = False
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    Visible = False
    WindowHeight = 480
    WindowLeft = 0
    WindowTop = 0
    WindowWidth = 640
    WindowState = wsMaximized
    Left = 734
    Top = 355
  end
  object TUnidNeg: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG ( NOLOCK )'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 646
    Top = 411
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object TUnidNegcd_unid_neg: TStringField
      FieldName = 'cd_unid_neg'
      Size = 2
    end
    object TUnidNegnm_unid_neg: TStringField
      FieldName = 'nm_unid_neg'
      Size = 50
    end
  end
  object qry_parametros_: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT TP_NCM, TP_NALADI '
      'FROM TPARAMETROS')
    Left = 331
    Top = 354
    object qry_parametros_TP_NCM: TStringField
      FieldName = 'TP_NCM'
      Origin = 'TPARAMETROS.TP_NCM'
      Size = 1
    end
    object qry_parametros_TP_NALADI: TStringField
      FieldName = 'TP_NALADI'
      Origin = 'TPARAMETROS.TP_NALADI'
      Size = 1
    end
  end
  object TExp: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT CD_EMPRESA AS CODIGO, NM_EMPRESA AS NOME, AP_EMPRESA AS A' +
        'PELIDO_EMPRESA,'
      'CGC_EMPRESA AS CGC_EMPRESA,'
      
        #39'CNPJ:'#39' +SUBSTRING(CGC_EMPRESA,1,2)+'#39'.'#39'+SUBSTRING(CGC_EMPRESA,3,' +
        '3)+'#39'.'#39'+SUBSTRING(CGC_EMPRESA,6,3)+'#39'/'#39'+SUBSTRING(CGC_EMPRESA,9,4)' +
        '+'#39'-'#39'+SUBSTRING(CGC_EMPRESA,13,2) CGC_CLIENTE,'
      '       PATH_LOGO AS  LOGO,'
      '       END_EMPRESA +'
      '       CASE LTRIM( RTRIM( ISNULL( END_NUMERO, "" ) ) )'
      '          WHEN "" THEN "" ELSE ", " END +'
      '       RTRIM( LTRIM( END_NUMERO ) ) AS ENDERECO_NUM,'
      '       LTRIM( RTRIM( END_CIDADE ) ) +'
      '       CASE LTRIM( RTRIM( ISNULL( END_UF, "" ) ) )'
      '          WHEN "" THEN ""'
      '          ELSE "/"'
      '       END +'
      '       RTRIM( LTRIM( END_UF ) ) +'
      '       CASE LTRIM( RTRIM( ISNULL( E.CD_PAIS_IMPORTADOR, "" ) ) )'
      '          WHEN "" THEN ""'
      '          ELSE " - " + LTRIM( RTRIM( P.NM_PAIS ) ) + " - "'
      '       END +'
      '       CASE LTRIM( RTRIM( ISNULL( END_CEP, "" ) ) )'
      
        '          WHEN "" THEN "" ELSE "CEP " + SUBSTRING( END_CEP, 1, 5' +
        ' ) + "-" + SUBSTRING( END_CEP, 6, 3 )'
      '       END AS END_CIDADE_UF_CEP,'
      
        '       END_CIDADE AS END_CIDADE, END_CEP AS END_CEP, END_BAIRRO ' +
        'AS END_BAIRRO, END_UF AS END_ESTADO, NR_TELEFONE, NR_FAX'
      'FROM   TEMPRESA_NAC E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK )'
      'WHERE  E.CD_PAIS_IMPORTADOR *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_EXPORTADOR')
    Left = 451
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EXPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object Dts_Exp: TDataSource
    DataSet = TExp
    Left = 451
    Top = 64
  end
  object TImp: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME,'
      '       LTRIM( RTRIM( ISNULL( E.END_EMPRESA, '#39#39' ) ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, '#39#39' ) ) ) WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39', '#39' END +'
      
        '       LTRIM( RTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM, END_COMPL' +
        ', END_CIDADE, END_ESTADO,'
      
        '       CASE :CD_LINGUA_PEDIDO WHEN '#39'1'#39' THEN '#39'PHONE: '#39'+NR_TELEFON' +
        'E ELSE '#39'TEL: '#39'+NR_TELEFONE END NR_TELEFONE,'
      
        '       '#39'FAX: '#39'+ NR_FAX NR_FAX, '#39'RUC: '#39'+NR_RUC NR_RUC, '#39'NIT: '#39' +N' +
        'R_NIT NR_NIT, '#39'CUIT: '#39'+NR_CUIT NR_CUIT,'
      '       CASE :CD_LINGUA_PEDIDO'
      '          WHEN '#39'0'#39' THEN'
      '                   LTRIM( RTRIM( ISNULL( E.END_COMPL, '#39#39' ) ) ) +'
      
        '                   CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, '#39#39' ) ' +
        ') ) WHEN '#39#39' THEN '#39#39' ELSE '#39' - '#39' END +'
      
        '                   LTRIM( RTRIM( ISNULL( E.END_CIDADE, '#39#39' ) ) ) ' +
        '+'
      
        '                   CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, '#39#39 +
        ' ) ) ) WHEN '#39#39' THEN '#39#39' ELSE '#39' - '#39' END +'
      
        '                   LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, '#39#39' ) ) ' +
        ')'
      '          WHEN '#39'1'#39' THEN'
      '                   LTRIM( RTRIM( ISNULL( E.END_COMPL, '#39#39' ) ) ) +'
      
        '                   CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, '#39#39' ) ' +
        ') ) WHEN '#39#39' THEN '#39#39' ELSE '#39' - '#39' END +'
      
        '                   LTRIM( RTRIM( ISNULL( E.END_CIDADE, '#39#39' ) ) ) ' +
        '+'
      
        '                   CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, '#39#39' ' +
        ') ) ) WHEN '#39#39' THEN '#39#39' ELSE '#39' - '#39' END +'
      '                   LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, '#39#39' ) ) )'
      '          WHEN '#39'2'#39' THEN'
      '                   LTRIM( RTRIM( ISNULL( E.END_COMPL, '#39#39' ) ) ) +'
      
        '                   CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, '#39#39' ) ' +
        ') ) WHEN '#39#39' THEN '#39#39' ELSE '#39' - '#39' END +'
      
        '                   LTRIM( RTRIM( ISNULL( E.END_CIDADE, '#39#39' ) ) ) ' +
        '+'
      
        '                   CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, '#39#39' ' +
        ') ) ) WHEN '#39#39' THEN '#39#39' ELSE '#39' - '#39' END +'
      '                   LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, '#39#39' ) ) )'
      
        '          ELSE     CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, '#39#39 +
        ' ) ) ) WHEN '#39#39' THEN '#39#39' ELSE '#39' - '#39' END +'
      '                   LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, '#39#39' ) ))'
      '       END AS CIDADE_PAIS,'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, '#39#39' ) ) ) WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39'( '#39' END + LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, '#39#39' ' +
        ') ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.NR_CLIENTE, '#39#39' ) ) ) WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39' )'#39' END AS NR_CLIENTE, E.CD_PAIS AS CD_PAIS'
      'FROM   TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK )'
      'WHERE  E.CD_PAIS *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_IMPORTADOR')
    Left = 508
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LINGUA_PEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_LINGUA_PEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_IMPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object Dts_Imp: TDataSource
    AutoEdit = False
    DataSet = TImp
    Left = 508
    Top = 64
  end
  object Tconsig: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME,'
      '       LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) )  WHEN "' +
        '" THEN "" ELSE ", " END +'
      
        '       LTRIM( LTRIM( ISNULL( E.END_NUMERO, "" ) ) ) AS ENDERECO_' +
        'NUM,'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE E.END_COMPL END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE " - " END +'
      
        '       E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT,' +
        ' "" ) ) ) WHEN "" THEN "" ELSE " - " END +'
      
        '       LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) AS CIDADE_' +
        'PAIS, END_COMPL, END_CIDADE, END_ESTADO,'
      
        '       '#39'PHONE: '#39'+NR_TELEFONE NR_TELEFONE, '#39'FAX: '#39'+ NR_FAX NR_FAX' +
        ', '#39'RUC: '#39'+NR_RUC NR_RUC, '#39'NIT: '#39' +NR_NIT NR_NIT, '#39'CUIT: '#39'+NR_CUI' +
        'T NR_CUIT'
      'FROM   TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK )'
      'WHERE  E.CD_PAIS *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_CONSIGNATARIO ')
    Left = 563
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CONSIGNATARIO'
        ParamType = ptUnknown
      end>
    object TconsigCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 5
    end
    object TconsigNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object TconsigENDERECO_NUM: TStringField
      FieldName = 'ENDERECO_NUM'
      FixedChar = True
      Size = 68
    end
    object TconsigCIDADE_PAIS: TStringField
      FieldName = 'CIDADE_PAIS'
      FixedChar = True
      Size = 127
    end
    object TconsigEND_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 41
    end
    object TconsigEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object TconsigEND_ESTADO: TStringField
      FieldName = 'END_ESTADO'
      FixedChar = True
      Size = 30
    end
    object TconsigNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 22
    end
    object TconsigNR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
    end
    object TconsigNR_RUC: TStringField
      FieldName = 'NR_RUC'
      FixedChar = True
      Size = 30
    end
    object TconsigNR_NIT: TStringField
      FieldName = 'NR_NIT'
      FixedChar = True
      Size = 30
    end
    object TconsigNR_CUIT: TStringField
      FieldName = 'NR_CUIT'
      FixedChar = True
      Size = 31
    end
  end
  object Dts_consig: TDataSource
    AutoEdit = False
    DataSet = Tconsig
    Left = 563
    Top = 64
  end
  object ppBDE_Exp: TppBDEPipeline
    DataSource = Dts_Exp
    SkipWhenNoRecords = False
    UserName = 'BDE_Exp'
    Left = 452
    Top = 120
    object ppBDE_ExpppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object ppBDE_ExpppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppBDE_ExpppField3: TppField
      FieldAlias = 'APELIDO_EMPRESA'
      FieldName = 'APELIDO_EMPRESA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppBDE_ExpppField4: TppField
      FieldAlias = 'CGC_EMPRESA'
      FieldName = 'CGC_EMPRESA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 3
    end
    object ppBDE_ExpppField5: TppField
      FieldAlias = 'LOGO'
      FieldName = 'LOGO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppBDE_ExpppField6: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 58
      DisplayWidth = 58
      Position = 5
    end
    object ppBDE_ExpppField7: TppField
      FieldAlias = 'END_CIDADE_UF_CEP'
      FieldName = 'END_CIDADE_UF_CEP'
      FieldLength = 172
      DisplayWidth = 172
      Position = 6
    end
    object ppBDE_ExpppField8: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppBDE_ExpppField9: TppField
      FieldAlias = 'END_CEP'
      FieldName = 'END_CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppBDE_ExpppField10: TppField
      FieldAlias = 'END_BAIRRO'
      FieldName = 'END_BAIRRO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppBDE_ExpppField11: TppField
      FieldAlias = 'END_ESTADO'
      FieldName = 'END_ESTADO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object ppBDE_ExpppField12: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object ppBDE_ExpppField13: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 15
      DisplayWidth = 15
      Position = 12
    end
  end
  object Temb: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT NM_EMBALAGEM_S'
      'FROM   TEMBALAGEM ( NOLOCK )'
      'WHERE  CD_EMBALAGEM = :CD_EMBALAGEM')
    Left = 108
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBALAGEM'
        ParamType = ptUnknown
      end>
  end
  object Dts_Emb: TDataSource
    DataSet = Temb
    Left = 108
    Top = 240
  end
  object ppBDE_Emb: TppBDEPipeline
    DataSource = Dts_Emb
    SkipWhenNoRecords = False
    UserName = 'BDE_Emb'
    Left = 108
    Top = 296
  end
  object TViaTr: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CD_VIA_TRANSP,'
      '       CASE E.CD_LINGUA_PEDIDO'
      '         WHEN "0" THEN ISNULL( V.NM_VIA_TRANSP, "" )'
      '         WHEN "1" THEN ISNULL( V.NM_VIA_TRANSP_INGLES, "" )'
      '         WHEN "2" THEN ISNULL( V.NM_VIA_TRANSP_ESP, "" )'
      '       END AS NM_VIA_TRANSPORTE'
      
        'FROM   TVIA_TRANSP_BROKER V ( NOLOCK ), TPROCESSO_EXP E ( NOLOCK' +
        ' )'
      'WHERE  E.CD_VIA_TRANSPORTE = V.CD_VIA_TRANSP AND'
      '       V.CD_VIA_TRANSP = :CD_VIA_TRANSPORTE AND'
      '       E.NR_PROCESSO = :NR_PROCESSO')
    Left = 276
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_VIA_TRANSPORTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object Dts_ViaTr: TDataSource
    DataSet = TViaTr
    Left = 276
    Top = 240
  end
  object ppBDE_ViaTr: TppBDEPipeline
    DataSource = Dts_ViaTr
    SkipWhenNoRecords = False
    UserName = 'BDE_ViaTr'
    Left = 276
    Top = 296
    object ppBDE_ViaTrppField1: TppField
      FieldAlias = 'CD_VIA_TRANSP'
      FieldName = 'CD_VIA_TRANSP'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppBDE_ViaTrppField2: TppField
      FieldAlias = 'NM_VIA_TRANSPORTE'
      FieldName = 'NM_VIA_TRANSPORTE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
  end
  object TLocal1: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT DESCRICAO'
      'FROM   TLOCAL_EMBARQUE ( NOLOCK )'
      'WHERE  CODIGO = :CD_LOCAL_DESTINO')
    Left = 332
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LOCAL_DESTINO'
        ParamType = ptUnknown
      end>
  end
  object Dts_Local1: TDataSource
    DataSet = TLocal1
    Left = 330
    Top = 240
  end
  object ppBDE_Local1: TppBDEPipeline
    DataSource = Dts_Local1
    SkipWhenNoRecords = False
    UserName = 'BDE_Local1'
    Left = 330
    Top = 296
    object ppBDE_Local1ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
  end
  object TLocal2: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT DESCRICAO'
      'FROM   TLOCAL_EMBARQUE ( NOLOCK )'
      'WHERE  CODIGO = :CD_LOCAL_ORIGEM'
      '')
    Left = 386
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LOCAL_ORIGEM'
        ParamType = ptUnknown
      end>
  end
  object Dts_Local2: TDataSource
    DataSet = TLocal2
    Left = 386
    Top = 240
  end
  object ppBDE_Local2: TppBDEPipeline
    DataSource = Dts_Local2
    SkipWhenNoRecords = False
    UserName = 'BDE_Local2'
    Left = 386
    Top = 296
    object ppBDE_Local2ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
  end
  object TPais1: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CASE :CD_LINGUA_PEDIDO'
      '         WHEN '#39'1'#39' THEN NM_PAIS_ING'
      '         WHEN '#39'2'#39' THEN NM_PAIS_ESP'
      '         ELSE NM_PAIS_PORT'
      '       END AS DESCRICAO, IN_NCM_FATURA, IN_NALADI_FATURA'
      'FROM   TPAIS_BROKER ( NOLOCK )'
      'WHERE  CD_PAIS = :CD_PAIS_DESTINO'
      '')
    Left = 499
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LINGUA_PEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS_DESTINO'
        ParamType = ptUnknown
      end>
  end
  object Dts_Pais1: TDataSource
    DataSet = TPais1
    Left = 498
    Top = 240
  end
  object ppBDE_Pais1: TppBDEPipeline
    DataSource = Dts_Pais1
    SkipWhenNoRecords = False
    UserName = 'BDE_Pais1'
    Left = 498
    Top = 296
    object ppBDE_Pais1ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppBDE_Pais1ppField2: TppField
      FieldAlias = 'IN_NCM_FATURA'
      FieldName = 'IN_NCM_FATURA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object ppBDE_Pais1ppField3: TppField
      FieldAlias = 'IN_NALADI_FATURA'
      FieldName = 'IN_NALADI_FATURA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
  end
  object TPais2: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CASE :CD_LINGUA_PEDIDO'
      '         WHEN '#39'1'#39' THEN NM_PAIS_ING'
      '         WHEN '#39'2'#39' THEN NM_PAIS_ESP'
      '         ELSE NM_PAIS_PORT'
      '       END AS DESCRICAO'
      'FROM   TPAIS_BROKER ( NOLOCK )'
      'WHERE  CD_PAIS = :CD_PAIS_ORIGEM')
    Left = 557
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LINGUA_PEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS_ORIGEM'
        ParamType = ptUnknown
      end>
  end
  object Dts_Pais2: TDataSource
    DataSet = TPais2
    Left = 557
    Top = 240
  end
  object ppBDE_Pais2: TppBDEPipeline
    DataSource = Dts_Pais2
    SkipWhenNoRecords = False
    UserName = 'BDE_Pais2'
    Left = 557
    Top = 296
    object ppBDE_Pais2ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
  end
  object TProc: TQuery
    OnCalcFields = TProcCalcFields
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.NR_PROCESSO AS NR_PROCESSO, P.NR_PEDIDO, E.NR_FATURA, E' +
        '.CD_CARTA_CREDITO, E.VL_PESO_LIQUIDO, E.VL_PESO_BRUTO, E.VL_TOT_' +
        'CUBAGEM,'
      
        '       E.VL_TOT_EXW, E.VL_TOT_FOB, E.VL_FRETE, isnull(E.VL_INLAN' +
        'D_FREIGHT,0) VL_INLAND_FREIGHT , E.VL_SEGURO, E.VL_TOT_MCV, E.TX' +
        '_INF_EMBALAGEM, E.TX_MARCACAO_VOLUME, E.TX_DECL_EXPORTADOR,'
      
        '       E.CD_EXPORTADOR, E.CD_IMPORTADOR, E.CD_LOCAL_DESTINO, E.C' +
        'D_LOCAL_ORIGEM, E.CD_VIA_TRANSPORTE, E.CD_TERMO_PAGTO, E.TP_CONS' +
        'IGNATARIO, E.CD_LINGUA_PEDIDO,'
      
        '       E.CD_CONSIGNATARIO, E.TP_NOTIFY1, E.CD_NOTIFY1, E.TP_NOTI' +
        'FY2, E.CD_NOTIFY2, E.TP_DOCUMENTO, E.CD_DOCUMENTO, E.TP_COPIA, E' +
        '.CD_COPIA, E.CD_MOEDA, D.TP_POS_AD,'
      '       E.CD_LOCAL_DESPACHO, E.CD_INCOTERM,'
      '       CASE E.CD_INCOTERM WHEN "EXW" THEN "TOTAL EXW" ELSE'
      
        '       CASE WHEN E.CD_VIA_TRANSPORTE IN ("04","07") THEN "TOTAL ' +
        'FCA"'
      '       ELSE "TOTAL FOB" END END AS TOTAL, E.TX_DECL_ADICIONAL,'
      
        '       E.CD_PAIS_ORIG AS CD_PAIS_ORIGEM, E.CD_PAIS_DESTINO AS CD' +
        '_PAIS_DESTINO, E.CD_TIPO_FRETE,'
      
        '       CASE E.CD_LINGUA_PEDIDO WHEN '#39'0'#39' THEN IsNull(T.TX_TERMO_P' +
        'ORT,"") WHEN '#39'1'#39' THEN IsNull(T.TX_TERMO_INGLES,"") WHEN '#39'2'#39' THEN' +
        ' IsNull(T.TX_TERMO_ESP,"")'
      '       END AS NM_TERMO_PAGTO,'
      '       CASE E.CD_LINGUA_PEDIDO'
      
        '          WHEN '#39'0'#39' THEN RIGHT( '#39'0'#39' + CONVERT( varchar(2), DATEPA' +
        'RT( dd, E.DT_FATURA ) ), 2 ) + '#39' de '#39' + '
      '              CASE DATEPART( m, E.DT_FATURA )'
      '                 WHEN 1 THEN '#39'Janeiro'#39
      '                 WHEN 2 THEN '#39'Fevereiro'#39
      '                 WHEN 3 THEN '#39'Mar'#231'o'#39
      '                 WHEN 4 THEN '#39'Abril'#39
      '                 WHEN 5 THEN '#39'Maio'#39
      '                 WHEN 6 THEN '#39'Junho'#39
      '                 WHEN 7 THEN '#39'Julho'#39
      '                 WHEN 8 THEN '#39'Agosto'#39
      '                 WHEN 9 THEN '#39'Setembro'#39
      '                 WHEN 10 THEN '#39'Outubro'#39
      '                 WHEN 11 THEN '#39'Novembro'#39
      '                 WHEN 12 THEN '#39'Dezembro'#39
      
        '              END + '#39' de '#39' + CONVERT(char(4), DATEPART( yyyy, E.' +
        'DT_FATURA ) )'
      '          WHEN '#39'1'#39' THEN '
      '              CASE DATEPART( m, E.DT_FATURA )'
      '                 WHEN 1 THEN '#39'January'#39
      '                 WHEN 2 THEN '#39'February'#39
      '                 WHEN 3 THEN '#39'March'#39
      '                 WHEN 4 THEN '#39'April'#39
      '                 WHEN 5 THEN '#39'May'#39
      '                 WHEN 6 THEN '#39'June'#39
      '                 WHEN 7 THEN '#39'July'#39
      '                 WHEN 8 THEN '#39'August'#39
      '                 WHEN 9 THEN '#39'September'#39
      '                 WHEN 10 THEN '#39'October'#39
      '                 WHEN 11 THEN '#39'November'#39
      '                 WHEN 12 THEN '#39'December'#39
      
        '              END + '#39' '#39' + RIGHT( '#39'0'#39' + CONVERT( varchar(2), DATE' +
        'PART( dd, E.DT_FATURA ) ), 2 ) + '
      
        '              CASE RIGHT( CONVERT( varchar(2), DATEPART( d, E.DT' +
        '_FATURA ) ), 1 )'
      '                 WHEN '#39'1'#39' THEN '#39'st'#39
      '                 WHEN '#39'2'#39' THEN '#39'nd'#39
      '                 ELSE '#39'th'#39
      
        '              END + '#39', '#39' + CONVERT(char(4), DATEPART( yyyy, E.DT' +
        '_FATURA ) )'
      
        '          WHEN '#39'2'#39' THEN RIGHT( '#39'0'#39' + CONVERT( varchar(2), DATEPA' +
        'RT( dd, E.DT_FATURA ) ), 2 ) + '#39' de '#39' + '
      '              CASE DATEPART( m, E.DT_FATURA )'
      '                 WHEN 1 THEN '#39'Enero'#39
      '                 WHEN 2 THEN '#39'Febrero'#39
      '                 WHEN 3 THEN '#39'Marzo'#39
      '                 WHEN 4 THEN '#39'Abril'#39
      '                 WHEN 5 THEN '#39'Mayo'#39
      '                 WHEN 6 THEN '#39'Junio'#39
      '                 WHEN 7 THEN '#39'Julio'#39
      '                 WHEN 8 THEN '#39'Agosto'#39
      '                 WHEN 9 THEN '#39'Septiembre'#39
      '                 WHEN 10 THEN '#39'Octubre'#39
      '                 WHEN 11 THEN '#39'Noviembre'#39
      '                 WHEN 12 THEN '#39'Diciembre'#39
      
        '              END  + '#39' de '#39' + CONVERT(char(4), DATEPART( yyyy, E' +
        '.DT_FATURA ) )'
      
        '       END AS DATA_FATURA, E.VL_ACRESCIMO, E.VL_DESCONTO, IN_REF' +
        'ERENCIA_FAT_INST, CD_INST_NEGOC,'
      '        Upper( CASE substring(E.CD_INCOTERM,1,1)'
      
        '           when '#39'E'#39' THEN (SELECT END_CIDADE FROM TEMPRESA_NAC WH' +
        'ERE CD_EMPRESA= E.CD_EXPORTADOR )'
      
        '           WHEN '#39'F'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_ORIGEM)'
      
        '           WHEN '#39'C'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_DESTINO)'
      
        '           WHEN '#39'D'#39' THEN (SELECT EE1.END_CIDADE FROM TEMPRESA_ES' +
        'T EE1 (NOLOCK) WHERE EE1.CD_EMPRESA *= E.CD_IMPORTADOR)'
      '         END) AS LOCAL_TOTAL       '
      
        'FROM   TPROCESSO_EXP E  ( NOLOCK ), TTERMO_PAGTO T ( NOLOCK ), T' +
        'PROCESSO_EXP_PEDIDO P ( NOLOCK ), TTP_POS_AD D ( NOLOCK )'
      'WHERE  E.CD_TERMO_PAGTO *= T.CD_TERMO_PAGTO AND'
      '       E.NR_PROCESSO *= P.NR_PROCESSO AND'
      '       E.NR_PROCESSO = :NR_PROCESSO')
    Left = 98
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Value = '0102ER-2217-02'
      end>
    object TProcNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object TProcNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Size = 15
    end
    object TProcNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Size = 15
    end
    object TProcCD_CARTA_CREDITO: TStringField
      FieldName = 'CD_CARTA_CREDITO'
      Size = 15
    end
    object TProcVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object TProcVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object TProcVL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
    end
    object TProcVL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
    end
    object TProcVL_TOT_FOB: TFloatField
      FieldName = 'VL_TOT_FOB'
    end
    object TProcVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object TProcVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object TProcVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
    end
    object TProcTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object TProcTX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object TProcTX_DECL_EXPORTADOR: TMemoField
      FieldName = 'TX_DECL_EXPORTADOR'
      BlobType = ftMemo
    end
    object TProcCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object TProcCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object TProcCD_LOCAL_DESTINO: TStringField
      FieldName = 'CD_LOCAL_DESTINO'
      Size = 4
    end
    object TProcCD_LOCAL_ORIGEM: TStringField
      FieldName = 'CD_LOCAL_ORIGEM'
      Size = 4
    end
    object TProcCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
    object TProcCD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Size = 6
    end
    object TProcTP_CONSIGNATARIO: TStringField
      FieldName = 'TP_CONSIGNATARIO'
      Size = 1
    end
    object TProcCD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Size = 1
    end
    object TProcCD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Size = 5
    end
    object TProcTP_NOTIFY1: TStringField
      FieldName = 'TP_NOTIFY1'
      Size = 1
    end
    object TProcCD_NOTIFY1: TStringField
      FieldName = 'CD_NOTIFY1'
      Size = 5
    end
    object TProcTP_NOTIFY2: TStringField
      FieldName = 'TP_NOTIFY2'
      Size = 1
    end
    object TProcCD_NOTIFY2: TStringField
      FieldName = 'CD_NOTIFY2'
      Size = 5
    end
    object TProcTP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      Size = 1
    end
    object TProcCD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Size = 5
    end
    object TProcTP_COPIA: TStringField
      FieldName = 'TP_COPIA'
      Size = 1
    end
    object TProcCD_COPIA: TStringField
      FieldName = 'CD_COPIA'
      Size = 5
    end
    object TProcCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Size = 3
    end
    object TProcCD_LOCAL_DESPACHO: TStringField
      FieldName = 'CD_LOCAL_DESPACHO'
      Size = 4
    end
    object TProcCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Size = 3
    end
    object TProcTOTAL: TStringField
      FieldName = 'TOTAL'
      Size = 9
    end
    object TProcTX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object TProcCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object TProcCD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Size = 3
    end
    object TProcCD_TIPO_FRETE: TStringField
      FieldName = 'CD_TIPO_FRETE'
      Size = 1
    end
    object TProcNM_TERMO_PAGTO: TMemoField
      FieldName = 'NM_TERMO_PAGTO'
      BlobType = ftMemo
    end
    object TProcDATA_FATURA: TStringField
      FieldName = 'DATA_FATURA'
      Size = 24
    end
    object TProcIN_REFERENCIA_FAT_INST: TStringField
      FieldName = 'IN_REFERENCIA_FAT_INST'
      Size = 1
    end
    object TProcVL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
    end
    object TProcVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object TProcCD_INST_NEGOC: TStringField
      FieldName = 'CD_INST_NEGOC'
      Size = 5
    end
    object TProcTP_POS_AD: TStringField
      FieldName = 'TP_POS_AD'
      Size = 1
    end
    object TProccalcDeclaracao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDeclaracao'
      Size = 1000
      Calculated = True
    end
    object TProcVL_INLAND_FREIGHT: TFloatField
      FieldName = 'VL_INLAND_FREIGHT'
    end
    object TProcLOCAL_TOTAL: TStringField
      FieldName = 'LOCAL_TOTAL'
      FixedChar = True
      Size = 50
    end
  end
  object Dts_Proc: TDataSource
    DataSet = TProc
    Left = 98
    Top = 64
  end
  object TProcI: TQuery
    OnCalcFields = TProcICalcFields
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT I.NR_ITEM, I.CD_UNID_MEDIDA AS CD_UNID_MEDIDA, U.NM_SIGLA' +
        ' AS NM_SIGLA,'
      
        '       I.CD_MERCADORIA AS CD_MERCADORIA, I.QT_MERCADORIA AS QT_M' +
        'ERCADORIA,'
      '       I.VL_TOT_PESO_LIQ AS VL_TOT_PESO_LIQ,'
      '       I.VL_TOT_PESO_BRUTO AS VL_TOT_PESO_BRUTO,'
      
        '       I.VL_UNITARIO AS VL_UNITARIO, I.VL_TOT_ITEM AS VL_TOT_ITE' +
        'M,'
      
        '       I.TX_MERCADORIA AS NM_MERCADORIA, E.NM_EMBALAGEM_S AS NM_' +
        'EMBALAGEM,'
      '       CASE EX.CD_LINGUA_PEDIDO'
      
        '         WHEN "1" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_INGLE' +
        'S ) )'
      
        '         WHEN "2" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_ESPAN' +
        'HOL ) )'
      '         ELSE LTRIM( RTRIM( EM.NM_DESCR_DETALHADA ) )'
      '       END AS NM_EMB_SUP,'
      '       CASE EX.CD_LINGUA_PEDIDO'
      
        '         WHEN "1" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_INGLE' +
        'S ) )'
      
        '         WHEN "2" THEN LTRIM( RTRIM( EM.NM_DESCR_DETALHADA_ESPAN' +
        'HOL ) )'
      '         ELSE LTRIM( RTRIM( EM.NM_DESCR_DETALHADA ) )'
      
        '       END + " " + ISNULL( CD_CLASSIF_EMBALAGEM_SUP, '#39#39' ) AS NM_' +
        'GRUPO_EMB,'
      
        '       I.QT_EMBALAGEM_SUP AS QT_EMB_SUP, E.NM_DESCR_DETALHADA AS' +
        ' NM_DESCR_DETALHADA,'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) WHEN' +
        ' "" THEN "" ELSE CASE EX.CD_LINGUA_PEDIDO WHEN "1" THEN "S: " EL' +
        'SE "R: " END END +'
      
        '       LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) + CASE LT' +
        'RIM( RTRIM( ISNULL( I.NR_PEDIDO, "" ) ) ) WHEN "" THEN "" ELSE "' +
        ' - " END + LTRIM( RTRIM( I.NR_PEDIDO ) ) +'
      
        '       CASE EX.CD_LINGUA_PEDIDO WHEN "1" THEN CASE LTRIM( RTRIM(' +
        ' ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "" THEN "" ELSE " FROM: " ' +
        '+ LTRIM( RTRIM( P.NM_PAIS_ING ) ) END'
      
        '       WHEN "2" THEN CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ESP, "' +
        '" ) ) ) WHEN "" THEN "" ELSE " ORIGEN: " + LTRIM( RTRIM( P.NM_PA' +
        'IS_ESP ) ) END'
      
        '       ELSE CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT, "" ) ) ) ' +
        'WHEN "" THEN "" ELSE " ORIGEM: " + LTRIM( RTRIM( P.NM_PAIS_PORT ' +
        ') ) END END AS NR_OC_REF_ORIGEM,'
      
        '       I.VL_CUBAGEM AS VL_CUBAGEM, M.CD_MATERIAL AS CD_MATERIAL,' +
        ' M.NR_LINHA AS NR_LINHA,'
      
        '       CASE LTRIM( RTRIM( ISNULL( M.CD_COR, "" ) ) ) WHEN "" THE' +
        'N "" ELSE "COLOR: " END + LTRIM( RTRIM( M.CD_COR ) ) AS CD_COR,'
      '       N.TX_NCM_FATURA AS DESCR_NCM,'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_SH, "" ) ) ) WHEN ' +
        '"" THEN "" ELSE "NALADI: " + I.CD_NALADI_SH END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_SH, "" ) ) ) WHEN ' +
        '"" THEN "" ELSE " - " + NA.DESCRICAO END AS DESCR_NALADI,'
      
        '       I.VL_FRETE, I.VL_SEGURO, I.VL_ACRESCIMO, I.VL_DESCONTO, I' +
        '.NR_PROCESSO'
      
        'FROM   TPROCESSO_EXP_ITEM I ( NOLOCK ), TPROCESSO_EXP EX ( NOLOC' +
        'K ), TMERCADORIA_EXP M ( NOLOCK ),'
      
        '       TEMBALAGEM E ( NOLOCK ), TEMBALAGEM EM ( NOLOCK ), TPAIS_' +
        'BROKER P ( NOLOCK ),'
      
        '       TUNID_MEDIDA_BROKER U ( NOLOCK ), TNCM_EXP N ( NOLOCK ), ' +
        'TNALADISH_EXP NA ( NOLOCK )'
      'WHERE  I.NR_PROCESSO = EX.NR_PROCESSO AND'
      '       I.CD_MERCADORIA *= M.CD_MERCADORIA AND'
      '       I.CD_EMBALAGEM *= E.CD_EMBALAGEM AND'
      '       I.CD_EMBALAGEM_SUP *= EM.CD_EMBALAGEM AND'
      '       I.CD_PAIS_ORIGEM *= P.CD_PAIS AND'
      '       I.CD_UNID_MEDIDA *= U.CD_UNID_MEDIDA AND'
      '       I.CD_NCM_DOC *= N.CODIGO AND'
      '       I.CD_NALADI_DOC *= NA.CODIGO AND'
      '       I.NR_PROCESSO = :NR_PROCESSO')
    Left = 276
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Value = '0102ER-2217-02'
      end>
    object TProcIVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object TProcIVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object TProcIVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object TProcIVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object TProcIQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object TProcICD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Size = 3
    end
    object TProcINM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Size = 3
    end
    object TProcICD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Size = 40
    end
    object TProcIVL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      DisplayFormat = '#,0.000;-#,0.000'
    end
    object TProcINM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      BlobType = ftMemo
    end
    object TProcIQT_EMB_SUP: TFloatField
      FieldName = 'QT_EMB_SUP'
    end
    object TProcIVL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
    end
    object TProcINR_LINHA: TStringField
      FieldName = 'NR_LINHA'
      Size = 10
    end
    object TProcINM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      Size = 50
    end
    object TProcINM_EMB_SUP: TStringField
      FieldName = 'NM_EMB_SUP'
      Size = 50
    end
    object TProcINM_DESCR_DETALHADA: TStringField
      FieldName = 'NM_DESCR_DETALHADA'
      Size = 50
    end
    object TProcIVL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
    end
    object TProcIVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object TProcIVL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
    end
    object TProcIDESCR_NCM: TMemoField
      FieldName = 'DESCR_NCM'
      BlobType = ftMemo
    end
    object TProcINR_OC_REF_ORIGEM: TStringField
      FieldName = 'NR_OC_REF_ORIGEM'
      Size = 98
    end
    object TProcICD_COR: TStringField
      FieldName = 'CD_COR'
      Size = 17
    end
    object TProcINR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object TProcIDESCR_NALADI: TStringField
      FieldName = 'DESCR_NALADI'
      Size = 219
    end
    object TProcINM_GRUPO_EMB: TStringField
      FieldName = 'NM_GRUPO_EMB'
      Size = 81
    end
    object TProcICD_MATERIAL: TStringField
      FieldName = 'CD_MATERIAL'
      Size = 15
    end
    object TProcICalcVlUnitario: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlUnitario'
      Calculated = True
    end
    object TProcICalcVlItem: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlItem'
      Calculated = True
    end
    object TProcICalcDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcDescricao'
      Size = 5000
      Calculated = True
    end
    object TProcICalcEmbSup: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcEmbSup'
      Size = 60
      Calculated = True
    end
    object TProcINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
  end
  object Dts_ProcI: TDataSource
    AutoEdit = False
    DataSet = TProcI
    Left = 276
    Top = 64
  end
  object TNotf1: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE ", " END +'
      '       LTRIM( RTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM,'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE E.END_COMPL END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE " - " END +'
      
        '       E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT,' +
        ' "" ) ) ) WHEN "" THEN "" ELSE " - " END +'
      '       LTRIM( RTRIM( P.NM_PAIS_PORT ) ) AS CIDADE_PAIS'
      'FROM   TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK )'
      'WHERE  E.CD_PAIS *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_NOTIFY1')
    Left = 611
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NOTIFY1'
        ParamType = ptUnknown
      end>
  end
  object Dts_Notf1: TDataSource
    DataSet = TNotf1
    Left = 611
    Top = 64
  end
  object TProcEmb: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CD_EMBALAGEM'
      'FROM   TPROCESSO_EMBALAGEM ( NOLOCK )'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 215
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object TProcEmbCD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TPROCESSO_EMBALAGEM.CD_EMBALAGEM'
      Size = 2
    end
  end
  object Dts_ProcEmb: TDataSource
    DataSet = TProcEmb
    Left = 215
    Top = 64
  end
  object ppBDE_Proc: TppBDEPipeline
    DataSource = Dts_Proc
    SkipWhenNoRecords = False
    UserName = 'BDE_Proc'
    Left = 98
    Top = 120
    object ppBDE_ProcppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_ProcppField2: TppField
      FieldAlias = 'NR_PEDIDO'
      FieldName = 'NR_PEDIDO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppBDE_ProcppField3: TppField
      FieldAlias = 'NR_FATURA'
      FieldName = 'NR_FATURA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppBDE_ProcppField4: TppField
      FieldAlias = 'CD_CARTA_CREDITO'
      FieldName = 'CD_CARTA_CREDITO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppBDE_ProcppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQUIDO'
      FieldName = 'VL_PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDE_ProcppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO'
      FieldName = 'VL_PESO_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBDE_ProcppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_CUBAGEM'
      FieldName = 'VL_TOT_CUBAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBDE_ProcppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_EXW'
      FieldName = 'VL_TOT_EXW'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBDE_ProcppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_FOB'
      FieldName = 'VL_TOT_FOB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBDE_ProcppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_FRETE'
      FieldName = 'VL_FRETE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBDE_ProcppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_SEGURO'
      FieldName = 'VL_SEGURO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBDE_ProcppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_MCV'
      FieldName = 'VL_TOT_MCV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppBDE_ProcppField13: TppField
      FieldAlias = 'TX_INF_EMBALAGEM'
      FieldName = 'TX_INF_EMBALAGEM'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField14: TppField
      FieldAlias = 'TX_MARCACAO_VOLUME'
      FieldName = 'TX_MARCACAO_VOLUME'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField15: TppField
      FieldAlias = 'TX_DECL_EXPORTADOR'
      FieldName = 'TX_DECL_EXPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField16: TppField
      FieldAlias = 'CD_EXPORTADOR'
      FieldName = 'CD_EXPORTADOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 15
    end
    object ppBDE_ProcppField17: TppField
      FieldAlias = 'CD_IMPORTADOR'
      FieldName = 'CD_IMPORTADOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 16
    end
    object ppBDE_ProcppField18: TppField
      FieldAlias = 'CD_LOCAL_DESTINO'
      FieldName = 'CD_LOCAL_DESTINO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 17
    end
    object ppBDE_ProcppField19: TppField
      FieldAlias = 'CD_LOCAL_ORIGEM'
      FieldName = 'CD_LOCAL_ORIGEM'
      FieldLength = 4
      DisplayWidth = 4
      Position = 18
    end
    object ppBDE_ProcppField20: TppField
      FieldAlias = 'CD_VIA_TRANSPORTE'
      FieldName = 'CD_VIA_TRANSPORTE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 19
    end
    object ppBDE_ProcppField21: TppField
      FieldAlias = 'CD_TERMO_PAGTO'
      FieldName = 'CD_TERMO_PAGTO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 20
    end
    object ppBDE_ProcppField22: TppField
      FieldAlias = 'TP_CONSIGNATARIO'
      FieldName = 'TP_CONSIGNATARIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object ppBDE_ProcppField23: TppField
      FieldAlias = 'CD_LINGUA_PEDIDO'
      FieldName = 'CD_LINGUA_PEDIDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object ppBDE_ProcppField24: TppField
      FieldAlias = 'CD_CONSIGNATARIO'
      FieldName = 'CD_CONSIGNATARIO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 23
    end
    object ppBDE_ProcppField25: TppField
      FieldAlias = 'TP_NOTIFY1'
      FieldName = 'TP_NOTIFY1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppBDE_ProcppField26: TppField
      FieldAlias = 'CD_NOTIFY1'
      FieldName = 'CD_NOTIFY1'
      FieldLength = 5
      DisplayWidth = 5
      Position = 25
    end
    object ppBDE_ProcppField27: TppField
      FieldAlias = 'TP_NOTIFY2'
      FieldName = 'TP_NOTIFY2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 26
    end
    object ppBDE_ProcppField28: TppField
      FieldAlias = 'CD_NOTIFY2'
      FieldName = 'CD_NOTIFY2'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppBDE_ProcppField29: TppField
      FieldAlias = 'TP_DOCUMENTO'
      FieldName = 'TP_DOCUMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object ppBDE_ProcppField30: TppField
      FieldAlias = 'CD_DOCUMENTO'
      FieldName = 'CD_DOCUMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 29
    end
    object ppBDE_ProcppField31: TppField
      FieldAlias = 'TP_COPIA'
      FieldName = 'TP_COPIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object ppBDE_ProcppField32: TppField
      FieldAlias = 'CD_COPIA'
      FieldName = 'CD_COPIA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 31
    end
    object ppBDE_ProcppField33: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 32
    end
    object ppBDE_ProcppField34: TppField
      FieldAlias = 'CD_LOCAL_DESPACHO'
      FieldName = 'CD_LOCAL_DESPACHO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 33
    end
    object ppBDE_ProcppField35: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 34
    end
    object ppBDE_ProcppField36: TppField
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 9
      DisplayWidth = 9
      Position = 35
    end
    object ppBDE_ProcppField37: TppField
      FieldAlias = 'TX_DECL_ADICIONAL'
      FieldName = 'TX_DECL_ADICIONAL'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField38: TppField
      FieldAlias = 'CD_PAIS_ORIGEM'
      FieldName = 'CD_PAIS_ORIGEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 37
    end
    object ppBDE_ProcppField39: TppField
      FieldAlias = 'CD_PAIS_DESTINO'
      FieldName = 'CD_PAIS_DESTINO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 38
    end
    object ppBDE_ProcppField40: TppField
      FieldAlias = 'CD_TIPO_FRETE'
      FieldName = 'CD_TIPO_FRETE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object ppBDE_ProcppField41: TppField
      FieldAlias = 'NM_TERMO_PAGTO'
      FieldName = 'NM_TERMO_PAGTO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField42: TppField
      FieldAlias = 'DATA_FATURA'
      FieldName = 'DATA_FATURA'
      FieldLength = 24
      DisplayWidth = 24
      Position = 41
    end
    object ppBDE_ProcppField43: TppField
      FieldAlias = 'IN_REFERENCIA_FAT_INST'
      FieldName = 'IN_REFERENCIA_FAT_INST'
      FieldLength = 1
      DisplayWidth = 1
      Position = 42
    end
    object ppBDE_ProcppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_ACRESCIMO'
      FieldName = 'VL_ACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object ppBDE_ProcppField46: TppField
      FieldAlias = 'CD_INST_NEGOC'
      FieldName = 'CD_INST_NEGOC'
      FieldLength = 5
      DisplayWidth = 5
      Position = 44
    end
    object ppBDE_ProcppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_DESCONTO'
      FieldName = 'VL_DESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppBDE_ProcppField47: TppField
      FieldAlias = 'TP_POS_AD'
      FieldName = 'TP_POS_AD'
      FieldLength = 1
      DisplayWidth = 1
      Position = 46
    end
    object ppBDE_ProcppField48: TppField
      FieldAlias = 'calcDeclaracao'
      FieldName = 'calcDeclaracao'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 47
    end
    object ppBDE_ProcppField49: TppField
      FieldAlias = 'VL_INLAND_FREIGHT'
      FieldName = 'VL_INLAND_FREIGHT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 48
    end
    object ppBDE_ProcppField50: TppField
      FieldAlias = 'LOCAL_TOTAL'
      FieldName = 'LOCAL_TOTAL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 49
    end
  end
  object ppBDE_ProcEmb: TppBDEPipeline
    DataSource = Dts_ProcEmb
    SkipWhenNoRecords = False
    UserName = 'BDE_ProcEmb'
    Left = 215
    Top = 120
    object ppBDE_ProcEmbppField1: TppField
      FieldAlias = 'CD_EMBALAGEM'
      FieldName = 'CD_EMBALAGEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
  end
  object ppBDE_ProcI: TppBDEPipeline
    DataSource = Dts_ProcI
    SkipWhenNoRecords = False
    UserName = 'BDE_ProcI'
    Left = 276
    Top = 120
    MasterDataPipelineName = 'ppBDE_Proc'
  end
  object ppBDE_Notf1: TppBDEPipeline
    DataSource = Dts_Notf1
    SkipWhenNoRecords = False
    UserName = 'BDE_Notf1'
    Left = 611
    Top = 120
    object ppBDE_Notf1ppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_Notf1ppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDE_Notf1ppField3: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 68
      DisplayWidth = 68
      Position = 2
    end
    object ppBDE_Notf1ppField4: TppField
      FieldAlias = 'CIDADE_PAIS'
      FieldName = 'CIDADE_PAIS'
      FieldLength = 127
      DisplayWidth = 127
      Position = 3
    end
  end
  object Tnotf2: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE ", " END +'
      '       LTRIM( RTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM,'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE E.END_COMPL END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE " - " END +'
      
        '       E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT,' +
        ' "" ) ) ) WHEN "" THEN "" ELSE " - " END +'
      '       LTRIM( RTRIM( P.NM_PAIS_PORT ) ) AS CIDADE_PAIS'
      'FROM   TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK )'
      'WHERE  E.CD_PAIS *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_NOTIFY2')
    Left = 667
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NOTIFY2'
        ParamType = ptUnknown
      end>
  end
  object Dts_Notf2: TDataSource
    DataSet = Tnotf2
    Left = 667
    Top = 64
  end
  object ppBDE_Notf2: TppBDEPipeline
    DataSource = Dts_Notf2
    SkipWhenNoRecords = False
    UserName = 'BDE_Notf2'
    Left = 667
    Top = 120
    object ppBDE_Notf2ppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object ppBDE_Notf2ppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDE_Notf2ppField3: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 68
      DisplayWidth = 68
      Position = 2
    end
    object ppBDE_Notf2ppField4: TppField
      FieldAlias = 'CIDADE_PAIS'
      FieldName = 'CIDADE_PAIS'
      FieldLength = 127
      DisplayWidth = 127
      Position = 3
    end
  end
  object TProcesso: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT P.CD_CLIENTE, P.CD_PRODUTO, U.CD_UNID_NEG, NR_PROCESSO, L' +
        'TRIM( RTRIM( NM_SIGLA ) ) + '#39'-'#39' + SUBSTRING( NR_PROCESSO, 5, 14 ' +
        ') AS CalcProcesso, P.CD_ANALISTA_CLIENTE, P.NR_CONHECIMENTO,'
      
        '       P.CD_CONTATO, P.TX_MERCADORIA, P.TP_BANCO_EXP, P.CD_BANCO' +
        '_EXP, P.CD_LOCAL_DESEMBARQUE'
      'FROM   TPROCESSO P( NOLOCK ), TUNID_NEG U( NOLOCK )'
      'WHERE  P.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       NR_PROCESSO = :NR_PROCESSO ')
    Left = 36
    Top = 2
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object TProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object TProcessoCD_BANCO_EXP: TStringField
      FieldName = 'CD_BANCO_EXP'
      Size = 5
    end
    object TProcessoCD_ANALISTA_CLIENTE: TStringField
      FieldName = 'CD_ANALISTA_CLIENTE'
      Size = 4
    end
    object TProcessoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object TProcessoCD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      Size = 3
    end
    object TProcessoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object TProcessoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object TProcessoCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Size = 4
    end
    object TProcessoNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object TProcessoTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object TProcessoTP_BANCO_EXP: TStringField
      FieldName = 'TP_BANCO_EXP'
      Size = 1
    end
    object TProcessoCalcProcesso: TStringField
      FieldName = 'CalcProcesso'
      Size = 18
    end
  end
  object Dts_Processo: TDataSource
    DataSet = TProcesso
    Left = 36
    Top = 64
  end
  object ppBDE_Processo: TppBDEPipeline
    DataSource = Dts_Processo
    SkipWhenNoRecords = False
    UserName = 'BDE_Processo'
    Left = 35
    Top = 120
    object ppBDE_ProcessoppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object ppBDE_ProcessoppField2: TppField
      FieldAlias = 'CD_BANCO_EXP'
      FieldName = 'CD_BANCO_EXP'
      FieldLength = 5
      DisplayWidth = 5
      Position = 1
    end
    object ppBDE_ProcessoppField3: TppField
      FieldAlias = 'CD_ANALISTA_CLIENTE'
      FieldName = 'CD_ANALISTA_CLIENTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 2
    end
    object ppBDE_ProcessoppField4: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object ppBDE_ProcessoppField5: TppField
      FieldAlias = 'CD_CONTATO'
      FieldName = 'CD_CONTATO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppBDE_ProcessoppField6: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppBDE_ProcessoppField7: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object ppBDE_ProcessoppField8: TppField
      FieldAlias = 'CD_LOCAL_DESEMBARQUE'
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object ppBDE_ProcessoppField9: TppField
      FieldAlias = 'NR_CONHECIMENTO'
      FieldName = 'NR_CONHECIMENTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object ppBDE_ProcessoppField10: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcessoppField11: TppField
      FieldAlias = 'TP_BANCO_EXP'
      FieldName = 'TP_BANCO_EXP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object ppBDE_ProcessoppField12: TppField
      FieldAlias = 'CalcProcesso'
      FieldName = 'CalcProcesso'
      FieldLength = 18
      DisplayWidth = 18
      Position = 11
    end
  end
  object TAnalistas: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT DISTINCT(CD_USUARIO), NM_USUARIO'
      'FROM   TUSUARIO U ( NOLOCK ), TCARGO_DESCENDENTE C ( NOLOCK )'
      'WHERE  U.CD_CARGO = C.CD_DESCENDENTE AND'
      '       C.CD_CARGO <> C.CD_DESCENDENTE AND'
      '       CD_USUARIO <> "" AND'
      '       CD_USUARIO = :CD_ANALISTA_CLIENTE')
    Left = 674
    Top = 185
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ANALISTA_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object DTS_analistas: TDataSource
    AutoEdit = False
    DataSet = TAnalistas
    Left = 674
    Top = 241
  end
  object ppBDE_Analistas: TppBDEPipeline
    DataSource = DTS_analistas
    SkipWhenNoRecords = False
    UserName = 'BDE_analistas'
    Left = 674
    Top = 297
  end
  object Dts_Ref: TDataSource
    DataSet = TReferencia
    Left = 391
    Top = 64
  end
  object TPais3: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CASE :CD_LINGUA_PEDIDO'
      '         WHEN '#39'1'#39' THEN NM_PAIS_ING'
      '         WHEN '#39'2'#39' THEN NM_PAIS_ESP'
      '         ELSE NM_PAIS_PORT'
      '       END AS DESCRICAO'
      'FROM   TPAIS_BROKER ( NOLOCK )'
      'WHERE  CD_PAIS = :CD_PAIS')
    Left = 614
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LINGUA_PEDIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PAIS'
        ParamType = ptUnknown
      end>
  end
  object Dts_Pais3: TDataSource
    DataSet = TPais3
    Left = 614
    Top = 240
  end
  object ppBDE_Pais3: TppBDEPipeline
    DataSource = Dts_Pais3
    SkipWhenNoRecords = False
    UserName = 'BDE_Pais3'
    Left = 614
    Top = 296
  end
  object TDoc: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE ", " END +'
      '       LTRIM( RTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM,'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE E.END_COMPL END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE " - " END +'
      
        '       E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT,' +
        ' "" ) ) ) WHEN "" THEN "" ELSE " - " END +'
      '       LTRIM( RTRIM( P.NM_PAIS_PORT ) ) AS CIDADE_PAIS'
      'FROM   TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK )'
      'WHERE  E.CD_PAIS *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_DOCUMENTO')
    Left = 168
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_DOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object Dts_Doc: TDataSource
    DataSet = TDoc
    Left = 168
    Top = 240
  end
  object ppBDE_Doc: TppBDEPipeline
    DataSource = Dts_Doc
    SkipWhenNoRecords = False
    UserName = 'BDE_Doc'
    Left = 168
    Top = 296
    object ppBDE_DocppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object ppBDE_DocppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDE_DocppField3: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 68
      DisplayWidth = 68
      Position = 2
    end
    object ppBDE_DocppField4: TppField
      FieldAlias = 'CIDADE_PAIS'
      FieldName = 'CIDADE_PAIS'
      FieldLength = 127
      DisplayWidth = 127
      Position = 3
    end
  end
  object TCopia: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE ", " END +'
      '       LTRIM( RTRIM( E.END_NUMERO ) ) AS ENDERECO_NUM,'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE E.END_COMPL END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE " - " END +'
      
        '       E.END_CIDADE + CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_PORT,' +
        ' "" ) ) ) WHEN "" THEN "" ELSE " - " END +'
      '       LTRIM( RTRIM( P.NM_PAIS_PORT ) ) AS CIDADE_PAIS'
      'FROM   TEMPRESA_EST E ( NOLOCK ), TPAIS_BROKER P ( NOLOCK )'
      'WHERE  E.CD_PAIS *= P.CD_PAIS AND'
      '       E.CD_EMPRESA = :CD_COPIA')
    Left = 224
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COPIA'
        ParamType = ptUnknown
      end>
  end
  object Dts_Copia: TDataSource
    DataSet = TCopia
    Left = 224
    Top = 240
  end
  object ppBDE_Copia: TppBDEPipeline
    DataSource = Dts_Copia
    SkipWhenNoRecords = False
    UserName = 'BDE_Copia'
    Left = 224
    Top = 296
    object ppBDE_CopiappField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object ppBDE_CopiappField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDE_CopiappField3: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 68
      DisplayWidth = 68
      Position = 2
    end
    object ppBDE_CopiappField4: TppField
      FieldAlias = 'CIDADE_PAIS'
      FieldName = 'CIDADE_PAIS'
      FieldLength = 127
      DisplayWidth = 127
      Position = 3
    end
  end
  object TBancoExp: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT NM_EMPRESA AS NOME, TX_OBS_BANCO AS OBS_BANCO'
      'FROM   TEMPRESA_EST ( NOLOCK )'
      'WHERE  CD_EMPRESA = :CD_BANCO_EXP')
    Left = 34
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_BANCO_EXP'
        ParamType = ptUnknown
      end>
    object TBancoExpNOME: TStringField
      FieldName = 'NOME'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
    object TBancoExpOBS_BANCO: TMemoField
      FieldName = 'OBS_BANCO'
      Origin = 'TEMPRESA_EST.TX_OBS_BANCO'
      BlobType = ftMemo
    end
  end
  object Dts_BancoExp: TDataSource
    DataSet = TBancoExp
    Left = 34
    Top = 240
  end
  object ppBDE_BancoExp: TppBDEPipeline
    DataSource = Dts_BancoExp
    SkipWhenNoRecords = False
    UserName = 'BDE_BancoExp'
    Left = 34
    Top = 296
    object ppBDE_BancoExpppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_BancoExpppField2: TppField
      FieldAlias = 'OBS_BANCO'
      FieldName = 'OBS_BANCO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object TMoeda: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT AP_MOEDA'
      'FROM   TMOEDA_BROKER ( NOLOCK )'
      'WHERE  CD_MOEDA = :CD_MOEDA')
    Left = 722
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
  end
  object Dts_Moeda: TDataSource
    DataSet = TMoeda
    Left = 722
    Top = 64
  end
  object ppBDE_Moeda: TppBDEPipeline
    DataSource = Dts_Moeda
    SkipWhenNoRecords = False
    UserName = 'BDE_Moeda'
    Left = 722
    Top = 120
    object ppBDE_MoedappField1: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 0
    end
  end
  object TSoma_Itens: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT RESULT = COUNT(*)'
      'FROM   TPROCESSO_EXP_ITEM ( NOLOCK )'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 556
    Top = 355
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object TSoma_ItensRESULT: TIntegerField
      FieldName = 'RESULT'
    end
  end
  object ppBDE_Ref: TppBDEPipeline
    DataSource = Dts_Ref
    SkipWhenNoRecords = False
    UserName = 'BDE_Ref'
    Left = 392
    Top = 120
    object ppBDE_RefppField1: TppField
      FieldAlias = 'REFER_NR_CLIENTE'
      FieldName = 'REFER_NR_CLIENTE'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDE_RefppField2: TppField
      FieldAlias = 'calcRef'
      FieldName = 'calcRef'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
  end
  object TReferencia: TQuery
    OnCalcFields = TReferenciaCalcFields
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT A.NM_REFERENCIA AS REFER_NR_CLIENTE'
      'FROM   TPROCESSO_EXP P ( NOLOCK ), TAUX_EXP_REF A ( NOLOCK )'
      'WHERE  A.NR_PROCESSO = P.NR_PROCESSO AND'
      
        '       ( ( P.NR_PROCESSO = :NR_PROCESSO ) AND ( IN_REFERENCIA_FA' +
        'T_INST = '#39'0'#39' ) OR'
      
        '         ( P.NR_PROCESSO = '#39#39' ) AND ( IN_REFERENCIA_FAT_INST = '#39 +
        '1'#39' ) )'
      '')
    Left = 392
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object TReferenciaREFER_NR_CLIENTE: TMemoField
      FieldName = 'REFER_NR_CLIENTE'
      BlobType = ftMemo
    end
    object TReferenciacalcRef: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcRef'
      Size = 255
      Calculated = True
    end
  end
  object TLocal3: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT DESCRICAO'
      'FROM   TLOCAL_EMBARQUE ( NOLOCK )'
      'WHERE  CODIGO = :CD_LOCAL')
    Left = 441
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LOCAL'
        ParamType = ptUnknown
      end>
  end
  object Dts_Local3: TDataSource
    DataSet = TLocal3
    Left = 441
    Top = 240
  end
  object ppBDE_Local3: TppBDEPipeline
    DataSource = Dts_Local3
    SkipWhenNoRecords = False
    UserName = 'BDE_Local3'
    Left = 441
    Top = 296
    object ppBDE_Local3ppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
  end
  object TVerif_Pais_Item: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT MIN( P.CD_PAIS_ORIG ), COUNT( DISTINCT I.CD_PAIS_ORIGEM )' +
        ','
      '       CASE COUNT( DISTINCT I.CD_PAIS_ORIGEM )'
      '          WHEN 1 THEN'
      '             CASE MAX( I.CD_PAIS_ORIGEM )'
      '                WHEN '#39#39' THEN'
      '                   CASE MIN( P.CD_LINGUA_PEDIDO )'
      
        '                      WHEN '#39'0'#39' THEN ( SELECT NM_PAIS_PORT FROM T' +
        'PAIS_BROKER WHERE CD_PAIS = MAX( P.CD_PAIS_ORIG ) )'
      
        '                      WHEN '#39'1'#39' THEN ( SELECT NM_PAIS_ING FROM TP' +
        'AIS_BROKER WHERE CD_PAIS = MAX( P.CD_PAIS_ORIG ) )'
      
        '                      WHEN '#39'2'#39' THEN ( SELECT NM_PAIS_ESP FROM TP' +
        'AIS_BROKER WHERE CD_PAIS = MAX( P.CD_PAIS_ORIG ) )'
      '                   END'
      '                ELSE'
      '                   CASE MIN( P.CD_LINGUA_PEDIDO )'
      
        '                      WHEN '#39'0'#39' THEN ( SELECT NM_PAIS_PORT FROM T' +
        'PAIS_BROKER WHERE CD_PAIS = MAX( I.CD_PAIS_ORIGEM ) )'
      
        '                      WHEN '#39'1'#39' THEN ( SELECT NM_PAIS_ING FROM TP' +
        'AIS_BROKER WHERE CD_PAIS = MAX( I.CD_PAIS_ORIGEM ) )'
      
        '                      WHEN '#39'2'#39' THEN ( SELECT NM_PAIS_ESP FROM TP' +
        'AIS_BROKER WHERE CD_PAIS = MAX( I.CD_PAIS_ORIGEM ) )'
      '                   END'
      '             END'
      '          ELSE CASE MIN( P.CD_LINGUA_PEDIDO )'
      '                  WHEN '#39'0'#39' THEN '#39'VIDE ITEM'#39
      '                  WHEN '#39'1'#39' THEN '#39'SEE ITEN'#39
      '                  WHEN '#39'2'#39' THEN '#39'VIDE ITEN'#39
      '               END'
      '       END AS PAIS_ORIGEM'
      
        'FROM   TPROCESSO_EXP_ITEM I ( NOLOCK ), TPROCESSO_EXP P ( NOLOCK' +
        ' )'
      'WHERE  P.NR_PROCESSO = I.NR_PROCESSO AND'
      '       P.NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 108
    Top = 355
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object Dts_Verif_Pais_Item: TDataSource
    DataSet = TVerif_Pais_Item
    Left = 108
    Top = 411
  end
  object ppBDE_Verif_Pais_Item: TppBDEPipeline
    DataSource = Dts_Verif_Pais_Item
    SkipWhenNoRecords = False
    UserName = 'BDE_Verif_Pais_Item'
    Left = 108
    Top = 470
    object ppBDE_Verif_Pais_ItemppField1: TppField
      FieldAlias = 'COLUMN1'
      FieldName = 'COLUMN1'
      FieldLength = 3
      DisplayWidth = 3
      Position = 0
    end
    object ppBDE_Verif_Pais_ItemppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUMN2'
      FieldName = 'COLUMN2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppBDE_Verif_Pais_ItemppField3: TppField
      FieldAlias = 'PAIS_ORIGEM'
      FieldName = 'PAIS_ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
  end
  object TCliente_Contato: TQuery
    DatabaseName = 'DbBroker'
    RequestLive = True
    SQL.Strings = (
      'SELECT NM_CONTATO'
      'FROM   TCLIENTE_CONTATO ( NOLOCK )'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = '#39'02'#39' AND'
      '       CD_CONTATO = :CD_CONTATO')
    Left = 223
    Top = 355
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CONTATO'
        ParamType = ptUnknown
      end>
    object TCliente_ContatoNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'TCLIENTE_CONTATO.NM_CONTATO'
      Size = 50
    end
  end
  object Dts_Cliente_contato: TDataSource
    DataSet = TCliente_Contato
    Left = 223
    Top = 411
  end
  object ppBDE_CLiente_Contato: TppBDEPipeline
    DataSource = Dts_Cliente_contato
    SkipWhenNoRecords = False
    UserName = 'BDE_CLiente_Contato'
    Left = 223
    Top = 470
    object ppBDE_CLiente_ContatoppField1: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
  end
  object TProcPed: TQuery
    OnCalcFields = TProcPedCalcFields
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT I.NR_ITEM, I.CD_UNID_MEDIDA, U.NM_SIGLA, I.CD_MERCADORIA,' +
        ' I.QT_MERCADORIA,'
      
        '       I.VL_TOT_PESO_LIQ, I.VL_TOT_PESO_BRUTO, I.VL_UNITARIO, I.' +
        'VL_TOT_ITEM,'
      
        '       I.TX_MERCADORIA AS NM_MERCADORIA, E.NM_EMBALAGEM_S AS NM_' +
        'EMBALAGEM,'
      
        '       EM.NM_DESCR_DETALHADA AS NM_EMB_SUP, CASE I.QT_EMBALAGEM_' +
        'SUP WHEN 0 THEN I.QT_EMBALAGEM ELSE I.QT_EMBALAGEM_SUP END AS QT' +
        '_EMB_SUP,'
      '       E.NM_DESCR_DETALHADA AS NM_DESCR_DETALHADA,'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) WHEN' +
        ' "" THEN "" ELSE "S: " END +'
      '       LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.NR_PEDIDO_IMP, "" ) ) ) WHEN' +
        ' "" THEN "" ELSE " - " END + LTRIM( RTRIM( I.NR_PEDIDO ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( P.NM_PAIS_ING, "" ) ) ) WHEN "' +
        '" THEN "" ELSE " FROM: " + LTRIM( RTRIM( P.NM_PAIS_ING ) ) END'
      '       AS NR_OC_REF_ORIGEM,'
      
        '       I.VL_CUBAGEM AS VL_CUBAGEM, M.CD_MATERIAL AS CD_MATERIAL,' +
        ' M.NR_LINHA AS NR_LINHA,'
      
        '       CASE LTRIM( RTRIM( ISNULL( M.CD_COR, "" ) ) ) WHEN "" THE' +
        'N "" ELSE "COLOR : " END + LTRIM( RTRIM( M.CD_COR ) ) AS CD_COR,'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.CD_NCM_DOC, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE "TEC/NCM: " + I.CD_NCM_DOC END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.CD_NCM_DOC, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE " - " + N.DESCRICAO END AS DESCR_NCM,'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_DOC, "" ) ) ) WHEN' +
        ' "" THEN "" ELSE "NALADI: " + I.CD_NALADI_DOC END +'
      
        '       CASE LTRIM( RTRIM( ISNULL( I.CD_NALADI_DOC, "" ) ) ) WHEN' +
        ' "" THEN "" ELSE " - " + NA.DESCRICAO END AS DESCR_NALADI,'
      '       I.VL_FRETE, I.VL_SEGURO, I.VL_ACRESCIMO, I.VL_DESCONTO'
      
        'FROM   TPROCESSO_EXP_ITEM I ( NOLOCK ), TMERCADORIA_EXP M ( NOLO' +
        'CK ), TEMBALAGEM E ( NOLOCK ),'
      
        '       TEMBALAGEM EM ( NOLOCK ), TPAIS_BROKER P ( NOLOCK ), TUNI' +
        'D_MEDIDA_BROKER U ( NOLOCK ),'
      '       TNCM_EXP N ( NOLOCK ), TNALADISH_EXP NA ( NOLOCK )'
      'WHERE  I.CD_MERCADORIA *= M.CD_MERCADORIA AND'
      '       I.CD_EMBALAGEM *= E.CD_EMBALAGEM AND'
      '       I.CD_EMBALAGEM_SUP *= EM.CD_EMBALAGEM AND'
      '       I.CD_PAIS_ORIGEM *= P.CD_PAIS AND'
      '       I.CD_UNID_MEDIDA *= U.CD_UNID_MEDIDA AND'
      '       I.CD_NCM_DOC *= N.CODIGO AND'
      '       I.NR_SEQ_NCM_DOC *= N.NR_SEQ AND'
      '       I.CD_NALADI_DOC *= NA.CODIGO AND'
      '       I.NR_SEQ_NALADI_DOC *= NA.NR_SEQ AND'
      '       I.NR_PROCESSO = :NR_PROCESSO AND'
      '       ISNULL(I.NR_PEDIDO,'#39#39') = :NR_PEDIDO')
    Left = 156
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PEDIDO'
        ParamType = ptUnknown
      end>
    object TProcPedCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Size = 3
    end
    object TProcPedNM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Size = 3
    end
    object TProcPedCD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Size = 40
    end
    object TProcPedQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object TProcPedVL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
    end
    object TProcPedVL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
    end
    object TProcPedVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object TProcPedVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object TProcPedNM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      BlobType = ftMemo
    end
    object TProcPedNM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      Size = 50
    end
    object TProcPedNM_EMB_SUP: TStringField
      FieldName = 'NM_EMB_SUP'
      Size = 50
    end
    object TProcPedQT_EMB_SUP: TFloatField
      FieldName = 'QT_EMB_SUP'
    end
    object TProcPedNM_DESCR_DETALHADA: TStringField
      FieldName = 'NM_DESCR_DETALHADA'
      Size = 50
    end
    object TProcPedVL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
    end
    object TProcPedNR_LINHA: TStringField
      FieldName = 'NR_LINHA'
      Size = 10
    end
    object TProcPedCD_COR: TStringField
      FieldName = 'CD_COR'
      Size = 18
    end
    object TProcPedVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object TProcPedVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object TProcPedVL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
    end
    object TProcPedVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
    object TProcPedDESCR_NCM: TStringField
      FieldName = 'DESCR_NCM'
      Size = 255
    end
    object TProcPedNR_OC_REF_ORIGEM: TStringField
      FieldName = 'NR_OC_REF_ORIGEM'
      Size = 96
    end
    object TProcPedNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object TProcPedDESCR_NALADI: TStringField
      FieldName = 'DESCR_NALADI'
      Size = 219
    end
    object TProcPedCD_MATERIAL: TStringField
      FieldName = 'CD_MATERIAL'
      Size = 15
    end
    object TProcPedCalcVlUnitario: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlUnitario'
      Calculated = True
    end
    object TProcPedCalcVlItem: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlItem'
      Calculated = True
    end
  end
  object Dts_ProcPed: TDataSource
    AutoEdit = False
    DataSet = TProcPed
    Left = 156
    Top = 64
  end
  object ppBDE_ProcPed: TppBDEPipeline
    DataSource = Dts_ProcPed
    SkipWhenNoRecords = False
    UserName = 'BDE_ProcPed'
    Left = 156
    Top = 120
  end
  object TProcVerifica: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.NR_PROCESSO, E.IN_VENDA_INCOTERM, E.CD_PAIS_DESTINO, P.' +
        'CD_CLIENTE'
      'FROM   TPROCESSO_EXP E  ( NOLOCK ), TPROCESSO P ( NOLOCK )'
      'WHERE  E.NR_PROCESSO = P.NR_PROCESSO AND'
      '       E.NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 556
    Top = 411
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object TInstNeg: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CD_INST_NEGOC, NM_INST_NEGOC'
      'FROM   TINST_NEGOC ( NOLOCK )'
      'WHERE  CD_INST_NEGOC = :CD_INST_NEGOC AND'
      '       IN_ATIVO = '#39'1'#39)
    Left = 734
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_INST_NEGOC'
        ParamType = ptUnknown
      end>
    object TInstNegCD_INST_NEGOC: TStringField
      FieldName = 'CD_INST_NEGOC'
      Origin = 'TINST_NEGOC.CD_INST_NEGOC'
      Size = 5
    end
    object TInstNegNM_INST_NEGOC: TStringField
      FieldName = 'NM_INST_NEGOC'
      Origin = 'TINST_NEGOC.NM_INST_NEGOC'
      Size = 60
    end
  end
  object Dts_InstNeg: TDataSource
    DataSet = TInstNeg
    Left = 734
    Top = 240
  end
  object ppBDE_InstNeg: TppBDEPipeline
    DataSource = Dts_InstNeg
    SkipWhenNoRecords = False
    UserName = 'BDE_InstNeg'
    Left = 734
    Top = 296
  end
  object TSomaProcEmb: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT SUM( ISNULL( QT_EMBALAGEM, 0 ) ) AS QTD_EMBALAGEM'
      'FROM   TPROCESSO_EMBALAGEM ( NOLOCK )'
      'WHERE  NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 556
    Top = 470
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object TSomaProcEmbQTD_EMBALAGEM: TIntegerField
      FieldName = 'QTD_EMBALAGEM'
    end
  end
  object ppRepFatExp: TppReport
    AutoStop = False
    DataPipeline = ppBDE_Proc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report_Fatura1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\FaturaEmbCBE.rtm'
    Units = utPrinterPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 736
    Top = 410
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDE_Proc'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 3683
      mmHeight = 52388
      mmPrintPosition = 0
      object ppimg_logo: TppImage
        UserName = 'ppimg_logo'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        Picture.Data = {
          07544269746D61701E9E0000424D1E9E0000000000003600000028000000D900
          00003E0000000100180000000000E89D00000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFD
          FBFBFBFAFAFAF9F9F9F8F8F8F7F7F7F5F5F5F3F3F4F2F2F3F1F1F1F0F0F0EEEE
          EFEDEEEEEDEDEEECECEDECECEDECECECEBEBECEBECECEBECECEBECECEBEBECEC
          ECECECECEDECECEDEDEDEEEDEEEEEEEEEFF0F0F0F1F1F2F2F2F3F3F3F4F5F5F5
          F7F7F7F8F8F8F9F9FAFAFAFAFBFBFBFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6F1
          F0F1E9E9EADFDFE0D6D7D8CFD0D1CBCBCCBEBFC0B2B2B4A6A7A8989A9B909194
          86888A7A7D806A6E7061626655585C4D4F52494A4F43454A3B3C4333363A2A2D
          3224282C1F2226171C211114190D0F150A0D13060A0F04080E03070C02050A02
          050A02050B02050A02050A04060D04080E090A100B0E140D101611141A171C21
          1F232925282D2A2C3233353B3B3E4242454A494B4F4D4F5356595D6062676C6E
          727D7E8087878B90919398999BA7A8ABB0B2B4BDBFC0CBCBCCCFD0D1D7D8D8DF
          DFE0E9EAEAF1F1F1F6F6F6FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DEDEDECCCBCDBABBBCA7A8AA93
          94978384877072745B5E624D4F5541444934373C282A301E2026191C20141619
          0F12140B0E0F0609090407050407040406040406020406000306000407000406
          00060800080A00080B000B0E010C0E020E11040F120511130812130813160914
          160A14160A15170A15170B15170B15160B15170B15170A14170A15160A13160A
          1316081114071113070F12050E10040C0F050B0E04080C04080A030609030407
          0304070505080504070704080805080A04060A04070B07090F0B0E140F121812
          161C181C211E2026292B3135363B4244484D4F545B5E606E7074838587939496
          A6A7AABCBDBDCCCCCDDEDFDEF2F3F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF1F2F3DBDCDCB7B7B99C9D9F8384885A5C5F41434734353B24
          262B16181D1215180F11130B0D0D090B09090D05090D03090B000A0C000B0E00
          0D0E000E10000E110010140713150D13161215181815191D15192417192A171A
          32191B3B181B42191D49191D50191E58191D5B181D5E181E64181E6A191E7218
          1E74171F74181F781A1E7B1A1D7C1A1F7C191E7C191E7D191E7C191E7C191D7A
          171F79191F76191D73181D71191E6D171C67181D60181D5C181C58181C51191C
          49181B43181C3C181B34171A2E171A26171A20171A1A16191516191115170C15
          16081417061215051214041013041012040E11070D10090D0F0C0A0D0D0A0D0E
          0A0D110A0D120A0D120A0D130F121712161B16191D24262B3336394043475859
          5E8284879D9DA0B7B6B8DBDBDDF2F2F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFD
          FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF5F4
          F4DADCDCB4B5B798989C696A6E46474B2B2E330F121504070800010000000000
          00000609040B0E070D10060F120713140C13161314171B15182316192F161B3F
          181C4D181B5C181C6F191F7E19218C19219A1A22A81A21B41B24BC1B23C61A23
          D01C24D71D27DF1C25E31B25E71B26E81C25EC1C25EC1C26EE1C26EF1C26F11C
          26F11C26F21C26F11C26F01C26F01C26F01C26F01C26EE1C26EE1C26EE1C26EE
          1C26EE1C26EE1C26EE1C25EE1C26EE1C26F01C26F01D26F11C26F11C26F21D26
          F11C26F11D26F01C26EF1C26EC1C25EB1C25EA1C24E81C25E31D26E01C24D91B
          24D21A23CA1A22BE1B22B51B21AB19209E1A1F8D191E81181D72181C61181D51
          181C4316193418192716191D16191715171115180D15170F14170E1415101215
          111013110E11100B0E0F06090B00000500000000000604070D1012182E2F3346
          474C696A6E999A9DB7B7B9DDDCDDF4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFD
          FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F7E6E6E6D7D7D8B7B8
          BA94969869696E484B4D2325280F1212020602000000000200030601090C0911
          141312171E161927181C35191C43181C54181D67181F7C1920911B22A41B21B5
          1B23C21B23CF1B24D91B24E01C26E51C27EA1B25ED1C25ED1C26ED1C25EB1C25
          EB1D26E91C25E61C25E31C25E21C25E01A24DD1C25DC1C25DC1C24DB1C25DA1C
          25DA1C24DA1C24D91C24D91C24D91C24D81C24D81C24D91C24D91C24D91C24D9
          1C24D91C24D91C24D91C24D91C24D91C24D91C24D91C25D91C24D91C24D91C24
          D91B24D81C24D81C24D81B24D91C24D91B24D91C24DA1C24DA1C25DA1C25DB1C
          25DC1B25DC1C24DD1C25DF1C25E11C25E31B25E61C25E81C25EB1C25EB1C26EC
          1C25ED1C25EE1C25EB1B26E71C25E11B24DA1A24D21B22C41A23B61B22A8191F
          96181F7E191D6A171C57181B48181A3617192917192117191B171A18181A1516
          18121316100F130F080C0A03060900030700000704080E10131923252A484B4F
          68696D969698B6B8B9D8D8D9E5E6E6F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFEAEBEBCCCDCEADADB08182
          865C5D62393B3F2122240A0D0A0306000304000406000B0D0B0F131B15182F18
          1A42181D5A191F711A20861B21991923B01A22C01B24CF1B24D81B24E21C25E7
          1C25E81C25E91C26E81C25E71C25E31C25E11C25E01C25DE1C25DC1C24DB1C25
          D91C25D91C24D91C25D91C25D91B24D91C25D91C25D91C25D91C25D91C25D91C
          25D91C25D91C25D91C25D91C25D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D9
          1C25D91C25D91C25D91C24D91C25D91C25DA1C25DA1C25DC1C25DD1B25DF1C24
          E11C25E31C25E51C26E71C25E91C25E91B25E71C25E31B25DB1B23D01C23C31A
          22B218219F191F8A191E74181C5D181B49171A35171A2418191916191016180E
          13150C10120D0C101005080D02060D04070D0B0E13212328383B3F5A5B5F8183
          85ADAEAFCCCDCEEAEBEBFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFD
          FDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFD
          FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8F9C5C5C69394975B5E
          6135383A1C1F200E100C080B00070A000A0B000C0E05121622171B43181E631A
          20841A22A01A22B91B23CA1B23D51C25E01B25E21C25E31B25E51C25E41B24E3
          1C25E21C25DF1C25DC1C25DB1C25DA1C25D91C24D91C25D91C24D91C25D91C25
          D91C25D91C25D91C25D91C25D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25D91C25
          D91C25D91C25D91C25D91C25D91B25D91C25D91C24D91C25D91C25DA1B25DB1C
          25DC1C25DE1C25E11C25E21C25E41B25E41C25E41B25E31D25E01B24D91A24CB
          1B23BB1B20A5191F8C181C69181B4B171A2D1719121618061517061417081216
          0F0D100F0A0D11080C11090D120D10161D202435373C5C5E62939497C4C5C6F8
          F9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFD
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFD
          FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F8C6C7C88A8B8E4042
          441115150103020002000609000D0F0910131814192F171B58191F811B21A71B
          25C81C24E11C25EB1C25EC1C25E91C25E51C25E11C25DF1C25DD1C25DC1C25DB
          1C25DA1B25DA1C24D91C24D91C24D91C25D91C25D91C25D91C25D91C25D91C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25D91C25D91C25D91C25D91C25D91C25D91B24D91C25D91C24D91C25DA
          1C25DB1C25DC1C23DC1B25DF1B24E01C25E51C25E91C25EC1C26EB1C25E31C24
          D21B22AE1A1F88181C60171B3C181A2217181417170E1417111417131114140D
          1012060B0F00030901040A12141A4042478C9091C6C7C8F5F5F6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFECECEDCCCCCE9A9B9D5356
          5622232000030000000002050310131E161A38171E5A1820841B21AA1B23C91B
          25E01C26EF1C26F11B25EB1C25E31C25DC1C24DA1C25D91C25D91C25D91C25D9
          1C25D91C25D91B24D91C25D91C25D91C25D91C25D91C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25D91C25D91C25D91C25D91B24D91C25D91C24D91C25D91C25D91C25
          D91C25D91C24D91C25DC1C25E11B25EB1D26F01C26EF1B25E71B24CE1A22B019
          208B191D66161C41171A2716181916191316191215181510131403060A000002
          01050A2022275355599C9EA2CDCDCEEBEBECFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFEAEBEAB9BABD7779
          7C404341191C140607000205040B0F1D1418451A1F6F1B229B1B23BB1C24D11B
          25E11B25E91C25E81C26E41C25DE1C25DA1C24D81C25D91C25D91C25D91C25D9
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25D91C25D81B24D81C
          25D91C25DC1C25E31C24E71A26E81C25E41B24D61B22BF1920A1191E7C181B4D
          16192D171819171911181A111315140C0F1202060D060A10191C214142467777
          7AB8B9BBECEDEDFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFB3B4
          B77272753334330E1004050800080B0C111336171B691B21A31B24C61D25DC1B
          25E41C25E61C24E31C25E01C25DD1C25DA1C25D91C24D91C25D91C25D91C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25D91C25D91C25D91C24D91B24D91C25DC1C25DF
          1C25E31C25E51B24E41B25DD1C24CB1921A9181E7E161A4517181F16190B1619
          081317140F13170A0C12070A100F121834363C747477B7B8BAFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFE3E3E37F80822B2C2A0003000304000D0F1714184D181F981C23C71C25E21C
          25EA1C25E41C25E01C25DD1C25DB1C24D91C24D91C25D91C25D91C25D91C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25D91C25D91C25D91C25D91C24D91C24D91C24D91C24D91C24D91C
          24D91B24D91C24D91C25D91C24D91C24D91C24D91C24D91C25D91C24D91C25D9
          1C25D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25D91C25D91C25D91C25D91C25D91B24DA1C25DD1C25DF1A25E41C25
          EB1B25E61C24CD1920A3171C6715192616190B16190E1619141317180D101503
          060C02050A2B2E327E7F81DEDFE0FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFD
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFF
          FFFFFFFFEBEAEBAEAFAE43433E0205000000000A0E26171C691C23A81C24D91C
          27F11C25ED1C25E31C25DC1C25D91C25D91C25D91B24D91C25D91C25D91C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25D91C25D91C25D91C24D91B24D91C25DA1C25DB1C25DC1C25DE1C25E01C
          25E11C25E21C25E11C25E31C24E21B25E21C25E21C25E31C25E31C25E21C25E2
          1C25E11C25E01C25DE1C25DC1C25DB1C25DA1C25D91C24D91C25D91C25D91C25
          D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25D91C
          25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D9
          1C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25
          D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25D91C25D91C25
          D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C
          25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D9
          1C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25
          D91C24D91B24D91C25D91C25D91B24DB1B25E11C25EC1C26F21B25E11B22B318
          1D76181A4115191C1718131719151519190B0C1300000201040A43454AB5B5B7
          EBEBECFFFFFFFFFFFFFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
          FDFEFEFEFFFFFFFFFFFFD5D5D786888437362C0609000204221318651B23A11C
          24CE1C26E81C25EB1C25E11C24DA1C25D81C25D91C25D91C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25D91B24D91B24D81A25D81B25DB1B25DF1B25E31C26EA1E27EA1C26EB1D
          27E81C26E31C25DD1C24D61B24D11B25CA1B24C71B23C21B23BF1C24C01B24C0
          1B22C11B24C21C24C61C24CB1C25D01B24D41C26DA1B24E11C25E71C25E81C25
          EB1C26E71B25E11B25DD1C24D91C25D91C25D91C25D91C25DA1C25DA1C25DA1C
          25DA1C25D91C25DA1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC
          1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25
          DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DB1C25DB1C25DB1C
          25DA1C25D91C24D91C24D91C24D91C24D91C25D91C25D91C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          D91C25DA1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C
          25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC
          1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25DC1C25
          DC1C25DC1C25DC1C25DA1C25D91C25DA1C25DA1C25DA1C25DA1C25D91C25D91B
          25D81C25D81C25DF1C26E91D26EB1B24DA1B21AA181E76161B4016191616160C
          171A1811151900030B080B10393B3E8A8C8FDBDCDCFFFFFFFFFFFFFEFEFEFDFD
          FDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFE8E9EA8788841D1F110709080B0F4316
          1C901D26D21D25E21B26E51C25E11C25DB1B24D81C25D91C25D91C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25D91C25D91C24D91C25D81C25DB1D26E21C26EA1C26EE1B25E81822D915
          1EC40E16A50A1086050C6B050954020740000534000328000221000118000015
          00011200011100031200021300031301041503051B04081F090D280E12331417
          44161A511A1D651A1F7B1920991C22B51B23CF1C25E41C26EE1C25EB1C25E21B
          25DC1C24D81C24DA1C25DA1C25DA1C25D91B25DC1C25E51B26E91C25E71C26E9
          1C26E91C25E71C26E91C25E81C25E81C26E91C25E71C26E91C26E91C25E71C26
          E91C25E81C25E81C25E81C26E91C25E71C26E91C26E91C25E71C26E91C25E81C
          25E81C26E81C25E91C26EA1C26ED1C25EE1C26ED1C26EC1C26EA1C26E51C24DE
          1B25DA1C24D91B25D91C24D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25D91C24DE1D25E81C25E91C25E71C26E91C25E81C
          25E81C26E91C25E71C26E91C26E91C25E71C26E91C25E81C25E81C26E91C25E7
          1C26E91C25E81C25E91C25E71C26E91C26E91C25E71C26E91C25E81C25E81C26
          E91C25E71C26E91C25E81B26E71C26E91B25E61C25DD1C25D91C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C24D91B25DA1C25E01C25E5
          1A25E31C24D61A22AB171B5A17171E16170A181A1413151C090D12080B102225
          2A87898BEBEAEBFFFFFFFFFFFFFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFF88878118190900
          00051016671A22C21C25E91C24E81C24DE1A25DA1A24D81C25D91C25D91C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25D91C25D91C25DB1C23DC1A25E01A23EA151FE40E18C504
          0D9700036002073C090A211013162728203A3B2F45463D52534B65676073746F
          80817B858683898A878B8B89898B888788857B7E7B7879776C6E6D6062614D4F
          4C4143403334311D1F1C070A080205000000000003000A0D0012120D13171F16
          193D191D6A1921A01B23CD1C25E51A25DB1C24D81720D91019D71019DC101ACB
          090F4C0C103B0C10430C10420C10420C10420C10420C10420C10420C10420C10
          420C10420C10420C10420C10420C10420C10420C10420C10420C10420C10420C
          10420C10420C10420D12420E124311124710154B131752141A5D161B68191E7A
          1A208D1A21A61B22C11C25DB1A25EA1C26EE1C25E31C25DB1C25DA1C24D91C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA151FD91019D7101BE11118AE090E370C
          103F0C10420C10420C10420C10420C10420C10420C10420C10420C10420C1042
          0C10420C10420C10420C10420C10420C10420C10420C10420C10420C10420C10
          420C10420C10420C10420C10420C10420C1042101445171C4E181B47161B541C
          23C31A25E21C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25D91C25D91B24D91B25DB1C23DE1C25E41B26EB1C23CF181F82181A
          2E15160716181215181B0E11170002071D1F238D8D8FFFFFFFFFFFFFFFFFFFFD
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFFFFFEFEFDBB
          BAB31E21180000150F167B1C27D71E27F41B26E51A25D91C24D91C25D81C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1B25DA1C24D91C25DA1B25DA1720DD111BDB0F18CF0F
          16B0131A76272B4F4548497273639C9A87BAB9ABDDDDD5EBECE9FEFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F6F6E3E4E4C2C3C49E9FA173
          75784144481D1F240D0F10090B050D0F0015160315180F181D4D1C24D91620E0
          2A32D84A52DE484EE3484ED042424443423143443B4144394344384344384344
          3843443843443843443843443843443843443843443843443843443843443843
          44384344384344384344384344384344384041383B3D34373A2F2F312626291D
          1A1C101214070D1000090B00080A00080B000F120A151924171B48191E781C22
          B91A25E21925E31A23DB1C25D91C25D91C24D91A25DA1B23D91722D7343CD94B
          51DE464FE7464DAF40422D43443743443A434438434438434438434438434438
          4344384344384344384344384344384344384344384344384344384344384344
          3843443843443843443843443843443843443843443843443842443847483D35
          382D11140C1516051517191B23BC1C25E51C25D91C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25D91B25D91C25
          D91C24D91C25E21B25F21B25E61A2097171A41161715171813181A1D0C101400
          0000232529C1C2C2FFFFFFFFFFFFFEFEFEFDFDFDFEFEFEFEFEFEFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFDFDFDFE
          FEFEFFFFFFE5E5DE6D6E64090C21090F7B1C24D51D27ED1B25E21C24D71B24D8
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1E26DA1A22D90F19DA09
          12D4151CBE383C9F61658A919191C1C1B3E3E3D6FFFFFAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCFCF8F8
          FCF5F6FBF2F2FBF0F0FBF0F1FBF3F3FBF8F8FCFEFEFDFFFFFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D7D8AEAEB07E808233353E101214
          1415001618161B25D40912E2686EDFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FBFBFCF5F5F6ECECEDE0E0E2D2D2D4C7C7C9AFB0B28E8F926B6D714345481B1D
          1E040704090C0416170B161919171B541922A81C25E31B25DE1C24D81C23D81B
          25DA1922DA111BD39DA0E5FFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB7B8B6060A0414140615181B1B23BC1C25E51C25D9
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C24D81B25DE1B26ED1B25DD1A
          209C181A4616170F161915171A1F04070C0B0E12737578E6E7E7FFFFFFFEFEFE
          FDFDFDFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFE
          FEFEFEFEFEFDFDFDFEFEFEFFFFFFCECEBE3A3B3F050A63141DC31E27EC1B24E1
          1C25DA1C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C
          24DA0A13D8000BD42730D3696FC3B9BAC9E2E2DCF8F8ECFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFE8E9F8C3C6F19DA0
          EA8285E77077E46469E25B61E2555BE04D54DE4950DF4A50DF5057DE5B61E068
          6DE3787EE58A8DE69DA0EBB5B7EFCCCEF3E7E7F8FFFFFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFA3A5D80A109D14186D171B3E1A24CD0911E1666EDFFFFFFFFFFF
          FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDEBEBEBCCCDCE7F8082282A3000000511151318190F15191B19
          1E741D27EA1A23DC1C24D91C25DA1922D9111AD39B9FE5FFFFFFFFFFFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B7C4080C40141846
          181B551C24C41B25E21C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25D91B24D91C25E01C25E81B25DB192089161829151708181B1E0F1117
          02060A3C3E41D5D5D7FFFFFFFEFEFEFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFDFDFDFEFEFEFEFDFDFEFEFEFFFFFFD2D1BA0E113F0811AF
          1B25E81D26E21A24D91B24D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1A
          23DA1C24D91A23D90D18D70007D2353DD8A5A8EAEEEFF9FFFFFBFFFFFFFFFFFF
          FFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFEAEAF08C90
          E8474DDC2129D7101AD50D15D70B14D60D16D60E17D80F19D71019D8111BD811
          1AD8111AD8101AD80F18D70E16D80D15D60B15D60D15D70F18D6121BD5242BD9
          343CDA545ADE868BE6B9BBEFECEDF8FFFFFFBDBEED0913E21520E61C25D01B25
          D60811D6656CDFFDFDFEFFFFFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFEFFFFFFFFFFFFFFFFFFFEFFFFFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFEDEDED83
          8487000208101318171A16151607181E7F1C27F21A23D81C25DA1922D9111AD3
          999DE5FFFFFFFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC3C4F01018D71821E41C26E01A23DB1B25D91C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25D91C24DA1A25DE1C25EA
          1D25CE181C5B15170717191614191E03060C0E1014DBDADAFFFFFFFEFEFEFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFDFDFEFFFEFFFFFF
          BABABB0A106E0C16E81D28EA1C25D91A24D81C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1D25D9111CD80A14D53B45DAADAEEBFFFFFEFFFFFF
          FFFFFFFFFFFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFAF9
          F2B8B9B04D5298060FC70004D60B14D7161FD81A23DA1B23DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1A25D81A23DA1A23DA151FD8101AD90812D80004D40004D40912D34349DB7478
          DF1720D71720D91C24DE1A26D90811D6656CE1FDFEFEFFFFFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFDFBFD3F3F41
          141618202214272E972F38F43339D93C43DB4C54DE7277E29A9EEACFD0F3F4F5
          FCFFFFFFFFFFFEFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFD
          FDFDFEFEFEFFFFFFFFFFFFFFFFFFBCBBBC06090F10131A1719131317191E26D7
          1B24E01C25D91922D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF5556594C4D4F52
          5346575BAD585FEC575EDF575EDE575EDE575EDE575EDE575EDE575EDE575EDE
          575EDE575EDE575EDE565EDE5E63DF484FDB1721D71A22DC1C25DB1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25D91C25D91C23D71C25E51C27F41A22A9171720151810191C1E0609
          0F080C11BEBEC1FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FDFDFDFEFEFDFFFFFFD1D3E62D34B60B16DD1D26E01A24D71C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24DA0A13D71D23D6898DE6
          F1F1FAFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
          FDFFFFFFFFFFFFDEDED85958530B1170050FCE1620E01E27D91C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1D26DA1E26
          DA1C25DA1720D90B13D7111BD81B24D81B25D91C23DA1B26D90811D6656CE1FD
          FEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFFFFFFFFFEFF26282C0000010A0A000E148E101AF50B16D50A14D70913
          D60711D60811D4151DD64A52DCC6C8F0FFFFFEFFFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF797A7E
          0001071719181618171822AF1C25E61C25D91922D9111AD3999DE5FFFFFFFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFF
          FFFFFFFFFF05080C000000020400080F8E0A15EB0913D70913D60913D60913D6
          0913D60913D60913D60913D60913D60913D60913D60913D60812D60E18D81B25
          DA1C25D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91B24DA1C26
          F01B22BD171A3D16180F181C1F06080F2D2D33DADADAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFDFEFDFFFFFFE7E7F73C46D70B14D91B24DB1B25
          D91B25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D9
          0711D6262ED6C8C9F1FFFFFEFFFFFEFDFEFEFEFDFDFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFB5B5B42727180208611922E81D25E01B
          25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1D25DA1A23DA1B24DA1B25DA1C
          23DA1A26D90811D6656CE1FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF2E2F3406070A1717081C21
          941E27F61C25D81D26DA1D26DA1C25DA1B23D9151FD8050FD52126D6C3C6F1FF
          FFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFFFFFFBBBBBE13171D1112101618191B22BC1C25E51C25D91922
          D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF161A1E0B0E121518021C22971E27ED
          1C25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25
          DA1D25DA1D25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C24D91923D91C25E81C23CB181A4715180E16191E01020965
          6567FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFEFFFFFE343B
          D60510D51B23D91C25D81C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C23DA1C25D90710D72A32D6D6D7F3FFFFFFFFFFFEFDFDFDFDFDFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFFFFB1B2B410110908
          092A1D28EE1B24E11C24D81B25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C23DA1A26D90811D6656CE1FDFEFEFFFFFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFF
          FF2E2F3405060A1617071B20941D26F61B24D81C25DA1C25DA1C25DA1C25DA1B
          25D91B24DA040ED57278DFF7F7FBFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFC9CACC26282F0D0E011618
          2E1E27EB1B23DD1C25D91922D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF151A1D
          0A0D111517011B21961D26EC1B24DA1C25D91C25D91C25D91C25D91C25D91C25
          D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24DA1B24D91C25D91A25E81D
          24D116172E181A0F0F1419000307D7D6D7FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFE585EDC0006D41B24D91C25D91C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1B24D81B24DA1219D82A32D7D8DAF5FFFFFFFDFE
          FCFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFF
          FFFFBDBEC10A0B090609111D24B61C25EC1A23D71C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C23DA1A26D90811D6
          656CE1FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFFFFFFFFFFFF2E2F3405060A1617071B20931D26F51B24D71C
          25D91C25D91C25D91C25D91C24D91B26D90A13D66469DDF2F3FAFFFFFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFF
          FFACADAB050A001215201D24C51A25E71B23D81C25DA1922D9111AD3999DE5FF
          FFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFFFFFFFFFFFF151A1D0A0D111417011B21961D26ED1B24DA1C25D91C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25D91C23D81D24EA1D25D914160E15181505080E626667FFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFABAEEB0B14D61620D81C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1A24DA1D26D9040D
          D2A3A8E9FFFFFFFFFFFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFDFFFFFFF9F9FA3E3F440000001A1C4B1D26E41A24DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C23DA1A26D90811D6656CE1FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF2E2F3405060916
          16061A20991D27FE1B25E01C25E21B25E11C25E21C25E31E27E61721E7020CD6
          9B9EE9FFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFDFDFDFDFDFDFFFFFFFBFBEA4B4D4B02063F1C23BD1B26EA1C24D81B25D91C
          25DA1922D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF151A1D0A0D111517001B22
          9F1D27FC1C25E81C25E81C25E81C25E81C25E81C25E81C25E81C25E81C25E81C
          25E81C25E81C25E81C25E81C25E81C25E91C24DE1C25D81C24DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24D81B25DA1D26F11A1F81
          15150B1114171A1F22FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFAFAFB575EDF07
          12D61C25D91B25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1B25DA1D26DA0913D84048D7EDEEF9FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFB8B8BB000000151712
          191E7A1C25E81B25D91B25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C23DA1A26D90811D6656CE1FDFEFEFFFF
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFF
          FFFFFFFFFF2F303406070A18190C1C21901E28EC1D25CF1D25D01B25D11A23CF
          171FC60912B10002955C61C4ECECFAFFFFFDFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFF4F4F56669A0050C8F1A24D81B
          25E51B23D81C25DA1C25DA1C25DA1922D9111AD3999DE5FFFFFFFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFF
          FF13181A070A0F14150B151B62191E98171C8D171D8C171D8D171D8D171D8D17
          1D8D171D8D171D8D171D8D171D8C171D8C171D8C191F8E191F8E181D831B22C6
          1B25E11C23D81B25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25D81C25E31C24CD16192C14171401050CFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFCED0F22D35D7131CD81C25D81A25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1B24DA2028DA0000D09DA1EBFFFFFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFF
          F8F9FA6F7176000000181B17191F961C25E51C25D91B25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C23DA1A26
          D90811D6656CE1FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFDFDFDFFFFFFFDFDFE1A1B1F000000000000000009000010
          00000C00000C00000F00000B030611292D30989892FEFEF5FFFFFFFEFEFDFEFE
          FEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB5B8EC3A
          41D80610D61B24E21C25DE1B23D91C24D91C25DA1C25DA1C25DA1922D9111AD3
          999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFFFFFFFFFFFF00030800000000010800010000000000000000
          0000000000000000000000000000000000000000000000000000000000030501
          13150F161A121415001B22A71D26EF1C24D81A25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91A25DC1C25E0191D6713140C080B
          11FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFB0B3F0101AD41721DA1C25D81C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25DC00
          00CCBFC2F0FFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFFFFFFDFE0E0313238080D0E1719141B21981C25E51B25
          D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C23DA1A26D90811D6656CE1FDFEFEFFFFFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFDFCFD929292
          7777797D7F827E7F7E7D7E7B7F807E8384829A9A98C4C5C0E9E8E4FFFFFFFFFF
          FFFFFFFFFEFEFDFDFDFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFF9F9FAF1F1EFCF
          D0D68184DA2630E2000BE00E18E11D26DE1B25D81C24D91C25DA1B25DA1C25DA
          1C25DA1C25DA1922D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFFFFDBDBDBD9D9DBDC
          DDDDDCDCDDDBDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDBDCDFE0E1CCCCCC2324240C0D0F1417001B22AA1D26EF1B24D81C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1A23
          D91C27E9171F89090A004A4C4FFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFAEB0F2
          0C17D71A23D91C25D81C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25D91C25DC0001CDC1C2F0FFFFFFFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFD8D9DA1F22250F11
          15171913191F801D25E71925D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C23DA1A26D90811D6656CE1FD
          FEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDDDDEDEAC
          ACAE7E7E804244481F202103060B00021E0C1149181D7A1A22AD1B24D91B25E6
          1C25DB1B25D91A25D91C25DA1C25DA1C25DA1922D9111AD3999DE5FFFFFFFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFD
          FDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDECEC26262F0A0B141517
          061A22AB1D26EE1B23D71C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C24D71C26EA161D8E000000AEB1B0FFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFB8BBF11721D71921D81C25D91C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24D91E27DB0000CDB4B7ECFFFFFF
          FDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFFFFFFDCDDDE2A2D320B0F14171912171A511E26E81A24D91B24DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          23DA1A26D90811D6656CE1FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFDFDFDFDFEFEFEFEFEFEFEFD
          FDFDFEFEFEFDFDFCE2E3E3B8B8B99090926263663B3C3E14151B000200080A01
          16190F16191B171A4A1A21A61C25E61B25DE1B24D81C25DA1C25DA1C25DA1922
          D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFEFEFF8282DAC0C13A51B21A31B23CE1B25DE1C23D81C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B25D91D26E7080E722E
          2F25EFF0F0FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFD8D9F3333CD91118D81C25
          DA1A24DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24DA
          1E28DA0004D5777CE1FFFFFCFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFF0F0F057595D000108181B151617221C
          24C41C25E51A23D81C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C23DA1A26D90811D6656CE1FDFEFEFFFFFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFE
          FFCACACBBEC1C1C5C5C1C8C9E4D2D3FADEDFF4F0F0FAFEFEFCFFFFFFFFFFFFFF
          FFFFFFFFFEFEFDFDFDFEFDFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFEFEFE
          F3F3F4D9D9DA8F90921F2026000002111514171910141715181E811C25E51A23
          DB1C25DA1C25DA1C25DA1922D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFC4C4C5
          C2C2C3C4C5BFC6C7E2C7C9F7C5C8F3C6C8F2C6C8F2C6C8F2C6C8F2C6C8F2C6C8
          F2C6C8F2C6C8F2C5C8F2CACCF3B6BAF1252DE1101AE21D26E41C25DD1B25D91C
          24D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B
          24D81C27DF121CD6080C4CA9A99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFF6D72E1050FD31C25DA1A25DA1C24DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C24DA1C25DA1822DA0D16D2CDD0F3FFFFFFFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFAA
          AAAD000000181C2217180B161A491C27F71B24DC1B25D91B25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C23DA1A26D90811D6
          656CE1FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFFFFFFFEFBFE1F1F210000000000000008870510F3070FD20A
          13D5121CD43138D8575DDF999AE9EFF1F9FFFFFFFEFEFEFEFEFEFEFEFEFDFEFD
          FEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8D0F12151014
          1B16191715160B1A229E1C25E51A23D81B25D81C25DA1922D9111AD3999DE5FF
          FFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFFFFFFFFFFFF000206000000000000010788020DE8000BD5000BD4000B
          D5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000AD50510D51821D81C
          25D91C25D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1B25D91D25D81621E4090FAA8C8E89FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFD5D7F31E27D60F18D81C26DA1C24DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24DA1D27D8060F
          D85E65DDF4F4FAFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFDFDFDFFFFFFEAEBEB22272B04060A181A1B14170B191F8A1D26F0
          1B24DE1A25D81C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25D91C25D9
          1C25D91C23D91A26D80811D6656CE1FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF2D2E3305050816
          16071B20931C26F61922D71821DA151FD90D17D8040FD50002D2323AD5DCDEF5
          FFFFFFFDFDFDFEFEFEFEFEFEFDFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFE
          FEFFFFFFFFFFFFA4A5A700030A16191C16190F161B561C24E81A24DA1B24D91C
          25DA1922D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF15191D0A0D111417011B21
          971D26ED1B24DA1B24DA1B24DA1B24DA1B24DA1B24DA1B24DA1B24DA1B24DA1B
          24DA1B24DA1B24DA1C25DA1C25D91C25D91C25D91C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B25D81820DA000BD4868ABF
          FFFFF8FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFEFFFFFFA0
          A6EA0006D21620DA1C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C24D81922D90C15D48487E5FFFFFFFFFFFEFDFDFDFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFA6A8A9050609
          0E1117171A171617191920931C26EB1A25E11B24D71B25D91C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B25DA
          1B24D91C25DC1B25DD1B25DD1B25DD1C23DD1B26D90811D6656CE1FDFEFEFFFF
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFF
          FFFFFFFFFF2E2F3405060A1617071B20941D26F61C25D81C25DA1C25DA1C25DA
          1D26DA1B26DA0000D18489E4FFFFFDFEFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFEFEFE3C3E42080A1017191117
          1B4A1B24E71A24DA1B23DA1C25DA1922D9111AD3999DE5FFFFFFFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFF
          FF151A1D0A0D111517011B21961D26ED1B24DA1C25D91C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1922D9010CD46168DCFFFFFEFFFFFFFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFDFFFFFEFFFFFF696EDF0004D2151FD91D26D91C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24D91C25D9151ED90B15D485
          8CE4FFFFFFFFFFFFFEFEFEFDFDFEFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFFFFFFFEFEFE7B7C7F0000010F1218171A17151718191F7A1C26EA1926
          EC1B23D91C25D91C25D91C25D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1A24D91C25E71D26E81C26E21C26E51C25E41B25E21B25
          DB0810D4656CE0FDFEFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF2E2F3405060A1617071B20931D26F5
          1B24D71B25D91B24D91B24D91B24D91F28D8010AD8666EDFF6F7F7FFFFFFFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF
          FFFF7F8084000000151809191F7B1A24E61C25D81A23D91C25DA1922D9111AD3
          999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFDFFFFFFFFFFFF151A1D0A0D111517011B21961D26EC1B24D91C
          24D91C24D91C24D91C24D91C24D91C24D91C24D91C24D91C24D91C24D91C24D9
          1C24D91C24D91C24D91C24D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1A23DA0008D3474FDBEFF0FAFFFFFFFEFEFEFDFDFDFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFFFFFFFFFFFE7D81E3
          0711D3121BD81C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1B25D81720D90004D06B6FDFEEEFF9FFFFFFFFFFFDFEFEFEFDFDFD
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF8A8A8C05060C080C
          13151818161709171A331A22B61D26E91C25E71C25DF1C25DC1C24DA1B24D91C
          25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D91C25D9
          1C25D91C25D91C24D91C25D91C25DA151ED90D16D80E17DF0B13A0060B280C0F
          1B16192C1719241519291C25CF0911E2656CDFFDFEFFFFFFFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF2E2F34
          05060A1617071B20981D27FE1C25DF1C25E11C25E21C26E31C26E41F26E60000
          D97F84E3FFFFFCFEFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFFFFFFFFFFFF686A6B000000171A3C1C24D11C24E01A25D8
          1C25D81C25DA1922D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF151A1D0B0E1215
          18001C229F1D28FB1C26E81C26E71C26E81C26E81C26E81C26E81C26E81C26E8
          1C26E81C26E81C26E81C26E81C26E71C26E71C26E71C26E61B24DC1B24D91C24
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1720D8020DD3565DDCF0F1FAFFFF
          FFFEFDFCFDFDFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FDFDFDFDFDFDFFFFFFFFFFFE9A9EE81923D50A12D61A23DA1C25D91C25D91C24
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B25D91D25D91C25DA0008D4323BD8
          B1B4EDF7F8FCFFFFFFFFFFFFFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFDFD
          FDFFFFFFFFFFFFBFC0C12C2F3304080C080C1112150B16190D191C511A209C1B
          23CC1C24E11C24E61B24E41C25E21C25DE1C25DC1B25DB1C25DA1C25DA1C25D9
          1C24D91C25D91C25D91C25DA1C25DB1C25DD1D26E11922E10A13D82B33D96B72
          E76B70C567676A6C6C605155500E110F15170B1718151B26D10911E3656CDFFD
          FEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFFFFFFFFFFFF2D2E3304060816160A191E7E1A23D21821B7191FB6171F
          B31219AA0C149E000687292F9CD7D8F1FFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFFFFE1E1D70E1008121645
          1B23C91C25E71B25D81C25DA1C25DA1C25DA1922D9111AD3999DE5FFFFFFFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFF
          FFFFFFFFFF0E121503040A0D100713165A11198B10178011177F111780111780
          11178011178011178011178011178011178011178011177F131981191E871A1F
          86171E861B24CE1B24DE1B23D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24DA1C25DA1B24DA0E18D70710
          D47B80E4FCFAFDFFFFFFFDFDFDFDFDFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFDFDFDFFFFFEFFFFFFC5C8F1343C
          D9050FD3121BD81D26D91C24D91B24DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1B25DA1C25D91B25DA0C16D7131CD5565EDEC1C3F0FDFEFCFFFFFFFFFFFFFEFE
          FDFDFDFDFDFDFDFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFE5E5E68B8D8E32343906
          080F0205070C0E05131614171B33191E671B21931C24B51C23CC1B25DD1C25E5
          1B25E71C26E71C25E91C26EA1C25EA1C26EB1D26EA1D27E91C25E61720DD0A13
          C4070FAD434AC3C6C7F1FFFFFEFFFFF7FFFFFBFFFFFFC1C2C405080E10131218
          1A261926D30811E2656CDFFDFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFEFDFE21222600000007090E0508
          120609190709170709150E101A20222938393D6E706DD6D6CDFFFFFFFEFEFEFD
          FEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFDFDFDFFFFFFFFFFFF
          EBEADD55576B080D741D26DA1B25E51C24DA1B25D91C25DA1C25DA1C25DA1922
          D9111AD3999DE5FFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFF1E20231312161D20251B1D1C1B1D16
          1B1D171B1D171B1D171B1D171B1D171B1D171B1D171B1D171B1D171B1D171B1D
          171C1F181B1D1713161016170F1315101C24BC1C25E71A24D81C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1D25
          D9161FD9050FD5252DD89E9FE8FFFFFFFFFFFFFDFDFEFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFE
          FEFDFDFDFFFFFEFFFFFFE6E7F97E81E3111BD5020CD51B24DA1E26DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA161FD80C15D7151E
          D74F56DBAAADEBF9F9FCFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFDFDFDFDFDFE
          FEFEFFFFFFFFFFFFEAEAEAAFB0B1505156191B20010407000000000000030604
          0A0E120F112610163C131751141863141A71141A78141A7C12197B0F1477060C
          6B00055C000249070C3E3A3D5A9D9FA6EEEFECFFFFFFFFFFFDFFFFFFFFFFFFFF
          FFFFB9B9B90307080F12041719191926D20811E3656CDFFDFDFFFFFFFEFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFEFF
          FDA0A1A28C8D8F95989A9699979E9E9AABABA8B9B9B6C5C5C1DDDDD7E9E9E5FE
          FEFBFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFFFEFE
          FFFFFEFFFFFFFFFFFFC6C7EC4148BF0A14C11B25E51C24DF1B25D91C25D91C25
          DA1C25DA1C25DA1C25DA1922D9111AD3999DE5FFFFFFFEFEFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFD7D7D8
          D6D6D7D9D9DAD8D9D9D8D9D8D8D9D8D8D9D8D8D9D8D8D9D8D8D9D8D8D9D8D8D9
          D8D8D9D8D8D9D8D8D9D8D8D9D8DFE0E0A7A7A81313121315151417181C25BE1D
          25E71A25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25D90813D6040ED36167DED5D7F5FFFFFFFFFFFDFCFDFCFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFD9DCF558
          5FDE000AD20A14D81720D91B24DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1821D90C15D7030FD4222BD7787DE3C3C7F0F7F8FBFF
          FFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFF4F3F3
          C5C6C793969961626647494B2C30301B1E1C16171412150E10120A1012071114
          0914150819190D272A1B45483A6A6B5F9D9E93D8D9CFFFFFFFFFFFFFFFFFFFFE
          FEFEFDFDFDFEFEFDFFFFFFFFFFFFB2B3AE03070E11132B1A1E611A25D80810DC
          656DDFFDFEFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFEFFFFFEFFFFFE
          FFFFFEFFFFFEFFFFFFFFFFFFFEFDFECACCF15D64DC0913D50C16DB1B24DE1C25
          DA1C24D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1922D9111AD3999DE5FF
          FFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFDFDFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C612
          111113140D1315121B24BC1C25E71A25D91C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1922D90E17D7020CD52F37D8C8C9EFFFFFFFFF
          FFFFFFFFFEFDFDFDFDFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFD
          FDFDFDFDFEFEFEFEFFFFFFFFFFFFBDBFEE535ADE1822D70B14D6131CD81B24D9
          1D26DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91B24DA12
          1BD8010CD40510D5242DD65961DF9DA0EBCED1F3E3E4F8F1F2FBFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F8F7F3F3
          F2EBEBEBE5E6E7E3E4E5E9E8EAF0EEF0F6F6F7FEFDFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFAAACDF0A15CC
          171FE31C26EB1B26DB0710D46A71E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFCFCFDF3F3FCE6E7FAD9DAF5B0B2EE7076E3343BD80812D4050F
          D61821DA1D26D91C25D91C24D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          24DA1822D9111AD3A0A4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFCBCDED1218B4151EBA1A23B91B24D61C25DB1A25D91C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA151FD70C16D6121AD8434BDCA7
          ABEBFFFFFDFFFFFFFFFFFFFEFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFEFFFFFFFFFFFC
          BDC1F06C71E21D26D6050FD40E17D71A24D91D26D91C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1922D9111AD8070FD50611D51922D7
          3139D95358DF777CE59499EAB0B2F0C2C4F2D6D9F6E4E5F8ECEDFAF7F7FBFFFF
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFFFFFEF9F9FBEFEFFAE6E7F9DDDFF6CFD2F5BDBEF1AAAEEE
          8A8FE76F76E43B43DE151EE01A23DD1C24DB1B25D80E17D64D53DDB3B6F0B3B6
          F0B2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2
          B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EF
          B2B5F0B1B4EFADB1EDA2A6EC9599EB8487E86E73E3565CE03A42DC232AD80C15
          D50610D60D17D71821D91D26DA1C25DA1B25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C23DA1923D9151DD56F75DFB9BBF1B2B5EFB2B5EF
          B2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5
          EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2
          B5EFB2B5EFB2B5EFB2B5EFB2B5EFB2B5EFB8BAF08D91EC1620E01821E61C25E5
          1B25DB1C25D91B25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1D26DA1D26DA101AD8050FD617
          20D64D55DDAFB1EFF3F4FBFFFFFFFFFFFFFDFDFDFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFDFDFDFDFDFEFFFFFEFFFFFFFDFCFDD3D4F38287E62C36D70009D40710
          D51620D91B24D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1D25D91A23D9151ED9111AD80E17D70D17D7111AD7151ED71F28D82B33
          DA353DDA4249DD5157E05F65E26970E37077E3767AE58186E68488E58388E582
          87E57F84E67B81E6777CE57278E46E74E4676DE05D64E2535AE0464CDE3841DB
          2F37DA2630D91B23D7141CD7101AD80D16D7121CD81C24D91B25D91C25D91B25
          D91A23D91922D81820D8151FD7151FD8151FD8151FD7151FD8151FD7151FD715
          1FD8151FD7151FD8151FD8151FD7151FD8151FD7151FD7151FD8151FD7151FD8
          151FD8151FD8151FD7151FD8161FD8151FD8141ED7131CD7121BD80F19D70E17
          D70D17D70F18D8131CD81922D91C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C24DA1B25D91B23D9
          1821D8161FD8151FD7151FD8151FD7151FD7151FD8151FD7151FD8151FD8151F
          D7151FD8151FD7151FD7151FD8151FD7151FD8151FD8151FD7151FD8151FD715
          1FD7151FD7151FD8151FD7151FD7151FD8151FD7151FD8151FD8151FD71620D8
          1921D71A23D91B24D81C24D81C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91D26D91720D90A
          14D70007D31F27D76E74E1C4C6F0F1F2FAFFFFFFFFFFFFFEFEFDFDFDFDFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFEFEFEFFFFFEFFFF
          FFFFFFFFFAFCFCBBBFEF4E54DE151DD6040DD50B14D81820D91A24D91C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B24
          DA1A23D91822D9161FD9151ED9131DD9111AD71019D70F18D70D16D70C15D70B
          16D70B14D60B14D60A14D80B14D60B15D60A15D60B16D70C15D70C16D70D16D7
          0F18D71019D7111AD7121BD9141ED9151FD91820D91922D91A23D91B24DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1A24D91822D91822D91822D91822D918
          22D91822D91822D91822D91822D91822D91822D91822D91822D91822D91822D9
          1822D91822D91822D91822D91822D91822D91822D91822D91822D91822D91922
          D91922D91A23D91A24D91B24DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1A23D91821D91822D91822D91822D91822D91822
          D91822D91822D91822D91822D91822D91822D91822D91822D91822D91822D918
          22D91822D91822D91822D91822D91822D91822D91822D91822D91822D91822D9
          1822D91822D91822D91822D91922D91B24DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1A23D917
          20D90F18D6030ED50F17D54149DB9FA3EAFAFBFCFFFFFFFFFFFFFFFFFEFEFEFE
          FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFDFDFEFDFDFDFEFEFDFEFEFEFFFFFFFFFFFFFFFFFFE3E3F69DA0E95A
          62E01F27D60D16D60D17D7111BD81721D91B24D91C25D91C25D91C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B24DA18
          22D9131CD80D16D70C17D61A23D7454DDC9096E7D6D7F4FFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFDFDFDFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFD
          FDFDFFFFFEFFFFFFFFFFFFFFFFFED3D5F5989DEA6167E13239DA121CD60813D5
          0B15D6141DD81B24D91D26DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1D26DA1C
          25D9161FD90D16D80814D61019D6272FD8585EE08F94E8CACBF3F9FAFCFFFFFF
          FFFFFFFFFFFEFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFDFDFDFEFEFEFFFFFEFFFFFFFFFFFF
          FAFAFDE1E2F7B3B6EE7D81E6434ADD1821D6000BD3010BD50F18D71922DA1C25
          DA1D24DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25D91C
          25DA1923DA101AD9030DD5010AD30F19D63B42DB7276E3ABADECD6D7F6F6F6FC
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FDFDFDFDFDFDFDFDFDFEFEFEFFFFFEFFFFFDFFFFFFFFFFFFFDFCFDE6E6F7A6AA
          EB656DE02B34D90B15D4010AD40510D60E17D8141DD91822D91A23D91B24DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B24DA1B24D918
          23D9161FD80E19D80811D6020BD5060FD4252DD75A62DF999CE9D9D9F5FDFDFC
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFDFDFDFDFDFEFEFE
          FEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEAF8ADAEEC797DE34C53DE2C
          35DA1821D60F18D70E17D80F18D6121BD8161FD91923D91B24D91C25DA1C25DA
          1C25D91C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1A23D91620D911
          1CD80F18D80E17D60F18D8151ED7262DD7474EDD6E75E2A0A5EADADCF5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFDFDFEFDFDFDFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFCE2E2F8BEC0F2999DEA7176E34F55DF2D35D91A24D8
          0E15D60913D50A13D60E17D7121CD7171FD91A23DA1C25DA1D26DA1D26DA1C25
          DA1C25DA1C25DA1C25DA1B25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1D26DA1C25DA1A24DA1821D9131CD90F19D809
          13D60A13D60B16D61720D72831D9464DDD6C71E39296E9B5B8EFD8D9F5F8F8FB
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDF1F1FBDBDDF7C7C9F3AAABED8286E6585FDE3942DC2128D7121BD60610
          D5040ED50811D60A14D6121BD91821DA1A23DA1D26DA1E26DA1D26DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1D25DA1D26DA1D26DA1A23DA1821DA141DD80D16D80812D60510D605
          0ED50E17D51D27D8343DDB5259DF767AE5A4A9EDC2C3F1D8D9F6EBECF9FEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFE
          FDFDFDFDFDFDFEFEFDFEFEFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFBFB
          FDF5F6FCEAEBF8CACDF1A3A7EC8085E7565EE03D46DB1D27D70913D5030DD400
          08D30008D4050FD60C17D9111AD9141FD81820D91A23D81A23D91B24D91B24DA
          1B24DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B24DA1B24DA1B24D91A23
          D91A23D91821D9151ED8121CD80F17D90611D80008D50006D3030CD40811D417
          20D5343BDA5158DF787FE59C9EEBBDBFF0E7E8F8F5F5FCFAFBFEFFFFFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFDFDFEFDFDFDFDFDFDFDFD
          FDFDFDFEFEFEFEFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFDFBE8EBF8CED1F4ADAFED9094E96F73E44F55DD3D44DC2C33D91C26D7
          161ED6131CD81019D70D18D70E17D70F18D71019D70F1AD6121BD8131CD8151E
          D8151ED9161FD91721D91922D91A23DA1B24DA1B24DA1B24DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA
          1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25
          DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C
          25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1C25DA1B24DA1B24DA1B24DA
          1A23DA1922D91821D9161FD9151ED9151ED8131CD9121BD81019D80F19D70F18
          D70E18D70E17D70F18D7111BD8161ED81B23D72731DA3940DB4A52DC686FE08A
          8EE8A2A6EBC8CAF3E6E7F7F8FAFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFFFFFEFEFEFEFEFEFDFDFDFEFDFDFDFDFDFDFDFDFDFDFDFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFFFFFFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFEFDFDFDFD
          FDFDFDFDFDFDFDFDFEFEFDFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFDE8E9F8D3D5F4C4C6F3B4B5EF9A9EEA898FE67A7FE5676DE3555A
          E04951DD3C45DC343BDB272ED91E27D71A24D8151FD8121BD70F18D70A15D60A
          14D70B14D70A13D60A14D70B15D70A14D70B14D70B15D70D16D70E18D71019D8
          121CD8141DD9141ED9161FD91720DA1821DA1A22DA1A23D91A24D91A24D91C24
          D91C24DA1C25DA1B25DA1B24D91A23D91A23D91922DA1821DA1720DA171FD915
          1ED9141ED8121CD81019D80E18D70D17D70B15D70B14D60B15D70B14D60B14D6
          0B14D70A14D60A14D70B14D60D17D6111AD7151ED81922D81C27D7242DD72D36
          DB3B44DC474EDE5158DF6066E1777CE4878CE7979BEAACAFEEC2C3F3D1D3F4E3
          E4F7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFE
          FEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFEFEFDFEFEFDFEFEFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEF9FAFCF3F3FBEDEDFBE4E5F8DBDCF7D0D2F6CACCF2C3C5F3B5
          B8F0A9ACEF9CA0EB9296E98D92E97F85E77278E4676DE25F65E2545BE04E54DE
          484FDD4048DD3942DB343ADA2A34D8242DD81F27D91B23D61821D5131DD60F16
          D50D15D50A13D60811D5040ED4040DD5040ED5040ED50811D50A14D50B15D50C
          17D6121CD51821D51A23D51D26D8232BD92932D9323BDA3940DA3F47DC474FDD
          4E55DD5258DF5C62E2656CE16F75E37B82E68A8EE99195EA989DEAA5AAEDB3B6
          EFC1C3F1C9CBF3CED0F5D7D8F6E1E4F8ECECFAF1F1FBF7F7FCFFFFFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFEFEFEFEFDFEFEFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFEFEFCFCFEFBFBFDFAFAFDF9F9FDF7F7FDF5F6FCF4F4FCF2F2FCF0F1FCEFF0
          FCEEEFFBEEEEFBECEDFBEBECFBEBEBFBEAEBFBEAEBFBE9EAFBE9EAFBE9EAFBE9
          EAFBEAEBFBEAEBFBEBEBFBEBECFBECEDFBEEEEFBEEEFFBEFEFFCF0F0FCF2F2FC
          F4F4FCF5F6FCF6F7FDF8F9FDFAFAFDFAFAFDFCFCFEFDFEFEFFFFFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFF00}
        mmHeight = 13229
        mmLeft = 207169
        mmTop = 1852
        mmWidth = 46038
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText101'
        DataField = 'DATA_FATURA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 5027
        mmLeft = 164571
        mmTop = 15346
        mmWidth = 93134
        BandType = 0
      end
      object ppFatura: TppLabel
        UserName = 'Fatura'
        AutoSize = False
        Caption = 'FACTURA COMERCIAL N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5027
        mmLeft = 106627
        mmTop = 4498
        mmWidth = 55827
        BandType = 0
      end
      object ppDtFatura: TppLabel
        UserName = 'DtFatura'
        AutoSize = False
        Caption = 'FECHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5027
        mmLeft = 106627
        mmTop = 15346
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText8'
        DataField = 'NOME'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 21960
        mmWidth = 127529
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText11'
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 25400
        mmWidth = 107950
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText13'
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 28575
        mmWidth = 107950
        BandType = 0
      end
      object ppAEmpresa: TppLabel
        UserName = 'AEmpresa'
        AutoSize = False
        Caption = 'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 21971
        mmWidth = 4233
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText19'
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 21960
        mmWidth = 96044
        BandType = 0
      end
      object ppConsig: TppLabel
        UserName = 'Consig'
        AutoSize = False
        Caption = 'CONSIGNATARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 21960
        mmWidth = 25665
        BandType = 0
      end
      object ppQtde: TppLabel
        UserName = 'Qtde'
        AutoSize = False
        Caption = 'CTD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 37042
        mmWidth = 16140
        BandType = 0
      end
      object ppCod: TppLabel
        UserName = 'Cod'
        AutoSize = False
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 21960
        mmTop = 37042
        mmWidth = 26194
        BandType = 0
      end
      object ppDesc: TppLabel
        UserName = 'Desc'
        AutoSize = False
        Caption = 'DESCRIPCI'#211'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 52917
        mmTop = 37042
        mmWidth = 124354
        BandType = 0
      end
      object ppPesoLiq: TppLabel
        UserName = 'PesoLiq'
        AutoSize = False
        Caption = 'PESO NETO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 178054
        mmTop = 37042
        mmWidth = 26755
        BandType = 0
      end
      object ppPesoBruto: TppLabel
        UserName = 'PesoBruto'
        AutoSize = False
        Caption = 'PESO BRUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 204809
        mmTop = 37042
        mmWidth = 25908
        BandType = 0
      end
      object ppPrecoUnit: TppLabel
        UserName = 'PrecoUnit'
        AutoSize = False
        Caption = 'PRECIO UNIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 231183
        mmTop = 37042
        mmWidth = 26712
        BandType = 0
      end
      object ppTotalValor: TppLabel
        UserName = 'TotalValor'
        AutoSize = False
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 257430
        mmTop = 37042
        mmWidth = 23029
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NR_FATURA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 5027
        mmLeft = 164571
        mmTop = 4498
        mmWidth = 41010
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CIDADE_PAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 28575
        mmWidth = 101600
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText107'
        DataField = 'ENDERECO_NUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 25400
        mmWidth = 101336
        BandType = 0
      end
      object ppProcesso: TppLabel
        UserName = 'Processo'
        AutoSize = False
        Caption = 'EMBARQUE N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 5027
        mmLeft = 106627
        mmTop = 10054
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'CalcProcesso'
        DataPipeline = ppBDE_Processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Processo'
        mmHeight = 5027
        mmLeft = 164571
        mmTop = 10054
        mmWidth = 41275
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 258488
        mmTop = 16087
        mmWidth = 20638
        BandType = 0
      end
      object ppPagina: TppSystemVariable
        UserName = 'Pagina'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 130704
        mmTop = 30163
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NOME'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4995
        mmLeft = 4498
        mmTop = 2117
        mmWidth = 96309
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText1'
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4763
        mmLeft = 4498
        mmTop = 7144
        mmWidth = 96573
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText7'
        DataField = 'END_CIDADE_UF_CEP'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4498
        mmLeft = 4498
        mmTop = 11906
        mmWidth = 99748
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Tel.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 16404
        mmWidth = 7408
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText29'
        DataField = 'NR_TELEFONE'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4233
        mmLeft = 12435
        mmTop = 16404
        mmWidth = 25823
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Fax.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 39370
        mmTop = 16404
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText31'
        DataField = 'NR_FAX'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4233
        mmLeft = 48683
        mmTop = 16404
        mmWidth = 25823
        BandType = 0
      end
      object ppTipo: TppLabel
        UserName = 'Label1'
        Caption = 'ORIGINAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 264584
        mmTop = 1852
        mmWidth = 16669
        BandType = 0
      end
      object ppRef: TppDBMemo
        UserName = 'Ref'
        CharWrap = False
        DataField = 'CalcRef'
        DataPipeline = ppBDE_Ref
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppBDE_Ref'
        mmHeight = 3683
        mmLeft = 52652
        mmTop = 42333
        mmWidth = 124884
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 178065
        mmTop = 42333
        mmWidth = 26755
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 204788
        mmTop = 42333
        mmWidth = 25908
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'DBText48'
        DataField = 'AP_MOEDA'
        DataPipeline = ppBDE_Moeda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDE_Moeda'
        mmHeight = 3704
        mmLeft = 231246
        mmTop = 42333
        mmWidth = 26712
        BandType = 0
      end
      object Calc_Decl_Ini: TppDBMemo
        UserName = 'Calc_Decl_Ini'
        CharWrap = False
        DataField = 'CalcDeclaracao'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 47096
        mmWidth = 124884
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText18'
        DataField = 'AP_MOEDA'
        DataPipeline = ppBDE_Moeda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDE_Moeda'
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 42333
        mmWidth = 22225
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape4'
        Pen.Color = clWhite
        mmHeight = 3175
        mmLeft = 52388
        mmTop = 42598
        mmWidth = 123825
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText35'
        DataField = 'NR_CUIT'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 3175
        mmLeft = 10319
        mmTop = 32015
        mmWidth = 28310
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText38'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 4191
        mmLeft = 84138
        mmTop = 17992
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText36'
        DataField = 'NR_CUIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        mmHeight = 3175
        mmLeft = 171186
        mmTop = 32015
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
      DataPipeline = ppBDE_ProcI
    end
    object ppFooterFatura: TppFooterBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 88106
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape3'
        mmHeight = 28840
        mmLeft = 2117
        mmTop = 17198
        mmWidth = 277813
        BandType = 8
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        mmHeight = 36788
        mmLeft = 211138
        mmTop = 0
        mmWidth = 69300
        BandType = 8
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        mmHeight = 27781
        mmLeft = 2117
        mmTop = 36534
        mmWidth = 139171
        BandType = 8
      end
      object ppShape10: TppShape
        UserName = 'Shape7'
        mmHeight = 27781
        mmLeft = 140494
        mmTop = 36534
        mmWidth = 139954
        BandType = 8
      end
      object ppShape12: TppShape
        UserName = 'Shape10'
        mmHeight = 36788
        mmLeft = 2117
        mmTop = 0
        mmWidth = 209286
        BandType = 8
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        ShiftWithParent = True
        mmHeight = 22479
        mmLeft = 2117
        mmTop = 64008
        mmWidth = 139150
        BandType = 8
      end
      object ppShape15: TppShape
        UserName = 'Shape8'
        mmHeight = 22479
        mmLeft = 140494
        mmTop = 64008
        mmWidth = 139954
        BandType = 8
      end
      object ppPaisOrigem: TppLabel
        UserName = 'PaisOrigem'
        AutoSize = False
        Caption = 'PA'#205'S DE ORIGEN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 5038
        mmWidth = 35719
        BandType = 8
      end
      object ppDBText75: TppDBText
        UserName = 'DBText32'
        DataField = 'PAIS_ORIGEM'
        DataPipeline = ppBDE_Verif_Pais_Item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Verif_Pais_Item'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 5038
        mmWidth = 41540
        BandType = 8
      end
      object ppPesoLiqTotal: TppLabel
        UserName = 'PesoLiqTotal'
        AutoSize = False
        Caption = 'PESO NETO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 9017
        mmWidth = 35719
        BandType = 8
      end
      object ppPesoBrutoTotal: TppLabel
        UserName = 'PesoBrutoTotal'
        AutoSize = False
        Caption = 'PESO BRUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 12954
        mmWidth = 35719
        BandType = 8
      end
      object ppCubagem: TppLabel
        UserName = 'Cubagem'
        AutoSize = False
        Caption = 'CUBAJE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 16933
        mmWidth = 35719
        BandType = 8
      end
      object ppViaTransp: TppLabel
        UserName = 'ViaTransp'
        AutoSize = False
        Caption = 'TRANSPORTE VIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 20913
        mmWidth = 35719
        BandType = 8
      end
      object ppDBText79: TppDBText
        UserName = 'DBText79'
        DataField = 'NM_VIA_TRANSPORTE'
        DataPipeline = ppBDE_ViaTr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_ViaTr'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 20913
        mmWidth = 41540
        BandType = 8
      end
      object ppLocalDestino: TppLabel
        UserName = 'LocalDestino'
        ShiftWithParent = True
        Caption = 'LOCAL DESTINO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 15875
        mmWidth = 29369
        BandType = 8
      end
      object ppDBText81: TppDBText
        UserName = 'DBText81'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Local1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        WordWrap = True
        DataPipelineName = 'ppBDE_Local1'
        mmHeight = 7673
        mmLeft = 116681
        mmTop = 15875
        mmWidth = 41275
        BandType = 8
      end
      object ppLocalOrigem: TppLabel
        UserName = 'LocalOrigem'
        ShiftWithParent = True
        Caption = 'LOCAL EMBARQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 23813
        mmWidth = 25665
        BandType = 8
      end
      object ppDBText82: TppDBText
        UserName = 'DBText82'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Local2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        WordWrap = True
        DataPipelineName = 'ppBDE_Local2'
        mmHeight = 7673
        mmLeft = 116681
        mmTop = 23813
        mmWidth = 41275
        BandType = 8
      end
      object ppNotif1: TppLabel
        UserName = 'Notif1'
        AutoSize = False
        Caption = 'NOTIFICAR (1)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3683
        mmLeft = 3440
        mmTop = 37846
        mmWidth = 21696
        BandType = 8
      end
      object ppDBText89: TppDBText
        UserName = 'DBText501'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDE_Doc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Doc'
        mmHeight = 3260
        mmLeft = 169334
        mmTop = 37835
        mmWidth = 30607
        BandType = 8
      end
      object ppDoctos: TppLabel
        UserName = 'Doctos'
        AutoSize = False
        Caption = 'DOCTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3683
        mmLeft = 143934
        mmTop = 37846
        mmWidth = 19844
        BandType = 8
      end
      object ppCopias: TppLabel
        UserName = 'Copias'
        AutoSize = False
        Caption = 'COPIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3683
        mmLeft = 143934
        mmTop = 51858
        mmWidth = 19579
        BandType = 8
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'TX_DECL_EXPORTADOR'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        ShiftWithParent = True
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 15621
        mmLeft = 3440
        mmTop = 65871
        mmWidth = 131784
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText98: TppDBText
        UserName = 'DBText98'
        DataField = 'VL_TOT_FOB'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 12435
        mmWidth = 39423
        BandType = 8
      end
      object ppDBText99: TppDBText
        UserName = 'DBText99'
        DataField = 'VL_FRETE'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 16404
        mmWidth = 39423
        BandType = 8
      end
      object ppDBText100: TppDBText
        UserName = 'DBText401'
        DataField = 'VL_SEGURO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 20362
        mmWidth = 39423
        BandType = 8
      end
      object ppDBText101: TppDBText
        UserName = 'DBText9'
        DataField = 'VL_TOT_MCV'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 251619
        mmTop = 24342
        mmWidth = 25400
        BandType = 8
      end
      object ppFrete: TppLabel
        UserName = 'Frete'
        AutoSize = False
        Caption = 'FLETE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 16404
        mmWidth = 22490
        BandType = 8
      end
      object ppSeguro: TppLabel
        UserName = 'Seguro'
        AutoSize = False
        Caption = 'SEGURO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 20362
        mmWidth = 22490
        BandType = 8
      end
      object ppAnalista: TppDBText
        UserName = 'Analista'
        DataField = 'NM_CONTATO'
        DataPipeline = ppBDE_CLiente_Contato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_CLiente_Contato'
        mmHeight = 3440
        mmLeft = 194998
        mmTop = 80433
        mmWidth = 2646
        BandType = 8
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TX_MARCACAO_VOLUME'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 9790
        mmLeft = 99219
        mmTop = 5038
        mmWidth = 110331
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMarcas: TppLabel
        UserName = 'Marcas'
        AutoSize = False
        Caption = 'MARCAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 5038
        mmWidth = 13229
        BandType = 8
      end
      object ppSub_Total: TppLabel
        UserName = 'Sub_Total'
        AutoSize = False
        Caption = 'SUB-TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 529
        mmWidth = 22490
        BandType = 8
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDE_Copia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Copia'
        mmHeight = 3683
        mmLeft = 169334
        mmTop = 51858
        mmWidth = 7662
        BandType = 8
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        AutoSize = True
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Copia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Copia'
        mmHeight = 3683
        mmLeft = 169334
        mmTop = 55827
        mmWidth = 21717
        BandType = 8
      end
      object ppDBText83: TppDBText
        UserName = 'DBText83'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 3260
        mmLeft = 30427
        mmTop = 37835
        mmWidth = 30607
        BandType = 8
      end
      object ppDBText25: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 3260
        mmLeft = 30427
        mmTop = 42069
        mmWidth = 14647
        BandType = 8
      end
      object ppDBText28: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 3260
        mmLeft = 30427
        mmTop = 46038
        mmWidth = 69384
        BandType = 8
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Doc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Doc'
        mmHeight = 3260
        mmLeft = 169334
        mmTop = 46038
        mmWidth = 69384
        BandType = 8
      end
      object ppDBText44: TppDBText
        UserName = 'DBText402'
        AutoSize = True
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Copia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Copia'
        mmHeight = 3683
        mmLeft = 169334
        mmTop = 59796
        mmWidth = 17484
        BandType = 8
      end
      object ppDBText1: TppDBText
        UserName = 'DBText22'
        DataField = 'NOME'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 3704
        mmLeft = 144727
        mmTop = 67733
        mmWidth = 77523
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Cond_de_Pagamento1'
        AutoSize = False
        Caption = 'B/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 24892
        mmWidth = 10054
        BandType = 8
      end
      object ppBL: TppDBText
        UserName = 'DBText801'
        DataField = 'NR_CONHECIMENTO'
        DataPipeline = ppBDE_Processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Processo'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 24892
        mmWidth = 41540
        BandType = 8
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Pais1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        WordWrap = True
        DataPipelineName = 'ppBDE_Pais1'
        mmHeight = 7673
        mmLeft = 175948
        mmTop = 15875
        mmWidth = 33602
        BandType = 8
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Pais2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        WordWrap = True
        DataPipelineName = 'ppBDE_Pais2'
        mmHeight = 7673
        mmLeft = 175948
        mmTop = 23813
        mmWidth = 33602
        BandType = 8
      end
      object ppPais: TppLabel
        UserName = 'Pais'
        ShiftWithParent = True
        Caption = 'PA'#205'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 15875
        mmWidth = 13494
        BandType = 8
      end
      object ppPais2: TppLabel
        UserName = 'Pais2'
        ShiftWithParent = True
        Caption = 'PA'#205'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 23813
        mmWidth = 13494
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 32004
        mmWidth = 278342
        BandType = 8
      end
      object ppCartaCred: TppLabel
        UserName = 'CartaCred'
        AutoSize = False
        Caption = 'L/C N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 32544
        mmWidth = 22490
        BandType = 8
      end
      object ppDBText33: TppDBText
        UserName = 'DBText26'
        DataField = 'CD_CARTA_CREDITO'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 32544
        mmWidth = 31485
        BandType = 8
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Doc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Doc'
        mmHeight = 3260
        mmLeft = 169334
        mmTop = 42069
        mmWidth = 14647
        BandType = 8
      end
      object ppDBText32: TppDBText
        UserName = 'DBText25'
        DataField = 'TOTAL'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 24342
        mmWidth = 19579
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 27517
        mmLeft = 83344
        mmTop = 4487
        mmWidth = 8467
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 2117
        mmTop = 4487
        mmWidth = 209296
        BandType = 8
      end
      object ppEmbalagem: TppLabel
        UserName = 'Embalagem'
        AutoSize = False
        Caption = 'EMPAQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3683
        mmLeft = 4233
        mmTop = 529
        mmWidth = 21431
        BandType = 8
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'TX_INF_EMBALAGEM'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3683
        mmLeft = 27252
        mmTop = 529
        mmWidth = 181505
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDE_Notf2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf2'
        mmHeight = 3683
        mmLeft = 30427
        mmTop = 51858
        mmWidth = 7662
        BandType = 8
      end
      object ppDBText4: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Notf2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf2'
        mmHeight = 3683
        mmLeft = 30427
        mmTop = 55827
        mmWidth = 21717
        BandType = 8
      end
      object ppDBText36: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Notf2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf2'
        mmHeight = 3683
        mmLeft = 30427
        mmTop = 59796
        mmWidth = 17484
        BandType = 8
      end
      object ppNotif2: TppLabel
        UserName = 'Notif2'
        AutoSize = False
        Caption = 'NOTIFICAR (2)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3683
        mmLeft = 3440
        mmTop = 51858
        mmWidth = 21696
        BandType = 8
      end
      object ppDBText8: TppDBText
        UserName = 'DBText2'
        DataField = 'VL_PESO_LIQUIDO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 9017
        mmWidth = 41540
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText3'
        DataField = 'VL_PESO_BRUTO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 12954
        mmWidth = 41540
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VL_TOT_CUBAGEM'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 16933
        mmWidth = 41540
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'DBText4'
        DataField = 'VL_TOT_EXW'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 237575
        mmTop = 529
        mmWidth = 39423
        BandType = 8
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'TOTAL'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 12435
        mmWidth = 22490
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Incoterm 2000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 117221
        mmTop = 82042
        mmWidth = 17992
        BandType = 8
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = 'NM_TERMO_PAGTO'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 32544
        mmWidth = 178330
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppdbtxt_desconto: TppDBText
        UserName = 'DBText14'
        DataField = 'VL_DESCONTO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Visible = False
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 8467
        mmWidth = 39423
        BandType = 8
      end
      object ppDesconto: TppLabel
        UserName = 'Desconto'
        AutoSize = False
        Caption = 'DESCUENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Visible = False
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 8467
        mmWidth = 22490
        BandType = 8
      end
      object ppCondPagto: TppLabel
        UserName = 'CondPagto'
        AutoSize = False
        Caption = 'COND. PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 32554
        mmWidth = 26723
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 83344
        mmTop = 15346
        mmWidth = 128059
        BandType = 8
      end
      object ppAcrescimo: TppLabel
        UserName = 'Acrescimo'
        AutoSize = False
        Caption = 'ACRESCIMO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Visible = False
        mmHeight = 3704
        mmLeft = 211932
        mmTop = 4498
        mmWidth = 22490
        BandType = 8
      end
      object ppdbtxt_acrescimo: TppDBText
        UserName = 'DBText17'
        DataField = 'VL_ACRESCIMO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Visible = False
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 4498
        mmWidth = 39423
        BandType = 8
      end
      object ppInlandFreight: TppLabel
        UserName = 'Label3'
        Caption = 'I'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 235215
        mmTop = 20373
        mmWidth = 804
        BandType = 8
      end
      object ppDBText24: TppDBText
        UserName = 'DBText28'
        DataField = 'VL_INLAND_FREIGHT'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3175
        mmLeft = 237596
        mmTop = 20373
        mmWidth = 39423
        BandType = 8
      end
      object ppDBText2: TppDBText
        UserName = 'DBText23'
        DataField = 'LOCAL_TOTAL'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3175
        mmLeft = 229659
        mmTop = 24342
        mmWidth = 23813
        BandType = 8
      end
      object ppLocalIncoterm: TppDBText
        UserName = 'LocalIncoterm'
        CharWrap = True
        DataField = 'NM_LOCAL_DESPACHO'
        DataPipeline = ppBDE_CartaCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        WordWrap = True
        DataPipelineName = 'ppBDE_CartaCred'
        mmHeight = 2381
        mmLeft = 275696
        mmTop = 33073
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label5'
        ShiftWithParent = True
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 55584
        mmTop = 0
        mmWidth = 8467
        BandType = 7
      end
      object Calc_Decl_Fim: TppDBMemo
        UserName = 'Calc_Decl_Fim'
        CharWrap = False
        DataField = 'CalcDeclaracao'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 55563
        mmTop = 3440
        mmWidth = 124884
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 196586
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape1'
        mmHeight = 14817
        mmLeft = 140505
        mmTop = 20902
        mmWidth = 139954
        BandType = 9
      end
      object ppShape8: TppShape
        UserName = 'Shape2'
        mmHeight = 14817
        mmLeft = 2117
        mmTop = 20902
        mmWidth = 139171
        BandType = 9
      end
      object ppLine3: TppLine
        UserName = 'Line302'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 159544
        mmLeft = 257440
        mmTop = 35454
        mmWidth = 8467
        BandType = 9
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 159544
        mmLeft = 204788
        mmTop = 35454
        mmWidth = 8467
        BandType = 9
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 159544
        mmLeft = 178065
        mmTop = 35454
        mmWidth = 8467
        BandType = 9
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 159544
        mmLeft = 51858
        mmTop = 35454
        mmWidth = 1323
        BandType = 9
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 159279
        mmLeft = 21167
        mmTop = 35454
        mmWidth = 8467
        BandType = 9
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 159544
        mmLeft = 2117
        mmTop = 35454
        mmWidth = 8996
        BandType = 9
      end
      object ppLine11: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 159544
        mmLeft = 230717
        mmTop = 35454
        mmWidth = 8731
        BandType = 9
      end
      object ppLine15: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 42069
        mmWidth = 277792
        BandType = 9
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 162719
        mmLeft = 271992
        mmTop = 32279
        mmWidth = 8467
        BandType = 9
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 191030
        mmWidth = 278078
        BandType = 9
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_PROCESSO'
      DataPipeline = ppBDE_Proc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDE_Proc'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NM_GRUPO_EMB'
      DataPipeline = ppBDE_ProcI
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDE_ProcI'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText9: TppDBText
          UserName = 'DBText15'
          DataField = 'NM_GRUPO_EMB'
          DataPipeline = ppBDE_ProcI
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDE_ProcI'
          mmHeight = 3704
          mmLeft = 52652
          mmTop = 0
          mmWidth = 112448
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NR_ITEM'
      DataPipeline = ppBDE_ProcI
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDE_ProcI'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 4233
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBMNalNCM: TppDBMemo
          UserName = 'DBMNalNCM'
          CharWrap = False
          DataField = 'DESCR_NCM'
          DataPipeline = ppBDE_ProcI
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppBDE_ProcI'
          mmHeight = 3704
          mmLeft = 52652
          mmTop = 0
          mmWidth = 124884
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppRegion1: TppRegion
          UserName = 'Region1'
          Brush.Style = bsClear
          Pen.Color = clWhite
          Pen.Style = psClear
          Pen.Width = 0
          ShiftRelativeTo = ppDBMNalNCM
          Stretch = True
          Transparent = True
          mmHeight = 4498
          mmLeft = 0
          mmTop = 3175
          mmWidth = 281517
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppCodigo: TppDBText
            UserName = 'DBText24'
            DataField = 'CD_MERCADORIA'
            DataPipeline = ppBDE_ProcI
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3704
            mmLeft = 21696
            mmTop = 3440
            mmWidth = 30163
            BandType = 5
            GroupNo = 2
          end
          object pppeso_liquido: TppDBText
            UserName = 'DBText27'
            DataField = 'VL_TOT_PESO_LIQ'
            DataPipeline = ppBDE_ProcI
            DisplayFormat = '#,0.000;-#,0.000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3704
            mmLeft = 178054
            mmTop = 3440
            mmWidth = 23029
            BandType = 5
            GroupNo = 2
          end
          object pppreco_unitario: TppDBText
            UserName = 'preco_unitario'
            DataField = 'CalcVlUnitario'
            DataPipeline = ppBDE_ProcI
            DisplayFormat = '#,0.000000;-#,0.000000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3704
            mmLeft = 230717
            mmTop = 3440
            mmWidth = 21167
            BandType = 5
            GroupNo = 2
          end
          object pptotal: TppDBText
            UserName = 'total'
            DataField = 'CalcVlItem'
            DataPipeline = ppBDE_ProcI
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3704
            mmLeft = 257430
            mmTop = 3440
            mmWidth = 21167
            BandType = 5
            GroupNo = 2
          end
          object ppDBMemo3: TppDBMemo
            UserName = 'DBMemo3'
            CharWrap = False
            DataField = 'CalcDescricao'
            DataPipeline = ppBDE_ProcI
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            Stretch = True
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3704
            mmLeft = 52652
            mmTop = 3440
            mmWidth = 124884
            BandType = 5
            GroupNo = 2
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
          object ppDBText53: TppDBText
            UserName = 'DBText44'
            DataField = 'NM_SIGLA'
            DataPipeline = ppBDE_ProcI
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3704
            mmLeft = 252773
            mmTop = 3440
            mmWidth = 4233
            BandType = 5
            GroupNo = 2
          end
          object ppQtd: TppDBMemo
            UserName = 'Qtd'
            CharWrap = False
            DataField = 'CalcEmbSup'
            DataPipeline = ppBDE_ProcI
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            Stretch = True
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3440
            mmLeft = 2910
            mmTop = 3440
            mmWidth = 17992
            BandType = 5
            GroupNo = 2
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
          object pppeso_bruto: TppDBText
            UserName = 'peso_bruto'
            DataField = 'VL_TOT_PESO_BRUTO'
            DataPipeline = ppBDE_ProcI
            DisplayFormat = '#,0.000;-#,0.000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppBDE_ProcI'
            mmHeight = 3704
            mmLeft = 205052
            mmTop = 3704
            mmWidth = 23029
            BandType = 5
            GroupNo = 2
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object TCliente_Habilitacao: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, NR_ALT_LINHA_FAT_EXP'
      'FROM   TCLIENTE_HABILITACAO ( NOLOCK )'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO')
    Left = 646
    Top = 470
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object TCartaCred: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT E.*,'
      '       CASE ISNULL( P.CD_LOCAL_DESPACHO, '#39#39' )'
      '       WHEN '#39#39' THEN'
      '         CASE P.CD_TIPO_FRETE'
      '           WHEN '#39'0'#39' THEN NM_LOCAL_ORIGEM'
      '           WHEN '#39'1'#39' THEN NM_LOCAL_DESTINO'
      '         END'
      '       ELSE'
      '         L.DESCRICAO'
      '       END AS NM_LOCAL_DESPACHO'
      
        'FROM   TEXP_CARTA_CRED E, TPROCESSO_EXP P, TLOCAL_EMBARQUE L ( N' +
        'OLOCK )'
      'WHERE  P.NR_PROCESSO = E.NR_PROCESSO AND'
      '       P.CD_LOCAL_DESPACHO *= L.CODIGO AND'
      '       E.NR_PROCESSO = :NR_PROCESSO')
    Left = 332
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object TCartaCredNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TEXP_CARTA_CRED.NR_PROCESSO'
      Size = 18
    end
    object TCartaCredTX_IMPORTADOR: TMemoField
      FieldName = 'TX_IMPORTADOR'
      Origin = 'TEXP_CARTA_CRED.TX_IMPORTADOR'
      BlobType = ftMemo
    end
    object TCartaCredTX_EXPORTADOR: TMemoField
      FieldName = 'TX_EXPORTADOR'
      Origin = 'TEXP_CARTA_CRED.TX_EXPORTADOR'
      BlobType = ftMemo
    end
    object TCartaCredTX_CONSIGNATARIO: TMemoField
      FieldName = 'TX_CONSIGNATARIO'
      Origin = 'TEXP_CARTA_CRED.TX_CONSIGNATARIO'
      BlobType = ftMemo
    end
    object TCartaCredTX_NOTIFY1: TMemoField
      FieldName = 'TX_NOTIFY1'
      Origin = 'TEXP_CARTA_CRED.TX_NOTIFY1'
      BlobType = ftMemo
    end
    object TCartaCredTX_NOTIFY2: TMemoField
      FieldName = 'TX_NOTIFY2'
      Origin = 'TEXP_CARTA_CRED.TX_NOTIFY2'
      BlobType = ftMemo
    end
    object TCartaCredTX_DOCTO: TMemoField
      FieldName = 'TX_DOCTO'
      Origin = 'TEXP_CARTA_CRED.TX_DOCTO'
      BlobType = ftMemo
    end
    object TCartaCredTX_COPIA: TMemoField
      FieldName = 'TX_COPIA'
      Origin = 'TEXP_CARTA_CRED.TX_COPIA'
      BlobType = ftMemo
    end
    object TCartaCredTX_SAQUE: TMemoField
      FieldName = 'TX_SAQUE'
      Origin = 'TEXP_CARTA_CRED.TX_SAQUE'
      BlobType = ftMemo
    end
    object TCartaCredNM_UNID_MED_PL: TStringField
      FieldName = 'NM_UNID_MED_PL'
      Origin = 'TEXP_CARTA_CRED.NM_UNID_MED_PL'
      Size = 6
    end
    object TCartaCredNM_UNID_MED_PB: TStringField
      FieldName = 'NM_UNID_MED_PB'
      Origin = 'TEXP_CARTA_CRED.NM_UNID_MED_PB'
      Size = 6
    end
    object TCartaCredNM_LOCAL_DESTINO: TStringField
      FieldName = 'NM_LOCAL_DESTINO'
      Origin = 'TEXP_CARTA_CRED.NM_LOCAL_DESTINO'
      Size = 50
    end
    object TCartaCredNM_LOCAL_ORIGEM: TStringField
      FieldName = 'NM_LOCAL_ORIGEM'
      Origin = 'TEXP_CARTA_CRED.NM_LOCAL_ORIGEM'
      Size = 50
    end
    object TCartaCredNM_LOCAL_DESPACHO: TStringField
      FieldName = 'NM_LOCAL_DESPACHO'
      Size = 50
    end
    object TCartaCredNM_PAIS_DESTINO: TStringField
      FieldName = 'NM_PAIS_DESTINO'
      Origin = 'TEXP_CARTA_CRED.NM_PAIS_DESTINO'
      Size = 120
    end
    object TCartaCredNM_PAIS_ORIGEM: TStringField
      FieldName = 'NM_PAIS_ORIGEM'
      Origin = 'TEXP_CARTA_CRED.NM_PAIS_ORIGEM'
      Size = 120
    end
    object TCartaCredTX_TERMO_PAGTO: TMemoField
      FieldName = 'TX_TERMO_PAGTO'
      Origin = 'TEXP_CARTA_CRED.TX_TERMO_PAGTO'
      BlobType = ftMemo
    end
  end
  object Dts_CartaCred: TDataSource
    AutoEdit = False
    DataSet = TCartaCred
    Left = 332
    Top = 64
  end
  object ppBDE_CartaCred: TppBDEPipeline
    DataSource = Dts_CartaCred
    SkipWhenNoRecords = False
    UserName = 'BDE_CartaCred'
    Left = 332
    Top = 120
    object ppBDE_CartaCredppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_CartaCredppField2: TppField
      FieldAlias = 'TX_IMPORTADOR'
      FieldName = 'TX_IMPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField3: TppField
      FieldAlias = 'TX_EXPORTADOR'
      FieldName = 'TX_EXPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField4: TppField
      FieldAlias = 'TX_CONSIGNATARIO'
      FieldName = 'TX_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField5: TppField
      FieldAlias = 'TX_NOTIFY1'
      FieldName = 'TX_NOTIFY1'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField6: TppField
      FieldAlias = 'TX_NOTIFY2'
      FieldName = 'TX_NOTIFY2'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField7: TppField
      FieldAlias = 'TX_DOCTO'
      FieldName = 'TX_DOCTO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField8: TppField
      FieldAlias = 'TX_COPIA'
      FieldName = 'TX_COPIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField9: TppField
      FieldAlias = 'TX_SAQUE'
      FieldName = 'TX_SAQUE'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField10: TppField
      FieldAlias = 'NM_UNID_MED_PL'
      FieldName = 'NM_UNID_MED_PL'
      FieldLength = 6
      DisplayWidth = 6
      Position = 9
    end
    object ppBDE_CartaCredppField11: TppField
      FieldAlias = 'NM_UNID_MED_PB'
      FieldName = 'NM_UNID_MED_PB'
      FieldLength = 6
      DisplayWidth = 6
      Position = 10
    end
    object ppBDE_CartaCredppField12: TppField
      FieldAlias = 'NM_LOCAL_DESTINO'
      FieldName = 'NM_LOCAL_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppBDE_CartaCredppField13: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM'
      FieldName = 'NM_LOCAL_ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppBDE_CartaCredppField14: TppField
      FieldAlias = 'NM_LOCAL_DESPACHO'
      FieldName = 'NM_LOCAL_DESPACHO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object ppBDE_CartaCredppField15: TppField
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 14
    end
    object ppBDE_CartaCredppField16: TppField
      FieldAlias = 'NM_PAIS_ORIGEM'
      FieldName = 'NM_PAIS_ORIGEM'
      FieldLength = 120
      DisplayWidth = 120
      Position = 15
    end
    object ppBDE_CartaCredppField17: TppField
      FieldAlias = 'TX_TERMO_PAGTO'
      FieldName = 'TX_TERMO_PAGTO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object ppBDE_Imp: TppBDEPipeline
    DataSource = Dts_Imp
    UserName = 'BDE_Imp'
    Left = 504
    Top = 120
    object ppBDE_ImpppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object ppBDE_ImpppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDE_ImpppField3: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 68
      DisplayWidth = 68
      Position = 2
    end
    object ppBDE_ImpppField4: TppField
      FieldAlias = 'END_COMPL'
      FieldName = 'END_COMPL'
      FieldLength = 41
      DisplayWidth = 41
      Position = 3
    end
    object ppBDE_ImpppField5: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppBDE_ImpppField6: TppField
      FieldAlias = 'END_ESTADO'
      FieldName = 'END_ESTADO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppBDE_ImpppField7: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppBDE_ImpppField8: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppBDE_ImpppField9: TppField
      FieldAlias = 'NR_RUC'
      FieldName = 'NR_RUC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object ppBDE_ImpppField10: TppField
      FieldAlias = 'NR_NIT'
      FieldName = 'NR_NIT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppBDE_ImpppField11: TppField
      FieldAlias = 'NR_CUIT'
      FieldName = 'NR_CUIT'
      FieldLength = 31
      DisplayWidth = 31
      Position = 10
    end
    object ppBDE_ImpppField12: TppField
      FieldAlias = 'CIDADE_PAIS'
      FieldName = 'CIDADE_PAIS'
      FieldLength = 53
      DisplayWidth = 53
      Position = 11
    end
    object ppBDE_ImpppField13: TppField
      FieldAlias = 'NR_CLIENTE'
      FieldName = 'NR_CLIENTE'
      FieldLength = 19
      DisplayWidth = 19
      Position = 12
    end
    object ppBDE_ImpppField14: TppField
      FieldAlias = 'CD_PAIS'
      FieldName = 'CD_PAIS'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
  end
  object ppBDE_Consig: TppBDEPipeline
    DataSource = Dts_consig
    UserName = 'BDE_Consig'
    Left = 552
    Top = 120
  end
  object ppBDE_CUIT: TppBDEPipeline
    DataSource = Dts_CUIT
    UserName = 'BDE_CUIT'
    Left = 423
    Top = 472
    object ppBDE_CUITppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField2: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField3: TppField
      FieldAlias = 'END_EMPRESA'
      FieldName = 'END_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField4: TppField
      FieldAlias = 'END_NUMERO'
      FieldName = 'END_NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField5: TppField
      FieldAlias = 'END_COMPL'
      FieldName = 'END_COMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField6: TppField
      FieldAlias = 'END_ESTADO'
      FieldName = 'END_ESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField7: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField8: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField9: TppField
      FieldAlias = 'NR_RUC'
      FieldName = 'NR_RUC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField10: TppField
      FieldAlias = 'NR_NIT'
      FieldName = 'NR_NIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField11: TppField
      FieldAlias = 'NR_CUIT'
      FieldName = 'NR_CUIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField12: TppField
      FieldAlias = 'NM_PAIS'
      FieldName = 'NM_PAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField13: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField14: TppField
      FieldAlias = 'CLIENTE'
      FieldName = 'CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField15: TppField
      FieldAlias = 'END_CLIENTE'
      FieldName = 'END_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField16: TppField
      FieldAlias = 'NUM_CLIENTE'
      FieldName = 'NUM_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField17: TppField
      FieldAlias = 'COMPL_CLIENTE'
      FieldName = 'COMPL_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField18: TppField
      FieldAlias = 'CIDADE_CLIENTE'
      FieldName = 'CIDADE_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField19: TppField
      FieldAlias = 'UF_CLIENTE'
      FieldName = 'UF_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField20: TppField
      FieldAlias = 'CEP_CLIENTE'
      FieldName = 'CEP_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField21: TppField
      FieldAlias = 'TEL_CLIENTE'
      FieldName = 'TEL_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField22: TppField
      FieldAlias = 'FAX_CLIENTE'
      FieldName = 'FAX_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField23: TppField
      FieldAlias = 'CGC_CLIENTE'
      FieldName = 'CGC_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField24: TppField
      FieldAlias = 'VIA'
      FieldName = 'VIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField25: TppField
      FieldAlias = 'NM_CONSIGNATARIO'
      FieldName = 'NM_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField26: TppField
      FieldAlias = 'END_CONSIGNATARIO'
      FieldName = 'END_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField27: TppField
      FieldAlias = 'END_CONSIGNATARIO_2'
      FieldName = 'END_CONSIGNATARIO_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField28: TppField
      FieldAlias = 'PAIS_CONSIGNATARIO'
      FieldName = 'PAIS_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField29: TppField
      FieldAlias = 'CIDADE_CONSIGNATARIO'
      FieldName = 'CIDADE_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField30: TppField
      FieldAlias = 'ESTADO_CONSIG'
      FieldName = 'ESTADO_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField31: TppField
      FieldAlias = 'TELEFONE_CONSIGNATARIO'
      FieldName = 'TELEFONE_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField32: TppField
      FieldAlias = 'FAX_CONSIGNATARIO'
      FieldName = 'FAX_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField33: TppField
      FieldAlias = 'RUC_CONSIGNATARIO'
      FieldName = 'RUC_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField34: TppField
      FieldAlias = 'NIT_CONSIGNATARIO'
      FieldName = 'NIT_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField35: TppField
      FieldAlias = 'CUIT_CONSIGNATARIO'
      FieldName = 'CUIT_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField36: TppField
      FieldAlias = 'NM_NOTIFY'
      FieldName = 'NM_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField37: TppField
      FieldAlias = 'END_NOTIFY'
      FieldName = 'END_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField38: TppField
      FieldAlias = 'END_NOTIFY_2'
      FieldName = 'END_NOTIFY_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField39: TppField
      FieldAlias = 'PAIS_NOTIFY'
      FieldName = 'PAIS_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField40: TppField
      FieldAlias = 'CIDADE_NOTIFY'
      FieldName = 'CIDADE_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField41: TppField
      FieldAlias = 'ESTADO_NOTIFY'
      FieldName = 'ESTADO_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField42: TppField
      FieldAlias = 'TELEFONE_NOTIFY'
      FieldName = 'TELEFONE_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField43: TppField
      FieldAlias = 'FAX_NOTIFY'
      FieldName = 'FAX_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField44: TppField
      FieldAlias = 'RUC_NOTIFY'
      FieldName = 'RUC_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField45: TppField
      FieldAlias = 'NIT_NOTIFY'
      FieldName = 'NIT_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField46: TppField
      FieldAlias = 'CUIT_NOTIFY'
      FieldName = 'CUIT_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField47: TppField
      FieldAlias = 'CONTATO_NOTIFY'
      FieldName = 'CONTATO_NOTIFY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField48: TppField
      FieldAlias = 'CD_NOTIFY2'
      FieldName = 'CD_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField49: TppField
      FieldAlias = 'NM_NOTIFY2'
      FieldName = 'NM_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField50: TppField
      FieldAlias = 'END_NOTIFY2'
      FieldName = 'END_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField51: TppField
      FieldAlias = 'END_NOTIFY2_2'
      FieldName = 'END_NOTIFY2_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField52: TppField
      FieldAlias = 'PAIS_NOTIFY2'
      FieldName = 'PAIS_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField53: TppField
      FieldAlias = 'CIDADE_NOTIFY2'
      FieldName = 'CIDADE_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField54: TppField
      FieldAlias = 'ESTADO_NOTIFY2'
      FieldName = 'ESTADO_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField55: TppField
      FieldAlias = 'TELEFONE_NOTIFY2'
      FieldName = 'TELEFONE_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField56: TppField
      FieldAlias = 'FAX_NOTIFY2'
      FieldName = 'FAX_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField57: TppField
      FieldAlias = 'RUC_NOTIFY2'
      FieldName = 'RUC_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField58: TppField
      FieldAlias = 'NIT_NOTIFY2'
      FieldName = 'NIT_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField59: TppField
      FieldAlias = 'CUIT_NOTIFY2'
      FieldName = 'CUIT_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField60: TppField
      FieldAlias = 'TRANSPORTE'
      FieldName = 'TRANSPORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField61: TppField
      FieldAlias = 'NR_CONHECIMENTO'
      FieldName = 'NR_CONHECIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField62: TppField
      FieldAlias = 'NR_CONHECIMENTO_MASTER'
      FieldName = 'NR_CONHECIMENTO_MASTER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField63: TppField
      FieldAlias = 'TERMO_PAGTO'
      FieldName = 'TERMO_PAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField64: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM'
      FieldName = 'NM_LOCAL_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField65: TppField
      FieldAlias = 'NM_PAIS_ORIGEM'
      FieldName = 'NM_PAIS_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField66: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM_AJI'
      FieldName = 'NM_LOCAL_ORIGEM_AJI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField67: TppField
      FieldAlias = 'NM_LOCAL_DESTINO'
      FieldName = 'NM_LOCAL_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField68: TppField
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField69: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField70: TppField
      FieldAlias = 'PESO_LIQUIDO'
      FieldName = 'PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField71: TppField
      FieldAlias = 'PESO_BRUTO'
      FieldName = 'PESO_BRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField72: TppField
      FieldAlias = 'CUBAGEM'
      FieldName = 'CUBAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField73: TppField
      FieldAlias = 'TOTAL_FOB'
      FieldName = 'TOTAL_FOB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField74: TppField
      FieldAlias = 'TOTAL_DESC'
      FieldName = 'TOTAL_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField75: TppField
      FieldAlias = 'SUB_TOT'
      FieldName = 'SUB_TOT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField76: TppField
      FieldAlias = 'FRETE'
      FieldName = 'FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField77: TppField
      FieldAlias = 'SEGURO'
      FieldName = 'SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField78: TppField
      FieldAlias = 'TOTAL_MCV'
      FieldName = 'TOTAL_MCV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField79: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 78
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField80: TppField
      FieldAlias = 'TOTAL_DESPESA'
      FieldName = 'TOTAL_DESPESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 79
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField81: TppField
      FieldAlias = 'FRETE_INTERNO'
      FieldName = 'FRETE_INTERNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 80
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField82: TppField
      FieldAlias = 'NR_FATURA'
      FieldName = 'NR_FATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 81
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField83: TppField
      FieldAlias = 'DIA_FATURA'
      FieldName = 'DIA_FATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 82
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField84: TppField
      FieldAlias = 'MES_FATURA'
      FieldName = 'MES_FATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 83
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField85: TppField
      FieldAlias = 'ANO_FATURA'
      FieldName = 'ANO_FATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 84
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField86: TppField
      FieldAlias = 'TX_DECL_ADICIONAL'
      FieldName = 'TX_DECL_ADICIONAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 85
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField87: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 86
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField88: TppField
      FieldAlias = 'CD_LINGUA_PEDIDO'
      FieldName = 'CD_LINGUA_PEDIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 87
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField89: TppField
      FieldAlias = 'SIGLA_MOEDA'
      FieldName = 'SIGLA_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 88
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField90: TppField
      FieldAlias = 'NOME_BANCO'
      FieldName = 'NOME_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 89
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField91: TppField
      FieldAlias = 'END_BANCO'
      FieldName = 'END_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 90
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField92: TppField
      FieldAlias = 'TX_MARCACAO_VOLUME'
      FieldName = 'TX_MARCACAO_VOLUME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 91
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField93: TppField
      FieldAlias = 'TX_INF_EMBALAGEM'
      FieldName = 'TX_INF_EMBALAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 92
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField94: TppField
      FieldAlias = 'TX_LOGOMARCA'
      FieldName = 'TX_LOGOMARCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 93
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField95: TppField
      FieldAlias = 'LOCAL_TOTAL'
      FieldName = 'LOCAL_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 94
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField96: TppField
      FieldAlias = 'LOCAL_TOTAL_CARTA'
      FieldName = 'LOCAL_TOTAL_CARTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 95
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField97: TppField
      FieldAlias = 'INCOTERM_MERC'
      FieldName = 'INCOTERM_MERC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 96
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField98: TppField
      FieldAlias = 'TX_IMPORTADOR'
      FieldName = 'TX_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 97
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField99: TppField
      FieldAlias = 'TX_EXPORTADOR'
      FieldName = 'TX_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 98
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField100: TppField
      FieldAlias = 'TX_CONSIGNATARIO'
      FieldName = 'TX_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 99
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField101: TppField
      FieldAlias = 'TX_NOTIFY1'
      FieldName = 'TX_NOTIFY1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 100
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField102: TppField
      FieldAlias = 'TX_NOTIFY2'
      FieldName = 'TX_NOTIFY2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 101
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField103: TppField
      FieldAlias = 'TX_DOCTO'
      FieldName = 'TX_DOCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 102
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField104: TppField
      FieldAlias = 'TX_COPIA'
      FieldName = 'TX_COPIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 103
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField105: TppField
      FieldAlias = 'TX_SAQUE'
      FieldName = 'TX_SAQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 104
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField106: TppField
      FieldAlias = 'NM_UNID_MED_PL'
      FieldName = 'NM_UNID_MED_PL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 105
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField107: TppField
      FieldAlias = 'NM_UNID_MED_PB'
      FieldName = 'NM_UNID_MED_PB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 106
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField108: TppField
      FieldAlias = 'NM_LOCAL_DESTINO_1'
      FieldName = 'NM_LOCAL_DESTINO_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 107
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField109: TppField
      FieldAlias = 'NM_LOCAL_ORIGEM_1'
      FieldName = 'NM_LOCAL_ORIGEM_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 108
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField110: TppField
      FieldAlias = 'NM_PAIS_DESTINO_1'
      FieldName = 'NM_PAIS_DESTINO_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 109
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField111: TppField
      FieldAlias = 'NM_PAIS_ORIGEM_1'
      FieldName = 'NM_PAIS_ORIGEM_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 110
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField112: TppField
      FieldAlias = 'TX_TERMO_PAGTO'
      FieldName = 'TX_TERMO_PAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 111
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField113: TppField
      FieldAlias = 'INCOTERM2'
      FieldName = 'INCOTERM2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 112
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField114: TppField
      FieldAlias = 'VIA_AJI'
      FieldName = 'VIA_AJI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 113
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField115: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 114
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField116: TppField
      FieldAlias = 'CONTATO_CARGO'
      FieldName = 'CONTATO_CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 115
      Searchable = False
      Sortable = False
    end
    object ppBDE_CUITppField117: TppField
      FieldAlias = 'CD_IMPORTADOR'
      FieldName = 'CD_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 116
      Searchable = False
      Sortable = False
    end
  end
  object Dts_CUIT: TDataSource
    DataSet = qry_CUIT
    Left = 424
    Top = 413
  end
  object qry_CUIT: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT E.NR_PROCESSO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.NM_EMPRESA ELSE '#39#39' END AS NM_EMPRESA,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_EMPRESA ELSE '#39#39' END AS END_EMPRESA,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_NUMERO ELSE '#39#39' END AS END_NUMERO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_COMPL ELSE '#39#39' END AS END_COMPL,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39') WHE' +
        'N '#39#39' THEN EE1.END_ESTADO ELSE '#39#39' END AS END_ESTADO,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_TELEFONE, '#39#39') WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39'TEL: '#39' +ISNULL(EE1.NR_TELEFONE, '#39#39') END'
      '       ELSE '#39#39' END AS NR_TELEFONE,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_FAX, '#39#39') WHEN '#39#39' THEN' +
        ' '#39#39' ELSE '#39'FAX: '#39' +ISNULL(EE1.NR_FAX, '#39#39') END'
      '       ELSE '#39#39' END AS NR_FAX,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_RUC, '#39#39') WHEN '#39#39' THEN' +
        ' '#39#39' ELSE '#39'RUC: '#39' + EE1.NR_RUC END'
      '       ELSE '#39#39' END AS NR_RUC,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_NIT, '#39#39') WHEN '#39#39' THEN' +
        ' '#39#39' ELSE '#39'NIT: '#39' + EE1.NR_NIT END'
      '       ELSE '#39#39' END AS NR_NIT,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN CASE ISNULL(EE1.NR_CUIT, '#39#39') WHEN '#39#39' THE' +
        'N '#39#39' ELSE '#39'CUIT: '#39' + EE1.NR_CUIT END'
      '       ELSE '#39#39' END AS NR_CUIT,'
      ''
      '       (CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_POR' +
        'T FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE1.CD_PAIS)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_ING' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE1.CD_PAIS)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ESP' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE1.CD_PAIS)'
      '        END) AS NM_PAIS, EE1.END_CIDADE,'
      
        '       (SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = E.CD_EXPORTADOR) AS CLIENTE,'
      
        '       (SELECT END_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_E' +
        'MPRESA = E.CD_EXPORTADOR) AS END_CLIENTE,'
      
        '       (SELECT END_NUMERO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = E.CD_EXPORTADOR) AS NUM_CLIENTE,'
      
        '       (SELECT END_COMPL FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMP' +
        'RESA = E.CD_EXPORTADOR) AS COMPL_CLIENTE,'
      
        '       (SELECT END_CIDADE FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = E.CD_EXPORTADOR) AS CIDADE_CLIENTE,'
      
        '       (SELECT END_UF FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_EXPORTADOR) AS UF_CLIENTE,'
      
        '       (SELECT END_CEP FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_EXPORTADOR) AS CEP_CLIENTE,'
      
        '       (SELECT NR_TELEFONE FROM TEMPRESA_NAC (NOLOCK) WHERE CD_E' +
        'MPRESA = E.CD_EXPORTADOR) AS TEL_CLIENTE,'
      
        '       (SELECT NR_FAX FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_EXPORTADOR) AS FAX_CLIENTE,'
      
        '       (SELECT '#39'CNPJ:'#39' +SUBSTRING(CGC_EMPRESA,1,2)+'#39'.'#39'+SUBSTRING' +
        '(CGC_EMPRESA,3,3)+'#39'.'#39'+SUBSTRING(CGC_EMPRESA,6,3)+'#39'/'#39'+SUBSTRING(C' +
        'GC_EMPRESA,9,4)+'#39'-'#39'+SUBSTRING(CGC_EMPRESA,13,2)'
      
        '           FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = E.CD_EX' +
        'PORTADOR) AS CGC_CLIENTE,'
      '       (CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_VIA_TRAN' +
        'SP FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD_V' +
        'IA_TRANSPORTE)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_VIA_TRAN' +
        'SP_INGLES FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP =' +
        ' E.CD_VIA_TRANSPORTE)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_VIA_TRAN' +
        'SP_ESP FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.' +
        'CD_VIA_TRANSPORTE)'
      '        END) AS VIA,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_CON' +
        'SIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'4'#39' THEN (' +
        'SELECT NM_DESPACHANTE FROM TDESPACHANTE  WHERE CD_DESPACHANTE = ' +
        'E.CD_CONSIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS NM_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT END_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRE' +
        'SA = E.CD_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT END_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.C' +
        'D_CONSIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS END_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT ISNULL(LTRIM(END_NUMERO), '#39#39') + '#39' '#39' + ISNULL' +
        '(LTRIM(END_COMPL), '#39#39') FROM TEMPRESA_EST WHERE CD_EMPRESA = E.CD' +
        '_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT END_COMPL_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO' +
        ' = E.CD_CONSIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS END_CONSIGNATARIO_2,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      '                               CASE'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39 +
        ' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39 +
        ' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39 +
        ' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRES' +
        'A = E.CD_CONSIGNATARIO))'
      '                               END'
      '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN'
      '                                CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_CONSIGNATARIO))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_CONSIGNATARIO))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_CONSIGNATARIO))'
      '                                END'
      '                        END'
      '       ELSE '#39#39' END AS PAIS_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN (SELECT ISNULL(END_CIDADE, '#39#39') FROM TEMPRESA_EST (NO' +
        'LOCK) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      
        '                            WHEN E.TP_CONSIGNATARIO = '#39'2'#39' THEN (' +
        'SELECT CD_CIDADE FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_CON' +
        'SIGNATARIO)'
      '                        END'
      '       ELSE '#39#39' END AS CIDADE_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      
        '           WHEN '#39#39' THEN (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMP' +
        'RESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '       ELSE '#39#39' END AS ESTADO_CONSIG,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                           (SELECT CASE ISNULL(NR_TELEFONE, '#39#39')' +
        ' WHEN '#39#39' THEN '#39#39' ELSE '#39'TEL: '#39' +ISNULL(NR_TELEFONE, '#39#39') END FROM ' +
        'TEMPRESA_EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS TELEFONE_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                            (SELECT CASE ISNULL(NR_FAX, '#39#39') WHE' +
        'N '#39#39' THEN '#39#39' ELSE '#39'FAX: '#39' +ISNULL(NR_FAX, '#39#39') END FROM TEMPRESA_' +
        'EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS FAX_CONSIGNATARIO,'
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                            (SELECT CASE ISNULL(NR_RUC, '#39#39') WHE' +
        'N '#39#39' THEN '#39#39' ELSE '#39'RUC: '#39' +ISNULL(NR_RUC, '#39#39') END FROM TEMPRESA_' +
        'EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                         ELSE '#39#39' END'
      '       ELSE '#39#39' END AS RUC_CONSIGNATARIO,'
      ''
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                           (SELECT CASE ISNULL(NR_NIT, '#39#39') WHEN' +
        ' '#39#39' THEN '#39#39' ELSE '#39'NIT: '#39' +ISNULL(NR_NIT, '#39#39') END FROM TEMPRESA_E' +
        'ST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS NIT_CONSIGNATARIO,'
      ''
      
        '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_CONSIGNATARIO), '#39 +
        #39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_CONSIGNATARIO IN ('#39'0'#39', '#39'1'#39 +
        ', '#39'3'#39') THEN'
      
        #9'                           (SELECT CASE ISNULL(NR_CUIT, '#39#39') WHE' +
        'N '#39#39' THEN '#39#39' ELSE '#39'CUIT: '#39' +ISNULL(NR_CUIT, '#39#39') END FROM TEMPRES' +
        'A_EST WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS CUIT_CONSIGNATARIO,'
      ''
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E.' +
        'CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'4'#39' THEN (SELECT' +
        ' NM_DESPACHANTE FROM TDESPACHANTE  WHERE CD_DESPACHANTE = E.CD_N' +
        'OTIFY1)'
      '                         END'
      '       ELSE '#39#39' END AS NM_NOTIFY,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT END_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E' +
        '.CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' END_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTI' +
        'FY1)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(LTRIM(END_NUMERO), '#39#39') + '#39' '#39' + ISNULL(LTRIM' +
        '(END_COMPL), '#39#39') FROM TEMPRESA_EST WHERE CD_EMPRESA = E.CD_NOTIF' +
        'Y1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' END_COMPL_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.C' +
        'D_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY_2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      '                                CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY1))'
      '                                END'
      '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN'
      '                                CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_NOTIFY1))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CO' +
        'DIGO = E.CD_NOTIFY1))'
      '                                END'
      '                        END'
      '       ELSE '#39#39' END AS PAIS_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(END_CIDADE, '#39#39') FROM TEMPRESA_EST (NOLOCK) ' +
        'WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      
        '                            WHEN E.TP_NOTIFY1 = '#39'2'#39' THEN (SELECT' +
        ' CD_CIDADE FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS CIDADE_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMP' +
        'RESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS ESTADO_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_TELEFONE,' +
        ' '#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39'TEL: '#39'+ISNULL(NR_TELEFONE, '#39#39') END FR' +
        'OM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS TELEFONE_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_FAX, '#39#39') ' +
        'WHEN '#39#39' THEN '#39#39' ELSE '#39'FAX: '#39'+ISNULL(NR_FAX, '#39#39') END FROM TEMPRES' +
        'A_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY1)'
      '                        END'
      '       ELSE '#39#39' END AS FAX_NOTIFY,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_RUC, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'RUC: '#39'+NR_RUC END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS RUC_NOTIFY,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_NIT, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'NIT: '#39'+NR_NIT END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS NIT_NOTIFY,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY1), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_CUIT, '#39#39') WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39'CUIT: '#39'+NR_CUIT END FROM TEMPRESA_EST (NOLOCK) WH' +
        'ERE CD_EMPRESA = E.CD_NOTIFY1)'
      '       ELSE '#39#39' END AS CUIT_NOTIFY,'
      ''
      ''
      '       (CASE'
      '          WHEN E.TP_NOTIFY1 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39') THEN'
      
        '           (CASE (SELECT ISNULL(NM_CONTATO, '#39#39') FROM TEMPRESA_ES' +
        'T (NOLOCK) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      '              WHEN '#39#39' THEN '#39#39
      
        #9#9#9'  ELSE(SELECT ISNULL(NM_CONTATO, '#39#39') FROM TEMPRESA_EST (NOLOC' +
        'K) WHERE CD_EMPRESA = E.CD_CONSIGNATARIO)'
      #9#9#9'END)'
      '          ELSE '#39#39
      '        END) AS CONTATO_NOTIFY,'
      '       E.CD_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E.' +
        'CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'4'#39' THEN (SELECT' +
        ' NM_DESPACHANTE FROM TDESPACHANTE  WHERE CD_DESPACHANTE = E.CD_N' +
        'OTIFY2)'
      '                        END'
      '       ELSE '#39#39' END AS NM_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT END_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = E' +
        '.CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' END_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTI' +
        'FY2)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(LTRIM(END_NUMERO), '#39#39') + '#39' '#39' + ISNULL(LTRIM' +
        '(END_COMPL), '#39#39') FROM TEMPRESA_EST WHERE CD_EMPRESA = E.CD_NOTIF' +
        'Y2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' END_COMPL_CIA_TRANSP FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.C' +
        'D_NOTIFY2)'
      '                        END'
      '       ELSE '#39#39' END AS END_NOTIFY2_2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      '                               CASE'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'0' +
        #39' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY2))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'1' +
        #39' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY2))'
      
        '                                    WHEN E.CD_LINGUA_PEDIDO = '#39'2' +
        #39' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_' +
        'PAIS = (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRE' +
        'SA = E.CD_NOTIFY2))'
      '                               END'
      '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN'
      '                               CASE'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39 +
        ' THEN (SELECT NM_PAIS_PORT FROM TPAIS_BROKER (NOLOCK) WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE COD' +
        'IGO = E.CD_NOTIFY2))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39 +
        ' THEN (SELECT NM_PAIS_ING FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE COD' +
        'IGO = E.CD_NOTIFY2))'
      
        '                                   WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39 +
        ' THEN (SELECT NM_PAIS_ESP FROM TPAIS_BROKER (NOLOCK)  WHERE CD_P' +
        'AIS = (SELECT CD_PAIS FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE COD' +
        'IGO = E.CD_NOTIFY2))'
      '                               END'
      '                        END'
      '       ELSE '#39#39' END AS PAIS_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN (SELECT ISNULL(END_CIDADE, '#39#39') FROM TEMPRESA_EST (NOLOCK) ' +
        'WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      
        '                            WHEN E.TP_NOTIFY2 = '#39'2'#39' THEN (SELECT' +
        ' CD_CIDADE FROM TTRANSPORTADOR_ITL WHERE CODIGO = E.CD_NOTIFY2)'
      '                        END'
      '       ELSE '#39#39' END AS CIDADE_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT ISNULL(END_ESTADO, '#39#39') FROM TEMP' +
        'RESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS ESTADO_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_TELEFONE,' +
        ' '#39#39') WHEN '#39#39' THEN '#39#39' ELSE '#39'TEL: '#39'+ISNULL(NR_TELEFONE, '#39#39') END FR' +
        'OM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      '                         ELSE '#39#39' END'
      '       ELSE '#39#39' END AS TELEFONE_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      '           WHEN '#39#39' THEN CASE'
      
        '                            WHEN E.TP_NOTIFY2 IN ('#39'0'#39', '#39'1'#39', '#39'3'#39')' +
        ' THEN'
      
        '                                (SELECT CASE ISNULL(NR_FAX, '#39#39') ' +
        'WHEN '#39#39' THEN '#39#39' ELSE '#39'FAX: '#39'+NR_FAX END FROM TEMPRESA_EST (NOLOC' +
        'K) WHERE CD_EMPRESA = E.CD_NOTIFY2)'
      '                        ELSE '#39#39' END'
      '       ELSE '#39#39' END AS FAX_NOTIFY2,'
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_RUC, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'RUC: '#39'+NR_RUC END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS RUC_NOTIFY2,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_NIT, '#39#39') WHEN '#39#39' ' +
        'THEN '#39#39' ELSE '#39'NIT: '#39'+NR_NIT END FROM TEMPRESA_EST (NOLOCK) WHERE' +
        ' CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS NIT_NOTIFY2,'
      ''
      '       CASE ISNULL(CONVERT(VARCHAR(100), EC.TX_NOTIFY2), '#39#39')'
      
        '           WHEN '#39#39' THEN (SELECT CASE ISNULL(NR_CUIT, '#39#39') WHEN '#39#39 +
        ' THEN '#39#39' ELSE '#39'CUIT: '#39'+NR_CUIT END FROM TEMPRESA_EST (NOLOCK) WH' +
        'ERE CD_EMPRESA = E.CD_NOTIFY2)'
      '       ELSE '#39#39' END AS CUIT_NOTIFY2,'
      ''
      ''
      '       (CASE'
      
        '          WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) ' +
        'WHERE CD_SERVICO = P.CD_SERVICO) IN ('#39'01'#39', '#39'12'#39', '#39'02'#39') THEN'
      
        '               (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOCK) W' +
        'HERE CD_EMBARCACAO = P.CD_EMBARCACAO)'
      
        '          WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK)W' +
        'HERE CD_SERVICO = P.CD_SERVICO) IN ('#39'07'#39') THEN (P.NR_CAMINHAO)'
      
        '          WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) ' +
        'WHERE CD_SERVICO = P.CD_SERVICO) IN ('#39'04'#39') THEN (P.NR_VOO)'
      '        END) AS TRANSPORTE,'
      '        P.NR_CONHECIMENTO, P.NR_CONHECIMENTO_MASTER,'
      '       (CASE'
      '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN NM_TERMO_PAGTO  '
      '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN TX_TERMO_INGLES '
      '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN TX_TERMO_ESP '
      '        END) AS TERMO_PAGTO,'
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.C' +
        'D_LOCAL_ORIGEM) NM_LOCAL_ORIGEM,'
      '       (CASE'
      '         WHEN E.CD_LINGUA_PEDIDO IN ('#39'0'#39','#39'2'#39') THEN '#39'BRASIL'#39
      
        '    '#9#9' ELSE (CASE WHEN (SELECT CD_GRUPO FROM TPROCESSO  WHERE NR' +
        '_PROCESSO = E.NR_PROCESSO) IN ('#39'028'#39', '#39'923'#39','#39'329'#39') THEN '#39'BRASIL'#39
      
        #9#9'      '#9'   ELSE '#39'BRAZIL'#39' END)-- ALTERADO PARA SER APRESENTADO E' +
        'M PORTUGUES, INDEPENDETE DO IDIOMA PARA SG ANDR'#201' 03/08/2009'
      '       END) AS NM_PAIS_ORIGEM,'
      
        '       (SELECT L.DESCRICAO + '#39' - '#39' + ISNULL(L.CD_UF,'#39#39') + '#39' - '#39' ' +
        'FROM TLOCAL_EMBARQUE L WHERE L.CODIGO = E.CD_LOCAL_ORIGEM) NM_LO' +
        'CAL_ORIGEM_AJI,       '
      
        '       (SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = E.C' +
        'D_LOCAL_DESTINO) NM_LOCAL_DESTINO,'
      '       (CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_PAIS_POR' +
        'T FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = E.CD_PAIS_DESTINO)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_PAIS_ING' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = E.CD_PAIS_DESTINO)'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_PAIS_ESP' +
        ' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = E.CD_PAIS_DESTINO)'
      '        END) NM_PAIS_DESTINO,'
      '       CONVERT(DECIMAL(16,3), E.VL_TOT_QTDE_PROD) AS QTDE,'
      
        '       CONVERT(DECIMAL(16,3), E.VL_PESO_LIQUIDO) AS PESO_LIQUIDO' +
        ','
      '       CONVERT(DECIMAL(16,3), E.VL_PESO_BRUTO) AS PESO_BRUTO,'
      '       CONVERT(DECIMAL(16,3), E.VL_TOT_CUBAGEM) AS CUBAGEM,'
      '       CONVERT(DECIMAL(16,2), E.VL_TOT_FOB) AS TOTAL_FOB,'
      '       CONVERT(DECIMAL(16,2), E.VL_DESCONTO) AS TOTAL_DESC,'
      
        '       CONVERT(DECIMAL(16,2), E.VL_TOT_FOB) - CONVERT(DECIMAL(16' +
        ',2), E.VL_DESCONTO) AS SUB_TOT,'
      '       CONVERT(DECIMAL(16,2), E.VL_FRETE) AS FRETE,'
      '       CONVERT(DECIMAL(16,2), E.VL_SEGURO) AS SEGURO,'
      
        '       CONVERT(DECIMAL(16,2), E.VL_TOT_MCV) TOTAL_MCV, E.CD_INCO' +
        'TERM,'
      
        '       CONVERT(DECIMAL(16,2), E.VL_TOT_DESPESA) AS TOTAL_DESPESA' +
        ','
      '       CONVERT(DECIMAL(16,2), E.VL_FRETE_INT) FRETE_INTERNO,'
      '       E.NR_FATURA,'
      '       DATEPART(DD, E.DT_FATURA) DIA_FATURA,'
      '       DATEPART(MM, E.DT_FATURA) MES_FATURA,'
      '       DATEPART(YYYY, E.DT_FATURA) ANO_FATURA,'
      '       E.TX_DECL_ADICIONAL, P.TX_MERCADORIA,'
      '       E.CD_LINGUA_PEDIDO,'
      '       ISNULL(MB.AP_MOEDA, '#39#39') AS SIGLA_MOEDA,'
      '       (CASE'
      
        '          WHEN P.TP_BANCO_EXP = '#39'1'#39' THEN (SELECT NM_EMPRESA FROM' +
        ' TEMPRESA_EST WHERE CD_EMPRESA = P.CD_BANCO_EXP)'
      '        ELSE'
      '          (CASE'
      '             WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN '#39'N'#195'O POSSUI'#39
      '             WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN '#39'NO CHARGE'#39
      '             WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN '#39'NO TIENE'#39
      '           END) '
      '        END) AS NOME_BANCO,'
      '        (CASE'
      
        '          WHEN P.TP_BANCO_EXP = '#39'1'#39' THEN (SELECT RTRIM(LTRIM(END' +
        '_EMPRESA)) + '#39', '#39' + '
      
        '                                                 RTRIM(LTRIM(END' +
        '_NUMERO))  FROM TEMPRESA_EST WHERE CD_EMPRESA = P.CD_BANCO_EXP)'
      '         END) AS END_BANCO,'
      '         E.TX_MARCACAO_VOLUME,'
      '         E.TX_INF_EMBALAGEM,'
      '         CASE ISNULL(TX_LOGOMARCA, '#39#39')'
      '           WHEN '#39#39' THEN ( '#39'C:\DDBroker\SG_ABRASIVES.bmp'#39' )'
      '           ELSE ( '#39'C:\DDBroker\'#39' + E.TX_LOGOMARCA )'
      '         END AS TX_LOGOMARCA,'
      ''
      '/*'
      '         CASE E.CD_TIPO_FRETE'
      
        '           WHEN '#39'0'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_ORIGEM)'
      
        '           WHEN '#39'1'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_DESTINO)'
      '         END AS LOCAL_TOTAL,'
      '*/'
      ''
      '        Upper( CASE substring(E.CD_INCOTERM,1,1)'
      
        '           when '#39'E'#39' THEN (SELECT END_CIDADE FROM TEMPRESA_NAC WH' +
        'ERE CD_EMPRESA= E.CD_EXPORTADOR )'
      
        '           WHEN '#39'F'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_ORIGEM)'
      
        '           WHEN '#39'C'#39' THEN (SELECT DESCRICAO FROM TLOCAL_EMBARQUE ' +
        'WHERE CODIGO = E.CD_LOCAL_DESTINO)'
      '           WHEN '#39'D'#39' THEN EE1.END_CIDADE'
      ''
      '         END) AS LOCAL_TOTAL,'
      ''
      ''
      ''
      '         CASE E.CD_TIPO_FRETE'
      '           WHEN '#39'0'#39' THEN EC.NM_LOCAL_ORIGEM'
      '           WHEN '#39'1'#39' THEN EC.NM_LOCAL_DESTINO'
      '         END AS LOCAL_TOTAL_CARTA,'
      
        '         (CASE ISNULL((SELECT CD_VIA_TRANSPORTE FROM TSERVICO WH' +
        'ERE CD_SERVICO = P.CD_SERVICO), '#39#39')'
      '           WHEN '#39'04'#39' THEN '#39'FCA'#39
      '           WHEN '#39'07'#39' THEN '#39'FCA'#39
      '           WHEN '#39'06'#39' THEN '#39'FCA'#39
      '           ELSE '#39'FOB'#39
      '         END) AS INCOTERM_MERC,'
      ' '#9' EC.TX_IMPORTADOR, EC.TX_EXPORTADOR, EC.TX_CONSIGNATARIO,'
      ' '#9' EC.TX_NOTIFY1, EC.TX_NOTIFY2, EC.TX_DOCTO, EC.TX_COPIA, '
      #9' EC.TX_SAQUE, EC.NM_UNID_MED_PL, EC.NM_UNID_MED_PB, '
      #9' EC.NM_LOCAL_DESTINO, EC.NM_LOCAL_ORIGEM, EC.NM_PAIS_DESTINO,'
      
        #9' EC.NM_PAIS_ORIGEM, EC.TX_TERMO_PAGTO, '#9'CASE E.CD_INCOTERM when' +
        ' '#39'EXW'#39' then '#39'EXW'#39' else CASE E.CD_VIA_TRANSPORTE'#9'      '#9'when '#39'01'#39 +
        ' then '#39'FOB'#39' when '#39'04'#39' then '#39'FCA'#39' when '#39'07'#39' then '#39'FCA'#39' END'#9'end as' +
        ' INCOTERM2,'
      '  (CASE'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT NM_VIA_TRANSP FR' +
        'OM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD_VIA_TR' +
        'ANSPORTE) + '#39' Frete / '#39
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT NM_VIA_TRANSP_IN' +
        'GLES FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD' +
        '_VIA_TRANSPORTE) + '#39' Freight / '#39
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT NM_VIA_TRANSP_ES' +
        'P FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = E.CD_VI' +
        'A_TRANSPORTE) + '#39' Frete / '#39
      '   END) AS VIA_AJI,'
      
        '  (SELECT C.NM_CONTATO FROM TCLIENTE_CONTATO C (NOLOCK) WHERE C.' +
        'CD_CLIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG AND ' +
        'P.CD_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO) NM_' +
        'CONTATO,'
      '  (CASE'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN (SELECT TX_CARGO + '#39' - '#39 +
        ' + TX_DEPARTAMENTO FROM TCLIENTE_CONTATO C (NOLOCK) WHERE C.CD_C' +
        'LIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG AND P.CD' +
        '_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO)'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN (SELECT TX_CARGO_ING + '#39 +
        ' - '#39' + TX_DEPARTAMENTO_ING FROM TCLIENTE_CONTATO C (NOLOCK) WHER' +
        'E C.CD_CLIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG ' +
        'AND P.CD_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO)'
      
        '     WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN (SELECT TX_CARGO_ESP + '#39 +
        ' - '#39' + TX_DEPARTAMENTO_ESP FROM TCLIENTE_CONTATO C (NOLOCK) WHER' +
        'E C.CD_CLIENTE = P.CD_CLIENTE AND P.CD_UNID_NEG = C.CD_UNID_NEG ' +
        'AND P.CD_PRODUTO = C.CD_PRODUTO AND P.CD_CONTATO = C.CD_CONTATO)'
      '   END) AS CONTATO_CARGO,'
      '   E.CD_IMPORTADOR   '
      'FROM TPROCESSO_EXP E (NOLOCK)'
      
        '       INNER JOIN TPROCESSO_EXP_ITEM EI (NOLOCK) ON EI.NR_PROCES' +
        'SO = E.NR_PROCESSO'
      
        '       LEFT JOIN TEMPRESA_EST EE1 (NOLOCK) ON EE1.CD_EMPRESA = E' +
        '.CD_IMPORTADOR'
      
        '       LEFT JOIN TTERMO_PAGTO TP (NOLOCK) ON TP.CD_TERMO_PAGTO =' +
        ' E.CD_TERMO_PAGTO'
      
        '            JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = E.NR_PR' +
        'OCESSO'
      
        '       LEFT JOIN TEXP_CARTA_CRED EC (NOLOCK) ON EC.NR_PROCESSO =' +
        ' E.NR_PROCESSO'
      '       LEFT JOIN TMOEDA_BROKER MB ON MB.CD_MOEDA = E.CD_MOEDA'
      'WHERE E.NR_PROCESSO = :PROCESSO')
    Left = 424
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_CUITNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_CUITNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_CUITEND_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 41
    end
    object qry_CUITEND_ESTADO: TStringField
      FieldName = 'END_ESTADO'
      FixedChar = True
      Size = 30
    end
    object qry_CUITNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
    end
    object qry_CUITNR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
    end
    object qry_CUITNR_RUC: TStringField
      FieldName = 'NR_RUC'
      FixedChar = True
      Size = 30
    end
    object qry_CUITNR_NIT: TStringField
      FieldName = 'NR_NIT'
      FixedChar = True
      Size = 30
    end
    object qry_CUITNR_CUIT: TStringField
      FieldName = 'NR_CUIT'
      FixedChar = True
      Size = 31
    end
    object qry_CUITNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      FixedChar = True
      Size = 50
    end
    object qry_CUITEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_CUITCLIENTE: TStringField
      FieldName = 'CLIENTE'
      FixedChar = True
      Size = 80
    end
    object qry_CUITEND_CLIENTE: TStringField
      FieldName = 'END_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_CUITNUM_CLIENTE: TStringField
      FieldName = 'NUM_CLIENTE'
      FixedChar = True
      Size = 6
    end
    object qry_CUITCOMPL_CLIENTE: TStringField
      FieldName = 'COMPL_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_CUITCIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      FixedChar = True
      Size = 30
    end
    object qry_CUITUF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      FixedChar = True
      Size = 2
    end
    object qry_CUITCEP_CLIENTE: TStringField
      FieldName = 'CEP_CLIENTE'
      FixedChar = True
      Size = 8
    end
    object qry_CUITTEL_CLIENTE: TStringField
      FieldName = 'TEL_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_CUITFAX_CLIENTE: TStringField
      FieldName = 'FAX_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_CUITCGC_CLIENTE: TStringField
      FieldName = 'CGC_CLIENTE'
      FixedChar = True
      Size = 23
    end
    object qry_CUITVIA: TStringField
      FieldName = 'VIA'
      FixedChar = True
    end
    object qry_CUITNM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_CONSIGNATARIO: TStringField
      FieldName = 'END_CONSIGNATARIO'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_CONSIGNATARIO_2: TStringField
      FieldName = 'END_CONSIGNATARIO_2'
      FixedChar = True
      Size = 100
    end
    object qry_CUITPAIS_CONSIGNATARIO: TStringField
      FieldName = 'PAIS_CONSIGNATARIO'
      FixedChar = True
      Size = 50
    end
    object qry_CUITCIDADE_CONSIGNATARIO: TStringField
      FieldName = 'CIDADE_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qry_CUITESTADO_CONSIG: TStringField
      FieldName = 'ESTADO_CONSIG'
      FixedChar = True
      Size = 30
    end
    object qry_CUITTELEFONE_CONSIGNATARIO: TStringField
      FieldName = 'TELEFONE_CONSIGNATARIO'
      FixedChar = True
    end
    object qry_CUITFAX_CONSIGNATARIO: TStringField
      FieldName = 'FAX_CONSIGNATARIO'
      FixedChar = True
    end
    object qry_CUITRUC_CONSIGNATARIO: TStringField
      FieldName = 'RUC_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qry_CUITNIT_CONSIGNATARIO: TStringField
      FieldName = 'NIT_CONSIGNATARIO'
      FixedChar = True
      Size = 30
    end
    object qry_CUITCUIT_CONSIGNATARIO: TStringField
      FieldName = 'CUIT_CONSIGNATARIO'
      FixedChar = True
      Size = 31
    end
    object qry_CUITNM_NOTIFY: TStringField
      FieldName = 'NM_NOTIFY'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_NOTIFY: TStringField
      FieldName = 'END_NOTIFY'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_NOTIFY_2: TStringField
      FieldName = 'END_NOTIFY_2'
      FixedChar = True
      Size = 100
    end
    object qry_CUITPAIS_NOTIFY: TStringField
      FieldName = 'PAIS_NOTIFY'
      FixedChar = True
      Size = 50
    end
    object qry_CUITCIDADE_NOTIFY: TStringField
      FieldName = 'CIDADE_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_CUITESTADO_NOTIFY: TStringField
      FieldName = 'ESTADO_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_CUITTELEFONE_NOTIFY: TStringField
      FieldName = 'TELEFONE_NOTIFY'
      FixedChar = True
    end
    object qry_CUITFAX_NOTIFY: TStringField
      FieldName = 'FAX_NOTIFY'
      FixedChar = True
    end
    object qry_CUITRUC_NOTIFY: TStringField
      FieldName = 'RUC_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_CUITNIT_NOTIFY: TStringField
      FieldName = 'NIT_NOTIFY'
      FixedChar = True
      Size = 30
    end
    object qry_CUITCUIT_NOTIFY: TStringField
      FieldName = 'CUIT_NOTIFY'
      FixedChar = True
      Size = 31
    end
    object qry_CUITCONTATO_NOTIFY: TStringField
      FieldName = 'CONTATO_NOTIFY'
      FixedChar = True
      Size = 50
    end
    object qry_CUITCD_NOTIFY2: TStringField
      FieldName = 'CD_NOTIFY2'
      FixedChar = True
      Size = 5
    end
    object qry_CUITNM_NOTIFY2: TStringField
      FieldName = 'NM_NOTIFY2'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_NOTIFY2: TStringField
      FieldName = 'END_NOTIFY2'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_NOTIFY2_2: TStringField
      FieldName = 'END_NOTIFY2_2'
      FixedChar = True
      Size = 100
    end
    object qry_CUITPAIS_NOTIFY2: TStringField
      FieldName = 'PAIS_NOTIFY2'
      FixedChar = True
      Size = 50
    end
    object qry_CUITCIDADE_NOTIFY2: TStringField
      FieldName = 'CIDADE_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_CUITESTADO_NOTIFY2: TStringField
      FieldName = 'ESTADO_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_CUITTELEFONE_NOTIFY2: TStringField
      FieldName = 'TELEFONE_NOTIFY2'
      FixedChar = True
    end
    object qry_CUITFAX_NOTIFY2: TStringField
      FieldName = 'FAX_NOTIFY2'
      FixedChar = True
    end
    object qry_CUITRUC_NOTIFY2: TStringField
      FieldName = 'RUC_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_CUITNIT_NOTIFY2: TStringField
      FieldName = 'NIT_NOTIFY2'
      FixedChar = True
      Size = 30
    end
    object qry_CUITCUIT_NOTIFY2: TStringField
      FieldName = 'CUIT_NOTIFY2'
      FixedChar = True
      Size = 31
    end
    object qry_CUITTRANSPORTE: TStringField
      FieldName = 'TRANSPORTE'
      FixedChar = True
      Size = 40
    end
    object qry_CUITNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_CUITNR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      FixedChar = True
      Size = 30
    end
    object qry_CUITTERMO_PAGTO: TMemoField
      FieldName = 'TERMO_PAGTO'
      BlobType = ftMemo
    end
    object qry_CUITNM_LOCAL_ORIGEM: TStringField
      FieldName = 'NM_LOCAL_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_CUITNM_PAIS_ORIGEM: TStringField
      FieldName = 'NM_PAIS_ORIGEM'
      FixedChar = True
      Size = 6
    end
    object qry_CUITNM_LOCAL_ORIGEM_AJI: TStringField
      FieldName = 'NM_LOCAL_ORIGEM_AJI'
      FixedChar = True
      Size = 58
    end
    object qry_CUITNM_LOCAL_DESTINO: TStringField
      FieldName = 'NM_LOCAL_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_CUITNM_PAIS_DESTINO: TStringField
      FieldName = 'NM_PAIS_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_CUITQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qry_CUITPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object qry_CUITPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object qry_CUITCUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
    end
    object qry_CUITTOTAL_FOB: TFloatField
      FieldName = 'TOTAL_FOB'
    end
    object qry_CUITTOTAL_DESC: TFloatField
      FieldName = 'TOTAL_DESC'
    end
    object qry_CUITSUB_TOT: TFloatField
      FieldName = 'SUB_TOT'
    end
    object qry_CUITFRETE: TFloatField
      FieldName = 'FRETE'
    end
    object qry_CUITSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
    object qry_CUITTOTAL_MCV: TFloatField
      FieldName = 'TOTAL_MCV'
    end
    object qry_CUITCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_CUITTOTAL_DESPESA: TFloatField
      FieldName = 'TOTAL_DESPESA'
    end
    object qry_CUITFRETE_INTERNO: TFloatField
      FieldName = 'FRETE_INTERNO'
    end
    object qry_CUITNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_CUITDIA_FATURA: TIntegerField
      FieldName = 'DIA_FATURA'
    end
    object qry_CUITMES_FATURA: TIntegerField
      FieldName = 'MES_FATURA'
    end
    object qry_CUITANO_FATURA: TIntegerField
      FieldName = 'ANO_FATURA'
    end
    object qry_CUITTX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object qry_CUITTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_CUITCD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_CUITSIGLA_MOEDA: TStringField
      FieldName = 'SIGLA_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_CUITNOME_BANCO: TStringField
      FieldName = 'NOME_BANCO'
      FixedChar = True
      Size = 100
    end
    object qry_CUITEND_BANCO: TStringField
      FieldName = 'END_BANCO'
      FixedChar = True
      Size = 108
    end
    object qry_CUITTX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object qry_CUITTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_CUITTX_LOGOMARCA: TStringField
      FieldName = 'TX_LOGOMARCA'
      FixedChar = True
      Size = 37
    end
    object qry_CUITLOCAL_TOTAL: TStringField
      FieldName = 'LOCAL_TOTAL'
      FixedChar = True
      Size = 50
    end
    object qry_CUITLOCAL_TOTAL_CARTA: TStringField
      FieldName = 'LOCAL_TOTAL_CARTA'
      FixedChar = True
      Size = 50
    end
    object qry_CUITINCOTERM_MERC: TStringField
      FieldName = 'INCOTERM_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_CUITTX_IMPORTADOR: TMemoField
      FieldName = 'TX_IMPORTADOR'
      BlobType = ftMemo
    end
    object qry_CUITTX_EXPORTADOR: TMemoField
      FieldName = 'TX_EXPORTADOR'
      BlobType = ftMemo
    end
    object qry_CUITTX_CONSIGNATARIO: TMemoField
      FieldName = 'TX_CONSIGNATARIO'
      BlobType = ftMemo
    end
    object qry_CUITTX_NOTIFY1: TMemoField
      FieldName = 'TX_NOTIFY1'
      BlobType = ftMemo
    end
    object qry_CUITTX_NOTIFY2: TMemoField
      FieldName = 'TX_NOTIFY2'
      BlobType = ftMemo
    end
    object qry_CUITTX_DOCTO: TMemoField
      FieldName = 'TX_DOCTO'
      BlobType = ftMemo
    end
    object qry_CUITTX_COPIA: TMemoField
      FieldName = 'TX_COPIA'
      BlobType = ftMemo
    end
    object qry_CUITTX_SAQUE: TMemoField
      FieldName = 'TX_SAQUE'
      BlobType = ftMemo
    end
    object qry_CUITNM_UNID_MED_PL: TStringField
      FieldName = 'NM_UNID_MED_PL'
      FixedChar = True
      Size = 6
    end
    object qry_CUITNM_UNID_MED_PB: TStringField
      FieldName = 'NM_UNID_MED_PB'
      FixedChar = True
      Size = 6
    end
    object qry_CUITNM_LOCAL_DESTINO_1: TStringField
      FieldName = 'NM_LOCAL_DESTINO_1'
      FixedChar = True
      Size = 50
    end
    object qry_CUITNM_LOCAL_ORIGEM_1: TStringField
      FieldName = 'NM_LOCAL_ORIGEM_1'
      FixedChar = True
      Size = 50
    end
    object qry_CUITNM_PAIS_DESTINO_1: TStringField
      FieldName = 'NM_PAIS_DESTINO_1'
      FixedChar = True
      Size = 120
    end
    object qry_CUITNM_PAIS_ORIGEM_1: TStringField
      FieldName = 'NM_PAIS_ORIGEM_1'
      FixedChar = True
      Size = 120
    end
    object qry_CUITTX_TERMO_PAGTO: TMemoField
      FieldName = 'TX_TERMO_PAGTO'
      BlobType = ftMemo
    end
    object qry_CUITINCOTERM2: TStringField
      FieldName = 'INCOTERM2'
      FixedChar = True
      Size = 3
    end
    object qry_CUITVIA_AJI: TStringField
      FieldName = 'VIA_AJI'
      FixedChar = True
      Size = 31
    end
    object qry_CUITNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_CUITCONTATO_CARGO: TStringField
      FieldName = 'CONTATO_CARGO'
      FixedChar = True
      Size = 78
    end
    object qry_CUITCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
  end
end

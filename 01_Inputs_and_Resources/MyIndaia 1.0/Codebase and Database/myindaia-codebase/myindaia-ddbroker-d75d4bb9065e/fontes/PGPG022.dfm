object datm_sel_unid_cli_grupo_item: Tdatm_sel_unid_cli_grupo_item
  OldCreateOrder = True
  Left = 256
  Top = 79
  Height = 501
  Width = 731
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 178
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_grupo_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO_ITEM, NM_GRUPO_ITEM'
      'FROM   TGRUPO_ITEM'
      'WHERE  CD_GRUPO_ITEM = :CD_GRUPO_ITEM')
    Left = 178
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO_ITEM'
        ParamType = ptUnknown
      end>
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 43
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
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
      'SELECT *'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Left = 43
    Top = 74
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
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
    object qry_grupo_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TGRUPO.DT_INCLUSAO'
    end
    object qry_grupo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TGRUPO.IN_ATIVO'
      Size = 1
    end
  end
  object sp_rel_pagto_pend: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_pagto_pend'
    Left = 50
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo_item'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_analista_comissaria'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_pendentes'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_desemb'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
        Value = 2
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_faturado'
        ParamType = ptInput
      end>
  end
  object sp_rel_pagto_razao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_pagto_razao'
    Left = 178
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo_item'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM   TUSUARIO'
      'WHERE  CD_USUARIO = :CD_USUARIO ')
    Left = 43
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object sp_rel_resumo_fat: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_resumo_fat'
    Left = 293
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo_item'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_trel_erro_resumo_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_IDENTIFICADOR, CD_ITEM, CD_UNID_NEG, '
      '                    NM_DESPESA'
      'FROM TREL_ERRO_RESUMO_FAT'
      'WHERE NR_IDENTIFICADOR =:NR_IDENTIFICADOR'
      'GROUP BY NR_IDENTIFICADOR, CD_ITEM, CD_UNID_NEG, '
      '                    NM_DESPESA')
    Left = 176
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
    object qry_trel_erro_resumo_fat_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TREL_ERRO_RESUMO_FAT.NR_IDENTIFICADOR'
    end
    object qry_trel_erro_resumo_fat_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TREL_ERRO_RESUMO_FAT.CD_ITEM'
      Size = 3
    end
    object qry_trel_erro_resumo_fat_NM_DESPESA: TStringField
      FieldName = 'NM_DESPESA'
      Origin = 'TREL_ERRO_RESUMO_FAT.NM_DESPESA'
      Size = 50
    end
    object qry_trel_erro_resumo_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TREL_ERRO_RESUMO_FAT.CD_UNID_NEG'
      Size = 2
    end
  end
  object sp_rel_resumo_fat_itens: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_resumo_fat_itens'
    Left = 421
    Top = 194
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo_item'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_pagto_pendente_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        '  SELECT SUM(A) AS SALDO, A.CD_GRUPO, A.CD_CLIENTE, A.NR_PROCESS' +
        'O, A.NM_EMPRESA, A.CD_ITEM, A.NM_ITEM, A.NM_GRUPO,'
      '    (SELECT TOP 1 CONVERT(VARCHAR, FAT1.DT_LANCAMENTO, 103)'
      '    '#9#9'FROM TFATURAMENTO_CC FAT1'
      
        '    '#9#9'WHERE FAT1.NR_PROCESSO = A.NR_PROCESSO AND FAT1.CD_ITEM = ' +
        'A.CD_ITEM AND FAT1.IN_RESTITUI = 0 AND FAT1.IN_FATURADO = 0'
      '    '#9#9'ORDER BY FAT1.DT_LANCAMENTO DESC ) AS  DATA,'
      '    (SELECT TOP 1 NR_CHEQUE'
      '    '#9'  FROM TFATURAMENTO_CC FAT1'
      
        '    '#9#9'WHERE FAT1.NR_PROCESSO = A.NR_PROCESSO AND FAT1.CD_ITEM = ' +
        'A.CD_ITEM AND FAT1.IN_RESTITUI = 0 AND FAT1.IN_FATURADO = 0'
      '    '#9#9'ORDER BY FAT1.DT_LANCAMENTO DESC) AS  NR_CHEQUE,'
      '    (SELECT TOP 1 AP_BANCO'
      '    '#9#9'FROM TFATURAMENTO_CC FAT1, TBANCO B'
      
        '    '#9#9'WHERE FAT1.NR_PROCESSO = A.NR_PROCESSO AND FAT1.CD_BANCO =' +
        ' B.CD_BANCO AND FAT1.CD_ITEM = A.CD_ITEM'
      '    '#9#9#9'  AND FAT1.IN_RESTITUI = 0 AND FAT1.IN_FATURADO = 0'
      '    '#9#9'ORDER BY FAT1.DT_LANCAMENTO DESC ) AS AP_BANCO'
      
        '  FROM  (SELECT SUM(FAT.VL_ITEM) A, SUBSTRING(FAT.NR_PROCESSO, 5' +
        ', 10) NR_PROCESSO , G.NM_GRUPO, P.CD_GRUPO,'
      '     '#9#9#9#9'  P.CD_CLIENTE, EM.NM_EMPRESA, FAT.CD_ITEM, I.NM_ITEM'
      '         FROM TFATURAMENTO_CC FAT (NOLOCK)'
      
        '           INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = FA' +
        'T.NR_PROCESSO'
      
        '           INNER JOIN TEMPRESA_NAC EM (NOLOCK) ON EM.CD_EMPRESA ' +
        '= P.CD_CLIENTE'
      
        '           INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EM.CD_GR' +
        'UPO'
      
        '           INNER JOIN TITEM I (NOLOCK) ON I.CD_ITEM = FAT.CD_ITE' +
        'M'
      
        '         WHERE FAT.NR_PROCESSO in ( SELECT NR_PROCESSO FROM TFAT' +
        'URAMENTO_CC B where IN_FATURADO = 1 )'
      '           AND FAT.IN_FATURADO = 0'
      '           AND FAT.IN_RESTITUI = 0'
      '           AND FAT.IN_CANCELADO = 0'
      
        '           AND FAT.CD_ITEM NOT IN ('#39'991'#39', '#39'992'#39', '#39'993'#39', '#39'995'#39', '#39 +
        '996'#39', '#39'997'#39', '#39'998'#39')'
      '           AND FAT.DT_LANCAMENTO BETWEEN :DT_INICIO AND :DT_FIM'
      '    AND P.CD_UNID_NEG = '#39'01'#39' '
      '    AND P.CD_PRODUTO = '#39'01'#39' '
      
        '    GROUP BY P.CD_GRUPO, P.CD_CLIENTE, FAT.NR_PROCESSO, EM.NM_EM' +
        'PRESA, FAT.CD_ITEM, I.NM_ITEM, G.NM_GRUPO, FAT.CD_BANCO'
      '  UNION ALL'
      
        '    SELECT SUM(FAT.VL_ITEM)* -1 A, SUBSTRING(FAT.NR_PROCESSO, 5,' +
        ' 10) NR_PROCESSO , G.NM_GRUPO, P.CD_GRUPO,'
      '      P.CD_CLIENTE, EM.NM_EMPRESA, FAT.CD_ITEM, I.NM_ITEM'
      '    FROM TFATURAMENTO_CC FAT (NOLOCK)'
      
        '      INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = FAT.NR_' +
        'PROCESSO'
      
        '      INNER JOIN TEMPRESA_NAC EM (NOLOCK) ON EM.CD_EMPRESA = P.C' +
        'D_CLIENTE'
      '      INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EM.CD_GRUPO'
      '      INNER JOIN TITEM I (NOLOCK) ON I.CD_ITEM = FAT.CD_ITEM'
      
        '    WHERE FAT.NR_PROCESSO in ( SELECT NR_PROCESSO FROM TFATURAME' +
        'NTO_CC B where IN_FATURADO = 1 )'
      '      AND FAT.IN_FATURADO = 0'
      '      AND FAT.IN_RESTITUI = 1'
      '      AND FAT.IN_CANCELADO = 0'
      
        '      AND FAT.CD_ITEM NOT IN ('#39'991'#39', '#39'992'#39', '#39'993'#39', '#39'995'#39', '#39'996'#39',' +
        ' '#39'997'#39', '#39'998'#39')'
      '      AND FAT.DT_LANCAMENTO BETWEEN :DT_INICIO AND :DT_FIM'
      '    AND P.CD_UNID_NEG = '#39'01'#39' '
      '    AND P.CD_PRODUTO = '#39'01'#39' '
      
        '      '#9#9'GROUP BY P.CD_GRUPO, P.CD_CLIENTE, FAT.NR_PROCESSO, EM.N' +
        'M_EMPRESA, FAT.CD_ITEM, I.NM_ITEM, G.NM_GRUPO, FAT.CD_BANCO) A'
      
        '    GROUP BY A.CD_GRUPO, A.CD_CLIENTE, A.NR_PROCESSO, A.NM_EMPRE' +
        'SA, A.CD_ITEM, A.NM_ITEM, A.NM_GRUPO'
      '  HAVING SUM(A) <> 0'
      
        '  ORDER BY A.NM_GRUPO, A.CD_CLIENTE, A.NM_EMPRESA, A.NR_PROCESSO' +
        ', A.CD_ITEM')
    Left = 152
    Top = 304
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qry_pagto_pendente_SALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qry_pagto_pendente_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_pagto_pendente_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_pagto_pendente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 10
    end
    object qry_pagto_pendente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_pagto_pendente_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_pagto_pendente_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_pagto_pendente_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
    object qry_pagto_pendente_DATA: TStringField
      FieldName = 'DATA'
      FixedChar = True
      Size = 30
    end
    object qry_pagto_pendente_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      FixedChar = True
      Size = 6
    end
    object qry_pagto_pendente_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      FixedChar = True
      Size = 10
    end
  end
  object ds_pagto_pendente: TDataSource
    DataSet = qry_pagto_pendente_
    Left = 216
    Top = 304
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = BDERel_PagtoPendente
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report2'
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
    Template.FileName = 'C:\DDBroker\Rel_PagtoPendente.rtm'
    Units = utPrinterPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 80
    Top = 304
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDERel_PagtoPendente'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'Rela'#231#227'o de Pagamentos Pendentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 109538
        mmTop = 19050
        mmWidth = 94721
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        AutoSize = True
        MaintainAspectRatio = False
        Picture.Data = {
          0954474946496D616765E90C0000474946383961B4004500D50000FFFFFFF6FE
          FDF7F8FAECF7F6E9EFF2DFEFF5D5EBF2DFE7ECC6E7EFD4DFE6BFE0EBD1D8E0B1
          DDE6B1D9E5C4D4DDC0CED7A1D2E3B7C4D193CBDE86C6DDADBDCAA7BBCBA4B5C4
          7CBDD772BCD69CB0C06BB8D594ACBE5BB5D582AAC053B4D58EA4B65AAED252AD
          D553ACCD49ADCE4AACD6879CAF45A2CD7B95AB7392A9758BA367849F5D7B9538
          7DA35274904C6B8A416A8D3366993B6384385A7E2F5A7D2B527821496F1A436B
          1742720F427310416C133D640B3A6A083863003366042F5A00275821F9040414
          0000002C00000000B40045000006FF408070482C1A8FC8A472C96C3A9FD0A874
          4AAD5AAFD8AC76CBED7ABFE0B0784C2E9BCFE8B47ACD6EBBDFF0B87C4EAF630D
          0C8664226934100503768384420A182222248B8C891A17100A0585946F102323
          201E9B1E21989F9F1E170D060195A76608229C9B241C131079797B181C242626
          1A100602A8BE5F1324201CC4221282480308101320B8BA06BFD2591821D6D612
          4FCA121CB8180CC8D3E250C19C20934801030501A6430208121E262010E8E3F8
          4A97C42118EE45F16A71D0F04882A4770A2E609A102D9FC322064410F3A021DC
          900623485CDB1802040683C80A48000143C5899327517C58E320054A94290E6C
          21F012660426095CBE44A1228116FF449B40341C520084D1A320466C1C818B83
          04044216F0E841B5EA0F176B4EFCA85A95874F2D11B672EDF123C31201327E4C
          A5FAE347895E5914ACF240A201C4B99BFA91326000410309889E31C8C003C78D
          C3877B9458D38207E2C33B6270D9E0F8F1E1054B4EF878DCA3C6832E185C85D0
          0057485156182C1229C0608227163B7258E6D1418D80193B66AFE0A2A287E51C
          34541789501887F11E2E64768978CD2E916AD64638573240018CD8BF4D5C807A
          26810DD99C176F91E1838779F357951CB0517E6D8A7F5D2E05BD0780C1DCBA4E
          64E47EBC63C621ED438D419C6537F07093160244A0E0821150F015120744F0C0
          84128E71812B245C404400D085A0FF214EDF59B6C30B8668E09470441CB0C002
          281E3140020B2827C407BE3D96430E321A2100012BAE4840695BEC78C0902D72
          518006D1414044449B88C09D121454C61F0C184095000C58A2A0A596040090C0
          0931D4A0830E34B470E0110264D0020D37DA20434C00F426E20C404655420B33
          8879630E35D0F0820A14C027C4033AED94A3100964A0420C347C77639F31AC90
          41975F18C089080A10010186FEB423E8101F6C36DB0918983041093EECB00357
          3910B0410E3DC4B6670F3C9C7084033250B5670EABDA40C10BD821C6C36E4438
          E0C2AAB1CABA2BB2323850440A62B14AA91007A8006BB2BBCEDA830D667D2197
          35E71031C1081E8CA0A4122BD4F8FF980E0904000107D7659B430C2AF8609C0D
          363C86830F670A11410E528A089E658A11F1C10E3C645B1578B3DAF020002DEC
          875864C5D6D083C254490C990F1680211727430970810846658A045A1ADFB043
          70420C002C812AEF4A600FC40AE1800E3B18F6D8793CE43B33054350602F7F35
          9C50C10935EC89580F290C31000D3BF89C980A431C5043CA3AAC604106FAE99C
          980C9F6AD100099D54E4B4061A81F06411EB0D0C198943E807730F38E409F388
          44C4A0AEB02E5450C1B1C6797D430E980120000DED9DC72EA801178815A281EF
          DA43B700408BF0793E50BE800E6EE7E07018F28D901A51680BB3F61003124C35
          B58EBA7DC309269A70E36C8F0340FFC1DE87F1507B028377CEB2E10C4AF8C0C3
          15E0CE03DC0054D0B8CA9FD91CFC03CE3A9DB48D393CEC4503AB8CA0C13D035C
          48829346D03833E5A91F76E30E540F30810883EB36440BB817183D0001E0467B
          120444E8B7DF11BB2FC409B8E3D3B48A20800338607F142841B02043833A7941
          01D7E040C814220C930D414E226A1E00C4472013380702C62198AD005080E9F1
          4732EFB01F6746388405DC690636D001CFCC33B39508A131224261D514152619
          56A53C04D25D19BED59127094002E412C1B984108394097008E9FACD0C34A09D
          013860793CA8C0A0169898A6552D696EEB41C784408015AC8A07CABA91795C57
          A003A18C603503C009D8B3C63DA9FF8A8B5D34830140600D113040534A098104
          7A6135D7516C084D8463002660020CA020607BFACA06B625381F6C8008C43164
          F408409EC0E14B553590410B5EC0C61B288777AEEB810DE3E4835486D2052EB0
          81E06E20C6331C29114A2482026C4182D45C7166AB034021452804087800063A
          10D1EF0028B5C45C128A17B3110D28552F11C920023FB21DDDF8432721446976
          C26A9E058666990F1CA0170408117FE65706F5916B04130847014243020DA020
          7E3D7826001E80471E004D080850A1B05A308412C48F075E044004741042BEB1
          8E8D0F3BD66C082A0483B251392F689C2A0D16C01A0CD00C1010812724388400
          48E01A2CC081C678A0C14912A87AFF4320800997C6C228C1EC751498A3D296E6
          450B04F0069412C00996573021AC2061D9EAA64C67C9833102C002E09C980ED3
          A00010682404D30140555D2102DCE4E646325241E3FA138E071486604E5D4FD4
          82789EB93D3303F18BCC49F496B23622328D0023964CA33A381A682962440DA6
          1A0CA08177C69328E322060B6E8033199426913BAB1D005C6A191DB03354A584
          D50BC0B8271CB0342A0CC5413391E59B19B8CD3885B35AE0425854B4C4EF5A54
          D92CC156B9860120D1131A585B03F8C88110C0C0073523800EC6429684026005
          D18A556754335434DE71553A28C115C7E2031D4C4B33C97AEEAA68F0001424B7
          073A400705B632C31F687150C3D5FFAEAAB695810A7CF7074E6DC35643A0C4D2
          14605C1EE0000BCE0B0002ECEFBF167858042CB0BF0DB060031A2C960A644083
          06C7E00498210081FF5B817ED96E0533C87086652029413CC00214A0000205D0
          8B044C98C2034CC0821BCCE2169853982046311BE0530085940B030152406189
          C1902A3080030A081BFD0640620736A1C845060392A701818D40E01F02804052
          322101FA40A154557243092C7C2B3825A104FFF405611991DBD5B8061320A8B2
          142292080908790C01D0010A5A160E750CE1042A30C50090612C64B8403C7B26
          4236ED10659162C3220650089A7B0C850B44271B6A08400D3E3000178CA90503
          78000D7410831624C0052720800BFF1ADC0251F780062E20800A3250E931AD20
          410CAE417CE960000CBC13040D80CF213EE1210514A9089B32CA084E5706496F
          60033FF8008D22B0821BA8C9070B98C10AC6BB02461DE0043B00B3A44F90011F
          7CA0043538C0076CD0ECA9D62100BB25573D2D68084428A29E12E0C512242011
          5BF8230DC6FE800E0CB783088C72B2D096F601186CDA053C805D1620C00C4A30
          6E000CE00407C0F00A425989FB1A5A048C1E02021CBD110D18841D46400052AC
          4AEC310820BA0FF8C10DD8B300C224F3060BA0C10A1CB00319C4C0070F5840AA
          7E10F313A43C693E48800C6AB002E0A042C78114A4950DD00C5064E22310883A
          3312C10A1240DA53E71CC3071E90FFA693002D032FB0000AA03DA1AE9FE09F62
          07DA076E9281937CC601282841062857097427852EF5504D0120A081445C8311
          8C60452B2600101CAB61033E60530B8CFC10261080DED9D3856A028080097040
          0449B786E0373102488BABF3BFFEC009DE3C850448A84E116767132290825F0F
          82E98A28972EACEC700548A0EF980FC1E6331120D3589503B946820A5CE00E4A
          05A06FEF38C00097FF8F40B7EC008288F94D045000FA38BFBF5987D6A17CB171
          4CE03DDE6832C05F04420CA364BC08AEF1C4058CCC934FBB80073138400A7C50
          831A44C0010D2E9A005A2003841E0096649200A2460335B0781660033CA00319
          30700EE000359030EFB128F87213FF29C06207A0401F250D3A7655D630010820
          64EA507DD5F76B0C402EE5B24444E00233E000C065013C50020F9003D3A66AD9
          1603ECA2032E80023A10013ED00216B00310876A2D006D8C42012B30733F1001
          2A500314502F0B307416906102F002D296391FC00319280D01B08164630D18D0
          00B417050860821E102E45C07F3A073434602B36B00112B20236A0022FF002DE
          A14530C23100300327F02FA3B4030E30034D13011FC082CC4622E3852B737602
          33900035E0028DB101579885D310000C606B2648321E487A4AA00064682E46C0
          280E50160020670040033C005F57D8028D48009614153F70494563015711033F
          A0623F50033FD0020BF00314F001FFB7A80336504254930235B0003D10032E90
          6C25F003DB970F1B177BE5A23D4FC1784970521D572714302925E01319F07625
          D0315DB78D1B543804500298D18D5D97011B400004F06D94568EED920125205D
          00D08DFB641639A58E0BE00094D67810D1741CA1011320099AA8559A60144DD2
          7BFE980F7B573A9CB0081E21010C80007BE629EA007BBBF7470BB99094D70C8B
          507510F908177001B51041C47092D2B1912A49420D700153B6791C119397A290
          2BD9780600011860551AB1793CD90A17509035890FAC310148720D8277149C87
          016118942A3900E2270117707989000A2020794C79952ED2170AB0950C2009D4
          889560199662399664599666799606689996551004003B}
        mmHeight = 18256
        mmLeft = 8202
        mmTop = 0
        mmWidth = 47625
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 26194
        mmWidth = 274373
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 13882323
        Pen.Color = 13882323
        mmHeight = 3969
        mmLeft = 265
        mmTop = 26988
        mmWidth = 274109
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 6615
        mmTop = 26988
        mmWidth = 8509
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 21696
        mmTop = 26988
        mmWidth = 9440
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Despesa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 69321
        mmTop = 26988
        mmWidth = 11599
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 171186
        mmTop = 26988
        mmWidth = 7112
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 201877
        mmTop = 26988
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 222250
        mmTop = 26988
        mmWidth = 8636
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Cheque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 251884
        mmTop = 26988
        mmWidth = 10372
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 31221
        mmWidth = 274373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NM_ITEM'
        DataPipeline = BDERel_PagtoPendente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDERel_PagtoPendente'
        mmHeight = 3260
        mmLeft = 81492
        mmTop = 0
        mmWidth = 60590
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CD_ITEM'
        DataPipeline = BDERel_PagtoPendente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDERel_PagtoPendente'
        mmHeight = 3175
        mmLeft = 69056
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDO'
        DataPipeline = BDERel_PagtoPendente
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDERel_PagtoPendente'
        mmHeight = 3175
        mmLeft = 149754
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATA'
        DataPipeline = BDERel_PagtoPendente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDERel_PagtoPendente'
        mmHeight = 3260
        mmLeft = 196850
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'AP_BANCO'
        DataPipeline = BDERel_PagtoPendente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDERel_PagtoPendente'
        mmHeight = 3175
        mmLeft = 221986
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NR_CHEQUE'
        DataPipeline = BDERel_PagtoPendente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDERel_PagtoPendente'
        mmHeight = 3175
        mmLeft = 251619
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup4: TppGroup
      BreakName = 'ppLabel9'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 20108
        mmPrintPosition = 0
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Total Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 6350
          mmTop = 265
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'SALDO'
          DataPipeline = BDERel_PagtoPendente
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 4763
          mmLeft = 123561
          mmTop = 265
          mmWidth = 55298
          BandType = 5
          GroupNo = 0
        end
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'BDERel_AdiantPendente'
          mmHeight = 12435
          mmLeft = 0
          mmTop = 7673
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = BDERel_AdiantPendente
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report2'
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
            Units = utPrinterPixels
            Version = '7.02'
            mmColumnWidth = 0
            DataPipelineName = 'BDERel_AdiantPendente'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppShape3: TppShape
                UserName = 'Shape3'
                Brush.Color = 13882323
                Pen.Color = 13882323
                mmHeight = 3969
                mmLeft = 5027
                mmTop = 0
                mmWidth = 269346
                BandType = 1
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Caption = 'Processo com Numer'#225'rios Pendentes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 5821
                mmTop = 265
                mmWidth = 58738
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'VALOR_NUM'
                DataPipeline = BDERel_AdiantPendente
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'BDERel_AdiantPendente'
                mmHeight = 3175
                mmLeft = 153459
                mmTop = 265
                mmWidth = 24342
                BandType = 4
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'NR_PROCESSO'
                DataPipeline = BDERel_AdiantPendente
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'BDERel_AdiantPendente'
                mmHeight = 3175
                mmLeft = 68527
                mmTop = 265
                mmWidth = 26723
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup5: TppGroup
              BreakName = 'CD_CLIENTE'
              DataPipeline = BDERel_AdiantPendente
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group5'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'BDERel_AdiantPendente'
              object ppGroupHeaderBand5: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 3440
                mmPrintPosition = 0
                object ppDBText14: TppDBText
                  UserName = 'DBText14'
                  DataField = 'CD_CLIENTE'
                  DataPipeline = BDERel_AdiantPendente
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'BDERel_AdiantPendente'
                  mmHeight = 3440
                  mmLeft = 20373
                  mmTop = 0
                  mmWidth = 11642
                  BandType = 3
                  GroupNo = 0
                end
                object ppDBText15: TppDBText
                  UserName = 'DBText15'
                  DataField = 'NM_EMPRESA'
                  DataPipeline = BDERel_AdiantPendente
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'BDERel_AdiantPendente'
                  mmHeight = 3440
                  mmLeft = 33073
                  mmTop = 0
                  mmWidth = 123296
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand5: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CD_GRUPO'
      DataPipeline = BDERel_PagtoPendente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDERel_PagtoPendente'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'CD_GRUPO'
          DataPipeline = BDERel_PagtoPendente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3387
          mmLeft = 6350
          mmTop = 974
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'NM_GRUPO'
          DataPipeline = BDERel_PagtoPendente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3440
          mmLeft = 15610
          mmTop = 1058
          mmWidth = 158221
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Total do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 6350
          mmTop = 0
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'SALDO'
          DataPipeline = BDERel_PagtoPendente
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3387
          mmLeft = 152929
          mmTop = 0
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 529
          mmLeft = 0
          mmTop = 4233
          mmWidth = 274373
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CD_CLIENTE'
      DataPipeline = BDERel_PagtoPendente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDERel_PagtoPendente'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 13882323
          Pen.Color = 13882323
          mmHeight = 4498
          mmLeft = 20108
          mmTop = 265
          mmWidth = 254265
          BandType = 3
          GroupNo = 1
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'NM_EMPRESA'
          DataPipeline = BDERel_PagtoPendente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3969
          mmLeft = 33073
          mmTop = 794
          mmWidth = 137848
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'CD_CLIENTE'
          DataPipeline = BDERel_PagtoPendente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3175
          mmLeft = 20373
          mmTop = 794
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 21431
          mmTop = 0
          mmWidth = 19854
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'SALDO'
          DataPipeline = BDERel_PagtoPendente
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3260
          mmLeft = 153194
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NR_PROCESSO'
      DataPipeline = BDERel_PagtoPendente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDERel_PagtoPendente'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Processo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 51329
          mmTop = 529
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NR_PROCESSO'
          DataPipeline = BDERel_PagtoPendente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3175
          mmLeft = 68263
          mmTop = 529
          mmWidth = 27781
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Total do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 51329
          mmTop = 0
          mmWidth = 23019
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDO'
          DataPipeline = BDERel_PagtoPendente
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDERel_PagtoPendente'
          mmHeight = 3175
          mmLeft = 152400
          mmTop = 0
          mmWidth = 26458
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object BDERel_PagtoPendente: TppBDEPipeline
    DataSource = ds_pagto_pendente
    SkipWhenNoRecords = False
    UserName = 'BDERel_PagtoPendente'
    Left = 296
    Top = 304
    object BDERel_PagtoPendenteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object BDERel_PagtoPendenteppField2: TppField
      FieldAlias = 'CD_GRUPO'
      FieldName = 'CD_GRUPO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object BDERel_PagtoPendenteppField3: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object BDERel_PagtoPendenteppField4: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object BDERel_PagtoPendenteppField5: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object BDERel_PagtoPendenteppField6: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object BDERel_PagtoPendenteppField7: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object BDERel_PagtoPendenteppField8: TppField
      FieldAlias = 'NM_GRUPO'
      FieldName = 'NM_GRUPO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object BDERel_PagtoPendenteppField9: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object BDERel_PagtoPendenteppField10: TppField
      FieldAlias = 'NR_CHEQUE'
      FieldName = 'NR_CHEQUE'
      FieldLength = 6
      DisplayWidth = 6
      Position = 9
    end
    object BDERel_PagtoPendenteppField11: TppField
      FieldAlias = 'AP_BANCO'
      FieldName = 'AP_BANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
  end
  object qry_adiantamento_pend_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 152
    Top = 360
    object qry_adiantamento_pend_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_adiantamento_pend_VALOR_NUM: TFloatField
      FieldName = 'VALOR_NUM'
    end
    object qry_adiantamento_pend_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_adiantamento_pend_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
  end
  object ds_adiantamento_pend: TDataSource
    DataSet = qry_adiantamento_pend_
    Left = 216
    Top = 360
  end
  object BDERel_AdiantPendente: TppBDEPipeline
    DataSource = ds_adiantamento_pend
    SkipWhenNoRecords = False
    UserName = 'BDERel_AdiantPendente'
    Left = 296
    Top = 360
    object BDERel_AdiantPendenteppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object BDERel_AdiantPendenteppField2: TppField
      FieldAlias = 'VALOR_NUM'
      FieldName = 'VALOR_NUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object BDERel_AdiantPendenteppField3: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object BDERel_AdiantPendenteppField4: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
end

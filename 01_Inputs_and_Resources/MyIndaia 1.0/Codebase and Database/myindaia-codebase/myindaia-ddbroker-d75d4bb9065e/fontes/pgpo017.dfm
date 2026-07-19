object datm_po_impressao: Tdatm_po_impressao
  Left = 200
  Top = 108
  Height = 321
  Width = 302
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 156
    Top = 236
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object qry_processo_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_IMPORTADOR'
      'FROM   TPO'
      'WHERE  ISNULL( NR_DA, '#39#39' ) = '#39#39)
    Left = 68
    Top = 236
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'Relatórios'
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
    DataSettings.DatabaseName = 'DbBroker'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    Report = ppReport
    ShowData = False
    Visible = False
    WindowHeight = 480
    WindowLeft = 0
    WindowTop = 0
    WindowWidth = 640
    WindowState = wsMaximized
    Left = 156
    Top = 28
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppBDE_PO
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PROFORMA INVOICE'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    Template.FileName = 'C:\DDBroker\CRPO005.rtm'
    Units = utPrinterPixels
    UserName = 'Report'
    DeviceType = 'Screen'
    Left = 156
    Top = 86
    Version = '4.23 Pro'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_PROCESSO'
      DataPipeline = ppBDE_PO
      NewPage = True
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 249238
        mmPrintPosition = 0
        object ppdbtxt_nm_empresa: TppDBText
          UserName = 'dbtxt_nm_empresa'
          AutoSize = True
          DataField = 'NM_EMPRESA'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 35719
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_end_empresa: TppDBText
          UserName = 'dbtxt_end_empresa'
          AutoSize = True
          DataField = 'END_EMPRESA'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 41804
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_cep_empresa: TppDBText
          UserName = 'dbtxt_cep_empresa'
          AutoSize = True
          DataField = 'END_CEP'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 48154
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_cid_empresa: TppDBText
          UserName = 'dbtxt_cid_empresa'
          AutoSize = True
          DataField = 'END_CIDADE'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 46831
          mmTop = 48154
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'BRASILIEN'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 55298
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppMemo1: TppMemo
          UserName = 'Memo1'
          Alignment = taCenter
          Caption = 'Memo1'
          CharWrap = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = []
          Lines.Strings = (
            '****************************'
            'PROFORMA'
            'INVOICE'
            '****************************')
          Transparent = True
          mmHeight = 22754
          mmLeft = 119856
          mmTop = 31750
          mmWidth = 57679
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppdbtxt_ap_moeda: TppDBText
          UserName = 'dbtxt_ap_moeda'
          AutoSize = True
          BlankWhenZero = True
          DataField = 'AP_MOEDA'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 175155
          mmTop = 66940
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'HEMOS ENVIADO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 76200
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'RVZ 09'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 85990
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_nr_proc: TppDBText
          UserName = 'dbtxt_cid_empresa1'
          AutoSize = True
          DataField = 'NR_PROC'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 90752
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_local_desembarque: TppDBText
          UserName = 'dbtxt_cid_empresa2'
          AutoSize = True
          DataField = 'LOCAL_DESEMBARQUE'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 95515
          mmWidth = 37306
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_nr_articulo: TppDBText
          UserName = 'dbtxt_nr_articulo'
          AutoSize = True
          DataField = 'NR_ARTICULO'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 108215
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_nr_articulo2: TppDBText
          UserName = 'dbtxt_nr_articulo2'
          AutoSize = True
          DataField = 'NR_ARTICULO'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 118269
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_cd_material: TppDBText
          UserName = 'dbtxt_cd_material'
          AutoSize = True
          DataField = 'CD_MATERIAL'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 79111
          mmTop = 118269
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'dbtxt_nr_processo1'
          DataField = 'NR_PROCESSO'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 112184
          mmTop = 118269
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_nr_processo: TppDBText
          UserName = 'dbtxt_nr_processo'
          DataField = 'NR_PROCESSO'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 22754
          mmTop = 14817
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object pplbl_cabecalho: TppLabel
          UserName = 'lbl_cabecalho'
          Caption = 
            '01039176          915       91504       0                     2N' +
            '      61           915       04     00         1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 41540
          mmTop = 14817
          mmWidth = 112713
          BandType = 3
          GroupNo = 0
        end
        object ppSystemVariable1: TppSystemVariable
          UserName = 'SystemVariable1'
          DisplayFormat = 'dd.mm.yy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 180711
          mmTop = 14817
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'AP_MERCADORIA'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 122767
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'TX_VOLUMES'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 19315
          mmLeft = 22754
          mmTop = 136261
          mmWidth = 77788
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          Alignment = taRightJustify
          DataField = 'VL_PB_EMBALAGEM'
          DataPipeline = ppBDE_PO
          DisplayFormat = '#0,.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 112184
          mmTop = 136261
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          Alignment = taRightJustify
          DataField = 'VL_PL_EMBALAGEM'
          DataPipeline = ppBDE_PO
          DisplayFormat = '#0,.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 138907
          mmTop = 136261
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'STR_VL_UNITARIO'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 156634
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = False
          DataField = 'NM_FRETE'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 22225
          mmLeft = 22754
          mmTop = 161396
          mmWidth = 96044
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemo3: TppDBMemo
          UserName = 'DBMemo3'
          CharWrap = False
          DataField = 'TX_INF_ENTREPOSTO'
          DataPipeline = ppBDE_PO
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 34660
          mmLeft = 23019
          mmTop = 184150
          mmWidth = 95779
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          Alignment = taRightJustify
          DataField = 'PB_PO'
          DataPipeline = ppBDE_PO
          DisplayFormat = '#0,.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 112184
          mmTop = 156634
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          Alignment = taRightJustify
          DataField = 'PL_PO'
          DataPipeline = ppBDE_PO
          DisplayFormat = '#0,.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 138907
          mmTop = 156634
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          Alignment = taRightJustify
          DataField = 'VL_MERCADORIA'
          DataPipeline = ppBDE_PO
          DisplayFormat = '#0,.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 176213
          mmTop = 156634
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppdbtxt_vl_frete: TppDBText
          UserName = 'dbtxt_vl_frete'
          Alignment = taRightJustify
          DataField = 'VL_FRETE'
          DataPipeline = ppBDE_PO
          DisplayFormat = '#0,.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 176213
          mmTop = 169069
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          Alignment = taRightJustify
          DataField = 'VL_TOTAL'
          DataPipeline = ppBDE_PO
          DisplayFormat = '#0,.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 176213
          mmTop = 223309
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'ANAL. EXP.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 113242
          mmTop = 237861
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'KG'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 112184
          mmTop = 85990
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'KG'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 138907
          mmTop = 85990
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qry_po_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, RIGHT( LTRIM( RTRIM( ISNULL( P.NR_PROCESSO' +
        ', "" ) ) ), 4 ) AS NR_PROC, P.CD_IMPORTADOR, E.NM_EMPRESA,'
      
        '       UPPER( LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) + " ' +
        '" + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) ) AS END_EMPRES' +
        'A,'
      '       LTRIM( RTRIM( ISNULL( END_CEP, "" ) ) ) AS END_CEP,'
      
        '       UPPER( LTRIM( RTRIM( ISNULL( END_CIDADE, "" ) ) ) ) AS EN' +
        'D_CIDADE,'
      
        '       M.AP_MOEDA_INGLES AS AP_MOEDA, LE.DESCRICAO AS LOCAL_DESE' +
        'MBARQUE,'
      
        '       '#39'(PN '#39' + LTRIM( RTRIM( ISNULL( ME.CD_MATERIAL, "" ) ) ) +' +
        ' '#39' )'#39' AS CD_MATERIAL, ME.AP_MERCADORIA, P.TX_VOLUMES,'
      
        '       P.TX_INF_ENTREPOSTO, P.CD_INCOTERM, ISNULL( I.VL_UNITARIO' +
        ', 0 ) AS VL_UNITARIO,'
      
        '       ISNULL( P.VL_PB_EMBALAGEM, 0 ) AS VL_PB_EMBALAGEM, ISNULL' +
        '( P.VL_PL_EMBALAGEM, 0 ) AS VL_PL_EMBALAGEM,'
      
        '       ISNULL( P.PB_PO, 0 ) AS PB_PO, ISNULL( P.PL_PO, 0 ) AS PL' +
        '_PO, ISNULL( P.VL_TOTAL, 0 ) AS VL_MERCADORIA,'
      '       CASE P.TP_NEGOCIACAO'
      
        '         WHEN '#39'0'#39' THEN ( ISNULL( P.VL_FRETE_PREPAID, 0 ) + ISNUL' +
        'L( P.VL_FRETE_COLLECT, 0 ) - ISNULL( P.VL_FRETE_TERRIT_NAC, 0 ) ' +
        ')'
      '         ELSE 0'
      '       END AS VL_FRETE,'
      '       CASE P.TP_NEGOCIACAO'
      '         WHEN '#39'1'#39' THEN ISNULL( P.VL_TOTAL, 0 )'
      
        '         ELSE ISNULL( P.VL_TOTAL, 0 ) + ISNULL( P.VL_FRETE_PREPA' +
        'ID, 0 ) + ISNULL( P.VL_FRETE_COLLECT, 0 ) - ISNULL( P.VL_FRETE_T' +
        'ERRIT_NAC, 0 )'
      '       END AS VL_TOTAL,'
      '       CASE P.TP_NEGOCIACAO'
      
        '         WHEN '#39'0'#39' THEN '#39'FOB EUROPEAN PORT INCL. EMBALAJE'#39' +  CHA' +
        'R(13) + CHAR(10) + CHAR(13) + CHAR(10) + '#39'CARGO DE FLETE'#39' + CHAR' +
        '(13) + CHAR(10) + CHAR(13) + CHAR(10) +'
      
        '                       P.CD_INCOTERM + " " + LTRIM( RTRIM( ISNUL' +
        'L( LE.DESCRICAO, "" ) ) ) + '#39', INCL. EMBALAJE'#39
      
        '         ELSE P.CD_INCOTERM + " " + LTRIM( RTRIM( ISNULL( LE.DES' +
        'CRICAO, "" ) ) ) + ", INCL. EMBALAJE"'
      
        '       END AS NM_FRETE, '#39'NO. DE ARTICULO: '#39' + P.NR_ARTICULO AS N' +
        'R_ARTICULO,'
      
        '       LTRIM( RTRIM( REPLACE( STR( I.VL_UNITARIO, 15, 2 ), ".", ' +
        '"," ) ) ) + " " +'
      
        '       LTRIM( RTRIM( ISNULL( M.AP_MOEDA_INGLES, "" ) ) ) + " / 1' +
        ' KG" AS STR_VL_UNITARIO'
      
        'FROM   TPO P, TPO_ITEM I, TEMPRESA_NAC E, TMOEDA_BROKER M, TLOCA' +
        'L_EMBARQUE LE, TMERCADORIA ME'
      'WHERE  P.CD_IMPORTADOR = E.CD_EMPRESA AND'
      '       P.CD_MOEDA_NEG *= M.CD_MOEDA AND'
      '       P.CD_LOCAL_DESEMBARQUE *= LE.CODIGO AND'
      '       P.NR_PROCESSO = I.NR_PROCESSO AND'
      '       I.NR_ITEM = '#39'001'#39' AND'
      '       I.CD_MERCADORIA *= ME.CD_MERCADORIA AND'
      '       ( ISNULL( P.NR_DA, '#39#39' ) = '#39#39' ) AND'
      '       P.NR_PROCESSO = '#39'XX'#39)
    Left = 68
    Top = 28
  end
  object Dts_PO: TDataSource
    DataSet = qry_po_
    Left = 68
    Top = 86
  end
  object ppBDE_PO: TppBDEPipeline
    DataSource = Dts_PO
    SkipWhenNoRecords = False
    UserName = 'BDE_PO'
    Left = 68
    Top = 153
  end
end

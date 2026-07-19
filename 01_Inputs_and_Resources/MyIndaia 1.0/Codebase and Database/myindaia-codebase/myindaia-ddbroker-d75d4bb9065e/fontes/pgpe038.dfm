object datm_exp_impr_instr_emb: Tdatm_exp_impr_instr_emb
  OldCreateOrder = True
  Left = 228
  Top = 199
  Height = 373
  Width = 1018
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
    Report = ppRepInstEmb
    ShowData = False
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    Visible = False
    WindowHeight = 480
    WindowLeft = 0
    WindowTop = 0
    WindowWidth = 640
    WindowState = wsMaximized
    Left = 709
    Top = 182
  end
  object ppRepInstEmb: TppReport
    AutoStop = False
    DataPipeline = ppBDE_Proc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RepInstEmb'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 209974
    PrinterSetup.mmPaperWidth = 296969
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\Instemba.rtm'
    Units = utPrinterPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 710
    Top = 240
    Version = '7.02'
    mmColumnWidth = 343300
    DataPipelineName = 'ppBDE_Proc'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 181505
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape1'
        mmHeight = 15610
        mmLeft = 2381
        mmTop = 74083
        mmWidth = 139171
        BandType = 0
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'NR_RUC'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 30956
        mmTop = 86254
        mmWidth = 92604
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 16404
        mmLeft = 141288
        mmTop = 57944
        mmWidth = 139171
        BandType = 0
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'NR_NIT'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 70115
        mmWidth = 92340
        BandType = 0
      end
      object ppDBText71: TppDBText
        UserName = 'DBText71'
        DataField = 'NR_RUC'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 70115
        mmWidth = 92340
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        mmHeight = 16404
        mmLeft = 2381
        mmTop = 57944
        mmWidth = 139171
        BandType = 0
      end
      object ppDBText60: TppDBText
        UserName = 'DBText103'
        DataField = 'NR_NIT'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2879
        mmLeft = 30956
        mmTop = 70115
        mmWidth = 92340
        BandType = 0
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'NR_RUC'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2879
        mmLeft = 30956
        mmTop = 70115
        mmWidth = 92340
        BandType = 0
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = 'NR_CUIT'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 30956
        mmTop = 70115
        mmWidth = 92340
        BandType = 0
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Caption = 'Region1'
        Stretch = True
        mmHeight = 8202
        mmLeft = 2381
        mmTop = 116417
        mmWidth = 278078
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppAgente: TppLabel
          UserName = 'Agente'
          AutoSize = False
          Caption = 'AGENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3683
          mmLeft = 3429
          mmTop = 118534
          mmWidth = 13208
          BandType = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'NM_AGENTE'
          DataPipeline = ppBDE_Agente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          DataPipelineName = 'ppBDE_Agente'
          mmHeight = 3704
          mmLeft = 30956
          mmTop = 118534
          mmWidth = 109009
          BandType = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Agente1'
          AutoSize = False
          Caption = 'PACKING'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 142611
          mmTop = 118534
          mmWidth = 18521
          BandType = 0
        end
        object ppDBMemo4: TppDBMemo
          UserName = 'DBMemo4'
          CharWrap = False
          DataField = 'TX_INF_EMBALAGEM'
          DataPipeline = ppBDE_Proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppBDE_Proc'
          mmHeight = 5027
          mmLeft = 162190
          mmTop = 118269
          mmWidth = 115359
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppSubReport2: TppSubReport
          UserName = 'SubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentWidth = False
          TraverseAllData = False
          Visible = False
          mmHeight = 3969
          mmLeft = 162190
          mmTop = 109009
          mmWidth = 115359
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RepInstEmb'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = '\\indaia16\Ricoh TI'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210016
            PrinterSetup.mmPaperWidth = 297011
            PrinterSetup.PaperSize = 9
            Units = utPrinterPixels
            Version = '7.02'
            mmColumnWidth = 0
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppDBText68: TppDBText
                UserName = 'DBText68'
                AutoSize = True
                DataField = 'TX_INF_EMBALAGEM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3260
                mmLeft = 0
                mmTop = 0
                mmWidth = 80687
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 1852
              mmPrintPosition = 0
            end
          end
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 8202
          mmLeft = 141288
          mmTop = 116417
          mmWidth = 5821
          BandType = 0
        end
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Caption = 'Region2'
        ShiftRelativeTo = ppRegion1
        Stretch = True
        mmHeight = 57150
        mmLeft = 2381
        mmTop = 124354
        mmWidth = 278078
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel19: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'DESCRIPTION OF GOODS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          mmHeight = 3683
          mmLeft = 3429
          mmTop = 126450
          mmWidth = 80179
          BandType = 0
        end
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentWidth = False
          TraverseAllData = False
          Visible = False
          mmHeight = 5027
          mmLeft = 8202
          mmTop = 155839
          mmWidth = 131763
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RepInstEmb'
            PrinterSetup.Orientation = poLandscape
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = '\\indaia16\Ricoh TI'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 210016
            PrinterSetup.mmPaperWidth = 297011
            PrinterSetup.PaperSize = 9
            Units = utPrinterPixels
            Version = '7.02'
            mmColumnWidth = 0
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppDBText66: TppDBText
                UserName = 'DBText66'
                AutoSize = True
                DataField = 'TX_MERCADORIA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                mmHeight = 3260
                mmLeft = 0
                mmTop = 0
                mmWidth = 68199
                BandType = 4
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 1323
              mmPrintPosition = 0
            end
          end
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = True
          DataField = 'TX_MERCADORIA'
          DataPipeline = ppBDE_Processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppBDE_Processo'
          mmHeight = 24606
          mmLeft = 8202
          mmTop = 155839
          mmWidth = 131763
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMDeclAdicInstEmb: TppDBMemo
          UserName = 'DBMDeclAdic1'
          CharWrap = False
          DataField = 'TX_DECL_ADIC_INST_EMB'
          DataPipeline = ppBDE_Proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppBDE_Proc'
          mmHeight = 5821
          mmLeft = 142346
          mmTop = 149489
          mmWidth = 135467
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMDeclAdic: TppDBMemo
          UserName = 'DBMDeclAdic'
          CharWrap = False
          DataField = 'TX_DECL_ADICIONAL'
          DataPipeline = ppBDE_Proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppBDE_Proc'
          mmHeight = 5821
          mmLeft = 142082
          mmTop = 142345
          mmWidth = 135467
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 57150
          mmLeft = 141288
          mmTop = 124354
          mmWidth = 5821
          BandType = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          AutoSize = True
          DataField = 'CalcCorpo_Conhec'
          DataPipeline = ppBDE_Proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          DataPipelineName = 'ppBDE_Proc'
          mmHeight = 3260
          mmLeft = 29369
          mmTop = 130968
          mmWidth = 85048
          BandType = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'CalcTipo_Frete'
          DataPipeline = ppBDE_Proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          DataPipelineName = 'ppBDE_Proc'
          mmHeight = 3260
          mmLeft = 29369
          mmTop = 134937
          mmWidth = 43900
          BandType = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText29'
          DataField = 'calcNCM'
          DataPipeline = ppBDE_Proc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          WordWrap = True
          DataPipelineName = 'ppBDE_Proc'
          mmHeight = 15875
          mmLeft = 29369
          mmTop = 138906
          mmWidth = 110861
          BandType = 0
        end
        object ppDBMRefCli: TppDBMemo
          UserName = 'DBMRefCli'
          CharWrap = True
          DataField = 'REFER_NR_CLIENTE'
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
          mmHeight = 10848
          mmLeft = 142346
          mmTop = 126470
          mmWidth = 137584
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppShape1: TppShape
        UserName = 'Shape101'
        mmHeight = 27252
        mmLeft = 140759
        mmTop = 89429
        mmWidth = 139700
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        mmHeight = 17992
        mmLeft = 141288
        mmTop = 25135
        mmWidth = 139171
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        mmHeight = 17992
        mmLeft = 2381
        mmTop = 25135
        mmWidth = 139171
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        mmHeight = 17198
        mmLeft = 141288
        mmTop = 41010
        mmWidth = 139171
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        mmHeight = 15610
        mmLeft = 141288
        mmTop = 74083
        mmWidth = 139171
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 27252
        mmLeft = 2381
        mmTop = 89429
        mmWidth = 139171
        BandType = 0
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
        mmHeight = 23548
        mmLeft = 39423
        mmTop = 91546
        mmWidth = 98425
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppPesoLiq: TppLabel
        UserName = 'PesoLiq'
        AutoSize = False
        Caption = 'NET WEIGHT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 95250
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'VL_PESO_LIQUIDO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 169334
        mmTop = 95250
        mmWidth = 29633
        BandType = 0
      end
      object ppPesoBruto: TppLabel
        UserName = 'PesoBruto'
        AutoSize = False
        Caption = 'GROSS WEIGHT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 99484
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'VL_PESO_BRUTO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 169334
        mmTop = 99484
        mmWidth = 29633
        BandType = 0
      end
      object ppViaTransp: TppLabel
        UserName = 'ViaTransp'
        AutoSize = False
        Caption = 'TRANSPORT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 53711
        mmWidth = 34396
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'NM_VIA_TRANSP'
        DataPipeline = ppBDE_ViaTr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_ViaTr'
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 53711
        mmWidth = 41540
        BandType = 0
      end
      object ppMarcas: TppLabel
        UserName = 'Marcas'
        AutoSize = False
        Caption = 'MARKS AND NUMBERS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        WordWrap = True
        mmHeight = 3704
        mmLeft = 3429
        mmTop = 91546
        mmWidth = 34925
        BandType = 0
      end
      object ppLocalOrigem: TppLabel
        UserName = 'LocalOrigem'
        AutoSize = False
        Caption = 'PORT OF LOADING'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 45773
        mmWidth = 34396
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Local2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Local2'
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 45773
        mmWidth = 48419
        BandType = 0
      end
      object ppLocalDestino: TppLabel
        UserName = 'LocalDestino'
        AutoSize = False
        Caption = 'PORT OF DISCHARGE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 49742
        mmWidth = 34396
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Local3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Local3'
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 49742
        mmWidth = 48419
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'NOME'
        DataPipeline = ppBDE_Notf2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf2'
        mmHeight = 2879
        mmLeft = 173832
        mmTop = 75142
        mmWidth = 104246
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Notf2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf2'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 78052
        mmWidth = 101600
        BandType = 0
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Notf2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf2'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 80963
        mmWidth = 92869
        BandType = 0
      end
      object ppNotificado2: TppLabel
        UserName = 'Notificado2'
        AutoSize = False
        Caption = 'NOTIFY 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 75142
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'TOTAL FREIGHT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 200025
        mmTop = 107950
        mmWidth = 25135
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
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
        mmLeft = 257705
        mmTop = 91546
        mmWidth = 20373
        BandType = 0
      end
      object ppFrete: TppDBText
        UserName = 'Frete'
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
        mmLeft = 257969
        mmTop = 107950
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'PROCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 25929
        mmWidth = 27252
        BandType = 0
      end
      object ppReferencia: TppLabel
        UserName = 'Referencia'
        AutoSize = False
        Caption = 'R.E. N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 29898
        mmWidth = 27252
        BandType = 0
      end
      object ppImportador: TppLabel
        UserName = 'Importador'
        AutoSize = False
        Caption = 'IMPORT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 59267
        mmWidth = 25665
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        DataField = 'NOME'
        DataPipeline = ppBDE_Consig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Consig'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 59267
        mmWidth = 102659
        BandType = 0
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Consig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Consig'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 62177
        mmWidth = 100806
        BandType = 0
      end
      object ppConsignatario: TppLabel
        UserName = 'Consignatario'
        AutoSize = False
        Caption = 'CONSIGNEE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 59267
        mmWidth = 27252
        BandType = 0
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Consig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Consig'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 64823
        mmWidth = 100806
        BandType = 0
      end
      object ppNotificado1: TppLabel
        UserName = 'Notificado1'
        AutoSize = False
        Caption = 'NOTIFY 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 74613
        mmWidth = 25665
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'NOME'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 2879
        mmLeft = 30956
        mmTop = 75142
        mmWidth = 105569
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 2879
        mmLeft = 30956
        mmTop = 78052
        mmWidth = 92604
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 2910
        mmLeft = 30956
        mmTop = 80963
        mmWidth = 92604
        BandType = 0
      end
      object ppShpShip: TppShape
        UserName = 'ShpShip'
        mmHeight = 17198
        mmLeft = 2381
        mmTop = 41010
        mmWidth = 139171
        BandType = 0
      end
      object pp: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'SHIPPER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 42069
        mmWidth = 25665
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NOME'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 42069
        mmWidth = 105834
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 46038
        mmWidth = 81227
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'END_CIDADE_UF_CEP'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 50006
        mmWidth = 72496
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'VESSEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 41804
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'nm_unid_neg'
        DataPipeline = ppBDE_Unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Unid'
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 27517
        mmWidth = 106098
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'ENDERECO_NUM'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2879
        mmLeft = 30956
        mmTop = 62177
        mmWidth = 92340
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'NOME'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2879
        mmLeft = 30956
        mmTop = 59267
        mmWidth = 105834
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4763
        mmLeft = 3175
        mmTop = 265
        mmWidth = 90223
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
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
        mmLeft = 3175
        mmTop = 5292
        mmWidth = 90223
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'END_CIDADE_UF_CEP'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4191
        mmLeft = 3175
        mmTop = 10319
        mmWidth = 62103
        BandType = 0
      end
      object ppInstrucao: TppLabel
        UserName = 'Instrucao'
        Caption = 'I N S T R U '#199' '#195' O     D E    E M B A R Q U E'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 6085
        mmLeft = 102129
        mmTop = 5292
        mmWidth = 93927
        BandType = 0
      end
      object ppDespachante: TppLabel
        UserName = 'Despachante'
        AutoSize = False
        Caption = 'AO DESPACHANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 27517
        mmWidth = 27781
        BandType = 0
      end
      object ppPaisOrigem: TppLabel
        UserName = 'PaisOrigem'
        Caption = 'COUNTRY OF ORIGIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 141817
        mmTop = 91281
        mmWidth = 28310
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'CalcPais_Origem'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 91281
        mmWidth = 26988
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CIDADE_PAIS'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2879
        mmLeft = 30956
        mmTop = 64823
        mmWidth = 92340
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
        mmLeft = 3175
        mmTop = 15610
        mmWidth = 7408
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
        mmLeft = 39688
        mmTop = 15610
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'END_CIDADE'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4233
        mmLeft = 95250
        mmTop = 16933
        mmWidth = 62706
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'PaisOrigem1'
        Caption = 'L/C N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 227807
        mmTop = 25929
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
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
        mmLeft = 242888
        mmTop = 25929
        mmWidth = 31485
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'NM_EMBARCACAO'
        DataPipeline = ppBDE_Emb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Emb'
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 41804
        mmWidth = 95779
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
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
        mmHeight = 4498
        mmLeft = 11377
        mmTop = 15610
        mmWidth = 25823
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
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
        mmLeft = 48948
        mmTop = 15610
        mmWidth = 25823
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'CalcTotal'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3387
        mmLeft = 200025
        mmTop = 91546
        mmWidth = 15706
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText39'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Local1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDE_Local1'
        mmHeight = 3387
        mmLeft = 222515
        mmTop = 91546
        mmWidth = 18076
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'CalcNrProcesso'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3260
        mmLeft = 169598
        mmTop = 25929
        mmWidth = 37296
        BandType = 0
      end
      object ppCubagem: TppLabel
        UserName = 'Cubagem1'
        Caption = 'MEASUREMENT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 103717
        mmWidth = 25929
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 62442
        mmLeft = 141288
        mmTop = 53975
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Pais2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Pais2'
        mmHeight = 3704
        mmLeft = 226219
        mmTop = 45773
        mmWidth = 46038
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDE_Pais3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Pais3'
        mmHeight = 3704
        mmLeft = 226219
        mmTop = 49742
        mmWidth = 46038
        BandType = 0
      end
      object ppNumPagina: TppSystemVariable
        UserName = 'NumPagina'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 229659
        mmTop = 19579
        mmWidth = 31750
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText9'
        DataField = 'DATA_FATURA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 4233
        mmLeft = 160338
        mmTop = 16933
        mmWidth = 57150
        BandType = 0
      end
      object ppPagina: TppSystemVariable
        UserName = 'Pagina1'
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
        mmLeft = 133350
        mmTop = 11906
        mmWidth = 5027
        BandType = 0
      end
      object ppRegPag1: TppRegion
        UserName = 'RegPag1'
        Caption = 'RegPag1'
        Pen.Style = psClear
        mmHeight = 8996
        mmLeft = 201084
        mmTop = 2381
        mmWidth = 13494
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DDE N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 227807
        mmTop = 29898
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText21'
        DataField = 'nr_dde'
        DataPipeline = ppBDE_Processo
        DisplayFormat = '##########-#;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Processo'
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 29898
        mmWidth = 31485
        BandType = 0
      end
      object SubRE: TppSubReport
        UserName = 'SubRE'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentWidth = False
        TraverseAllData = False
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 11113
        mmLeft = 169598
        mmTop = 29898
        mmWidth = 23019
        BandType = 0
        mmBottomOffset = 85
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDE_Proc
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'RepInstEmb'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 209974
          PrinterSetup.mmPaperWidth = 296969
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\DDBROKER\Instemba.rtm'
          Units = utPrinterPixels
          Left = 384
          Top = 216
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDE_Proc'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 265
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            DataPipeline = ppBDE_RE
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'NR_RE'
              DataPipeline = ppBDE_RE
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppBDE_RE'
              mmHeight = 3969
              mmLeft = 0
              mmTop = 0
              mmWidth = 28310
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText4: TppDBText
        UserName = 'DBText201'
        DataField = 'NM_ANALISTA_COMISSARIA'
        DataPipeline = ppBDE_Processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Processo'
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 31485
        mmWidth = 106098
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText202'
        DataField = 'NR_FONE_FAX'
        DataPipeline = ppBDE_Unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Unid'
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 35454
        mmWidth = 106098
        BandType = 0
      end
      object ppimg_logo_instemb: TppImage
        UserName = 'img_logo_instemb'
        AutoSize = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617086490000424D864900000000000036000000280000007A00
          000033000000010018000000000050490000C40E0000C40E0000000000000000
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD2AD7A9A4D06E1CBABFFFFFFFFFFFFFFFFFFF6EFE6
          A76411B78033FCF9F7FFFFFFFFFFFFC49659A25908A35C00A35C00AB6B1ADEC4
          9CFFFFFFFFFFFFFFFFFFFFFFFFC9A067A25908F6EFE6F9F5EFAC6D21A86812F2
          E9DCFFFFFFFFFFFFE1CBAB9A4D06D0AE7BFFFFFFFFFFFFFFFFFFFFFFFFB47B2B
          A76411F6EFE6FFFFFFFFFFFFDABE96A66209A35C00A35C00B47A32F4EADEFFFF
          FFFFFFFFFFFFFFCDA4739F5706F0E6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
          E9DCA66209B78033FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAA3699F5706
          A35C00A35C009D5200E1CBABFFFFFFFFFFFFFFFFFFD4B385A25908A35C00A35C
          00B98344F6EFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E9DC9F57
          00BA863AFCF9F7FCF9F7FCF9F7D4B385974900D9BD97FFFFFFFFFFFFFFFFFFC2
          9451A35C00DEC5A1DEC5A1B17327A76411F2E9DCFFFFFFFFFFFFFFFFFFC69B5F
          9F5700F9F5EFC79C5B9A4B00E4CFACFFFFFFFFFFFFFFFFFFFCF9F7AB6B1AAB6B
          1AF6EFE6FCF9F7FCF9F7E5CFB49A4B00C69B5FFFFFFFFFFFFFF5EDDF9D5200A7
          6411EADBC6DEC5A19D5200C9A067FFFFFFFFFFFFFFFFFFCDA4739D5200F0E6D6
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0AE7B9A4B009F5700EADBC6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC69B5F9D5200DABE96E4CFACE1C9ADF6EFE6FFFFFFFF
          FFFFEEDFCE9A4B00AF7220EADBC6D5B68C9A4D06D4B385FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C459F5706B27523A76411AF7220A86812
          A86812F9F5EFFFFFFFFFFFFFFFFFFFC0904BA35C00FFFFFFFFFFFFD5B68C9441
          00E5CFB4FFFFFFFFFFFFFFFFFFC9A067A76500D0AE7B9E540BD0AE7BFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD2AD7A9D5200B27523A76411AB6B1AAB6B1A9F5700
          EEDFCEFFFFFFFFFFFFF9F5EFDABD9BEEDFCEFFFFFFFFFFFFA35C00B78033FFFF
          FFFFFFFFFFFFFFCDA4739D5200F0E6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB
          6B1AB98344A86812C79C5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC69B5F9F5700
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EFE6DABD9BF0E6D6FFFFFFF6EF
          E69D5200C0904BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5CF
          B49A4B00AF731CC29451B883399A4B00C69B5FFFFFFFFFFFFFFFFFFFFFFFFFC2
          9451A35C00E1CAA6DEC49CB47A32A25908F2E9DCFFFFFFFFFFFFFFFFFFC9A067
          9F57009F5700913B00B17327EBDBBEFFFFFFFFFFFFFFFFFFFFFFFFF2E9DC9F57
          00AD6308C49659BD8C459D5200B78033FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE5CFB4BD8C45913B00CAA369FFFFFFFFFFFFFFFFFFCDA4739D5200F0E6D6
          FFFFFFFFFFFFFFFFFFFFFFFFEBDBBE9A4B00EBDBBEC9A067A66209FCF9F7FFFF
          FFFFFFFFFFFFFFFFFFFFC9A0679D5200C69B5FC69B5FC69B5FF4EADEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFE1CAA6B88339913B00D4B385FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F7A86812AF7220FCF9F7C9A0679A4B00
          EEDFCEFFFFFFFFFFFFFFFFFFFFFFFFC294519F57009F57009A4B00A66209E6D3
          B8FFFFFFFFFFFFFFFFFFFFFFFFC9A0679F5700C69B5FCDA473A86812AD6F29F5
          EDDFFFFFFFFFFFFFFFFFFFFFFFFFBA863A9F5706FCF9F7DEC49C974900DEC5A1
          FFFFFFFFFFFFFFFFFFFFFFFFF6EFE6BD8B529A4D069A4B00BD8B52F4EADEFFFF
          FFFFFFFFFFFFFFCDA4739D5200F0E6D6FFFFFFFFFFFFFFFFFFFFFFFFC29451A2
          5908FCF9F7E7D4BC974900E1CBABFFFFFFFFFFFFFFFFFFFFFFFFC9A0679D5200
          A76500A76500A76500EEDFCEFFFFFFFFFFFFFFFFFFF2E9DCB983449A4B009A4B
          00C29362F6EFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD2AD7A9D5200ECDDC2B27523B47B2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2
          9451A35C00D5B68CCDA77FA35C00DEC49CFFFFFFFFFFFFFFFFFFFFFFFFC9A067
          9F5700F5EDDFFCF9F7E5CFB4974900D5B68CFFFFFFFFFFFFFFFFFFFFFFFFE5CF
          B4974900E5CFB4C49659A66209F9F5EFFFFFFFFFFFFFFFFFFFFFFFFFC69B5F9D
          5200BE8B57E5CFB4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDA4739D5200F0E6D6
          FFFFFFFFFFFFFFFFFFF9F5EFA25908C29451FFFFFFFCF9F7A76411BA863AFFFF
          FFFFFFFFFFFFFFFFFFFFC9A0679F5700E1C9ADE5CFB4E5CFB4F9F5EFFFFFFFFF
          FFFFFFFFFFC0904B9F5700C29362E7D4BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDDF9F5700B47B2B9D5200DEC5A1
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC29451A76500FFFFFFFCFBF19D5200B883
          39FFFFFFFFFFFFFFFFFFFFFFFFC9A067A35C00FFFFFFFFFFFFE4CFAC8E3900D2
          AD7AFFFFFFFFFFFFFFFFFFFFFFFFFCF9F7AB6B1AB17327A25908CAA369FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFA66209A66209FFFFFFFFFFFFCDA77FE5CFB4FFFF
          FFFFFFFFFFFFFFCDA4739F5700F0E6D6FFFFFFFFFFFFFFFFFFDEC5A1974900E6
          D3B8FFFFFFFFFFFFC69B5F9D5200F6EFE6FFFFFFFFFFFFFFFFFFC9A067A35C00
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F79F5700B27523FFFFFFFCFB
          F1CDA77FEADBC6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFC0904B862900A66209F9F5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7
          8033913B00BD8B52B47B3E944100D2AD7AFFFFFFFFFFFFFFFFFFFFFFFFC0904B
          8E3900B98344BA854C9E540B9E540BEEDFCEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD4B3858C3400974900F2E9DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8E4A94
          4100CDA473B47B3E944100E1C9ADFFFFFFFFFFFFFFFFFFC496598C3400EEDFCE
          FFFFFFFFFFFFF9F5EFA66209A35C00FCF9F7FFFFFFFFFFFFEADBC68C3400C294
          51FFFFFFFFFFFFFFFFFFBF8E4A8E3900B98344BD8B52BA8453EADBC6FFFFFFFF
          FFFFFFFFFFB47A329A4B00CDA473AE702F974900EADBC6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBDBBEA66130D4B385FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAA369AA6A31AC6D21AE702FCDA473F6EF
          E6FFFFFFFFFFFFFFFFFFFFFFFFD0AE7BAA6A31AC6D21AC6D21B3773CDEC5A1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EFE6AE702FC49659FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEEDFCEB98344A66209A66209C9A067F9F5EFFFFF
          FFFFFFFFFFFFFFD4B385AA6A31F0E6D6FFFFFFFFFFFFF0E6D6A6621FCEAD73FF
          FFFFFFFFFFFFFFFFFFFFFFB98344B88339FCF9F7FFFFFFFFFFFFD0AE7BAA6A31
          AC6D21AC6D21A6621FE5CFB4FFFFFFFFFFFFFFFFFFEADBC6B3773CA66209A763
          1BCDA473FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFEADBC6F9F5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
          E9DCEADBC6EADBC6EEDFCEF9F5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EADE
          EADBC6EADBC6EADBC6F5EDDFFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEEDFCEF6EFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
          EDDFDEC5A1E5CFB4F9F5EFFFFFFFFFFFFFFFFFFFFFFFFFF5EDDFEADBC6FCF9F7
          FFFFFFFFFFFFF6EFE6E6D4C2F9F5EFFFFFFFFFFFFFFFFFFFFFFFFFF2E9DCEBDB
          BEFCF9F7FFFFFFFFFFFFF4EADEEADBC6EADBC6EADBC6E7D4BCF6EFE6FFFFFFFF
          FFFFFFFFFFFFFFFFF2E9DCDEC5A1E7D4BCF9F5EFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFE6E6E6D9D9DBD9D9DBD9D9
          DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9
          D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DB
          D9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9
          DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9
          D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DB
          D9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9
          DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9
          D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DB
          D9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9
          DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9
          D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBD9D9DBE6E6E6FFFFFF
          0000FFFFFFADADAE8F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F91
          8F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F
          918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F
          8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F91
          8F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F
          918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F
          8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F91
          8F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F
          918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F
          8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F91
          8F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F918F8F
          918F8F918F8F918F8F91ADADAEFFFFFF0000FFFFFFD9D9DBCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
          CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCD9D9DBFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEF
          EFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEAEAEBFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEBEAEAEBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFF
          FFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F7FCF9F7FCF9F7FC
          F9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFEAEAEBA5A5A6868689868689B5B5B5FCF9F7ADADAEADADAEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFADADAEADADAEEFEFEF9E9EA0C5C5C5FFFFFFBFBF
          C29E9EA0F7F7F7FFFFFFFFFFFFFCF9F7A5A5A6ADADAEFFFFFFFFFFFFFFFFFFC5
          C5C5999999EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D6D6D69E9EA0868689868689999999CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFC5C5C59999998686898686899E9EA0CCCCCCFFFFFFFFFFFFF7F7F7ADADAE99
          9999999999999999B0B0B2EAEAEBE1E1E38F8F91D9D9DBFFFFFFFFFFFFFFFFFF
          FFFFFFDEDEDE8F8F91DEDEDECCCCCC9E9EA0F7F7F7EFEFEF999999CCCCCCFFFF
          FFFFFFFFFFFFFFCCCCCC999999D9D9DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F78F8F916D6D709999998F8F
          916D6D70BDBDBEADADAE666666E6E6E6FFFFFFFFFFFFFFFFFFE6E6E6666666A5
          A5ADEFEFEF666666A5A5A6FFFFFF9E9EA06D6D70EFEFEFFFFFFFFFFFFFBDBDBE
          666666868689FFFFFFFFFFFFFFFFFFA5A5AD666666EAEAEBFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCC7575797B7B7C9999999999997B7B7C75
          7579BFBFC2FFFFFFFFFFFFFFFFFFB0B0B26D6D707D7D809999999999997B7B7C
          737374BFBFC2FFFFFFF7F7F77D7D807575798C8C8D8484856D6D70999999DEDE
          DE6D6D709E9EA0FFFFFFFFFFFFFFFFFFFFFFFF9E9EA06D6D70EFEFEFADADAE6D
          6D70EFEFEFEAEAEB666666ADADAEFFFFFFFFFFFFEFEFEF848485666666C5C5C5
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE1E1E37B7B7CB0B0B2EFEFEFEFEFEF999999848485DEDEDE757579A5A5A6
          CCCCCCCCCCCCCCCCCCA5A5AD737374EFEFEFF7F7F7757579B0B0B2FFFFFFADAD
          AE7B7B7CEFEFEFFFFFFFEAEAEB7B7B7C737374999999FFFFFFFFFFFFFFFFFFB0
          B0B2757579EAEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6757579
          848485D9D9DBFFFFFFFFFFFFEAEAEB8F8F91737374DADAD9FFFFFFCCCCCC6D6D
          70999999DEDEDEF7F7F7F7F7F7D9D9DB8C8C8D6D6D70DEDEDEFFFFFF84848599
          9999EAEAEBE1E1E3B0B0B2666666D6D6D6B0B0B2757579CCCCCCCCCCCCCCCCCC
          CCCCCC7B7B7CA5A5A6FFFFFFB0B0B27B7B7CEFEFEFEFEFEF757579B5B5B5FFFF
          FFFFFFFFB0B0B26D6D70757579CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFD9D9DBFFFFFFFFFFFFFFFF
          FF9E9EA0737374F7F7F79E9EA0757579868689848485868689757579999999FF
          FFFFEFEFEF757579B0B0B2FFFFFFADADAE7B7B7CEFEFEFFFFFFFA5A5A6737374
          8484858F8F91FFFFFFFFFFFFFFFFFFB0B0B2757579EFEFEFFFFFFFD6D6D6C5C5
          C5C5C5C5DEDEDEFFFFFFADADAE6D6D70E1E1E3FFFFFFCCCCCCCCCCCCD6D6D6AD
          ADAE666666999999F7F7F78C8C8D848485F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          EAEAEB757579A5A5A6FFFFFF848485A5A5A6FFFFFFFFFFFFD9D9DB666666C5C5
          C5EAEAEB737374848485848485848485848485737374DADAD9FFFFFFB0B0B27B
          7B7CEFEFEFEFEFEF757579B5B5B5FFFFFFE1E1E37373748484857B7B7CCCCCCC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFD6D6D69E9EA06D6D709E9EA0FFFFFFCCCCCC6D6D70
          A5A5A6BFBFC2A5A5A66D6D70CCCCCCFFFFFFEFEFEF757579B0B0B2FFFFFFADAD
          AE7B7B7CFFFFFFDEDEDE6D6D70ADADAE9999998F8F91FFFFFFFFFFFFFFFFFFB0
          B0B2757579EFEFEFFFFFFF9E9EA0757579757579B0B0B2FFFFFF8C8C8D8F8F91
          FFFFFFF7F7F78484857D7D807D7D808686897B7B7C8C8C8DE1E1E3757579B5B5
          B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A6848485EFEFEF8C8C8D99
          9999D6D6D6D6D6D69E9EA0848485E1E1E3FFFFFF8C8C8D7D7D80C5C5C5C5C5C5
          7D7D808C8C8DFCF9F7FFFFFFB0B0B27B7B7CEFEFEFEFEFEF757579BDBDBEFFFF
          FF9999997B7B7CB5B5BD757579CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEB9E9EA07373747373
          749E9EA0E6E6E6FFFFFFF7F7F77B7B7CB5B5B5FFFFFFB5B5B57B7B7CF7F7F7FF
          FFFFEFEFEF757579B0B0B2FFFFFFADADAE7D7D80EFEFEF8F8F917B7B7CEFEFEF
          9E9EA08C8C8DFFFFFFFFFFFFFFFFFFB0B0B2757579EAEAEBFFFFFFD6D6D6BDBD
          BEBDBDBED9D9DBFFFFFF8484859E9EA0FFFFFFF7F7F7C5C5C5C5C5C5C5C5C5C5
          C5C5D6D6D6D6D6D6DEDEDE737374C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB0B0B27B7B7CEAEAEB8F8F917D7D80848485757579737374CCCCCCFFFF
          FFFFFFFFB5B5BD7B7B7CFFFFFFFFFFFF757579BDBDBEFFFFFFFFFFFFB0B0B27B
          7B7CEFEFEFEFEFEF757579C5C5C5DADAD9666666C5C5C5E1E1E36D6D70CCCCCC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF9E9EA0737374A5A5A6D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFA5A5AD
          848485E6E6E67D7D80A5A5A6FFFFFFFFFFFFEFEFEF757579B0B0B2FFFFFFADAD
          AE848485B0B0B26D6D70CCCCCCFFFFFF9999998C8C8DFFFFFFFFFFFFFFFFFFB5
          B5B5757579EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9999997D7D80
          FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7575799E9E
          A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8C8D8C8C8DF7F7F78C8C8D8C
          8C8DB5B5BDB0B0B2848485BDBDBEFFFFFFFFFFFFEAEAEB737374C5C5C5C5C5C5
          737374EAEAEBFFFFFFFFFFFFB0B0B27B7B7CEFEFEFEFEFEF7B7B7CADADAE8C8C
          8D868689FCF9F7D9D9DB6D6D70CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F77575798F8F91FFFFFFFFFF
          FFDADAD9CCCCCCFFFFFFFFFFFFE1E1E37575799E9EA0757579DEDEDEFFFFFFFF
          FFFFEFEFEF7B7B7CB5B5B5FFFFFFB0B0B27D7D80737374999999FFFFFFFFFFFF
          9999998F8F91FFFFFFFFFFFFFFFFFFB5B5BD7B7B7CFCF9F7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCCCCCC666666B0B0B2FCF9F7FFFFFFFFFFFFF7F7F7BF
          BFC29E9EA0E6E6E6FFFFFFA5A5A6666666CCCCCCFFFFFFFFFFFFFFFFFFF7F7F7
          BDBDBE666666BFBFC2FFFFFF868689A5A5A6FFFFFFFFFFFF8F8F917D7D80FFFF
          FFFFFFFFFFFFFF999999868689868689999999FFFFFFFFFFFFFFFFFFB0B0B27D
          7D80EFEFEFEFEFEF8484858484856D6D70D6D6D6FFFFFFD6D6D6737374CCCCCC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF8F8F917B7B7CCCCCCCBDBDBE666666A5A5A6FFFFFFFFFFFFFFFFFF
          8F8F915A5A5D8F8F91FFFFFFFFFFFFFFFFFFEAEAEB666666A5A5ADFFFFFFA5A5
          A6666666737374E1E1E3FFFFFFFFFFFF8C8C8D848485EFEFEFC5C5C5C5C5C58F
          8F916D6D70B5B5B5BFBFC2D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFCF9F79E9EA0
          666666A5A5A6CCCCCCCCCCCC9E9EA0666666868689EAEAEBFFFFFFEAEAEB8484
          856D6D70ADADAECCCCCCCCCCCCA5A5A66D6D708F8F91F7F7F7F7F7F77B7B7C86
          8689CCCCCCBDBDBE737374999999FFFFFFFFFFFFFFFFFFD6D6D6666666666666
          D6D6D6FFFFFFFFFFFFFFFFFFA5A5A66D6D70EFEFEFEAEAEB737374666666A5A5
          A6FFFFFFFFFFFFCCCCCC666666CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9DB8484857373747373
          74868689E1E1E3FFFFFFFFFFFFFFFFFFC5C5C56D6D70C5C5C5FFFFFFFFFFFFFF
          FFFFEFEFEF757579B0B0B2FFFFFFADADAE6D6D70B5B5B5FFFFFFFFFFFFFFFFFF
          999999999999E1E1E37B7B7C7B7B7C7D7D807D7D807D7D807373749E9EA0FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFA5A5A67575797575797575797575799E
          9EA0E6E6E6FFFFFFFFFFFFFFFFFFE1E1E3999999757579757579757579757579
          9E9EA0EFEFEFFFFFFFF7F7F78C8C8D7B7B7C7B7B7C7B7B7C8F8F91E1E1E3FFFF
          FFFFFFFFFFFFFFFCF9F7868689868689FCF9F7FFFFFFFFFFFFFFFFFFB0B0B27B
          7B7CEFEFEFEAEAEB7B7B7C868689EFEFEFFFFFFFFFFFFFD6D6D66D6D70CCCCCC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE6E6E6BDBDBEBFBFC2EFEFEFFFFFFFFFFFFFFFFFFFFFFFFF
          F7F7F7CCCCCCF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7D6D6D6E6E6E6FFFFFFE1E1
          E3CCCCCCF7F7F7FFFFFFFFFFFFFFFFFFDADAD9DADAD9F7F7F7CCCCCCCCCCCCCC
          CCCCD6D6D6CCCCCCCCCCCCD9D9DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD6D6D6BDBDBEBDBDBED6D6D6FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7CCCCCCB5B5BDB5B5BDD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFDADAD9CC
          CCCCCCCCCCD6D6D6EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDEDEDEDE
          FFFFFFFFFFFFFFFFFFFFFFFFE6E6E6D6D6D6FCF9F7FCF9F7D6D6D6E1E1E3FFFF
          FFFFFFFFFFFFFFEFEFEFCCCCCCEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EFEFEFF7F7F7FFFFFFFFFFFFFFFFFF
          FFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EFEFEFF7F7F7FFFF
          FFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EFEFEFF7F7F7FFFFFF
          FFFFFFFFFFFFFFFFFFF7F7F7EFEFEFFCF9F7FFFFFFFFFFFFFFFFFFF7F7F7EFEF
          EFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5
          C5999999CCCCCCFFFFFFFFFFFFFFFFFFEFEFEFA5A5A6A5A5A6F7F7F7FFFFFFFF
          FFFFFFFFFFC5C5C5999999CCCCCCFFFFFFFFFFFFFFFFFFEFEFEFA5A5A6A5A5A6
          E1E1E3FFFFFFFFFFFFFFFFFFFFFFFFE6E6E69E9EA0A5A5A6EAEAEBFFFFFFFFFF
          FFFFFFFFD6D6D6999999BFBFC2FFFFFFFFFFFFFFFFFFFFFFFFB0B0B29E9EA0EA
          EAEBFFFFFFFFFFFFFFFFFFDADAD9999999BDBDBEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9EA05A5A5DB5B5B5FFFFFFFFFFFFFFFFFF
          EAEAEB6D6D70757579EFEFEFFFFFFFFFFFFFFFFFFFA5A5A65A5A5DB5B5B5FFFF
          FFFFFFFFFFFFFFE6E6E66D6D70666666CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFDA
          DAD96666666D6D70DEDEDEFFFFFFFFFFFFFFFFFFBFBFC25A5A5D999999FFFFFF
          FFFFFFFFFFFFF7F7F77D7D80666666E1E1E3FFFFFFFFFFFFFFFFFFC5C5C55A5A
          5D999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5
          AD6D6D70ADADAEFFFFFFFFFFFFFFFFFFDEDEDE757579868689F7F7F7FFFFFFFF
          FFFFFFFFFFB0B0B26D6D70BDBDBEFFFFFFFFFFFFFFFFFFE6E6E67D7D80757579
          D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFDEDEDE7575797B7B7CDEDEDEFFFFFFFFFF
          FFFFFFFFC5C5C56D6D70A5A5A6FFFFFFFFFFFFFFFFFFFFFFFF8C8C8D737374D6
          D6D6FFFFFFFFFFFFFFFFFFB5B5B56D6D709E9EA0FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A66D6D707D7D80CCCCCCEFEFEFE1E1E3
          9E9EA07B7B7C8C8C8DF7F7F7FFFFFFFFFFFFFFFFFFB0B0B2737374BDBDBEFFFF
          FFFFFFFFFFFFFFEAEAEB8484857B7B7CD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFDE
          DEDE7B7B7C7D7D80E1E1E3FFFFFFFFFFFFFFFFFFC5C5C5737374A5A5A6FFFFFF
          FFFFFFFFFFFFFFFFFF8F8F917B7B7C999999DEDEDEEFEFEFD6D6D68484856D6D
          709E9EA0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5
          C58C8C8D7575797575799999998C8C8D6D6D707D7D807D7D80D6D6D6FFFFFFFF
          FFFFF7F7F7999999737374BFBFC2FFFFFFFFFFFFFFFFFFEFEFEF8484857B7B7C
          D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFDEDEDE7B7B7C7D7D80E6E6E6FFFFFFFFFF
          FFFFFFFFCCCCCC7373748F8F91EFEFEFFFFFFFFFFFFFDEDEDE84848584848573
          73748686899999997D7D807575798C8C8DBDBDBEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7DEDEDEC5C5C59E9EA07D7D80737374
          7B7B7C7B7B7C7575798C8C8DCCCCCCD6D6D6ADADAE7B7B7C7B7B7CB5B5B5FFFF
          FFFFFFFFFFFFFFE6E6E67D7D807B7B7CD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFE1
          E1E37B7B7C7B7B7CDEDEDEFFFFFFFFFFFFFFFFFFBFBFC27B7B7C7B7B7CA5A5A6
          D6D6D6D6D6D68F8F917575797B7B7C7B7B7C7373747D7D80999999C5C5C5DEDE
          DEF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE6E6E6CCCCCCB0B0B29999998C8C8D7373747373747B
          7B7C6D6D707D7D807D7D808F8F91E6E6E6FCF9F7EFEFEFB5B5B57B7B7C7B7B7C
          D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFDEDEDE7B7B7C7B7B7CADADAEEFEFEFFCF9
          F7E6E6E69999997D7D807D7D806D6D707B7B7C7575796D6D708C8C8D999999AD
          ADAECCCCCCE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEFEFEFCCCCCCB5B5B58F8F917D7D807D7D807D7D807D7D807373749999
          99BFBFC2ADADAE7B7B7C8484857B7B7CB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFBF
          BFC27B7B7C848485757579A5A5ADBFBFC29999997373747D7D807D7D807D7D80
          7D7D808F8F91B0B0B2CCCCCCEAEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7DA
          DAD9B5B5B59E9EA08C8C8D8484856D6D706666666666667B7B7C848485848485
          848485D6D6D6EFEFEFEFEFEFDEDEDE8686897D7D808484857D7D806D6D706666
          666D6D708484858C8C8D9E9EA0B5B5B5D6D6D6F7F7F7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E3BDBDBE9E9E
          A08C8C8D8484858484857D7D807D7D807575797B7B7CA5A5A6A5A5A67D7D8075
          75797D7D807D7D807D7D808484858C8C8D9E9EA0BDBDBEDEDEDEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6C5C5C5A5A5A68C8C8D848485
          8484857B7B7C7373747373747B7B7C8484858484858C8C8DA5A5A6BFBFC2E6E6
          E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEFEFEFCCCCCCB0B0B2999999868689868689999999AD
          ADAECCCCCCEAEAEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEAEAEBB5B5BDB5B5BDE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        mmHeight = 13494
        mmLeft = 227278
        mmTop = 1852
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'PesoLiq2'
        AutoSize = False
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 200025
        mmTop = 112184
        mmWidth = 11906
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'CD_INCOTERM'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3387
        mmLeft = 212196
        mmTop = 112184
        mmWidth = 5673
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'Frete1'
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
        mmLeft = 257969
        mmTop = 112184
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText3'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 247386
        mmTop = 112184
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 247386
        mmTop = 107950
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'VL_SEGURO'
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
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 103717
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'TOTAL INSURANCE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3440
        mmLeft = 200025
        mmTop = 103717
        mmWidth = 27781
        BandType = 0
      end
      object ppDBText46: TppDBText
        UserName = 'DBText401'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 247386
        mmTop = 103717
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 247386
        mmTop = 95515
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText402'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 247386
        mmTop = 99748
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'VL_ACRESCIMO'
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
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 95515
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'Frete2'
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
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 99748
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'TOTAL DOCUMENTS/OTHER FEES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3440
        mmLeft = 200025
        mmTop = 95515
        mmWidth = 47096
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'TOTAL DISCOUNT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 200025
        mmTop = 99484
        mmWidth = 25135
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText4'
        DataField = 'VL_TOT_CUBAGEM'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDE_Proc'
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 103717
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText52: TppDBText
        UserName = 'DBText101'
        DataField = 'NR_TELEFONE'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 30956
        mmTop = 67469
        mmWidth = 44979
        BandType = 0
      end
      object ppDBText53: TppDBText
        UserName = 'DBText102'
        DataField = 'NR_FAX'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 75671
        mmTop = 67469
        mmWidth = 47625
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'NR_TELEFONE'
        DataPipeline = ppBDE_Consig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Consig'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 67469
        mmWidth = 44979
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'NR_FAX'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 218546
        mmTop = 67469
        mmWidth = 47625
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'NR_TELEFONE'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 2910
        mmLeft = 30956
        mmTop = 83608
        mmWidth = 33602
        BandType = 0
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'NR_FAX'
        DataPipeline = ppBDE_Imp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Imp'
        mmHeight = 2910
        mmLeft = 64823
        mmTop = 83608
        mmWidth = 34660
        BandType = 0
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'CGC_EMPRESA'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 4498
        mmLeft = 3704
        mmTop = 19844
        mmWidth = 50006
        BandType = 0
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        DataField = 'NR_CUIT'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 2910
        mmLeft = 30956
        mmTop = 86519
        mmWidth = 92340
        BandType = 0
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'NR_CUIT'
        DataPipeline = ppBDE_Consig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Consig'
        mmHeight = 2910
        mmLeft = 173832
        mmTop = 70379
        mmWidth = 92340
        BandType = 0
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        DataField = 'CONTATO_NOTIFY'
        DataPipeline = ppBDE_Notf1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Notf1'
        mmHeight = 2910
        mmLeft = 100013
        mmTop = 83608
        mmWidth = 37306
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Visible = False
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 8202
        mmWidth = 278078
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 2381
        mmTop = 265
        mmWidth = 13229
        BandType = 7
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppBDE_Exp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_Exp'
        mmHeight = 3260
        mmLeft = 127000
        mmTop = 4498
        mmWidth = 35941
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 11642
        mmLeft = 267230
        mmTop = 265
        mmWidth = 13229
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 2381
        mmTop = 0
        mmWidth = 278078
        BandType = 7
      end
    end
    object ppPageStyle2: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 181240
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object Tunid: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NM_UNID_NEG, '#39'Fone: '#39' + LTRIM( RTRIM( NR_FON' +
        'E ) ) + '#39' - Fax: '#39' + LTRIM( RTRIM( NR_FAX1 ) ) AS NR_FONE_FAX'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 358
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object Dts_Unid: TDataSource
    DataSet = Tunid
    Left = 358
    Top = 232
  end
  object Texp: TQuery
    DatabaseName = 'DbBroker'
    DataSource = Dts_Proc
    SQL.Strings = (
      
        'SELECT CD_EMPRESA AS CODIGO, NM_EMPRESA AS NOME, AP_EMPRESA AS A' +
        'PELIDO_EMPRESA,'
      
        '  '#39'CNPJ:'#39' +SUBSTRING(CGC_EMPRESA,1,2)+'#39'.'#39'+SUBSTRING(CGC_EMPRESA,' +
        '3,3)+'#39'.'#39'+SUBSTRING(CGC_EMPRESA,6,3)+'#39'/'#39'+SUBSTRING(CGC_EMPRESA,9,' +
        '4)+'#39'-'#39'+SUBSTRING(CGC_EMPRESA,13,2) AS CGC_EMPRESA,'
      
        '       END_EMPRESA + CASE LTRIM( RTRIM( ISNULL( END_NUMERO, "" )' +
        ' ) ) WHEN "" THEN "" ELSE ", " END + RTRIM( LTRIM( END_NUMERO ) ' +
        ') AS ENDERECO_NUM,'
      
        '       LTRIM( RTRIM( END_CIDADE ) ) + CASE LTRIM( RTRIM( ISNULL(' +
        ' END_UF, "" ) ) ) WHEN "" THEN "" ELSE "/" END + RTRIM( LTRIM( E' +
        'ND_UF ) ) + " - BRASIL - CEP " +'
      
        '       CASE LTRIM( RTRIM( ISNULL( END_CEP, "" ) ) ) WHEN "" THEN' +
        ' "" ELSE SUBSTRING( END_CEP, 1, 5 ) + "-" + SUBSTRING( END_CEP, ' +
        '6, 3 ) END AS END_CIDADE_UF_CEP,'
      
        '       END_CIDADE AS END_CIDADE, END_CEP AS END_CEP, END_BAIRRO ' +
        'AS END_BAIRRO, END_UF AS END_ESTADO, NR_TELEFONE, NR_FAX, PATH_L' +
        'OGO'
      'FROM   TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_EXPORTADOR'
      '')
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EXPORTADOR'
        ParamType = ptUnknown
        Size = 6
      end>
  end
  object Dts_Exp: TDataSource
    DataSet = Texp
    Left = 32
    Top = 64
  end
  object TImp: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'select E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA + CASE ltrim(rtrim(isnull(e.end_numero,""))) when "" then "" ' +
        'else ", " END + rtrim(ltrim(E.END_NUMERO)) AS ENDERECO_NUM,'
      
        '       CASE ltrim(rtrim(isnull(e.end_compl,""))) when "" then ""' +
        ' else E.END_COMPL END + CASE ltrim(rtrim(isnull(e.end_compl,""))' +
        ') when "" then "" else " - " END +'
      
        '       E.END_CIDADE + CASE ltrim(rtrim(isnull(p.nm_pais_port,"")' +
        ')) when "" then "" else " - " END + rtrim(ltrim(p.nm_pais_port))' +
        ' AS CIDADE_PAIS,'
      
        '       CASE ltrim(rtrim(isnull(e.nr_cliente,""))) when "" then "' +
        '" else "( " END + rtrim(ltrim(E.NR_CLIENTE)) +'
      
        '       CASE ltrim(rtrim(isnull(e.nr_cliente,""))) when "" then "' +
        '" else " )" END AS NR_CLIENTE, E.CD_PAIS AS CD_PAIS,'
      
        '       CASE isnull(e.nr_telefone,"") when "" then '#39#39' else "TEL: ' +
        '"+ isnull(e.nr_telefone,"") END AS NR_TELEFONE,'
      
        '       CASE isnull(e.nr_fax,"")  when "" then "" else "FAX: "+ i' +
        'snull(e.nr_fax,"")   END AS NR_FAX,'
      
        '       CASE isnull(e.nr_ruc,"")  when "" then "" else "RUC: "+ i' +
        'snull(e.nr_ruc,"")   END AS NR_RUC,'
      
        '       CASE isnull(e.nr_cuit,"") when "" then "" else "CUIT: "+ ' +
        'isnull(e.nr_cuit,"") END AS NR_CUIT,'
      
        '       CASE isnull(e.nr_nit,"")  when "" then "" else "NIT: "+ i' +
        'snull(e.nr_nit,"")   END AS NR_NIT'
      'from tempresa_est e'
      'left join tpais_broker p on e.cd_pais=p.cd_pais')
    Left = 88
    Top = 8
    object TImpCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 5
    end
    object TImpNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object TImpENDERECO_NUM: TStringField
      FieldName = 'ENDERECO_NUM'
      FixedChar = True
      Size = 68
    end
    object TImpCIDADE_PAIS: TStringField
      FieldName = 'CIDADE_PAIS'
      FixedChar = True
      Size = 127
    end
    object TImpNR_CLIENTE: TStringField
      FieldName = 'NR_CLIENTE'
      FixedChar = True
      Size = 19
    end
    object TImpCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object TImpNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
    end
    object TImpNR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
    end
    object TImpNR_RUC: TStringField
      FieldName = 'NR_RUC'
      FixedChar = True
      Size = 30
    end
    object TImpNR_NIT: TStringField
      FieldName = 'NR_NIT'
      FixedChar = True
      Size = 30
    end
    object TImpNR_CUIT: TStringField
      FieldName = 'NR_CUIT'
      FixedChar = True
      Size = 31
    end
  end
  object Dts_Imp: TDataSource
    DataSet = TImp
    Left = 88
    Top = 64
  end
  object Tconsig: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA + CASE ltrim(rtrim(isnull(e.end_numero,""))) when "" then "" ' +
        'else ", " END + rtrim(ltrim(E.END_NUMERO)) AS ENDERECO_NUM,'
      
        '       CASE ltrim(rtrim(isnull(e.end_compl,""))) when "" then ""' +
        ' else E.END_COMPL END + CASE ltrim(rtrim(isnull(e.end_compl,""))' +
        ') when "" then "" else " - " END +'
      
        '       E.END_CIDADE + CASE ltrim(rtrim(isnull(p.nm_pais_port,"")' +
        ')) when "" then "" else " - " END + rtrim(ltrim(p.nm_pais_port))' +
        ' AS CIDADE_PAIS,'
      
        'CASE isnull(e.nr_telefone,'#39#39') when '#39#39' then '#39#39' else '#39'TEL: '#39'+ isnu' +
        'll(e.nr_telefone,'#39#39') END AS NR_TELEFONE,'
      
        '       CASE isnull(e.nr_fax,'#39#39') when '#39#39' then '#39#39' else '#39'FAX: '#39'+ is' +
        'null(e.nr_fax,'#39#39')  END AS NR_FAX,'
      
        '       CASE isnull(e.nr_ruc,'#39#39') when '#39#39' then '#39#39' else '#39'RUC: '#39'+ is' +
        'null(e.nr_ruc,'#39#39')  END AS NR_RUC,'
      
        '       CASE isnull(e.nr_cuit,'#39#39') when '#39#39' then '#39#39' else '#39'CUIT: '#39'+ ' +
        'isnull(e.nr_cuit,'#39#39')  END AS NR_CUIT,       '
      
        '       CASE isnull(e.nr_nit,'#39#39') when '#39#39' then '#39#39' else '#39'NIT: '#39'+ is' +
        'null(e.nr_nit,'#39#39')  END AS NR_NIT'
      'FROM TEMPRESA_EST E'
      'left join tpais_broker p on e.cd_pais=p.cd_pais'
      '')
    Left = 145
    Top = 8
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
    object TconsigNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
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
    DataSet = Tconsig
    Left = 145
    Top = 64
  end
  object ppBDE_Exp: TppBDEPipeline
    DataSource = Dts_Exp
    SkipWhenNoRecords = False
    UserName = 'BDE_Exp'
    Left = 33
    Top = 120
    MasterDataPipelineName = 'ppBDE_Proc'
    object ppBDE_ExpppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_ExpppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 80
      DisplayWidth = 80
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
      FieldLength = 23
      DisplayWidth = 23
      Position = 3
    end
    object ppBDE_ExpppField5: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 58
      DisplayWidth = 58
      Position = 4
    end
    object ppBDE_ExpppField6: TppField
      FieldAlias = 'END_CIDADE_UF_CEP'
      FieldName = 'END_CIDADE_UF_CEP'
      FieldLength = 58
      DisplayWidth = 58
      Position = 5
    end
    object ppBDE_ExpppField7: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppBDE_ExpppField8: TppField
      FieldAlias = 'END_CEP'
      FieldName = 'END_CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object ppBDE_ExpppField9: TppField
      FieldAlias = 'END_BAIRRO'
      FieldName = 'END_BAIRRO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object ppBDE_ExpppField10: TppField
      FieldAlias = 'END_ESTADO'
      FieldName = 'END_ESTADO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 9
    end
    object ppBDE_ExpppField11: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 10
    end
    object ppBDE_ExpppField12: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object ppBDE_ExpppField13: TppField
      FieldAlias = 'PATH_LOGO'
      FieldName = 'PATH_LOGO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
  end
  object ppBDE_Imp: TppBDEPipeline
    DataSource = Dts_Imp
    SkipWhenNoRecords = False
    UserName = 'BDE_Imp'
    Left = 88
    Top = 120
    object ppBDE_ImpppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DisplayWidth = 0
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
      FieldAlias = 'CIDADE_PAIS'
      FieldName = 'CIDADE_PAIS'
      FieldLength = 127
      DisplayWidth = 127
      Position = 3
    end
    object ppBDE_ImpppField5: TppField
      FieldAlias = 'NR_CLIENTE'
      FieldName = 'NR_CLIENTE'
      FieldLength = 19
      DisplayWidth = 19
      Position = 4
    end
    object ppBDE_ImpppField6: TppField
      FieldAlias = 'CD_PAIS'
      FieldName = 'CD_PAIS'
      FieldLength = 3
      DisplayWidth = 3
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
  end
  object ppBDE_Consig: TppBDEPipeline
    DataSource = Dts_consig
    SkipWhenNoRecords = False
    UserName = 'BDE_Consig'
    Left = 144
    Top = 120
    object ppBDE_ConsigppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_ConsigppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDE_ConsigppField3: TppField
      FieldAlias = 'ENDERECO_NUM'
      FieldName = 'ENDERECO_NUM'
      FieldLength = 68
      DisplayWidth = 68
      Position = 2
    end
    object ppBDE_ConsigppField4: TppField
      FieldAlias = 'CIDADE_PAIS'
      FieldName = 'CIDADE_PAIS'
      FieldLength = 127
      DisplayWidth = 127
      Position = 3
    end
    object ppBDE_ConsigppField5: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppBDE_ConsigppField6: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppBDE_ConsigppField7: TppField
      FieldAlias = 'NR_RUC'
      FieldName = 'NR_RUC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppBDE_ConsigppField8: TppField
      FieldAlias = 'NR_NIT'
      FieldName = 'NR_NIT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppBDE_ConsigppField9: TppField
      FieldAlias = 'NR_CUIT'
      FieldName = 'NR_CUIT'
      FieldLength = 31
      DisplayWidth = 31
      Position = 8
    end
  end
  object TViaTr: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'select * from tvia_transp_broker')
    Left = 256
    Top = 8
  end
  object Dts_ViaTr: TDataSource
    DataSet = TViaTr
    Left = 256
    Top = 64
  end
  object ppBDE_ViaTr: TppBDEPipeline
    DataSource = Dts_ViaTr
    SkipWhenNoRecords = False
    UserName = 'BDE_ViaTr'
    Left = 256
    Top = 120
  end
  object TLocal1: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'select * from tlocal_embarque')
    Left = 480
    Top = 8
  end
  object Dts_Local1: TDataSource
    DataSet = TLocal1
    Left = 480
    Top = 64
  end
  object ppBDE_Local1: TppBDEPipeline
    DataSource = Dts_Local1
    SkipWhenNoRecords = False
    UserName = 'BDE_Local1'
    Left = 480
    Top = 120
  end
  object TLocal2: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'select * from tlocal_embarque')
    Left = 536
    Top = 8
  end
  object Dts_Local2: TDataSource
    DataSet = TLocal2
    Left = 536
    Top = 64
  end
  object ppBDE_Local2: TppBDEPipeline
    DataSource = Dts_Local2
    SkipWhenNoRecords = False
    UserName = 'BDE_Local2'
    Left = 536
    Top = 120
  end
  object Tpais1: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'select nm_pais_port as descricao from tpais_broker')
    Left = 590
    Top = 8
  end
  object Dts_Pais1: TDataSource
    DataSet = Tpais1
    Left = 590
    Top = 64
  end
  object ppBDE_Pais1: TppBDEPipeline
    DataSource = Dts_Pais1
    SkipWhenNoRecords = False
    UserName = 'BDE_Pais1'
    Left = 590
    Top = 120
  end
  object TAgente: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = Dts_Proc
    SQL.Strings = (
      'SELECT NM_AGENTE'
      'FROM   TAGENTE'
      'WHERE  CD_AGENTE = :CD_AGENTE')
    Left = 646
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_AGENTE'
        ParamType = ptUnknown
        Size = 5
      end>
  end
  object Dts_Agente: TDataSource
    DataSet = TAgente
    Left = 646
    Top = 64
  end
  object ppBDE_Agente: TppBDEPipeline
    DataSource = Dts_Agente
    SkipWhenNoRecords = False
    UserName = 'BDE_Agente'
    Left = 646
    Top = 120
    MasterDataPipelineName = 'ppBDE_Proc'
  end
  object TProc: TQuery
    OnCalcFields = TProcCalcFields
    DatabaseName = 'DbBroker'
    DataSource = Dts_Processo
    SQL.Strings = (
      
        'SELECT TOP 1 LTRIM( RTRIM( NM_SIGLA ) ) + '#39'-'#39' + LTRIM( RTRIM( SU' +
        'BSTRING( E.NR_PROCESSO, 5, 14 ) ) ) +'
      
        '             CASE LTRIM( RTRIM( ISNULL( E.NR_FATURA, '#39#39' ) ) ) WH' +
        'EN '#39#39' THEN '#39#39' ELSE '#39' / '#39' END +'
      
        '             LTRIM( RTRIM( ISNULL( E.NR_FATURA, '#39#39' ) ) ) AS Calc' +
        'NrProcesso,'
      '       E.VL_SEGURO,'
      '       E.VL_TOT_EXW,'
      '       E.VL_ACRESCIMO,'
      '       E.VL_DESCONTO,'
      '       E.NR_PROCESSO,'
      '       E.CD_EXPORTADOR,'
      '       E.CD_IMPORTADOR,'
      '       E.TP_CONSIGNATARIO,'
      '       E.CD_CONSIGNATARIO,'
      '       E.CD_AGENTE,'
      '       E.CD_VIA_TRANSPORTE,'
      '       E.TP_NOTIFY1,'
      '       E.CD_NOTIFY1,'
      '       E.CD_TIPO_FRETE,'
      '       E.TP_NOTIFY2,'
      '       E.CD_NOTIFY2,'
      '       E.CD_LOCAL_ORIGEM,'
      '       E.CD_LOCAL_DESTINO,'
      '       E.CD_CARTA_CREDITO,'
      '       E.VL_FRETE,'
      '       E.VL_TOT_FOB,'
      '       E.VL_PESO_BRUTO,'
      '       E.VL_PESO_LIQUIDO,'
      '       E.VL_TOT_CONTAINER,'
      '       E.VL_TOT_PALLETS,'
      '       E.VL_TOT_QTDE_EMBALAGEM,'
      '       CASE ISNULL(CONVERT(VARCHAR, PEP.TX_MARCACAO_VOLUME), '#39#39')'
      '           WHEN '#39#39' THEN E.TX_MARCACAO_VOLUME'
      '       ELSE PEP.TX_MARCACAO_VOLUME'
      '       END AS TX_MARCACAO_VOLUME,'
      '       E.CD_LINGUA_PEDIDO,'
      '       E.VL_TOT_CUBAGEM,'
      '       P.CD_UNID_NEG,'
      '       E.TX_INF_EMBALAGEM,'
      '       TX_DECL_ADICIONAL,'
      '       TX_DECL_ADIC_INST_EMB,'
      '       VL_TOT_CUBAGEM,'
      '       E.CD_PAIS_ORIGEM,'
      '       T.NM_PAIS_PORT AS NM_PAIS_PORT,'
      '       T.NM_PAIS_ING AS NM_PAIS_ING,'
      '       T.NM_PAIS_ESP AS NM_PAIS_ESP,'
      '       E.CD_INCOTERM,'
      '       E.CD_PAIS_ORIG,'
      '       E.VL_TOT_MCV,'
      '       CASE E.NR_FATURA'
      '           WHEN SUBSTRING( E.NR_PROCESSO, 5, 14 ) THEN '#39#39
      '       ELSE E.NR_FATURA'
      '       END AS NR_FATURA,'
      '       E.CD_PAIS_DESTINO,'
      '       CASE'
      '           WHEN E.CD_MOEDA IN ('#39'150'#39','#39'155'#39','#39'160'#39','#39'165'#39','
      '                               '#39'170'#39','#39'175'#39','#39'190'#39','#39'195'#39','
      '                               '#39'200'#39','#39'205'#39','#39'210'#39','#39'215'#39','
      '                               '#39'217'#39','#39'220'#39','#39'225'#39','#39'230'#39','
      '                               '#39'235'#39','#39'245'#39','#39'640'#39','#39'980'#39','
      '                               '#39'982'#39','#39'983'#39','#39'984'#39','#39'986'#39','
      
        '                               '#39'988'#39','#39'990'#39','#39'992'#39','#39'998'#39') THEN '#39'US' +
        '$'#39
      '           WHEN E.CD_MOEDA IN ('#39'918'#39','#39'978'#39') THEN '#39'EUR'#39
      '           WHEN E.CD_MOEDA  =  '#39'790'#39' THEN '#39'R$'#39
      '       END AS SIGLA_MOEDA,'
      '       CASE E.CD_LINGUA_PEDIDO'
      
        '           WHEN '#39'0'#39' THEN RIGHT( '#39'0'#39' + CONVERT( varchar(2), DATEP' +
        'ART( dd, DT_FATURA ) ), 2 ) + '#39' de '#39' + '
      '               CASE DATEPART( m, DT_FATURA )'
      '                   WHEN 1 THEN '#39'Janeiro'#39
      '                   WHEN 2 THEN '#39'Fevereiro'#39
      '                   WHEN 3 THEN '#39'Mar'#231'o'#39
      '                   WHEN 4 THEN '#39'Abril'#39
      '                   WHEN 5 THEN '#39'Maio'#39
      '                   WHEN 6 THEN '#39'Junho'#39
      '                   WHEN 7 THEN '#39'Julho'#39
      '                   WHEN 8 THEN '#39'Agosto'#39
      '                   WHEN 9 THEN '#39'Setembro'#39
      '                   WHEN 10 THEN '#39'Outubro'#39
      '                   WHEN 11 THEN '#39'Novembro'#39
      '                   WHEN 12 THEN '#39'Dezembro'#39
      
        '               END + '#39' de '#39' + CONVERT(char(4), DATEPART( yyyy, D' +
        'T_FATURA ) )'
      '           WHEN '#39'1'#39' THEN '
      '               CASE DATEPART( m, DT_FATURA )'
      '                   WHEN 1 THEN '#39'January'#39
      '                   WHEN 2 THEN '#39'February'#39
      '                   WHEN 3 THEN '#39'March'#39
      '                   WHEN 4 THEN '#39'April'#39
      '                   WHEN 5 THEN '#39'May'#39
      '                   WHEN 6 THEN '#39'June'#39
      '                   WHEN 7 THEN '#39'July'#39
      '                   WHEN 8 THEN '#39'August'#39
      '                   WHEN 9 THEN '#39'September'#39
      '                   WHEN 10 THEN '#39'October'#39
      '                   WHEN 11 THEN '#39'November'#39
      '                   WHEN 12 THEN '#39'December'#39
      
        '               END + '#39' '#39' + RIGHT( '#39'0'#39' + CONVERT( varchar(2), DAT' +
        'EPART( dd, DT_FATURA ) ), 2 ) +'
      
        '               CASE RIGHT( CONVERT( varchar(2), DATEPART( d, DT_' +
        'FATURA ) ), 1 )'
      '                   WHEN '#39'1'#39' THEN '#39'st'#39
      '                   WHEN '#39'2'#39' THEN '#39'nd'#39
      '               ELSE '#39'th'#39
      
        '               END + '#39', '#39' + CONVERT(char(4), DATEPART( yyyy, DT_' +
        'FATURA ) )'
      
        '           WHEN '#39'2'#39' THEN RIGHT( '#39'0'#39' + CONVERT( varchar(2), DATEP' +
        'ART( dd, DT_FATURA ) ), 2 ) + '#39' de '#39' + '
      '               CASE DATEPART( m, DT_FATURA )'
      '                   WHEN 1 THEN '#39'Enero'#39
      '                   WHEN 2 THEN '#39'Febrero'#39
      '                   WHEN 3 THEN '#39'Marzo'#39
      '                   WHEN 4 THEN '#39'Abril'#39
      '                   WHEN 5 THEN '#39'Mayo'#39
      '                   WHEN 6 THEN '#39'Junio'#39
      '                   WHEN 7 THEN '#39'Julio'#39
      '                   WHEN 8 THEN '#39'Agosto'#39
      '                   WHEN 9 THEN '#39'Septiembre'#39
      '                   WHEN 10 THEN '#39'Octubre'#39
      '                   WHEN 11 THEN '#39'Noviembre'#39
      '                   WHEN 12 THEN '#39'Diciembre'#39
      
        '               END  + '#39' de '#39' + CONVERT(char(4), DATEPART( yyyy, ' +
        'DT_FATURA ) )'
      '       END AS DATA_FATURA,'
      '       IN_REFERENCIA_FAT_INST,'
      
        '       '#39'NCM: '#39' + (SELECT SUBSTRING( CD_NCM, 1, 4 ) + '#39'.'#39' + SUBST' +
        'RING( CD_NCM, 5, 2 ) + '#39'.'#39' + SUBSTRING( CD_NCM, 7, 2 )'
      '                  FROM TPROCESSO_EXP_ITEM I '
      '                  WHERE E.NR_PROCESSO = I.NR_PROCESSO'
      '                    AND NR_ITEM = '#39'001'#39' ) AS CD_NCM'
      'FROM          TPROCESSO_EXP        E   (NOLOCK)'
      
        '   LEFT JOIN  TPROCESSO_EXP_PEDIDO PEP (NOLOCK) ON PEP.NR_PROCES' +
        'SO = E.NR_PROCESSO'
      
        '   INNER JOIN TPROCESSO            P   (NOLOCK) ON P.NR_PROCESSO' +
        '  = E.NR_PROCESSO'
      
        '   INNER JOIN TUNID_NEG            U   (NOLOCK) ON U.CD_UNID_NEG' +
        '  = P.CD_UNID_NEG'
      
        '   INNER JOIN TPAIS_BROKER         T   (NOLOCK) ON E.CD_PAIS_ORI' +
        'G = T.CD_PAIS'
      'WHERE E.NR_PROCESSO = :NR_PROCESSO')
    Left = 200
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object TProcCalcRE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcRE'
      Size = 40
      Calculated = True
    end
    object TProcCalcNF: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNF'
      Size = 40
      Calculated = True
    end
    object TProcCalcTipo_Frete: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcTipo_Frete'
      Size = 30
      Calculated = True
    end
    object TProcCalcTotal: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcTotal'
      Size = 15
      Calculated = True
    end
    object TProcCalcCorpo_Conhec: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcCorpo_Conhec'
      Size = 50
      Calculated = True
    end
    object TProcCalcPais_Origem: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPais_Origem'
      Size = 40
      Calculated = True
    end
    object TProcCalcNrProcesso: TStringField
      FieldName = 'CalcNrProcesso'
      Size = 36
    end
    object TProcCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object TProcCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object TProcTP_CONSIGNATARIO: TStringField
      FieldName = 'TP_CONSIGNATARIO'
      Size = 1
    end
    object TProcCD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Size = 5
    end
    object TProcCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Size = 4
    end
    object TProcCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
    object TProcTP_NOTIFY1: TStringField
      FieldName = 'TP_NOTIFY1'
      Size = 1
    end
    object TProcCD_NOTIFY1: TStringField
      FieldName = 'CD_NOTIFY1'
      Size = 5
    end
    object TProcCD_TIPO_FRETE: TStringField
      FieldName = 'CD_TIPO_FRETE'
      Size = 1
    end
    object TProcTP_NOTIFY2: TStringField
      FieldName = 'TP_NOTIFY2'
      Size = 1
    end
    object TProcCD_NOTIFY2: TStringField
      FieldName = 'CD_NOTIFY2'
      Size = 5
    end
    object TProcCD_LOCAL_ORIGEM: TStringField
      FieldName = 'CD_LOCAL_ORIGEM'
      Size = 4
    end
    object TProcCD_LOCAL_DESTINO: TStringField
      FieldName = 'CD_LOCAL_DESTINO'
      Size = 4
    end
    object TProcCD_CARTA_CREDITO: TStringField
      FieldName = 'CD_CARTA_CREDITO'
      Size = 15
    end
    object TProcVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object TProcVL_TOT_FOB: TFloatField
      FieldName = 'VL_TOT_FOB'
    end
    object TProcVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object TProcVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object TProcVL_TOT_CONTAINER: TFloatField
      FieldName = 'VL_TOT_CONTAINER'
    end
    object TProcVL_TOT_PALLETS: TFloatField
      FieldName = 'VL_TOT_PALLETS'
    end
    object TProcVL_TOT_QTDE_EMBALAGEM: TFloatField
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
    end
    object TProcTX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object TProcCD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Size = 1
    end
    object TProcVL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
    end
    object TProcTX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object TProcTX_DECL_ADIC_INST_EMB: TMemoField
      FieldName = 'TX_DECL_ADIC_INST_EMB'
      BlobType = ftMemo
    end
    object TProcVL_TOT_CUBAGEM_1: TFloatField
      FieldName = 'VL_TOT_CUBAGEM_1'
    end
    object TProcCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object TProcNM_PAIS_PORT: TStringField
      FieldName = 'NM_PAIS_PORT'
      Size = 50
    end
    object TProcNM_PAIS_ING: TStringField
      FieldName = 'NM_PAIS_ING'
      Size = 50
    end
    object TProcNM_PAIS_ESP: TStringField
      FieldName = 'NM_PAIS_ESP'
      Size = 50
    end
    object TProcCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Size = 3
    end
    object TProcCD_PAIS_ORIG: TStringField
      FieldName = 'CD_PAIS_ORIG'
      Size = 3
    end
    object TProcNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Size = 15
    end
    object TProcCD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Size = 3
    end
    object TProcDATA_FATURA: TStringField
      FieldName = 'DATA_FATURA'
      Size = 24
    end
    object TProcIN_REFERENCIA_FAT_INST: TStringField
      FieldName = 'IN_REFERENCIA_FAT_INST'
      Size = 1
    end
    object TProcCD_NCM: TStringField
      FieldName = 'CD_NCM'
      Size = 15
    end
    object TProcNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object TProcCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object TProcTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object TProccalcNCM: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNCM'
      Size = 255
      Calculated = True
    end
    object TProcVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
    end
    object TProcSIGLA_MOEDA: TStringField
      FieldName = 'SIGLA_MOEDA'
      FixedChar = True
      Size = 3
    end
    object TProcVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
    end
    object TProcVL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
    end
    object TProcVL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
    end
    object TProcVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
    end
  end
  object Dts_Proc: TDataSource
    DataSet = TProc
    Left = 200
    Top = 64
  end
  object TProcI: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'select i.cd_unid_medida AS CD_UNID_MEDIDA, u.nm_sigla AS NM_SIGL' +
        'A, i.cd_mercadoria AS CD_MERCADORIA, i.qt_mercadoria AS QT_MERCA' +
        'DORIA,'
      '              i.vl_tot_peso_liq AS VL_TOT_PESO_LIQ,'
      '              i.vl_tot_peso_bruto AS VL_TOT_PESO_BRUTO,'
      
        '              i.vl_unitario AS VL_UNITARIO, i.vl_tot_item AS VL_' +
        'TOT_ITEM, i.TX_MERCADORIA AS NM_MERCADORIA, i.VL_CUBAGEM AS VL_C' +
        'UBAGEM,'
      
        '              CASE ltrim(rtrim(isnull(i.nr_pedido_imp,""))) when' +
        ' "" then "" else "OD: " END + ltrim(rtrim(i.nr_pedido_imp)) +'
      
        '              CASE ltrim(rtrim(isnull(i.nr_pedido,""))) when "" ' +
        'then "" else " - " END + ltrim(rtrim(i.nr_pedido)) +'
      
        '              CASE ltrim(rtrim(isnull(i.nr_pedido,""))) when "" ' +
        'then "" else "" END +'
      
        '              CASE ltrim(rtrim(isnull(p.nm_pais_ing,""))) when "' +
        '" then "" else " ORIGEN : " END + ltrim(rtrim(p.nm_pais_ing)) as' +
        ' NR_OC_REF_ORIGEM'
      '              from tprocesso_exp_item i'
      
        '              left join tmercadoria_exp m on m.cd_mercadoria=i.c' +
        'd_mercadoria'
      
        '              left join tpais_broker p on p.cd_pais=i.cd_pais_or' +
        'igem'
      
        '              left join tunid_medida_broker u on u.cd_unid_medid' +
        'a = i.cd_unid_medida'
      ''
      '              ')
    Left = 312
    Top = 8
  end
  object Dts_ProcI: TDataSource
    DataSet = TProcI
    Left = 312
    Top = 64
  end
  object TNotf1: TQuery
    Active = True
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA + CASE ltrim(rtrim(isnull(e.end_numero,""))) when "" then "" ' +
        'else ", " END + rtrim(ltrim(E.END_NUMERO)) AS ENDERECO_NUM, '
      
        '       CASE ltrim(rtrim(isnull(e.end_compl,""))) when "" then ""' +
        ' else E.END_COMPL END + CASE ltrim(rtrim(isnull(e.end_compl,""))' +
        ') when "" then "" else " - " END +'
      
        '       E.END_CIDADE + CASE ltrim(rtrim(isnull(p.nm_pais_port,"")' +
        ')) when "" then "" else " - " END + rtrim(ltrim(p.nm_pais_port))' +
        ' AS CIDADE_PAIS,'
      
        '       CASE isnull(e.nr_telefone,'#39#39') when '#39#39' then '#39#39' else '#39'TEL: ' +
        #39'+ isnull(e.nr_telefone,'#39#39') END AS NR_TELEFONE,'
      
        '       CASE isnull(e.nr_fax,'#39#39')  when '#39#39' then '#39#39' else '#39'FAX: '#39'+ i' +
        'snull(e.nr_fax,'#39#39')  END AS NR_FAX,'
      
        '       CASE isnull(e.nr_ruc,'#39#39')  when '#39#39' then '#39#39' else '#39'RUC: '#39'+ i' +
        'snull(e.nr_ruc,'#39#39')  END AS NR_RUC,'
      
        '       CASE isnull(e.nr_cuit,'#39#39') when '#39#39' then '#39#39' else '#39'CUIT: '#39'+ ' +
        'isnull(e.nr_cuit,'#39#39') END AS NR_CUIT,'
      
        '       CASE isnull(e.nr_nit,'#39#39')  when '#39#39' then '#39#39' else '#39'NIT: '#39'+ i' +
        'snull(e.nr_nit,'#39#39')  END AS NR_NIT,'
      '       ISNULL(NM_CONTATO, '#39#39') AS CONTATO_NOTIFY       '
      'FROM TEMPRESA_EST E'
      'left join tpais_broker p on e.cd_pais=p.cd_pais'
      '')
    Left = 368
    Top = 8
    object TNotf1CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 5
    end
    object TNotf1NOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object TNotf1ENDERECO_NUM: TStringField
      FieldName = 'ENDERECO_NUM'
      FixedChar = True
      Size = 68
    end
    object TNotf1CIDADE_PAIS: TStringField
      FieldName = 'CIDADE_PAIS'
      FixedChar = True
      Size = 127
    end
    object TNotf1NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
    end
    object TNotf1NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
    end
    object TNotf1NR_RUC: TStringField
      FieldName = 'NR_RUC'
      FixedChar = True
      Size = 30
    end
    object TNotf1NR_NIT: TStringField
      FieldName = 'NR_NIT'
      FixedChar = True
      Size = 30
    end
    object TNotf1NR_CUIT: TStringField
      FieldName = 'NR_CUIT'
      FixedChar = True
      Size = 31
    end
    object TNotf1CONTATO_NOTIFY: TStringField
      FieldName = 'CONTATO_NOTIFY'
      FixedChar = True
      Size = 50
    end
  end
  object Dts_Notf1: TDataSource
    DataSet = TNotf1
    Left = 368
    Top = 64
  end
  object ppBDE_Proc: TppBDEPipeline
    DataSource = Dts_Proc
    SkipWhenNoRecords = False
    UserName = 'BDE_Proc'
    Left = 200
    Top = 120
    MasterDataPipelineName = 'ppBDE_Processo'
    object ppBDE_ProcppField1: TppField
      FieldAlias = 'CalcRE'
      FieldName = 'CalcRE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_ProcppField2: TppField
      FieldAlias = 'CalcNF'
      FieldName = 'CalcNF'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppBDE_ProcppField3: TppField
      FieldAlias = 'CalcTipo_Frete'
      FieldName = 'CalcTipo_Frete'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppBDE_ProcppField4: TppField
      FieldAlias = 'CalcTotal'
      FieldName = 'CalcTotal'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppBDE_ProcppField5: TppField
      FieldAlias = 'CalcCorpo_Conhec'
      FieldName = 'CalcCorpo_Conhec'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppBDE_ProcppField6: TppField
      FieldAlias = 'CalcPais_Origem'
      FieldName = 'CalcPais_Origem'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppBDE_ProcppField7: TppField
      FieldAlias = 'CalcNrProcesso'
      FieldName = 'CalcNrProcesso'
      FieldLength = 36
      DisplayWidth = 36
      Position = 6
    end
    object ppBDE_ProcppField8: TppField
      FieldAlias = 'CD_EXPORTADOR'
      FieldName = 'CD_EXPORTADOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 7
    end
    object ppBDE_ProcppField9: TppField
      FieldAlias = 'CD_IMPORTADOR'
      FieldName = 'CD_IMPORTADOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object ppBDE_ProcppField10: TppField
      FieldAlias = 'TP_CONSIGNATARIO'
      FieldName = 'TP_CONSIGNATARIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppBDE_ProcppField11: TppField
      FieldAlias = 'CD_CONSIGNATARIO'
      FieldName = 'CD_CONSIGNATARIO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppBDE_ProcppField12: TppField
      FieldAlias = 'CD_AGENTE'
      FieldName = 'CD_AGENTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 11
    end
    object ppBDE_ProcppField13: TppField
      FieldAlias = 'CD_VIA_TRANSPORTE'
      FieldName = 'CD_VIA_TRANSPORTE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 12
    end
    object ppBDE_ProcppField14: TppField
      FieldAlias = 'TP_NOTIFY1'
      FieldName = 'TP_NOTIFY1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object ppBDE_ProcppField15: TppField
      FieldAlias = 'CD_NOTIFY1'
      FieldName = 'CD_NOTIFY1'
      FieldLength = 5
      DisplayWidth = 5
      Position = 14
    end
    object ppBDE_ProcppField16: TppField
      FieldAlias = 'CD_TIPO_FRETE'
      FieldName = 'CD_TIPO_FRETE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppBDE_ProcppField17: TppField
      FieldAlias = 'TP_NOTIFY2'
      FieldName = 'TP_NOTIFY2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppBDE_ProcppField18: TppField
      FieldAlias = 'CD_NOTIFY2'
      FieldName = 'CD_NOTIFY2'
      FieldLength = 5
      DisplayWidth = 5
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
      FieldAlias = 'CD_LOCAL_DESTINO'
      FieldName = 'CD_LOCAL_DESTINO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 19
    end
    object ppBDE_ProcppField21: TppField
      FieldAlias = 'CD_CARTA_CREDITO'
      FieldName = 'CD_CARTA_CREDITO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 20
    end
    object ppBDE_ProcppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_FRETE'
      FieldName = 'VL_FRETE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppBDE_ProcppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_FOB'
      FieldName = 'VL_TOT_FOB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppBDE_ProcppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO'
      FieldName = 'VL_PESO_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppBDE_ProcppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQUIDO'
      FieldName = 'VL_PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppBDE_ProcppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_CONTAINER'
      FieldName = 'VL_TOT_CONTAINER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppBDE_ProcppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_PALLETS'
      FieldName = 'VL_TOT_PALLETS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppBDE_ProcppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_QTDE_EMBALAGEM'
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppBDE_ProcppField29: TppField
      FieldAlias = 'TX_MARCACAO_VOLUME'
      FieldName = 'TX_MARCACAO_VOLUME'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField30: TppField
      FieldAlias = 'CD_LINGUA_PEDIDO'
      FieldName = 'CD_LINGUA_PEDIDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
    object ppBDE_ProcppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_CUBAGEM'
      FieldName = 'VL_TOT_CUBAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppBDE_ProcppField32: TppField
      FieldAlias = 'TX_DECL_ADICIONAL'
      FieldName = 'TX_DECL_ADICIONAL'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField33: TppField
      FieldAlias = 'TX_DECL_ADIC_INST_EMB'
      FieldName = 'TX_DECL_ADIC_INST_EMB'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_CUBAGEM_1'
      FieldName = 'VL_TOT_CUBAGEM_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppBDE_ProcppField35: TppField
      FieldAlias = 'CD_PAIS_ORIGEM'
      FieldName = 'CD_PAIS_ORIGEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 34
    end
    object ppBDE_ProcppField36: TppField
      FieldAlias = 'NM_PAIS_PORT'
      FieldName = 'NM_PAIS_PORT'
      FieldLength = 50
      DisplayWidth = 50
      Position = 35
    end
    object ppBDE_ProcppField37: TppField
      FieldAlias = 'NM_PAIS_ING'
      FieldName = 'NM_PAIS_ING'
      FieldLength = 50
      DisplayWidth = 50
      Position = 36
    end
    object ppBDE_ProcppField38: TppField
      FieldAlias = 'NM_PAIS_ESP'
      FieldName = 'NM_PAIS_ESP'
      FieldLength = 50
      DisplayWidth = 50
      Position = 37
    end
    object ppBDE_ProcppField39: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 38
    end
    object ppBDE_ProcppField40: TppField
      FieldAlias = 'CD_PAIS_ORIG'
      FieldName = 'CD_PAIS_ORIG'
      FieldLength = 3
      DisplayWidth = 3
      Position = 39
    end
    object ppBDE_ProcppField41: TppField
      FieldAlias = 'NR_FATURA'
      FieldName = 'NR_FATURA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 40
    end
    object ppBDE_ProcppField42: TppField
      FieldAlias = 'CD_PAIS_DESTINO'
      FieldName = 'CD_PAIS_DESTINO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 41
    end
    object ppBDE_ProcppField43: TppField
      FieldAlias = 'DATA_FATURA'
      FieldName = 'DATA_FATURA'
      FieldLength = 24
      DisplayWidth = 24
      Position = 42
    end
    object ppBDE_ProcppField44: TppField
      FieldAlias = 'IN_REFERENCIA_FAT_INST'
      FieldName = 'IN_REFERENCIA_FAT_INST'
      FieldLength = 1
      DisplayWidth = 1
      Position = 43
    end
    object ppBDE_ProcppField45: TppField
      FieldAlias = 'CD_NCM'
      FieldName = 'CD_NCM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 44
    end
    object ppBDE_ProcppField46: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 45
    end
    object ppBDE_ProcppField47: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 2
      DisplayWidth = 2
      Position = 46
    end
    object ppBDE_ProcppField48: TppField
      FieldAlias = 'TX_INF_EMBALAGEM'
      FieldName = 'TX_INF_EMBALAGEM'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcppField49: TppField
      FieldAlias = 'calcNCM'
      FieldName = 'calcNCM'
      FieldLength = 255
      DisplayWidth = 255
      Position = 48
    end
    object ppBDE_ProcppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_MCV'
      FieldName = 'VL_TOT_MCV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppBDE_ProcppField51: TppField
      FieldAlias = 'SIGLA_MOEDA'
      FieldName = 'SIGLA_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 50
    end
    object ppBDE_ProcppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_SEGURO'
      FieldName = 'VL_SEGURO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object ppBDE_ProcppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_EXW'
      FieldName = 'VL_TOT_EXW'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object ppBDE_ProcppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_ACRESCIMO'
      FieldName = 'VL_ACRESCIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object ppBDE_ProcppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_DESCONTO'
      FieldName = 'VL_DESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
  end
  object ppBDE_ProcI: TppBDEPipeline
    DataSource = Dts_ProcI
    SkipWhenNoRecords = False
    UserName = 'BDE_ProcI'
    Left = 312
    Top = 120
  end
  object ppBDE_Notf1: TppBDEPipeline
    DataSource = Dts_Notf1
    SkipWhenNoRecords = False
    UserName = 'BDE_Notf1'
    Left = 368
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
    object ppBDE_Notf1ppField5: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppBDE_Notf1ppField6: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppBDE_Notf1ppField7: TppField
      FieldAlias = 'NR_RUC'
      FieldName = 'NR_RUC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppBDE_Notf1ppField8: TppField
      FieldAlias = 'NR_NIT'
      FieldName = 'NR_NIT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppBDE_Notf1ppField9: TppField
      FieldAlias = 'NR_CUIT'
      FieldName = 'NR_CUIT'
      FieldLength = 31
      DisplayWidth = 31
      Position = 8
    end
    object ppBDE_Notf1ppField10: TppField
      FieldAlias = 'CONTATO_NOTIFY'
      FieldName = 'CONTATO_NOTIFY'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
  end
  object TNotf2: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA AS CODIGO, E.NM_EMPRESA AS NOME, E.END_EMPRE' +
        'SA + CASE ltrim(rtrim(isnull(e.end_numero,""))) when "" then "" ' +
        'else ", " END + rtrim(ltrim(E.END_NUMERO)) AS ENDERECO_NUM, '
      
        '       CASE ltrim(rtrim(isnull(e.end_compl,""))) when "" then ""' +
        ' else E.END_COMPL END + CASE ltrim(rtrim(isnull(e.end_compl,""))' +
        ') when "" then "" else " - " END +'
      
        '       E.END_CIDADE + CASE ltrim(rtrim(isnull(p.nm_pais_port,"")' +
        ')) when "" then "" else " - " END + rtrim(ltrim(p.nm_pais_port))' +
        ' AS CIDADE_PAIS'
      'FROM TEMPRESA_EST E'
      'left join tpais_broker p on e.cd_pais=p.cd_pais')
    Left = 424
    Top = 8
    object TNotf2CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 5
    end
    object TNotf2NOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object TNotf2ENDERECO_NUM: TStringField
      FieldName = 'ENDERECO_NUM'
      FixedChar = True
      Size = 68
    end
    object TNotf2CIDADE_PAIS: TStringField
      FieldName = 'CIDADE_PAIS'
      FixedChar = True
      Size = 127
    end
  end
  object Dts_Notf2: TDataSource
    DataSet = TNotf2
    Left = 424
    Top = 64
  end
  object ppBDE_Notf2: TppBDEPipeline
    DataSource = Dts_Notf2
    SkipWhenNoRecords = False
    UserName = 'BDE_Notf2'
    Left = 424
    Top = 120
  end
  object TProcesso: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'SELECT P.CD_UNID_NEG,'
      '       P.CD_PRODUTO,'
      '       P.NR_PROCESSO,'
      '       P.CD_PAIS_ORIGEM,'
      '       P.TX_MERCADORIA,'
      '       P.NR_DDE,'
      '       P.CD_EMBARCACAO,'
      '       U.NM_USUARIO AS NM_ANALISTA_COMISSARIA'
      
        'FROM   TPROCESSO P LEFT JOIN TUSUARIO U ON P.CD_ANALISTA_COMISSA' +
        'RIA = U.CD_USUARIO'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO')
    Left = 43
    Top = 177
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
    object TProcessoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object TProcessoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object TProcessoCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object TProcessoTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object TProcessoNR_DDE: TStringField
      FieldName = 'NR_DDE'
      Size = 11
    end
    object TProcessoCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Size = 4
    end
    object TProcessoNM_ANALISTA_COMISSARIA: TStringField
      FieldName = 'NM_ANALISTA_COMISSARIA'
      Size = 50
    end
  end
  object Dts_Processo: TDataSource
    DataSet = TProcesso
    Left = 43
    Top = 233
  end
  object ppBDE_Processo: TppBDEPipeline
    DataSource = Dts_Processo
    SkipWhenNoRecords = False
    UserName = 'BDE_Processo'
    Left = 42
    Top = 289
    object ppBDE_ProcessoppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_ProcessoppField2: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppBDE_ProcessoppField3: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppBDE_ProcessoppField4: TppField
      FieldAlias = 'CD_PAIS_ORIGEM'
      FieldName = 'CD_PAIS_ORIGEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 3
    end
    object ppBDE_ProcessoppField5: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcessoppField6: TppField
      FieldAlias = 'NR_DDE'
      FieldName = 'NR_DDE'
      FieldLength = 11
      DisplayWidth = 11
      Position = 5
    end
    object ppBDE_ProcessoppField7: TppField
      FieldAlias = 'CD_EMBARCACAO'
      FieldName = 'CD_EMBARCACAO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 6
    end
    object ppBDE_ProcessoppField8: TppField
      FieldAlias = 'NM_ANALISTA_COMISSARIA'
      FieldName = 'NM_ANALISTA_COMISSARIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
  end
  object TRE: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = Dts_Proc
    SQL.Strings = (
      
        'SELECT SUBSTRING( NR_RE, 1, 2 ) + '#39'/'#39' + SUBSTRING( NR_RE, 3, 7 )' +
        ' + '#39'-'#39' + SUBSTRING( NR_RE, 10, 3 ) AS NR_RE'
      'FROM   TPROCESSO_EXP_RE'
      'WHERE  NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_RE')
    Left = 218
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
  end
  object Dts_RE: TDataSource
    DataSet = TRE
    Left = 216
    Top = 232
  end
  object ppBDE_Unid: TppBDEPipeline
    DataSource = Dts_Unid
    SkipWhenNoRecords = False
    UserName = 'BDE_Unid'
    Left = 360
    Top = 288
    object ppBDE_UnidppField1: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_UnidppField2: TppField
      FieldAlias = 'NM_UNID_NEG'
      FieldName = 'NM_UNID_NEG'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppBDE_UnidppField3: TppField
      FieldAlias = 'NR_FONE_FAX'
      FieldName = 'NR_FONE_FAX'
      FieldLength = 54
      DisplayWidth = 54
      Position = 2
    end
  end
  object TDesp: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'select * from tdespachante'
      ''
      '')
    Left = 438
    Top = 176
  end
  object Dts_Desp: TDataSource
    DataSet = TDesp
    Left = 438
    Top = 232
  end
  object ppBDE_Desp: TppBDEPipeline
    DataSource = Dts_Desp
    SkipWhenNoRecords = False
    UserName = 'BDE_Desp'
    Left = 438
    Top = 288
  end
  object TReferencia: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select a.nm_referencia AS REFER_NR_CLIENTE'
      'from tprocesso_exp p'
      'left join taux_exp_ref a on a.nr_processo = p.nr_processo')
    Left = 134
    Top = 176
  end
  object Dts_Ref: TDataSource
    DataSet = TReferencia
    Left = 133
    Top = 229
  end
  object ppBDE_Ref: TppBDEPipeline
    DataSource = Dts_Ref
    SkipWhenNoRecords = False
    UserName = 'BDE_Ref'
    Left = 134
    Top = 286
  end
  object TNF: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = Dts_Proc
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPROCESSO_EXP_NF'
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Left = 284
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object Dts_NF: TDataSource
    DataSet = TNF
    Left = 282
    Top = 232
  end
  object Tpais3: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select NM_PAIS_PORT AS DESCRICAO from tpais_broker')
    Left = 502
    Top = 176
  end
  object TPais2: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select NM_PAIS_PORT AS DESCRICAO from tpais_broker')
    Left = 558
    Top = 176
  end
  object Dts_Pais3: TDataSource
    DataSet = Tpais3
    Left = 502
    Top = 232
  end
  object Dts_Pais2: TDataSource
    DataSet = TPais2
    Left = 558
    Top = 232
  end
  object ppBDE_Pais2: TppBDEPipeline
    DataSource = Dts_Pais2
    SkipWhenNoRecords = False
    UserName = 'BDE_Pais2'
    Left = 558
    Top = 288
  end
  object ppBDE_Pais3: TppBDEPipeline
    DataSource = Dts_Pais3
    SkipWhenNoRecords = False
    UserName = 'BDE_Pais3'
    Left = 502
    Top = 288
  end
  object TLocal3: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'select * from tlocal_embarque')
    Left = 624
    Top = 176
  end
  object Dts_Local3: TDataSource
    DataSet = TLocal3
    Left = 624
    Top = 232
  end
  object ppBDE_Local3: TppBDEPipeline
    DataSource = Dts_Local3
    SkipWhenNoRecords = False
    UserName = 'BDE_Local3'
    Left = 624
    Top = 288
  end
  object qry_proc_exp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, IN_DECL_AD_INSTR_EMB'
      'FROM   TPROCESSO_EXP'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 282
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object TEmb: TQuery
    DatabaseName = 'DbBroker'
    DataSource = Dts_Processo
    SQL.Strings = (
      'SELECT NM_EMBARCACAO'
      'FROM   TEMBARCACAO'
      'WHERE  CD_EMBARCACAO = :CD_EMBARCACAO')
    Left = 702
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
        Size = 5
      end>
  end
  object Dts_Emb: TDataSource
    DataSet = TEmb
    Left = 702
    Top = 64
  end
  object ppBDE_Emb: TppBDEPipeline
    DataSource = Dts_Emb
    SkipWhenNoRecords = False
    UserName = 'BDE_Emb'
    Left = 702
    Top = 120
    MasterDataPipelineName = 'ppBDE_Processo'
  end
  object ppBDE_RE: TppBDEPipeline
    DataSource = Dts_RE
    SkipWhenNoRecords = False
    UserName = 'BDE_RE'
    Left = 216
    Top = 286
    MasterDataPipelineName = 'ppBDE_Proc'
  end
  object TCartaCred: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = Dts_Proc
    SQL.Strings = (
      'SELECT *'
      'FROM   TEXP_CARTA_CRED ( NOLOCK )'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 765
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
    Left = 765
    Top = 64
  end
  object ppBDE_CartaCred: TppBDEPipeline
    DataSource = Dts_CartaCred
    SkipWhenNoRecords = False
    UserName = 'BDE_CartaCred'
    Left = 765
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
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 13
    end
    object ppBDE_CartaCredppField15: TppField
      FieldAlias = 'NM_PAIS_ORIGEM'
      FieldName = 'NM_PAIS_ORIGEM'
      FieldLength = 120
      DisplayWidth = 120
      Position = 14
    end
    object ppBDE_CartaCredppField16: TppField
      FieldAlias = 'TX_TERMO_PAGTO'
      FieldName = 'TX_TERMO_PAGTO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object qryItensPO: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = Dts_Proc
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, TX_INF_EMBALAGEM, TX_MARCACAO_VOLUME, TX_MER' +
        'CADORIA'
      'FROM TPROCESSO_EXP_PEDIDO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 869
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qryItensPONR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryItensPOTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qryItensPOTX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object qryItensPOTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TPROCESSO_EXP_PEDIDO.TX_MERCADORIA'
      BlobType = ftMemo
    end
  end
  object dsItensPO: TDataSource
    AutoEdit = False
    DataSet = qryItensPO
    Left = 869
    Top = 64
  end
  object ppBDE_ItensPO: TppBDEPipeline
    DataSource = dsItensPO
    UserName = 'BDE_ItensPO'
    Left = 869
    Top = 120
    MasterDataPipelineName = 'ppBDE_Proc'
  end
end

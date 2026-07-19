object datm_DI_Resumo: Tdatm_DI_Resumo
  OldCreateOrder = True
  Left = 395
  Top = 215
  Height = 352
  Width = 718
  object qry_resumo_di_: TQuery
    AfterOpen = qry_resumo_di_AfterOpen
    BeforeClose = qry_resumo_di_BeforeClose
    OnCalcFields = qry_resumo_di_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT *, (select sum(A.VL_AFRMM) from TADICAO_DE_IMPORTACAO A w' +
        'here A.NR_PROCESSO = NR_PROCESSO_COMPLETO) as VL_TOTAL_AFRMM'
      'FROM VW_RESUMO_DI'
      'WHERE NR_PROCESSO_COMPLETO = :NR_PROCESSO')
    Left = 120
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_resumo_di_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Size = 3
    end
    object qry_resumo_di_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_resumo_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Size = 3
    end
    object qry_resumo_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
      DisplayFormat = '#0,.0000000'
    end
    object qry_resumo_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
      DisplayFormat = '#0,.0000000'
    end
    object qry_resumo_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
    end
    object qry_resumo_di_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      DisplayFormat = '#0,.0000000'
    end
    object qry_resumo_di_TX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      DisplayFormat = '#0,.0000000'
    end
    object qry_resumo_di_TX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
      DisplayFormat = '#0,.0000000'
    end
    object qry_resumo_di_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      DisplayFormat = '#0,.0000000'
    end
    object qry_resumo_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_ICMS: TFloatField
      FieldName = 'VL_TOT_ICMS'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_SDA: TFloatField
      FieldName = 'VL_SDA'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_CONTR_ASSIST: TFloatField
      FieldName = 'VL_CONTR_ASSIST'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TRIBUTO_PAGO: TFloatField
      FieldName = 'VL_TRIBUTO_PAGO'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_CD_RECEITA_PGTO: TStringField
      FieldName = 'CD_RECEITA_PGTO'
      Size = 4
    end
    object qry_resumo_di_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
    end
    object qry_resumo_di_IN_EMBUT_SEG_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_SEG_ITENS'
    end
    object qry_resumo_di_VL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object qry_resumo_di_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_resumo_di_VL_FRETE_MOEDA: TFloatField
      FieldName = 'VL_FRETE_MOEDA'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_PIS: TFloatField
      FieldName = 'VL_PIS'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOTAL_TRIBUTOS: TFloatField
      FieldName = 'VL_TOTAL_TRIBUTOS'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 14
    end
    object qry_resumo_di_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_Calc_CIF: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_CIF'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
    object qry_resumo_di_Calc_NR_PROCESSO: TStringField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Calc_NR_PROCESSO'
      Size = 18
      Calculated = True
    end
    object qry_resumo_di_Calc_VL_FRETE_MNEG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_VL_FRETE_MNEG'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
    object qry_resumo_di_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
    end
    object qry_resumo_di_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_DESPS_MN_1: TFloatField
      FieldName = 'VL_TOT_DESPS_MN_1'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_DESPS_MNEG_1: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG_1'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_MLE_MNEG_1: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG_1'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_TOT_SEGURO_MNEG_1: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG_1'
      DisplayFormat = '#0,.00'
    end
    object qry_resumo_di_VL_BASE_CALC_ICMS: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS'
    end
    object qry_resumo_di_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_resumo_di_NM_MOEDA_MLE: TStringField
      FieldName = 'NM_MOEDA_MLE'
      Size = 30
    end
    object qry_resumo_di_NM_MOEDA_SEGURO: TStringField
      FieldName = 'NM_MOEDA_SEGURO'
      Size = 30
    end
    object qry_resumo_di_NM_MOEDA_FRETE: TStringField
      FieldName = 'NM_MOEDA_FRETE'
      Size = 30
    end
    object qry_resumo_di_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_resumo_di_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_resumo_di_RECINTO: TStringField
      FieldName = 'RECINTO'
      FixedChar = True
      Size = 30
    end
    object qry_resumo_di_APLICACAO: TStringField
      FieldName = 'APLICACAO'
      FixedChar = True
      Size = 7
    end
    object qry_resumo_di_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qry_resumo_di_DT_CHEG_NAVIO: TDateTimeField
      FieldName = 'DT_CHEG_NAVIO'
    end
    object qry_resumo_di_NM_TRANSP_ROD: TStringField
      FieldName = 'NM_TRANSP_ROD'
      FixedChar = True
      Size = 60
    end
    object qry_resumo_di_VL_ICMS_A_RECOLHER_AFRMM: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER_AFRMM'
    end
    object qry_resumo_di_NR_PROCESSO_COMPLETO: TStringField
      FieldName = 'NR_PROCESSO_COMPLETO'
      FixedChar = True
      Size = 18
    end
    object qry_resumo_di_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qry_resumo_di_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object qry_resumo_di_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      FixedChar = True
      Size = 2
    end
    object qry_resumo_di_IN_FUNDO_POBREZA: TStringField
      FieldName = 'IN_FUNDO_POBREZA'
      FixedChar = True
      Size = 1
    end
    object qry_resumo_di_VL_FUNDO_POBREZA: TFloatField
      FieldName = 'VL_FUNDO_POBREZA'
    end
    object qry_resumo_di_VL_IMPOSTOS: TFloatField
      FieldName = 'VL_IMPOSTOS'
      Origin = 'DBBROKER.VW_RESUMO_DI.VL_IMPOSTOS'
      DisplayFormat = '0.,00'
    end
    object qry_resumo_di_VL_BASE_CALC_ICMS_AFRMM: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS_AFRMM'
      Origin = 'DBBROKER.VW_RESUMO_DI.VL_BASE_CALC_ICMS_AFRMM'
    end
    object qry_resumo_di_IN_MARINHA_MERCANTE_ICMS: TStringField
      FieldName = 'IN_MARINHA_MERCANTE_ICMS'
      Origin = 'DBBROKER.VW_RESUMO_DI.IN_MARINHA_MERCANTE_ICMS'
      FixedChar = True
      Size = 1
    end
    object fltfld_resumo_di_VL_ICMS_ACRESCIMOS: TFloatField
      FieldName = 'VL_ICMS_ACRESCIMOS'
      Origin = 'DBBROKER.VW_RESUMO_DI.VL_ICMS_ACRESCIMOS'
    end
    object qry_resumo_di_CD_REF_OUTROS: TStringField
      FieldName = 'CD_REF_OUTROS'
      Origin = 'DBBROKER.VW_RESUMO_DI.VL_IMPOSTOS'
      FixedChar = True
      Size = 16
    end
    object qry_resumo_di_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.VW_RESUMO_DI.VL_ICMS_ACRESCIMOS'
      FixedChar = True
      Size = 3
    end
    object qry_resumo_di_VL_TOTAL_AFRMM: TFloatField
      FieldName = 'VL_TOTAL_AFRMM'
    end
  end
  object ds_resumo_di: TDataSource
    AutoEdit = False
    DataSet = qry_resumo_di_
    Left = 121
    Top = 81
  end
  object ppReport: TppReport
    DataPipeline = ppBDEPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\CRDI032.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 32
    Top = 11
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        AutoSize = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D6167651E1C0000FFD8FFE000104A4649460001020100C800
          C80000FFEE000E41646F626500640000000001FFDB0084000604040405040605
          050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010707070D0C0D18
          101018140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108005B
          00D103011100021101031101FFDD0004001BFFC401A200000007010101010100
          00000000000000040503020601000708090A0B01000202030101010101000000
          00000000010002030405060708090A0B10000201030302040206070304020602
          73010203110400052112314151061361227181143291A10715B14223C152D1E1
          331662F0247282F12543345392A2B26373C235442793A3B33617546474C3D2E2
          082683090A181984944546A4B456D355281AF2E3F3C4D4E4F465758595A5B5C5
          D5E5F566768696A6B6C6D6E6F637475767778797A7B7C7D7E7F7384858687888
          98A8B8C8D8E8F82939495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACA
          DAEAFA110002020102030505040506040803036D010002110304211231410551
          1361220671819132A1B1F014C1D1E1234215526272F1332434438216925325A2
          63B2C20773D235E2448317549308090A18192636451A2764745537F2A3B3C328
          29D3E3F38494A4B4C4D4E4F465758595A5B5C5D5E5F5465666768696A6B6C6D6
          E6F6475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F83949596979
          8999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C030100021103
          11003F00F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD0F54E2A926B7E
          71D0F4797D1B994BDC815304439B0AF4E5D97E9CC8C5A59CC58E4E1E7D763C46
          89F57724E3F35341E4434170ABD8F1535FA3965FFC9F3EF0E2FF002C63EE923E
          D3F30FCA972789BBF418F6994A7E3B8CAA5A2C83A37C3B4F0CBAD7F593FB6BCB
          4BA8C496D324C87F6A360C3F0CC79448E61CD84E32160DAAE4593B15762AEC55
          D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B157FFD1F54E2AF0CD7219D35EBE8AE09F58DCB8773FE536C7FE04E743888E01
          5DCF1FA88919240F3E27AE693E56D0F4EB68E386D6391828E53C8A1DD8F7249A
          E69726A2723B97A6C3A4C7014004835CF34F92ADE792D1EC12F64889593D3893
          8861B11C8D3F0CC9C3A7CC45DF0B85A8D5E9E2787878FE0910D47F2F65979C02
          EF45B8ED35B96500FB852C3FE1732383381BF0E41E6E1F8BA526C71E23FD14F7
          4DD575D515D3354B4F305B8FF744A443754F9F427FD6198F931C3F8A32C47FD3
          41CCC59B27F04A39C7FA4C8AD71F9ABE4FD36E4597982EC685A870127D56F7E1
          25492392B0AAB2D46512D2CB9C7D63FA2E663D644ED2071CBFA489D27F33BC81
          ABEA10E9DA66BB6B777D704886DE27ABB15058D053C06572C1302C86E8E68134
          0B27CA9B5D8ABB15762AEC55D8AA5BAFF99342F2F592DF6B77D1585A33889669
          8F152EC090BF3A29C942064680B6329888B2C7C7E71FE5712147996C89240003
          F52761DB2DFCB64EE2D7F98877B32041008DC1DC650DCEC55D8ABB1549BCC5E7
          3F2AF96CC035DD4E0D38DCF2FAB89DB8F3E14E54F95464E18E52E42D84F2463C
          CA5B61F9ADF973A85EC16365E60B4B8BCB97115BC08F56776E8A053A9C99D3CC
          0B2188CD0268165794B6A95DDDDB5A5B4B75752AC36D0234934CE42AAA28AB33
          13D001840BD904D311FF0095CBF95B4AFF0089AC69FF00193FB32EFCB64EE2D5
          F98877B27D2358D3758D3E2D434C9D6E6CA6A98674078B006955A8151954A262
          68B6C6408B08CC8A5FFFD2F54E2AC0FF00323CAEF3A7E99B44E5246BC6F2351B
          941D241EE9FB5FE4E6C743A8AF41FF0035D2F6A692FF00791FF3FF00E2936F22
          7991356D2D6DE561F5EB450928EEE8365907CFF6BFCACA7578382563E99395D9
          DAA192147EB8FE389E75E67D21F4AD7A682E01FABC927AD1B8FDA89DAA69EEBB
          AE6D3065E380239BA2D5E1F0F290797D5FE6BD66CB44F2F8B3885B595B9B7640
          50F056AA91506A46F5CD2CF2CEF726DE971E9F1708A8C69057BE45F2C5D9E5F5
          316F2F512DB931303FEC76CB21ABC91EB7EF6AC9D9F865D384FF0047D2F943F3
          96E0BFE626A56BF5A96EE3D38476714B3B727023404AD7FC9766CDA6037106B8
          6DC09C384F0D9970FF003930FC85825FF1D8BE867B7827B1B691E0175511C8F2
          D23E1C87D962A5A8D833806344123FA2884CC6428C632FE9FF0017F45F46C5F9
          A7E55B7BE974BD76F6DF48D5ADE827B69A642B522A28E0D370797C59AD9E94D5
          C7D717638B5809E198E097FB1FF4C9CE99E71F2A6A82E1B4ED5ED2E96D104972
          D14C8C23435A33907E15DBBE512C721CC3923244F22914FF009D3F95B05D7D5A
          4F31DA7A95A12A59D01F775529FF000D960D364EE607510EF65BA7EA361A8D9C
          77B61711DD5A4C39453C2C1D187B32D465241068B6820EE1BBDBFB2B0B57BABD
          B88ED6DA2159279982228F7662062013C949039B10FF0095D7F957F59FAB7F88
          ED7D4AD3955B857FD7E3C3FE1B2EFCAE4EE6AFCC43BDE65FF3943E61B4BBD37C
          B765653A5C5BDCBCD7A258983A32A288D082B507777CCAD0C082497175B3B000
          78E7907481ABF9E341D348AADC5EC3EA7FA91B7A8DFF000A999B965C3027C9C4
          C51B900FB9259A28626966758E2415777215401DC93B0CD08776C3F50FCE2FCB
          1D3E568AE3CC569EA29A32C4C65A1FF9E61B2F1A6C87A349D440755B65F9D1F9
          5D78E121F31DA0726804ACD17E2E146274D907451A881EACC2DEE6DEE604B8B6
          95268241CA396360C8C3C430A8394914DA0DBC53F3CBCA9A3F99FCC764B77E6F
          D37446D3AD8A7D46EC832F295B9973F1A503284A66769721844D44CADC3D4E31
          23F508A47F959F94BA15A79E74ED4ADFCDFA76B4FA717B9FA8DA0AC868A515BE
          DB51519C1E993CFA826047098DB0C1800903C424FA12F6FECAC6DDAE6F6E23B5
          B74FB734CEB1A0F9B310335C013C9CF240E6F19FCE0F39F943CD1A5268363E79
          D3F4CB377E5A8811CB72D305A148F945F088EBF137F3E66E9F1CA06CC4970F51
          923214240311FCB6F21FE4FC7ACA5CEB3E6FB0D6DD08367A7906D612E3F6A513
          1AC9BFD98FECFF00AD97E7CB96B6898B561C58EF79093E99844422410F1F4B88
          F4F8538F1A6DC69B5299AA2EC9762AFF00FFD3F54E2AE2010411507A8C55E75E
          65F2BDFE857E35DF2F82B1212F342BBFA75FB5F0FED44DFB4BFB39B4C1A88E48
          F04FF1FF001E745ABD24B0CBC5C5CBFDCFFC713359F45F3D68FE8B1106A700E4
          17F6A373B721FCF1365353D3CEF9C4B90258F598EBE998FF0063FF001D4BBCB5
          E61BDF2E5E0D035F531C20FF00A35C1355504EDBF788F63FB19767C2328E3838
          FA5D4CB04BC2CBCBF865F8FE17A0B4B1AC4662C3D355E65FB7102B5CD5D3BCB7
          C19AF6A6FAAEBBA8EA6E6AF7D7535C1F948E587E19D0423400747295925EEDFF
          0038C5E5AB1BBD035FBFBFB749E1BAB88ED50482A38C09C9A9FECA4CC1D66531
          90A34E5E970C6713C43883C43CDF716F77E6BD66E2015B77BD9C41525BF768E5
          1373B9F85733E1742F9B866201A1C93FFCBDF20799BCDD61AADB6937696B6086
          237B6FCA8F72CB528AB18A7A8230C5BE23C7E2FE6C8649C624197FA648122088
          EE7F98C4F53D3E4D3B52BAD3E53592D25785C814DD0D3A1E9F2CB18036F78FF9
          C51BBBE27CC367CD8E9F1FD5E548FF0065667E618AF872551CBFD5CD76BC0D8F
          5761A12770F3DFCE5FCC5BFF0037F99EEADD276FD01A74CF0D85AA9A2398CF16
          9DC7ED33B03C6BF6533274D84423FD22D1A8CC672FE8B7F94BF94B73E7EB9BC7
          92ECD869761C566B8440EEF2B8256340C42ECA393B63A8D4787E64AE0C1E27B9
          20F3E79667F2AF9A2F3CB6F74D770E9CC05B48761E9CCA25D92A4213CBE30BFB
          596629F1C78BBDAF2C3865C3DCCCBFE71B749FAEFE652DD32D63D32D269C93D9
          E4A44BFF00126CA35B2AC7EF6ED1C6E7EE7A67E77F92FCD1E63BB8CCDE67D3B4
          5F2CC318F4ECEEE5922F565EAF2494F85E9F6517F6731B4B96311C8CA4E4EA71
          CA5D4462F32F2C7907F2A2CAFA5FF1779D2C6EEDD54082DB4D795416A9E46493
          8741FB2AB9953CD908F4C4FF009CE34316307D52FF004AC23CED67E58B4F335E
          DBF962E9AFB425286D2E1C96279282EB520160ADF0D6997E232311C5F5346411
          12F4F27B2FFCE2A6A1AA33EBDA71919B4A85609A28C9256399CB06E1FCBCD57E
          203F973075E06C7AB99A12771D1E57F9B5AA8D5FF323CC179F6916E9ADA2277F
          82D80847E2873334F1E1800E2E795CCBD2BFE71534657D575ED64A0FDC450D9C
          6DEF2132BFE0A998BAF96C0393A18EE4A37F387F2F7CC9AF6BF3DFEB9E6FD274
          ED291A9A6E9D752C9188A2ECC5294691BABBE474D9A318D0892596A31191B320
          0316F2AF923F256D239C79B7CE16D7D725A9047A7BCB142894EA5B87277AFF00
          B15CBB265CA7E98B5431E21F549E61ACDBE9B16AD7D069D31BAD3639E44B3B87
          1BC9086211C8FF0029732A24D0BE6E2C80BDB93E9AFF009C63D4B54BBF22DD43
          792B4B6D6578F0D897258AC7C158A027F6559BE1CD5EBA204F6767A324C777AF
          E61396FF00FFD4F54E2AEC55C402287A62AC23CC7E47B88AE7F4BF9718DB5EA1
          E6D6E878863DCA7615EE87E06CD860D58238726E1D46ABB3C83E262F4CBF9AA1
          69AEE8DE66B7FD11E62845A6A6878A48470F8FA5509FB0FF00E437DAC94B0CF1
          1E2C7EA8B086A31EA07879470CD2CD762F38796B44D474C8D85E69B756F2C167
          74D5A42F221552D4A94A57A7D9FE5C9C7C3CC41FA66C09CDA5147D78BBFF009A
          F95F52D1F51D267FAB5FC0D0B8FB2C774703BA30D9866716B84C48587D3FF961
          C3CADF909FA5643C1CDA5D6A4C7FCA939327E0133519FD79ABFCD76D87D38ADF
          2A2722A0B6EC7763EE7739B7756FA83F287C99629F94BA7EA72B359EA0C6E351
          8EFA3F864452E4AF2FE65E08BB66B72EA4C7211F547E9E173068E33C625F4CFF
          00866F99EFEF66BFBFBABF99CC935DCD24F2487AB348C589FA6B9B102B670EC9
          E6FA4FFE71B3459A1FCBCD56FE2F86E754B995616E9B43188D3FE1CBE6AF5B2F
          581DCECB471F413DEF9A2786782E2682E1592E2191E39D185195D5886041EF5C
          DA02EB69EC9F929F9C1E54F25795F50D37588EE3EB4F72D7503411FA8250E8AA
          12B51C5815FDACC2D4E9A539021CCD36A2308905E5DE6CF305D798FCCBA96B97
          29E9CB7F3B49E975F4D3ECA27FB040AB9978E1C3103B9C69CF8A44BD9BFE71AA
          DFF47797FCD9E6731191A0558A24037616F134CCA3E6CEB983AD3728C5CCD18A
          1293C4B5EF30EADE64D4E6D5F58B86BABBB93CC9724AA29DD5235E88883650B9
          9D08088A0E14A6646CBD13C8DA47E4545E525D57CDBA9C971ACFC6D2E948D223
          27162123448C0F50B2D1B997FDACC7CB2CBC5511B3918A38B86E477799DF4B6D
          35F5C4B6B07D56D6495DADEDAA5BD38CB1289C8EEDC576AE650E4E31E6FA33FE
          71CA04D1BF2DB5CF30CA0012CD34DC8ED58ECE2A0FF86E79ACD69E2988BB1D20
          A812F9BE5B896E6692E6524CB70ED2B93DDA462C7F139B3AA75B76FA0FF2CEF2
          F3CA1FF38FDAD799AD107D7EE1EE2E2DDD8546CCB6F1B11E094E79AECE04F308
          9E4EC30930C4641F3F5F5D5DDF5D4B797B33DDDE4C4BCB3CCC5DDD8EE49639B1
          000D8380493B97AADB699F905A5792E2BEBABC935EF324B6E0FD4124951BEB2E
          BFDDFA69C42246FB16639886598CAAB862E508E211BFAA4F2515037FA732DC47
          D87F90BA47E8DFCAED22ABC64BD125E480F8CCE4AFFC204CD36AE5790BB7D2C6
          A01E8398CE43FFD5F54E2AEC55D8ABB15487CCBE4FD2F5C8CBC8BE8DE8144BA4
          1BFB071FB6B99383532C7FD570B55A18661BED2FE7318875AF31F9558586BB01
          BFD28FC11CE3E2F87C031EBFF18E4CCB38B1E6F540F0CDD7C73E5D37A720E3C7
          FCEFC7FB9921F5AFCBFF002AF9B74F964D1E489E390132D84BF6031F01F6E16F
          9631D4CF19E1C83FCE49D1E3CBEBC12E13FCDFC7D2E3A8E9F0E823C9BE6ED25A
          DF4930A5A8F47908DA18E814554F2A7C23E246C074FC478F19B2CA3AE30F4668
          F0FF0049BB1FC93FC97D421F56CB4C8A78CF74B89CD3E63D4A8CA27A8CD13476
          73B1E2C33171F533B87CBFA441A02E810C1E9E92B6FF00535B756614878F0E3C
          ABCBECF7AF2CC5333C5C5D5CAE0155D183DD7FCE3DFE573DABC76DA40827E3FB
          A93D69C8561D2A0B9A8F1CC98EB260EE7671F2692241AD8A33C85AE689A3DBC3
          E545B15D25AD5DE18A2466788C85C961C9C9705989A72CB353A627D60F107134
          9AE8DF8721C12FA7FA2A9E6FFC97F20F9AEFDB51D46CDE1D41E9EB5D5A486179
          29B0E74AAB1FF2B8F2CA31EA670143939D934F091B285F2E7E427E5BE857E97F
          158C97B73130685AF6533AA30E85508095FF005970CF57390AB4434B089B549F
          F21BF2B279E49E6D183CD33B492399E7A9672598FDBEE4E01ABC83AA4E9A07A3
          27F2C7947CBDE58D31B4BD12D05AD8BC8D2BC5C99EAEF40C4972C77A6553C929
          9B2D908088A0C2754FF9C73FCB2BFBD92E96DAE6C8CAC59A1B59DA38B9135255
          086E3F25F872F8EB32014D32D2409B44F97FF207F2D745BE8EF52C64BDB88583
          C26F65332AB0DC109B21FF0064AD827ABC921569869611369779DFF2AFF29B43
          D0F56F33DEF97DAECDB2BDD5C471CF32B48CCD56A55C28A96C962CF924444163
          9306300921318353FC9FD234A1E403796F6505E208A4D25A69390FAE0E5E9B49
          53C1A4E7DE4C898E5278FED640E303818E0F24FF00CE367E9A6D0E96BFA55261
          6C6D3EB371CBD6AF1F4C1E7C4BD76E20E5BE2E7ABE8D7E161BAEA9FE8BE74FCA
          FB1F25DB69D74D6DA6E833ADCDBD969F349F59F52D6191A391D82FA84216E5CB
          9FD9FE6CAA58F21958DE4D83240468F261373F971FF38F7279A57435BDBAB6BD
          B98E09EDA18AE1FD061747F72913B07AB302AC16BF619732066CDC374D070E2E
          2A4C3CB1A37E4579674E4D5B508E3B0B9BA96EED2DE4D42E3EB53116EED04AF1
          FA5C953A7DA55E51FF00AD919CB348D065086288B2ADA8F927FE71AB4E4B5FAE
          0B5892F615B8B6617370EAD04868B2725760A8DFCEDF0E08E5CE7924E3C239BD
          7F4AB0B0D3F4DB5B1D3D047636D12456B1A92408D5405009AD76CC29124D972E
          20014115812FFFD6F54E2AEC55D8ABB15762AB27820B889A19E3596271474700
          823DC1C20906C319444851E4C2B55FCBD9ADAE0DFF0096EE5ACEE17716E5885F
          92B761FE4BF25CCFC7AD0470E41C41D4E6ECC313C584F0CBF9A858FCE92464E9
          5E70D3763B194A5411E253A1FF005A33933A5BF5629358D791E8CF1FC7E3F9AB
          CF9274ABD1FA43CADAA1B773B85572CA3DAA0874FF006583F3728FA7246D3F90
          84FD5865C3F8FF004CA6FABFE63687B5DDB8BFB74FF76F1E7B7FAD1D1BFE0972
          431E0C9C8F0962736AF0FD438C7E3F9AA2DF9B17DC4AFE8F8965A53E291A80FF
          00ABC41C3FC9C3BD8FF2CCBF9A2FDEC2EF2F66BABB9AF267FDFCCE65775DA8C4
          D76F0A76CCF8C40000E4EA673329191E65EE1A2CF733E916735D295B89214694
          1D8F22A2B5CE7F2802440E56F5F8244E38997D5483B5F34E9EFA94BA5DE1FA9E
          A113504521F864077568DFA1E43B7DAC9CB4F2E1E21EA8B543591333097A263F
          1E94E72872D2F6D7B4C5D7068864235136E6EC47C1B8FA41B8579D385797ECF2
          E592E0357D18F10BA57BCD534DB2B592EEF2EA2B7B5888592791D5514921402C
          4D01A9A601127609240567B8811433C8AAA4D03330009FA71A4DA4FE73D020F3
          2796350D024BAFAA0D4A2F43D700332D48350A48E5D3278E7C3207B984E3C429
          866A1F93AB77AB5EB47E617834CD4EEED750BFD2C5BC2CD24D682300ACCC7D44
          56685795065C3534396E1A4E0B3CF66331FE5BF9D64F3B471C6823D02DBCC2FA
          D6F716D244A8CECECC1428BBF55CB71E0FFBB4CB7C68F07F4B8785AFC1971797
          1712BF9A7F273CB767E59B27B9F30BC365A3A5C412DC0B55B87617D726415113
          07F85E4E207C4BFB5C7063D4C8CB97D5FEF567A78F0F3E4CA63FCAF306B9A3DF
          E9FE65B8B592C2C6D2C2EE2F4E1796EE0B393D55E4EDF147EA578C9C57EC655E
          3EC411CCB68C3B820F441FFCA9C685ECA4D27CC6D65A9598D417D6FAB4338683
          51B833BA7A521217D366E2AF92FCCF78DB6FF628F03B8F7A51E78FCA0D0E4D32
          6BED43CCCF6F61A5E951D95E48D6F1CCD1C76F52D32AC653D36727F78823C962
          D41BA03996393003B93D1EB7A21B73A3581B697D6B636F17A33538F34E038B53
          B721BE624B997263C823322C9FFFD7F54E2AEC55D8ABB15762AEC55D8AA1B50D
          32C35180C17B024F11FD9715A7C8F51F464E19251360D35E4C5198A90E20C2F5
          0FCB8BBB498DDF97AF5E0946E21762A7E4B20FF8DF33E1AE0456416EA72F65CA
          278B14B84FE3F890B1F9DFCD7A24820D76C4CC836F548E0C7E4EB58DB267498F
          26F02D63B43362359237F8FF004A9BC3E6AF22EAE00BD8A28A56EAB75101BFFA
          F423FE1B283A7CD0E5FEC5C98EB34D97EA007F5C26F63A1F94F9ACF656968ECB
          BABC611A9F757289E5CBC8993958F4F839C4453924015268075394396F25FCC6
          BDB1BCF3029B57593D1844733AEE0B8626951FCA0E6EB4503186FDEF33DA9923
          2CBE9E81997E5EEB32EA3A1FA53B17B8B26F4598EE4A52A84FD1F0FF00B1CC1D
          6E2119D8E5276BD999CCF1D1E70F4B16FCC9FCBEF366BFAC6AD75A54B1A4177A
          17E8EB70F33C645CFD6D26A90A3E11E9A9F8F061CD18800FF39C9CB8E5226BB9
          2AD63F252F65D3BCCDA7E9B6F6F1D9DFC3A74DA5DB4934A6317F6C49B99181E5
          C4CAA78F3F8B964E3A91609E97FE9584B4FB103C903E61FCA2F3A6A3A7E8DE9D
          969B12DA45791CBA341338B789AE240D1C8AF3ACDEA3851477E2ADFC9C70C351
          104F3FEB319E091039277A2FE4CC92EAD6F37991CDCC361A5E9B6F63730DCCA2
          68EF2CD8B48EA76FF2539B7C4E99096A76F4F79671C1BEFDC10FA4FE526BD67A
          9D86B45615D6A2F305D5EDCDE09E424E9937329153A1DD97945865A80411D387
          FD928C041BEBC5FEC522F2E7E4B7E60D9EA53CF3DC5BDA3DC596A36B3DE413B1
          2F2DDA11149C422BF0573FEEC92475FD9CB27A9811F10D50D3CC1F9ABDA7E4FF
          009C93CBBAAD95BE9BA768F757367676A86D2F2E5CDC4B05C24B24F297F810B2
          2B745E7F17DAE380EA23C40D99321825C2455236F3F297CDD2F9DDF528E1B30A
          FAD45AA2F983EB338BC4B442A5AD0434E1C28A53ED71F8B223511E0AFE8F0F0F
          FBE49C12E2BF3FA917A37E51EB3A6DE691ABC0B145AE43AADFDC6A7782795B9D
          8DC09BD18A9D19579C3CA3C8CB500823F8687FA64C701147ADB19D27F24BF302
          DA2D4C4BF5547BED22FAC26E3705966B8B8A189DA91A9E1CBFDF8D23A7F365D2
          D540D7BC35C74F217EE7BB797ECA7B0D074EB29E9EBDADAC30CBC4D579C71856
          A1F0A8CD7CCD925CD88A0023F22C9FFFD0F54E2AEC55D8ABB15762AEC55D8ABB
          15762AB658629A331CA8B246DF6918020FD070824724188228B19D4FF2E7CBB7
          9C9A146B295BF6A13F0D7FD4355CCBC7ADC91E7EA75F97B2F14F97A0FF00458C
          5E7E57EB56EC5B4FBA8E71D812D0BFE155CCB8EBE07EA1FEF9D7CFB27247E920
          FF00B14AAEFCB1E738C149ADAEA54EE164322FE0C72E8EA317421C69E9350398
          97CF890D0F94FCCB2B844D36607C5D4228FA49C99D4E31FC41AE3A3CC7944BD2
          FC93E5A9B43D3E45B960D7772C1E50BBAA8028AA0F7A66A7559C6496DC83D068
          34A70C4DFD5264598AE73B15762AEC55D8ABB15762AEC55D8ABB15762AEC55FF
          D1F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15
          762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD2F54E2AEC55D8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
          C55D8ABB15762AEC55D8ABFFD9}
        mmHeight = 24077
        mmLeft = 0
        mmTop = 0
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Impress'#227'o de DI/Resumo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 6879
        mmLeft = 129646
        mmTop = 265
        mmWidth = 67469
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 22490
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'N'#186' Processo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 180393
        mmTop = 7673
        mmWidth = 16722
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NR_PROCESSO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 5821
        mmLeft = 135202
        mmTop = 11377
        mmWidth = 61913
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'CD_REF_OUTROS'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4149
        mmLeft = 135202
        mmTop = 16933
        mmWidth = 61913
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 261409
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 75936
        mmLeft = 529
        mmTop = 174361
        mmWidth = 195527
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CD_EMPRESA'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 795
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NM_EMPRESA'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 56356
        mmTop = 795
        mmWidth = 89429
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Data de C'#225'lculo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 10848
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DT_CALCULO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 10848
        mmWidth = 19844
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'N'#186' de Adi'#231#245'es:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 19844
        mmWidth = 24342
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Peso L'#237'quido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 24871
        mmWidth = 23019
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Peso Bruto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 29898
        mmWidth = 19579
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Moeda M.L.E.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 34925
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'M.L.E. na Moeda:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 39952
        mmWidth = 30692
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Taxa do M.L.E.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 44979
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'M.L.E. R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 50006
        mmWidth = 18785
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Moeda Frete:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 55033
        mmWidth = 22754
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Frete na Moeda:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 60061
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label101'
        Caption = 'Taxa do Frete:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 65088
        mmWidth = 24606
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Frete R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 70115
        mmWidth = 15875
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Moeda Seguro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 75142
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Seguro na Moeda:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 80169
        mmWidth = 30427
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label102'
        Caption = 'Taxa do Seguro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 85196
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Seguro R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 90223
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QT_ADICOES'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 19844
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PL_CARGA'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0000;(#0.0,0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 24871
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PB_CARGA'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0000;(#0.0,0000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 29898
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TX_MLE'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#.0,000000000;(#.0,000000000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 44979
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VL_TOT_MLE_MNEG'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#.0,0;(#.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 39952
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CD_MOEDA_MLE'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 34925
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'VL_TOTAL_MLE_MN'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 50006
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TX_FRETE'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,000000000;(#0.0,000000000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 65088
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText102'
        DataField = 'CD_MOEDA_FRETE'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 55033
        mmWidth = 8997
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'VL_TOTAL_FRETE_MN'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 70115
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TX_SEGURO'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,000000000;(#0.0,000000000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 85196
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'VL_TOT_SEGURO_MNEG'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 80169
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText103'
        DataField = 'CD_MOEDA_SEGURO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 75142
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'VL_TOTAL_SEG_MN'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 90223
        mmWidth = 40217
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Incoterm:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 19844
        mmWidth = 16669
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'CIF U$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 24871
        mmWidth = 13758
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'CIF R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 29898
        mmWidth = 13758
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'CIF na Moeda:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 34925
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'SDA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 39952
        mmWidth = 8996
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label103'
        Caption = 'Acr'#233'scimos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 44979
        mmWidth = 20373
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Dedu'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 50006
        mmWidth = 15875
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Despesas:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 55033
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Taxa da Merc.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 60061
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Taxa do D'#243'lar:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 87048
        mmTop = 65088
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CD_INCOTERM'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 19844
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'VL_CIF_DOLAR'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 24871
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'VL_CIF_MN'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 29898
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'VL_TOTAL_ACRESCIMOS_MN'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 44979
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'VL_SDA'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 39952
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText104'
        DataField = 'Calc_CIF'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 34925
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'VL_TOTAL_DEDUCOES_MN'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 50006
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'TX_DOLAR'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,000000000;(#0.0,000000000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 65088
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'TX_MLE'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,000000000;(#0.0,000000000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 60061
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'VL_TOT_DESPS_MN'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 113506
        mmTop = 55033
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'I.I.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 19844
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'I.P.I.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 24871
        mmWidth = 9790
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Antidumping:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 29898
        mmWidth = 23548
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Total Tributos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 34925
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label104'
        Caption = 'Taxa Siscomex:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 44979
        mmWidth = 25929
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Base ICMS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 50006
        mmWidth = 20373
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = '% ICMS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 66146
        mmWidth = 16404
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'ICMS '#224' Recolher:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 71173
        mmWidth = 30427
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'PIS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 81227
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'COFINS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 86254
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText201'
        DataField = 'VL_TOTAL_II'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,000;(#0.0,000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 19844
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'VL_TOTAL_IPI'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,000;(#0.0,000)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 24871
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'VL_TOTAL_AD'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 29898
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'VL_TRIBUTO_PAGO'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '$#0.0,0;($#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 44979
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'VL_COFINS'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 86254
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'VL_TOTAL_TRIBUTOS'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 34925
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'VL_BASE_CALC_ICMS'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 50006
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'VL_TOT_ICMS'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 71173
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'VL_PIS'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 81227
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText11'
        DataField = 'VL_FRETE_MOEDA'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 60061
        mmWidth = 40481
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText13'
        DataField = 'NM_MOEDA_MLE'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 47361
        mmTop = 34925
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'NM_MOEDA_FRETE'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 47361
        mmTop = 55033
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'NM_MOEDA_SEGURO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 47625
        mmTop = 75142
        mmWidth = 39158
        BandType = 4
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Servi'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 5821
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'CD_SERVICO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 5821
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'NM_SERVICO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 55827
        mmTop = 5822
        mmWidth = 89959
        BandType = 4
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Recinto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 104775
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Aplica'#231#227'o do Produto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 109802
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText14'
        DataField = 'RECINTO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 104775
        mmWidth = 71173
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'APLICACAO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 109802
        mmWidth = 71173
        BandType = 4
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Embarca'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 114829
        mmWidth = 22225
        BandType = 4
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Transportadora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 124884
        mmWidth = 28046
        BandType = 4
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'Dt. Chegada Navio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 119856
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'NM_EMBARCACAO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 114829
        mmWidth = 71173
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'DT_CHEG_NAVIO'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 119856
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'NM_TRANSP_ROD'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 124884
        mmWidth = 70908
        BandType = 4
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'Dados das Adi'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 169334
        mmWidth = 33867
        BandType = 4
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 73554
        mmLeft = 1323
        mmTop = 175419
        mmWidth = 64262
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 'Memo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 73554
        mmLeft = 66146
        mmTop = 175419
        mmWidth = 64262
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo3: TppMemo
        UserName = 'Memo3'
        Caption = 'Memo3'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 73554
        mmLeft = 130969
        mmTop = 175419
        mmWidth = 64262
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        AutoSize = False
        Caption = 'ICMS+AFRMM:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4572
        mmLeft = 140494
        mmTop = 91281
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'VL_ICMS_A_RECOLHER_AFRMM'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 91281
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = #193'rea'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 129911
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'NM_AREA'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4763
        mmLeft = 47625
        mmTop = 129911
        mmWidth = 61119
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentWidth = False
        TraverseAllData = False
        DataPipelineName = 'ppBDEPipelineCntrEmbalagem'
        mmHeight = 4763
        mmLeft = 109802
        mmTop = 104775
        mmWidth = 84931
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEPipelineCntrEmbalagem
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 296863
          PrinterSetup.mmPaperWidth = 209815
          PrinterSetup.PaperSize = 9
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEPipelineCntrEmbalagem'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShape3: TppShape
              UserName = 'Shape3'
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 87313
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'TIPO'
              DataPipeline = ppBDEPipelineCntrEmbalagem
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Times New Roman'
              Font.Size = 11
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEPipelineCntrEmbalagem'
              mmHeight = 4233
              mmLeft = 1058
              mmTop = 265
              mmWidth = 74613
              BandType = 4
            end
            object ppDBText52: TppDBText
              UserName = 'DBText52'
              DataField = 'QTD'
              DataPipeline = ppBDEPipelineCntrEmbalagem
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Times New Roman'
              Font.Size = 11
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBDEPipelineCntrEmbalagem'
              mmHeight = 4233
              mmLeft = 76994
              mmTop = 191
              mmWidth = 9260
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line101'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 4498
              mmLeft = 74348
              mmTop = 0
              mmWidth = 2116
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'TITULO'
            DataPipeline = ppBDEPipelineCntrEmbalagem
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppBDEPipelineCntrEmbalagem'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                mmHeight = 5027
                mmLeft = 0
                mmTop = 792
                mmWidth = 87313
                BandType = 3
                GroupNo = 0
              end
              object ppDBText55: TppDBText
                UserName = 'DBText55'
                DataField = 'TITULO'
                DataPipeline = ppBDEPipelineCntrEmbalagem
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 11
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppBDEPipelineCntrEmbalagem'
                mmHeight = 4498
                mmLeft = 1058
                mmTop = 1058
                mmWidth = 74613
                BandType = 3
                GroupNo = 0
              end
              object ppLabel53: TppLabel
                UserName = 'Label53'
                Caption = 'Qtd'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Times New Roman'
                Font.Size = 11
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 4498
                mmLeft = 76994
                mmTop = 1058
                mmWidth = 9260
                BandType = 3
                GroupNo = 0
              end
              object ppLine10: TppLine
                UserName = 'Line10'
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 74348
                mmTop = 792
                mmWidth = 2117
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
          object raCodeModule2: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppLabel52: TppLabel
        UserName = 'Label401'
        Caption = 'FECP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 140494
        mmTop = 76200
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        DataField = 'VL_FUNDO_POBREZA'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 76200
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'CD_AREA'
        DataPipeline = ppBDEPipeline
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 129911
        mmWidth = 9260
        BandType = 4
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'Pedidos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 134938
        mmWidth = 14351
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        DataField = 'REFERENCIAS'
        DataPipeline = ppBDEPipelinePedidos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppBDEPipelinePedidos'
        mmHeight = 38894
        mmLeft = 37835
        mmTop = 134938
        mmWidth = 70908
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 17463
        mmWidth = 197380
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 102394
        mmWidth = 197380
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'VL_BASE_CALC_ICMS_AFRMM'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 55033
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = '+AFRMM:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4572
        mmLeft = 147638
        mmTop = 55033
        mmWidth = 18881
        BandType = 4
      end
      object ppLabel55: TppLabel
        UserName = 'Label501'
        AutoSize = False
        Caption = 'ICMS+Acr'#233'sc.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4572
        mmLeft = 140494
        mmTop = 96309
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText501'
        DataField = 'VL_ICMS_ACRESCIMOS'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171450
        mmTop = 96309
        mmWidth = 25400
        BandType = 4
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'AFRMM R$:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4572
        mmLeft = 140494
        mmTop = 60061
        mmWidth = 22394
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'VL_TOTAL_AFRMM'
        DataPipeline = ppBDEPipeline
        DisplayFormat = '#0.0,0;(#0.0,0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline'
        mmHeight = 4498
        mmLeft = 171450
        mmTop = 60061
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppNumPag: TppSystemVariable
        UserName = 'NumPag'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 2381
        mmWidth = 4498
        BandType = 8
      end
      object ppTotPag: TppSystemVariable
        UserName = 'TotPag'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 190236
        mmTop = 2381
        mmWidth = 4498
        BandType = 8
      end
      object ppLabel34: TppLabel
        UserName = 'Label14'
        Caption = 'CRDI032'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 1852
        mmWidth = 13494
        BandType = 8
      end
      object ppLabel38: TppLabel
        UserName = 'Label18'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 188384
        mmTop = 2381
        mmWidth = 1058
        BandType = 8
      end
      object ppLabel42: TppLabel
        UserName = 'Label25'
        Caption = 'Folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 174096
        mmTop = 2646
        mmWidth = 8467
        BandType = 8
      end
      object ppVarRodapeEsq: TppVariable
        UserName = 'VarRodapeEsq'
        CalcOrder = 0
        CalcType = veReportEnd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVarRodapeEsqCalc
        Transparent = True
        mmHeight = 4233
        mmLeft = 18785
        mmTop = 2117
        mmWidth = 23019
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 265
        mmTop = 0
        mmWidth = 196850
        BandType = 8
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 27
    Top = 112
  end
  object ppBDEPipeline: TppBDEPipeline
    DataSource = ds_resumo_di
    UserName = 'BDEPipeline'
    Left = 27
    Top = 64
    object ppBDEPipelineppField1: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField2: TppField
      FieldAlias = 'CD_MOEDA_FRETE'
      FieldName = 'CD_MOEDA_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField3: TppField
      FieldAlias = 'CD_MOEDA_MLE'
      FieldName = 'CD_MOEDA_MLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField4: TppField
      FieldAlias = 'PB_CARGA'
      FieldName = 'PB_CARGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField5: TppField
      FieldAlias = 'PL_CARGA'
      FieldName = 'PL_CARGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField6: TppField
      FieldAlias = 'QT_ADICOES'
      FieldName = 'QT_ADICOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField7: TppField
      FieldAlias = 'VL_TOT_DESPS_MN'
      FieldName = 'VL_TOT_DESPS_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField8: TppField
      FieldAlias = 'VL_TOT_DESPS_MNEG'
      FieldName = 'VL_TOT_DESPS_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField9: TppField
      FieldAlias = 'VL_TOT_MLE_MNEG'
      FieldName = 'VL_TOT_MLE_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField10: TppField
      FieldAlias = 'VL_TOT_SEGURO_MNEG'
      FieldName = 'VL_TOT_SEGURO_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField11: TppField
      FieldAlias = 'VL_TOTAL_FRETE_MN'
      FieldName = 'VL_TOTAL_FRETE_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField12: TppField
      FieldAlias = 'VL_TOTAL_MLE_MN'
      FieldName = 'VL_TOTAL_MLE_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField13: TppField
      FieldAlias = 'VL_TOTAL_SEG_MN'
      FieldName = 'VL_TOTAL_SEG_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField14: TppField
      FieldAlias = 'VL_TOTAL_II'
      FieldName = 'VL_TOTAL_II'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField15: TppField
      FieldAlias = 'VL_TOTAL_IPI'
      FieldName = 'VL_TOTAL_IPI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField16: TppField
      FieldAlias = 'VL_TOTAL_AD'
      FieldName = 'VL_TOTAL_AD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField17: TppField
      FieldAlias = 'TX_MLE'
      FieldName = 'TX_MLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField18: TppField
      FieldAlias = 'TX_FRETE'
      FieldName = 'TX_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField19: TppField
      FieldAlias = 'TX_SEGURO'
      FieldName = 'TX_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField20: TppField
      FieldAlias = 'TX_DOLAR'
      FieldName = 'TX_DOLAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField21: TppField
      FieldAlias = 'VL_TOTAL_ACRESCIMOS_MN'
      FieldName = 'VL_TOTAL_ACRESCIMOS_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField22: TppField
      FieldAlias = 'VL_TOTAL_DEDUCOES_MN'
      FieldName = 'VL_TOTAL_DEDUCOES_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField23: TppField
      FieldAlias = 'VL_TOT_ICMS'
      FieldName = 'VL_TOT_ICMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField24: TppField
      FieldAlias = 'VL_SDA'
      FieldName = 'VL_SDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField25: TppField
      FieldAlias = 'VL_CONTR_ASSIST'
      FieldName = 'VL_CONTR_ASSIST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField26: TppField
      FieldAlias = 'VL_TRIBUTO_PAGO'
      FieldName = 'VL_TRIBUTO_PAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField27: TppField
      FieldAlias = 'CD_RECEITA_PGTO'
      FieldName = 'CD_RECEITA_PGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField28: TppField
      FieldAlias = 'IN_EMBUT_FRT_ITENS'
      FieldName = 'IN_EMBUT_FRT_ITENS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField29: TppField
      FieldAlias = 'IN_EMBUT_SEG_ITENS'
      FieldName = 'IN_EMBUT_SEG_ITENS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField30: TppField
      FieldAlias = 'VL_CIF_DOLAR'
      FieldName = 'VL_CIF_DOLAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField31: TppField
      FieldAlias = 'VL_CIF_MN'
      FieldName = 'VL_CIF_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField32: TppField
      FieldAlias = 'CD_EMPRESA'
      FieldName = 'CD_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField33: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField34: TppField
      FieldAlias = 'VL_FRETE_MOEDA'
      FieldName = 'VL_FRETE_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField35: TppField
      FieldAlias = 'VL_PIS'
      FieldName = 'VL_PIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField36: TppField
      FieldAlias = 'VL_COFINS'
      FieldName = 'VL_COFINS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField37: TppField
      FieldAlias = 'VL_TOTAL_TRIBUTOS'
      FieldName = 'VL_TOTAL_TRIBUTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField38: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField39: TppField
      FieldAlias = 'VL_TOT_FRT_COLLECT'
      FieldName = 'VL_TOT_FRT_COLLECT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField40: TppField
      FieldAlias = 'Calc_CIF'
      FieldName = 'Calc_CIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField41: TppField
      FieldAlias = 'Calc_NR_PROCESSO'
      FieldName = 'Calc_NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField42: TppField
      FieldAlias = 'Calc_VL_FRETE_MNEG'
      FieldName = 'Calc_VL_FRETE_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField43: TppField
      FieldAlias = 'DT_CALCULO'
      FieldName = 'DT_CALCULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField44: TppField
      FieldAlias = 'VL_FRETE_TNAC_MNEG'
      FieldName = 'VL_FRETE_TNAC_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField45: TppField
      FieldAlias = 'VL_TOT_FRT_PREPAID'
      FieldName = 'VL_TOT_FRT_PREPAID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField46: TppField
      FieldAlias = 'VL_TOT_DESPS_MN_1'
      FieldName = 'VL_TOT_DESPS_MN_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField47: TppField
      FieldAlias = 'VL_TOT_DESPS_MNEG_1'
      FieldName = 'VL_TOT_DESPS_MNEG_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField48: TppField
      FieldAlias = 'VL_TOT_MLE_MNEG_1'
      FieldName = 'VL_TOT_MLE_MNEG_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField49: TppField
      FieldAlias = 'VL_TOT_SEGURO_MNEG_1'
      FieldName = 'VL_TOT_SEGURO_MNEG_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField50: TppField
      FieldAlias = 'VL_BASE_CALC_ICMS'
      FieldName = 'VL_BASE_CALC_ICMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField51: TppField
      FieldAlias = 'CD_MOEDA_SEGURO'
      FieldName = 'CD_MOEDA_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField52: TppField
      FieldAlias = 'NM_MOEDA_MLE'
      FieldName = 'NM_MOEDA_MLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField53: TppField
      FieldAlias = 'NM_MOEDA_SEGURO'
      FieldName = 'NM_MOEDA_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField54: TppField
      FieldAlias = 'NM_MOEDA_FRETE'
      FieldName = 'NM_MOEDA_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField55: TppField
      FieldAlias = 'CD_SERVICO'
      FieldName = 'CD_SERVICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField56: TppField
      FieldAlias = 'NM_SERVICO'
      FieldName = 'NM_SERVICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField57: TppField
      FieldAlias = 'RECINTO'
      FieldName = 'RECINTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField58: TppField
      FieldAlias = 'APLICACAO'
      FieldName = 'APLICACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField59: TppField
      FieldAlias = 'NM_EMBARCACAO'
      FieldName = 'NM_EMBARCACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField60: TppField
      FieldAlias = 'DT_CHEG_NAVIO'
      FieldName = 'DT_CHEG_NAVIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField61: TppField
      FieldAlias = 'NM_TRANSP_ROD'
      FieldName = 'NM_TRANSP_ROD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField62: TppField
      FieldAlias = 'VL_ICMS_A_RECOLHER_AFRMM'
      FieldName = 'VL_ICMS_A_RECOLHER_AFRMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField63: TppField
      FieldAlias = 'NR_PROCESSO_COMPLETO'
      FieldName = 'NR_PROCESSO_COMPLETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField64: TppField
      FieldAlias = 'CD_AREA'
      FieldName = 'CD_AREA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField65: TppField
      FieldAlias = 'NM_AREA'
      FieldName = 'NM_AREA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField66: TppField
      FieldAlias = 'CD_VIA_TRANSP_CARG'
      FieldName = 'CD_VIA_TRANSP_CARG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField67: TppField
      FieldAlias = 'IN_FUNDO_POBREZA'
      FieldName = 'IN_FUNDO_POBREZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField68: TppField
      FieldAlias = 'VL_FUNDO_POBREZA'
      FieldName = 'VL_FUNDO_POBREZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField69: TppField
      FieldAlias = 'VL_IMPOSTOS'
      FieldName = 'VL_IMPOSTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField70: TppField
      FieldAlias = 'VL_BASE_CALC_ICMS_AFRMM'
      FieldName = 'VL_BASE_CALC_ICMS_AFRMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField71: TppField
      FieldAlias = 'IN_MARINHA_MERCANTE_ICMS'
      FieldName = 'IN_MARINHA_MERCANTE_ICMS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField72: TppField
      FieldAlias = 'VL_ICMS_ACRESCIMOS'
      FieldName = 'VL_ICMS_ACRESCIMOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField73: TppField
      FieldAlias = 'CD_REF_OUTROS'
      FieldName = 'CD_REF_OUTROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppField74: TppField
      FieldAlias = 'CD_GRUPO'
      FieldName = 'CD_GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object ppBDEPipelineppVL_TOTAL_AFRMM: TppField
      FieldAlias = 'VL_TOTAL_AFRMM'
      FieldName = 'VL_TOTAL_AFRMM'
      FieldLength = 10
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 74
    end
  end
  object qryAliquotas: TQuery
    OnCalcFields = qry_resumo_di_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT AI.NR_ADICAO, AI.PC_ICMS, P.PC_FUNDO_POBREZA_RJ, IN_FUNDO' +
        '_POBREZA, (LEFT(AI.CD_CFOP, 1) + "." + RIGHT(AI.CD_CFOP, 3)) AS ' +
        'CD_CFOP'
      'FROM TADICAO_DE_IMPORTACAO AI, TPARAMETROS P'
      'WHERE AI.NR_PROCESSO = :NR_PROCESSO')
    Left = 220
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptUnknown
        Size = 18
      end>
    object qryAliquotasNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qryAliquotasPC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.PC_ICMS'
    end
    object qryAliquotasPC_FUNDO_POBREZA_RJ: TFloatField
      FieldName = 'PC_FUNDO_POBREZA_RJ'
    end
    object qryAliquotasIN_FUNDO_POBREZA: TStringField
      FieldName = 'IN_FUNDO_POBREZA'
      FixedChar = True
      Size = 1
    end
    object qryAliquotasCD_CFOP: TStringField
      DisplayWidth = 5
      FieldName = 'CD_CFOP'
      Origin = 'DBBROKER.TADICAO_DE_IMPORTACAO.CD_CFOP'
      FixedChar = True
      Size = 5
    end
  end
  object dtsAliquotas: TDataSource
    AutoEdit = False
    DataSet = qryAliquotas
    Left = 220
    Top = 81
  end
  object ppBDEPipelineAliquota: TppBDEPipeline
    DataSource = dtsAliquotas
    UserName = 'BDEPipelineAliquota'
    Left = 222
    Top = 161
    object ppBDEPipelineAliquotappField1: TppField
      FieldAlias = 'NR_ADICAO'
      FieldName = 'NR_ADICAO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEPipelineAliquotappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PC_ICMS'
      FieldName = 'PC_ICMS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEPipelineAliquotappField3: TppField
      FieldAlias = 'CD_CFOP'
      FieldName = 'CD_CFOP'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
  end
  object qryAux: TQuery
    OnCalcFields = qry_resumo_di_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select NR_ADICAO, PC_ICMS from TADICAO_DE_IMPORTACAO'
      'where'
      '  nr_processo =:nr_processo')
    Left = 35
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_processo'
        ParamType = ptUnknown
      end>
  end
  object qryCntrEmbalagem: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT '#39'Containers'#39' AS TITULO, RTRIM(SUBSTRING(NR_PROCESSO, 5, 1' +
        '4)) AS NR_PROCESSO, RTRIM(NR_PROCESSO) AS NR_PROCESSO_COMPLETO, ' +
        'RTRIM(TC.NM_TP_CNTR) AS TIPO, COUNT(*) AS QTD'
      
        'FROM TPROCESSO_CNTR PC INNER JOIN TTP_CNTR TC ON TC.TP_CNTR = PC' +
        '.TP_CNTR'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY NR_PROCESSO, TC.NM_TP_CNTR'
      'UNION ALL'
      
        'SELECT '#39'Volumes'#39' AS TITULO, RTRIM(SUBSTRING(NR_PROCESSO, 5, 14))' +
        ' AS NR_PROCESSO, RTRIM(NR_PROCESSO) AS NR_PROCESSO_COMPLETO, RTR' +
        'IM(TE.DESCRICAO) AS TIPO, SUM(PCG.VL_QTDE) AS QTD'
      
        'FROM TPROCESSO_CARGA_SOLTA PCG INNER JOIN TTP_EMBALAGEM TE ON TE' +
        '.CODIGO = PCG.TP_ESTUFAGEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY NR_PROCESSO, TE.DESCRICAO')
    Left = 366
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qryCntrEmbalagemTITULO: TStringField
      FieldName = 'TITULO'
      FixedChar = True
      Size = 10
    end
    object qryCntrEmbalagemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qryCntrEmbalagemNR_PROCESSO_COMPLETO: TStringField
      FieldName = 'NR_PROCESSO_COMPLETO'
      FixedChar = True
      Size = 18
    end
    object qryCntrEmbalagemTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 120
    end
    object qryCntrEmbalagemQTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '#0.##'
    end
  end
  object dsCntrEmbalagem: TDataSource
    AutoEdit = False
    DataSet = qryCntrEmbalagem
    Left = 366
    Top = 80
  end
  object ppBDEPipelineCntrEmbalagem: TppBDEPipeline
    DataSource = dsCntrEmbalagem
    UserName = 'BDEPipelineCntrEmbalagem'
    Left = 369
    Top = 160
  end
  object qryPedidos: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT MASTER.DBO.ROWCONCATLEFT(DISTINCT RTRIM(RC.CD_REFERENCIA)' +
        ' + '#39'/'#39' + RTRIM(RC.NR_ITEM_PO)) AS REFERENCIAS'
      'FROM TREF_CLIENTE RC'
      '   INNER JOIN TPROCESSO P ON P.NR_PROCESSO = RC.NR_PROCESSO'
      '   INNER JOIN TGRUPO    G ON G.CD_GRUPO    = P.CD_GRUPO'
      'WHERE RC.NR_PROCESSO = :NR_PROCESSO'
      '  AND RC.TP_REFERENCIA = '#39'01'#39)
    Left = 520
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0101IM-1600-10'
      end>
    object qryPedidosREFERENCIAS: TStringField
      FieldName = 'REFERENCIAS'
      FixedChar = True
      Size = 255
    end
  end
  object dsPedidos: TDataSource
    DataSet = qryPedidos
    Left = 520
    Top = 72
  end
  object ppBDEPipelinePedidos: TppBDEPipeline
    DataSource = dsPedidos
    UserName = 'BDEPipelinePedidos'
    Left = 520
    Top = 128
  end
end

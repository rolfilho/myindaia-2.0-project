object dtmEnvioERP: TdtmEnvioERP
  OldCreateOrder = False
  Height = 360
  Width = 449
  object qryFatura: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'idFatura'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DISTINCT '
      '       B.ID,'
      '       B.AKEY, '
      '       B.COFINS,'
      '       B.CREATED,'
      '       B.DUEDATE,'
      '       B.INVOICERECEIVERTYPE,'
      '       B.IR,'
      '       B.SENIORDATENFE,'
      '       B.SENIORKEY,'
      '       B.STATUS,'
      '       B.TOTAL,'
      '       B.TYPE,'
      '       B.VALORTIBUTAVEL,'
      '       B.BRANCH_ID,'
      '       B.USER_ID,'
      '       CC.CUSTOMID,'
      '       CC.CUSTOMER_ID,'
      '       C.AKEY AS CD_CLIENTE,'
      '       IV.CUSTOMCLEARANCE_ID, '
      '       BRANCH.ISS'
      'FROM MYINDAIAV2.DBO.BILLING                  B   (NOLOCK)'
      
        '   INNER JOIN BRANCH                             (NOLOCK)ON BRAN' +
        'CH.ID      = B.BRANCH_ID'
      
        '   INNER JOIN BILLING_ITEMINVOICED           BIV (NOLOCK)ON BIV.' +
        'BILLING_ID = B.ID'
      
        '   INNER JOIN ITEMINVOICED                   IV  (NOLOCK)ON IV.I' +
        'D          = BIV.ITENSINVOICED_ID'
      
        '   INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC  (NOLOCK)ON CC.I' +
        'D          = IV.CUSTOMCLEARANCE_ID'
      
        '   INNER JOIN MYINDAIAV2.DBO.CUSTOMER        C   (NOLOCK)ON C.ID' +
        '           = CC.CUSTOMER_ID'
      'WHERE B.ID = :IDFATURA')
    Left = 208
    Top = 72
    object qryFaturaakey: TWideStringField
      FieldName = 'akey'
      Size = 255
    end
    object qryFaturacreated: TDateTimeField
      FieldName = 'created'
    end
    object qryFaturadueDate: TDateTimeField
      FieldName = 'dueDate'
    end
    object qryFaturainvoiceReceiverType: TStringField
      FieldName = 'invoiceReceiverType'
      Size = 255
    end
    object qryFaturair: TBCDField
      FieldName = 'ir'
      Precision = 19
      Size = 2
    end
    object qryFaturaseniorDateNFE: TDateTimeField
      FieldName = 'seniorDateNFE'
    end
    object qryFaturaseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryFaturastatus: TWideStringField
      FieldName = 'status'
      Size = 255
    end
    object qryFaturatotal: TBCDField
      FieldName = 'total'
      Precision = 19
      Size = 2
    end
    object qryFaturatype: TWideStringField
      FieldName = 'type'
      Size = 255
    end
    object qryFaturavalorTibutavel: TBCDField
      FieldName = 'valorTibutavel'
      Precision = 19
      Size = 2
    end
    object qryFaturacustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object qryFaturaCD_CLIENTE: TWideStringField
      FieldName = 'CD_CLIENTE'
      Size = 255
    end
    object qryFaturacofins: TBCDField
      FieldName = 'cofins'
      Precision = 19
      Size = 2
    end
    object qryFaturaid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryFaturabranch_id: TLargeintField
      FieldName = 'branch_id'
    end
    object qryFaturauser_id: TLargeintField
      FieldName = 'user_id'
    end
    object qryFaturacustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
    end
    object qryFaturacustomer_id: TLargeintField
      FieldName = 'customer_id'
    end
    object qryFaturaiss: TBCDField
      FieldName = 'iss'
      Precision = 19
      Size = 2
    end
  end
  object qryItensFatura: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    AfterOpen = qryItensFaturaAfterOpen
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'idFatura'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 19
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @IDFATURA BIGINT'
      'SET @IDFATURA = :IDFATURA'
      ''
      'SELECT DISTINCT *'
      'FROM ('
      '      -- ITENS DE NUMERARIO'
      
        '      /*SELECT BCR.BILLING_ID, '#39'NUMER'#193'RIOS'#39' AS TIPO, IR.DESTINO,' +
        ' SUM(IR.PRICE) PRICE, I.AKEY, I.NAME, I.SENIORKEY,'
      '      I.TYPE,NULL CONTAFINANCEIRAIMP,NULL CONTAFINANCEIRAEXP'
      '      FROM MYINDAIAV2.DBO.BILLING_CASHREQUESTED BCR'
      
        '         INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED CR ON CR.ID = B' +
        'CR.CASHREQUESTS_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUEST' +
        'ED CRICR ON CRICR.CASHREQUESTED_ID = CR.ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED IR ON IR.ID' +
        ' = CRICR.ITEMS_ID'
      '         INNER JOIN MYINDAIAV2.DBO.ITEM I ON I.ID = IR.ITEM_ID'
      
        '      GROUP BY BCR.BILLING_ID,  IR.DESTINO, I.AKEY, I.NAME, I.SE' +
        'NIORKEY,I.TYPE'
      '      UNION ALL*/'
      '      '
      '      -- ITENS DE PAGAMENTO'
      '     '
      '      SELECT BPR.BILLING_ID,'
      '            '#39'Pagamentos'#39' AS TIPO,'
      '             NULL AS DESTINO, '
      '             SUM(IPR.PRICE) PRICE, '
      '             I.AKEY, '
      '             I.NAME,'
      '             I.SENIORKEY,'
      '             PR.SENIORKEY SENIORKEYPAYMENT,'
      '             I.TYPE,'
      '             NULL CONTAFINANCEIRAIMP,'
      '             NULL CONTAFINANCEIRAEXP'
      
        '      FROM MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED              ' +
        'BPR'
      
        'INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED                      ' +
        'PR    ON PR.ID                     = BPR.PAYMENTS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED ' +
        'PRIPR ON PRIPR.PAYMENTREQUESTED_ID = BPR.PAYMENTS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  ' +
        'IPR   ON IPR.ID                    = PRIPR.ITEMS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEM                                  ' +
        'I     ON I.ID                      = IPR.ITEM_ID'
      '     WHERE BPR.Billing_id = @IDFATURA'
      '      GROUP BY BPR.BILLING_ID,'
      '               I.AKEY,'
      '               I.NAME, '
      '               I.SENIORKEY,'
      '               I.TYPE,'
      '               PR.SENIORKEY'
      '     '
      '      UNION ALL'
      '     '
      '      -- ITENS DE RECEITA'
      '      SELECT BII.Billing_id,'
      '             '#39'Receitas'#39' AS TIPO,'
      '             NULL AS DESTINO, '
      '             SUM(II.PRICE) PRICE, '
      '             I.AKEY, '
      '             I.NAME AS ITEM_NAME, '
      '             I.SENIORKEY,'
      '             '#39#39' SENIORKEYPAYMENT,'
      '             I.TYPE,'
      '             I.CONTAFINANCEIRAIMP,'
      '             I.CONTAFINANCEIRAEXP'
      '      FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING              B   ON B.ID  = BI' +
        'I.BILLING_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  ON II.ID = BI' +
        'I.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEM                 I   ON I.ID  = II' +
        '.ITEM_ID'
      '     WHERE TAXABLE        = 1'
      '       AND BII.Billing_id = @IDFATURA'
      '      GROUP BY BII.BILLING_ID, '
      '               I.AKEY, '
      '               I.NAME,'
      '               I.SENIORKEY,'
      '               I.TYPE,'
      '               I.CONTAFINANCEIRAIMP,'
      '               I.CONTAFINANCEIRAEXP'
      '      '
      '      UNION ALL'
      '      '
      '        SELECT BILLING_ID,'
      '               '#39'Reembolso'#39' AS TIPO , '
      '               NULL AS DESTINO,'
      '               TOTALREEMBOLSO PRICE , '
      '               AKEY,'
      '               I.NAME AS ITEM_NAME,'
      '               SENIORKEY,'
      '               '#39#39' SENIORKEYPAYMENT,'
      '               I.TYPE,'
      '               I.CONTAFINANCEIRAIMP,'
      '               I.CONTAFINANCEIRAEXP'
      '        FROM VW_TOTALREEMBOLSOFATURA R'
      '  INNER JOIN MYINDAIAV2.DBO.ITEM     I ON I.ID = 310'
      '       WHERE Billing_id = @IDFATURA'
      '   '
      '      ) AS FAT'
      '      '
      '--WHERE BILLING_ID = @IDFATURA')
    Left = 288
    Top = 72
    object qryItensFaturaTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qryItensFaturaprice: TBCDField
      FieldName = 'price'
      Precision = 19
      Size = 2
    end
    object qryItensFaturaaKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object qryItensFaturaname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qryItensFaturaseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryItensFaturatype: TStringField
      FieldName = 'type'
      Size = 1
    end
    object qryItensFaturaContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
    object qryItensFaturadestino: TIntegerField
      FieldName = 'destino'
      ReadOnly = True
    end
    object qryItensFaturaBilling_id: TLargeintField
      FieldName = 'Billing_id'
      ReadOnly = True
    end
    object qryItensFaturaContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      ReadOnly = True
      Size = 255
    end
  end
  object cdsFaturaPagamentos: TClientDataSet
    PersistDataPacket.Data = {
      810100009619E0BD01000000180000000C00000000000300000081010A42696C
      6C696E675F69640C00050000000100055749445448020002001300045469706F
      0100490000000100055749445448020002000A000269640C0005000000010005
      57494454480200020013000764657374696E6F01004A00000001000557494454
      480200020002000570726963650C0005000000020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640C00050000000100
      05574944544802000200130004614B657902004A000000010005574944544802
      000200FE01046E616D6502004A000000010005574944544802000200FE010973
      656E696F724B657902004A000000010005574944544802000200FE0104747970
      65010049000000010005574944544802000200010012436F6E746146696E616E
      6365697261496D7002004A000200010005574944544802000200FE0112436F6E
      746146696E616E636569726145787002004A0002000100055749445448020002
      00FE010000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 208
    object cdsFaturaPagamentosTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsFaturaPagamentosdestino: TWideStringField
      FieldName = 'destino'
      Size = 1
    end
    object cdsFaturaPagamentosprice: TBCDField
      FieldName = 'price'
      Precision = 19
      Size = 2
    end
    object cdsFaturaPagamentosaKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object cdsFaturaPagamentosname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object cdsFaturaPagamentosseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object cdsFaturaPagamentostype: TStringField
      FieldName = 'type'
      Size = 1
    end
    object cdsFaturaPagamentosContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      Size = 255
    end
    object cdsFaturaPagamentosContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
    object cdsFaturaPagamentosBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaPagamentosid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaPagamentositem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
    end
  end
  object cdsFaturaReceitas: TClientDataSet
    PersistDataPacket.Data = {
      810100009619E0BD01000000180000000C00000000000300000081010A42696C
      6C696E675F69640C00050000000100055749445448020002001300045469706F
      0100490000000100055749445448020002000A000269640C0005000000010005
      57494454480200020013000764657374696E6F01004A00000001000557494454
      480200020002000570726963650C0005000000020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640C00050000000100
      05574944544802000200130004614B657902004A000000010005574944544802
      000200FE01046E616D6502004A000000010005574944544802000200FE010973
      656E696F724B657902004A000000010005574944544802000200FE0104747970
      65010049000000010005574944544802000200010012436F6E746146696E616E
      6365697261496D7002004A000200010005574944544802000200FE0112436F6E
      746146696E616E636569726145787002004A0002000100055749445448020002
      00FE010000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 272
    object cdsFaturaReceitasTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsFaturaReceitasdestino: TWideStringField
      FieldName = 'destino'
      Size = 1
    end
    object cdsFaturaReceitasprice: TBCDField
      FieldName = 'price'
      Precision = 19
      Size = 2
    end
    object cdsFaturaReceitasaKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object cdsFaturaReceitasname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object cdsFaturaReceitasseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object cdsFaturaReceitastype: TStringField
      FieldName = 'type'
      Size = 1
    end
    object cdsFaturaReceitasContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      Size = 255
    end
    object cdsFaturaReceitasContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
    object cdsFaturaReceitasBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaReceitasid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaReceitasitem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
    end
  end
  object cdsItensFatura: TClientDataSet
    PersistDataPacket.Data = {
      810100009619E0BD01000000180000000C00000000000300000081010A42696C
      6C696E675F69640C00050000000100055749445448020002001300045469706F
      0100490000000100055749445448020002000A000269640C0005000000010005
      57494454480200020013000764657374696E6F01004A00000001000557494454
      480200020002000570726963650C0005000000020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640C00050000000100
      05574944544802000200130004614B657902004A000000010005574944544802
      000200FE01046E616D6502004A000000010005574944544802000200FE010973
      656E696F724B657902004A000000010005574944544802000200FE0104747970
      65010049000000010005574944544802000200010012436F6E746146696E616E
      6365697261496D7002004A000200010005574944544802000200FE0112436F6E
      746146696E616E636569726145787002004A0002000100055749445448020002
      00FE010000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 264
    object cdsItensFaturaTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsItensFaturadestino: TWideStringField
      FieldName = 'destino'
      Size = 1
    end
    object cdsItensFaturaprice: TBCDField
      FieldName = 'price'
      Precision = 19
      Size = 2
    end
    object cdsItensFaturaaKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object cdsItensFaturaname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object cdsItensFaturaseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object cdsItensFaturatype: TStringField
      FieldName = 'type'
      Size = 1
    end
    object cdsItensFaturaContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      Size = 255
    end
    object cdsItensFaturaContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
    object cdsItensFaturaBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
    object cdsItensFaturaid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
    end
    object cdsItensFaturaitem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
    end
  end
  object qryClienteV2: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CD_CLIENTE'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT C.ID,'
      '       C.AKEY,'
      '       C.CITY,'
      '       C.NUMBER,'
      '       C.STATE,'
      '       C.STREET,'
      '       C.ZIPCODE,'
      '       C.NAME,'
      '       C.TAXID,'
      '       C.COUNTRY_ID,'
      '       ISNULL(CF.CPS_ID,C.GROUP_ID) CP_ID,'
      '       C.NEIGHBORHOOD,'
      '       C.FAX,C.FONE,'
      '       C.INSCESTADUAL,'
      '       C.INSCMUNICIPAL,'
      '       C.TYPE,'
      '       C.SENIORKEY,'
      '       ISNULL(EN.END_UF,A.END_UF) UF'
      'FROM MYINDAIAV2.DBO.CUSTOMER                       C  (NOLOCK)'
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMERGROUP            CG (NOLOCK)ON' +
        ' C.GROUP_ID      = CG.ID'
      
        'LEFT  JOIN MYINDAIAV2.DBO.CUSTOMER_CUSTOMERPROFILE CF (NOLOCK)ON' +
        ' C.ID            = CF.CUSTOMER_ID'
      
        'LEFT  JOIN BROKER.DBO.TEMPRESA_NAC                 EN (NOLOCK)ON' +
        ' EN.CD_EMPRESA   = C.AKEY'
      
        'LEFT  JOIN BROKER.DBO.TAGENTE                      A  (NOLOCK)ON' +
        ' A.NR_CGC_AGENTE = C.TAXID'
      'WHERE  C.ID = :CD_CLIENTE')
    Left = 32
    Top = 8
    object qryClienteV2aKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object qryClienteV2city: TWideStringField
      FieldName = 'city'
      Size = 255
    end
    object qryClienteV2number: TWideStringField
      FieldName = 'number'
      Size = 255
    end
    object qryClienteV2state: TWideStringField
      FieldName = 'state'
      Size = 255
    end
    object qryClienteV2street: TWideStringField
      FieldName = 'street'
      Size = 255
    end
    object qryClienteV2zipCode: TWideStringField
      FieldName = 'zipCode'
      Size = 255
    end
    object qryClienteV2name: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qryClienteV2taxID: TWideStringField
      FieldName = 'taxID'
      Size = 255
    end
    object qryClienteV2Country_id: TLargeintField
      FieldName = 'Country_id'
    end
    object qryClienteV2neighborhood: TWideStringField
      FieldName = 'neighborhood'
      Size = 255
    end
    object qryClienteV2fax: TWideStringField
      FieldName = 'fax'
      Size = 255
    end
    object qryClienteV2fone: TWideStringField
      FieldName = 'fone'
      Size = 255
    end
    object qryClienteV2inscEstadual: TWideStringField
      FieldName = 'inscEstadual'
      Size = 255
    end
    object qryClienteV2inscMunicipal: TWideStringField
      FieldName = 'inscMunicipal'
      Size = 255
    end
    object qryClienteV2type: TWideStringField
      FieldName = 'type'
      Size = 255
    end
    object qryClienteV2seniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryClienteV2ID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryClienteV2CP_ID: TLargeintField
      FieldName = 'CP_ID'
      ReadOnly = True
    end
    object qryClienteV2UF: TStringField
      FieldName = 'UF'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object qryClienteLocal: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CD_CLIENTE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = ''
      end>
    SQL.Strings = (
      'SELECT CD_EMPRESA, '
      '       NM_EMPRESA, '
      '       AP_EMPRESA, '
      '       CGC_EMPRESA, '
      '       CPF_EMPRESA, '
      '       END_UF, '
      '       END_CIDADE, '
      '       ISNULL(IN_ORGAO_PUBLICO, '#39'0'#39') AS IN_ORGAO_PUBLICO'
      'FROM BROKER.DBO.TEMPRESA_NAC (NOLOCK)'
      'WHERE CD_EMPRESA = :CD_CLIENTE')
    Left = 120
    Top = 8
    object qryClienteLocalCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryClienteLocalNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 80
    end
    object qryClienteLocalAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qryClienteLocalCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qryClienteLocalCPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      FixedChar = True
      Size = 11
    end
    object qryClienteLocalEND_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qryClienteLocalEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object qryClienteLocalIN_ORGAO_PUBLICO: TStringField
      FieldName = 'IN_ORGAO_PUBLICO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
  object qryUnidade: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'ID_UNIDADE'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT U.CD_UNID_NEG, '
      '       U.NM_UNID_NEG, '
      '       U.AP_UNID_NEG, '
      '       U.CGC_UNID_NEG, '
      '       U.END_UNID_NEG, '
      '       U.END_NUMERO, '
      '       U.END_COMPL, '
      '       U.END_BAIRRO, '
      '       U.END_CIDADE, '
      '       U.END_UF, '
      '       B.ID, '
      '       B.SENIORKEY'
      'FROM BROKER.DBO.TUNID_NEG         U (NOLOCK)'
      
        ' INNER JOIN MYINDAIAV2.DBO.BRANCH B (NOLOCK) ON B.AKEY = U.CD_UN' +
        'ID_NEG'
      'WHERE ID = :ID_UNIDADE')
    Left = 208
    Top = 8
    object qryUnidadeCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryUnidadeNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryUnidadeAP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      FixedChar = True
      Size = 10
    end
    object qryUnidadeCGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qryUnidadeEND_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryUnidadeEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qryUnidadeEND_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
    end
    object qryUnidadeEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qryUnidadeEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qryUnidadeEND_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qryUnidadeseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryUnidadeid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object qryCustomerProfile: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CP_ID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = '0'
      end
      item
        Name = 'product_id'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM  CUSTOMERGROUP_CUSTOMERPROFILE GP (NOLOCK)'
      
        'INNER JOIN CUSTOMERPROFILE          CP (NOLOCK) ON CP.ID=GP.CPS_' +
        'ID'
      'WHERE GP.CUSTOMERGROUP_ID = :CP_ID '
      '  AND PRODUCT_ID = :PRODUCT_ID')
    Left = 32
    Top = 72
    object qryCustomerProfiledescricao: TWideStringField
      FieldName = 'descricao'
      Size = 255
    end
    object qryCustomerProfilesendToBank: TBooleanField
      FieldName = 'sendToBank'
    end
    object qryCustomerProfilewithCashRequest: TBooleanField
      FieldName = 'withCashRequest'
    end
    object qryCustomerProfilecostCenter: TStringField
      FieldName = 'costCenter'
      Size = 255
    end
    object qryCustomerProfileconsolidatedBilling: TBooleanField
      FieldName = 'consolidatedBilling'
    end
    object qryCustomerProfileconsolidatedInvoice: TBooleanField
      FieldName = 'consolidatedInvoice'
    end
    object qryCustomerProfileloadDITax: TBooleanField
      FieldName = 'loadDITax'
    end
    object qryCustomerProfilelimitValue: TBCDField
      FieldName = 'limitValue'
      Precision = 19
      Size = 2
    end
    object qryCustomerProfilecps_id: TLargeintField
      FieldName = 'cps_id'
    end
    object qryCustomerProfileid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryCustomerProfileproduct_id: TLargeintField
      FieldName = 'product_id'
    end
    object qryCustomerProfileCustomerGroup_id: TLargeintField
      FieldName = 'CustomerGroup_id'
    end
  end
  object qryFaturasHoje: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'DataFatura'
        Size = -1
        Value = Null
      end
      item
        Name = 'customer_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 19
        Size = 8
        Value = 0
      end>
    SQL.Strings = (
      'SELECT CUSTOMER_ID ,'
      '       B.ID,'
      '       B.AKEY,'
      '       B.CREATED,'
      '       B.DUEDATE,'
      '       B.INVOICERECEIVERTYPE,'
      '       B.SENIORDATENFE,'
      '       B.SENIORKEY,'
      '       B.STATUS,'
      '       B.TYPE,'
      '       B.BRANCH_ID,'
      '       B.USER_ID,'
      '       B.IRRETAINED,'
      '       B.IR,B.TOTAL, '
      '       B.VALORTIBUTAVEL,'
      '       B.COFINS,'
      '       IV.CUSTOMCLEARANCE_ID,'
      '       SUM(IR) IRTOTALDIA'
      'FROM BILLING                       B   (NOLOCK)'
      
        '   INNER JOIN BILLING_ITEMINVOICED BIV (NOLOCK)ON BIV.BILLING_ID' +
        ' = B.ID'
      
        '   INNER JOIN ITEMINVOICED         IV  (NOLOCK)ON IV.ID         ' +
        ' = BIV.ITENSINVOICED_ID'
      
        '   INNER JOIN CUSTOMCLEARANCE      CC  (NOLOCK)ON CC.ID         ' +
        ' = IV.CUSTOMCLEARANCE_ID'
      
        '   INNER JOIN CUSTOMER             C   (NOLOCK)ON C.ID          ' +
        ' = CC.CUSTOMER_ID   '
      'WHERE'
      
        '  CONVERT(VARCHAR,B.CREATED,103) = CONVERT(VARCHAR,CONVERT(DATE,' +
        ' :DATAFATURA ,  103),103)'
      '  AND B.STATUS = '#39'INVOICED'#39
      
        '  AND SUBSTRING(C.TAXID,0,9) IN (SELECT SUBSTRING(TAXID,0,9) FRO' +
        'M CUSTOMER (NOLOCK) WHERE ID = :CUSTOMER_ID ) '
      'GROUP BY CUSTOMER_ID ,'
      '         B.ID,B.AKEY,'
      '         B.CREATED,'
      '         B.DUEDATE,'
      '         B.INVOICERECEIVERTYPE,'
      '         B.SENIORDATENFE,'
      '         B.SENIORKEY,'
      '         B.STATUS,'
      '         B.TYPE,'
      '         B.BRANCH_ID,'
      '         B.USER_ID,'
      '         B.IRRETAINED,'
      '         B.IR,B.TOTAL,'
      '         B.VALORTIBUTAVEL,'
      '         B.COFINS,'
      '         IV.CUSTOMCLEARANCE_ID'
      'ORDER BY B.SENIORKEY')
    Left = 120
    Top = 72
    object qryFaturasHojeakey: TWideStringField
      FieldName = 'akey'
      Size = 255
    end
    object qryFaturasHojecreated: TDateTimeField
      FieldName = 'created'
    end
    object qryFaturasHojedueDate: TDateTimeField
      FieldName = 'dueDate'
    end
    object qryFaturasHojeinvoiceReceiverType: TStringField
      FieldName = 'invoiceReceiverType'
      Size = 255
    end
    object qryFaturasHojeir: TBCDField
      FieldName = 'ir'
      Precision = 19
      Size = 2
    end
    object qryFaturasHojeseniorDateNFE: TDateTimeField
      FieldName = 'seniorDateNFE'
    end
    object qryFaturasHojeseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryFaturasHojestatus: TWideStringField
      FieldName = 'status'
      Size = 255
    end
    object qryFaturasHojetotal: TBCDField
      FieldName = 'total'
      Precision = 19
      Size = 2
    end
    object qryFaturasHojetype: TWideStringField
      FieldName = 'type'
      Size = 255
    end
    object qryFaturasHojevalorTibutavel: TBCDField
      FieldName = 'valorTibutavel'
      Precision = 19
      Size = 2
    end
    object qryFaturasHojecofins: TBCDField
      FieldName = 'cofins'
      Precision = 19
      Size = 2
    end
    object qryFaturasHojeid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryFaturasHojebranch_id: TLargeintField
      FieldName = 'branch_id'
    end
    object qryFaturasHojeuser_id: TLargeintField
      FieldName = 'user_id'
    end
    object qryFaturasHojecustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
    end
    object qryFaturasHojecustomer_id: TLargeintField
      FieldName = 'customer_id'
    end
    object qryFaturasHojeirRetained: TBooleanField
      FieldName = 'irRetained'
    end
    object qryFaturasHojeirtotaldia: TFMTBCDField
      FieldName = 'irtotaldia'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object DataSetProvider1: TDataSetProvider
    Left = 296
    Top = 136
  end
  object cdsFaturaNumerarios: TClientDataSet
    PersistDataPacket.Data = {
      810100009619E0BD01000000180000000C000000000003000000810104546970
      6F0100490000000100055749445448020002000A000269640C00050000000100
      0557494454480200020013000764657374696E6F01004A000000010005574944
      54480200020002000570726963650C0005000000020008444543494D414C5302
      0002000200055749445448020002001300076974656D5F69640C000500000001
      0005574944544802000200130004614B657902004A0000000100055749445448
      02000200FE01046E616D6502004A000000010005574944544802000200FE0109
      73656E696F724B657902004A000000010005574944544802000200FE01047479
      7065010049000000010005574944544802000200010012436F6E746146696E61
      6E6365697261496D7002004A000000010005574944544802000200FE0112436F
      6E746146696E616E636569726145787002004A00000001000557494454480200
      0200FE010A42696C6C696E675F69640C00050000000100055749445448020002
      0013000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 208
    object cdsFaturaNumerariosTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsFaturaNumerariosdestino: TWideStringField
      FieldName = 'destino'
      Size = 1
    end
    object cdsFaturaNumerariosprice: TBCDField
      FieldName = 'price'
      Precision = 19
      Size = 2
    end
    object cdsFaturaNumerariosaKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object cdsFaturaNumerariosname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object cdsFaturaNumerariosseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object cdsFaturaNumerariostype: TStringField
      FieldName = 'type'
      Size = 1
    end
    object cdsFaturaNumerariosContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      Size = 255
    end
    object cdsFaturaNumerariosContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
    object cdsFaturaNumerariosid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaNumerariositem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaNumerariosBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
  end
  object qryNumerario: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'idFatura'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '#39'Numer'#225'rios'#39' AS TIPO, '
      '       SUM(IR.PRICE) PRICE'
      
        '  FROM MYINDAIAV2.DBO.BILLING_CASHREQUESTED               BCR  (' +
        'NOLOCK)'
      
        'INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR   (' +
        'NOLOCK) ON CR.ID                  = BCR.CASHREQUESTS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED CRICR(' +
        'NOLOCK) ON CRICR.CASHREQUESTED_ID = CR.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IR   (' +
        'NOLOCK) ON IR.ID                  = CRICR.ITEMS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEM                            I    (' +
        'NOLOCK) ON I.ID                   = IR.ITEM_ID'
      'WHERE BILLING_ID = :IDFATURA'
      'AND IR.DESTINO   = 1       ')
    Left = 208
    Top = 136
    object qryNumerarioTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
    object qryNumerarioprice: TFMTBCDField
      FieldName = 'price'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object qryAtualizarTitulosProcessos: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'idFatura'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      ''
      'SELECT BPR.BILLING_ID, '
      '       '#39'Pagamentos'#39' AS TIPO, '
      '       PR.PAYMENTTOTAL,'
      '       PR.SENIORKEY SENIORKEYPAYMENT,'
      '       MAX(INVOICE.SENIORKEYINVOICE) SENIORKEYINVOICE,'
      '       PR.CUSTOMCLEARANCE_ID'
      
        '  FROM MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED                  ' +
        ' BPR   (NOLOCK)'
      
        ' INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED                     ' +
        ' PR    (NOLOCK)ON PR.ID                     = BPR.PAYMENTS_ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED' +
        ' PRIPR (NOLOCK)ON PRIPR.PAYMENTREQUESTED_ID = BPR.PAYMENTS_ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                 ' +
        ' IPR   (NOLOCK)ON IPR.ID                    = PRIPR.ITEMS_ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.ITEM                                 ' +
        ' I     (NOLOCK)ON I.ID                      = IPR.ITEM_ID'
      ' OUTER APPLY (SELECT  BINVOICE.ID,'
      '                      BINVOICE.SENIORKEY SENIORKEYINVOICE,'
      '                      CUSTOMCLEARANCE_ID,'
      '                      CUSTOMID '
      
        '              FROM MYINDAIAV2.DBO.BILLING         BINVOICE   (NO' +
        'LOCK)'
      
        '        INNER JOIN BILLING_ITEMINVOICED           BIVINVOICE (NO' +
        'LOCK)ON BIVINVOICE.BILLING_ID = BINVOICE.ID'
      
        '        INNER JOIN ITEMINVOICED                   IVINVOICE  (NO' +
        'LOCK)ON IVINVOICE.ID          = BIVINVOICE.ITENSINVOICED_ID'
      
        '        INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CCINVOICE  (NO' +
        'LOCK)ON CCINVOICE.ID          = IVINVOICE.CUSTOMCLEARANCE_ID'
      
        '             WHERE TYPE               = '#39'TAX_RECEIPT'#39'  /*'#39'TAX_IN' +
        'VOICE'#39' */'
      
        '               AND CUSTOMCLEARANCE_ID = PR.CUSTOMCLEARANCE_ID ) ' +
        'INVOICE '
      #9#9#9'   '
      'WHERE BPR.BILLING_ID =  :IDFATURA'
      ''
      'GROUP BY PR.PAYMENTTOTAL,'
      '         PR.SENIORKEY,'
      '         BPR.BILLING_ID,'
      '         PR.CUSTOMCLEARANCE_ID')
    Left = 72
    Top = 128
    object qryAtualizarTitulosProcessosBilling_id: TLargeintField
      FieldName = 'Billing_id'
    end
    object qryAtualizarTitulosProcessosTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
    object qryAtualizarTitulosProcessospaymentTotal: TBCDField
      FieldName = 'paymentTotal'
      Precision = 19
      Size = 2
    end
    object qryAtualizarTitulosProcessosseniorKeyPayment: TWideStringField
      FieldName = 'seniorKeyPayment'
      Size = 255
    end
    object qryAtualizarTitulosProcessoscustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
    end
    object qryAtualizarTitulosProcessosSeniorKeyInvoice: TWideStringField
      FieldName = 'SeniorKeyInvoice'
      ReadOnly = True
      Size = 255
    end
  end
  object qryReferencia: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'idFatura'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'DECLARE @IDFATURA INTEGER '
      'SET @IDFATURA = :IDFATURA'
      ''
      ''
      'DECLARE @REFERENCIAS VARCHAR(8000)'
      'DECLARE @VALOR_TOTAL FLOAT'
      'DECLARE @VL_TRIB_FEDERAL NUMERIC(15,2)'
      'DECLARE @VL_TRIB_MUNICIPAL NUMERIC(15,2)'
      ''
      'SELECT @VL_TRIB_FEDERAL   = VL_NF_TRIBUTO_FEDERAL'
      '     , @VL_TRIB_MUNICIPAL = VL_NF_TRIBUTO_MUNICIPAL'
      'FROM BROKER.DBO.TPARAMETROS (NOLOCK) '
      ''
      ''
      
        'SET @VALOR_TOTAL = (SELECT B.TOTAL FROM MYINDAIAV2.DBO.BILLING B' +
        ' WHERE B.ID = @IDFATURA)'
      ''
      ''
      'SELECT @REFERENCIAS ='
      'STUFF ('
      '(SELECT '#39' - '#39' + REF '
      '   FROM ( '
      'SELECT  DISTINCT REFERENCIAS.REF           '
      '  FROM MYINDAIAV2.DBO.BILLING                       B  (NOLOCK)'
      
        '   INNER JOIN MYINDAIAV2.DBO.BRANCH                    (NOLOCK) ' +
        'ON BRANCH.ID      = B.BRANCH_ID'
      
        '   INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED   BIV(NOLOCK) ' +
        'ON BIV.BILLING_ID = B.ID'
      
        '   INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED           IV (NOLOCK) ' +
        'ON IV.ID          = BIV.ITENSINVOICED_ID'
      
        '   INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE        CC (NOLOCK) ' +
        'ON CC.ID          = IV.CUSTOMCLEARANCE_ID'
      
        '   INNER JOIN BROKER.DBO.TPROCESSO                  P  (NOLOCK) ' +
        'ON P.NR_PROCESSO  = CC.CUSTOMID'
      
        '   INNER JOIN BROKER.DBO.TGRUPO                     G  (NOLOCK) ' +
        'ON G.CD_GRUPO     = P.CD_GRUPO'
      '   OUTER APPLY('
      '         SELECT CONVERT(VARCHAR(8000), '
      
        '                        ISNULL(SUBSTRING(STUFF((SELECT DISTINCT ' +
        #39', '#39' '
      
        '                                                       + LTRIM(R' +
        'TRIM(ISNULL(CD_REFERENCIA,'#39#39')))+'
      
        '                                                        CASE WHE' +
        'N LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39'0000'#39' AND'
      
        '                                                                ' +
        '  LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39'))) <> '#39#39
      
        '                                                             THE' +
        'N '#39'-'#39'+LTRIM(RTRIM(ISNULL(NR_ITEM_PO,'#39#39')))'
      
        '                                                             ELS' +
        'E '#39#39
      '                                                        END     '
      
        '        '#9#9#9#9#9#9#9'              FROM BROKER.DBO.TREF_CLIENTE (NOLOC' +
        'K) '
      '        '#9#9#9#9#9#9#9'             WHERE NR_PROCESSO = P.NR_PROCESSO '
      
        '        '#9#9#9#9#9#9#9'               AND TP_REFERENCIA IN (CASE WHEN P.' +
        'CD_PRODUTO = 1 '
      
        '        '#9#9#9#9#9#9#9'                                          THEN G.' +
        'TP_PEDIDO_BUSCA_IMP '
      
        '        '#9#9#9#9#9#9#9'                                          ELSE G.' +
        'TP_PEDIDO_BUSCA '
      '        '#9#9#9#9#9#9#9'                                     END,'
      
        '        '#9#9#9#9#9#9#9'                                     CASE WHEN G.' +
        'CD_GRUPO = '#39'155'#39
      
        '        '#9#9#9#9#9#9#9'                                          THEN '#39'0' +
        '2'#39
      '        '#9#9#9#9#9#9#9'                                          ELSE '#39#39
      '        '#9#9#9#9#9#9#9'                                     END)'
      
        '       '#9#9#9#9#9#9#9'               FOR XML PATH('#39#39')), 1, 2, '#39#39'),1,8000' +
        '), '#39#39')) AS REF) REFERENCIAS   '
      'WHERE B.ID = @IDFATURA'
      ') TAB '
      'FOR XML PATH('#39#39')), 1, 3, '#39#39')  '
      ''
      ''
      'SELECT CONVERT(VARCHAR(8000), LTRIM(RTRIM(@REFERENCIAS))'
      '+ CHAR(10) + CHAR(13) +'
      
        #39' Trib aprox: Fed R$'#39'+CAST(CONVERT(NUMERIC(15,2),(@VALOR_TOTAL *' +
        ' (@VL_TRIB_FEDERAL/100)))AS VARCHAR(20)) '
      
        '               +'#39' ('#39'+CAST(@VL_TRIB_FEDERAL AS VARCHAR(17))+'#39'%), ' +
        'Mun. R$'#39
      
        '                    +CAST(CONVERT(NUMERIC(15,2),(@VALOR_TOTAL * ' +
        '(@VL_TRIB_MUNICIPAL/100)))AS VARCHAR(20)) '
      
        '               +'#39' ('#39'+CAST(@VL_TRIB_MUNICIPAL AS VARCHAR(17))+'#39'%)' +
        '. Fonte: IBPT'#39
      '               '
      
        '               +'#39' Tributa'#231#227'o conforme EC 132/2023 '#8211' Reforma Trib' +
        'ut'#225'ria CBS (informativo): Base R$ '#39' '
      
        '               + CAST(CONVERT(NUMERIC(15,2),(@VALOR_TOTAL))AS VA' +
        'RCHAR(20)) '
      '               +'#39' | Al'#237'quota 0,9% | Valor R$ '#39
      
        '               + CAST(CONVERT(NUMERIC(15,2),(@VALOR_TOTAL * (0.0' +
        '09))) AS VARCHAR(20))'
      '               + '#39' IBS (informativo): Base R$ '#39
      
        '               + CAST(CONVERT(NUMERIC(15,2),(@VALOR_TOTAL))AS VA' +
        'RCHAR(20)) '
      '               +'#39' | Al'#237'quota 0,1% | Valor R$ '#39
      
        '               + CAST(CONVERT(NUMERIC(15,2),(@VALOR_TOTAL * (0.0' +
        '01))) AS VARCHAR(20))'
      '               )  AS NM_REFERENCIA')
    Left = 288
    Top = 8
    object qryReferenciaNM_REFERENCIA: TWideStringField
      FieldName = 'NM_REFERENCIA'
      ReadOnly = True
      Size = 8000
    end
  end
  object qryCalculaIR: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'VALOR_IR'
        DataType = ftFloat
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @VALOR_IR NUMERIC(15,2)'
      'SET @VALOR_IR =:VALOR_IR'
      
        'SELECT CONVERT(NUMERIC(15,2), ROUND(((@VALOR_IR/100) * 1.50),2))' +
        ' AS VL_IR')
    Left = 272
    Top = 232
  end
  object HTTPRIO1: THTTPRIO
    OnBeforeExecute = HTTPRIO1BeforeExecute
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    HTTPWebNode.OnBeforePost = HTTPRIO1HTTPWebNode1BeforePost
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 368
    Top = 200
  end
  object qryNumerarioBaixarPSR: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'idFatura'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      'Distinct'
      'CR.seniorKey + '#39'S01'#39' as SeniorKey'
      
        'FROM MYINDAIAV2.DBO.BILLING_CASHREQUESTED               BCR  (NO' +
        'LOCK)'
      
        'INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR   (' +
        'NOLOCK) ON CR.ID                  = BCR.CASHREQUESTS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED CRICR(' +
        'NOLOCK) ON CRICR.CASHREQUESTED_ID = CR.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               IR   (' +
        'NOLOCK) ON IR.ID                  = CRICR.ITEMS_ID'
      'WHERE BILLING_ID = :IDFATURA'
      'AND IR.DESTINO   = 1 '
      #9#9#9'   ')
    Left = 112
    Top = 169
    object qryNumerarioBaixarPSRSeniorKey: TWideStringField
      FieldName = 'SeniorKey'
      ReadOnly = True
      Size = 258
    end
  end
  object qryUnidadeProcesso: TADOQuery
    Active = True
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'ID_UNIDADE'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT U.CD_UNID_NEG, '
      '       U.NM_UNID_NEG, '
      '       U.AP_UNID_NEG, '
      '       U.CGC_UNID_NEG, '
      '       U.END_UNID_NEG, '
      '       U.END_NUMERO, '
      '       U.END_COMPL, '
      '       U.END_BAIRRO, '
      '       U.END_CIDADE, '
      '       U.END_UF, '
      '       B.ID, '
      '       B.SENIORKEY'
      'FROM BROKER.DBO.TUNID_NEG         U (NOLOCK)'
      
        ' INNER JOIN MYINDAIAV2.DBO.BRANCH B (NOLOCK) ON B.AKEY = U.CD_UN' +
        'ID_NEG'
      'WHERE ID = :ID_UNIDADE')
    Left = 376
    Top = 8
    object qryUnidadeProcessoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryUnidadeProcessoNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryUnidadeProcessoAP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      FixedChar = True
      Size = 10
    end
    object qryUnidadeProcessoCGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qryUnidadeProcessoEND_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryUnidadeProcessoEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qryUnidadeProcessoEND_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
    end
    object qryUnidadeProcessoEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qryUnidadeProcessoEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qryUnidadeProcessoEND_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qryUnidadeProcessoID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryUnidadeProcessoSENIORKEY: TWideStringField
      FieldName = 'SENIORKEY'
      Size = 255
    end
  end
end

object dtmEnvioERP: TdtmEnvioERP
  OldCreateOrder = False
  Left = 296
  Top = 63
  Height = 498
  Width = 726
  object qryFatura: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
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
      'SELECT B.*, CC.customID, CC.customer_id, C.aKey AS CD_CLIENTE'
      'FROM MYINDAIAV2.dbo.Billing B'
      
        '   INNER JOIN MYINDAIAV2.dbo.CustomClearance CC ON CC.id = B.cu' +
        'stomClearance_id'

        '   INNER JOIN MYINDAIAV2.dbo.Customer C ON C.id = CC.customer_i' +
        'd'
      'WHERE B.id = :idFatura')
    Left = 136
    Top = 288
    object qryFaturaid: TBCDField
      FieldName = 'id'
      ReadOnly = True
      Precision = 19
      Size = 0
    end
    object qryFaturaakey: TWideStringField
      FieldName = 'akey'
      Size = 255
    end
    object qryFaturacofins: TBCDField
      FieldName = 'cofins'
      Precision = 19
      Size = 2
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
    object qryFaturaobs: TWideMemoField
      FieldName = 'obs'
      BlobType = ftWideMemo
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
    object qryFaturabranch_id: TBCDField
      FieldName = 'branch_id'
      Precision = 19
      Size = 0
    end
    object qryFaturacustomClearance_id: TBCDField
      FieldName = 'customClearance_id'
      Precision = 19
      Size = 0
    end
    object qryFaturauser_id: TBCDField
      FieldName = 'user_id'
      Precision = 19
      Size = 0
    end
    object qryFaturacustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object qryFaturacustomer_id: TBCDField
      FieldName = 'customer_id'
      Precision = 19
      Size = 0
    end
    object qryFaturaCD_CLIENTE: TWideStringField
      FieldName = 'CD_CLIENTE'
      Size = 255
    end
  end
  object qryItensFatura: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    AfterOpen = qryItensFaturaAfterOpen
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
      'SELECT *'
      'FROM (-- Itens de Numerario'
      
        '      SELECT BCR.Billing_id, '#39'Numer'#225'rios'#39' AS Tipo, CRICR.CashReq' +
        'uested_id AS id, IR.destino, IR.price, IR.item_id, I.aKey, I.nam' +
        'e, I.seniorKey, I.type'
      '      FROM MYINDAIAV2.dbo.Billing_CashRequested BCR'
      
        '         INNER JOIN MYINDAIAV2.dbo.CashRequested CR ON CR.id = ' +
        'BCR.cashRequests_id'
      
        '         INNER JOIN MYINDAIAV2.dbo.CashRequested_ItemCashReques' +
        'ted CRICR ON CRICR.CashRequested_id = CR.id'
      
        '         INNER JOIN MYINDAIAV2.dbo.ItemCashRequested IR ON IR.i' +
        'd = CRICR.items_id'
      '         INNER JOIN MYINDAIAV2.dbo.Item I ON I.id = IR.item_id'
      '      UNION ALL'
      '      -- Itens de Pagamento'
      
        '      SELECT BPR.Billing_id, '#39'Pagamentos'#39' AS Tipo, PR.id, NULL A' +
        'S destino, IPR.price, IPR.item_id, I.aKey, I.name, I.seniorKey, ' +
        'I.type'
      '      FROM MYINDAIAV2.dbo.Billing_PaymentRequested BPR'
      
        '         INNER JOIN MYINDAIAV2.dbo.PaymentRequested PR ON PR.id' +
        ' = BPR.payments_id'
      
        '         INNER JOIN MYINDAIAV2.dbo.PaymentRequested_ItemPayment' +
        'Requested PRIPR ON PRIPR.PaymentRequested_id = BPR.payments_id'
      
        '         INNER JOIN MYINDAIAV2.dbo.ItemPaymentRequested IPR ON ' +
        'IPR.id = PRIPR.items_id'
      '         INNER JOIN MYINDAIAV2.dbo.Item I ON I.id = IPR.item_id'
      '      UNION ALL'
      '      -- Itens de Receita'
      
        '      SELECT BII.Billing_id, '#39'Receitas'#39' AS Tipo, II.id, NULL AS ' +
        'destino, II.price, II.item_id, I.aKey, I.name AS item_name, I.se' +
        'niorKey, I.type'
      '      FROM MYINDAIAV2.dbo.Billing_ItemInvoiced BII'
      
        '         INNER JOIN MYINDAIAV2.dbo.ItemInvoiced II ON II.id = B' +
        'II.itensInvoiced_id'
      '         INNER JOIN MYINDAIAV2.dbo.Item I ON I.id = II.item_id'
      '      ) AS Fat'
      'WHERE Billing_id = :idFatura')
    Left = 224
    Top = 288
    object qryItensFaturaBilling_id: TBCDField
      FieldName = 'Billing_id'
      ReadOnly = True
      Precision = 19
      Size = 0
    end
    object qryItensFaturaTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
    object qryItensFaturaid: TBCDField
      FieldName = 'id'
      ReadOnly = True
      Precision = 19
      Size = 0
    end
    object qryItensFaturadestino: TWideStringField
      FieldName = 'destino'
      ReadOnly = True
      Size = 1
    end
    object qryItensFaturaprice: TBCDField
      FieldName = 'price'
      ReadOnly = True
      Precision = 19
      Size = 2
    end
    object qryItensFaturaitem_id: TBCDField
      FieldName = 'item_id'
      ReadOnly = True
      Precision = 19
      Size = 0
    end
    object qryItensFaturaaKey: TWideStringField
      FieldName = 'aKey'
      ReadOnly = True
      Size = 255
    end
    object qryItensFaturaname: TWideStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 255
    end
    object qryItensFaturaseniorKey: TWideStringField
      FieldName = 'seniorKey'
      ReadOnly = True
      Size = 255
    end
    object qryItensFaturatype: TStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 1
    end
  end
  object cdsFaturaNumerarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 344
    Data = {
      330100009619E0BD01000000180000000A00000000000300000033010A42696C
      6C696E675F69640C00050002000100055749445448020002001300045469706F
      0100490002000100055749445448020002000A000269640C0005000200010005
      57494454480200020013000764657374696E6F01004A00020001000557494454
      480200020002000570726963650C0005000200020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640C00050002000100
      05574944544802000200130004614B657902004A000200010005574944544802
      000200FE01046E616D6502004A000200010005574944544802000200FE010973
      656E696F724B657902004A000200010005574944544802000200FE0104747970
      6501004900020001000557494454480200020001000000}
    object cdsFaturaNumerariosBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaNumerariosTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsFaturaNumerariosid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
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
    object cdsFaturaNumerariositem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
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
  end
  object cdsFaturaPagamentos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 344
    Data = {
      330100009619E0BD01000000180000000A00000000000300000033010A42696C
      6C696E675F69640C00050002000100055749445448020002001300045469706F
      0100490002000100055749445448020002000A000269640C0005000200010005
      57494454480200020013000764657374696E6F01004A00020001000557494454
      480200020002000570726963650C0005000200020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640C00050002000100
      05574944544802000200130004614B657902004A000200010005574944544802
      000200FE01046E616D6502004A000200010005574944544802000200FE010973
      656E696F724B657902004A000200010005574944544802000200FE0104747970
      6501004900020001000557494454480200020001000000}
    object cdsFaturaPagamentosBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaPagamentosTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsFaturaPagamentosid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
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
    object cdsFaturaPagamentositem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
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
  end
  object cdsFaturaReceitas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 344
    Data = {
      330100009619E0BD01000000180000000A00000000000300000033010A42696C
      6C696E675F69640C00050002000100055749445448020002001300045469706F
      0100490002000100055749445448020002000A000269640C0005000200010005
      57494454480200020013000764657374696E6F01004A00020001000557494454
      480200020002000570726963650C0005000200020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640C00050002000100
      05574944544802000200130004614B657902004A000200010005574944544802
      000200FE01046E616D6502004A000200010005574944544802000200FE010973
      656E696F724B657902004A000200010005574944544802000200FE0104747970
      6501004900020001000557494454480200020001000000}
    object cdsFaturaReceitasBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
    object cdsFaturaReceitasTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsFaturaReceitasid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
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
    object cdsFaturaReceitasitem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
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
  end
  object cdsItensFatura: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 392
    Data = {
      330100009619E0BD01000000180000000A00000000000300000033010A42696C
      6C696E675F69640C00050002000100055749445448020002001300045469706F
      0100490002000100055749445448020002000A000269640C0005000200010005
      57494454480200020013000764657374696E6F01004A00020001000557494454
      480200020002000570726963650C0005000200020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640C00050002000100
      05574944544802000200130004614B657902004A000200010005574944544802
      000200FE01046E616D6502004A000200010005574944544802000200FE010973
      656E696F724B657902004A000200010005574944544802000200FE0104747970
      6501004900020001000557494454480200020001000000}
    object cdsItensFaturaBilling_id: TBCDField
      FieldName = 'Billing_id'
      Precision = 19
      Size = 0
    end
    object cdsItensFaturaTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsItensFaturaid: TBCDField
      FieldName = 'id'
      Precision = 19
      Size = 0
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
    object cdsItensFaturaitem_id: TBCDField
      FieldName = 'item_id'
      Precision = 19
      Size = 0
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
  end
  object qryClienteV2: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CD_CLIENTE'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = ''
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.DBO.Customer'
      'WHERE aKey = :CD_CLIENTE')
    Left = 224
    Top = 120
    object qryClienteV2id: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
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
    object qryClienteV2cp_id: TLargeintField
      FieldName = 'cp_id'
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
  end
  object qryClienteLocal: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
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
      
        'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CGC_EMPRESA, CPF_EMPR' +
        'ESA, END_UF, END_CIDADE, ISNULL(IN_ORGAO_PUBLICO, '#39'0'#39') AS IN_ORG' +
        'AO_PUBLICO'
      'FROM BROKER.DBO.TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_CLIENTE')
    Left = 304
    Top = 120
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
      
        'SELECT U.CD_UNID_NEG, U.NM_UNID_NEG, U.AP_UNID_NEG, U.CGC_UNID_N' +
        'EG, U.END_UNID_NEG, U.END_NUMERO, U.END_COMPL, U.END_BAIRRO, U.E' +
        'ND_CIDADE, U.END_UF, B.id, B.seniorKey'
      'FROM BROKER.DBO.TUNID_NEG U'
      '   INNER JOIN MYINDAIAV2.dbo.Branch B ON B.aKey = U.CD_UNID_NEG'
      'WHERE id = :ID_UNIDADE')
    Left = 224
    Top = 168
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
    object qryUnidadeid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryUnidadeseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
  end
  object qryCustomerProfile: TADOQuery
    Connection = dtmFaturamentoERP.Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CP_ID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.dbo.CustomerProfile'
      'WHERE id = :CP_ID')
    Left = 224
    Top = 216
    object qryCustomerProfileid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
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
    object qryCustomerProfilecontaFinanceira: TStringField
      FieldName = 'contaFinanceira'
      Size = 255
    end
    object qryCustomerProfileloadDITax: TBooleanField
      FieldName = 'loadDITax'
    end
  end
end

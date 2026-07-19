object dtmFaturamentoERP: TdtmFaturamentoERP
  OldCreateOrder = False
  Height = 571
  Width = 639
  object Connection: TADOConnection
    CommandTimeout = 60
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=SA;Initial Catalog=MYINDAIAV2;Data Source=INDAIA10;Use Proce' +
      'dure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstat' +
      'ion ID=PROGRAMADOR9;Use Encryption for Data=False;Tag with colum' +
      'n collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    AfterConnect = ConnectionAfterConnect
    Left = 40
    Top = 8
  end
  object qryConsulta: TADOQuery
    Connection = Connection
    CommandTimeout = 60
    Parameters = <>
    Left = 41
    Top = 68
  end
  object qryPendentes: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CUSTOMCLEARANCE_ID'
        Attributes = [paSigned, paNullable]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT P.*'
      'FROM (SELECT '#39'Numer'#225'rios'#39' AS TIPO, '
      '              CR.CUSTOMCLEARANCE_ID, '
      '              CR.ID AS PARENTID, '
      '              ICR.ID,'
      '              CR.CREATED, '
      '              CR.RECEIVEDDATE, '
      '              CR.SENIORKEY, '
      '              ICR.PRICE AS VALOR, '
      '              CR.STATUS,  '
      '              CR.USER_ID, '
      '              ICR.ITEM_ID AS ITEM_ID, '
      '              I.NAME AS ITEM_NAME'
      '      FROM CASHREQUESTED CR (nolock)'
      
        '         INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUEST' +
        'ED CRIR (NOLOCK) ON CRIR.CASHREQUESTED_ID = CR.ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED            ' +
        '   ICR  (NOLOCK) ON ICR.ID                = CRIR.ITEMS_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM                         ' +
        '   I    (NOLOCK) ON I.ID                  = ICR.ITEM_ID'
      '         OUTER APPLY (SELECT CASHREQUESTS_ID'
      '                        FROM BILLING_CASHREQUESTED A (NOLOCK)  '
      '                       WHERE STATUS <> '#39'CLOSED'#39
      '                         AND A.CASHREQUESTS_ID = CR.ID ) B'
      '        WHERE B.CASHREQUESTS_ID IS NULL                '
      '      /*WHERE CR.ID NOT IN (SELECT CASHREQUESTS_ID'
      '                            FROM BILLING_CASHREQUESTED (NOLOCK) '
      
        '                           WHERE STATUS <> '#39'CLOSED'#39')*/ /*ALTERAD' +
        'O POR AGATHA NIGRO 26/04/2018*/'
      '    '
      '      UNION ALL'
      '     '
      '      SELECT '#39'Pagamentos'#39' AS TIPO, '
      '             PR.CUSTOMCLEARANCE_ID,'
      '             PR.ID AS PARENTID, '
      '             IPR.ID,'
      '             PR.CREATED, '
      '             PR.RECEIVEDDATE, '
      '             PR.SENIORKEY,'
      '             IPR.PRICE  AS VALOR, '
      '             PR.STATUS,'
      '             PR.USER_ID, '
      '             IPR.ITEM_ID AS ITEM_ID, '
      '             I.NAME AS ITEM_NAME'
      '      FROM DBO.PAYMENTREQUESTED PR (NOLOCK)'
      
        '         INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTR' +
        'EQUESTED PRIR (NOLOCK) ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED         ' +
        '         IPR  (NOLOCK) ON IPR.ID                   = PRIR.ITEMS_' +
        'ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM                         ' +
        '         I    (NOLOCK) ON I.ID                     = IPR.ITEM_ID'
      '         OUTER APPLY ( SELECT ID'
      '                         FROM BILLING (NOLOCK) A'
      '                        WHERE STATUS <> '#39'CLOSED'#39
      '                          AND A.ID = PR.billing_id ) B'
      '        WHERE B.id IS NULL '
      '     /* WHERE PR.ID NOT IN (SELECT ID'
      '                            FROM BILLING (NOLOCK) '
      
        '                           WHERE STATUS <> '#39'CLOSED'#39')*/ /*ALTERAD' +
        'O POR AGATHA NIGRO 26/04/2018*/'
      ') AS P'
      'WHERE P.CUSTOMCLEARANCE_ID = :CUSTOMCLEARANCE_ID'
      '  AND NOT (STATUS IN ('#39'CANCELED'#39'))')
    Left = 257
    Top = 108
    object qryPendentesTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
    object qryPendentescreated: TDateTimeField
      FieldName = 'created'
      ReadOnly = True
    end
    object qryPendentesreceivedDate: TDateTimeField
      FieldName = 'receivedDate'
      ReadOnly = True
    end
    object qryPendentesseniorKey: TWideStringField
      FieldName = 'seniorKey'
      ReadOnly = True
      Size = 255
    end
    object qryPendentesValor: TBCDField
      FieldName = 'Valor'
      ReadOnly = True
      Precision = 19
      Size = 2
    end
    object qryPendentesstatus: TStringField
      FieldName = 'status'
      ReadOnly = True
      Size = 255
    end
    object qryPendentesitem_name: TWideStringField
      FieldName = 'item_name'
      ReadOnly = True
      Size = 255
    end
    object qryPendentescustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
      ReadOnly = True
    end
    object qryPendentesparentID: TLargeintField
      FieldName = 'parentID'
      ReadOnly = True
    end
    object qryPendentesid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryPendentesuser_id: TLargeintField
      FieldName = 'user_id'
      ReadOnly = True
    end
    object qryPendentesitem_id: TLargeintField
      FieldName = 'item_id'
      ReadOnly = True
    end
  end
  object dsPendentes: TDataSource
    DataSet = qryPendentes
    Left = 353
    Top = 108
  end
  object qryTipoPendente: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      'SELECT '#39'Numer'#225'rios'#39' AS Tipo'
      'UNION ALL'
      'SELECT '#39'Pagamentos'#39' AS Tipo')
    Left = 259
    Top = 247
    object StringField1: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
  end
  object dsTipoPendente: TDataSource
    DataSet = qryTipoPendente
    Left = 354
    Top = 247
  end
  object qryTipoFaturar: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Filter = 'CodTipo = 2'
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      'SELECT '#39'Numer'#225'rios'#39' AS Tipo, 0 AS CodTipo'
      'UNION ALL'
      'SELECT '#39'Pagamentos'#39' AS Tipo, 1 AS CodTipo'
      'UNION ALL'
      'SELECT '#39'Receitas'#39' AS Tipo, 0 AS CodTipo')
    Left = 257
    Top = 172
    object qryTipoFaturarTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
    object qryTipoFaturarCodTipo: TIntegerField
      FieldName = 'CodTipo'
      ReadOnly = True
    end
  end
  object dsTipoFaturar: TDataSource
    DataSet = qryTipoFaturar
    Left = 353
    Top = 171
  end
  object qryCalcReceita: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'NM_STORED_PROCEDURE'
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        Size = 18
        Value = Null
      end
      item
        Name = 'CD_ITEM'
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = 'VL_RECEITA'
        DataType = ftFloat
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @NM_STORED_PROCEDURE VARCHAR(255) = :NM_STORED_PROCEDURE'
      'DECLARE @NR_PROCESSO         VARCHAR(18)  = :NR_PROCESSO'
      'DECLARE @CD_ITEM             VARCHAR(3)   = :CD_ITEM'
      'DECLARE @VL_RECEITA          FLOAT        = :VL_RECEITA'
      ''
      'DECLARE @SQL                 NVARCHAR(1000)'
      ''
      
        'SET @SQL = N'#39'EXEC BROKER.DBO.'#39' + @NM_STORED_PROCEDURE + '#39' @NR_PR' +
        'OCESSO, @CD_ITEM, @VL_RECEITA OUTPUT'#39
      ''
      
        'EXEC SP_EXECUTESQL @SQL, N'#39'@NR_PROCESSO CHAR(18), @CD_ITEM CHAR(' +
        '3), @VL_RECEITA FLOAT OUTPUT'#39','
      '                   @NR_PROCESSO = @NR_PROCESSO, '
      '                   @CD_ITEM = @CD_ITEM, '
      '                   @VL_RECEITA = @VL_RECEITA OUTPUT'
      ''
      'SELECT @VL_RECEITA AS VL_RECEITA')
    Left = 561
    Top = 28
    object qryCalcReceitaVL_RECEITA: TFloatField
      FieldName = 'VL_RECEITA'
      ReadOnly = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 128
    Top = 7
    PixelsPerInch = 96
    object cxsHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxsTipoNumerario: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxsTipoPagamento: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxsTipoReceita: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxsBranco: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
  end
  object qryUsuarioV2: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'username'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT ID, gender, NAME, STATUS, USERNAME, BRANCH_ID'
      'FROM MYINDAIAV2.DBO.AUTHUSER (NOLOCK)'
      'WHERE USERNAME = :USERNAME')
    Left = 41
    Top = 124
    object qryUsuarioV2name: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qryUsuarioV2status: TBooleanField
      FieldName = 'status'
    end
    object qryUsuarioV2username: TWideStringField
      FieldName = 'username'
      Size = 255
    end
    object qryUsuarioV2id: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryUsuarioV2gender: TStringField
      FieldName = 'gender'
      Size = 255
    end
    object qryUsuarioV2branch_id: TLargeintField
      FieldName = 'branch_id'
    end
  end
  object qryUsuarioLocal: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CD_USUARIO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CD_USUARIO, '
      '             NM_USUARIO,'
      '             AP_USUARIO,'
      '             NM_EMAIL'
      'FROM BROKER.DBO.TUSUARIO (NOLOCK)'
      'WHERE (CD_USUARIO = :CD_USUARIO)'
      ' ')
    Left = 41
    Top = 172
    object qryUsuarioLocalCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryUsuarioLocalNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryUsuarioLocalAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qryUsuarioLocalNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 2000
    end
  end
  object qryClienteLocal: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CD_EMPRESA'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CD_EMPRESA, '
      '       NM_EMPRESA, '
      '       AP_EMPRESA, '
      '       CGC_EMPRESA, '
      '       CPF_EMPRESA,'
      '       4.65 AS COFINS, '
      '       CASE ISNULL(IN_ORGAO_PUBLICO, '#39'0'#39')'
      '            WHEN '#39'0'#39' THEN 1.5'
      '            WHEN '#39'1'#39' THEN 4.8'
      '            ELSE 0'
      '       END AS IR, '
      '       ISNULL(IN_ORGAO_PUBLICO, '#39'0'#39') AS ORGAOPUBLICO, '
      '       END_CIDADE, '
      '       END_UF'
      'FROM       BROKER.DBO.TEMPRESA_NAC EN (NOLOCK)'
      
        'INNER JOIN BROKER.DBO.TPROCESSO    P  (NOLOCK) ON P.CD_CLIENTE =' +
        ' EN.CD_EMPRESA'
      'WHERE EN.CD_EMPRESA = :CD_EMPRESA'
      '       OR P.NR_PROCESSO = :NR_PROCESSO')
    Left = 41
    Top = 308
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
    object qryClienteLocalCofins: TBCDField
      FieldName = 'Cofins'
      ReadOnly = True
      Precision = 3
      Size = 2
    end
    object qryClienteLocalIR: TBCDField
      FieldName = 'IR'
      ReadOnly = True
      Precision = 2
      Size = 1
    end
    object qryClienteLocalOrgaoPublico: TStringField
      FieldName = 'OrgaoPublico'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryClienteLocalEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object qryClienteLocalEND_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
  end
  object qryTipoFatura: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      'SELECT '#39'TAX_INVOICE'#39' AS CodTipo, '#39'Nota de Servi'#231'o'#39' AS NomeTipo'
      'UNION ALL'
      'SELECT '#39'TAX_RECEIPT'#39' AS CodTipo, '#39'Nota de Despesas'#39' AS NomeTipo')
    Left = 257
    Top = 52
    object qryTipoFaturaCodTipo: TStringField
      FieldName = 'CodTipo'
      ReadOnly = True
      Size = 11
    end
    object qryTipoFaturaNomeTipo: TStringField
      FieldName = 'NomeTipo'
      ReadOnly = True
      Size = 15
    end
  end
  object dsTipoFatura: TDataSource
    DataSet = qryTipoFatura
    Left = 353
    Top = 54
  end
  object qryFaturas: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    AfterOpen = qryFaturasAfterOpen
    AfterClose = qryFaturasAfterClose
    AfterPost = qryFaturasAfterPost
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CUSTOMCLEARANCE_ID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @CUSTOMCLEARANCE_ID BIGINT'
      'SET @CUSTOMCLEARANCE_ID = :CUSTOMCLEARANCE_ID'
      ''
      ''
      'SELECT DISTINCT'
      '      ISNULL(Y.BRANCH_ID_CUSTOM, 0) BRANCH_ID_CUSTOM,'
      '                B.ID,'
      '                B.AKEY, '
      '                B.COFINS,'
      '                B.CREATED,'
      '                B.DUEDATE,'
      '                B.INVOICERECEIVERTYPE,'
      '                B.IR,'
      '                B.SENIORDATENFE,'
      '                B.SENIORKEY,    '
      '               /* CASE WHEN B.TYPE = '#39'TAX_INVOICE'#39' '
      '                      AND ISNULL(B.SENIORKEY, '#39#39') <> '#39#39
      '                     THEN (SELECT NUMDFS '
      
        '                  '#9#9#9' FROM SENIOR.SAPIENS.SAPIENS.E140IDE N (NOL' +
        'OCK)'
      '                  '#9#9#9'WHERE N.CODEMP              = 1'
      '                  '#9#9#9'  AND N.CODFIL              = B.BRANCH_ID '
      '                  '#9#9#9'  AND N.NUMNFV              = B.SENIORKEY )'
      '                     ELSE NULL'
      '                END AS NUMDFS,  */'
      
        '                B.NR_NOTA AS NUMDFS,      '#9#9#9'  '#9#9'               ' +
        ' '
      '                B.STATUS,'
      '                B.TOTAL,'
      '                B.TYPE,'
      '                B.VALORTIBUTAVEL,'
      '                B.BRANCH_ID,'
      '                B.USER_ID,'
      '                B.IRRETAINED,'
      '                X.CUSTOMCLEARANCE_ID CUSTOMCLEARANCE_ID, '
      '                CC.CUSTOMID, '
      '                CC.CUSTOMER_ID, '
      '                C.aKeY AS CD_CLIENTE,'
      '                CONVERT(VARCHAR(MAX),B.OBS) OBS,'
      '                B.ISS, '
      '                BRANCH.ISS AS PERCISS,'
      '                CASE WHEN B.STATUS= '#39'INVOICED'#39' THEN '#39'ENVIADA'#39
      '                     WHEN B.STATUS= '#39'OPEN'#39'     THEN '#39'ABERTA'#39
      '                     WHEN B.STATUS= '#39'CLOSED'#39'   THEN '#39'CANCELADA'#39' '
      '                END SITUACAO,'
      '                B.USER_ID,'
      '                AU.NAME'
      
        'FROM MYINDAIAV2.DBO.BILLING                                  B  ' +
        '  (NOLOCK) '
      
        '   LEFT  JOIN MYINDAIAV2.DBO.AUTHUSER                        AU ' +
        '  (NOLOCK) ON AU.ID      = B.USER_ID   '
      
        '   INNER JOIN MYINDAIAV2.DBO.BRANCH                             ' +
        '  (NOLOCK) ON BRANCH.ID  = B.BRANCH_ID  '
      '   '
      '   OUTER APPLY ( SELECT IV.CUSTOMCLEARANCE_ID '
      
        '                   FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BIV' +
        '  (NOLOCK)  '
      
        '             INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED          IV ' +
        '  (NOLOCK) ON IV.ID      = BIV.ITENSINVOICED_ID'
      
        '             INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC ' +
        '  (NOLOCK) ON CC.ID      = IV.CUSTOMCLEARANCE_ID'
      '                  WHERE BIV.BILLING_ID       = B.ID   '
      
        '                   AND IV.CUSTOMCLEARANCE_ID = @CUSTOMCLEARANCE_' +
        'ID'
      '             ) AS X   '
      '             '
      
        '   OUTER APPLY(  SELECT CR.CUSTOMCLEARANCE_ID, CR.BRANCH_ID AS B' +
        'RANCH_ID_CUSTOM'
      
        '                   FROM MYINDAIAV2.DBO.BILLING_CASHREQUESTED BC ' +
        '  (NOLOCK)  '
      
        '             INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED         CR ' +
        '  (NOLOCK) ON CR.ID      = BC.CASHREQUESTS_ID '
      
        '             INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC ' +
        '  (NOLOCK) ON CC.ID      = CR.CUSTOMCLEARANCE_ID'
      '                  WHERE BC.BILLING_ID         = B.ID  '
      
        '                    AND CR.CUSTOMCLEARANCE_ID = @CUSTOMCLEARANCE' +
        '_ID     '
      '             ) AS Y  '
      '   '
      
        '             INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC ' +
        '  (NOLOCK) ON CC.ID      = ISNULL(X.CUSTOMCLEARANCE_ID, Y.CUSTOM' +
        'CLEARANCE_ID)'
      
        '             INNER JOIN MYINDAIAV2.DBO.CUSTOMER              C  ' +
        '  (NOLOCK) ON C.ID       = CC.CUSTOMER_ID          '
      'ORDER BY B.TYPE')
    Left = 256
    Top = 310
    object qryFaturasakey: TWideStringField
      FieldName = 'akey'
      Size = 255
    end
    object qryFaturascreated: TDateTimeField
      FieldName = 'created'
      OnChange = qryFaturascreatedChange
    end
    object qryFaturasinvoiceReceiverType: TStringField
      FieldName = 'invoiceReceiverType'
      Size = 255
    end
    object qryFaturasir: TBCDField
      FieldName = 'ir'
      OnChange = qryFaturasirChange
      Precision = 19
      Size = 2
    end
    object qryFaturasiss: TBCDField
      FieldName = 'iss'
      OnChange = qryFaturasissChange
      Precision = 19
      Size = 2
    end
    object qryFaturasPercISS: TBCDField
      FieldName = 'PercISS'
      Precision = 19
      Size = 2
    end
    object qryFaturasseniorDateNFE: TDateTimeField
      FieldName = 'seniorDateNFE'
    end
    object qryFaturasseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryFaturastotal: TBCDField
      FieldName = 'total'
      Precision = 19
      Size = 2
    end
    object qryFaturasnumdfs: TLargeintField
      DisplayLabel = 'N.'#186' Nota'
      FieldName = 'numdfs'
    end
    object qryFaturastype: TWideStringField
      FieldName = 'type'
      Size = 255
    end
    object qryFaturasvalorTibutavel: TBCDField
      FieldName = 'valorTibutavel'
      Precision = 19
      Size = 2
    end
    object qryFaturascustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object qryFaturasCD_CLIENTE: TWideStringField
      FieldName = 'CD_CLIENTE'
      Size = 255
    end
    object qryFaturasirRetained: TBooleanField
      FieldName = 'irRetained'
    end
    object qryFaturasid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryFaturasbranch_id: TLargeintField
      FieldName = 'branch_id'
    end
    object s: TLargeintField
      FieldName = 'user_id'
    end
    object qryFaturasCustomClearance_id: TLargeintField
      FieldName = 'CustomClearance_id'
    end
    object qryFaturascustomer_id: TLargeintField
      FieldName = 'customer_id'
    end
    object qryFaturascofins: TBCDField
      FieldName = 'cofins'
      OnChange = qryFaturascofinsChange
      Precision = 19
      Size = 2
    end
    object qryFaturasdueDate: TDateTimeField
      FieldName = 'dueDate'
      OnChange = qryFaturasdueDateChange
    end
    object qryFaturasobs: TMemoField
      FieldName = 'obs'
      BlobType = ftMemo
    end
    object qryFaturasstatus: TWideStringField
      FieldName = 'status'
      Size = 255
    end
    object qryFaturasSituacao: TStringField
      FieldName = 'Situacao'
      ReadOnly = True
      Size = 9
    end
    object qryFaturasuser_id_1: TLargeintField
      FieldName = 'user_id_1'
    end
    object qryFaturasname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qryFaturasBRANCH_ID_CUSTOM: TLargeintField
      FieldName = 'BRANCH_ID_CUSTOM'
    end
  end
  object dsFaturas: TDataSource
    DataSet = qryFaturas
    Left = 353
    Top = 314
  end
  object qryFaturasItens: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CUSTOM_CLEARENCE'
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @CUSTOM_CLEARENCE BIGINT'
      'SET @CUSTOM_CLEARENCE = :CUSTOM_CLEARENCE'
      ''
      ''
      'DECLARE @BILLING TABLE'
      '( BILLING_ID BIGINT'
      ')'
      ''
      '      INSERT INTO @BILLING'
      '      SELECT DISTINCT BILLING_ID'
      '      FROM'
      '      (      '
      '     SELECT BILLING_ID '
      '       FROM BILLING_ITEMINVOICED             BII (NOLOCK)'
      
        ' INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED      II  (NOLOCK)ON II.I' +
        'D = BII.ITENSINVOICED_ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE   CC  (NOLOCK)ON CC.I' +
        'D = II.CUSTOMCLEARANCE_ID'
      '    WHERE CUSTOMCLEARANCE_ID =@CUSTOM_CLEARENCE'
      '     '
      '    UNION ALL '
      '       '
      '     SELECT BILLING_ID '
      
        '       FROM CASHREQUESTED                                  CR   ' +
        '(NOLOCK)'
      
        ' INNER JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED           BC   ' +
        '(NOLOCK)ON BC.CASHREQUESTS_ID    = CR.ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED CRIR ' +
        '(NOLOCK)ON CRIR.CASHREQUESTED_ID = CR.ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               ICR  ' +
        '(NOLOCK)ON ICR.ID                = CRIR.ITEMS_ID'
      '      WHERE CUSTOMCLEARANCE_ID =@CUSTOM_CLEARENCE'
      #9'   --AND ICR.DESTINO=2'
      #9'   )FATURAS'
      #9'   '
      '/*******************/'
      ''
      ' SELECT *'
      '   FROM '
      ' ('
      'SELECT '#39'Nota de Despesas'#39' AS TIPONOTA, '
      '            FATDESP.*, '
      '            I.NAME   AS ITEM_NAME, '
      '            I.AKEY   AS ITEM_AKEY, '
      '            I.ACTIVE AS ITEM_ACTIVE'
      '     FROM ('
      '           -- Numer'#225'rio'
      '           SELECT '#39'Numer'#225'rios'#39'          AS TIPO, '
      '                  BCR.BILLING_ID        AS BILLING_ID, '
      '                  BCR.CASHREQUESTS_ID   AS PARENTID, '
      '                  CR.ID                 AS ID, '
      '                  CR.CREATED            AS CREATED,'
      '                  CR.RECEIVEDDATE       AS RECEIVEDDATE, '
      '                  CR.CASHREQUESTTOTAL   AS TOTAL, '
      '                  CR.SENIORKEY          AS SENIORKEY,'
      '                  CR.STATUS             AS STATUS, '
      '                  CR.CUSTOMCLEARANCE_ID AS CUSTOMCLEARANCE_ID,'
      '                  CR.CUSTOMER_ID        AS CUSTOMER_ID, '
      '                  ICR.ITEM_ID           AS ITEM_ID,'
      '                  ICR.PRICE             AS PRICE, '
      '                  ICR.DESTINO           AS DESTINO,'
      '                  CC.CUSTOMID           AS CUSTOMID, '
      '                  0                     AS REEMBOLSO'
      
        '           FROM MYINDAIAV2.DBO.BILLING_CASHREQUESTED           B' +
        'CR   (NOLOCK)'
      
        '     INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED                   C' +
        'R    (NOLOCK)ON CR.ID                 = BCR.CASHREQUESTS_ID'
      
        '     INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED C' +
        'RIR  (NOLOCK)ON CRIR.CASHREQUESTED_ID = CR.ID'
      
        '     INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               I' +
        'CR   (NOLOCK)ON ICR.ID                = CRIR.ITEMS_ID'
      
        '     INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 C' +
        'C    (NOLOCK)ON CC.ID                 = CR.CUSTOMCLEARANCE_ID'
      
        '          WHERE BCR.Billing_id IN (SELECT BILLING_ID FROM @BILLI' +
        'NG)     '
      '       '
      '           UNION ALL'
      '          '
      '           -- Pagamento Operacional'
      '           SELECT '#39'Pagamentos'#39'            AS TIPO, '
      #9#9'           BPR.BILLING_ID         AS BILLING_ID, '
      #9#9#9#9'   BPR.PAYMENTS_ID        AS PARENTID, '
      #9#9#9#9'   PR.ID                  AS ID, '
      #9#9#9#9'   PR.CREATED             AS CREATED, '
      #9#9#9#9'   PR.RECEIVEDDATE        AS RECEIVEDDATE,'
      '                   PR.PAYMENTTOTAL        AS TOTAL,'
      '  '#9#9#9'       PR.SENIORKEY           AS SENIORKEY, '
      #9#9#9#9'   PR.STATUS              AS STATUS, '
      #9#9#9#9'   PR.CUSTOMCLEARANCE_ID  AS CUSTOMCLEARANCE_ID, '
      #9#9#9#9'   PR.CUSTOMER_ID         AS CUSTOMER_ID, '
      #9#9#9#9'   IPR.ITEM_ID            AS ITEM_ID,'
      '                   IPR.PRICE              AS PRICE, '
      #9#9#9#9'   IPR.DESTINO            AS DESTINO,'
      #9#9#9#9'   CC.CUSTOMID            AS CUSTOMID, '
      #9#9#9#9'   ISNULL(R.PRICE,0)      AS REEMBOLSO'
      
        '           FROM MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED         ' +
        '      BPR  (NOLOCK) '
      
        '     INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED                 ' +
        '      PR   (NOLOCK) ON PR.ID                     = BPR.PAYMENTS_' +
        'ID'
      
        '     INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUE' +
        'STED  PRIR (NOLOCK) ON PRIR.PAYMENTREQUESTED_ID  = PR.ID'
      
        '     INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED             ' +
        '      IPR  (NOLOCK) ON IPR.ID                    = PRIR.ITEMS_ID'
      
        '     INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                  ' +
        '      CC   (NOLOCK) ON CC.ID                     = PR.CUSTOMCLEA' +
        'RANCE_ID'
      
        '     LEFT  JOIN MYINDAIAV2.DBO.REFUND                           ' +
        '      R    (NOLOCK) ON R.BILLING_ID              = BPR.BILLING_I' +
        'D '
      
        #9'                                                               ' +
        '                AND R.ITEMPAYMENTREQUESTED_ID = IPR.ID          ' +
        '                                                                '
      #9'WHERE BPR.Billing_id IN (SELECT BILLING_ID FROM @BILLING)'
      #9
      #9') AS FATDESP'
      #9
      
        '     INNER JOIN MYINDAIAV2.DBO.BILLING                          ' +
        '      B    (NOLOCK) ON B.ID = BILLING_ID'
      
        '     INNER JOIN MYINDAIAV2.DBO.ITEM                             ' +
        '      I    (NOLOCK) ON I.ID = FATDESP.ITEM_ID'
      '   '
      '   UNION ALL'
      '   '
      '     SELECT '#39'Nota de Servi'#231'o'#39'       AS TipoNota, '
      '            '#39'Receitas'#39'              AS Tipo, '
      #9#9#9' BII.Billing_id         AS Billing_id, '
      #9#9'     BII.itensInvoiced_id   AS ParentID,'
      '             II.ID                  AS ID, '
      #9#9#9' NULL                   AS CREATED,'
      #9#9'     NULL                   AS RECEIVEDDATE, '
      #9#9'     B.TOTAL                AS TOTAL, '
      #9#9'     NULL                   AS SENIORKEY, '
      #9#9'     NULL                   AS STATUS,'
      '             II.CUSTOMCLEARANCE_ID  AS CUSTOMCLEARANCE_ID,'
      #9#9'     NULL                   AS CUSTOMER_ID,'
      #9#9'     II.ITEM_ID             AS ITEM_ID, '
      #9#9'     II.PRICE               AS PRICE,'
      #9#9'     NULL                   AS DESTINO,CC.CUSTOMID, '
      #9#9'     0                      AS REEMBOLSO,'
      '             I.NAME                 AS ITEM_NAME, '
      #9#9'     I.AKEY                 AS ITEM_AKEY, '
      #9#9'     I.ACTIVE               AS ITEM_ACTIVE'
      '       FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK)'
      
        ' INNER JOIN MYINDAIAV2.DBO.BILLING              B   (NOLOCK) ON ' +
        'B.ID  = BII.BILLING_ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK) ON ' +
        'II.ID = BII.ITENSINVOICED_ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.ITEM                 I   (NOLOCK) ON ' +
        'I.ID  = II.ITEM_ID'
      
        ' INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK) ON ' +
        'CC.ID = II.CUSTOMCLEARANCE_ID'
      '      WHERE B.TYPE = '#39'TAX_INVOICE'#39
      '      AND BII.Billing_id IN (SELECT BILLING_ID FROM @BILLING)'
      '  '
      '  ) NOTAS'#9#9#9#9'   '
      'ORDER BY BILLING_ID, '
      '         TIPONOTA, '
      '         TIPO, '#9#9'  '
      #9#9' PARENTID, '
      #9#9' ID')
    Left = 257
    Top = 372
    object qryFaturasItensTipoNota: TStringField
      FieldName = 'TipoNota'
      ReadOnly = True
      Size = 16
    end
    object qryFaturasItensTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
    object qryFaturasItenscreated: TDateTimeField
      FieldName = 'created'
      ReadOnly = True
    end
    object qryFaturasItensreceivedDate: TDateTimeField
      FieldName = 'receivedDate'
      ReadOnly = True
    end
    object qryFaturasItensTotal: TBCDField
      FieldName = 'Total'
      ReadOnly = True
      Precision = 19
      Size = 2
    end
    object qryFaturasItensseniorKey: TWideStringField
      FieldName = 'seniorKey'
      ReadOnly = True
      Size = 255
    end
    object qryFaturasItensstatus: TStringField
      FieldName = 'status'
      ReadOnly = True
      Size = 255
    end
    object qryFaturasItensdestino: TWideStringField
      FieldName = 'destino'
      ReadOnly = True
      Size = 1
    end
    object qryFaturasItensitem_name: TWideStringField
      FieldName = 'item_name'
      ReadOnly = True
      Size = 255
    end
    object qryFaturasItensitem_aKey: TWideStringField
      FieldName = 'item_aKey'
      ReadOnly = True
      Size = 255
    end
    object qryFaturasItensitem_active: TBooleanField
      FieldName = 'item_active'
      ReadOnly = True
    end
    object qryFaturasItensBilling_id: TLargeintField
      FieldName = 'Billing_id'
      ReadOnly = True
    end
    object qryFaturasItensParentID: TLargeintField
      FieldName = 'ParentID'
      ReadOnly = True
    end
    object qryFaturasItensid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryFaturasItenscustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
      ReadOnly = True
    end
    object qryFaturasItenscustomer_id: TLargeintField
      FieldName = 'customer_id'
      ReadOnly = True
    end
    object qryFaturasItensitem_id: TLargeintField
      FieldName = 'item_id'
      ReadOnly = True
    end
    object qryFaturasItensprice: TBCDField
      FieldName = 'price'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object qryFaturasItenscustomID: TWideStringField
      FieldName = 'customID'
      ReadOnly = True
      Size = 255
    end
    object qryFaturasItensReembolso: TBCDField
      FieldName = 'Reembolso'
      ReadOnly = True
      Precision = 19
      Size = 2
    end
  end
  object dsFaturasItens: TDataSource
    DataSet = qryFaturasItens
    Left = 353
    Top = 368
  end
  object qryCustomClearance: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    AfterOpen = qryCustomClearanceAfterOpen
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'customID'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = ''
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.DBO.CUSTOMCLEARANCE (NOLOCK)'
      'WHERE CUSTOMID = :CUSTOMID')
    Left = 137
    Top = 124
    object qryCustomClearanceaKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object qryCustomClearancecustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object qryCustomClearanceid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryCustomClearancebalance_id: TLargeintField
      FieldName = 'balance_id'
    end
    object qryCustomClearancecustomer_id: TLargeintField
      FieldName = 'customer_id'
    end
    object qryCustomClearanceservice_id: TLargeintField
      FieldName = 'service_id'
    end
  end
  object qryUnidadeV2: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.DBO.BRANCH (NOLOCK)')
    Left = 41
    Top = 372
    object qryUnidadeV2aKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object qryUnidadeV2name: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qryUnidadeV2seniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryUnidadeV2id: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryUnidadeV2taxID: TWideStringField
      FieldName = 'taxID'
      Size = 255
    end
    object qryUnidadeV2organization_id: TLargeintField
      FieldName = 'organization_id'
    end
  end
  object dsUnidadeV2: TDataSource
    DataSet = qryUnidadeV2
    Left = 137
    Top = 371
  end
  object qryItensV2: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'customClearance_id'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = '0'
      end
      item
        Name = 'type'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = ''
      end>
    SQL.Strings = (
      ''
      'DECLARE @ID_PROCESSO BIGINT '
      'SET @ID_PROCESSO = :CUSTOMCLEARANCE_ID'
      ''
      ';WITH CTE AS('
      'SELECT I.ITEM_ID '
      '  FROM CASHREQUESTED                   CR  (NOLOCK)'
      
        '  JOIN CASHREQUESTED_ITEMCASHREQUESTED CRI (NOLOCK) ON CRI.CASHR' +
        'EQUESTED_ID = CR.ID'
      
        '  JOIN ITEMCASHREQUESTED               I   (NOLOCK) ON I.ID = CR' +
        'I.ITEMS_ID'
      '  WHERE CR.STATUS <> '#39'CANCELED'#39
      '  AND CR.CUSTOMCLEARANCE_ID = @ID_PROCESSO'
      '  AND (SELECT BCR.CASHREQUESTS_ID'
      '         FROM BILLING_CASHREQUESTED BCR'
      '         JOIN BILLING B ON B.ID = BCR.BILLING_ID'
      
        '         WHERE BCR.CASHREQUESTS_ID = CR.ID) IS NULL /*N'#195'O PEGA O' +
        'S ITENS J'#193' FATURADOS*/'
      '              '
      '  UNION '
      'SELECT I.ITEM_ID '
      '  FROM PAYMENTREQUESTED                      PR  (NOLOCK)'
      
        '  JOIN PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRI (NOLOCK) ON PRI' +
        '.PAYMENTREQUESTED_ID = PR.ID'
      
        '  JOIN ITEMPAYMENTREQUESTED                  I   (NOLOCK) ON I.I' +
        'D = PRI.ITEMS_ID'
      '  WHERE PR.STATUS <> '#39'CANCELED'#39'                       '
      '  AND PR.CUSTOMCLEARANCE_ID = @ID_PROCESSO'
      '  AND PR.BILLING_ID IS NULL /*N'#195'O PEGA OS ITENS J'#193' FATURADOS*/'
      ')'
      ''
      'SELECT I.*'
      'FROM BROKER.DBO.TPROCESSO                       P  (NOLOCK)'
      
        '   INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE    CC (NOLOCK)ON CC' +
        '.CUSTOMID = P.NR_PROCESSO'
      
        '   INNER JOIN MYINDAIAV2.DBO.PRODUCT            PR (NOLOCK)ON PR' +
        '.AKEY     = P.CD_PRODUTO'
      
        '   INNER JOIN MYINDAIAV2.DBO.ITEM               I  (NOLOCK)ON I.' +
        'PRODUCTITEM IN (0, PR.ID)'
      'WHERE CC.ID    = @ID_PROCESSO'
      '  AND ('
      
        '      ( I.TYPE = :TYPE  AND TAXABLE = (CASE WHEN TYPE ='#39'R'#39' THEN ' +
        '1 ELSE 0 END))'
      '    OR (I.ID IN (SELECT ITEM_ID FROM CTE))'
      '      )'
      '       '
      '       ')
    Left = 40
    Top = 444
    object qryItensV2aKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object qryItensV2active: TBooleanField
      FieldName = 'active'
    end
    object qryItensV2name: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'name'
      Size = 255
    end
    object qryItensV2seniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryItensV2type: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 15
      FieldName = 'type'
      Size = 5
    end
    object qryItensV2productItem: TIntegerField
      FieldName = 'productItem'
    end
    object qryItensV2id: TLargeintField
      DisplayLabel = 'Cod.'
      DisplayWidth = 15
      FieldName = 'id'
      ReadOnly = True
    end
    object qryItensV2taxable: TBooleanField
      FieldName = 'taxable'
    end
    object qryItensV2ContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      Size = 255
    end
    object qryItensV2ContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
  end
  object dsItensReceita: TDataSource
    DataSet = qryItensV2
    Left = 137
    Top = 443
  end
  object dsItensNota: TDataSource
    DataSet = cdsItensNota
    Left = 457
    Top = 88
  end
  object qryItensFaturaEnvio: TADOQuery
    Connection = Connection
    CursorType = ctStatic
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
      'SELECT *'
      'FROM (-- Itens de Numerario'
      '      SELECT BCR.Billing_id, '
      '             '#39'Numer'#225'rios'#39' AS TIPO, '
      '             CRICR.CASHREQUESTED_ID AS ID, '
      '             IR.DESTINO, '
      '             IR.PRICE, '
      '             IR.ITEM_ID, '
      '             I.AKEY, '
      '             I.NAME, '
      '             I.SENIORKEY, '
      '             I.TYPE'
      
        '        FROM MYINDAIAV2.DBO.BILLING_CASHREQUESTED               ' +
        '   BCR  (NOLOCK)'
      
        '         INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED                ' +
        '   CR   (NOLOCK) ON CR.ID                  = BCR.CASHREQUESTS_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUEST' +
        'ED CRICR(NOLOCK) ON CRICR.CASHREQUESTED_ID = CR.ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED            ' +
        '   IR   (NOLOCK) ON IR.ID                  = CRICR.ITEMS_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM                         ' +
        '   I    (NOLOCK) ON I.ID                   = IR.ITEM_ID'
      '         WHERE BCR.Billing_id = @IDFATURA'
      '         '
      '      UNION ALL'
      '      '
      '      -- Itens de Pagamento'
      '      SELECT BPR.Billing_id, '
      '             '#39'Pagamentos'#39' AS TIPO, '
      '             PR.ID, '
      '             NULL AS DESTINO, '
      '             IPR.PRICE,'
      '             IPR.ITEM_ID, '
      '             I.AKEY, '
      '             I.NAME, '
      '             I.SENIORKEY, '
      '             I.TYPE'
      
        '        FROM MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED            ' +
        '         BPR  (NOLOCK)'
      
        '         INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED             ' +
        '         PR   (NOLOCK) ON PR.ID                     = BPR.PAYMEN' +
        'TS_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTR' +
        'EQUESTED PRIPR(NOLOCK) ON PRIPR.PAYMENTREQUESTED_ID = BPR.PAYMEN' +
        'TS_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED         ' +
        '         IPR  (NOLOCK) ON IPR.ID                    = PRIPR.ITEM' +
        'S_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM                         ' +
        '         I    (NOLOCK) ON I.ID                      = IPR.ITEM_I' +
        'D'
      '         WHERE BPR.Billing_id = @IDFATURA'
      '   '
      '      UNION ALL'
      '     '
      '      -- Itens de Receita'
      '      SELECT BII.Billing_id, '
      '             '#39'Receitas'#39'  AS TIPO, '
      '             II.ID, '
      '             NULL AS DESTINO, '
      '             II.PRICE, '
      '             II.ITEM_ID, '
      '             I.AKEY, '
      '             I.NAME AS ITEM_NAME, '
      '             I.SENIORKEY,'
      '              I.TYPE'
      '        FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII  (NOLOCK)'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED  II   (NOLOCK)ON' +
        ' II.ID = BII.ITENSINVOICED_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM          I    (NOLOCK)ON' +
        ' I.ID  = II.ITEM_ID'
      '         WHERE BII.Billing_id = @IDFATURA'
      '         '
      '      ) AS FAT'
      '/*WHERE BILLING_ID = @IDFATURA*/')
    Left = 256
    Top = 440
    object qryItensFaturaEnvioTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Size = 10
    end
    object qryItensFaturaEnviodestino: TWideStringField
      FieldName = 'destino'
      ReadOnly = True
      Size = 1
    end
    object qryItensFaturaEnvioprice: TBCDField
      FieldName = 'price'
      ReadOnly = True
      Precision = 19
      Size = 2
    end
    object qryItensFaturaEnvioaKey: TWideStringField
      FieldName = 'aKey'
      ReadOnly = True
      Size = 255
    end
    object qryItensFaturaEnvioname: TWideStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 255
    end
    object qryItensFaturaEnvioseniorKey: TWideStringField
      FieldName = 'seniorKey'
      ReadOnly = True
      Size = 255
    end
    object qryItensFaturaEnviotype: TStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 1
    end
    object qryItensFaturaEnvioBilling_id: TLargeintField
      FieldName = 'Billing_id'
      ReadOnly = True
    end
    object qryItensFaturaEnvioid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryItensFaturaEnvioitem_id: TLargeintField
      FieldName = 'item_id'
      ReadOnly = True
    end
  end
  object qryClienteEnvio: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CD_CLIENTE'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = '00002'
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.DBO.CUSTOMER (NOLOCK)'
      'WHERE AKEY = :CD_CLIENTE')
    Left = 352
    Top = 440
    object qryClienteEnviocity: TWideStringField
      FieldName = 'city'
      Size = 255
    end
    object qryClienteEnvionumber: TWideStringField
      FieldName = 'number'
      Size = 255
    end
    object qryClienteEnviostate: TWideStringField
      FieldName = 'state'
      Size = 255
    end
    object qryClienteEnviostreet: TWideStringField
      FieldName = 'street'
      Size = 255
    end
    object qryClienteEnviozipCode: TWideStringField
      FieldName = 'zipCode'
      Size = 255
    end
    object qryClienteEnvioname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qryClienteEnviotaxID: TWideStringField
      FieldName = 'taxID'
      Size = 255
    end
    object qryClienteEnvioneighborhood: TWideStringField
      FieldName = 'neighborhood'
      Size = 255
    end
    object qryClienteEnviofax: TWideStringField
      FieldName = 'fax'
      Size = 255
    end
    object qryClienteEnviofone: TWideStringField
      FieldName = 'fone'
      Size = 255
    end
    object qryClienteEnvioinscEstadual: TWideStringField
      FieldName = 'inscEstadual'
      Size = 255
    end
    object qryClienteEnvioinscMunicipal: TWideStringField
      FieldName = 'inscMunicipal'
      Size = 255
    end
    object qryClienteEnviotype: TWideStringField
      FieldName = 'type'
      Size = 255
    end
    object qryClienteEnvioseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryClienteEnvioid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryClienteEnvioaKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object qryClienteEnvioactive: TBooleanField
      FieldName = 'active'
    end
    object qryClienteEnvioCountry_id: TLargeintField
      FieldName = 'Country_id'
    end
    object qryClienteEnviodefinitions_id: TLargeintField
      FieldName = 'definitions_id'
    end
    object qryClienteEnviogroup_id: TLargeintField
      FieldName = 'group_id'
    end
  end
  object qryUnidadeEnvio: TADOQuery
    Connection = Connection
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
      '       U.END_UF,'
      '       B.ID, '
      '       B.SENIORKEY'
      'FROM BROKER.DBO.TUNID_NEG           U (NOLOCK)'
      
        '   INNER JOIN MYINDAIAV2.DBO.BRANCH B (NOLOCK) ON B.AKEY = U.CD_' +
        'UNID_NEG'
      'WHERE ID = :ID_UNIDADE')
    Left = 248
    Top = 504
    object qryUnidadeEnvioCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryUnidadeEnvioNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryUnidadeEnvioAP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      FixedChar = True
      Size = 10
    end
    object qryUnidadeEnvioCGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qryUnidadeEnvioEND_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryUnidadeEnvioEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qryUnidadeEnvioEND_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
    end
    object qryUnidadeEnvioEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qryUnidadeEnvioEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qryUnidadeEnvioEND_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qryUnidadeEnvioseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryUnidadeEnvioid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object qryCustomerProfile: TADOQuery
    Connection = Connection
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
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.DBO.CUSTOMERPROFILE (NOLOCK)'
      'WHERE ID = :CP_ID')
    Left = 352
    Top = 504
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
    object qryCustomerProfileid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryCustomerProfilelimitValue: TBCDField
      FieldName = 'limitValue'
      Precision = 18
      Size = 0
    end
    object qryCustomerProfileproduct_id: TLargeintField
      FieldName = 'product_id'
    end
  end
  object qryItensFaturar: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 120
    Parameters = <
      item
        Name = 'customClearance_id'
        DataType = ftLargeint
        Precision = 19
        Size = 19
        Value = Null
      end
      item
        Name = 'Tipo'
        DataType = ftSmallint
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'DECLARE @CUSTOMCLEARANCE_ID BIGINT'
      'SET @CUSTOMCLEARANCE_ID = :CUSTOMCLEARANCE_ID'
      ''
      'DECLARE @TIPO INTEGER'
      'SET @TIPO =:TIPO'
      ''
      ''
      'SELECT P.*'
      'FROM ('
      '       SELECT '#39'Numer'#225'rios'#39' AS TIPO, '
      '               CR.CUSTOMCLEARANCE_ID,'
      '               CC.CUSTOMID,'
      '               CR.ID AS PARENTID,'
      '               ICR.ID, '
      '               CR.CREATED, '
      '               CR.RECEIVEDDATE,'
      '               CR.SENIORKEY,'
      '               CASE WHEN ICR.DESTINO=1'
      '                    THEN ICR.PRICE '
      '                    ELSE 0 '
      '               END AS VALOR_ITEM,'
      '               CR.CASHREQUESTTOTAL AS VALOR,'
      '               CASE WHEN ICR.DESTINO=1 '
      '                    THEN 0 '
      '                    ELSE ICR.PRICE '
      '               END AS VALOR_CLIENTE, '
      '               CR.STATUS,  '
      '               CR.USER_ID, '
      '               ICR.ITEM_ID AS ITEM_ID, '
      '               I.AKEY AS CD_ITEM, '
      '               NULL AS CD_CALCULO,'
      '               NULL AS NM_CALCULO, '
      '               NULL AS NM_STORED_PROCEDURE,'
      '               NULL CONTAFINANCEIRAIMP,'
      '               NULL CONTAFINANCEIRAEXP,'
      '               I.NAME ITEM_NAME,'
      '               ICR.DESTINO'
      
        '      FROM MYINDAIAV2.DBO.CASHREQUESTED                         ' +
        '   CR   (NOLOCK)'
      
        '         INNER JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUEST' +
        'ED CRIR (NOLOCK)ON CRIR.CASHREQUESTED_ID = CR.ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED            ' +
        '   ICR  (NOLOCK)ON ICR.ID                = CRIR.ITEMS_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM                         ' +
        '   I    (NOLOCK)ON I.ID                  = ICR.ITEM_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE              ' +
        '   CC   (NOLOCK)ON CC.ID                 = CR.CUSTOMCLEARANCE_ID'
      '         OUTER APPLY (SELECT BCR.CASHREQUESTS_ID'
      
        '                            FROM MYINDAIAV2.DBO.BILLING         ' +
        '      B   (NOLOCK)'
      
        '                      INNER JOIN MYINDAIAV2.DBO.BILLING_CASHREQU' +
        'ESTED BCR (NOLOCK) ON BCR.BILLING_ID = B.ID'
      '                          WHERE STATUS <> '#39'CLOSED'#39
      '                            AND BCR.CASHREQUESTS_ID = CR.ID) D'
      '        WHERE D.CASHREQUESTS_ID IS NULL     '
      
        '          AND CR.CUSTOMCLEARANCE_ID = @CUSTOMCLEARANCE_ID       ' +
        '        '
      ''
      '      UNION ALL'
      '      '
      '      SELECT '#39'Pagamentos'#39' AS TIPO, '
      '             PR.CUSTOMCLEARANCE_ID,'
      '             CC.CUSTOMID, '
      '             PR.ID AS PARENTID, '
      '             IPR.ID, '
      '             PR.CREATED, '
      '             PR.RECEIVEDDATE, '
      '             PR.SENIORKEY,'
      '             IPR.PRICE AS VALOR_ITEM, '
      '             PR.PAYMENTTOTAL AS VALOR,'
      '             0 VALOR_CLIENTE, '
      '             PR.STATUS, '
      '             PR.USER_ID, '
      '             IPR.ITEM_ID AS ITEM_ID, '
      '             I.AKEY AS CD_ITEM,'
      '             NULL AS CD_CALCULO, '
      '             NULL AS NM_CALCULO,'
      '             NULL AS NM_STORED_PROCEDURE,'
      '             NULL CONTAFINANCEIRAIMP,'
      '             NULL CONTAFINANCEIRAEXP,'
      '             I.NAME ITEM_NAME,'
      '             IPR.DESTINO'
      
        '      FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                      ' +
        '         PR   (NOLOCK)'
      
        '         INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTR' +
        'EQUESTED PRIR (NOLOCK)ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED         ' +
        '         IPR  (NOLOCK)ON IPR.ID                   = PRIR.ITEMS_I' +
        'D'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM                         ' +
        '         I    (NOLOCK)ON I.ID                     = IPR.ITEM_ID'
      
        '         INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE              ' +
        '         CC   (NOLOCK)ON CC.ID                    = PR.CUSTOMCLE' +
        'ARANCE_ID'
      '         OUTER APPLY(SELECT BPR.PAYMENTS_ID'
      
        '                            FROM MYINDAIAV2.DBO.BILLING         ' +
        '         B    (NOLOCK)'
      
        '                      INNER JOIN MYINDAIAV2.DBO.BILLING_PAYMENTR' +
        'EQUESTED BPR  (NOLOCK)ON BPR.BILLING_ID = B.ID'
      '                          WHERE STATUS <> '#39'CLOSED'#39
      '                            AND BPR.PAYMENTS_ID = PR.ID) D  '
      '        WHERE D.PAYMENTS_ID IS NULL     '
      '          AND PR.CUSTOMCLEARANCE_ID = @CUSTOMCLEARANCE_ID'
      '     '
      '      UNION ALL'
      '      '
      '      SELECT  '#39'Receitas'#39' AS TIPO,'
      '               CC.ID AS CUSTOMCLEARANCE_ID,'
      '               CC.CUSTOMID , '
      '               0 AS PARENTID, '
      '               0 AS ID,'
      '               GETDATE() AS CREATED, '
      '               NULL AS RECEIVEDDATE, '
      '               NULL AS SENIORKEY,'
      '               0 AS VALOR_ITEM, '
      '               0 AS VALOR,'
      '               0 VALOR_CLIENTE, '
      '               '#39#39' AS STATUS, '
      '               NULL AS USER_ID, '
      '               I.ID AS ITEM_ID, '
      '               CF.CD_ITEM,'
      '               C.CD_CALCULO, '
      '               C.NM_CALCULO,'
      '               C.NM_STORED_PROCEDURE,'
      '               I.CONTAFINANCEIRAIMP,'
      '               I.CONTAFINANCEIRAEXP,'
      '               I.NAME ITEM_NAME,'
      '               1 DESTINO'
      
        '      FROM BROKER.DBO.TPROCESSO                        P  (NOLOC' +
        'K)'
      
        '         INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE     CC (NOLOC' +
        'K)ON CC.CUSTOMID    = P.NR_PROCESSO'
      
        '         INNER JOIN BROKER.DBO.TCLIENTE_FATURAMENTO    CF (NOLOC' +
        'K)ON CF.CD_UNID_NEG = P.CD_UNID_NEG'
      
        '                                                                ' +
        ' AND CF.CD_PRODUTO  = P.CD_PRODUTO'
      
        '                                                                ' +
        ' AND CF.CD_CLIENTE  = P.CD_CLIENTE'
      
        '                                                                ' +
        ' AND CF.CD_SERVICO  = P.CD_SERVICO'
      
        '         INNER JOIN MYINDAIAV2.DBO.PRODUCT             PR (NOLOC' +
        'K)ON PR.AKEY        = P.CD_PRODUTO'
      
        '         INNER JOIN MYINDAIAV2.DBO.ITEM                I  (NOLOC' +
        'K)ON I.AKEY         = CF.CD_ITEM'
      
        '                                                                ' +
        ' AND I.PRODUCTITEM IN (0, PR.ID)'
      
        '         LEFT  JOIN BROKER.DBO.TCALCULO                C  (NOLOC' +
        'K)ON CF.TP_CALCULO  = C.CD_CALCULO'
      '    WHERE TAXABLE=1'
      '      AND CC.ID  = @CUSTOMCLEARANCE_ID'
      ''
      ') AS P'
      'WHERE  ((STATUS IN ('#39'APPROVED'#39')) OR TIPO = '#39'Receitas'#39')'
      '  AND ( ( @TIPO = 0 AND TIPO IN ('#39'Receitas'#39','#39'Numer'#225'rios'#39')) '
      '     OR ( @TIPO = 1 AND TIPO <> '#39'Receitas'#39')'
      '     OR ( @TIPO = 2))'
      '  '
      '--ORDER BY TIPO,PARENTID, ID')
    Left = 465
    Top = 172
    object qryItensFaturarTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qryItensFaturarcreated: TDateTimeField
      FieldName = 'created'
    end
    object qryItensFaturarreceivedDate: TDateTimeField
      FieldName = 'receivedDate'
    end
    object qryItensFaturarseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object qryItensFaturarValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
      Size = 2
    end
    object qryItensFaturarstatus: TStringField
      FieldName = 'status'
      Size = 255
    end
    object qryItensFaturarCD_ITEM: TWideStringField
      FieldName = 'CD_ITEM'
      Size = 255
    end
    object qryItensFaturarCD_CALCULO: TStringField
      FieldName = 'CD_CALCULO'
      FixedChar = True
      Size = 3
    end
    object qryItensFaturarNM_CALCULO: TStringField
      FieldName = 'NM_CALCULO'
      Size = 40
    end
    object qryItensFaturarNM_STORED_PROCEDURE: TStringField
      FieldName = 'NM_STORED_PROCEDURE'
      Size = 30
    end
    object qryItensFaturarCalcValor: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcValor'
      Calculated = True
    end
    object qryItensFaturarValor_Item: TBCDField
      FieldName = 'Valor_Item'
      Precision = 19
      Size = 2
    end
    object qryItensFaturarContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      Size = 255
    end
    object qryItensFaturarContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
    object qryItensFaturarparentID: TLargeintField
      FieldName = 'parentID'
    end
    object qryItensFaturarid: TLargeintField
      FieldName = 'id'
    end
    object qryItensFaturaruser_id: TLargeintField
      FieldName = 'user_id'
    end
    object qryItensFaturaritem_id: TLargeintField
      FieldName = 'item_id'
    end
    object qryItensFaturarcustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
    end
    object qryItensFaturarcustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object qryItensFaturarValor_Cliente: TBCDField
      FieldName = 'Valor_Cliente'
      Precision = 19
      Size = 2
    end
    object qryItensFaturaritem_name: TWideStringField
      FieldName = 'item_name'
      ReadOnly = True
      Size = 255
    end
    object qryItensFaturardestino: TIntegerField
      FieldName = 'destino'
    end
  end
  object dsItensFaturar: TDataSource
    DataSet = cdsItensFaturar
    Left = 553
    Top = 232
  end
  object cdsItensFaturar: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'created'
        DataType = ftDateTime
      end
      item
        Name = 'receivedDate'
        DataType = ftDateTime
      end
      item
        Name = 'seniorKey'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Valor'
        DataType = ftBCD
        Precision = 19
        Size = 2
      end
      item
        Name = 'status'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CD_ITEM'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'CD_CALCULO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NM_CALCULO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NM_STORED_PROCEDURE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CalcValor'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'Valor_Item'
        DataType = ftBCD
        Precision = 19
        Size = 2
      end
      item
        Name = 'ContaFinanceiraImp'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ContaFinanceiraExp'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'parentID'
        DataType = ftLargeint
      end
      item
        Name = 'id'
        DataType = ftLargeint
      end
      item
        Name = 'user_id'
        DataType = ftLargeint
      end
      item
        Name = 'item_id'
        DataType = ftLargeint
      end
      item
        Name = 'customClearance_id'
        DataType = ftLargeint
      end
      item
        Name = 'customID'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'Valor_Cliente'
        DataType = ftBCD
        Precision = 19
        Size = 2
      end
      item
        Name = 'item_name'
        Attributes = [faReadonly]
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'destino'
        Attributes = [faReadonly]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftLargeint
        Precision = 19
        Name = 'customClearance_id'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftInteger
        Precision = 10
        Name = 'Tipo'
        ParamType = ptInput
        Size = 4
        Value = 0
      end>
    ProviderName = 'dspItensFaturar'
    StoreDefs = True
    BeforeInsert = cdsItensFaturarBeforeInsert
    AfterInsert = cdsItensFaturarAfterInsert
    AfterScroll = cdsItensFaturarAfterScroll
    OnCalcFields = cdsItensFaturarCalcFields
    OnNewRecord = cdsItensFaturarNewRecord
    Left = 552
    Top = 171
    object cdsItensFaturarItemFixo: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'ItemFixo'
    end
    object cdsItensFaturarSelecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'Selecionado'
      OnChange = cdsItensFaturarSelecionadoChange
    end
    object cdsItensFaturarTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsItensFaturarstatus: TStringField
      FieldName = 'status'
      Size = 255
    end
    object cdsItensFaturarValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
      Size = 2
    end
    object cdsItensFaturarValorSelecionado: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ValorSelecionado'
    end
    object cdsItensFaturarcreated: TDateTimeField
      FieldName = 'created'
    end
    object cdsItensFaturarreceivedDate: TDateTimeField
      FieldName = 'receivedDate'
    end
    object cdsItensFaturarseniorKey: TWideStringField
      FieldName = 'seniorKey'
      Size = 255
    end
    object cdsItensFaturarCD_ITEM: TWideStringField
      FieldName = 'CD_ITEM'
      Size = 255
    end
    object cdsItensFaturarCD_CALCULO: TStringField
      FieldName = 'CD_CALCULO'
      FixedChar = True
      Size = 3
    end
    object cdsItensFaturarNM_CALCULO: TStringField
      FieldName = 'NM_CALCULO'
      Size = 40
    end
    object cdsItensFaturarNM_STORED_PROCEDURE: TStringField
      FieldName = 'NM_STORED_PROCEDURE'
      Size = 30
    end
    object cdsItensFaturarCalcValor: TFloatField
      FieldName = 'CalcValor'
      ReadOnly = True
    end
    object cdsItensFaturarValor_Item: TBCDField
      FieldName = 'Valor_Item'
      Precision = 19
      Size = 2
    end
    object cdsItensFaturarValor_Cliente: TBCDField
      FieldName = 'Valor_Cliente'
      Precision = 19
      Size = 2
    end
    object cdsItensFaturarContaFinanceiraImp: TWideStringField
      FieldName = 'ContaFinanceiraImp'
      Size = 255
    end
    object cdsItensFaturarContaFinanceiraExp: TWideStringField
      FieldName = 'ContaFinanceiraExp'
      Size = 255
    end
    object cdsItensFaturarparentID: TLargeintField
      FieldName = 'parentID'
    end
    object cdsItensFaturarid: TLargeintField
      FieldName = 'id'
    end
    object cdsItensFaturaruser_id: TLargeintField
      FieldName = 'user_id'
    end
    object cdsItensFaturaritem_id: TLargeintField
      FieldName = 'item_id'
    end
    object cdsItensFaturarcustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
    end
    object cdsItensFaturarcustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object cdsItensFaturaritem_name: TWideStringField
      FieldName = 'item_name'
      ReadOnly = True
      Size = 255
    end
    object cdsItensFaturardestino: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'destino'
    end
  end
  object dspItensFaturar: TDataSetProvider
    DataSet = qryItensFaturar
    Left = 464
    Top = 232
  end
  object cdsItensNota: TClientDataSet
    PersistDataPacket.Data = {
      8F0100009619E0BD01000000180000000E0000000000030000008F0104546970
      6F0100490000000100055749445448020002000A000673746174757302004900
      0000010005574944544802000200FF000F56616C6F724E756D65726172696F73
      08000400000000000F56616C6F72506167616D656E746F730800040000000000
      0D56616C6F725265636569746173080004000000000008637573746F6D494401
      00490000000100055749445448020002001E0012437573746F6D436C65617261
      6E63655F696401004900000001000557494454480200020014000D56616C6F72
      5F436C69656E74650C0005000000020008444543494D414C5302000200020005
      574944544802000200130008706172656E744944080001000000000002696408
      000100000000000556616C6F720C0005000000020008444543494D414C530200
      02000200055749445448020002001300076974656D5F69640800010000000000
      096974656D5F6E616D6502004A000000010005574944544802000200FE010A56
      616C6F72546F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'status'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ValorNumerarios'
        DataType = ftFloat
      end
      item
        Name = 'ValorPagamentos'
        DataType = ftFloat
      end
      item
        Name = 'ValorReceitas'
        DataType = ftFloat
      end
      item
        Name = 'customID'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CustomClearance_id'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Valor_Cliente'
        DataType = ftBCD
        Precision = 19
        Size = 2
      end
      item
        Name = 'parentID'
        DataType = ftLargeint
      end
      item
        Name = 'id'
        DataType = ftLargeint
      end
      item
        Name = 'Valor'
        DataType = ftBCD
        Precision = 19
        Size = 2
      end
      item
        Name = 'item_id'
        DataType = ftLargeint
      end
      item
        Name = 'item_name'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ValorTotal'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 456
    Top = 24
    object cdsItensNotaTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object cdsItensNotastatus: TStringField
      FieldName = 'status'
      Size = 255
    end
    object cdsItensNotaValorNumerarios: TFloatField
      FieldName = 'ValorNumerarios'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object cdsItensNotaValorPagamentos: TFloatField
      FieldName = 'ValorPagamentos'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object cdsItensNotaValorReceitas: TFloatField
      FieldName = 'ValorReceitas'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object cdsItensNotacustomID: TStringField
      FieldName = 'customID'
      Size = 30
    end
    object cdsItensNotaCustomClearance_id: TStringField
      FieldName = 'CustomClearance_id'
    end
    object cdsItensNotaValor_Cliente: TBCDField
      FieldName = 'Valor_Cliente'
      Precision = 19
      Size = 2
    end
    object cdsItensNotaparentID: TLargeintField
      FieldName = 'parentID'
    end
    object cdsItensNotaid: TLargeintField
      FieldName = 'id'
    end
    object cdsItensNotaValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
      Size = 2
    end
    object cdsItensNotaitem_id: TLargeintField
      FieldName = 'item_id'
    end
    object cdsItensNotaitem_name: TWideStringField
      FieldName = 'item_name'
      Size = 255
    end
    object cdsItensNotaValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
  end
  object dsClienteLocal: TDataSource
    DataSet = qryClienteLocal
    Left = 136
    Top = 312
  end
  object qryProcessoLocal: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  P.CD_AGENTE,A.NR_CGC_AGENTE'
      'FROM BROKER.DBO.TPROCESSO     P (NOLOCK)'
      
        'INNER JOIN BROKER.DBO.TAGENTE A (NOLOCK)ON A.CD_AGENTE = P.CD_AG' +
        'ENTE'
      'WHERE NR_PROCESSO= :PROCESSO')
    Left = 40
    Top = 504
    object qryProcessoLocalCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qryProcessoLocalNR_CGC_AGENTE: TStringField
      FieldName = 'NR_CGC_AGENTE'
      FixedChar = True
      Size = 14
    end
  end
  object dsProcessoLocal: TDataSource
    DataSet = qryClienteLocal
    Left = 136
    Top = 504
  end
  object qryProcessoV2: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM MYINDAIAV2.DBO.CUSTOMCLEARANCE (NOLOCK)')
    Left = 40
    Top = 248
    object qryProcessoV2id: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryProcessoV2aKey: TWideStringField
      FieldName = 'aKey'
      Size = 255
    end
    object qryProcessoV2customID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object qryProcessoV2balance_id: TLargeintField
      FieldName = 'balance_id'
    end
    object qryProcessoV2customer_id: TLargeintField
      FieldName = 'customer_id'
    end
    object qryProcessoV2service_id: TLargeintField
      FieldName = 'service_id'
    end
  end
  object dsProcessoV2: TDataSource
    DataSet = qryProcessoV2
    Left = 136
    Top = 248
  end
  object qryExecuta: TADOQuery
    Connection = Connection
    CommandTimeout = 60
    Parameters = <>
    Left = 137
    Top = 68
  end
  object qryReembolso: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'billing_id'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DISTINCT IPR.PRICE VALOR,'
      '                B.DUEDATE DATAVENCIMENTOFAT,'
      '                PR.CREATED  DATAPAGAMENTO,'
      '                P.CD_GRUPO GRUPO,'
      '                DATEDIFF(DAY,PR.CREATED,B.DUEDATE) DIAS,'
      '                BROKER.DBO.FN_JUROS_REEMBOLSO(PR.CREATED,'
      '                B.DUEDATE,'
      '                IPR.PRICE,P.CD_GRUPO) REEMBOLSO,'
      '                IPR.ID ITEMPAYMENTREQUESTED_ID,'
      '                B.ID BILLING_ID,BPR.PAYMENTS_ID,'
      '                PRIR.ITEMS_ID ,'
      '                PR.ID'
      
        'FROM MYINDAIAV2.DBO.BILLING                                     ' +
        'B   (NOLOCK)'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED                  ' +
        'BII (NOLOCK) ON BII.BILLING_ID           = B.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED              ' +
        'BPR (NOLOCK) ON BPR.BILLING_ID           = B.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED                      ' +
        'PR  (NOLOCK) ON PR.ID                    = BPR.PAYMENTS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED ' +
        'PRIR(NOLOCK) ON PRIR.PAYMENTREQUESTED_ID = PR.ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  ' +
        'IPR (NOLOCK) ON IPR.ID                   = PRIR.ITEMS_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED                          ' +
        'II  (NOLOCK) ON II.ID                    = BII.ITENSINVOICED_ID'
      
        'INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                       ' +
        'CC  (NOLOCK) ON CC.ID                    = II.CUSTOMCLEARANCE_ID'
      
        'INNER JOIN BROKER.DBO.TPROCESSO                                 ' +
        'P   (NOLOCK) ON P.NR_PROCESSO            = CC.CUSTOMID'
      'WHERE B.ID= :BILLING_ID')
    Left = 464
    Top = 304
    object qryReembolsoValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
      Size = 2
    end
    object qryReembolsoDataVencimentoFat: TDateTimeField
      FieldName = 'DataVencimentoFat'
    end
    object qryReembolsoDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
    end
    object qryReembolsoGrupo: TStringField
      FieldName = 'Grupo'
      FixedChar = True
      Size = 3
    end
    object qryReembolsoDias: TIntegerField
      FieldName = 'Dias'
      ReadOnly = True
    end
    object qryReembolsoReembolso: TFloatField
      FieldName = 'Reembolso'
      ReadOnly = True
    end
    object qryReembolsoBilling_id: TLargeintField
      FieldName = 'Billing_id'
      ReadOnly = True
    end
    object qryReembolsoItemPaymentRequested_id: TLargeintField
      FieldName = 'ItemPaymentRequested_id'
      ReadOnly = True
    end
  end
  object dspReembolso: TDataSetProvider
    DataSet = qryReembolso
    Left = 552
    Top = 368
  end
  object cdsReembolso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReembolso'
    Left = 464
    Top = 368
    object cdsReembolsoValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
      Size = 2
    end
    object cdsReembolsoDataVencimentoFat: TDateTimeField
      FieldName = 'DataVencimentoFat'
    end
    object cdsReembolsoDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
    end
    object cdsReembolsoGrupo: TStringField
      FieldName = 'Grupo'
      FixedChar = True
      Size = 3
    end
    object cdsReembolsoDias: TIntegerField
      FieldName = 'Dias'
      ReadOnly = True
    end
    object cdsReembolsoReembolso: TFloatField
      FieldName = 'Reembolso'
      ReadOnly = True
    end
    object cdsReembolsoBilling_id: TLargeintField
      FieldName = 'Billing_id'
      ReadOnly = True
    end
    object cdsReembolsoItemPaymentRequested_id: TLargeintField
      FieldName = 'ItemPaymentRequested_id'
      ReadOnly = True
    end
  end
  object dsReembolso: TDataSource
    DataSet = cdsReembolso
    Left = 552
    Top = 304
  end
  object qrySaldoProcesso: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'Billing_id'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = '0'
      end>
    SQL.Strings = (
      '   SELECT DISTINCT CUSTOMID ,'
      '                   CUSTOMCLEARANCE_ID'
      '    FROM BILLING                                   B   (NOLOCK)'
      
        '    INNER JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK)O' +
        'N BII.BILLING_ID = B.ID'
      
        '    INNER JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK)O' +
        'N II.ID          = BII.ITENSINVOICED_ID'
      
        '    INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK)O' +
        'N CC.ID          = II.CUSTOMCLEARANCE_ID'
      '    WHERE B.ID = :BILLING_ID')
    Left = 464
    Top = 440
    object qrySaldoProcessocustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object qrySaldoProcessocustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
    end
  end
  object cdsSaldoProcesso: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 19
        Name = 'Billing_id'
        ParamType = ptInput
        Size = 8
        Value = 0
      end>
    ProviderName = 'dspSaldoProcesso'
    Left = 552
    Top = 496
    object cdsSaldoProcessocustomID: TWideStringField
      FieldName = 'customID'
      Size = 255
    end
    object cdsSaldoProcessocustomClearance_id: TLargeintField
      FieldName = 'customClearance_id'
    end
  end
  object dspSaldoProcesso: TDataSetProvider
    DataSet = qrySaldoProcesso
    Left = 464
    Top = 496
  end
  object dsSaldoProcesso: TDataSource
    DataSet = cdsSaldoProcesso
    Left = 552
    Top = 440
  end
  object qryAtualizaNrNf: TADOQuery
    Connection = Connection
    CommandTimeout = 60
    Parameters = <
      item
        Name = 'CUSTOMCLEARANCE_ID'
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE MYINDAIAV2.DBO.BILLING '
      '   SET NR_NOTA = N.NUMDFS '
      
        'FROM MYINDAIAV2.DBO.BILLING                         B    (NOLOCK' +
        ')   '
      
        '   INNER  JOIN MYINDAIAV2.DBO.BRANCH                BRA  (NOLOCK' +
        ') ON BRA.ID         =  B.BRANCH_ID'
      
        '   INNER  JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BIV  (NOLOCK' +
        ') ON BIV.BILLING_ID        = B.ID   '
      
        '   INNER  JOIN MYINDAIAV2.DBO.ITEMINVOICED          IV   (NOLOCK' +
        ') ON IV.ID                 = BIV.ITENSINVOICED_ID '
      
        '   LEFT  JOIN SENIOR.SAPIENS.DBO.E140IDE        N    (NOLOCK) ON' +
        ' N.CODEMP              = 1'
      
        '                  '#9#9#9'                                     AND N.' +
        'CODFIL              = BRA.SENIORKEY'
      
        '                  '#9#9#9'                                     AND N.' +
        'NUMNFV              = B.SENIORKEY'
      'WHERE IV.CUSTOMCLEARANCE_ID =:CUSTOMCLEARANCE_ID'
      '  AND B.TYPE='#39'TAX_INVOICE'#39
      '  AND N.NUMDFS >0')
    Left = 137
    Top = 172
  end
end

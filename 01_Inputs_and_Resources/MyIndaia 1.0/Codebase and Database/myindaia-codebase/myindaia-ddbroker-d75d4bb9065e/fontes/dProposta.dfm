object datm_proposta: Tdatm_proposta
  OldCreateOrder = True
  Left = 341
  Top = 164
  Height = 528
  Width = 840
  object ds_proposta: TDataSource
    DataSet = qry_proposta_
    Left = 54
    Top = 13
  end
  object qry_ult_proposta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '    MAX(SUBSTRING(NR_PROPOSTA,4,6)) AS ULTIMO from'
      '     TPROPOSTA WHERE CD_UNID_NEG=:CD_UNID_NEG'
      '  '
      ' '
      ' ')
    Left = 459
    Top = 117
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ult_proposta_ULTIMO: TStringField
      DisplayWidth = 6
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROPOSTA.NR_PROPOSTA'
      FixedChar = True
      Size = 6
    end
  end
  object upd_qry_proposta: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  IN_DUPLICA = :IN_DUPLICA,'
      '  CD_STATUS = :CD_STATUS,'
      '  TP_PROPOSTA = :TP_PROPOSTA,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  DT_VALIDADE = :DT_VALIDADE,'
      '  DT_STATUS = :DT_STATUS,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  NM_RESPONSAVEL = :NM_RESPONSAVEL,'
      '  TX_OBS = :TX_OBS,'
      '  CD_USUARIO = :CD_USUARIO'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA'
      
        '  (NR_PROPOSTA, IN_DUPLICA, CD_STATUS, TP_PROPOSTA, DT_ABERTURA,' +
        ' '
      'DT_VALIDADE, '
      '   DT_STATUS, CD_UNID_NEG, NR_PROC_COMERC, CD_EMPRESA, '
      'NM_RESPONSAVEL, '
      '   TX_OBS, CD_USUARIO)'
      'values'
      '  (:NR_PROPOSTA, :IN_DUPLICA, :CD_STATUS, :TP_PROPOSTA, '
      ':DT_ABERTURA, :DT_VALIDADE, '
      '   :DT_STATUS, :CD_UNID_NEG, :NR_PROC_COMERC, :CD_EMPRESA, '
      ':NM_RESPONSAVEL, '
      '   :TX_OBS, :CD_USUARIO)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    Left = 304
    Top = 13
  end
  object qry_proposta_: TQuery
    CachedUpdates = True
    BeforePost = qry_proposta_BeforePost
    AfterPost = qry_proposta_AfterPost
    AfterDelete = qry_proposta_AfterDelete
    AfterScroll = qry_proposta_AfterScroll
    OnCalcFields = qry_proposta_CalcFields
    OnNewRecord = qry_proposta_NewRecord
    OnUpdateError = qry_item_faturamento_UpdateError
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'select'
      '  TP.NR_PROPOSTA, TP.IN_DUPLICA,'
      '  TP.CD_STATUS,TP.TP_PROPOSTA,'
      
        '  TP.DT_ABERTURA,TP.DT_VALIDADE, TP.DT_STATUS, TU.NR_FAX1, TU.NM' +
        '_EMAIL,'
      
        '  TP.CD_UNID_NEG,TU.NM_UNID_NEG, TU.END_UNID_NEG, TU.END_NUMERO,' +
        ' TU.END_BAIRRO, TU.END_CIDADE, TU.END_UF, TU.NR_FONE,'
      '  TP.NR_PROC_COMERC,'
      
        '  TP.CD_EMPRESA,            TE.NM_EMPRESA, TE.AP_EMPRESA,  TE.CG' +
        'C_EMPRESA,'
      '  TP.NM_RESPONSAVEL, TE.IN_COMERCIAL, TP.TX_OBS,'
      ''
      ''
      ''
      '  TP.CD_USUARIO'
      'from TPROPOSTA as TP'
      '  LEFT JOIN TUNID_NEG AS TU'
      '       ON (TU.CD_UNID_NEG = TP.CD_UNID_NEG)'
      '  LEFT JOIN TEMPRESA_NAC AS TE'
      '       ON (TE.CD_EMPRESA = TP.CD_EMPRESA)'
      '  LEFT JOIN TVENDEDOR  AS TV'
      '       ON (TV.CD_VENDEDOR = TP.CD_VENDEDOR)'
      ''
      ''
      'where  TP.CD_UNID_NEG=:CD_UNID_NEG   AND TP.TP_PROPOSTA = '#39'0'#39
      ''
      ''
      ''
      ''
      'order by'
      '  TP.NR_PROPOSTA'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd_qry_proposta
    Left = 175
    Top = 13
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_proposta_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_proposta_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 15
    end
    object qry_proposta_DT_STATUS: TDateTimeField
      FieldName = 'DT_STATUS'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_proposta_NM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      FixedChar = True
    end
    object qry_proposta_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_proposta_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_proposta_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_proposta_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_proposta_DT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_proposta_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_calc_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_status'
      Size = 15
      Calculated = True
    end
    object qry_proposta_NR_FAX1: TStringField
      FieldName = 'NR_FAX1'
      FixedChar = True
    end
    object qry_proposta_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      FixedChar = True
      Size = 100
    end
    object qry_proposta_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_proposta_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_proposta_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_proposta_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      FixedChar = True
    end
    object qry_proposta_calc_end_unidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_unidade'
      Size = 60
      Calculated = True
    end
    object qry_proposta_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Calculated = True
    end
    object qry_proposta_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_proposta_TP_PROPOSTA: TStringField
      FieldName = 'TP_PROPOSTA'
      FixedChar = True
      Size = 1
    end
    object qry_proposta_IN_DUPLICA: TStringField
      FieldName = 'IN_DUPLICA'
      FixedChar = True
      Size = 1
    end
    object qry_proposta_IN_COMERCIAL: TBooleanField
      FieldName = 'IN_COMERCIAL'
    end
    object qry_proposta_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select *'
      'from TUNID_NEG with(nolock) '
      'where IN_ATIVO = '#39'1'#39' '
      'AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG'
      'from TUSUARIO_HABILITACAO '
      'where CD_USUARIO =:CD_USUARIO)')
    Left = 748
    Top = 169
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TUNID_NEG.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '    CD_EMPRESA,'
      '    NM_EMPRESA,IN_RESTRICAO,'
      '    AP_EMPRESA, IN_COMERCIAL'
      'from'
      '   TEMPRESA_NAC  '
      'where'
      '    CD_EMPRESA =:CD_EMPRESA  and '
      '    IN_ATIVO = '#39'1'#39
      '')
    Left = 614
    Top = 65
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_empresa_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_empresa_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_empresa_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_empresa_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_RESTRICAO'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_IN_COMERCIAL: TBooleanField
      FieldName = 'IN_COMERCIAL'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_COMERCIAL'
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, UH.CD_PRODUTO, UH.IN_ATIVO' +
        ', UH.IN_DEFAULT,TU.NM_USUARIO  FROM TUSUARIO_HABILITACAO UH'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 459
    Top = 65
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.IN_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_incoterms_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '    CODIGO,'
      '    DESCRICAO'
      'from '
      '   TINCOTERMS_VENDA with(nolock)'
      ''
      '   ')
    Left = 748
    Top = 65
    object qry_incoterms_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_incoterms_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '    TS.CD_SERVICO,TS.TP_SERVICO,'
      '    TS.NM_SERVICO, TS.CD_VIA_TRANSPORTE,'
      '   (SELECT TV.NM_VIA_TRANSP FROM  TVIA_TRANSP_BROKER TV'
      
        '      WHERE TV.CD_VIA_TRANSP = TS.CD_VIA_TRANSPORTE) NM_VIA_TRAN' +
        'SP'
      'from'
      '   TSERVICO TS'
      'where'
      '    TS.CD_SERVICO=:CD_SERVICO'
      
        '   and TS.CD_SERVICO IN (SELECT TCS.CD_SERVICO FROM TCLIENTE_SER' +
        'VICO TCS WHERE TCS.CD_UNID_NEG = :CD_UNID_NEG AND TCS.CD_PRODUTO' +
        '  = :CD_PRODUTO  AND   TCS.CD_CLIENTE  = :CD_CLIENTE )'
      '    AND    TS.IN_ATIVO = '#39'1'#39
      ' '
      ' ')
    Left = 459
    Top = 222
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TSERVICO.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'DBBROKER.TSERVICO.NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TSERVICO.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_servico_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_servico_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_proposta_item_: TQuery
    CachedUpdates = True
    AfterPost = qry_proposta_item_AfterPost
    AfterDelete = qry_proposta_item_AfterDelete
    AfterScroll = qry_proposta_item_AfterScroll
    OnNewRecord = qry_proposta_item_NewRecord
    OnUpdateError = qry_item_faturamento_UpdateError
    DatabaseName = 'DBBROKER'
    DataSource = ds_proposta
    SQL.Strings = (
      'select'
      '  TP.NR_PROPOSTA,TP.CD_INCOTERM, TPR.TP_PRODUTO,'
      '  TP.CD_SERVICO, TS.NM_SERVICO, TS.TP_SERVICO,'
      '  TP.CD_UNID_NEG,  TU.NM_UNID_NEG,'
      '  TP.CD_VIA_TRANSP, TVT.NM_VIA_TRANSP,'
      '  TP.CD_PRODUTO , TPR.NM_PRODUTO,'
      '  TP.NR_ITEM_PROPOSTA'
      'from TPROPOSTA_ITEM as TP '
      '  LEFT JOIN TUNID_NEG AS TU'
      '       ON (TU.CD_UNID_NEG = TP.CD_UNID_NEG)'
      '  LEFT JOIN TSERVICO AS TS'
      '       ON (TP.CD_SERVICO = TS.CD_SERVICO)'
      '  LEFT JOIN TVIA_TRANSP_BROKER  AS TVT'
      '       ON (TVT.CD_VIA_TRANSP = TP.CD_VIA_TRANSP)'
      '  LEFT JOIN TPRODUTO TPR ON (TPR.CD_PRODUTO = TP.CD_PRODUTO)'
      'where'
      '   TP.NR_PROPOSTA=:NR_PROPOSTA'
      'order by'
      '  TP.NR_ITEM_PROPOSTA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = Update_prop_item
    Left = 175
    Top = 117
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
        Size = 21
      end>
    object qry_proposta_item_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_proposta_item_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_item_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_item_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_item_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_item_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_item_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_proposta_item_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_item_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_proposta_item_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_item_Look_nm_incoterm: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_incoterm'
      LookupDataSet = qry_incoterms_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODIGO'
      KeyFields = 'CD_INCOTERM'
      Size = 5
      Lookup = True
    end
    object qry_proposta_item_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      FixedChar = True
      Size = 1
    end
    object qry_proposta_item_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_item_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
    end
  end
  object ds_proposta_item: TDataSource
    DataSet = qry_proposta_item_
    Left = 54
    Top = 117
  end
  object qry_proposta_frete_: TQuery
    CachedUpdates = True
    AfterPost = qry_proposta_frete_AfterPost
    AfterDelete = qry_proposta_frete_AfterDelete
    AfterScroll = qry_proposta_frete_AfterScroll
    OnNewRecord = qry_proposta_frete_NewRecord
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    DataSource = ds_proposta_item
    SQL.Strings = (
      'select'
      
        '  TP.NR_PROPOSTA,TP.CD_SERVICO, TP.CD_TAB_FRETE, TT.DESC_TAB_FRE' +
        'TE,TP.CD_ARMADOR,  TP.CD_PRODUTO,'
      
        '  tp.OTHER_CUSTO, tp.OTHER_VENDA, TP.TP_CARGA, TP.NR_ITEM_PROPOS' +
        'TA,'
      
        '  TP.CD_CIA_TRANSP, (SELECT TCIA.DESCRICAO FROM TTRANSPORTADOR_I' +
        'TL TCIA WHERE TCIA.CODIGO = TP.CD_CIA_TRANSP)DESCRICAO,'
      
        '  TP.CD_MOEDA, TM.NM_MOEDA, TAR.DESCRICAO AS NM_ARMADOR, TP.CD_T' +
        'AB_FRETE_COMPRA,'
      
        '  TP.CD_ORIGEM, TP1.NM_PORTO as NM_PORTO1, TP.CD_DESTINO, TP2.NM' +
        '_PORTO as NM_PORTO2,'
      '  TP.CD_AGENTE, TA.NM_AGENTE'
      ''
      'from  TPROPOSTA_FRETE AS TP'
      
        '  LEFT JOIN TTAB_FRETE  AS TT ON (TP.CD_TAB_FRETE = TT.CD_TAB_FR' +
        'ETE)'
      '  LEFT JOIN TAGENTE  AS TA ON (TA.CD_AGENTE = TP.CD_AGENTE)'
      '  LEFT JOIN TMOEDA_BROKER AS TM ON(TP.CD_MOEDA= TM.CD_MOEDA)'
      
        '  LEFT JOIN TTRANSPORTADOR_ITL TAR ON (TAR.CODIGO = TP.CD_ARMADO' +
        'R)'
      '  LEFT JOIN TPORTO  AS TP1'
      '       ON (TP1.CD_PORTO = TP.CD_ORIGEM)'
      '  LEFT JOIN TPORTO  AS TP2'
      '       ON (TP2.CD_PORTO = TP.CD_DESTINO)'
      'where'
      '  TP.NR_PROPOSTA =  :NR_PROPOSTA  and'
      
        '  TP.NR_ITEM_PROPOSTA     =  :NR_ITEM_PROPOSTA AND TP.CD_PRODUTO' +
        '=:CD_PRODUTO'
      'order by'
      '  TT.DESC_TAB_FRETE'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd_qry_proposta_frete
    Left = 175
    Top = 169
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftInteger
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_proposta_frete_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_proposta_frete_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_frete_CD_TAB_FRETE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_proposta_frete_DESC_TAB_FRETE: TStringField
      FieldName = 'DESC_TAB_FRETE'
      FixedChar = True
      Size = 80
    end
    object qry_proposta_frete_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qry_proposta_frete_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_proposta_frete_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_frete_CD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      FixedChar = True
      Size = 6
    end
    object qry_proposta_frete_NM_PORTO1: TStringField
      FieldName = 'NM_PORTO1'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_frete_NM_PORTO2: TStringField
      FieldName = 'NM_PORTO2'
      FixedChar = True
      Size = 50
    end
    object qry_proposta_frete_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_proposta_frete_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_frete_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_frete_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_frete_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_proposta_frete_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_frete_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_frete_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_frete_OTHER_CUSTO: TFloatField
      FieldName = 'OTHER_CUSTO'
    end
    object qry_proposta_frete_OTHER_VENDA: TFloatField
      FieldName = 'OTHER_VENDA'
    end
    object qry_proposta_frete_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_proposta_frete_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
    end
  end
  object ds_proposta_frete: TDataSource
    DataSet = qry_proposta_frete_
    Left = 54
    Top = 169
  end
  object upd_qry_proposta_frete: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_FRETE'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_TAB_FRETE_COMPRA = :CD_TAB_FRETE_COMPRA,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_CIA_TRANSP = :CD_CIA_TRANSP,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  OTHER_CUSTO = :OTHER_CUSTO,'
      '  OTHER_VENDA = :OTHER_VENDA,'
      '  TP_CARGA = :TP_CARGA,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_FRETE'
      '  (NR_PROPOSTA, CD_PRODUTO, CD_SERVICO, CD_TAB_FRETE, '
      'CD_TAB_FRETE_COMPRA, '
      '   CD_AGENTE, CD_CIA_TRANSP, CD_ARMADOR, CD_MOEDA, CD_ORIGEM, '
      'CD_DESTINO, '
      '   OTHER_CUSTO, OTHER_VENDA, TP_CARGA, NR_ITEM_PROPOSTA)'
      'values'
      '  (:NR_PROPOSTA, :CD_PRODUTO, :CD_SERVICO, :CD_TAB_FRETE, '
      ':CD_TAB_FRETE_COMPRA, '
      
        '   :CD_AGENTE, :CD_CIA_TRANSP, :CD_ARMADOR, :CD_MOEDA, :CD_ORIGE' +
        'M, '
      ':CD_DESTINO, '
      '   :OTHER_CUSTO, :OTHER_VENDA, :TP_CARGA, :NR_ITEM_PROPOSTA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_FRETE'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 304
    Top = 169
  end
  object qry_proposta_item_clone_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '  TP.NR_PROPOSTA,'
      '  TP.CD_SERVICO,'
      '  TP.NR_ITEM_PROPOSTA'
      'from'
      '  TPROPOSTA_ITEM as TP'
      'where'
      '   TP.NR_PROPOSTA =    :NR_PROPOSTA and'
      
        '   TP.NR_ITEM_PROPOSTA     =    :NR_ITEM_PROPOSTA AND TP.CD_PROD' +
        'UTO=:CD_PRODUTO'
      ' ')
    Left = 748
    Top = 326
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_proposta_item_clone_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_proposta_item_clone_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_item_clone_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.NR_ITEM_PROPOSTA'
    end
  end
  object qry_ult_proposta_frete_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select '
      '   max(CD_PROPOSTA_FRETE_ITEM) as ULTIMO'
      'from'
      '   TPROPOSTA_FRETE_ITEM'
      'where'
      '    NR_PROPOSTA  =:NR_PROPOSTA  and'
      '    NR_ITEM_PROPOSTA      =:NR_ITEM_PROPOSTA       and'
      '    CD_TAB_FRETE =:CD_TAB_FRETE')
    Left = 459
    Top = 326
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_ult_proposta_frete_item_ULTIMO: TIntegerField
      DisplayWidth = 6
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_PROPOSTA_FRETE_ITEM'
    end
  end
  object qry_proposta_frete_clone_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '   NR_PROPOSTA,   '
      '   CD_SERVICO,'
      '   NR_ITEM_PROPOSTA,'
      '   CD_TAB_FRETE'
      'from'
      '   TPROPOSTA_FRETE'
      'where'
      '    NR_PROPOSTA  =:NR_PROPOSTA  and'
      '    NR_ITEM_PROPOSTA      =:NR_ITEM_PROPOSTA       and'
      '    CD_TAB_FRETE =:CD_TAB_FRETE AND CD_PRODUTO=:CD_PRODUTO')
    Left = 614
    Top = 326
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_proposta_frete_clone_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.NR_PROPOSTA'
      FixedChar = True
    end
    object qry_proposta_frete_clone_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_proposta_frete_clone_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_proposta_frete_clone_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE.NR_ITEM_PROPOSTA'
    end
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 614
    Top = 117
  end
  object qry_item_faturamento_: TQuery
    CachedUpdates = True
    AfterPost = qry_item_faturamento_AfterPost
    AfterDelete = qry_item_faturamento_AfterDelete
    AfterScroll = qry_item_faturamento_AfterScroll
    OnNewRecord = qry_item_faturamento_NewRecord
    OnUpdateError = qry_item_faturamento_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TFF.NR_PROPOSTA, TFF. CD_UNID_NEG, TFF.CD_PRODUTO, TFF.NR' +
        '_ITEM_PROPOSTA,'
      '  TFF.CD_SERVICO, TFF.CD_ITEM,'
      
        '  (SELECT NM_ITEM FROM TITEM TI WHERE TI.CD_ITEM = TFF.CD_ITEM) ' +
        'NM_ITEM,'
      
        '  TFF.CD_SDA, (SELECT TX_DESCRICAO FROM TSDA TS WHERE TS.CD_SDA ' +
        '= TFF.CD_SDA) NM_SDA,'
      '   TFF.TP_CALCULO, TFF.CD_STATUS,'
      
        '  (SELECT TC.NM_CALCULO FROM TCALCULO TC WHERE TFF.TP_CALCULO = ' +
        'CD_CALCULO) NM_CALCULO,'
      
        '  (SELECT TC.CD_TABELA FROM TCALCULO TC WHERE TFF.TP_CALCULO = C' +
        'D_CALCULO) CD_TABELA'
      '   FROM TPROPOSTA_FATURAMENTO TFF'
      '  WHERE TFF.NR_PROPOSTA=:NR_PROPOSTA AND'
      '   TFF.NR_ITEM_PROPOSTA=:NR_ITEM_PROPOSTA'
      '  AND TFF.CD_PRODUTO=:CD_PRODUTO'
      '  AND TFF.CD_UNID_NEG=:CD_UNID_NEG'
      ''
      ''
      ' '
      ' ')
    UpdateObject = UpDate_faturamento
    Left = 175
    Top = 378
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_item_faturamento_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
      Size = 14
    end
    object qry_item_faturamento_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_item_faturamento_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_item_faturamento_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_item_faturamento_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_item_faturamento_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_item_faturamento_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      FixedChar = True
      Size = 3
    end
    object qry_item_faturamento_NM_SDA: TStringField
      FieldName = 'NM_SDA'
      FixedChar = True
      Size = 50
    end
    object qry_item_faturamento_TP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      FixedChar = True
      Size = 3
    end
    object qry_item_faturamento_NM_CALCULO: TStringField
      FieldName = 'NM_CALCULO'
      FixedChar = True
      Size = 40
    end
    object qry_item_faturamento_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_item_faturamento_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      FixedChar = True
      Size = 1
    end
    object qry_item_faturamento_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
    end
  end
  object ds_item_faturamento: TDataSource
    DataSet = qry_item_faturamento_
    Left = 54
    Top = 378
  end
  object UpDate_faturamento: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_FATURAMENTO'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_CALCULO = :TP_CALCULO,'
      '  CD_SDA = :CD_SDA,'
      '  CD_STATUS = :CD_STATUS,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_FATURAMENTO'
      '  (NR_PROPOSTA, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, CD_ITEM, '
      'TP_CALCULO, '
      '   CD_SDA, CD_STATUS, NR_ITEM_PROPOSTA)'
      'values'
      
        '  (:NR_PROPOSTA, :CD_UNID_NEG, :CD_PRODUTO, :CD_SERVICO, :CD_ITE' +
        'M, '
      ':TP_CALCULO, '
      '   :CD_SDA, :CD_STATUS, :NR_ITEM_PROPOSTA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_FATURAMENTO'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 304
    Top = 378
  end
  object qry_prop_rec_imp_: TQuery
    CachedUpdates = True
    AfterPost = qry_prop_rec_imp_AfterPost
    AfterDelete = qry_prop_rec_imp_AfterDelete
    OnCalcFields = qry_prop_rec_imp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TPR.NR_PROPOSTA,  TPR.CD_UNID_NEG, TPR.CD_PRODUTO, TPR.NR' +
        '_ITEM_PROPOSTA,'
      'TPR.CD_SERVICO, TPR.CD_ITEM, TPR.TP_DT_BASE, TPR.VL_NUM_TAXA,'
      '  TPR.VL_DEN_TAXA, TPR.TP_BASE_CALC_TAXA, TPR.CD_MOEDA_TAXA, '
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'R.CD_MOEDA_TAXA) MOEDA_TAXA,'
      'TPR.VL_NUM_ACR, TPR.VL_DEN_ACR, TPR.TP_BASE_CALC_ACR, '
      'TPR.CD_MOEDA_ACR,'
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'R.CD_MOEDA_ACR) MOEDA_ACR,'
      
        'TPR.VL_NUM_FORA_REGIAO,  TPR.VL_DEN_FORA_REGIAO, TPR.TP_BASE_CAL' +
        'C_FORA_REGIAO,'
      'TPR.CD_MOEDA_FORA_REGIAO, TPR.VL_NUM_MIN, TPR.VL_DEN_MIN,'
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'R.CD_MOEDA_FORA_REGIAO) MOEDA_FORA_REGIAO,'
      'TPR.TP_BASE_CALC_MIN, TPR.CD_MOEDA_MIN,'
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'R.CD_MOEDA_MIN) MOEDA_MIN,'
      'TPR.VL_NUM_MAX,  TPR.VL_DEN_MAX, TPR.TP_BASE_CALC_MAX, '
      'TPR.CD_MOEDA_MAX,'
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'R.CD_MOEDA_MAX) MOEDA_MAX'
      '  FROM TPROPOSTA_RECEITA_IMP TPR'
      '  WHERE TPR.NR_PROPOSTA=:NR_PROPOSTA AND '
      '   TPR.CD_UNID_NEG = :CD_UNID_NEG AND'
      '   TPR.CD_PRODUTO =:CD_PRODUTO AND'
      '  TPR.NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA AND'
      '  TPR.CD_ITEM =:CD_ITEM'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = UpDAte_prop_rec_imp
    Left = 175
    Top = 274
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
    object qry_prop_rec_imp_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
      Size = 14
    end
    object qry_prop_rec_imp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_prop_rec_imp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_prop_rec_imp_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_imp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_imp_TP_DT_BASE: TStringField
      FieldName = 'TP_DT_BASE'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_imp_VL_NUM_TAXA: TFloatField
      FieldName = 'VL_NUM_TAXA'
    end
    object qry_prop_rec_imp_VL_DEN_TAXA: TFloatField
      FieldName = 'VL_DEN_TAXA'
    end
    object qry_prop_rec_imp_TP_BASE_CALC_TAXA: TStringField
      FieldName = 'TP_BASE_CALC_TAXA'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_imp_CD_MOEDA_TAXA: TStringField
      FieldName = 'CD_MOEDA_TAXA'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_imp_MOEDA_TAXA: TStringField
      FieldName = 'MOEDA_TAXA'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_imp_VL_NUM_ACR: TFloatField
      FieldName = 'VL_NUM_ACR'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_imp_VL_DEN_ACR: TFloatField
      FieldName = 'VL_DEN_ACR'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_imp_TP_BASE_CALC_ACR: TStringField
      FieldName = 'TP_BASE_CALC_ACR'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_imp_CD_MOEDA_ACR: TStringField
      FieldName = 'CD_MOEDA_ACR'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_imp_MOEDA_ACR: TStringField
      FieldName = 'MOEDA_ACR'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_imp_VL_NUM_FORA_REGIAO: TFloatField
      FieldName = 'VL_NUM_FORA_REGIAO'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_imp_VL_DEN_FORA_REGIAO: TFloatField
      FieldName = 'VL_DEN_FORA_REGIAO'
    end
    object qry_prop_rec_imp_TP_BASE_CALC_FORA_REGIAO: TStringField
      FieldName = 'TP_BASE_CALC_FORA_REGIAO'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_imp_CD_MOEDA_FORA_REGIAO: TStringField
      FieldName = 'CD_MOEDA_FORA_REGIAO'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_imp_VL_NUM_MIN: TFloatField
      FieldName = 'VL_NUM_MIN'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_imp_VL_DEN_MIN: TFloatField
      FieldName = 'VL_DEN_MIN'
    end
    object qry_prop_rec_imp_TP_BASE_CALC_MIN: TStringField
      FieldName = 'TP_BASE_CALC_MIN'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_imp_CD_MOEDA_MIN: TStringField
      FieldName = 'CD_MOEDA_MIN'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_imp_MOEDA_MIN: TStringField
      FieldName = 'MOEDA_MIN'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_imp_VL_NUM_MAX: TFloatField
      FieldName = 'VL_NUM_MAX'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_imp_VL_DEN_MAX: TFloatField
      FieldName = 'VL_DEN_MAX'
    end
    object qry_prop_rec_imp_TP_BASE_CALC_MAX: TStringField
      FieldName = 'TP_BASE_CALC_MAX'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_imp_CD_MOEDA_MAX: TStringField
      FieldName = 'CD_MOEDA_MAX'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_imp_MOEDA_MAX: TStringField
      FieldName = 'MOEDA_MAX'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_imp_Calc_Max: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Max'
      Calculated = True
    end
    object qry_prop_rec_imp_Calc_Min: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Min'
      Calculated = True
    end
    object qry_prop_rec_imp_Calc_Fora_Regiao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Fora_Regiao'
      Calculated = True
    end
    object qry_prop_rec_imp_Calc_Acr: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Acr'
      Calculated = True
    end
    object qry_prop_rec_imp_Calc_Taxa: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Taxa'
      Calculated = True
    end
    object qry_prop_rec_imp_MOEDA_FORA_REGIAO: TStringField
      FieldName = 'MOEDA_FORA_REGIAO'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_imp_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
    end
  end
  object ds_prop_rec_imp: TDataSource
    DataSet = qry_prop_rec_imp_
    Left = 54
    Top = 274
  end
  object UpDAte_prop_rec_imp: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_RECEITA_IMP'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_DT_BASE = :TP_DT_BASE,'
      '  VL_NUM_TAXA = :VL_NUM_TAXA,'
      '  VL_DEN_TAXA = :VL_DEN_TAXA,'
      '  TP_BASE_CALC_TAXA = :TP_BASE_CALC_TAXA,'
      '  CD_MOEDA_TAXA = :CD_MOEDA_TAXA,'
      '  VL_NUM_ACR = :VL_NUM_ACR,'
      '  VL_DEN_ACR = :VL_DEN_ACR,'
      '  TP_BASE_CALC_ACR = :TP_BASE_CALC_ACR,'
      '  CD_MOEDA_ACR = :CD_MOEDA_ACR,'
      '  VL_NUM_FORA_REGIAO = :VL_NUM_FORA_REGIAO,'
      '  VL_DEN_FORA_REGIAO = :VL_DEN_FORA_REGIAO,'
      '  TP_BASE_CALC_FORA_REGIAO = :TP_BASE_CALC_FORA_REGIAO,'
      '  CD_MOEDA_FORA_REGIAO = :CD_MOEDA_FORA_REGIAO,'
      '  VL_NUM_MIN = :VL_NUM_MIN,'
      '  VL_DEN_MIN = :VL_DEN_MIN,'
      '  TP_BASE_CALC_MIN = :TP_BASE_CALC_MIN,'
      '  CD_MOEDA_MIN = :CD_MOEDA_MIN,'
      '  VL_NUM_MAX = :VL_NUM_MAX,'
      '  VL_DEN_MAX = :VL_DEN_MAX,'
      '  TP_BASE_CALC_MAX = :TP_BASE_CALC_MAX,'
      '  CD_MOEDA_MAX = :CD_MOEDA_MAX,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_RECEITA_IMP'
      '  (NR_PROPOSTA, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, CD_ITEM, '
      'TP_DT_BASE, '
      '   VL_NUM_TAXA, VL_DEN_TAXA, TP_BASE_CALC_TAXA, CD_MOEDA_TAXA, '
      'VL_NUM_ACR, '
      '   VL_DEN_ACR, TP_BASE_CALC_ACR, CD_MOEDA_ACR, '
      'VL_NUM_FORA_REGIAO, VL_DEN_FORA_REGIAO, '
      '   TP_BASE_CALC_FORA_REGIAO, CD_MOEDA_FORA_REGIAO, VL_NUM_MIN, '
      'VL_DEN_MIN, '
      '   TP_BASE_CALC_MIN, CD_MOEDA_MIN, VL_NUM_MAX, VL_DEN_MAX, '
      'TP_BASE_CALC_MAX, '
      '   CD_MOEDA_MAX, NR_ITEM_PROPOSTA)'
      'values'
      
        '  (:NR_PROPOSTA, :CD_UNID_NEG, :CD_PRODUTO, :CD_SERVICO, :CD_ITE' +
        'M, '
      ':TP_DT_BASE, '
      
        '   :VL_NUM_TAXA, :VL_DEN_TAXA, :TP_BASE_CALC_TAXA, :CD_MOEDA_TAX' +
        'A, '
      ':VL_NUM_ACR, '
      '   :VL_DEN_ACR, :TP_BASE_CALC_ACR, :CD_MOEDA_ACR, '
      ':VL_NUM_FORA_REGIAO, '
      '   :VL_DEN_FORA_REGIAO, :TP_BASE_CALC_FORA_REGIAO, '
      ':CD_MOEDA_FORA_REGIAO, '
      '   :VL_NUM_MIN, :VL_DEN_MIN, :TP_BASE_CALC_MIN, :CD_MOEDA_MIN, '
      ':VL_NUM_MAX, '
      '   :VL_DEN_MAX, :TP_BASE_CALC_MAX, :CD_MOEDA_MAX, '
      ':NR_ITEM_PROPOSTA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_RECEITA_IMP'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 304
    Top = 274
  end
  object qry_prop_rec_exp_: TQuery
    CachedUpdates = True
    AfterPost = qry_prop_rec_exp_AfterPost
    AfterDelete = qry_prop_rec_exp_AfterDelete
    AfterScroll = qry_prop_rec_exp_AfterScroll
    OnCalcFields = qry_prop_rec_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TPE.CD_UNID_NEG, TPE.CD_PRODUTO, TPE.NR_PROPOSTA, TPE.CD_' +
        'SERVICO,TPE.CD_ITEM,'
      
        'TPE.TP_DT_BASE, TPE.TP_FAIXA, TPE.TP_FAIXA_VALOR, TPE.VL_NUM_TAX' +
        'A, TPE.VL_DEN_TAXA, '
      'TPE.TP_BASE_CALC_TAXA, TPE.CD_MOEDA_TAXA, TPE.NR_ITEM_PROPOSTA,'
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'E.CD_MOEDA_TAXA) MOEDA_TAXA,'
      
        'TPE.VL_NUM_MIN, TPE.VL_DEN_MIN, TPE.TP_BASE_CALC_MIN, TPE.CD_MOE' +
        'DA_MIN,'
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'E.CD_MOEDA_MIN) MOEDA_MIN,'
      
        'TPE.VL_NUM_MAX, TPE.VL_DEN_MAX, TPE.TP_BASE_CALC_MAX, TPE.PC_RED' +
        'UC_RE_CANC, TPE.CD_MOEDA_MAX,'
      
        '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP' +
        'E.CD_MOEDA_MAX) MOEDA_MAX'
      ''
      'FROM TPROPOSTA_RECEITA_EXP TPE'
      
        'WHERE TPE.CD_UNID_NEG=:CD_UNID_NEG AND TPE.CD_PRODUTO=:CD_PRODUT' +
        'O AND'
      ' TPE.NR_PROPOSTA=:NR_PROPOSTA AND'
      ' TPE.NR_ITEM_PROPOSTA=:NR_ITEM_PROPOSTA AND'
      ' TPE.CD_ITEM=:CD_ITEM')
    UpdateObject = UpDAte_prop_rec_exp
    Left = 175
    Top = 326
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
    object qry_prop_rec_exp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_prop_rec_exp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_prop_rec_exp_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
      Size = 14
    end
    object qry_prop_rec_exp_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_exp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_exp_TP_DT_BASE: TStringField
      FieldName = 'TP_DT_BASE'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_exp_TP_FAIXA: TStringField
      FieldName = 'TP_FAIXA'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_exp_TP_FAIXA_VALOR: TStringField
      FieldName = 'TP_FAIXA_VALOR'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_exp_VL_NUM_TAXA: TFloatField
      FieldName = 'VL_NUM_TAXA'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_exp_VL_DEN_TAXA: TFloatField
      FieldName = 'VL_DEN_TAXA'
    end
    object qry_prop_rec_exp_TP_BASE_CALC_TAXA: TStringField
      FieldName = 'TP_BASE_CALC_TAXA'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_exp_CD_MOEDA_TAXA: TStringField
      FieldName = 'CD_MOEDA_TAXA'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_exp_MOEDA_TAXA: TStringField
      FieldName = 'MOEDA_TAXA'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_exp_VL_NUM_MIN: TFloatField
      FieldName = 'VL_NUM_MIN'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_exp_VL_DEN_MIN: TFloatField
      FieldName = 'VL_DEN_MIN'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_exp_TP_BASE_CALC_MIN: TStringField
      FieldName = 'TP_BASE_CALC_MIN'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_exp_CD_MOEDA_MIN: TStringField
      FieldName = 'CD_MOEDA_MIN'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_exp_MOEDA_MIN: TStringField
      FieldName = 'MOEDA_MIN'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_exp_VL_NUM_MAX: TFloatField
      FieldName = 'VL_NUM_MAX'
      DisplayFormat = '0.0000'
    end
    object qry_prop_rec_exp_VL_DEN_MAX: TFloatField
      FieldName = 'VL_DEN_MAX'
    end
    object qry_prop_rec_exp_TP_BASE_CALC_MAX: TStringField
      FieldName = 'TP_BASE_CALC_MAX'
      FixedChar = True
      Size = 1
    end
    object qry_prop_rec_exp_PC_REDUC_RE_CANC: TFloatField
      FieldName = 'PC_REDUC_RE_CANC'
    end
    object qry_prop_rec_exp_CD_MOEDA_MAX: TStringField
      FieldName = 'CD_MOEDA_MAX'
      FixedChar = True
      Size = 3
    end
    object qry_prop_rec_exp_MOEDA_MAX: TStringField
      FieldName = 'MOEDA_MAX'
      FixedChar = True
      Size = 30
    end
    object qry_prop_rec_exp_Calc_Taxa: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Taxa'
      Calculated = True
    end
    object qry_prop_rec_exp_Calc_Min: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Min'
      Calculated = True
    end
    object qry_prop_rec_exp_Calc_Max: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Max'
      Calculated = True
    end
    object qry_prop_rec_exp_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
    end
  end
  object UpDAte_prop_rec_exp: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_RECEITA_EXP'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_DT_BASE = :TP_DT_BASE,'
      '  TP_FAIXA = :TP_FAIXA,'
      '  TP_FAIXA_VALOR = :TP_FAIXA_VALOR,'
      '  VL_NUM_TAXA = :VL_NUM_TAXA,'
      '  VL_DEN_TAXA = :VL_DEN_TAXA,'
      '  TP_BASE_CALC_TAXA = :TP_BASE_CALC_TAXA,'
      '  CD_MOEDA_TAXA = :CD_MOEDA_TAXA,'
      '  VL_NUM_MIN = :VL_NUM_MIN,'
      '  VL_DEN_MIN = :VL_DEN_MIN,'
      '  TP_BASE_CALC_MIN = :TP_BASE_CALC_MIN,'
      '  CD_MOEDA_MIN = :CD_MOEDA_MIN,'
      '  VL_NUM_MAX = :VL_NUM_MAX,'
      '  VL_DEN_MAX = :VL_DEN_MAX,'
      '  TP_BASE_CALC_MAX = :TP_BASE_CALC_MAX,'
      '  CD_MOEDA_MAX = :CD_MOEDA_MAX,'
      '  PC_REDUC_RE_CANC = :PC_REDUC_RE_CANC,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_RECEITA_EXP'
      '  (CD_UNID_NEG, CD_PRODUTO, NR_PROPOSTA, CD_SERVICO, CD_ITEM, '
      'TP_DT_BASE, '
      '   TP_FAIXA, TP_FAIXA_VALOR, VL_NUM_TAXA, VL_DEN_TAXA, '
      'TP_BASE_CALC_TAXA, '
      '   CD_MOEDA_TAXA, VL_NUM_MIN, VL_DEN_MIN, TP_BASE_CALC_MIN, '
      'CD_MOEDA_MIN, '
      '   VL_NUM_MAX, VL_DEN_MAX, TP_BASE_CALC_MAX, CD_MOEDA_MAX, '
      'PC_REDUC_RE_CANC, '
      '   NR_ITEM_PROPOSTA)'
      'values'
      
        '  (:CD_UNID_NEG, :CD_PRODUTO, :NR_PROPOSTA, :CD_SERVICO, :CD_ITE' +
        'M, '
      ':TP_DT_BASE, '
      '   :TP_FAIXA, :TP_FAIXA_VALOR, :VL_NUM_TAXA, :VL_DEN_TAXA, '
      ':TP_BASE_CALC_TAXA, '
      '   :CD_MOEDA_TAXA, :VL_NUM_MIN, :VL_DEN_MIN, :TP_BASE_CALC_MIN, '
      ':CD_MOEDA_MIN, '
      '   :VL_NUM_MAX, :VL_DEN_MAX, :TP_BASE_CALC_MAX, :CD_MOEDA_MAX, '
      ':PC_REDUC_RE_CANC, '
      '   :NR_ITEM_PROPOSTA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_RECEITA_EXP'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 304
    Top = 326
  end
  object ds_prop_rec_exp: TDataSource
    DataSet = qry_prop_rec_exp_
    Left = 54
    Top = 326
  end
  object qry_tab_frete_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '   TTF.CD_TAB_FRETE,'
      '   TTF.DESC_TAB_FRETE,'
      '    TM.NM_MOEDA, TTF.TP_CARGA,'
      '   TTF.CD_ORIGEM_TAB_FRETE, TP.NM_PORTO,TTF.CD_MOEDA_TAB_FRETE,'
      '   TTF.CD_DESTINO_TAB_FRETE, TP2.NM_PORTO,'
      '   TTF.CD_AGENTE_TAB_FRETE,TA.NM_AGENTE,  TTF.DT_TAB_FRETE,'
      
        '   TTF.CD_ARMADOR , (SELECT TAR.DESCRICAO FROM TTRANSPORTADOR_IT' +
        'L TAR WHERE TAR.CODIGO= TTF.CD_ARMADOR)NM_ARMADOR,'
      '   TTF.CD_CIA_TRANSP_TAB_FRETE,  TCIA.DESCRICAO'
      'from  TTAB_FRETE AS TTF'
      '  LEFT JOIN TAGENTE  AS TA'
      '       ON (TA.CD_AGENTE = TTF.CD_AGENTE_TAB_FRETE)'
      '  LEFT JOIN TTRANSPORTADOR_ITL  AS TCIA'
      '       ON (TCIA.CODIGO =  TTF.CD_CIA_TRANSP_TAB_FRETE)'
      
        '  LEFT JOIN TPORTO AS TP ON (TTF.CD_ORIGEM_TAB_FRETE = TP.CD_POR' +
        'TO)'
      
        '  LEFT JOIN TPORTO AS TP2 ON (TTF.CD_ORIGEM_TAB_FRETE = TP2.CD_P' +
        'ORTO)'
      
        '  LEFT JOIN TMOEDA_BROKER AS TM ON(TTF.CD_MOEDA_TAB_FRETE = TM.C' +
        'D_MOEDA)'
      ''
      ''
      ''
      'where'
      
        '   TTF.CD_TAB_FRETE =:CD_TAB_FRETE  AND CD_ORIGEM_TAB_FRETE = :C' +
        'D_ORIGEM AND TTF.CD_DESTINO_TAB_FRETE=:CD_DESTINO'
      '       AND TTF.CD_VIA_TRANSP =:CD_VIA_TRANSP'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 459
    Top = 274
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CD_DESTINO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptInput
      end>
    object qry_tab_frete_CD_TAB_FRETE: TStringField
      DisplayWidth = 5
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_tab_frete_DESC_TAB_FRETE: TStringField
      FieldName = 'DESC_TAB_FRETE'
      FixedChar = True
      Size = 80
    end
    object qry_tab_frete_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_tab_frete_CD_ORIGEM_TAB_FRETE: TStringField
      FieldName = 'CD_ORIGEM_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_tab_frete_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      FixedChar = True
      Size = 50
    end
    object qry_tab_frete_CD_MOEDA_TAB_FRETE: TStringField
      FieldName = 'CD_MOEDA_TAB_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_tab_frete_CD_DESTINO_TAB_FRETE: TStringField
      FieldName = 'CD_DESTINO_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_tab_frete_NM_PORTO_1: TStringField
      FieldName = 'NM_PORTO_1'
      FixedChar = True
      Size = 50
    end
    object qry_tab_frete_CD_AGENTE_TAB_FRETE: TStringField
      FieldName = 'CD_AGENTE_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_tab_frete_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_tab_frete_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_tab_frete_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_tab_frete_CD_CIA_TRANSP_TAB_FRETE: TStringField
      FieldName = 'CD_CIA_TRANSP_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
    object qry_tab_frete_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qry_tab_frete_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_tab_frete_DT_TAB_FRETE: TDateTimeField
      FieldName = 'DT_TAB_FRETE'
    end
  end
  object qry_prop_frete_Item_: TQuery
    CachedUpdates = True
    BeforePost = qry_prop_frete_Item_BeforePost
    AfterPost = qry_prop_frete_Item_AfterPost
    BeforeDelete = qry_prop_frete_Item_BeforeDelete
    AfterDelete = qry_prop_frete_Item_AfterDelete
    AfterScroll = qry_prop_frete_Item_AfterScroll
    OnCalcFields = qry_prop_frete_Item_CalcFields
    OnNewRecord = qry_prop_frete_Item_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROPOSTA, CD_SERVICO, CD_TAB_FRETE, CD_PROPOSTA_FRETE_' +
        'ITEM, PESO_TAB_FRETE, VOLUME_TAB_FRETE,'
      
        ' TTIPO_SIMBOLO_TAB_FRETE,VL_COMPRA_TAB_FRETE, VL_VENDA_TAB_FRETE' +
        ', PERC_VENDA_TAB_FRETE, CD_PRODUTO, NR_ITEM_PROPOSTA,'
      '   TP_ESTUFAGEM, TP_FRETE, VL_VENDA_MINIMA'
      '     FROM TPROPOSTA_FRETE_ITEM'
      
        '      WHERE NR_PROPOSTA=:NR_PROPOSTA AND NR_ITEM_PROPOSTA =:NR_I' +
        'TEM_PROPOSTA AND CD_PRODUTO=:CD_PRODUTO  AND'
      
        '      CD_TAB_FRETE=:CD_TAB_FRETE  AND TP_ESTUFAGEM = :TP_ESTUFAG' +
        'EM'
      '       ORDER BY CD_PROPOSTA_FRETE_ITEM'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_prop_frete_it_
    Left = 175
    Top = 222
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_prop_frete_Item_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.NR_PROPOSTA'
      FixedChar = True
    end
    object qry_prop_frete_Item_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_prop_frete_Item_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_prop_frete_Item_PESO_TAB_FRETE: TFloatField
      FieldName = 'PESO_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.PESO_TAB_FRETE'
    end
    object qry_prop_frete_Item_VOLUME_TAB_FRETE: TStringField
      FieldName = 'VOLUME_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.VOLUME_TAB_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_prop_frete_Item_TTIPO_SIMBOLO_TAB_FRETE: TStringField
      FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.TTIPO_SIMBOLO_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_prop_frete_Item_VL_COMPRA_TAB_FRETE: TFloatField
      FieldName = 'VL_COMPRA_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.VL_COMPRA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_prop_frete_Item_VL_VENDA_TAB_FRETE: TFloatField
      FieldName = 'VL_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.VL_VENDA_TAB_FRETE'
      OnChange = qry_prop_frete_Item_VL_VENDA_TAB_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_prop_frete_Item_PERC_VENDA_TAB_FRETE: TFloatField
      FieldName = 'PERC_VENDA_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.PERC_VENDA_TAB_FRETE'
      DisplayFormat = '0.00'
    end
    object qry_prop_frete_Item_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_Item_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_Item_VL_VENDA_MINIMA: TFloatField
      FieldName = 'VL_VENDA_MINIMA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.VL_VENDA_MINIMA'
      DisplayFormat = '0.00'
    end
    object qry_prop_frete_Item_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_prop_frete_Item_calc_tp_simb_maritimo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_simb_maritimo'
      Calculated = True
    end
    object qry_prop_frete_Item_Look_nm_cntr: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_cntr'
      LookupDataSet = qry_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'VOLUME_TAB_FRETE'
      Size = 30
      Lookup = True
    end
    object qry_prop_frete_Item_CD_PROPOSTA_FRETE_ITEM: TStringField
      FieldName = 'CD_PROPOSTA_FRETE_ITEM'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_PROPOSTA_FRETE_ITEM'
      FixedChar = True
    end
    object qry_prop_frete_Item_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.NR_ITEM_PROPOSTA'
    end
  end
  object ds_prop_frete_item: TDataSource
    DataSet = qry_prop_frete_Item_
    Left = 54
    Top = 222
  end
  object UpDAte_prop_frete_it_: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_FRETE_ITEM'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_PROPOSTA_FRETE_ITEM = :CD_PROPOSTA_FRETE_ITEM,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  PESO_TAB_FRETE = :PESO_TAB_FRETE,'
      '  VOLUME_TAB_FRETE = :VOLUME_TAB_FRETE,'
      '  TTIPO_SIMBOLO_TAB_FRETE = :TTIPO_SIMBOLO_TAB_FRETE,'
      '  VL_COMPRA_TAB_FRETE = :VL_COMPRA_TAB_FRETE,'
      '  VL_VENDA_TAB_FRETE = :VL_VENDA_TAB_FRETE,'
      '  PERC_VENDA_TAB_FRETE = :PERC_VENDA_TAB_FRETE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  TP_FRETE = :TP_FRETE,'
      '  VL_VENDA_MINIMA = :VL_VENDA_MINIMA,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_PROPOSTA_FRETE_ITEM = :OLD_CD_PROPOSTA_FRETE_ITEM and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_FRETE_ITEM'
      '  (NR_PROPOSTA, CD_SERVICO, CD_TAB_FRETE, '
      'CD_PROPOSTA_FRETE_ITEM, CD_PRODUTO, '
      '   PESO_TAB_FRETE, VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, '
      'VL_COMPRA_TAB_FRETE, '
      '   VL_VENDA_TAB_FRETE, PERC_VENDA_TAB_FRETE, TP_ESTUFAGEM, '
      'TP_FRETE, VL_VENDA_MINIMA, '
      '   NR_ITEM_PROPOSTA)'
      'values'
      '  (:NR_PROPOSTA, :CD_SERVICO, :CD_TAB_FRETE, '
      ':CD_PROPOSTA_FRETE_ITEM, :CD_PRODUTO, '
      
        '   :PESO_TAB_FRETE, :VOLUME_TAB_FRETE, :TTIPO_SIMBOLO_TAB_FRETE,' +
        ' '
      ':VL_COMPRA_TAB_FRETE, '
      '   :VL_VENDA_TAB_FRETE, :PERC_VENDA_TAB_FRETE, :TP_ESTUFAGEM, '
      ':TP_FRETE, '
      '   :VL_VENDA_MINIMA, :NR_ITEM_PROPOSTA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_FRETE_ITEM'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_PROPOSTA_FRETE_ITEM = :OLD_CD_PROPOSTA_FRETE_ITEM and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 304
    Top = 222
  end
  object qry_prop_frete_desp_: TQuery
    CachedUpdates = True
    BeforePost = qry_prop_frete_desp_BeforePost
    AfterPost = qry_prop_frete_desp_AfterPost
    BeforeDelete = qry_prop_frete_desp_BeforeDelete
    AfterDelete = qry_prop_frete_desp_AfterDelete
    AfterScroll = qry_prop_frete_desp_AfterScroll
    OnCalcFields = qry_prop_frete_desp_CalcFields
    OnNewRecord = qry_prop_frete_desp_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROPOSTA, CD_SERVICO, CD_PRODUTO, CD_TAB_FRETE, CD_ITE' +
        'M, TP_BASE_CALCULO, CD_MOEDA, IN_PROFIT,'
      
        '    TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_' +
        'CIA, VL_VENDA, IN_DESPESA,CODIGO, NR_ITEM_PROPOSTA,'
      
        '     IN_MENCIONADO, CD_TAB_REF, TP_FRETE, TP_ESTUFAGEM, VL_INTER' +
        'VALO_INICIAL, VL_INTERVALO_FINAL, VL_BASE_AG'
      
        '     FROM TPROPOSTA_FRETE_DESPESA WHERE NR_PROPOSTA=:NR_PROPOSTA' +
        ' AND NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      
        '       AND CD_PRODUTO=:CD_PRODUTO   AND  CD_TAB_FRETE = :CD_TAB_' +
        'FRETE AND TP_ESTUFAGEM =:TP_ESTUFAGEM'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_prop_frete_desp
    Left = 175
    Top = 431
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_prop_frete_desp_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.NR_PROPOSTA'
      FixedChar = True
    end
    object qry_prop_frete_desp_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_prop_frete_desp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_prop_frete_desp_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_prop_frete_desp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_ITEM'
      OnChange = qry_prop_frete_desp_CD_ITEMChange
      OnSetText = qry_prop_frete_desp_CD_ITEMSetText
      FixedChar = True
      Size = 3
    end
    object qry_prop_frete_desp_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_prop_frete_desp_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_MOEDA'
      OnSetText = qry_prop_frete_desp_CD_MOEDASetText
      FixedChar = True
      Size = 3
    end
    object qry_prop_frete_desp_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_ORIGEM_DESPESA'
      OnChange = qry_prop_frete_desp_TP_ORIGEM_DESPESAChange
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_desp_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_BASE_DESPESA'
      DisplayFormat = '0.000'
    end
    object qry_prop_frete_desp_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_COMPRA_AG'
      DisplayFormat = '0.000'
    end
    object qry_prop_frete_desp_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_COMPRA_CIA'
      DisplayFormat = '0.000'
    end
    object qry_prop_frete_desp_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_VENDA'
      OnChange = qry_prop_frete_desp_VL_VENDAChange
      DisplayFormat = '0.000'
    end
    object qry_prop_frete_desp_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_desp_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.IN_MENCIONADO'
      OnChange = qry_prop_frete_desp_IN_MENCIONADOChange
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_desp_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_prop_frete_desp_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_desp_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_desp_VL_INTERVALO_INICIAL: TFloatField
      FieldName = 'VL_INTERVALO_INICIAL'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_INTERVALO_INICIAL'
      DisplayFormat = '0.000'
    end
    object qry_prop_frete_desp_VL_INTERVALO_FINAL: TFloatField
      FieldName = 'VL_INTERVALO_FINAL'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_INTERVALO_FINAL'
      DisplayFormat = '0.000'
    end
    object qry_prop_frete_desp_VL_BASE_AG: TFloatField
      FieldName = 'VL_BASE_AG'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_BASE_AG'
      DisplayFormat = '0.000'
    end
    object qry_prop_frete_desp_CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CODIGO'
    end
    object qry_prop_frete_desp_Look_in_mencionado: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_in_mencionado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_MENCIONADO'
      Size = 3
      Lookup = True
    end
    object qry_prop_frete_desp_Look_nm_tp_calc: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_calc'
      LookupDataSet = qry_tp_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Lookup = True
    end
    object qry_prop_frete_desp_Look_origem: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_origem'
      LookupDataSet = qry_origem_desp_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 10
      Lookup = True
    end
    object qry_prop_frete_desp_IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.IN_PROFIT'
      FixedChar = True
      Size = 1
    end
    object qry_prop_frete_desp_Look_profit: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_profit'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PROFIT'
      Size = 3
      Lookup = True
    end
    object qry_prop_frete_desp_calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qry_prop_frete_desp_calcMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMoeda'
      Size = 100
      Calculated = True
    end
    object qry_prop_frete_desp_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.NR_ITEM_PROPOSTA'
    end
  end
  object ds_prop_frete_desp: TDataSource
    DataSet = qry_prop_frete_desp_
    Left = 54
    Top = 431
  end
  object UpDate_prop_frete_desp: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_FRETE_DESPESA'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_ITEM = :CD_ITEM,'
      '  CODIGO = :CODIGO,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  TP_ORIGEM_DESPESA = :TP_ORIGEM_DESPESA,'
      '  VL_BASE_DESPESA = :VL_BASE_DESPESA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  VL_COMPRA_CIA = :VL_COMPRA_CIA,'
      '  VL_VENDA = :VL_VENDA,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  IN_MENCIONADO = :IN_MENCIONADO,'
      '  CD_TAB_REF = :CD_TAB_REF,'
      '  TP_FRETE = :TP_FRETE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VL_INTERVALO_INICIAL = :VL_INTERVALO_INICIAL,'
      '  VL_INTERVALO_FINAL = :VL_INTERVALO_FINAL,'
      '  VL_BASE_AG = :VL_BASE_AG,'
      '  IN_PROFIT = :IN_PROFIT,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CODIGO = :OLD_CODIGO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_FRETE_DESPESA'
      '  (NR_PROPOSTA, CD_SERVICO, CD_PRODUTO, CD_TAB_FRETE, CD_ITEM, '
      'CODIGO, '
      '   TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, '
      'VL_BASE_DESPESA, VL_COMPRA_AG, '
      
        '   VL_COMPRA_CIA, VL_VENDA, IN_DESPESA, IN_MENCIONADO, CD_TAB_RE' +
        'F, '
      'TP_FRETE, '
      '   TP_ESTUFAGEM, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, '
      'VL_BASE_AG, '
      '   IN_PROFIT, NR_ITEM_PROPOSTA)'
      'values'
      
        '  (:NR_PROPOSTA, :CD_SERVICO, :CD_PRODUTO, :CD_TAB_FRETE, :CD_IT' +
        'EM, '
      ':CODIGO, '
      '   :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA, '
      ':VL_BASE_DESPESA, :VL_COMPRA_AG, '
      '   :VL_COMPRA_CIA, :VL_VENDA, :IN_DESPESA, :IN_MENCIONADO, '
      ':CD_TAB_REF, '
      '   :TP_FRETE, :TP_ESTUFAGEM, :VL_INTERVALO_INICIAL, '
      ':VL_INTERVALO_FINAL, '
      '   :VL_BASE_AG, :IN_PROFIT, :NR_ITEM_PROPOSTA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_FRETE_DESPESA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CODIGO = :OLD_CODIGO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 304
    Top = 431
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM FROM TITEM'
      
        ' WHERE CD_VIA_TRANSPORTE = :CD_VIA_TRANSP OR CD_VIA_TRANSPORTE =' +
        #39'10'#39' '
      ' ')
    Left = 459
    Top = 169
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TITEM.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TITEM.NM_ITEM'
      FixedChar = True
      Size = 30
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO FROM TYES_NO')
    Left = 614
    Top = 169
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'DBBROKER.TYES_NO.CD_YESNO'
      FixedChar = True
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'DBBROKER.TYES_NO.TX_YESNO'
      FixedChar = True
      Size = 3
    end
  end
  object qry_tp_base_calc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_BASE_CALC_FRETE, '
      '    NM_TP_BASE_CALC_FRETE'
      '      FROM TTP_BASE_CALC_FRETE'
      'WHERE CD_VIA_TRANSP = '#39'10'#39' OR '
      '     CD_VIA_TRANSP = :CD_VIA_TRANSP')
    Left = 614
    Top = 222
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_tp_base_calc_CD_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'CD_TP_BASE_CALC_FRETE'
      Origin = 'DBBROKER.TTP_BASE_CALC_FRETE.CD_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_tp_base_calc_NM_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'NM_TP_BASE_CALC_FRETE'
      Origin = 'DBBROKER.TTP_BASE_CALC_FRETE.NM_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 100
    end
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, AP_MOEDA FROM TMOEDA_BROKER')
    Left = 614
    Top = 274
    object qry_moeda_broker_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_moeda_broker_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
  end
  object qry_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR'
      '  FROM TTP_CNTR WHERE IN_ATIVO="1"')
    Left = 748
    Top = 222
    object qry_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_cntr_NM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.NM_TP_CNTR'
      FixedChar = True
    end
  end
  object qry_ult_frete_item_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proposta_frete
    SQL.Strings = (
      'SELECT MAX(CD_PROPOSTA_FRETE_ITEM) AS ULTIMO'
      '     FROM TPROPOSTA_FRETE_ITEM'
      
        '      WHERE NR_PROPOSTA=:NR_PROPOSTA AND NR_ITEM_PROPOSTA =:NR_I' +
        'TEM_PROPOSTA AND CD_PRODUTO=:CD_PRODUTO  AND'
      '      CD_TAB_FRETE=:CD_TAB_FRETE'
      ''
      ' ')
    Left = 748
    Top = 117
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_ult_frete_item_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_ITEM.CD_PROPOSTA_FRETE_ITEM'
    end
  end
  object qry_ult_prop_desp_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_proposta_frete
    SQL.Strings = (
      'SELECT MAX(CODIGO) AS ULTIMO'
      ''
      
        '     FROM TPROPOSTA_FRETE_DESPESA WHERE NR_PROPOSTA=:NR_PROPOSTA' +
        ' AND NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      
        '       AND CD_PRODUTO=:CD_PRODUTO AND  CD_TAB_FRETE = :CD_TAB_FR' +
        'ETE'
      ' '
      ' '
      ' ')
    Left = 748
    Top = 13
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ITEM_PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_TAB_FRETE'
        ParamType = ptUnknown
      end>
    object qry_ult_prop_desp_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CODIGO'
    end
  end
  object Update_prop_item: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_ITEM'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_ITEM'
      
        '  (NR_PROPOSTA, CD_INCOTERM, CD_SERVICO, CD_UNID_NEG, CD_VIA_TRA' +
        'NSP, CD_PRODUTO, '
      '   NR_ITEM_PROPOSTA)'
      'values'
      
        '  (:NR_PROPOSTA, :CD_INCOTERM, :CD_SERVICO, :CD_UNID_NEG, :CD_VI' +
        'A_TRANSP, '
      '   :CD_PRODUTO, :NR_ITEM_PROPOSTA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_ITEM'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 304
    Top = 117
  end
  object qry_origem_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '    FROM TORIGEM_DESPESA'
      '  WHERE TP_DESCRICAO = "3"')
    Left = 748
    Top = 274
    object qry_origem_desp_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_origem_desp_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
  end
  object qry_prop_desemb_item: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'SELECT P.NR_PROPOSTA, I.CD_UNID_NEG, I.CD_PRODUTO,'
      '  I.CD_SERVICO, F.CD_ITEM, P.CD_EMPRESA, TE.NM_EMPRESA,'
      
        '  (SELECT NM_ITEM FROM TITEM TI WHERE TI.CD_ITEM = F.CD_ITEM) NM' +
        '_ITEM,'
      
        '  F.CD_SDA, (SELECT TX_DESCRICAO FROM TSDA TS WHERE TS.CD_SDA = ' +
        'F.CD_SDA) NM_SDA,'
      '  F.TP_CALCULO, F.CD_STATUS, P.NM_RESPONSAVEL,'
      '  P.CD_USUARIO,'
      
        '  (SELECT TU.NM_USUARIO FROM TUSUARIO TU WHERE TU.CD_USUARIO = P' +
        '.CD_USUARIO)NM_USUARIO,'
      
        '  (SELECT TC.NM_CALCULO FROM TCALCULO TC WHERE F.TP_CALCULO = CD' +
        '_CALCULO) NM_CALCULO,'
      
        '  (SELECT TC.CD_TABELA FROM TCALCULO TC WHERE F.TP_CALCULO = CD_' +
        'CALCULO) CD_TABELA,'
      '  P.TX_OBS,'
      
        '  (SELECT TS.NM_SERVICO FROM TSERVICO TS WHERE TS.CD_SERVICO = I' +
        '.CD_SERVICO) NM_SERVICO,'
      
        '  TU.NM_UNID_NEG, TU.NR_FONE AS FONE_UNID, TU.NR_FAX1 AS FAX_UNI' +
        'D, TE.NR_TELEFONE AS FONE_EMP'
      '   '
      '  FROM TPROPOSTA_ITEM I, TPROPOSTA_FATURAMENTO F,TPROPOSTA P'
      '  LEFT JOIN TEMPRESA_NAC TE ON(TE.CD_EMPRESA = P.CD_EMPRESA)'
      '  LEFT JOIN TUNID_NEG TU ON (TU.CD_UNID_NEG = P.CD_UNID_NEG)'
      
        '  WHERE    P.NR_PROPOSTA = :NR_PROPOSTA  AND P.NR_PROPOSTA = I.N' +
        'R_PROPOSTA AND'
      '  I.NR_ITEM_PROPOSTA  = F.NR_ITEM_PROPOSTA'
      
        '  AND I.CD_PRODUTO = F.CD_PRODUTO AND I.NR_PROPOSTA = F.NR_PROPO' +
        'STA')
    Left = 614
    Top = 13
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end>
    object qry_prop_desemb_itemNR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
      Size = 14
    end
    object qry_prop_desemb_itemCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_prop_desemb_itemCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_prop_desemb_itemCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_prop_desemb_itemCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_prop_desemb_itemNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_prop_desemb_itemCD_SDA: TStringField
      FieldName = 'CD_SDA'
      FixedChar = True
      Size = 3
    end
    object qry_prop_desemb_itemNM_SDA: TStringField
      FieldName = 'NM_SDA'
      FixedChar = True
      Size = 50
    end
    object qry_prop_desemb_itemTP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      FixedChar = True
      Size = 3
    end
    object qry_prop_desemb_itemCD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_prop_desemb_itemNM_CALCULO: TStringField
      FieldName = 'NM_CALCULO'
      FixedChar = True
      Size = 40
    end
    object qry_prop_desemb_itemCD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      FixedChar = True
      Size = 1
    end
    object qry_prop_desemb_itemCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_prop_desemb_itemNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_prop_desemb_itemNM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      FixedChar = True
    end
    object qry_prop_desemb_itemCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_prop_desemb_itemNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qry_prop_desemb_itemTX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
    object qry_prop_desemb_itemNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_prop_desemb_itemNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_prop_desemb_itemFONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qry_prop_desemb_itemFAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qry_prop_desemb_itemFONE_EMP: TStringField
      FieldName = 'FONE_EMP'
      FixedChar = True
      Size = 15
    end
  end
  object ds_prop_desemb_item: TDataSource
    DataSet = qry_prop_desemb_item
    Left = 459
    Top = 13
  end
end

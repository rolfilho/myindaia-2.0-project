object datm_cotacao: Tdatm_cotacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 65533
  Top = 96
  Height = 780
  Width = 1249
  object qry_cotacao_: TQuery
    CachedUpdates = True
    BeforePost = qry_cotacao_BeforePost
    AfterPost = qry_cotacao_AfterPost
    AfterDelete = qry_cotacao_AfterDelete
    OnNewRecord = qry_cotacao_NewRecord
    OnUpdateError = qry_cotacao_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '  TP.NR_PROPOSTA, TP.PESO_TAXADO, TP.NM_CLIENTE_TEMP,'
      '  TP.CD_STATUS, TP.TX_STATUS,TP.TP_PROPOSTA,'
      
        '  TP.DT_ABERTURA,TP.DT_SOLICITADA,TP.HR_SOLICITADA,TP.DT_ENVIADA' +
        ',TP.HR_ENVIADA,TP.DT_VALIDADE, TP.DT_STATUS, TU.NR_FAX1, TU.NM_E' +
        'MAIL,'
      
        '  TP.CD_UNID_NEG,TU.NM_UNID_NEG, TU.END_UNID_NEG, TU.END_NUMERO,' +
        ' TU.END_BAIRRO, TU.END_CIDADE, TU.END_UF, TU.NR_FONE,'
      '  TP.NR_PROC_COMERC,'
      
        '  TP.CD_EMPRESA, CASE isnull(TP.CD_EMPRESA,'#39#39') WHEN '#39#39' THEN TP.N' +
        'M_CLIENTE_TEMP ELSE TE.AP_EMPRESA END AP_EMPRESA, TE.NM_EMPRESA,' +
        '  TE.CGC_EMPRESA,'
      '  TP.CD_VENDEDOR,         TV.NM_VENDEDOR,'
      
        '  TP.NM_RESPONSAVEL,case tpi.TP_ESTUFAGEM  when '#39'0'#39' then '#39'LCL'#39'  ' +
        'when '#39'1'#39' then '#39'FCL'#39' when '#39'2'#39' then '#39'CS '#39'  else '#39' - '#39' end STR_ESTU' +
        'FAGEM,'
      
        '  TE.IN_COMERCIAL, TP.TX_OBS, TP.TX_OBS_INDAIA, le.DESCRICAO NM_' +
        'DESTINO,'
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
      '  LEFT JOIN TPROPOSTA_ITEM tpi ON tpi.NR_PROPOSTA=tp.NR_PROPOSTA'
      '  LEFT JOIN TPROPOSTA_FRETE pf ON TP.NR_PROPOSTA=pf.NR_PROPOSTA'
      '  LEFT JOIN TLOCAL_EMBARQUE le ON pf.CD_DESTINO=le.CODIGO'
      'where  TP.CD_UNID_NEG=:CD_UNID_NEG AND TP.TP_PROPOSTA = '#39'1'#39
      ''
      ''
      ''
      ''
      'order by'
      
        'tp.DT_ABERTURA, convert(int,substring(tp.NR_PROPOSTA,1,CHARINDEX' +
        '('#39'/'#39',TP.NR_PROPOSTA)-1))'
      ' '
      ' '
      ' '
      ' '
      ' '
      '')
    UpdateObject = UpDate_cotacao
    Left = 825
    Top = 168
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_cotacao_NR_PROPOSTA: TStringField
      Alignment = taCenter
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_cotacao_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cotacao_DT_SOLICITADA: TDateTimeField
      FieldName = 'DT_SOLICITADA'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object qry_cotacao_DT_ENVIADA: TDateTimeField
      FieldName = 'DT_ENVIADA'
    end
    object qry_cotacao_DT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cotacao_DT_STATUS: TDateTimeField
      FieldName = 'DT_STATUS'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cotacao_NR_FAX1: TStringField
      FieldName = 'NR_FAX1'
      FixedChar = True
    end
    object qry_cotacao_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      FixedChar = True
      Size = 100
    end
    object qry_cotacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_cotacao_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_cotacao_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_cotacao_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      FixedChar = True
    end
    object qry_cotacao_NR_PROC_COMERC: TStringField
      FieldName = 'NR_PROC_COMERC'
      FixedChar = True
      Size = 18
    end
    object qry_cotacao_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_cotacao_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_cotacao_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_cotacao_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_NM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      FixedChar = True
    end
    object qry_cotacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_IN_COMERCIAL: TBooleanField
      FieldName = 'IN_COMERCIAL'
    end
    object qry_cotacao_TP_PROPOSTA: TStringField
      FieldName = 'TP_PROPOSTA'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_PESO_TAXADO: TFloatField
      FieldName = 'PESO_TAXADO'
    end
    object qry_cotacao_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
    object qry_cotacao_TX_STATUS: TStringField
      FieldName = 'TX_STATUS'
      FixedChar = True
      Size = 255
    end
    object qry_cotacao_TX_OBS_INDAIA: TMemoField
      FieldName = 'TX_OBS_INDAIA'
      BlobType = ftMemo
    end
    object qry_cotacao_STR_ESTUFAGEM: TStringField
      FieldName = 'STR_ESTUFAGEM'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_HR_SOLICITADA: TFloatField
      FieldName = 'HR_SOLICITADA'
    end
    object qry_cotacao_HR_ENVIADA: TFloatField
      FieldName = 'HR_ENVIADA'
    end
    object qry_cotacao_NM_CLIENTE_TEMP: TStringField
      FieldName = 'NM_CLIENTE_TEMP'
      FixedChar = True
      Size = 80
    end
  end
  object ds_cotacao: TDataSource
    DataSet = qry_cotacao_
    OnDataChange = ds_cotacaoDataChange
    Left = 709
    Top = 168
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, (SELECT TUN.NM_UNID_NEG FR' +
        'OM TUNID_NEG TUN WHERE TUN.CD_UNID_NEG = UH.CD_UNID_NEG)NM_UNID_' +
        'NEG,'
      
        'UH.CD_PRODUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  FROM TU' +
        'SUARIO_HABILITACAO UH'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' '
      ' ')
    Left = 81
    Top = 297
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
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TUSUARIO_HABILITACAO.CD_PRODUTO'
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
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
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
    Left = 237
    Top = 249
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      FixedChar = True
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_unid_neg_VL_ALIQ_ISS: TFloatField
      FieldName = 'VL_ALIQ_ISS'
    end
    object qry_unid_neg_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_unid_neg_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      FixedChar = True
      Size = 3
    end
    object qry_unid_neg_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_unid_neg_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_unid_neg_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
    end
    object qry_unid_neg_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_unid_neg_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_unid_neg_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_unid_neg_IE_UNID_NEG: TStringField
      FieldName = 'IE_UNID_NEG'
      FixedChar = True
    end
    object qry_unid_neg_IM_UNID_NEG: TStringField
      FieldName = 'IM_UNID_NEG'
      FixedChar = True
    end
    object qry_unid_neg_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      FixedChar = True
    end
    object qry_unid_neg_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_unid_neg_NR_FAX1: TStringField
      FieldName = 'NR_FAX1'
      FixedChar = True
    end
    object qry_unid_neg_NR_FAX2: TStringField
      FieldName = 'NR_FAX2'
      FixedChar = True
    end
    object qry_unid_neg_NM_SLOGAN: TStringField
      FieldName = 'NM_SLOGAN'
      FixedChar = True
      Size = 100
    end
    object qry_unid_neg_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      FixedChar = True
      Size = 6
    end
    object qry_unid_neg_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      FixedChar = True
      Size = 100
    end
    object qry_unid_neg_NM_DIRETOR: TStringField
      FieldName = 'NM_DIRETOR'
      FixedChar = True
      Size = 50
    end
    object qry_unid_neg_NR_CPF_DIRETOR: TStringField
      FieldName = 'NR_CPF_DIRETOR'
      FixedChar = True
      Size = 11
    end
    object qry_unid_neg_NM_CONTADOR: TStringField
      FieldName = 'NM_CONTADOR'
      FixedChar = True
      Size = 50
    end
    object qry_unid_neg_NR_CRC_CONTADOR: TStringField
      FieldName = 'NR_CRC_CONTADOR'
      FixedChar = True
      Size = 15
    end
    object qry_unid_neg_NM_PROCURADOR: TStringField
      FieldName = 'NM_PROCURADOR'
      FixedChar = True
      Size = 50
    end
    object qry_unid_neg_NR_CPF_PROCURADOR: TStringField
      FieldName = 'NR_CPF_PROCURADOR'
      FixedChar = True
      Size = 11
    end
    object qry_unid_neg_PATH_RELATORIOS: TStringField
      FieldName = 'PATH_RELATORIOS'
      FixedChar = True
      Size = 100
    end
    object qry_unid_neg_PATH_REI: TStringField
      FieldName = 'PATH_REI'
      FixedChar = True
      Size = 100
    end
    object qry_unid_neg_PATH_SISCOMEX: TStringField
      FieldName = 'PATH_SISCOMEX'
      FixedChar = True
      Size = 100
    end
    object qry_unid_neg_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_unid_neg_VL_PERC_ISS: TFloatField
      FieldName = 'VL_PERC_ISS'
    end
  end
  object qry_incoterms_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '    CODIGO,'
      '    DESCRICAO'
      'from '
      '   TINCOTERMS_VENDA with(nolock)')
    Left = 129
    Top = 297
  end
  object UpDate_cotacao: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  PESO_TAXADO = :PESO_TAXADO,'
      '  CD_STATUS = :CD_STATUS,'
      '  TX_STATUS = :TX_STATUS,'
      '  TP_PROPOSTA = :TP_PROPOSTA,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  DT_SOLICITADA = :DT_SOLICITADA,'
      '  HR_SOLICITADA = :HR_SOLICITADA,'
      '  DT_ENVIADA = :DT_ENVIADA,'
      '  HR_ENVIADA = :HR_ENVIADA,      '
      '  DT_VALIDADE = :DT_VALIDADE,'
      '  DT_STATUS = :DT_STATUS,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  NR_PROC_COMERC = :NR_PROC_COMERC,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_VENDEDOR = :CD_VENDEDOR,'
      '  NM_RESPONSAVEL = :NM_RESPONSAVEL,'
      '  NM_CLIENTE_TEMP = :NM_CLIENTE_TEMP,  '
      '  TX_OBS = :TX_OBS,'
      '  TX_OBS_INDAIA = :TX_OBS_INDAIA,'
      '  CD_USUARIO = :CD_USUARIO'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA'
      '  (NR_PROPOSTA, PESO_TAXADO, CD_STATUS, TX_STATUS, TP_PROPOSTA,'
      
        'DT_ABERTURA, DT_SOLICITADA, HR_SOLICITADA, DT_ENVIADA, HR_ENVIAD' +
        'A,'
      '   DT_VALIDADE, DT_STATUS, CD_UNID_NEG, NR_PROC_COMERC,'
      'CD_EMPRESA, CD_VENDEDOR,'
      
        '   NM_RESPONSAVEL, NM_CLIENTE_TEMP, TX_OBS, TX_OBS_INDAIA, CD_US' +
        'UARIO)'
      'values'
      '  (:NR_PROPOSTA, :PESO_TAXADO, :CD_STATUS, :TX_STATUS,'
      
        ':TP_PROPOSTA, :DT_ABERTURA, :DT_SOLICITADA, :HR_SOLICITADA, :DT_' +
        'ENVIADA, :HR_ENVIADA, :DT_VALIDADE, :DT_STATUS,'
      ':CD_UNID_NEG, :NR_PROC_COMERC,'
      ':CD_EMPRESA,'
      
        '   :CD_VENDEDOR, :NM_RESPONSAVEL, :NM_CLIENTE_TEMP, :TX_OBS, :TX' +
        '_OBS_INDAIA,'
      ':CD_USUARIO)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    Left = 925
    Top = 168
  end
  object qry_empresa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '    CD_EMPRESA,'
      '    NM_EMPRESA,IN_RESTRICAO,'
      '    AP_EMPRESA'
      'from'
      '   TEMPRESA_NAC  '
      'where'
      '    CD_EMPRESA =:CD_EMPRESA  and '
      '    IN_ATIVO = '#39'1'#39
      '')
    Left = 181
    Top = 297
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_empresa_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_empresa_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_empresa_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_RESTRICAO'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
  end
  object qry_cotacao_item_: TQuery
    CachedUpdates = True
    BeforePost = qry_cotacao_item_BeforePost
    AfterPost = qry_cotacao_item_AfterPost
    AfterDelete = qry_cotacao_item_AfterDelete
    AfterScroll = qry_cotacao_item_AfterScroll
    OnCalcFields = qry_cotacao_item_CalcFields
    OnNewRecord = qry_cotacao_item_NewRecord
    OnPostError = qry_cotacao_item_PostError
    OnUpdateError = qry_cotacao_item_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      
        '  TP.NR_PROPOSTA,TP.CD_INCOTERM, TP.VL_PESO_KG, TP.VL_CUBAGEM, T' +
        'P.VL_PESO_TON, TP.QTDE_VOL,'
      
        '  TP.CD_SERVICO, TP.NR_ITEM_PROPOSTA, TS.NM_SERVICO, TS.TP_SERVI' +
        'CO, TP.VL_CUBADO, TP.VL_FRETE_CUSTO,'
      
        '  TP.CD_UNID_NEG,  TU.NM_UNID_NEG, TP.OTHER_VENDA, TP.OTHER_CUST' +
        'O, TP.VL_CUSTO, TP.IN_MINIMO, TP.IN_FIXO, TP.TX_SEMANAL,'
      
        '  TP.CD_VIA_TRANSP, TVT.NM_VIA_TRANSP,TP.TP_ESTUFAGEM, TP.VL_VEN' +
        'DA , TP.VL_CHARGEABLE,TP.VL_CUSTO_UNIT_LCL, TP.VL_VENDA_UNIT_LCL' +
        ','
      
        '  TP.CD_PRODUTO , (SELECT TPR.NM_PRODUTO FROM TPRODUTO TPR WHERE' +
        ' TPR.CD_PRODUTO = TP.CD_PRODUTO) NM_PRODUTO ,'
      
        '  TP.VL_FRETE_VENDA, (SELECT TPR.TP_PRODUTO FROM TPRODUTO TPR WH' +
        'ERE TPR.CD_PRODUTO = TP.CD_PRODUTO) TP_PRODUTO,'
      '  TP.VL_FOB,TP.CD_MOEDA_FOB,'
      
        '  (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = ' +
        'TP.CD_MOEDA_FOB) NM_MOEDA_FOB'
      ''
      'FROM TPROPOSTA_ITEM as TP'
      '  LEFT JOIN TUNID_NEG AS TU'
      '       ON (TU.CD_UNID_NEG = TP.CD_UNID_NEG)'
      '  LEFT JOIN TSERVICO AS TS'
      '       ON (TP.CD_SERVICO = TS.CD_SERVICO)'
      '  LEFT JOIN TVIA_TRANSP_BROKER  AS TVT'
      '       ON (TVT.CD_VIA_TRANSP = TP.CD_VIA_TRANSP)'
      ''
      'WHERE'
      '   TP.NR_PROPOSTA=:NR_PROPOSTA'
      'ORDER BY'
      '  TP.NR_ITEM_PROPOSTA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = UpDAte_cot_item
    Left = 825
    Top = 9
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end>
    object qry_cotacao_item_Look_nm_incoterm: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_incoterm'
      LookupDataSet = qry_incoterms_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODIGO'
      KeyFields = 'CD_INCOTERM'
      Size = 5
      Lookup = True
    end
    object qry_cotacao_item_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_cotacao_item_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_item_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_item_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_item_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_item_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_item_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_item_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_item_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_cotacao_item_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_item_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_cotacao_item_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      OnChange = qry_cotacao_item_TP_ESTUFAGEMChange
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_item_VL_PESO_KG: TFloatField
      FieldName = 'VL_PESO_KG'
      DisplayFormat = '0.000'
    end
    object qry_cotacao_item_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      DisplayFormat = '0.000'
    end
    object qry_cotacao_item_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
      DisplayFormat = '0.000'
    end
    object qry_cotacao_item_VL_CUBADO: TFloatField
      FieldName = 'VL_CUBADO'
      DisplayFormat = '0.000'
    end
    object qry_cotacao_item_VL_FRETE_CUSTO: TFloatField
      FieldName = 'VL_FRETE_CUSTO'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_OTHER_VENDA: TFloatField
      FieldName = 'OTHER_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_OTHER_CUSTO: TFloatField
      FieldName = 'OTHER_CUSTO'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_VL_CUSTO: TFloatField
      FieldName = 'VL_CUSTO'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      OnChange = qry_cotacao_item_VL_VENDAChange
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_VL_CHARGEABLE: TFloatField
      FieldName = 'VL_CHARGEABLE'
      OnChange = qry_cotacao_item_VL_VENDAChange
      DisplayFormat = '0.000'
    end
    object qry_cotacao_item_VL_FRETE_VENDA: TFloatField
      FieldName = 'VL_FRETE_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_QTDE_VOL: TFloatField
      FieldName = 'QTDE_VOL'
    end
    object qry_cotacao_item_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_item_IN_MINIMO: TStringField
      FieldName = 'IN_MINIMO'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_item_IN_FIXO: TStringField
      FieldName = 'IN_FIXO'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_item_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
    end
    object qry_cotacao_item_VL_CUSTO_UNIT_LCL: TFloatField
      FieldName = 'VL_CUSTO_UNIT_LCL'
      OnChange = qry_cotacao_item_VL_CUSTO_UNIT_LCLChange
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_VL_VENDA_UNIT_LCL: TFloatField
      FieldName = 'VL_VENDA_UNIT_LCL'
      OnChange = qry_cotacao_item_VL_VENDA_UNIT_LCLChange
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_VL_FOB: TFloatField
      FieldName = 'VL_FOB'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_item_CD_MOEDA_FOB: TStringField
      FieldName = 'CD_MOEDA_FOB'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_item_NM_MOEDA_FOB: TStringField
      FieldName = 'NM_MOEDA_FOB'
      FixedChar = True
      Size = 6
    end
    object qry_cotacao_item_TX_SEMANAL: TStringField
      FieldName = 'TX_SEMANAL'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_item_VL_RESULTADO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_RESULTADO'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object ds_cotacao_item: TDataSource
    DataSet = qry_cotacao_item_
    Left = 709
    Top = 9
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 81
    Top = 249
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
      '    TS.CD_SERVICO=:CD_SERVICO  and'
      ''
      
        '    TS.CD_SERVICO IN (SELECT TCS.CD_SERVICO FROM TCLIENTE_SERVIC' +
        'O TCS WHERE TCS.CD_UNID_NEG = :CD_UNID_NEG AND TCS.CD_PRODUTO  =' +
        ' :CD_PRODUTO  AND        TCS.CD_CLIENTE  = :CD_CLIENTE )'
      '    AND    TS.IN_ATIVO = '#39'1'#39
      ' '
      ' '
      ' ')
    Left = 285
    Top = 297
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
      FixedChar = True
      Size = 3
    end
    object qry_servico_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      FixedChar = True
      Size = 1
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_servico_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
  end
  object qry_ult_cotacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select convert(varchar,isnull( max( convert(int,   left(ltrim(nr' +
        '_proposta), charindex('#39'/'#39',ltrim(nr_proposta))-1 ) )  ),0)+1)+'#39'/'#39 +
        '+'
      '       substring(convert(varchar,getdate(),103),9,2) ULTIMO'
      
        'from TPROPOSTA where substring(convert(varchar,getdate(),103),9,' +
        '2)='
      
        '                     substring( ltrim(nr_proposta), charindex('#39'/' +
        #39',ltrim(nr_proposta))+1 , 2 )'
      ''
      '')
    Left = 405
    Top = 249
    object qry_ult_cotacao_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      FixedChar = True
      Size = 33
    end
  end
  object UpDAte_cot_item: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_ITEM'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VL_PESO_KG = :VL_PESO_KG,'
      '  VL_PESO_TON = :VL_PESO_TON,'
      '  VL_CUBAGEM = :VL_CUBAGEM,'
      '  VL_CUBADO = :VL_CUBADO,'
      '  VL_CHARGEABLE = :VL_CHARGEABLE,'
      '  VL_FRETE_VENDA = :VL_FRETE_VENDA,'
      '  VL_FRETE_CUSTO = :VL_FRETE_CUSTO,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_CUSTO = :VL_CUSTO,'
      '  VL_CUSTO_UNIT_LCL = :VL_CUSTO_UNIT_LCL,'
      '  VL_VENDA_UNIT_LCL = :VL_VENDA_UNIT_LCL,'
      '  OTHER_CUSTO = :OTHER_CUSTO,'
      '  OTHER_VENDA = :OTHER_VENDA,'
      '  QTDE_VOL = :QTDE_VOL,'
      '  IN_MINIMO = :IN_MINIMO,'
      '  IN_FIXO  = :IN_FIXO,  '
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA,'
      '  VL_FOB= :VL_FOB,'
      '  TX_SEMANAL= :TX_SEMANAL,  '
      '  CD_MOEDA_FOB=:CD_MOEDA_FOB'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA'
      '')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_ITEM'
      '  (NR_PROPOSTA, CD_SERVICO, CD_PRODUTO, CD_UNID_NEG, '
      'CD_VIA_TRANSP, CD_INCOTERM, '
      
        '   TP_ESTUFAGEM, VL_PESO_KG, VL_PESO_TON, VL_CUBAGEM, VL_CUBADO,' +
        ' '
      'VL_CHARGEABLE,'
      '   VL_FRETE_VENDA, VL_FRETE_CUSTO, VL_VENDA, VL_CUSTO,'
      'OTHER_CUSTO, OTHER_VENDA,'
      '   QTDE_VOL, IN_MINIMO,'
      
        'NR_ITEM_PROPOSTA,VL_CUSTO_UNIT_LCL,VL_VENDA_UNIT_LCL,VL_FOB,CD_M' +
        'OEDA_FOB,IN_FIXO,TX_SEMANAL)'
      'values'
      '  (:NR_PROPOSTA, :CD_SERVICO, :CD_PRODUTO, :CD_UNID_NEG,'
      ':CD_VIA_TRANSP,'
      '   :CD_INCOTERM, :TP_ESTUFAGEM, :VL_PESO_KG, :VL_PESO_TON,'
      ':VL_CUBAGEM,'
      '   :VL_CUBADO, :VL_CHARGEABLE, :VL_FRETE_VENDA, :VL_FRETE_CUSTO,'
      ':VL_VENDA,'
      '   :VL_CUSTO, :OTHER_CUSTO, :OTHER_VENDA, :QTDE_VOL, :IN_MINIMO,'
      
        ':NR_ITEM_PROPOSTA,:VL_CUSTO_UNIT_LCL,:VL_VENDA_UNIT_LCL,:VL_FOB,' +
        ':CD_MOEDA_FOB,:IN_FIXO,:TX_SEMANAL)'
      '')
    DeleteSQL.Strings = (
      'delete from TPRODUTO'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA'
      '')
    Left = 925
    Top = 9
  end
  object qry_mercadoria_: TQuery
    CachedUpdates = True
    BeforeInsert = qry_mercadoria_BeforeInsert
    BeforePost = qry_mercadoria_BeforePost
    AfterPost = efetua_calculos
    AfterDelete = efetua_calculos
    AfterScroll = qry_mercadoria_AfterScroll
    OnCalcFields = qry_mercadoria_CalcFields
    OnNewRecord = qry_mercadoria_NewRecord
    OnPostError = qry_mercadoria_PostError
    OnUpdateError = qry_mercadoria_UpdateError
    DatabaseName = 'DBBROKER'
    DataSource = ds_cotacao
    RequestLive = True
    SQL.Strings = (
      'SELECT TPM.NR_PROPOSTA,TPM.TP_CNTR,TPM.CD_PROPOSTA_EMB_ITEM,'
      
        'TPM.TP_ESTUFAGEM,TPM.CD_MERCADORIA, TPM.TX_MERCADORIA,TPM.VL_LAR' +
        'GURA,'
      'TPM.VL_COMPR,TPM.VL_ALTURA,  TPM.VL_PESO_KG, TPM.VL_PESO_TON,'
      
        'TPM.QTD_VOLUMES, TPM.VL_VENDA, TPM.VL_CUSTO,TPM.VL_CUBAGEM_M3, T' +
        'PM.IN_ATIVO, TPM.CD_EMBALAGEM, TPM.CD_NCM, TPM.VL_PESO_KG_LIQ, T' +
        'PM.QTD_EMBALAGEM,TPM.VL_VENDA_TOTAL,TPM.VL_COMPRA_TOTAL,TPM.VL_R' +
        'ESULTADO'
      'FROM TPROPOSTA_MERCADORIA TPM'
      'WHERE TPM.NR_PROPOSTA = :NR_PROPOSTA')
    UpdateObject = UpDate_mercadoria
    Left = 825
    Top = 222
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
        Size = 21
      end>
    object qry_mercadoria_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_mercadoria_CD_PROPOSTA_EMB_ITEM: TIntegerField
      FieldName = 'CD_PROPOSTA_EMB_ITEM'
    end
    object qry_mercadoria_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 3
    end
    object qry_mercadoria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 15
    end
    object qry_mercadoria_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.CD_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_mercadoria_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.CD_NCM'
      FixedChar = True
      Size = 8
    end
    object qry_mercadoria_VL_LARGURA: TFloatField
      FieldName = 'VL_LARGURA'
      OnChange = cubagem_m3
      DisplayFormat = '0.000'
    end
    object qry_mercadoria_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
      OnChange = cubagem_m3
      DisplayFormat = '0.000'
    end
    object qry_mercadoria_VL_ALTURA: TFloatField
      FieldName = 'VL_ALTURA'
      OnChange = cubagem_m3
      DisplayFormat = '0.000'
    end
    object qry_mercadoria_VL_PESO_KG: TFloatField
      FieldName = 'VL_PESO_KG'
      OnChange = Calcula_Cubagem
      DisplayFormat = '0.000'
    end
    object qry_mercadoria_VL_PESO_KG_LIQ: TFloatField
      FieldName = 'VL_PESO_KG_LIQ'
      DisplayFormat = '0.000'
    end
    object qry_mercadoria_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
      DisplayFormat = '0.000'
    end
    object qry_mercadoria_QTD_VOLUMES: TIntegerField
      FieldName = 'QTD_VOLUMES'
      OnChange = cubagem_m3
    end
    object qry_mercadoria_VL_CUBAGEM_M3: TFloatField
      FieldName = 'VL_CUBAGEM_M3'
      OnChange = Calcula_Cubagem
      DisplayFormat = '0.000'
    end
    object qry_mercadoria_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_mercadoria_Look_nm_cntr: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_cntr'
      LookupDataSet = qry_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Lookup = True
    end
    object qry_mercadoria_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      OnChange = qry_mercadoria_VL_VENDAChange
      DisplayFormat = '0.00'
    end
    object qry_mercadoria_VL_CUSTO: TFloatField
      FieldName = 'VL_CUSTO'
      OnChange = qry_mercadoria_VL_CUSTOChange
      DisplayFormat = '0.00'
    end
    object qry_mercadoria_TX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.TX_MERCADORIA'
      FixedChar = True
      Size = 255
    end
    object qry_mercadoria_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_mercadoria_calcEmbalagem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEmbalagem'
      Size = 100
      Calculated = True
    end
    object qry_mercadoria_QTD_EMBALAGEM: TIntegerField
      FieldName = 'QTD_EMBALAGEM'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.QTD_EMBALAGEM'
    end
    object qry_mercadoria_VL_VENDA_TOTAL: TFloatField
      FieldName = 'VL_VENDA_TOTAL'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.VL_VENDA_TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_mercadoria_VL_COMPRA_TOTAL: TFloatField
      FieldName = 'VL_COMPRA_TOTAL'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.VL_COMPRA_TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_mercadoria_VL_RESULTADO: TFloatField
      FieldName = 'VL_RESULTADO'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.VL_RESULTADO'
      DisplayFormat = '0.00'
    end
  end
  object ds_mercadoria: TDataSource
    DataSet = qry_mercadoria_
    OnStateChange = ds_mercadoriaStateChange
    Left = 709
    Top = 222
  end
  object UpDate_mercadoria: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_MERCADORIA'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  TP_CNTR = :TP_CNTR,'
      '  CD_PROPOSTA_EMB_ITEM = :CD_PROPOSTA_EMB_ITEM,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  TX_MERCADORIA = :TX_MERCADORIA,'
      '  VL_LARGURA = :VL_LARGURA,'
      '  VL_COMPR = :VL_COMPR,'
      '  VL_ALTURA = :VL_ALTURA,'
      '  VL_PESO_KG = :VL_PESO_KG,'
      '  VL_PESO_TON = :VL_PESO_TON,'
      '  QTD_VOLUMES = :QTD_VOLUMES,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_CUSTO = :VL_CUSTO,'
      '  VL_CUBAGEM_M3 = :VL_CUBAGEM_M3,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  CD_EMBALAGEM = :CD_EMBALAGEM,'
      '  QTD_EMBALAGEM = :QTD_EMBALAGEM,  '
      '  CD_NCM = :CD_NCM,'
      '  VL_VENDA_TOTAL = :VL_VENDA_TOTAL,'
      '  VL_COMPRA_TOTAL = :VL_COMPRA_TOTAL,'
      '  VL_RESULTADO    = :VL_RESULTADO,'
      '  VL_PESO_KG_LIQ = :VL_PESO_KG_LIQ'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PROPOSTA_EMB_ITEM = :OLD_CD_PROPOSTA_EMB_ITEM')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_MERCADORIA'
      
        '  (NR_PROPOSTA, TP_CNTR, CD_PROPOSTA_EMB_ITEM, TP_ESTUFAGEM, CD_' +
        'MERCADORIA, '
      
        '   TX_MERCADORIA, VL_LARGURA, VL_COMPR, VL_ALTURA, VL_PESO_KG, V' +
        'L_PESO_TON, '
      
        '   QTD_VOLUMES, VL_VENDA, VL_CUSTO, VL_CUBAGEM_M3, IN_ATIVO, CD_' +
        'EMBALAGEM, QTD_EMBALAGEM, '
      
        '   CD_NCM,VL_VENDA_TOTAL,VL_COMPRA_TOTAL,VL_RESULTADO,   VL_PESO' +
        '_KG_LIQ )'
      'values'
      
        '  (:NR_PROPOSTA, :TP_CNTR, :CD_PROPOSTA_EMB_ITEM, :TP_ESTUFAGEM,' +
        ' :CD_MERCADORIA,'
      
        '   :TX_MERCADORIA, :VL_LARGURA, :VL_COMPR, :VL_ALTURA, :VL_PESO_' +
        'KG, :VL_PESO_TON,'
      
        '   :QTD_VOLUMES, :VL_VENDA, :VL_CUSTO, :VL_CUBAGEM_M3, :IN_ATIVO' +
        ', :CD_EMBALAGEM, :QTD_EMBALAGEM,'
      
        '   :CD_NCM,:VL_VENDA_TOTAL,:VL_COMPRA_TOTAL,:VL_RESULTADO, :VL_P' +
        'ESO_KG_LIQ)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_MERCADORIA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PROPOSTA_EMB_ITEM = :OLD_CD_PROPOSTA_EMB_ITEM')
    Left = 925
    Top = 222
  end
  object qry_via_transporte_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CONSTANTE_CUBAGEM'
      '  FROM TVIA_TRANSP_BROKER'
      ' WHERE CD_VIA_TRANSP = :CD_VIA_TRANSP')
    Left = 333
    Top = 249
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end>
    object qry_via_transporte_CONSTANTE_CUBAGEM: TFloatField
      FieldName = 'CONSTANTE_CUBAGEM'
      Origin = 'DBBROKER.TVIA_TRANSP_BROKER.CONSTANTE_CUBAGEM'
    end
  end
  object qry_ult_proposta_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cotacao
    SQL.Strings = (
      'select '
      '   max(CD_PROPOSTA_EMB_ITEM) as ULTIMO'
      'from'
      '   TPROPOSTA_MERCADORIA'
      'where'
      '    NR_PROPOSTA  =:NR_PROPOSTA  ')
    Left = 237
    Top = 297
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end>
    object qry_ult_proposta_mercadoria_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TPROPOSTA_MERCADORIA.CD_PROPOSTA_EMB_ITEM'
    end
  end
  object qry_cotacao_frete_: TQuery
    CachedUpdates = True
    BeforePost = qry_cotacao_frete_BeforePost
    AfterPost = qry_cotacao_frete_AfterPost
    AfterDelete = qry_cotacao_frete_AfterDelete
    OnUpdateError = qry_cotacao_frete_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TPF.NR_PROPOSTA, TPF.CD_SERVICO, TPF.CD_TAB_FRETE_COMPRA,' +
        ' TPF.CD_PRODUTO, TPF.NR_ITEM_PROPOSTA,'
      
        '       TPF.CD_TAB_FRETE, (SELECT TF.DESC_TAB_FRETE FROM TTAB_FRE' +
        'TE TF (NOLOCK) WHERE TF.CD_TAB_FRETE = TPF.CD_TAB_FRETE)NM_TAB_F' +
        'RETE,'
      
        '       TPF.CD_AGENTE, (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE' +
        ' TA.CD_AGENTE = TPF.CD_AGENTE)NM_AGENTE,'
      
        '       TPF.CD_CIA_TRANSP, (SELECT TC.DESCRICAO FROM TTRANSPORTAD' +
        'OR_ITL TC WHERE TC.CODIGO = TPF.CD_CIA_TRANSP)NM_CIA_TRANSP,'
      
        '       TPF.CD_MOEDA,  (SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM ' +
        'WHERE TM.CD_MOEDA = TPF.CD_MOEDA)NM_MOEDA,'
      
        '       TPF.CD_ORIGEM,  (SELECT TP.DESCRICAO  FROM TLOCAL_EMBARQU' +
        'E TP  WHERE  TP.CODIGO = TPF.CD_ORIGEM ) NM_ORIGEM,'
      
        '       TPF.CD_DESTINO, (SELECT TPO.DESCRICAO FROM TLOCAL_EMBARQU' +
        'E TPO WHERE TPO.CODIGO = TPF.CD_DESTINO) NM_DESTINO,'
      
        '       TPF.CD_ARMADOR,(SELECT TAR.DESCRICAO FROM TTRANSPORTADOR_' +
        'ITL TAR WHERE TAR.CODIGO = TPF.CD_ARMADOR)NM_ARMADOR,'
      
        '       TPF.VL_VENDA, TPF.VL_COMPRA, TPF.TP_FREQUENCIA, TPF.TRASM' +
        'IT_TIME, TPF.NR_FREE_TIME_DEMURRAGE,TPF.TP_CARGA,   '
      
        '       TPF.CD_PORTO_TRANSBORDO,   (SELECT TP1.DESCRICAO FROM TLO' +
        'CAL_EMBARQUE TP1 WHERE TP1.CODIGO = TPF.CD_PORTO_TRANSBORDO  ) N' +
        'M_TRANSBORDO,'
      
        '       TPF.CD_PORTO_TRANSBORDO_2, (SELECT TP2.DESCRICAO FROM TLO' +
        'CAL_EMBARQUE TP2 WHERE TP2.CODIGO = TPF.CD_PORTO_TRANSBORDO_2) N' +
        'M_TRANSBORDO_2'
      '  FROM TPROPOSTA_FRETE TPF'
      ' WHERE TPF.NR_PROPOSTA       = :NR_PROPOSTA AND'
      '       TPF.NR_ITEM_PROPOSTA  = :NR_ITEM_PROPOSTA  AND'
      '       TPF.CD_PRODUTO        = :CD_PRODUTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = UpDate_cotacao_frete
    Left = 825
    Top = 62
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
    object qry_cotacao_frete_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object qry_cotacao_frete_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_frete_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_cotacao_frete_CD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      FixedChar = True
      Size = 6
    end
    object qry_cotacao_frete_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_frete_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_cotacao_frete_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_frete_NM_CIA_TRANSP: TStringField
      FieldName = 'NM_CIA_TRANSP'
      FixedChar = True
      Size = 60
    end
    object qry_cotacao_frete_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_frete_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_cotacao_frete_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_frete_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_frete_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_frete_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_frete_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_frete_VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_frete_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_frete_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_frete_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_frete_NM_TAB_FRETE: TStringField
      FieldName = 'NM_TAB_FRETE'
      FixedChar = True
      Size = 80
    end
    object qry_cotacao_frete_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_cotacao_frete_CD_PORTO_TRANSBORDO: TStringField
      FieldName = 'CD_PORTO_TRANSBORDO'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_frete_NM_TRANSBORDO: TStringField
      FieldName = 'NM_TRANSBORDO'
      FixedChar = True
      Size = 50
    end
    object qry_cotacao_frete_TP_FREQUENCIA: TStringField
      FieldName = 'TP_FREQUENCIA'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_frete_TRASMIT_TIME: TStringField
      FieldName = 'TRASMIT_TIME'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_frete_NR_FREE_TIME_DEMURRAGE: TStringField
      FieldName = 'NR_FREE_TIME_DEMURRAGE'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_frete_TP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_frete_CD_PORTO_TRANSBORDO_2: TStringField
      FieldName = 'CD_PORTO_TRANSBORDO_2'
      FixedChar = True
      Size = 4
    end
    object qry_cotacao_frete_NM_TRANSBORDO_2: TStringField
      FieldName = 'NM_TRANSBORDO_2'
      FixedChar = True
      Size = 50
    end
  end
  object ds_cotacao_frete: TDataSource
    DataSet = qry_cotacao_frete_
    Left = 709
    Top = 62
  end
  object UpDate_cotacao_frete: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_FRETE'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_TAB_FRETE_COMPRA = :CD_TAB_FRETE_COMPRA,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA,'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_CIA_TRANSP = :CD_CIA_TRANSP,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_COMPRA = :VL_COMPRA,'
      '  TP_FREQUENCIA = :TP_FREQUENCIA,'
      '  TRASMIT_TIME = :TRASMIT_TIME,'
      '  TP_CARGA = :TP_CARGA,'
      '  NR_FREE_TIME_DEMURRAGE = :NR_FREE_TIME_DEMURRAGE,'
      '  CD_PORTO_TRANSBORDO = :CD_PORTO_TRANSBORDO,'
      '  CD_PORTO_TRANSBORDO_2 = :CD_PORTO_TRANSBORDO_2'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_FRETE'
      '  (NR_PROPOSTA'
      '   , CD_SERVICO'
      '   , CD_TAB_FRETE_COMPRA'
      '   , CD_PRODUTO'
      '   , NR_ITEM_PROPOSTA'
      '   , CD_TAB_FRETE'
      '   , CD_AGENTE'
      '   , CD_CIA_TRANSP'
      '   , CD_MOEDA'
      '   , CD_ORIGEM'
      '   , CD_DESTINO'
      '   , CD_ARMADOR'
      '   , VL_VENDA'
      '   , VL_COMPRA'
      '   , TP_FREQUENCIA'
      '   , TRASMIT_TIME'
      '   , NR_FREE_TIME_DEMURRAGE'
      '   , CD_PORTO_TRANSBORDO'
      '   , CD_PORTO_TRANSBORDO_2'
      '   , TP_CARGA)'
      'values'
      '  (:NR_PROPOSTA'
      '  , :CD_SERVICO'
      '  , :CD_TAB_FRETE_COMPRA'
      '  , :CD_PRODUTO'
      '  , :NR_ITEM_PROPOSTA'
      '  , :CD_TAB_FRETE'
      '  , :CD_AGENTE'
      '  , :CD_CIA_TRANSP'
      '  , :CD_MOEDA'
      '  , :CD_ORIGEM'
      '  , :CD_DESTINO'
      '  , :CD_ARMADOR'
      '  , :VL_VENDA '
      '  , :VL_COMPRA'
      '  , :TP_FREQUENCIA'
      '  , :TRASMIT_TIME'
      '  , :NR_FREE_TIME_DEMURRAGE'
      '  , :CD_PORTO_TRANSBORDO '
      '  , :CD_PORTO_TRANSBORDO_2'
      '  , :TP_CARGA)')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_FRETE'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA')
    Left = 925
    Top = 62
  end
  object qry_cotacao_despesa_: TQuery
    CachedUpdates = True
    BeforePost = qry_cotacao_despesa_BeforePost
    AfterPost = qry_cotacao_despesa_AfterPost
    AfterDelete = qry_cotacao_despesa_AfterDelete
    OnCalcFields = qry_cotacao_despesa_CalcFields
    OnNewRecord = qry_cotacao_despesa_NewRecord
    OnUpdateError = qry_cotacao_despesa_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROPOSTA, NR_ITEM_PROPOSTA, CD_SERVICO, CD_PRODUTO, CD' +
        '_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPES' +
        'A, CODIGO,'
      
        '   VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA, IN_DE' +
        'SPESA, IN_MENCIONADO, CD_TAB_REF, VL_BASE_AG,'
      
        '   TP_FRETE, TP_ESTUFAGEM, VL_INTERVALO_INICIAL, VL_INTERVALO_FI' +
        'NAL, IN_PROFIT, VL_MINIMO, VL_MINIMO_COMPRA, VL_VENDA_TOTAL, VL_' +
        'COMPRA_TOTAL,VL_RESULTADO'
      '      FROM TPROPOSTA_FRETE_DESPESA'
      
        '        WHERE NR_PROPOSTA=:NR_PROPOSTA AND NR_ITEM_PROPOSTA =:NR' +
        '_ITEM_PROPOSTA'
      '            AND TP_ESTUFAGEM = :TP_ESTUFAGEM '
      
        '            order by case TP_ORIGEM_DESPESA when '#39'A'#39' then 0 else' +
        ' TP_ORIGEM_DESPESA end -- IMPORTANTE PARA O CALCULO ESTA ORDEM (' +
        'acompanha frete, origem e destino)'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDate_despesa
    Left = 825
    Top = 119
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
        Name = 'TP_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_cotacao_despesa_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.NR_PROPOSTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
    end
    object qry_cotacao_despesa_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_despesa_CD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_TAB_FRETE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object qry_cotacao_despesa_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnChange = qry_cotacao_despesa_CD_ITEMChange
      OnSetText = qry_cotacao_despesa_CD_ITEMSetText
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_despesa_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_despesa_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_MOEDA'
      OnSetText = qry_cotacao_despesa_CD_MOEDASetText
      FixedChar = True
      Size = 3
    end
    object qry_cotacao_despesa_TP_ORIGEM_DESPESA: TStringField
      FieldName = 'TP_ORIGEM_DESPESA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_ORIGEM_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_despesa_VL_BASE_DESPESA: TFloatField
      FieldName = 'VL_BASE_DESPESA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_BASE_DESPESA'
      OnChange = qry_cotacao_despesa_VL_BASE_DESPESAChange
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_COMPRA_AG'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_VL_COMPRA_CIA: TFloatField
      FieldName = 'VL_COMPRA_CIA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_COMPRA_CIA'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_VENDA'
      OnChange = qry_cotacao_despesa_VL_VENDAChange
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_IN_DESPESA: TStringField
      FieldName = 'IN_DESPESA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.IN_DESPESA'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_despesa_IN_MENCIONADO: TStringField
      FieldName = 'IN_MENCIONADO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.IN_MENCIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_despesa_CD_TAB_REF: TStringField
      FieldName = 'CD_TAB_REF'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_TAB_REF'
      FixedChar = True
      Size = 6
    end
    object qry_cotacao_despesa_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_despesa_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_despesa_VL_INTERVALO_INICIAL: TFloatField
      FieldName = 'VL_INTERVALO_INICIAL'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_INTERVALO_INICIAL'
      DisplayFormat = '0.000'
    end
    object qry_cotacao_despesa_VL_INTERVALO_FINAL: TFloatField
      FieldName = 'VL_INTERVALO_FINAL'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_INTERVALO_FINAL'
      DisplayFormat = '0.000'
    end
    object qry_cotacao_despesa_Look_nm_mencionado: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_mencionado'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_MENCIONADO'
      Size = 3
      Lookup = True
    end
    object qry_cotacao_despesa_Look_nm_despesa_por: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_despesa_por'
      LookupDataSet = qry_despesa_por_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 15
      Lookup = True
    end
    object qry_cotacao_despesa_Look_nm_tp_calc: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_calc'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_FRETE'
      LookupResultField = 'NM_TP_BASE_CALC_FRETE'
      KeyFields = 'TP_BASE_CALCULO'
      Size = 40
      Lookup = True
    end
    object qry_cotacao_despesa_Look_nm_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA'
      Size = 5
      Lookup = True
    end
    object qry_cotacao_despesa_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_cotacao_despesa_Look_nm_origem_custo: TStringField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Look_nm_origem_custo'
      LookupDataSet = qry_orig_desp_
      LookupKeyFields = 'CD_ORIGEM_DESP'
      LookupResultField = 'NM_ORIGEM_DESP'
      KeyFields = 'TP_ORIGEM_DESPESA'
      Size = 10
      Lookup = True
    end
    object qry_cotacao_despesa_CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_cotacao_despesa_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.CD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 2
    end
    object qry_cotacao_despesa_IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.IN_PROFIT'
      FixedChar = True
      Size = 1
    end
    object qry_cotacao_despesa_Look_in_profit: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_in_profit'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_PROFIT'
      Size = 3
      Lookup = True
    end
    object qry_cotacao_despesa_calc_tp_base: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_base'
      Size = 30
      Calculated = True
    end
    object qry_cotacao_despesa_VL_BASE_AG: TFloatField
      FieldName = 'VL_BASE_AG'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_BASE_AG'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qry_cotacao_despesa_calcMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMoeda'
      Size = 100
      Calculated = True
    end
    object qry_cotacao_despesa_NR_ITEM_PROPOSTA: TIntegerField
      FieldName = 'NR_ITEM_PROPOSTA'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.NR_ITEM_PROPOSTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_cotacao_despesa_VL_MINIMO: TFloatField
      FieldName = 'VL_MINIMO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_MINIMO'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_VL_MINIMO_COMPRA: TFloatField
      FieldName = 'VL_MINIMO_COMPRA'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_VL_VENDA_TOTAL: TFloatField
      FieldName = 'VL_VENDA_TOTAL'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_VENDA_TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_VL_COMPRA_TOTAL: TFloatField
      FieldName = 'VL_COMPRA_TOTAL'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_COMPRA_TOTAL'
      DisplayFormat = '0.00'
    end
    object qry_cotacao_despesa_VL_RESULTADO: TFloatField
      FieldName = 'VL_RESULTADO'
      Origin = 'DBBROKER.TPROPOSTA_FRETE_DESPESA.VL_RESULTADO'
      DisplayFormat = '0.00'
    end
  end
  object ds_cotacao_despesa: TDataSource
    DataSet = qry_cotacao_despesa_
    Left = 709
    Top = 119
  end
  object UpDate_despesa: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPOSTA_FRETE_DESPESA'
      'set'
      '  NR_PROPOSTA = :NR_PROPOSTA,'
      '  NR_ITEM_PROPOSTA = :NR_ITEM_PROPOSTA,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_TAB_FRETE = :CD_TAB_FRETE,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  TP_ORIGEM_DESPESA = :TP_ORIGEM_DESPESA,'
      '  CODIGO = :CODIGO,'
      '  VL_BASE_DESPESA = :VL_BASE_DESPESA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  VL_COMPRA_CIA = :VL_COMPRA_CIA,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_VENDA_TOTAL = :VL_VENDA_TOTAL,'
      '  VL_COMPRA_TOTAL = :VL_COMPRA_TOTAL,'
      '  VL_RESULTADO = :VL_RESULTADO,'
      '  IN_DESPESA = :IN_DESPESA,'
      '  IN_MENCIONADO = :IN_MENCIONADO,'
      '  CD_TAB_REF = :CD_TAB_REF,'
      '  VL_BASE_AG = :VL_BASE_AG,'
      '  VL_MINIMO = :VL_MINIMO,'
      '  VL_MINIMO_COMPRA = :VL_MINIMO_COMPRA,'
      '  TP_FRETE = :TP_FRETE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  VL_INTERVALO_INICIAL = :VL_INTERVALO_INICIAL,'
      '  VL_INTERVALO_FINAL = :VL_INTERVALO_FINAL,'
      '  IN_PROFIT = :IN_PROFIT'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TPROPOSTA_FRETE_DESPESA'
      '  (NR_PROPOSTA, NR_ITEM_PROPOSTA, CD_SERVICO, CD_PRODUTO, '
      'CD_TAB_FRETE, '
      
        '   CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, CODIGO' +
        ', '
      'VL_BASE_DESPESA, '
      '   VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA, IN_DESPESA, '
      'IN_MENCIONADO, CD_TAB_REF, '
      '   VL_BASE_AG, TP_FRETE, TP_ESTUFAGEM, VL_INTERVALO_INICIAL, '
      'VL_INTERVALO_FINAL, '
      
        '   IN_PROFIT, VL_MINIMO ,VL_MINIMO_COMPRA, VL_VENDA_TOTAL, VL_CO' +
        'MPRA_TOTAL, VL_RESULTADO'
      ''
      ''
      ''
      '   )'
      'values'
      '  (:NR_PROPOSTA, :NR_ITEM_PROPOSTA, :CD_SERVICO, :CD_PRODUTO,'
      ':CD_TAB_FRETE,'
      '   :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA,'
      ':CODIGO,'
      '   :VL_BASE_DESPESA, :VL_COMPRA_AG, :VL_COMPRA_CIA, :VL_VENDA,'
      ':IN_DESPESA,'
      '   :IN_MENCIONADO, :CD_TAB_REF, :VL_BASE_AG, :TP_FRETE,'
      ':TP_ESTUFAGEM,'
      
        '   :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL, :IN_PROFIT , :VL_' +
        'MINIMO, :VL_MINIMO_COMPRA, :VL_VENDA_TOTAL, :VL_COMPRA_TOTAL, :V' +
        'L_RESULTADO'
      ''
      ''
      '   )')
    DeleteSQL.Strings = (
      'delete from TPROPOSTA_FRETE_DESPESA'
      'where'
      '  NR_PROPOSTA = :OLD_NR_PROPOSTA and'
      '  NR_ITEM_PROPOSTA = :OLD_NR_ITEM_PROPOSTA and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE and'
      '  CD_ITEM = :OLD_CD_ITEM and'
      '  CODIGO = :OLD_CODIGO')
    Left = 925
    Top = 115
  end
  object qry_orig_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '  FROM TORIGEM_DESPESA WHERE TP_DESCRICAO = '#39'3'#39)
    Left = 129
    Top = 249
    object qry_orig_desp_CD_ORIGEM_DESP: TStringField
      FieldName = 'CD_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.CD_ORIGEM_DESP'
      FixedChar = True
      Size = 1
    end
    object qry_orig_desp_NM_ORIGEM_DESP: TStringField
      FieldName = 'NM_ORIGEM_DESP'
      Origin = 'DBBROKER.TORIGEM_DESPESA.NM_ORIGEM_DESP'
      FixedChar = True
    end
  end
  object qry_base_calc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_BASE_CALC_FRETE, NM_TP_BASE_CALC_FRETE'
      'FROM TTP_BASE_CALC_FRETE  (NOLOCK)'
      
        'WHERE (CD_TP_BASE_CALC_FRETE =  '#39'3'#39' )  OR (CD_TP_BASE_CALC_FRETE' +
        ' IN ('#39'22'#39','#39'23'#39','#39'25'#39','#39'26'#39') ) OR'
      
        '     ( (CD_TP_BASE_CALC_FRETE = '#39'19'#39') AND (:ESTUFAGEM = '#39'2'#39') ) O' +
        'R'
      
        '     ( (CD_TP_BASE_CALC_FRETE = '#39'20'#39') AND (:ESTUFAGEM = '#39'2'#39') ) O' +
        'R'
      
        '     ( (CD_TP_BASE_CALC_FRETE = '#39'21'#39') AND (:ESTUFAGEM = '#39'2'#39') ) O' +
        'R'
      
        '     ( (CD_TP_BASE_CALC_FRETE = '#39'1'#39')  AND (:ESTUFAGEM IN ('#39'0'#39','#39'1' +
        #39') ) ) OR'
      
        '     ( (CD_TP_BASE_CALC_FRETE = '#39'19'#39') AND (:ESTUFAGEM = '#39'0'#39') ) O' +
        'R'
      
        '     ( (CD_TP_BASE_CALC_FRETE = '#39'24'#39') AND (:ESTUFAGEM = '#39'2'#39') ) O' +
        'R     '
      
        '     ( (CD_TP_BASE_CALC_FRETE IN ('#39'10'#39','#39'11'#39','#39'12'#39','#39'18'#39')) AND (:ES' +
        'TUFAGEM = '#39'1'#39'))')
    Left = 285
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_base_calc_CD_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'CD_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 2
    end
    object qry_base_calc_NM_TP_BASE_CALC_FRETE: TStringField
      FieldName = 'NM_TP_BASE_CALC_FRETE'
      FixedChar = True
      Size = 100
    end
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT AP_MOEDA, CD_MOEDA, NM_MOEDA FROM TMOEDA_BROKER ORDER BY ' +
        'NM_MOEDA')
    Left = 405
    Top = 297
    object qry_moeda_broker_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_moeda_broker_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qry_moeda_broker_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.AP_MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object qry_despesa_por_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ORIGEM_DESP, NM_ORIGEM_DESP'
      '    FROM TORIGEM_DESPESA'
      '  WHERE TP_DESCRICAO = "3"')
    Left = 480
    Top = 249
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM'
      'ORDER BY NM_ITEM')
    Left = 22
    Top = 249
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
    Left = 333
    Top = 297
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
  object qry_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_TP_CNTR, TP_CNTR FROM TTP_CNTR'
      '   WHERE IN_ATIVO = '#39'1'#39)
    Left = 22
    Top = 297
    object qry_cntr_NM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.NM_TP_CNTR'
      FixedChar = True
    end
    object qry_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.TP_CNTR'
      FixedChar = True
      Size = 2
    end
  end
  object qry_mercadoria_fcl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '    TPM.NR_PROPOSTA,TPM.TP_CNTR,'
      '    TPM.CD_PROPOSTA_EMB_ITEM,'
      '    TPM.TP_ESTUFAGEM,'
      
        '    TPM.CD_MERCADORIA, (SELECT TM.AP_MERCADORIA FROM TMERCADORIA' +
        ' TM WHERE TM.CD_MERCADORIA = TPM.CD_MERCADORIA)AP_MERCADORIA,'
      '    TPM.VL_LARGURA, TPM.VL_COMPR,'
      '    TPM.VL_ALTURA,  TPM.VL_PESO_KG, TPM.VL_PESO_TON,'
      '    TPM.QTD_VOLUMES, TPM.VL_VENDA, TPM.VL_CUSTO,'
      '    TPM.VL_CUBAGEM_M3,'
      
        '    (SELECT TC.NM_TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_CNTR = TP' +
        'M.TP_CNTR)NM_CNTR'
      'from'
      '    TPROPOSTA_MERCADORIA TPM'
      'where'
      '    TPM.NR_PROPOSTA    =:NR_PROPOSTA'
      ''
      ''
      ''
      ' '
      ' ')
    Left = 533
    Top = 42
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_fcl_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_mercadoria_fcl_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_mercadoria_fcl_CD_PROPOSTA_EMB_ITEM: TIntegerField
      FieldName = 'CD_PROPOSTA_EMB_ITEM'
    end
    object qry_mercadoria_fcl_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 3
    end
    object qry_mercadoria_fcl_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qry_mercadoria_fcl_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object qry_mercadoria_fcl_VL_LARGURA: TFloatField
      FieldName = 'VL_LARGURA'
    end
    object qry_mercadoria_fcl_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
    end
    object qry_mercadoria_fcl_VL_ALTURA: TFloatField
      FieldName = 'VL_ALTURA'
    end
    object qry_mercadoria_fcl_VL_PESO_KG: TFloatField
      FieldName = 'VL_PESO_KG'
    end
    object qry_mercadoria_fcl_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
    end
    object qry_mercadoria_fcl_QTD_VOLUMES: TIntegerField
      FieldName = 'QTD_VOLUMES'
    end
    object qry_mercadoria_fcl_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_mercadoria_fcl_VL_CUSTO: TFloatField
      FieldName = 'VL_CUSTO'
    end
    object qry_mercadoria_fcl_VL_CUBAGEM_M3: TFloatField
      FieldName = 'VL_CUBAGEM_M3'
    end
    object qry_mercadoria_fcl_NM_CNTR: TStringField
      FieldName = 'NM_CNTR'
      FixedChar = True
    end
    object qry_mercadoria_fcl_calc_tt_frete: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_tt_frete'
      Calculated = True
    end
  end
  object ds_merc_fcl: TDataSource
    DataSet = qry_mercadoria_fcl_
    Left = 429
    Top = 42
  end
  object qry_merc_aerea_lcl_: TQuery
    OnCalcFields = qry_merc_aerea_lcl_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  TI.VL_PESO_KG, TI.VL_PESO_TON, TI.VL_CUBAGEM, TI.VL_CUBA' +
        'DO, TI.VL_CHARGEABLE, TI.VL_FRETE_VENDA,TI.VL_VENDA'
      ''
      '   FROM TPROPOSTA_ITEM TI'
      '      WHERE TI.NR_PROPOSTA = :NR_PROPOSTA'
      ' ')
    Left = 533
    Top = 146
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROPOSTA'
        ParamType = ptUnknown
      end>
    object qry_merc_aerea_lcl_VL_PESO_KG: TFloatField
      FieldName = 'VL_PESO_KG'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.VL_PESO_KG'
    end
    object qry_merc_aerea_lcl_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.VL_PESO_TON'
    end
    object qry_merc_aerea_lcl_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.VL_CUBAGEM'
    end
    object qry_merc_aerea_lcl_VL_CUBADO: TFloatField
      FieldName = 'VL_CUBADO'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.VL_CUBADO'
    end
    object qry_merc_aerea_lcl_VL_CHARGEABLE: TFloatField
      FieldName = 'VL_CHARGEABLE'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.VL_CHARGEABLE'
    end
    object qry_merc_aerea_lcl_VL_FRETE_VENDA: TFloatField
      FieldName = 'VL_FRETE_VENDA'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.VL_FRETE_VENDA'
    end
    object qry_merc_aerea_lcl_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TPROPOSTA_ITEM.VL_VENDA'
    end
    object qry_merc_aerea_lcl_calc_tp_frete: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_tp_frete'
      Size = 50
      Calculated = True
    end
  end
  object ds_merc_aerea_lcl: TDataSource
    DataSet = qry_merc_aerea_lcl_
    Left = 429
    Top = 146
  end
  object qry_tp_frequencia_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTIPO_FREQUENCIA'
      '')
    Left = 533
    Top = 94
    object qry_tp_frequencia_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTIPO_FREQUENCIA.CODIGO'
      FixedChar = True
      Size = 1
    end
    object qry_tp_frequencia_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TTIPO_FREQUENCIA.DESCRICAO'
      FixedChar = True
      Size = 30
    end
  end
  object qryRelProposta: TQuery
    AutoCalcFields = False
    OnCalcFields = qryRelPropostaCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT Upper(EN.NM_EMPRESA) NM_EMPRESA_DB , Upper(P.NM_RESPONSAV' +
        'EL) NM_CONTATO,'
      '       Upper('
      '       (RTRIM(ISNULL(EN.END_EMPRESA, '#39#39')) + '#39', '#39'  +'
      '        RTRIM(ISNULL(EN.END_NUMERO, '#39#39'))  + '#39' '#39'   +'
      '        RTRIM(ISNULL(EN.END_COMPL, '#39#39'))   + '#39' - '#39' +'
      '        RTRIM(ISNULL(EN.END_BAIRRO, '#39#39')))) AS END_EMPRESA,'
      '        Upper('
      '       (RTRIM(ISNULL(EN.END_CIDADE, '#39#39')) + '#39', '#39' +'
      '        RTRIM(ISNULL(EN.END_UF, '#39#39'))     + '#39' '#39'  +'
      '        SUBSTRING(EN.END_CEP, 1, 5)      + '#39'-'#39'  +'
      '        SUBSTRING(EN.END_CEP, 6, 3))) AS END_EMPRESA2,'
      '       Upper(PC.NM_EMAIL) AS EMAIL_CLIENTE,'
      '       EN.NR_TELEFONE AS FONE_EMPRESA, EN.NR_FAX AS FAX_EMPRESA,'
      '       P.NR_PROPOSTA,'
      
        '       Upper(UN.NM_UNID_NEG) NM_UNID_NEG, Upper(U.NM_USUARIO) AS' +
        ' NM_USUARIO,'
      '       Upper('
      '       (RTRIM(ISNULL(UN.END_UNID_NEG, '#39#39')) + '#39', '#39'  +'
      '        RTRIM(ISNULL(UN.END_NUMERO, '#39#39'))   + '#39' '#39'   +'
      '        RTRIM(ISNULL(UN.END_COMPL, '#39#39'))    + '#39' - '#39' +'
      '        RTRIM(ISNULL(UN.END_BAIRRO, '#39#39')))) AS END_UNID_NEG,'
      '       Upper('
      '       (RTRIM(ISNULL(UN.END_CIDADE, '#39#39'))  + '#39', '#39' +'
      '        RTRIM(ISNULL(UN.END_UF, '#39#39'))      + '#39' '#39'  +'
      '        SUBSTRING(UN.END_CEP, 1, 5)       + '#39'-'#39'  +'
      '        SUBSTRING(UN.END_CEP, 6, 3))) AS END_UNID_NEG2,'
      '       UN.NR_FONE AS FONE_UNID, UN.NR_FAX1 AS FAX_UNID,'
      '       U.NM_EMAIL AS EMAIL_UNID,'
      '       upper(PR.CD_INCOTERM) CD_INCOTERM,'
      '       (CASE PR.TP_ESTUFAGEM'
      '          WHEN '#39'0'#39' THEN '#39'LCL'#39
      '          WHEN '#39'1'#39' THEN '#39'FCL'#39
      '          WHEN '#39'2'#39' THEN '#39'UNTIED LOAD'#39
      '        END) AS TP_ESTUFAGEM,'
      ''
      '       case PR.CD_VIA_TRANSP when '#39'04'#39' then'
      
        '          Upper(isnull(P1.CD_SIGLA,'#39#39') +'#39'-'#39'+isnull(P1.NM_CIDADE,' +
        #39#39')+'#39', '#39'+isNull(Pa1.NM_PAIS,'#39#39'))'
      '       else'
      
        '          upper(isnull(rtrim(UF1.NM_UF),'#39#39')+'#39'-'#39'+isnull(P1.DESCRI' +
        'CAO,'#39#39')+'#39', '#39'+isNull(Pa1.NM_PAIS,'#39#39'))'
      '       end LOCAL_ORIGEM,'
      ''
      '       case PR.CD_VIA_TRANSP when '#39'04'#39' then'
      
        '          Upper(isnull(P2.CD_SIGLA,'#39#39') +'#39'-'#39'+isnull(P2.NM_CIDADE,' +
        #39#39')+'#39', '#39'+isNull(Pa2.NM_PAIS,'#39#39'))'
      '       else'
      
        '          Upper(isnull(rtrim(UF2.NM_UF),'#39#39')+'#39'-'#39'+isnull(P2.DESCRI' +
        'CAO,'#39#39')+'#39', '#39'+isNull(Pa2.NM_PAIS,'#39#39'))'
      '       end LOCAL_DESTINO,'
      ''
      '       Upper(P3.DESCRICAO) AS LOCAL_TRANSB,'
      '       Upper(P4.DESCRICAO) AS LOCAL_TRANSB_2,'
      ''
      
        '     case isnull(PF.CD_PORTO_TRANSBORDO,'#39#39')+isnull(PF.CD_PORTO_T' +
        'RANSBORDO_2,'#39#39')'
      '     when '#39#39'  then '#39'DIRECT'#39
      '     else'
      '       case isnull(PF.CD_PORTO_TRANSBORDO_2,'#39#39')'
      
        '          when '#39#39' then  upper(isNull(ltrim(rtrim(P3.DESCRICAO)),' +
        #39#39'))'
      '          else'
      
        '            Upper(isNull(ltrim(rtrim(P3.DESCRICAO)),'#39#39') +'#39' / '#39'+ ' +
        'isNull(ltrim(rtrim(P4.DESCRICAO)),'#39#39'))'
      '       end'
      ''
      'end Rota,'
      ''
      ''
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) W' +
        'HERE M.CD_MOEDA = PF.CD_MOEDA)'
      '       END AS AP_MOEDA,'
      ''
      '       PR.VL_VENDA_UNIT_LCL VL_VENDA,'
      
        '       (  PR.VL_VENDA_UNIT_LCL  *  ( case PR.IN_FIXO when '#39'1'#39' th' +
        'en 1 else PR.VL_CHARGEABLE end )  ) as VL_FREIGHT,'
      ''
      '       PR.VL_CUSTO_UNIT_LCL VL_COMPRA,'
      
        '       (  PR.VL_CUSTO_UNIT_LCL  *  ( case PR.IN_FIXO when '#39'1'#39' th' +
        'en 1 else  PR.VL_CHARGEABLE end ) ) as VL_COMPRA_TOTAL,'
      ''
      
        '       case pr.cd_via_transp when '#39'01'#39' then '#39'BY SEA'#39' when '#39'04'#39' t' +
        'hen '#39'BY AIR'#39' else '#39'-'#39' end VIA_TRANSP,'
      
        '       (SELECT PROD.AP_PRODUTO FROM TPRODUTO PROD (NOLOCK) WHERE' +
        ' PROD.CD_PRODUTO = PR.CD_PRODUTO) AS PRODUTO,P.TX_OBS_INDAIA AS ' +
        'REMARKS_INDAIA,'
      
        '       P.TX_OBS AS REMARKS, CONVERT(VARCHAR, CONVERT(DATETIME, P' +
        '.DT_VALIDADE, 103), 103) AS DT_VALID,'
      
        '       Upper((SELECT TTF.DESCRICAO FROM TTIPO_FREQUENCIA TTF (NO' +
        'LOCK) WHERE TTF.CODIGO = PF.TP_FREQUENCIA))+'
      '       case PF.TP_FREQUENCIA when '#39'2'#39' then'
      '          '#39' --> '#39'+'
      
        '          case SUBSTRING(pr.tx_semanal,1,1) WHEN '#39'1'#39' then '#39'Mon -' +
        ' '#39' ELSE '#39#39' end + --Segunda'
      
        '          case SUBSTRING(pr.tx_semanal,2,1) WHEN '#39'1'#39' then '#39'Tue -' +
        ' '#39' ELSE '#39#39' end + --Ter'#231'a'
      
        '          case SUBSTRING(pr.tx_semanal,3,1) WHEN '#39'1'#39' then '#39'Wed -' +
        ' '#39' ELSE '#39#39' end + --Quarta'
      
        '          case SUBSTRING(pr.tx_semanal,4,1) WHEN '#39'1'#39' then '#39'Thu -' +
        ' '#39' ELSE '#39#39' end + --Quinta'
      
        '          case SUBSTRING(pr.tx_semanal,5,1) WHEN '#39'1'#39' then '#39'Fri -' +
        ' '#39' ELSE '#39#39' end + --Sexta'
      
        '          case SUBSTRING(pr.tx_semanal,6,1) WHEN '#39'1'#39' then '#39'Sat -' +
        ' '#39' ELSE '#39#39' end + --Sabado'
      
        '          case SUBSTRING(pr.tx_semanal,7,1) WHEN '#39'1'#39' then '#39'Sun  ' +
        ' '#39' ELSE '#39#39' end   --Domingo'
      '       else'
      '         '#39#39
      '       end NR_FRQUENCIA,'
      '       CASE PR.CD_VIA_TRANSP'
      
        '         WHEN '#39'04'#39' THEN CAST(ISNULL(PF.TRASMIT_TIME, '#39'0'#39') AS VAR' +
        'CHAR(5)) + '#39' HORAS'#39
      
        '         ELSE CAST(ISNULL(PF.TRASMIT_TIME, 0) AS VARCHAR(5))+ '#39' ' +
        'DAYS'#39
      '       END AS NR_TRANSIT_TIME,'
      
        '       '#9'(select sum(VL_PESO_KG)     from TPROPOSTA_MERCADORIA WH' +
        'ERE NR_PROPOSTA =:proposta) VL_PESO_KG,'
      
        '       '#9'(select sum(VL_PESO_KG_LIQ) from TPROPOSTA_MERCADORIA WH' +
        'ERE NR_PROPOSTA =:proposta) VL_PESO_KG_LIQ,'
      
        '      '#9'(select sum(VL_CUBAGEM_M3)  from TPROPOSTA_MERCADORIA WHE' +
        'RE NR_PROPOSTA =:proposta) VL_CUBAGEM_M3,'
      
        #9'      (select sum(QTD_VOLUMES)    from TPROPOSTA_MERCADORIA WHE' +
        'RE NR_PROPOSTA =:proposta) QTD_VOLUMES,'
      ''
      ''
      ''
      'CASE PR.CD_VIA_TRANSP'
      
        '         WHEN '#39'04'#39' THEN  Upper((SELECT TAR.DESCRICAO FROM TTRANS' +
        'PORTADOR_ITL TAR WHERE TAR.CODIGO = PF.CD_CIA_TRANSP))'
      
        '         ELSE Upper((SELECT TAR.DESCRICAO FROM TTRANSPORTADOR_IT' +
        'L TAR WHERE TAR.CODIGO = PF.CD_ARMADOR))'
      '       END NM_ARMADOR,'
      ''
      ''
      ''
      '        Case PF.TP_CARGA'
      '          when '#39'0'#39' then '#39'NORMAL '#39
      '          when '#39'1'#39' then '#39'DANGEROUS '#39
      '          when '#39'2'#39' then '#39'PERISHABLE '#39
      '          when '#39'3'#39' then '#39'CHEMICAL '#39
      '          when '#39'4'#39' then '#39'OTHERS '#39
      '          when '#39'5'#39' then '#39'ALL '#39
      '        end NM_CARGA,'
      '        PR.VL_CHARGEABLE,'
      '       IsNull(PF.NR_FREE_TIME_DEMURRAGE,0)+'#39' DAYS'#39' FREE_TIME,'
      '  pr.VL_FOB,'
      ' m.AP_MOEDA AP_MOEDA_FOB'
      ''
      ''
      '  FROM TPROPOSTA P (NOLOCK)'
      
        ' INNER JOIN TPROPOSTA_ITEM   PR  (NOLOCK) ON PR.NR_PROPOSTA  = P' +
        '.NR_PROPOSTA'
      
        ' LEFT JOIN TPROPOSTA_FRETE  PF  (NOLOCK) ON PF.NR_PROPOSTA  = P.' +
        'NR_PROPOSTA   and PF.CD_PRODUTO=PR.CD_PRODUTO'
      ''
      
        '  LEFT JOIN TLOCAL_EMBARQUE  P1  (NOLOCK) ON PF.CD_ORIGEM       ' +
        '      = P1.CODIGO'
      
        '  LEFT JOIN TLOCAL_EMBARQUE  P2  (NOLOCK) ON PF.CD_DESTINO      ' +
        '      = P2.CODIGO'
      
        '  LEFT JOIN TLOCAL_EMBARQUE  P3  (NOLOCK) ON PF.CD_PORTO_TRANSBO' +
        'RDO   = P3.CODIGO'
      
        '  LEFT JOIN TLOCAL_EMBARQUE  P4  (NOLOCK) ON PF.CD_PORTO_TRANSBO' +
        'RDO_2 = P4.CODIGO'
      ''
      
        '  LEFT JOIN TUF              UF1 (NOLOCK) ON P1.CD_UF = UF1.CD_U' +
        'F'
      
        '  LEFT JOIN TUF              UF2 (NOLOCK) ON P2.CD_UF = UF2.CD_U' +
        'F'
      ''
      
        '  LEFT JOIN TPAIS_BROKER     Pa1 (NOLOCK) ON P1.CD_PAIS         ' +
        '      = Pa1.CD_PAIS'
      
        '  LEFT JOIN TPAIS_BROKER     Pa2 (NOLOCK) ON P2.CD_PAIS         ' +
        '      = Pa2.CD_PAIS'
      ''
      ''
      
        '  LEFT JOIN TEMPRESA_NAC     EN  (NOLOCK) ON EN.CD_EMPRESA = P.C' +
        'D_EMPRESA'
      
        '  LEFT JOIN TPROC_COMERC     PC  (NOLOCK) ON EN.CD_EMPRESA = PC.' +
        'CD_EMPRESA'
      
        '  LEFT JOIN TUNID_NEG        UN  (NOLOCK) ON UN.CD_UNID_NEG = PR' +
        '.CD_UNID_NEG'
      
        '  LEFT JOIN TUSUARIO         U   (NOLOCK) ON U.CD_USUARIO = :USU' +
        'ARIO'
      
        '  LEFT JOIN TMOEDA_BROKER    m   (NOLOCK) ON m.CD_MOEDA   = pr.C' +
        'D_MOEDA_FOB'
      
        '   WHERE PR.NR_PROPOSTA = :PROPOSTA and PR.CD_UNID_NEG =:CD_UNID' +
        '_NEG')
    Left = 128
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qryRelPropostaNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaEND_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 142
    end
    object qryRelPropostaEND_EMPRESA2: TStringField
      FieldName = 'END_EMPRESA2'
      FixedChar = True
      Size = 44
    end
    object qryRelPropostaEMAIL_CLIENTE: TStringField
      FieldName = 'EMAIL_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaFONE_EMPRESA: TStringField
      FieldName = 'FONE_EMPRESA'
      FixedChar = True
      Size = 15
    end
    object qryRelPropostaFAX_EMPRESA: TStringField
      FieldName = 'FAX_EMPRESA'
      FixedChar = True
      Size = 15
    end
    object qryRelPropostaNR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qryRelPropostaNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaEND_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 112
    end
    object qryRelPropostaEND_UNID_NEG2: TStringField
      FieldName = 'END_UNID_NEG2'
      FixedChar = True
      Size = 44
    end
    object qryRelPropostaFONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qryRelPropostaFAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qryRelPropostaEMAIL_UNID: TStringField
      FieldName = 'EMAIL_UNID'
      FixedChar = True
      Size = 255
    end
    object qryRelPropostaCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryRelPropostaTP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 3
    end
    object qryRelPropostaLOCAL_ORIGEM: TStringField
      FieldName = 'LOCAL_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaLOCAL_DESTINO: TStringField
      FieldName = 'LOCAL_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaVIA_TRANSP: TStringField
      FieldName = 'VIA_TRANSP'
      FixedChar = True
    end
    object qryRelPropostaAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryRelPropostaREMARKS: TMemoField
      FieldName = 'REMARKS'
      BlobType = ftMemo
    end
    object qryRelPropostaREMARKS_INDAIA: TMemoField
      FieldName = 'REMARKS_INDAIA'
      BlobType = ftMemo
    end
    object qryRelPropostaVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qryRelPropostaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qryRelPropostaNR_FRQUENCIA: TStringField
      FieldName = 'NR_FRQUENCIA'
      FixedChar = True
      Size = 36
    end
    object qryRelPropostaNR_TRANSIT_TIME: TStringField
      FieldName = 'NR_TRANSIT_TIME'
      FixedChar = True
      Size = 11
    end
    object qryRelPropostaTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
    object qryRelPropostaLOCAL_TRANSB: TStringField
      FieldName = 'LOCAL_TRANSB'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaDT_VALID: TStringField
      FieldName = 'DT_VALID'
      FixedChar = True
      Size = 30
    end
    object qryRelPropostacalcCargoType: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCargoType'
      Size = 255
      Calculated = True
    end
    object qryRelPropostaVL_FREIGHT: TFloatField
      FieldName = 'VL_FREIGHT'
    end
    object qryRelPropostaVL_PESO_KG: TFloatField
      FieldName = 'VL_PESO_KG'
      DisplayFormat = '0.000'
    end
    object qryRelPropostaVL_PESO_KG_LIQ: TFloatField
      FieldName = 'VL_PESO_KG_LIQ'
      DisplayFormat = '0.000'
    end
    object qryRelPropostaVL_CUBAGEM_M3: TFloatField
      FieldName = 'VL_CUBAGEM_M3'
      DisplayFormat = '0.000'
    end
    object qryRelPropostaQTD_VOLUMES: TIntegerField
      FieldName = 'QTD_VOLUMES'
    end
    object qryRelPropostaNM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qryRelPropostaNM_CARGA: TStringField
      FieldName = 'NM_CARGA'
      FixedChar = True
      Size = 12
    end
    object qryRelPropostaVL_CHARGEABLE: TFloatField
      FieldName = 'VL_CHARGEABLE'
    end
    object qryRelPropostacalc_servico: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_servico'
      Size = 30
      Calculated = True
    end
    object qryRelPropostaLOCAL_TRANSB_2: TStringField
      FieldName = 'LOCAL_TRANSB_2'
      FixedChar = True
      Size = 50
    end
    object qryRelPropostaFREE_TIME: TStringField
      FieldName = 'FREE_TIME'
      FixedChar = True
      Size = 8
    end
    object qryRelPropostaRota: TStringField
      FieldName = 'Rota'
      FixedChar = True
      Size = 103
    end
    object qryRelPropostaVL_FOB: TFloatField
      FieldName = 'VL_FOB'
      DisplayFormat = '0.00'
    end
    object qryRelPropostaAP_MOEDA_FOB: TStringField
      FieldName = 'AP_MOEDA_FOB'
      FixedChar = True
      Size = 6
    end
    object qryRelPropostaVL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
    end
    object qryRelPropostaVL_COMPRA_TOTAL: TFloatField
      FieldName = 'VL_COMPRA_TOTAL'
    end
    object qryRelPropostaVL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
    object qryRelPropostaNM_EMPRESA: TStringField
      FieldKind = fkCalculated
      FieldName = 'NM_EMPRESA'
      Size = 50
      Calculated = True
    end
    object qryRelPropostaNM_EMPRESA_DB: TStringField
      FieldName = 'NM_EMPRESA_DB'
      FixedChar = True
      Size = 80
    end
  end
  object dsRelProposta: TDataSource
    DataSet = qryRelProposta
    Left = 31
    Top = 8
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\FI_COTACAO_E_LCL_CS.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 156
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 480
    Top = 297
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 391320
      mmPrintPosition = 0
      object ppShape22: TppShape
        UserName = 'Shape22'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 75936
        mmWidth = 56356
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 124090
        mmTop = 66675
        mmWidth = 56356
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'EMAIL_UNID'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 124354
        mmTop = 66411
        mmWidth = 55563
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText17'
        DataField = 'VL_PESO_KG_LIQ'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2646
        mmLeft = 124354
        mmTop = 76465
        mmWidth = 55298
        BandType = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape23'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 85461
        mmWidth = 55033
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'NM_CARGA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 40481
        mmTop = 85461
        mmWidth = 53446
        BandType = 0
      end
      object ppShape62: TppShape
        UserName = 'Shape62'
        Brush.Style = bsClear
        Pen.Color = clNavy
        mmHeight = 17463
        mmLeft = 5027
        mmTop = 17992
        mmWidth = 174890
        BandType = 0
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Caption = 'Region2'
        Pen.Style = psClear
        ShiftRelativeTo = ppRegion1
        Stretch = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 143140
        mmWidth = 179917
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'ItensOrigem'
          ExpandAll = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          TraverseAllData = False
          DataPipelineName = 'ppdb_Itens_Origem'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 144198
          mmWidth = 179917
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppdb_Itens_Origem
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 5000
            PrinterSetup.mmMarginLeft = 15000
            PrinterSetup.mmMarginRight = 15000
            PrinterSetup.mmMarginTop = 5000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppdb_Itens_Origem'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape35: TppShape
                UserName = 'Shape35'
                Brush.Color = 16742726
                Pen.Style = psClear
                mmHeight = 4498
                mmLeft = 5000
                mmTop = 0
                mmWidth = 175419
                BandType = 1
              end
              object ppLabel31: TppLabel
                UserName = 'Label31'
                AutoSize = False
                Caption = 'CUSTO NA ORIGEM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 2582
                mmLeft = 5000
                mmTop = 794
                mmWidth = 174625
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape40: TppShape
                UserName = 'Shape40'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 161925
                mmTop = 0
                mmWidth = 18256
                BandType = 4
              end
              object ppDBText35: TppDBText
                UserName = 'DBText35'
                DataField = 'VL_CALCULADO'
                DataPipeline = ppdb_Itens_Origem
                DisplayFormat = '#0.,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Origem'
                mmHeight = 2582
                mmLeft = 163248
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppShape55: TppShape
                UserName = 'Shape55'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 127794
                mmTop = 0
                mmWidth = 13494
                BandType = 4
              end
              object ppShape36: TppShape
                UserName = 'Shape401'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 99748
                mmTop = 0
                mmWidth = 26194
                BandType = 4
              end
              object ppShape41: TppShape
                UserName = 'Shape41'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 142875
                mmTop = 0
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText17: TppDBText
                UserName = 'DBText17'
                DataField = 'VL_VENDA'
                DataPipeline = ppdb_Itens_Origem
                DisplayFormat = '#0.,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Origem'
                mmHeight = 2582
                mmLeft = 143934
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText18: TppDBText
                UserName = 'DBText18'
                DataField = 'NM_ITEM'
                DataPipeline = ppdb_Itens_Origem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = [fsBold]
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Origem'
                mmHeight = 2582
                mmLeft = 5027
                mmTop = 529
                mmWidth = 92340
                BandType = 4
              end
              object ppDBText29: TppDBText
                UserName = 'DBText29'
                DataField = 'AP_MOEDA'
                DataPipeline = ppdb_Itens_Origem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Origem'
                mmHeight = 2582
                mmLeft = 128852
                mmTop = 529
                mmWidth = 10583
                BandType = 4
              end
              object ppDBText33: TppDBText
                UserName = 'DBText33'
                DataField = 'NM_BASE_CALC'
                DataPipeline = ppdb_Itens_Origem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Origem'
                mmHeight = 2582
                mmLeft = 100806
                mmTop = 529
                mmWidth = 23813
                BandType = 4
              end
              object ppDBText62: TppDBText
                UserName = 'DBText32'
                DataField = 'TX_PC'
                DataPipeline = ppdb_Itens_Origem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Origem'
                mmHeight = 2582
                mmLeft = 147109
                mmTop = 794
                mmWidth = 2646
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 16933
              mmPrintPosition = 0
              object ppSubReport12: TppSubReport
                UserName = 'TotalOrigem'
                ExpandAll = True
                NewPrintJob = False
                OutlineSettings.CreateNode = True
                TraverseAllData = False
                DataPipelineName = 'ppdb_Total_Origem'
                mmHeight = 16140
                mmLeft = 0
                mmTop = 265
                mmWidth = 180000
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppChildReport14: TppChildReport
                  AutoStop = False
                  DataPipeline = ppdb_Total_Origem
                  PrinterSetup.BinName = 'Default'
                  PrinterSetup.DocumentName = 'Report'
                  PrinterSetup.PaperName = 'A4'
                  PrinterSetup.PrinterName = 'Default'
                  PrinterSetup.mmMarginBottom = 5000
                  PrinterSetup.mmMarginLeft = 15000
                  PrinterSetup.mmMarginRight = 15000
                  PrinterSetup.mmMarginTop = 5000
                  PrinterSetup.mmPaperHeight = 297000
                  PrinterSetup.mmPaperWidth = 210000
                  PrinterSetup.PaperSize = 9
                  Units = utMillimeters
                  Version = '7.02'
                  mmColumnWidth = 0
                  DataPipelineName = 'ppdb_Total_Origem'
                  object ppTitleBand14: TppTitleBand
                    mmBottomOffset = 0
                    mmHeight = 3440
                    mmPrintPosition = 0
                    object ppLabel50: TppLabel
                      UserName = 'Label50'
                      AutoSize = False
                      Caption = 'TOTAL CUSTO NA ORIGEM'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = 7895160
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 2582
                      mmLeft = 128588
                      mmTop = 265
                      mmWidth = 38894
                      BandType = 1
                    end
                  end
                  object ppDetailBand15: TppDetailBand
                    mmBottomOffset = 0
                    mmHeight = 4498
                    mmPrintPosition = 0
                    object ppShape53: TppShape
                      UserName = 'Shape53'
                      Brush.Color = 15263976
                      Pen.Color = clGray
                      Pen.Style = psClear
                      mmHeight = 4233
                      mmLeft = 161925
                      mmTop = 0
                      mmWidth = 18256
                      BandType = 4
                    end
                    object ppShape66: TppShape
                      UserName = 'Shape601'
                      Brush.Color = 15263976
                      Pen.Color = clGray
                      Pen.Style = psClear
                      mmHeight = 4233
                      mmLeft = 127794
                      mmTop = 0
                      mmWidth = 13494
                      BandType = 4
                    end
                    object ppDBText59: TppDBText
                      UserName = 'DBText59'
                      DataField = 'AP_MOEDA'
                      DataPipeline = ppdb_Total_Origem
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = []
                      ParentDataPipeline = False
                      TextAlignment = taCentered
                      Transparent = True
                      DataPipelineName = 'ppdb_Total_Origem'
                      mmHeight = 2582
                      mmLeft = 128852
                      mmTop = 265
                      mmWidth = 10583
                      BandType = 4
                    end
                    object ppDBText52: TppDBText
                      UserName = 'DBText602'
                      DataField = 'TOTAL_GERAL'
                      DataPipeline = ppdb_Total_Origem
                      DisplayFormat = '#,##0.00'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = []
                      ParentDataPipeline = False
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppdb_Total_Origem'
                      mmHeight = 2582
                      mmLeft = 163248
                      mmTop = 265
                      mmWidth = 15346
                      BandType = 4
                    end
                  end
                  object ppSummaryBand14: TppSummaryBand
                    mmBottomOffset = 0
                    mmHeight = 265
                    mmPrintPosition = 0
                  end
                end
              end
            end
            object raCodeModule1: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 39688
        mmWidth = 56356
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 43656
        mmWidth = 56356
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 7144
        mmLeft = 124090
        mmTop = 47625
        mmWidth = 56356
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 55033
        mmWidth = 56356
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 59002
        mmWidth = 56356
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 124090
        mmTop = 62971
        mmWidth = 56356
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'FAX_UNID'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 124354
        mmTop = 62706
        mmWidth = 55563
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FONE_UNID'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 124354
        mmTop = 58738
        mmWidth = 55563
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'END_UNID_NEG2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 124090
        mmTop = 55033
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'END_UNID_NEG'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6879
        mmLeft = 124090
        mmTop = 47625
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'NM_USUARIO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 124090
        mmTop = 43392
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NM_UNID_NEG'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 124090
        mmTop = 39688
        mmWidth = 55827
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 39688
        mmTop = 66675
        mmWidth = 54504
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 39688
        mmTop = 62971
        mmWidth = 54504
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 59002
        mmWidth = 54504
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 55033
        mmWidth = 54504
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 43656
        mmWidth = 54504
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 39688
        mmWidth = 54504
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 7144
        mmLeft = 39688
        mmTop = 47625
        mmWidth = 54504
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NM_EMPRESA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 39952
        mmTop = 39688
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NM_CONTATO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 39952
        mmTop = 43392
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        CharWrap = True
        DataField = 'END_EMPRESA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6879
        mmLeft = 39952
        mmTop = 47625
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'END_EMPRESA2'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 39952
        mmTop = 55033
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'FAX_EMPRESA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 39952
        mmTop = 62706
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FONE_EMPRESA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 39952
        mmTop = 58738
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'EMAIL_CLIENTE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 39952
        mmTop = 66940
        mmWidth = 54240
        BandType = 0
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 76200
        mmWidth = 55033
        BandType = 0
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 80963
        mmWidth = 55033
        BandType = 0
      end
      object ppShape21: TppShape
        UserName = 'Shape21'
        Brush.Color = clSilver
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 21167
        mmLeft = 5292
        mmTop = 267759
        mmWidth = 174625
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'DE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 95620
        mmTop = 35983
        mmWidth = 2328
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'PARA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 5292
        mmTop = 35983
        mmWidth = 4699
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 39688
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'CONTATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 43392
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'TELEFONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 58738
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 62706
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'EMAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 66940
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'ENDERE'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 47625
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'TIPO DE CARGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5000
        mmTop = 85461
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 39688
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'CONTATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 43392
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'ENDERE'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 47361
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'CIDADE, ESTADO, CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 54504
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'TELEFONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 58738
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 62706
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'EMAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 66940
        mmWidth = 28575
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'REMARKS'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 21167
        mmLeft = 5556
        mmTop = 267494
        mmWidth = 174890
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'CIDADE, ESTADO, CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 55033
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'PESO BRUTO (KG)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5000
        mmTop = 76465
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'CUBAGEM (M3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 5000
        mmTop = 80963
        mmWidth = 34660
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'VL_PESO_KG'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2646
        mmLeft = 40481
        mmTop = 76465
        mmWidth = 53446
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'VL_CUBAGEM_M3'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2646
        mmLeft = 40481
        mmTop = 80963
        mmWidth = 53446
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 
          '1.'#9'As informa'#231#245'es constantes na presente proposta retratam as co' +
          'ndi'#231#245'es contratadas para a realiza'#231#227'o do servi'#231'o em refer'#234'ncia, ' +
          'sendo que no momento do seu aceite, o cliente reconhece que deve' +
          ' '#224' Indai'#225' Log'#237'stica Internacional Ltda. o valor estipulado neste' +
          ' documento. Al'#233'm das condi'#231#245'es aqui especificadas, os servi'#231'os d' +
          'e transporte/agenciamento de carga ser'#227'o regidos pelas cl'#225'usulas' +
          ' e condi'#231#245'es contidas nos respectivos conhecimentos de embarque,' +
          ' ou ainda, pelas Condi'#231#245'es Gerais para a Organiza'#231#227'o de Transpor' +
          'tes de Mercadorias da Indai'#225' Log'#237'stica Internacional Ltda. '#13#10'2.'#9 +
          'A remunera'#231#227'o ser'#225' cobrada em reais ou o equivalente em d'#243'lar am' +
          'ericano.   '#13#10'3.'#9'As despesas do destino poder'#227'o alterar de acordo' +
          ' com a classifica'#231#227'o da mercadoria. '#13#10'4.'#9'Os valores indicados ac' +
          'ima podem sofrer altera'#231#245'es caso o peso ou dimens'#245'es das cargas ' +
          'sejam modificados. '#13#10'5.'#9'Para contrata'#231#227'o de seguros, verificar n' +
          'ossas coberturas, bem como lista de mercadorias exclu'#237'das. '#13#10'6.'#9 +
          'Outras despesas decorrentes de taxas extraordin'#225'rias, tais como ' +
          'estadia, pernoite, taxa de DTA, despacho, monitoramento, ajudant' +
          'e extra, ped'#225'gio, devolu'#231#227'o de container, descarga, taxa de marg' +
          'em esquerda ou direita, gastos na origem, '#8220'inland freight'#8221', cust' +
          'os por retorno ao porto de containeres na origem / destino, ser'#227 +
          'o repassados ao cliente no faturamento.  '#13#10'7.'#9'Ad valorem sob con' +
          'sulta. '#13#10'8.'#9'A oferta est'#225' sujeita a GRI de mercado sem pr'#233'vio av' +
          'iso e adicionais VATOS. '#13#10'9.'#9'Embarques com Incoterm DDU/DDP; suj' +
          'eitos a incid'#234'ncia de Imposto de Renda (33,33% reajustado), sobr' +
          'e todas as despesas ocorridas no destino, que ser'#227'o cobrados no ' +
          'Boleto Banc'#225'rio cujo prazo de pagamento sujeito '#224' An'#225'lise de Cr'#233 +
          'dito. '#13#10'10.'#9'O prazo de  freetime detention  / demurrage deve ser' +
          ' respeitado, caso contr'#225'rio poder'#225' acarretar uma cobran'#231'a de  ta' +
          'xa extra de sobrestadia conforme tarifa em vig'#234'ncia de cada arma' +
          'dor. '#13#10'11.'#9'A partir da confirma'#231#227'o, por meio de correio eletr'#244'ni' +
          'co  (e-mail) ou qualquer outro meio acordado pelas partes, o pre' +
          'sente documento passar'#225' a valer como Contrato perfeito e acabado' +
          ', gerando para as partes direitos e obriga'#231#245'es e valendo tamb'#233'm ' +
          'como t'#237'tulo executivo para todos os efeitos legais.  '#13#10'12.'#9'O ace' +
          'ite da proposta deve ser confirmado em at'#233' 15 dias da data de em' +
          'iss'#227'o da mesma. '#13#10'13.'#9'Para  que  se  possa  garantir  a  aplica'#231 +
          #227'o da  tarifa  correta  oferecida  pela  Indai'#225' Log'#237'stica Intern' +
          'acional  no  exterior,  faz-se  necess'#225'rio  o  envio  de  uma  c' +
          #243'pia  do  pedido indicando a Indai'#225' Log'#237'stica Internacional como' +
          ' agente de cargas contratado. '#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Lines.Strings = (
          
            '1.  As informa'#231#245'es constantes na presente proposta retratam as c' +
            'ondi'#231#245'es contratadas para a realiza'#231#227'o do servi'#231'o em refer'#234'ncia,' +
            ' sendo que no momento do seu aceite, o cliente reconhece que dev' +
            'e '#224' Indai'#225' Log'#237'stica Internacional Ltda. o valor estipulado nest' +
            'e documento. Al'#233'm das condi'#231#245'es aqui especificadas, os servi'#231'os ' +
            'de transporte/agenciamento de carga ser'#227'o regidos pelas cl'#225'usula' +
            's e condi'#231#245'es contidas nos respectivos conhecimentos de embarque' +
            ', ou ainda, pelas Condi'#231#245'es Gerais para a Organiza'#231#227'o de Transpo' +
            'rtes de Mercadorias da Indai'#225' Log'#237'stica Internacional Ltda.'
          
            '2.  A remunera'#231#227'o ser'#225' cobrada em reais ou o equivalente em d'#243'la' +
            'r americano.'
          
            '3.  As despesas do destino poder'#227'o alterar de acordo com a class' +
            'ifica'#231#227'o da mercadoria.'
          
            '4.  Os valores indicados acima podem sofrer altera'#231#245'es caso o pe' +
            'so ou dimens'#245'es das cargas sejam modificados.'
          
            '5.  Para contrata'#231#227'o de seguros, verificar nossas coberturas, be' +
            'm como lista de mercadorias exclu'#237'das.'
          
            '6.  Outras despesas decorrentes de taxas extraordin'#225'rias, tais c' +
            'omo estadia, pernoite, taxa de DTA, despacho, monitoramento, aju' +
            'dante extra, ped'#225'gio, devolu'#231#227'o de container, descarga, taxa de ' +
            'margem esquerda ou direita, gastos na origem, '#8220'inland freight'#8221', ' +
            'custos por retorno ao porto de containeres na origem / destino, ' +
            'ser'#227'o repassados ao cliente no faturamento.'
          '7.  Ad valorem sob consulta.'
          
            '8.  A oferta est'#225' sujeita a GRI de mercado sem pr'#233'vio aviso e ad' +
            'icionais VATOS.'
          
            '9.  Embarques com Incoterm DDU/DDP; sujeitos a incid'#234'ncia de Imp' +
            'osto de Renda (33,33% reajustado), sobre todas as despesas ocorr' +
            'idas no destino, que ser'#227'o cobrados no Boleto Banc'#225'rio cujo praz' +
            'o de pagamento sujeito '#224' An'#225'lise de Cr'#233'dito.'
          
            '10. O prazo de  freetime detention  / demurrage deve ser respeit' +
            'ado, caso contr'#225'rio poder'#225' acarretar uma cobran'#231'a de  taxa extra' +
            ' de sobrestadia conforme tarifa em vig'#234'ncia de cada armador.'
          
            '11. A partir da confirma'#231#227'o, por meio de correio eletr'#244'nico  (e-' +
            'mail) ou qualquer outro meio acordado pelas partes, o presente d' +
            'ocumento passar'#225' a valer como Contrato perfeito e acabado, geran' +
            'do para as partes direitos e obriga'#231#245'es e valendo tamb'#233'm como t'#237 +
            'tulo executivo para todos os efeitos legais.'
          
            '12. O aceite da proposta deve ser confirmado em at'#233' 15 dias da d' +
            'ata de emiss'#227'o da mesma.'
          
            '13. Para  que  se  possa  garantir  a  aplica'#231#227'o da  tarifa  cor' +
            'reta  oferecida  pela  Indai'#225' Log'#237'stica Internacional  no  exter' +
            'ior,  faz-se  necess'#225'rio  o  envio  de  uma  c'#243'pia  do  pedido i' +
            'ndicando a Indai'#225' Log'#237'stica Internacional como agente de cargas ' +
            'contratado.')
        TextAlignment = taFullJustified
        Transparent = True
        mmHeight = 95779
        mmLeft = 5027
        mmTop = 295540
        mmWidth = 174890
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape63: TppShape
        UserName = 'Shape63'
        Brush.Color = 16598272
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 5027
        mmTop = 18256
        mmWidth = 174890
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        AutoSize = False
        Caption = 'COTA'#199#195'O DE EXPORTA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 5292
        mmTop = 19579
        mmWidth = 174625
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 123825
        mmTop = 24871
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NR_PROPOSTA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 123825
        mmTop = 25135
        mmWidth = 55298
        BandType = 0
      end
      object ppShape54: TppShape
        UserName = 'Shape54'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 123825
        mmTop = 29898
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'DT_VALID'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2582
        mmLeft = 123825
        mmTop = 29898
        mmWidth = 55298
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 39952
        mmTop = 24871
        mmWidth = 54240
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'COTA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 24871
        mmWidth = 8678
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 25590
        mmTop = 24606
        mmWidth = 4953
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 40746
        mmTop = 25135
        mmWidth = 10245
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D61708EBD0000424D8EBD0000000000003600000028000000DD00
          000049000000010018000000000058BD0000C40E0000C40E0000000000000000
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFF
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
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7F7FFFFF7FFFFEFFFFFEFFFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
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
          FFFFFFFFFFEEF7F7F7FFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFF7F7F7
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFEEF7F7F7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7F7F7FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFEEF7F7EEF7F7FFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FF
          FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7F7F7F7F7F7F7
          FFFFFFEEF7F7F7FFFFF7FFFFF7FFFFF7FFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FF
          FFF7FFFFEEF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFF
          F7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFF7F4F8EFF7FFFFF7FF
          FFF7F7F7F7F7F7FFFFFFFFF6F7F7FFFFF7FFFFF7FFFFF7FFFFFFF6F7FFFFFFFF
          FFFFFFFFFFF7FFFFEEF7F7F7FFFFF7F7F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFEEF7F7EEF7F7FFFFFFFFFFFFFFFFFFFFFFFFF8EDEFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFF
          FFFFFAD8DEA48485A48485C9ABB0E2CBCFF9E4E7FFEFEEFFFFFFFFFFFFF7F7F7
          F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFF6
          F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7EEF7F7EEF7F7FFFFFFFFFFFFFF
          FFFFFFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFFFF6F7FFF6F7FFF6F7F7FFF7
          F7FFF7F7FFF7FFFFFFFFFFFFFFF6F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FF
          F6F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFDEC2C18F6964733741
          763F4878474F845557795758977D7DD6C4C5FFFFFFFFFFFFF7F7F7F7FFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFE0D7D688717588717588
          7175977D7DF0DBD9FFFFFFE7E7E786787A887175887175887175F0DBD9FFFFFF
          FFFFFFFFFFFFFFF6F79F8A8D8D6B6C7F636386787AE7E7E7F7FFFFF7FFFFF4F8
          EFAC94928D6B6C8D6B6C8D6B6CD6C4C5FFF6F7F7FFFFF7FFFFE3E0DB8871757F
          6363887175977D7DF9E4E7FFFFFFFFFFFFFFFFFFFFEFEE9D86848D6B6C8D6B6C
          86787AF8EDEFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEFEECFBDBE67454B7337417B3742883C487B3742732B
          376A313A78474F8D6B6CCFBDBEFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFF0DBD94B30343D1B1C43252A43252AD5BEBC
          FFFFFFF4F8EF6666664021204A20214A2021AD898FE2CBCFE2CBCFE2CBCFCFBD
          BE5A3B3A53282B4A20216D5654FFF7F0EEF7F7F7FFFFF7F7F78871753D1B1C4A
          20214A20219F8A8DFFFFFFF7F7F7FFFFFFF8EDEF7F636343252A43252A3D1B1C
          AC9492F0DBD9E2CBCFF0DBD9D5BEBC5843463D1B1C40212059484BFFEFEEFFF6
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFF
          FFFFF6F7956F755B29297B37428536438536437A2E3A6A282D7B374286414C78
          474F977D7DF9E4E7FFF7FFFFF7FFFFF7FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFEFEE795758592D34592D3453282BBCA3A1FFFFF7FFFFF7CCB7
          B6523330592D34592D34592D345A3B3A5A3B3A5A3B3A5A3B3A592D34592D344A
          20218D6B6CFFF6F7FFFFFFF7F7F7FFFFFFAC94924A2021592D344A20218D6B6C
          FFFFFFFFFFFFFFFFFFFFFFFFCCB7B64B303453282B53282B592D345843465A3B
          3A5A3B3A52333052333053282B53282B887175FFF6F7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7B6A19F66333373
          374186414C853643853643732B377A2E3A853643853643884953763F48C9ABB0
          FFF7FFFFF7FFFFF7FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA4716F522220732B37582824977D7DFFFFF7FFFFF7FFFFF7947A743D1B1C6A
          313A6633334A20214A20214A20214A20216633336633334A2021AF9A9DFFFFFF
          FFFFFFFFFFFFFFFFFFBEA9AC48292A592D345222208F6964F9E4E7FFFFFFFFFF
          FFFFFFFFFFF6F77F63634A202166333358282453282B3D1B1C53282B53282B53
          282B6633334A2021B7999EFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFFFFFFFE2CBCF763F486A313A883C48883C487B3742
          7B3742732B37732B37853643853643853643793D478D6B6CF9E4E7FFFFFFFFFF
          FFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFF7B79A9563282C73
          2B376A282D795758FFEFEEFFFFFFFFFFFFD5BEBC592D345828245B29296B4344
          AD8285AD8285855B5C5828245B292953282BD5BEBCFFFFFFFFFFFFF7F7FFF7F7
          FFD6C4C55A3B3A53282B5B29296B4344FAD8DEFFFFF7FFFFFFFFFFFFFFFFFFCF
          BDBE52333063282C63282C693A42AD898FAD898F78474F5B29295B292953282B
          D5BEBCFFFFF7FFFFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFFFFFFFA4848563282C853643883C487B37427B3742763F48A4716F7337
          417A2E3A8536437A2E3A88495378474FC9ABB0FFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFFF7D5BEBC66333363282C63282C5A3B3A
          E3E0DBFFFFF7FFFFF7FFFFF78D6B6C5222205B29296B4344F0DBD9FFF7F0A484
          8553282B592D345A3B3AF0DBD9FFFFFFFFFFFFFFFFFFFFFFFFF0DBD95A3B3A53
          282B66333353282BE6DBC8FFFFFFFFFFFFFFFFFFFFFFFFFFEFEE7F6363582824
          58282472524DFAD8DEFFF7F08D6B6C5B29295B29295A3B3AF0DBD9FFFFF7FFFF
          F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFF
          EEF7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E4E77847
          4F732B37853643853643853643733741733741D7ADAE8B58606A282D85364385
          36437B37426A313A9F8A8DFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF0DBD9693A425B29295B2929523330D2CDBDFFFFFFF7F7
          F7FFFFFFCCB7B6592D34522220522220B79A95FFFFF78F69644A202153282B6D
          5654F9E4E7FFFFFFFFFFFFEEF7F7FFFFFFFFEFEE67454B53282B53282B53282B
          D5BEBCFFFFF7FFFFF7F7F7F7F7F7F7FFFFFFCCB7B652333052333048292AB79A
          95FFFFF7855B5C4A20214A2021766456FFEFEEFFFFF7FFFFF7F7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFE2CBCF693A427B37427B374285
          3643883C48793D4778474FCC99998B58606A282D733741733741793D4778474F
          7F6363F9E4E7FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDFFF7F7FF
          FFFFF7F07957585B29295B292948292AAF9A9DFFFFFFF7FFF7FFFFFFFFF6F78D
          6B6C4A2021592D3478474FFAD8DE6B43445828244A2021887175FFF6F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFF7F07F636348292A48292A48292AAC9492FFFFFFFFFF
          FFEEF7F7F7FFFFFFFFFFFFF6F76D565448292A48292A855B5CFAD8DE84555753
          282B53282B977D7DFFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDFFF7EFFF
          FFEFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFF
          FFFFEEF7F7FFFFFFFFFFFFB6A19F53282B7B3742883C48853643732B378B5860
          D7ADAEC9ABB08D6B6C956F75AD8285733741763F48693A42855B5CFAD8DEFFFF
          FFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7FFFFFF88717552
          2220663333522220947A74FFF6F7F7FFF7F7F7F7FFFFFFCFBDBE48292A582824
          663333B68C8D78474F6633334A20219F8A8DFFFFFFF7F7F7FFFFFFFFFFFFFFFF
          FFFFFFFFA484854A202153282B53282B977D7DFFFFFFFFFFFFFFFFFFFFFFFFF7
          F7F7FFFFFFCCB7B648292A48292A5A3B3AAD8285763F485B292948292AB6A19F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF6F7BCA3A16A313A732B378536438536437337418455578D6B6C7F63635A3B
          3A67454BAD898FAD82858455576A313A855B5CF9E4E7FFEFEEFFEFEEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D6D6C4C5D6C4C5D6C4C5EFE5E5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5
          F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFB79A95522220663333582824
          855B5CFFF6F7FFFFFFF7F7F7F7F7F7F7F7F77F63635222206633337337416A31
          3A6A282D582824CCB7B6FFFFFFF7FFF7F7FFF7FFF6F7FFF6F7FFF6F7CC99995B
          29295828245828248F6964FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFFFFFFFEFEE
          6E585A4A20216633337B37426A313A5B2929523330D5BEBCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F9E4E7F0DBD9
          DEC2C1DEC2C1E2CBCFCFBDBEE0D7D6EFE5E5F8EDEFD8D6D6AF9A9D7F6363693A
          427B3742853643853643853643693A424021202E1A192E1A1920181940212067
          454B4B30345A3B3A795758DEC2C1AD828572524D9D8684CFBDBEF9E4E7FFF7FF
          FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5A4848572
          524D5828245828245828245828245828245828246633338D6B6CCFBDBEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF582824582824582824582824582824582824582824582824582824855B5CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF582824582824582824582824582824
          582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824A48485FFFFFFFFFF
          FFFFFFFFFFFFFFAC949258282458282458282458282458282458282458282458
          2824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7D5BEBC592D345B29295B29296B4344EFE5E5F7F7
          F7F7F7F7F7F7F7F7FFF7BFB7A866333363282C63282C63282C6A282D6A313AE3
          E0DBF7FFFFF7FFFFE3E0DB86787A7F63638D6B6C84555763282C663333663333
          6633338D6B6C947A74786F62BEA9ACFFFFFFFFFFFFFFFFFFBEA9AC53282B6633
          3363282C63282C63282C693A42F0DBD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7F0DBD9B6A19F956F757F6363855B5C855B5C8B58608B58
          607957586D56548871759F8A8DAF9A9D86787A67454B763F488536438536437A
          2E3A7B3742763F48763F4843252A33282A33282A2E1A192E1A1940212048292A
          5A3B3A8D6B6C8D6B6C693A42693A4278474F887175AF9A9DD8D6D6FFFFFFF7FF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8EDEFA48485582824582824582824663333A48485
          CFBDBED6C4C5D6C4C5B6A19F72524D5828245828246B4344D6C4C5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5BEA9AC72
          524D582824582824582824582824947A74BEA9ACE0D7D6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD6C4C5BEA9AC6B434458282472524DBEA9ACE0D7D6FFFF
          FFFFFFFFFFFFFFFFFFFF855B5C582824663333F8EDEFFFFFFFFFFFFFFFFFFFEF
          E5E5D6C4C5A4848558282458282458282458282472524DBEA9ACD6C4C5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFF
          FFFFFFFFE3E0DB5A3B3A592D345B2929663333D6C4C5FFFFFFF7F7F7EFFFFFEF
          FFFFF7F7F77F636353282B592D34592D3463282C795758F8EDEFF7FFFFEEF7F7
          E7E7E759484B3D1B1C52222058282463282C6633336633335B29295B29294829
          2A402120887175FFF6F7FFF6F7FFFFFFFFEFEE79575853282B66333358282453
          282B795758FFF7F0FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEAC94
          926B43445B29295B29296A282D793D47793D47793D4786414C73374167454B6D
          5654BCA3A1D6C4C55843465A3B3A8849537B37428536438536437A2E3A884953
          AA7F7C8D6B6C4021205A3B3A7F6363977D7D6D56545345476D56548D6B6CC9AB
          B0956F7573374186414C88495378474F795758BEA9ACFFF6F7FFF6F7FFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F8EDEF72524D582824582824582824947A74F8EDEFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB6A19F582824582824582824BEA9ACFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824582824
          582824582824F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFA48485582824CFBDBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
          E5E5582824582824582824B6A19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7FFF7F7FFF76D
          56544021204A20214A2021AF9A9DFFFFFFFFFFFFFFFFFFEEF7F7FFFFFFC9ABB0
          48292A43252A43252A3D1B1C8D6B6CFFFFFFEDFFF7F7F7F7FFFFFF8871752E1A
          1948292A48292A5B292952222052222053282B53282B40212040212059484BFF
          EFEEFFFFFFFFFFFFFFF6F7C9ABB03D1B1C4A202153282B3D1B1C86787AFFFFFF
          F4F8EFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFE2CBCF592D344A202163282C63
          282C732B377A2E3A8536437A2E3A85364373374178474FC9ABB0FFF6F7887175
          20181967454B8B5860733741733741733741793D47733741AA7F7CDEAFB18D6B
          6C592D34956F75E2CBCFF0DBD9CFBDBECFBDBEE0D7D6FFEFEE9C7063732B3785
          36438536438536438849538F6964956F75E2CBCFFFF6F7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C5828245828
          24582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB6A19F582824582824582824BEA9ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF947A74582824582824
          5828246B4344FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFEEF7F7EFFFFFEDFFF7F4F8EFB0A8A99386849D8684
          9D8684CFBDBEFFF6F7FFF6F7FFFFFFF7FFFFFFFFFFFFF6F7AF9A9D9386849386
          84938684CFBDBEEEF7F7EEF7F7FFFFFFFFFFFFBEA9AC86787A86787A977D7D94
          7A74977D7D977D7D977D7D9D86849D868486787A86787AE7E7E7F7FFFFEEF7F7
          FFFFFFEFE5E5B6A19F9D86849D86849D8684CCB7B6FFFFFFF7FFFFF7FFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFFFFFFFFFFFFFFAD8DE693A424A202163282C6A282D732B377A2E3A
          7A2E3A86414C7B37426A313AB79A95FFF7FFCFBDBE2A1F212A1F216D5654977D
          7D592D346A313AAD8285D7ADAE763F48AD8285FFF7FFB7999E592D346A313A95
          6F75FAD8DEDEC2C1977D7DFFEFEEDEAFB1733741733741883C48853643853643
          853643793D478849538B5860C9ABB0FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F582824582824582824582824EFE5E5FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF72524D
          582824582824663333EFE5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFFFFFFFFFFFFFFFFFFFFEFE5E5582824582824582824582824582824BEA9
          ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFF
          EFFFFFEFFFFFEFFFFFEEF7F7F7FFFFFFFFF7FFFFF7FFFFF7FFF7F0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFF6F7FFFFFFF7
          FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F0FFF7F0FFF7F0FFFFFFFFF6F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7EEF7F7EFFFFFEFFFFFEFFFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFE2CBCF6B434463282C63282C63282C63282C5828246A313A63282C6328
          2C8F6964FFEFEEE2CBCF59484B2A1F212A1F215843466D56546D5654B79A95FA
          D8DEFAD8DE693A4278474FF0DBD9E2CBCF855B5C845557592D348D6B6CE2CBCF
          F0DBD9F9E4E7956F756A313A6A313A8536438536438536438536438536437B37
          42884953855B5CB6A19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF6B4344582824582824582824947A74FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC5828245828245828
          24947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFFFFF
          FFFFFFFFAC949258282458282458282458282466333372524DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEEF7F7F7FF
          FFF7FFFFF7FFFFFFFFF7FFFFF7FFEFEEFFF6F7FFEFEEFFEFEEFFF6F7FFF6F7FF
          F6F7FFF6F7FFEFEEFFF6F7FFF6F7FFF6F7FFFFFFF7F7F7F7F7F7F7FFFFFFF7FF
          FFF7FFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFEF
          EEFFF7F0FFF7F0FFF7F0FFF7F0F7F7F7F6F3E6F6F3E6FFF6F7FFF6F7FFEFEEFF
          EFEEFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFF0DBD94B30
          343D1B1C592D34592D34693A42855B5C8D6B6C79575878474FA48485BCA3A159
          484B2E1A194B30346D5654938684AC9492DEC2C1F0DBD9FFF6F7D7ADAE5A3B3A
          67454BD6C4C5FFFFFFE2CBCFDEC2C18D6B6C592D348D6B6CB7999E9D86846745
          4B67454B763F48763F48732B37732B377B37427B37427B37427B37426B43446D
          5654AF9A9DF0DBD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBDBE582824
          582824582824582824CFBDBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5582824582824582824582824F8EDEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFFFFFFFF8EDEF66333358
          2824582824582824855B5CAC9492582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7E0D7D69D
          86846E585A6D56546E585A7F63637664566E585A6E585A795758795758795758
          7957586E585A86787ACCB7B6F8EDEFFFFFFFF7F7F7FFFFFFFFF6F7F7FFFFEEF7
          F7F7FFFFEEF7F7F7F7F7FFFFFFEFE5E5C9ABB07F63637F636379575879575879
          57587957586E585A7F63637F63637F63637957587F63637F6363977D7DE0D7D6
          FFFFFFFFFFFFF7FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D667454B67454BBEA9ACE2
          CBCFE2CBCFFFF6F7FFEFEEF9E4E7A484856E585A43252A2E1A1958434667454B
          6E585AE2CBCFFFF7FFDEC2C1855B5CFAD8DEB7999E795758DEC2C1E0D7D6CCB7
          B6AC9492956F755A3B3A52333043252A43252A43252A40212048292A48292A53
          282B763F4888495363282C63282C53282B53282B592D3452333043252A86787A
          FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC94925828245828245828245828
          24FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF663333582824582824582824BEA9ACFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFFFFFFFFFFFFFAC9492582824582824582824582824
          CFBDBEF8EDEF663333855B5CFFFFFFFFFFFFFFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFD6C4C567454B2E1A193D1B1C53282B
          4A20214021204021204021204021204A20215828245828245828245828244A20
          214A202186787AEFE5E5FFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFEFE5E5947A744B30344A20215B29295222205222205222205222203D1B1C
          4A20214A20214A20214A20213D1B1C4A20213D1B1C584346E2CBCFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8EDEFCFBDBED8D6D6FFF6F7FFFFFFFFFFFFF7F7F7
          FFFFFFF9E4E772524D43252A48292A67454BD7ADAEDEAFB1693A426B4344AD89
          8FF0DBD9FAD8DEFFEFEEAA7F7C78474F956F756D56544B30342E1A192E1A192A
          1F212A1F212A1F212A1F212018192A1F212A1F212A1F214B30347F6363A48485
          5A3B3A693A42956F75C9ABB0D5BEBCC9ABB0938684AF9A9DEFE5E5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF8D6B6C5828245828245828246B4344FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          855B5C582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFFFFFFFFF8EDEF6633335828245828245828246B4344FFFFFFFFFFFFA484
          85582824D6C4C5FFFFFFFFFFFFFFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7
          F7F7F7FFFFFFFFFFFFBEA9AC8F6964AD8285AA7F7CAA7F7C956F75AA7F7C937A
          6DAA7F7CAA7F7CAA7F7C8455575B292966333366333366333353282B48292A86
          787AF8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7887175402120
          53282B66333363282C6633336633338B5860A4716FAA7F7CAA7F7CAA7F7CAA7F
          7CAA7F7CAA7F7CAA7F7CAA7F7C956F75B7999EFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFCFBDBE5A3B
          3A592D34693A42693A42DEAFB1FFEFEE956F75592D34763F48956F75DEAFB1AD
          8285884953693A42693A42693A423D1B1C2A1F212A1F212A1F212A1F21201819
          2018192018192018192018192A1F214B30344B3034AC9492D6C4C5CFBDBEFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF855B5C582824582824582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C5828245828
          24582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFBEA9
          AC582824582824582824582824BEA9ACFFFFFFFFFFFFEFE5E5582824947A74FF
          FFFFFFFFFFFFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF8EDEFBEA9
          ACAD898FB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB6
          8C8D9C706366333363282C66333366333353282B48292A6E585AEFE5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E76E585A4A202158282463282C6328
          2C63282C5B29298F6964B68C8DB79A95B68C8DB68C8DB68C8DB68C8DB68C8DB6
          8C8DB68C8DB68C8DB68C8DC9ABB0F9E4E7FFFFFFFFFFFFFFF6F7FFF6F7F7FFFF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFEEF7F7F7FF
          FFF7FFFFFFFFFFFFF6F7FFFFFFFFFFFFFFF6F7977D7D592D346A313A793D476A
          313A8B5860F9E4E7E2CBCF78474F592D34733741733741733741793D47793D47
          793D478B58607957584021202018192018192A1F214A444586787A86787A3333
          3333282A33333333282A4B30347F6363FFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824
          582824582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824582824582824855B5CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFF6B434458282458282458
          28246B4344FFFFFFFFFFFFFFFFFFFFFFFF947A74582824EFE5E5FFFFFFFFFFFF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7FFFFFFFFFFFFFFFFFFF4F8EFD7CFC45C544948292A4A20214A20214A
          20214A20214A20214A202140212053282B52222052222052222058282463282C
          66333366333352222072524DBEA9ACF9E4E7FFF6F7FFFFFFF7F7F7FFFFFFFFFF
          FFEEF7F7F7FFFFFFFFF7F9E4E7CC999978474F5222205B29295B292966333358
          2824582824301E083D1B1C4A20214A20214A20214A20214A20214A20214A2021
          4021204021207F6363E0D7D6FFEFEEFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFF8EDEF9F8A8D6E585A6B4344845557D7ADAE8B5860663333CC9999
          FAD8DE8D6B6CA4716FA4716F763F4873374186414C86414C7B3742793D47D7AD
          AE947A744B303433282A5C5449CCCCCCE0D7D6B0A8A9CFBDBE99999959484B2A
          1F212A1F216E585AFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824582824582824855B
          5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF855B5C582824582824582824855B5CFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFBEA9AC582824582824582824582824BEA9ACFFFFFF
          FFFFFFFFFFFFFFFFFFEFE5E5582824947A74FFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFEEF7F7FF
          FFFFFFFFFFFFFFFF86787A59484B59484B72524D6B43446B43446B43446B4344
          6B43446B43446B43446B43446B4344592D34592D3453282B53282B48292A9D86
          84EFE5E5FFFFFFFFF6F7FFF6F7FFF6F7E7E7E7FFFFF7FFFFF7E7E7E7E7E7E7FF
          FFFFFFFFFFFFFFFFF0DBD9977D7D52333052333058282458282463282C72524D
          72524D6B43446B43446B434472524D67454B72524D67454B67454B67454B5345
          47938684FFF6F7FFF6F7F7FFFFEEF7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFF7FFFFF7FFB7999E
          5A3B3ACCB7B6FAD8DEDEC2C1D7ADAEA484857957585843467F6363BEA9ACFFF6
          F7CDA7A5763F4886414C7B374286414C853643793D47B68C8DFFEFEE99999986
          787AD8D6D6B0A8A95C54495C544986787A6E585A3333332A1F212A1F21666666
          E7E7E7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAC949258282458282458282472524DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          6633335828245828245828248D6B6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFF6B43445828245828245828246B4344FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF947A74582824EFE5E5FFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFEFFFFFEEF7F7F7FFFFF7F7F7F7F7F7F8EDEFCFBDBE
          BEA9ACBCA3A1CDA7A5D7ADAED7ADAED7ADAED7ADAED7ADAECDA7A5CDA7A5CDA7
          A5D7ADAECC9999693A4253282B53282B523330BEA9ACFFF6F7FFFFFFFFFFFFF0
          DBD99386846E585ABFB7A8E2CBCFCFBDBECCB7B66E585A9F8A8DE3E0DBFFFFF7
          FFFFF7FFFFF7AF9A9D5233306633336A282D6A313ACC9999CDA7A5CDA7A5CDA7
          A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5BCA3A1BEA9ACCFBDBEFF
          F6F7FFFFFFF7F7F7F7F7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFF7FFFFF7FFFFF7F7F7FFF7FFE2CBCF78474F693A42CC9999FFF7
          FFE2CBCF947A74D6C4C5AC94926E585A9F8A8DEFE5E5FFFFFFF9E4E784555773
          374186414C883C48883C487B37428B5860FAD8DEB0A8A93333335C54494A4445
          33282A20181953454786787A4A44452018192A1F215C5449F7F7F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCFBDBE582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5BEA9AC5828245828
          24582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D658
          2824947A74FFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEEF7F7EEF7F7FFFFFFFFFFFFE0D7D67F63635233305233305233306633
          33663333663333663333663333663333663333663333733741732B376A282D6A
          282D5828245A3B3ABEA9ACFFFFF7FFFFF7F8EDEF9386844B303443252AB6A19F
          947A74977D7D9D8684956F75B7999E48292A5A3B3A9F8A8DFFF7F0FFF7F0FFFF
          F7BCA3A166333363282C6A282D6A313A6A313A66333366333366333366333366
          3333663333663333663333592D34693A425A3B3A5233307F6363F0DBD9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7F7F7F7F9E4E78D6B6C6A313A7337418B5860FAD8DEFFEFEEF0DBD9AF
          9A9D86787AB0A8A9FFF6F7FFF6F7FFF6F7FFFFFFAD898F6A313A86414C853643
          883C48883C48733741BCA3A1FFFFFFCFBDBE6666662A1F212A1F212018193328
          2A4A444533282A2A1F212A1F21666666E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF663333
          582824582824582824E0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC582824582824582824582824E0D7D6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C572524D582824582824582824663333F8
          EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C663333F8EDEF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7F7FF
          FFF7F7F7FFEFEE7F63633D1B1C5A3B3A5B29295B29296633335B29295B292966
          333366333366333366333363282C63282C6A282D6A282D6A282D5B29299F8A8D
          FFFFFFFFFFFFFFEFEED5BEBC67454B2E1A19938684BCA3A13D1B1CA48485A484
          8553282BCDA7A5A4716F40212067454BD6C4C5F8EDEFFFF6F7FFF6F7B68C8D52
          22205B29295B29295B29295B29295B29295B29295B29295B29295B2929663333
          6633336633335B29295B2929592D343D1B1C7F6363F9E4E7FFF6F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF
          9A9D53282B7B37427B37426A313AAD8285FFEFEE86787A5C5449D8D6D6FFF6F7
          FFFFFFEEF7F7F7FFFFFFFFFFE2CBCF78474F7B3742883C48883C48883C486A31
          3A8D6B6CE0D7D6999999B0A8A986787A4A444566666633282A20181920181933
          282A33282A86787AFFF6F7FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA484855828245828245828
          24A48485FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF855B5C5828245828245828246B4344FFFFFFFFFFFFEFE5E5AC9492
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5AC9492FFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824AC9492582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824AC94925828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFEEF7F7FFFFFFEFE5E5CC
          B7B6CDA7A5D7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAEDEAFB1
          DEAFB1DEAFB1DEAFB184555763282C522220795758F8EDEFFFFFFFF9E4E78F69
          648B5860DEAFB1B79A95D5BEBC6B43443D1B1CA48485977D7D3D1B1C67454BDE
          C2C1B79A95CCB7B66E585A786F62FFEFEEFFEFEEFFEFEE78474F53282B663333
          845557D7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAEDEAF
          B1CDA7A5D7ADAED7ADAEBEA9ACFFEFEEFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E572524D6A313A853643
          883C487B374278474F7F63634B30344B3034BFB7A8FFF7FFFFFFFFF7FFFFEEF7
          F7FFFFFFFFEFEE956F75793D47883C48883C48883C4886414C6B4344B7999E6E
          585A86787AE7E7E7B0A8A986787A786F6233282A2A1F2120181933282ABEA9AC
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF6B4344582824582824663333F8EDEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824
          582824582824582824D6C4C5FFFFFFFFFFFFD6C4C5582824FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD6C4C5582824FFFFFFFFFFFFFFFFFFFFFFFFAC9492582824663333
          582824582824582824663333F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF72524D663333582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E593868467454B795758855B5C795758
          855B5C855B5C855B5C795758845557845557845557855B5C845557855B5C7957
          586A313A5B2929592D34C9ABB0FFFFF7FFFFF7AD898F52222063282C63282CDE
          C2C1F0DBD9CC9999CC9999DEC2C1CCB7B6BCA3A1C9ABB0E2CBCFD5BEBC523330
          402120402120AD898FFFFFFFFFF6F7C9ABB040212053282B693A427957587957
          58795758795758795758845557845557845557845557845557855B5C72524D7F
          63636E585A5C5449938684F8EDEFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7BEA9AC6A313A7B37428536438536437B3742693A
          4248292A2E1A192018194A4445999999FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFCC
          B7B6693A42793D47883C48883C48883C48763F486B43449F8A8D86787ACCCCCC
          86787A33282A86787A4A44452A1F212A1F21584346C9ABB0FFF6F7FFFFFFF7FF
          FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0D7D666333358282458282472524DF8EDEFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF6B4344582824582824582824AC94
          92FFFFFFFFFFFFFFFFFFD6C4C5582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F
          582824E0D7D6FFFFFFFFFFFFFFFFFFAC94925828245828245828245828245828
          24947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBEA9AC582824582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEFEE6E585A2E1A194021204A20214A20214A20214A20214A20214A20
          214A20214A20214A20214A20214A20214A20214A20214A20215B292952222069
          3A42F0DBD9FFFFFFD8D6D658434653282B663333663333B6A19F5C544972524D
          8F6964C9ABB0C9ABB07F636372524D6B4344D7ADAE6B434453282B53282B5843
          46E0D7D6FFFFFFEFE5E54B303448292A48292A4A20214A20214A20214A20214A
          20214A20215222205222205222205222205222204A20214A2021402120402120
          2E1A19666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFF
          FFFFF6F7956F756633337B3742883C48883C486A313A592D3440212040212033
          282A20181933282A999999E7E7E7F7FFFFF7FFFFFFFFFFFFF6F78D6B6C6A313A
          793D47883C48883C48883C48693A42BEA9ACFFF6F7F8EDEFB0A8A93333334A44
          456E585A48292A43252A6D5654855B5CD5BEBCFFFFFFFFFFFFFFFFFFF7F7F7F7
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE0D7D66B434458282458282472524DCFBDBEFFFFFFFFFFFFFFFFFFFFFF
          FFF8EDEFBEA9AC663333582824582824582824B6A19FFFFFFFFFFFFFFFFFFFFF
          FFFFD6C4C558282472524DA48485AC9492AC9492AC9492947A74582824582824
          582824582824A48485AC9492AC9492AC9492947A746B4344582824D6C4C5FFFF
          FFFFFFFFFFFFFF947A74582824582824582824582824582824EFE5E5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B4344
          582824582824582824582824947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C59F8A
          8D977D7DA48485A48485A48485A48485A484859D86849D86849D86849D86849D
          8684A48485A48485A48485A48485A48485A48485A48485B7999EFFF6F7FFF6F7
          9F8A8D402120592D3463282C845557CDA7A548292A48292A3D1B1CA48485947A
          743D1B1C48292A5B2929CDA7A5855B5C5B29295B292948292A9D8684FFFFF7FF
          FFF7AF9A9DA48485A48485A48485A48485A48485A48485A48485A48485AD8285
          AD8285AD8285AD8285AD8285A48485A48485A48485A48485938684938684F7F7
          F7FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFF7FFFFEFEE78474F63
          282C86414C8536437A2E3A693A42B7999E956F752E1A192A1F212A1F212A1F21
          201819666666B0A8A9F7F7F7F7F7F7FFFFFFCFBDBE67454B73374186414C8536
          43883C48883C488B5860FAD8DEFFFFFFFFFFFFCFBDBE4A444543252A43252A53
          282B763F4878474F8D6B6CE0D7D6FFFFFFF7F7F7F7F7F7F7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8ED
          EFAC9492663333582824582824663333855B5C855B5C72524D58282458282458
          28245828248D6B6CE0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F582824
          5828245828245828245828245828245828245828245828245828245828245828
          24582824582824582824582824582824582824BEA9ACFFFFFF855B5C6B434458
          28245828245828245828245828248D6B6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC94925828245828245828
          245828245828246B4344855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEFFFFFFFFFFFFFFF
          F6F7FFFFFFFFFFFFFFF6F7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFEFEE79575853282B6633
          33522220AD8285AD82854A2021663333582824AD8285AD828552222066333358
          2824AA7F7CAA7F7C5828245828245828247F6363FFEFEEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFF6F7FF
          FFFFFFFFFFF7FFFFEEF7F7FFFFFFFFFFFFDEC2C1693A426A313A883C48883C48
          6A282D8D6B6CFFEFEEFAD8DE5A3B3A2E1A192A1F212A1F212A1F212018196666
          66E7E7E7FFFFFFF7F7F7F7F7F7AD898F5A3B3A86414C883C48883C48883C486A
          313AB68C8DFFF6F7FFFFFFFFFFFFE0D7D6977D7D7957586B43446B4344793D47
          845557AF9A9DFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5AC9492947A74855B5C855B5C855B5C855B5CAC9492BEA9ACEFE5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5AC9492AC9492CFBDBED6C4
          C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6
          C4C5B6A19FAC9492AC9492D6C4C5FFFFFFAC9492AC9492AC9492AC9492AC9492
          AC9492AC9492E0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEFAC9492AC9492AC9492AC9492AC9492AC
          9492AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7FF
          F7F7FFF7F7FFF7FFFFFFFFF6F7F0DBD95A3B3A4A20214A2021582824CC999985
          5B5C522220522220522220AA7F7CAA7F7C5222205828244A2021855B5CAA7F7C
          4A20214A20214A20216B4344F0DBD9FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7FF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFF7FFFFFFFFFFCCB7B6592D347337417337417B3742733741D5BEBCFFF7
          FFFFF7FFAC94924B30342E1A1920181933282A201819333333938684F4F8EFFF
          FFFFFFFFFFF0DBD97957586A313A793D47853643883C487B37426A313AC9ABB0
          FFFFFFFFFFFFFFFFFFD5BEBC693A426A313A6A313A7B374278474F8D6B6CF0DB
          D9FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFEFEE9F8A8DAD898FA48485A48485DFCFBFBCA3A1AA7F7CAA7F7C
          AA7F7CDEC2C1CCB7B6AA7F7CAA7F7CAA7F7CCDA7A5DFCFBFA69080AC9492A484
          85977D7DF9E4E7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFF
          FFF0DBD96D565453282B793D477A2E3A884953CC9999B68C8D8D6B6C8D6B6C69
          3A424B303443252A201819333333786F62333333B0A8A9FFFFFFF7F7F7FFFFFF
          C9ABB0693A42693A42883C488536438536436A313A795758DEC2C1FFF6F7E2CB
          CF956F7567454B592D34793D47853643853643845557A48485F9E4E7FFF6F7FF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7F7F7F0DBD9
          A48485977D7D977D7D977D7DDFCFBFBCA3A1947A74AA7F7C977D7DC9ABB0CCB7
          B6947A74AA7F7C977D7DB79A95DEC2C1947A74977D7DA48485A48485F9E4E7FF
          F6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9ABB048
          292A6633337B374286414C763F4878474F78474F78474F763F48693A42592D34
          48292A59484BAF9A9D2A1F2186787AFFFFFFFFFFFFFFFFFFFFF6F7A484856A31
          3A7B374285364385364386414C663333845557BEA9AC956F75AD898FAD898F53
          282B733741883C487A2E3A763F48763F48D5BEBCFFF7FFFFF7FFFFF7FFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFFFF6F7FFFFFFFFFFFFEEF7F7EFFFFFF7FFFFF0DBD95A3B3A5222205222
          20522220B79A958F69644A20215828243D1B1CAA7F7CA484853D1B1C4A20214A
          20218F6964AC94924A20214A20214A20215A3B3AF0DBD9FFFFFFFFFFFFEFFFFF
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF8EDEF947A74592D346A282D
          6A282D85364385364386414C7A2E3A853643883C48733741693A4259484B786F
          62201819887175FFF7FFFFF7FFFFF7FFFFF7FFEFE5E58D6B6C73374185364385
          36437A2E3A7B3742763F4878474F956F75AD898FDEC2C178474F63282C853643
          853643793D47693A42B68C8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFEFFFFFEEF7F7FFF7F07957585B2929663333522220AD8285AA
          7F7C5828245B29295B2929AD8285AA7F7C53282B592D344A2021AD8285AD8285
          4A2021592D3453282B7F6363FFF6F7FFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7F7F7FFFFFFFFFFFFFFF6F7F9E4E7855B5C3D1B1C732B37883C488536
          438536438536438536437B3742763F48592D344B303453454743252A59484BC9
          ABB0E2CBCFFFF6F7F8EDEFFFF6F7D5BEBC8849536A282D853643883C487B3742
          7B374288495378474F956F75FAD8DEB68C8D63282C7A2E3A883C487B37427847
          4F8D6B6CFFEFEEFFEFEEFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFF7FFFFFF9F8A8D4A20215B29295B29298F6964CC9999522220592D34
          3D1B1CAA7F7CAA7F7C3D1B1C53282B53282BCDA7A5855B5C53282B53282B5328
          2BAC9492FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F7FFFFFFD6C4C567454B4A20216A282D7B3742732B37732B3773
          2B3753282B53282B584346BEA9ACEFE5E5D6C4C57F636359484B6E585A7F6363
          7F63637F63637F636378474F5828247A2E3A7A2E3A853643853643883C487B37
          42884953A4716FA4716F66333366333373374173374173374178474FF9E4E7FF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E2CBCF5A3B3A53282B53282B592D34CDA7A572524D72524D8D6B6CD7ADAED7AD
          AE8D6B6C79575872524DD7ADAE53282B5A3B3A523330584346F0DBD9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFD6C4C57F6363592D34693A42693A42592D3467454B8D6B6CBCA3A1
          EFE5E5FFF6F7FFFFFFFFFFFFF8EDEFEFE5E5E2CBCFBCA3A19F8A8DAC9492C9AB
          B0E2CBCF8D6B6C5222206A313A86414C7B37427B37427A2E3A86414C86414C88
          4953793D476A313A5B292963282C4A20218B5860F9E4E7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D86844829
          2A4A20216B4344DEC2C1DEC2C1BCA3A1AC9492CCB7B6CCB7B6A48485BCA3A1FA
          D8DEDEC2C172524D402120402120AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFFF
          EFE5E5E2CBCFDEC2C1D5BEBCE2CBCFF9E4E7FFF6F7FFF6F7FFF6F7FFFFFFF7F7
          F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5AD
          898F4A2021592D34733741793D4786414C7B37427B374286414C86414C884953
          793D474A202178474FCCB7B6FFF6F7FFFFFFFFFFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFFFFFFEFEE7F63638D6B6CD7ADAEB6
          8C8DDEC2C172524D2E1A19977D7D9D86843D1B1C67454BDEC2C1B68C8DD5BEBC
          7F6363887175FFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7EEF7F7F7FFFFF7FFFFF7
          F7F7F7F7F7FFFFFFF7F7F7F7FFFFEEF7F7F7FFFFFFFFFFFFFFFFBEA9AC67454B
          53282B53282B6A313A6A313A7B37427337417337417337416A313A855B5CD5BE
          BCFFF7FFFFF7FFFFF7FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF6F7FFF6F7D5BEBC67454B2E1A19AD898FBCA3A1
          43252A9D8684977D7D402120C9ABB0977D7D2E1A1959484BE2CBCFF8EDEFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEEF7F7F7FFFFF7FFFFEEF7F7FFFFFFFFFFFFF9E4E7B7999E7957584A20
          21592D346A313A592D34592D344A2021795758E2CBCFFFFFFFFFFFFFF7F7F7FF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFF
          FFFFFFFFFFFFFFFFFFF9E4E79F8A8D4B303433282AAC94929386849386849F8A
          8D977D7D9F8A8D2E1A195843469F8A8DF8EDEFFFFFFFF7F7F7F7F7F7F7F7F7FF
          FFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF
          FFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFFFFFFF0DBD9BCA3A1B7999EBEA9ACBE
          A9ACBEA9ACBEA9ACF9E4E7FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFF
          F7FFFFF7FFFFF7E0D7D69F8A8D6E585ACCB7B6E2CBCFE2CBCFCCB7B66E585AAF
          9A9DE0D7D6FFF7FFFFF6F7F8EDEFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7
          F7F7FFFFFFF7F7F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFFF
          F7F7F7F7F7F7F7F7F7FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFF8EDEFFF
          FFFFFFFFFFFFF6F7EFE5E5FFFFFFFFFFFFEFE5E5FFF6F7FFF6F7FFFFFFF7F7F7
          FFFFFFFFFFFFF7F7F7F7F7F7F7FFFFEEF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7FFFF
          FFFFFFFFEEF7F7F7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FF
          FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFF
          F7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        mmHeight = 14023
        mmLeft = 134144
        mmTop = 1852
        mmWidth = 45244
        BandType = 0
      end
      object ppImage3: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170E6430000424DE64300000000000036000000280000004C00
          00004C0000000100180000000000B04300000000000000000000000000000000
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF99CCFFF0FBFFFFFFFF
          99CCFF99CCFF99CCFF99CCFF99CCFF99CCFF99CCFF99CCFF6699CC6699CC6699
          CC99CCFF99CCFF99CCFF6699CC6699CC6699CC6699CC99CCCC99CCFF6699CC66
          99CC6699CC99CCCC66CCFF99CCFF99CCFF99CCFFF0FBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF0FBFFFFFFFF6699FF0099FFF0FBFF3399FF99CCFF3399
          FF99CCFF66CCFF3399FFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F85555555F5F5F86
          8686555555777777FFFFFF808080555555868686777777555555B2B2B2A4A0A0
          5555557777777777775555559999CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFC6D6EF3399FF6699FFFFFFFF0099FFCCFFFF6699FF3399FFFF
          FFFF0099FF66CCFFC6D6EF3399FFD6E7E7FFFFFFFFFFFFFFFFFFB2B2B24D4D4D
          C0C0C0FFFFFF999999555555CCCCCC555555969696FFFFFFEAEAEA555555C0C0
          C0555555555555FFFFFFFFFFFF5F5F5F336699FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF3399FFC6D6EF0099FF99CCFFFFFFFF0099FFFFFFFF0099FF
          3399FFF0FBFF3399FF3399FFCCFFFF3399FFF0FBFFFFFFFFFFFFFFFFFFFFF1F1
          F1EAEAEAFFFFFFEAEAEA666666555555C0C0C0555555B2B2B2FFFFFFC0C0C055
          5555B2B2B2F1F1F1F1F1F1FFFFFF9999995F5F5F336699FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF0FBFF3399FFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF3399FF3399FFC6D6
          EF3399FF66CCFF6699FF0099FF99CCFF3399FF0099FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF969696555555555555C0C0C0D7D7D7555555C0C0C0DDDDDD
          4D4D4D555555A4A0A0FFFFFFD7D7D75F5F5F55555566666699CCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF3399FF66CCFFFFFFFF3399FFCCFFFFC6D6EF3399FF99
          CCFF3399FF66CCFFFFFFFFC6D6EFF0FBFFFFFFFFF0FBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF666666555555808080F1F1F1FFFFFFCCCCCC555555C0C0
          C0FFFFFFFFFFFFFFFFFFFFFFFFC0C0C05555555F5F5FC0C0C0FFFFFFC6D6EFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF0FBFF3399FF0099FFF0FBFFFFFFFF0066FFCCFFFFF0FBFFFFFFFF6699FF
          99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCCCCCC555555999999FFFFFFD7D7D7C0C0C0D7D7D755
          5555B2B2B2FFFFFFEAEAEA868686CCCCCC777777555555FFFFFFFFFFFFC0C0C0
          6699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC6D6EF3399FFF0FBFF0066FFF0FBFF3399FF0099FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3555555868686FFFFFF6666664D4D4D
          FFFFFF555555666666F1F1F19999994D4D4DCCCCCC868686555555E3E3E3C0C0
          C0555555336699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFC6D6EF0099FF66CCFF6699FF66CCFFD6E7E73399FFF0FBFFCCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B25F5F5F4D4D4D5555
          55C0C0C0FFFFFFDDDDDD6666664D4D4D555555A4A0A0FFFFFFF1F1F17777774D
          4D4D4D4D4D80808099CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF3399FFCCFFFF66CCFF3399FF3399FF3399FF6699FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF99CCFFCCFFFF0099FFCCFFFF99CCFF6699FFF0FBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF3399FF99CCFF0099FF66CCFF3399FF3399FF99CCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C6D6EF99CCFF66CCFF66CCFF66CCFF99CCFFC6D6EFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFFCCFFFF6699FF66CCFF6699FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF3399
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FFC6
          D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFA4A0A0B2B2B2B2B2B2B2B2B2A4A0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF0099FF99CCFF3399
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCFFFF3399FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF3399FFCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5555556666665F5F5F5F5F5F555555FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
          CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF0099FF
          0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF66CCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666
          555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0099FF0066FF3399FFC6D6EF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF6699FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F6666666666
          66666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF99CCFFFFFFFFC6D6
          EF3399FF66CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099FF66CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F66
          6666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF0066FF33
          99FFC6D6EFC6D6EF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6EF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099
          FF0099FF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FFC6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF
          FFFFFF99CCFF3399FF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF00
          99FF0099FF99CCFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6
          EF0099FF0099FFFFFFFF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF99CCFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF
          0099FF0099FFC6D6EFFFFFFFCCFFFF0099FF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF3399FFF0FBFF6699FF99CCFF99CCFF66CCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399
          FF0099FF0099FFD6E7E7FFFFFFFFFFFFFFFFFFD6E7E70099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF3399FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666555555FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC6D6EF3399FFF0FBFF0066FF3399FFC6D6EFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF0FBFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666555555FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC6D6EFF0FBFFF0FBFFF0FBFFCCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFC6D6EF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF0FBFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFC6
          D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666
          555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF3399FF3399FF3399FF0099FF0066FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F6666666666
          66666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF3399FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFCCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399FF0099FF0099FF0099FF0099
          FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F66
          6666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D5555555F5F5F55
          55554D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFF99CC
          FF0066FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399FF0099FF00
          99FF0099FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666
          666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFFFF66
          CCFF0099FF0099FF0099FF66CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3399FF0099FF0099FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFEAEAEA5F5F5F666666666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777
          776666666666666666665F5F5FEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
          FBFF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFFFFFFF
          66CCFF0099FF0099FF0099FF0099FF0099FF66CCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF3399FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD7D7D75F5F5F666666666666666666777777FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF8686866666666666666666665F5F5FCBCBCBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF6699FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF0099FF3399FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFB2B2B25F5F5F666666666666666666969696FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB2B2B2666666666666666666666666999999FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF66CCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF8080806666666666666666665F5F5FC0C0C0FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD7D7D75F5F5F666666666666666666666666FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF3399
          FF0099FF0099FF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555555666666666666666666555555
          EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5555556666666666666666665F5F5F
          DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B25F5F5F6666666666666666
          66666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686866666666666666666
          66666666868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF00
          99FF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66666666666666666666
          6666666666B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D75F5F5F66
          6666666666666666555555EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099FF0099FFF0
          FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B25F5F5F666666
          666666666666555555F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          666666666666666666666666666666777777FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6699FF0099FF0099FF3399FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099FF0099FF
          6699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5555556666
          66666666666666666666868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFCCCCCC555555666666666666666666555555A4A0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6EF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FFC6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777A4
          A0A0666666666666666666555555F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF777777666666666666555555C0C0C0868686D7D7D7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF3399
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF99
          CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999
          666666C0C0C0F1F1F1A4A0A05F5F5FA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1555555666666DDDDDDC0C0C0EAEA
          EA424242E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF0FBFF99CCFF66CCFF6699FF3399FF6699FF66CCFF99CCFFF0FBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2
          B2555555969696DDDDDDE3E3E3999999666666FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C05F5F5FEAEAEA86
          8686555555C0C0C05F5F5FD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4
          A0A0555555DDDDDDEAEAEA777777D7D7D7555555EAEAEAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999
          555555B2B2B2F1F1F1C0C0C0666666777777A4A0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          777777666666A4A0A0E3E3E3808080EAEAEA424242CCCCCCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF8686865F5F5FD7D7D75F5F5FA4A0A0E3E3E3777777666666EAEAEAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCC
          CC555555A4A0A0666666D7D7D7969696C0C0C0777777B2B2B2FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF868686555555D7D7D7C0C0C0B2B2B2666666CCCCCC
          424242868686EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D777
          77774D4D4DC0C0C0808080F1F1F1555555D7D7D74D4D4DB2B2B2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A05F5F5FC0C0C0666666E3E3
          E3666666D7D7D7C0C0C0555555777777C0C0C0F1F1F1FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAB2B2B2666666
          777777A4A0A0E3E3E3DDDDDDA4A0A0969696FFFFFF555555D7D7D7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D74D4D4DB2
          B2B2E3E3E3777777FFFFFF666666DDDDDDB2B2B27777775F5F5F666666868686
          B2B2B2C0C0C0CBCBCBCCCCCCCCCCCCC0C0C0A4A0A08686865F5F5F5555556666
          66999999EAEAEA868686555555D7D7D7F1F1F16666665F5F5FF1F1F1FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF8686864D4D4DC0C0C0B2B2B2777777F1F1F1F1F1F1DDDDDD7777777777
          77D7D7D7868686999999969696777777777777666666999999777777B2B2B2E3
          E3E3555555EAEAEAA4A0A0999999CCCCCC5555555F5F5FB2B2B2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEAEAEA777777555555999999D7D7D7C0C0C0DDDDDD55
          5555C0C0C0808080868686EAEAEA666666DDDDDDCBCBCB777777EAEAEA555555
          DDDDDDCCCCCCB2B2B2B2B2B2969696B2B2B2666666969696FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA9696964D4D4D868686
          808080555555D7D7D7B2B2B2777777F1F1F1808080D7D7D7D7D7D7777777DDDD
          DD808080E3E3E3868686CBCBCB666666666666A4A0A0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD7D7D7A4A0A0777777555555868686555555B2B2B2868686969696B2B2B277
          7777A4A0A0868686555555808080A4A0A0E3E3E3FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEADDDDDDC0C0C0C0C0C0B2B2B2
          B2B2B2CBCBCBD7D7D7EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        mmHeight = 14552
        mmLeft = 122238
        mmTop = 1852
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'VALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 94986
        mmTop = 29898
        mmWidth = 8975
        BandType = 0
      end
      object ppShape18: TppShape
        UserName = 'Shape18'
        Brush.Color = 16742726
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 4763
        mmTop = 70908
        mmWidth = 175419
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
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
        mmHeight = 17198
        mmLeft = 2117
        mmTop = 0
        mmWidth = 41540
        BandType = 0
      end
      object ppShape20: TppShape
        UserName = 'Shape20'
        Brush.Color = 16742726
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 5027
        mmTop = 262996
        mmWidth = 174890
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 263261
        mmWidth = 174890
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 16742726
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 5027
        mmTop = 291042
        mmWidth = 174890
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'CONDI'#199#213'ES GERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 291307
        mmWidth = 174625
        BandType = 0
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Caption = 'Region1'
        Pen.Style = psClear
        ShiftRelativeTo = ppRegion5
        Stretch = True
        mmHeight = 6615
        mmLeft = 0
        mmTop = 136790
        mmWidth = 179917
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport3: TppSubReport
          UserName = 'Acompanha_frete'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppdb_acompanha_frete'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 137848
          mmWidth = 179917
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppdb_acompanha_frete
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 5000
            PrinterSetup.mmMarginLeft = 15000
            PrinterSetup.mmMarginRight = 15000
            PrinterSetup.mmMarginTop = 5000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppdb_acompanha_frete'
            object ppTitleBand4: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppShape19: TppShape
                UserName = 'Shape34'
                Brush.Color = 16762544
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 20108
                mmTop = 0
                mmWidth = 160073
                BandType = 1
              end
              object ppLabel66: TppLabel
                UserName = 'Label66'
                Caption = 'CUSTO QUE ACOMPANHA O FRETE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2582
                mmLeft = 20638
                mmTop = 529
                mmWidth = 32808
                BandType = 1
              end
            end
            object ppDetailBand5: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppDBText19: TppDBText
                UserName = 'DBText19'
                DataField = 'NM_ITEM'
                DataPipeline = ppdb_acompanha_frete
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = [fsBold]
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppdb_acompanha_frete'
                mmHeight = 2582
                mmLeft = 20638
                mmTop = 529
                mmWidth = 77523
                BandType = 4
              end
              object ppShape57: TppShape
                UserName = 'Shape57'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 127794
                mmTop = 0
                mmWidth = 13494
                BandType = 4
              end
              object ppDBText53: TppDBText
                UserName = 'DBText53'
                DataField = 'calc_NM_BASE_CALC'
                DataPipeline = ppdb_acompanha_frete
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_acompanha_frete'
                mmHeight = 2582
                mmLeft = 98690
                mmTop = 529
                mmWidth = 27781
                BandType = 4
              end
              object ppShape61: TppShape
                UserName = 'Shape801'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 143140
                mmTop = 0
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText55: TppDBText
                UserName = 'DBText55'
                DataField = 'VL_VENDA'
                DataPipeline = ppdb_acompanha_frete
                DisplayFormat = '#0.,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_acompanha_frete'
                mmHeight = 2582
                mmLeft = 143934
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppShape67: TppShape
                UserName = 'Shape67'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 161925
                mmTop = 0
                mmWidth = 18256
                BandType = 4
              end
              object ppDBText56: TppDBText
                UserName = 'DBText56'
                DataField = 'VL_CALCULADO'
                DataPipeline = ppdb_acompanha_frete
                DisplayFormat = '#0.,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_acompanha_frete'
                mmHeight = 2582
                mmLeft = 163248
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText54: TppDBText
                UserName = 'DBText54'
                DataField = 'AP_MOEDA'
                DataPipeline = ppdb_acompanha_frete
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppdb_acompanha_frete'
                mmHeight = 2582
                mmLeft = 128852
                mmTop = 529
                mmWidth = 10583
                BandType = 4
              end
              object ppDBText60: TppDBText
                UserName = 'DBText60'
                DataField = 'TX_PC'
                DataPipeline = ppdb_acompanha_frete
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdb_acompanha_frete'
                mmHeight = 2582
                mmLeft = 148432
                mmTop = 794
                mmWidth = 2646
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppSubReport5: TppSubReport
                UserName = 'total_frete'
                ExpandAll = True
                NewPrintJob = False
                OutlineSettings.CreateNode = True
                TraverseAllData = False
                DataPipelineName = 'ppdb_Total_Frete_LCL'
                mmHeight = 4498
                mmLeft = 0
                mmTop = 265
                mmWidth = 180000
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppChildReport6: TppChildReport
                  AutoStop = False
                  DataPipeline = ppdb_Total_Frete_LCL
                  PrinterSetup.BinName = 'Default'
                  PrinterSetup.DocumentName = 'Report'
                  PrinterSetup.PaperName = 'A4'
                  PrinterSetup.PrinterName = 'Default'
                  PrinterSetup.mmMarginBottom = 5000
                  PrinterSetup.mmMarginLeft = 15000
                  PrinterSetup.mmMarginRight = 15000
                  PrinterSetup.mmMarginTop = 5000
                  PrinterSetup.mmPaperHeight = 297000
                  PrinterSetup.mmPaperWidth = 210000
                  PrinterSetup.PaperSize = 9
                  Units = utMillimeters
                  Version = '7.02'
                  mmColumnWidth = 0
                  DataPipelineName = 'ppdb_Total_Frete_LCL'
                  object ppTitleBand6: TppTitleBand
                    mmBottomOffset = 0
                    mmHeight = 3969
                    mmPrintPosition = 0
                    object ppLabel23: TppLabel
                      UserName = 'Label23'
                      AutoSize = False
                      Caption = 'TOTAL CUSTO FRETE'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = 7895160
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = [fsBold]
                      mmHeight = 2582
                      mmLeft = 128852
                      mmTop = 529
                      mmWidth = 27517
                      BandType = 1
                    end
                  end
                  object ppDetailBand7: TppDetailBand
                    mmBottomOffset = 0
                    mmHeight = 4233
                    mmPrintPosition = 0
                    object ppShape69: TppShape
                      UserName = 'Shape3'
                      Brush.Color = 15263976
                      Pen.Color = clGray
                      Pen.Style = psClear
                      mmHeight = 4233
                      mmLeft = 127794
                      mmTop = 0
                      mmWidth = 13494
                      BandType = 4
                    end
                    object ppDBText57: TppDBText
                      UserName = 'DBText1'
                      DataField = 'AP_MOEDA'
                      DataPipeline = ppdb_Total_Frete_LCL
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = []
                      ParentDataPipeline = False
                      TextAlignment = taCentered
                      Transparent = True
                      DataPipelineName = 'ppdb_Total_Frete_LCL'
                      mmHeight = 2582
                      mmLeft = 128852
                      mmTop = 529
                      mmWidth = 10583
                      BandType = 4
                    end
                    object ppShape64: TppShape
                      UserName = 'Shape1'
                      Brush.Color = 15263976
                      Pen.Color = clGray
                      Pen.Style = psClear
                      mmHeight = 4233
                      mmLeft = 161925
                      mmTop = 0
                      mmWidth = 18256
                      BandType = 4
                    end
                    object ppDBText61: TppDBText
                      UserName = 'DBVL_TOT_LIQ1'
                      DataField = 'VL_TOT_LIQ'
                      DataPipeline = ppdb_Total_Frete_LCL
                      DisplayFormat = '#,##0.00'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = []
                      ParentDataPipeline = False
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppdb_Total_Frete_LCL'
                      mmHeight = 2582
                      mmLeft = 163248
                      mmTop = 529
                      mmWidth = 15346
                      BandType = 4
                    end
                  end
                  object ppSummaryBand6: TppSummaryBand
                    mmBottomOffset = 0
                    mmHeight = 0
                    mmPrintPosition = 0
                  end
                  object raCodeModule2: TraCodeModule
                    ProgramStream = {00}
                  end
                end
              end
            end
            object raCodeModule5: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
      object ppRegion3: TppRegion
        UserName = 'Region3'
        Caption = 'Region3'
        Pen.Style = psClear
        ShiftRelativeTo = ppRegion2
        Stretch = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 148432
        mmWidth = 179917
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport4: TppSubReport
          UserName = 'ItensDestino'
          ExpandAll = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppdb_Itens_Destino'
          mmHeight = 3969
          mmLeft = 0
          mmTop = 149490
          mmWidth = 179917
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = ppdb_Itens_Destino
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 5000
            PrinterSetup.mmMarginLeft = 15000
            PrinterSetup.mmMarginRight = 15000
            PrinterSetup.mmMarginTop = 5000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppdb_Itens_Destino'
            object ppTitleBand5: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape56: TppShape
                UserName = 'Shape56'
                Brush.Color = 16742726
                Pen.Style = psClear
                mmHeight = 4498
                mmLeft = 4763
                mmTop = 0
                mmWidth = 175419
                BandType = 1
              end
              object ppLabel33: TppLabel
                UserName = 'Label33'
                AutoSize = False
                Caption = 'CUSTO NO DESTINO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 2582
                mmLeft = 6085
                mmTop = 529
                mmWidth = 174625
                BandType = 1
              end
            end
            object ppDetailBand6: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape45: TppShape
                UserName = 'Shape402'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 161925
                mmTop = 0
                mmWidth = 18256
                BandType = 4
              end
              object ppShape50: TppShape
                UserName = 'Shape50'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 127794
                mmTop = 0
                mmWidth = 13494
                BandType = 4
              end
              object ppShape42: TppShape
                UserName = 'Shape501'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 99748
                mmTop = 0
                mmWidth = 26194
                BandType = 4
              end
              object ppShape44: TppShape
                UserName = 'Shape44'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 142875
                mmTop = 0
                mmWidth = 17463
                BandType = 4
              end
              object ppDBText28: TppDBText
                UserName = 'DBText28'
                DataField = 'VL_VENDA'
                DataPipeline = ppdb_Itens_Destino
                DisplayFormat = '#0.,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Destino'
                mmHeight = 2582
                mmLeft = 143934
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText39: TppDBText
                UserName = 'DBText39'
                DataField = 'NM_ITEM'
                DataPipeline = ppdb_Itens_Destino
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = [fsBold]
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Destino'
                mmHeight = 2582
                mmLeft = 5292
                mmTop = 265
                mmWidth = 92340
                BandType = 4
              end
              object ppDBText40: TppDBText
                UserName = 'DBText40'
                DataField = 'AP_MOEDA'
                DataPipeline = ppdb_Itens_Destino
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Destino'
                mmHeight = 2582
                mmLeft = 128852
                mmTop = 529
                mmWidth = 10583
                BandType = 4
              end
              object ppDBText38: TppDBText
                UserName = 'DBText38'
                DataField = 'NM_BASE_CALC'
                DataPipeline = ppdb_Itens_Destino
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Destino'
                mmHeight = 2582
                mmLeft = 100806
                mmTop = 529
                mmWidth = 23813
                BandType = 4
              end
              object ppDBText36: TppDBText
                UserName = 'DBText36'
                DataField = 'VL_CALCULADO'
                DataPipeline = ppdb_Itens_Destino
                DisplayFormat = '#0.,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Destino'
                mmHeight = 2582
                mmLeft = 163248
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
              object ppDBText58: TppDBText
                UserName = 'DBText58'
                DataField = 'TX_PC'
                DataPipeline = ppdb_Itens_Destino
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdb_Itens_Destino'
                mmHeight = 2582
                mmLeft = 148432
                mmTop = 794
                mmWidth = 2646
                BandType = 4
              end
            end
            object ppSummaryBand5: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 17727
              mmPrintPosition = 0
              object ppSubReport11: TppSubReport
                UserName = 'TotalDestino'
                ExpandAll = False
                NewPrintJob = False
                OutlineSettings.CreateNode = True
                TraverseAllData = False
                DataPipelineName = 'ppdb_Total_Destino'
                mmHeight = 16933
                mmLeft = 0
                mmTop = 529
                mmWidth = 180000
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppChildReport13: TppChildReport
                  AutoStop = False
                  DataPipeline = ppdb_Total_Destino
                  PrinterSetup.BinName = 'Default'
                  PrinterSetup.DocumentName = 'Report'
                  PrinterSetup.PaperName = 'A4'
                  PrinterSetup.PrinterName = 'Default'
                  PrinterSetup.mmMarginBottom = 5000
                  PrinterSetup.mmMarginLeft = 15000
                  PrinterSetup.mmMarginRight = 15000
                  PrinterSetup.mmMarginTop = 5000
                  PrinterSetup.mmPaperHeight = 297000
                  PrinterSetup.mmPaperWidth = 210000
                  PrinterSetup.PaperSize = 9
                  Units = utMillimeters
                  Version = '7.02'
                  mmColumnWidth = 0
                  DataPipelineName = 'ppdb_Total_Destino'
                  object ppTitleBand13: TppTitleBand
                    mmBottomOffset = 0
                    mmHeight = 3440
                    mmPrintPosition = 0
                    object ppLabel46: TppLabel
                      UserName = 'Label501'
                      AutoSize = False
                      Caption = 'TOTAL CUSTO NO DESTINO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = 7895160
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 2582
                      mmLeft = 128323
                      mmTop = 265
                      mmWidth = 35983
                      BandType = 1
                    end
                  end
                  object ppDetailBand1: TppDetailBand
                    mmBottomOffset = 0
                    mmHeight = 4498
                    mmPrintPosition = 0
                    object ppShape47: TppShape
                      UserName = 'Shape47'
                      Brush.Color = 15263976
                      Pen.Color = clGray
                      Pen.Style = psClear
                      mmHeight = 4233
                      mmLeft = 127794
                      mmTop = 0
                      mmWidth = 13494
                      BandType = 4
                    end
                    object ppDBText41: TppDBText
                      UserName = 'DBText41'
                      DataField = 'AP_MOEDA'
                      DataPipeline = ppdb_Total_Destino
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = []
                      ParentDataPipeline = False
                      TextAlignment = taCentered
                      Transparent = True
                      DataPipelineName = 'ppdb_Total_Destino'
                      mmHeight = 2582
                      mmLeft = 128852
                      mmTop = 265
                      mmWidth = 10583
                      BandType = 4
                    end
                    object ppShape58: TppShape
                      UserName = 'Shape58'
                      Brush.Color = 15263976
                      Pen.Color = clGray
                      Pen.Style = psClear
                      mmHeight = 4233
                      mmLeft = 161925
                      mmTop = 265
                      mmWidth = 18256
                      BandType = 4
                    end
                    object ppDBText51: TppDBText
                      UserName = 'DBText51'
                      DataField = 'TOTAL_GERAL'
                      DataPipeline = ppdb_Total_Destino
                      DisplayFormat = '#,##0.00'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Font.Size = 6
                      Font.Style = []
                      ParentDataPipeline = False
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppdb_Total_Destino'
                      mmHeight = 2646
                      mmLeft = 163248
                      mmTop = 265
                      mmWidth = 15346
                      BandType = 4
                    end
                  end
                  object ppSummaryBand13: TppSummaryBand
                    mmBottomOffset = 0
                    mmHeight = 0
                    mmPrintPosition = 0
                  end
                end
              end
            end
          end
        end
      end
      object ppRegion4: TppRegion
        UserName = 'Region4'
        Caption = 'Region4'
        Pen.Style = psClear
        ShiftRelativeTo = ppRegion3
        Stretch = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 154252
        mmWidth = 179917
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSubReport6: TppSubReport
          UserName = 'TOTAL_GERAL'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppdb_ValoresTotalPorMoeda_LCL'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 155311
          mmWidth = 179917
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport7: TppChildReport
            AutoStop = False
            DataPipeline = ppdb_ValoresTotalPorMoeda_LCL
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 5000
            PrinterSetup.mmMarginLeft = 15000
            PrinterSetup.mmMarginRight = 15000
            PrinterSetup.mmMarginTop = 5000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.02'
            mmColumnWidth = 0
            DataPipelineName = 'ppdb_ValoresTotalPorMoeda_LCL'
            object ppTitleBand7: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape51: TppShape
                UserName = 'Shape51'
                Brush.Color = 16742726
                Pen.Style = psClear
                mmHeight = 4498
                mmLeft = 127794
                mmTop = 0
                mmWidth = 52652
                BandType = 1
              end
              object ppLabel34: TppLabel
                UserName = 'Label34'
                AutoSize = False
                Caption = 'TOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2582
                mmLeft = 129382
                mmTop = 794
                mmWidth = 21431
                BandType = 1
              end
            end
            object ppDetailBand8: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppShape49: TppShape
                UserName = 'Shape49'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 127794
                mmTop = 265
                mmWidth = 13494
                BandType = 4
              end
              object ppDBText43: TppDBText
                UserName = 'DBText43'
                DataField = 'AP_MOEDA'
                DataPipeline = ppdb_ValoresTotalPorMoeda_LCL
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppdb_ValoresTotalPorMoeda_LCL'
                mmHeight = 2582
                mmLeft = 128852
                mmTop = 529
                mmWidth = 10583
                BandType = 4
              end
              object ppShape59: TppShape
                UserName = 'Shape59'
                Brush.Color = 15263976
                Pen.Color = clGray
                Pen.Style = psClear
                mmHeight = 4233
                mmLeft = 162190
                mmTop = 265
                mmWidth = 18256
                BandType = 4
              end
              object ppDBText48: TppDBText
                UserName = 'DBText48'
                DataField = 'TOTAL_GERAL'
                DataPipeline = ppdb_ValoresTotalPorMoeda_LCL
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Font.Size = 6
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdb_ValoresTotalPorMoeda_LCL'
                mmHeight = 2582
                mmLeft = 163513
                mmTop = 529
                mmWidth = 15346
                BandType = 4
              end
            end
            object ppSummaryBand7: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppLabel9: TppLabel
        UserName = 'Label401'
        AutoSize = False
        Caption = 'VALOR FOB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 95250
        mmTop = 80963
        mmWidth = 28046
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'AP_MOEDA_FOB'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2646
        mmLeft = 124354
        mmTop = 80963
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VL_FOB'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 2646
        mmLeft = 137848
        mmTop = 80963
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'INFORMA'#199#213'ES DA CARGA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 5027
        mmTop = 71702
        mmWidth = 174890
        BandType = 0
      end
      object ppRegion5: TppRegion
        UserName = 'Region5'
        Caption = 'Region5'
        Pen.Style = psClear
        ShiftRelativeTo = ppSubReport2
        Stretch = True
        mmHeight = 34660
        mmLeft = 0
        mmTop = 100806
        mmWidth = 179652
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape26: TppShape
          UserName = 'Shape19'
          Brush.Color = 16742726
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 4498
          mmTop = 102394
          mmWidth = 175419
          BandType = 0
        end
        object ppShape28: TppShape
          UserName = 'Shape28'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 123561
          mmTop = 107421
          mmWidth = 56356
          BandType = 0
        end
        object ppShape29: TppShape
          UserName = 'Shape29'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 123561
          mmTop = 111125
          mmWidth = 56356
          BandType = 0
        end
        object ppShape30: TppShape
          UserName = 'Shape30'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3440
          mmLeft = 123561
          mmTop = 115094
          mmWidth = 56356
          BandType = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBText34'
          DataField = 'Rota'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 123825
          mmTop = 115094
          mmWidth = 56092
          BandType = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          DataField = 'LOCAL_DESTINO'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 123825
          mmTop = 111125
          mmWidth = 55298
          BandType = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'LOCAL_ORIGEM'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 123825
          mmTop = 107156
          mmWidth = 56092
          BandType = 0
        end
        object ppShape27: TppShape
          UserName = 'Shape27'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3440
          mmLeft = 69321
          mmTop = 128852
          mmWidth = 14023
          BandType = 0
        end
        object ppDBText50: TppDBText
          UserName = 'DBText50'
          DataField = 'CD_INCOTERM'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 69586
          mmTop = 128852
          mmWidth = 13758
          BandType = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          AutoSize = False
          Caption = 'PESO TARIFADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2582
          mmLeft = 84931
          mmTop = 128852
          mmWidth = 20638
          BandType = 0
        end
        object ppShape43: TppShape
          UserName = 'Shape43'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 106363
          mmTop = 128323
          mmWidth = 19579
          BandType = 0
        end
        object ppDBText46: TppDBText
          UserName = 'DBText501'
          DataField = 'VL_CHARGEABLE'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#0.,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 106627
          mmTop = 128852
          mmWidth = 18785
          BandType = 0
        end
        object ppShape39: TppShape
          UserName = 'Shape39'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 162454
          mmTop = 128323
          mmWidth = 17198
          BandType = 0
        end
        object ppShape52: TppShape
          UserName = 'Shape52'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 143140
          mmTop = 128323
          mmWidth = 17463
          BandType = 0
        end
        object ppShape38: TppShape
          UserName = 'Shape38'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 128059
          mmTop = 128323
          mmWidth = 12965
          BandType = 0
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          DataField = 'AP_MOEDA'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 129117
          mmTop = 128852
          mmWidth = 10583
          BandType = 0
        end
        object ppDBText47: TppDBText
          UserName = 'DBText47'
          DataField = 'VL_VENDA'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 143934
          mmTop = 128852
          mmWidth = 15346
          BandType = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'VL_FREIGHT'
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 163248
          mmTop = 128852
          mmWidth = 15346
          BandType = 0
        end
        object ppShape60: TppShape
          UserName = 'Shape60'
          Brush.Color = 16742726
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 4763
          mmTop = 119856
          mmWidth = 175419
          BandType = 0
        end
        object ppShape32: TppShape
          UserName = 'Shape32'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3440
          mmLeft = 39688
          mmTop = 107421
          mmWidth = 54769
          BandType = 0
        end
        object ppShape31: TppShape
          UserName = 'Shape31'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 39688
          mmTop = 111125
          mmWidth = 54769
          BandType = 0
        end
        object ppShape33: TppShape
          UserName = 'Shape33'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 39688
          mmTop = 115094
          mmWidth = 54769
          BandType = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'FREQUENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2582
          mmLeft = 5027
          mmTop = 111125
          mmWidth = 34396
          BandType = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'TRANSIT TIME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2582
          mmLeft = 5027
          mmTop = 115094
          mmWidth = 34396
          BandType = 0
        end
        object pplbl_origem: TppLabel
          UserName = 'lbl_origem'
          AutoSize = False
          Caption = 'AIRPORT LOADING  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2582
          mmLeft = 94986
          mmTop = 107156
          mmWidth = 28310
          BandType = 0
        end
        object pplbl_destino: TppLabel
          UserName = 'lbl_destino'
          AutoSize = False
          Caption = 'AIRPORT DISCHARGE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2582
          mmLeft = 94986
          mmTop = 111125
          mmWidth = 28310
          BandType = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          AutoSize = False
          Caption = 'SERVI'#199'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2582
          mmLeft = 5027
          mmTop = 107421
          mmWidth = 34396
          BandType = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText26'
          DataField = 'calc_servico'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 40217
          mmTop = 107156
          mmWidth = 53181
          BandType = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'NR_FRQUENCIA'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 40217
          mmTop = 111125
          mmWidth = 16404
          BandType = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText301'
          DataField = 'NR_TRANSIT_TIME'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 2582
          mmLeft = 40217
          mmTop = 115094
          mmWidth = 53181
          BandType = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          AutoSize = False
          Caption = 'FRETE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2582
          mmLeft = 5556
          mmTop = 120650
          mmWidth = 174625
          BandType = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label43'
          AutoSize = False
          Caption = 'INCOTERMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2582
          mmLeft = 52917
          mmTop = 128852
          mmWidth = 15610
          BandType = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label302'
          AutoSize = False
          Caption = 'MOEDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2582
          mmLeft = 128059
          mmTop = 125413
          mmWidth = 12965
          BandType = 0
        end
        object ppLabel69: TppLabel
          UserName = 'Label69'
          AutoSize = False
          Caption = 'UNIT'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2582
          mmLeft = 142611
          mmTop = 125413
          mmWidth = 17463
          BandType = 0
        end
        object ppLabel70: TppLabel
          UserName = 'Label70'
          AutoSize = False
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2582
          mmLeft = 162190
          mmTop = 125413
          mmWidth = 17463
          BandType = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = 'ROUTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2582
          mmLeft = 94986
          mmTop = 115094
          mmWidth = 28310
          BandType = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'INFORMA'#199#213'ES DO EMBARQUE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Calibri'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 5292
          mmTop = 103188
          mmWidth = 174890
          BandType = 0
        end
      end
      object ppLabel24: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'PESO LIQUIDO (KG)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 95250
        mmTop = 76465
        mmWidth = 28046
        BandType = 0
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = True
        DataPipelineName = 'ppDBPipeline5'
        mmHeight = 9525
        mmLeft = 0
        mmTop = 89694
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipeline5
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5000
          PrinterSetup.mmMarginLeft = 15000
          PrinterSetup.mmMarginRight = 15000
          PrinterSetup.mmMarginTop = 5000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipeline5'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 2910
            mmPrintPosition = 0
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'DESCRI'#199#195'O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Calibri'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2582
              mmLeft = 39688
              mmTop = 265
              mmWidth = 10033
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'DIMENS'#213'ES(CxLxA)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Calibri'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2582
              mmLeft = 152929
              mmTop = 265
              mmWidth = 17230
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label66'
              Caption = 'EMBALAGEM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Calibri'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2582
              mmLeft = 126207
              mmTop = 265
              mmWidth = 11726
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppShape37: TppShape
              UserName = 'Shape22'
              Brush.Color = 16119285
              Pen.Color = 33023
              Pen.Style = psClear
              mmHeight = 3440
              mmLeft = 39158
              mmTop = 0
              mmWidth = 85461
              BandType = 4
            end
            object ppDBMerc: TppDBText
              UserName = 'DBMerc'
              DataField = 'MERC'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 2582
              mmLeft = 39688
              mmTop = 265
              mmWidth = 83873
              BandType = 4
            end
            object ppShape46: TppShape
              UserName = 'Shape37'
              Brush.Color = 16119285
              Pen.Color = 33023
              Pen.Style = psClear
              mmHeight = 3440
              mmLeft = 124884
              mmTop = 0
              mmWidth = 25665
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText201'
              DataField = 'NM_EMBALAGEM'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 2582
              mmLeft = 126207
              mmTop = 265
              mmWidth = 21960
              BandType = 4
            end
            object ppShape70: TppShape
              UserName = 'Shape69'
              Brush.Color = 16119285
              Pen.Color = 33023
              Pen.Style = psClear
              mmHeight = 3440
              mmLeft = 151607
              mmTop = 0
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText27'
              DataField = 'DIMENSOES'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 2582
              mmLeft = 152665
              mmTop = 265
              mmWidth = 26194
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule3: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'MERCADORIA (NCM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 4763
        mmTop = 90488
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppShape48: TppShape
        UserName = 'Shape64'
        Brush.Color = 16119285
        Pen.Color = 15790320
        mmHeight = 22225
        mmLeft = 0
        mmTop = 7673
        mmWidth = 180182
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label61'
        AutoSize = False
        Caption = 
          ' '#8211' Rodovia Santos Dumont Km 66-A '#8211' Centro Empresarial Viracopos,' +
          ' unidade 101 '#8211' Aeroporto Internacional de Viracopos '#8211' 13055-900 ' +
          'Fone/Fax 55-19-3725-5997'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2582
        mmLeft = 22225
        mmTop = 18521
        mmWidth = 151892
        BandType = 8
      end
      object ppLabel32: TppLabel
        UserName = 'Label11'
        Caption = 
          '"Conduzimos nossos neg'#243'cios de acordo com o modelo FIATA de Serv' +
          'i'#231'os de Agentes de Carga".'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8421440
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 48683
        mmTop = 794
        mmWidth = 82550
        BandType = 8
      end
      object ppLabel39: TppLabel
        UserName = 'Label32'
        Caption = 
          '"All business transactions are in accordance with FIATA Model Ru' +
          'les for Freight Forwarding Services"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8421440
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 47361
        mmTop = 4498
        mmWidth = 86254
        BandType = 8
      end
      object ppLabel47: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 
          ' - Rua Senador Feij'#243', 14 - 7'#186' Andar - Centro 11.015-500 Fone: 55' +
          '-13-3211-4000 Fax: 55-13-3211-4020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2582
        mmLeft = 56886
        mmTop = 8996
        mmWidth = 84667
        BandType = 8
      end
      object ppLabel71: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = 
          ' - Alameda dos Nhambiquaras 1518, 10'#186' andar Moema 04.090-003 Fon' +
          'e/Fax: 55-11-5090-4400'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2582
        mmLeft = 55298
        mmTop = 11377
        mmWidth = 89408
        BandType = 8
      end
      object ppLabel72: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = 'www.myindaia.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 77788
        mmTop = 25929
        mmWidth = 36248
        BandType = 8
      end
      object ppLabel48: TppLabel
        UserName = 'Label51'
        AutoSize = False
        Caption = 'Santos,SP '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 43656
        mmTop = 8996
        mmWidth = 12700
        BandType = 8
      end
      object ppLabel49: TppLabel
        UserName = 'Label52'
        AutoSize = False
        Caption = 'S'#227'o Paulo,SP '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 37571
        mmTop = 11377
        mmWidth = 16669
        BandType = 8
      end
      object ppLabel51: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Rio de Janeiro,RJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 40746
        mmTop = 13758
        mmWidth = 21167
        BandType = 8
      end
      object ppLabel52: TppLabel
        UserName = 'Label57'
        AutoSize = False
        Caption = 
          ' - Rua da Quitanda, 187 / 9'#186' andar Centro 20.091-005 Fone/Fax: 5' +
          '5-21-2516-3021'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2582
        mmLeft = 62706
        mmTop = 13758
        mmWidth = 77682
        BandType = 8
      end
      object ppLabel56: TppLabel
        UserName = 'Label58'
        AutoSize = False
        Caption = 'Guarulhos, SP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 12700
        mmTop = 16140
        mmWidth = 16669
        BandType = 8
      end
      object ppLabel57: TppLabel
        UserName = 'Label59'
        AutoSize = False
        Caption = 
          ' - Rodovia H'#233'lio Smidt s/n'#186' - Edif'#237'cio Teca sala 2'#186' andar, sala ' +
          '2.05 '#8211' Aeroporto Internacional de Guarulhos '#8211' 0741-970 Fone/Fax ' +
          '55-11-24455328'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2582
        mmLeft = 30163
        mmTop = 16140
        mmWidth = 136102
        BandType = 8
      end
      object ppLabel58: TppLabel
        UserName = 'Label60'
        Caption = 'Campinas, SP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 10319
        mmTop = 18521
        mmWidth = 11642
        BandType = 8
      end
      object ppLabel59: TppLabel
        UserName = 'Label62'
        AutoSize = False
        Caption = 'BUENOS AIRES (ARG) '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 38365
        mmTop = 20902
        mmWidth = 26723
        BandType = 8
      end
      object ppLabel60: TppLabel
        UserName = 'Label601'
        AutoSize = False
        Caption = 
          '  - Peru 590 - Piso 14 Of C., 1068 - Ciudad Autonoma de Buenos A' +
          'ires - Argentina '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2582
        mmLeft = 65617
        mmTop = 20902
        mmWidth = 77343
        BandType = 8
      end
      object ppLabel61: TppLabel
        UserName = 'Label64'
        AutoSize = False
        Caption = 'MIAMI,FL (USA)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 36777
        mmTop = 23283
        mmWidth = 19050
        BandType = 8
      end
      object ppLabel62: TppLabel
        UserName = 'Label65'
        AutoSize = False
        Caption = 
          ' '#8211' 8405 NW 53rd Street A100 Doral, FL - Mailbox: 33166  - (305) ' +
          '471-4870 / (305) 675-2467'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2582
        mmLeft = 56356
        mmTop = 23283
        mmWidth = 86784
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 169598
        mmTop = 26723
        mmWidth = 9610
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryTpCargo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT Upper(TP_CNTR) TP_CNTR ,'
      '       Upper((SELECT NM_TP_CNTR'
      '          FROM TTP_CNTR (NOLOCK)'
      '         WHERE TP_CNTR = ISNULL(PM.TP_CNTR, '#39'01'#39'))) NOME,'
      '       SUM(ISNULL(QTD_VOLUMES, 0)) QTDE'
      '  FROM TPROPOSTA_MERCADORIA PM (NOLOCK) '
      ' WHERE  NR_PROPOSTA = :PROPOSTA'
      'GROUP BY TP_CNTR')
    Left = 128
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end>
    object qryTpCargoTP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qryTpCargoNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
    end
    object qryTpCargoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object qryTpCargoTX_TOTAL_CARGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_TOTAL_CARGO'
      Size = 1000
      Calculated = True
    end
  end
  object dsTpCargo: TDataSource
    DataSet = qryTpCargo
    Left = 31
    Top = 62
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = dsTpCargo
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = '_BDEProposta1'
    Left = 220
    Top = 62
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'TP_CNTR'
      FieldName = 'TP_CNTR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'TX_TOTAL_CARGO'
      FieldName = 'TX_TOTAL_CARGO'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 3
    end
  end
  object qryValores_bkp: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM,'
      
        '       CASE ISNULL((SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WH' +
        'ERE CD_ITEM = PFD.CD_ITEM), '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT RTRIM(LTRIM(NM_ITEM))  FROM TITEM ' +
        '(NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      
        '         ELSE (SELECT RTRIM(LTRIM(NM_ITEM_INGLES)) FROM TITEM (N' +
        'OLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      '       END AS NM_ITEM,'
      
        '       (SELECT RTRIM(LTRIM(NM_TP_BASE_CALC_FRETE)) FROM TTP_BASE' +
        '_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE = PFD.TP_BASE_CALCULO) a' +
        's NM_BASE_CALC,'
      '       /*CASE PFD.TP_BASE_CALCULO'
      
        '         WHEN '#39'3'#39' THEN '#39#39' ELSE (SELECT RTRIM(LTRIM(NM_TP_BASE_CA' +
        'LC_FRETE)) FROM TTP_BASE_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE ' +
        '= PFD.TP_BASE_CALCULO)'
      '       END AS NM_BASE_CALC, */'
      
        '       (SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WHERE CD_ITEM ' +
        '= PFD.CD_ITEM) NM_ITEM_ING,'
      '       CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) W' +
        'HERE M.CD_MOEDA = PFD.CD_MOEDA)'
      '       END AS AP_MOEDA,'
      '       VL_VENDA,'
      '       CASE PFD.TP_BASE_CALCULO'
      '          WHEN '#39'3'#39' THEN VL_VENDA  --valor fixo'
      
        '          WHEN '#39'14'#39' THEN (select VL_CHARGEABLE from TPROPOSTA_IT' +
        'EM WHERE NR_PROPOSTA = :PROPOSTA) * VL_VENDA  --TON ou M3'
      
        '          WHEN '#39'10'#39' THEN (select ISNULL(sum(QTD_VOLUMES),0) FROM' +
        '  TPROPOSTA_MERCADORIA where NR_PROPOSTA =:PROPOSTA) * VL_VENDA ' +
        ' --por container'
      
        '          WHEN '#39'11'#39' THEN (select ISNULL(sum(QTD_VOLUMES),0) FROM' +
        '  TPROPOSTA_MERCADORIA A, TTP_CNTR B'
      
        '                          where  A.NR_PROPOSTA = :PROPOSTA and  ' +
        'B.TP_CNTR = A.TP_CNTR and B.TP_PESO = '#39'2'#39') * VL_VENDA  --cntr de' +
        ' 20'
      
        '          WHEN '#39'12'#39' THEN (select ISNULL(sum(QTD_VOLUMES),0) FROM' +
        '  TPROPOSTA_MERCADORIA A, TTP_CNTR B'
      
        '                          where A.NR_PROPOSTA = :PROPOSTA and  B' +
        '.TP_CNTR = A.TP_CNTR and B.TP_PESO = '#39'4'#39')  * VL_VENDA  --cntr de' +
        ' 40'
      
        '          WHEN '#39'18'#39' THEN (select sum(cast(isnull(TP_PESO,0) as i' +
        'nt))/2 FROM  TPROPOSTA_MERCADORIA A, TTP_CNTR B'
      
        '                          where A.NR_PROPOSTA = :proposta  and  ' +
        'B.TP_CNTR = A.TP_CNTR )  * VL_VENDA  --por TEU'
      ''
      ''
      '       end as VL_CALCULADO'
      '  FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE NR_PROPOSTA = :PROPOSTA'
      '   AND TP_ESTUFAGEM = :ESTUFAGEM'
      '   and TP_ORIGEM_DESPESA = 7')
    Left = 128
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ESTUFAGEM'
        ParamType = ptInput
      end>
    object qryValores_bkpCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryValores_bkpCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryValores_bkpVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qryValores_bkpNM_ITEM_ING: TStringField
      FieldName = 'NM_ITEM_ING'
      FixedChar = True
      Size = 30
    end
    object qryValores_bkpAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryValores_bkpNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 133
    end
    object qryValores_bkpNM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qryValores_bkpVL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
    end
    object qryValores_bkpcalcVL_TOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_TOTAL'
      Calculated = True
    end
  end
  object dsValores: TDataSource
    DataSet = qryValores_bkp
    Left = 31
    Top = 116
  end
  object ppDBPipeline3: TppDBPipeline
    DataSource = ds_Itens_Origem
    RangeEnd = reCount
    RangeEndCount = 14
    UserName = '_BDEProposta2'
    Left = 220
    Top = 116
  end
  object qryCommodity: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT Upper(rtrim(ISNULL(PM.TX_MERCADORIA, '#39#39')))+case when isnu' +
        'll(PM.CD_NCM,'#39#39')<>'#39#39' then'
      
        '   '#39' ('#39'+substring(isnull(PM.CD_NCM,'#39#39'),1,4)+'#39'.'#39'+substring(isnull' +
        '(PM.CD_NCM,'#39#39'),5,2)+'#39'.'#39'+substring(isnull(PM.CD_NCM,'#39#39'),7,2)+'#39' )'#39
      'else'
      '   '#39#39
      'end MERC'
      
        ', Upper(IsNull(convert(varchar,PM.QTD_EMBALAGEM),'#39#39')+'#39' '#39'+ isnull' +
        '(E.NM_EMBALAGEM,'#39#39')) NM_EMBALAGEM, convert(varchar,isnull(pm.VL_' +
        'COMPR,0))+'#39' x '#39'+convert(varchar,isnull(pm.VL_LARGURA,0))+'#39' x '#39'+c' +
        'onvert(varchar,isnull(pm.VL_ALTURA,0))+'#39' m'#39' DIMENSOES'
      '  FROM TPROPOSTA_MERCADORIA PM (NOLOCK)       '
      
        '  LEFT JOIN TTP_EMBALAGEM_INTTRA E (NOLOCK) ON PM.CD_EMBALAGEM=E' +
        '.CD_EMBALAGEM'
      ' WHERE  PM.NR_PROPOSTA = :PROPOSTA '
      ' AND  ISNULL(PM.TX_MERCADORIA, '#39#39') <> '#39#39
      '')
    Left = 128
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end>
    object qryCommodityMERC: TStringField
      FieldName = 'MERC'
      FixedChar = True
      Size = 255
    end
    object qryCommodityNM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      FixedChar = True
      Size = 100
    end
    object qryCommodityDIMENSOES: TStringField
      FieldName = 'DIMENSOES'
      FixedChar = True
      Size = 100
    end
  end
  object dsCommodity: TDataSource
    DataSet = qryCommodity
    Left = 31
    Top = 176
  end
  object ppDBPipeline5: TppBDEPipeline
    DataSource = dsCommodity
    RangeEnd = reCount
    RangeEndCount = 7
    UserName = 'DBPipeline5'
    Left = 220
    Top = 176
    object ppDBPipeline5ppField1: TppField
      FieldAlias = 'MERC'
      FieldName = 'MERC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField2: TppField
      FieldAlias = 'NM_EMBALAGEM'
      FieldName = 'NM_EMBALAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField3: TppField
      FieldAlias = 'DIMENSOES'
      FieldName = 'DIMENSOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object qryValorTpCntr: TQuery
    OnCalcFields = qryValorTpCntrCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT (SELECT TC.NM_TP_CNTR FROM TTP_CNTR TC (NOLOCK) WHERE TC.' +
        'TP_CNTR = PM.TP_CNTR) AS NM_ITEM,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) W' +
        'HERE M.CD_MOEDA = PF.CD_MOEDA)'
      '       END AS AP_MOEDA,'
      
        '       PM.VL_VENDA          , PM.QTD_VOLUMES, (PM.VL_VENDA * PM.' +
        'QTD_VOLUMES) VL_TOTAL ,'
      
        '       PM.VL_CUSTO VL_COMPRA,  (PM.VL_CUSTO * PM.QTD_VOLUMES) VL' +
        '_TOTAL_COMPRA'
      '  FROM TPROPOSTA_MERCADORIA PM (NOLOCK)'
      
        ' INNER JOIN TPROPOSTA_FRETE PF (NOLOCK) ON PF.NR_PROPOSTA = PM.N' +
        'R_PROPOSTA'
      ' WHERE PM.NR_PROPOSTA = :proposta'
      '   ')
    Left = 176
    Top = 398
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end>
    object qryValorTpCntrNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
    end
    object qryValorTpCntrAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryValorTpCntrVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qryValorTpCntrQTD_VOLUMES: TIntegerField
      FieldName = 'QTD_VOLUMES'
    end
    object qryValorTpCntrVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryValorTpCntrVL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
    end
    object qryValorTpCntrVL_TOTAL_COMPRA: TFloatField
      FieldName = 'VL_TOTAL_COMPRA'
    end
    object qryValorTpCntrVL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
  end
  object dsValorTpCntr: TDataSource
    DataSet = qryValorTpCntr
    Left = 39
    Top = 398
  end
  object ppDBPipeline4: TppDBPipeline
    DataSource = dsValorTpCntr
    UserName = '_BDEValotCntr'
    Left = 324
    Top = 398
    object ppDBPipeline4ppField1: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField3: TppField
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField4: TppField
      FieldAlias = 'QTD_VOLUMES'
      FieldName = 'QTD_VOLUMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField5: TppField
      FieldAlias = 'VL_TOTAL'
      FieldName = 'VL_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField6: TppField
      FieldAlias = 'VL_COMPRA'
      FieldName = 'VL_COMPRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField7: TppField
      FieldAlias = 'VL_TOTAL_COMPRA'
      FieldName = 'VL_TOTAL_COMPRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField8: TppField
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object dtsValoresTotalPorMoeda_FCL: TDataSource
    DataSet = qryValoresTotalPorMoeda_FCL
    Left = 493
    Top = 734
  end
  object qryValoresTotalPorMoeda_FCL: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select CD_MOEDA,Upper(AP_MOEDA) AP_MOEDA ,SUM(TOTAL) TOTAL,SUM(V' +
        'L_VENDA_TOTAL) TOTAL_GERAL from'
      '('
      'SELECT'
      '       PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,  PFD.VL_VENDA TOTAL, PFD.VL_VENDA_TOTAL'
      ''
      ' FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA =:proposta  and PFD.CD_PRODUTO = :produto'
      ''
      'union all'
      ''
      'SELECT'
      '       PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      
        '       END AS AP_MOEDA, PM.VL_VENDA , (PM.VL_VENDA * PM.QTD_VOLU' +
        'MES) TOTAL_CALCULADO'
      ''
      ' FROM TPROPOSTA_MERCADORIA PM (NOLOCK)'
      
        ' JOIN TPROPOSTA_FRETE PF (NOLOCK) ON PF.NR_PROPOSTA = PM.NR_PROP' +
        'OSTA'
      ' WHERE PF.NR_PROPOSTA =  :proposta  and PF.CD_PRODUTO = :produto'
      ') view_geral'
      ''
      'GROUP BY CD_MOEDA,AP_MOEDA')
    Left = 590
    Top = 734
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryValoresTotalPorMoeda_FCLCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryValoresTotalPorMoeda_FCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryValoresTotalPorMoeda_FCLTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryValoresTotalPorMoeda_FCLTOTAL_GERAL: TFloatField
      FieldName = 'TOTAL_GERAL'
    end
  end
  object ppdb_ValoresTotalPorMoeda_FCL: TppDBPipeline
    DataSource = dtsValoresTotalPorMoeda_FCL
    UserName = 'db_ValoresTotalPorMoeda_FCL'
    Left = 709
    Top = 734
    object ppdb_ValoresTotalPorMoeda_FCLppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_ValoresTotalPorMoeda_FCLppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppdb_ValoresTotalPorMoeda_FCLppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppdb_ValoresTotalPorMoeda_FCLppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_GERAL'
      FieldName = 'TOTAL_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object qry_Total_frete_FCL: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select CD_MOEDA,Upper(AP_MOEDA) AP_MOEDA ,sum(VL_VENDA) vl_total' +
        ' ,sum(VL_VENDA_TOTAL) vl_tot_liq from'
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) W' +
        'HERE M.CD_MOEDA = PFD.CD_MOEDA)'
      '       END AS AP_MOEDA, PFD.VL_VENDA, PFD.VL_VENDA_TOTAL'
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :proposta'
      '   and PFD.CD_PRODUTO        = :produto'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'A'#39
      ''
      ''
      'union all'
      ''
      'select  PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      
        '       END AS AP_MOEDA,PM.VL_VENDA VL_CALCULADO,(PM.QTD_VOLUMES ' +
        '* PM.VL_VENDA)'
      'FROM  TPROPOSTA_FRETE PF '
      'JOIN TPROPOSTA_MERCADORIA PM ON PF.NR_PROPOSTA=PM.NR_PROPOSTA'
      'WHERE PF.NR_PROPOSTA = :proposta and PF.CD_PRODUTO = :produto'
      ' '
      ''
      ''
      ''
      ') view_geral'
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda'
      ''
      ''
      ''
      '')
    Left = 590
    Top = 624
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Total_frete_FCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Total_frete_FCLVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qry_Total_frete_FCLVL_TOT_LIQ: TFloatField
      FieldName = 'VL_TOT_LIQ'
    end
  end
  object ds_Total_frete_FCL: TDataSource
    DataSet = qry_Total_frete_FCL
    Left = 493
    Top = 624
  end
  object SqlAux: TQuery
    DatabaseName = 'DBBROKER'
    Left = 181
    Top = 249
  end
  object qry_acompanha_frete: TQuery
    OnCalcFields = qry_acompanha_freteCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'SELECT CD_ITEM, Upper('
      '       (select NM_ITEM+case when isnull(vl_minimo,0)<>0 then'
      
        '       '#39' ( Vr.Min. '#39'+ REPLACE(CONVERT( DECIMAL(15, 2), VL_MINIMO' +
        ' ),'#39'.'#39','#39','#39')+'#39' )'#39
      '       else '#39#39' end'
      ''
      
        '  from ( select  CASE ISNULL((SELECT NM_ITEM_INGLES FROM TITEM (' +
        'NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM), '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT RTRIM(LTRIM(NM_ITEM))  FROM TITEM ' +
        '(NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      
        '         ELSE (SELECT RTRIM(LTRIM(NM_ITEM_INGLES)) FROM TITEM (N' +
        'OLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      '       END AS NM_ITEM) view_minimo )) NM_ITEM'
      ','
      
        '       Upper((SELECT RTRIM(LTRIM(NM_TP_BASE_CALC_FRETE)) FROM TT' +
        'P_BASE_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE = PFD.TP_BASE_CALC' +
        'ULO)) as NM_BASE_CALC,'
      
        '       Upper((SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WHERE CD' +
        '_ITEM = PFD.CD_ITEM)) NM_ITEM_ING,'
      '       CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      '       VL_VENDA,VL_VENDA_TOTAL VL_CALCULADO'
      '     /* (1) fim da verifica'#231#227'o */'
      ''
      '  FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE NR_PROPOSTA = :PROPOSTA'
      '   and CD_PRODUTO = :produto'
      '   and TP_ORIGEM_DESPESA = '#39'A'#39)
    Left = 590
    Top = 349
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_acompanha_freteCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_acompanha_freteNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_acompanha_freteNM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_acompanha_freteNM_ITEM_ING: TStringField
      FieldName = 'NM_ITEM_ING'
      FixedChar = True
      Size = 30
    end
    object qry_acompanha_freteCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_acompanha_freteAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_acompanha_freteVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_acompanha_freteVL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
    end
    object qry_acompanha_fretecalc_NM_BASE_CALC: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_NM_BASE_CALC'
      Size = 100
      Calculated = True
    end
    object qry_acompanha_freteTX_PC: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_PC'
      Size = 1
      Calculated = True
    end
  end
  object ppdb_acompanha_frete: TppDBPipeline
    DataSource = ds_acompanha_frete
    UserName = 'db_acompanha_frete'
    Left = 705
    Top = 349
    object ppdb_acompanha_freteppField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_acompanha_freteppField2: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppdb_acompanha_freteppField3: TppField
      FieldAlias = 'NM_BASE_CALC'
      FieldName = 'NM_BASE_CALC'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppdb_acompanha_freteppField4: TppField
      FieldAlias = 'NM_ITEM_ING'
      FieldName = 'NM_ITEM_ING'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppdb_acompanha_freteppField5: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppdb_acompanha_freteppField6: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppdb_acompanha_freteppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppdb_acompanha_freteppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CALCULADO'
      FieldName = 'VL_CALCULADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppdb_acompanha_freteppField9: TppField
      FieldAlias = 'calc_NM_BASE_CALC'
      FieldName = 'calc_NM_BASE_CALC'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object ppdb_acompanha_freteppField10: TppField
      FieldAlias = 'TX_PC'
      FieldName = 'TX_PC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
  end
  object ds_acompanha_frete: TDataSource
    DataSet = qry_acompanha_frete
    Left = 493
    Top = 349
  end
  object ppdb_Total_frete_FCL: TppDBPipeline
    DataSource = ds_Total_frete_FCL
    SkipWhenNoRecords = False
    UserName = 'db_Total_frete_FCL'
    Left = 705
    Top = 624
  end
  object ds_tp_frequencia_: TDataSource
    DataSet = qry_tp_frequencia_
    Left = 429
    Top = 94
  end
  object qry_Total_Frete_LCL: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select CD_MOEDA,Upper(AP_MOEDA) AP_MOEDA, sum(VL_VENDA) vl_total' +
        ' ,sum(VL_VENDA_TOTAL) vl_tot_liq from'
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA, PFD.VL_VENDA, PFD.VL_VENDA_TOTAL'
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :proposta'
      '   and PFD.CD_PRODUTO        = :produto'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'A'#39
      ''
      'union all'
      ''
      'select  PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      
        '       END AS AP_MOEDA, PR.VL_VENDA_UNIT_LCL TOTAL, (PR.VL_VENDA' +
        '_UNIT_LCL * ( case pr.in_fixo when '#39'1'#39' then 1 else pr.VL_CHARGEA' +
        'BLE end )  ) VL_CALCULADO'
      'FROM  TPROPOSTA_FRETE PF'
      
        'JOIN TPROPOSTA_ITEM PR ON PF.NR_PROPOSTA=PR.NR_PROPOSTA and PF.C' +
        'D_PRODUTO=PR.CD_PRODUTO'
      'WHERE PF.NR_PROPOSTA = :proposta and PF.CD_PRODUTO = :produto'
      ''
      ') view_geral'
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda')
    Left = 590
    Top = 674
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Total_Frete_LCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Total_Frete_LCLVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qry_Total_Frete_LCLVL_TOT_LIQ: TFloatField
      FieldName = 'VL_TOT_LIQ'
    end
  end
  object ds_Total_Frete_LCL: TDataSource
    DataSet = qry_Total_Frete_LCL
    Left = 493
    Top = 674
  end
  object ppdb_Total_Frete_LCL: TppDBPipeline
    DataSource = ds_Total_Frete_LCL
    UserName = 'db_Total_Frete_LCL'
    Left = 708
    Top = 674
    object ppdb_Total_Frete_LCLppField1: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_Total_Frete_LCLppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOTAL'
      FieldName = 'VL_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppdb_Total_Frete_LCLppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_LIQ'
      FieldName = 'VL_TOT_LIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object qryValoresTotalPorMoeda_LCL: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select CD_MOEDA,Upper(AP_MOEDA) AP_MOEDA, SUM(TOTAL) TOTAL,SUM(V' +
        'L_VENDA_TOTAL) TOTAL_GERAL from'
      '('
      'SELECT'
      '       PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      '       PFD.VL_VENDA TOTAL, PFD.VL_VENDA_TOTAL'
      ''
      ' FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA =:proposta  and PFD.CD_PRODUTO = :produto'
      ''
      'union all'
      ''
      'SELECT'
      '       PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      
        '       END AS AP_MOEDA, PM.VL_VENDA_UNIT_LCL VL_VENDA , (PM.VL_V' +
        'ENDA_UNIT_LCL * ( case PM.IN_FIXO when '#39'1'#39' then 1 else PM.VL_CHA' +
        'RGEABLE end ) ) TOTAL_CALCULADO'
      ''
      ' FROM TPROPOSTA_ITEM PM (NOLOCK)'
      
        ' JOIN TPROPOSTA_FRETE PF (NOLOCK) ON PF.NR_PROPOSTA = PM.NR_PROP' +
        'OSTA  AND PF.CD_PRODUTO = PM.CD_PRODUTO'
      ' WHERE PM.NR_PROPOSTA =  :proposta  and PM.CD_PRODUTO = :produto'
      ') view_geral'
      ''
      'GROUP BY CD_MOEDA,AP_MOEDA')
    Left = 591
    Top = 794
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qryValoresTotalPorMoeda_LCLCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryValoresTotalPorMoeda_LCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryValoresTotalPorMoeda_LCLTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryValoresTotalPorMoeda_LCLTOTAL_GERAL: TFloatField
      FieldName = 'TOTAL_GERAL'
    end
  end
  object ds_ValoresTotalPorMoeda_LCL: TDataSource
    DataSet = qryValoresTotalPorMoeda_LCL
    Left = 495
    Top = 794
  end
  object ppdb_ValoresTotalPorMoeda_LCL: TppDBPipeline
    DataSource = ds_ValoresTotalPorMoeda_LCL
    UserName = 'db_ValoresTotalPorMoeda_LCL'
    Left = 710
    Top = 794
    object ppdb_ValoresTotalPorMoeda_LCLppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_ValoresTotalPorMoeda_LCLppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppdb_ValoresTotalPorMoeda_LCLppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppdb_ValoresTotalPorMoeda_LCLppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_GERAL'
      FieldName = 'TOTAL_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object ds_Itens_Origem: TDataSource
    DataSet = qry_Itens_Origem
    Left = 493
    Top = 405
  end
  object ppdb_Itens_Origem: TppDBPipeline
    DataSource = ds_Itens_Origem
    UserName = 'db_Itens_Origem'
    Left = 705
    Top = 405
    object ppdb_Itens_OrigemppField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_Itens_OrigemppField2: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppdb_Itens_OrigemppField3: TppField
      FieldAlias = 'NM_BASE_CALC'
      FieldName = 'NM_BASE_CALC'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppdb_Itens_OrigemppField4: TppField
      FieldAlias = 'NM_ITEM_ING'
      FieldName = 'NM_ITEM_ING'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppdb_Itens_OrigemppField5: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppdb_Itens_OrigemppField6: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppdb_Itens_OrigemppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppdb_Itens_OrigemppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CALCULADO'
      FieldName = 'VL_CALCULADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppdb_Itens_OrigemppField9: TppField
      FieldAlias = 'TX_PC'
      FieldName = 'TX_PC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
  end
  object ppdb_Total_Origem: TppDBPipeline
    DataSource = ds_Total_Origem
    UserName = 'db_Total_Origem'
    Left = 705
    Top = 461
    object ppdb_Total_OrigemppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_Total_OrigemppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppdb_Total_OrigemppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppdb_Total_OrigemppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_GERAL'
      FieldName = 'TOTAL_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object qry_Total_Origem: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      
        '       END AS AP_MOEDA, sum(PFD.VL_VENDA) total, sum(PFD.VL_VEND' +
        'A_TOTAL) total_geral'
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :proposta'
      '   and PFD.CD_PRODUTO        = :produto'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'7'#39
      'GROUP BY cd_moeda')
    Left = 590
    Top = 461
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Total_OrigemCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_Total_OrigemAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Total_OrigemTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qry_Total_OrigemTOTAL_GERAL: TFloatField
      FieldName = 'TOTAL_GERAL'
    end
  end
  object ds_Total_Origem: TDataSource
    DataSet = qry_Total_Origem
    Left = 493
    Top = 461
  end
  object qry_Itens_Destino: TQuery
    OnCalcFields = qry_Itens_DestinoCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, Upper('
      '       (select NM_ITEM+case when isnull(vl_minimo,0)<>0 then'
      
        '       '#39' ( Vr.Min. '#39'+ REPLACE(CONVERT( DECIMAL(15, 2), VL_MINIMO' +
        ' ),'#39'.'#39','#39','#39')+'#39' )'#39
      '       else '#39#39' end'
      ''
      
        '  from ( select  CASE ISNULL((SELECT NM_ITEM_INGLES FROM TITEM (' +
        'NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM), '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT RTRIM(LTRIM(NM_ITEM))  FROM TITEM ' +
        '(NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      
        '         ELSE (SELECT RTRIM(LTRIM(NM_ITEM_INGLES)) FROM TITEM (N' +
        'OLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      '       END AS NM_ITEM) view_minimo )) NM_ITEM'
      ''
      
        '       , Upper((SELECT RTRIM(LTRIM(NM_TP_BASE_CALC_FRETE)) FROM ' +
        'TTP_BASE_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE = PFD.TP_BASE_CA' +
        'LCULO)) as NM_BASE_CALC,'
      
        '       Upper((SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WHERE CD' +
        '_ITEM = PFD.CD_ITEM)) NM_ITEM_ING,'
      '       CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      '       VL_VENDA, VL_VENDA_TOTAL VL_CALCULADO'
      ''
      '  FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE NR_PROPOSTA = :proposta'
      '   and CD_PRODUTO = :produto'
      '   and TP_ORIGEM_DESPESA = '#39'8'#39)
    Left = 590
    Top = 509
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Itens_DestinoCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_DestinoNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_DestinoNM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_Itens_DestinoNM_ITEM_ING: TStringField
      FieldName = 'NM_ITEM_ING'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_DestinoCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_DestinoAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Itens_DestinoVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_Itens_DestinoVL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
    end
    object qry_Itens_DestinoTX_PC: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_PC'
      Size = 1
      Calculated = True
    end
  end
  object qry_Total_Destino: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      
        '       END AS AP_MOEDA, sum(PFD.VL_VENDA) total , sum(PFD.VL_VEN' +
        'DA_TOTAL) total_geral'
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :proposta'
      '   and PFD.CD_PRODUTO        = :produto'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'8'#39
      'GROUP BY cd_moeda')
    Left = 590
    Top = 565
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Total_DestinoCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_Total_DestinoAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Total_DestinoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qry_Total_DestinoTOTAL_GERAL: TFloatField
      FieldName = 'TOTAL_GERAL'
    end
  end
  object ds_Itens_Destino: TDataSource
    DataSet = qry_Itens_Destino
    Left = 493
    Top = 509
  end
  object ds_Total_Destino: TDataSource
    DataSet = qry_Total_Destino
    Left = 493
    Top = 565
  end
  object ppdb_Itens_Destino: TppDBPipeline
    DataSource = ds_Itens_Destino
    UserName = 'db_Itens_Destino'
    Left = 705
    Top = 509
    object ppdb_Itens_DestinoppField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_Itens_DestinoppField2: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppdb_Itens_DestinoppField3: TppField
      FieldAlias = 'NM_BASE_CALC'
      FieldName = 'NM_BASE_CALC'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppdb_Itens_DestinoppField4: TppField
      FieldAlias = 'NM_ITEM_ING'
      FieldName = 'NM_ITEM_ING'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppdb_Itens_DestinoppField5: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppdb_Itens_DestinoppField6: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppdb_Itens_DestinoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppdb_Itens_DestinoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CALCULADO'
      FieldName = 'VL_CALCULADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppdb_Itens_DestinoppField9: TppField
      FieldAlias = 'TX_PC'
      FieldName = 'TX_PC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
  end
  object ppdb_Total_Destino: TppDBPipeline
    DataSource = ds_Total_Destino
    UserName = 'db_Total_Destino'
    Left = 705
    Top = 565
    object ppdb_Total_DestinoppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppdb_Total_DestinoppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppdb_Total_DestinoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppdb_Total_DestinoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_GERAL'
      FieldName = 'TOTAL_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
  end
  object qry_Itens_Origem: TQuery
    OnCalcFields = qry_Itens_OrigemCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, Upper('
      '       (select NM_ITEM+case when isnull(vl_minimo,0)<>0 then'
      
        '       '#39' ( Vr.Min. '#39'+ REPLACE(CONVERT( DECIMAL(15, 2), VL_MINIMO' +
        ' ),'#39'.'#39','#39','#39')+'#39' )'#39
      '       else '#39#39' end'
      ''
      
        '  from ( select  CASE ISNULL((SELECT NM_ITEM_INGLES FROM TITEM (' +
        'NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM), '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT RTRIM(LTRIM(NM_ITEM))  FROM TITEM ' +
        '(NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      
        '         ELSE (SELECT RTRIM(LTRIM(NM_ITEM_INGLES)) FROM TITEM (N' +
        'OLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      '       END AS NM_ITEM) view_minimo )) NM_ITEM'
      ''
      
        '       , Upper((SELECT RTRIM(LTRIM(NM_TP_BASE_CALC_FRETE)) FROM ' +
        'TTP_BASE_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE = PFD.TP_BASE_CA' +
        'LCULO)) as NM_BASE_CALC,'
      
        '       Upper((SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WHERE CD' +
        '_ITEM = PFD.CD_ITEM)) NM_ITEM_ING,'
      '       CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      '       VL_VENDA, VL_VENDA_TOTAL VL_CALCULADO'
      ''
      '  FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE NR_PROPOSTA = :proposta'
      '   and CD_PRODUTO = :produto'
      '   and TP_ORIGEM_DESPESA = '#39'7'#39)
    Left = 590
    Top = 405
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Itens_OrigemCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_OrigemNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_OrigemNM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_Itens_OrigemNM_ITEM_ING: TStringField
      FieldName = 'NM_ITEM_ING'
      FixedChar = True
      Size = 30
    end
    object qry_Itens_OrigemCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_Itens_OrigemAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Itens_OrigemVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_Itens_OrigemVL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
    end
    object qry_Itens_OrigemTX_PC: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_PC'
      Size = 1
      Calculated = True
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsRelProposta
    UserName = 'DBPipeline1'
    Left = 220
    Top = 8
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'END_EMPRESA'
      FieldName = 'END_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'END_EMPRESA2'
      FieldName = 'END_EMPRESA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'EMAIL_CLIENTE'
      FieldName = 'EMAIL_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'FONE_EMPRESA'
      FieldName = 'FONE_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'FAX_EMPRESA'
      FieldName = 'FAX_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'NR_PROPOSTA'
      FieldName = 'NR_PROPOSTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'NM_UNID_NEG'
      FieldName = 'NM_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'NM_USUARIO'
      FieldName = 'NM_USUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'END_UNID_NEG'
      FieldName = 'END_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'END_UNID_NEG2'
      FieldName = 'END_UNID_NEG2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'FONE_UNID'
      FieldName = 'FONE_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'FAX_UNID'
      FieldName = 'FAX_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'EMAIL_UNID'
      FieldName = 'EMAIL_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'TP_ESTUFAGEM'
      FieldName = 'TP_ESTUFAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'LOCAL_ORIGEM'
      FieldName = 'LOCAL_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'LOCAL_DESTINO'
      FieldName = 'LOCAL_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'VIA_TRANSP'
      FieldName = 'VIA_TRANSP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField21: TppField
      FieldAlias = 'REMARKS'
      FieldName = 'REMARKS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField22: TppField
      FieldAlias = 'REMARKS_INDAIA'
      FieldName = 'REMARKS_INDAIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField23: TppField
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField24: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField25: TppField
      FieldAlias = 'NR_FRQUENCIA'
      FieldName = 'NR_FRQUENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = 'NR_TRANSIT_TIME'
      FieldName = 'NR_TRANSIT_TIME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField27: TppField
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField28: TppField
      FieldAlias = 'LOCAL_TRANSB'
      FieldName = 'LOCAL_TRANSB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField29: TppField
      FieldAlias = 'DT_VALID'
      FieldName = 'DT_VALID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField30: TppField
      FieldAlias = 'calcCargoType'
      FieldName = 'calcCargoType'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField31: TppField
      FieldAlias = 'VL_FREIGHT'
      FieldName = 'VL_FREIGHT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField32: TppField
      FieldAlias = 'VL_PESO_KG'
      FieldName = 'VL_PESO_KG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField33: TppField
      FieldAlias = 'VL_PESO_KG_LIQ'
      FieldName = 'VL_PESO_KG_LIQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField34: TppField
      FieldAlias = 'VL_CUBAGEM_M3'
      FieldName = 'VL_CUBAGEM_M3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField35: TppField
      FieldAlias = 'QTD_VOLUMES'
      FieldName = 'QTD_VOLUMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField36: TppField
      FieldAlias = 'NM_ARMADOR'
      FieldName = 'NM_ARMADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField37: TppField
      FieldAlias = 'NM_CARGA'
      FieldName = 'NM_CARGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField38: TppField
      FieldAlias = 'VL_CHARGEABLE'
      FieldName = 'VL_CHARGEABLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField39: TppField
      FieldAlias = 'calc_servico'
      FieldName = 'calc_servico'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField40: TppField
      FieldAlias = 'LOCAL_TRANSB_2'
      FieldName = 'LOCAL_TRANSB_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField41: TppField
      FieldAlias = 'FREE_TIME'
      FieldName = 'FREE_TIME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField42: TppField
      FieldAlias = 'Rota'
      FieldName = 'Rota'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField43: TppField
      FieldAlias = 'VL_FOB'
      FieldName = 'VL_FOB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField44: TppField
      FieldAlias = 'AP_MOEDA_FOB'
      FieldName = 'AP_MOEDA_FOB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField45: TppField
      FieldAlias = 'VL_COMPRA'
      FieldName = 'VL_COMPRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField46: TppField
      FieldAlias = 'VL_COMPRA_TOTAL'
      FieldName = 'VL_COMPRA_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField47: TppField
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField48: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField49: TppField
      FieldAlias = 'NM_EMPRESA_DB'
      FieldName = 'NM_EMPRESA_DB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
  end
  object ds_PROFIT_A: TDataSource
    DataSet = qry_PROFIT_A
    Left = 874
    Top = 349
  end
  object ds_Total_PROFIT_7: TDataSource
    DataSet = qry_Total_PROFIT_7
    Left = 874
    Top = 461
  end
  object ds_PROFIT_7: TDataSource
    DataSet = qry_PROFIT_7
    Left = 874
    Top = 405
  end
  object ds_PROFIT_8: TDataSource
    DataSet = qry_PROFIT_8
    Left = 874
    Top = 509
  end
  object ds_Total_PROFIT_8: TDataSource
    DataSet = qry_Total_PROFIT_8
    Left = 874
    Top = 565
  end
  object qry_PROFIT_A: TQuery
    OnCalcFields = qry_PROFIT_ACalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, Upper('
      '       (select NM_ITEM+case when isnull(vl_minimo,0)<>0 then'
      
        '       '#39' ( Vr.Min. '#39'+ REPLACE(CONVERT( DECIMAL(15, 2), VL_MINIMO' +
        ' ),'#39'.'#39','#39','#39')+'#39' )'#39
      '       else '#39#39' end'
      ''
      
        '  from ( select  CASE ISNULL((SELECT NM_ITEM_INGLES FROM TITEM (' +
        'NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM), '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT RTRIM(LTRIM(NM_ITEM))  FROM TITEM ' +
        '(NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      
        '         ELSE (SELECT RTRIM(LTRIM(NM_ITEM_INGLES)) FROM TITEM (N' +
        'OLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      '       END AS NM_ITEM) view_minimo )) NM_ITEM'
      ','
      
        '       Upper((SELECT RTRIM(LTRIM(NM_TP_BASE_CALC_FRETE)) FROM TT' +
        'P_BASE_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE = PFD.TP_BASE_CALC' +
        'ULO)) as NM_BASE_CALC,'
      
        '       Upper((SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WHERE CD' +
        '_ITEM = PFD.CD_ITEM)) NM_ITEM_ING,'
      '       CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      '       VL_VENDA, VL_VENDA_TOTAL,'
      '       VL_BASE_AG VL_COMPRA,VL_COMPRA_TOTAL'
      
        '       ,case when isnull(IN_PROFIT,'#39'0'#39')='#39'0'#39' then '#39'   '#39' else '#39'50%' +
        #39' end Profit'
      ''
      '  FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE NR_PROPOSTA = :PROPOSTA'
      '   and CD_PRODUTO = :PRODUTO'
      '   and TP_ORIGEM_DESPESA = '#39'A'#39
      '')
    Left = 978
    Top = 349
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_PROFIT_ACD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_ANM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 255
    end
    object qry_PROFIT_ANM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_PROFIT_ANM_ITEM_ING: TStringField
      FieldName = 'NM_ITEM_ING'
      FixedChar = True
      Size = 30
    end
    object qry_PROFIT_ACD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_AAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_PROFIT_AVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_PROFIT_AVL_VENDA_TOTAL: TFloatField
      FieldName = 'VL_VENDA_TOTAL'
    end
    object qry_PROFIT_AVL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
    end
    object qry_PROFIT_AVL_COMPRA_TOTAL: TFloatField
      FieldName = 'VL_COMPRA_TOTAL'
    end
    object qry_PROFIT_AProfit: TStringField
      FieldName = 'Profit'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_AVL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
    object qry_PROFIT_ATX_PC: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_PC'
      Size = 1
      Calculated = True
    end
  end
  object qry_Total_PROFIT_7: TQuery
    OnCalcFields = qry_Total_PROFIT_7CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      
        'select CD_MOEDA,Upper(AP_MOEDA) AP_MOEDA, sum(VL_VENDA) total_VE' +
        'NDA ,sum(VL_VENDA_TOTAL) total_VENDA_GERAL, sum(VL_COMPRA) total' +
        '_COMPRA, sum(VL_COMPRA_TOTAL) total_COMPRA_GERAL  from'
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA, PFD.VL_VENDA,PFD.VL_VENDA_TOTAL,'
      ''
      '  VL_BASE_AG VL_COMPRA, PFD.VL_COMPRA_TOTAL'
      ''
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :PROPOSTA'
      '   and PFD.CD_PRODUTO        = :PRODUTO'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'7'#39
      ') view_geral'
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda'
      ''
      ''
      ''
      ''
      '')
    Left = 978
    Top = 461
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Total_PROFIT_7CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_Total_PROFIT_7AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Total_PROFIT_7total_VENDA: TFloatField
      FieldName = 'total_VENDA'
    end
    object qry_Total_PROFIT_7total_VENDA_GERAL: TFloatField
      FieldName = 'total_VENDA_GERAL'
    end
    object qry_Total_PROFIT_7total_COMPRA: TFloatField
      FieldName = 'total_COMPRA'
    end
    object qry_Total_PROFIT_7total_COMPRA_GERAL: TFloatField
      FieldName = 'total_COMPRA_GERAL'
    end
    object qry_Total_PROFIT_7VL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
  end
  object qry_PROFIT_7: TQuery
    OnCalcFields = qry_PROFIT_7CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, Upper('
      '       (select NM_ITEM+case when isnull(vl_minimo,0)<>0 then'
      
        '       '#39' ( Vr.Min. '#39'+ REPLACE(CONVERT( DECIMAL(15, 2), VL_MINIMO' +
        ' ),'#39'.'#39','#39','#39')+'#39' )'#39
      '       else '#39#39' end'
      ''
      
        '  from ( select  CASE ISNULL((SELECT NM_ITEM_INGLES FROM TITEM (' +
        'NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM), '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT RTRIM(LTRIM(NM_ITEM))  FROM TITEM ' +
        '(NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      
        '         ELSE (SELECT RTRIM(LTRIM(NM_ITEM_INGLES)) FROM TITEM (N' +
        'OLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      '       END AS NM_ITEM) view_minimo )) NM_ITEM'
      ','
      
        '       ((SELECT RTRIM(LTRIM(NM_TP_BASE_CALC_FRETE)) FROM TTP_BAS' +
        'E_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE = PFD.TP_BASE_CALCULO))' +
        ' as NM_BASE_CALC,'
      
        '       ((SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WHERE CD_ITEM' +
        ' = PFD.CD_ITEM)) NM_ITEM_ING,'
      '       CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      '       VL_VENDA, VL_VENDA_TOTAL,'
      '       VL_BASE_AG VL_COMPRA, VL_COMPRA_TOTAL'
      ''
      
        '       ,case when isnull(IN_PROFIT,'#39'0'#39')='#39'0'#39' then '#39'   '#39' else '#39'50%' +
        #39' end Profit'
      ''
      '  FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE NR_PROPOSTA = :PROPOSTA'
      '   and CD_PRODUTO = :PRODUTO'
      '   and TP_ORIGEM_DESPESA = '#39'7'#39
      '')
    Left = 978
    Top = 405
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_PROFIT_7CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_7NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 255
    end
    object qry_PROFIT_7NM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_PROFIT_7NM_ITEM_ING: TStringField
      FieldName = 'NM_ITEM_ING'
      FixedChar = True
      Size = 30
    end
    object qry_PROFIT_7CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_7AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_PROFIT_7VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_PROFIT_7VL_VENDA_TOTAL: TFloatField
      FieldName = 'VL_VENDA_TOTAL'
    end
    object qry_PROFIT_7VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
    end
    object qry_PROFIT_7VL_COMPRA_TOTAL: TFloatField
      FieldName = 'VL_COMPRA_TOTAL'
    end
    object qry_PROFIT_7Profit: TStringField
      FieldName = 'Profit'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_7VL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
    object qry_PROFIT_7TX_PC: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_PC'
      Size = 1
      Calculated = True
    end
  end
  object qry_PROFIT_8: TQuery
    OnCalcFields = qry_PROFIT_8CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, Upper('
      '       (select NM_ITEM+case when isnull(vl_minimo,0)<>0 then'
      
        '       '#39' ( Vr.Min. '#39'+ REPLACE(CONVERT( DECIMAL(15, 2), VL_MINIMO' +
        ' ),'#39'.'#39','#39','#39')+'#39' )'#39
      '       else '#39#39' end'
      ''
      
        '  from ( select  CASE ISNULL((SELECT NM_ITEM_INGLES FROM TITEM (' +
        'NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM), '#39#39')'
      
        '         WHEN '#39#39' THEN (SELECT RTRIM(LTRIM(NM_ITEM))  FROM TITEM ' +
        '(NOLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      
        '         ELSE (SELECT RTRIM(LTRIM(NM_ITEM_INGLES)) FROM TITEM (N' +
        'OLOCK) WHERE CD_ITEM = PFD.CD_ITEM)'
      '       END AS NM_ITEM) view_minimo )) NM_ITEM'
      ','
      
        '       ((SELECT RTRIM(LTRIM(NM_TP_BASE_CALC_FRETE)) FROM TTP_BAS' +
        'E_CALC_FRETE WHERE CD_TP_BASE_CALC_FRETE = PFD.TP_BASE_CALCULO))' +
        ' as NM_BASE_CALC,'
      
        '       ((SELECT NM_ITEM_INGLES FROM TITEM (NOLOCK) WHERE CD_ITEM' +
        ' = PFD.CD_ITEM)) NM_ITEM_ING,'
      '       CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE ((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) ' +
        'WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      '       VL_VENDA, VL_VENDA_TOTAL'
      ''
      '      , VL_BASE_AG VL_COMPRA, VL_COMPRA_TOTAL'
      ''
      
        '       ,case when isnull(IN_PROFIT,'#39'0'#39')='#39'0'#39' then '#39'   '#39' else '#39'50%' +
        #39' end Profit'
      ''
      '  FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE NR_PROPOSTA = :PROPOSTA'
      '   and CD_PRODUTO = :PRODUTO'
      '   and TP_ORIGEM_DESPESA = '#39'8'#39
      '')
    Left = 978
    Top = 509
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_PROFIT_8CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_8NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 255
    end
    object qry_PROFIT_8NM_BASE_CALC: TStringField
      FieldName = 'NM_BASE_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_PROFIT_8NM_ITEM_ING: TStringField
      FieldName = 'NM_ITEM_ING'
      FixedChar = True
      Size = 30
    end
    object qry_PROFIT_8CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_8AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_PROFIT_8VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_PROFIT_8VL_VENDA_TOTAL: TFloatField
      FieldName = 'VL_VENDA_TOTAL'
    end
    object qry_PROFIT_8VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
    end
    object qry_PROFIT_8VL_COMPRA_TOTAL: TFloatField
      FieldName = 'VL_COMPRA_TOTAL'
    end
    object qry_PROFIT_8Profit: TStringField
      FieldName = 'Profit'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_8VL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
    object qry_PROFIT_8TX_PC: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_PC'
      Size = 1
      Calculated = True
    end
  end
  object qry_Total_PROFIT_8: TQuery
    OnCalcFields = qry_Total_PROFIT_8CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      
        'select CD_MOEDA,Upper(AP_MOEDA) AP_MOEDA, sum(VL_VENDA) total_VE' +
        'NDA ,sum(VL_VENDA_TOTAL) total_VENDA_GERAL, sum(VL_COMPRA) total' +
        '_COMPRA, sum(VL_COMPRA_TOTAL) total_COMPRA_GERAL  from'
      ''
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA, PFD.VL_VENDA, PFD.VL_VENDA_TOTAL'
      ''
      '  ,PFD.VL_BASE_AG VL_COMPRA, PFD.VL_COMPRA_TOTAL'
      ''
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :PROPOSTA'
      '   and PFD.CD_PRODUTO        = :PRODUTO'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'8'#39
      ') view_geral'
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda'
      ''
      ''
      ''
      ''
      '')
    Left = 978
    Top = 568
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_Total_PROFIT_8CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_Total_PROFIT_8AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_Total_PROFIT_8total_VENDA: TFloatField
      FieldName = 'total_VENDA'
    end
    object qry_Total_PROFIT_8total_VENDA_GERAL: TFloatField
      FieldName = 'total_VENDA_GERAL'
    end
    object qry_Total_PROFIT_8total_COMPRA: TFloatField
      FieldName = 'total_COMPRA'
    end
    object qry_Total_PROFIT_8total_COMPRA_GERAL: TFloatField
      FieldName = 'total_COMPRA_GERAL'
    end
    object qry_Total_PROFIT_8VL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
  end
  object ppDB_PROFIT_A: TppDBPipeline
    DataSource = ds_PROFIT_A
    UserName = 'DB_PROFIT_A'
    Left = 1082
    Top = 349
    object ppDB_PROFIT_AppField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_PROFIT_AppField2: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
    object ppDB_PROFIT_AppField3: TppField
      FieldAlias = 'NM_BASE_CALC'
      FieldName = 'NM_BASE_CALC'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppDB_PROFIT_AppField4: TppField
      FieldAlias = 'NM_ITEM_ING'
      FieldName = 'NM_ITEM_ING'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppDB_PROFIT_AppField5: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppDB_PROFIT_AppField6: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppDB_PROFIT_AppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDB_PROFIT_AppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA_TOTAL'
      FieldName = 'VL_VENDA_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDB_PROFIT_AppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPRA'
      FieldName = 'VL_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDB_PROFIT_AppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPRA_TOTAL'
      FieldName = 'VL_COMPRA_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDB_PROFIT_AppField11: TppField
      FieldAlias = 'Profit'
      FieldName = 'Profit'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppDB_PROFIT_AppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDB_PROFIT_AppField13: TppField
      FieldAlias = 'TX_PC'
      FieldName = 'TX_PC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
  end
  object ppDB_PROFIT_7: TppDBPipeline
    DataSource = ds_PROFIT_7
    UserName = 'DB_PROFIT_7'
    Left = 1082
    Top = 405
    object ppDB_PROFIT_7ppField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_PROFIT_7ppField2: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
    object ppDB_PROFIT_7ppField3: TppField
      FieldAlias = 'NM_BASE_CALC'
      FieldName = 'NM_BASE_CALC'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppDB_PROFIT_7ppField4: TppField
      FieldAlias = 'NM_ITEM_ING'
      FieldName = 'NM_ITEM_ING'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppDB_PROFIT_7ppField5: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppDB_PROFIT_7ppField6: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppDB_PROFIT_7ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDB_PROFIT_7ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA_TOTAL'
      FieldName = 'VL_VENDA_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDB_PROFIT_7ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPRA'
      FieldName = 'VL_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDB_PROFIT_7ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPRA_TOTAL'
      FieldName = 'VL_COMPRA_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDB_PROFIT_7ppField11: TppField
      FieldAlias = 'Profit'
      FieldName = 'Profit'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppDB_PROFIT_7ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDB_PROFIT_7ppField13: TppField
      FieldAlias = 'TX_PC'
      FieldName = 'TX_PC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
  end
  object ppDB_TOTAL_PROFIT_7: TppDBPipeline
    DataSource = ds_Total_PROFIT_7
    UserName = 'DB_PROFIT_TOTAL_7'
    Left = 1082
    Top = 461
    object ppDB_TOTAL_PROFIT_7ppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_TOTAL_PROFIT_7ppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppDB_TOTAL_PROFIT_7ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA'
      FieldName = 'total_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDB_TOTAL_PROFIT_7ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA_GERAL'
      FieldName = 'total_VENDA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDB_TOTAL_PROFIT_7ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA'
      FieldName = 'total_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB_TOTAL_PROFIT_7ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA_GERAL'
      FieldName = 'total_COMPRA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB_TOTAL_PROFIT_7ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object ppDB_PROFIT_8: TppDBPipeline
    DataSource = ds_PROFIT_8
    UserName = 'DB_PROFIT_8'
    Left = 1082
    Top = 509
    object ppDB_PROFIT_8ppField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_PROFIT_8ppField2: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 255
      DisplayWidth = 255
      Position = 1
    end
    object ppDB_PROFIT_8ppField3: TppField
      FieldAlias = 'NM_BASE_CALC'
      FieldName = 'NM_BASE_CALC'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppDB_PROFIT_8ppField4: TppField
      FieldAlias = 'NM_ITEM_ING'
      FieldName = 'NM_ITEM_ING'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppDB_PROFIT_8ppField5: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppDB_PROFIT_8ppField6: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppDB_PROFIT_8ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDB_PROFIT_8ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA_TOTAL'
      FieldName = 'VL_VENDA_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDB_PROFIT_8ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPRA'
      FieldName = 'VL_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDB_PROFIT_8ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMPRA_TOTAL'
      FieldName = 'VL_COMPRA_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDB_PROFIT_8ppField11: TppField
      FieldAlias = 'Profit'
      FieldName = 'Profit'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppDB_PROFIT_8ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDB_PROFIT_8ppField13: TppField
      FieldAlias = 'TX_PC'
      FieldName = 'TX_PC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
  end
  object ppDB_TOTAL_PROFIT_8: TppDBPipeline
    DataSource = ds_Total_PROFIT_8
    UserName = 'DB_PROFIT_TOTAL_8'
    Left = 1082
    Top = 565
    object ppDB_TOTAL_PROFIT_8ppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_TOTAL_PROFIT_8ppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppDB_TOTAL_PROFIT_8ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA'
      FieldName = 'total_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDB_TOTAL_PROFIT_8ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA_GERAL'
      FieldName = 'total_VENDA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDB_TOTAL_PROFIT_8ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA'
      FieldName = 'total_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB_TOTAL_PROFIT_8ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA_GERAL'
      FieldName = 'total_COMPRA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB_TOTAL_PROFIT_8ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object qry_PROFIT_Total_frete_FCL: TQuery
    OnCalcFields = qry_PROFIT_Total_frete_FCLCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'select CD_MOEDA,AP_MOEDA'
      ',sum(VL_VENDA) total_VENDA'
      ',sum(VL_VENDA_TOTAL) total_VENDA_GERAL'
      ', sum(VL_COMPRA) total_COMPRA'
      ', sum(VL_COMPRA_TOTAL) total_COMPRA_GERAL'
      ''
      ''
      '  from'
      ''
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA, PFD.VL_VENDA, PFD.VL_VENDA_TOTAL'
      ''
      '  ,PFD.VL_BASE_AG VL_COMPRA, PFD.VL_COMPRA_TOTAL'
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :PROPOSTA'
      '   and PFD.CD_PRODUTO        = :PRODUTO'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'A'#39
      ''
      'union all'
      ''
      'select  PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      'PM.VL_VENDA VL_CALCULADO,(PM.QTD_VOLUMES * PM.VL_VENDA),'
      'PM.VL_CUSTO VL_CALCULADO_COMPRA,(PM.QTD_VOLUMES * PM.VL_CUSTO)'
      'FROM  TPROPOSTA_FRETE PF '
      'JOIN TPROPOSTA_MERCADORIA PM ON PF.NR_PROPOSTA=PM.NR_PROPOSTA'
      'WHERE PF.NR_PROPOSTA = :PROPOSTA and PF.CD_PRODUTO = :PRODUTO'
      ''
      ''
      ''
      ''
      ') view_geral'
      ''
      ''
      ''
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda'
      ''
      '')
    Left = 979
    Top = 624
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_PROFIT_Total_frete_FCLCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_Total_frete_FCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_PROFIT_Total_frete_FCLtotal_VENDA: TFloatField
      FieldName = 'total_VENDA'
    end
    object qry_PROFIT_Total_frete_FCLtotal_VENDA_GERAL: TFloatField
      FieldName = 'total_VENDA_GERAL'
    end
    object qry_PROFIT_Total_frete_FCLtotal_COMPRA: TFloatField
      FieldName = 'total_COMPRA'
    end
    object qry_PROFIT_Total_frete_FCLtotal_COMPRA_GERAL: TFloatField
      FieldName = 'total_COMPRA_GERAL'
    end
    object qry_PROFIT_Total_frete_FCLVL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
  end
  object ds_PROFIT_Total_frete_FCL: TDataSource
    DataSet = qry_PROFIT_Total_frete_FCL
    Left = 876
    Top = 624
  end
  object ppDB_PROFIT_Total_frete_FCL: TppDBPipeline
    DataSource = ds_PROFIT_Total_frete_FCL
    UserName = 'DB_PROFIT_Total_frete_FCL'
    Left = 1085
    Top = 624
  end
  object ppDB_PROFIT_Total_frete_LCL: TppDBPipeline
    DataSource = ds_PROFIT_Total_frete_LCL
    UserName = 'DB_PROFIT_Total_frete_LCL'
    Left = 1087
    Top = 674
    object ppDB_PROFIT_Total_frete_LCLppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_PROFIT_Total_frete_LCLppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppDB_PROFIT_Total_frete_LCLppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA'
      FieldName = 'total_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDB_PROFIT_Total_frete_LCLppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA_GERAL'
      FieldName = 'total_VENDA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDB_PROFIT_Total_frete_LCLppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA'
      FieldName = 'total_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB_PROFIT_Total_frete_LCLppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA_GERAL'
      FieldName = 'total_COMPRA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB_PROFIT_Total_frete_LCLppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object qry_PROFIT_Total_frete_LCL: TQuery
    OnCalcFields = qry_PROFIT_Total_frete_LCLCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'select CD_MOEDA, Upper(AP_MOEDA) AP_MOEDA'
      ', sum(VL_VENDA) total_VENDA'
      ', sum(VL_VENDA_TOTAL) total_VENDA_GERAL'
      ', sum(VL_COMPRA) total_COMPRA'
      ', sum(VL_COMPRA_TOTAL) total_COMPRA_GERAL'
      ''
      ''
      '  from'
      ''
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA, PFD.VL_VENDA, PFD.VL_VENDA_TOTAL'
      ''
      '  ,PFD.VL_BASE_AG VL_COMPRA, PFD.VL_COMPRA_TOTAL'
      ''
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :PROPOSTA'
      '   and PFD.CD_PRODUTO        = :PRODUTO'
      '   and PFD.TP_ORIGEM_DESPESA = '#39'A'#39
      ''
      ''
      'union all'
      ''
      'select  PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      
        '       PR.VL_VENDA_UNIT_LCL TOTAL, (PR.VL_VENDA_UNIT_LCL * ( cas' +
        'e pr.IN_FIXO when '#39'1'#39' then 1 else pr.VL_CHARGEABLE end ) ) VL_CA' +
        'LCULADO,'
      
        '       PR.VL_CUSTO_UNIT_LCL TOTAL, (PR.VL_CUSTO_UNIT_LCL * ( cas' +
        'e pr.IN_FIXO when '#39'1'#39' then 1 else pr.VL_CHARGEABLE end ) ) VL_CA' +
        'LCULADO_COMPRA'
      'FROM  TPROPOSTA_FRETE PF'
      
        'JOIN TPROPOSTA_ITEM PR ON PF.NR_PROPOSTA=PR.NR_PROPOSTA and PF.C' +
        'D_PRODUTO=PR.CD_PRODUTO'
      'WHERE PF.NR_PROPOSTA = :proposta and PF.CD_PRODUTO = :produto'
      ''
      ''
      ''
      ''
      ') view_geral'
      ''
      ''
      ''
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda'
      '')
    Left = 981
    Top = 674
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_PROFIT_Total_frete_LCLCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_Total_frete_LCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_PROFIT_Total_frete_LCLtotal_VENDA: TFloatField
      FieldName = 'total_VENDA'
    end
    object qry_PROFIT_Total_frete_LCLtotal_VENDA_GERAL: TFloatField
      FieldName = 'total_VENDA_GERAL'
    end
    object qry_PROFIT_Total_frete_LCLtotal_COMPRA: TFloatField
      FieldName = 'total_COMPRA'
    end
    object qry_PROFIT_Total_frete_LCLtotal_COMPRA_GERAL: TFloatField
      FieldName = 'total_COMPRA_GERAL'
    end
    object qry_PROFIT_Total_frete_LCLVL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      Calculated = True
    end
  end
  object ds_PROFIT_Total_frete_LCL: TDataSource
    DataSet = qry_PROFIT_Total_frete_LCL
    Left = 877
    Top = 674
  end
  object ds_PROFIT_ValoresTotalPorMoeda_FCL: TDataSource
    DataSet = qry_PROFIT_ValoresTotalPorMoeda_FCL
    Left = 877
    Top = 735
  end
  object qry_PROFIT_ValoresTotalPorMoeda_FCL: TQuery
    OnCalcFields = qry_PROFIT_ValoresTotalPorMoeda_FCLCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'select CD_MOEDA, upper(AP_MOEDA) AP_MOEDA'
      ',sum(VL_VENDA) total_VENDA'
      ',sum(VL_VENDA_TOTAL) total_VENDA_GERAL'
      ', sum(VL_COMPRA) total_COMPRA'
      ', sum(VL_COMPRA_TOTAL) total_COMPRA_GERAL'
      ''
      ''
      '  from'
      ''
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA, PFD.VL_VENDA, PFD.VL_VENDA_TOTAL'
      ''
      '  ,PFD.VL_BASE_AG VL_COMPRA, PFD.VL_COMPRA_TOTAL'
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :PROPOSTA'
      '   and PFD.CD_PRODUTO        = :PRODUTO'
      ''
      'union all'
      ''
      'select  PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      'PM.VL_VENDA VL_CALCULADO,(PM.QTD_VOLUMES * PM.VL_VENDA),'
      'PM.VL_CUSTO VL_CALCULADO_COMPRA,(PM.QTD_VOLUMES * PM.VL_CUSTO)'
      'FROM  TPROPOSTA_FRETE PF'
      'JOIN TPROPOSTA_MERCADORIA PM ON PF.NR_PROPOSTA=PM.NR_PROPOSTA'
      'WHERE PF.NR_PROPOSTA = :PROPOSTA and PF.CD_PRODUTO = :PRODUTO'
      ''
      ''
      ''
      ''
      ') view_geral'
      ''
      ''
      ''
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda'
      '')
    Left = 982
    Top = 735
    ParamData = <
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_PROFIT_ValoresTotalPorMoeda_FCLCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_ValoresTotalPorMoeda_FCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_VENDA: TFloatField
      FieldName = 'total_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_VENDA_GERAL: TFloatField
      FieldName = 'total_VENDA_GERAL'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_COMPRA: TFloatField
      FieldName = 'total_COMPRA'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_COMPRA_GERAL: TFloatField
      FieldName = 'total_COMPRA_GERAL'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_FCLVL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object ppDB_PROFIT_ValoresTotalPorMoeda_FCL: TppDBPipeline
    DataSource = ds_PROFIT_ValoresTotalPorMoeda_FCL
    UserName = 'DB_PROFIT_ValoresTotalPorMoeda_FCL'
    Left = 1090
    Top = 735
    object ppDB_PROFIT_ValoresTotalPorMoeda_FCLppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_FCLppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_FCLppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA'
      FieldName = 'total_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_FCLppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA_GERAL'
      FieldName = 'total_VENDA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_FCLppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA'
      FieldName = 'total_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_FCLppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA_GERAL'
      FieldName = 'total_COMPRA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_FCLppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object ds_PROFIT_ValoresTotalPorMoeda_LCL: TDataSource
    DataSet = qry_PROFIT_ValoresTotalPorMoeda_LCL
    Left = 880
    Top = 800
  end
  object qry_PROFIT_ValoresTotalPorMoeda_LCL: TQuery
    OnCalcFields = qry_PROFIT_ValoresTotalPorMoeda_LCLCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '                       '
      'select CD_MOEDA, Upper(AP_MOEDA) AP_MOEDA'
      ', sum(VL_VENDA) total_VENDA'
      ', sum(VL_VENDA_TOTAL) total_VENDA_GERAL'
      ', sum(VL_COMPRA) total_COMPRA'
      ', sum(VL_COMPRA_TOTAL) total_COMPRA_GERAL'
      ''
      ''
      '  from'
      ''
      '('
      'SELECT PFD.CD_MOEDA,'
      '       CASE PFD.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PFD.CD_MOEDA))'
      '       END AS AP_MOEDA, PFD.VL_VENDA, PFD.VL_VENDA_TOTAL'
      ''
      '  ,PFD.VL_BASE_AG VL_COMPRA, PFD.VL_COMPRA_TOTAL'
      ''
      'FROM TPROPOSTA_FRETE_DESPESA PFD (NOLOCK)'
      ' WHERE PFD.NR_PROPOSTA       = :PROPOSTA'
      '   and PFD.CD_PRODUTO        = :PRODUTO'
      ''
      'union all'
      ''
      'select  PF.CD_MOEDA,'
      '       CASE PF.CD_MOEDA'
      '         WHEN '#39'220'#39' THEN '#39'USD'#39
      '         WHEN '#39'790'#39' THEN '#39'BRL'#39
      
        '         ELSE Upper((SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOL' +
        'OCK) WHERE M.CD_MOEDA = PF.CD_MOEDA))'
      '       END AS AP_MOEDA,'
      
        '       PR.VL_VENDA_UNIT_LCL TOTAL, (PR.VL_VENDA_UNIT_LCL * ( cas' +
        'e pr.IN_FIXO when '#39'1'#39' then 1 else pr.VL_CHARGEABLE end ) ) VL_CA' +
        'LCULADO,'
      
        '       PR.VL_CUSTO_UNIT_LCL TOTAL, (PR.VL_CUSTO_UNIT_LCL * ( cas' +
        'e pr.IN_FIXO when '#39'1'#39' then 1 else pr.VL_CHARGEABLE end ) ) VL_CA' +
        'LCULADO_COMPRA'
      'FROM  TPROPOSTA_FRETE PF'
      
        'JOIN TPROPOSTA_ITEM PR ON PF.NR_PROPOSTA=PR.NR_PROPOSTA and PF.C' +
        'D_PRODUTO=PR.CD_PRODUTO'
      'WHERE PF.NR_PROPOSTA = :proposta and PF.CD_PRODUTO = :produto'
      ''
      ''
      ''
      ''
      ') view_geral'
      ''
      ''
      ''
      ''
      ''
      'GROUP BY cd_moeda,ap_moeda'
      '')
    Left = 984
    Top = 800
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'produto'
        ParamType = ptUnknown
      end>
    object qry_PROFIT_ValoresTotalPorMoeda_LCLCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_PROFIT_ValoresTotalPorMoeda_LCLAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_VENDA: TFloatField
      FieldName = 'total_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_VENDA_GERAL: TFloatField
      FieldName = 'total_VENDA_GERAL'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_COMPRA: TFloatField
      FieldName = 'total_COMPRA'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_COMPRA_GERAL: TFloatField
      FieldName = 'total_COMPRA_GERAL'
      DisplayFormat = '0.00'
    end
    object qry_PROFIT_ValoresTotalPorMoeda_LCLVL_PROFIT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VL_PROFIT'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object ppDB_PROFIT_ValoresTotalPorMoeda_LCL: TppDBPipeline
    DataSource = ds_PROFIT_ValoresTotalPorMoeda_LCL
    UserName = 'DB_PROFIT_ValoresTotalPorMoeda_LCL'
    Left = 1088
    Top = 800
    object ppDB_PROFIT_ValoresTotalPorMoeda_LCLppField1: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_LCLppField2: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 1
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_LCLppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA'
      FieldName = 'total_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_LCLppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_VENDA_GERAL'
      FieldName = 'total_VENDA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_LCLppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA'
      FieldName = 'total_COMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_LCLppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_COMPRA_GERAL'
      FieldName = 'total_COMPRA_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB_PROFIT_ValoresTotalPorMoeda_LCLppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PROFIT'
      FieldName = 'VL_PROFIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object qryResumoProfit: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' select AP_MOEDA Moeda'
      ', sum(total_VENDA_GERAL)  Total_Venda'
      ', sum(total_COMPRA_GERAL) Total_Compra'
      ', sum(total_geral)        Total_Geral'
      ', sum(total_indaia)       Total_Indaia'
      ' from vw_calculo_profit'
      ' where nr_proposta = :proposta'
      ' group by AP_MOEDA')
    Left = 176
    Top = 480
    ParamData = <
      item
        DataType = ftString
        Name = 'proposta'
        ParamType = ptUnknown
      end>
    object qryResumoProfitMoeda: TStringField
      FieldName = 'Moeda'
      Origin = 'DBBROKER.vw_calculo_profit.AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryResumoProfitTotal_Venda: TFloatField
      FieldName = 'Total_Venda'
      Origin = 'DBBROKER.vw_calculo_profit.total_VENDA_GERAL'
      DisplayFormat = '0.00'
    end
    object qryResumoProfitTotal_Compra: TFloatField
      FieldName = 'Total_Compra'
      Origin = 'DBBROKER.vw_calculo_profit.total_COMPRA_GERAL'
      DisplayFormat = '0.00'
    end
    object qryResumoProfitTotal_Geral: TFloatField
      FieldName = 'Total_Geral'
      Origin = 'DBBROKER.vw_calculo_profit.total_geral'
      DisplayFormat = '0.00'
    end
    object qryResumoProfitTotal_Indaia: TFloatField
      FieldName = 'Total_Indaia'
      Origin = 'DBBROKER.vw_calculo_profit.total_indaia'
      DisplayFormat = '0.00'
    end
  end
  object dsResumoProfit: TDataSource
    DataSet = qryResumoProfit
    Left = 40
    Top = 480
  end
end

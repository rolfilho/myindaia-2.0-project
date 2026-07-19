object datm_unidade: Tdatm_unidade
  OldCreateOrder = True
  Left = 244
  Top = 222
  Height = 271
  Width = 678
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 216
    Top = 55
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 332
    Top = 121
  end
  object ds_unid_neg_produto: TDataSource
    DataSet = qry_unid_neg_produto_
    Left = 332
    Top = 55
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 332
    Top = 170
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG, IN_ATIVO, CGC_UNID' +
        '_NEG, CD_FILIAL, END_UNID_NEG,'
      
        '       END_NUMERO, END_BAIRRO, END_CIDADE, END_UF, IE_UNID_NEG, ' +
        'IM_UNID_NEG, NR_FONE, END_CEP, NR_FAX1, NR_FAX2, NM_SLOGAN, NR_N' +
        'OTA_FATURA, NM_EMAIL, NR_PROC_NF_PREF, NR_LIVRO,'
      
        '       PATH_RELATORIOS, PATH_SISCOMEX, PATH_REI, NM_DIRETOR, NR_' +
        'CPF_DIRETOR, NM_CONTADOR, NR_CRC_CONTADOR, NM_PROCURADOR, NM_SIG' +
        'LA, NR_CPF_PROCURADOR, CD_PAIS, VL_ALIQ_ISS,'
      '       CD_BANCO_CONCILIACAO, CD_CT_CUSTO'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 216
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
    object qry_unid_neg_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 5
      Lookup = True
    end
    object qry_unid_neg_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_unid_neg_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 3
    end
    object qry_unid_neg_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 6
    end
    object qry_unid_neg_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TUNID_NEG.CGC_UNID_NEG'
      Size = 30
    end
    object qry_unid_neg_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TUNID_NEG.CD_FILIAL'
      Size = 30
    end
    object qry_unid_neg_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TUNID_NEG.END_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_IE_UNID_NEG: TStringField
      FieldName = 'IE_UNID_NEG'
      Origin = 'TUNID_NEG.END_NUMERO'
    end
    object qry_unid_neg_IM_UNID_NEG: TStringField
      FieldName = 'IM_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
    end
    object qry_unid_neg_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      Origin = 'TUNID_NEG.END_BAIRRO'
    end
    object qry_unid_neg_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TUNID_NEG.END_CIDADE'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object qry_unid_neg_NR_FAX1: TStringField
      FieldName = 'NR_FAX1'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
    end
    object qry_unid_neg_NR_FAX2: TStringField
      FieldName = 'NR_FAX2'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
    end
    object qry_unid_neg_NM_SLOGAN: TStringField
      FieldName = 'NM_SLOGAN'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 100
    end
    object qry_unid_neg_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 6
    end
    object qry_unid_neg_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 100
    end
    object qry_unid_neg_PATH_RELATORIOS: TStringField
      FieldName = 'PATH_RELATORIOS'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 100
    end
    object qry_unid_neg_PATH_SISCOMEX: TStringField
      FieldName = 'PATH_SISCOMEX'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 100
    end
    object qry_unid_neg_PATH_REI: TStringField
      FieldName = 'PATH_REI'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 100
    end
    object qry_unid_neg_NM_DIRETOR: TStringField
      FieldName = 'NM_DIRETOR'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_NR_CPF_DIRETOR: TStringField
      FieldName = 'NR_CPF_DIRETOR'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_unid_neg_NM_CONTADOR: TStringField
      FieldName = 'NM_CONTADOR'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_NR_CRC_CONTADOR: TStringField
      FieldName = 'NR_CRC_CONTADOR'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 15
    end
    object qry_unid_neg_NM_PROCURADOR: TStringField
      FieldName = 'NM_PROCURADOR'
      Origin = 'TUNID_NEG.CGC_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_NR_CPF_PROCURADOR: TStringField
      FieldName = 'NR_CPF_PROCURADOR'
      Origin = 'TUNID_NEG.CD_FILIAL'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_unid_neg_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 3
    end
    object qry_unid_neg_Look_Pais: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Pais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS'
      Size = 40
      Lookup = True
    end
    object qry_unid_neg_VL_ALIQ_ISS: TFloatField
      FieldName = 'VL_ALIQ_ISS'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_unid_neg_NR_PROC_NF_PREF: TStringField
      FieldName = 'NR_PROC_NF_PREF'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
    end
    object qry_unid_neg_NR_LIVRO: TStringField
      FieldName = 'NR_LIVRO'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 5
    end
    object qry_unid_neg_NM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 3
    end
    object qry_unid_neg_CD_BANCO_CONCILIACAO: TStringField
      FieldName = 'CD_BANCO_CONCILIACAO'
      Origin = 'DBBROKER.TUNID_NEG.CD_BANCO_CONCILIACAO'
      FixedChar = True
      Size = 3
    end
    object qry_unid_neg_LookBanco: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO_CONCILIACAO'
      Size = 40
      Lookup = True
    end
    object qry_unid_neg_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TUNID_NEG.CD_CT_CUSTO'
      FixedChar = True
      Size = 4
    end
    object qry_unid_neg_LookCusto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCusto'
      LookupDataSet = qry_custo
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'NM_CT_CUSTO'
      KeyFields = 'CD_CT_CUSTO'
      Size = 40
      Lookup = True
    end
  end
  object qry_ult_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_UNID_NEG) AS ULTIMO'
      'FROM TUNID_NEG')
    Left = 465
    Top = 7
    object qry_ult_unid_neg_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
  end
  object sp_ativar_desativar_unidade: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_ATIVAR_DESATIVAR_UNIDADE'
    Left = 465
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@IN_ATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_unid_neg_produto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_usuario_habilitacao_produto
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM  TUNID_NEG_PRODUTO '
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND'
      '               CD_PRODUTO=:CD_PRODUTO'
      '')
    Left = 332
    Top = 7
    ParamData = <
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
    object qry_unid_neg_produto_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 5
      Lookup = True
    end
    object qry_unid_neg_produto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG_PRODUTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUNID_NEG_PRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_unid_neg_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG_PRODUTO.IN_ATIVO'
      Size = 1
    end
    object qry_unid_neg_produto_NR_ULT_FATURA: TFloatField
      FieldName = 'NR_ULT_FATURA'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_FATURA'
    end
    object qry_unid_neg_produto_NR_ULT_NOTA: TFloatField
      FieldName = 'NR_ULT_NOTA'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_NOTA'
    end
    object qry_unid_neg_produto_NR_ULT_PROCESSO: TFloatField
      FieldName = 'NR_ULT_PROCESSO'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_PROCESSO'
    end
    object qry_unid_neg_produto_NR_ULT_PREVISAO: TStringField
      FieldName = 'NR_ULT_PREVISAO'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_PREVISAO'
      Size = 6
    end
    object qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TUNID_NEG_PRODUTO.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      Origin = 'TUNID_NEG_PRODUTO.TX_NUMERARIO_ASS'
      BlobType = ftMemo
    end
    object qry_unid_neg_produto_look_nm_produto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_unid_neg_produto_look_ap_produto: TStringField
      DisplayLabel = 'Apelido'
      FieldKind = fkLookup
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Lookup = True
    end
    object qry_unid_neg_produto_look_nm_unid_neg: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPRODUTO (NOLOCK)')
    Left = 216
    Top = 121
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TPRODUTO.IN_ATIVO'
      Size = 1
    end
    object qry_produto_CD_VIATRANSP: TStringField
      FieldName = 'CD_VIATRANSP'
      Origin = 'TPRODUTO.CD_VIATRANSP'
      Size = 1
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 216
    Top = 170
  end
  object qry_usuario_habilitacao_produto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_usuario_habilitacao_unidade
    SQL.Strings = (
      'SELECT * '
      'FROM TUNID_NEG_PRODUTO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND CD_PRODUTO IN '
      '             ( SELECT CD_PRODUTO '
      '               FROM TUSUARIO_HABILITACAO'
      
        '              WHERE CD_USUARIO = :CD_USUARIO AND IN_ATIVO = '#39'1'#39' ' +
        ')'
      'ORDER BY'
      'NM_PRODUTO')
    Left = 72
    Top = 121
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_produto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_produto_CD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_usuario_habilitacao_produto_NR_ULT_FATURA: TFloatField
      FieldName = 'NR_ULT_FATURA'
    end
    object qry_usuario_habilitacao_produto_NR_ULT_NOTA: TFloatField
      FieldName = 'NR_ULT_NOTA'
    end
    object qry_usuario_habilitacao_produto_NR_ULT_PROCESSO: TFloatField
      FieldName = 'NR_ULT_PROCESSO'
    end
    object qry_usuario_habilitacao_produto_NR_ULT_PREVISAO: TStringField
      FieldName = 'NR_ULT_PREVISAO'
      Size = 6
    end
    object qry_usuario_habilitacao_produto_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_usuario_habilitacao_produto_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      BlobType = ftMemo
    end
    object qry_usuario_habilitacao_produto_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_usuario_habilitacao_produto_look_nm_produto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
    object qry_usuario_habilitacao_produto_look_ap_produto: TStringField
      DisplayLabel = 'Apelido'
      FieldKind = fkLookup
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
  end
  object ds_usuario_habilitacao_produto: TDataSource
    DataSet = qry_usuario_habilitacao_produto_
    Left = 72
    Top = 170
  end
  object qry_usuario_habilitacao_unidade_: TQuery
    AfterScroll = qry_usuario_habilitacao_unidade_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN'
      '              ( SELECT CD_UNID_NEG'
      '                FROM   TUSUARIO_HABILITACAO H'
      
        '                WHERE  CD_USUARIO = :CD_USUARIO AND H.IN_ATIVO =' +
        ' '#39'1'#39' ) OR'
      '      :CD_CARGO = '#39'001'#39
      'ORDER BY'
      'NM_UNID_NEG')
    Left = 72
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_unidade_CD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_unidade_NM_UNID_NEG: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_usuario_habilitacao_unidade_AP_UNID_NEG: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_usuario_habilitacao_unidade_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_usuario_habilitacao_unidade_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object ds_usuario_habilitacao_unidade: TDataSource
    DataSet = qry_usuario_habilitacao_unidade_
    Left = 72
    Top = 55
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TPAIS (NOLOCK)')
    Left = 464
    Top = 121
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM   TBANCO')
    Left = 464
    Top = 168
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TBANCO.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'DBBROKER.TBANCO.NM_BANCO'
      FixedChar = True
      Size = 40
    end
  end
  object ds_cd_custo: TDataSource
    DataSet = qry_custo
    Left = 581
    Top = 55
  end
  object qry_custo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABIL_CUSTO (NOLOCK)'
      'WHERE CD_COLIGADA = :CD_COLIGADA'
      '')
    Left = 581
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptInput
      end>
  end
end

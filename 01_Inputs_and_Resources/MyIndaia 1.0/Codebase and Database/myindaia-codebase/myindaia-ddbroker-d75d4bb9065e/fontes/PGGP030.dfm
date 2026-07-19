object datm_sel_unid_prod_arm: Tdatm_sel_unid_prod_arm
  Left = 36
  Top = 262
  Height = 224
  Width = 439
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 124
    Top = 17
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 124
    Top = 76
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
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 27
    Top = 17
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
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM_COMISSAO, CD_ITEM_EXPED'
      'FROM TPARAMETROS')
    Left = 27
    Top = 76
    object qry_param_CD_ITEM_COMISSAO: TStringField
      FieldName = 'CD_ITEM_COMISSAO'
      Origin = 'TPARAMETROS.CD_ITEM_COMISSAO'
      Size = 3
    end
    object qry_param_CD_ITEM_EXPED: TStringField
      FieldName = 'CD_ITEM_EXPED'
      Origin = 'TPARAMETROS.CD_ITEM_EXPED'
      Size = 3
    end
  end
  object qry_arm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ARMAZEM, NM_ARMAZEM'
      'FROM TARMAZEM'
      'WHERE CD_ARMAZEM = :CD_ARMAZEM'
      '')
    Params.Data = {010001000A43445F41524D415A454D0001020030000000}
    Left = 124
    Top = 138
    object qry_arm_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_arm_NM_ARMAZEM: TStringField
      FieldName = 'NM_ARMAZEM'
      Origin = 'TARMAZEM.NM_ARMAZEM'
      Size = 50
    end
  end
  object sp_rel_desp_arm: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_desp_arm'
    Params.Data = {
      0100080006526573756C74040304000000000000010C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000000A40
      64745F696E6963696F0101020030000000074064745F66696D01010200300000
      00144063645F61726D617A656D5F646573636172676101010200300000000C40
      6E725F636F6E74726F6C650103040000000000000011406E725F6964656E7469
      66696361646F7202030400010000000001}
    Left = 224
    Top = 138
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 27
    Top = 138
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
  object qry_apaga_dados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TREL_DESP_ARM'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 224
    Top = 76
    object StringField1: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_processo_: TQuery
    Filtered = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO'
      'FROM   TPROCESSO P,'
      '       TDECLARACAO_IMPORTACAO DI,'
      '       TYES_NO Y,'
      '       TARMAZEM ARM,'
      '       VW_DT_DESEMB DESEMB,'
      '       VW_DT_REG_DI REGDI'
      
        'WHERE  ( ( P.CD_UNID_NEG = :cd_unid_neg ) OR ( :cd_unid_neg = '#39#39 +
        ' ) ) AND'
      
        '       ( ( P.CD_PRODUTO = :cd_produto ) OR ( :cd_produto = '#39#39' ) ' +
        ') AND'
      
        '       ( ( P.CD_ARMAZEM_DESCARGA = :cd_armazem_descarga ) OR ( :' +
        'cd_armazem_descarga = '#39#39' ) ) AND'
      '       P.NR_PROCESSO = DI.NR_PROCESSO AND'
      '       P.NR_PROCESSO *= DESEMB.NR_PROCESSO AND'
      '       P.NR_PROCESSO = REGDI.NR_PROCESSO AND'
      '       P.CD_ARMAZEM_DESCARGA *= ARM.CD_ARMAZEM AND'
      '       P.IN_URGENTE = Y.CD_YESNO AND'
      '       P.IN_IMP_ARM = '#39'0'#39' AND'
      '       DI.NR_DECLARACAO_IMP IS NOT NULL AND'
      '       DI.NR_DECLARACAO_IMP <> '#39#39' AND'
      '       REGDI.DT_REALIZACAO >= :dt_inicio AND'
      '       REGDI.DT_REALIZACAO <= :dt_fim AND'
      '       DESEMB.DT_REALIZACAO >= :dt_inicio AND'
      '       DESEMB.DT_REALIZACAO <= :dt_fim AND'
      '       REGDI.DT_REALIZACAO IS NOT NULL AND'
      '       DESEMB.DT_REALIZACAO IS NOT NULL AND'
      '       ISNULL( P.CD_ARMAZEM_DESCARGA, '#39#39' ) <> '#39#39
      '')
    Params.Data = {
      01000A000B63645F756E69645F6E656700010200300001000B63645F756E6964
      5F6E656700010200300001000A63645F70726F6475746F00010200300001000A
      63645F70726F6475746F00010200300001001363645F61726D617A656D5F6465
      73636172676100010200300001001363645F61726D617A656D5F646573636172
      676100010200300001000964745F696E6963696F000B080000002C845D40CB42
      01000664745F66696D000B080000002C845D40CB4201000964745F696E696369
      6F000B080000002C845D40CB4201000664745F66696D000B080000002C845D40
      CB420100}
    Left = 220
    Top = 20
  end
  object sp_rel_desp_arm2: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_desp_arm2'
    Params.Data = {
      0100030006526573756C74040304000000000000010C406E725F70726F636573
      736F010102003000000011406E725F6964656E746966696361646F7201030400
      000000000000}
    Left = 328
    Top = 138
  end
end

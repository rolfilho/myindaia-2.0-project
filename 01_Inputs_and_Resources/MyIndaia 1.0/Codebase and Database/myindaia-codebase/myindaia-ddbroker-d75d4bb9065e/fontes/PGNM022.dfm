object datm_Impressao_Numerario: Tdatm_Impressao_Numerario
  OldCreateOrder = True
  Left = 17
  Top = 69
  Height = 550
  Width = 499
  object ds_empresa_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 52
    Top = 248
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, CD_NUMERARIO'
      'FROM TEMPRESA_NAC, TCLIENTE_HABILITACAO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_EMPRESA = CD_CLIENTE AND'
      'CD_EMPRESA <> '#39#39)
    Left = 174
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_emp_nac_CD_NUMERARIO: TStringField
      FieldName = 'CD_NUMERARIO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 2
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 52
    Top = 299
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 174
    Top = 299
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
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 52
    Top = 353
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 174
    Top = 353
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
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 52
    Top = 139
  end
  object qry_processo_: TQuery
    AfterScroll = qry_processo_AfterScroll
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT P.NR_PROCESSO'
      'FROM TPROCESSO P, TNUMERARIO N'
      'WHERE P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '               P.CD_PRODUTO = :CD_PRODUTO AND'
      '               P.CD_CLIENTE = :CD_CLIENTE AND'
      '               P.NR_PROCESSO = N.NR_PROCESSO AND'
      '             ( N.DT_SOLICITACAO = :DT_SOLICITACAO OR'
      '               N.IN_EMITIDO = '#39'0'#39' ) AND'
      '             ( N.CD_STATUS ='#39'A'#39' OR N.CD_STATUS ='#39'B'#39' ) AND'
      '             ( N.VL_SOLICITADO >= 0 )')
    Left = 174
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_SOLICITACAO'
        ParamType = ptInput
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_calc_nr_processo: TStringField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 18
      Calculated = True
    end
  end
  object ds_cliente_hab: TDataSource
    DataSet = qry_cliente_hab_
    Left = 52
    Top = 200
  end
  object qry_cliente_hab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCLIENTE_HABILITACAO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_CLIENTE = :CD_CLIENTE')
    Left = 174
    Top = 198
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Value = '01'
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Value = '00025'
      end>
    object qry_cliente_hab_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_hab_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_hab_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_hab_DT_VALID_CRED_RF: TDateTimeField
      FieldName = 'DT_VALID_CRED_RF'
      Origin = 'TCLIENTE_HABILITACAO.DT_VALID_CRED_RF'
    end
    object qry_cliente_hab_DT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_HABILITACAO.DT_CAPTACAO'
    end
    object qry_cliente_hab_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_hab_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TCLIENTE_HABILITACAO.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_cliente_hab_QT_ADIANTAMENTO: TFloatField
      FieldName = 'QT_ADIANTAMENTO'
      Origin = 'TCLIENTE_HABILITACAO.QT_ADIANTAMENTO'
    end
    object qry_cliente_hab_CD_DT_BASE_CAMBIO: TStringField
      FieldName = 'CD_DT_BASE_CAMBIO'
      Origin = 'TCLIENTE_HABILITACAO.CD_DT_BASE_CAMBIO'
      Size = 1
    end
    object qry_cliente_hab_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TCLIENTE_HABILITACAO.CD_TAB_SDA'
      Size = 3
    end
  end
  object qry_unid_neg_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM  TUNID_NEG_PRODUTO '
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND'
      '               CD_PRODUTO=:CD_PRODUTO'
      '')
    Left = 288
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
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
    object qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TUNID_NEG_PRODUTO.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      Origin = 'TUNID_NEG_PRODUTO.CD_UNID_NEG'
      BlobType = ftMemo
    end
  end
  object qry_numerario_: TQuery
    OnCalcFields = qry_numerario_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TNUMERARIO N '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      ( DT_SOLICITACAO = :DT_SOLIC OR'
      '        IN_EMITIDO = '#39'0'#39' )  AND'
      '      ( CD_STATUS ='#39'A'#39' OR CD_STATUS ='#39'B'#39' ) AND'
      '      VL_SOLICITADO >= 0'
      '')
    Left = 174
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_SOLIC'
        ParamType = ptInput
      end>
    object qry_numerario_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 18
    end
    object qry_numerario_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
    end
    object qry_numerario_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO.NR_SOLICITACAO'
      Size = 3
    end
    object qry_numerario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TNUMERARIO.CD_USUARIO'
      Size = 4
    end
    object qry_numerario_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO.CD_STATUS'
      Size = 1
    end
    object qry_numerario_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TNUMERARIO.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_numerario_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      Origin = 'TNUMERARIO.TX_NUMERARIO_ASS'
      BlobType = ftMemo
    end
    object qry_numerario_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_numerario_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO.VL_RECEBIDO'
    end
    object qry_numerario_QT_ITENS_SOLIC: TIntegerField
      FieldName = 'QT_ITENS_SOLIC'
      Origin = 'TNUMERARIO.QT_ITENS_SOLIC'
    end
    object qry_numerario_IN_EMITIDO: TStringField
      FieldName = 'IN_EMITIDO'
      Origin = 'TNUMERARIO.IN_EMITIDO'
      Size = 1
    end
    object qry_numerario_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'TNUMERARIO.DT_EMISSAO'
    end
    object qry_numerario_Calc_Nr_Processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Calc_Nr_Processo'
      Size = 9
      Calculated = True
    end
  end
  object ds_numerario: TDataSource
    DataSet = qry_numerario_
    Left = 52
    Top = 24
  end
  object qry_cont_num_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS QT_REGISTROS'
      'FROM TNUMERARIO N, TPROCESSO P'
      'WHERE N.NR_PROCESSO = P.NR_PROCESSO AND'
      'P.CD_UNID_NEG = :CD_UNID_NEG AND'
      'P.CD_PRODUTO = :CD_PRODUTO AND'
      'P.CD_CLIENTE = :CD_CLIENTE')
    Left = 288
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_cont_num_QT_REGISTROS: TIntegerField
      FieldName = 'QT_REGISTROS'
    end
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_REFERENCIA'
      'FROM TREF_CLIENTE'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_SEQUENCIA')
    Left = 288
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
  end
  object qry_avon_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select n.nr_processo, n.nr_solicitacao,'
      '       isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i, tgrupo_item_item g'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_processo = n.nr_processo and'
      '                        i.cd_item = g.cd_item and'
      
        '                        g.cd_grupo_item = :cd_grp_item_arm), 0) ' +
        'vl_armazen,'
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i, tgrupo_item_item g'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_processo = n.nr_processo and'
      '                        i.cd_item = g.cd_item and'
      
        '                        g.cd_grupo_item = :cd_grp_item_cap), 0) ' +
        'vl_cap,'
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i, tgrupo_item_item g'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_processo = n.nr_processo and'
      '                        i.cd_item = g.cd_item and'
      
        '                        g.cd_grupo_item = :cd_grp_item_frete), 0' +
        ') vl_frete,'
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_solicitacao = n.nr_solicitacao and'
      '                        i.cd_item = :cd_item_icms), 0) vl_icms,'
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_solicitacao = n.nr_solicitacao and'
      '                        i.cd_item = :cd_item_ii), 0) vl_ii,'
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_solicitacao = n.nr_solicitacao and'
      '                        i.cd_item = :cd_item_ipi), 0) vl_ipi,'
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_solicitacao = n.nr_solicitacao and'
      
        '                        i.cd_item = :cd_item_afrmm), 0) vl_afrmm' +
        #39','
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_solicitacao = n.nr_solicitacao and'
      '                        i.cd_item = :cd_item_sda), 0) vl_sda,'
      '        isnull((Select sum(vl_solicitado)'
      '                from tnumerario_item_solic i'
      '                where '#9'i.nr_processo = n.nr_processo and'
      '                        i.nr_solicitacao = n.nr_solicitacao and'
      
        '                        i.cd_item = :cd_item_siscomex), 0) vl_si' +
        'scomex'
      'from tnumerario n'
      'where '#9'n.nr_processo = :nr_processo and'
      #9'n.nr_solicitacao = :nr_solicitacao')
    Left = 288
    Top = 299
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_grp_item_arm'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_grp_item_cap'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_grp_item_frete'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_item_icms'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_item_ii'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_item_ipi'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_item_afrmm'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_item_sda'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cd_item_siscomex'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nr_solicitacao'
        ParamType = ptInput
      end>
    object qry_avon_nr_processo: TStringField
      FieldName = 'nr_processo'
      Size = 18
    end
    object qry_avon_nr_solicitacao: TStringField
      FieldName = 'nr_solicitacao'
      Size = 3
    end
    object qry_avon_vl_armazen: TFloatField
      FieldName = 'vl_armazen'
    end
    object qry_avon_vl_cap: TFloatField
      FieldName = 'vl_cap'
    end
    object qry_avon_vl_frete: TFloatField
      FieldName = 'vl_frete'
    end
    object qry_avon_vl_icms: TFloatField
      FieldName = 'vl_icms'
    end
    object qry_avon_vl_ii: TFloatField
      FieldName = 'vl_ii'
    end
    object qry_avon_vl_ipi: TFloatField
      FieldName = 'vl_ipi'
    end
    object qry_avon_vl_afrmm: TFloatField
      FieldName = 'vl_afrmm'
    end
    object qry_avon_vl_sda: TFloatField
      FieldName = 'vl_sda'
    end
    object qry_avon_vl_siscomex: TFloatField
      FieldName = 'vl_siscomex'
    end
  end
  object qry_numerario_item_: TQuery
    OnCalcFields = qry_numerario_item_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, N.DT_SOLICITACAO, I.CD_ITEM, A.NM_ITEM, A.' +
        'NM_APELIDO,'
      '               B.IN_SM, B.NR_BANCO, B.CD_AGENCIA,'
      '               SUM(I.VL_SOLICITADO) VL_TOT_ITEM'
      'FROM TPROCESSO P,'
      '           TNUMERARIO N,'
      '           TNUMERARIO_ITEM_SOLIC I,'
      '           TITEM A,'
      '           TBANCO B'
      'WHERE P.NR_PROCESSO = I.NR_PROCESSO AND'
      '               I.NR_PROCESSO = N.NR_PROCESSO AND'
      '               I.NR_SOLICITACAO = N.NR_SOLICITACAO AND'
      '               I.CD_ITEM = A.CD_ITEM AND'
      '               I.CD_BANCO = B.CD_BANCO AND'
      '               P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '               P.CD_PRODUTO = :CD_PRODUTO AND'
      '               P.CD_CLIENTE = :CD_CLIENTE AND'
      '               N.IN_EMITIDO = '#39'0'#39'   AND'
      '               ( I.CD_STATUS ='#39'A'#39' OR I.CD_STATUS ='#39'B'#39' ) AND'
      '               I.VL_SOLICITADO > 0 '
      
        'GROUP BY P.NR_PROCESSO, N.DT_SOLICITACAO, I.CD_ITEM, A.NM_ITEM, ' +
        'A.NM_APELIDO,'
      '               B.IN_SM, B.NR_BANCO, B.CD_AGENCIA'
      '')
    Left = 174
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_numerario_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_numerario_item_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
    end
    object qry_numerario_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_numerario_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Size = 30
    end
    object qry_numerario_item_NM_APELIDO: TStringField
      FieldName = 'NM_APELIDO'
      Size = 10
    end
    object qry_numerario_item_IN_SM: TStringField
      FieldName = 'IN_SM'
      Size = 1
    end
    object qry_numerario_item_VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object qry_numerario_item_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object qry_numerario_item_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Size = 5
    end
    object qry_numerario_item_CalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 9
      Calculated = True
    end
  end
  object sp_atz_num_imp: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_num_imp'
    Left = 288
    Top = 353
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_apaga_dados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TNUMERARIO_IMP'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Left = 288
    Top = 412
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptInput
      end>
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
  object qry_cliente_contato_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_empresa_nac
    SQL.Strings = (
      'SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, NM_CONTATO, NR_FAX'
      'FROM TCLIENTE_CONTATO'
      'WHERE CD_CLIENTE = :CD_EMPRESA')
    Left = 174
    Top = 412
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qry_cliente_contato_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_contato_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_CONTATO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_contato_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_CONTATO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_contato_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'TCLIENTE_CONTATO.NM_CONTATO'
      Size = 50
    end
    object qry_cliente_contato_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'TCLIENTE_CONTATO.NR_FAX'
      Size = 15
    end
  end
  object qry_fob_: TQuery
    OnCalcFields = qry_fob_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_proc_distintos
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, ISNULL( P.VL_MLE_MN, 0 ) VL_MLE_MN, ISNULL' +
        '( D.TX_DOLAR, 0 ) TX_DOLAR'
      'FROM TPROCESSO P'
      'LEFT JOIN TDECLARACAO_IMPORTACAO D'
      '       ON (P.NR_PROCESSO = D.NR_PROCESSO)'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO')
    Left = 288
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_fob_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_fob_VL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
    end
    object qry_fob_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object qry_fob_CalcValorFOB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcValorFOB'
      Calculated = True
    end
  end
  object ds_numerario_item: TDataSource
    DataSet = qry_numerario_item_
    Left = 52
    Top = 80
  end
  object qry_itens_distintos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT I.CD_ITEM, A.NM_APELIDO'
      'FROM TPROCESSO P,'
      '           TNUMERARIO N,'
      '           TNUMERARIO_ITEM_SOLIC I,'
      '           TITEM A,'
      '           TBANCO B'
      'WHERE P.NR_PROCESSO = I.NR_PROCESSO AND'
      '               I.NR_PROCESSO = N.NR_PROCESSO AND'
      '               I.NR_SOLICITACAO = N.NR_SOLICITACAO AND'
      '               I.CD_ITEM = A.CD_ITEM AND'
      '               I.CD_BANCO = B.CD_BANCO AND'
      '               P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '               P.CD_PRODUTO = :CD_PRODUTO AND'
      '               P.CD_CLIENTE = :CD_CLIENTE AND'
      '               N.IN_EMITIDO = '#39'0'#39'   AND'
      '               ( I.CD_STATUS ='#39'A'#39' OR I.CD_STATUS ='#39'B'#39' ) AND'
      '               I.VL_SOLICITADO > 0'
      '')
    Left = 406
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_itens_distintos_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_itens_distintos_NM_APELIDO: TStringField
      FieldName = 'NM_APELIDO'
      Size = 10
    end
  end
  object qry_proc_item_num_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, N.DT_SOLICITACAO, I.CD_ITEM, A.NM_ITEM, A.' +
        'NM_APELIDO,'
      '               B.IN_SM, B.NR_BANCO, B.CD_AGENCIA,'
      '               SUM(I.VL_SOLICITADO) VL_TOT_ITEM'
      'FROM TPROCESSO P,'
      '           TNUMERARIO N,'
      '           TNUMERARIO_ITEM_SOLIC I,'
      '           TITEM A,'
      '           TBANCO B'
      'WHERE P.NR_PROCESSO = I.NR_PROCESSO AND'
      '               I.NR_PROCESSO = N.NR_PROCESSO AND'
      '               I.NR_SOLICITACAO = N.NR_SOLICITACAO AND'
      '               I.CD_ITEM = A.CD_ITEM AND'
      '               I.CD_BANCO = B.CD_BANCO AND'
      '               N.IN_EMITIDO = '#39'0'#39'   AND'
      '               ( I.CD_STATUS ='#39'A'#39' OR I.CD_STATUS ='#39'B'#39' ) AND'
      '               I.VL_SOLICITADO > 0 AND'
      #9'       P.NR_PROCESSO = :NR_PROCESSO AND'
      #9'       I.CD_ITEM = :CD_ITEM'
      
        'GROUP BY P.NR_PROCESSO, N.DT_SOLICITACAO, I.CD_ITEM, A.NM_ITEM, ' +
        'A.NM_APELIDO,'
      '               B.IN_SM, B.NR_BANCO, B.CD_AGENCIA'
      '')
    Left = 406
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptInput
      end>
    object StringField11: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
    end
    object StringField12: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object StringField13: TStringField
      FieldName = 'NM_ITEM'
      Size = 30
    end
    object StringField14: TStringField
      FieldName = 'NM_APELIDO'
      Size = 10
    end
    object StringField15: TStringField
      FieldName = 'IN_SM'
      Size = 1
    end
    object qry_proc_item_num_VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object StringField16: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object StringField17: TStringField
      FieldName = 'CD_AGENCIA'
      Size = 5
    end
    object StringField18: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 9
      Calculated = True
    end
  end
  object qry_proc_distintos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT P.NR_PROCESSO'
      'FROM TPROCESSO P,'
      '           TNUMERARIO N,'
      '           TNUMERARIO_ITEM_SOLIC I,'
      '           TITEM A,'
      '           TBANCO B'
      'WHERE P.NR_PROCESSO = I.NR_PROCESSO AND'
      '               I.NR_PROCESSO = N.NR_PROCESSO AND'
      '               I.NR_SOLICITACAO = N.NR_SOLICITACAO AND'
      '               I.CD_ITEM = A.CD_ITEM AND'
      '               I.CD_BANCO = B.CD_BANCO AND'
      '               P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '               P.CD_PRODUTO = :CD_PRODUTO AND'
      '               P.CD_CLIENTE = :CD_CLIENTE AND'
      '               N.IN_EMITIDO = '#39'0'#39'   AND'
      '               ( I.CD_STATUS ='#39'A'#39' OR I.CD_STATUS ='#39'B'#39' ) AND'
      '               I.VL_SOLICITADO > 0'
      '')
    Left = 406
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    object qry_proc_distintos_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
  end
  object ds_proc_distintos: TDataSource
    DataSet = qry_proc_distintos_
    Left = 288
    Top = 24
  end
end

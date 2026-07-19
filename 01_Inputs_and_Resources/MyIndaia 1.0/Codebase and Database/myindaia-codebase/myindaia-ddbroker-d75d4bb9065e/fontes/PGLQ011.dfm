object datm_liq: Tdatm_liq
  OldCreateOrder = True
  Left = 318
  Top = 313
  Height = 368
  Width = 659
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG IN'
      '              ( SELECT CD_UNID_NEG'
      '                FROM TUSUARIO_HABILITACAO (NOLOCK)'
      '                WHERE CD_USUARIO = :CD_USUARIO ) AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       IN_ATIVO = '#39'1'#39)
    Left = 242
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  CD_PRODUTO IN'
      '              ( SELECT CD_PRODUTO'
      '                FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '                WHERE  CD_USUARIO = :CD_USUARIO ) AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       IN_ATIVO = '#39'1'#39)
    Left = 242
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO (NOLOCK)'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Left = 562
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
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
  end
  object qry_fs_fatura_: TQuery
    AfterOpen = qry_fs_fatura_AfterOpen
    AfterPost = qry_fs_fatura_AfterPost
    OnCalcFields = qry_fs_fatura_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_SOLICITACAO, F.DT_FATUR' +
        'A, F.TP_TIPO_FAT,'
      
        '       F.NR_NOTA_FATURA, F.VL_FATURA, F.VL_LIQUIDACAO, A.NR_PROC' +
        'ESSO,'
      
        '       A.VL_FATURA VL_FATURA_PROC, A.VL_LIQUIDACAO VL_LIQUIDACAO' +
        '_PROC, E.NM_EMPRESA, E.CD_GRUPO'
      'FROM   TS_FATURA F (NOLOCK),'
      '       TS_FATURA_PROCESSO A (NOLOCK),'
      '       TPROCESSO P (NOLOCK),'
      '       TEMPRESA_NAC E (NOLOCK)'
      'WHERE  F.CD_UNID_NEG = A.CD_UNID_NEG AND'
      '       F.CD_PRODUTO = A.CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = A.NR_SOLICITACAO AND'
      '       A.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       F.IN_CANCELADO = '#39'0'#39' AND'
      '       F.IN_LIQUIDADO = '#39'0'#39' AND'
      '       ( ( ISNULL( F.NR_NOTA_FATURA, '#39#39' ) <> '#39#39' ) OR'
      '         ( ISNULL( F.NR_NF_SERV, '#39#39' ) <> '#39#39' ) ) AND'
      '       A.IN_LIQUIDADO = '#39'0'#39' AND'
      '       ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) AND'
      
        '       ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) ' +
        ') AND'
      
        '       ( ( ( NR_RELATORIO = :NR_RELATORIO ) AND ( NR_ANO = :NR_A' +
        'NO ) ) AND'
      '         ( ( :CD_GRUPO <> '#39#39' ) OR ( :CD_CLIENTE <> '#39#39' ) ) OR'
      '         ( ( :NR_RELATORIO = '#39#39' ) AND ( :NR_ANO = '#39#39' ) ) ) AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      
        '       ( ( P.CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) ' +
        ') AND'
      '       ( ( F.VL_FATURA <> 0 ) OR'
      '         ( A.VL_FATURA <> 0 ) )'
      'ORDER BY'
      '  F.DT_FATURA')
    Left = 124
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_fs_fatura_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA.NR_SOLICITACAO'
      Size = 6
    end
    object qry_fs_fatura_DT_FATURA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_FATURA'
      Origin = 'TS_FATURA.DT_FATURA'
    end
    object qry_fs_fatura_TP_TIPO_FAT: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TP_TIPO_FAT'
      Origin = 'TS_FATURA.TP_TIPO_FAT'
      Size = 1
    end
    object qry_fs_fatura_NR_NOTA_FATURA: TStringField
      DisplayLabel = 'Nota'
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
    object qry_fs_fatura_VL_FATURA: TFloatField
      DisplayLabel = 'Valor Fatura'
      FieldName = 'VL_FATURA'
      Origin = 'TS_FATURA.VL_FATURA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fs_fatura_VL_LIQUIDACAO: TFloatField
      FieldName = 'VL_LIQUIDACAO'
      Origin = 'TS_FATURA.VL_LIQUIDACAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fs_fatura_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TS_FATURA_PROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_fs_fatura_VL_FATURA_PROC: TFloatField
      DisplayLabel = 'Valor Fatura Processo'
      FieldName = 'VL_FATURA_PROC'
      Origin = 'TS_FATURA_PROCESSO.VL_FATURA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fs_fatura_VL_LIQUIDACAO_PROC: TFloatField
      DisplayLabel = 'Valor Liquida'#231#227'o'
      FieldName = 'VL_LIQUIDACAO_PROC'
      Origin = 'TS_FATURA_PROCESSO.VL_LIQUIDACAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fs_fatura_NR_PROCESSO_CALC: TStringField
      DisplayLabel = 'Processo'
      FieldKind = fkCalculated
      FieldName = 'NR_PROCESSO_CALC'
      Calculated = True
    end
    object qry_fs_fatura_CalcNrSolicitacao: TStringField
      DisplayLabel = 'N'#186' Solic'
      FieldKind = fkCalculated
      FieldName = 'CalcNrSolicitacao'
      Size = 7
      Calculated = True
    end
    object qry_fs_fatura_NM_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_fs_fatura_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qry_fs_fatura_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_fs_fatura_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
  end
  object ds_fs_fatura: TDataSource
    DataSet = qry_fs_fatura_
    Left = 36
    Top = 20
  end
  object ds_liquidacao: TDataSource
    DataSet = qry_liquidacao_
    Left = 36
    Top = 68
  end
  object qry_nr_liquidacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_LIQUIDACAO'
      'FROM   TLIQUIDACAO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 443
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_nr_liquidacao_NR_LIQUIDACAO: TStringField
      FieldName = 'NR_LIQUIDACAO'
      Origin = 'TLIQUIDACAO.NR_LIQUIDACAO'
      Size = 3
    end
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO (NOLOCK)')
    Left = 242
    Top = 164
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM TYES_NO (NOLOCK)')
    Left = 338
    Top = 212
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 3
    end
  end
  object qry_forma_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_FORMA_PAGTO (NOLOCK)')
    Left = 338
    Top = 68
    object qry_forma_pagto_CD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      Origin = 'TTP_FORMA_PAGTO.CD_FORMA_PAGTO'
      Size = 1
    end
    object qry_forma_pagto_NM_FORMA_PAGTO: TStringField
      FieldName = 'NM_FORMA_PAGTO'
      Origin = 'TTP_FORMA_PAGTO.NM_FORMA_PAGTO'
    end
  end
  object qry_tp_liquidacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_LIQUIDACAO (NOLOCK)')
    Left = 338
    Top = 20
    object qry_tp_liquidacao_CD_TP_LIQUIDACAO: TStringField
      FieldName = 'CD_TP_LIQUIDACAO'
      Origin = 'TTP_LIQUIDACAO.CD_TP_LIQUIDACAO'
      Size = 1
    end
    object qry_tp_liquidacao_NM_TP_LIQUIDACAO: TStringField
      FieldName = 'NM_TP_LIQUIDACAO'
      Origin = 'TTP_LIQUIDACAO.NM_TP_LIQUIDACAO'
    end
  end
  object qry_rel_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT VL_REEMBOLSO'
      'FROM   TREL_FIN_CONTROLE (NOLOCK)'
      'WHERE  ( ( CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) )  AND'
      
        '       ( ( CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) ) ' +
        ' AND'
      
        '       ( ( NR_RELATORIO = :NR_RELATORIO ) AND ( NR_ANO = :NR_ANO' +
        ' ) AND'
      '         ( ( :CD_GRUPO <> '#39#39' ) OR ( :CD_CLIENTE <> '#39#39' ) ) )')
    Left = 338
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
  end
  object qry_caixa_ctrl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO'
      'FROM   TCAIXA_CONTROLE'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 443
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_existe_fav_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( F.CD_FAVORECIDO, '#39#39' ) CD_FAVORECIDO'
      'FROM   TFAVORECIDO F (NOLOCK), TEMPRESA_NAC E (NOLOCK)'
      'WHERE  E.CGC_EMPRESA = F.CGC_EMPRESA AND'
      '       E.CD_EMPRESA = :CD_CLIENTE AND'
      '       ISNULL( E.CGC_EMPRESA, '#39#39' ) <> '#39#39' AND'
      '       ISNULL( F.CGC_EMPRESA, '#39#39' ) <> '#39#39
      '')
    Left = 443
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
  end
  object qry_proc_rel_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MIN(FP.NR_PROCESSO) NR_PROCESSO'
      'FROM   TS_FATURA F (NOLOCK), TS_FATURA_PROCESSO FP,'
      '       TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK)'
      'WHERE  F.CD_UNID_NEG = FP.CD_UNID_NEG AND'
      '       F.CD_PRODUTO = FP.CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = FP.NR_SOLICITACAO AND'
      '       FP.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) AND'
      
        '       ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) ' +
        ') AND'
      '       F.NR_RELATORIO = :NR_RELATORIO AND F.NR_ANO = :NR_ANO'
      '')
    Left = 242
    Top = 212
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end>
  end
  object qry_cancela_liq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TLIQUIDACAO'
      'SET    IN_CANCELADO = '#39'1'#39','
      '       CD_CANCELADOR =  :CD_USUARIO,'
      '       DT_CANCELAMENTO =  GETDATE()'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LIQUIDACAO = :NR_LIQUIDACAO')
    Left = 443
    Top = 19
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LIQUIDACAO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TS_FATURA_PROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_soma_pend_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM( A.VL_FATURA ) VL_TOTAL'
      'FROM   TS_FATURA F (NOLOCK),'
      '       TS_FATURA_PROCESSO A,'
      '       TPROCESSO P (NOLOCK),'
      '       TEMPRESA_NAC E (NOLOCK)'
      'WHERE  F.CD_UNID_NEG = A.CD_UNID_NEG AND'
      '       F.CD_PRODUTO = A.CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = A.NR_SOLICITACAO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       F.IN_CANCELADO = '#39'0'#39' AND'
      '       F.IN_LIQUIDADO = '#39'0'#39' AND'
      '       ISNULL( F.NR_NOTA_FATURA, '#39#39' ) <> '#39#39' AND'
      '       A.NR_PROCESSO = P.NR_PROCESSO AND'
      '       A.IN_LIQUIDADO = '#39'0'#39' AND'
      '       ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) AND'
      
        '       ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) ' +
        ') AND'
      
        '       ( ( ( NR_RELATORIO = :NR_RELATORIO ) AND ( NR_ANO = :NR_A' +
        'NO ) ) AND'
      '         ( ( :CD_GRUPO <> '#39#39' ) OR ( :CD_CLIENTE <> '#39#39' ) ) OR'
      '         ( ( :NR_RELATORIO = '#39#39' ) AND ( :NR_ANO = '#39#39' ) ) ) AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      
        '       ( ( P.CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) ' +
        ')')
    Left = 124
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_soma_pend_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_soma_pend: TDataSource
    DataSet = qry_soma_pend_
    Left = 36
    Top = 116
  end
  object sp_liq_processo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_liq_processo'
    Left = 36
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_liquidacao'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_liquidacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_forma_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_relatorio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@tot_proc'
        ParamType = ptInput
      end>
  end
  object sp_liq_cancela: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_liq_cancela'
    Left = 124
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_liquidacao'
        ParamType = ptInput
      end>
  end
  object qry_soma_liq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL('
      '      ( SELECT ISNULL( SUM( L.VL_LIQUIDACAO ) * (-1), 0 )'
      
        '        FROM   TLIQUIDACAO L, TPROCESSO P (NOLOCK), TEMPRESA_NAC' +
        ' E (NOLOCK)'
      '        WHERE  L.NR_PROCESSO = P.NR_PROCESSO AND'
      '               P.CD_CLIENTE = E.CD_EMPRESA AND'
      '               L.IN_CANCELADO = '#39'0'#39' AND'
      '               ( L.CD_UNID_NEG = :CD_UNID_NEG ) AND'
      
        '               ( ( L.CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO' +
        ' = '#39#39' ) ) AND'
      
        '               ( ( L.NR_PROCESSO = :NR_PROCESSO ) OR ( :NR_PROCE' +
        'SSO = '#39#39' ) ) AND'
      
        '               ( ( L.DT_LIQUIDACAO = :DT_LIQUIDACAO ) OR ( :DT_L' +
        'IQUIDACAO = '#39#39' ) ) AND'
      
        '               ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ' +
        ') ) AND'
      
        '               ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE' +
        ' = '#39#39' ) ) AND'
      
        '               ( ( L.NR_RELATORIO = :NR_RELATORIO ) OR ( :NR_REL' +
        'ATORIO = '#39#39' ) ) AND'
      
        '               ( ( L.NR_ANO = :NR_ANO ) OR ( :NR_ANO = '#39#39' ) ) AN' +
        'D'
      '               L.TP_LIQUIDACAO = '#39'P'#39' ), 0 ) +'
      '      ISNULL('
      '      ( SELECT ISNULL( SUM( L.VL_LIQUIDACAO ), 0 )'
      
        '        FROM   TLIQUIDACAO L, TPROCESSO P (NOLOCK), TEMPRESA_NAC' +
        ' E (NOLOCK)'
      '        WHERE  L.NR_PROCESSO = P.NR_PROCESSO AND'
      '               P.CD_CLIENTE = E.CD_EMPRESA AND'
      '               L.IN_CANCELADO = '#39'0'#39' AND'
      '               ( L.CD_UNID_NEG = :CD_UNID_NEG ) AND'
      
        '               ( ( L.CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO' +
        ' = '#39#39' ) ) AND'
      
        '               ( ( L.NR_PROCESSO = :NR_PROCESSO ) OR ( :NR_PROCE' +
        'SSO = '#39#39' ) ) AND'
      
        '               ( ( L.DT_LIQUIDACAO = :DT_LIQUIDACAO ) OR ( :DT_L' +
        'IQUIDACAO = '#39#39' ) ) AND'
      
        '               ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ' +
        ') ) AND'
      
        '               ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE' +
        ' = '#39#39' ) ) AND'
      
        '               ( ( L.NR_RELATORIO = :NR_RELATORIO ) OR ( :NR_REL' +
        'ATORIO = '#39#39' ) ) AND'
      
        '               ( ( L.NR_ANO = :NR_ANO ) OR ( :NR_ANO = '#39#39' ) ) AN' +
        'D'
      '               L.TP_LIQUIDACAO = '#39'R'#39' ), 0 ) VL_TOTAL'
      
        'FROM   TLIQUIDACAO L, TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLO' +
        'CK)'
      'WHERE  L.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       L.IN_CANCELADO = '#39'0'#39' AND'
      '       ( L.CD_UNID_NEG = :CD_UNID_NEG ) AND'
      
        '       ( ( L.CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) ' +
        ') AND'
      
        '       ( ( L.NR_PROCESSO = :NR_PROCESSO ) OR ( :NR_PROCESSO = '#39#39 +
        ' ) ) AND'
      
        '       ( ( L.DT_LIQUIDACAO = :DT_LIQUIDACAO ) OR ( :DT_LIQUIDACA' +
        'O = '#39#39' ) ) AND'
      '       ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) AND'
      
        '       ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) ' +
        ') AND'
      
        '       ( ( L.NR_RELATORIO = :NR_RELATORIO ) OR ( :NR_RELATORIO =' +
        ' '#39#39' ) ) AND'
      '       ( ( L.NR_ANO = :NR_ANO ) OR ( :NR_ANO = '#39#39' ) )'
      '')
    Left = 124
    Top = 164
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end>
    object qry_soma_liq_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TLIQUIDACAO.VL_LIQUIDACAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_soma_liq: TDataSource
    DataSet = qry_soma_liq_
    Left = 36
    Top = 164
  end
  object qry_liquidacao_: TQuery
    AfterScroll = qry_liquidacao_AfterScroll
    OnCalcFields = qry_liquidacao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT L.NR_PROCESSO_LIQ AS NR_PROCESSO,'
      '       L.NR_LIQUIDACAO_LIQ AS NR_LIQUIDACAO,'
      '       L.DT_LIQUIDACAO,'
      '       L.TP_LIQUIDACAO,'
      '       SUM(L.VL_LIQUIDACAO) AS VL_LIQUIDACAO,'
      '       ISNULL(L.IN_CANCELADO, '#39'0'#39') AS IN_CANCELADO,'
      '       ISNULL(L.CD_CANCELADOR, '#39#39') AS CD_CANCELADOR,'
      '       L.DT_CANCELAMENTO,'
      '       ISNULL(L.CD_USUARIO, '#39#39') AS CD_USUARIO,'
      '       L.CD_UNID_NEG, L.CD_PRODUTO,'
      '       ISNULL(L.CD_FORMA_PAGTO, '#39#39') AS CD_FORMA_PAGTO,'
      '       ISNULL(L.CD_BANCO, '#39#39') AS CD_BANCO,'
      '       ISNULL(L.IN_TRANSFERIDO, '#39'0'#39') AS IN_TRANSFERIDO,'
      '       L.DT_TRANSFERENCIA,'
      '       ISNULL(L.DT_SOLIC_CH, '#39#39') AS DT_SOLIC_CH,'
      '       ISNULL(L.NR_SOLIC_CH, '#39#39') AS NR_SOLIC_CH'
      'FROM   TLIQUIDACAO L (NOLOCK)'
      
        ' LEFT JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = L.NR_PROCESSO' +
        '_LIQ'
      
        ' LEFT JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLIENT' +
        'E'
      'WHERE  ( L.CD_UNID_NEG = :CD_UNID_NEG ) AND'
      
        '       ( ( L.CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) ' +
        ') AND'
      
        '       ( ( L.NR_PROCESSO_LIQ = :NR_PROCESSO ) OR ( :NR_PROCESSO ' +
        '= '#39#39' ) ) AND'
      
        '       ( ( L.DT_LIQUIDACAO = :DT_LIQUIDACAO ) OR ( :DT_LIQUIDACA' +
        'O = '#39#39' ) ) AND'
      '       ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) AND'
      
        '       ( ( P.CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) ' +
        ') AND'
      
        '       ( ( L.NR_RELATORIO = :NR_RELATORIO ) OR ( :NR_RELATORIO =' +
        ' '#39#39' ) ) AND'
      '       ( ( L.NR_ANO = :NR_ANO ) OR ( :NR_ANO = '#39#39' ) )'
      ''
      
        'GROUP BY L.NR_PROCESSO_LIQ, L.NR_LIQUIDACAO_LIQ, L.DT_LIQUIDACAO' +
        ', L.TP_LIQUIDACAO, L.IN_CANCELADO,'
      
        '         L.CD_CANCELADOR, L.DT_CANCELAMENTO, L.CD_USUARIO, L.CD_' +
        'UNID_NEG, L.CD_PRODUTO, L.CD_FORMA_PAGTO, '
      
        '         L.CD_BANCO, L.IN_TRANSFERIDO, L.DT_TRANSFERENCIA, L.NR_' +
        'SOLIC_CH, L.DT_SOLIC_CH'
      'ORDER BY'
      'L.DT_LIQUIDACAO DESC')
    Left = 124
    Top = 68
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
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_LIQUIDACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptInput
      end>
    object qry_liquidacao_CalcProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcProcesso'
      Size = 14
      Calculated = True
    end
    object qry_liquidacao_CalcNrSolicFat: TStringField
      DisplayLabel = 'N'#186' Solic. Fat.'
      FieldKind = fkCalculated
      FieldName = 'CalcNrSolicFat'
      Size = 7
      Calculated = True
    end
    object qry_liquidacao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_liquidacao_NR_LIQUIDACAO: TStringField
      DisplayWidth = 6
      FieldName = 'NR_LIQUIDACAO'
      FixedChar = True
      Size = 6
    end
    object qry_liquidacao_DT_LIQUIDACAO: TDateTimeField
      FieldName = 'DT_LIQUIDACAO'
    end
    object qry_liquidacao_TP_LIQUIDACAO: TStringField
      FieldName = 'TP_LIQUIDACAO'
      FixedChar = True
      Size = 1
    end
    object qry_liquidacao_VL_LIQUIDACAO: TFloatField
      FieldName = 'VL_LIQUIDACAO'
    end
    object qry_liquidacao_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_liquidacao_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      FixedChar = True
      Size = 4
    end
    object qry_liquidacao_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qry_liquidacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_liquidacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_liquidacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_liquidacao_CD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      FixedChar = True
      Size = 1
    end
    object qry_liquidacao_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_liquidacao_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      FixedChar = True
      Size = 1
    end
    object qry_liquidacao_DT_TRANSFERENCIA: TDateTimeField
      FieldName = 'DT_TRANSFERENCIA'
    end
    object qry_liquidacao_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      FixedChar = True
      Size = 10
    end
    object qry_liquidacao_NR_SOLIC_CH: TStringField
      FieldName = 'NR_SOLIC_CH'
      FixedChar = True
      Size = 3
    end
    object qry_liquidacao_calcCheque: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCheque'
      Size = 6
      Calculated = True
    end
    object qry_liquidacao_calcCdCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCdCliente'
      Size = 5
      Calculated = True
    end
    object qry_liquidacao_calcNmCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNmCliente'
      Size = 50
      Calculated = True
    end
    object qry_liquidacao_calcUnid: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUnid'
      Size = 50
      Calculated = True
    end
    object qry_liquidacao_calcProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcProduto'
      Size = 50
      Calculated = True
    end
    object qry_liquidacao_calcFormaPagto: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcFormaPagto'
      Calculated = True
    end
    object qry_liquidacao_calcBanco: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcBanco'
      Size = 40
      Calculated = True
    end
    object qry_liquidacao_calcCancelador: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCancelador'
      Size = 50
      Calculated = True
    end
    object qry_liquidacao_calcCancelado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCancelado'
      Size = 1
      Calculated = True
    end
    object qry_liquidacao_calcTransferencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcTransferencia'
      Size = 1
      Calculated = True
    end
    object qry_liquidacao_calcUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUsuario'
      Size = 50
      Calculated = True
    end
    object qry_liquidacao_calcTpLiquidacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcTpLiquidacao'
      Calculated = True
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM   TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       IN_LIBERADO = '#39'1'#39' AND'
      '       IN_PRODUCAO = '#39'1'#39)
    Left = 242
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry_atz_fat_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TS_FATURA_PROCESSO'
      'SET    CD_USUARIO_LIQ = :CD_USUARIO'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       NR_SOLICITACAO = :NR_SOLICITACAO AND'
      '       NR_PROCESSO = :NR_PROCESSO')
    Left = 338
    Top = 164
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
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
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry_fat_notas_: TQuery
    OnCalcFields = qry_fat_notas_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT L.NR_PROCESSO, L.NR_LIQUIDACAO, L.DT_LIQUIDACAO, L.TP_LIQ' +
        'UIDACAO,'
      
        '       L.VL_LIQUIDACAO AS VL_LIQUIDACAO, L.IN_CANCELADO, L.CD_US' +
        'UARIO,'
      
        '       L.CD_UNID_NEG, L.CD_PRODUTO, L.NR_SOLIC_FAT AS NR_SOLICIT' +
        'ACAO'
      'FROM   TLIQUIDACAO L (NOLOCK)'
      'WHERE  L.NR_PROCESSO_LIQ = :NR_PROCESSO AND'
      '       L.NR_LIQUIDACAO_LIQ = :NR_LIQUIDACAO'
      'ORDER BY L.NR_PROCESSO_LIQ, L.NR_LIQUIDACAO_LIQ')
    Left = 124
    Top = 212
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LIQUIDACAO'
        ParamType = ptInput
      end>
    object qry_fat_notas_CalcProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcProcesso'
      Size = 14
      Calculated = True
    end
    object qry_fat_notas_CalcNrSolicFat: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrSolicFat'
      Size = 7
      Calculated = True
    end
    object qry_fat_notas_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_fat_notas_NR_LIQUIDACAO: TStringField
      DisplayWidth = 6
      FieldName = 'NR_LIQUIDACAO'
      FixedChar = True
      Size = 6
    end
    object qry_fat_notas_DT_LIQUIDACAO: TDateTimeField
      FieldName = 'DT_LIQUIDACAO'
    end
    object qry_fat_notas_TP_LIQUIDACAO: TStringField
      FieldName = 'TP_LIQUIDACAO'
      FixedChar = True
      Size = 1
    end
    object qry_fat_notas_VL_LIQUIDACAO: TFloatField
      FieldName = 'VL_LIQUIDACAO'
    end
    object qry_fat_notas_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_fat_notas_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_fat_notas_calcCancelado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCancelado'
      Size = 1
      Calculated = True
    end
    object qry_fat_notas_calcUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUsuario'
      Size = 100
      Calculated = True
    end
    object qry_fat_notas_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_fat_notas_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_fat_notas_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 6
    end
  end
  object ds_fat_notas: TDataSource
    DataSet = qry_fat_notas_
    Left = 36
    Top = 212
  end
  object qry_existe_fav_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( F.CD_FAVORECIDO, '#39#39' ) CD_FAVORECIDO'
      'FROM   TFAVORECIDO F (NOLOCK), TGRUPO G (NOLOCK)'
      'WHERE  G.CNPJ_GRUPO = F.CGC_EMPRESA AND'
      '       G.CD_GRUPO = :CD_GRUPO AND'
      '       ISNULL( G.CNPJ_GRUPO, '#39#39' ) <> '#39#39' AND'
      '       ISNULL( F.CGC_EMPRESA, '#39#39' ) <> '#39#39
      '')
    Left = 443
    Top = 212
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end>
  end
end

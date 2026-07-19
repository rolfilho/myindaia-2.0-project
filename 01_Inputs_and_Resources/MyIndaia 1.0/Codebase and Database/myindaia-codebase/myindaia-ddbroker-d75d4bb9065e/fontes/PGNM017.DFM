object datm_numerario: Tdatm_numerario
  Left = 19
  Top = 193
  Height = 315
  Width = 761
  object ds_tp_solic_inform: TDataSource
    DataSet = tbl_tp_solic_inform_
    Left = 556
    Top = 164
  end
  object tbl_tp_solic_inform_: TTable
    DatabaseName = 'DBCAD'
    IndexFieldNames = 'CODIGO'
    TableName = 'TTP_SOLIC_INFORM'
    Left = 684
    Top = 164
  end
  object dsq_item_cd: TDataSource
    DataSet = qry_item_cd
    Left = 556
    Top = 12
  end
  object qry_item_cd: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM , CD_TIPO_ITEM, 1, CD_TIPO_LANC_FAT'
      'FROM TITEM TITEM'
      'WHERE (CD_TIPO_ITEM = '#39'D'#39') OR (CD_TIPO_ITEM = '#39'R'#39' ) '
      'ORDER BY CD_ITEM')
    Left = 684
    Top = 12
    object qry_item_cdCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_cdNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_cdCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_cdCD_TIPO_LANC_FAT: TStringField
      FieldName = 'CD_TIPO_LANC_FAT'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
    object qry_item_cdCOLUMN4: TIntegerField
      FieldName = 'COLUMN4'
    end
  end
  object dsq_item_nm: TDataSource
    DataSet = qry_item_nm
    Left = 556
    Top = 60
  end
  object qry_item_nm: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM , CD_TIPO_ITEM'
      'FROM TITEM TITEM'
      'WHERE (CD_TIPO_ITEM = '#39'D'#39') OR (CD_TIPO_ITEM = '#39'R'#39' ) '
      'ORDER BY NM_ITEM')
    Left = 684
    Top = 60
    object qry_item_nmCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_nmNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_nmCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 556
    Top = 216
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBCAD'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 684
    Top = 216
  end
  object dsq_itens_solinum: TDataSource
    DataSet = qry_itens_solinum_
    Left = 112
    Top = 236
  end
  object qry_itens_solinum_: TQuery
    OnCalcFields = qry_itens_solinum_CalcFields
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO , '
      ' NR_LANCAMENTO , CD_ITEM , NR_PRIORIDADE , '
      ' CD_TIPO_CALCULO , CD_BANCO , '
      ' VL_ITEM_CALCULADO , VL_SOLICITADO , '
      ' CD_STATUS , VL_RECEBIDO , VL_UTILIZADO'
      'FROM TNUMERARIO_ITEM_SOLIC TNUMERARIO_ITEM_SOLIC'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_SOLICITACAO = :NR_SOLICITACAO'
      '')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300000000E4E525F534F4C49
      4349544143414F0001020030000000}
    Left = 116
    Top = 172
    object qry_itens_solinum_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_solinum_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Nº Solic.'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_solinum_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_solinum_CD_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_solinum_NR_PRIORIDADE: TIntegerField
      DisplayLabel = 'Prioridade'
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PRIORIDADE'
    end
    object qry_itens_solinum_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField
      DisplayLabel = 'Calculado'
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
    end
    object qry_itens_solinum_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_solinum_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_solinum_VL_UTILIZADO: TFloatField
      DisplayLabel = 'Utilizado'
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_UTILIZADO'
      DisplayFormat = '#0,.00'
    end
    object qry_itens_solinum_status: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Calculated = True
    end
    object qry_itens_solinum_Look_nm_item: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_cd
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_solinum_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 3
    end
    object qry_itens_solinum_look_banco: TStringField
      FieldName = 'look_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 35
      Lookup = True
    end
  end
  object dsq_solinum: TDataSource
    DataSet = qry_solinum_
    Left = 24
    Top = 236
  end
  object qry_solinum_: TQuery
    OnCalcFields = qry_solinum_CalcFields
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO , '
      ' DT_SOLICITACAO , CD_USUARIO , CD_STATUS , '
      ' VL_SOLICITADO , VL_RECEBIDO, QT_ITENS_SOLIC'
      'FROM TNUMERARIO TNUMERARIO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 28
    Top = 172
    object qry_solinum_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 11
    end
    object qry_solinum_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Solicitação Nº'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO.NR_SOLICITACAO'
      Size = 3
    end
    object qry_solinum_DT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TNUMERARIO.DT_SOLICITACAO'
    end
    object qry_solinum_CD_USUARIO: TStringField
      DisplayLabel = 'Solicitante'
      FieldName = 'CD_USUARIO'
      Origin = 'TNUMERARIO.CD_USUARIO'
      Size = 4
    end
    object qry_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 1
    end
    object qry_solinum_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Vl. Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_solinum_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Vl. Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_solinum_QT_ITENS_SOLIC: TIntegerField
      FieldName = 'QT_ITENS_SOLIC'
      Origin = 'TNUMERARIO.NR_PROCESSO'
    end
    object qry_solinum_Look_ap_usuario2: TStringField
      DisplayLabel = 'Solicitante'
      FieldName = 'Look_ap_usuario'
      LookupDataSet = tbl_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Lookup = True
    end
    object qry_solinum_Status: TStringField
      FieldName = 'Status'
      Calculated = True
    end
  end
  object ds_usuario: TDataSource
    DataSet = tbl_usuario_
    Left = 556
    Top = 116
  end
  object tbl_usuario_: TTable
    DatabaseName = 'DBTABGSM'
    TableName = 'TUSUARIO'
    Left = 680
    Top = 116
    object tbl_usuario_CD_USUARIO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object tbl_usuario_AP_USUARIO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object tbl_usuario_NM_USUARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object tbl_usuario_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Size = 10
    end
    object tbl_usuario_CD_CARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CD_CARGO'
      Size = 3
    end
    object tbl_usuario_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object sp_soma_solinum_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'sp_soma_solinum'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000B406E725F736F6C696E756D0101020030000000}
    Left = 312
    Top = 212
    object StringField1: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_cancela_solicitacao_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'dbo.sp_cancela_solicitacao;1'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000F406E725F736F6C696369746163616F010102003000
      0000}
    Left = 324
    Top = 148
    object StringField7: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField8: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      'SELECT * FROM TBANCO')
    Left = 408
    Top = 176
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NR_CONTA'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 5
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 8
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.TP_CONTA'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_FINANCEIRO'
      Size = 1
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 408
    Top = 231
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBTABGSM'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 36
    Top = 12
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBTABGSM'
    SQL.Strings = (
      'SELECT *'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO IN '
      '              ( SELECT CD_PRODUTO'
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 36
    Top = 68
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBTABGSM'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Params.Data = {
      010003000A43445F5553554152494F00010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 152
    Top = 12
    object qry_usuario_habilitacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo: TQuery
    DatabaseName = 'DBPROCESSO'
    DataSource = ds_usuario_habilitacao
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_CLIENTE, P.CD_SERVICO,'
      '              C.AP_EMPRESA, S.NM_SERVICO'
      'FROM TPROCESSO P, CAD..TEMPRESA_NAC C, CAD..TSERVICO S'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '              (P.CD_UNID_NEG = :CD_UNID_NEG) AND'
      '              (P.CD_PRODUTO = :CD_PRODUTO)')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F0001020030000000}
    Left = 276
    Top = 8
  end
  object ds_usuario_habilitacao: TDataSource
    DataSet = qry_usuario_habilitacao_
    Left = 152
    Top = 68
  end
end

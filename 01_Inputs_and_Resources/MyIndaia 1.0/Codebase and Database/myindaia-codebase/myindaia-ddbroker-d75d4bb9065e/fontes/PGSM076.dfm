object datm_cliente_servico: Tdatm_cliente_servico
  OldCreateOrder = True
  Left = 310
  Top = 128
  Height = 440
  Width = 455
  object ds_cliente_servico: TDataSource
    DataSet = qry_cliente_servico_
    OnStateChange = ds_cliente_servicoStateChange
    Left = 54
    Top = 12
  end
  object qry_cliente_servico_: TQuery
    CachedUpdates = True
    BeforeOpen = qry_cliente_servico_BeforeOpen
    AfterScroll = qry_cliente_servico_AfterScroll
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_SERVICO'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO'
      ' AND ( IN_ATIVO = '#39'1'#39'  OR :IN_ATIVO is not null     )')
    UpdateObject = upd_cliente_servico
    Left = 176
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IN_ATIVO'
        ParamType = ptUnknown
      end>
    object qry_cliente_servico_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_servico_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_servico_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_SERVICO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_servico_CD_SERVICO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_SERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_cliente_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_SERVICO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_servico_NR_DPS: TStringField
      FieldName = 'NR_DPS'
      Origin = 'TCLIENTE_SERVICO.NR_DPS'
      Size = 8
    end
    object qry_cliente_servico_DT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_SERVICO.DT_CAPTACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_cliente_servico_PZ_PROPOSTA: TIntegerField
      FieldName = 'PZ_PROPOSTA'
      Origin = 'TCLIENTE_SERVICO.PZ_PROPOSTA'
    end
    object qry_cliente_servico_IN_INCIDE_SDA: TStringField
      FieldName = 'IN_INCIDE_SDA'
      Origin = 'TCLIENTE_SERVICO.IN_INCIDE_SDA'
      Size = 1
    end
    object qry_cliente_servico_DT_AUTORIZACAO: TDateTimeField
      FieldName = 'DT_AUTORIZACAO'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_cliente_servico_CD_PREFIXO: TStringField
      FieldName = 'CD_PREFIXO'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 2
    end
    object qry_cliente_servico_CD_BANCO_DEB_CC: TStringField
      FieldName = 'CD_BANCO_DEB_CC'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 3
    end
    object qry_cliente_servico_CD_BANCO_COM: TStringField
      FieldName = 'CD_BANCO_COM'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 3
    end
    object qry_cliente_servico_CD_BANCO_DEB_COM: TStringField
      FieldName = 'CD_BANCO_DEB_COM'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 3
    end
    object qry_cliente_servico_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_servico_LookUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_servico_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_servico_LookServico: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldKind = fkLookup
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
    object qry_cliente_servico_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_cliente_servico_LookIncideSDA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookIncideSDA'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_INCIDE_SDA'
      Size = 3
      Lookup = True
    end
    object qry_cliente_servico_LookBancoDebCC: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoDebCC'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO_DEB_CC'
      Size = 40
      Lookup = True
    end
    object qry_cliente_servico_LookBancoCom: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoCom'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO_COM'
      Size = 40
      Lookup = True
    end
    object qry_cliente_servico_LookBancoDebCom: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoDebCom'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO_DEB_COM'
      Size = 40
      Lookup = True
    end
    object qry_cliente_servico_IN_CPMF_NUM: TStringField
      FieldName = 'IN_CPMF_NUM'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_servico_LookCpmfNum: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCpmfNum'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CPMF_NUM'
      Size = 3
      Lookup = True
    end
    object qry_cliente_servico_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 3
    end
    object qry_cliente_servico_LookSDA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookSDA'
      LookupDataSet = qry_sda_
      LookupKeyFields = 'CD_SDA'
      LookupResultField = 'TX_DESCRICAO'
      KeyFields = 'CD_TAB_SDA'
      Size = 40
      Lookup = True
    end
    object qry_cliente_servico_IN_REL_VOL_MOD2: TStringField
      FieldName = 'IN_REL_VOL_MOD2'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_servico_IN_LANCA_SOLIC: TStringField
      FieldName = 'IN_LANCA_SOLIC'
      Origin = 'DBBROKER.TCLIENTE_SERVICO.IN_LANCA_SOLIC'
      Size = 1
    end
    object qry_cliente_servico_IN_HORA_EVENTOS: TBooleanField
      FieldName = 'IN_HORA_EVENTOS'
      Origin = 'DBBROKER.TCLIENTE_SERVICO.IN_HORA_EVENTOS'
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 54
    Top = 108
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 175
    Top = 108
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 54
    Top = 252
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 175
    Top = 252
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 54
    Top = 156
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 54
    Top = 204
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 175
    Top = 203
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
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG FROM'
      'TUNID_NEG')
    Left = 175
    Top = 156
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
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 54
    Top = 304
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO '
      'FROM VW_SERVICO_GERAL')
    Left = 175
    Top = 304
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'VW_SERVICO_GERAL.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'VW_SERVICO_GERAL.NM_SERVICO'
      Size = 50
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 54
    Top = 356
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TBANCO')
    Left = 175
    Top = 355
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
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.AP_BANCO'
      Size = 5
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.FORMCONT'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.LEXTENSO2'
      Size = 3
    end
  end
  object qry_exclui_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TCLIENTE_SERVICO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO AND'
      '               CD_CLIENTE = :CD_CLIENTE AND'
      '               CD_SERVICO = :CD_SERVICO'
      '               ')
    Left = 313
    Top = 205
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
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
  end
  object qry_tot_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) TOT_PROC'
      'FROM   TPROCESSO'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_SERVICO = :CD_SERVICO AND'
      '       IN_CANCELADO = '#39'0'#39)
    Left = 311
    Top = 109
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
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_tot_proc_TOT_PROC: TIntegerField
      FieldName = 'TOT_PROC'
    end
  end
  object qry_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SDA, TX_DESCRICAO'
      'FROM TSDA')
    Left = 313
    Top = 156
    object qry_sda_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Origin = 'TSDA.CD_SDA'
      Size = 3
    end
    object qry_sda_TX_DESCRICAO: TStringField
      FieldName = 'TX_DESCRICAO'
      Origin = 'TSDA.TX_DESCRICAO'
      Size = 50
    end
  end
  object dsClienteServicoFrete: TDataSource
    DataSet = qryClienteServicoFrete
    Left = 54
    Top = 60
  end
  object qryClienteServicoFrete: TQuery
    CachedUpdates = True
    BeforePost = qryClienteServicoFreteBeforePost
    AfterPost = qryClienteServicoFreteAfterPost
    AfterDelete = qryClienteServicoFreteAfterDelete
    OnCalcFields = qryClienteServicoFreteCalcFields
    OnNewRecord = qryClienteServicoFreteNewRecord
    OnUpdateError = qryClienteServicoFreteUpdateError
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_servico
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      '  FROM TCLIENTE_SERVICO_FRETE'
      ' WHERE CD_CLIENTE  = :CD_CLIENTE  AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO  = :CD_PRODUTO  AND'
      '       CD_SERVICO  = :CD_SERVICO')
    UpdateObject = updClienteServicoFrete
    Left = 176
    Top = 60
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryClienteServicoFreteCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TCLIENTE_SERVICO_FRETE.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryClienteServicoFreteCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCLIENTE_SERVICO_FRETE.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryClienteServicoFreteCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TCLIENTE_SERVICO_FRETE.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryClienteServicoFreteCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TCLIENTE_SERVICO_FRETE.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qryClienteServicoFreteCD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      Origin = 'DBBROKER.TCLIENTE_SERVICO_FRETE.CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qryClienteServicoFretecalcFRETE: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcFRETE'
      Size = 100
      Calculated = True
    end
  end
  object updClienteServicoFrete: TUpdateSQL
    ModifySQL.Strings = (
      'update TCLIENTE_SERVICO_FRETE'
      'set'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_TAB_FRETE = :CD_TAB_FRETE'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE')
    InsertSQL.Strings = (
      'insert into TCLIENTE_SERVICO_FRETE'
      
        '  (CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, CD_TAB_FRETE' +
        ')'
      'values'
      '  (:CD_CLIENTE, :CD_UNID_NEG, :CD_PRODUTO, :CD_SERVICO, '
      ':CD_TAB_FRETE)')
    DeleteSQL.Strings = (
      'delete from TCLIENTE_SERVICO_FRETE'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_TAB_FRETE = :OLD_CD_TAB_FRETE')
    Left = 312
    Top = 60
  end
  object upd_cliente_servico: TUpdateSQL
    ModifySQL.Strings = (
      'update TCLIENTE_SERVICO'
      'set'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  NR_DPS = :NR_DPS,'
      '  DT_CAPTACAO = :DT_CAPTACAO,'
      '  PZ_PROPOSTA = :PZ_PROPOSTA,'
      '  IN_INCIDE_SDA = :IN_INCIDE_SDA,'
      '  DT_AUTORIZACAO = :DT_AUTORIZACAO,'
      '  CD_PREFIXO = :CD_PREFIXO,'
      '  CD_BANCO_DEB_CC = :CD_BANCO_DEB_CC,'
      '  CD_BANCO_COM = :CD_BANCO_COM,'
      '  CD_BANCO_DEB_COM = :CD_BANCO_DEB_COM,'
      '  IN_CPMF_NUM = :IN_CPMF_NUM,'
      '  CD_TAB_SDA = :CD_TAB_SDA,'
      '  IN_REL_VOL_MOD2 = :IN_REL_VOL_MOD2,'
      '  IN_LANCA_SOLIC = :IN_LANCA_SOLIC,'
      '  IN_HORA_EVENTOS = :IN_HORA_EVENTOS'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    InsertSQL.Strings = (
      'insert into TCLIENTE_SERVICO'
      
        '  (CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, IN_ATIVO, NR' +
        '_DPS, DT_CAPTACAO, '
      
        '   PZ_PROPOSTA, IN_INCIDE_SDA, DT_AUTORIZACAO, CD_PREFIXO, CD_BA' +
        'NCO_DEB_CC, '
      
        '   CD_BANCO_COM, CD_BANCO_DEB_COM, IN_CPMF_NUM, CD_TAB_SDA, IN_R' +
        'EL_VOL_MOD2, '
      '   IN_LANCA_SOLIC, IN_HORA_EVENTOS)'
      'values'
      
        '  (:CD_CLIENTE, :CD_UNID_NEG, :CD_PRODUTO, :CD_SERVICO, :IN_ATIV' +
        'O, :NR_DPS, '
      
        '   :DT_CAPTACAO, :PZ_PROPOSTA, :IN_INCIDE_SDA, :DT_AUTORIZACAO, ' +
        ':CD_PREFIXO, '
      
        '   :CD_BANCO_DEB_CC, :CD_BANCO_COM, :CD_BANCO_DEB_COM, :IN_CPMF_' +
        'NUM, :CD_TAB_SDA, '
      '   :IN_REL_VOL_MOD2, :IN_LANCA_SOLIC, :IN_HORA_EVENTOS)')
    DeleteSQL.Strings = (
      'delete from TCLIENTE_SERVICO'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_SERVICO = :OLD_CD_SERVICO')
    Left = 272
    Top = 12
  end
end

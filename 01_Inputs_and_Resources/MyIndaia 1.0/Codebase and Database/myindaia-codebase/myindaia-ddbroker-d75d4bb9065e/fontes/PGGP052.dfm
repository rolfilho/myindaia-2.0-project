object datm_ajuste_impressao_boleto: Tdatm_ajuste_impressao_boleto
  Left = 530
  Top = 195
  Height = 240
  Width = 280
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM   TAJUSTE_IMPRESSAO_BOLETO'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       NR_BANCO = :NR_BANCO')
    Params.Data = {
      010002000B43445F554E49445F4E45470001020030000000084E525F42414E43
      4F0001020030000000}
    Left = 48
    Top = 18
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.CD_UNID_NEG'
      Size = 2
    end
    object qry_ajuste_impressao_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.NR_BANCO'
      Size = 3
    end
    object qry_ajuste_impressao_L_LOCAL_PAGTO: TStringField
      FieldName = 'L_LOCAL_PAGTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.L_LOCAL_PAGTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_LOCAL_PAGTO: TStringField
      FieldName = 'C_LOCAL_PAGTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_LOCAL_PAGTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_VENCTO: TStringField
      FieldName = 'C_DT_VENCTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_DT_VENCTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_DT_DOCTO: TStringField
      FieldName = 'L_DT_DOCTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.L_DT_DOCTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_DOCTO: TStringField
      FieldName = 'C_DT_DOCTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_DT_DOCTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_DOCTO: TStringField
      FieldName = 'C_NR_DOCTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_NR_DOCTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_DOCTO: TStringField
      FieldName = 'L_VL_DOCTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.L_VL_DOCTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_DOCTO: TStringField
      FieldName = 'C_VL_DOCTO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_VL_DOCTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_TX_INSTR: TStringField
      FieldName = 'L_TX_INSTR'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.L_TX_INSTR'
      Size = 3
    end
    object qry_ajuste_impressao_C_TX_INSTR: TStringField
      FieldName = 'C_TX_INSTR'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_TX_INSTR'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_FATURA: TStringField
      FieldName = 'L_NR_FATURA'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.L_NR_FATURA'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_FATURA: TStringField
      FieldName = 'C_NR_FATURA'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_NR_FATURA'
      Size = 3
    end
    object qry_ajuste_impressao_L_SACADO: TStringField
      FieldName = 'L_SACADO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.L_SACADO'
      Size = 3
    end
    object qry_ajuste_impressao_C_SACADO: TStringField
      FieldName = 'C_SACADO'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.C_SACADO'
      Size = 3
    end
    object qry_ajuste_impressao_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_ajuste_impressao_LookBanco: TStringField
      FieldName = 'LookBanco'
      LookupDataSet = qry_bco_
      LookupKeyFields = 'CD_BCO'
      LookupResultField = 'NM_BCO'
      KeyFields = 'NR_BANCO'
      Size = 50
      Lookup = True
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 48
    Top = 78
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_ajuste_impressao: TDataSource
    DataSet = qry_ajuste_impressao_
    Left = 172
    Top = 16
  end
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.CD_UNID_NEG, U.NM_UNID_NEG, A.NR_BANCO, B.NM_BCO'
      'FROM   TAJUSTE_IMPRESSAO_BOLETO A, TUNID_NEG U, TBCO B'
      'WHERE  A.CD_UNID_NEG *= U.CD_UNID_NEG AND'
      '       A.NR_BANCO *= B.CD_BCO')
    Left = 48
    Top = 139
    object qry_lista_CD_UNID_NEG: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lista_NM_UNID_NEG: TStringField
      DisplayLabel = 'Unidade de Negócio'
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_lista_NR_BANCO: TStringField
      DisplayLabel = 'Nº Bco.'
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object qry_lista_NM_BCO: TStringField
      DisplayLabel = 'Nome do Banco'
      FieldName = 'NM_BCO'
      Size = 50
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 172
    Top = 139
  end
  object qry_bco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BCO, NM_BCO'
      'FROM TBCO')
    Left = 172
    Top = 78
    object qry_bco_CD_BCO: TStringField
      FieldName = 'CD_BCO'
      Origin = 'TBCO.CD_BCO'
      Size = 3
    end
    object qry_bco_NM_BCO: TStringField
      FieldName = 'NM_BCO'
      Origin = 'TBCO.NM_BCO'
      Size = 50
    end
  end
end

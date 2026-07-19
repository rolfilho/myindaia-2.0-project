object datm_imp_darf: Tdatm_imp_darf
  Left = 320
  Top = 270
  Height = 491
  Width = 541
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_BANCO, NM_BANCO, IN_ATIVO, FORMCONT, LVALOR, CVALOR, L' +
        'EXTENSO, CEXTENSO,'
      
        'LFAVOR, CFAVOR, LEXTENSO2, CEXTENSO2, LCIDADE, CCIDADE, CDIA, CM' +
        'ES, CANO, ANOMASK,'
      'LCHEQUE, CCHEQUE, CBANCO, AP_BANCO  '
      'FROM TBANCO'
      'WHERE CD_BANCO = :CD_BANCO')
    Params.Data = {010001000843445F42414E434F0001020030000000}
    Left = 112
    Top = 20
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
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_FORMCONT: TBooleanField
      FieldName = 'FORMCONT'
      Origin = 'TBANCO.FORMCONT'
    end
    object qry_banco_LVALOR: TIntegerField
      FieldName = 'LVALOR'
      Origin = 'TBANCO.LVALOR'
    end
    object qry_banco_CVALOR: TIntegerField
      FieldName = 'CVALOR'
      Origin = 'TBANCO.CVALOR'
    end
    object qry_banco_LEXTENSO: TIntegerField
      FieldName = 'LEXTENSO'
      Origin = 'TBANCO.LEXTENSO'
    end
    object qry_banco_CEXTENSO: TIntegerField
      FieldName = 'CEXTENSO'
      Origin = 'TBANCO.CEXTENSO'
    end
    object qry_banco_LFAVOR: TIntegerField
      FieldName = 'LFAVOR'
      Origin = 'TBANCO.LFAVOR'
    end
    object qry_banco_CFAVOR: TIntegerField
      FieldName = 'CFAVOR'
      Origin = 'TBANCO.CFAVOR'
    end
    object qry_banco_LEXTENSO2: TIntegerField
      FieldName = 'LEXTENSO2'
      Origin = 'TBANCO.LEXTENSO2'
    end
    object qry_banco_CEXTENSO2: TIntegerField
      FieldName = 'CEXTENSO2'
      Origin = 'TBANCO.CEXTENSO2'
    end
    object qry_banco_LCIDADE: TIntegerField
      FieldName = 'LCIDADE'
      Origin = 'TBANCO.LCIDADE'
    end
    object qry_banco_CCIDADE: TIntegerField
      FieldName = 'CCIDADE'
      Origin = 'TBANCO.CCIDADE'
    end
    object qry_banco_CDIA: TIntegerField
      FieldName = 'CDIA'
      Origin = 'TBANCO.CDIA'
    end
    object qry_banco_CMES: TIntegerField
      FieldName = 'CMES'
      Origin = 'TBANCO.CMES'
    end
    object qry_banco_CANO: TIntegerField
      FieldName = 'CANO'
      Origin = 'TBANCO.CANO'
    end
    object qry_banco_ANOMASK: TStringField
      FieldName = 'ANOMASK'
      Origin = 'TBANCO.ANOMASK'
      Size = 4
    end
    object qry_banco_LCHEQUE: TIntegerField
      FieldName = 'LCHEQUE'
      Origin = 'TBANCO.LCHEQUE'
    end
    object qry_banco_CCHEQUE: TIntegerField
      FieldName = 'CCHEQUE'
      Origin = 'TBANCO.CCHEQUE'
    end
    object qry_banco_CBANCO: TIntegerField
      FieldName = 'CBANCO'
      Origin = 'TBANCO.CBANCO'
    end
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO = :CD_FAVORECIDO')
    Params.Data = {010001000D43445F4641564F52454349444F0001020030000000}
    Left = 112
    Top = 68
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object qry_solic_ch_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_SOLIC_CH, CD_FAVORECIDO, CD_BANCO, VL_SOLIC_CH,'
      'CD_STATUS_SOLIC_CH, CD_STATUS_CHEQUE, IN_EMITIR, NR_CHEQUE'
      'FROM TSOLIC_CHEQUE'
      'WHERE ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '               ( CD_BANCO = :CD_BANCO ) AND'
      
        '               ( CD_STATUS_SOLIC_CH = '#39'1'#39' OR CD_STATUS_SOLIC_CH ' +
        ' = '#39'3'#39' )  ')
    Params.Data = {
      010002000B44545F534F4C49435F434800010200300001000843445F42414E43
      4F0001020030000100}
    Left = 28
    Top = 20
    object qry_solic_ch_NR_SOLIC_CH: TStringField
      DisplayLabel = 'Solic'
      FieldName = 'NR_SOLIC_CH'
      Size = 3
    end
    object qry_solic_ch_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_solic_ch_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_solic_ch_VL_SOLIC_CH: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_ch_IN_EMITIR: TStringField
      FieldName = 'IN_EMITIR'
      Size = 1
    end
    object qry_solic_ch_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'AP_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_ch_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_ch_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStatus'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_CHEQUE'
      Size = 25
      Lookup = True
    end
    object qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField
      FieldName = 'CD_STATUS_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.CD_FAVORECIDO'
      Size = 1
    end
    object qry_solic_ch_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
      Size = 6
    end
  end
  object tbl_parametro_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TPARAMETROS'
    Left = 28
    Top = 68
    object tbl_parametro_DT_SOLIC_CH: TDateTimeField
      FieldName = 'DT_SOLIC_CH'
    end
    object tbl_parametro_NR_SOLIC_CH: TIntegerField
      FieldName = 'NR_SOLIC_CH'
      Required = True
    end
    object tbl_parametro_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Size = 5
    end
    object tbl_parametro_PATH_RELATORIOS: TStringField
      FieldName = 'PATH_RELATORIOS'
      Size = 100
    end
    object tbl_parametro_PATH_SISCOMEX: TStringField
      FieldName = 'PATH_SISCOMEX'
      Size = 100
    end
    object tbl_parametro_PATH_RISC: TStringField
      FieldName = 'PATH_RISC'
      Size = 100
    end
    object tbl_parametro_CD_INSTALACAO: TStringField
      FieldName = 'CD_INSTALACAO'
      Size = 1
    end
    object tbl_parametro_NM_SERVIDOR: TStringField
      FieldName = 'NM_SERVIDOR'
      Size = 15
    end
    object tbl_parametro_NM_CID_CHEQUE: TStringField
      FieldName = 'NM_CID_CHEQUE'
    end
    object tbl_parametro_CD_BANCO_CHEQUE: TStringField
      FieldName = 'CD_BANCO_CHEQUE'
      Size = 3
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO, CNPJ_GRUPO'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 131
    Top = 194
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
    object qry_grupo_CNPJ_GRUPO: TStringField
      FieldName = 'CNPJ_GRUPO'
      Origin = 'TGRUPO.CNPJ_GRUPO'
      Size = 14
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, NR_FONE'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 36
    Top = 137
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
    object qry_unid_neg_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 36
    Top = 194
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
      
        'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CGC_EMPRESA, END_CIDA' +
        'DE'
      'FROM   TEMPRESA_NAC'
      'WHERE  CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 131
    Top = 137
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
    object qry_cliente_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 30
    end
    object qry_cliente_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 14
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.VL_CIF_MN, R.CD_REFERENCI' +
        'A, D.CD_URF_DESPACHO,'
      '       U.CD_DIGITO, D.NR_DCTO_CARGA, D.NR_DCTO_CARGA_MAST'
      
        'FROM   TPROCESSO P, TREF_CLIENTE R, TDECLARACAO_IMPORTACAO D, TU' +
        'RF U'
      'WHERE  P.NR_PROCESSO *= R.NR_PROCESSO AND'
      '       P.NR_PROCESSO = D.NR_PROCESSO AND'
      '       D.CD_URF_DESPACHO = U.CODIGO AND '
      '       R.NR_SEQUENCIA = '#39'01'#39' AND'
      '       P.NR_PROCESSO = :NR_PROCESSO  AND'
      '       P.IN_LIBERADO = '#39'1'#39' AND'
      '       P.IN_CANCELADO = '#39'0'#39' AND'
      '       P.IN_PRODUCAO = '#39'1'#39
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 218
    Top = 137
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object qry_processo_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'TPROCESSO.CD_UNID_NEG'
    end
    object qry_processo_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Size = 15
    end
    object qry_processo_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object qry_processo_CD_DIGITO: TStringField
      FieldName = 'CD_DIGITO'
      Size = 1
    end
    object qry_processo_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Size = 30
    end
    object qry_processo_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Size = 30
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT S.CD_VIA_TRANSPORTE'
      'FROM TSERVICO S, TPROCESSO P'
      'WHERE P.CD_SERVICO  = S.CD_SERVICO AND'
      '      P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 128
    Top = 256
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_VIA_TRANSPORTE'
      Size = 2
    end
  end
  object rp_darf: TRAWPrinter
    LinhasPorPagina = 67
    Impressora = HPDeskJet
    Left = 296
    Top = 96
  end
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TAJUSTE_IMPRESSAO_DARF'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CD_DOCUMENTO = :CD_DOCUMENTO')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000C43445F444F4355
      4D454E544F0001020030000000}
    Left = 219
    Top = 66
    object qry_ajuste_impressao_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_UNID_NEG'
      Size = 2
    end
    object qry_ajuste_impressao_L_PERIODO: TStringField
      FieldName = 'L_PERIODO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_PERIODO'
      Size = 3
    end
    object qry_ajuste_impressao_C_PERIODO: TStringField
      FieldName = 'C_PERIODO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_PERIODO'
      Size = 3
    end
    object qry_ajuste_impressao_L_CPF_CNPJ: TStringField
      FieldName = 'L_CPF_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_CPF_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_C_CPF_CNPJ: TStringField
      FieldName = 'C_CPF_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_CPF_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_L_N_REF: TStringField
      FieldName = 'L_N_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_N_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_N_REF: TStringField
      FieldName = 'C_N_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_N_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_RECEITA: TStringField
      FieldName = 'C_CD_RECEITA'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_CD_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_REF: TStringField
      FieldName = 'L_NR_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_NR_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_REF: TStringField
      FieldName = 'C_NR_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_NR_REF'
      Size = 3
    end
    object qry_ajuste_impressao_L_S_REF: TStringField
      FieldName = 'L_S_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_S_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_S_REF: TStringField
      FieldName = 'C_S_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_S_REF'
      Size = 3
    end
    object qry_ajuste_impressao_L_IMPORTADOR: TStringField
      FieldName = 'L_IMPORTADOR'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_IMPORTADOR'
      Size = 3
    end
    object qry_ajuste_impressao_C_IMPORTADOR: TStringField
      FieldName = 'C_IMPORTADOR'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_IMPORTADOR'
      Size = 3
    end
    object qry_ajuste_impressao_L_TEL_UNIDADE: TStringField
      FieldName = 'L_TEL_UNIDADE'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_TEL_UNIDADE'
      Size = 3
    end
    object qry_ajuste_impressao_C_TEL_UNIDADE: TStringField
      FieldName = 'C_TEL_UNIDADE'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_TEL_UNIDADE'
      Size = 3
    end
    object qry_ajuste_impressao_L_MASTER: TStringField
      FieldName = 'L_MASTER'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_MASTER'
      Size = 3
    end
    object qry_ajuste_impressao_C_MASTER: TStringField
      FieldName = 'C_MASTER'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_MASTER'
      Size = 3
    end
    object qry_ajuste_impressao_C_FILHOTE: TStringField
      FieldName = 'C_FILHOTE'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_FILHOTE'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_PRINC: TStringField
      FieldName = 'C_VL_PRINC'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_PRINC'
      Size = 3
    end
    object qry_ajuste_impressao_L_LINHA_MOTIVO1: TStringField
      FieldName = 'L_LINHA_MOTIVO1'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_LINHA_MOTIVO1'
      Size = 3
    end
    object qry_ajuste_impressao_C_LINHA_MOTIVO1: TStringField
      FieldName = 'C_LINHA_MOTIVO1'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_LINHA_MOTIVO1'
      Size = 3
    end
    object qry_ajuste_impressao_L_LINHA_MOTIVO2: TStringField
      FieldName = 'L_LINHA_MOTIVO2'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_LINHA_MOTIVO2'
      Size = 3
    end
    object qry_ajuste_impressao_C_LINHA_MOTIVO2: TStringField
      FieldName = 'C_LINHA_MOTIVO2'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_LINHA_MOTIVO2'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_JUROS: TStringField
      FieldName = 'L_VL_JUROS'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_VL_JUROS'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_JUROS: TStringField
      FieldName = 'C_VL_JUROS'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_JUROS'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_TOTAL: TStringField
      FieldName = 'L_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_TOTAL: TStringField
      FieldName = 'C_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_MULTA: TStringField
      FieldName = 'C_VL_MULTA'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_MULTA'
      Size = 3
    end
    object qry_ajuste_impressao_L_DT_VENCTO: TStringField
      FieldName = 'L_DT_VENCTO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_VENCTO: TStringField
      FieldName = 'C_DT_VENCTO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_UNID_NEG'
      Size = 3
    end
  end
end

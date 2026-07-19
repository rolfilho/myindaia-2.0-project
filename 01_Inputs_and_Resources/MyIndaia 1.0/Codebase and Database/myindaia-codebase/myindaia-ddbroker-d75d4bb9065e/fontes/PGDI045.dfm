object datm_DI_saida: Tdatm_DI_saida
  OldCreateOrder = True
  Left = 256
  Top = 126
  Height = 504
  Width = 686
  object qry_grid_di_: TQuery
    OnCalcFields = qry_grid_di_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_IMPORTADOR, NM_EMPRESA'
      'FROM TDECLARACAO_IMPORTACAO, TEMPRESA_NAC'
      'WHERE CD_EMPRESA = CD_IMPORTADOR'
      'ORDER BY NR_PROCESSO')
    Left = 130
    Top = 22
    object qry_grid_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_grid_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_grid_di_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_grid_di_CalcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
  end
  object ds_grid_di: TDataSource
    DataSet = qry_grid_di_
    Left = 38
    Top = 22
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_grid_di
    SQL.Strings = (
      'SELECT *'
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 130
    Top = 75
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_di_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_APLICACAO_MERC'
      Size = 1
    end
    object qry_di_CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object qry_di_CD_COBERTURA_CAMBIAL: TStringField
      FieldName = 'CD_COBERTURA_CAMBIAL'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_COBERTURA_CAMBIAL'
      Size = 1
    end
    object qry_di_CD_DESTAQUE_NCM: TStringField
      FieldName = 'CD_DESTAQUE_NCM'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_DESTAQUE_NCM'
      Size = 3
    end
    object qry_di_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object qry_di_CD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FUND_LEGAL_II'
      Size = 2
    end
    object qry_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_di_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_INCOTERM'
      Size = 3
    end
    object qry_di_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object qry_di_CD_METODO_VALORACAO: TStringField
      FieldName = 'CD_METODO_VALORACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_METODO_VALORACAO'
      Size = 2
    end
    object qry_di_CD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MODALIDADE_DESP'
      Size = 1
    end
    object qry_di_CD_MODALIDADE_PAGTO: TStringField
      FieldName = 'CD_MODALIDADE_PAGTO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MODALIDADE_PAGTO'
      Size = 2
    end
    object qry_di_CD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_DESPESAS'
      Size = 3
    end
    object qry_di_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_di_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_di_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_di_CD_MOTIVO_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOTIVO_SEM_COBERTURA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOTIVO_SEM_COBERTURA'
      Size = 2
    end
    object qry_di_CD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOTIVO_TRANS'
      Size = 1
    end
    object qry_di_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object qry_di_CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object qry_di_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_RECINTO_ALFAND'
      Size = 7
    end
    object qry_di_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_REG_TRIB_II'
      Size = 1
    end
    object qry_di_CD_REG_TRIB_IPI: TStringField
      FieldName = 'CD_REG_TRIB_IPI'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_REG_TRIB_IPI'
      Size = 1
    end
    object qry_di_CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object qry_di_CD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_AG_CARGA'
      Size = 1
    end
    object qry_di_CD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_CONSIG'
      Size = 1
    end
    object qry_di_CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object qry_di_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_DECLARACAO'
      Size = 2
    end
    object qry_di_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qry_di_CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_MANIFESTO'
      Size = 1
    end
    object qry_di_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TRANSPORTADOR'
      Size = 4
    end
    object qry_di_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_di_CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_URF_ENTR_CARGA'
      Size = 7
    end
    object qry_di_CD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object qry_di_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object qry_di_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object qry_di_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_CHEGADA_CARGA'
      Size = 8
    end
    object qry_di_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_EMBARQUE'
      Size = 8
    end
    object qry_di_DT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_PROCESSAMENTO'
      Size = 8
    end
    object qry_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_REGISTRO_DI'
      Size = 8
    end
    object qry_di_DT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_TRANSMISSAO'
      Size = 8
    end
    object qry_di_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_BEM_ENCOMENDA'
    end
    object qry_di_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MATERIAL_USADO'
    end
    object qry_di_IN_MOEDA_NACIONAL: TStringField
      FieldName = 'IN_MOEDA_NACIONAL'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MOEDA_NACIONAL'
      Size = 1
    end
    object qry_di_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MOEDA_UNICA'
    end
    object qry_di_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_MULTIMODAL'
    end
    object qry_di_IN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_OPERACAO_FUNDAP'
    end
    object qry_di_IN_RATEAR_FRETE_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_FRETE_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RATEAR_FRETE_ITENS'
    end
    object qry_di_IN_RATEAR_SEGURO_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_SEGURO_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RATEAR_SEGURO_ITENS'
    end
    object qry_di_IN_REPASSA_DADOS_ADICAO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_ADICAO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_REPASSA_DADOS_ADICAO'
    end
    object qry_di_IN_REPASSA_DADOS_CAMBIO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_CAMBIO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_REPASSA_DADOS_CAMBIO'
    end
    object qry_di_NM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NM_CONSIGNATARIO'
      Size = 60
    end
    object qry_di_NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NM_VEICULO_TRANSP'
      Size = 30
    end
    object qry_di_NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_AGENTE_CARGA'
      Size = 14
    end
    object qry_di_NR_BANCO_COM: TStringField
      FieldName = 'NR_BANCO_COM'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_BANCO_COM'
      Size = 5
    end
    object qry_di_NR_BANCO_PAGAMENTO: TStringField
      FieldName = 'NR_BANCO_PAGAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_BANCO_PAGAMENTO'
      Size = 5
    end
    object qry_di_NR_COMPRADOR_ME: TStringField
      FieldName = 'NR_COMPRADOR_ME'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_COMPRADOR_ME'
      Size = 14
    end
    object qry_di_NR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_CONSIGNATARIO'
      Size = 14
    end
    object qry_di_NR_CONTRATO_CAMBIO: TStringField
      FieldName = 'NR_CONTRATO_CAMBIO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_CONTRATO_CAMBIO'
      Size = 8
    end
    object qry_di_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object qry_di_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_DCTO_CARGA'
      Size = 30
    end
    object qry_di_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_DCTO_CARGA_MAST'
      Size = 30
    end
    object qry_di_NR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_DECL_IMP_PROT'
      Size = 10
    end
    object qry_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_DECLARACAO_IMP'
      Size = 10
    end
    object qry_di_NR_IDENTIFICACAO_COM: TStringField
      FieldName = 'NR_IDENTIFICACAO_COM'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_IDENTIFICACAO_COM'
      Size = 14
    end
    object qry_di_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_MANIFESTO'
      Size = 15
    end
    object qry_di_NR_PRACA_COM: TStringField
      FieldName = 'NR_PRACA_COM'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PRACA_COM'
      Size = 4
    end
    object qry_di_NR_PRACA_PAGAMENTO: TStringField
      FieldName = 'NR_PRACA_PAGAMENTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PRACA_PAGAMENTO'
      Size = 5
    end
    object qry_di_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_ROF'
      Size = 8
    end
    object qry_di_NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_VEICULO_TRANSP'
      Size = 15
    end
    object qry_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.PB_CARGA'
    end
    object qry_di_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_COMISSAO'
    end
    object qry_di_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_ICMS'
    end
    object qry_di_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_REDUCAO_ICMS'
    end
    object qry_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.PL_CARGA'
    end
    object qry_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      Origin = 'TDECLARACAO_IMPORTACAO.QT_ADICOES'
    end
    object qry_di_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object qry_di_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_FRETE_TNAC_MNEG'
    end
    object qry_di_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_DESPS_MN'
    end
    object qry_di_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_DESPS_MNEG'
    end
    object qry_di_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_FRT_COLLECT'
    end
    object qry_di_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_FRT_PREPAID'
    end
    object qry_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_MLE_MNEG'
    end
    object qry_di_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_SEGURO_MNEG'
    end
    object qry_di_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_FRETE_MN'
    end
    object qry_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_MLE_MN'
    end
    object qry_di_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_SEG_MN'
    end
    object qry_di_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.PC_SEGURO_MLE'
    end
    object qry_di_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_II'
    end
    object qry_di_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_IPI'
    end
    object qry_di_VL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_AD'
    end
    object qry_di_DT_ULTIMA_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULTIMA_ALTERACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_ULTIMA_ALTERACAO'
    end
    object qry_di_IN_RISC_ATUALIZADO: TStringField
      FieldName = 'IN_RISC_ATUALIZADO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RISC_ATUALIZADO'
      Size = 1
    end
    object qry_di_CD_TIPO_BASE_SEGURO: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_BASE_SEGURO'
      Size = 1
    end
    object qry_di_IN_REB: TStringField
      FieldName = 'IN_REB'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_REB'
      Size = 1
    end
    object qry_di_VL_TOT_ICMS: TFloatField
      FieldName = 'VL_TOT_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOT_ICMS'
    end
    object qry_di_CD_TIPO_PGTO_TRIB: TStringField
      FieldName = 'CD_TIPO_PGTO_TRIB'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_PGTO_TRIB'
      Size = 1
    end
    object qry_di_NR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_CONTA_PGTO_TRIB'
      Size = 19
    end
    object qry_di_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_MLE'
    end
    object qry_di_TX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_FRETE'
    end
    object qry_di_TX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_SEGURO'
    end
    object qry_di_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TDECLARACAO_IMPORTACAO.TX_DOLAR'
    end
    object qry_di_NR_REF_CLI: TStringField
      FieldName = 'NR_REF_CLI'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_REF_CLI'
      Size = 15
    end
    object qry_di_IN_SISCOMEX: TStringField
      FieldName = 'IN_SISCOMEX'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_SISCOMEX'
      Size = 1
    end
    object qry_di_CD_TIPO_ICMS: TStringField
      FieldName = 'CD_TIPO_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TIPO_ICMS'
      Size = 1
    end
    object qry_di_IN_ICMS_IMPRESSO: TStringField
      FieldName = 'IN_ICMS_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_ICMS_IMPRESSO'
      Size = 1
    end
    object qry_di_DT_ICMS_IMPRESSO: TDateTimeField
      FieldName = 'DT_ICMS_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_ICMS_IMPRESSO'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_ACRESCIMOS_MN'
    end
    object qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_DEDUCOES_MN'
    end
    object qry_di_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_CALCULO'
    end
    object qry_di_VL_DESPESA_ITEM: TFloatField
      FieldName = 'VL_DESPESA_ITEM'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_DESPESA_ITEM'
    end
    object qry_di_VL_DESPESA_ITEM_MN: TFloatField
      FieldName = 'VL_DESPESA_ITEM_MN'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_DESPESA_ITEM_MN'
    end
    object qry_di_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object qry_di_CD_PRESENCA_CARGA: TStringField
      FieldName = 'CD_PRESENCA_CARGA'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PRESENCA_CARGA'
      Size = 36
    end
    object qry_di_NR_SEQ_RETIFICACAO: TStringField
      FieldName = 'NR_SEQ_RETIFICACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_SEQ_RETIFICACAO'
      Size = 2
    end
    object qry_di_CD_MOTIVO_RETIF: TStringField
      FieldName = 'CD_MOTIVO_RETIF'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_MOTIVO_RETIF'
      Size = 2
    end
    object qry_di_DT_RETIFICACAO: TDateTimeField
      FieldName = 'DT_RETIFICACAO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_RETIFICACAO'
    end
    object qry_di_DT_EXON_IMPRESSO: TDateTimeField
      FieldName = 'DT_EXON_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_EXON_IMPRESSO'
    end
    object qry_di_IN_EXON_IMPRESSO: TStringField
      FieldName = 'IN_EXON_IMPRESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_EXON_IMPRESSO'
      Size = 1
    end
    object qry_di_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_TRIBUTACAO_ICMS'
      Size = 1
    end
    object qry_di_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FUND_LEGAL_ICMS'
      Size = 3
    end
    object qry_di_VL_TOTAL_CAMBIO: TFloatField
      FieldName = 'VL_TOTAL_CAMBIO'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_CAMBIO'
    end
    object qry_di_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object qry_di_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FORNECEDOR'
      Size = 5
    end
    object qry_di_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_FABRICANTE'
      Size = 5
    end
    object qry_di_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qry_di_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qry_di_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
      Origin = 'TDECLARACAO_IMPORTACAO.QT_PARC_FINANC_360'
    end
    object qry_di_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
      Origin = 'TDECLARACAO_IMPORTACAO.QT_PERIOD_PGTO_360'
    end
    object qry_di_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      Origin = 'TDECLARACAO_IMPORTACAO.CD_PERIOD_PGTO_360'
      Size = 1
    end
    object qry_di_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_EMBUT_FRT_ITENS'
    end
    object qry_di_IN_EMBUT_SEG_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_SEG_ITENS'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_EMBUT_SEG_ITENS'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MNEG: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_ACRESCIMOS_MNEG'
    end
    object qry_di_VL_TOTAL_DEDUCOES_MNEG: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_DEDUCOES_MNEG'
    end
    object qry_di_VL_TOTAL_FRETE_MNEG: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MNEG'
      Origin = 'TDECLARACAO_IMPORTACAO.VL_TOTAL_FRETE_MNEG'
    end
    object qry_di_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO_SISCOMEX'
      Size = 8
    end
    object qry_di_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_PGTO_VARIAV_360'
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      
        'SELECT CD_AGENTE, CD_MOEDA_FRETE, VL_TAXA_FRETE, CD_CANAL, VL_CI' +
        'F_DOLAR'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 130
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TPROCESSO.CD_AGENTE'
      Size = 4
    end
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPROCESSO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_processo_VL_TAXA_FRETE: TFloatField
      FieldName = 'VL_TAXA_FRETE'
      Origin = 'TPROCESSO.VL_TAXA_FRETE'
    end
    object qry_processo_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPROCESSO.CD_AGENTE'
      Size = 1
    end
    object qry_processo_VL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
      Origin = 'TPROCESSO.CD_AGENTE'
    end
  end
  object qry_processo_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT TP_CNTR'
      'FROM TPROCESSO_CNTR'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY TP_CNTR')
    Left = 130
    Top = 203
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TPROCESSO_CNTR.TP_CNTR'
      Size = 2
    end
  end
  object ds_di: TDataSource
    DataSet = qry_di_
    Left = 38
    Top = 75
  end
  object qry_ts_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      
        'SELECT MIN(F.NR_NOTA_FATURA) AS NR_NOTA_FATURA, MIN(F.DT_FATURA)' +
        ' AS DT_FATURA, MIN(F.VL_FATURA) AS VL_FATURA, MIN(F.DT_PAGTO_ITE' +
        'M) AS DT_PAGTO_ITEM'
      'FROM TS_FATURA_PROCESSO TS, TS_FATURA F'
      'WHERE TS.NR_PROCESSO = :NR_PROCESSO AND'
      '      F.NR_SOLICITACAO = TS.NR_SOLICITACAO AND'
      '      F.IN_CANCELADO <> 0'
      '')
    Left = 130
    Top = 275
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ts_fatura_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
    object qry_ts_fatura_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
    end
    object qry_ts_fatura_VL_FATURA: TFloatField
      FieldName = 'VL_FATURA'
      Origin = 'TS_FATURA.DT_FATURA'
    end
    object qry_ts_fatura_DT_PAGTO_ITEM: TDateTimeField
      FieldName = 'DT_PAGTO_ITEM'
      Origin = 'TS_FATURA.VL_FATURA'
    end
  end
  object qry_faturamento_cc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      
        'SELECT F.NR_PROCESSO,F.DT_LANCAMENTO,'#39'991'#39' '#39'CD_ITEM'#39',SUM(CASE F.' +
        'CD_ITEM WHEN '#39'991'#39' THEN F.VL_ITEM ELSE F.VL_ITEM * (-1) END) '#39'VL' +
        '_ITEM'#39',FP.IN_NAO_FAT'
      'FROM TFATURAMENTO_CC F, TS_FATURA_PROCESSO_ITEM FP'
      'WHERE F.NR_PROCESSO = :NR_PROCESSO and'
      
        '      FP.NR_PROCESSO =* F.NR_PROCESSO AND FP.CD_ITEM =* F.CD_ITE' +
        'M AND'
      '      F.IN_CANCELADO <> '#39'1'#39' AND'
      '      F.CD_ITEM IN ('#39'991'#39','#39'992'#39','#39'993'#39')'
      'GROUP BY F.NR_PROCESSO,F.DT_LANCAMENTO,FP.IN_NAO_FAT'
      'UNION'
      
        'SELECT F.NR_PROCESSO, F.DT_LANCAMENTO, F.CD_ITEM, F.VL_ITEM, FP.' +
        'IN_NAO_FAT'
      'FROM TFATURAMENTO_CC F, TS_FATURA_PROCESSO_ITEM FP'
      'WHERE F.NR_PROCESSO = :NR_PROCESSO and'
      
        '      FP.NR_PROCESSO =* F.NR_PROCESSO AND FP.CD_ITEM =* F.CD_ITE' +
        'M AND'
      '      F.IN_CANCELADO <> '#39'1'#39' AND'
      
        '      F.NR_CHEQUE NOT IN (SELECT NR_CHEQUE FROM TFATURAMENTO_CC ' +
        'WHERE NR_PROCESSO = :NR_PROCESSO AND IN_RESTITUI = '#39'1'#39') AND'
      '      F.CD_ITEM NOT IN ('#39'991'#39','#39'992'#39','#39'993'#39')')
    Left = 130
    Top = 339
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_faturamento_cc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      Size = 18
    end
    object qry_faturamento_cc_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC.DT_LANCAMENTO'
    end
    object qry_faturamento_cc_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TFATURAMENTO_CC.CD_ITEM'
      Size = 3
    end
    object qry_faturamento_cc_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Origin = 'TFATURAMENTO_CC.VL_ITEM'
    end
    object qry_faturamento_cc_IN_NAO_FAT: TStringField
      FieldName = 'IN_NAO_FAT'
      Size = 1
    end
  end
  object qry_dt_receb_doc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_RECEB_DOC'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 229
    Top = 23
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dt_receb_doc_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_RECEB_DOC.DT_REALIZACAO'
    end
  end
  object qry_dt_desemb_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_DESEMB'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 229
    Top = 74
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dt_desemb_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_DESEMB.DT_REALIZACAO'
    end
  end
  object qry_dt_entrega_merc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_ENTREGA_MERC'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 229
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dt_entrega_merc_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_ENTREGA_MERC.DT_REALIZACAO'
    end
  end
  object qry_instr_emb_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT *'
      'FROM TDOCUMENTO_INSTRUCAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND NR_SEQUENCIA = 1')
    Left = 229
    Top = 194
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_instr_emb_NR_DCTO_INSTRUCAO: TStringField
      FieldName = 'NR_DCTO_INSTRUCAO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_DCTO_INSTRUCAO'
      Size = 25
    end
    object qry_instr_emb_CD_TIPO_DCTO_INSTR: TStringField
      FieldName = 'CD_TIPO_DCTO_INSTR'
      Origin = 'TDOCUMENTO_INSTRUCAO.CD_TIPO_DCTO_INSTR'
      Size = 2
    end
  end
  object qry_ddimport_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDDIMPORT'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '')
    Left = 330
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object sp_ddimport: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ddimport'
    Left = 332
    Top = 30
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
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
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = '@tot_ddimport'
        ParamType = ptOutput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
        Value = 1
      end>
  end
  object qry_dt_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_EMBARQUE'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 229
    Top = 339
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dt_embarque_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_EMBARQUE.DT_REALIZACAO'
    end
  end
  object qry_dt_prev_chegada_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_PREV_CHEGADA'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 336
    Top = 203
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dt_prev_chegada_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_PREV_CHEGADA.DT_REALIZACAO'
    end
  end
  object qry_dt_prev_entr_merc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM VW_DT_PREV_ENTR_MERC'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 336
    Top = 259
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_dt_prev_entr_merc_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'VW_DT_PREV_ENTR_MERC.DT_REALIZACAO'
    end
  end
  object qry_processo_nf_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      'SELECT *'
      'FROM TPROCESSO_NF'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 336
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_nf_NR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'TPROCESSO_NF.NR_NOTA'
      Size = 10
    end
    object qry_processo_nf_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_NF.NR_PROCESSO'
      Size = 10
    end
    object qry_processo_nf_DT_NOTA: TDateTimeField
      FieldName = 'DT_NOTA'
      Origin = 'TPROCESSO_NF.NR_NOTA'
    end
    object qry_processo_nf_VL_NOTA: TFloatField
      FieldName = 'VL_NOTA'
      Origin = 'TPROCESSO_NF.NR_PROCESSO'
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 40
    Top = 203
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
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
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Left = 40
    Top = 275
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
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
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 38
    Top = 342
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
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
  object qry_ddimport_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDDIMPORT_DESP'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      '       NR_PROCESSO = :NR_PROCESSO')
    Left = 332
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object sp_ddimport_flp: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ddimport_flp'
    Left = 39
    Top = 408
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
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_processo_flp'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = '@tot_ddimport'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_ddimport_flp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDDIMPORT_FLP'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '')
    Left = 128
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 40
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object sp_ddimport_custo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ddimport_custo'
    Left = 232
    Top = 408
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
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_processo_custo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = '@tot_ddimport'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_ddimport_custo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDDIMPORT_CUSTO'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '')
    Left = 336
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_itens_numerario_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_di
    SQL.Strings = (
      
        'SELECT NI.NR_PROCESSO, NN.DT_SOLICITACAO + 2 as DT_SOLICITACAO, ' +
        'NI.CD_ITEM, IT.NM_ITEM, NI.VL_SOLICITADO, '
      
        '       ( CASE TP_DESTINO WHEN '#39'1'#39' THEN '#39'2'#39' ELSE '#39'1'#39' END ) PAGA_P' +
        'OR_QUEM,'
      
        '       ( CASE TP_DESTINO WHEN '#39'1'#39' THEN '#39'N'#39' ELSE '#39'S'#39' END ) ADIANT' +
        'AMENTO'
      
        '  FROM TNUMERARIO_NOTIFICA_ITEM NI, TNUMERARIO_NOTIFICA NN, TITE' +
        'M IT'
      ' WHERE NI.NR_PROCESSO = '#39'0101I0-5117-06'#39' AND'
      '       NN.NR_PROCESSO = NI.NR_PROCESSO AND'
      '       IT.CD_ITEM = NI.CD_ITEM')
    Left = 226
    Top = 267
    object qry_itens_numerario_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_itens_numerario_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
    end
    object qry_itens_numerario_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_itens_numerario_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_itens_numerario_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qry_itens_numerario_PAGA_POR_QUEM: TStringField
      FieldName = 'PAGA_POR_QUEM'
      FixedChar = True
      Size = 1
    end
    object qry_itens_numerario_ADIANTAMENTO: TStringField
      FieldName = 'ADIANTAMENTO'
      FixedChar = True
      Size = 1
    end
  end
  object db_nota: TIBDatabase
    Connected = True
    DatabaseName = 'INDAIA-WEB:D:\DDNota\NOTA.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=ISO8859_1')
    LoginPrompt = False
    DefaultTransaction = trNota
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 536
    Top = 48
  end
  object qryNFCapa: TIBQuery
    Database = db_nota
    Transaction = trNota
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CD.STR_CODIGOCFOP,'
      '       AP.STR_REFERENCIA,'
      '       AP.DT_ABERTURAPROCESSO,'
      '       AP.DT_DATACHEGADA,'
      '       AP.DT_REGISTRODI,'
      '       AP.STR_REGISTRODI,'
      '       AP.STR_VIATRANSPORTE,'
      '       CD.DBL_VALORFRETECOLLECT + CD.DBL_VALORFRETEPREPAID,'
      '       CD.DBL_VALORICMS,'
      '       CD.DBL_BASEICMS,'
      '       AP.STR_CODIGOIMPORTADOR,'
      '       AP.STR_CODIGOTRANSP,'
      '       CD.DBL_VALORSEGUROREAIS,'
      '       CD.DBL_VALORIPIRECOLHER,'
      '       CD.DBL_VALORORIGEMMOEDA,'
      '       AP.STR_CODIGOEXPORTADOR'
      '  FROM ABREPROCESSO AP'
      
        ' INNER JOIN CAPADI CD ON CD.LI_SEQUENCIAPROCESSO = AP.LI_SEQUENC' +
        'IAPROCESSO'
      ' WHERE AP.STR_CODIGOPROCESSO = :PROCESSO')
    Left = 504
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'PROCESSO'
        ParamType = ptInput
      end>
    object qryNFCapaSTR_CODIGOCFOP: TIBStringField
      FieldName = 'STR_CODIGOCFOP'
      Origin = 'CAPADI.STR_CODIGOCFOP'
      Size = 6
    end
    object qryNFCapaSTR_REFERENCIA: TIBStringField
      FieldName = 'STR_REFERENCIA'
      Origin = 'ABREPROCESSO.STR_REFERENCIA'
      Size = 25
    end
    object qryNFCapaDT_ABERTURAPROCESSO: TDateTimeField
      FieldName = 'DT_ABERTURAPROCESSO'
      Origin = 'ABREPROCESSO.DT_ABERTURAPROCESSO'
    end
    object qryNFCapaDT_DATACHEGADA: TDateTimeField
      FieldName = 'DT_DATACHEGADA'
      Origin = 'ABREPROCESSO.DT_DATACHEGADA'
    end
    object qryNFCapaDT_REGISTRODI: TDateTimeField
      FieldName = 'DT_REGISTRODI'
      Origin = 'ABREPROCESSO.DT_REGISTRODI'
    end
    object qryNFCapaSTR_REGISTRODI: TIBStringField
      FieldName = 'STR_REGISTRODI'
      Origin = 'ABREPROCESSO.STR_REGISTRODI'
      Size = 10
    end
    object qryNFCapaSTR_VIATRANSPORTE: TIBStringField
      FieldName = 'STR_VIATRANSPORTE'
      Origin = 'ABREPROCESSO.STR_VIATRANSPORTE'
      Size = 2
    end
    object qryNFCapaF_1: TFloatField
      FieldName = 'F_1'
    end
    object qryNFCapaDBL_VALORICMS: TFloatField
      FieldName = 'DBL_VALORICMS'
      Origin = 'CAPADI.DBL_VALORICMS'
    end
    object qryNFCapaDBL_BASEICMS: TFloatField
      FieldName = 'DBL_BASEICMS'
      Origin = 'CAPADI.DBL_BASEICMS'
    end
    object qryNFCapaSTR_CODIGOIMPORTADOR: TIBStringField
      FieldName = 'STR_CODIGOIMPORTADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOIMPORTADOR'
      Size = 6
    end
    object qryNFCapaSTR_CODIGOTRANSP: TIBStringField
      FieldName = 'STR_CODIGOTRANSP'
      Origin = 'ABREPROCESSO.STR_CODIGOTRANSP'
      Size = 6
    end
    object qryNFCapaDBL_VALORSEGUROREAIS: TFloatField
      FieldName = 'DBL_VALORSEGUROREAIS'
      Origin = 'CAPADI.DBL_VALORSEGUROREAIS'
    end
    object qryNFCapaDBL_VALORIPIRECOLHER: TFloatField
      FieldName = 'DBL_VALORIPIRECOLHER'
      Origin = 'CAPADI.DBL_VALORIPIRECOLHER'
    end
    object qryNFCapaDBL_VALORORIGEMMOEDA: TFloatField
      FieldName = 'DBL_VALORORIGEMMOEDA'
      Origin = 'CAPADI.DBL_VALORORIGEMMOEDA'
    end
    object qryNFCapaSTR_CODIGOEXPORTADOR: TIBStringField
      FieldName = 'STR_CODIGOEXPORTADOR'
      Origin = 'ABREPROCESSO.STR_CODIGOEXPORTADOR'
      Size = 6
    end
  end
  object qryNFItens: TIBQuery
    Database = db_nota
    Transaction = trNota
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT ID.STR_CODIGOPRODUTO,'
      '       CD.STR_REGIMETRIBICMSAD,'
      '       AD.STR_REGIMETRIBUTACAOIPI,'
      '       ID.STR_NUMEROITEM,'
      '       ID.DBL_QUANTIDADE,'
      '       ID.STR_UNIDADEMEDIDA,'
      '       ID.DBL_VALORIPIRECOLHER,'
      '       ID.DBL_VALORORIGEMREAIS,'
      '       ID.MEM_DESCRICAOPRODUTO,'
      '       ID.DBL_VALORFOBREAIS,'
      '       ID.DBL_VALORFRETEREAIS,'
      '       ID.DBL_VALORSEGUROREAIS,'
      '       ID.DBL_VALORIIRECOLHER,'
      '       AD.DBL_ALIQUOTAPERCREDUIPI,'
      '       ID.DBL_DESPESASMOEDA,'
      '       AP.STR_REFERENCIA,'
      '       AD.STR_EXNCM,'
      '       ID.STR_NUMEROFATURA,'
      '       ID.DBL_VALORICMS,'
      '       ID.DBL_PESOLIQUIDO,'
      '       AD.DBL_ALIQUOTANORMALII,'
      '       ID.STR_NUMEROPEDIDO,'
      '       ID.DBL_BASENORMALICMS,'
      '       ID.DBL_VALORFOBMOEDA,'
      '       ID.DBL_ALIQUOTAPISPASEP,'
      '       AD.DBL_BASECALCULOPISPASEPCOFINS,'
      '       ID.DBL_VALORPISPASEPARECOLHER,'
      '       ID.DBL_ALIQUOTACOFINS,'
      '       AD.DBL_BASECALCULOPISPASEPCOFINS,'
      
        '       ID.DBL_VALORCOFINSARECOLHER, AD.STR_NUMEROADICAO, ID.STR_' +
        'NUMEROITEM'
      '  FROM ABREPROCESSO AP'
      
        ' INNER JOIN CAPADI CD ON CD.LI_SEQUENCIAPROCESSO = AP.LI_SEQUENC' +
        'IAPROCESSO'
      ' INNER JOIN ADICAO AD ON AD.LI_SEQUENCIADI = CD.LI_SEQUENCIADI'
      ' INNER JOIN ITEMDI ID ON ID.LI_SEQUENCIADI = CD.LI_SEQUENCIADI'
      
        '                     AND ID.LI_SEQUENCIAADICAO = AD.LI_SEQUENCIA' +
        'ADICAO'
      ' WHERE AP.STR_CODIGOPROCESSO = :PROCESSO')
    Left = 568
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'PROCESSO'
        ParamType = ptInput
      end>
    object qryNFItensSTR_CODIGOPRODUTO: TIBStringField
      FieldName = 'STR_CODIGOPRODUTO'
      Origin = 'ITEMDI.STR_CODIGOPRODUTO'
    end
    object qryNFItensSTR_REGIMETRIBICMSAD: TIBStringField
      FieldName = 'STR_REGIMETRIBICMSAD'
      Origin = 'CAPADI.STR_REGIMETRIBICMSAD'
      Size = 1
    end
    object qryNFItensSTR_REGIMETRIBUTACAOIPI: TIBStringField
      FieldName = 'STR_REGIMETRIBUTACAOIPI'
      Origin = 'ADICAO.STR_REGIMETRIBUTACAOIPI'
      Size = 1
    end
    object qryNFItensSTR_NUMEROITEM: TIBStringField
      FieldName = 'STR_NUMEROITEM'
      Origin = 'ITEMDI.STR_NUMEROITEM'
      Size = 3
    end
    object qryNFItensDBL_QUANTIDADE: TFloatField
      FieldName = 'DBL_QUANTIDADE'
      Origin = 'ITEMDI.DBL_QUANTIDADE'
    end
    object qryNFItensSTR_UNIDADEMEDIDA: TIBStringField
      FieldName = 'STR_UNIDADEMEDIDA'
      Origin = 'ITEMDI.STR_UNIDADEMEDIDA'
      Size = 2
    end
    object qryNFItensDBL_VALORIPIRECOLHER: TFloatField
      FieldName = 'DBL_VALORIPIRECOLHER'
      Origin = 'ITEMDI.DBL_VALORIPIRECOLHER'
    end
    object qryNFItensDBL_VALORORIGEMREAIS: TFloatField
      FieldName = 'DBL_VALORORIGEMREAIS'
      Origin = 'ITEMDI.DBL_VALORORIGEMREAIS'
    end
    object qryNFItensMEM_DESCRICAOPRODUTO: TBlobField
      FieldName = 'MEM_DESCRICAOPRODUTO'
      Origin = 'ITEMDI.MEM_DESCRICAOPRODUTO'
      Size = 8
    end
    object qryNFItensDBL_VALORFOBREAIS: TFloatField
      FieldName = 'DBL_VALORFOBREAIS'
      Origin = 'ITEMDI.DBL_VALORFOBREAIS'
    end
    object qryNFItensDBL_VALORFRETEREAIS: TFloatField
      FieldName = 'DBL_VALORFRETEREAIS'
      Origin = 'ITEMDI.DBL_VALORFRETEREAIS'
    end
    object qryNFItensDBL_VALORSEGUROREAIS: TFloatField
      FieldName = 'DBL_VALORSEGUROREAIS'
      Origin = 'ITEMDI.DBL_VALORSEGUROREAIS'
    end
    object qryNFItensDBL_VALORIIRECOLHER: TFloatField
      FieldName = 'DBL_VALORIIRECOLHER'
      Origin = 'ITEMDI.DBL_VALORIIRECOLHER'
    end
    object qryNFItensDBL_ALIQUOTAPERCREDUIPI: TFloatField
      FieldName = 'DBL_ALIQUOTAPERCREDUIPI'
      Origin = 'ADICAO.DBL_ALIQUOTAPERCREDUIPI'
    end
    object qryNFItensDBL_DESPESASMOEDA: TFloatField
      FieldName = 'DBL_DESPESASMOEDA'
      Origin = 'ITEMDI.DBL_DESPESASMOEDA'
    end
    object qryNFItensSTR_REFERENCIA: TIBStringField
      FieldName = 'STR_REFERENCIA'
      Origin = 'ABREPROCESSO.STR_REFERENCIA'
      Size = 25
    end
    object qryNFItensSTR_EXNCM: TIBStringField
      FieldName = 'STR_EXNCM'
      Origin = 'ADICAO.STR_EXNCM'
      Size = 3
    end
    object qryNFItensSTR_NUMEROFATURA: TIBStringField
      FieldName = 'STR_NUMEROFATURA'
      Origin = 'ITEMDI.STR_NUMEROFATURA'
      Size = 15
    end
    object qryNFItensDBL_VALORICMS: TFloatField
      FieldName = 'DBL_VALORICMS'
      Origin = 'ITEMDI.DBL_VALORICMS'
    end
    object qryNFItensDBL_PESOLIQUIDO: TFloatField
      FieldName = 'DBL_PESOLIQUIDO'
      Origin = 'ITEMDI.DBL_PESOLIQUIDO'
    end
    object qryNFItensDBL_ALIQUOTANORMALII: TFloatField
      FieldName = 'DBL_ALIQUOTANORMALII'
      Origin = 'ADICAO.DBL_ALIQUOTANORMALII'
    end
    object qryNFItensSTR_NUMEROPEDIDO: TIBStringField
      FieldName = 'STR_NUMEROPEDIDO'
      Origin = 'ITEMDI.STR_NUMEROPEDIDO'
      Size = 15
    end
    object qryNFItensDBL_BASENORMALICMS: TFloatField
      FieldName = 'DBL_BASENORMALICMS'
      Origin = 'ITEMDI.DBL_BASENORMALICMS'
    end
    object qryNFItensDBL_VALORFOBMOEDA: TFloatField
      FieldName = 'DBL_VALORFOBMOEDA'
      Origin = 'ITEMDI.DBL_VALORFOBMOEDA'
    end
    object qryNFItensDBL_ALIQUOTAPISPASEP: TFloatField
      FieldName = 'DBL_ALIQUOTAPISPASEP'
      Origin = 'ITEMDI.DBL_ALIQUOTAPISPASEP'
    end
    object qryNFItensDBL_BASECALCULOPISPASEPCOFINS: TFloatField
      FieldName = 'DBL_BASECALCULOPISPASEPCOFINS'
      Origin = 'ADICAO.DBL_BASECALCULOPISPASEPCOFINS'
    end
    object qryNFItensDBL_VALORPISPASEPARECOLHER: TFloatField
      FieldName = 'DBL_VALORPISPASEPARECOLHER'
      Origin = 'ITEMDI.DBL_VALORPISPASEPARECOLHER'
    end
    object qryNFItensDBL_ALIQUOTACOFINS: TFloatField
      FieldName = 'DBL_ALIQUOTACOFINS'
      Origin = 'ITEMDI.DBL_ALIQUOTACOFINS'
    end
    object qryNFItensDBL_BASECALCULOPISPASEPCOFINS1: TFloatField
      FieldName = 'DBL_BASECALCULOPISPASEPCOFINS1'
      Origin = 'ADICAO.DBL_BASECALCULOPISPASEPCOFINS'
    end
    object qryNFItensDBL_VALORCOFINSARECOLHER: TFloatField
      FieldName = 'DBL_VALORCOFINSARECOLHER'
      Origin = 'ITEMDI.DBL_VALORCOFINSARECOLHER'
    end
    object qryNFItensSTR_NUMEROADICAO: TIBStringField
      FieldName = 'STR_NUMEROADICAO'
      Origin = 'ADICAO.STR_NUMEROADICAO'
      Required = True
      Size = 3
    end
    object qryNFItensSTR_NUMEROITEM1: TIBStringField
      FieldName = 'STR_NUMEROITEM1'
      Origin = 'ITEMDI.STR_NUMEROITEM'
      Size = 3
    end
  end
  object trNota: TIBTransaction
    Active = True
    DefaultDatabase = db_nota
    AutoStopAction = saNone
    Left = 536
    Top = 104
  end
end

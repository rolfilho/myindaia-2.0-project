object datm_cliente: Tdatm_cliente
  OldCreateOrder = True
  Left = 728
  Top = 238
  Height = 627
  Width = 720
  object ds_cliente_habilitacao: TDataSource
    DataSet = qry_cliente_habilitacao_
    Left = 416
    Top = 9
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 60
    Top = 92
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 60
    Top = 140
  end
  object ds_yesno: TDataSource
    DataSet = qry_yesno_
    Left = 562
    Top = 324
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 208
    Top = 12
  end
  object qry_cliente_habilitacao_: TQuery
    AfterScroll = qry_cliente_habilitacao_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, DT_VALID_CRED_RF, DT' +
        '_CAPTACAO, IN_ATIVO, TX_NUMERARIO_OBS,'
      
        '  CD_TAB_SDA, CD_FOLLOW_UP, CD_NUMERARIO, CD_TP_FOLLOW_UP, IN_SD' +
        '_FAT_ZERO, IN_SD_NOTA_ZERO,'
      
        '  IN_COBRAR_CPMF, IN_COBRAR_ISS, CD_RESPONSAVEL, IN_BOLETO, NR_D' +
        'IAS_VENCTO_FATURA, IN_COMP_SDA,'
      
        '  CD_IR_FAT, IN_DIVERSOS, IN_QUADRO_TOTAL_FAT, IN_CC_NUM, IN_OBS' +
        '_UNICA, IN_OBS_POR_DATA,'
      
        '  IN_DIA_UTIL_EMISSAO_FAT, TP_PORTADOR, CD_BANCO_PORTADOR, IN_CP' +
        'MF_SALDO_CREDOR, IN_CALCULA_IRRF_VL_MIN,'
      
        '  TP_TAB_SDA, IN_CPMF_TOTAL, IN_NOTA_LIQ, IN_FAT_REC, IN_EXP_NF,' +
        ' NR_CONTRATO_SEGURO, NR_ALT_LINHA_FAT_EXP,'
      
        '  NR_PROT_MERCANTE, VL_MIN_DI, IN_FAT_SEM_DESP, IN_NUM_FAT_EXP_A' +
        'UT, IN_TX_SCX_ICMS, IN_COBRAR_COFINS,'
      
        '  VL_ALIQ_COFINS_CLIENTE, CD_RET_FAT, IN_ND, IN_AVISO_RETENCAO, ' +
        'IN_REMESSA, IN_REF_ACEITA_BARRA,'
      
        '  NR_TAMANHO_REF, IN_BORDERO, IN_ENVIA_PDF, IN_DOCTO_SOLIC, IN_A' +
        'UTO_MERC_FABR, DT_VALID_ANVISA,'
      
        '  IN_TP_RETENCAO_IR, IN_TP_RETENCAO_COFINS, NR_DIA_VENCTO, NR_DI' +
        'A_VENCTO_BASE, CD_ATENDENTE,'
      
        '  NM_EMAILS, DT_RADAR, DT_REAJUSTE_IMP, DT_REAJUSTE_EXP, NM_EMAI' +
        'L_EMPRESA, DS_CONTA_DHL, DT_PROCURACAO_RECEBIDA'
      'FROM TCLIENTE_HABILITACAO (NOLOCK)'
      
        'WHERE CD_CLIENTE = :CD_CLIENTE  AND ( IN_ATIVO = '#39'1'#39'  or  :IN_AT' +
        'IVO is not null  )')
    Left = 305
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IN_ATIVO'
        ParamType = ptUnknown
      end>
    object qry_cliente_habilitacao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_HABILITACAO.CD_PRODUTO'
      OnChange = qry_cliente_habilitacao_CD_PRODUTOChange
      Size = 2
    end
    object qry_cliente_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_habilitacao_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TCLIENTE_HABILITACAO.CD_TAB_SDA'
      Size = 3
    end
    object qry_cliente_habilitacao_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      BlobType = ftMemo
    end
    object qry_cliente_habilitacao_DT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_cliente_habilitacao_CD_FOLLOW_UP: TStringField
      FieldName = 'CD_FOLLOW_UP'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 2
    end
    object qry_cliente_habilitacao_CD_NUMERARIO: TStringField
      FieldName = 'CD_NUMERARIO'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 2
    end
    object qry_cliente_habilitacao_CD_TP_FOLLOW_UP: TStringField
      FieldName = 'CD_TP_FOLLOW_UP'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 2
    end
    object qry_cliente_habilitacao_IN_SD_FAT_ZERO: TStringField
      FieldName = 'IN_SD_FAT_ZERO'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_SD_NOTA_ZERO: TStringField
      FieldName = 'IN_SD_NOTA_ZERO'
      Origin = 'TCLIENTE_HABILITACAO.CD_PRODUTO'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_COBRAR_CPMF: TStringField
      FieldName = 'IN_COBRAR_CPMF'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 1
    end
    object qry_cliente_habilitacao_CD_RESPONSAVEL: TStringField
      FieldName = 'CD_RESPONSAVEL'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_LookCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_habilitacao_LookUnidNeg: TStringField
      DisplayLabel = 'Unidade de Neg'#243'cio'
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_habilitacao_LookProduto: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_habilitacao_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_cliente_habilitacao_LookSDA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookSDA'
      LookupDataSet = qry_sda_
      LookupKeyFields = 'CD_SDA'
      LookupResultField = 'TX_DESCRICAO'
      KeyFields = 'CD_TAB_SDA'
      Size = 50
      Lookup = True
    end
    object qry_cliente_habilitacao_look_nm_mod_follow_up: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_mod_follow_up'
      LookupDataSet = qry_mod_follow_up
      LookupKeyFields = 'CD_FOLLOW_UP'
      LookupResultField = 'NM_FOLLOW_UP'
      KeyFields = 'CD_FOLLOW_UP'
      Size = 30
      Lookup = True
    end
    object qry_cliente_habilitacao_look_numerario: TStringField
      FieldKind = fkLookup
      FieldName = 'look_numerario'
      LookupDataSet = qry_mod_numerario
      LookupKeyFields = 'CD_NUMERARIO'
      LookupResultField = 'NM_NUMERARIO'
      KeyFields = 'CD_NUMERARIO'
      Size = 30
      Lookup = True
    end
    object qry_cliente_habilitacao_look_nm_tp_follow_up: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_tp_follow_up'
      LookupDataSet = qry_tp_followup_
      LookupKeyFields = 'CD_TP_FOLLOW_UP'
      LookupResultField = 'NM_TP_FOLLOW_UP'
      KeyFields = 'CD_TP_FOLLOW_UP'
      Lookup = True
    end
    object qry_cliente_habilitacao_look_in_mod_follow_up: TStringField
      FieldKind = fkLookup
      FieldName = 'look_in_mod_follow_up'
      LookupDataSet = qry_tp_followup_
      LookupKeyFields = 'CD_TP_FOLLOW_UP'
      LookupResultField = 'IN_MOD_FOLLOW_UP'
      KeyFields = 'CD_TP_FOLLOW_UP'
      Size = 1
      Lookup = True
    end
    object qry_cliente_habilitacao_look_numerario_usd: TStringField
      FieldKind = fkLookup
      FieldName = 'look_numerario_usd'
      LookupDataSet = qry_mod_numerario
      LookupKeyFields = 'CD_NUMERARIO'
      LookupResultField = 'IN_USD'
      KeyFields = 'CD_NUMERARIO'
      Size = 1
      Lookup = True
    end
    object qry_cliente_habilitacao_IN_BOLETO: TStringField
      FieldName = 'IN_BOLETO'
      Size = 1
    end
    object qry_cliente_habilitacao_NR_DIAS_VENCTO_FATURA: TIntegerField
      FieldName = 'NR_DIAS_VENCTO_FATURA'
    end
    object qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField
      FieldName = 'DT_VALID_CRED_RF'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      OnSetText = qry_cliente_habilitacao_DT_VALID_ANVISASetText
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cliente_habilitacao_IN_COMP_SDA: TStringField
      FieldName = 'IN_COMP_SDA'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_LookCompSDA: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCompSDA'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_COMP_SDA'
      Size = 3
      Lookup = True
    end
    object qry_cliente_habilitacao_CD_IR_FAT: TStringField
      FieldName = 'CD_IR_FAT'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_DIVERSOS: TStringField
      FieldName = 'IN_DIVERSOS'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_QUADRO_TOTAL_FAT: TStringField
      FieldName = 'IN_QUADRO_TOTAL_FAT'
      Origin = 'TCLIENTE_HABILITACAO.CD_PRODUTO'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_CC_NUM: TStringField
      FieldName = 'IN_CC_NUM'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_OBS_UNICA: TStringField
      FieldName = 'IN_OBS_UNICA'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_OBS_POR_DATA: TStringField
      FieldName = 'IN_OBS_POR_DATA'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_DIA_UTIL_EMISSAO_FAT: TStringField
      FieldName = 'IN_DIA_UTIL_EMISSAO_FAT'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_TP_PORTADOR: TStringField
      FieldName = 'TP_PORTADOR'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_CD_BANCO_PORTADOR: TStringField
      FieldName = 'CD_BANCO_PORTADOR'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 3
    end
    object qry_cliente_habilitacao_LookBancoPortador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoPortador'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO_PORTADOR'
      Size = 40
      Lookup = True
    end
    object qry_cliente_habilitacao_IN_CPMF_SALDO_CREDOR: TStringField
      FieldName = 'IN_CPMF_SALDO_CREDOR'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_CALCULA_IRRF_VL_MIN: TStringField
      FieldName = 'IN_CALCULA_IRRF_VL_MIN'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_TP_TAB_SDA: TStringField
      FieldName = 'TP_TAB_SDA'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_Look_Tab_SDA: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Tab_SDA'
      LookupDataSet = qry_tp_tab_sda_
      LookupKeyFields = 'CD_TP_TAB_SDA'
      LookupResultField = 'NM_TP_TAB_SDA'
      KeyFields = 'TP_TAB_SDA'
      Size = 40
      Lookup = True
    end
    object qry_cliente_habilitacao_IN_NOTA_LIQ: TStringField
      FieldName = 'IN_NOTA_LIQ'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_FAT_REC: TStringField
      FieldName = 'IN_FAT_REC'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_EXP_NF: TStringField
      FieldName = 'IN_EXP_NF'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_NR_CONTRATO_SEGURO: TStringField
      FieldName = 'NR_CONTRATO_SEGURO'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 10
    end
    object qry_cliente_habilitacao_IN_COBRAR_ISS: TStringField
      FieldName = 'IN_COBRAR_ISS'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_NR_ALT_LINHA_FAT_EXP: TIntegerField
      FieldName = 'NR_ALT_LINHA_FAT_EXP'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
    end
    object qry_cliente_habilitacao_IN_CPMF_TOTAL: TStringField
      FieldName = 'IN_CPMF_TOTAL'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_NR_PROT_MERCANTE: TStringField
      FieldName = 'NR_PROT_MERCANTE'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      EditMask = '9999999999;1; '
      Size = 10
    end
    object qry_cliente_habilitacao_VL_MIN_DI: TFloatField
      FieldName = 'VL_MIN_DI'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_cliente_habilitacao_IN_FAT_SEM_DESP: TStringField
      FieldName = 'IN_FAT_SEM_DESP'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_NUM_FAT_EXP_AUT: TStringField
      FieldName = 'IN_NUM_FAT_EXP_AUT'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_LookNumFatExpAut: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNumFatExpAut'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_NUM_FAT_EXP_AUT'
      Size = 3
      Lookup = True
    end
    object qry_cliente_habilitacao_IN_TX_SCX_ICMS: TStringField
      FieldName = 'IN_TX_SCX_ICMS'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      OnChange = qry_cliente_habilitacao_IN_TX_SCX_ICMSChange
      Size = 1
    end
    object qry_cliente_habilitacao_IN_COBRAR_COFINS: TStringField
      FieldName = 'IN_COBRAR_COFINS'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_VL_ALIQ_COFINS_CLIENTE: TFloatField
      FieldName = 'VL_ALIQ_COFINS_CLIENTE'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
    end
    object qry_cliente_habilitacao_CD_RET_FAT: TStringField
      FieldName = 'CD_RET_FAT'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_ND: TStringField
      FieldName = 'IN_ND'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_ND'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_IN_AVISO_RETENCAO: TStringField
      FieldName = 'IN_AVISO_RETENCAO'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_AVISO_RETENCAO'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_IN_REMESSA: TStringField
      FieldName = 'IN_REMESSA'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_REMESSA'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_IN_REF_ACEITA_BARRA: TStringField
      FieldName = 'IN_REF_ACEITA_BARRA'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_REF_ACEITA_BARRA'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_NR_TAMANHO_REF: TIntegerField
      FieldName = 'NR_TAMANHO_REF'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.NR_TAMANHO_REF'
    end
    object qry_cliente_habilitacao_IN_BORDERO: TStringField
      FieldName = 'IN_BORDERO'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_BORDERO'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_IN_ENVIA_PDF: TStringField
      FieldName = 'IN_ENVIA_PDF'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_ENVIA_PDF'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_IN_DOCTO_SOLIC: TStringField
      FieldName = 'IN_DOCTO_SOLIC'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_DOCTO_SOLIC'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_IN_AUTO_MERC_FABR: TStringField
      DisplayLabel = 'Preenche Auto. Merc. na F'#225'brica'
      FieldName = 'IN_AUTO_MERC_FABR'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_AUTO_MERC_FABR'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_DT_VALID_ANVISA: TDateTimeField
      FieldName = 'DT_VALID_ANVISA'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.DT_VALID_ANVISA'
      OnSetText = qry_cliente_habilitacao_DT_VALID_ANVISASetText
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cliente_habilitacao_IN_TP_RETENCAO_IR: TStringField
      FieldName = 'IN_TP_RETENCAO_IR'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_TP_RETENCAO_IR'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_IN_TP_RETENCAO_COFINS: TStringField
      FieldName = 'IN_TP_RETENCAO_COFINS'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_TP_RETENCAO_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_cliente_habilitacao_NR_DIA_VENCTO: TStringField
      FieldName = 'NR_DIA_VENCTO'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.NR_DIA_VENCTO'
      FixedChar = True
      Size = 2
    end
    object qry_cliente_habilitacao_NR_DIA_VENCTO_BASE: TStringField
      FieldName = 'NR_DIA_VENCTO_BASE'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.NR_DIA_VENCTO_BASE'
      FixedChar = True
      Size = 2
    end
    object qry_cliente_habilitacao_CD_ATENDENTE: TStringField
      FieldName = 'CD_ATENDENTE'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.CD_ATENDENTE'
      FixedChar = True
      Size = 4
    end
    object qry_cliente_habilitacao_NM_EMAILS: TStringField
      FieldName = 'NM_EMAILS'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.NM_EMAILS'
      FixedChar = True
      Size = 255
    end
    object qry_cliente_habilitacao_DT_RADAR: TDateTimeField
      FieldName = 'DT_RADAR'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.DT_RADAR'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cliente_habilitacao_DT_REAJUSTE_IMP: TDateTimeField
      FieldName = 'DT_REAJUSTE_IMP'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.DT_REAJUSTE_IMP'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cliente_habilitacao_DT_REAJUSTE_EXP: TDateTimeField
      FieldName = 'DT_REAJUSTE_EXP'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.DT_REAJUSTE_EXP'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_cliente_habilitacao_NM_EMAIL_EMPRESA: TStringField
      FieldName = 'NM_EMAIL_EMPRESA'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.NM_EMAIL_EMPRESA'
      Size = 100
    end
    object qry_cliente_habilitacao_DS_CONTA_DHL: TStringField
      FieldName = 'DS_CONTA_DHL'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.DS_CONTA_DHL'
      Size = 100
    end
    object qry_cliente_habilitacao_DT_PROCURACAO_RECEBIDA: TDateTimeField
      FieldName = 'DT_PROCURACAO_RECEBIDA'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.DT_PROCURACAO_RECEBIDA'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object ds_tipo_pessoa: TDataSource
    DataSet = qry_tipo_pessoa_
    Left = 562
    Top = 37
  end
  object ds_sda: TDataSource
    DataSet = qry_sda_
    Left = 60
    Top = 240
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 60
    Top = 188
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO (NOLOCK)')
    Left = 62
    Top = 140
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
  object ds_grupo: TDataSource
    DataSet = qry_grupo_
    Left = 60
    Top = 292
  end
  object qry_ult_emp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_EMPRESA) AS ULTIMO'
      'FROM TEMPRESA_NAC (NOLOCK)')
    Left = 178
    Top = 399
    object qry_ult_emp_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
  end
  object qry_empresa_nac_: TQuery
    CachedUpdates = True
    AfterInsert = qry_empresa_nac_AfterInsert
    BeforePost = qry_empresa_nac_BeforePost
    AfterPost = qry_empresa_nac_AfterPost
    AfterDelete = qry_empresa_nac_AfterDelete
    AfterScroll = qry_empresa_nac_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        ' SELECT  CD_EMPRESA, NM_EMPRESA,AP_EMPRESA,END_EMPRESA,END_NUMER' +
        'O,END_CIDADE,'
      
        'END_BAIRRO,END_UF,END_CEP,CD_TIPO_PESSOA,CGC_EMPRESA,CPF_EMPRESA' +
        ','
      
        'IE_EMPRESA,IM_EMPRESA,OUTRO_DOC,DT_INCLUSAO,IN_FATURAMENTO,IN_AT' +
        'IVO,'
      'IN_RESTRICAO,IN_EVENTUAL,CD_TIPO_REF,IN_CLIENTE,IN_IMPORTADOR,'
      
        'IN_EXPORTADOR,IN_OUTROS,CD_GRUPO,IN_REPRESENTANTE,NM_INDICADO_PO' +
        'R,CD_CT_CONTABIL,'
      
        'TX_OBS,CD_PAIS_IMPORTADOR,CD_ATIV_ECONOMICA,IN_SEGURADORA,CD_ACE' +
        'SSO,CD_AUX,'
      
        'NR_CAE,CD_MOEDA_JUROS,NR_TELEFONE,NR_FAX,IN_LIBERA_DI,CD_INDICAD' +
        'O_POR,'
      
        'PATH_LOGO,IN_COMPRADOR,TP_DEM_EMAIL,NR_RG,TP_RECOLHE_MP164,PROTE' +
        'CAO_MOEDA,'
      
        'NR_ACCOUNT,IN_COMERCIAL,CD_ACESSO_PIS,CD_AUX_PIS,CD_CT_CONTABIL_' +
        'PIS,'
      'IN_REF_ACEITA_BARRA,IN_CAT63,CD_TOTAL_NF_DDNOTA,IN_CONFERE_NF,'
      
        'IN_PRENCHE_FATURA,IN_VERIF_ICMS_TRANSM,IN_REGIME_ESP,CD_FUND_LEG' +
        'AL_ICMS,'
      
        'IN_COTACAO,IN_ENVIA_BOLETO_DDA, IN_MARINHA_MERCANTE_ICMS, END_ID' +
        '_LOCALIDADE,'
      
        ' COD_INTERNO, ID_REPRESENTANTE, ID_REPRESENTADA ,CD_TIPO_BASE_SE' +
        'GURO_DI , '
      
        'PC_SEGURO_MLE_DI , DS_LICENCA_SANITARIA,TX_DADOS_BANCARIOS_FATCO' +
        'M, FIESP_ID_END'
      
        ' FROM TEMPRESA_NAC (NOLOCK) where  IN_ATIVO = 1  or ( :IN_ATIVO ' +
        'is not null )'
      'ORDER BY'
      'CD_EMPRESA'
      '')
    UpdateObject = upd_empresa_nac
    Left = 154
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ATIVO'
        ParamType = ptInput
      end>
    object qry_empresa_nac_CD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
    object qry_empresa_nac_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TEMPRESA_NAC.END_NUMERO'
      Size = 6
    end
    object qry_empresa_nac_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.END_CIDADE'
      Size = 30
    end
    object qry_empresa_nac_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TEMPRESA_NAC.END_BAIRRO'
      Size = 30
    end
    object qry_empresa_nac_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TEMPRESA_NAC.END_UF'
      Size = 2
    end
    object qry_empresa_nac_END_CEP: TStringField
      DisplayWidth = 9
      FieldName = 'END_CEP'
      Origin = 'TEMPRESA_NAC.END_CEP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object qry_empresa_nac_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TEMPRESA_NAC.CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_empresa_nac_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.CGC_EMPRESA'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_empresa_nac_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TEMPRESA_NAC.CPF_EMPRESA'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_empresa_nac_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'TEMPRESA_NAC.IE_EMPRESA'
    end
    object qry_empresa_nac_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TEMPRESA_NAC.DT_INCLUSAO'
    end
    object qry_empresa_nac_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Origin = 'TEMPRESA_NAC.IN_FATURAMENTO'
      Size = 1
    end
    object qry_empresa_nac_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMPRESA_NAC.IN_ATIVO'
      Size = 1
    end
    object qry_empresa_nac_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Origin = 'TEMPRESA_NAC.IN_RESTRICAO'
      Size = 1
    end
    object qry_empresa_nac_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Origin = 'TEMPRESA_NAC.IN_EVENTUAL'
      Size = 1
    end
    object qry_empresa_nac_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Origin = 'TEMPRESA_NAC.CD_TIPO_REF'
      Size = 1
    end
    object qry_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Origin = 'TEMPRESA_NAC.IN_CLIENTE'
    end
    object qry_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Origin = 'TEMPRESA_NAC.IN_IMPORTADOR'
    end
    object qry_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Origin = 'TEMPRESA_NAC.IN_EXPORTADOR'
    end
    object qry_empresa_nac_IN_SEGURADORA: TBooleanField
      FieldName = 'IN_SEGURADORA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Origin = 'TEMPRESA_NAC.IN_OUTROS'
    end
    object qry_empresa_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TEMPRESA_NAC.CD_GRUPO'
      Size = 3
    end
    object qry_empresa_nac_IN_REPRESENTANTE: TBooleanField
      FieldName = 'IN_REPRESENTANTE'
      Origin = 'TEMPRESA_NAC.IN_REPRESENTANTE'
    end
    object qry_empresa_nac_CD_MOEDA_JUROS: TStringField
      FieldName = 'CD_MOEDA_JUROS'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 3
    end
    object qry_empresa_nac_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookEventual: TStringField
      FieldKind = fkLookup
      FieldName = 'LookEventual'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_EVENTUAL'
      Size = 3
      Lookup = True
    end
    object NR_CAE: TStringField
      FieldKind = fkLookup
      FieldName = 'LookRestricao'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_RESTRICAO'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookTipoRef: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTipoRef'
      LookupDataSet = qry_tipo_ref_
      LookupKeyFields = 'CD_TIPO_REF'
      LookupResultField = 'NM_TIPO_REF'
      KeyFields = 'CD_TIPO_REF'
      Lookup = True
    end
    object qry_empresa_nac_LookTpDemEmail: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTpDemEmail'
      LookupDataSet = qry_tp_dem_email_
      LookupKeyFields = 'TP_DEM_EMAIL'
      LookupResultField = 'NM_TP_DEM_EMAIL'
      KeyFields = 'TP_DEM_EMAIL'
      Size = 50
      Lookup = True
    end
    object qry_empresa_nac_LookINCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'LookINCliente'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CLIENTE'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookINImportador: TStringField
      DisplayLabel = 'Importador'
      FieldKind = fkLookup
      FieldName = 'LookINImportador'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_IMPORTADOR'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookINExportador: TStringField
      DisplayLabel = 'Exportador'
      FieldKind = fkLookup
      FieldName = 'LookINExportador'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_EXPORTADOR'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookINRepresentante: TStringField
      DisplayLabel = 'Representante'
      FieldKind = fkLookup
      FieldName = 'LookINRepresentante'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_REPRESENTANTE'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_LookINOutros: TStringField
      DisplayLabel = 'Outros'
      FieldKind = fkLookup
      FieldName = 'LookINOutros'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_OUTROS'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_NM_INDICADO_POR: TStringField
      FieldName = 'NM_INDICADO_POR'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 1
    end
    object qry_empresa_nac_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 3
    end
    object qry_empresa_nac_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      BlobType = ftMemo
    end
    object qry_empresa_nac_CD_PAIS_IMPORTADOR: TStringField
      DisplayWidth = 3
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 3
    end
    object qry_empresa_nac_CD_ATIV_ECONOMICA: TStringField
      FieldName = 'CD_ATIV_ECONOMICA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 4
    end
    object qry_empresa_nac_NR_CAE: TStringField
      DisplayWidth = 10
      FieldName = 'NR_CAE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 10
    end
    object qry_empresa_nac_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 15
    end
    object qry_empresa_nac_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 15
    end
    object qry_empresa_nac_IN_LIBERA_DI: TStringField
      FieldName = 'IN_LIBERA_DI'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 1
    end
    object qry_empresa_nac_LookLiberaDI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookLiberaDI'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_LIBERA_DI'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_CD_INDICADO_POR: TStringField
      FieldName = 'CD_INDICADO_POR'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 3
    end
    object qry_empresa_nac_PATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 100
    end
    object qry_empresa_nac_LookINComprador: TStringField
      DisplayLabel = 'Comprador'
      FieldKind = fkLookup
      FieldName = 'LookINComprador'
      LookupDataSet = qry_yesno_
      LookupKeyFields = 'IN_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_COMPRADOR'
      Size = 3
      Lookup = True
    end
    object qry_empresa_nac_IN_COMPRADOR: TBooleanField
      FieldName = 'IN_COMPRADOR'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_IM_EMPRESA: TStringField
      FieldName = 'IM_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
    end
    object qry_empresa_nac_TP_DEM_EMAIL: TStringField
      FieldName = 'TP_DEM_EMAIL'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 1
    end
    object qry_empresa_nac_NR_RG: TStringField
      FieldName = 'NR_RG'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 15
    end
    object qry_empresa_nac_TP_RECOLHE_MP164: TStringField
      FieldName = 'TP_RECOLHE_MP164'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 1
    end
    object qry_empresa_nac_PROTECAO_MOEDA: TFloatField
      FieldName = 'PROTECAO_MOEDA'
      Origin = 'DBBROKER.TEMPRESA_NAC.PROTECAO_MOEDA'
    end
    object qry_empresa_nac_NR_ACCOUNT: TStringField
      FieldName = 'NR_ACCOUNT'
      Origin = 'DBBROKER.TEMPRESA_NAC.NR_ACCOUNT'
      FixedChar = True
      Size = 14
    end
    object qry_empresa_nac_IN_COMERCIAL: TBooleanField
      FieldName = 'IN_COMERCIAL'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_COMERCIAL'
    end
    object qry_empresa_nac_CD_ACESSO_PIS: TStringField
      FieldName = 'CD_ACESSO_PIS'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_ACESSO_PIS'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_CD_AUX_PIS: TStringField
      FieldName = 'CD_AUX_PIS'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_AUX_PIS'
      FixedChar = True
      Size = 3
    end
    object qry_empresa_nac_IN_REF_ACEITA_BARRA: TStringField
      FieldName = 'IN_REF_ACEITA_BARRA'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_REF_ACEITA_BARRA'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_IN_CAT63: TStringField
      FieldName = 'IN_CAT63'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_CAT63'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_CD_TOTAL_NF_DDNOTA: TStringField
      FieldName = 'CD_TOTAL_NF_DDNOTA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_TOTAL_NF_DDNOTA'
      EditMask = '000000;0;_'
      FixedChar = True
      Size = 6
    end
    object qry_empresa_nac_IN_CONFERE_NF: TStringField
      FieldName = 'IN_CONFERE_NF'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_CONFERE_NF'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_IN_PRENCHE_FATURA: TStringField
      FieldName = 'IN_PRENCHE_FATURA'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_PRENCHE_FATURA'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_IN_VERIF_ICMS_TRANSM: TStringField
      FieldName = 'IN_VERIF_ICMS_TRANSM'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_VERIF_ICMS_TRANSM'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_IN_REGIME_ESP: TStringField
      FieldName = 'IN_REGIME_ESP'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_REGIME_ESP'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_CD_CT_CONTABIL: TStringField
      DisplayWidth = 12
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_empresa_nac_CD_CT_CONTABIL_PIS: TStringField
      DisplayWidth = 12
      FieldName = 'CD_CT_CONTABIL_PIS'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_CT_CONTABIL_PIS'
      FixedChar = True
      Size = 12
    end
    object qry_empresa_nac_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_empresa_nac_IN_COTACAO: TStringField
      FieldName = 'IN_COTACAO'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_COTACAO'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_IN_ENVIA_BOLETO_DDA: TStringField
      FieldName = 'IN_ENVIA_BOLETO_DDA'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_ENVIA_BOLETO_DDA'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_IN_MARINHA_MERCANTE_ICMS: TStringField
      FieldName = 'IN_MARINHA_MERCANTE_ICMS'
      Origin = 'DBBROKER.TEMPRESA_NAC.IN_MARINHA_MERCANTE_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_empresa_nac_END_ID_LOCALIDADE: TIntegerField
      FieldName = 'END_ID_LOCALIDADE'
    end
    object qry_empresa_nac_COD_INTERNO: TStringField
      FieldName = 'COD_INTERNO'
    end
    object qry_empresa_nac_ID_REPRESENTANTE: TStringField
      FieldName = 'ID_REPRESENTANTE'
      Size = 32
    end
    object qry_empresa_nac_ID_REPRESENTADA: TStringField
      FieldName = 'ID_REPRESENTADA'
      Size = 32
    end
    object qry_empresa_nac_CD_TIPO_BASE_SEGURO_DI: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO_DI'
      Size = 1
    end
    object qry_empresa_nac_PC_SEGURO_MLE_DI: TFloatField
      FieldName = 'PC_SEGURO_MLE_DI'
    end
    object qry_empresa_nac_DS_LICENCA_SANITARIA: TStringField
      FieldName = 'DS_LICENCA_SANITARIA'
      Origin = 'DBBROKER.TEMPRESA_NAC.DS_LICENCA_SANITARIA'
      FixedChar = True
      Size = 50
    end
    object qry_empresa_nac_TX_DADOS_BANCARIOS_FATCOM: TStringField
      FieldName = 'TX_DADOS_BANCARIOS_FATCOM'
      Origin = 'DBBROKER.TEMPRESA_NAC.TX_DADOS_BANCARIOS_FATCOM'
      FixedChar = True
      Size = 255
    end
    object qry_empresa_nac_FIESP_ID_END: TIntegerField
      FieldName = 'FIESP_ID_END'
    end
  end
  object sp_excluir_cli_habilitacao_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_excluir_cli_habilitacao'
    Left = 576
    Top = 412
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
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
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object sp_excluir_cli_contatos_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_excluir_cli_contatos'
    Left = 576
    Top = 461
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
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
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object sp_excluir_cli_soli_num_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_excluir_cli_soli_num'
    Left = 576
    Top = 508
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
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
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, NM_UNID_NEG, UPPER(AP_UNID_NEG) AP_UNID_NEG ' +
        'FROM'
      'TUNID_NEG  (NOLOCK)')
    Left = 62
    Top = 92
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
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.AP_UNID_NEG'
      FixedChar = True
      Size = 10
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO (NOLOCK)')
    Left = 62
    Top = 188
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
  end
  object qry_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SDA, TX_DESCRICAO'
      'FROM TSDA (NOLOCK)')
    Left = 62
    Top = 240
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
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM TGRUPO (NOLOCK)')
    Left = 62
    Top = 292
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
  end
  object qry_usuario_hab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(CD_USUARIO) AS OK'
      'FROM TUSUARIO_HABILITACAO  (NOLOCK)'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'IN_ATIVO = '#39'1'#39)
    Left = 292
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
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
      end>
  end
  object qry_cli_DI_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(CD_IMPORTADOR)  AS TOT_IMP'
      'FROM TDECLARACAO_IMPORTACAO  (NOLOCK)'
      'WHERE CD_IMPORTADOR = :CD_IMPORTADOR')
    Left = 178
    Top = 140
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_IMPORTADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_cli_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(CD_CLIENTE)  AS TOT_CLI'
      'FROM TPROCESSO  (NOLOCK)'
      'WHERE CD_CLIENTE = :CD_CLIENTE')
    Left = 178
    Top = 188
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCONTABIL_PLANO (NOLOCK)'
      'WHERE  CD_COLIGADA = '#39'01'#39)
    Left = 178
    Top = 347
  end
  object qry_mod_follow_up: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_FOLLOW_UP, NM_FOLLOW_UP'
      'FROM TMOD_FOLLOW_UP  (NOLOCK)')
    Left = 178
    Top = 240
    object qry_mod_follow_upCD_FOLLOW_UP: TStringField
      FieldName = 'CD_FOLLOW_UP'
      Origin = 'TMOD_FOLLOW_UP.CD_FOLLOW_UP'
      Size = 2
    end
    object qry_mod_follow_upNM_FOLLOW_UP: TStringField
      FieldName = 'NM_FOLLOW_UP'
      Origin = 'TMOD_FOLLOW_UP.NM_FOLLOW_UP'
      Size = 30
    end
  end
  object qry_mod_numerario: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_NUMERARIO, NM_NUMERARIO, IN_USD'
      'FROM TMOD_NUMERARIO (NOLOCK)')
    Left = 178
    Top = 292
    object qry_mod_numerarioCD_NUMERARIO: TStringField
      FieldName = 'CD_NUMERARIO'
      Origin = 'TMOD_NUMERARIO.CD_NUMERARIO'
      Size = 2
    end
    object qry_mod_numerarioNM_NUMERARIO: TStringField
      FieldName = 'NM_NUMERARIO'
      Origin = 'TMOD_NUMERARIO.NM_NUMERARIO'
      Size = 30
    end
    object qry_mod_numerarioIN_USD: TStringField
      FieldName = 'IN_USD'
      Origin = 'TMOD_NUMERARIO.CD_NUMERARIO'
      Size = 1
    end
  end
  object qry_num_usd_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_habilitacao
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCLIENTE_NUMERARIO_USD (NOLOCK)'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO')
    Left = 62
    Top = 343
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
      end>
    object qry_num_usd_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_NUMERARIO_USD.CD_CLIENTE'
      Size = 5
    end
    object qry_num_usd_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_NUMERARIO_USD.CD_UNID_NEG'
      Size = 2
    end
    object qry_num_usd_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_NUMERARIO_USD.CD_PRODUTO'
      Size = 2
    end
    object qry_num_usd_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCLIENTE_NUMERARIO_USD.CD_ITEM'
      Size = 3
    end
    object qry_num_usd_LookItem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_num_usd_Look_solic_num: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_solic_num'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'IN_SOLIC_NUM'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_num_usd_Look_ativo: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_ativo'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'IN_ATIVO'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT I.CD_ITEM, I.NM_ITEM, T.IN_SOLIC_NUM, I.IN_ATIVO'
      'FROM TITEM I  (NOLOCK), TTIPO_ITEM T  (NOLOCK)'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM ')
    Left = 292
    Top = 188
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_IN_SOLIC_NUM: TStringField
      FieldName = 'IN_SOLIC_NUM'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
    object qry_item_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object ds_num_usd: TDataSource
    DataSet = qry_num_usd_
    Left = 60
    Top = 343
  end
  object qry_ativ_economica_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TAB_ATIV_ECONOMICA (NOLOCK)')
    Left = 292
    Top = 292
    object qry_ativ_economica_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TAB_ATIV_ECONOMICA.CODIGO'
      Size = 4
    end
    object qry_ativ_economica_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TAB_ATIV_ECONOMICA.DESCRICAO'
      Size = 120
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPAIS (NOLOCK)')
    Left = 292
    Top = 347
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
  object ds_responsavel: TDataSource
    DataSet = qry_responsavel_
    Left = 68
    Top = 396
  end
  object qry_responsavel_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TRESPONSAVEL  (NOLOCK)')
    Left = 62
    Top = 396
    object qry_responsavel_CD_RESPONSAVEL: TStringField
      FieldName = 'CD_RESPONSAVEL'
      Origin = 'TRESPONSAVEL.CD_RESPONSAVEL'
      Size = 1
    end
    object qry_responsavel_NM_RESPONSAVEL: TStringField
      FieldName = 'NM_RESPONSAVEL'
      Origin = 'TRESPONSAVEL.NM_RESPONSAVEL'
      Size = 15
    end
  end
  object qry_yesno_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO, IN_YESNO'
      'FROM TYES_NO  (NOLOCK)')
    Left = 564
    Top = 324
    object qry_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
    object qry_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
    end
  end
  object qry_tipo_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'Select * from TTIPO_REF  (NOLOCK)')
    Left = 292
    Top = 92
    object qry_tipo_ref_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Origin = 'TTIPO_REF.CD_TIPO_REF'
      Size = 1
    end
    object qry_tipo_ref_NM_TIPO_REF: TStringField
      FieldName = 'NM_TIPO_REF'
      Origin = 'TTIPO_REF.NM_TIPO_REF'
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS (NOLOCK)')
    Left = 292
    Top = 399
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL (NOLOCK)'
      
        'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX AND CD_IDENTIFICADOR = ' +
        #39'A'#39' AND'
      '       ANO_CONTA =:ANO_CONTA'
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 178
    Top = 452
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO_AUX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANO_CONTA'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX'
      ' FROM TCT_CONTABIL (NOLOCK)'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 292
    Top = 452
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_ACESSO'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.CD_AUX'
      Size = 3
    end
  end
  object qry_tipo_pessoa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_PESSOA, NM_TIPO_PESSOA'
      'FROM TTIPO_PESSOA  (NOLOCK)')
    Left = 564
    Top = 37
    object qry_tipo_pessoa_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TTIPO_PESSOA.CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_tipo_pessoa_NM_TIPO_PESSOA: TStringField
      FieldName = 'NM_TIPO_PESSOA'
      Origin = 'TTIPO_PESSOA.NM_TIPO_PESSOA'
      Size = 30
    end
  end
  object qry_tp_followup_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_FOLLOW_UP, NM_TP_FOLLOW_UP, IN_MOD_FOLLOW_UP'
      'FROM TTP_FOLLOW_UP (NOLOCK)'
      '')
    Left = 292
    Top = 140
    object qry_tp_followup_CD_TP_FOLLOW_UP: TStringField
      FieldName = 'CD_TP_FOLLOW_UP'
      Origin = 'TTP_FOLLOW_UP.CD_TP_FOLLOW_UP'
      Size = 2
    end
    object qry_tp_followup_NM_TP_FOLLOW_UP: TStringField
      FieldName = 'NM_TP_FOLLOW_UP'
      Origin = 'TTP_FOLLOW_UP.NM_TP_FOLLOW_UP'
    end
    object qry_tp_followup_IN_MOD_FOLLOW_UP: TStringField
      FieldName = 'IN_MOD_FOLLOW_UP'
      Origin = 'TTP_FOLLOW_UP.CD_TP_FOLLOW_UP'
      Size = 1
    end
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA'
      'FROM   TMOEDA_BROKER (NOLOCK)')
    Left = 178
    Top = 92
    object qry_moeda_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA_BROKER.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA_BROKER.NM_MOEDA'
      Size = 30
    end
  end
  object qry_ir_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_IR_FAT, NM_IR_FAT'
      'FROM TIR_FAT (NOLOCK)')
    Left = 62
    Top = 449
    object qry_ir_fat_CD_IR_FAT: TStringField
      FieldName = 'CD_IR_FAT'
      Origin = 'TIR_FAT.CD_IR_FAT'
      Size = 1
    end
    object qry_ir_fat_NM_IR_FAT: TStringField
      FieldName = 'NM_IR_FAT'
      Origin = 'TIR_FAT.NM_IR_FAT'
    end
  end
  object ds_ir_fat: TDataSource
    DataSet = qry_ir_fat_
    Left = 68
    Top = 449
  end
  object qry_cliente_cnpj_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE  CGC_EMPRESA = :CGC_EMPRESA AND'
      '       CD_EMPRESA <> :CD_EMPRESA')
    Left = 417
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'CGC_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_cliente_cnpj_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
  end
  object qry_cliente_cpf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) TOT_CPF'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE  CPF_EMPRESA = :CPF_EMPRESA AND'
      '       CD_EMPRESA <> :CD_EMPRESA')
    Left = 417
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'CPF_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_cliente_cpf_TOT_CPF: TIntegerField
      FieldName = 'TOT_CPF'
    end
  end
  object qry_tot_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) TOT_PROC'
      'FROM   TPROCESSO'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_CLIENTE = :CD_CLIENTE AND'
      '       IN_CANCELADO = '#39'0'#39)
    Left = 177
    Top = 505
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
      end>
    object qry_tot_proc_TOT_PROC: TIntegerField
      FieldName = 'TOT_PROC'
    end
  end
  object qry_tp_tab_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_TAB_SDA, NM_TP_TAB_SDA'
      'FROM   TTP_TAB_SDA (NOLOCK)')
    Left = 417
    Top = 352
    object qry_tp_tab_sda_CD_TP_TAB_SDA: TStringField
      FieldName = 'CD_TP_TAB_SDA'
      Origin = 'TTP_TAB_SDA.CD_TP_TAB_SDA'
      Size = 1
    end
    object qry_tp_tab_sda_NM_TP_TAB_SDA: TStringField
      FieldName = 'NM_TP_TAB_SDA'
      Origin = 'TTP_TAB_SDA.NM_TP_TAB_SDA'
      Size = 30
    end
  end
  object qry_upd_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TCLIENTE_SERVICO'
      'SET    CD_TAB_SDA  = '#39#39
      'WHERE  CD_CLIENTE  = :CD_CLIENTE  AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO  = :CD_PRODUTO')
    Left = 422
    Top = 511
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
      end>
  end
  object qry_cliente_indicado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CLIENTE_INDICADO, NM_CLIENTE_INDICADO'
      'FROM TCLIENTE_INDICADO (NOLOCK)')
    Left = 421
    Top = 84
    object qry_cliente_indicado_CD_CLIENTE_INDICADO: TStringField
      FieldName = 'CD_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.CD_CLIENTE_INDICADO'
      Size = 3
    end
    object qry_cliente_indicado_NM_CLIENTE_INDICADO: TStringField
      FieldName = 'NM_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.NM_CLIENTE_INDICADO'
      Size = 30
    end
  end
  object qry_tp_dem_email_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TTP_DEM_EMAIL (NOLOCK)')
    Left = 295
    Top = 508
    object qry_tp_dem_email_TP_DEM_EMAIL: TStringField
      FieldName = 'TP_DEM_EMAIL'
      Origin = 'TTP_DEM_EMAIL.TP_DEM_EMAIL'
      Size = 1
    end
    object qry_tp_dem_email_NM_TP_DEM_EMAIL: TStringField
      FieldName = 'NM_TP_DEM_EMAIL'
      Origin = 'TTP_DEM_EMAIL.NM_TP_DEM_EMAIL'
      Size = 50
    end
  end
  object qry_cliente_rg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA'
      'FROM   TEMPRESA_NAC'
      'WHERE  NR_RG = :NR_RG AND'
      '       CD_EMPRESA <> :CD_EMPRESA')
    Left = 417
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_RG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_cliente_rg_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
  end
  object ds_ret_fat: TDataSource
    DataSet = qry_ret_fat_
    Left = 68
    Top = 513
  end
  object qry_ret_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_RET_FAT, NM_RET_FAT'
      'FROM TRET_FAT  (NOLOCK)')
    Left = 62
    Top = 505
    object qry_ret_fat_CD_RET_FAT: TStringField
      FieldName = 'CD_RET_FAT'
      Origin = 'TRET_FAT.CD_RET_FAT'
      Size = 1
    end
    object qry_ret_fat_NM_RET_FAT: TStringField
      FieldName = 'NM_RET_FAT'
      Origin = 'TRET_FAT.NM_RET_FAT'
    end
  end
  object upd_empresa_nac: TUpdateSQL
    ModifySQL.Strings = (
      'update TEMPRESA_NAC'
      'set'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  NM_EMPRESA = :NM_EMPRESA,'
      '  AP_EMPRESA = :AP_EMPRESA,'
      '  END_EMPRESA = :END_EMPRESA,'
      '  END_NUMERO = :END_NUMERO,'
      '  END_CIDADE = :END_CIDADE,'
      '  END_BAIRRO = :END_BAIRRO,'
      '  END_UF = :END_UF,'
      '  END_CEP = :END_CEP,'
      '  CD_TIPO_PESSOA = :CD_TIPO_PESSOA,'
      '  CGC_EMPRESA = :CGC_EMPRESA,'
      '  CPF_EMPRESA = :CPF_EMPRESA,'
      '  IE_EMPRESA = :IE_EMPRESA,'
      '  IM_EMPRESA = :IM_EMPRESA,'
      '  OUTRO_DOC = :OUTRO_DOC,'
      '  DT_INCLUSAO = :DT_INCLUSAO,'
      '  IN_FATURAMENTO = :IN_FATURAMENTO,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  IN_RESTRICAO = :IN_RESTRICAO,'
      '  IN_EVENTUAL = :IN_EVENTUAL,'
      '  CD_TIPO_REF = :CD_TIPO_REF,'
      '  IN_CLIENTE = :IN_CLIENTE,'
      '  IN_IMPORTADOR = :IN_IMPORTADOR,'
      '  IN_EXPORTADOR = :IN_EXPORTADOR,'
      '  IN_OUTROS = :IN_OUTROS,'
      '  CD_GRUPO = :CD_GRUPO,'
      '  IN_REPRESENTANTE = :IN_REPRESENTANTE,'
      '  NM_INDICADO_POR = :NM_INDICADO_POR,'
      '  CD_CT_CONTABIL = :CD_CT_CONTABIL,'
      '  TX_OBS = :TX_OBS,'
      '  CD_PAIS_IMPORTADOR = :CD_PAIS_IMPORTADOR,'
      '  CD_ATIV_ECONOMICA = :CD_ATIV_ECONOMICA,'
      '  IN_SEGURADORA = :IN_SEGURADORA,'
      '  CD_ACESSO = :CD_ACESSO,'
      '  CD_AUX = :CD_AUX,'
      '  NR_CAE = :NR_CAE,'
      '  CD_MOEDA_JUROS = :CD_MOEDA_JUROS,'
      '  NR_TELEFONE = :NR_TELEFONE,'
      '  NR_FAX = :NR_FAX,'
      '  IN_LIBERA_DI = :IN_LIBERA_DI,'
      '  CD_INDICADO_POR = :CD_INDICADO_POR,'
      '  PATH_LOGO = :PATH_LOGO,'
      '  IN_COMPRADOR = :IN_COMPRADOR,'
      '  TP_DEM_EMAIL = :TP_DEM_EMAIL,'
      '  NR_RG = :NR_RG,'
      '  TP_RECOLHE_MP164 = :TP_RECOLHE_MP164,'
      '  PROTECAO_MOEDA = :PROTECAO_MOEDA,'
      '  NR_ACCOUNT = :NR_ACCOUNT,'
      '  IN_COMERCIAL = :IN_COMERCIAL,'
      '  CD_ACESSO_PIS = :CD_ACESSO_PIS,'
      '  CD_AUX_PIS = :CD_AUX_PIS,'
      '  CD_CT_CONTABIL_PIS = :CD_CT_CONTABIL_PIS,'
      '  IN_REF_ACEITA_BARRA = :IN_REF_ACEITA_BARRA,'
      '  IN_CAT63 = :IN_CAT63,'
      '  CD_TOTAL_NF_DDNOTA = :CD_TOTAL_NF_DDNOTA,'
      '  IN_CONFERE_NF = :IN_CONFERE_NF,'
      '  IN_PRENCHE_FATURA = :IN_PRENCHE_FATURA,'
      '  IN_VERIF_ICMS_TRANSM = :IN_VERIF_ICMS_TRANSM,'
      '  IN_REGIME_ESP = :IN_REGIME_ESP,'
      '  CD_FUND_LEGAL_ICMS = :CD_FUND_LEGAL_ICMS,'
      '  IN_COTACAO = :IN_COTACAO,'
      '  IN_ENVIA_BOLETO_DDA = :IN_ENVIA_BOLETO_DDA,'
      '  IN_MARINHA_MERCANTE_ICMS = :IN_MARINHA_MERCANTE_ICMS,'
      '  END_ID_LOCALIDADE = :END_ID_LOCALIDADE,'
      '  COD_INTERNO = :COD_INTERNO,'
      '  ID_REPRESENTANTE = :ID_REPRESENTANTE,'
      '  ID_REPRESENTADA = :ID_REPRESENTADA,'
      '  CD_TIPO_BASE_SEGURO_DI = :CD_TIPO_BASE_SEGURO_DI,'
      '  PC_SEGURO_MLE_DI = :PC_SEGURO_MLE_DI,'
      '  DS_LICENCA_SANITARIA = :DS_LICENCA_SANITARIA,'
      '  TX_DADOS_BANCARIOS_FATCOM = :TX_DADOS_BANCARIOS_FATCOM,'
      '  FIESP_ID_END = :FIESP_ID_END'
      'where'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    InsertSQL.Strings = (
      'insert into TEMPRESA_NAC'
      
        '  (CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_EMPRESA, END_NUMERO, ' +
        'END_CIDADE, '
      
        '   END_BAIRRO, END_UF, END_CEP, CD_TIPO_PESSOA, CGC_EMPRESA, CPF' +
        '_EMPRESA, '
      
        '   IE_EMPRESA, IM_EMPRESA, OUTRO_DOC, DT_INCLUSAO, IN_FATURAMENT' +
        'O, IN_ATIVO, '
      
        '   IN_RESTRICAO, IN_EVENTUAL, CD_TIPO_REF, IN_CLIENTE, IN_IMPORT' +
        'ADOR, IN_EXPORTADOR, '
      
        '   IN_OUTROS, CD_GRUPO, IN_REPRESENTANTE, NM_INDICADO_POR, CD_CT' +
        '_CONTABIL, '
      
        '   TX_OBS, CD_PAIS_IMPORTADOR, CD_ATIV_ECONOMICA, IN_SEGURADORA,' +
        ' CD_ACESSO, '
      
        '   CD_AUX, NR_CAE, CD_MOEDA_JUROS, NR_TELEFONE, NR_FAX, IN_LIBER' +
        'A_DI, CD_INDICADO_POR, '
      
        '   PATH_LOGO, IN_COMPRADOR, TP_DEM_EMAIL, NR_RG, TP_RECOLHE_MP16' +
        '4, PROTECAO_MOEDA, '
      
        '   NR_ACCOUNT, IN_COMERCIAL, CD_ACESSO_PIS, CD_AUX_PIS, CD_CT_CO' +
        'NTABIL_PIS, '
      
        '   IN_REF_ACEITA_BARRA, IN_CAT63, CD_TOTAL_NF_DDNOTA, IN_CONFERE' +
        '_NF, IN_PRENCHE_FATURA, '
      
        '   IN_VERIF_ICMS_TRANSM, IN_REGIME_ESP, CD_FUND_LEGAL_ICMS, IN_C' +
        'OTACAO, '
      
        '   IN_ENVIA_BOLETO_DDA, IN_MARINHA_MERCANTE_ICMS, END_ID_LOCALID' +
        'ADE, COD_INTERNO, '
      
        '   ID_REPRESENTANTE, ID_REPRESENTADA, CD_TIPO_BASE_SEGURO_DI, PC' +
        '_SEGURO_MLE_DI, '
      
        '   DS_LICENCA_SANITARIA, TX_DADOS_BANCARIOS_FATCOM, FIESP_ID_END' +
        ')'
      'values'
      
        '  (:CD_EMPRESA, :NM_EMPRESA, :AP_EMPRESA, :END_EMPRESA, :END_NUM' +
        'ERO, :END_CIDADE, '
      
        '   :END_BAIRRO, :END_UF, :END_CEP, :CD_TIPO_PESSOA, :CGC_EMPRESA' +
        ', :CPF_EMPRESA, '
      
        '   :IE_EMPRESA, :IM_EMPRESA, :OUTRO_DOC, :DT_INCLUSAO, :IN_FATUR' +
        'AMENTO, '
      
        '   :IN_ATIVO, :IN_RESTRICAO, :IN_EVENTUAL, :CD_TIPO_REF, :IN_CLI' +
        'ENTE, :IN_IMPORTADOR, '
      
        '   :IN_EXPORTADOR, :IN_OUTROS, :CD_GRUPO, :IN_REPRESENTANTE, :NM' +
        '_INDICADO_POR, '
      
        '   :CD_CT_CONTABIL, :TX_OBS, :CD_PAIS_IMPORTADOR, :CD_ATIV_ECONO' +
        'MICA, :IN_SEGURADORA, '
      
        '   :CD_ACESSO, :CD_AUX, :NR_CAE, :CD_MOEDA_JUROS, :NR_TELEFONE, ' +
        ':NR_FAX, '
      
        '   :IN_LIBERA_DI, :CD_INDICADO_POR, :PATH_LOGO, :IN_COMPRADOR, :' +
        'TP_DEM_EMAIL, '
      
        '   :NR_RG, :TP_RECOLHE_MP164, :PROTECAO_MOEDA, :NR_ACCOUNT, :IN_' +
        'COMERCIAL, '
      
        '   :CD_ACESSO_PIS, :CD_AUX_PIS, :CD_CT_CONTABIL_PIS, :IN_REF_ACE' +
        'ITA_BARRA, '
      
        '   :IN_CAT63, :CD_TOTAL_NF_DDNOTA, :IN_CONFERE_NF, :IN_PRENCHE_F' +
        'ATURA, '
      
        '   :IN_VERIF_ICMS_TRANSM, :IN_REGIME_ESP, :CD_FUND_LEGAL_ICMS, :' +
        'IN_COTACAO, '
      
        '   :IN_ENVIA_BOLETO_DDA, :IN_MARINHA_MERCANTE_ICMS, :END_ID_LOCA' +
        'LIDADE, '
      
        '   :COD_INTERNO, :ID_REPRESENTANTE, :ID_REPRESENTADA, :CD_TIPO_B' +
        'ASE_SEGURO_DI, '
      
        '   :PC_SEGURO_MLE_DI, :DS_LICENCA_SANITARIA, :TX_DADOS_BANCARIOS' +
        '_FATCOM, '
      '   :FIESP_ID_END)')
    DeleteSQL.Strings = (
      'delete from TEMPRESA_NAC'
      'where'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    Left = 70
    Top = 12
  end
  object qry_ct_contabil_unica_pis_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      ' FROM TCT_CONTABIL (NOLOCK)'
      'WHERE CD_ACESSO+CD_AUX = :CD_ACESSO_AUX_PIS '
      '  AND CD_IDENTIFICADOR = '#39'A'#39' '
      '  AND ANO_CONTA =:ANO_CONTA'
      'ORDER BY CD_CT_CONTABIL')
    Left = 419
    Top = 427
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO_AUX_PIS'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ANO_CONTA'
        ParamType = ptUnknown
      end>
  end
  object qry_Estados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT distinct CD_UF, NM_UF'
      'FROM TUF (NOLOCK)')
    Left = 420
    Top = 132
  end
  object dts_Estados: TDataSource
    DataSet = qry_Estados
    Left = 420
    Top = 132
  end
  object qry_despachante_cliente: TQuery
    CachedUpdates = True
    BeforePost = qry_despachante_clienteBeforePost
    AfterPost = aplicar
    AfterDelete = aplicar
    OnNewRecord = qry_despachante_clienteNewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select CD_EMPRESA, CD_DESPACHANTE, TIPO  from TDESPACHANTE_CLIEN' +
        'TE'
      'where CD_EMPRESA = :CD_EMPRESA')
    UpdateObject = upd_despachante_cliente
    Left = 560
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_despachante_clienteCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TDESPACHANTE_CLIENTE.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_despachante_clienteCD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'DBBROKER.TDESPACHANTE_CLIENTE.CD_DESPACHANTE'
      FixedChar = True
      Size = 3
    end
    object qry_despachante_clienteTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'DBBROKER.TDESPACHANTE_CLIENTE.TIPO'
      FixedChar = True
      Size = 5
    end
    object qry_despachante_clienteNM_DESPACHANTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_DESPACHANTE'
      LookupDataSet = qry_despachantes
      LookupKeyFields = 'CD_DESPACHANTE'
      LookupResultField = 'NM_DESPACHANTE'
      KeyFields = 'CD_DESPACHANTE'
      Size = 50
      Lookup = True
    end
  end
  object ds_despachante_cliente: TDataSource
    DataSet = qry_despachante_cliente
    Left = 560
    Top = 96
  end
  object qry_despachantes: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select  CD_DESPACHANTE,NM_DESPACHANTE  from TDESPACHANTE (NOLOCK' +
        ')'
      'where IN_ATIVO<>'#39'0'#39)
    Left = 560
    Top = 264
    object qry_despachantesCD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'DBBROKER.TDESPACHANTE.CD_DESPACHANTE'
      FixedChar = True
      Size = 3
    end
    object qry_despachantesNM_DESPACHANTE: TStringField
      FieldName = 'NM_DESPACHANTE'
      Origin = 'DBBROKER.TDESPACHANTE.NM_DESPACHANTE'
      FixedChar = True
      Size = 50
    end
  end
  object upd_despachante_cliente: TUpdateSQL
    ModifySQL.Strings = (
      'update TDESPACHANTE_CLIENTE'
      'set'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  CD_DESPACHANTE = :CD_DESPACHANTE,'
      '  TIPO = :TIPO'
      'where'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  CD_DESPACHANTE = :OLD_CD_DESPACHANTE and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into TDESPACHANTE_CLIENTE'
      '  (CD_EMPRESA, CD_DESPACHANTE, TIPO)'
      'values'
      '  (:CD_EMPRESA, :CD_DESPACHANTE, :TIPO)')
    DeleteSQL.Strings = (
      'delete from TDESPACHANTE_CLIENTE'
      'where'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  CD_DESPACHANTE = :OLD_CD_DESPACHANTE and'
      '  TIPO = :OLD_TIPO')
    Left = 560
    Top = 208
  end
end

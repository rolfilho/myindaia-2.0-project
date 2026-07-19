object datm_livro_iss: Tdatm_livro_iss
  OldCreateOrder = True
  Left = 526
  Top = 299
  Height = 195
  Width = 369
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 68
    Top = 20
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
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object sp_rel_fat_livro_fiscal: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_fat_livro_fiscal'
    Left = 70
    Top = 74
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
        Name = '@mes'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@ano'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  '#39'C'#39' as CONTRIBUINTE,'
      #9#9#39'3'#39' NR_LAYOUT ,'
      #9#9'CONVERT( char(10), R.DT_NF, 103 ) as DT_NF,'#9' '
      
        #9#9'CAST(SUBSTRING ('#39'0000000000'#39', 1, 10 - LEN(R.NR_NF_INICIO)) +  ' +
        ' R.NR_NF_INICIO AS CHAR(10)) as NR_NF_INICIO,'
      #9#9'CAST( '#39'T'#39' as char(10)) as NR_SERIE_NF, '
      
        #9#9'CAST(SUBSTRING ('#39'0000000000'#39', 1, 10 - LEN(R.NR_NF_FIM)) + R.NR' +
        '_NF_FIM AS CHAR(10)) as NR_NF_FIM,'
      #9#9'CASE LTRIM( RTRIM( ISNULL( E.END_CIDADE, '#39#39' ) ) )'
      '        WHEN '#39'SANTOS'#39' THEN '#39'5'#39
      '        ELSE '#39'1'#39
      #9#9'END AS SITUACAO,'
      #9#9'ROUND( R.VL_TRIB,2 ) as VL_TRIB,'
      #9#9'ROUND( R.VL_TRIB,2 ) as VL_BASE_CALCULO,'
      #9#9'CAST( '#39'33.01'#39' + REPLICATE( '#39#39', 6 ) as char(10) ) as ATIVIDADE,'
      #9#9'CASE WHEN E.END_CIDADE LIKE '#39'SANTOS%'#39
      '            THEN '#39'S'#39' ELSE '#39'N'#39
      #9#9'END as fESTABELECIDA_MUNICIPIO,'
      #9#9'CASE WHEN E.END_CIDADE LIKE '#39'SANTOS%'#39
      '            THEN '#39'D'#39' ELSE '#39'F'#39
      #9#9'END as CD_LOCAL_PRESTACAO,'
      #9#9'CAST( E.NM_EMPRESA as char(100) ) as NM_EMPRESA,'
      
        #9#9'CAST( REPLICATE ('#39'0'#39', 14 - LEN(E.CGC_EMPRESA)) + E.CGC_EMPRESA' +
        ' as char(14) ) as CGC_EMPRESA,'
      #9#9#39'2'#39' CD_TIPO_CADASTRO,'
      #9#9'CAST( CASE LTRIM( RTRIM( ISNULL( E.IM_EMPRESA, '#39#39' ) ) )'
      '               WHEN '#39#39' THEN REPLICATE (0, 10)'
      '               ELSE CASE'
      
        '                      WHEN E.IM_EMPRESA LIKE '#39'ISENT%'#39' THEN REPLI' +
        'CATE (0, 10)'
      
        '                      ELSE REPLICATE(0, 10 - LEN(REPLACE(REPLACE' +
        '(REPLACE(E.IM_EMPRESA, '#39'.'#39', '#39#39'), '#39'-'#39', '#39#39'), '#39' '#39', '#39#39'))) + REPLACE(' +
        'REPLACE(REPLACE(E.IM_EMPRESA, '#39'.'#39', '#39#39'), '#39'-'#39', '#39#39'), '#39' '#39', '#39#39')'
      '                    END'
      '         END as char(10) ) AS INSCR_MUNICIPAL ,'
      
        '         isnull(CAST( LEFT(REVERSE(case when E.IM_EMPRESA LIKE '#39 +
        'ISENT%'#39' then '#39#39' else REPLACE(REPLACE(REPLACE(E.IM_EMPRESA, '#39'.'#39', ' +
        #39#39'), '#39'-'#39', '#39#39'), '#39' '#39', '#39#39') end ), 1) AS CHAR(2)),'#39#39')  AS DIGITO_INS' +
        'CR_MUNICIPAL,'
      '        CAST( CASE LTRIM( RTRIM( ISNULL( E.IE_EMPRESA, '#39#39' ) ) )'
      '               WHEN '#39#39' THEN REPLICATE (0, 15)'
      '               ELSE CASE'
      
        '                      WHEN E.IE_EMPRESA LIKE '#39'ISENT%'#39' THEN REPLI' +
        'CATE (0, 15)'
      
        '                      ELSE REPLICATE(0, 15 - LEN(REPLACE(REPLACE' +
        '(REPLACE(E.IE_EMPRESA, '#39'.'#39', '#39#39'), '#39'-'#39', '#39#39'), '#39' '#39', '#39#39'))) + REPLACE(' +
        'REPLACE(REPLACE(E.IE_EMPRESA, '#39'.'#39', '#39#39'), '#39'-'#39', '#39#39'), '#39' '#39', '#39#39')'
      '                    END'
      '         END as char(15) ) AS INSCR_ESTADUAL,'
      '         CAST( '#39'.'#39' as char(05) ) as TP_LOGRAD,'
      '         CAST( '#39#39' as char(05) ) as TITULO_LOGRAD,'
      '         CAST( E.END_EMPRESA as char(50) ) as END_EMPRESA,'
      '         CAST( '#39#39' as char(40) ) as END_COMPL,'
      
        '         CAST(SUBSTRING ('#39'0000000000'#39', 1, 10 - LEN(ISNULL(E.END_' +
        'NUMERO, '#39#39'))) + ISNULL(E.END_NUMERO, '#39#39') as char(10) ) as END_NU' +
        'MERO,'
      
        '         CAST( ISNULL( E.END_CEP, REPLICATE( '#39'0'#39', 8 ) ) as char(' +
        '8) ) as END_CEP,'
      '         CASE CAST( ISNULL( E.END_BAIRRO, '#39#39' ) as char(50) )'
      '         WHEN '#39#39' THEN  CAST( E.END_CIDADE as char(50) )'
      '         ELSE CAST( ISNULL( E.END_BAIRRO, '#39#39' ) as char(50) )'
      #9#9' END as END_BAIRRO,'
      #9#9' CAST( E.END_UF as char(2) ) as END_UF,'
      #9#9' CAST( E.END_CIDADE as char(50) ) as END_CIDADE,'
      #9#9' '#39'BR'#39' CD_PAIS, '
      #9#9#39#39'  NM_OBSERVACAO,'
      #9#9#39#39'  CD_PLANO_CONTA,'
      #9#9#39#39'  CD_ALVARA,'
      #9#9#39'R'#39' IC_ORIGEM_DADOS,'
      #9#9#39'0'#39' IC_ENQUADRAMENTO,'
      #9#9#39#39'  CD_PLANO_CONTA_PAI,'
      #9'    '#39#39'  IC_RECOLHE_IMPOSTO,'
      #9'    '#39#39'  VL_ALIQUOTA,'
      #9#9' CAST( CASE LTRIM( RTRIM( ISNULL( E.IE_EMPRESA, '#39#39' ) ) )'
      '           WHEN '#39#39' THEN '#39'S'#39
      '           ELSE CASE'
      '                  WHEN E.IE_EMPRESA LIKE '#39'ISENT%'#39' THEN '#39'S'#39
      '                  ELSE '#39'N'#39
      '                END'
      '         END as char(1) ) AS fISENTO_INSCR_ESTADUAL,'
      #9#9#39#39' FL_SIMPLES'
      #9#9' --'#39'2'#39' as TOMADOR'
      'FROM TREL_FAT_LIVRO_FISCAL_GISS R, TUNID_NEG N, TEMPRESA_NAC E'
      'WHERE R.CD_CLIENTE = E.CD_EMPRESA AND'
      '      N.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      '      ( ( NR_NF_INICIO = :NR_NOTA ) OR ( :NR_NOTA = '#39#39' ) )'
      'UNION'
      'SELECT '#39'C'#39' as CONTRIBUINTE, '
      #9#9#39'3'#39' NR_LAYOUT , '
      #9#9'CONVERT( char(10), G.DT_NF, 103 ) as DT_NF,'
      
        #9#9'CAST(SUBSTRING ('#39'0000000000'#39', 1, 10 - LEN(G.NR_NF_INICIO)) + G' +
        '.NR_NF_INICIO AS CHAR(10)) as NR_NF_INICIO,'
      #9#9'CAST( '#39'T'#39' as char(10)) as NR_SERIE_NF,  '
      
        #9#9'CAST(SUBSTRING ('#39'0000000000'#39', 1, 10 - LEN(G.NR_NF_FIM)) + G.NR' +
        '_NF_FIM AS CHAR(10)) as NR_NF_FIM,'
      #9#9#39'2'#39' as SITUACAO, '
      #9#9'0 as VL_TRIB, '
      #9#9'0 as VL_BASE_CALCULO,'
      #9#9'CAST( REPLICATE( '#39#39', 10 ) as char(10) ) as ATIVIDADE,'
      #9#9'CAST('#39' '#39' as char(1)) as fESTABELECIDA_MUNICIPIO,'
      #9#9'CASE WHEN E.END_CIDADE LIKE '#39'SANTOS%'#39
      '            THEN '#39'D'#39' ELSE '#39'F'#39
      #9#9'END as CD_LOCAL_PRESTACAO,'
      #9#9'CAST(REPLICATE( '#39#39', 50 ) as char(100) ) as NM_EMPRESA,'
      #9#9'CAST(REPLICATE( '#39#39', 14 ) as char(14) ) as CGC_EMPRESA,'
      #9#9#39'2'#39' CD_TIPO_CADASTRO,'
      #9#9'CAST(REPLICATE( '#39#39', 10 ) as char(10) )  AS INSCR_MUNICIPAL,'
      #9#9'CAST('#39'  '#39' as char(2)) AS DIGITO_INSCR_MUNICIPAL,'
      #9#9'CAST(REPLICATE( '#39#39', 15 ) as char(15) ) AS INSCR_ESTADUAL,'
      #9#9'CAST( '#39#39' as char(05) ) as TP_LOGRAD,'
      #9#9'CAST( '#39#39' as char(05) ) as TITULO_LOGRAD,'
      #9#9'REPLICATE( '#39#39', 50 ) as END_EMPRESA,'
      #9'    REPLICATE( '#39#39', 40 ) as END_COMPL,       '
      '        CAST(REPLICATE( '#39#39', 10 ) as char(10) ) as END_NUMERO, '
      #9#9'REPLICATE( '#39#39', 8 ) as END_CEP,'
      '        CAST(REPLICATE( '#39#39', 50 ) as char(50) ) as END_BAIRRO,'
      '        CAST(REPLICATE( '#39#39', 2 ) as char(2) )as END_UF,'
      #9#9'CAST(REPLICATE( '#39#39', 50 ) as char(50) ) as END_CIDADE,'
      #9#9#39'BR'#39' CD_PAIS,'
      #9#9#39#39'  NM_OBSERVACAO,'
      #9#9#39#39'  CD_PLANO_CONTA,'
      #9#9#39#39'  CD_ALVARA,'
      #9#9#39'R'#39' IC_ORIGEM_DADOS,'
      #9#9#39'0'#39' IC_ENQUADRAMENTO,'
      #9#9#39#39'  CD_PLANO_CONTA_PAI,'
      #9'    '#39#39'  IC_RECOLHE_IMPOSTO,'
      #9'    '#39#39'  VL_ALIQUOTA,'
      
        #9#9'CAST(REPLICATE( '#39'S'#39', 1 ) as char(15) )AS fISENTO_INSCR_ESTADUA' +
        'L,'
      #9#9#39#39' FL_SIMPLES'
      '       --'#39'2'#39' as TOMADOR, '
      
        'FROM TREL_FAT_LIVRO_FISCAL_CANC_GISS G, TUNID_NEG N, TEMPRESA_NA' +
        'C E'
      'WHERE G.CD_CLIENTE = E.CD_EMPRESA AND'
      '      N.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      '     ( ( NR_NF_INICIO = :NR_NOTA ) OR ( :NR_NOTA = '#39#39' ) )'
      'ORDER BY DT_NF'
      ''
      '')
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_NOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_NOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_NOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_NOTA'
        ParamType = ptUnknown
      end>
    object qry_fatura_CONTRIBUINTE: TStringField
      FieldName = 'CONTRIBUINTE'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_NR_LAYOUT: TStringField
      FieldName = 'NR_LAYOUT'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_DT_NF: TStringField
      FieldName = 'DT_NF'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_NR_NF_INICIO: TStringField
      FieldName = 'NR_NF_INICIO'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_NR_SERIE_NF: TStringField
      FieldName = 'NR_SERIE_NF'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_NR_NF_FIM: TStringField
      FieldName = 'NR_NF_FIM'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_SITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_VL_TRIB: TFloatField
      FieldName = 'VL_TRIB'
    end
    object qry_fatura_VL_BASE_CALCULO: TFloatField
      FieldName = 'VL_BASE_CALCULO'
    end
    object qry_fatura_ATIVIDADE: TStringField
      FieldName = 'ATIVIDADE'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_fESTABELECIDA_MUNICIPIO: TStringField
      FieldName = 'fESTABELECIDA_MUNICIPIO'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_CD_LOCAL_PRESTACAO: TStringField
      FieldName = 'CD_LOCAL_PRESTACAO'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qry_fatura_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_fatura_CD_TIPO_CADASTRO: TStringField
      FieldName = 'CD_TIPO_CADASTRO'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_INSCR_MUNICIPAL: TStringField
      FieldName = 'INSCR_MUNICIPAL'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_DIGITO_INSCR_MUNICIPAL: TStringField
      FieldName = 'DIGITO_INSCR_MUNICIPAL'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_INSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      FixedChar = True
      Size = 15
    end
    object qry_fatura_TP_LOGRAD: TStringField
      FieldName = 'TP_LOGRAD'
      FixedChar = True
      Size = 5
    end
    object qry_fatura_TITULO_LOGRAD: TStringField
      FieldName = 'TITULO_LOGRAD'
      FixedChar = True
      Size = 5
    end
    object qry_fatura_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 40
    end
    object qry_fatura_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 10
    end
    object qry_fatura_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_fatura_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_fatura_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      FixedChar = True
      Size = 2
    end
    object qry_fatura_NM_OBSERVACAO: TStringField
      FieldName = 'NM_OBSERVACAO'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_CD_PLANO_CONTA: TStringField
      FieldName = 'CD_PLANO_CONTA'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_CD_ALVARA: TStringField
      FieldName = 'CD_ALVARA'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_IC_ORIGEM_DADOS: TStringField
      FieldName = 'IC_ORIGEM_DADOS'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_IC_ENQUADRAMENTO: TStringField
      FieldName = 'IC_ENQUADRAMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_CD_PLANO_CONTA_PAI: TStringField
      FieldName = 'CD_PLANO_CONTA_PAI'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_IC_RECOLHE_IMPOSTO: TStringField
      FieldName = 'IC_RECOLHE_IMPOSTO'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_VL_ALIQUOTA: TStringField
      FieldName = 'VL_ALIQUOTA'
      FixedChar = True
      Size = 1
    end
    object qry_fatura_fISENTO_INSCR_ESTADUAL: TStringField
      FieldName = 'fISENTO_INSCR_ESTADUAL'
      FixedChar = True
      Size = 15
    end
    object qry_fatura_FL_SIMPLES: TStringField
      FieldName = 'FL_SIMPLES'
      FixedChar = True
      Size = 1
    end
  end
  object ds_fatura_: TDataSource
    DataSet = qry_fatura_
    Left = 176
    Top = 88
  end
end

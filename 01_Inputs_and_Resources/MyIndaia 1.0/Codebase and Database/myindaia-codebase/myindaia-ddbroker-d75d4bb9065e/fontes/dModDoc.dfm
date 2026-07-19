object datm_mod_doc: Tdatm_mod_doc
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 279
  Width = 392
  object qry_modelo_doc_: TQuery
    CachedUpdates = True
    BeforePost = qry_modelo_doc_BeforePost
    AfterPost = qry_modelo_doc_AfterPost
    AfterDelete = qry_modelo_doc_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TD.CD_UNID_NEG, TD.CD_MODULO ,TD.CODIGO,  TD.CD_VIA_TRANS' +
        'P, TD.CD_PRODUTO,'
      
        '  TD.DESCRIAO, TD.NM_PATH, TD.DT_DOCUMENTO, TD.IN_DAFAULT, TD.IN' +
        '_PROCESSO,'
      '  TD.IN_EMP_NAC, TD.IN_EMP_EST, TD.IN_AGENTE, TD.IN_CIA,'
      
        '  TD.IN_ARMADOR, TD.IN_COMISSARIA, TD.CD_EMP_NAC, TD.CD_EMP_EST,' +
        ' TD.CD_TIPO_DOCTO,'
      
        '  TD.CD_AGENTE, TD.CD_CIA, TD.CD_ARMADOR, TD.CD_COMISSARIA, TD.C' +
        'D_GRUPO, TD.IN_GRUPO,TD.IN_ESTUFAGEM,TD.CD_ESTUFAGEM,'
      
        '  (SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN (NOLOCK) WHERE TN.C' +
        'D_EMPRESA = TD.CD_EMP_NAC)NM_EMP_NAC,'
      
        '  (SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE (NOLOCK) WHERE TE.C' +
        'D_EMPRESA = TD.CD_EMP_EST)NM_EMP_EST,'
      
        '  (SELECT TA.NM_AGENTE FROM TAGENTE TA (NOLOCK) WHERE TA.CD_AGEN' +
        'TE = TD.CD_AGENTE)NM_AGENTE,'
      
        '  (SELECT TC.DESCRICAO FROM TTRANSPORTADOR_ITL TC (NOLOCK) WHERE' +
        ' TC.CODIGO = TD.CD_CIA)NM_CIA,'
      
        '  (SELECT TC.DESCRICAO FROM TTRANSPORTADOR_ITL TC (NOLOCK) WHERE' +
        ' TC.CODIGO = TD.CD_ARMADOR)NM_ARMADOR,'
      
        '  (SELECT TCO.NM_COMISSARIA FROM TCOMISSARIA TCO (NOLOCK) WHERE ' +
        'TCO.CD_COMISSARIA = TD.CD_COMISSARIA)NM_COMISSARIA,'
      
        '  (SELECT TU.NM_UNID_NEG FROM TUNID_NEG TU (NOLOCK) WHERE TU.CD_' +
        'UNID_NEG = TD.CD_UNID_NEG)NM_UNID_NEG,'
      
        '  (SELECT TM.NM_ROTINA FROM TMODULO_ROTINA TM (NOLOCK) WHERE TM.' +
        'CD_ROTINA= TD.CD_MODULO)NM_ROTINA,'
      
        '  (SELECT TV.NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER TV (NOLOCK) W' +
        'HERE TV.CD_VIA_TRANSP = TD.CD_VIA_TRANSP)NM_VIA_TRANSP,'
      
        '  (SELECT TP.NM_PRODUTO FROM TPRODUTO TP (NOLOCK) WHERE TP.CD_PR' +
        'ODUTO = TD.CD_PRODUTO)NM_PRODUTO,'
      
        '  (SELECT NM_GRUPO FROM TGRUPO (NOLOCK) WHERE CD_GRUPO = TD.CD_G' +
        'RUPO)NM_GRUPO,'
      
        '  (SELECT NM_ESTUFAGEM FROM VW_TIPO_ESTUFAGEM (NOLOCK) WHERE TP_' +
        'ESTUFAGEM = TD.CD_ESTUFAGEM) NM_ESTUFAGEM'
      'FROM TMODELO_DOC TD (NOLOCK)'
      'WHERE TD.CD_UNID_NEG =:CD_UNID_NAG'
      'ORDER BY TD.CD_MODULO')
    UpdateObject = UpDate_mod_doc
    Left = 72
    Top = 40
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NAG'
        ParamType = ptUnknown
      end>
    object qry_modelo_doc_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_modelo_doc_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      FixedChar = True
      Size = 4
    end
    object qry_modelo_doc_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_modelo_doc_DESCRIAO: TStringField
      FieldName = 'DESCRIAO'
      FixedChar = True
      Size = 50
    end
    object qry_modelo_doc_NM_PATH: TStringField
      FieldName = 'NM_PATH'
      FixedChar = True
      Size = 100
    end
    object qry_modelo_doc_DT_DOCUMENTO: TDateTimeField
      FieldName = 'DT_DOCUMENTO'
    end
    object qry_modelo_doc_IN_DAFAULT: TStringField
      FieldName = 'IN_DAFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_IN_EMP_NAC: TStringField
      FieldName = 'IN_EMP_NAC'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_IN_EMP_EST: TStringField
      FieldName = 'IN_EMP_EST'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_IN_AGENTE: TStringField
      FieldName = 'IN_AGENTE'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_IN_CIA: TStringField
      FieldName = 'IN_CIA'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_IN_ARMADOR: TStringField
      FieldName = 'IN_ARMADOR'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_IN_COMISSARIA: TStringField
      FieldName = 'IN_COMISSARIA'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_CD_EMP_NAC: TStringField
      FieldName = 'CD_EMP_NAC'
      FixedChar = True
      Size = 5
    end
    object qry_modelo_doc_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_modelo_doc_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_modelo_doc_CD_CIA: TStringField
      FieldName = 'CD_CIA'
      FixedChar = True
      Size = 4
    end
    object qry_modelo_doc_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_modelo_doc_CD_COMISSARIA: TStringField
      FieldName = 'CD_COMISSARIA'
      FixedChar = True
      Size = 3
    end
    object qry_modelo_doc_NM_EMP_NAC: TStringField
      FieldName = 'NM_EMP_NAC'
      FixedChar = True
      Size = 50
    end
    object qry_modelo_doc_NM_EMP_EST: TStringField
      FieldName = 'NM_EMP_EST'
      FixedChar = True
      Size = 60
    end
    object qry_modelo_doc_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_modelo_doc_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
    object qry_modelo_doc_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_modelo_doc_NM_COMISSARIA: TStringField
      FieldName = 'NM_COMISSARIA'
      FixedChar = True
      Size = 50
    end
    object qry_modelo_doc_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_modelo_doc_NM_ROTINA: TStringField
      FieldName = 'NM_ROTINA'
      FixedChar = True
      Size = 50
    end
    object qry_modelo_doc_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_modelo_doc_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_modelo_doc_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_modelo_doc_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_modelo_doc_IN_PROCESSO: TStringField
      FieldName = 'IN_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_modelo_doc_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
    object qry_modelo_doc_IN_GRUPO: TStringField
      FieldName = 'IN_GRUPO'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_CD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qry_modelo_doc_IN_ESTUFAGEM: TStringField
      FieldName = 'IN_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_CD_ESTUFAGEM: TStringField
      FieldName = 'CD_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_modelo_doc_NM_ESTUFAGEM: TStringField
      FieldName = 'NM_ESTUFAGEM'
      FixedChar = True
      Size = 11
    end
  end
  object ds_modelo_doc: TDataSource
    DataSet = qry_modelo_doc_
    Left = 72
    Top = 88
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, TU.NM_UNID_NEG, TU.PATH_RE' +
        'LATORIOS FROM TUSUARIO_HABILITACAO UH with(nolock)'
      'LEFT JOIN TUNID_NEG TU  ON (TU.CD_UNID_NEG = UH.CD_UNID_NEG)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' '
      ' ')
    Left = 184
    Top = 40
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_PATH_RELATORIOS: TStringField
      FieldName = 'PATH_RELATORIOS'
      FixedChar = True
      Size = 100
    end
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 280
    Top = 40
  end
  object UpDate_mod_doc: TUpdateSQL
    ModifySQL.Strings = (
      'update TMODELO_DOC'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_MODULO = :CD_MODULO,'
      '  CODIGO = :CODIGO,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  DESCRIAO = :DESCRIAO,'
      '  NM_PATH = :NM_PATH,'
      '  DT_DOCUMENTO = :DT_DOCUMENTO,'
      '  IN_DAFAULT = :IN_DAFAULT,'
      '  IN_PROCESSO = :IN_PROCESSO,'
      '  IN_EMP_NAC = :IN_EMP_NAC,'
      '  IN_EMP_EST = :IN_EMP_EST,'
      '  IN_AGENTE = :IN_AGENTE,'
      '  IN_CIA = :IN_CIA,'
      '  IN_ARMADOR = :IN_ARMADOR,'
      '  IN_COMISSARIA = :IN_COMISSARIA,'
      '  CD_EMP_NAC = :CD_EMP_NAC,'
      '  CD_EMP_EST = :CD_EMP_EST,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_CIA = :CD_CIA,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  CD_COMISSARIA = :CD_COMISSARIA,'
      '  CD_GRUPO = :CD_GRUPO,'
      '  IN_GRUPO = :IN_GRUPO,'
      '  CD_TIPO_DOCTO = :CD_TIPO_DOCTO,'
      '  IN_ESTUFAGEM = :IN_ESTUFAGEM,'
      '  CD_ESTUFAGEM = :CD_ESTUFAGEM'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_MODULO = :OLD_CD_MODULO and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TMODELO_DOC'
      '  (CD_UNID_NEG, CD_MODULO, CODIGO, CD_VIA_TRANSP, CD_PRODUTO, '
      'DESCRIAO, '
      '   NM_PATH, DT_DOCUMENTO, IN_DAFAULT, IN_PROCESSO, IN_EMP_NAC, '
      'IN_EMP_EST, '
      '   IN_AGENTE, IN_CIA, IN_ARMADOR, IN_COMISSARIA, CD_EMP_NAC, '
      'CD_EMP_EST, '
      '   CD_AGENTE, CD_CIA, CD_ARMADOR, CD_COMISSARIA, CD_GRUPO, '
      'IN_GRUPO, CD_TIPO_DOCTO, '
      '   IN_ESTUFAGEM, CD_ESTUFAGEM)'
      'values'
      
        '  (:CD_UNID_NEG, :CD_MODULO, :CODIGO, :CD_VIA_TRANSP, :CD_PRODUT' +
        'O, '
      ':DESCRIAO, '
      
        '   :NM_PATH, :DT_DOCUMENTO, :IN_DAFAULT, :IN_PROCESSO, :IN_EMP_N' +
        'AC, '
      ':IN_EMP_EST, '
      
        '   :IN_AGENTE, :IN_CIA, :IN_ARMADOR, :IN_COMISSARIA, :CD_EMP_NAC' +
        ', '
      ':CD_EMP_EST, '
      '   :CD_AGENTE, :CD_CIA, :CD_ARMADOR, :CD_COMISSARIA, :CD_GRUPO, '
      ':IN_GRUPO, '
      '   :CD_TIPO_DOCTO, :IN_ESTUFAGEM, :CD_ESTUFAGEM)')
    DeleteSQL.Strings = (
      'delete from TMODELO_DOC'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_MODULO = :OLD_CD_MODULO and'
      '  CODIGO = :OLD_CODIGO')
    Left = 72
    Top = 136
  end
end

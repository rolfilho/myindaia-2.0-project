object datm_senha: Tdatm_senha
  OldCreateOrder = True
  Left = 279
  Top = 167
  Height = 304
  Width = 442
  object qry_direitos_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_usuario
    SQL.Strings = (
      'SELECT A.CD_CARGO, A.CD_MODULO, A.CD_ROTINA, A.IN_ACESSO,'
      '       A.IN_INCLUIR, A.IN_MODIFICAR, A.IN_EXCLUIR, R.NM_MENU'
      'FROM   TCONTROLE_ACESSO A, TCARGO_MODULO M, TMODULO_ROTINA R'
      'WHERE  A.CD_CARGO = :CD_CARGO AND'
      '       A.CD_CARGO = M.CD_CARGO AND'
      '       A.CD_MODULO = M.CD_MODULO AND'
      '       M.IN_ATIVO = 1 AND'
      '       R.CD_ROTINA = A.CD_ROTINA'
      'ORDER BY A.CD_ROTINA')
    Left = 220
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_direitos_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCONTROLE_ACESSO.CD_CARGO'
      Size = 3
    end
    object qry_direitos_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TCONTROLE_ACESSO.CD_MODULO'
      Size = 2
    end
    object qry_direitos_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'TCONTROLE_ACESSO.CD_ROTINA'
      Size = 4
    end
    object qry_direitos_IN_ACESSO: TBooleanField
      FieldName = 'IN_ACESSO'
      Origin = 'TCONTROLE_ACESSO.IN_ACESSO'
    end
    object qry_direitos_IN_INCLUIR: TBooleanField
      FieldName = 'IN_INCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_INCLUIR'
    end
    object qry_direitos_IN_MODIFICAR: TBooleanField
      FieldName = 'IN_MODIFICAR'
      Origin = 'TCONTROLE_ACESSO.IN_MODIFICAR'
    end
    object qry_direitos_IN_EXCLUIR: TBooleanField
      FieldName = 'IN_EXCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_EXCLUIR'
    end
    object qry_direitos_NM_MENU: TStringField
      FieldName = 'NM_MENU'
      Origin = 'DBBROKER.TMODULO_ROTINA.NM_MENU'
      FixedChar = True
      Size = 50
    end
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT U.CD_USUARIO, U.CD_SENHA, U.CD_CARGO,'
      '       U.NM_USUARIO, U.AP_USUARIO, U.IN_ATIVO,'
      '       U.IN_AVISO_PO, '
      
        '       CASE WHEN (SELECT GETDATE()-QT_DIAS_SENHA FROM TPARAMETRO' +
        'S) > ISNULL(U.DT_ULT_ALT_SENHA,'#39'01/01/1900'#39') '
      '            THEN 1 '
      '            ELSE 0 '
      '       END AS EXPIROU'
      '       ,QT_SENHA_INCORRETA'
      
        '       ,ISNULL((SELECT TOP 1 QT_SENHA_ERRADA FROM TPARAMETROS (N' +
        'OLOCK)),5) AS QT_SENHA_ERRADA_PARAM'
      '  FROM TUSUARIO U (NOLOCK)'
      'WHERE  ( U.AP_USUARIO = :AP_USUARIO )')
    Left = 32
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'AP_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Origin = 'TUSUARIO.CD_SENHA'
      Size = 10
    end
    object qry_usuario_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TUSUARIO.CD_CARGO'
      Size = 3
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
    object qry_usuario_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO.IN_ATIVO'
      Size = 1
    end
    object qry_usuario_IN_AVISO_PO: TStringField
      FieldName = 'IN_AVISO_PO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 1
    end
    object qry_usuario_EXPIROU: TIntegerField
      FieldName = 'EXPIROU'
    end
    object qry_usuario_QT_SENHA_ERRADA_PARAM: TIntegerField
      FieldName = 'QT_SENHA_ERRADA_PARAM'
    end
    object qry_usuario_QT_SENHA_INCORRETA: TIntegerField
      FieldName = 'QT_SENHA_INCORRETA'
    end
  end
  object qry_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_usuario
    SQL.Strings = (
      'SELECT H.CD_UNID_NEG, H.CD_PRODUTO, U.AP_UNID_NEG, P.AP_PRODUTO'
      'FROM TUSUARIO_HABILITACAO H, TUNID_NEG U, TPRODUTO P'
      'WHERE ( H.CD_USUARIO = :CD_USUARIO ) AND'
      '               ( H.CD_UNID_NEG = U.CD_UNID_NEG ) AND'
      '               ( H.CD_PRODUTO = P.CD_PRODUTO ) AND'
      '               ( H.IN_ATIVO = '#39'1'#39' ) AND'
      '               ( H.IN_DEFAULT = '#39'1'#39' ) AND'
      '               ( U.IN_ATIVO = '#39'1'#39' ) AND'
      '               ( P.IN_ATIVO = '#39'1'#39' )'
      '               ')
    Left = 128
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_habilitacao_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 10
    end
    object qry_habilitacao_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 10
    end
  end
  object ds_usuario: TDataSource
    AutoEdit = False
    DataSet = qry_usuario_
    Left = 32
    Top = 78
  end
  object ds_habilitacao: TDataSource
    DataSet = qry_habilitacao_
    Left = 128
    Top = 78
  end
  object sp_password: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_altera_senha'
    Left = 32
    Top = 142
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@senha_old'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@senha_new'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@usuario'
        ParamType = ptInput
      end>
  end
  object sp_verifica_login: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_verifica_login'
    Left = 128
    Top = 142
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@login'
        ParamType = ptInput
      end>
  end
  object qry_direitos_po_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_usuario
    SQL.Strings = (
      'SELECT A.CD_CARGO, A.CD_MODULO, A.CD_ROTINA,  A.IN_ACESSO , '
      '               A.IN_INCLUIR, A.IN_MODIFICAR, A.IN_EXCLUIR'
      'FROM TCONTROLE_ACESSO A, TCARGO_MODULO M'
      'WHERE A.CD_CARGO = :CD_CARGO AND'
      'A.CD_CARGO = M.CD_CARGO AND'
      'A.CD_MODULO = M.CD_MODULO AND'
      'A.CD_MODULO = '#39'18'#39' AND M.IN_ATIVO = 1 AND '
      'A.CD_ROTINA = '#39'1801'#39' AND A.IN_ACESSO = '#39'1'#39
      'ORDER BY A.CD_ROTINA')
    Left = 220
    Top = 73
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end>
    object qry_direitos_po_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCONTROLE_ACESSO.CD_CARGO'
      Size = 3
    end
    object qry_direitos_po_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TCONTROLE_ACESSO.CD_MODULO'
      Size = 2
    end
    object qry_direitos_po_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'TCONTROLE_ACESSO.CD_ROTINA'
      Size = 4
    end
    object qry_direitos_po_IN_ACESSO: TBooleanField
      FieldName = 'IN_ACESSO'
      Origin = 'TCONTROLE_ACESSO.IN_ACESSO'
    end
    object qry_direitos_po_IN_INCLUIR: TBooleanField
      FieldName = 'IN_INCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_INCLUIR'
    end
    object qry_direitos_po_IN_MODIFICAR: TBooleanField
      FieldName = 'IN_MODIFICAR'
      Origin = 'TCONTROLE_ACESSO.IN_MODIFICAR'
    end
    object qry_direitos_po_IN_EXCLUIR: TBooleanField
      FieldName = 'IN_EXCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_EXCLUIR'
    end
  end
  object qry_direitos_pe_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_usuario
    SQL.Strings = (
      'SELECT A.CD_CARGO, A.CD_MODULO, A.CD_ROTINA,  A.IN_ACESSO , '
      '               A.IN_INCLUIR, A.IN_MODIFICAR, A.IN_EXCLUIR'
      'FROM TCONTROLE_ACESSO A, TCARGO_MODULO M'
      'WHERE A.CD_CARGO = :CD_CARGO AND'
      'A.CD_CARGO = M.CD_CARGO AND'
      'A.CD_MODULO = M.CD_MODULO AND'
      'A.CD_MODULO = '#39'19'#39' AND M.IN_ATIVO = 1 AND '
      'A.CD_ROTINA = '#39'1901'#39' AND A.IN_ACESSO = '#39'1'#39
      'ORDER BY A.CD_ROTINA')
    Left = 220
    Top = 142
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end>
    object qry_direitos_pe_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCONTROLE_ACESSO.CD_CARGO'
      Size = 3
    end
    object qry_direitos_pe_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TCONTROLE_ACESSO.CD_MODULO'
      Size = 2
    end
    object qry_direitos_pe_CD_ROTINA: TStringField
      FieldName = 'CD_ROTINA'
      Origin = 'TCONTROLE_ACESSO.CD_ROTINA'
      Size = 4
    end
    object qry_direitos_pe_IN_ACESSO: TBooleanField
      FieldName = 'IN_ACESSO'
      Origin = 'TCONTROLE_ACESSO.IN_ACESSO'
    end
    object qry_direitos_pe_IN_INCLUIR: TBooleanField
      FieldName = 'IN_INCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_INCLUIR'
    end
    object qry_direitos_pe_IN_MODIFICAR: TBooleanField
      FieldName = 'IN_MODIFICAR'
      Origin = 'TCONTROLE_ACESSO.IN_MODIFICAR'
    end
    object qry_direitos_pe_IN_EXCLUIR: TBooleanField
      FieldName = 'IN_EXCLUIR'
      Origin = 'TCONTROLE_ACESSO.IN_EXCLUIR'
    end
  end
end

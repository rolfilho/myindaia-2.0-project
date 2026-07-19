object datm_acordo_normas: Tdatm_acordo_normas
  Left = 157
  Top = 148
  Height = 192
  Width = 392
  object qry_acordo_normas_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.CD_ACORDO, A.CD_NORMA, N.NM_DESCRICAO'
      'FROM TACORDO_NORMA A'
      'LEFT JOIN TNORMAS N ON N.CODIGO = A.CD_NORMA'
      'WHERE CD_ACORDO = :CD_ACORDO'
      'ORDER BY'
      'A.CD_NORMA'
      '')
    Params.Data = {010001000943445F41434F52444F0001020030000000}
    Left = 168
    Top = 24
    object qry_acordo_normas_CD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'TACORDO_NORMA.CD_ACORDO'
      Size = 10
    end
    object qry_acordo_normas_CD_NORMA: TStringField
      FieldName = 'CD_NORMA'
      Origin = 'TACORDO_NORMA.CD_NORMA'
      Size = 10
    end
    object qry_acordo_normas_NM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'TNORMAS.NM_DESCRICAO'
      Size = 200
    end
  end
  object ds_acordo_normas: TDataSource
    DataSet = qry_acordo_normas_
    Left = 64
    Top = 24
  end
end

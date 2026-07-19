object dtmMyDigConsultaOnline: TdtmMyDigConsultaOnline
  OldCreateOrder = False
  Left = 218
  Top = 55
  Height = 245
  Width = 272
  object qryConsultaOnline: TADOQuery
    Connection = dtmMyIndaiaDigitalizacao.Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO')
    Left = 48
    Top = 32
  end
  object qryConsulta: TADOQuery
    Connection = dtmMyIndaiaDigitalizacao.Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO')
    Left = 48
    Top = 96
  end
  object dsConsultaOnline: TDataSource
    DataSet = qryConsultaOnline
    Left = 152
    Top = 32
  end
  object qryExecuta: TADOQuery
    Connection = dtmMyIndaiaDigitalizacao.Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO')
    Left = 48
    Top = 160
  end
end

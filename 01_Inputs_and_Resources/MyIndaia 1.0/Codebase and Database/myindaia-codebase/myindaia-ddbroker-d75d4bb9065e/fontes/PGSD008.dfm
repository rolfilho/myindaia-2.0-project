object datm_relatorio_extrato_honorarios: Tdatm_relatorio_extrato_honorarios
  Left = 277
  Top = 194
  Height = 165
  Width = 352
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 48
    Top = 32
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
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object sp_rel_sda_extrato: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_sda_extrato'
    Params.Data = {
      0100060006526573756C74040304000000000000010C4063645F756E69645F6E
      6567010102003000000004406D6573010304000000000000000440616E6F0103
      0400000000000000044064657A0103040000000000000011406E725F6964656E
      746966696361646F7202030400010000000001}
    Left = 148
    Top = 31
  end
end

object frm_s_ref: Tfrm_s_ref
  Left = 371
  Top = 184
  Width = 356
  Height = 438
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Outras referências para Processo'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 52
    Width = 337
    Height = 321
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 4
    Top = 4
    Width = 337
    Height = 45
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 33
    Top = 20
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = 'Referência'
  end
  object btn_fechar: TBitBtn
    Left = 137
    Top = 380
    Width = 75
    Height = 25
    Caption = '&Fechar'
    Default = True
    TabOrder = 2
    OnClick = btn_fecharClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object edt_nr_referencia: TEdit
    Left = 108
    Top = 16
    Width = 177
    Height = 21
    TabOrder = 0
    OnChange = edt_nr_referenciaChange
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 329
    Height = 313
    DataSource = dsq_s_referencia
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'CD_REFERENCIA'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 103
      end
      item
        Alignment = taCenter
        FieldName = 'Look_nr_processo'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 87
      end
      item
        Alignment = taCenter
        FieldName = 'DT_ABERTURA'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 103
      end>
  end
  object dsq_s_referencia: TDataSource
    DataSet = qry_s_ref_
    Left = 144
    Top = 336
  end
  object qry_s_ref_: TQuery
    OnCalcFields = qry_s_ref_CalcFields
    DatabaseName = 'DBPROCESSO'
    SQL.Strings = (
      'SELECT CD_REFERENCIA , '
      ' TREF_CLIENTE.NR_PROCESSO , DT_ABERTURA'
      'FROM TREF_CLIENTE TREF_CLIENTE , TPROCESSO TPROCESSO'
      ' WHERE TREF_CLIENTE.NR_PROCESSO = TPROCESSO.NR_PROCESSO'
      'AND TPROCESSO.CD_CLIENTE = :CD_CLIENTE'
      'ORDER BY CD_REFERENCIA')
    Params.Data = {010001000A43445F434C49454E5445000106003030303031000001}
    Left = 176
    Top = 336
    object qry_s_ref_CD_REFERENCIA: TStringField
      DisplayLabel = 'S/Referência'
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
    object qry_s_ref_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 11
    end
    object qry_s_ref_DT_ABERTURA: TDateTimeField
      DisplayLabel = 'Data de Abertura'
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.DT_ABERTURA'
    end
    object qry_s_ref_Look_nr_processo: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'Look_nr_processo'
      Size = 9
      Calculated = True
    end
  end
end

object frm_gera_drawback: Tfrm_gera_drawback
  Left = 444
  Top = 210
  Width = 571
  Height = 380
  Caption = 'Gera'#231#227'o de Relat'#243'rio de Drawback'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_tabelas: TPanel
    Left = 0
    Top = 49
    Width = 563
    Height = 304
    Align = alClient
    Caption = 'pnl_tabelas'
    TabOrder = 0
    object dbgrd_result_exp: TDBGrid
      Left = 1
      Top = 1
      Width = 561
      Height = 302
      Align = alClient
      DataSource = ds_result_exp
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgrd_result_expCellClick
      OnDrawColumnCell = dbgrd_result_expDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_MERCADORIA'
          Title.Caption = 'C'#243'd. Mercadoria'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_LAUDO'
          Title.Caption = 'N'#186' Laudo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_RE'
          Title.Caption = 'N'#186' RE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_EMBARQUE'
          Title.Caption = 'Data de Embarque'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_NCM_SH'
          Title.Caption = 'NCM'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PL_MERCADORIA'
          Title.Caption = 'Peso em KG'
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'PL_MERCADORIA_ORIGINAL'
          Title.Caption = 'Peso em KG (Original)'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_MERCADORIA'
          Title.Caption = 'Quantidade'
          Width = 60
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'QT_MERCADORIA_ORIGINAL'
          Title.Caption = 'Quantidade (Original)'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_UN_MEDIDA'
          Title.Caption = 'Unid. Medida'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MLE_ITEM'
          Title.Caption = 'VMLE'
          Width = 57
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'VL_MLE_ITEM_ORIGINAL'
          Title.Caption = 'VMLE (Original)'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_MOEDA'
          Title.Caption = 'Moeda VMLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MLE_MNEG'
          Title.Caption = 'Valor Total US$'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PC_COMISSAO'
          Title.Caption = '% Comiss'#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_COMISSAO'
          Title.Caption = 'Valor Comiss'#227'o'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MLE_ITEM_MN'
          Title.Caption = 'FOB L'#237'quido'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_ENQUADRAMENTO'
          Title.Caption = 'Enquadramento'
          Visible = True
        end>
    end
    object dbgrd_result_imp: TDBGrid
      Left = 1
      Top = 1
      Width = 561
      Height = 302
      Align = alClient
      DataSource = ds_result_imp
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgrd_result_impCellClick
      OnDrawColumnCell = dbgrd_result_impDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_MERCADORIA'
          Title.Caption = 'C'#243'd. Mercadoria'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_LAUDO'
          Title.Caption = 'N'#186' Laudo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_MAT_PRI'
          Title.Caption = 'C'#243'd. Mat'#233'ria-Prima'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_DI'
          Title.Caption = 'N'#186' DI'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ADICAO'
          Title.Caption = 'N'#186' Adi'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_ITEM'
          Title.Caption = 'N'#186' Item'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REGISTRO_DI'
          Title.Caption = 'Data Registro DI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_DESEMBARACO'
          Title.Caption = 'Desembara'#231'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_NCM_SH'
          Title.Caption = 'NCM'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PL_MERCADORIA'
          Title.Caption = 'Peso em KG'
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'PL_MERCADORIA_ORIGINAL'
          Title.Caption = 'Peso em KG (Original)'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QT_MERCADORIA'
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'QT_MERCADORIA_ORIGINAL'
          Title.Caption = 'Quantidade (Original)'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_UN_MEDIDA'
          Title.Caption = 'Unid. Medida'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MLE_ITEM'
          Title.Caption = 'VMLE'
          Width = 46
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'VL_MLE_ITEM_ORIGINAL'
          Title.Caption = 'VMLE (Original)'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_MOEDA'
          Title.Caption = 'Moeda'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MLE_MNEG'
          Title.Caption = 'Valor Total US$'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_FRETE_MNEG'
          Title.Caption = 'Frete USD'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_SEGURO_MNEG'
          Title.Caption = 'Seguro USD'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TAXA_X'
          Title.Caption = 'Taxa X'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_TAXA_DOLAR'
          Title.Caption = 'Taxa USD'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_geradrawback: TSpeedButton
      Left = 5
      Top = 4
      Width = 39
      Height = 43
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF6666666666
        6666FF88888888888888FF6FFFFFFFFFFFF6FF8FFFFFFFFFFFF82222222222FF
        88F68888888888FF88F82FFFFFFFF2F888F68FFFFFFFF88888F8222FFFF22288
        88F688888888888888F82F222222F28888F68F888888F88888F82FF2222FF288
        88F68FF88888888888F82FF2222FF28888F68FF88888F88888F82F222222F288
        88F68F888888F88888F82222FF22228888F68888FF88888888F82FFFFFFFF2F8
        88868FFFFFFFF8F888882222222222F666668888888888F88888FF6F888888F6
        6666FF8F888888F8888FFF6F888888F666FFFF8F888888F8888FFF6FFFFFFFF6
        6FFFFF8FFFFFFFF888FFFF6666666666FFFFFF8888888888FFFF}
      NumGlyphs = 2
      OnClick = btn_geradrawbackClick
    end
    object btn_sair: TSpeedButton
      Left = 1323
      Top = 4
      Width = 39
      Height = 43
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      OnClick = btn_sairClick
    end
    object btnConsulta: TSpeedButton
      Left = 424
      Top = 15
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = btnConsultaClick
    end
    object btn_salvar: TSpeedButton
      Left = 472
      Top = 13
      Width = 26
      Height = 25
      Hint = 'Salvar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = btn_salvarClick
    end
    object btn_excluir: TSpeedButton
      Left = 498
      Top = 13
      Width = 26
      Height = 25
      Hint = 'Excluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_excluirClick
    end
    object edtEmpresaNac: TEdit
      Left = 54
      Top = 15
      Width = 66
      Height = 21
      MaxLength = 5
      TabOrder = 0
      OnChange = edtEmpresaNacChange
      OnExit = edtEmpresaNacExit
      OnKeyPress = edtEmpresaNacKeyPress
    end
    object edtNmEmpresa: TEdit
      Left = 128
      Top = 15
      Width = 289
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object qry_result_exp: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA,'
      '             NR_LAUDO,'
      '             NR_RE,'
      '              DT_EMBARQUE,'
      '             CD_NCM_SH,'
      '             CONVERT(VARCHAR(4000), DESCRICAO) AS DESCRICAO,'
      '             PL_MERCADORIA,'
      '             PL_MERCADORIA_ORIGINAL,'
      '             QT_MERCADORIA,'
      '             QT_MERCADORIA_ORIGINAL,'
      '             CD_UN_MEDIDA,'
      '             VL_MLE_ITEM,'
      '             VL_MLE_ITEM_ORIGINAL,'
      '             CD_MOEDA,'
      '             VL_MLE_MNEG,'
      '             PC_COMISSAO,'
      '             VL_COMISSAO,'
      '             VL_MLE_ITEM_MN,'
      '             VL_ENQUADRAMENTO'
      ' FROM TLAUDO_TECNICO_EXP'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      'AND NR_LAUDO = :NR_LAUDO'
      'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA')
    UpdateObject = upd_result_exp
    Left = 88
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LAUDO'
        ParamType = ptInput
      end>
    object qry_result_expCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_MERCADORIA'
      FixedChar = True
      Size = 15
    end
    object qry_result_expNR_LAUDO: TStringField
      FieldName = 'NR_LAUDO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.NR_LAUDO'
      FixedChar = True
      Size = 5
    end
    object qry_result_expNR_RE: TStringField
      FieldName = 'NR_RE'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.NR_RE'
      EditMask = '99/9999999-999;0;_'
      FixedChar = True
      Size = 12
    end
    object qry_result_expDT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.DT_EMBARQUE'
      EditMask = '99/99/9999;0;_'
      FixedChar = True
      Size = 8
    end
    object qry_result_expCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_result_expPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.PL_MERCADORIA'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object qry_result_expQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.QT_MERCADORIA'
    end
    object qry_result_expCD_UN_MEDIDA: TStringField
      FieldName = 'CD_UN_MEDIDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_UN_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_result_expVL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_ITEM'
    end
    object qry_result_expCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_result_expVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_MNEG'
    end
    object qry_result_expPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.PC_COMISSAO'
    end
    object qry_result_expVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_COMISSAO'
    end
    object qry_result_expVL_MLE_ITEM_MN: TFloatField
      FieldName = 'VL_MLE_ITEM_MN'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_ITEM_MN'
    end
    object qry_result_expVL_ENQUADRAMENTO: TFloatField
      FieldName = 'VL_ENQUADRAMENTO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_ENQUADRAMENTO'
    end
    object qry_result_expPL_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'PL_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.PL_MERCADORIA_ORIGINAL'
    end
    object qry_result_expQT_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'QT_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.QT_MERCADORIA_ORIGINAL'
    end
    object qry_result_expVL_MLE_ITEM_ORIGINAL: TFloatField
      FieldName = 'VL_MLE_ITEM_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_EXP.VL_MLE_ITEM_ORIGINAL'
    end
    object qry_result_expDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 255
    end
  end
  object qry_result_imp: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA,'
      'NR_LAUDO,'
      'CD_MAT_PRI,'
      'NR_DI,'
      'NR_ADICAO,'
      'NR_ITEM,'
      'DT_REGISTRO_DI,'
      'DT_DESEMBARACO,'
      'CD_NCM_SH,'
      'CONVERT(VARCHAR(4000), DESCRICAO) AS DESCRICAO,'
      'PL_MERCADORIA,'
      'PL_MERCADORIA_ORIGINAL,'
      'QT_MERCADORIA,'
      'QT_MERCADORIA_ORIGINAL,'
      'CD_UN_MEDIDA,'
      'ROUND(VL_MLE_ITEM, 2) VL_MLE_ITEM,'
      'ROUND(VL_MLE_ITEM_ORIGINAL, 2) VL_MLE_ITEM_ORIGINAL,'
      'CD_MOEDA,'
      'VL_MLE_MNEG,'
      'VL_FRETE_MNEG,'
      'VL_SEGURO_MNEG,'
      'VL_TAXA_X,'
      'VL_TAXA_DOLAR '
      'FROM TLAUDO_TECNICO_IMP'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      'AND NR_LAUDO = :NR_LAUDO'
      'AND CD_MAT_PRI = :CD_MAT_PRI'
      'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA')
    UpdateObject = upd_result_imp
    Left = 208
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LAUDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MAT_PRI'
        ParamType = ptUnknown
      end>
    object qry_result_impCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_MERCADORIA'
      FixedChar = True
      Size = 15
    end
    object qry_result_impNR_LAUDO: TStringField
      FieldName = 'NR_LAUDO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_LAUDO'
      FixedChar = True
      Size = 5
    end
    object qry_result_impCD_MAT_PRI: TStringField
      FieldName = 'CD_MAT_PRI'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_MAT_PRI'
      FixedChar = True
      Size = 15
    end
    object qry_result_impNR_DI: TStringField
      FieldName = 'NR_DI'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_DI'
      FixedChar = True
      Size = 10
    end
    object qry_result_impNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_result_impNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_result_impDT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.DT_REGISTRO_DI'
      EditMask = '99/99/9999;0;_'
      FixedChar = True
      Size = 8
    end
    object qry_result_impDT_DESEMBARACO: TStringField
      FieldName = 'DT_DESEMBARACO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.DT_DESEMBARACO'
      EditMask = '99/99/9999;0;_'
      FixedChar = True
      Size = 8
    end
    object qry_result_impCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qry_result_impDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.DESCRICAO'
      FixedChar = True
      Size = 255
    end
    object qry_result_impPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.PL_MERCADORIA'
    end
    object qry_result_impQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.QT_MERCADORIA'
    end
    object qry_result_impCD_UN_MEDIDA: TStringField
      FieldName = 'CD_UN_MEDIDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_UN_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_result_impVL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_MLE_ITEM'
    end
    object qry_result_impCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_result_impVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_MLE_MNEG'
    end
    object qry_result_impVL_FRETE_MNEG: TFloatField
      FieldName = 'VL_FRETE_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_FRETE_MNEG'
    end
    object qry_result_impVL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_SEGURO_MNEG'
    end
    object qry_result_impVL_TAXA_X: TFloatField
      FieldName = 'VL_TAXA_X'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_TAXA_X'
    end
    object qry_result_impVL_TAXA_DOLAR: TFloatField
      FieldName = 'VL_TAXA_DOLAR'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_TAXA_DOLAR'
    end
    object qry_result_impPL_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'PL_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_TAXA_DOLAR'
    end
    object qry_result_impQT_MERCADORIA_ORIGINAL: TFloatField
      FieldName = 'QT_MERCADORIA_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_TAXA_DOLAR'
    end
    object qry_result_impVL_MLE_ITEM_ORIGINAL: TFloatField
      FieldName = 'VL_MLE_ITEM_ORIGINAL'
      Origin = 'DBBROKER.TLAUDO_TECNICO_IMP.VL_TAXA_DOLAR'
    end
  end
  object ds_result_imp: TDataSource
    DataSet = qry_result_imp
    OnDataChange = ds_result_impDataChange
    Left = 240
    Top = 64
  end
  object ds_result_exp: TDataSource
    DataSet = qry_result_exp
    OnDataChange = ds_result_expDataChange
    Left = 56
    Top = 80
  end
  object upd_result_exp: TUpdateSQL
    ModifySQL.Strings = (
      'update TLAUDO_TECNICO_EXP'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LAUDO = :NR_LAUDO,'
      '  NR_RE = :NR_RE,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  DESCRICAO = :DESCRICAO,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  CD_UN_MEDIDA = :CD_UN_MEDIDA,'
      '  VL_MLE_ITEM = :VL_MLE_ITEM,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  PC_COMISSAO = :PC_COMISSAO,'
      '  VL_COMISSAO = :VL_COMISSAO,'
      '  VL_MLE_ITEM_MN = :VL_MLE_ITEM_MN,'
      '  VL_ENQUADRAMENTO = :VL_ENQUADRAMENTO'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  NR_RE = :OLD_NR_RE and'
      '  DT_EMBARQUE = :OLD_DT_EMBARQUE and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  PC_COMISSAO = :OLD_PC_COMISSAO and'
      '  VL_COMISSAO = :OLD_VL_COMISSAO and'
      '  VL_MLE_ITEM_MN = :OLD_VL_MLE_ITEM_MN and'
      '  VL_ENQUADRAMENTO = :OLD_VL_ENQUADRAMENTO')
    InsertSQL.Strings = (
      'insert into TLAUDO_TECNICO_EXP'
      
        '  (CD_MERCADORIA, NR_LAUDO, NR_RE, DT_EMBARQUE, CD_NCM_SH, DESCR' +
        'ICAO, PL_MERCADORIA, '
      
        '   QT_MERCADORIA, CD_UN_MEDIDA, VL_MLE_ITEM, CD_MOEDA, VL_MLE_MN' +
        'EG, PC_COMISSAO, '
      '   VL_COMISSAO, VL_MLE_ITEM_MN, VL_ENQUADRAMENTO)'
      'values'
      
        '  (:CD_MERCADORIA, :NR_LAUDO, :NR_RE, :DT_EMBARQUE, :CD_NCM_SH, ' +
        ':DESCRICAO, '
      
        '   :PL_MERCADORIA, :QT_MERCADORIA, :CD_UN_MEDIDA, :VL_MLE_ITEM, ' +
        ':CD_MOEDA, '
      
        '   :VL_MLE_MNEG, :PC_COMISSAO, :VL_COMISSAO, :VL_MLE_ITEM_MN, :V' +
        'L_ENQUADRAMENTO)')
    DeleteSQL.Strings = (
      'delete from TLAUDO_TECNICO_EXP'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  NR_RE = :OLD_NR_RE and'
      '  DT_EMBARQUE = :OLD_DT_EMBARQUE and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  PC_COMISSAO = :OLD_PC_COMISSAO and'
      '  VL_COMISSAO = :OLD_VL_COMISSAO and'
      '  VL_MLE_ITEM_MN = :OLD_VL_MLE_ITEM_MN and'
      '  VL_ENQUADRAMENTO = :OLD_VL_ENQUADRAMENTO')
    Left = 80
    Top = 121
  end
  object upd_result_imp: TUpdateSQL
    ModifySQL.Strings = (
      'update TLAUDO_TECNICO_IMP'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LAUDO = :NR_LAUDO,'
      '  CD_MAT_PRI = :CD_MAT_PRI,'
      '  NR_DI = :NR_DI,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  NR_ITEM = :NR_ITEM,'
      '  DT_REGISTRO_DI = :DT_REGISTRO_DI,'
      '  DT_DESEMBARACO = :DT_DESEMBARACO,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  DESCRICAO = :DESCRICAO,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  CD_UN_MEDIDA = :CD_UN_MEDIDA,'
      '  VL_MLE_ITEM = :VL_MLE_ITEM,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  VL_FRETE_MNEG = :VL_FRETE_MNEG,'
      '  VL_SEGURO_MNEG = :VL_SEGURO_MNEG,'
      '  VL_TAXA_X = :VL_TAXA_X,'
      '  VL_TAXA_DOLAR = :VL_TAXA_DOLAR'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  CD_MAT_PRI = :OLD_CD_MAT_PRI and'
      '  NR_DI = :OLD_NR_DI and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  DT_REGISTRO_DI = :OLD_DT_REGISTRO_DI and'
      '  DT_DESEMBARACO = :OLD_DT_DESEMBARACO and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  VL_FRETE_MNEG = :OLD_VL_FRETE_MNEG and'
      '  VL_SEGURO_MNEG = :OLD_VL_SEGURO_MNEG and'
      '  VL_TAXA_X = :OLD_VL_TAXA_X and'
      '  VL_TAXA_DOLAR = :OLD_VL_TAXA_DOLAR')
    InsertSQL.Strings = (
      'insert into TLAUDO_TECNICO_IMP'
      
        '  (CD_MERCADORIA, NR_LAUDO, CD_MAT_PRI, NR_DI, NR_ADICAO, NR_ITE' +
        'M, DT_REGISTRO_DI, '
      
        '   DT_DESEMBARACO, CD_NCM_SH, DESCRICAO, PL_MERCADORIA, QT_MERCA' +
        'DORIA, '
      
        '   CD_UN_MEDIDA, VL_MLE_ITEM, CD_MOEDA, VL_MLE_MNEG, VL_FRETE_MN' +
        'EG, VL_SEGURO_MNEG, '
      '   VL_TAXA_X, VL_TAXA_DOLAR)'
      'values'
      
        '  (:CD_MERCADORIA, :NR_LAUDO, :CD_MAT_PRI, :NR_DI, :NR_ADICAO, :' +
        'NR_ITEM, '
      
        '   :DT_REGISTRO_DI, :DT_DESEMBARACO, :CD_NCM_SH, :DESCRICAO, :PL' +
        '_MERCADORIA, '
      
        '   :QT_MERCADORIA, :CD_UN_MEDIDA, :VL_MLE_ITEM, :CD_MOEDA, :VL_M' +
        'LE_MNEG, '
      '   :VL_FRETE_MNEG, :VL_SEGURO_MNEG, :VL_TAXA_X, :VL_TAXA_DOLAR)')
    DeleteSQL.Strings = (
      'delete from TLAUDO_TECNICO_IMP'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  CD_MAT_PRI = :OLD_CD_MAT_PRI and'
      '  NR_DI = :OLD_NR_DI and'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  DT_REGISTRO_DI = :OLD_DT_REGISTRO_DI and'
      '  DT_DESEMBARACO = :OLD_DT_DESEMBARACO and'
      '  CD_NCM_SH = :OLD_CD_NCM_SH and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  PL_MERCADORIA = :OLD_PL_MERCADORIA and'
      '  QT_MERCADORIA = :OLD_QT_MERCADORIA and'
      '  CD_UN_MEDIDA = :OLD_CD_UN_MEDIDA and'
      '  VL_MLE_ITEM = :OLD_VL_MLE_ITEM and'
      '  CD_MOEDA = :OLD_CD_MOEDA and'
      '  VL_MLE_MNEG = :OLD_VL_MLE_MNEG and'
      '  VL_FRETE_MNEG = :OLD_VL_FRETE_MNEG and'
      '  VL_SEGURO_MNEG = :OLD_VL_SEGURO_MNEG and'
      '  VL_TAXA_X = :OLD_VL_TAXA_X and'
      '  VL_TAXA_DOLAR = :OLD_VL_TAXA_DOLAR')
    Left = 224
    Top = 97
  end
end

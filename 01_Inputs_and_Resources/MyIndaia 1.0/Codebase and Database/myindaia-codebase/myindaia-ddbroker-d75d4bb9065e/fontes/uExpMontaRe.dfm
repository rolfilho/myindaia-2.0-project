object frm_exp_monta_re: Tfrm_exp_monta_re
  Left = 255
  Top = 144
  Width = 750
  Height = 550
  Caption = 'RE - Processo de Exporta'#231#227'o - [M'#243'dulo de Exporta'#231#227'o]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object lbl_cd_unid_neg: TLabel
      Left = 9
      Top = 7
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 222
      Top = 19
      Width = 25
      Height = 22
      Flat = True
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
      OnClick = btn_co_unid_negClick
    end
    object Label52: TLabel
      Left = 255
      Top = 7
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_produto: TSpeedButton
      Left = 478
      Top = 19
      Width = 25
      Height = 22
      Flat = True
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
      Visible = False
      OnClick = btn_co_produtoClick
    end
    object Label2: TLabel
      Left = 615
      Top = 7
      Width = 108
      Height = 13
      Caption = 'Pesquisa Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 564
      Top = 7
      Width = 33
      Height = 35
      Hint = 'Registro de Exporta'#231#227'o'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton2Click
    end
    object edt_nm_unid_neg: TEdit
      Left = 35
      Top = 20
      Width = 186
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edt_nm_produto: TEdit
      Left = 288
      Top = 20
      Width = 189
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
    object edt_chave: TEdit
      Left = 616
      Top = 20
      Width = 118
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnChange = edt_chaveChange
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 10
      Top = 20
      Width = 26
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnChange = btn_co_unid_negClick
      OnExit = msk_cd_unid_negExit
    end
    object msk_cd_produto: TMaskEdit
      Left = 256
      Top = 20
      Width = 33
      Height = 21
      Color = clWhite
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 2
      Visible = False
      OnChange = btn_co_produtoClick
      OnKeyDown = msk_cd_produtoKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 742
    Height = 430
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    Color = clSilver
    TabOrder = 1
    object Panel5: TPanel
      Left = 4
      Top = 4
      Width = 734
      Height = 422
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 422
        Align = alClient
        Ctl3D = False
        DataSource = dsLista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Alignment = taCenter
            Color = clInfoBk
            Expanded = False
            FieldName = 'Status'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clGreen
            Font.Height = -15
            Font.Name = 'Wingdings'
            Font.Style = []
            Visible = True
          end
          item
            Color = 16766935
            Expanded = False
            FieldName = 'NR_PROCESSO_ABR'
            Title.Caption = 'Processo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_EXPORTADOR'
            Title.Caption = 'Exportador'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeExportador'
            Title.Caption = 'Nome do Exportador'
            Width = 299
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_OUTRAS_REF'
            Title.Caption = 'Refer'#234'ncia'
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PROCESSO'
            Title.Caption = 'Processo'
            Visible = False
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 479
    Width = 742
    Height = 44
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      742
      44)
    object btn_preparar: TSpeedButton
      Left = 504
      Top = 7
      Width = 115
      Height = 30
      Hint = 'Monta o Processo de Exporta'#231#227'o'
      Anchors = [akTop, akRight]
      Caption = '&Preparar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_prepararClick
    end
    object btn_sair: TSpeedButton
      Left = 620
      Top = 7
      Width = 116
      Height = 30
      Hint = 'Sair'
      Anchors = [akTop, akRight]
      Caption = '&Sair'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object Shape1: TShape
      Left = 10
      Top = 10
      Width = 409
      Height = 25
      Brush.Color = clInfoBk
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 330
      Height = 13
      Caption = 
        '* duplo-clique na primeira coluna para marcar / desmarcar o proc' +
        'esso.'
      Transparent = True
    end
  end
  object qry_lista: TQuery
    CachedUpdates = True
    AfterPost = qry_listaAfterPost
    OnCalcFields = qry_listaCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, IN_SELECIONADO, CD_EXPORTADOR, NR_OUTRAS_REF' +
        ', CD_USUARIO, SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO_ABR'
      'FROM TPROCESSO_EXP'
      'WHERE SUBSTRING(NR_PROCESSO,1,2) = '#39#39
      '  AND SUBSTRING(NR_PROCESSO,3,2) = '#39#39
      '  AND ISNULL(IN_MONTADO,'#39'0'#39') = '#39'0'#39
      'ORDER BY SUBSTRING(NR_PROCESSO, 5, 14) DESC ')
    UpdateObject = updLista
    Left = 40
    Top = 379
    object qry_listaStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Size = 1
      Calculated = True
    end
    object qry_listaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_listaCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_listaNR_OUTRAS_REF: TStringField
      FieldName = 'NR_OUTRAS_REF'
      FixedChar = True
      Size = 30
    end
    object qry_listaNomeExportador: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeExportador'
      Size = 40
      Calculated = True
    end
    object qry_listaIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_listaNR_PROCESSO_ABR: TStringField
      FieldName = 'NR_PROCESSO_ABR'
      FixedChar = True
      Size = 14
    end
    object qry_listaCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
  end
  object dsLista: TDataSource
    DataSet = qry_lista
    Left = 8
    Top = 379
  end
  object updLista: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP'
      'set'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  CD_USUARIO = :CD_USUARIO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP'
      '  (IN_SELECIONADO, CD_USUARIO)'
      'values'
      '  (:IN_SELECIONADO, :CD_USUARIO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 72
    Top = 379
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 40
    Top = 347
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 8
    Top = 347
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 40
    Top = 443
    object qry_exec_sp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_exec_sp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 8
    Top = 411
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, CD_PRODUTO'
      'FROM   TUNID_NEG_PRODUTO'
      'WHERE  ( CD_UNID_NEG+CD_PRODUTO ) IN'
      '         ( SELECT ( CD_UNID_NEG+CD_PRODUTO )'
      '           FROM   TUSUARIO_HABILITACAO'
      '           WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                  IN_ATIVO = '#39'1'#39' AND'
      '                  CD_PRODUTO = :CD_PRODUTO )')
    Left = 72
    Top = 411
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 40
    Top = 411
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object Query1: TQuery
    Left = 72
    Top = 443
  end
  object sp_exp_monta_re: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'sp_exp_monta_re'
    Left = 8
    Top = 443
    ParamData = <
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptResult
      end>
  end
end

object frm_banco_itl: Tfrm_banco_itl
  Left = 163
  Top = 147
  Width = 639
  Height = 477
  Caption = 'Cadastro de Banco Internacional'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Incluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_incluirClick
    end
    object btn_excluir: TSpeedButton
      Left = 92
      Top = 12
      Width = 25
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
    object btn_sair: TSpeedButton
      Left = 280
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Sair'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_salvar: TSpeedButton
      Left = 36
      Top = 12
      Width = 25
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
    object btn_cancelar: TSpeedButton
      Left = 64
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = btn_cancelarClick
    end
    object dbnvg: TDBNavigator
      Left = 148
      Top = 12
      Width = 104
      Height = 25
      DataSource = ds_bco_itl
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 321
    Top = 0
    Width = 309
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 5
      Width = 56
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 148
      Top = 5
      Width = 37
      Height = 13
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_chave: TEdit
      Left = 12
      Top = 20
      Width = 129
      Height = 21
      TabOrder = 0
      OnChange = edt_chaveChange
      OnKeyDown = edt_chaveKeyDown
    end
    object cb_ordem: TComboBox
      Left = 148
      Top = 20
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_bco_itl: TPageControl
    Left = -1
    Top = 51
    Width = 628
    Height = 376
    ActivePage = ts_lista
    TabOrder = 2
    OnChange = pgctrl_bco_itlChange
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbgrid_bco_itl: TDBGrid
        Left = 0
        Top = 0
        Width = 617
        Height = 341
        DataSource = ds_bco_itl
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrid_bco_itlDblClick
        OnKeyPress = dbgrid_bco_itlKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_BANCO'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_BANCO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 305
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 56
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 56
        Width = 55
        Height = 13
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 576
        Top = 56
        Width = 17
        Height = 13
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 469
        Top = 56
        Width = 52
        Height = 13
        Caption = 'Zip Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 145
        Width = 40
        Height = 13
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 304
        Top = 145
        Width = 27
        Height = 13
        Caption = 'Pa'#237's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cidade: TSpeedButton
        Left = 264
        Top = 160
        Width = 25
        Height = 23
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
        OnClick = btn_co_cidadeClick
      end
      object btn_co_pais: TSpeedButton
        Left = 584
        Top = 161
        Width = 25
        Height = 23
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
        OnClick = btn_co_paisClick
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 24
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_BANCO'
        DataSource = ds_bco_itl
        ReadOnly = True
        TabOrder = 0
      end
      object dbedt_nm_cidade: TDBEdit
        Left = 52
        Top = 161
        Width = 206
        Height = 21
        Color = clMenu
        DataField = 'NM_CIDADE'
        DataSource = ds_bco_itl
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_pais: TDBEdit
        Left = 349
        Top = 162
        Width = 228
        Height = 21
        Color = clMenu
        DataField = 'NM_PAIS'
        DataSource = ds_bco_itl
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nm_bco: TDBEdit
        Left = 56
        Top = 24
        Width = 553
        Height = 21
        DataField = 'NM_BANCO'
        DataSource = ds_bco_itl
        TabOrder = 3
        OnChange = dbedt_nm_bcoChange
      end
      object DBEdit5: TDBEdit
        Left = 469
        Top = 72
        Width = 97
        Height = 21
        DataField = 'END_ZIP_CODE'
        DataSource = ds_bco_itl
        TabOrder = 4
        OnChange = dbedt_nm_bcoChange
      end
      object DBEdit4: TDBEdit
        Left = 576
        Top = 72
        Width = 33
        Height = 21
        DataField = 'END_UF'
        DataSource = ds_bco_itl
        TabOrder = 5
        OnChange = dbedt_nm_bcoChange
      end
      object dbedt_cd_cidade: TDBEdit
        Left = 8
        Top = 161
        Width = 41
        Height = 21
        DataField = 'CD_CIDADE'
        DataSource = ds_bco_itl
        TabOrder = 6
        OnChange = dbedt_nm_bcoChange
        OnExit = dbedt_cd_cidadeExit
        OnKeyDown = dbedt_cd_cidadeKeyDown
      end
      object dbedt_cd_pais: TDBEdit
        Left = 304
        Top = 161
        Width = 41
        Height = 21
        DataField = 'CD_PAIS'
        DataSource = ds_bco_itl
        TabOrder = 7
        OnChange = dbedt_nm_bcoChange
        OnExit = dbedt_cd_paisExit
      end
      object DBMemo1: TDBMemo
        Left = 8
        Top = 70
        Width = 385
        Height = 71
        DataField = 'END_BANCO'
        DataSource = ds_bco_itl
        TabOrder = 8
        OnChange = dbedt_nm_bcoChange
      end
    end
  end
  object qry_bco_itl_: TQuery
    CachedUpdates = True
    BeforePost = qry_bco_itl_BeforePost
    AfterPost = qry_bco_itl_AfterPost
    AfterDelete = qry_bco_itl_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TB.CD_BANCO, TB.NM_BANCO, TB.END_BANCO, TB.END_UF, TB.END' +
        '_ZIP_CODE, TB.IN_ATIVO,'
      
        '  TB.CD_CIDADE,(SELECT TL.DESCRICAO FROM TLOCAL_EMBARQUE TL (NOL' +
        'OCK) WHERE TL.CODIGO = TB.CD_CIDADE)NM_CIDADE,'
      
        '  TB.CD_PAIS, (SELECT TP.NM_PAIS FROM TPAIS_BROKER TP (NOLOCK) W' +
        'HERE TP.CD_PAIS = TB.CD_PAIS)NM_PAIS'
      '  FROM TBCO_ITL TB ORDER BY'
      '     TB.NM_BANCO'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_banco
    Left = 12
    Top = 376
    object qry_bco_itl_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_bco_itl_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 50
    end
    object qry_bco_itl_END_BANCO: TStringField
      FieldName = 'END_BANCO'
      FixedChar = True
      Size = 255
    end
    object qry_bco_itl_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 5
    end
    object qry_bco_itl_END_ZIP_CODE: TStringField
      FieldName = 'END_ZIP_CODE'
      FixedChar = True
      Size = 10
    end
    object qry_bco_itl_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_bco_itl_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_bco_itl_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_bco_itl_NM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_bco_itl_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      FixedChar = True
      Size = 120
    end
  end
  object ds_bco_itl: TDataSource
    DataSet = qry_bco_itl_
    Left = 60
    Top = 376
  end
  object MainMenu1: TMainMenu
    Left = 548
    Top = 368
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      OnClick = btn_excluirClick
    end
    object TMenuItem
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object UpDAte_banco: TUpdateSQL
    ModifySQL.Strings = (
      'update TBCO_ITL'
      'set'
      '  CD_BANCO = :CD_BANCO,'
      '  NM_BANCO = :NM_BANCO,'
      '  END_BANCO = :END_BANCO,'
      '  END_UF = :END_UF,'
      '  END_ZIP_CODE = :END_ZIP_CODE,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  CD_PAIS = :CD_PAIS,'
      '  IN_ATIVO = :IN_ATIVO'
      'where'
      '  CD_BANCO = :OLD_CD_BANCO')
    InsertSQL.Strings = (
      'insert into TBCO_ITL'
      
        '  (CD_BANCO, NM_BANCO, END_BANCO, END_UF, END_ZIP_CODE, CD_CIDAD' +
        'E, CD_PAIS, '
      '   IN_ATIVO)'
      'values'
      
        '  (:CD_BANCO, :NM_BANCO, :END_BANCO, :END_UF, :END_ZIP_CODE, :CD' +
        '_CIDADE, '
      '   :CD_PAIS, :IN_ATIVO)')
    DeleteSQL.Strings = (
      'delete from TBCO_ITL'
      'where'
      '  CD_BANCO = :OLD_CD_BANCO')
    Left = 100
    Top = 379
  end
end

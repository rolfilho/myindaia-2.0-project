object frm_comissaria: Tfrm_comissaria
  Left = 216
  Top = 162
  Width = 639
  Height = 483
  Caption = 'Cadastro de Comissárias'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
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
      ParentShowHint = False
      ShowHint = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
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
    object dbnvg: TDBNavigator
      Left = 148
      Top = 12
      Width = 104
      Height = 25
      DataSource = ds_comissaria
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pnl_pesquisa: TPanel
    Left = 320
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
      TabStop = False
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 148
      Top = 20
      Width = 153
      Height = 21
      TabStop = False
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnClick = cb_ordemClick
    end
  end
  object pgctrl_comissaria: TPageControl
    Left = 0
    Top = 52
    Width = 629
    Height = 381
    ActivePage = ts_lista
    TabOrder = 2
    OnChange = pgctrl_comissariaChange
    OnChanging = pgctrl_comissariaChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 5
        Top = 8
        Width = 609
        Height = 333
        DataSource = ds_comissaria
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_COMISSARIA'
            Title.Caption = 'Cód.'
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
            FieldName = 'NM_COMISSARIA'
            Title.Caption = 'Comissária'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 346
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_ativo'
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados Básicos'
      object pnl_entrada_de_dados: TPanel
        Left = 12
        Top = 8
        Width = 605
        Height = 333
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 10
          Top = 18
          Width = 40
          Height = 13
          Caption = 'Código'
          FocusControl = dbedt_cd_comissaria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNome: TLabel
          Left = 69
          Top = 18
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAtivo: TLabel
          Left = 502
          Top = 18
          Width = 30
          Height = 13
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 10
          Top = 66
          Width = 55
          Height = 13
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 10
          Top = 114
          Width = 29
          Height = 13
          Caption = 'Fone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 173
          Top = 114
          Width = 21
          Height = 13
          Caption = 'Fax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 10
          Top = 162
          Width = 31
          Height = 13
          Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_comissaria: TDBEdit
          Left = 10
          Top = 34
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_COMISSARIA'
          DataSource = ds_comissaria
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_comissaria: TDBEdit
          Left = 68
          Top = 34
          Width = 418
          Height = 21
          DataField = 'NM_COMISSARIA'
          DataSource = ds_comissaria
          TabOrder = 1
          OnChange = dbedt_nm_comissariaChange
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 496
          Top = 33
          Width = 57
          Height = 21
          Style = csDropDownList
          DataField = 'IN_ATIVO'
          DataSource = ds_comissaria
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
          Values.Strings = (
            '1'
            '0')
          OnChange = dbedt_nm_comissariaChange
        end
        object DBEdit1: TDBEdit
          Left = 10
          Top = 82
          Width = 541
          Height = 21
          DataField = 'END_COMISSRIA'
          DataSource = ds_comissaria
          TabOrder = 3
          OnChange = dbedt_nm_comissariaChange
        end
        object DBEdit2: TDBEdit
          Left = 10
          Top = 130
          Width = 133
          Height = 21
          DataField = 'FONE_COMISSARIA'
          DataSource = ds_comissaria
          TabOrder = 4
          OnChange = dbedt_nm_comissariaChange
        end
        object DBEdit3: TDBEdit
          Left = 172
          Top = 130
          Width = 133
          Height = 21
          DataField = 'FAX_COMISSARIA'
          DataSource = ds_comissaria
          TabOrder = 5
          OnChange = dbedt_nm_comissariaChange
        end
        object DBEdit4: TDBEdit
          Left = 10
          Top = 178
          Width = 543
          Height = 21
          DataField = 'EMAIL_COMISSARIA'
          DataSource = ds_comissaria
          TabOrder = 6
          OnChange = dbedt_nm_comissariaChange
        end
      end
    end
  end
  object qry_comissaria_: TQuery
    CachedUpdates = True
    BeforePost = qry_comissaria_BeforePost
    AfterPost = qry_comissaria_AfterPost
    AfterDelete = qry_comissaria_AfterDelete
    OnCalcFields = qry_comissaria_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_COMISSARIA, NM_COMISSARIA, FAX_COMISSARIA, '
      'FONE_COMISSARIA, EMAIL_COMISSARIA, IN_ATIVO, END_COMISSRIA'
      '  FROM TCOMISSARIA ORDER BY'
      '   NM_COMISSARIA')
    UpdateObject = UpDAte_comissaria
    Left = 24
    Top = 364
    object qry_comissaria_NM_COMISSARIA: TStringField
      FieldName = 'NM_COMISSARIA'
      Origin = 'DBBROKER.TCOMISSARIA.NM_COMISSARIA'
      FixedChar = True
      Size = 50
    end
    object qry_comissaria_FAX_COMISSARIA: TStringField
      FieldName = 'FAX_COMISSARIA'
      Origin = 'DBBROKER.TCOMISSARIA.FAX_COMISSARIA'
      FixedChar = True
      Size = 12
    end
    object qry_comissaria_FONE_COMISSARIA: TStringField
      FieldName = 'FONE_COMISSARIA'
      Origin = 'DBBROKER.TCOMISSARIA.FONE_COMISSARIA'
      FixedChar = True
      Size = 12
    end
    object qry_comissaria_EMAIL_COMISSARIA: TStringField
      FieldName = 'EMAIL_COMISSARIA'
      Origin = 'DBBROKER.TCOMISSARIA.EMAIL_COMISSARIA'
      FixedChar = True
      Size = 30
    end
    object qry_comissaria_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TCOMISSARIA.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_comissaria_END_COMISSRIA: TStringField
      FieldName = 'END_COMISSRIA'
      Origin = 'DBBROKER.TCOMISSARIA.END_COMISSRIA'
      FixedChar = True
      Size = 50
    end
    object qry_comissaria_calc_ativo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ativo'
      Size = 3
      Calculated = True
    end
    object qry_comissaria_CD_COMISSARIA: TStringField
      FieldName = 'CD_COMISSARIA'
      Origin = 'DBBROKER.TCOMISSARIA.CD_COMISSARIA'
      FixedChar = True
      Size = 3
    end
  end
  object ds_comissaria: TDataSource
    DataSet = qry_comissaria_
    Left = 56
    Top = 364
  end
  object UpDAte_comissaria: TUpdateSQL
    ModifySQL.Strings = (
      'update TCOMISSARIA'
      'set'
      '  CD_COMISSARIA = :CD_COMISSARIA,'
      '  NM_COMISSARIA = :NM_COMISSARIA,'
      '  FAX_COMISSARIA = :FAX_COMISSARIA,'
      '  FONE_COMISSARIA = :FONE_COMISSARIA,'
      '  EMAIL_COMISSARIA = :EMAIL_COMISSARIA,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  END_COMISSRIA = :END_COMISSRIA'
      'where'
      '  CD_COMISSARIA = :OLD_CD_COMISSARIA')
    InsertSQL.Strings = (
      'insert into TCOMISSARIA'
      
        '  (CD_COMISSARIA, NM_COMISSARIA, FAX_COMISSARIA, FONE_COMISSARIA' +
        ', EMAIL_COMISSARIA, '
      '   IN_ATIVO, END_COMISSRIA)'
      'values'
      
        '  (:CD_COMISSARIA, :NM_COMISSARIA, :FAX_COMISSARIA, :FONE_COMISS' +
        'ARIA, :EMAIL_COMISSARIA, '
      '   :IN_ATIVO, :END_COMISSRIA)')
    DeleteSQL.Strings = (
      'delete from TCOMISSARIA'
      'where'
      '  CD_COMISSARIA = :OLD_CD_COMISSARIA')
    Left = 104
    Top = 364
  end
  object qry_ult_comissaria_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_comissaria
    SQL.Strings = (
      'SELECT mAX(CD_COMISSARIA) ULTIMO'
      '  FROM TCOMISSARIA')
    Left = 144
    Top = 364
    object qry_ult_comissaria_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TCOMISSARIA.CD_COMISSARIA'
      FixedChar = True
      Size = 3
    end
  end
  object MainMenu1: TMainMenu
    Left = 484
    Top = 276
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
      Caption = 'Excluir'
      OnClick = btn_excluirClick
    end
    object TMenuItem
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end

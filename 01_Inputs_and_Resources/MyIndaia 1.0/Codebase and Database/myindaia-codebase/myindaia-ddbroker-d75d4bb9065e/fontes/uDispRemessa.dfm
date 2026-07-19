object frm_disp_remessa: Tfrm_disp_remessa
  Left = 422
  Top = 236
  Width = 750
  Height = 550
  Caption = 'Disponibilidade para Remessa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      51)
    object shp1: TShape
      Left = 440
      Top = 5
      Width = 297
      Height = 41
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 6
      Width = 40
      Height = 40
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
      Left = 124
      Top = 6
      Width = 40
      Height = 40
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
      Left = 393
      Top = 6
      Width = 40
      Height = 40
      Hint = 'Sair'
      Anchors = [akTop, akRight]
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
      Left = 44
      Top = 6
      Width = 40
      Height = 40
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
      Left = 84
      Top = 6
      Width = 40
      Height = 40
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
    object lbl_pesquisa: TLabel
      Left = 444
      Top = 7
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_ordem_pesquisa: TLabel
      Left = 580
      Top = 7
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbnvg: TDBNavigator
      Left = 280
      Top = 12
      Width = 100
      Height = 25
      DataSource = ds_disp_remessa
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 444
      Top = 20
      Width = 129
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 580
      Top = 20
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      TabStop = False
      OnChange = cb_ordemChange
      Items.Strings = (
        'C'#243'd. Banco'
        'Nome Banco'
        'Vl. Dispon'#237'vel'
        'Vl. Utilizado')
    end
  end
  object pgctrl_disp_remessa: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 453
    ActivePage = ts_dados
    Align = alClient
    TabOrder = 1
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 384
        Align = alClient
        DataSource = ds_disp_remessa
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_DISP'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_DISP'
            Title.Caption = 'Valor Dispon'#237'vel'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_UTILIZADO'
            Title.Caption = 'Valor Utilizado'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_saldo'
            Title.Caption = 'Saldo Di'#225'rio'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
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
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_BANCO'
            Title.Caption = 'Banco'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 270
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 384
        Width = 734
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        DesignSize = (
          734
          41)
        object Label5: TLabel
          Left = 528
          Top = 13
          Width = 66
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Saldo Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_tt_saldo: TEdit
          Left = 600
          Top = 9
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object ts_dados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 13
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 52
        Width = 95
        Height = 13
        Caption = 'Valor Dispon'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 92
        Width = 83
        Height = 13
        Caption = 'Valor Utilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 129
        Width = 37
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_bco_ag: TSpeedButton
        Left = 370
        Top = 143
        Width = 24
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
        OnClick = btn_co_bco_agClick
      end
      object dbedt_dt_disp: TDBEdit
        Left = 8
        Top = 27
        Width = 121
        Height = 21
        DataField = 'DT_DISP'
        DataSource = ds_disp_remessa
        TabOrder = 0
        OnChange = dbedt_vl_dispChange
        OnExit = dbedt_dt_dispExit
      end
      object dbedt_vl_disp: TDBEdit
        Left = 8
        Top = 66
        Width = 121
        Height = 21
        DataField = 'VL_DISP'
        DataSource = ds_disp_remessa
        TabOrder = 1
        OnChange = dbedt_vl_dispChange
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 105
        Width = 121
        Height = 21
        Color = clMenu
        DataField = 'VL_UTILIZADO'
        DataSource = ds_disp_remessa
        TabOrder = 2
      end
      object dbedt_cd_bco: TDBEdit
        Left = 8
        Top = 144
        Width = 41
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = ds_disp_remessa
        TabOrder = 3
        OnChange = btn_co_bco_agClick
        OnExit = dbedt_cd_bcoExit
        OnKeyDown = dbedt_cd_bcoKeyDown
      end
      object dbedt_nm_bco: TDBEdit
        Left = 49
        Top = 144
        Width = 319
        Height = 21
        Color = clMenu
        DataField = 'NM_BANCO'
        DataSource = ds_disp_remessa
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 584
    Top = 296
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_Salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_Cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_Excluir: TMenuItem
      Caption = '&Excluir'
      OnClick = btn_excluirClick
    end
    object TMenuItem
    end
    object mi_Sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object qry_disp_remessa_: TQuery
    CachedUpdates = True
    AfterPost = qry_disp_remessa_AfterPost
    AfterDelete = qry_disp_remessa_AfterDelete
    OnCalcFields = qry_disp_remessa_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT D.DT_DISP, D.VL_DISP, D.VL_UTILIZADO, D.CD_BANCO, B.NM_BA' +
        'NCO'
      '  FROM TDISP_REMESSA D'
      '  LEFT JOIN TBANCO B ON B.CD_BANCO = D.CD_BANCO'
      'ORDER BY'
      '  D.DT_DISP'
      ''
      ' ')
    UpdateObject = Update_disp
    Left = 236
    Top = 296
    object qry_disp_remessa_DT_DISP: TDateTimeField
      FieldName = 'DT_DISP'
      Origin = 'DBBROKER.TDISP_REMESSA.DT_DISP'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_disp_remessa_VL_DISP: TFloatField
      FieldName = 'VL_DISP'
      Origin = 'DBBROKER.TDISP_REMESSA.VL_DISP'
      DisplayFormat = '0.00'
    end
    object qry_disp_remessa_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'DBBROKER.TDISP_REMESSA.VL_UTILIZADO'
      DisplayFormat = '0.00'
    end
    object qry_disp_remessa_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_disp_remessa_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qry_disp_remessa_calc_saldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_saldo'
      DisplayFormat = '0.00'
      Calculated = True
    end
  end
  object ds_disp_remessa: TDataSource
    DataSet = qry_disp_remessa_
    Left = 332
    Top = 296
  end
  object Update_disp: TUpdateSQL
    ModifySQL.Strings = (
      'update TDISP_REMESSA'
      'set'
      '  DT_DISP = :DT_DISP,'
      '  VL_DISP = :VL_DISP,'
      '  VL_UTILIZADO = :VL_UTILIZADO,'
      '  CD_BANCO = :CD_BANCO'
      'where'
      '  DT_DISP = :OLD_DT_DISP')
    InsertSQL.Strings = (
      'insert into TDISP_REMESSA'
      '  (DT_DISP, VL_DISP, VL_UTILIZADO, CD_BANCO)'
      'values'
      '  (:DT_DISP, :VL_DISP, :VL_UTILIZADO, :CD_BANCO)')
    DeleteSQL.Strings = (
      'delete from TDISP_REMESSA'
      'where'
      '  DT_DISP = :OLD_DT_DISP')
    Left = 412
    Top = 296
  end
end

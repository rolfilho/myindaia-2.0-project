object frm_trans_LI: Tfrm_trans_LI
  Left = 378
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Transmiss'#227'o de Licen'#231'a de Importa'#231#227'o'
  ClientHeight = 504
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_trans_li
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 742
    Height = 350
    Align = alClient
    TabOrder = 0
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 3
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 154
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
      OnClick = btn_cd_unid_negClick
    end
    object dbgrd_li: TDBGrid
      Left = 8
      Top = 45
      Width = 721
      Height = 292
      DataSource = datm_trans_LI.ds_li_lista
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = dbgrd_liKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CalcNrProcesso'
          Title.Color = clBlack
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_PROCESSO_LI'
          Title.Color = clBlack
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_EMPRESA'
          Title.Color = clBlack
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 269
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_REGISTRO_LI'
          Title.Color = clBlack
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REGISTRO_LI'
          Title.Color = clBlack
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 88
          Visible = True
        end>
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 16
      Width = 21
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 32
      Top = 16
      Width = 120
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 399
    Width = 742
    Height = 105
    Align = alBottom
    TabOrder = 1
    object gbox_monitor: TGroupBox
      Left = 11
      Top = 6
      Width = 710
      Height = 90
      Caption = '[ Monitor ]'
      TabOrder = 0
      object lbl_Capas: TLabel
        Left = 8
        Top = 21
        Width = 63
        Height = 13
        Caption = 'Processos '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 44
        Width = 77
        Height = 13
        Caption = 'Itens            '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 68
        Width = 65
        Height = 13
        Caption = 'Mensagem '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_processos: TLabel
        Left = 83
        Top = 21
        Width = 57
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_itens: TLabel
        Left = 83
        Top = 44
        Width = 57
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_mensagem: TLabel
        Left = 83
        Top = 68
        Width = 141
        Height = 13
        Caption = 'Aguardando instru'#231#227'o ...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object btn_sair: TSpeedButton
      Left = 387
      Top = 4
      Width = 38
      Height = 41
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
    object btn_trans_LI: TSpeedButton
      Left = 3
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Transmitir LI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_trans_LIClick
    end
    object btn_cancelar: TSpeedButton
      Left = 41
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Cancelar'
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
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 45
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 0
      object lbl_pesquisa: TLabel
        Left = 6
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
      object lbl_ordem_pesquisa: TLabel
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
        Left = 6
        Top = 19
        Width = 139
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 19
        Width = 155
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordem1Click
        Items.Strings = (
          'Processo LI'
          'Cod.Importador + Processo LI'
          'Cod.Importador + Dt. Vencimernto + Processo LI')
      end
    end
  end
  object menu_trans_li: TMainMenu
    Left = 264
    Top = 328
    object mi_trans_LI: TMenuItem
      Caption = '&Transmitir LI'
      OnClick = btn_trans_LIClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object SP_cons_db_susp: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'sp_cons_db_susp'
    Left = 264
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_movimento'
        ParamType = ptInput
      end>
  end
  object sp_saldo_drawback: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'sp_saldo_drawback'
    Left = 392
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = '0'
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_movimento'
        ParamType = ptInput
      end>
  end
  object SqlAuxiliar: TQuery
    DatabaseName = 'DBBROKER'
    Left = 320
    Top = 223
  end
end

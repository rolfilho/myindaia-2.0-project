object frm_lib_pagto1: Tfrm_lib_pagto1
  Left = 170
  Top = 99
  Width = 640
  Height = 480
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Liberação / Baixa de Movimentos'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 4
    Top = 0
    Width = 625
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 340
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
    object btn_marca_todas: TSpeedButton
      Left = 160
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Marcar Todas'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_marca_todasClick
    end
    object btn_desmarca_todas: TSpeedButton
      Left = 135
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Desmarcar Todas'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object btn_liberar: TSpeedButton
      Left = 17
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Liberar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
        0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
        03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
        033333337F73FF737F33B33B778000877333333373F777337333333B30888880
        33333333373FFFF73333333B3300000333333333337777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_liberarClick
    end
    object btn_nao_liberar: TSpeedButton
      Left = 52
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Não Liberar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
        00333337777777777733333308033308033333337F7F337F7F33333308033308
        033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
        7333333373F77733733333333088888033333333373FFFF73333333333000003
        3333333333777773333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_nao_liberarClick
    end
    object lbl_pagto: TLabel
      Left = 457
      Top = 6
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvg: TDBNavigator
      Left = 213
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_lib_pagto.ds_lib_pagto
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
    object msk_dt_pagto: TMaskEdit
      Left = 457
      Top = 20
      Width = 96
      Height = 21
      EditMask = '!99/99/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = msk_dt_pagtoEnter
      OnExit = msk_dt_pagtoExit
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 632
    Height = 384
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Pagamentos'
      object Label1: TLabel
        Left = 4
        Top = 110
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Itens Pendentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_itens_ok: TLabel
        Left = 4
        Top = 238
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Itens Liberados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrdItensPendentes: TDBGrid
        Left = 4
        Top = 123
        Width = 622
        Height = 114
        DataSource = datm_lib_pagto.ds_lib_pagto_item
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'NR_REF'
            Title.Color = clBlack
            Width = 47
          end
          item
            FieldName = 'CalcNrProcesso'
            Title.Color = clBlack
            Width = 81
          end
          item
            FieldName = 'NM_ITEM'
            Title.Color = clBlack
            Width = 209
          end
          item
            FieldName = 'VL_BLOQUEADO'
            Title.Color = clBlack
            Width = 99
          end
          item
            FieldName = 'NM_STATUS'
            Title.Color = clBlack
            Width = 148
          end>
      end
      object dbgrdPagtos: TDBGrid
        Left = 4
        Top = 0
        Width = 629
        Height = 109
        DataSource = datm_lib_pagto.ds_lib_pagto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'NR_REF'
            Title.Color = clBlack
            Width = 46
          end
          item
            FieldName = 'NM_BANCO'
            Title.Color = clBlack
            Width = 153
          end
          item
            FieldName = 'NM_FAVORECIDO'
            Title.Color = clBlack
            Width = 167
          end
          item
            FieldName = 'VL_PAGTO'
            Title.Color = clBlack
            Width = 110
          end
          item
            FieldName = 'VL_BLOQUEADO'
            Title.Color = clBlack
            Width = 108
          end>
      end
      object dbgrdItensLiberados: TDBGrid
        Left = 4
        Top = 252
        Width = 625
        Height = 103
        DataSource = datm_lib_pagto.ds_itens_liberados_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'NR_REF'
            Title.Color = clBlack
            Width = 47
          end
          item
            FieldName = 'CalcNrProcesso'
            Title.Color = clBlack
            Width = 81
          end
          item
            FieldName = 'NM_ITEM'
            Title.Color = clBlack
            Width = 209
          end
          item
            FieldName = 'VL_PAGTO'
            Title.Color = clBlack
            Width = 96
          end
          item
            FieldName = 'NM_STATUS'
            Title.Color = clBlack
            Width = 162
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Recebimentos'
      object Label2: TLabel
        Left = 3
        Top = 110
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Itens Pendentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 235
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Itens Liberados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 0
        Width = 629
        Height = 109
        DataSource = datm_lib_pagto.ds_lib_pagto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'NR_REF'
            Title.Color = clBlack
            Width = 46
          end
          item
            FieldName = 'NM_BANCO'
            Title.Color = clBlack
            Width = 153
          end
          item
            FieldName = 'NM_FAVORECIDO'
            Title.Color = clBlack
            Width = 167
          end
          item
            FieldName = 'VL_PAGTO'
            Title.Color = clBlack
            Width = 110
          end
          item
            FieldName = 'VL_BLOQUEADO'
            Title.Color = clBlack
            Width = 108
          end>
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 122
        Width = 622
        Height = 114
        DataSource = datm_lib_pagto.ds_lib_pagto_item
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'NR_REF'
            Title.Color = clBlack
            Width = 47
          end
          item
            FieldName = 'CalcNrProcesso'
            Title.Color = clBlack
            Width = 81
          end
          item
            FieldName = 'NM_ITEM'
            Title.Color = clBlack
            Width = 209
          end
          item
            FieldName = 'VL_BLOQUEADO'
            Title.Color = clBlack
            Width = 99
          end
          item
            FieldName = 'NM_STATUS'
            Title.Color = clBlack
            Width = 148
          end>
      end
      object DBGrid3: TDBGrid
        Left = 3
        Top = 248
        Width = 625
        Height = 103
        DataSource = datm_lib_pagto.ds_itens_liberados_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'NR_REF'
            Title.Color = clBlack
            Width = 47
          end
          item
            FieldName = 'CalcNrProcesso'
            Title.Color = clBlack
            Width = 81
          end
          item
            FieldName = 'NM_ITEM'
            Title.Color = clBlack
            Width = 209
          end
          item
            FieldName = 'VL_PAGTO'
            Title.Color = clBlack
            Width = 96
          end
          item
            FieldName = 'NM_STATUS'
            Title.Color = clBlack
            Width = 162
          end>
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 401
    Top = 4
    object mi_liberar: TMenuItem
      Caption = '&Liberar'
      OnClick = btn_liberarClick
    end
    object mi_nao_liberar: TMenuItem
      Caption = '&Não Liberar'
      OnClick = btn_nao_liberarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end

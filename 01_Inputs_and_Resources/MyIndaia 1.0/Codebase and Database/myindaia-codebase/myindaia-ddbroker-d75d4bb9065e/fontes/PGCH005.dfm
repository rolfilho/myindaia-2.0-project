object frm_liberacao: Tfrm_liberacao
  Left = 117
  Top = 72
  Width = 640
  Height = 480
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Liberação de Cheque/Autorização para Débito em Conta'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_solic_: TPageControl
    Left = 0
    Top = 50
    Width = 629
    Height = 385
    ActivePage = ts_lista
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbgrd_solic: TDBGrid
        Left = 2
        Top = 2
        Width = 617
        Height = 353
        DataSource = datm_liberacao.ds_solic
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            Alignment = taCenter
            FieldName = 'NR_SOLIC_CH'
            Title.Alignment = taCenter
            Title.Color = clBlack
          end
          item
            FieldName = 'LookFavorecido'
            Title.Color = clBlack
            Width = 182
          end
          item
            FieldName = 'LookBanco'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 137
          end
          item
            FieldName = 'VL_SOLIC_CH'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 98
          end
          item
            FieldName = 'LookStSolicCheque'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 130
          end
          item
            FieldName = 'Look_Solicitante'
            Title.Caption = 'Solicitante'
            Title.Color = clBlack
          end>
      end
    end
    object ts_liberacao: TTabSheet
      Caption = 'Liberação'
      object pnl_liberacao: TPanel
        Left = 1
        Top = 8
        Width = 619
        Height = 347
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object StaticText3: TStaticText
          Left = 410
          Top = 122
          Width = 201
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'Utilizado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object StaticText2: TStaticText
          Left = 207
          Top = 122
          Width = 199
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'Recebido em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object StaticText1: TStaticText
          Left = 4
          Top = 122
          Width = 199
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'Solicitado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object dbgrd_itens: TDBGrid
          Left = 4
          Top = 5
          Width = 608
          Height = 114
          DataSource = datm_liberacao.ds_itens_solic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Alignment = taCenter
              FieldName = 'NR_LANCAMENTO'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 38
            end
            item
              Alignment = taCenter
              FieldName = 'CalcProcesso'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 74
            end
            item
              FieldName = 'LookCliente'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 169
            end
            item
              FieldName = 'LookItem'
              Title.Alignment = taCenter
              Title.Color = clBlack
            end
            item
              FieldName = 'VL_ITEM'
              Title.Alignment = taCenter
              Title.Color = clBlack
            end
            item
              FieldName = 'LookStatusItemSolicCheque'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 147
            end>
        end
        object DBGrid4: TDBGrid
          Left = 410
          Top = 138
          Width = 201
          Height = 91
          DataSource = datm_liberacao.ds_utilizado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              FieldName = 'DT_SOLIC_CH'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 73
            end
            item
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 89
            end>
        end
        object DBGrid3: TDBGrid
          Left = 207
          Top = 138
          Width = 199
          Height = 91
          DataSource = datm_liberacao.ds_recebimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              FieldName = 'DT_RECEBIMENTO'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 67
            end
            item
              FieldName = 'VL_RECEBIDO'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 95
            end>
        end
        object DBGrid1: TDBGrid
          Left = 4
          Top = 138
          Width = 199
          Height = 91
          DataSource = datm_liberacao.ds_solicitado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              FieldName = 'DT_SOLICITACAO'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 74
            end
            item
              FieldName = 'VL_SOLICITADO'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 89
            end>
        end
        object Panel1: TPanel
          Left = 4
          Top = 230
          Width = 199
          Height = 29
          BevelOuter = bvLowered
          TabOrder = 7
          object DBText1: TDBText
            Left = 92
            Top = 8
            Width = 97
            Height = 17
            Alignment = taRightJustify
            DataField = 'VL_SOLICITADO'
            DataSource = datm_liberacao.ds_totaliza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object StaticText4: TStaticText
            Left = 8
            Top = 8
            Width = 72
            Height = 17
            Caption = 'T.Solicitado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel2: TPanel
          Left = 207
          Top = 230
          Width = 199
          Height = 29
          BevelOuter = bvLowered
          TabOrder = 8
          object DBText2: TDBText
            Left = 81
            Top = 8
            Width = 105
            Height = 17
            Alignment = taRightJustify
            DataField = 'VL_RECEBIDO'
            DataSource = datm_liberacao.ds_totaliza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object StaticText5: TStaticText
            Left = 8
            Top = 8
            Width = 70
            Height = 17
            Alignment = taRightJustify
            Caption = 'T.Recebido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel3: TPanel
          Left = 410
          Top = 230
          Width = 201
          Height = 29
          BevelOuter = bvLowered
          TabOrder = 9
          object DBText3: TDBText
            Left = 88
            Top = 8
            Width = 101
            Height = 17
            Alignment = taRightJustify
            DataField = 'VL_UTILIZADO'
            DataSource = datm_liberacao.ds_totaliza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object StaticText6: TStaticText
            Left = 8
            Top = 8
            Width = 65
            Height = 17
            Alignment = taRightJustify
            Caption = 'T.Utilizado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel5: TPanel
          Left = 4
          Top = 261
          Width = 607
          Height = 82
          BevelOuter = bvLowered
          TabOrder = 10
          object DBText4: TDBText
            Left = 159
            Top = 8
            Width = 105
            Height = 17
            Alignment = taRightJustify
            DataField = 'VL_SALDO_ITEM'
            DataSource = datm_liberacao.ds_totaliza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText5: TDBText
            Left = 159
            Top = 36
            Width = 105
            Height = 17
            Alignment = taRightJustify
            DataField = 'VL_SALDO_PROCESSO'
            DataSource = datm_liberacao.ds_totaliza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText6: TDBText
            Left = 159
            Top = 64
            Width = 105
            Height = 17
            Alignment = taRightJustify
            DataField = 'HM_SOLIC_CH'
            DataSource = datm_liberacao.ds_solic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText7: TDBText
            Left = 450
            Top = 8
            Width = 110
            Height = 17
            Alignment = taRightJustify
            DataField = 'VL_DIFERENCA'
            DataSource = datm_liberacao.ds_totaliza
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText8: TDBText
            Left = 450
            Top = 36
            Width = 110
            Height = 17
            Alignment = taRightJustify
            DataField = 'Look_Solicitante'
            DataSource = datm_liberacao.ds_solic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object StaticText8: TStaticText
            Left = 41
            Top = 64
            Width = 124
            Height = 17
            Caption = 'Cheque Solicitado às'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object StaticText9: TStaticText
            Left = 369
            Top = 64
            Width = 57
            Height = 17
            Caption = 'Liberador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object StaticText7: TStaticText
            Left = 41
            Top = 36
            Width = 110
            Height = 17
            Caption = 'Saldo do Processo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object StaticText10: TStaticText
            Left = 41
            Top = 8
            Width = 82
            Height = 17
            Caption = 'Saldo do Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object stext_liberador: TStaticText
            Left = 469
            Top = 64
            Width = 91
            Height = 17
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'stext_liberador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object StaticText11: TStaticText
            Left = 369
            Top = 8
            Width = 59
            Height = 17
            Caption = 'Diferença'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
          object StaticText12: TStaticText
            Left = 369
            Top = 36
            Width = 64
            Height = 17
            Caption = 'Solicitante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_sair: TSpeedButton
      Left = 223
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
      Visible = False
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
      Visible = False
      OnClick = btn_nao_liberarClick
    end
    object lbl_dt_inicio: TLabel
      Left = 315
      Top = 6
      Width = 34
      Height = 13
      Caption = 'Início'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_dt_termino: TLabel
      Left = 409
      Top = 6
      Width = 46
      Height = 13
      Caption = 'Término'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_pesq_solic: TSpeedButton
      Left = 514
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Pesquisar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BB0BBBBBBBBBBBBBBF8FBBBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB
        000BBBBBBBBBBBBF888BBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB00
        0BBBBBBBBFFFBF888BBBBBB80008BB80BBBBBBBF8883F888BBBBBB08888800BB
        BBBBBB887778888BBBBBB08FFFFF80BBBBBBB8F7777778FBBBBB88FFFFFFF88B
        BBBBB8777777783FBBBB08FFFFFFF80BBBBB8F777777778FBBBB08FFFFFFF80B
        BBBB8F777777778FBBBB08FFFFFFF80BBBBB83F77777778BBBBB88FFFFFFF88B
        BBBBB8F7777778FBBBBBB08FFFFF80BBBBBBB83FF777F8BBBBBBBB0888880BBB
        BBBBBB883FF88BBBBBBBBBB80008BBBBBBBBBBBB888BBBBBBBBB}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_pesq_solicClick
    end
    object dbnvg: TDBNavigator
      Left = 101
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_liberacao.ds_solic
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object msk_dt_termino: TMaskEdit
      Left = 409
      Top = 20
      Width = 82
      Height = 21
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      Visible = False
      OnEnter = msk_dt_terminoEnter
      OnExit = msk_dt_terminoExit
    end
    object msk_dt_inicio: TMaskEdit
      Left = 315
      Top = 20
      Width = 82
      Height = 21
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      Visible = False
      OnExit = msk_dt_inicioExit
    end
  end
  object menu_cadastro: TMainMenu
    Left = 321
    Top = 356
    object mi_liberar: TMenuItem
      Caption = '&Liberar'
      Visible = False
      OnClick = btn_liberarClick
    end
    object mi_nao_liberar: TMenuItem
      Caption = '&Não Liberar'
      Visible = False
      OnClick = btn_nao_liberarClick
    end
    object mi_pesq_liberacao: TMenuItem
      Caption = '&Pesquisar'
      Visible = False
      OnClick = btn_pesq_solicClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end

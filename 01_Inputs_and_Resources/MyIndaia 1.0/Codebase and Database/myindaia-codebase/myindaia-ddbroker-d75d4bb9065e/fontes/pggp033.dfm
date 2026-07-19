object frm_acordo_normas: Tfrm_acordo_normas
  Left = 137
  Top = 68
  AutoScroll = False
  Caption = 'Consulta Normas'
  ClientHeight = 454
  ClientWidth = 632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 243
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_fechar: TSpeedButton
      Left = 156
      Top = 13
      Width = 25
      Height = 25
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
      OnClick = btn_fecharClick
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 13
      Width = 100
      Height = 25
      DataSource = datm_acordo_normas.ds_acordo_normas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
  end
  object pnl_cadastro2: TPanel
    Left = 249
    Top = 0
    Width = 460
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
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
      Left = 191
      Top = 8
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
    object cb_ordem: TComboBox
      Left = 191
      Top = 23
      Width = 181
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Items.Strings = (
        'Processo'
        'Cliente'
        'Serviço'
        'Nº registro da DI'
        'Embarcação'
        'Conhecimento'
        'Master'
        'Nº DTA')
      TabOrder = 0
      OnClick = cb_ordemClick
    end
    object edt_chave: TEdit
      Left = 8
      Top = 23
      Width = 176
      Height = 21
      TabOrder = 1
      OnExit = edt_chaveExit
    end
  end
  object pgctrl_processo: TPageControl
    Left = 1
    Top = 56
    Width = 760
    Height = 396
    ActivePage = ts_lista
    TabOrder = 2
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbg_cadastro: TDBGrid
        Left = 5
        Top = 5
        Width = 612
        Height = 357
        DataSource = datm_acordo_normas.ds_acordo_normas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyDown = dbg_cadastroKeyDown
        Columns = <
          item
            FieldName = 'CD_NORMA'
            Title.Caption = 'Código'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'NM_DESCRICAO'
            Title.Caption = 'Descrição'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 525
          end>
      end
    end
  end
end

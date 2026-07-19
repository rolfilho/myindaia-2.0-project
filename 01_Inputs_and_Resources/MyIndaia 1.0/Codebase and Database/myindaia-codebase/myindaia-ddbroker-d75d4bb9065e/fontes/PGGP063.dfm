object frm_pesq_lote: Tfrm_pesq_lote
  Left = 137
  Top = 68
  AutoScroll = False
  Caption = 'Pesquisa Lote'
  ClientHeight = 453
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
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
    object dbnvg_pesq_lote: TDBNavigator
      Left = 8
      Top = 13
      Width = 100
      Height = 25
      DataSource = datm_pesq_lote.ds_pesq_lote
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
    TabStop = True
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
      TabOrder = 1
      OnClick = cb_ordemClick
      Items.Strings = (
        'Processo'
        'Cliente'
        'Servi'#231'o'
        'N'#186' registro da DI'
        'Embarca'#231#227'o'
        'Conhecimento'
        'Master'
        'N'#186' DTA')
    end
    object edt_chave: TEdit
      Left = 8
      Top = 23
      Width = 176
      Height = 21
      TabOrder = 0
      OnChange = edt_chaveChange
      OnKeyDown = edt_chaveKeyDown
    end
  end
  object pgctrl_pesq_lote: TPageControl
    Left = 2
    Top = 51
    Width = 631
    Height = 401
    ActivePage = ts_lista
    TabOrder = 2
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbg_cadastro: TDBGrid
        Left = -1
        Top = 1
        Width = 623
        Height = 369
        DataSource = datm_pesq_lote.ds_pesq_lote
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
            Expanded = False
            FieldName = 'CD_MERCADORIA'
            Title.Alignment = taCenter
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
            FieldName = 'AP_MERCADORIA'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_REF'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_LOTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_DISPONIVEL'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PL_DISPONIVEL'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 97
            Visible = True
          end>
      end
    end
  end
end

object frm_trans_LI: Tfrm_trans_LI
  Left = 15
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Transmissão de Licença de Importação'
  ClientHeight = 452
  ClientWidth = 635
  Enabled = False
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  PrintScale = poNone
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Ordem: TLabel
      Left = 200
      Top = 10
      Width = 31
      Height = 13
      Caption = 'Ordem'
    end
    object cb_ordem: TComboBox
      Left = 248
      Top = 8
      Width = 353
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Items.Strings = (
        'Processo LI'
        'Cod.Importador + Processo LI'
        'Cod.Importador + Dt. Vencimernto + Processo LI')
      TabOrder = 0
      OnClick = cb_ordemClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 635
    Height = 275
    Align = alClient
    TabOrder = 1
    object DBGGipLiteLI: TByDBGrid
      Left = 9
      Top = 201
      Width = 633
      Height = 64
      DataSource = DSGipLiteLI
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnInsertBookMark = DBGGipLiteLIInsertBookMark
      Columns = <
        item
          FieldName = 'CA3201'
          Title.Caption = 'Processo LI'
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CD3216'
          Title.Caption = 'Dt Processo'
          Width = 70
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CA3298'
          Title.Caption = 'Seq. Micro'
          Width = 60
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CA3247'
          Title.Caption = 'Máquina'
          Width = 53
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CA3204'
          Title.Caption = 'Cód.Importador'
          Width = 82
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CA3237'
          Title.Caption = 'Registro LI'
          Width = 84
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CD3248'
          Title.Caption = 'Dt Registro'
          Width = 73
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CA3245'
          Title.Caption = 'Transmissão'
          Width = 72
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CD3246'
          Title.Caption = 'Dt Transmissão'
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end
        item
          FieldName = 'CA3244'
          Title.Caption = 'Status'
          Width = 42
          byConsOnLine = <>
          byConsOnLineAtivo = False
          CheckEnabled = False
          byFormName = ''
          byComponentName = ''
          byFilter = ''
          byFiltered = False
          byShowModal = False
          byKey = 'VK_F5'
        end>
    end
    object dbgrd_li: TDBGrid
      Left = 8
      Top = 8
      Width = 617
      Height = 137
      DataSource = datm_trans_LI.ds_li_lista
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 316
    Width = 635
    Height = 136
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 25
      Width = 46
      Height = 13
      Caption = 'Pesquisa '
    end
    object edt_chave: TEdit
      Left = 88
      Top = 21
      Width = 209
      Height = 21
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object bbOk: TBitBtn
      Left = 32
      Top = 81
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&OK'
      TabOrder = 1
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbCancel: TBitBtn
      Left = 224
      Top = 81
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      Enabled = False
      TabOrder = 2
      OnClick = bbCancelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object gbox_monitor: TGroupBox
      Left = 328
      Top = 9
      Width = 273
      Height = 113
      Caption = '[ Monitor ]'
      TabOrder = 3
      object lbl_Capas: TLabel
        Left = 8
        Top = 16
        Width = 52
        Height = 13
        Caption = 'Processos '
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Adições     '
      end
      object Label3: TLabel
        Left = 8
        Top = 64
        Width = 59
        Height = 13
        Caption = 'Itens            '
      end
      object Label4: TLabel
        Left = 8
        Top = 88
        Width = 55
        Height = 13
        Caption = 'Mensagem '
      end
      object lbl_processos: TLabel
        Left = 72
        Top = 16
        Width = 57
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl_adicoes: TLabel
        Left = 72
        Top = 40
        Width = 57
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl_itens: TLabel
        Left = 72
        Top = 64
        Width = 57
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl_mensagem: TLabel
        Left = 72
        Top = 88
        Width = 193
        Height = 13
        AutoSize = False
        Caption = 'Aguardando instrução ...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object bbfechar: TBitBtn
      Left = 128
      Top = 81
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 4
      OnClick = bbfecharClick
      Kind = bkClose
    end
  end
  object DSGipLiteLI: TDataSource
    AutoEdit = False
    Left = 16
    Top = 9
  end
end

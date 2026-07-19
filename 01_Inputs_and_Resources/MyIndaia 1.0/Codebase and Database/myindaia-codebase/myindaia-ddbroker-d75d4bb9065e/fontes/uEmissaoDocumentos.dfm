object frmEmissaoDocumentos: TfrmEmissaoDocumentos
  Left = 276
  Top = 200
  Width = 853
  Height = 367
  Caption = 'Preenchimento autom'#225'tico de cartas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 389
    Top = 101
    Width = 142
    Height = 13
    Caption = 'Documentos Dispon'#237'veis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_cd_unid_neg: TLabel
    Left = 9
    Top = 52
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_unid_neg: TSpeedButton
    Left = 351
    Top = 64
    Width = 23
    Height = 23
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
  object nbTipoTabela: TNotebook
    Left = 10
    Top = 87
    Width = 364
    Height = 233
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Processo'
      object lbl_cd_produto: TLabel
        Left = 4
        Top = 1
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_produto: TSpeedButton
        Left = 343
        Top = 14
        Width = 23
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
        OnClick = btn_co_produtoClick
      end
      object btn_co_processo: TSpeedButton
        Left = 138
        Top = 60
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
        OnClick = btn_co_processoClick
      end
      object lbl_nr_processo: TLabel
        Left = 4
        Top = 45
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblStatus: TLabel
        Left = 6
        Top = 213
        Width = 33
        Height = 13
        Caption = 'Status:'
      end
      object msk_cd_produto: TEdit
        Tag = 666
        Left = 4
        Top = 14
        Width = 37
        Height = 21
        MaxLength = 2
        TabOrder = 0
        OnChange = btn_co_produtoClick
        OnExit = msk_cd_produtoExit
      end
      object edt_nm_produto: TEdit
        Left = 41
        Top = 14
        Width = 300
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 1
      end
      object chkProcessos: TCheckBox
        Left = 64
        Top = 45
        Width = 114
        Height = 15
        Caption = #218'ltimos Processos'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object msk_nr_processo: TEdit
        Tag = 666
        Left = 4
        Top = 61
        Width = 128
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 2
        OnKeyDown = msk_nr_processoKeyDown
      end
      object dbgProcesso: TDBGrid
        Left = 5
        Top = 88
        Width = 161
        Height = 120
        DataSource = dsProcessosSelecionados
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_PROCESSO'
            Title.Caption = 'Nr. Processo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 119
            Visible = True
          end>
      end
      object btnRemove: TBitBtn
        Left = 175
        Top = 91
        Width = 23
        Height = 22
        TabOrder = 4
        OnClick = btnRemoveClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666822222222
          22F66666687777777777F666000066682222222222F66666687777777777F666
          0000666888888888886666666888888888886666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
      end
      object btnAdd: TBitBtn
        Left = 175
        Top = 62
        Width = 23
        Height = 22
        TabOrder = 3
        OnClick = btnAddClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666FFF666666666
          666666FFF666666600006666666822F66666666666666877F666666600006666
          666822F66666666666666877F666666600006666666822F66666666666666877
          F666666600006666FFF622FFFFF6666666FFF777FFFFF6660000666822222222
          22F66666687777777777F666000066682222222222F66666687777777777F666
          000066688888226888666666688888777888666600006666666822F666666666
          66666877F666666600006666666822F66666666666666877F666666600006666
          666822F66666666666666877F666666600006666666888666666666666666888
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
      end
    end
    object TPage
      Left = 0
      Top = 0
      HelpContext = 1
      Caption = 'Proposta'
      object Label1: TLabel
        Left = 4
        Top = 5
        Width = 51
        Height = 13
        Caption = 'Proposta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCoProposta: TSpeedButton
        Left = 130
        Top = 18
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
        OnClick = btnCoPropostaClick
      end
      object edtProposta: TEdit
        Tag = 666
        Left = 4
        Top = 19
        Width = 125
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 837
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 5
    DesignSize = (
      837
      49)
    object btn_sair: TSpeedButton
      Left = 800
      Top = 5
      Width = 38
      Height = 39
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
    object btnVisualizar: TSpeedButton
      Left = 4
      Top = 5
      Width = 39
      Height = 39
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
      OnClick = btnVisualizarClick
    end
    object btnEmail: TSpeedButton
      Left = 44
      Top = 5
      Width = 39
      Height = 39
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
        77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0FFFFF
        FFF07F333F7F3FFFF3370FFF700F0000FFF07F3F777F777733370F707F0FFFFF
        FFF07F77337F3FFFFFF7007EEE0F000000F077FFFF7F777777370777770FFFFF
        FFF07777777F3FFFFFF7307EEE0F000000F03773FF7F7777773733707F0FFFFF
        FFF03337737F3FFF33373333700F000FFFF03333377F77733FF73333330FFFFF
        00003333337F3FF377773333330F00FF0F033333337F77337F733333330FFFFF
        00333333337FFFFF773333333300000003333333337777777333}
      NumGlyphs = 2
      OnClick = btnEmailClick
    end
  end
  object fllstDocumentos: TFileListBox
    Left = 389
    Top = 117
    Width = 436
    Height = 204
    ItemHeight = 13
    Mask = '*.doc'
    TabOrder = 4
  end
  object edt_nm_unid_neg: TEdit
    Left = 50
    Top = 65
    Width = 300
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 1
  end
  object msk_cd_unid_neg: TEdit
    Tag = 666
    Left = 13
    Top = 65
    Width = 37
    Height = 21
    MaxLength = 2
    TabOrder = 0
    OnChange = btn_co_unid_negClick
    OnExit = msk_cd_unid_negExit
  end
  object pnlPesquisaDocumento: TPanel
    Left = 386
    Top = 58
    Width = 439
    Height = 41
    BevelOuter = bvNone
    TabOrder = 3
    object lblPesquisa: TLabel
      Left = 4
      Top = 2
      Width = 124
      Height = 13
      Caption = 'Pesquisar Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPesquisarDocumento: TEdit
      Left = 4
      Top = 16
      Width = 181
      Height = 21
      TabOrder = 0
      OnKeyPress = edtPesquisarDocumentoKeyPress
    end
    object btnPesquisar: TBitBtn
      Left = 192
      Top = 14
      Width = 30
      Height = 23
      TabOrder = 1
      OnClick = btnPesquisarClick
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
    end
  end
  object cdsProcessosSelecionados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    Top = 164
    object cdsProcessosSelecionadosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
  end
  object dsProcessosSelecionados: TDataSource
    DataSet = cdsProcessosSelecionados
    Left = 354
    Top = 213
  end
end

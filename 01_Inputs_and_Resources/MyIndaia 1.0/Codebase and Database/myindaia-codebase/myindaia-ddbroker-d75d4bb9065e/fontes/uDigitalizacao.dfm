object frmDigitalizacao: TfrmDigitalizacao
  Left = 343
  Top = 221
  Width = 750
  Height = 519
  Caption = 'Arquivos vinculados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 153
    Width = 742
    Height = 339
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 3
    object cxgArquivos: TcxGrid
      Left = 1
      Top = 1
      Width = 740
      Height = 317
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      object cxgdbtvArquivos: TcxGridDBTableView
        DataController.DataSource = datmDigitalizacao.ds_ListaArquivos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        Filtering.Visible = fvNever
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.CellEndEllipsis = True
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.GroupRowHeight = 25
        OptionsView.Indicator = True
        Styles.ContentEven = cxstlLinhasPares
        Styles.ContentOdd = cxstlLinhasImpares
        Styles.Group = cxstlGrupo
        object cxgdbtvArquivosNM_TIPO_DOCTO: TcxGridDBColumn
          Tag = 120613236
          Caption = 'Tipo de Documento'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'CD_TIPO_DOCTO'
          Properties.ListColumns = <
            item
              FieldName = 'NM_TIPO_DOCTO'
            end>
          Properties.ListSource = datmDigitalizacao.ds_TipoArquivo
          Properties.MaxLength = 0
          Visible = False
          GroupIndex = 0
          SortOrder = soAscending
          DataBinding.FieldName = 'CD_TIPO_DOCTO'
        end
        object cxgdbtvArquivosIN_ENVIA_WEB: TcxGridDBColumn
          Tag = 120981092
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.MaxLength = 1
          Properties.ReadOnly = True
          Visible = False
          DataBinding.FieldName = 'IN_ENVIA_WEB'
        end
        object cxgdbtvArquivosOpcoes: TcxGridDBColumn
          Tag = 120982220
          Caption = 'Op'#231#245'es'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000C0C0C0FFFFFF
                FFFFFFFFFFFFFFFFFFA0756E7443427443427443427443427443427443427443
                42744342744342FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EFFF8E5F7
                EDD9F7EBD5F4E9D1F4E9D0F4E7CFF6EAD0EEDDC4754443FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFA0756EF7EDDCF2D9BFF2D7BBF0D5BAEFD4B5EED3B2EED9
                BFE5D0BA754443FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EFAEFDEFC
                C591FCC591FCC591FCC591FCC591FCC591E3D1BC754443FFFFFFFFFFFFA0756E
                744342744342744342A0756EFCF4E7F6D9BAF7D7B6F6D4B5F6D4B2F4D1ADF0DC
                C2E6D3C081524CFFFFFFFFFFFFA0756EFFF8E5F7EDD9F7EBD5A0756EFEF6EBF8
                DABCF8D9B8F8D8B7F7D5B6F7D4B2F3DEC7E7D7C581524DFFFFFFFFFFFFA0756E
                F7EDDCF2D9BFF2D7BBA0756EFEFAF2FCC591FCC591FCC591FCC591FCC591FCC5
                91EBDDCF8F5F5AFFFFFFFFFFFFA0756EFAEFDEFCC591FCC591A0756EFFFCFAFC
                E3CCFBE0C7FADEC6F8DEC4FCE2C6FCF0DEE1D7CE8F5E59FFFFFFFFFFFFA0756E
                FCF4E7F6D9BAF7D7B6A0756EFFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1
                AFA793959E675AFFFFFFFFFFFFA0756EFEF6EBF8DABCF8D9B8A0756EFFFFFFFF
                FFFFFFFEFEFFFCF8FFFEFAA0756EA0756EA0756EA0756EFFFFFFFFFFFFA0756E
                FEFAF2FCC591FCC591A0756EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A1
                54B6735DFFFFFFFFFFFFFFFFFFA0756EFFFCFAFCE3CCFBE0C7A0756EA0756EA0
                756EA0756EA0756EA0756EA0756EAA6D68FFFFFFFFFFFFFFFFFFFFFFFFA0756E
                FFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1AFA793959E675AFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFA0756EFFFFFFFFFFFFFFFEFEFFFCF8FFFEFAA0
                756EA0756EA0756EA0756EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756E
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A154B6735DFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFA0756EA0756EA0756EA0756EA0756EA0756EA0
                756EAA6D68FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              Kind = bkGlyph
              LeftAlignment = True
            end
            item
              Default = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B00000001000000000000E78C3100B56B
                4A00E79C52008C635A0094635A00A5635A00A56B5A00BD7B5A00FFB55A004A52
                630094636300A5636B00A5736B00AD7B6B00BD846B00C6846B00D6946B00AD7B
                7300B58C7300DE9C7300AD847B00B58C7B00E7AD7B00EFBD7B00EFC67B005A63
                8400636B84006B6B8400B58C8400CEA58400EFBD8400EFC68400F7C68400AD8C
                8C00EFC68C00F7CE8C00BD949400B5AD9400EFC69400EFCE9400F7CE9400CEA5
                9C00D6B59C00EFCE9C00DEBDA500EFCEA500F7D6A500427BAD00EFD6AD00F7D6
                AD00DEC6B500DECEB500EFD6B500F7D6B500F7DEB500D6BDBD00DEC6BD00F7DE
                BD00186BC600DEC6C600DECEC600F7E7C600FFEFC600F7E7CE001073D600FFFF
                D600F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7E700F7F7EF00FFF7EF00FFFF
                EF00FFF7F700FFFFF700FF00FF0031A5FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00374E0B0B0B0B
                0B0B0B0B0B0B0B0B0B4E4E4E093E35302B27221E171E1E1F0B4E4E1A3A1A3930
                2D2B26221E17171F0B4E4E4E4D401B39342D2B26221E171F0B4E4E4E054D4019
                39302D2B26221E1F0B4E4E4E0C484D2F0311040D1D26221F0B4E4E4E0C4E4421
                1C2C342A121D26220B4E4E4E0E4E4814323F3D4B2A0D2B270B4E4E4E0E4E4E0A
                42423F4934042D2E0B4E4E4E104E4E1C3B4442412C11312D0B4E4E4E104E4E37
                243B42321C1533250B4E4E4E134E4E4E371C0A14290606060B4E4E4E134E4E4E
                4E4E4B4B37060200014E4E4E164E4E4E4E4E4E4E3B0608074E4E4E4E16474747
                4747474737060E4E4E4E4E4E161010101010101010064E4E4E4E}
              Kind = bkGlyph
              LeftAlignment = True
            end
            item
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000230B0000230B00000001000000000000FFB56300AD73
                8400B5848400BD848C00D69C9400CEADA500FFD6A500FFD6AD00DEC6BD00EFD6
                BD00F7E7D600FFF7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00080D0D0D0D0D
                0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                0D0D0D0D0D0D0D0D0D0D0D0102020202020202020202020202020D010B0B0B0B
                0B0B0B0B0B0B0B0B0B020D010B0D0A0A0A0A0A0A0A0A0D0D0D020D010B0D0606
                0606060606060D0D0D020D030B0D0A0A0A0A0A0A0A0A0D0D0D020D030B0D0606
                0606060606060D0D0D020D030B0D0D0D0D0D0D0D0D0D00000A020D040B0D0D0D
                0D0D0D0D0D0D06000A020D040B0D0D0D0D0D0D0D0D0D0A0A0A020D0409090909
                090909090909080805050D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D}
              Kind = bkGlyph
              LeftAlignment = True
            end
            item
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000520B0000520B000000010000000000002D2D2D001855
                6F004544420058534E005160610054777B007C707800B56D3E00C1713500C076
                38008A5B5200947E7500AD7B7300BD847B00EFA65A00EDA75F00F0A85C00C694
                7B0000009A000316AC0041749600477AA9000018C6001029D600106BFF00FF00
                FF0035A8F5004A9EED006D8AFD00B5848400BD9494009891A200C6A59C00F1BC
                8600C6ADA500C6ADAD00CEB5AD00D6B5AD00C6B5B500D6BDB500DEBDB500F8C2
                8C00F9C48D00EFCE9400EFCE9C00F7D69C00DEC6B500D6C6BD00EFD6AD00F7D6
                A500FBD3A900E7C6B500EFCEB500EFCEBD00F7DEB500F7DEBD00C6C6C600E7CE
                CE00E7D6CE00F7E7C600FFEFD600FFEFE700FFF7E700FFF7EF00FFF7F700FFFF
                F700FFFFFF000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000000000000000000000000000000000000040421D1D1D1D
                1D1D1D1D1D1D1D1D1D424242203C3B373630312C2B2B2B2D1D424242203C3838
                383838383838382C1D424242223D00032F37302C2C2C2B2C1D424242223E0302
                042F36302C2C2C2B1D4242422441380515010A263838382C1D42424225423F05
                140B080A2F3030301D4242422742403F062110090A2F30301D42424227423838
                0C322A0E090A262F1E42424228424242400C322A10080A2F234242422E424242
                42400C32290F070A26424242334238383838380C321F1A131242424233424242
                424242410C1B17171312424235424242424242423A161C181742424233403F3F
                3F3F3F3F39111616424242423334343434333334270D42424242}
              Kind = bkGlyph
              LeftAlignment = True
            end
            item
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000C0C0C0FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B77DF1B77DF1B77DF1B7
                7DF1B77DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFF1B77DFFEBC9FED8B6F7C799F2B97FF1B77CF2BA81FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B77DFFF8D8FEE9C7FDD6B3F7C699F2B9
                80F1B77DF1B77CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1
                B77DFFFCD8FEE9C7FDD7B4F7C79AF2B980F1B77CF1B77DFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D6A6FFFFDEFFEDCBFEDBB9F8C99DF2B9
                82F1B77CF1B77DF1B77DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B77DFE
                F5D4FFFBDAFBDDB5F8CA9EF5C290F2B87FF1B67BF1B77DF1B77DFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF1BA81EDBD82E0974BE39950EAAA67EFBC80F2C6
                90F3C48CF1BA80F1B77CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0954BC7
                5C00D57A24E69B53EEB87BF4D09CF9E3B7F7E0B3F2C992EFB67AFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFE39B54D07018D77F2CE79E59006600006600FDF2
                CCFCECC5F4CB97EFB77CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFE69C5600660033AF5053E081006600F1B77DFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFA97C78B0837AFFFFFFFFFFFF006600168B233DBE5F3AC95B199D
                29006600FFFFFFFFFFFFBF9992B38984D4B19BD1AD96B08378C6915FA77775FF
                FFFF0066000066001F8B2A19A32B006600006600FFFFFFFFFFFFB58F8EE6C395
                B3764CB08581D0A992BE8F73A77874FFFFFFFFFFFFFFFFFF077D0E006600FFFF
                FFFFFFFFFFFFFFFFFFFFA37474A67670C07928DCB590B5887DB5846BFFFFFFFF
                FFFFFFFFFFFFFFFF077D0E006600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                B27954B58A7FD2BBBDAC8281FFFFFFFFFFFF006600006600006600FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA57774A97F80AC8282FFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              Kind = bkGlyph
              LeftAlignment = True
            end>
          Properties.MaxLength = 0
          Properties.OnButtonClick = cxGrid1DBTableView1DBColumn1PropertiesButtonClick
          MinWidth = 92
          Options.Filtering = False
          Options.IncSearch = False
          Options.ShowEditButtons = isebAlways
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 92
        end
        object cxgdbtvArquivosNM_ARQUIVO: TcxGridDBColumn
          Tag = 120985768
          Caption = 'Arquivo'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.MaxLength = 0
          Properties.OnButtonClick = cxGrid1DBTableView1NM_ARQUIVOPropertiesButtonClick
          Options.ShowEditButtons = isebAlways
          Width = 126
          DataBinding.FieldName = 'NM_ARQUIVO'
        end
        object cxgdbtvArquivosArquivos: TcxGridDBColumn
          Tag = 120341288
          Caption = 'Arquivos'
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 71
          DataBinding.FieldName = 'ARQUIVOS'
        end
        object cxgdbtvArquivosNM_DESCRICAO: TcxGridDBColumn
          Tag = 120342160
          Caption = 'Descri'#231#227'o'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Width = 437
          DataBinding.FieldName = 'NM_DESCRICAO'
        end
        object cxgdbtvArquivosNM_CRIADOR: TcxGridDBColumn
          Tag = 120343032
          Caption = 'Criador do Registro'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 209
          DataBinding.FieldName = 'NM_CRIADOR'
        end
        object cxgdbtvArquivosDT_CRIACAO: TcxGridDBColumn
          Tag = 120343944
          Caption = 'Data de Cria'#231#227'o'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Width = 144
          DataBinding.FieldName = 'DT_CRIACAO'
        end
        object cxgdbtvArquivosNM_ALTERADOR: TcxGridDBColumn
          Tag = 120344852
          Caption = #218'ltimo Aterador'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Width = 213
          DataBinding.FieldName = 'NM_ALTERADOR'
        end
        object cxgdbtvArquivosDT_ALT: TcxGridDBColumn
          Tag = 121251808
          Caption = 'Data da '#250'ltima altera'#231#227'o'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.ReadOnly = True
          Width = 165
          DataBinding.FieldName = 'DT_ALT'
        end
      end
      object cxglArquivos: TcxGridLevel
        GridView = cxgdbtvArquivos
      end
    end
    object tbsTabelasVinculadas: TTabSet
      Left = 1
      Top = 318
      Width = 740
      Height = 20
      Align = alBottom
      DitherBackground = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      SoftTop = True
      OnChange = tbsTabelasVinculadasChange
    end
  end
  object pnlFerramentas: TPanel
    Left = 0
    Top = 112
    Width = 742
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      41)
    object btn_salvar: TSpeedButton
      Left = 42
      Top = 4
      Width = 33
      Height = 33
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
      Left = 79
      Top = 4
      Width = 33
      Height = 33
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
    object btn_novo: TSpeedButton
      Left = 5
      Top = 4
      Width = 33
      Height = 33
      Hint = 'Novo Documento'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_novoClick
    end
    object btn_sair: TSpeedButton
      Left = 704
      Top = 4
      Width = 33
      Height = 33
      Hint = 'Sa'#237'da'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object pnlDados: TPanel
      Left = 124
      Top = 5
      Width = 568
      Height = 31
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 55
        Top = 8
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NM_EMPRESA'
        DataSource = datmDigitalizacao.ds_Processo
      end
    end
  end
  object pnlMotivo: TPanel
    Left = 302
    Top = 192
    Width = 361
    Height = 185
    TabOrder = 1
    Visible = False
    OnExit = lblMotivoCloseClick
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 35
      Height = 13
      Caption = 'Motivo:'
    end
    object pnlMotivoCaption: TPanel
      Left = 1
      Top = 1
      Width = 359
      Height = 20
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 118
        Height = 18
        Align = alLeft
        Caption = ' Motivo de altera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object lblMotivoClose: TLabel
        Left = 345
        Top = 1
        Width = 13
        Height = 18
        Cursor = crHandPoint
        Align = alRight
        Caption = 'X '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        OnClick = lblMotivoCloseClick
      end
    end
    object memMotivo: TMemo
      Left = 8
      Top = 48
      Width = 345
      Height = 89
      MaxLength = 255
      TabOrder = 1
    end
    object btnMotivoOk: TButton
      Left = 40
      Top = 144
      Width = 97
      Height = 25
      Caption = 'Ok'
      TabOrder = 2
      OnClick = btnMotivoOkClick
    end
    object btnMotivoCancelar: TButton
      Left = 216
      Top = 144
      Width = 97
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = lblMotivoCloseClick
    end
  end
  object pnlOpcaoChave: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 112
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      742
      112)
    object pnlChaveProcesso: TPanel
      Left = 85
      Top = 3
      Width = 653
      Height = 61
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object lbl_cd_unid_neg: TLabel
        Left = 8
        Top = 4
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade'
        FocusControl = msk_cd_unid_neg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_unid_neg: TSpeedButton
        Left = 138
        Top = 19
        Width = 23
        Height = 21
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
      object lbl_cd_produto: TLabel
        Left = 168
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Produto'
        FocusControl = msk_cd_produto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_produto: TSpeedButton
        Left = 298
        Top = 19
        Width = 23
        Height = 21
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
      object lbl_nr_processo: TLabel
        Left = 331
        Top = 5
        Width = 53
        Height = 13
        Caption = 'Processo'
        FocusControl = msk_nr_processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_co_processo: TSpeedButton
        Left = 422
        Top = 18
        Width = 23
        Height = 21
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
      object Label6: TLabel
        Left = 455
        Top = 5
        Width = 135
        Height = 13
        Caption = 'Instru'#231#227'o Desembara'#231'o'
        FocusControl = msk_instrucao_desemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object SpeedButton1: TSpeedButton
        Left = 584
        Top = 18
        Width = 23
        Height = 21
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
        OnClick = SpeedButton1Click
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 8
        Top = 19
        Width = 28
        Height = 21
        AutoSize = False
        Ctl3D = False
        EditMask = '!99;0; '
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 0
        Text = '01'
        OnChange = btn_co_unid_negClick
        OnEnter = msk_cd_unid_negEnter
        OnExit = msk_cd_unid_negExit
      end
      object edt_nm_unid_neg: TEdit
        Left = 37
        Top = 19
        Width = 100
        Height = 21
        TabStop = False
        AutoSize = False
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object msk_cd_produto: TMaskEdit
        Left = 168
        Top = 19
        Width = 28
        Height = 21
        AutoSize = False
        Ctl3D = False
        EditMask = '!99;0; '
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 2
        Text = '01'
        OnChange = btn_co_produtoClick
        OnEnter = msk_cd_produtoEnter
        OnExit = msk_cd_produtoExit
      end
      object edt_nm_produto: TEdit
        Left = 197
        Top = 19
        Width = 100
        Height = 21
        TabStop = False
        AutoSize = False
        Ctl3D = False
        ParentColor = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object msk_nr_processo: TMaskEdit
        Left = 330
        Top = 18
        Width = 91
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnChange = msk_nr_processoChange
        OnEnter = msk_nr_processoEnter
        OnExit = msk_nr_processoExit
        OnKeyPress = msk_nr_processoKeyPress
      end
      object chkProcessos: TCheckBox
        Left = 330
        Top = 39
        Width = 108
        Height = 17
        Caption = #218'ltimos Processos'
        Checked = True
        Ctl3D = True
        ParentCtl3D = False
        State = cbChecked
        TabOrder = 5
      end
      object msk_instrucao_desemb: TMaskEdit
        Left = 454
        Top = 18
        Width = 129
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnChange = msk_instrucao_desembChange
        OnEnter = msk_instrucao_desembEnter
        OnExit = msk_instrucao_desembExit
        OnKeyPress = msk_nr_processoKeyPress
      end
    end
    object rdbChaveProcesso: TRadioButton
      Left = 8
      Top = 24
      Width = 74
      Height = 17
      Caption = '&Processo'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = rdbChaveProcessoClick
    end
    object rdbOutrasChaves: TRadioButton
      Left = 8
      Top = 78
      Width = 59
      Height = 17
      Caption = '&Outros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = rdbChaveProcessoClick
    end
    object pnlOutrasChaves: TPanel
      Left = 85
      Top = 65
      Width = 653
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 3
      object Label4: TLabel
        Left = 8
        Top = 5
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tabela'
        FocusControl = cboTabelas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 192
        Top = 5
        Width = 108
        Height = 13
        Alignment = taRightJustify
        Caption = 'Chave de Consulta'
        FocusControl = cboChaveConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object cboChaveConsulta: TcxLookupComboBox
        Left = 192
        Top = 18
        Width = 460
        Height = 21
        Properties.KeyFieldNames = 'Codigo'
        Properties.ListColumns = <
          item
            FieldName = 'Descricao'
          end>
        Properties.ListSource = datmDigitalizacao.ds_ChaveConsulta
        Properties.OnChange = edtChaveConsultaPropertiesChange
        Style.BorderStyle = ebsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 2
        OnEnter = cboChaveConsultaEnter
        OnExit = edtChaveConsultaExit
      end
      object cboTabelas: TcxLookupComboBox
        Left = 8
        Top = 18
        Width = 169
        Height = 21
        Properties.KeyFieldNames = 'ID_TABELA'
        Properties.ListColumns = <
          item
            FieldName = 'NM_EXIBICAO'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = datmDigitalizacao.ds_Tabelas
        Properties.OnChange = cboTabelasPropertiesChange
        Style.BorderStyle = ebsSingle
        Style.ButtonStyle = btsFlat
        TabOrder = 0
      end
      object edtChaveConsulta: TcxTextEdit
        Left = 192
        Top = 18
        Width = 460
        Height = 21
        Properties.OnChange = edtChaveConsultaPropertiesChange
        TabOrder = 1
        OnExit = edtChaveConsultaExit
      end
    end
  end
  object pnlReplicarArquivo: TPanel
    Left = 24
    Top = 238
    Width = 385
    Height = 201
    TabOrder = 4
    Visible = False
    OnExit = lblReplicarArquivoCloseClick
    object Label8: TLabel
      Left = 7
      Top = 25
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade'
      FocusControl = msk_cd_unid_neg_rep
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_unid_neg_rep: TSpeedButton
      Left = 137
      Top = 40
      Width = 23
      Height = 21
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
      OnClick = btn_co_unid_neg_repClick
    end
    object Label9: TLabel
      Left = 7
      Top = 65
      Width = 45
      Height = 13
      Caption = 'Produto'
      FocusControl = msk_cd_produto_rep
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_produto_rep: TSpeedButton
      Left = 137
      Top = 80
      Width = 23
      Height = 21
      Enabled = False
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
      OnClick = btn_co_produto_repClick
    end
    object Label10: TLabel
      Left = 7
      Top = 109
      Width = 53
      Height = 13
      Caption = 'Processo'
      FocusControl = msk_nr_processo_rep
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_processo_rep: TSpeedButton
      Left = 99
      Top = 122
      Width = 23
      Height = 21
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
      OnClick = btn_co_processo_repClick
    end
    object btnRemoveProcesso: TSpeedButton
      Left = 142
      Top = 120
      Width = 23
      Height = 22
      Hint = 'Remover processo da lista'
      Caption = 't'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Wingdings 3'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnRemoveProcessoClick
    end
    object btnAdicionaProcesso: TSpeedButton
      Left = 165
      Top = 120
      Width = 23
      Height = 22
      Hint = 'Adicionar processo a lista'
      Caption = 'u'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Wingdings 3'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAdicionaProcessoClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 383
      Height = 20
      Align = alTop
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 0
      object Label7: TLabel
        Left = 1
        Top = 1
        Width = 98
        Height = 18
        Align = alLeft
        Caption = ' Replicar arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object lblReplicarArquivoClose: TLabel
        Left = 369
        Top = 1
        Width = 13
        Height = 18
        Cursor = crHandPoint
        Align = alRight
        Caption = 'X '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        OnClick = lblReplicarArquivoCloseClick
      end
    end
    object lbProcessosReplicar: TListBox
      Left = 200
      Top = 21
      Width = 184
      Height = 179
      Style = lbOwnerDrawVariable
      Align = alRight
      ItemHeight = 16
      TabOrder = 1
      OnDrawItem = lbProcessosReplicarDrawItem
    end
    object msk_cd_unid_neg_rep: TMaskEdit
      Left = 7
      Top = 40
      Width = 28
      Height = 21
      AutoSize = False
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 2
      Text = '01'
      OnChange = btn_co_unid_neg_repClick
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_neg_repExit
    end
    object edt_nm_unid_neg_rep: TEdit
      Left = 36
      Top = 40
      Width = 100
      Height = 21
      TabStop = False
      AutoSize = False
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_produto_rep: TMaskEdit
      Left = 7
      Top = 80
      Width = 28
      Height = 21
      AutoSize = False
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
      Text = '01'
      OnChange = btn_co_produto_repClick
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produto_repExit
    end
    object edt_nm_produto_rep: TEdit
      Left = 36
      Top = 80
      Width = 100
      Height = 21
      TabStop = False
      AutoSize = False
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object msk_nr_processo_rep: TMaskEdit
      Left = 7
      Top = 122
      Width = 91
      Height = 21
      AutoSize = False
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object btnReplicar: TBitBtn
      Left = 8
      Top = 162
      Width = 75
      Height = 25
      Caption = 'Realizar'
      TabOrder = 7
      OnClick = btnReplicarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object btnCancelar: TBitBtn
      Left = 112
      Top = 162
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = lblReplicarArquivoCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
  end
  object ImageList1: TImageList
    Left = 376
    Top = 144
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040400FFFFFF00040404000404
      040004040400FFFFFF00B2B2B200B2B2B2009999990086868600868686008686
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      000000000000FFFFFF00ADABAB00B5B3B3009B9999008C8A8A00828080008C8A
      8A00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00666666009696960055555500333333001C1C1C00161616001C1C1C001C1C
      1C00666666005F5F5F0086868600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4710A00D19B5400B65816008B360000881E000082110000731D00007C16
      0A00A26C2B005B5D5E0081928500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000404040004040400FFFFFF008686
      8600777777005555550029292900333333004D4D4D004D4D4D00333333002929
      290022222200666666005F5F5F00FFFFFF000000000000000000FFFFFF00E198
      3600D3841D00B3582500A3300000A43C0100BD580900DB4D1000A8390700A02F
      000083250E00B96C2D006D5D5100FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF009999
      9900777777003333330055555500666666004D4D4D0066666600666666005555
      5500161616002222220066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5A8
      5F00E18C0600B6360000CD610200EB7A0200445E0000F9810400EB7C0000D25C
      00007B1100009B200000A3713700FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000404040004040400FFFF
      FF00999999007777770080808000969696004D4D4D0042424200777777008686
      860039393900333333002222220096969600FFFFFF000000000000000000FFFF
      FF00E4AD4400F5840600FF8E0000FFAA280000621300085F0300CA860F00FF99
      00001C540100B1330000A022000092958C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00868686009999990096969600999999006666660080808000A4A0A0008080
      800033333300393939002222220086868600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D5A71E00FFAD4500F6AD1500CEBA330014811F0044952E00FFB24A008E96
      1A000D4903005A4B0D00981E0000959283000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000040404000404040004040400FFFF
      FF0066666600DDDDDD00A4A0A000A4A0A00000000000DDDDDD00000000006666
      660042424200424242002222220086868600000000000000000000000000FFFF
      FF00F4700000F5E89E006BBE5B0054C65B0081D27500FFEE8700FDD876000D87
      2200125F000017530D008729000099927E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0066666600E3E3E300E3E3E30096969600F1F1F100EAEAEA00CCCCCC009999
      9900666666004D4D4D0022222200A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DA7C1900FFF5A600BAF6B00000BB4E00F9FFD300FFF2C600F6E088009FBA
      420055891700216B00004E280800AFA692000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040400FFFFFF0004040400FFFF
      FF00B2B2B20099999900CCCCCC00FFFFFF00B2B2B200DDDDDD00D7D7D700A4A0
      A000868686006666660042424200FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FDC4670003C73F007DE39200DCFFEA0034CE5F00F0EA9D00FCE08900FEB8
      2F001AA84F0006833B00BF470000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009999990099999900D7D7D70000000000A4A0A000999999008080
      8000868686005F5F5F0066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000BE4B0020B95E00AEEBA10054DD7B006FBD5200DEB443008D9B
      130024B43600506F0E00E17C1900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0004040400040404000404
      0400FFFFFF00969696008686860099999900FFFFFF00B2B2B200666666005555
      55005F5F5F006666660080808000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF0096AD390007AC3D000EC34A00FFFFE6005FCB790005851F003A70
      0D00C7700000E9721D00CF873900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200808080008080800000000000B2B2
      B200B2B2B2008686860080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1C66500479B1D0053923200F8C96700FFBD
      4C00BFB77100E1925300DC8A2500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040400FFFFFF00040404000404
      040004040400FFFFFF000404040004040400040404000404040004040400FFFF
      FF008686860086868600FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00EA903B00DB8C4900FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080008000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000A00000000000000000000000000000
      0000000000000000008000000000000000000000000000000020000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 648
    Top = 298
    object cxstlGrupo: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxstlLinhasImpares: TcxStyle
    end
    object cxstlLinhasPares: TcxStyle
    end
  end
end

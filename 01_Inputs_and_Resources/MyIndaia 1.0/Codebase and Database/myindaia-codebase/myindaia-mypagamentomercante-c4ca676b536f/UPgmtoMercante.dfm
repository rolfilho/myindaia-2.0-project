object frmPgmtoMercante: TfrmPgmtoMercante
  Left = 247
  Top = 149
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pagamento Mercante'
  ClientHeight = 553
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 987
    Height = 553
    Align = alClient
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 985
      Height = 127
      Align = alTop
      TabOrder = 0
      object pnlFiltros: TPanel
        Left = 1
        Top = 1
        Width = 983
        Height = 125
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 34
          Top = 4
          Width = 29
          Height = 13
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 242
          Top = 4
          Width = 41
          Height = 13
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 453
          Top = 4
          Width = 53
          Height = 13
          Caption = 'N'#250'mero BL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 584
          Top = 4
          Width = 85
          Height = 13
          Caption = 'N'#250'mero Mercante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 31
          Top = 92
          Width = 113
          Height = 13
          Caption = '*CTRL para limpar filtros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 453
          Top = 49
          Width = 44
          Height = 13
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 243
          Top = 49
          Width = 37
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblUnidadeNeg: TLabel
          Left = 32
          Top = 49
          Width = 40
          Height = 13
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object sb: TSpeedButton
          Left = 786
          Top = 94
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFDFC3C3004949243F3FE1D9D9FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20BABA00
            DCDC344343000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF208E8E329D9D7D6969000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B8F8FD2
            C2C2FFFFFF1C1818FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF8E8B8BBDBDBDF8F8F80E0E0EFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1B7B7B7D9
            D9D9D6D6D6555555C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF959595FFFFFF818181EFEFEFD2D2D22C2C2CFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF979797D2C3C357AFAFE0
            D9D9CBCBCBB1B1B1A4A4A4303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE3E3E3BCB5B569B1B1CDFFFFACA5A5FFFFFF515151FEFEFE3F3F3F9B9B
            9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF4EF5F5D0B9B9FF
            FFFFFFFFFFDFDFDFFFFFFFA6A6A6101010FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF96878774FFFF72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E1C1C
            1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C85851EFFFF80FFFFC7FFFFFF
            FFFFFFFFFFFFFFFF5CFFFFAE9E9E1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFA899996AF9F98AFFFF10FFFF5FFFFFAFFFFFFFFFFF6CFFFFB6A6A60C0C
            0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E1E169A9A978FFFFDFFFFFFF
            FFFFFFFFFFFFFFFF75C4C43B3333CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEEDFDF6FA7A708FFFFBFFFFFFFFFFFFFFFFF494141C5C5C5FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE3E3CAB3B3BE
            B7B7B9B9B9A2A2A2C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = sbClick
        end
        object cbGrupo: TDBLookupComboBox
          Left = 82
          Top = 20
          Width = 153
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_GRUPO'
          ListField = 'NM_GRUPO'
          ListSource = dmdBroker.dsGrupo
          ParentFont = False
          TabOrder = 1
          OnCloseUp = cbGrupoCloseUp
          OnExit = cbGrupoExit
          OnKeyDown = cbGrupoKeyDown
        end
        object edtNumeroBL: TEdit
          Left = 452
          Top = 20
          Width = 123
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 4
        end
        object edtNrMercante: TEdit
          Left = 583
          Top = 20
          Width = 123
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentFont = False
          TabOrder = 5
        end
        object cbEmpresa: TDBLookupComboBox
          Left = 290
          Top = 20
          Width = 153
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_EMPRESA'
          ListField = 'NM_EMPRESA'
          ListSource = dmdBroker.dsEmpresa
          ParentFont = False
          TabOrder = 3
          OnCloseUp = cbEmpresaCloseUp
          OnExit = cbEmpresaExit
          OnKeyDown = cbEmpresaKeyDown
        end
        object btnPesquisar: TBitBtn
          Left = 712
          Top = 50
          Width = 40
          Height = 44
          BiDiMode = bdLeftToRight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            52020000424D5202000000000000520100002800000010000000100000000100
            08000000000000010000340B0000340B00004700000047000000405058009860
            580031486000EAAB6A00A17373008F7B7300B67B7300A1847300AB847300F4AB
            7300AB7B7B00B67B7B00C07B7B00B6847B00C0987B00F4C07B00B68F8400C08F
            8400CA8F8400B6988400C0988400CA988400F4C08400F4CA840031608F00C098
            8F00CAA18F00D4AB8F00F4CA8F00D4AB9800D4B69800E0B69800FFD49800FFE0
            9800C0A1A100F4D4A100F4E0A100FFE0A100FFEAA100CAABAB00D4CAAB00E0D4
            AB00FFE0AB005084B600EAD4B600FFEAB600FFF4B600F4E0C000FFF4C000F4EA
            CA00F4F4CA00FFF4CA00FFFFCA00116AD400F4F4D400FFFFD4000B6AE0000B73
            E000FFFFE0000B73EA001173EA00A1CAEA00F4F4EA00FFF4EA00FFFFEA00FFFF
            F400FF00FF0031A1FF0038A1FF0038ABFF00FFFFFF0042020A42424242424242
            4242424242422B39180B42424242424242424242424243443C180B4242424242
            42424242424242444438180B424242424242424242424242444339180A424242
            424242424242424242444335004201101A114242424242424242453D05072F34
            3434291942424242424242221A2D34343437403E0442424242424206231C3034
            37404146284242424242421B210F30373A414140310D42424242421F20032434
            373A3A37321342424242421D25030F2D37373737311042424242420D2D2D1C16
            2430333429424242424242421E463F0F0316252E08424242424242424227312D
            21252314424242424242424242420E141B1B42424242}
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 11
          OnClick = btnPesquisarClick
        end
        object edtGrupo: TEdit
          Left = 35
          Top = 22
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 0
          OnExit = edtGrupoExit
          OnKeyDown = edtGrupoKeyDown
        end
        object edtEmpresa: TEdit
          Left = 242
          Top = 20
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 2
          OnExit = edtEmpresaExit
          OnKeyDown = edtEmpresaKeyDown
        end
        object rgStatus: TRadioGroup
          Left = 831
          Top = 0
          Width = 132
          Height = 101
          Caption = 'Status'
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Integral'
            'Isen'#231#227'o'
            'Suspens'#227'o')
          TabOrder = 12
          OnClick = rgStatusClick
        end
        object edtNrProcesso: TEdit
          Left = 452
          Top = 65
          Width = 123
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 18
          ParentFont = False
          TabOrder = 10
        end
        object cbProduto: TDBLookupComboBox
          Left = 290
          Top = 65
          Width = 153
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_PRODUTO'
          ListField = 'NM_PRODUTO'
          ListSource = dmdBroker.dsProduto
          ParentFont = False
          TabOrder = 9
          TabStop = False
          OnCloseUp = cbProdutoCloseUp
          OnExit = cbProdutoExit
          OnKeyDown = cbProdutoKeyDown
        end
        object edtProduto: TEdit
          Left = 242
          Top = 65
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 8
          OnExit = edtProdutoExit
          OnKeyDown = edtProdutoKeyDown
        end
        object cbUnidade: TDBLookupComboBox
          Left = 82
          Top = 65
          Width = 153
          Height = 21
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_UNID_NEG'
          ListField = 'NM_UNID_NEG'
          ListSource = dmdBroker.dsUnidadeNeg
          ParentFont = False
          TabOrder = 7
          TabStop = False
          OnCloseUp = cbUnidadeCloseUp
          OnExit = cbUnidadeExit
          OnKeyDown = cbUnidadeKeyDown
        end
        object edUnidade: TEdit
          Left = 34
          Top = 65
          Width = 41
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 6
          OnExit = edUnidadeExit
          OnKeyDown = edUnidadeKeyDown
        end
        object rgTipoDI: TRadioGroup
          Left = 584
          Top = 47
          Width = 122
          Height = 58
          Caption = 'Tipo de DI'
          ItemIndex = 0
          Items.Strings = (
            'Interna'
            'Externa')
          TabOrder = 13
          OnClick = rgStatusClick
        end
      end
    end
    object pnlBottom: TPanel
      Left = 1
      Top = 516
      Width = 985
      Height = 36
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        985
        36)
      object lblResultados: TLabel
        Left = 893
        Top = 8
        Width = 53
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Resultados'
        ExplicitLeft = 789
      end
      object lblMensagens: TLabel
        Left = 189
        Top = 8
        Width = 20
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Msg'
        ExplicitLeft = 140
      end
      object btnPagarAFRMM: TBitBtn
        Left = 14
        Top = 5
        Width = 120
        Height = 25
        Caption = 'Acessar Mercante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnPagarAFRMMClick
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 128
      Width = 985
      Height = 388
      Align = alClient
      TabOrder = 2
      object pgcDados: TPageControl
        Left = 1
        Top = 1
        Width = 983
        Height = 386
        ActivePage = tbsDiInterna
        Align = alClient
        TabOrder = 0
        object tbsDiInterna: TTabSheet
          Caption = 'DI Interna'
          ImageIndex = 1
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 975
            Height = 358
            Align = alClient
            DataSource = dmdBroker.dsDados
            FixedColor = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
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
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 98
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SALDO'
                Title.Caption = 'Saldo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_GRUPO'
                ReadOnly = True
                Title.Caption = 'Grupo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_GRUPO'
                ReadOnly = True
                Title.Caption = 'Desc. Grupo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 179
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CGC_EMPRESA'
                ReadOnly = True
                Title.Caption = 'CNPJ'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_CE'
                ReadOnly = True
                Title.Caption = 'Nr. Mercante'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_CONHECIMENTO'
                ReadOnly = True
                Title.Caption = 'Nr. BL'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IN_INTEGRAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -13
                Font.Name = 'Webdings'
                Font.Style = [fsBold]
                Title.Caption = 'Integral'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IN_ISENCAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -13
                Font.Name = 'Webdings'
                Font.Style = [fsBold]
                Title.Caption = 'Isen'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IN_SUSPENSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -13
                Font.Name = 'Webdings'
                Font.Style = [fsBold]
                Title.Caption = 'Suspens'#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 68
                Visible = True
              end>
          end
        end
        object tbsDiExterna: TTabSheet
          Caption = 'DI Externa'
          object dbgdados: TDBGrid
            Left = 0
            Top = 0
            Width = 975
            Height = 358
            Align = alClient
            DataSource = dmdBroker.dsDados
            FixedColor = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
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
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 98
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SALDO'
                Title.Caption = 'Saldo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_GRUPO'
                ReadOnly = True
                Title.Caption = 'Grupo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_GRUPO'
                ReadOnly = True
                Title.Caption = 'Desc. Grupo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 179
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CGC_EMPRESA'
                ReadOnly = True
                Title.Caption = 'CNPJ'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_CE'
                ReadOnly = True
                Title.Caption = 'Nr. Mercante'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_CONHECIMENTO'
                ReadOnly = True
                Title.Caption = 'Nr. BL'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IN_INTEGRAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -13
                Font.Name = 'Webdings'
                Font.Style = [fsBold]
                Title.Caption = 'Integral'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IN_DEFINIR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGreen
                Font.Height = -11
                Font.Name = 'Webdings'
                Font.Style = [fsBold]
                ReadOnly = True
                Title.Caption = 'Isen'#231#227'o/Suspens'#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 119
                Visible = True
              end>
          end
        end
      end
      object mmObservacao: TMemo
        Left = 491
        Top = -4
        Width = 473
        Height = 13
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          'I'
          'n'
          't'
          'e'
          'g'
          'r'
          'a'
          'l'
          'E'
          'v'
          'e'
          'n'
          't'
          'o'
          '('
          's'
          ') '
          'c'
          'o'
          'm '
          'p'
          'r'
          'e'
          'e'
          'n'
          'c'
          'h'
          'i'
          'm'
          'e'
          'n'
          't'
          'o '
          'o'
          'b'
          'r'
          'i'
          'g'
          'a'
          't'
          #243
          'r'
          'i'
          'o'
          ':'
          '  '
          '  '
          '  '
          '  '
          '4'
          '1'
          '9 '
          '- '
          'C'
          'o'
          'n'
          'f'
          'e'
          'c'
          #231
          #227
          'o '
          'd'
          'e '
          'D'
          'I '
          '/ '
          'D'
          'T'
          'A '
          '/ '
          'D'
          'S'
          'I '
          ' '
          '  '
          '  '
          '  '
          '  '
          '7'
          '2'
          '2 '
          '- '
          'M'
          'e'
          'r'
          'c'
          'a'
          'n'
          't'
          'e '
          'a'
          'n'
          'a'
          'l'
          'i'
          's'
          'a'
          'd'
          'o'
          '  '
          '  '
          '  '
          '  '
          '4'
          '1'
          '6 '
          '- '
          'A'
          'n'
          'a'
          'l'
          'i'
          's'
          'e '
          'd'
          'o'
          'c'
          'u'
          'm'
          'e'
          'n'
          't'
          'a'
          'l'
          '  '
          '  '
          '  '
          '  '
          '1'
          '6'
          '2 '
          '- '
          'D'
          'a'
          't'
          'a '
          'd'
          'e '
          'c'
          'h'
          'e'
          'g'
          'a'
          'd'
          'a '
          'd'
          'o '
          'N'
          'a'
          'v'
          'i'
          'o'
          'E'
          'v'
          'e'
          'n'
          't'
          'o'
          '('
          's'
          ') '
          's'
          'e'
          'm '
          'p'
          'r'
          'e'
          'e'
          'n'
          'c'
          'h'
          'i'
          'm'
          'e'
          'n'
          't'
          'o'
          ':'#9
          #9
          '  '
          '  '
          '  '
          '  '
          '5'
          '3'
          '3 '
          '- '
          'P'
          'a'
          'g'
          'a'
          'm'
          'e'
          'n'
          't'
          'o '
          'd'
          'e '
          'M'
          'a'
          'r'
          'i'
          'n'
          'h'
          'a '
          'M'
          'e'
          'r'
          'c'
          'a'
          'n'
          't'
          'e'
          ''
          'I'
          's'
          'e'
          'n'
          #231
          #227
          'o '
          '/ '
          'S'
          'u'
          's'
          'p'
          'e'
          'n'
          's'
          #227
          'o'
          'E'
          'v'
          'e'
          'n'
          't'
          'o'
          '('
          's'
          ') '
          'c'
          'o'
          'm '
          'p'
          'r'
          'e'
          'e'
          'n'
          'c'
          'h'
          'i'
          'm'
          'e'
          'n'
          't'
          'o '
          'o'
          'b'
          'r'
          'i'
          'g'
          'a'
          't'
          #243
          'r'
          'i'
          'o'
          ':'
          '  '
          '  '
          '  '
          '  '
          '4'
          '1'
          '9 '
          '- '
          'C'
          'o'
          'n'
          'f'
          'e'
          'c'
          #231
          #227
          'o '
          'd'
          'e '
          'D'
          'I '
          '/ '
          'D'
          'T'
          'A '
          '/ '
          'D'
          'S'
          'I '
          ' '
          '  '
          '  '
          '  '
          '  '
          '7'
          '2'
          '2 '
          '- '
          'M'
          'e'
          'r'
          'c'
          'a'
          'n'
          't'
          'e '
          'a'
          'n'
          'a'
          'l'
          'i'
          's'
          'a'
          'd'
          'o'
          '  '
          '  '
          '  '
          '  '
          '4'
          '1'
          '6 '
          '- '
          'A'
          'n'
          'a'
          'l'
          'i'
          's'
          'e '
          'd'
          'o'
          'c'
          'u'
          'm'
          'e'
          'n'
          't'
          'a'
          'l'
          '  '
          '  '
          '  '
          '  '
          '1'
          '6'
          '2 '
          '- '
          'D'
          'a'
          't'
          'a '
          'd'
          'e '
          'c'
          'h'
          'e'
          'g'
          'a'
          'd'
          'a '
          'd'
          'o '
          'N'
          'a'
          'v'
          'i'
          'o'
          'E'
          'v'
          'e'
          'n'
          't'
          'o'
          's '
          's'
          'e'
          'm '
          'p'
          'r'
          'e'
          'e'
          'n'
          'c'
          'h'
          'i'
          'm'
          'e'
          'n'
          't'
          'o'
          ':'#9
          #9#9
          '  '
          '  '
          '  '
          '  '
          '0'
          '4'
          '9 '
          '- '
          'I'
          's'
          'e'
          'n'
          #231
          #227
          'o'
          '/'
          'S'
          'u'
          's'
          'p'
          'e'
          'n'
          #231
          #227
          'o '
          'M'
          'M')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
    end
  end
end

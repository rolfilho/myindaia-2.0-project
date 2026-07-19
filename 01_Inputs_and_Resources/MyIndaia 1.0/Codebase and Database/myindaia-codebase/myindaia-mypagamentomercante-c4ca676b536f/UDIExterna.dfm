object frmDIExterna: TfrmDIExterna
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados Pagamento Mercante - DI Externa'
  ClientHeight = 372
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 732
    Height = 372
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object pgcPagamentoMercante: TPageControl
      Left = 1
      Top = 1
      Width = 730
      Height = 370
      ActivePage = tbsSuspensao
      Align = alClient
      TabOrder = 0
      object tbsLista: TTabSheet
        Caption = 'Lista'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 722
          Height = 120
          Align = alTop
          Caption = 'Panel4'
          TabOrder = 0
          object pnlBtns: TPanel
            Left = 1
            Top = 1
            Width = 720
            Height = 26
            Align = alTop
            TabOrder = 0
            DesignSize = (
              720
              26)
            object Label8: TLabel
              Left = 8
              Top = 1
              Width = 66
              Height = 17
              Caption = 'Suspens'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btnInserirSuspensao: TBitBtn
              Left = 576
              Top = -1
              Width = 40
              Height = 25
              Hint = 'Incluir'
              Anchors = [akRight, akBottom]
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666FFF666666666
                666666FFF666666600006666666844F66666666666666888F666666600006666
                666844F66666666666666888F666666600006666666844F66666666666666888
                F666666600006666FFF644FFFFF6666666FFF888FFFFF6660000666844444444
                44F66666688888888888F666000066684444444444F66666688888888888F666
                000066688888446888666666688888888888666600006666666844F666666666
                66666888F666666600006666666844F66666666666666888F666666600006666
                666844F66666666666666888F666666600006666666888666666666666666888
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnInserirSuspensaoClick
            end
            object btnAlterarSuspensao: TBitBtn
              Left = 625
              Top = -1
              Width = 41
              Height = 25
              Hint = 'Alterar'
              Anchors = [akRight, akBottom]
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666FFFFFFFFFFF6666666FFFFFF
                FFFFF666000066684444444444F66666688888888888F6660000666844444444
                44F66666688888888888F66600006666844444444F66666666888888888F6666
                0000666668444444F66666666668888888F66666000066666684444F66666666
                666688888F66666600006666666844F66666666666666888F666666600006666
                6666886666666666666666886666666600006666666666666666666666666666
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnAlterarSuspensaoClick
            end
            object btnExcluirSuspensao: TBitBtn
              Left = 674
              Top = -1
              Width = 40
              Height = 25
              Hint = 'Excluir'
              Anchors = [akRight, akBottom]
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666844444444
                44F66666688888888888F666000066684444444444F66666688888888888F666
                0000666888888888886666666888888888886666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btnExcluirSuspensaoClick
            end
          end
          object dbgSuspensao: TDBGrid
            Left = 1
            Top = 27
            Width = 720
            Height = 92
            Align = alClient
            DataSource = dmdBroker.dsDIExternaSuspensao
            FixedColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_CE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeTipoSuspensao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Tipo '
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 231
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_ATO_CONCESSORIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_VENCIMENTO_SUSPENSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dsSuspensaoParcial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Parcial'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QT_PESO_SUSPENSAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 240
          Width = 722
          Height = 120
          Align = alTop
          TabOrder = 1
          object dbgIntegral: TDBGrid
            Left = 1
            Top = 27
            Width = 720
            Height = 92
            Align = alClient
            DataSource = dmdBroker.dsDIExternaIntegral
            FixedColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_CE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_PARCELA_ENTREPOSTO'
                Title.Caption = 'Nr Parcela'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = True
              end>
          end
          object TPanel
            Left = 1
            Top = 1
            Width = 720
            Height = 26
            Align = alTop
            TabOrder = 1
            DesignSize = (
              720
              26)
            object Label10: TLabel
              Left = 8
              Top = 2
              Width = 46
              Height = 17
              Caption = 'Integral'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblIntegral: TLabel
              Left = 67
              Top = 6
              Width = 159
              Height = 12
              Caption = 'Pagamento de taxas ap'#243's a Isen'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -10
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btnInserirIntegral: TBitBtn
              Left = 576
              Top = 0
              Width = 40
              Height = 25
              Hint = 'Incluir'
              Anchors = [akRight, akBottom]
              Enabled = False
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666FFF666666666
                666666FFF666666600006666666844F66666666666666888F666666600006666
                666844F66666666666666888F666666600006666666844F66666666666666888
                F666666600006666FFF644FFFFF6666666FFF888FFFFF6660000666844444444
                44F66666688888888888F666000066684444444444F66666688888888888F666
                000066688888446888666666688888888888666600006666666844F666666666
                66666888F666666600006666666844F66666666666666888F666666600006666
                666844F66666666666666888F666666600006666666888666666666666666888
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnInserirIntegralClick
            end
            object btnExcluirIntegral: TBitBtn
              Left = 674
              Top = 0
              Width = 40
              Height = 25
              Hint = 'Excluir'
              Anchors = [akRight, akBottom]
              Enabled = False
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666844444444
                44F66666688888888888F666000066684444444444F66666688888888888F666
                0000666888888888886666666888888888886666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnExcluirIntegralClick
            end
            object btnAlterarIntegral: TBitBtn
              Left = 625
              Top = 0
              Width = 41
              Height = 25
              Hint = 'Alterar'
              Anchors = [akRight, akBottom]
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666FFFFFFFFFFF6666666FFFFFF
                FFFFF666000066684444444444F66666688888888888F6660000666844444444
                44F66666688888888888F66600006666844444444F66666666888888888F6666
                0000666668444444F66666666668888888F66666000066666684444F66666666
                666688888F66666600006666666844F66666666666666888F666666600006666
                6666886666666666666666886666666600006666666666666666666666666666
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btnAlterarIntegralClick
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 120
          Width = 722
          Height = 120
          Align = alTop
          TabOrder = 2
          object dbgIsencao: TDBGrid
            Left = 1
            Top = 27
            Width = 720
            Height = 92
            Align = alClient
            DataSource = dmdBroker.dsDIExternaIsencao
            FixedColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_CE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeTipoIsencao'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Tipo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 231
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_PARCELA_ENTREPOSTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dsIsencaoParcial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Parcial'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QT_PESO_ISENCAO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Peso'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -13
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 82
                Visible = True
              end>
          end
          object TPanel
            Left = 1
            Top = 1
            Width = 720
            Height = 26
            Align = alTop
            TabOrder = 1
            DesignSize = (
              720
              26)
            object Label9: TLabel
              Left = 8
              Top = 4
              Width = 47
              Height = 17
              Caption = 'Isen'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -14
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btnInserirIsencao: TBitBtn
              Left = 576
              Top = -1
              Width = 40
              Height = 25
              Hint = 'Incluir'
              Anchors = [akRight, akBottom]
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666FFF666666666
                666666FFF666666600006666666844F66666666666666888F666666600006666
                666844F66666666666666888F666666600006666666844F66666666666666888
                F666666600006666FFF644FFFFF6666666FFF888FFFFF6660000666844444444
                44F66666688888888888F666000066684444444444F66666688888888888F666
                000066688888446888666666688888888888666600006666666844F666666666
                66666888F666666600006666666844F66666666666666888F666666600006666
                666844F66666666666666888F666666600006666666888666666666666666888
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnInserirIsencaoClick
            end
            object btnAlterarIsencao: TBitBtn
              Left = 625
              Top = -1
              Width = 41
              Height = 25
              Hint = 'Alterar'
              Anchors = [akRight, akBottom]
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666FFFFFFFFFFF6666666FFFFFF
                FFFFF666000066684444444444F66666688888888888F6660000666844444444
                44F66666688888888888F66600006666844444444F66666666888888888F6666
                0000666668444444F66666666668888888F66666000066666684444F66666666
                666688888F66666600006666666844F66666666666666888F666666600006666
                6666886666666666666666886666666600006666666666666666666666666666
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = btnAlterarIsencaoClick
            end
            object btnExcluirIsencao: TBitBtn
              Left = 674
              Top = -1
              Width = 40
              Height = 25
              Hint = 'Excluir'
              Anchors = [akRight, akBottom]
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666844444444
                44F66666688888888888F666000066684444444444F66666688888888888F666
                0000666888888888886666666888888888886666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btnExcluirIsencaoClick
            end
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 308
          Width = 722
          Height = 33
          Align = alBottom
          TabOrder = 3
          DesignSize = (
            722
            33)
          object btnContinuar: TBitBtn
            Left = 603
            Top = 0
            Width = 112
            Height = 32
            Hint = 'Continuar Pagamento'
            Anchors = [akRight, akBottom]
            Caption = 'Continuar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000666666666666666666666666666666666666000066666666666666666666
              6666666666666666000066666666666666666666666666666666666600006666
              F666666666666666666F6666666666660000666F47666FFFFFF6666666F77666
              FFFFF666000066F747666F44444766666F77666667777766000066F4766666F4
              444766666F76666666777766000066F47666666F444766666F76666666677766
              000066F4F6666FF4744766666F7F6666FF767766000066674FFFF44767476666
              6677FFFF77666766000066667444477666776666666777776666666600006666
              6777766666666666666666666666666600006666666666666666666666666666
              6666666600006666666666666666666666666666666666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            ModalResult = 1
            NumGlyphs = 2
            TabOrder = 0
          end
          object btnCancelar: TBitBtn
            Left = 532
            Top = 0
            Width = 62
            Height = 32
            Anchors = [akRight, akBottom]
            Caption = 'Cancelar'
            ModalResult = 2
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
      object tbsSuspensao: TTabSheet
        Caption = 'Suspens'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object Label1: TLabel
          Left = 13
          Top = 12
          Width = 86
          Height = 14
          Caption = 'Tipo Suspens'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 13
          Top = 114
          Width = 207
          Height = 14
          Caption = 'Data Vencimento da Suspens'#227'o / Ato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 13
          Top = 62
          Width = 108
          Height = 14
          Caption = 'Nr. Ato Concess'#243'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 197
          Top = 192
          Width = 88
          Height = 14
          Caption = 'Peso Suspens'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbedtTP_SUSPENCAO: TDBEdit
          Left = 13
          Top = 28
          Width = 41
          Height = 22
          DataField = 'CD_TP_SUSPENSAO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit1: TDBEdit
          Left = 13
          Top = 130
          Width = 146
          Height = 22
          DataField = 'DT_VENCIMENTO_SUSPENSAO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 13
          Top = 77
          Width = 158
          Height = 22
          DataField = 'NR_ATO_CONCESSORIO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object dblkSuspensao: TDBLookupComboBox
          Left = 60
          Top = 28
          Width = 261
          Height = 21
          DataField = 'CD_TP_SUSPENSAO'
          DataSource = dmdBroker.dsDIExterna
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_TP_SUSPENSAO'
          ListField = 'DS_TP_SUSPENSAO'
          ListSource = dmdBroker.dsSuspensao
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 197
          Top = 207
          Width = 158
          Height = 22
          DataField = 'QT_PESO_SUSPENSAO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object rgTipoSuspensao: TDBRadioGroup
          Left = 13
          Top = 168
          Width = 158
          Height = 61
          Caption = 'Tipo Suspens'#227'o'
          DataField = 'IC_SUSPENSAO_PARCIAL'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Total'
            'Parcial')
          ParentFont = False
          TabOrder = 5
          Values.Strings = (
            '0'
            '1')
        end
        object Panel3: TPanel
          Left = 0
          Top = 303
          Width = 722
          Height = 38
          Align = alBottom
          TabOrder = 6
          DesignSize = (
            722
            38)
          object btnGravarSuspensao: TBitBtn
            Left = 543
            Top = 0
            Width = 80
            Height = 25
            Hint = 'Incluir'
            Anchors = [akRight, akBottom]
            Caption = 'Gravar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              000066666664F66666666666666667F6666666660000666666444F6666666666
              6666777F666666660000666664444F66666666666667777F6666666600006666
              444F44F66666666666777F77F66666660000666444F6644F666666666777F667
              7F666666000066664F66664F66666666667F66667F6666660000666666666664
              F66666666666666667F6666600006666666666664F66666666666666667F6666
              000066666666666664F66666666666666667F6660000666666666666664F6666
              6666666666667F6600006666666666666664F66666666666666687F600006666
              6666666666664666666666666666667600006666666666666666666666666666
              6666666600006666666666666666666666666666666666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            NumGlyphs = 2
            TabOrder = 0
            OnClick = btnGravarSuspensaoClick
          end
          object btnCancelarSuspensao: TBitBtn
            Left = 629
            Top = 0
            Width = 80
            Height = 25
            Hint = 'Incluir'
            Anchors = [akRight, akBottom]
            Caption = 'Cancelar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000666666666666666666666666666666666666000066666666666666666666
              6666666666666666000066666666666666666666666666666666666600006666
              666666666F66666666666666666F66660000666FFFFFF66684F6666666FFFFF6
              6688F666000066844444F666848F66666888886666688F6600006684444F6666
              684F66666888866666668F660000668444F66666684F66666888666666668F66
              00006684484FF6666F4F666668868FF6666F8F660000668486844FFFF4866666
              6866688FFFF88666000066886668844448666666666666688888666600006666
              6666688886666666666666666666666600006666666666666666666666666666
              6666666600006666666666666666666666666666666666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            NumGlyphs = 2
            TabOrder = 1
            OnClick = btnCancelarSuspensaoClick
          end
        end
      end
      object tbsIsencao: TTabSheet
        Caption = 'Isen'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 2
        ParentFont = False
        object Label2: TLabel
          Left = 14
          Top = 12
          Width = 70
          Height = 14
          Caption = 'Tipo Isen'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 14
          Top = 62
          Width = 58
          Height = 14
          Caption = 'Nr. Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 197
          Top = 136
          Width = 72
          Height = 14
          Caption = 'Peso Isen'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbedtTP_ISENCAO: TDBEdit
          Left = 14
          Top = 28
          Width = 41
          Height = 22
          DataField = 'CD_TP_ISENCAO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbedtNR_PARCELA: TDBEdit
          Left = 14
          Top = 77
          Width = 60
          Height = 22
          DataField = 'NR_PARCELA_ENTREPOSTO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dblkIsencao: TDBLookupComboBox
          Left = 60
          Top = 28
          Width = 261
          Height = 21
          DataField = 'CD_TP_ISENCAO'
          DataSource = dmdBroker.dsDIExterna
          DropDownWidth = 200
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_TP_ISENCAO'
          ListField = 'DS_TP_ISENCAO'
          ListSource = dmdBroker.dsIsencao
          ParentFont = False
          TabOrder = 2
        end
        object rgTipoIsencao: TDBRadioGroup
          Left = 13
          Top = 112
          Width = 158
          Height = 61
          Caption = 'Tipo Isen'#231#227'o'
          DataField = 'IC_ISENCAO_PARCIAL'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Total'
            'Parcial')
          ParentFont = False
          TabOrder = 3
          Values.Strings = (
            '0'
            '1')
        end
        object DBEdit4: TDBEdit
          Left = 197
          Top = 151
          Width = 158
          Height = 22
          DataField = 'QT_PESO_ISENCAO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object Panel5: TPanel
          Left = 0
          Top = 303
          Width = 722
          Height = 38
          Align = alBottom
          TabOrder = 5
          DesignSize = (
            722
            38)
          object btnGravaIsencao: TBitBtn
            Left = 543
            Top = 0
            Width = 80
            Height = 25
            Hint = 'Incluir'
            Anchors = [akRight, akBottom]
            Caption = 'Gravar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              000066666664F66666666666666667F6666666660000666666444F6666666666
              6666777F666666660000666664444F66666666666667777F6666666600006666
              444F44F66666666666777F77F66666660000666444F6644F666666666777F667
              7F666666000066664F66664F66666666667F66667F6666660000666666666664
              F66666666666666667F6666600006666666666664F66666666666666667F6666
              000066666666666664F66666666666666667F6660000666666666666664F6666
              6666666666667F6600006666666666666664F66666666666666687F600006666
              6666666666664666666666666666667600006666666666666666666666666666
              6666666600006666666666666666666666666666666666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            NumGlyphs = 2
            TabOrder = 0
            OnClick = btnGravaIsencaoClick
          end
          object btnCancelarIsencao: TBitBtn
            Left = 629
            Top = 0
            Width = 80
            Height = 25
            Hint = 'Incluir'
            Anchors = [akRight, akBottom]
            Caption = 'Cancelar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000666666666666666666666666666666666666000066666666666666666666
              6666666666666666000066666666666666666666666666666666666600006666
              666666666F66666666666666666F66660000666FFFFFF66684F6666666FFFFF6
              6688F666000066844444F666848F66666888886666688F6600006684444F6666
              684F66666888866666668F660000668444F66666684F66666888666666668F66
              00006684484FF6666F4F666668868FF6666F8F660000668486844FFFF4866666
              6866688FFFF88666000066886668844448666666666666688888666600006666
              6666688886666666666666666666666600006666666666666666666666666666
              6666666600006666666666666666666666666666666666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            NumGlyphs = 2
            TabOrder = 1
            OnClick = btnCancelarIsencaoClick
          end
        end
      end
      object tbsNacionalizacao: TTabSheet
        Caption = 'Nacionaliza'#231#227'o'
        ImageIndex = 3
        object Label13: TLabel
          Left = 14
          Top = 14
          Width = 58
          Height = 14
          Caption = 'Nr. Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit5: TDBEdit
          Left = 14
          Top = 29
          Width = 60
          Height = 22
          DataField = 'NR_PARCELA_ENTREPOSTO'
          DataSource = dmdBroker.dsDIExterna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object Panel8: TPanel
          Left = 0
          Top = 303
          Width = 722
          Height = 38
          Align = alBottom
          TabOrder = 1
          DesignSize = (
            722
            38)
          object BitBtn3: TBitBtn
            Left = 543
            Top = 0
            Width = 80
            Height = 25
            Hint = 'Incluir'
            Anchors = [akRight, akBottom]
            Caption = 'Gravar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              000066666664F66666666666666667F6666666660000666666444F6666666666
              6666777F666666660000666664444F66666666666667777F6666666600006666
              444F44F66666666666777F77F66666660000666444F6644F666666666777F667
              7F666666000066664F66664F66666666667F66667F6666660000666666666664
              F66666666666666667F6666600006666666666664F66666666666666667F6666
              000066666666666664F66666666666666667F6660000666666666666664F6666
              6666666666667F6600006666666666666664F66666666666666687F600006666
              6666666666664666666666666666667600006666666666666666666666666666
              6666666600006666666666666666666666666666666666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            NumGlyphs = 2
            TabOrder = 0
            OnClick = BitBtn3Click
          end
          object BitBtn4: TBitBtn
            Left = 629
            Top = 0
            Width = 80
            Height = 25
            Hint = 'Incluir'
            Anchors = [akRight, akBottom]
            Caption = 'Cancelar'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000666666666666666666666666666666666666000066666666666666666666
              6666666666666666000066666666666666666666666666666666666600006666
              666666666F66666666666666666F66660000666FFFFFF66684F6666666FFFFF6
              6688F666000066844444F666848F66666888886666688F6600006684444F6666
              684F66666888866666668F660000668444F66666684F66666888666666668F66
              00006684484FF6666F4F666668868FF6666F8F660000668486844FFFF4866666
              6866688FFFF88666000066886668844448666666666666688888666600006666
              6666688886666666666666666666666600006666666666666666666666666666
              6666666600006666666666666666666666666666666666660000666666666666
              6666666666666666666666660000666666666666666666666666666666666666
              0000}
            NumGlyphs = 2
            TabOrder = 1
            OnClick = btnCancelarIsencaoClick
          end
        end
      end
    end
  end
end

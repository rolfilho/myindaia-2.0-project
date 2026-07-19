object frmMyInsereDigitalizacao: TfrmMyInsereDigitalizacao
  Left = 324
  Top = 151
  BorderStyle = bsSingle
  Caption = 'MyInsereDigitalizacao'
  ClientHeight = 348
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 501
    Height = 348
    ActivePage = tbsProcessamento
    Align = alClient
    TabOrder = 0
    OnChange = pgPrincipalChange
    OnChanging = pgPrincipalChanging
    object tbsProcessamento: TTabSheet
      Caption = 'Processamento'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 493
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          493
          57)
        object Label3: TLabel
          Left = 186
          Top = 9
          Width = 53
          Height = 13
          Caption = 'Intervalo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 7
          Top = 35
          Width = 230
          Height = 13
          Caption = 'Excluir arquivos processados h'#225' mais de '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 290
          Top = 35
          Width = 23
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtIntervalo: TEdit
          Left = 247
          Top = 6
          Width = 33
          Height = 21
          MaxLength = 4
          TabOrder = 0
          Text = '1'
          OnChange = edtIntervaloChange
        end
        object btnCopiar: TBitBtn
          Left = 382
          Top = 10
          Width = 94
          Height = 38
          Anchors = [akTop]
          Caption = 'Mover'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFA0756E7443427443427443427443427443427443427443
            42744342744342FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFFF8E5F7
            EDD9F7EBD5F4E9D1F4E9D0F4E7CFF6EAD0EEDDC4754443FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFA0756EF7EDDCF2D9BFF2D7BBF0D5BAEFD4B5EED3B2EED9
            BFE5D0BA754443FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756EFAEFDEFC
            C591FCC591FCC591FCC591FCC591FCC591E3D1BC754443FF00FFFF00FFA0756E
            744342744342744342A0756EFCF4E7F6D9BAF7D7B6F6D4B5F6D4B2F4D1ADF0DC
            C2E6D3C081524CFF00FFFF00FFA0756EFFF8E5F7EDD9F7EBD5A0756EFEF6EBF8
            DABCF8D9B8F8D8B7F7D5B6F7D4B2F3DEC7E7D7C581524DFF00FFFF00FFA0756E
            F7EDDCF2D9BFF2D7BBA0756EFEFAF2FCC591FCC591FCC591FCC591FCC591FCC5
            91EBDDCF8F5F5AFF00FFFF00FFA0756EFAEFDEFCC591FCC591A0756EFFFCFAFC
            E3CCFBE0C7FADEC6F8DEC4FCE2C6FCF0DEE1D7CE8F5E59FF00FFFF00FFA0756E
            FCF4E7F6D9BAF7D7B6A0756EFFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1
            AFA793959E675AFF00FFFF00FFA0756EFEF6EBF8DABCF8D9B8A0756EFFFFFFFF
            FFFFFFFEFEFFFCF8FFFEFAA0756EA0756EA0756EA0756EFF00FFFF00FFA0756E
            FEFAF2FCC591FCC591A0756EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A1
            54B6735DFF00FFFF00FFFF00FFA0756EFFFCFAFCE3CCFBE0C7A0756EA0756EA0
            756EA0756EA0756EA0756EA0756EAA6D68FF00FFFF00FFFF00FFFF00FFA0756E
            FFFFFFFEFFFFFBFBFBFAF8F7FAFAF6E5D5D0C6B1AFA793959E675AFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFA0756EFFFFFFFFFFFFFFFEFEFFFCF8FFFEFAA0
            756EA0756EA0756EA0756EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0756E
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0756EE5A154B6735DFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFA0756EA0756EA0756EA0756EA0756EA0756EA0
            756EAA6D68FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 1
          OnClick = btnCopiarClick
        end
        object edtTempoBackup: TEdit
          Left = 247
          Top = 27
          Width = 33
          Height = 21
          MaxLength = 4
          TabOrder = 2
          Text = '15'
          OnChange = edtIntervaloChange
        end
      end
      object MemoLog: TMemo
        Left = 0
        Top = 57
        Width = 493
        Height = 245
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = MemoLogChange
      end
      object pnlStatus: TPanel
        Left = 0
        Top = 302
        Width = 493
        Height = 18
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 2
        object Panel3: TPanel
          Left = 137
          Top = 1
          Width = 128
          Height = 16
          Align = alLeft
          TabOrder = 0
          object lblTempoRestante: TLabel
            Left = 1
            Top = 1
            Width = 126
            Height = 14
            Align = alClient
            Alignment = taCenter
            ExplicitWidth = 3
            ExplicitHeight = 13
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 136
          Height = 16
          Align = alLeft
          TabOrder = 1
          object lblMovidos: TLabel
            Left = 1
            Top = 1
            Width = 56
            Height = 14
            Align = alLeft
            Caption = '  Movidos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitHeight = 13
          end
          object lblCopiados: TLabel
            Left = 57
            Top = 1
            Width = 78
            Height = 14
            Align = alClient
            Alignment = taCenter
            Caption = '0 / 0'
            ExplicitWidth = 22
            ExplicitHeight = 13
          end
        end
        object Panel5: TPanel
          Left = 265
          Top = 1
          Width = 227
          Height = 16
          Align = alClient
          TabOrder = 2
          object Gauge1: TGauge
            Left = 1
            Top = 1
            Width = 225
            Height = 14
            Align = alClient
            BorderStyle = bsNone
            ForeColor = clBlue
            Progress = 0
            ExplicitLeft = 115
            ExplicitTop = -5
            ExplicitWidth = 151
            ExplicitHeight = 21
          end
        end
      end
    end
    object tbsConfig: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 233
        Width = 493
        Height = 87
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 7
          Top = 7
          Width = 156
          Height = 13
          Caption = 'Diret'#243'rio de Destino (Base):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnAddDiretorioDestino: TSpeedButton
          Left = 359
          Top = 21
          Width = 23
          Height = 21
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF05740BFF00FFFF00FFFF00FFFEFEFEFEFEFEFEFEFEFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FF2BACD8
            35B3DC23A9D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0574
            0B5BE78C05740BFF00FFFF00FF808080808080808080FEFEFEFEFEFEFEFEFEFE
            FEFEFEFEFEFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FF42B4DC
            AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FF05740B50D7
            7A45D26C31C14F05740BFF00FF808080FEFEFEFF00FF80808080808080808080
            8080808080FEFEFEFEFEFE808080FEFEFEFF00FFFF00FF808080FF00FF26A8D6
            A6E9F59EFFFF97FCFF99FBFF95F7FF8DF2FE83EAFA49C2E449C2E43AB8DF168C
            2330C14C169824FF00FFFF00FF808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF808080808080808080808080FEFEFE808080FEFEFEFF00FF31B1DB
            23A9D7ABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF50C81
            161AAF2C088310FF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FF00FFFF00FF47BEE1
            23A9D7AAF0FA91FAFF91F6FF90F5FF8EF4FF8DF2FE8BF1FE8CF1FF77DFF60C90
            170EA01AFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FF4CC0E2
            7BE5F423A9D79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF0A89120EA1
            1A08810FFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FFFEFEFEFEFEFEFEFEFE808080FEFEFE808080FEFEFEFF00FFFF00FF4BBFE1
            93F9FD23A9D7A8E9F5A8F0FAA4F1FBA1F7FF05710A09790F0B89160A8C13067A
            0D58CDEAFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFEFEFEFEFEFEFE
            FEFE808080808080808080808080808080808080FF00FFFEFEFEFF00FF4CC0E2
            9DFEFFB7818323A9D723A9D723A9D723A9D7AFF2FB6BD7ED88F2FF6CD9F381E9
            FB80EAFA1FA8D6FF00FFFF00FF808080FEFEFE80808080808080808080808080
            8080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FF4CC0E2
            9AFCFFBA8E85FEFEFEFEFEFEF7E6D0F7E6D023A9D79FE3F4A7EDFA94E1F4A2EC
            FAADF6FF47BCE0FF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FF808080FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE808080FEFEFEFF00FF50C2E3
            9BFDFFCB9A82FEFEFEFEFEFEFEFEFEF7E6D0F7E6D029A9D423A9D723A9D723A9
            D74BB8DE34AFDAFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FFFF00FF808080808080808080808080808080808080FF00FFFF00FF52BFE1
            A4FFFFDCA887FEFEFEFEFEFEFEFEFEFEFEFEFAEBDBAED3D5F2E6CAB78183FF00
            FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
            00FFFF00FFFF00FFFEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FF25A8D6
            23A9D7DCA887FEFEFEFEFEFEFEFEFEFEFEFEFBF2E79E8891B78183B78183FF00
            FFFF00FFFF00FFFF00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF
            00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFE3B18EFEFEFEFEFEFEFEFEFEFEFEFEF8F3EFB78183DFA262DA9062FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FFFF
            00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFEDBD92FEFEFEFEFEFEFEFEFEFEFEFEF5F3F5B78183DA9C7DFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFEFEFEFEFEFEFE
            FEFEFEFEFE808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFEDBD92DCA887DCA887DCA887DCA887DCA887B78183FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080808080808080
            8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 2
          OnClick = btnAddDiretorioDestinoClick
        end
        object lblNomeArquivo: TLabel
          Left = 7
          Top = 51
          Width = 373
          Height = 13
          Caption = 'Padr'#227'o Nome Arquivo:   N'#250'mero do Processo_ Descri'#231#227'o .extens'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 67
          Width = 198
          Height = 13
          Caption = 'Ex: 0101IM-000001-18_Compovante.pdf'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtDestino: TEdit
          Left = 7
          Top = 21
          Width = 350
          Height = 21
          TabOrder = 0
          Text = '\\indaiaweb\digitalizacao_novo\TPROCESSO\'
          OnExit = edtDestinoExit
        end
      end
      object pgCadastros: TPageControl
        Left = 0
        Top = 0
        Width = 493
        Height = 233
        ActivePage = tbsLista
        Align = alClient
        TabOrder = 1
        object tbsLista: TTabSheet
          Caption = 'Lista'
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 426
            Height = 205
            Align = alClient
            DataSource = dsDiretorios
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'DIRETORIO'
                Width = 288
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_DOC'
                Width = 53
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SIGLA_DOC'
                Width = 41
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 426
            Top = 0
            Width = 59
            Height = 205
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object btn5: TSpeedButton
              Left = 11
              Top = 47
              Width = 40
              Height = 30
              Hint = 'Remover'
              Flat = True
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000666666666666666666666666666666666666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666800000000
                00F66666687777777777F666000066680000000000F66666687777777777F666
                0000666888888888886666666888888888886666000066666666666666666666
                6666666666666666000066666666666666666666666666666666666600006666
                6666666666666666666666666666666600006666666666666666666666666666
                6666666600006666666666666666666666666666666666660000666666666666
                6666666666666666666666660000666666666666666666666666666666666666
                0000}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = btn5Click
            end
            object btnAlterar: TSpeedButton
              Left = 11
              Top = 83
              Width = 40
              Height = 30
              Hint = 'Alterar'
              Flat = True
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
              OnClick = btnAlterarClick
            end
            object btnIncluir: TSpeedButton
              Left = 11
              Top = 9
              Width = 40
              Height = 30
              Hint = 'Incluir'
              Flat = True
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000010000000000000000000
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
              OnClick = btnIncluirClick
            end
          end
        end
        object tbsEdit: TTabSheet
          Caption = 'Editar'
          ImageIndex = 1
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 485
            Height = 205
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label7: TLabel
              Left = 7
              Top = 3
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 7
              Top = 45
              Width = 114
              Height = 13
              Caption = 'Diret'#243'rio de Origem:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnAddDiretorioOrigem: TSpeedButton
              Left = 359
              Top = 62
              Width = 23
              Height = 21
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FF05740BFF00FFFF00FFFF00FFFEFEFEFEFEFEFEFEFEFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FF2BACD8
                35B3DC23A9D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0574
                0B5BE78C05740BFF00FFFF00FF808080808080808080FEFEFEFEFEFEFEFEFEFE
                FEFEFEFEFEFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FF42B4DC
                AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FF05740B50D7
                7A45D26C31C14F05740BFF00FF808080FEFEFEFF00FF80808080808080808080
                8080808080FEFEFEFEFEFE808080FEFEFEFF00FFFF00FF808080FF00FF26A8D6
                A6E9F59EFFFF97FCFF99FBFF95F7FF8DF2FE83EAFA49C2E449C2E43AB8DF168C
                2330C14C169824FF00FFFF00FF808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF808080808080808080808080FEFEFE808080FEFEFEFF00FF31B1DB
                23A9D7ABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF50C81
                161AAF2C088310FF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FF00FFFF00FF47BEE1
                23A9D7AAF0FA91FAFF91F6FF90F5FF8EF4FF8DF2FE8BF1FE8CF1FF77DFF60C90
                170EA01AFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FF808080808080FEFEFEFF00FFFF00FF4CC0E2
                7BE5F423A9D79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF0A89120EA1
                1A08810FFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
                00FFFEFEFEFEFEFEFEFEFE808080FEFEFE808080FEFEFEFF00FFFF00FF4BBFE1
                93F9FD23A9D7A8E9F5A8F0FAA4F1FBA1F7FF05710A09790F0B89160A8C13067A
                0D58CDEAFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFEFEFEFEFEFEFE
                FEFE808080808080808080808080808080808080FF00FFFEFEFEFF00FF4CC0E2
                9DFEFFB7818323A9D723A9D723A9D723A9D7AFF2FB6BD7ED88F2FF6CD9F381E9
                FB80EAFA1FA8D6FF00FFFF00FF808080FEFEFE80808080808080808080808080
                8080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FF4CC0E2
                9AFCFFBA8E85FEFEFEFEFEFEF7E6D0F7E6D023A9D79FE3F4A7EDFA94E1F4A2EC
                FAADF6FF47BCE0FF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
                00FF808080FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE808080FEFEFEFF00FF50C2E3
                9BFDFFCB9A82FEFEFEFEFEFEFEFEFEF7E6D0F7E6D029A9D423A9D723A9D723A9
                D74BB8DE34AFDAFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
                00FFFF00FF808080808080808080808080808080808080FF00FFFF00FF52BFE1
                A4FFFFDCA887FEFEFEFEFEFEFEFEFEFEFEFEFAEBDBAED3D5F2E6CAB78183FF00
                FFFF00FFFF00FFFF00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF
                00FFFF00FFFF00FFFEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FF25A8D6
                23A9D7DCA887FEFEFEFEFEFEFEFEFEFEFEFEFBF2E79E8891B78183B78183FF00
                FFFF00FFFF00FFFF00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF
                00FFFF00FF808080808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFE3B18EFEFEFEFEFEFEFEFEFEFEFEFEF8F3EFB78183DFA262DA9062FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFF00FFFF00FFFF
                00FFFF00FF808080FEFEFE808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFEDBD92FEFEFEFEFEFEFEFEFEFEFEFEF5F3F5B78183DA9C7DFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080FEFEFEFEFEFEFEFEFEFE
                FEFEFEFEFE808080808080FEFEFEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFEDBD92DCA887DCA887DCA887DCA887DCA887B78183FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808080808080808080808080
                8080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              OnClick = btnAddDiretorioOrigemClick
            end
            object lblSigla: TLabel
              Left = 324
              Top = 3
              Width = 95
              Height = 13
              Caption = 'Sigla Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btnSalvar: TSpeedButton
              Left = 425
              Top = 15
              Width = 40
              Height = 30
              Hint = 'Salvar'
              Flat = True
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
              ParentShowHint = False
              ShowHint = True
              OnClick = btnSalvarClick
            end
            object btnCancelar: TSpeedButton
              Left = 426
              Top = 51
              Width = 40
              Height = 30
              Hint = 'Cancelar'
              Flat = True
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
              ParentShowHint = False
              ShowHint = True
              OnClick = btnCancelarClick
            end
            object dbcbTipoDocto: TDBLookupComboBox
              Left = 58
              Top = 18
              Width = 259
              Height = 21
              KeyField = 'CD_TIPO_DOCTO'
              ListField = 'NM_TIPO_DOCTO'
              ListSource = dsTipoDoctos
              TabOrder = 0
              OnCloseUp = dbcbTipoDoctoCloseUp
              OnExit = dbcbTipoDoctoExit
              OnKeyDown = dbcbTipoDoctoKeyDown
            end
            object edtTipoDocto: TEdit
              Left = 5
              Top = 18
              Width = 51
              Height = 21
              TabOrder = 1
              OnExit = edtTipoDoctoExit
              OnKeyDown = edtTipoDoctoKeyDown
            end
            object edtSiglaDocumento: TEdit
              Left = 323
              Top = 18
              Width = 51
              Height = 21
              TabOrder = 2
            end
            object edtDiretorioOrigem: TEdit
              Left = 7
              Top = 62
              Width = 350
              Height = 21
              TabOrder = 3
              OnExit = edtDestinoExit
            end
          end
        end
      end
    end
  end
  object dsTipoDoctos: TDataSource
    DataSet = cdsTipoDoctos
    Left = 288
    Top = 184
  end
  object tmrIntervalo: TTimer
    Enabled = False
    OnTimer = tmrIntervaloTimer
    Left = 408
    Top = 200
  end
  object cdsDiretorios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 208
    object cdsDiretoriosDIRETORIO: TStringField
      DisplayLabel = 'Diret'#243'rio'
      FieldName = 'DIRETORIO'
      Size = 200
    end
    object cdsDiretoriosTIPO_DOC: TStringField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object cdsDiretoriosSIGLA_DOC: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA_DOC'
      Size = 4
    end
  end
  object dsDiretorios: TDataSource
    DataSet = cdsDiretorios
    Left = 128
    Top = 208
  end
  object qryTipoDoctos: TFDQuery
    Connection = connection
    SQL.Strings = (
      'SELECT DISTINCT CD_TIPO_DOCTO, '
      '                NM_TIPO_DOCTO, '
      '                NM_PREFIXO_ARQ'
      'FROM TTP_DOCTO_DIGITALIZADO (NOLOCK)'
      'ORDER BY NM_TIPO_DOCTO'
      ''
      '')
    Left = 288
    Top = 120
    object qryTipoDoctosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'CD_TIPO_DOCTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTipoDoctosNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Origin = 'NM_TIPO_DOCTO'
      Size = 255
    end
    object qryTipoDoctosNM_PREFIXO_ARQ: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Origin = 'NM_PREFIXO_ARQ'
      Size = 4
    end
  end
  object connection: TFDConnection
    ConnectionName = 'Broker'
    Params.Strings = (
      'Database=Broker'
      'User_Name=sa'
      'Password=123'
      'Server=indaia10'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 80
  end
  object qryInsert: TFDQuery
    BeforeExecute = qryInsertBeforeExecute
    AfterExecute = qryInsertAfterExecute
    Connection = connection
    SQL.Strings = (
      'INSERT INTO TPROCESSO_DOCTOS'
      '( NR_PROCESSO, '
      '  CD_TIPO_DOCTO, '
      '  NM_DESCRICAO, '
      '  NM_ARQUIVO, '
      '  CD_USUARIO_CRIACAO, '
      '  DT_CRIACAO, '
      '  IN_ATIVO, '
      '  ID_TABELA'
      ')'
      'VALUES'
      '( :NR_PROCESSO, '
      '  :CD_TIPO_DOCTO, '
      '  :NM_DESCRICAO, '
      '  :NM_ARQUIVO, '
      '  '#39'0707'#39', '
      '  GETDATE(), '
      '  '#39'1'#39', '
      '  '#39'1652005462'#39
      ')'
      '')
    Left = 32
    Top = 208
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        Name = 'CD_TIPO_DOCTO'
        ParamType = ptInput
      end
      item
        Name = 'NM_DESCRICAO'
        ParamType = ptInput
      end
      item
        Name = 'NM_ARQUIVO'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'CD_TIPO_DOCTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Origin = 'NM_TIPO_DOCTO'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Origin = 'NM_PREFIXO_ARQ'
      Size = 4
    end
  end
  object qryParams: TFDQuery
    BeforeOpen = qryParamsBeforeOpen
    AfterOpen = qryParamsAfterOpen
    Connection = connection
    SQL.Strings = (
      
        'SELECT RTRIM(PATH_DIGITALIZACAO)  as PATH_DIGITALIZACAO FROM TPA' +
        'RAMETROS (NOLOCK)')
    Left = 200
    Top = 208
    object qryParamsPATH_DIGITALIZACAO: TStringField
      FieldName = 'PATH_DIGITALIZACAO'
      Origin = 'PATH_DIGITALIZACAO'
      ReadOnly = True
      Size = 1000
    end
  end
  object cdsTipoDoctos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoDoctos'
    BeforeOpen = cdsTipoDoctosBeforeOpen
    AfterOpen = cdsTipoDoctosAfterOpen
    Left = 364
    Top = 184
    object cdsTipoDoctosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Required = True
    end
    object cdsTipoDoctosNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Size = 255
    end
    object cdsTipoDoctosNM_PREFIXO_ARQ: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Size = 4
    end
  end
  object dspTipoDoctos: TDataSetProvider
    DataSet = qryTipoDoctos
    Left = 364
    Top = 120
  end
end

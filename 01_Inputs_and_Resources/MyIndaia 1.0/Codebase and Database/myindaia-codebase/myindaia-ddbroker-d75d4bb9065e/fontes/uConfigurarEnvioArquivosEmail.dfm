object frmConfigurarEnvioArquivosEmail: TfrmConfigurarEnvioArquivosEmail
  Left = 333
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o -  Envio de Arquivos por E-mail'
  ClientHeight = 541
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 541
    Align = alClient
    TabOrder = 0
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 594
      Height = 38
      Align = alTop
      TabOrder = 0
      object btn_excluir: TSpeedButton
        Left = 96
        Top = 4
        Width = 30
        Height = 30
        Hint = 'Excluir'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_excluirClick
      end
      object btn_cancelar: TSpeedButton
        Left = 66
        Top = 4
        Width = 30
        Height = 30
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
        OnClick = btn_cancelarClick
      end
      object btn_salvar: TSpeedButton
        Left = 35
        Top = 4
        Width = 29
        Height = 30
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
        OnClick = btn_salvarClick
      end
      object btn_incluir: TSpeedButton
        Left = 4
        Top = 4
        Width = 30
        Height = 30
        Hint = 'Incluir'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_incluirClick
      end
    end
    object pgcConsultaCadastra: TPageControl
      Left = 1
      Top = 39
      Width = 594
      Height = 501
      ActivePage = tsConsulta
      Align = alClient
      TabOrder = 1
      OnChange = pgcConsultaCadastraChange
      object tsConsulta: TTabSheet
        Caption = 'Consulta'
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 586
          Height = 51
          Align = alTop
          TabOrder = 0
          object lbl16: TLabel
            Left = 14
            Top = 7
            Width = 37
            Height = 13
            Caption = 'Produto'
          end
          object lbl15: TLabel
            Left = 231
            Top = 6
            Width = 29
            Height = 13
            Caption = 'Grupo'
          end
          object cbProduto: TDBLookupComboBox
            Left = 11
            Top = 22
            Width = 198
            Height = 21
            KeyField = 'CD_PRODUTO'
            ListField = 'NM_PRODUTO'
            ListSource = datm_ConfigEnvioEmail.dsProduto
            TabOrder = 0
            OnKeyDown = cbProdutoKeyDown
          end
          object cbGrupo: TDBLookupComboBox
            Left = 230
            Top = 22
            Width = 271
            Height = 21
            KeyField = 'CD_GRUPO'
            ListField = 'NM_GRUPO'
            ListSource = datm_ConfigEnvioEmail.dsGrupo
            TabOrder = 1
            OnKeyDown = cbGrupoKeyDown
          end
        end
        object dbgLista: TDBGrid
          Left = 0
          Top = 51
          Width = 586
          Height = 422
          Align = alClient
          DataSource = datm_ConfigEnvioEmail.dsListaGrupos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = dbgListaTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_CONFIG_ENVIO_EMAIL'
              Title.Caption = 'C'#243'digo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_PRODUTO'
              Title.Caption = 'Cod. Produto'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_PRODUTO'
              Title.Caption = 'Produto'
              Width = 143
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_GRUPO'
              Title.Caption = 'Cod. Grupo'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_GRUPO'
              Title.Caption = 'Grupo'
              Width = 233
              Visible = True
            end>
        end
      end
      object tsCadastro: TTabSheet
        Caption = 'Configura'#231#227'o Email'
        ImageIndex = 1
        object pgcGrupoEmpresa: TPageControl
          Left = 0
          Top = 72
          Width = 586
          Height = 401
          ActivePage = tsEmpresa
          Align = alClient
          TabOrder = 1
          OnChange = pgcGrupoEmpresaChange
          OnEnter = pgcGrupoEmpresaEnter
          object tsGrupo: TTabSheet
            Caption = 'Config. Grupo'
            object pgcDadosGrupo: TPageControl
              Left = 0
              Top = 0
              Width = 578
              Height = 373
              ActivePage = tsArquivos
              Align = alClient
              TabOrder = 0
              OnChange = pgcDadosGrupoChange
              object tsArquivos: TTabSheet
                Caption = 'Arquivos'
                ImageIndex = 1
                object dbgArquivoGrupo: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 570
                  Height = 345
                  Align = alClient
                  DataSource = datm_ConfigEnvioEmail.dsConfigArquivo
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnKeyDown = dbgArquivoGrupoKeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'CD_ARQUIVO'
                      Title.Caption = 'Cod. Arquivo'
                      Width = 78
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NM_ARQUIVO'
                      Title.Caption = 'Tipo de Arquivo'
                      Width = 373
                      Visible = True
                    end>
                end
              end
              object tsEmailConfig: TTabSheet
                Caption = 'Email - Configura'#231#227'o'
                ImageIndex = 2
                object lbl6: TLabel
                  Left = 12
                  Top = 101
                  Width = 38
                  Height = 13
                  Caption = 'Assunto'
                end
                object lbl7: TLabel
                  Left = 13
                  Top = 146
                  Width = 74
                  Height = 13
                  Caption = 'Corpo do Email '
                end
                object lbl8: TLabel
                  Left = 12
                  Top = 14
                  Width = 56
                  Height = 13
                  Caption = 'Destinatario'
                end
                object Label3: TLabel
                  Left = 12
                  Top = 59
                  Width = 27
                  Height = 13
                  Caption = 'C'#243'pia'
                end
                object dbmmoNM_CORPO: TDBMemo
                  Left = 12
                  Top = 162
                  Width = 445
                  Height = 89
                  DataField = 'NM_CORPO'
                  DataSource = datm_ConfigEnvioEmail.dsConfigArquivo
                  TabOrder = 0
                end
                object dbedtNM_ASSUNTO: TDBEdit
                  Left = 12
                  Top = 117
                  Width = 445
                  Height = 21
                  DataField = 'NM_ASSUNTO'
                  DataSource = datm_ConfigEnvioEmail.dsConfigArquivo
                  TabOrder = 1
                end
                object dbedtNM_DESTINATARIO: TDBEdit
                  Left = 12
                  Top = 30
                  Width = 445
                  Height = 21
                  DataField = 'NM_DESTINATARIO'
                  DataSource = datm_ConfigEnvioEmail.dsConfigArquivo
                  TabOrder = 2
                end
                object dbedtNM_COPIA: TDBEdit
                  Left = 12
                  Top = 75
                  Width = 445
                  Height = 21
                  DataField = 'NM_COPIA'
                  DataSource = datm_ConfigEnvioEmail.dsConfigArquivo
                  TabOrder = 3
                end
              end
              object tsMudarNomeArquivo: TTabSheet
                Caption = 'Mudar Nome do Arquivo - Por Sigla'
                ImageIndex = 1
                object dbgArquivo: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 570
                  Height = 345
                  Align = alClient
                  DataSource = datm_ConfigEnvioEmail.dsNomeArquivo
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnKeyDown = dbgArquivoKeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'NM_SIGLA'
                      Title.Caption = 'Sigla'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NM_NOVO_NOME_ARQUIVO'
                      PickList.Strings = (
                        '<NR_PROCESSO>'
                        '<SENIOR_KEY>'
                        '<SENIOR_KEY_ANO>')
                      Title.Caption = 'Novo Nome'
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsEmpresa: TTabSheet
            Caption = 'Config. Empresas'
            ImageIndex = 1
            object pgcDadosEmpresa: TPageControl
              Left = 0
              Top = 38
              Width = 578
              Height = 335
              ActivePage = tsListaEmpresa
              Align = alClient
              TabOrder = 0
              OnChange = pgcDadosEmpresaChange
              object tsListaEmpresa: TTabSheet
                Caption = 'Lista Empresas'
                object pnl5: TPanel
                  Left = 0
                  Top = 0
                  Width = 570
                  Height = 50
                  Align = alTop
                  TabOrder = 0
                  object lbl17: TLabel
                    Left = 8
                    Top = 6
                    Width = 41
                    Height = 13
                    Caption = 'Empresa'
                  end
                  object cbEmpresaPesquisa: TDBLookupComboBox
                    Left = 8
                    Top = 22
                    Width = 289
                    Height = 21
                    KeyField = 'CD_EMPRESA'
                    ListField = 'NM_EMPRESA'
                    ListSource = datm_ConfigEnvioEmail.dsEmpresa
                    TabOrder = 0
                    OnKeyDown = cbEmpresaPesquisaKeyDown
                  end
                end
                object dbgListaEmpresa: TDBGrid
                  Left = 0
                  Top = 50
                  Width = 570
                  Height = 257
                  Align = alClient
                  DataSource = datm_ConfigEnvioEmail.dsListaEmpresa
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnTitleClick = dbgListaEmpresaTitleClick
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'CD_EMPRESA'
                      Title.Caption = 'Cod. Empresa'
                      Width = 76
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NM_EMPRESA'
                      Title.Caption = 'Empresa'
                      Width = 427
                      Visible = True
                    end>
                end
              end
              object tsConfigEmpresa: TTabSheet
                Caption = 'Config.'
                ImageIndex = 1
                object pgcConfigEmpresa: TPageControl
                  Left = 0
                  Top = 50
                  Width = 570
                  Height = 257
                  ActivePage = tsArquivosEmpresa
                  Align = alClient
                  TabOrder = 1
                  OnChange = pgcConfigEmpresaChange
                  OnEnter = pgcConfigEmpresaEnter
                  object tsArquivosEmpresa: TTabSheet
                    Caption = 'Arquivos'
                    ImageIndex = 1
                    object dbgArquivosEmpresa: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 562
                      Height = 229
                      Align = alClient
                      DataSource = datm_ConfigEnvioEmail.dsConfigArquivoEmpresa
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'MS Sans Serif'
                      TitleFont.Style = []
                      OnKeyDown = dbgArquivosEmpresaKeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'CD_ARQUIVO'
                          Title.Caption = 'Cod. Arquivo'
                          Width = 75
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NM_ARQUIVO'
                          Title.Caption = 'Arquivo'
                          Visible = True
                        end>
                    end
                  end
                  object tsEmailEmpresa: TTabSheet
                    Caption = 'Email - Configura'#231#227'o'
                    ImageIndex = 2
                    object lbl9: TLabel
                      Left = 12
                      Top = 90
                      Width = 38
                      Height = 13
                      Caption = 'Assunto'
                    end
                    object lbl10: TLabel
                      Left = 14
                      Top = 131
                      Width = 74
                      Height = 13
                      Caption = 'Corpo do Email '
                    end
                    object lbl12: TLabel
                      Left = 12
                      Top = 6
                      Width = 56
                      Height = 13
                      Caption = 'Destinatario'
                    end
                    object Label4: TLabel
                      Left = 12
                      Top = 49
                      Width = 27
                      Height = 13
                      Caption = 'C'#243'pia'
                    end
                    object dbedtNM_CORPO_EMP: TDBMemo
                      Left = 12
                      Top = 147
                      Width = 445
                      Height = 62
                      DataField = 'NM_CORPO'
                      DataSource = datm_ConfigEnvioEmail.dsConfigArquivoEmpresa
                      TabOrder = 0
                    end
                    object dbedtNM_ASSUNTO_EMP: TDBEdit
                      Left = 12
                      Top = 106
                      Width = 445
                      Height = 21
                      DataField = 'NM_ASSUNTO'
                      DataSource = datm_ConfigEnvioEmail.dsConfigArquivoEmpresa
                      TabOrder = 1
                    end
                    object dbedtNM_DESTINATARIO_EMP: TDBEdit
                      Left = 12
                      Top = 22
                      Width = 445
                      Height = 21
                      DataField = 'NM_DESTINATARIO'
                      DataSource = datm_ConfigEnvioEmail.dsConfigArquivoEmpresa
                      TabOrder = 2
                    end
                    object dbedtNM_COPIA_EMP: TDBEdit
                      Left = 12
                      Top = 65
                      Width = 445
                      Height = 21
                      DataField = 'NM_COPIA'
                      DataSource = datm_ConfigEnvioEmail.dsConfigArquivoEmpresa
                      TabOrder = 3
                    end
                  end
                  object tsMudarNomeEmpresa: TTabSheet
                    Caption = 'Mudar Nome do Arquivo - Por Sigla'
                    ImageIndex = 1
                    object dbgNomeArquivoEmpresa: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 562
                      Height = 229
                      Align = alClient
                      DataSource = datm_ConfigEnvioEmail.dsNomeArquivoEmpresa
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'MS Sans Serif'
                      TitleFont.Style = []
                      OnKeyDown = dbgNomeArquivoEmpresaKeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NM_SIGLA'
                          Title.Caption = 'Sigla'
                          Width = 51
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NM_NOVO_NOME_ARQUIVO'
                          PickList.Strings = (
                            '<NR_PROCESSO>'
                            '<SENIOR_KEY>')
                          Title.Caption = 'Mudar Para'
                          Width = 467
                          Visible = True
                        end>
                    end
                  end
                end
                object Panel1: TPanel
                  Left = 0
                  Top = 0
                  Width = 570
                  Height = 50
                  Align = alTop
                  TabOrder = 0
                  object Label1: TLabel
                    Left = 64
                    Top = 6
                    Width = 41
                    Height = 13
                    Caption = 'Empresa'
                  end
                  object cbEmpresa: TDBLookupComboBox
                    Left = 64
                    Top = 22
                    Width = 281
                    Height = 21
                    DataField = 'CD_EMPRESA'
                    DataSource = datm_ConfigEnvioEmail.dsConfigEmpresa
                    KeyField = 'CD_EMPRESA'
                    ListField = 'NM_EMPRESA'
                    ListSource = datm_ConfigEnvioEmail.dsEmpresa
                    TabOrder = 0
                  end
                  object DBEdit3: TDBEdit
                    Left = 12
                    Top = 22
                    Width = 50
                    Height = 21
                    DataField = 'CD_EMPRESA'
                    DataSource = datm_ConfigEnvioEmail.dsConfigEmpresa
                    TabOrder = 1
                  end
                end
              end
            end
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 578
              Height = 38
              Align = alTop
              TabOrder = 1
              object btnExcluirEmpresa: TSpeedButton
                Left = 96
                Top = 4
                Width = 30
                Height = 30
                Hint = 'Excluir'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
                  3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
                  33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                  33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
                  333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
                  03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
                  33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
                  0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
                  3333333337FFF7F3333333333000003333333333377777333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = btnExcluirEmpresaClick
              end
              object btnCancelarEmpresa: TSpeedButton
                Left = 66
                Top = 4
                Width = 30
                Height = 30
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
                OnClick = btnCancelarEmpresaClick
              end
              object btn_GravarEmpresa: TSpeedButton
                Left = 35
                Top = 4
                Width = 29
                Height = 30
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
                OnClick = btn_GravarEmpresaClick
              end
              object btn_IncluirEmpresa: TSpeedButton
                Left = 4
                Top = 4
                Width = 30
                Height = 30
                Hint = 'Incluir'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                  333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                  0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                  07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                  07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                  0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                  33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                  B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                  3BB33773333773333773B333333B3333333B7333333733333337}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = btn_IncluirEmpresaClick
              end
            end
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 0
          Width = 586
          Height = 72
          Align = alTop
          TabOrder = 0
          object lbl1: TLabel
            Left = 346
            Top = 31
            Width = 29
            Height = 13
            Caption = 'Grupo'
          end
          object lbl2: TLabel
            Left = 49
            Top = 32
            Width = 37
            Height = 13
            Caption = 'Produto'
          end
          object Label2: TLabel
            Left = 14
            Top = 13
            Width = 22
            Height = 13
            Caption = 'Cod.'
          end
          object cbCD_GRUPO: TDBLookupComboBox
            Left = 344
            Top = 46
            Width = 225
            Height = 21
            DataField = 'CD_GRUPO'
            DataSource = datm_ConfigEnvioEmail.dsConfig
            KeyField = 'CD_GRUPO'
            ListField = 'NM_GRUPO'
            ListSource = datm_ConfigEnvioEmail.dsGrupo
            TabOrder = 1
          end
          object cbCD_PRODUTO: TDBLookupComboBox
            Left = 50
            Top = 46
            Width = 225
            Height = 21
            DataField = 'CD_PRODUTO'
            DataSource = datm_ConfigEnvioEmail.dsConfig
            KeyField = 'CD_PRODUTO'
            ListField = 'NM_PRODUTO'
            ListSource = datm_ConfigEnvioEmail.dsProduto
            TabOrder = 0
          end
          object edtChaveMaster: TEdit
            Left = 43
            Top = 5
            Width = 73
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit1: TDBEdit
            Left = 9
            Top = 46
            Width = 37
            Height = 21
            DataField = 'CD_PRODUTO'
            DataSource = datm_ConfigEnvioEmail.dsConfig
            TabOrder = 3
          end
          object DBEdit2: TDBEdit
            Left = 304
            Top = 46
            Width = 37
            Height = 21
            DataField = 'CD_GRUPO'
            DataSource = datm_ConfigEnvioEmail.dsConfig
            TabOrder = 4
          end
        end
      end
    end
  end
end

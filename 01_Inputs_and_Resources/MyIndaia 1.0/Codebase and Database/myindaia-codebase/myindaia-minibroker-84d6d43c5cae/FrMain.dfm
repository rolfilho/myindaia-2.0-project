inherited formMain: TformMain
  Caption = 'MiniBroker'
  ClientHeight = 436
  ClientWidth = 738
  OnActivate = FormActivate
  OnShow = FormShow
  ExplicitWidth = 754
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 16
  inherited pscShortCuts: TPageScroller
    Width = 738
    ExplicitWidth = 738
    inherited pnlButtons: TPanel
      Width = 1111
      ExplicitWidth = 1111
    end
  end
  inherited pnlFooter: TPanel
    Top = 408
    Width = 738
    ExplicitTop = 408
    ExplicitWidth = 738
    object lblUsuario: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 16
      Caption = 'Usu'#225'rio :'
    end
  end
  inherited PageScroller1: TPageScroller
    Width = 738
    ExplicitWidth = 738
    inherited tbrBotoesJanelas: TToolBar
      Width = 1111
      ExplicitWidth = 1111
    end
  end
  inherited MainMenu: TMainMenu
    Left = 40
    Top = 16
    inherited Cadastro1: TMenuItem
      object Enquadramento1: TMenuItem
        Caption = 'Enquadramento'
        OnClick = Enquadramento1Click
      end
      object CadastroRegrasObservacoesAutomaticas1: TMenuItem
        Caption = 'Cadastro Regras Observa'#231#245'es Autom'#225'ticas'
        OnClick = CadastroRegrasObservacoesAutomaticas1Click
      end
      object CadastroTabelasCamposRegrasObservaesAutomticas1: TMenuItem
        Caption = 'Cadastro Tabelas / Campos - Regras Observa'#231#245'es Autom'#225'ticas   '
        OnClick = CadastroTabelasCamposRegrasObservaesAutomticas1Click
      end
      object DescriodeMercadoriaDraft: TMenuItem
        Caption = 'Descri'#231#227'o de Mercadoria Draft'
        OnClick = DescriodeMercadoriaDraftClick
      end
      object Configuraoes: TMenuItem
        Caption = 'Configura'#231#245'es'
        OnClick = ConfiguraoesClick
      end
    end
    inherited Movimentos1: TMenuItem
      object Processos1: TMenuItem
        Caption = 'Processos'
        OnClick = Processos1Click
      end
      object ProcessosDue1: TMenuItem
        Caption = 'Processos Due'
        OnClick = ProcessosDue1Click
      end
      object DraftBL: TMenuItem
        Caption = 'Draft BL'
        OnClick = DraftBLClick
      end
    end
    inherited Utilitarios1: TMenuItem
      object Configurao1: TMenuItem
        Caption = 'Configura'#231#227'o'
        object BancodeDados1: TMenuItem
          Caption = 'Banco de Dados'
          OnClick = BancodeDados1Click
        end
      end
      object SQlMonitor1: TMenuItem
        Caption = 'SQl Monitor'
        ShortCut = 16459
        OnClick = SQlMonitor1Click
      end
      object Auditoria1: TMenuItem
        Caption = 'Auditoria'
        OnClick = Auditoria1Click
      end
    end
    object WalletMenu: TMenuItem
      Caption = 'Wallet'
      object WalletCadastros1: TMenuItem
        Caption = 'Cadastros'
        object WalletCadBanco: TMenuItem
          Caption = 'Banco'
          OnClick = WalletCadBancoClick
        end
        object WalletCadCliente: TMenuItem
          Caption = 'Cliente'
          OnClick = WalletCadClienteClick
        end
        object WalletCadFavorecido: TMenuItem
          Caption = 'Favorecido'
          OnClick = WalletCadFavorecidoClick
        end
        object WalletCadFilial: TMenuItem
          Caption = 'Filial'
          OnClick = WalletCadFilialClick
        end
        object WalletCadGrupo: TMenuItem
          Caption = 'Grupo'
          OnClick = WalletCadGrupoClick
        end
        object WalletCadItem: TMenuItem
          Caption = 'Item'
          OnClick = WalletCadItemClick
        end
        object WalletCadOrganizacao: TMenuItem
          Caption = 'Organiza'#231#227'o'
          OnClick = WalletCadOrganizacaoClick
        end
        object WalletCadPais: TMenuItem
          Caption = 'Pa'#237's'
          OnClick = WalletCadPaisClick
        end
        object WalletCadProduto: TMenuItem
          Caption = 'Produto'
          OnClick = WalletCadProdutoClick
        end
        object WalletCadServico: TMenuItem
          Caption = 'Servi'#231'o'
          OnClick = WalletCadServicoClick
        end
        object WalletCadUsuario: TMenuItem
          Caption = 'Usu'#225'rio'
          OnClick = WalletCadUsuarioClick
        end
      end
    end
    object WalletProcesso: TMenuItem
      Caption = 'Wallet Processo'
      object WalletSolicitarNumerario: TMenuItem
        Caption = 'Solicitar Numer'#225'rio'
        OnClick = WalletSolicitarNumerarioClick
      end
      object WalletCriarPagamentos: TMenuItem
        Caption = 'Criar Pagamentos '
        OnClick = WalletCriarPagamentosClick
      end
      object WalletSolicitarPagamento: TMenuItem
        Caption = 'Solicitar Pagamento'
        OnClick = WalletSolicitarPagamentoClick
      end
      object WalletTransferenciaPagamento: TMenuItem
        Caption = 'Transfer'#234'ncia de Pagamento'
        OnClick = WalletTransferenciaPagamentoClick
      end
      object WalletPreFaturamento: TMenuItem
        Caption = 'Pr'#233' Faturamento'
        OnClick = WalletPreFaturamentoClick
      end
    end
  end
  inherited aevMain: TApplicationEvents
    Left = 36
    Top = 72
  end
end

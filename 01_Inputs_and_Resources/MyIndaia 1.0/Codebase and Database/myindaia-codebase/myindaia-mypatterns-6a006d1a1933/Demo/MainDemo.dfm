inherited formMainDemo: TformMainDemo
  Caption = 'MyPatterns Demo'
  ClientHeight = 492
  ClientWidth = 764
  OnShow = FormShow
  ExplicitWidth = 780
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited pscShortCuts: TPageScroller
    Width = 764
    ExplicitWidth = 764
  end
  inherited pnlFooter: TPanel
    Top = 464
    Width = 764
    ExplicitTop = 464
    ExplicitWidth = 764
  end
  inherited PageScroller1: TPageScroller
    Width = 764
    ExplicitWidth = 764
    inherited tbrBotoesJanelas: TToolBar
      Width = 764
      ExplicitWidth = 764
    end
  end
  inherited MainMenu: TMainMenu
    inherited Cadastro1: TMenuItem
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
    end
    inherited Movimentos1: TMenuItem
      object NotasFiscais1: TMenuItem
        Caption = 'Notas Fiscais'
        Visible = False
        OnClick = NotasFiscais1Click
      end
    end
    inherited Utilitarios1: TMenuItem
      object CriarBanco1: TMenuItem
        Caption = 'Criar Banco'
        OnClick = CriarBanco1Click
      end
      object DestruirBanco1: TMenuItem
        Caption = 'Destruir Banco'
        OnClick = DestruirBanco1Click
      end
      object Auditoria1: TMenuItem
        Caption = 'Auditoria'
        OnClick = Auditoria1Click
      end
    end
  end
end

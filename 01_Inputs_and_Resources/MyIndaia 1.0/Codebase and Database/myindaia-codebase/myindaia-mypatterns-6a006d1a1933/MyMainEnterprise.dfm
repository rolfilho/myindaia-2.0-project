inherited formMyMainEnterprise: TformMyMainEnterprise
  Caption = 'Main Enterprise'
  ClientHeight = 565
  ClientWidth = 818
  ExplicitWidth = 834
  ExplicitHeight = 623
  PixelsPerInch = 96
  TextHeight = 16
  inherited pscShortCuts: TPageScroller
    Width = 818
    ExplicitWidth = 385
  end
  inherited pnlFooter: TPanel
    Top = 537
    Width = 818
    ExplicitTop = 181
    ExplicitWidth = 385
  end
  inherited PageScroller1: TPageScroller
    Width = 818
    ExplicitWidth = 385
    inherited tbrBotoesJanelas: TToolBar
      Width = 818
      ExplicitWidth = 818
    end
  end
  inherited aevMain: TApplicationEvents
    OnException = nil
    OnMessage = nil
  end
end

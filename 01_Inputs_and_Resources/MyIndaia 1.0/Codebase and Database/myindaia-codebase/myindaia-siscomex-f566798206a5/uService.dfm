object IntegracaoSiscomex: TIntegracaoSiscomex
  OldCreateOrder = False
  DisplayName = 'Integracao Siscomex'
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end

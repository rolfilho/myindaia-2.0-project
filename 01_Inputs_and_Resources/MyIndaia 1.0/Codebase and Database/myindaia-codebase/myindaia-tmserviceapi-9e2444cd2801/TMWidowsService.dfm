object ServiceTMApi: TServiceTMApi
  OldCreateOrder = False
  OnCreate = ServiceCreate
  OnDestroy = ServiceDestroy
  DisplayName = 'TM Api Service'
  AfterInstall = ServiceAfterInstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 380
  Width = 446
end

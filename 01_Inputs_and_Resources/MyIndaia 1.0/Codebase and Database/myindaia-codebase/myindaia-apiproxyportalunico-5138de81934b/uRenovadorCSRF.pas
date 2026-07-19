unit uRenovadorCSRF;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, System.DateUtils,
  uAutenticacao, uLog;

type
  TRenovadorCSRFThread = class(TThread)
  private
    FIntervaloMs: Cardinal;
    FDespachantesIniciais: TArray<string>;
    FTentativasPorDesp: TDictionary<string, Integer>;
    FDataContagem: TDate;
    FTentativasPorDespachante: TDictionary<string, Integer>;
//    procedure ExecutarVerificacao;
//    procedure ResetarContagemSeMudouODia;
//    function  PodeTentar(const Desp: string): Boolean;
//    procedure RegistrarFalha(const Desp: string);
//    procedure RegistrarSucesso(const Desp: string);
  protected
//    procedure Execute; override;
  public
//    constructor Create; reintroduce;
//    procedure DefinirDespachantesIniciais(const Lista: TArray<string>);
//    destructor Destroy; override;
//    property IntervaloMs: Cardinal read FIntervaloMs write FIntervaloMs; // default: 60000
  end;

implementation

//const
//  RENEW_THRESHOLD_MIN = 30; // renovar quando faltar < 30 minutos
//  JANELA_INICIO_HORA  = 19; // 19:00
//  JANELA_FIM_HORA     = 7;  // 07:00 (do dia seguinte)
//  LIMITE_TENTATIVAS_DIA = 20; // NOVO: limite diário por despachante
//  LIMITE_TENTATIVAS_AUTO = 20;

{ TRenovadorCSRFThread }


//constructor TRenovadorCSRFThread.Create;
//begin
//  inherited Create(True); // start suspended
//  FreeOnTerminate := False;
//  FIntervaloMs := 60000; // 1 minuto
//
//  FTentativasPorDesp := TDictionary<string, Integer>.Create; // NOVO
//  FDataContagem := Date;
//end;

//destructor TRenovadorCSRFThread.Destroy;
//begin
//  FTentativasPorDesp.Free; // NOVO
//  inherited;
//end;

//function EstaDentroDaJanela(const DT: TDateTime): Boolean;
//var
//  H: Word;
//begin
//  H := HourOf(DT); // precisa de System.DateUtils no uses
//  // Janela cruza meia-noite: 19..23 OR 0..6
//  Result := (H >= JANELA_INICIO_HORA) or (H < JANELA_FIM_HORA);
//
//end;

//procedure TRenovadorCSRFThread.Execute;
//begin
//
//  // 1ª verificação imediata, sem esperar 1 min
//  try
//    ExecutarVerificacao;
//  except
//    on E: Exception do
//      uLog.LogError('Execute - renovar-ex', Format('ex = %s | msg = %s', [E.ClassName, uLog.Truncar(E.Message, 200)]));
//  end;
//
//  // Loop normal, a cada 1 minuto
//  while not Terminated do
//  begin
//    try
//      ExecutarVerificacao;
//    except
//      on E: Exception do
//        uLog.LogError('Execute - renovar-ex', Format('ex = %s | msg = %s', [E.ClassName, uLog.Truncar(E.Message, 200)]));
//    end;
//
//    // espera 1 minuto (com checagem leve de Terminated)
//    Sleep(FIntervaloMs);
//  end;
//end;

//procedure TRenovadorCSRFThread.ResetarContagemSeMudouODia;
//begin
//  if Date <> FDataContagem then
//  begin
//    FTentativasPorDesp.Clear;
//    FDataContagem := Date;
//    uLog.LogInfo('ResetarContagemSeMudouODia - renovar-reset', ' novoDia = ' + DateToStr(FDataContagem));
//  end;
//end;

//function TRenovadorCSRFThread.PodeTentar(const Desp: string): Boolean;
//var
//  C: Integer;
//begin
//  if not FTentativasPorDesp.TryGetValue(Desp, C) then
//    C := 0;
//
//  Result := (C < LIMITE_TENTATIVAS_DIA);
//  if not Result then
//    uLog.LogWarn('PodeTentar - renovar-skip-limite',
//      Format('desp = %s | max = %d | data = %s', [Desp, LIMITE_TENTATIVAS_DIA, DateToStr(FDataContagem)]));
//end;

//procedure TRenovadorCSRFThread.RegistrarFalha(const Desp: string);
//var
//  C: Integer;
//begin
//  if not FTentativasPorDesp.TryGetValue(Desp, C) then
//    C := 0;
//  Inc(C);
//  FTentativasPorDesp.AddOrSetValue(Desp, C);
//  uLog.LogWarn('RegistrarFalha - renovar-falha-contagem',
//    Format('desp = %s | tentativas = %d/%d', [Desp, C, LIMITE_TENTATIVAS_DIA]));
//end;

//procedure TRenovadorCSRFThread.RegistrarSucesso(const Desp: string);
//begin
//  // zera contagem após sucesso
//  if FTentativasPorDesp.ContainsKey(Desp) then
//    FTentativasPorDesp.Remove(Desp);
//  uLog.LogInfo('RegistrarSucesso - renovar-ok-contagem', 'desp = ' + Desp);
//end;


//procedure TRenovadorCSRFThread.DefinirDespachantesIniciais(const Lista: TArray<string>);
//begin
//  FDespachantesIniciais := Lista;
//end;

//procedure TRenovadorCSRFThread.ExecutarVerificacao;
//var
//  Desps: TArray<string>;
//  D: string;
//  Cred: TCredenciaisSessao;
//  Agora: TDateTime;
//  FaltamMin: Integer;
//  Erro: string;
//begin
//
//  Agora := Now;
//
//  if EstaDentroDaJanela(Agora) then
//  begin
//    uLog.LogDebug('ExecutarVerificacao - renovar-skip', Format('hora = %s', [FormatDateTime('hh:nn', Agora)]));
//    Exit;
//  end;
//
//  Desps := ListarDespachantesEmCache;
//
//  if Length(Desps) = 0 then
//  begin
//    // Sem cache ainda: se houver lista inicial, autentica agora
//    if Length(FDespachantesIniciais) > 0 then
//    begin
//      for D in FDespachantesIniciais do
//      begin
//        if Trim(D) = '' then Continue;
//        uLog.LogInfo('ExecutarVerificacao - renovar-boot', 'desp = ' + D);
//        if not ReautenticarDespachante(D, Erro) then
//          uLog.LogError('ExecutarVerificacao - renovar-boot-falha', Format('desp = %s | msg = %s', [D, uLog.Truncar(Erro, 300)]));
//      end;
//    end;
//    Exit; // primeira rodada encerra aqui se não havia cache
//  end;
//
//  Agora := Now;
//
//  for D in Desps do
//  begin
//    if TentarObterCredenciaisSemInvalidar(D, Cred) and (Cred.ExpiraEm > 0) then
//    begin
//      if uAutenticacao.EstaAutoRenovacaoBloqueada(D) then
//      begin
//        uLog.LogDebug('renovar-skip-bloqueado', 'desp=' + D);
//        Continue;
//      end;
//
//      FaltamMin := MinutesBetween(Cred.ExpiraEm, Agora);
//      if FaltamMin <= RENEW_THRESHOLD_MIN then
//      begin
//        uLog.LogInfo('ExecutarVerificacao - renovar-disparado', Format('desp = %s | faltamMin=%d', [D, FaltamMin]));
//        if not ReautenticarDespachante(D, Erro) then
//        begin
//          // cooldown 60s não consome falha
//          if uAutenticacao.EhErroCooldown60s(Erro) then
//          begin
//            uLog.LogWarn('renovar-cooldown-60s', Format('desp=%s|msg=%s', [D, uLog.Truncar(Erro, 300)]));
//            // não conta falha
//          end
//          else
//          begin
//            uAutenticacao.RegistrarFalhaAutoRenovacao(D);
//            uLog.LogError('renovar-falha', Format('desp=%s|msg=%s', [D, uLog.Truncar(Erro, 300)]));
//          end;
//        end
//        else
//        begin
//          uAutenticacao.RegistrarSucessoAutoRenovacao(D);
//          uLog.LogInfo('renovar-ok', 'desp=' + D);
//        end;
//
//      end;
//    end;
//  end;
//end;

end.


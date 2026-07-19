unit uRobos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, AdvOfficePager, ExtCtrls, cxTextEdit,
  cxTimeEdit, DBTables, StdCtrls, cxButtonEdit, ComCtrls, Buttons, DateUtils,
  ScktComp;

type
  TfrmRobos = class(TForm)
    qryRobos: TQuery;
    qryRobosCD_ROBO: TAutoIncField;
    qryRobosNM_ROBO: TStringField;
    qryRobosDT_REINICIO: TDateTimeField;
    qryRobosCD_USUARIO: TStringField;
    qryRobosNR_INTERVALO: TIntegerField;
    qryRobosNM_SERVIDOR: TStringField;
    dsRobos: TDataSource;
    qryUsuarios: TQuery;
    qryUsuariosCD_USUARIO: TStringField;
    qryUsuariosNM_USUARIO: TStringField;
    qryRobosNM_USUARIO: TStringField;
    cxStyleRepository1: TcxStyleRepository;
    cxsHeader: TcxStyle;
    qryRobosIN_REINICIAR: TStringField;
    dsHistorico: TDataSource;
    qryHistorico: TQuery;
    qryHistoricoCD_ROBO: TIntegerField;
    qryHistoricoDT_REINICIO: TDateTimeField;
    qryHistoricoCD_USUARIO: TStringField;
    qryHistoricoNM_USUARIO: TStringField;
    pgcRobos: TPageControl;
    tbsRobos: TTabSheet;
    tbsHistorico: TTabSheet;
    cxgHistorico: TcxGrid;
    cxgdbtvHistorico: TcxGridDBTableView;
    cxgdbtvHistoricoDT_REINICIO: TcxGridDBColumn;
    cxgdbtvHistoricoNM_USUARIO: TcxGridDBColumn;
    cxglHistorico: TcxGridLevel;
    cxgRobos: TcxGrid;
    cxgdbtvRobos: TcxGridDBTableView;
    cxgdbtvRobosNM_ROBO: TcxGridDBColumn;
    cxgdbtvRobosDT_REINICIO: TcxGridDBColumn;
    cxgdbtvRobosNM_USUARIO: TcxGridDBColumn;
    cxglRobos: TcxGridLevel;
    cxgdbtvRobosOpcoes: TcxGridDBColumn;
    qryRobosCD_PRODUTO: TStringField;
    qryHora: TQuery;
    updRobos: TUpdateSQL;
    qryHoraHR_ROBO: TDateTimeField;
    qryHoraHR_SERVIDOR: TDateTimeField;
    qryHoraIN_REINICIAR: TStringField;
    ClientSocket1: TClientSocket;
    pnlBotoes: TPanel;
    btnSair: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcRobosChange(Sender: TObject);
    procedure cxgdbtvRobosOpcoesPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    FPodeModificar, FPodeIncluir, FPodeExcluir: Boolean;
  public
    { Public declarations }
  end;

var
  frmRobos: TfrmRobos;

implementation

uses
  PGGP017, GSMLIB, Funcoes;

{$R *.dfm}

procedure TfrmRobos.FormCreate(Sender: TObject);
begin
  pgcRobos.ActivePage := tbsRobos;
  FPodeModificar := False;
  FPodeIncluir := False;
  FPodeExcluir := False;
  AtribuiDireitos(FPodeModificar, FPodeIncluir, FPodeExcluir);
  if qryRobos.Active then
    qryRobos.Close;
  qryRobos.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  qryRobos.Open;
end;

procedure TfrmRobos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRobos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRobos.pgcRobosChange(Sender: TObject);
begin
  if qryHistorico.Active <> (pgcRobos.ActivePage = tbsHistorico) then
    qryHistorico.Active := (pgcRobos.ActivePage = tbsHistorico);
end;

procedure TfrmRobos.cxgdbtvRobosOpcoesPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  HoraRobo: TDateTime;

  procedure Reiniciar(AHora: TDateTime);
  var
    AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
  begin
    qryRobos.Edit;
    DecodeDateTime(AHora, AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
    AHora := EncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, 0, 0);
    qryRobosDT_REINICIO.AsDateTime :=  AHora;
    qryRobosIN_REINICIAR.AsString  := '1';
    qryRobosCD_USUARIO.AsString    := str_cd_usuario;
    qryRobos.Post;
    qryRobos.ApplyUpdates; 
  end;

  procedure EnviaReinicio;
  begin
    try
      if ClientSocket1.Active then
        ClientSocket1.Close;
      ClientSocket1.Host := Trim(qryRobosNM_SERVIDOR.AsString);
      //ClientSocket1.Host := 'localhost';
      ClientSocket1.Open;
    except
    end;
  end;
begin
  if not FPodeModificar then
    MessageDlg('Você não tem permissão para efetuar esta operação.', mtInformation, [mbOk], 0)
  else
  begin
    if qryHora.Active then
      qryHora.Close;
    qryHora.ParamByName('CD_ROBO').AsInteger := qryRobosCD_ROBO.AsInteger;
    qryHora.Open;
    if qryHoraIN_REINICIAR.AsString = '1' then
      MessageDlg('O Robô já está agendado para reiniciar as ' + FormatDateTime('hh:nn', qryHoraHR_ROBO.AsDateTime), mtInformation, [mbOk], 0)
    else
    begin
      // Reiniciar
      try
        if MinutesBetween(qryHoraHR_SERVIDOR.AsDateTime, qryHoraHR_ROBO.AsDateTime) >= qryRobosNR_INTERVALO.AsInteger then
        begin
          Reiniciar(qryHoraHR_SERVIDOR.AsDateTime);
          EnviaReinicio;
        end
        else if MessageDlg('Ainda não completou ' + qryRobosNR_INTERVALO.AsString + ' minutos que o Robô foi reiniciado.'#13'Deseja agendar o reinício?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          Reiniciar(IncMinute(qryHoraHR_ROBO.AsDateTime, qryRobosNR_INTERVALO.AsInteger));
      finally
        qryHora.Close;
      end;
    end;
  end;
end;

procedure TfrmRobos.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Socket.SendText('RESTART');
  ClientSocket1.Close;
end;

procedure TfrmRobos.ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  Msg: String;
begin
  ErrorCode := 0;
  Msg := '';
  case ErrorEvent of
    eeGeneral: ;
    eeSend: Msg := 'Erro enviando mensagem de reinício para ' + ClientSocket1.Host;
    eeReceive: ;
    eeConnect: Msg := 'Erro se conectando a ' + ClientSocket1.Host;
    eeDisconnect: ;
    eeAccept: ;
    eeLookup: ;
  end;
  if Msg <> '' then
    EnviaEmail('[myIndaiá Local] - Reinício de Robôs', Msg + '<br>Verifique se o myReiniciaRobos está executando para que o Robô solicitado seja reiniciado.',
       'michel.marques@myindaia.com.br');
end;

end.

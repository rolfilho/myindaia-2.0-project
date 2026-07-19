unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uMySFTPClient, libssh2_sftp, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type

  TLogCallBack = procedure of object;


  TConfig = record
    DraftAmbiente: string;
    DraftEndFtpProducao: string;
    DraftEndFtpHomologacao: string;
    DraftUsuarioFtpProducao: string;
    DraftUsuarioFtpHomologacao: string;
    DraftSenhaFtpProducao: string;
    DraftSenhaFtpHomologacao: string;
  end;

  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    btnPlayPause: TBitBtn;
    lblTimer: TLabel;
    XMLDocument1: TXMLDocument;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Timer1: TTimer;
    btnExecutar: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FUltimaExecucao: TDateTime;
    SFTP: TSFTPClient;
    intervalo: integer;
    FTempoRestante: TLargeInteger;
    ArquivosInttra: string;
    ArquivosInttraRetorno: string;
    ArquivosInttraRetornoCopiados: string;
    ArquivosInttraRetornoLidosRenomeados: string;
    ArquivosInttraRetornoContrlx: string;

    procedure BuscarInttra;
    function ConectarSFTP: Boolean;
    procedure CarregarConfiguracoes;
    function LerArquivoRetornoAPERAK(Caminho, NomeArquivo: String;
      var NumeroProcesso: String): Boolean;
    function LerArquivoRetornoCONTRLX(Caminho, NomeArquivo: String;
      var NumeroProcesso: String): Boolean;
    function LerConfiguracao(const Chave: string): string;
    procedure Logar;
    procedure DeletaArquivos(Path, TipoArquivo: String; MaxDias: Integer);
    procedure VerificaHoraDeleteArquivos;
    procedure TesteLeituraArquivo;
    procedure BuscarInttraPastaLocal;
    { Private declarations }
  public
    { Public declarations }
  end;


const
  {Draft}
  cfgDraftAmbiente = 'DraftAmbiente';
  cfgDraftEndFtpProducao = 'DraftEndFtpProducao';
  cfgDraftEndFtpHomologacao = 'DraftEndFtpHomologacao';
  cfgDraftUsuarioFtpProducao = 'DraftUsuarioFtpProducao';
  cfgDraftUsuarioFtpHomologacao = 'DraftUsuarioFtpHomologacao';
  cfgDraftSenhaFtpProducao = 'DraftSenhaFtpProducao';
  cfgDraftSenhaFtpHomologacao = 'DraftSenhaFtpHomologacao';

var
  Form1: TForm1;
  Config: TConfig;
  ArquivosLog: string;

implementation

{$R *.dfm}

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function FileExistsForce(aFile: String): String;
begin
  if not FileExists(aFile) then
    ForceDirectories(aFile);

  result := aFile;
end;

function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
var
  MS: TMemoryStream;
begin
  Result := (not FileExists(ANewFileName)) or (not AFailIfExists);
  if Result then
  begin
    if not DirectoryExists(ExtractFileDir(ANewFileName)) then
      ForceDirectories(ExtractFileDir(ANewFileName));

    try
      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(AExistingFileName);
        MS.SaveToFile(ANewFileName);
      finally
        FreeAndNil(MS);
      end;
      Result := FileExists(ANewFileName);
    except
      Result := False;
    end;
  end;
end;

function MoverArquivo(Origem, Destino: String): Boolean;
var
  tentativas: integer;

  Copiado: boolean;

begin

  tentativas := 0;

  result := false;

  if FileExists(Origem) then

  begin
    Copiado := CopyFile(Origem, Destino);
    while (not FileExists(Destino)) or (tentativas = 100) do
    begin
      sleep(100);
      inc(tentativas);
    end;
    if FileExists(Destino) and Copiado then
    begin
      DeleteFile(Origem);
      result := true;
    end;
  end

end;

function NomeArquivoLog: string;
begin
  Result := ArquivosLog + '\' + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
end;

procedure Log(const Msg: string; CallBack: TLogCallBack; SkipLine: Boolean = false);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    if SkipLine then
      Writeln (LogFile, '')
    else
      Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

procedure TForm1.Logar;
begin
  Memo1.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  T: TTime;
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
begin
  Dec(FTempoRestante, 1000);
  Horas := (FTempoRestante div 60000) div 60;
  if Horas > 0 then
    Minutos := (FTempoRestante div 60000) - (Horas * 60)
  else
    Minutos := (FTempoRestante div 60000);
  Segundos := (FTempoRestante div 1000) mod 60;
  lblTimer.Caption := FormatFloat('00', Horas) + ':' +
                                    FormatFloat('00', Minutos ) + ':' +
                                    FormatFloat('00', Segundos);
  T := (GetTickCount - FTempoRestante) * 1000;
  if FTempoRestante <= 0 then
  begin

      timer1.Enabled := False;
    try
      btnExecutar.Click;
      FTempoRestante := Intervalo *  60000;
    finally
      timer1.Enabled := True;
    end;
  end;

  VerificaHoraDeleteArquivos;
end;

procedure TForm1.btnExecutarClick(Sender: TObject);
begin
  if not (dayofweek(now)  in [1, 7]) and {se não for sábado e domingo}
     (Time >= StrToTime('07:00:00')) and (Time <= StrToTime('20:00:00')) then
    BuscarInttra;
//  TesteLeituraArquivo;
//  BuscarInttraPastaLocal;
end;

procedure TForm1.TesteLeituraArquivo;
var
  vNrProcesso: String;
begin

//  if LerArquivoRetornoAPERAK('C:\Users\Leandro\Desktop\TESTES XML INTTRA', 'INDAI_CONTRLX_20200226142345_16424162_1000266219.xml', vNrProcesso) then
//  begin
////    if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
////                 ArquivosInttraRetornoLidosRenomeados + '\' + vNrProcesso + '_' + FileName) then
//      Log('TESTE DE ARQUIVO APERAK: ' + vNrProcesso, Logar);
//
//  end;

  if LerArquivoRetornoCONTRLX('C:\Users\Leandro\Desktop\TESTES XML INTTRA', 'INDAI_CONTRLX_20200226142345_16424162_1000266219.xml', vNrProcesso) then
  begin
//    if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
//                 ArquivosInttraRetornoContrlx + '\' + FileName) then
     Log('TESTE DE ARQUIVO CONTRLX: ' + vNrProcesso , Logar);
  end;

end;

procedure TForm1.btnPlayPauseClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.BuscarInttra;
var
  FS: TStream;
  Path,FileName: String;
  Origem, Destino: String;
  I: Integer;
  vNrProcesso: String;
begin

  FDQuery1.Close;
  FDQuery1.Open('SELECT DT_ENVIO_DRAFT, STATUS_ENVIO, CD_ENVIO_INTTRA, * FROM TPROCESSO_DRAFT_BL '+
                'WHERE DT_ENVIO_DRAFT IS NOT NULL '+
                'AND ISNULL(CD_ENVIO_INTTRA, '''') = '''' '+
                'AND STATUS_ENVIO NOT IN (''REJEITADO'') '+
                'AND CAST(DT_ENVIO_DRAFT AS DATE) > (CAST(GETDATE()-30 AS DATE) ) ' +
                'ORDER BY DT_ENVIO_DRAFT ');

//  FDQuery1.Open('SELECT * FROM TPROCESSO_DRAFT_BL ' +
//                ' WHERE DT_ENVIO_DRAFT IS NOT NULL AND ' +
//                ' ISNULL(CD_ENVIO_INTTRA, '''') = '''' AND ' +
//                ' STATUS_ENVIO NOT IN (''REJEITADO'') AND ' +
//                ' (STATUS_ENVIO = ''ACEITO'' AND ' +
//                ' CAST(DT_ENVIO_DRAFT AS DATE) = CAST(GETDATE() AS DATE) AND ' +
//                ' CAST(DT_ENVIO_DRAFT AS TIME) > CAST(GETDATE()-''03:00'' AS TIME))');

  if FDQuery1.RecordCount = 0 then
    exit;

  if ConectarSFTP then
  begin
    try
      SFTP.List('/outbound');
      if (SFTP.DirectoryItems.Count > 1) or ((SFTP.DirectoryItems.Count = 1) and (SFTP.DirectoryItems[I].ItemType = sitFile)) then
      begin
        Log('', Logar, true);
        Log('', Logar, true);
        Log('-------------------------------------------------------------------' , Logar);
        Log('Arquivos disponíveis no SFTP: ' + IntToStr(SFTP.DirectoryItems.Count - 1) , Logar);
        Log('Inicio da importação dos arquivos.', Logar);
        Log('-------------------------------------------------------------------' , Logar);
        for I := 0 to SFTP.DirectoryItems.Count - 1 do
        begin
          Log('', Logar, true);
          if SFTP.DirectoryItems[I].ItemType = sitFile then
          begin
            FileName := SFTP.DirectoryItems[I].FileName;
            FS := TFileStream.Create(ArquivosInttraRetornoCopiados + '\' + FileName, fmCreate);
            try
              try
                SFTP.Get(SFTP.CurrentDirectory + '/' + FileName, FS, false);
                Log('Arquivo importado com sucesso: ' + FileName, Logar);
              except
                on E: ESSH2Exception do
                begin
                  if e.Message <> 'A operação foi concluída com êxito' then
                    Log('Erro: ( '+ E.Message + ' )' + #13#10 + 'ao buscar o arquivo:' + FileName + ' recebido com sucesso!', Logar);
                end;
              end;


            finally
              FS.Free;
            end;
            Sleep(2000);
            if FileExists(ArquivosInttraRetornoCopiados + '\' + FileName) then
            begin
              try
                SFTP.DeleteFile(SFTP.CurrentDirectory + '/' + FileName);
                Log('Arquivo deletado do FTP: ' + FileName, Logar);
              except
                Log('Não foi possível deletar arquivo do FTP: ' + FileName, Logar);
              end;

              if FileName.Contains('INDAI_APERAK') then
              begin
                if LerArquivoRetornoAPERAK(ArquivosInttraRetornoCopiados, FileName, vNrProcesso) then
                begin
                  if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
                               ArquivosInttraRetornoLidosRenomeados + '\' + vNrProcesso + '_' + FileName) then
                    Log('Arquivo movido para pasta "LidosRenomeados": ' + vNrProcesso + '_' + FileName, Logar);

                end;
              end
              else
              begin
                if LerArquivoRetornoCONTRLX(ArquivosInttraRetornoCopiados, FileName, vNrProcesso) then
                begin
                  if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
                               ArquivosInttraRetornoContrlx + '\' + vNrProcesso + '_' + FileName) then
                   Log('Arquivo(não usado) movido para "RetornoContrlx": ' + vNrProcesso + '_' + FileName, Logar);
                end;
              end;
            end;
          end;
        end;
        Log('', Logar, true);
        Log('-------------------------------------------------------------------' , Logar);
        Log('Consulta finalizada!', Logar);
        Log('-------------------------------------------------------------------' , Logar);
      end;
    finally
      SFTP.Disconnect;
    end;
  end;
end;


procedure TForm1.BuscarInttraPastaLocal;
var
  FS: TStream;
  Path,FileName: String;
  Origem, Destino: String;
  I: Integer;
  vNrProcesso: String;



  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
  diretorio: string;

  function TemAtributo(Attr, Val: Integer): Boolean;
  begin
    Result := Attr and Val = Val;
  end;
begin

//  FDQuery1.Close;
//  FDQuery1.Open('SELECT DT_ENVIO_DRAFT, STATUS_ENVIO, CD_ENVIO_INTTRA, * FROM TPROCESSO_DRAFT_BL '+
//                'WHERE DT_ENVIO_DRAFT IS NOT NULL '+
//                'AND ISNULL(CD_ENVIO_INTTRA, '''') = '''' '+
//                'AND STATUS_ENVIO NOT IN (''REJEITADO'') '+
//                'ORDER BY DT_ENVIO_DRAFT ');
//
////  FDQuery1.Open('SELECT * FROM TPROCESSO_DRAFT_BL ' +
////                ' WHERE DT_ENVIO_DRAFT IS NOT NULL AND ' +
////                ' ISNULL(CD_ENVIO_INTTRA, '''') = '''' AND ' +
////                ' STATUS_ENVIO NOT IN (''REJEITADO'') AND ' +
////                ' (STATUS_ENVIO = ''ACEITO'' AND ' +
////                ' CAST(DT_ENVIO_DRAFT AS DATE) = CAST(GETDATE() AS DATE) AND ' +
////                ' CAST(DT_ENVIO_DRAFT AS TIME) > CAST(GETDATE()-''03:00'' AS TIME))');
//
//  if FDQuery1.RecordCount = 0 then
//    exit;


  diretorio := 'C:\Users\Leandro\Desktop\TEMP\INTRA\ARQUIVOS';

  Ret := FindFirst(diretorio+'\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      FileName := F.Name;

      if (F.Name <> '.') and (F.Name <> '..')then
      begin
        if FileName.Contains('INDAI_APERAK') then
        begin
          if LerArquivoRetornoAPERAK(diretorio, FileName, vNrProcesso) then
          begin
            if MoverArquivo(diretorio + '\' + FileName,
                         ArquivosInttraRetornoLidosRenomeados + '\' + vNrProcesso + '_' + FileName) then
              Log('Arquivo movido para pasta "LidosRenomeados": ' + vNrProcesso + '_' + FileName, Logar);

          end;
        end
        else
        begin
          if LerArquivoRetornoCONTRLX(diretorio, FileName, vNrProcesso) then
          begin
            if MoverArquivo(diretorio + '\' + FileName,
                         ArquivosInttraRetornoContrlx + '\' + vNrProcesso + '_' + FileName) then
             Log('Arquivo(não usado) movido para "RetornoContrlx": ' + vNrProcesso + '_' + FileName, Logar);
          end;
        end;
      end;


      Ret := FindNext(F);
    end;
        Log('', Logar, true);
        Log('-------------------------------------------------------------------' , Logar);
        Log('Consulta finalizada!', Logar);
        Log('-------------------------------------------------------------------' , Logar);
  finally
    FindClose(F);
  end;



//  if ConectarSFTP then
//  begin
//    try
//      SFTP.List('/outbound');
//      if (SFTP.DirectoryItems.Count > 1) or ((SFTP.DirectoryItems.Count = 1) and (SFTP.DirectoryItems[I].ItemType = sitFile)) then
//      begin
//        Log('', Logar, true);
//        Log('', Logar, true);
//        Log('-------------------------------------------------------------------' , Logar);
//        Log('Arquivos disponíveis no SFTP: ' + IntToStr(SFTP.DirectoryItems.Count - 1) , Logar);
//        Log('Inicio da importação dos arquivos.', Logar);
//        Log('-------------------------------------------------------------------' , Logar);
//        for I := 0 to SFTP.DirectoryItems.Count - 1 do
//        begin
//          Log('', Logar, true);
//          if SFTP.DirectoryItems[I].ItemType = sitFile then
//          begin
//            FileName := SFTP.DirectoryItems[I].FileName;
//            FS := TFileStream.Create(ArquivosInttraRetornoCopiados + '\' + FileName, fmCreate);
//            try
//              try
//                SFTP.Get(SFTP.CurrentDirectory + '/' + FileName, FS, false);
//                Log('Arquivo importado com sucesso: ' + FileName, Logar);
//              except
//                on E: ESSH2Exception do
//                begin
//                  if e.Message <> 'A operação foi concluída com êxito' then
//                    Log('Erro: ( '+ E.Message + ' )' + #13#10 + 'ao buscar o arquivo:' + FileName + ' recebido com sucesso!', Logar);
//                end;
//              end;
//
//
//            finally
//              FS.Free;
//            end;
//            Sleep(2000);
//            if FileExists(ArquivosInttraRetornoCopiados + '\' + FileName) then
//            begin
//              try
//                SFTP.DeleteFile(SFTP.CurrentDirectory + '/' + FileName);
//                Log('Arquivo deletado do FTP: ' + FileName, Logar);
//              except
//                Log('Não foi possível deletar arquivo do FTP: ' + FileName, Logar);
//              end;
//
//              if FileName.Contains('INDAI_APERAK') then
//              begin
//                if LerArquivoRetornoAPERAK(ArquivosInttraRetornoCopiados, FileName, vNrProcesso) then
//                begin
//                  if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
//                               ArquivosInttraRetornoLidosRenomeados + '\' + vNrProcesso + '_' + FileName) then
//                    Log('Arquivo movido para pasta "LidosRenomeados": ' + vNrProcesso + '_' + FileName, Logar);
//
//                end;
//              end
//              else
//              begin
//                if LerArquivoRetornoCONTRLX(ArquivosInttraRetornoCopiados, FileName, vNrProcesso) then
//                begin
//                  if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
//                               ArquivosInttraRetornoContrlx + '\' + vNrProcesso + '_' + FileName) then
//                   Log('Arquivo(não usado) movido para "RetornoContrlx": ' + vNrProcesso + '_' + FileName, Logar);
//                end;
//              end;
//            end;
//          end;
//        end;
//        Log('', Logar, true);
//        Log('-------------------------------------------------------------------' , Logar);
//        Log('Consulta finalizada!', Logar);
//        Log('-------------------------------------------------------------------' , Logar);
//      end;
//    finally
//      SFTP.Disconnect;
//    end;
//  end;
end;




procedure TForm1.DeletaArquivos(Path, TipoArquivo: String; MaxDias : Integer);
var
  pesquisa: TSearchRec;
  dataLimite, dataArquivo: TDateTime;
  ageArquivo : Integer;
  excluidos : integer;
begin
  dataLimite  := IncDay(now,-MaxDias);
  excluidos   := 0;

  if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
  begin
    repeat
      if (pesquisa.Attr <> faDirectory) then
      begin
        ageArquivo := FileAge(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
        if ageArquivo > -1  then
        begin
          dataArquivo := FileDateToDateTime(ageArquivo);
          if dataArquivo < dataLimite then
          begin
            log('Excluindo: ' + IncludeTrailingPathDelimiter(Path)+  pesquisa.Name
              + '  Data: ' + formatDateTime('dd/mm/yyyy', dataArquivo), logar);

            Deletefile(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
            inc(excluidos);
          end;
        end;
      end;
    until FindNext(pesquisa) <> 0;
    FindClose(pesquisa);
  end;
end;

procedure TForm1.VerificaHoraDeleteArquivos;
begin
  if (Time >= StrToTime('07:00:00')) and (Time <= StrToTime('08:00:00')) and
    (FUltimaExecucao < Date)then
  begin
    DeletaArquivos(ArquivosInttraRetornoLidosRenomeados, 'xml', 60);
    DeletaArquivos(ArquivosInttraRetornoContrlx, 'xml', 60);
    DeletaArquivos(ArquivosInttra + '\Envio\Enviados', 'xml', 60);
    DeletaArquivos(ArquivosLog, '.log', 60);

    FUltimaExecucao := Date;
  end;
end;

function TForm1.ConectarSFTP: Boolean;
begin
  result := false;
  SFTP := TSFTPClient.Create(Self);
  if Config.DraftAmbiente.Equals('P') then
  begin
    SFTP.UserName := Config.DraftUsuarioFtpProducao;
    SFTP.Password := Config.DraftSenhaFtpProducao;
    SFTP.Host := Config.DraftEndFtpProducao;
  end
  else
  begin
    SFTP.UserName := Config.DraftUsuarioFtpHomologacao;//'i0003534';
    SFTP.Password := Config.DraftSenhaFtpHomologacao;//'LS0htJiu';
    SFTP.Host := Config.DraftEndFtpHomologacao;//'ftp.cvt.inttra.com';
  end;

  SFTP.Port := 22;
  SFTP.IPVersion := IPv4;
  SFTP.AuthModes := [amPassword];

  try
    SFTP.Connect;
    result := SFTP.Connected;
  except
    on E: ESSH2Exception do
      Log('Errro ao conectar ao FTP: ' + E.Message, Logar);
  end;
end;

function TForm1.LerArquivoRetornoAPERAK(Caminho, NomeArquivo: String; var NumeroProcesso: String): Boolean;
var
  vArquivo: String;
  vXML: TXMLDocument;
  vXMLMessage: IXMLNode;
  vXMLMessageBody: IXMLNode;
  vXMLMessageProperties: IXMLNode;
  vXMLShipmentID: IXMLNode;
  vXMLReferenceInformation: IXMLNode;
  i: Integer;
  vSID, vNrProcesso, vStatus, vRefEmbarque: string;
begin
  try
    XMLDocument1.LoadFromfile(Caminho + '\' + NomeArquivo);
    vXMLMessage := XMLDocument1.ChildNodes.FindNode('Message');
    vXMLMessageBody := vXMLMessage.ChildNodes.FindNode('MessageBody');
    vXMLMessageProperties := vXMLMessageBody.ChildNodes.FindNode('MessageProperties');
    vXMLShipmentID := vXMLMessageProperties.ChildNodes.FindNode('ShipmentID');
    vXMLReferenceInformation := vXMLMessageProperties.ChildNodes.FindNode('ReferenceInformation');

    vStatus := vXMLShipmentID.ChildNodes.FindNode('ShipmentIdentifier').GetAttributeNS('Acknowledgment', '');
    vRefEmbarque := vXMLShipmentID.ChildValues['ShipmentIdentifier'];

    for i := 0 to vXMLMessageProperties.ChildNodes.Count -1 do
    begin
      if vXMLMessageProperties.ChildNodes[i].NodeName = 'ReferenceInformation' then
        if vXMLMessageProperties.ChildNodes[i].GetAttributeNS('ReferenceType', '') = 'FreightForwarderReference' then
          vNrProcesso := vXMLMessageProperties.ChildNodes[i].NodeValue;
    end;


    FDQuery1.Close;
    FDQuery1.SQL.Text := 'SELECT * FROM TPROCESSO_DRAFT_BL WHERE NR_PROCESSO = :NR_PROCESSO AND NR_AMEND = :NR_AMEND';
    FDQuery1.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    FDQuery1.ParamByName('NR_AMEND').AsInteger := 1;
    FDQuery1.Open;

    if FDQuery1.RecordCount = 1 then
    begin
      vSID := copy(NomeArquivo, 29, 9);
      FDQuery1.Edit;
      FDQuery1.FieldByName('CD_ENVIO_INTTRA').AsString := vSID;
      FDQuery1.Post;
    end;

    NumeroProcesso := vNrProcesso;

    Log('** Dados do arquivo: NrProcesso = ' + vNrProcesso + '  -  ' +
        'RefEmbarque = '+ vRefEmbarque + '  -  ' + 'SID = ' + vSID + '  -  ' + 'Status = ' + vStatus
        , Logar);

    Log('** Código de envio Inttra: '  + vSID + 'preenchido no processo: ' + vNrProcesso
        , Logar);

    result := True;
  Except
    on E: Exception do
    begin
      Log('Erro ao ler e gravar o arquivo retorno: ' + e.Message, Logar);
      result:= false;
    end;
  end;
end;

function TForm1.LerArquivoRetornoCONTRLX(Caminho, NomeArquivo: String;
  var NumeroProcesso: String): Boolean;
var
  vArquivo: String;
  vXML: TXMLDocument;
  vXMLMessage: IXMLNode;
  vXMLMessageBody: IXMLNode;
  vXMLMessageHeader: IXMLNode;
  vXMLMessageProperties: IXMLNode;
  vXMLShipmentID: IXMLNode;
  vXMLReferenceInformation: IXMLNode;
  i: Integer;
  vNrProcesso, vStatus, vRefEmbarque: string;
begin
  try
    XMLDocument1.LoadFromfile(Caminho + '\' + NomeArquivo);
    vXMLMessage := XMLDocument1.ChildNodes.FindNode('Message');
    vXMLMessageHeader := vXMLMessage.ChildNodes.FindNode('Header');
    vNrProcesso := Copy(vXMLMessageHeader.ChildValues['DocumentIdentifier'], 0, 16);

    vXMLMessageBody := vXMLMessage.ChildNodes.FindNode('MessageBody');
    vXMLMessageProperties := vXMLMessageBody.ChildNodes.FindNode('MessageProperties');
    vXMLShipmentID := vXMLMessageProperties.ChildNodes.FindNode('ShipmentID');

    vStatus := vXMLShipmentID.ChildNodes.FindNode('ShipmentIdentifier').GetAttributeNS('Acknowledgment', '');
    vRefEmbarque := vXMLShipmentID.ChildValues['ShipmentIdentifier'];

    FDQuery1.Close;
    FDQuery1.SQL.Text := 'SELECT * FROM TPROCESSO_DRAFT_BL WHERE NR_PROCESSO = :NR_PROCESSO AND NR_AMEND = :NR_AMEND';
    FDQuery1.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    FDQuery1.ParamByName('NR_AMEND').AsInteger := 1;
    FDQuery1.Open;

    if FDQuery1.RecordCount = 1 then
    begin
      if vStatus = 'Accepted' then
        vStatus := 'ACEITO'
      else
      if vStatus = 'Rejected' then
        vStatus := 'REJEITADO';

      FDQuery1.Edit;
      FDQuery1.FieldByName('STATUS_ENVIO').AsString := vStatus;
      FDQuery1.Post;
    end;

    NumeroProcesso := vNrProcesso;

    Log('** Dados do arquivo: NrProcesso = ' + vNrProcesso + '  -  ' +
        'RefEmbarque = '+ vRefEmbarque + '  -  ' +  'Status = ' + vStatus
        , Logar);

    result := True;
  Except
    on E: Exception do
    begin
      Log('Erro ao ler e gravar o arquivo retorno: ' + e.Message, Logar);
      result:= false;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  try
  FDConnection1.Connected := TRUE;
  except
    on E: Exception do
    begin
      Log('Não foi possível conectar ao banco de dados. ' + e.Message, Logar);
      Application.Terminate;
    end;
  end;


  ArquivosInttra := FileExistsForce(GetLocalPath + 'Inttra');
  ArquivosInttraRetorno := FileExistsForce(ArquivosInttra + '\Retorno');
  ArquivosInttraRetornoCopiados := FileExistsForce(ArquivosInttraRetorno + '\Copiados');
  ArquivosInttraRetornoLidosRenomeados := FileExistsForce(ArquivosInttraRetorno + '\LidosRenomeados');
  ArquivosInttraRetornoContrlx := FileExistsForce(ArquivosInttraRetorno + '\Contrlx');
  ArquivosLog := FileExistsForce(GetLocalPath + 'log');

  Log('', Logar, true);
  Log('Iniciado.', Logar);

  intervalo := 10; //min
  FTempoRestante := intervalo * 60000;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Log('', Logar, true);
  Log('Finalizado.', Logar);
end;

procedure TForm1.CarregarConfiguracoes;
begin
  Config.DraftAmbiente := LerConfiguracao(cfgDraftAmbiente);

  Config.DraftEndFtpProducao := LerConfiguracao(cfgDraftEndFtpProducao);
  Config.DraftEndFtpHomologacao := LerConfiguracao(cfgDraftEndFtpHomologacao);
  Config.DraftUsuarioFtpProducao := LerConfiguracao(cfgDraftUsuarioFtpProducao);
  Config.DraftUsuarioFtpHomologacao := LerConfiguracao(cfgDraftUsuarioFtpHomologacao);
  Config.DraftSenhaFtpProducao := LerConfiguracao(cfgDraftSenhaFtpProducao);
  Config.DraftSenhaFtpHomologacao := LerConfiguracao(cfgDraftSenhaFtpHomologacao);
end;

function TForm1.LerConfiguracao(const Chave: string): string;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT VALOR FROM CONFIGURACAO_GERAL WHERE CHAVE = :CHAVE';
  FDQuery1.ParamByName('CHAVE').AsString := Chave;
  FDQuery1.Open;
  if not FDQuery1.IsEmpty then
    Result := FDQuery1.Fields[0].AsString;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

end.


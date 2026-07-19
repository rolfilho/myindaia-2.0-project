unit uFuncoesEspecificasClientes;

interface

uses
  System.Classes, Xml.XMLDoc, Xml.XMLIntf, System.SysUtils, FireDAC.Comp.Client,
  uManipulacaoArquivos, dmPrincipal, uConexoesIntegracoes;

const
  {ftpPirelli}
  cfgPirelliConEmb_EndFtp = 'PirelliConEmb_EndFtp';
  cfgPirelliConEmb_UsuarioFtp = 'PirelliConEmb_UsuarioFtp';
  cfgPirelliConEmb_SenhaFtp = 'PirelliConEmb_SenhaFtp';
  cfgPirelliConEmb_DirEnvioFtp = 'PirelliConEmb_DirEnvioFtp';
  cfgPirelliConEmb_DirLocalFtp = 'PirelliConEmb_DirLocalFtp';
  cfgPirelliConEmb_IntervaloMinutos = 'PirelliConEmb_IntervaloMinutos';
  cfgPirelliConEmb_DiasLog = 'PirelliConEmb_DiasLog';


type

  TCaminhosArquivos = Record
    Arquivos: String;
    ArquivosRetorno: String;
    ArquivosDownload: String;
    ArquivosLidos: String;
    ArquivosLidosContrlx: String;
    ArquivosLog: String;
  End;

  TRegraCliente = Class
  public
    FUltimaExecucao: TDateTime;
    FTempoRestante: Integer;
    CaminhosArquivos: TCaminhosArquivos;
    procedure VerificaHoraDeleteArquivos;
    procedure PersistirConfiguracoes;
    Constructor Create;
    Destructor Destroy; override;
  private
    function LerArquivoRetornoAPERAK(Caminho, NomeArquivo: String;
      var NumeroProcesso: String): Boolean;
    function LerArquivoRetornoCONTRLX(Caminho, NomeArquivo: String;
      var NumeroProcesso: String): Boolean;
    function ConsultaEnvioDraft: Boolean;
  End;

var
  RegraCliente: TRegraCliente;

implementation

Constructor TRegraCliente.Create;
begin
  DataModule1 := TDataModule1.Create(nil);
end;

Destructor TRegraCliente.Destroy;
begin
  FreeAndNil(DataModule1);
  inherited;
end;

function TRegraCliente.LerArquivoRetornoAPERAK(Caminho, NomeArquivo: String; var NumeroProcesso: String): Boolean;
var
  XMLDocument1: TXMLDocument;
  vArquivo: String;
  vXMLMessage: IXMLNode;
  vXMLMessageBody: IXMLNode;
  vXMLMessageProperties: IXMLNode;
  vXMLShipmentID: IXMLNode;
  vXMLReferenceInformation: IXMLNode;
  i: Integer;
  vSID, vNrProcesso, vStatus, vRefEmbarque: string;
begin

  try
    XMLDocument1 := TXMLDocument.Create(nil);
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


      DataModule1.FDQuery1.Close;
      DataModule1.FDQuery1.SQL.Text := 'SELECT * FROM TPROCESSO_DRAFT_BL WHERE NR_PROCESSO = :NR_PROCESSO AND NR_AMEND = :NR_AMEND';
      DataModule1.FDQuery1.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      DataModule1.FDQuery1.ParamByName('NR_AMEND').AsInteger := 1;
      DataModule1.FDQuery1.Open;

      if DataModule1.FDQuery1.RecordCount = 1 then
      begin
        vSID := copy(NomeArquivo, 29, 9);
        DataModule1.FDQuery1.Edit;
        DataModule1.FDQuery1.FieldByName('CD_ENVIO_INTTRA').AsString := vSID;
        DataModule1.FDQuery1.Post;
      end;

      NumeroProcesso := vNrProcesso;

//      Log('** Dados do arquivo: NrProcesso = ' + vNrProcesso + '  -  ' +
//          'RefEmbarque = '+ vRefEmbarque + '  -  ' + 'SID = ' + vSID + '  -  ' + 'Status = ' + vStatus
//          , Logar);
//
//      Log('** Código de envio Inttra: '  + vSID + 'preenchido no processo: ' + vNrProcesso
//          , Logar);

      result := True;
    Except
      on E: Exception do
      begin
//        Log('Erro ao ler e gravar o arquivo retorno: ' + e.Message, Logar);
        result:= false;
      end;
    end;
  finally
    FreeAndNil(XMLDocument1);
    FreeAndNil(DataModule1.FDQuery1);
  end;
end;

function TRegraCliente.LerArquivoRetornoCONTRLX(Caminho, NomeArquivo: String;
  var NumeroProcesso: String): Boolean;
var
  XMLDocument1: TXMLDocument;
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
    XMLDocument1 := TXMLDocument.Create(nil);
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

      DataModule1.FDQuery1.Close;
      DataModule1.FDQuery1.SQL.Text := 'SELECT * FROM TPROCESSO_DRAFT_BL WHERE NR_PROCESSO = :NR_PROCESSO AND NR_AMEND = :NR_AMEND';
      DataModule1.FDQuery1.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      DataModule1.FDQuery1.ParamByName('NR_AMEND').AsInteger := 1;
      DataModule1.FDQuery1.Open;

      if DataModule1.FDQuery1.RecordCount = 1 then
      begin
        if vStatus = 'Accepted' then
          vStatus := 'ACEITO'
        else
        if vStatus = 'Rejected' then
          vStatus := 'REJEITADO';

        DataModule1.FDQuery1.Edit;
        DataModule1.FDQuery1.FieldByName('STATUS_ENVIO').AsString := vStatus;
        DataModule1.FDQuery1.Post;
      end;

      NumeroProcesso := vNrProcesso;

//      Log('** Dados do arquivo: NrProcesso = ' + vNrProcesso + '  -  ' +
//          'RefEmbarque = '+ vRefEmbarque + '  -  ' +  'Status = ' + vStatus
//          , Logar);

      result := True;
    Except
      on E: Exception do
      begin
//        Log('Erro ao ler e gravar o arquivo retorno: ' + e.Message, Logar);
        result:= false;
      end;
    end;
  finally
    FreeAndNil(XMLDocument1);
    FreeAndNil(DataModule1.FDQuery1);
  end;
end;

function TRegraCliente.ConsultaEnvioDraft: Boolean;
begin
  DataModule1.FDQuery1.Close;
  DataModule1.FDQuery1.Open('SELECT * FROM TPROCESSO_DRAFT_BL ' +
                ' WHERE DT_ENVIO_DRAFT IS NOT NULL AND ' +
                ' ISNULL(CD_ENVIO_INTTRA, '''') = '''' AND ' +
                ' STATUS_ENVIO NOT IN (''REJEITADO'') AND ' +
                ' (STATUS_ENVIO = ''ACEITO'' AND ' +
                ' CAST(DT_ENVIO_DRAFT AS DATE) = CAST(GETDATE() AS DATE) AND ' +
                ' CAST(DT_ENVIO_DRAFT AS TIME) > CAST(GETDATE()-''03:00'' AS TIME))');

  if DataModule1.FDQuery1.RecordCount = 0 then

end;

procedure TRegraCliente.VerificaHoraDeleteArquivos;
begin
  if (Time >= StrToTime('07:00:00')) and (Time <= StrToTime('08:00:00')) and
    (FUltimaExecucao < Date)then
  begin
    DeletaArquivos(CaminhosArquivos.ArquivosLog, '.txt', 60);
    FUltimaExecucao := Date;
  end;
end;


procedure TRegraCliente.PersistirConfiguracoes;
begin
//  if Config.FecomecioModoRascunho <> ConfigOld.FecomecioModoRascunho then
//    dmdMain.EscreveConfiguracao(cfgCertOrigemFecomercioRascunho , Config.FecomecioModoRascunho.ToInteger.ToString);

//  if IntegracaoSFTP.Endereco <> IntegracaoSFTP.Endereco then
    DataModule1.EscreveConfiguracao(cfgPirelliConEmb_EndFtp, IntegracaoSFTP.Endereco);

//  if IntegracaoSFTP.Usuario <> IntegracaoSFTP.Usuario then
    DataModule1.EscreveConfiguracao(cfgPirelliConEmb_UsuarioFtp, IntegracaoSFTP.Usuario);

//  if IntegracaoSFTP.Endereco <> IntegracaoSFTP.Endereco then
    DataModule1.EscreveConfiguracao(cfgPirelliConEmb_SenhaFtp, IntegracaoSFTP.Senha);

    DataModule1.EscreveConfiguracao(cfgPirelliConEmb_DirEnvioFtp, IntegracaoSFTP.DirEnvioFTP);

    DataModule1.EscreveConfiguracao(cfgPirelliConEmb_DirLocalFtp, IntegracaoSFTP.DirLocal);


    DataModule1.EscreveConfiguracao(cfgPirelliConEmb_IntervaloMinutos, IntegracaoSFTP.IntervaloMinutos);

    DataModule1.EscreveConfiguracao(cfgPirelliConEmb_DiasLog, IntegracaoSFTP.DiasLog);


end;

end.

unit uIntegracaoDI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Xml.XMLIntf,
  Data.DB, Datasnap.DBClient, Xml.xmldom, DiLeituraXML, dmBroker, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type

  TfrmIntegracaoDI = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    lblStatus: TLabel;
    ProgressBar1: TProgressBar;
    Panel4: TPanel;
    Panel5: TPanel;
    Memo: TMemo;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CarregarXML;
    procedure CarregarDI(arquivo: String);
    procedure CarregarAdicoes(Di: TDi; Node_DI: IXMLNode);
    procedure CarregarMercadorias(adicao: Tadicao; Node_Adicao: iXMLNode);
    function GetChildValue(Node: IXMLNode; Name: String): String;
    procedure preencheMemo(aValue: String);
//    procedure LogAdd(value: String);
    procedure Logar;


    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmIntegracaoDI: TfrmIntegracaoDI;

implementation

uses
  Xml.XMLDoc, System.Generics.Collections, krUtil, ParametrosDoSistema,
  System.AnsiStrings;

{$R *.dfm}

procedure ScrollMemo(Memo: TMemo; Direction: Integer);
var
  ScrollMessage: TWMVScroll;
  I: Integer;
begin
  ScrollMessage.Msg := WM_VSCROLL;
  Memo.Lines.BeginUpdate;
  try
    for I := 0 to Memo.Lines.Count do
    begin
     ScrollMessage.ScrollCode := Direction;
     ScrollMessage.Pos := 0;
     Memo.Dispatch(ScrollMessage);
    end;
  finally
    Memo.Lines.EndUpdate;
  end;
end;

//procedure Log(const Msg: string; CallBack: TLogCallBack);
//var
//  Filename: string;
//  LogFile: TextFile;
//begin
//  Filename := NomeArquivoLog;
//  AssignFile (LogFile, Filename);
//  if FileExists (FileName) then
//    Append (LogFile)
//  else
//    Rewrite (LogFile);
//  try
//    Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
//  finally
//    CloseFile (LogFile);
//    if Assigned(CallBack) then
//      CallBack;
//  end;
//end;

procedure TfrmIntegracaoDI.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
  ScrollMemo(Memo, SB_LINEDOWN);
end;

function TfrmIntegracaoDI.GetChildValue(Node: IXMLNode; Name: String): String;
begin
  try
    if not assigned(Node) then
      result := ''
    else
    if assigned(Node.ChildNodes.FindNode(Name)) then
      result := TRIM(Node.ChildValues[Name])
    else
      result := '';
  except
    result := '';
  end;
end;

procedure TfrmIntegracaoDI.Panel4Click(Sender: TObject);
begin
  CarregarXML;
end;

procedure TfrmIntegracaoDI.Panel5Click(Sender: TObject);
var
  i: integer;
begin
    memo.Visible := true;
    memo.Height := 300;


  if not OpenDialog1.Execute then
    exit;

  try
    for i := 0 to OpenDialog1.Files.Count - 1 do
    begin

      CarregarDI(OpenDialog1.Files[i]);
      dmdBroker.ValidarTamanhoCamposImpo(Dis);
    end;
  except
    on e: exception do
      showmessage(e.message);
  end;
  showmessage('acabou');
end;

procedure TfrmIntegracaoDI.BitBtn1Click(Sender: TObject);
begin
  CarregarXML;
  ShowMessage('Importação finalizada com sucesso.');
end;

procedure TfrmIntegracaoDI.CarregarXML;
var
  i: integer;
begin

  if not OpenDialog1.Execute then
    exit;

  if OpenDialog1.Files.Count > 1 then
  begin
    Log('Carregamento dos XMLs iniciado.');
    memo.Visible := true;
    memo.Height := 300;
  end;

  ProgressBar1.Max := OpenDialog1.Files.Count;
  ProgressBar1.Min := 0;

  ProgressBar1.Visible := true;
  lblstatus.Visible := true;
  try

    for i := 0 to OpenDialog1.Files.Count - 1 do
    begin
      ProgressBar1.Position := i + 1;
      lblstatus.Caption := 'Lendo o arquivo ' + ExtractFileName(OpenDialog1.Files[i]) + ' |  ' + IntToStr(i+1) + ' de ' + IntToStr(OpenDialog1.Files.Count) + ' Arquivos.';
      log(lblstatus.Caption);
      application.ProcessMessages;
      CarregarDI(OpenDialog1.Files[i]);
      dmdBroker.GravaDi(Dis);
      CopyFile(OpenDialog1.Files[i], Parametros.CaminhoDisImportadas + ExtractFileName(OpenDialog1.Files[i]))
    end;
    lblstatus.Caption := 'Integração concluída com sucesso';
  finally
//    ProgressBar1.Visible := false;
  end;

end;

procedure TfrmIntegracaoDI.FormShow(Sender: TObject);
begin
  lblstatus.Caption := 'Clique e selecione os arquivos que deseja integrar.';

  if Parametros.ModoTeste then
  begin
    panel5.Visible := true;
    self.Height := 340;
  end;

  CallBack := Logar;

end;

procedure TfrmIntegracaoDI.CarregarDI(arquivo: String);
var
  StringList : TStringList;
  XMLStream : TMemoryStream;
  XMLDoc : IXMLDocument;
  Node_DIs: IXMLNode;
  Node_DI: IXMLNode;
  iDi: integer;
  i: integer;

  function TrataValor(value: String): String;
  begin
    result := Copy(value, 0, 100);
    result := RemoveCaracteresEstranhosFormularyFill(StringReplace(result, '=', '*', [rfReplaceAll]));
  end;

  function TextoParaData(aValue: String): TDateTime;
  begin
    if aValue <> '' then
    begin
      if (StrToInt(Copy(aValue, 1, 4)) < 2000) or
         (StrToInt(Copy(aValue, 5, 2)) > 12) or
         (StrToInt(Copy(aValue, 7, 2)) > 31) then
        aValue := '';
    end;

    result := StrToDateTimeDef(Copy(aValue, 7, 2) +'/'+ Copy(aValue, 5, 2) + '/' +Copy(aValue, 1, 4), 0);
  end;

begin

  XMLStream := TMemoryStream.Create;
  StringList := TStringList.Create;
  StringList.LoadFromFile(arquivo);
  StringList.Text := StringReplace(StringList.Text, '', '', [rfReplaceAll]);
  StringList.SaveToStream(XMLStream);
//

  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.Active := true;
  XMLDoc.Encoding := 'UTF-8';
  XMLDoc.LoadFromStream(XMLStream, xetUTF_8);
//  XMLDoc.LoadFromXML(RemoveCaracteresEstranhosFormularyFill(StringList.text));
//  XMLDoc.LoadFromFile(arquivo);
//  XMLDoc.Active := True;
  Node_DIs := XMLDoc.ChildNodes.FindNode('ListaDeclaracoes');
  DIs := TObjectList<TDi>.Create;

  for i := 0 to Node_DIs.ChildNodes.Count - 1 do
  begin
    iDi := DIs.Add(TDi.Create);
    Node_DI := Node_DIs.ChildNodes[i];
    Dis.Items[iDi].tipoDeclaracaoCodigo                       := GetChildValue(Node_DI, 'tipoDeclaracaoCodigo');
    Dis.Items[iDi].tipoDeclaracaoCodigo                       := GetChildValue(Node_DI, 'tipoDeclaracaoCodigo');
    Dis.Items[iDi].tipoDeclaracaoNome                         := GetChildValue(Node_DI, 'tipoDeclaracaoNome');
    Dis.Items[iDi].modalidadeDespachoCodigo                   := GetChildValue(Node_DI, 'modalidadeDespachoCodigo');
    Dis.Items[iDi].modalidadeDespachoNome                     := GetChildValue(Node_DI, 'modalidadeDespachoNome');
    Dis.Items[iDi].numeroDI                                   := GetChildValue(Node_DI, 'numeroDI');
    Dis.Items[iDi].dataDesembaraco                            := TextoParaData(GetChildValue(Node_DI, 'dataDesembaraco'));
    Dis.Items[iDi].dataRegistro                               := TextoParaData(GetChildValue(Node_DI, 'dataRegistro'));
    Dis.Items[iDi].operacaoFundap                             := GetChildValue(Node_DI, 'operacaoFundap');
    Dis.Items[iDi].urfDespachoCodigo                          := GetChildValue(Node_DI, 'urfDespachoCodigo');
    Dis.Items[iDi].urfDespachoNome                            := GetChildValue(Node_DI, 'urfDespachoNome');
    Dis.Items[iDi].localDescargaTotalDolares                  := StrToFloatDef(GetChildValue(Node_DI, 'localDescargaTotalDolares'), 0)/100;
    Dis.Items[iDi].localDescargaTotalReais                    := StrToFloatDef(GetChildValue(Node_DI, 'localDescargaTotalReais'),0)/100;
    Dis.Items[iDi].localEmbarqueTotalDolares                  := StrToFloatDef(GetChildValue(Node_DI, 'localEmbarqueTotalDolares'),0)/100;
    Dis.Items[iDi].localEmbarqueTotalReais                    := StrToFloatDef(GetChildValue(Node_DI, 'localEmbarqueTotalReais'),0)/100;
    Dis.Items[iDi].viaTransporteCodigo                        := GetChildValue(Node_DI, 'viaTransporteCodigo');
    Dis.Items[iDi].viaTransporteMultimodal                    := GetChildValue(Node_DI, 'viaTransporteMultimodal');
    Dis.Items[iDi].viaTransporteNome                          := GetChildValue(Node_DI, 'viaTransporteNome');
    Dis.Items[iDi].viaTransporteNomeTransportador             := GetChildValue(Node_DI, 'viaTransporteNomeTransportador');
    Dis.Items[iDi].viaTransportePaisTransportadorCodigo       := GetChildValue(Node_DI, 'viaTransportePaisTransportadorCodigo');
    Dis.Items[iDi].viaTransportePaisTransportadorNome         := GetChildValue(Node_DI, 'viaTransportePaisTransportadorNome');
    Dis.Items[iDi].sequencialRetificacao                      := GetChildValue(Node_DI, 'sequencialRetificacao');
    Dis.Items[iDi].situacaoEntregaCarga                       := copy(GetChildValue(Node_DI, 'situacaoEntregaCarga'), 0, 100);
    Dis.Items[iDi].canalSelecaoParametrizada                  := GetChildValue(Node_DI, 'canalSelecaoParametrizada');
    Dis.Items[iDi].caracterizacaoOperacaoCodigoTipo           := GetChildValue(Node_DI, 'caracterizacaoOperacaoCodigoTipo');
    Dis.Items[iDi].caracterizacaoOperacaoDescricaoTipo        := GetChildValue(Node_DI, 'caracterizacaoOperacaoDescricaoTipo');
    Dis.Items[iDi].cargaDataChegada                           := TextoParaData(GetChildValue(Node_DI, 'cargaDataChegada'));
    Dis.Items[iDi].cargaNumeroAgente                          := GetChildValue(Node_DI, 'cargaNumeroAgente');
    Dis.Items[iDi].cargaPaisProcedenciaCodigo                 := GetChildValue(Node_DI, 'cargaPaisProcedenciaCodigo');
    Dis.Items[iDi].cargaPaisProcedenciaNome                   := GetChildValue(Node_DI, 'cargaPaisProcedenciaNome');
    Dis.Items[iDi].cargaPesoBruto                             := StrToFloatDef(GetChildValue(Node_DI, 'cargaPesoBruto'),0)/100000;
    Dis.Items[iDi].cargaPesoLiquido                           := StrToFloatDef(GetChildValue(Node_DI, 'cargaPesoLiquido'),0)/100000;
    Dis.Items[iDi].cargaUrfEntradaCodigo                      := GetChildValue(Node_DI, 'cargaUrfEntradaCodigo');
    Dis.Items[iDi].cargaUrfEntradaNome                        := GetChildValue(Node_DI, 'cargaUrfEntradaNome');
    Dis.Items[iDi].conhecimentoCargaEmbarqueData              := TextoParaData(GetChildValue(Node_DI, 'conhecimentoCargaEmbarqueData'));
    Dis.Items[iDi].conhecimentoCargaEmbarqueLocal             := GetChildValue(Node_DI, 'conhecimentoCargaEmbarqueLocal');
    Dis.Items[iDi].conhecimentoCargaId                        := GetChildValue(Node_DI, 'conhecimentoCargaId');
    Dis.Items[iDi].conhecimentoCargaIdMaster                  := GetChildValue(Node_DI, 'conhecimentoCargaIdMaster');
    Dis.Items[iDi].conhecimentoCargaTipoCodigo                := GetChildValue(Node_DI, 'conhecimentoCargaTipoCodigo');
    Dis.Items[iDi].conhecimentoCargaTipoNome                  := GetChildValue(Node_DI, 'conhecimentoCargaTipoNome');
    Dis.Items[iDi].conhecimentoCargaUtilizacao                := GetChildValue(Node_DI, 'conhecimentoCargaUtilizacao');
    Dis.Items[iDi].conhecimentoCargaUtilizacaoNome            := GetChildValue(Node_DI, 'conhecimentoCargaUtilizacaoNome');
    Dis.Items[iDi].valorTotalMultaARecolherAjustado           := StrToFloatDef(GetChildValue(Node_DI, 'valorTotalMultaARecolherAjustado'),0)/100;
    Dis.Items[iDi].seguroMoedaNegociadaCodigo                 := GetChildValue(Node_DI, 'seguroMoedaNegociadaCodigo');
    Dis.Items[iDi].seguroMoedaNegociadaNome                   := GetChildValue(Node_DI, 'seguroMoedaNegociadaNome');
    Dis.Items[iDi].seguroTotalDolares                         := StrToFloatDef(GetChildValue(Node_DI, 'seguroTotalDolares'),0)/100;
    Dis.Items[iDi].seguroTotalMoedaNegociada                  := StrToFloatDef(GetChildValue(Node_DI, 'seguroTotalMoedaNegociada'),0)/100;
    Dis.Items[iDi].seguroTotalReais                           := StrToFloatDef(GetChildValue(Node_DI, 'seguroTotalReais'),0)/100;
    Dis.Items[iDi].freteCollect                               := GetChildValue(Node_DI, 'freteCollect');
    Dis.Items[iDi].freteEmTerritorioNacional                  := GetChildValue(Node_DI, 'freteEmTerritorioNacional');
    Dis.Items[iDi].freteMoedaNegociadaCodigo                  := GetChildValue(Node_DI, 'freteMoedaNegociadaCodigo');
    Dis.Items[iDi].freteMoedaNegociadaNome                    := GetChildValue(Node_DI, 'freteMoedaNegociadaNome');
    Dis.Items[iDi].fretePrepaid                               := GetChildValue(Node_DI, 'fretePrepaid');
    Dis.Items[iDi].freteTotalDolares                          := StrToFloatDef(GetChildValue(Node_DI, 'freteTotalDolares'),0)/100;
    Dis.Items[iDi].freteTotalMoeda                            := StrToFloatDef(GetChildValue(Node_DI, 'freteTotalMoeda'),0)/100;
    Dis.Items[iDi].freteTotalReais                            := StrToFloatDef(GetChildValue(Node_DI, 'freteTotalReais'),0)/100;
    Dis.Items[iDi].importadorCodigoTipo                       := GetChildValue(Node_DI, 'importadorCodigoTipo');
    Dis.Items[iDi].importadorCpfRepresentanteLegal            := GetChildValue(Node_DI, 'importadorCpfRepresentanteLegal');
    Dis.Items[iDi].importadorEnderecoBairro                   := GetChildValue(Node_DI, 'importadorEnderecoBairro');
    Dis.Items[iDi].importadorEnderecoCep                      := GetChildValue(Node_DI, 'importadorEnderecoCep');
    Dis.Items[iDi].importadorEnderecoLogradouro               := GetChildValue(Node_DI, 'importadorEnderecoLogradouro');
    Dis.Items[iDi].importadorEnderecoMunicipio                := GetChildValue(Node_DI, 'importadorEnderecoMunicipio');
    Dis.Items[iDi].importadorEnderecoNumero                   := GetChildValue(Node_DI, 'importadorEnderecoNumero');
    Dis.Items[iDi].importadorEnderecoUf                       := GetChildValue(Node_DI, 'importadorEnderecoUf');
    Dis.Items[iDi].importadorNome                             := GetChildValue(Node_DI, 'importadorNome');
    Dis.Items[iDi].importadorNomeRepresentanteLegal           := GetChildValue(Node_DI, 'importadorNomeRepresentanteLegal');
    Dis.Items[iDi].importadorNumero                           := GetChildValue(Node_DI, 'importadorNumero');
    Dis.Items[iDi].armazenamentoRecintoAduaneiroCodigo        := GetChildValue(Node_DI, 'armazenamentoRecintoAduaneiroCodigo');
    Dis.Items[iDi].armazenamentoRecintoAduaneiroNome          := GetChildValue(Node_DI, 'armazenamentoRecintoAduaneiroNome');
    Dis.Items[iDi].armazenamentoSetor                         := GetChildValue(Node_DI, 'armazenamentoSetor');
    Dis.Items[iDi].informacaoComplementar                     := TrataValor(GetChildValue(Node_DI, 'informacaoComplementar'));
    Dis.Items[iDi].totalAdicoes                               := StrToInt(GetChildValue(Node_DI, 'totalAdicoes'));

    Dis.Items[iDi].nomeArmazem                                := GetChildValue(Node_DI.ChildNodes.FindNode('armazem'), 'nomeArmazem');
    Dis.Items[iDi].agenciaIcms                                := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'agenciaIcms');
    Dis.Items[iDi].bancoIcms                                  := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'bancoIcms');
    Dis.Items[iDi].codigoTipoRecolhimentoIcms                 := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'codigoTipoRecolhimentoIcms');
    Dis.Items[iDi].cpfResponsavelRegistroIcms                 := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'cpfResponsavelRegistro');
    Dis.Items[iDi].dataPagamentoIcms                          := TextoParaData(GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'dataPagamentoIcms'));
    Dis.Items[iDi].dataRegistroIcms                           := TextoParaData(GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'dataRegistro'));
    Dis.Items[iDi].horaRegistroIcms                           := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'horaRegistro');
    Dis.Items[iDi].nomeTipoRecolhimentoIcms                   := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'nomeTipoRecolhimentoIcms');
    Dis.Items[iDi].numeroSequencialIcms                       := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'numeroSequencialIcms');
    Dis.Items[iDi].ufIcms                                     := GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'ufIcms');
    Dis.Items[iDi].valorTotalIcms                             := StrToFloatDef(GetChildValue(Node_DI.ChildNodes.FindNode('icms'), 'valorTotalIcms'),0)/100;

    Dis.Items[iDi].documentoChegadaCargaCodigoTipo            := GetChildValue(Node_DI, 'documentoChegadaCargaCodigoTipo');
    Dis.Items[iDi].documentoChegadaCargaNome                  := GetChildValue(Node_DI, 'documentoChegadaCargaNome');
    Dis.Items[iDi].documentoChegadaCargaNumero                := GetChildValue(Node_DI, 'documentoChegadaCargaNumero');

    CarregarAdicoes(Dis.Items[iDi], Node_DI);
  end;

end;

procedure TfrmIntegracaoDI.CarregarAdicoes(Di: TDi; Node_DI: IXMLNode);
var
  i : integer;
  iAdicao: integer;
  Node_Adicao: iXMLNode;

  function TiraUltimosCaracteres(value: String): String;
  begin
    result := ReverseString(value);
    result := Copy(result, 6, length(value));
    result := reverseString(result);
  end;
begin

  Di.adicoes := TobjectList<Tadicao>.create;
  for i := 0 to Node_DI.ChildNodes.Count -1 do
  begin
    if Node_DI.ChildNodes[i].NodeName = 'adicao' then
    begin
      Node_Adicao := Node_DI.ChildNodes[i];
      iAdicao := Di.adicoes.Add(TAdicao.Create);
      Di.adicoes.Items[iAdicao].numeroAdicao                                  := GetChildValue(Node_Adicao, 'numeroAdicao');
      Di.adicoes.Items[iAdicao].numeroLI                                      := GetChildValue(Node_Adicao,'numeroLI');
      Di.adicoes.Items[iAdicao].sequencialRetificacao                         := GetChildValue(Node_Adicao,'sequencialRetificacao');
      Di.adicoes.Items[iAdicao].dadosMercadoriaAplicacao                      := GetChildValue(Node_Adicao,'dadosMercadoriaAplicacao');
      Di.adicoes.Items[iAdicao].dadosMercadoriaCodigoNaladiNCCA               := GetChildValue(Node_Adicao,'dadosMercadoriaCodigoNaladiNCCA');
      Di.adicoes.Items[iAdicao].dadosMercadoriaCodigoNaladiSH                 := GetChildValue(Node_Adicao,'dadosMercadoriaCodigoNaladiSH');
      Di.adicoes.Items[iAdicao].dadosMercadoriaCodigoNcm                      := GetChildValue(Node_Adicao,'dadosMercadoriaCodigoNcm');
      Di.adicoes.Items[iAdicao].dadosMercadoriaCondicao                       := GetChildValue(Node_Adicao,'dadosMercadoriaCondicao');
      Di.adicoes.Items[iAdicao].dadosMercadoriaMedidaEstatisticaQuantidade    := StrToFloatDef(GetChildValue(Node_Adicao,'dadosMercadoriaMedidaEstatisticaQuantidade'),0)/100000;
      Di.adicoes.Items[iAdicao].dadosMercadoriaMedidaEstatisticaUnidade       := GetChildValue(Node_Adicao,'dadosMercadoriaMedidaEstatisticaUnidade');
      Di.adicoes.Items[iAdicao].dadosMercadoriaNomeNcm                        := GetChildValue(Node_Adicao,'dadosMercadoriaNomeNcm');
      Di.adicoes.Items[iAdicao].dadosMercadoriaPesoLiquido                    := StrToFloatDef(GetChildValue(Node_Adicao,'dadosMercadoriaPesoLiquido'),0)/100000;
      Di.adicoes.Items[iAdicao].paisAquisicaoMercadoriaCodigo                 := GetChildValue(Node_Adicao,'paisAquisicaoMercadoriaCodigo');
      Di.adicoes.Items[iAdicao].paisAquisicaoMercadoriaNome                   := GetChildValue(Node_Adicao,'paisAquisicaoMercadoriaNome');
      Di.adicoes.Items[iAdicao].paisOrigemMercadoriaCodigo                    := GetChildValue(Node_Adicao,'paisOrigemMercadoriaCodigo');
      Di.adicoes.Items[iAdicao].paisOrigemMercadoriaNome                      := GetChildValue(Node_Adicao,'paisOrigemMercadoriaNome');
      Di.adicoes.Items[iAdicao].fornecedorCidade                              := GetChildValue(Node_Adicao,'fornecedorCidade');
      Di.adicoes.Items[iAdicao].fornecedorComplemento                         := GetChildValue(Node_Adicao,'fornecedorComplemento');
      Di.adicoes.Items[iAdicao].fornecedorEstado                              := GetChildValue(Node_Adicao,'fornecedorEstado');
      Di.adicoes.Items[iAdicao].fornecedorLogradouro                          := GetChildValue(Node_Adicao,'fornecedorLogradouro');
      Di.adicoes.Items[iAdicao].fornecedorNome                                := GetChildValue(Node_Adicao,'fornecedorNome');
      Di.adicoes.Items[iAdicao].fornecedorNumero                              := GetChildValue(Node_Adicao,'fornecedorNumero');
      Di.adicoes.Items[iAdicao].codigoRelacaoCompradorVendedor                := GetChildValue(Node_Adicao,'codigoRelacaoCompradorVendedor');
      Di.adicoes.Items[iAdicao].relacaoCompradorVendedor                      := GetChildValue(Node_Adicao,'relacaoCompradorVendedor');
      Di.adicoes.Items[iAdicao].codigoVinculoCompradorVendedor                := GetChildValue(Node_Adicao,'codigoVinculoCompradorVendedor');
      Di.adicoes.Items[iAdicao].vinculoCompradorVendedor                      := GetChildValue(Node_Adicao,'vinculoCompradorVendedor');
      Di.adicoes.Items[iAdicao].dadosCambiaisCoberturaCambialCodigo           := GetChildValue(Node_Adicao,'dadosCambiaisCoberturaCambialCodigo');
      Di.adicoes.Items[iAdicao].dadosCambiaisCoberturaCambialNome             := GetChildValue(Node_Adicao,'dadosCambiaisCoberturaCambialNome');
      Di.adicoes.Items[iAdicao].dadosCambiaisInstituicaoFinanciadoraCodigo    := GetChildValue(Node_Adicao,'dadosCambiaisInstituicaoFinanciadoraCodigo');
      Di.adicoes.Items[iAdicao].dadosCambiaisInstituicaoFinanciadoraNome      := GetChildValue(Node_Adicao,'dadosCambiaisInstituicaoFinanciadoraNome');
      Di.adicoes.Items[iAdicao].dadosCambiaisMotivoSemCoberturaCodigo         := GetChildValue(Node_Adicao,'dadosCambiaisMotivoSemCoberturaCodigo');
      Di.adicoes.Items[iAdicao].dadosCambiaisMotivoSemCoberturaNome           := GetChildValue(Node_Adicao,'dadosCambiaisMotivoSemCoberturaNome');
      Di.adicoes.Items[iAdicao].dadosCambiaisValorRealCambio                  := StrToFloatDef(GetChildValue(Node_Adicao,'dadosCambiaisValorRealCambio'),0)/100;
      Di.adicoes.Items[iAdicao].dadosCargaPaisProcedenciaCodigo               := GetChildValue(Node_Adicao,'dadosCargaPaisProcedenciaCodigo');
      Di.adicoes.Items[iAdicao].dadosCargaUrfEntradaCodigo                    := GetChildValue(Node_Adicao,'dadosCargaUrfEntradaCodigo');
      Di.adicoes.Items[iAdicao].dadosCargaViaTransporteCodigo                 := GetChildValue(Node_Adicao,'dadosCargaViaTransporteCodigo');
      Di.adicoes.Items[iAdicao].condicaoVendaLocal                            := GetChildValue(Node_Adicao,'condicaoVendaLocal');
      Di.adicoes.Items[iAdicao].condicaoVendaMetodoValoracaoCodigo            := GetChildValue(Node_Adicao,'condicaoVendaMetodoValoracaoCodigo');
      Di.adicoes.Items[iAdicao].condicaoVendaMetodoValoracaoNome              := GetChildValue(Node_Adicao,'condicaoVendaMetodoValoracaoNome');
      Di.adicoes.Items[iAdicao].condicaoVendaMoedaCodigo                      := GetChildValue(Node_Adicao,'condicaoVendaMoedaCodigo');
      Di.adicoes.Items[iAdicao].condicaoVendaMoedaNome                        := GetChildValue(Node_Adicao,'condicaoVendaMoedaNome');
      Di.adicoes.Items[iAdicao].condicaoVendaValorMoeda                       := StrToFloatDef(GetChildValue(Node_Adicao,'condicaoVendaValorMoeda'),0)/100;
      Di.adicoes.Items[iAdicao].condicaoVendaValorReais                       := StrToFloatDef(GetChildValue(Node_Adicao,'condicaoVendaValorReais'),0)/100;
      Di.adicoes.Items[iAdicao].cideValorAliquotaEspecifica                   := StrToFloatDef(GetChildValue(Node_Adicao,'cideValorAliquotaEspecifica'),0)/100;
      Di.adicoes.Items[iAdicao].cideValorDevido                               := StrToFloatDef(GetChildValue(Node_Adicao,'cideValorDevido'),0)/100;
      Di.adicoes.Items[iAdicao].cideValorRecolher                             := StrToFloatDef(GetChildValue(Node_Adicao,'cideValorRecolher'),0)/100;
      Di.adicoes.Items[iAdicao].dcrCoeficienteReducao                         := GetChildValue(Node_Adicao,'dcrCoeficienteReducao');
      Di.adicoes.Items[iAdicao].dcrIdentificacao                              := GetChildValue(Node_Adicao,'dcrIdentificacao');
      Di.adicoes.Items[iAdicao].dcrValorDevido                                := StrToFloatDef(GetChildValue(Node_Adicao,'dcrValorDevido'),0)/100;
      Di.adicoes.Items[iAdicao].dcrValorDolar                                 := StrToFloatDef(GetChildValue(Node_Adicao,'dcrValorDolar'),0)/100;
      Di.adicoes.Items[iAdicao].dcrValorReal                                  := StrToFloatDef(GetChildValue(Node_Adicao,'dcrValorReal'),0)/100;
      Di.adicoes.Items[iAdicao].dcrValorRecolher                              := StrToFloatDef(GetChildValue(Node_Adicao,'dcrValorRecolher'),0)/100;
      Di.adicoes.Items[iAdicao].valorMultaARecolher                           := StrToFloatDef(GetChildValue(Node_Adicao,'valorMultaARecolher'),0)/100;
      Di.adicoes.Items[iAdicao].valorMultaARecolherAjustado                   := StrToFloatDef(GetChildValue(Node_Adicao,'valorMultaARecolherAjustado'),0)/100;
      Di.adicoes.Items[iAdicao].valorReaisFreteInternacional                  := StrToFloatDef(GetChildValue(Node_Adicao,'valorReaisFreteInternacional'),0)/100;
      Di.adicoes.Items[iAdicao].valorReaisSeguroInternacional                 := StrToFloatDef(GetChildValue(Node_Adicao,'valorReaisSeguroInternacional'),0)/100;
      Di.adicoes.Items[iAdicao].valorTotalCondicaoVenda                       := StrToFloatDef(TiraUltimosCaracteres(GetChildValue(Node_Adicao,'valorTotalCondicaoVenda')),0)/100;
      Di.adicoes.Items[iAdicao].freteMoedaNegociadaCodigo                     := GetChildValue(Node_Adicao,'freteMoedaNegociadaCodigo');
      Di.adicoes.Items[iAdicao].freteValorMoedaNegociada                      := StrToFloatDef(GetChildValue(Node_Adicao,'freteValorMoedaNegociada'),0)/100;
      Di.adicoes.Items[iAdicao].freteValorReais                               := StrToFloatDef(GetChildValue(Node_Adicao,'freteValorReais'),0)/100;
      Di.adicoes.Items[iAdicao].seguroMoedaNegociadaCodigo                    := GetChildValue(Node_Adicao,'seguroMoedaNegociadaCodigo');
      Di.adicoes.Items[iAdicao].seguroValorMoedaNegociada                     := StrToFloatDef(GetChildValue(Node_Adicao,'seguroValorMoedaNegociada'),0)/100;
      Di.adicoes.Items[iAdicao].seguroValorReais                              := StrToFloatDef(GetChildValue(Node_Adicao,'seguroValorReais'),0)/100;
      Di.adicoes.Items[iAdicao].iiAcordoTarifarioTipoCodigo                   := GetChildValue(Node_Adicao,'iiAcordoTarifarioTipoCodigo');
      Di.adicoes.Items[iAdicao].iiAliquotaAcordo                              := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaAcordo'),0)/100;
      Di.adicoes.Items[iAdicao].iiAliquotaAdValorem                           := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaAdValorem'),0)/100;
      Di.adicoes.Items[iAdicao].iiAliquotaPercentualReducao                   := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaPercentualReducao'),0)/100;
      Di.adicoes.Items[iAdicao].iiAliquotaReduzida                            := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaReduzida'),0)/100;
      Di.adicoes.Items[iAdicao].iiAliquotaValorCalculado                      := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaValorCalculado'),0)/100;
      Di.adicoes.Items[iAdicao].iiAliquotaValorCalculado                      := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaValorDevido'),0)/100;
      Di.adicoes.Items[iAdicao].iiAliquotaValorRecolher                       := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaValorRecolher'),0)/100;
      Di.adicoes.Items[iAdicao].iiAliquotaValorReduzido                       := StrToFloatDef(GetChildValue(Node_Adicao,'iiAliquotaValorReduzido'),0)/100;
      Di.adicoes.Items[iAdicao].iiBaseCalculo                                 := StrToFloatDef(GetChildValue(Node_Adicao,'iiBaseCalculo'),0)/100;
      Di.adicoes.Items[iAdicao].iiFundamentoLegalCodigo                       := GetChildValue(Node_Adicao,'iiFundamentoLegalCodigo');
      Di.adicoes.Items[iAdicao].iiMotivoAdmissaoTemporariaCodigo              := GetChildValue(Node_Adicao,'iiMotivoAdmissaoTemporariaCodigo');
      Di.adicoes.Items[iAdicao].iiRegimeTributacaoCodigo                      := GetChildValue(Node_Adicao,'iiRegimeTributacaoCodigo');
      Di.adicoes.Items[iAdicao].iiRegimeTributacaoNome                        := GetChildValue(Node_Adicao,'iiRegimeTributacaoNome');
      Di.adicoes.Items[iAdicao].ipiAliquotaAdValorem                          := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaAdValorem'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaEspecificaCapacidadeRecipciente    := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaEspecificaCapacidadeRecipciente'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaEspecificaQuantidadeUnidadeMedida  := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaEspecificaQuantidadeUnidadeMedida'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaEspecificaTipoRecipienteCodigo     := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaEspecificaTipoRecipienteCodigo'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaEspecificaValorUnidadeMedida       := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaEspecificaValorUnidadeMedida'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaNotaComplementarTIPI               := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaNotaComplementarTIPI'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaReduzida                           := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaReduzida'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaValorDevido                        := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaValorDevido'),0)/100;
      Di.adicoes.Items[iAdicao].ipiAliquotaValorRecolher                      := StrToFloatDef(GetChildValue(Node_Adicao,'ipiAliquotaValorRecolher'),0)/100;
      Di.adicoes.Items[iAdicao].ipiRegimeTributacaoCodigo                     := GetChildValue(Node_Adicao,'ipiRegimeTributacaoCodigo');
      Di.adicoes.Items[iAdicao].ipiRegimeTributacaoNome                       := GetChildValue(Node_Adicao,'ipiRegimeTributacaoNome');
      Di.adicoes.Items[iAdicao].cofinsAliquotaAdValorem                       := StrToFloatDef(GetChildValue(Node_Adicao,'cofinsAliquotaAdValorem'),0)/100;
      Di.adicoes.Items[iAdicao].cofinsAliquotaEspecificaQuantidadeUnidade     := StrToFloatDef(GetChildValue(Node_Adicao,'cofinsAliquotaEspecificaQuantidadeUnidade'),0)/100;
      Di.adicoes.Items[iAdicao].cofinsAliquotaEspecificaValor                 := StrToFloatDef(GetChildValue(Node_Adicao,'cofinsAliquotaEspecificaValor'),0)/100;
      Di.adicoes.Items[iAdicao].cofinsAliquotaReduzida                        := StrToFloatDef(GetChildValue(Node_Adicao,'cofinsAliquotaReduzida'),0)/100;
      Di.adicoes.Items[iAdicao].cofinsAliquotaValorDevido                     := StrToFloatDef(GetChildValue(Node_Adicao,'cofinsAliquotaValorDevido'),0)/100;
      Di.adicoes.Items[iAdicao].cofinsAliquotaValorRecolher                   := StrToFloatDef(GetChildValue(Node_Adicao,'cofinsAliquotaValorRecolher'),0)/100;
      Di.adicoes.Items[iAdicao].pisCofinsBaseCalculoAliquotaICMS              := StrToFloatDef(GetChildValue(Node_Adicao,'pisCofinsBaseCalculoAliquotaICMS'),0)/100;
      Di.adicoes.Items[iAdicao].pisCofinsBaseCalculoFundamentoLegalCodigo     := StrToFloatDef(GetChildValue(Node_Adicao,'pisCofinsBaseCalculoFundamentoLegalCodigo'),0)/100;
      Di.adicoes.Items[iAdicao].pisCofinsBaseCalculoPercentualReducao         := StrToFloatDef(GetChildValue(Node_Adicao,'pisCofinsBaseCalculoPercentualReducao'),0)/100;
      Di.adicoes.Items[iAdicao].pisCofinsBaseCalculoValor                     := StrToFloatDef(GetChildValue(Node_Adicao,'pisCofinsBaseCalculoValor'),0)/100;
      Di.adicoes.Items[iAdicao].pisCofinsFundamentoLegalReducaoCodigo         := GetChildValue(Node_Adicao,'pisCofinsFundamentoLegalReducaoCodigo');
      Di.adicoes.Items[iAdicao].pisCofinsRegimeTributacaoCodigo               := GetChildValue(Node_Adicao,'pisCofinsRegimeTributacaoCodigo');
      Di.adicoes.Items[iAdicao].pisCofinsRegimeTributacaoNome                 := GetChildValue(Node_Adicao,'pisCofinsRegimeTributacaoNome');
      Di.adicoes.Items[iAdicao].pisPasepAliquotaAdValorem                     := StrToFloatDef(GetChildValue(Node_Adicao,'pisPasepAliquotaAdValorem'),0)/100;
      Di.adicoes.Items[iAdicao].pisPasepAliquotaEspecificaQuantidadeUnidade   := StrToFloatDef(GetChildValue(Node_Adicao,'pisPasepAliquotaEspecificaQuantidadeUnidade'),0)/100;
      Di.adicoes.Items[iAdicao].pisPasepAliquotaEspecificaValor               := StrToFloatDef(GetChildValue(Node_Adicao,'pisPasepAliquotaEspecificaValor'),0)/100;
      Di.adicoes.Items[iAdicao].pisPasepAliquotaReduzida                      := StrToFloatDef(GetChildValue(Node_Adicao,'pisPasepAliquotaReduzida'),0)/100;
      Di.adicoes.Items[iAdicao].pisPasepAliquotaValorDevido                   := StrToFloatDef(GetChildValue(Node_Adicao,'pisPasepAliquotaValorDevido'),0)/100;
      Di.adicoes.Items[iAdicao].pisPasepAliquotaValorRecolher                 := StrToFloatDef(GetChildValue(Node_Adicao,'pisPasepAliquotaValorRecolher'),0)/100;
      Di.adicoes.Items[iAdicao].condicaoVendaIncoterm                         := GetChildValue(Node_Adicao,'condicaoVendaIncoterm');
      Di.adicoes.Items[iAdicao].fabricanteNome                                := GetChildValue(Node_Adicao,'fabricanteNome');
      Di.adicoes.Items[iAdicao].fabricanteCidade                              := GetChildValue(Node_Adicao,'fabricanteCidade');
      Di.adicoes.Items[iAdicao].fabricanteComplemento                         := GetChildValue(Node_Adicao,'fabricanteComplemento');
      Di.adicoes.Items[iAdicao].fabricanteEstado                              := GetChildValue(Node_Adicao,'fabricanteEstado');
      Di.adicoes.Items[iAdicao].fabricanteLogradouro                          := GetChildValue(Node_Adicao,'fabricanteLogradouro');
      Di.adicoes.Items[iAdicao].fabricanteNumero                              := GetChildValue(Node_Adicao,'fabricanteNumero');
      Di.adicoes.Items[iAdicao].numeroDestaque                                := GetChildValue(Node_Adicao.ChildNodes.FindNode('destaqueNcm'), 'numeroDestaque');

      CarregarMercadorias(Di.adicoes.Items[iAdicao], Node_Adicao);
    end;
  end;
end;

procedure TfrmIntegracaoDI.CarregarMercadorias(adicao: Tadicao; Node_Adicao: iXMLNode);
var
  i : integer;
  iItem: integer;
  Node_Item: iXMLNode;
  vQuantidadeTotalAdicao: Double;
begin
  vQuantidadeTotalAdicao := 0;

  for i := 0 to Node_Adicao.ChildNodes.Count -1 do
  begin
    if Node_Adicao.ChildNodes[i].NodeName = 'mercadoria' then
    begin
      vQuantidadeTotalAdicao := vQuantidadeTotalAdicao + StrToFloatDef(GetChildValue(Node_Adicao.ChildNodes[i], 'quantidade'),0) / 100000;;
    end;
  end;

  adicao.itens := TobjectList<TItem>.create;
  for i := 0 to Node_Adicao.ChildNodes.Count -1 do
  begin
    if Node_Adicao.ChildNodes[i].NodeName = 'mercadoria' then
    begin
      Node_Item := Node_Adicao.ChildNodes[i];
      iItem := adicao.itens.Add(TItem.Create);
      adicao.itens.items[iItem].descricaoMercadoria              := GetChildValue(Node_Item, 'descricaoMercadoria');
      adicao.itens.items[iItem].numeroSequencialItem             := GetChildValue(Node_Item, 'numeroSequencialItem');
      adicao.itens.items[iItem].quantidade                       := StrToFloatDef(GetChildValue(Node_Item, 'quantidade'),0) / 100000;
      adicao.itens.items[iItem].unidadeMedida                    := GetChildValue(Node_Item, 'unidadeMedida');
      adicao.itens.items[iItem].valorUnitario                    := StrToFloatDef(GetChildValue(Node_Item, 'valorUnitario'),0) / 10000000;
      adicao.itens.items[iItem].vmle                             := adicao.itens.items[iItem].quantidade * adicao.itens.items[iItem].valorUnitario;
      adicao.itens.items[iItem].quantidadeEstatistica            := ((adicao.dadosMercadoriaMedidaEstatisticaQuantidade / vQuantidadeTotalAdicao) * adicao.itens.items[iItem].quantidade);
    end;
  end;
end;

procedure TfrmIntegracaoDI.preencheMemo(aValue: String);
begin
  if pos(avalue, memo.Lines.Text) = 0 then
    Log('aValue');
end;

end.

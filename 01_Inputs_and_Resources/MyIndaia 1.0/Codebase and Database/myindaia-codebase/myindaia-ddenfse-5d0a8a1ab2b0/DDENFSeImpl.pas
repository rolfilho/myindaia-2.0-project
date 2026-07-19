unit DDENFSeImpl;

interface

uses System.SysUtils, DDENFSeIntf, ACBrNFSeDANFSeRLClass, ACBrBase, ACBrDFe, ACBrNFSe, pnfsConversao,
  System.Classes, Generics.Collections, Xml.XMLDoc, Xml.XMLIntf, ACBrNFSeNotasFiscais,
  pcnLeitor, pcnConversao;

type
  TNFSe = class(TInterfacedObject, INFSe)
  private
    ACBrNFSe: TACBrNFSe;
    ACBrNFSeDANFSeRL: TACBrNFSeDANFSeRL;
    procedure ConfiguraNFSE;
    procedure LeXMLCampinas(const XML: string);
    function PegarValorTexto(Sample, aString: String) : string;
    function PegarValorNumerico(Sample, aString: String) : Double;
    function ExtractTextInsideGivenTagEx(const Tag, Text: string;
  var StartPos: Integer): string;
    procedure PreencherDadosSeSantos(const XML: string);
  public
    function Eco(const Eco: WideString): WideString;
    function SalvarPDF(const NumeroProcesso: Widestring; Salvar: Boolean = True; Preview: Boolean = True): Widestring;
    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TNFSe }

uses Util, DmMain;

procedure TNFSe.ConfiguraNFSE;
begin
  ACBrNFSe.Configuracoes.Geral.PathIniCidades := GetLocalPath + 'ArqINI';
  ACBrNFSeDANFSeRL.PrestLogo := GetLocalPath + 'Logos\logo.bmp';
  ACBrNFSeDANFSeRL.PathPDF   :=  GetLocalPath;
end;

constructor TNFSe.Create;
begin
  dmdMain          := TdmdMain.Create(nil);
  ACBrNFSe         := TACBrNFSe.Create(nil);
  ACBrNFSeDANFSeRL := TACBrNFSeDANFSeRL.Create(nil);

  ACBrNFSeDANFSeRL.ACBrNFSe := ACBrNFSe;
  ConfiguraNFSE;
end;

destructor TNFSe.Destroy;
begin
  ACBrNFSe.Free;
  ACBrNFSeDANFSeRL.Free;
  dmdMain.Free;
  inherited;
end;

function TNFSe.Eco(const Eco: WideString): WideString;
begin
  Result := Eco;
end;

procedure TNFSe.PreencherDadosSeSantos(const XML: string);
var
  Leitor: TLeitor;
begin
  Leitor := TLeitor.Create;
  Leitor.Arquivo := XML;

  if ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio = '3548500' then
  begin
    if (Leitor.rExtrai(1, 'Prestador') <> '') then
    begin
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.Cnpj := Leitor.rCampo(tcStr, 'Cnpj');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal := Leitor.rCampo(tcStr, 'InscricaoMunicipal');
    end;
  end;
end;

procedure TNFSe.LeXMLCampinas(const XML: string);
var
  CodCidade: string;
  Leitor: TLeitor;
  Aux, TagItens, ItensNFSE: string;
  ValorNFSE : Double;

  function GetDate(const Value: string): TDateTime;
  begin
    Result := EncodeDate(StrToInt(copy(Value, 01, 4)), StrToInt(copy(Value, 06, 2)), StrToInt(copy(Value, 09, 2)))
  end;
begin
  Leitor := TLeitor.Create;
  try
    dmdMain.qryUnidNeg.Close;
    dmdMain.qryUnidNeg.ParamByName('CODIGO').AsString := '11';
    dmdMain.qryUnidNeg.Open;
    ACBrNFSe.NotasFiscais.Add;
    Leitor.Arquivo := XML;

    if (Leitor.rExtrai(1, 'Cabecalho') <> '') then
    begin
      CodCidade := Leitor.rCampo(tcStr, 'CodCidade');
      CodCidade := dmdMain.GetCodigoIBGEBySIAFI(CodCidade);
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.CodigoMunicipio := CodCidade;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.Cnpj := Leitor.rCampo(tcStr, 'CPFCNPJRemetente');
    end;

    if (Leitor.rExtrai(1, 'Nota') <> '') then
    begin
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Numero := Leitor.rCampo(tcStr, 'NumeroNota');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.CodigoVerificacao := Leitor.rCampo(tcStr, 'CodigoVerificacao');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.DataEmissao := GetDate(Leitor.rCampo(tcStr, 'DataProcessamento'));
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Assinatura := Leitor.rCampo(tcStr, 'Assinatura');
      //Prestador
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal := Leitor.rCampo(tcStr, 'InscricaoMunicipalPrestador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.RazaoSocial := Leitor.rCampo(tcStr, 'RazaoSocialPrestador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.xMunicipio := Leitor.rCampo(tcStr, 'MunicipioPrestacaoDescricao');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio := CodCidade;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Endereco := dmdMain.qryUnidNeg.FieldByName('END_UNID_NEG').AsString;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Numero := dmdMain.qryUnidNeg.FieldByName('END_NUMERO').AsString;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Complemento := dmdMain.qryUnidNeg.FieldByName('END_COMPL').AsString;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Bairro := dmdMain.qryUnidNeg.FieldByName('END_BAIRRO').AsString;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.xPais := 'Brasil';
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.DDD := Leitor.rCampo(tcStr, 'DDDPrestador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Telefone := Leitor.rCampo(tcStr, 'TelefonePrestador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Email := '';
      //RPS
      Aux := Leitor.rCampo(tcStr, 'TipoRPS');
      if Aux.Equals('RPS') then
        ACBrNFSe.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Tipo := trRPS
      else
        ACBrNFSe.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Tipo := trNone;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie := Leitor.rCampo(tcStr, 'SerieRPS');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero := Leitor.rCampo(tcStr, 'NumeroRPS');

      //Tomador
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.IdentificacaoTomador.CpfCnpj := Leitor.rCampo(tcStr, 'CPFCNPJTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.RazaoSocial := Leitor.rCampo(tcStr, 'RazaoSocialTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.TipoLogradouro := Leitor.rCampo(tcStr, 'TipoLogradouroTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.Endereco := Leitor.rCampo(tcStr, 'LogradouroTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.Numero := Leitor.rCampo(tcStr, 'NumeroEnderecoTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.Complemento := Leitor.rCampo(tcStr, 'ComplementoEnderecoTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.TipoBairro := Leitor.rCampo(tcStr, 'TipoBairroTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.Bairro := Leitor.rCampo(tcStr, 'BairroTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.CodigoMunicipio := dmdMain.GetCodigoIBGEBySIAFI(Leitor.rCampo(tcStr, 'CidadeTomador'));
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.xMunicipio := Leitor.rCampo(tcStr, 'CidadeTomadorDescricao');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.CEP := Leitor.rCampo(tcStr, 'CEPTomador');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Tomador.Endereco.CEP := Leitor.rCampo(tcStr, 'CEPTomador');
      //
      ACBrNFSe.NotasFiscais.Items[0].NFSe.NaturezaOperacao := no1;
      //Serviço
      Aux := Leitor.rCampo(tcStr, 'ValorPIS');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorPis :=  StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'ValorCOFINS');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorCofins := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'ValorINSS');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorInss := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'ValorIR');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIr := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'ValorCSLL');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorCsll := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'AliquotaPIS');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.AliquotaPis := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'AliquotaCOFINS');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.AliquotaCofins := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'AliquotaINSS');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.AliquotaInss := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'AliquotaIR');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.AliquotaIr := StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'AliquotaCSLL');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.AliquotaCsll := StrToFloatDef(Aux,0);

      Aux := Leitor.rCampo(tcStr, 'AliquotaAtividade');
      Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota := StrToFloatDef(Aux,0);

      Aux := Leitor.rCampo(tcStr, 'TipoRecolhimento');
      if Aux = 'R' then
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido := stRetencao;
      if Aux = 'A' then
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido := stNormal;

    end;

    //Itens Serviço
    if (Leitor.rExtrai(1, 'Itens') <> '') then
    begin
      TagItens  := Leitor.rExtrai(1, 'Itens');
      ItensNFSE := PegarValorTexto('DiscriminacaoServico', TagItens);
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Discriminacao := ItensNFSE;//Leitor.rCampo(tcStr, 'DiscriminacaoServico');

      ValorNFSE := PegarValorNumerico('ValorTotal', TagItens);
      //Aux := Leitor.rCampo(tcStr, 'ValorTotal');
      //Aux := Aux.Replace('.', ',');
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorServicos := ValorNFSE;// StrToFloatDef(Aux,0);
      Aux := Leitor.rCampo(tcStr, 'Tributavel');

      if Aux.Equals('S') then
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Tributacao := ttTributavel
      else
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Tributacao := ttNaoTributavel;

      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo := ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorServicos;

      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss := ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorServicos *
                                                                 (ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota / 100);

      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse :=
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorServicos -
        (ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorPis +
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorCofins +
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorInss +
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIr +
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorCsll
        );

      if ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido = stRetencao then
      begin
        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse :=
          ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse -
          ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss;
      end;
//      else
//      begin
//        ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorServicos
//      end;

      //ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := 50.56;
    end;

  finally
    Leitor.Free;
  end;
end;

function TNFSe.ExtractTextInsideGivenTagEx(const Tag, Text: string;
  var StartPos: Integer): string;
var
  StartPos2, EndPos: Integer;
  i: Integer;
begin
  Result := '';
  StartPos := Pos('<' + Tag, Text, StartPos); // PosEx() in older Delphi versions
  EndPos := Pos('</' + Tag + '>', Text, StartPos);
  StartPos2 := 0;
  for i := StartPos + Length(Tag) + 1 to EndPos do
  begin
    if Text[i] = '>' then
    begin
      StartPos2 := i + 1;
      break;
    end;
  end;
  if (StartPos2 > 0) and (EndPos > StartPos2) then
  begin
    Result := Copy(Text, StartPos2, EndPos - StartPos2);
    StartPos := StartPos2;
  end;
end;

function TNFSe.PegarValorTexto(Sample, aString: String) : string;
var
  s: String;
  StartPos,foundTags: Integer;
  a : string;
begin
  StartPos  := 1;
  foundTags := 0;
  a := '';
  repeat
    s := ExtractTextInsideGivenTagEx(Sample, aString, StartPos);
    if (trim(s) <> '') then
    begin
      a := a + slinebreak + s;
      Inc(StartPos, Length(Sample));
      Inc(foundTags);
    end;
  until (s = '') or (foundTags = 30);
  result := a;
end;

function TNFSe.PegarValorNumerico(Sample, aString: String) : Double;
var
  s: String;
  StartPos,foundTags: Integer;
  a : double;
begin
  StartPos  := 1;
  foundTags := 0;
  a := 0;
  repeat
    s := ExtractTextInsideGivenTagEx(Sample, aString, StartPos);
    if (trim(s) <> '') then
    begin
      a := a + strtofloat(s.Replace('.', ','));
      Inc(StartPos, Length(Sample));
      Inc(foundTags);
    end;
  until (s = '') or (foundTags = 30);
  result := a;
end;

function TNFSe.SalvarPDF(const NumeroProcesso: Widestring; Salvar: Boolean = True; Preview: Boolean = True): widestring;
var
  XML: string;
  PDF: string;
  NumeroNFSe: string;
  NomeArquivoPDF: string;
  NomeArquivoXML: string;
  Aux: string;
  CaminhoApp : string;
  Obs: WideString;
//  testeStr: TStringList;

  function TrataReferencias(value: String): String;
  var
    vPosicao: integer;
    vDiscriminacao1, vDiscriminacao2: String;
  begin
    value := StringReplace(value, NumeroProcesso, NumeroProcesso + '  ', [rfReplaceAll]);
    vPosicao := Pos('Trib', value);
    if vPosicao > 0 then
    begin
      vDiscriminacao1 := Copy(value, 0, vPosicao - 1);
      vDiscriminacao1 := StringReplace(vDiscriminacao1, ',', '  ', [rfReplaceAll]);
      vDiscriminacao2 := Copy(value, vPosicao, length(value));
      result := vDiscriminacao1 + vDiscriminacao2;
    end
    else
      result := value;
  end;

begin
  CaminhoApp :=  GetLocalPath;

  if not DirectoryExists( GetLocalPath + 'ArqINI') then
    exit('Pasta ArqINI não encontrada.');

  dmdMain.qryWallet.close;
  dmdMain.qryWallet.ParamByName('NR_Processo').AsString := NumeroProcesso;
  dmdMain.qryWallet.Open;
  if dmdMain.qryWallet.IsEmpty then
    Exit('Pagamento não encontrado no Wallet.');

  dmdMain.qrySDE.close;
  dmdMain.qrySDE.ParamByName('NUMNFV').AsInteger     := dmdMain.qryWalletSENIORKEY.AsInteger;
  dmdMain.qrySDE.ParamByName('NR_PROCESSO').AsString := '%'+NumeroProcesso+'%';
  dmdMain.qrySDE.ParamByName('SEQFIL').AsString      := dmdMain.qryWallettaxID.AsString;
  dmdMain.qrySDE.Open;

  if dmdMain.qrySDE.IsEmpty or dmdMain.qrySDE.FieldByName('BINARQ').IsNull then
  begin
    dmdMain.qrySDE.Close;
    dmdMain.qrySDE.ParamByName('NUMNFV').AsInteger     := dmdMain.qryWalletSENIORKEY.AsInteger;
    dmdMain.qrySDE.ParamByName('NR_PROCESSO').AsString := '%%';
    dmdMain.qrySDE.ParamByName('NUMCGC').AsString      := dmdMain.qryWallettaxID.AsString;
    dmdMain.qrySDE.Open;
  end;

  if dmdMain.qrySDE.IsEmpty or dmdMain.qrySDE.FieldByName('BINARQ').IsNull then
    Exit('XML da nota não encontrado no SDE.');

  XML := StringReplace(dmdMain.qrySDE.FieldByName('BINARQ').AsString, #0, '', [rfReplaceAll]);

//  testeStr := TStringList.Create;
//  try
//    testeStr.text := xml;
//    testestr.SaveToFile('testexml.xml');
//  finally
//    testeStr.Free;
//  end;

  if XML.Contains('RetornoConsultaNFSeRPS') then
  begin
    LeXMLCampinas(XML);
    if CompareStr(uppercase(trim(ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Discriminacao)), uppercase((dmdMain.qrySDE.FieldByName('CPLISV').AsString))) <> 0 then
      ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Discriminacao := ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Discriminacao + slinebreak +
                                                                   dmdMain.qrySDE.FieldByName('CPLISV').AsString;
      Obs := NumeroProcesso + #13#10
        +'Esta nota substitui o RPS ' + ACBrNFSe.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero +
        ' série ' + ACBrNFSe.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie;
      ACBrNFSe.NotasFiscais.Items[0].NFSe.OutrasInformacoes := Obs;
  end
  else
  begin
    ACBrNFSe.NotasFiscais.Clear;
    ACBrNFSe.NotasFiscais.LoadFromString(XML);
    PreencherDadosSeSantos(XML);
  end;
  ACBrNFSeDANFSeRL.Prefeitura := 'Prefeitura de ' + CodCidadeToCidade(StrToIntDef(ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.CodigoMunicipio, 0));
  ACBrNFSeDANFSeRL.Logo       :=  CaminhoApp + 'Logos\'+ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.CodigoMunicipio+'.bmp';

  ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Discriminacao := TrataReferencias(ACBrNFSe.NotasFiscais.Items[0].NFSe.Servico.Discriminacao);

  ACBrNFSe.NotasFiscais.Items[0].NFSe.Producao := snSim;
  ACBrNFSe.DANFSE.Sistema := '';
  ACBrNFSe.NotasFiscais.ImprimirPDF;

  NumeroNFSe := TACBrNFSe(ACBrNFSe).NumID[TACBrNFSe(ACBrNFSe).NotasFiscais.Items[0].NFSe];
  PDF := CaminhoApp + NumeroNFSe + '-nfse.pdf';
  if not FileExists(PDF) then
    Exit(PDF + ' não encontrado.');

  if Salvar then
  begin
    if Length(NumeroNFSe) > 8 then
    begin
      Aux := Copy (NumeroNFSe, Length(NumeroNFSe) - 8, Length(NumeroNFSe));
      NomeArquivoPDF := 'NF'+Aux+'.pdf';
      NomeArquivoXML := 'NF'+Aux+'.XML';
    end
    else
    begin
      NomeArquivoPDF := 'NF'+NumeroNFSe+'.pdf';
      NomeArquivoXML := 'NF'+NumeroNFSe+'.XML';
    end;

    //ACBrNFSe.NotasFiscais.GravarXML();
    TextoParaArquivo(CaminhoApp+NomeArquivoXML, XML);
    RenameFile(PDF, CaminhoApp+NomeArquivoPDF);
    if FileExists(CaminhoApp+NomeArquivoPDF) then
    begin
      dmdMain.qryWalletProcessos.close;
      dmdMain.qryWalletProcessos.ParamByName('SENIORKEY').AsInteger := dmdMain.qryWallet.Fields[0].AsInteger;
      dmdMain.qryWalletProcessos.ParamByName('BRANCH_ID').AsInteger := dmdMain.qryWallet.Fields[1].AsInteger;
      dmdMain.qryWalletProcessos.Open;
      while not dmdMain.qryWalletProcessos.Eof do
      begin
        dmdMain.GravaArquivo(CaminhoApp, NomeArquivoPDF, dmdMain.qryWalletProcessos.Fields[0].AsString, 'Nota de Serviço');
        dmdMain.GravaArquivo(CaminhoApp, NomeArquivoXML, dmdMain.qryWalletProcessos.Fields[0].AsString, 'XML Nota de Serviço');
        dmdMain.qryWalletProcessos.Next;
      end;
      DeleteFile(CaminhoApp+NomeArquivoPDF);
      DeleteFile(CaminhoApp+NomeArquivoXML);
    end;
  end;

  if Preview then
  begin
    ACBrNFSe.NotasFiscais.Imprimir;
  end;
end;

end.

unit DadosEnvioERP;

interface

uses
  SysUtils, Classes, Variants, DB, DBTables, ADODB, cxStyles, cxClasses,
  DBClient, Provider, InterfacesERP, StrUtils, Sapiens_NotaFiscal;

type
  TdtmEnvioERP = class(TDataModule)
    qryFatura: TADOQuery;
    qryFaturaid: TBCDField;
    qryFaturaakey: TWideStringField;
    qryFaturacofins: TBCDField;
    qryFaturacreated: TDateTimeField;
    qryFaturadueDate: TDateTimeField;
    qryFaturainvoiceReceiverType: TStringField;
    qryFaturair: TBCDField;
    qryFaturaobs: TWideMemoField;
    qryFaturaseniorDateNFE: TDateTimeField;
    qryFaturaseniorKey: TWideStringField;
    qryFaturastatus: TWideStringField;
    qryFaturatotal: TBCDField;
    qryFaturatype: TWideStringField;
    qryFaturavalorTibutavel: TBCDField;
    qryFaturabranch_id: TBCDField;
    qryFaturacustomClearance_id: TBCDField;
    qryFaturauser_id: TBCDField;
    qryFaturacustomID: TWideStringField;
    qryFaturacustomer_id: TBCDField;
    qryFaturaCD_CLIENTE: TWideStringField;
    qryItensFatura: TADOQuery;
    qryItensFaturaBilling_id: TBCDField;
    qryItensFaturaTipo: TStringField;
    qryItensFaturaid: TBCDField;
    qryItensFaturadestino: TWideStringField;
    qryItensFaturaprice: TBCDField;
    qryItensFaturaitem_id: TBCDField;
    qryItensFaturaaKey: TWideStringField;
    qryItensFaturaname: TWideStringField;
    qryItensFaturaseniorKey: TWideStringField;
    qryItensFaturatype: TStringField;
    cdsFaturaNumerarios: TClientDataSet;
    cdsFaturaNumerariosBilling_id: TBCDField;
    cdsFaturaNumerariosTipo: TStringField;
    cdsFaturaNumerariosid: TBCDField;
    cdsFaturaNumerariosdestino: TWideStringField;
    cdsFaturaNumerariosprice: TBCDField;
    cdsFaturaNumerariositem_id: TBCDField;
    cdsFaturaNumerariosaKey: TWideStringField;
    cdsFaturaNumerariosname: TWideStringField;
    cdsFaturaNumerariosseniorKey: TWideStringField;
    cdsFaturaNumerariostype: TStringField;
    cdsFaturaPagamentos: TClientDataSet;
    cdsFaturaPagamentosBilling_id: TBCDField;
    cdsFaturaPagamentosTipo: TStringField;
    cdsFaturaPagamentosid: TBCDField;
    cdsFaturaPagamentosdestino: TWideStringField;
    cdsFaturaPagamentosprice: TBCDField;
    cdsFaturaPagamentositem_id: TBCDField;
    cdsFaturaPagamentosaKey: TWideStringField;
    cdsFaturaPagamentosname: TWideStringField;
    cdsFaturaPagamentosseniorKey: TWideStringField;
    cdsFaturaPagamentostype: TStringField;
    cdsFaturaReceitas: TClientDataSet;
    cdsFaturaReceitasBilling_id: TBCDField;
    cdsFaturaReceitasTipo: TStringField;
    cdsFaturaReceitasid: TBCDField;
    cdsFaturaReceitasdestino: TWideStringField;
    cdsFaturaReceitasprice: TBCDField;
    cdsFaturaReceitasitem_id: TBCDField;
    cdsFaturaReceitasaKey: TWideStringField;
    cdsFaturaReceitasname: TWideStringField;
    cdsFaturaReceitasseniorKey: TWideStringField;
    cdsFaturaReceitastype: TStringField;
    cdsItensFatura: TClientDataSet;
    cdsItensFaturaBilling_id: TBCDField;
    cdsItensFaturaTipo: TStringField;
    cdsItensFaturaid: TBCDField;
    cdsItensFaturadestino: TWideStringField;
    cdsItensFaturaprice: TBCDField;
    cdsItensFaturaitem_id: TBCDField;
    cdsItensFaturaaKey: TWideStringField;
    cdsItensFaturaname: TWideStringField;
    cdsItensFaturaseniorKey: TWideStringField;
    cdsItensFaturatype: TStringField;
    qryClienteV2: TADOQuery;
    qryClienteV2id: TLargeintField;
    qryClienteV2aKey: TWideStringField;
    qryClienteV2city: TWideStringField;
    qryClienteV2number: TWideStringField;
    qryClienteV2state: TWideStringField;
    qryClienteV2street: TWideStringField;
    qryClienteV2zipCode: TWideStringField;
    qryClienteV2name: TWideStringField;
    qryClienteV2taxID: TWideStringField;
    qryClienteV2Country_id: TLargeintField;
    qryClienteV2cp_id: TLargeintField;
    qryClienteV2neighborhood: TWideStringField;
    qryClienteV2fax: TWideStringField;
    qryClienteV2fone: TWideStringField;
    qryClienteV2inscEstadual: TWideStringField;
    qryClienteV2inscMunicipal: TWideStringField;
    qryClienteV2type: TWideStringField;
    qryClienteV2seniorKey: TWideStringField;
    qryClienteLocal: TADOQuery;
    qryClienteLocalCD_EMPRESA: TStringField;
    qryClienteLocalNM_EMPRESA: TStringField;
    qryClienteLocalAP_EMPRESA: TStringField;
    qryClienteLocalCGC_EMPRESA: TStringField;
    qryClienteLocalCPF_EMPRESA: TStringField;
    qryClienteLocalEND_UF: TStringField;
    qryClienteLocalEND_CIDADE: TStringField;
    qryClienteLocalIN_ORGAO_PUBLICO: TStringField;
    qryUnidade: TADOQuery;
    qryUnidadeCD_UNID_NEG: TStringField;
    qryUnidadeNM_UNID_NEG: TStringField;
    qryUnidadeAP_UNID_NEG: TStringField;
    qryUnidadeCGC_UNID_NEG: TStringField;
    qryUnidadeEND_UNID_NEG: TStringField;
    qryUnidadeEND_NUMERO: TStringField;
    qryUnidadeEND_COMPL: TStringField;
    qryUnidadeEND_BAIRRO: TStringField;
    qryUnidadeEND_CIDADE: TStringField;
    qryUnidadeEND_UF: TStringField;
    qryUnidadeid: TLargeintField;
    qryUnidadeseniorKey: TWideStringField;
    qryCustomerProfile: TADOQuery;
    qryCustomerProfileid: TLargeintField;
    qryCustomerProfiledescricao: TWideStringField;
    qryCustomerProfilesendToBank: TBooleanField;
    qryCustomerProfilewithCashRequest: TBooleanField;
    qryCustomerProfilecostCenter: TStringField;
    qryCustomerProfileconsolidatedBilling: TBooleanField;
    qryCustomerProfileconsolidatedInvoice: TBooleanField;
    qryCustomerProfilecontaFinanceira: TStringField;
    qryCustomerProfileloadDITax: TBooleanField;
    procedure qryItensFaturaAfterOpen(DataSet: TDataSet);
  private
    FMensagemErro: String;
    function EnviarDadosNota(Usuario, Senha: String; Fatura, Sistema, TipoEnvio: Integer): Boolean;
  public
    function ValidaSistema(ASistema: Integer): Boolean;
    function ValidaTipo(ATipo: Integer): Boolean;
    function EnviarNota(AUsuario, ASenha: String; ANota, ASistema: Integer): Boolean;
    property MensagemErro: String read FMensagemErro;
  end;

var
  dtmEnvioERP: TdtmEnvioERP;

implementation

{$R *.dfm}

uses
  DadosFaturamentoERP, Funcoes;

{ TdtmEnvioERP }

function TdtmEnvioERP.EnviarDadosNota(Usuario, Senha: String; Fatura, Sistema, TipoEnvio: Integer): Boolean;
var
  NotaIn: notafiscalGravarNotasFiscaisSaidaIn;
  ListaDadosGerais: Array_Of_notafiscalGravarNotasFiscaisSaidaInDadosGerais;
  DadosGerais: notafiscalGravarNotasFiscaisSaidaInDadosGerais;
  ListaCamposUsuario: Array_Of_notafiscalGravarNotasFiscaisSaidaInDadosGeraisCamposUsuario;
  CamposUsuario: notafiscalGravarNotasFiscaisSaidaInDadosGeraisCamposUsuario;
  ListaParcelas: Array_Of_notafiscalGravarNotasFiscaisSaidaInDadosGeraisParcelas;
  Parcelas: notafiscalGravarNotasFiscaisSaidaInDadosGeraisParcelas;
  ListaServicos: Array_Of_notafiscalGravarNotasFiscaisSaidaInDadosGeraisServicos;
  Servicos: notafiscalGravarNotasFiscaisSaidaInDadosGeraisServicos;
  ListaRateios: Array_Of_notafiscalGravarNotasFiscaisSaidaInDadosGeraisServicosRateio;
  Rateio: notafiscalGravarNotasFiscaisSaidaInDadosGeraisServicosRateio;
  NotaOut: notafiscalGravarNotasFiscaisSaidaOut;
  Processo, TipoNota, TipoOperacao: String;
  OrgaoPublico: Boolean;
  Sequencial: Integer;
  XML: TStringList;
begin
  Result := ValidaSistema(Sistema) and ValidaTipo(TipoEnvio);
  if not Result then
    Exit;

  try
    XML := TStringList.Create;
    if qryFatura.Active then
      qryFatura.Close;
    qryFatura.Parameters.ParamValues['idFatura'] := Fatura;
    qryFatura.Open;
    Processo := Trim(qryFaturacustomID.AsString);

    if Processo = '' then
    begin
      FMensagemErro := 'Processo ou Fatura não encontrado.';
      Result := False;
      Exit;
    end;

    if qryItensFatura.Active then
      qryItensFatura.Close;
    qryItensFatura.Parameters.ParamValues['idFatura'] := Fatura;
    qryItensFatura.Open;

    NotaIn := notafiscalGravarNotasFiscaisSaidaIn.Create;
    try
      // Informar DEB (Nota de Débito) ou NSE (Nota Fiscal de Serviço Eletrônica)
      if SameText(Trim(qryFaturatype.AsString), 'TAX_INVOICE') then
        TipoNota := 'NSE'
      else
        TipoNota := 'DEB';

      XML.Add('<soapenv:Envelope xmlns:ser="http://services.senior.com.br" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">');
      XML.Add('  <soapenv:Header/>');
      XML.Add('  <soapenv:Body>');
      XML.Add('    <ser:GravarNotasFiscaisSaida_2>');
      XML.Add('      <user>' + Usuario + '</user>');
      XML.Add('      <password>' + Senha + '</password>');
      XML.Add('      <encryption>0</encryption>');
      XML.Add('      <parameters>');
      XML.Add('        <dadosGerais>');

      DadosGerais := notafiscalGravarNotasFiscaisSaidaInDadosGerais.Create;
      SetLength(ListaDadosGerais, 1);
      ListaDadosGerais[0] := DadosGerais;
      NotaIn.dadosGerais := ListaDadosGerais;
      DadosGerais.codSnf := TipoNota;                                                                                   // Informar DEB (Nota de Débito) ou NSE (Nota Fiscal de Serviço Eletrônica)
      DadosGerais.ideExt := '';
      DadosGerais.numNfv := '';
      CamposUsuario := notafiscalGravarNotasFiscaisSaidaInDadosGeraisCamposUsuario.Create;
      SetLength(ListaCamposUsuario, 1);
      ListaCamposUsuario[0] := CamposUsuario;
      DadosGerais.camposUsuario := ListaCamposUsuario;
      CamposUsuario.cmpUsu := Processo;
      CamposUsuario.vlrUsu := '0';

      XML.Add('          <camposUsuario>');
      XML.Add('            <cmpUsu>' + CamposUsuario.cmpUsu + '</cmpUsu>');
      XML.Add('            <vlrUsu>' + CamposUsuario.vlrUsu + '</vlrUsu>');
      XML.Add('          </camposUsuario>');

      if TipoEnvio = _Incluir then
      begin
        if qryClienteLocal.Active then
          qryClienteLocal.Close;
        qryClienteLocal.Parameters.ParamValues['CD_CLIENTE'] := qryFaturaCD_CLIENTE.AsString;
        qryClienteLocal.Open;

        if qryUnidade.Active then
          qryUnidade.Close;
        qryUnidade.Parameters.ParamValues['ID_UNIDADE'] := qryFaturabranch_id.AsInteger;
        qryUnidade.Open;

        if qryClienteV2.Active then
          qryClienteV2.Close;
        qryClienteV2.Parameters.ParamValues['CD_CLIENTE'] := qryFaturaCD_CLIENTE.AsString;
        qryClienteV2.Open;

        if qryClienteV2cp_id.IsNull then
          raise Exception.Create('Customer Profile não cadastro para o Cliente.');

        if qryCustomerProfile.Active then
          qryCustomerProfile.Close;
        qryCustomerProfile.Parameters.ParamValues['CP_ID'] := qryClienteV2cp_id.AsInteger;
        qryCustomerProfile.Open;

        if qryCustomerProfile.Eof then
          raise Exception.Create('Customer Profile ' + qryCustomerProfileid.AsString + ' não encontrado.');

        if Trim(qryCustomerProfilecostCenter.AsString) = '' then
          raise Exception.Create('Centro de Custo não informado para o Customer Profile ' + qryCustomerProfileid.AsString + '.');

        if Trim(qryCustomerProfilecontaFinanceira.AsString) = '' then
          raise Exception.Create('Conta Financeira não informada para o Customer Profile ' + qryCustomerProfileid.AsString + '.');

        //Informar 5949D/6949D (Operações com destaque de ISS), sendo 5949D vendas dentro do estado e 6949D para fora do estado
        //Informar 5949R/6949R (Operações com retenção de ISS), sendo 5949R vendas dentro do estado e 6949R para fora do estado
        // Retenção
        if SameText(Trim(qryClienteLocalEND_CIDADE.AsString), Trim(qryUnidadeEND_CIDADE.AsString)) and
           not (SameText(Trim(qryClienteLocalEND_CIDADE.AsString), 'Rio de Janeiro') or SameText(Trim(qryClienteLocalEND_CIDADE.AsString), 'Uruguaiana')) then
        begin
          // Venda dentro do Estado
          if SameText(Trim(qryClienteLocalEND_UF.AsString), Trim(qryUnidadeEND_UF.AsString)) then
            TipoOperacao := '5949D'
          else // Venda fora do Estado
            TipoOperacao := '6949D';
        end
        else // Destaque
        begin
          // Venda dentro do Estado
          if SameText(Trim(qryClienteLocalEND_UF.AsString), Trim(qryUnidadeEND_UF.AsString)) then
            TipoOperacao := '5949R'
          else // Venda fora do Estado
            TipoOperacao := '6949R';
        end;

        {-------------------- Início Dados Gerais --------------------}
        DadosGerais.codCli := qryClienteV2seniorKey.AsString;                                                           // Código do cliente
        DadosGerais.codCpg := '1';                                                                                      // Condição de Pagamento
        DadosGerais.codEdc := '90';                                                                                     // Código da Espécie de Documento, enviar fixo 90
        DadosGerais.codEmp := 1;                                                                                        // Código da Empresa
        DadosGerais.codFil := qryUnidadeseniorKey.AsInteger;                                                            // Código da Filial
        DadosGerais.datEmi := FormatDateTime('dd/mm/yyyy', Now);                                                        // Data de Emissão
        DadosGerais.datSai := '';//FormatDateTime('dd/mm/yyyy', qryFaturacreated.AsDateTime);                           // Data de Saída
        DadosGerais.obsNfv := '';                                                                                       // Observações da Nota Fiscal

        {---------------------- Início Parcelas ----------------------}
        Parcelas := notafiscalGravarNotasFiscaisSaidaInDadosGeraisParcelas.Create;
        SetLength(ListaParcelas, 1);
        ListaParcelas[0] := Parcelas;
        DadosGerais.parcelas := ListaParcelas;
        Parcelas.numPar := 1;                                                                                           // Número da parcela
        Parcelas.vctPar := FormatDateTime('dd/mm/yyyy', qryFaturadueDate.AsDateTime);                                   // Vencimento da parcela
        Parcelas.vlrPar := StringReplace(FormatFloat('0.00', qryFaturatotal.AsFloat), '.', ',', []);                    // Valor da parcela
        {----------------------- Fim Parcelas ------------------------}

        XML.Add('          <codCli>' + DadosGerais.codCli + '</codCli>');
        XML.Add('          <codCpg>' + DadosGerais.codCpg + '</codCpg>');
        XML.Add('          <codEdc>' + DadosGerais.codEdc + '</codEdc>');
        XML.Add('          <codEmp>' + IntToStr(DadosGerais.codEmp) + '</codEmp>');
        XML.Add('          <codFil>' + IntToStr(DadosGerais.codFil) + '</codFil>');
        XML.Add('          <codSnf>' + DadosGerais.codSnf + '</codSnf>');
        XML.Add('          <datEmi>' + DadosGerais.datEmi + '</datEmi>');
        XML.Add('          <datSai>' + DadosGerais.datSai + '</datSai>');
        XML.Add('          <obsNfv>' + DadosGerais.obsNfv + '</obsNfv>');
        XML.Add('          <parcelas>');
        XML.Add('            <numPar>' + IntToStr(Parcelas.numPar) + '</numPar>');
        XML.Add('            <vctPar>' + Parcelas.vctPar + '</vctPar>');
        XML.Add('            <vlrPar>' + Parcelas.vlrPar + '</vlrPar>');
        XML.Add('          </parcelas>');


        if qryClienteLocal.Active then
         qryClienteLocal.Close;
        qryClienteLocal.Parameters.ParamByName('CD_CLIENTE').Value := qryFaturaCD_CLIENTE.AsString;
        qryClienteLocal.Open;
        OrgaoPublico := qryClienteLocalIN_ORGAO_PUBLICO.AsString = '1';
        qryClienteLocal.Close;

        // Loop nos Itens/Serviços-ERP
        SetLength(ListaServicos, 0);
        DadosGerais.servicos := ListaServicos;
        cdsItensFatura.First;
        Sequencial := 1;
        while not cdsItensFatura.Eof do
        begin
          Servicos := notafiscalGravarNotasFiscaisSaidaInDadosGeraisServicos.Create;
          SetLength(ListaServicos, High(ListaServicos) +2);
          ListaServicos[High(ListaServicos)] := Servicos;
          {--------------------- Início Serviços ---------------------}
          Servicos.codSer := cdsItensFaturaseniorKey.AsString;                                                            // Código do serviço
          if Trim(Servicos.codSer) = '' then
            raise Exception.Create('Não cadastrado o código de serviço para o item ' + cdsItensFaturaitem_id.AsString + '.');

          Servicos.obsIsv := '';                                                                                          // Observações do item, campo opcional
          if SameText(TipoNota, 'NSE') then
          begin
            // COFINS                : 4,65%
            // IR - ORGÃO PUBLICO    : 4,80%
            //    - ORGÃO NÃO PUBLICO: 1,50%
            Servicos.perCrt := '4,65';                                                                                    // Percentual de Cofins Retido, não informar para nota de débito
            Servicos.perCsl := '';                                                                                        // Percentual de CSLL Retido, não informar para nota de débito
            Servicos.perIns := '';                                                                                        // Percentual do INSS, não informar para nota de débito
            Servicos.perIrf := IfThen(OrgaoPublico, '4,80', '1,50');                                                      // Percential do IRRF do Serviço da Nota Fiscal de Saída, não informar para nota de débito
            Servicos.perIss := '3,0';                                                                                     // Percentual do ISS do Serviço da Nota Fiscal de Saída, não informar para nota de débito
            Servicos.perPit := '';                                                                                        // Percentual do PIS retido, não informar para nota de débito
          end
          else
          begin
            Servicos.perCrt := '';                                                                                        // Percentual de Cofins Retido, não informar para nota de débito
            Servicos.perCsl := '';                                                                                        // Percentual de CSLL Retido, não informar para nota de débito
            Servicos.perIns := '';                                                                                        // Percentual do INSS, não informar para nota de débito
            Servicos.perIrf := '';                                                                                        // Percential do IRRF do Serviço da Nota Fiscal de Saída, não informar para nota de débito
            Servicos.perIss := '';                                                                                        // Percentual do ISS do Serviço da Nota Fiscal de Saída, não informar para nota de débito
            Servicos.perPit := '';                                                                                        // Percentual do PIS retido, não informar para nota de débito
          end;
          Servicos.preUni := cdsItensFaturaprice.AsString;                                                                // Preço unitário
          Servicos.qtdFat := '1';                                                                                         // Quantidade do item de serviço

          {---------------------- Início Rateios ---------------------}
          Rateio := notafiscalGravarNotasFiscaisSaidaInDadosGeraisServicosRateio.Create;
          SetLength(ListaRateios, 1);
          ListaRateios[0] := Rateio;
          Servicos.rateio := ListaRateios;
          Rateio.codCcu := qryCustomerProfilecostCenter.AsString;                                                         // Centro de Custos
          Rateio.ctaFin := qryCustomerProfilecontaFinanceira.AsInteger;                                                   // Conta Financeira
          Rateio.vlrCta := StringReplace(FormatFloat('0.00', cdsItensFaturaprice.AsFloat), '.', ',', []);                 // Valor rateado para a conta
          Rateio.vlrRat := Rateio.vlrCta;                                                                                 // Valor rateado para o centro de custos
          {---------------------- Fim Rateios ------------------------}

          Servicos.seqIsv := Sequencial;                                                                                  // Incremental iniciado em 1
          Servicos.tnsSer := TipoOperacao;                                                                                // Informar 5949D/6949D (Operações com destaque de ISS), sendo 5949D vendas dentro do estado e 6949D para fora do estado

          XML.Add('          <servicos>');
          XML.Add('            <codSer>' + Servicos.codSer + '</codSer>');
          XML.Add('            <obsIsv/>');
          XML.Add('            <perCrt>' + Servicos.perCrt + '</perCrt>');
          XML.Add('            <perCsl>' + Servicos.perCsl + '</perCsl>');
          XML.Add('            <perIns>' + Servicos.perIns + '</perIns>');
          XML.Add('            <perIrf>' + Servicos.perIrf + '</perIrf>');
          XML.Add('            <perIss>' + Servicos.perIss + '</perIss>');
          XML.Add('            <perPit>' + Servicos.perPit + '</perPit>');
          XML.Add('            <preUni>' + Servicos.preUni + '</preUni>');
          XML.Add('            <qtdFat>' + Servicos.qtdFat + '</qtdFat>');
          XML.Add('            <rateio>');
          XML.Add('              <codCcu>' + Rateio.codCcu + '</codCcu>');
          XML.Add('              <ctaFin>' + IntToStr(Rateio.ctaFin) + '</ctaFin>');
          XML.Add('              <vlrCta>' + Rateio.vlrCta + '</vlrCta>');
          XML.Add('              <vlrRat>' + Rateio.vlrRat + '</vlrRat>');
          XML.Add('            </rateio>');
          XML.Add('            <seqIsv>' + IntToStr(Servicos.seqIsv) + '</seqIsv>');
          XML.Add('            <tnsSer>' + Servicos.tnsSer + '</tnsSer>');
          XML.Add('          </servicos>');
                                                                                                                          // Informar 5949R/6949R (Operações com retenção de ISS), sendo 5949R vendas dentro do estado e 6949R para fora do estado
          Inc(Sequencial);
          {---------------------- Fim Serviços -----------------------}

          cdsItensFatura.Next;
        end;

        DadosGerais.tipNfs := 1;                                                                                          // Tipo da nota fiscal de saída informar fixo 1
        DadosGerais.tnsSer := TipoOperacao;                                                                               // Informar 5949D/6949D (Operações com destaque de ISS), sendo 5949D vendas dentro do estado e 6949D para fora do estado
                                                                                                                          // Informar 5949R/6949R (Operações com retenção de ISS), sendo 5949R vendas dentro do estado e 6949R para fora do estado


        XML.Add('          <tipNfs>' + IntToStr(DadosGerais.tipNfs) + '</tipNfs>');
        XML.Add('          <tnsSer>' + DadosGerais.tnsSer + '</tnsSer>');
        XML.Add('        </dadosGerais>');
        {--------------------- Fim Dados Gerais ----------------------}
      end;
      NotaIn.fecNot := '0';                                                                                               // Indica se as notas devem ser fechadas - Lista: 1 = Sim, 2 = Não
      NotaIn.gerPar := 0;                                                                                                 // Indica se o Sapiens deve gerar as parcelas ou se deve considerar as parcelas enviadas no Web Service - Lista: 0 = Não, 1 = Sim
      NotaIn.gerarDocumentoEletronico := '0';                                                                             // Gerar Documento Eletrônico - Lista: 0 = Não, 1 = Sim.
      NotaIn.prcNfv := '1';                                                                                               // Procedência da Nota Fiscal de Saída - Enviar fixo 1 = Normal
      NotaIn.tipCal := 0;                                                                                                 // Indica se os Valores da nota devem ser recalculados pelo Sapiens - Lista: 0 = Sim, 1 = Não
      NotaIn.tipoProcessamento := TipoEnvio;                                                                              // Tipo de Processamento - Lista: 1 = Inclusão, 2 = Alteração, 3 = Cancelamento

      XML.Add('        <fecNot>' + NotaIn.fecNot + '</fecNot>');
      XML.Add('        <gerPar>' + IntToStr(NotaIn.gerPar) + '</gerPar>');
      XML.Add('        <gerarDocumentoEletronico>' + NotaIn.gerarDocumentoEletronico + '</gerarDocumentoEletronico>');
      XML.Add('        <prcNfv>' + NotaIn.prcNfv + '</prcNfv>');
      XML.Add('        <tipCal>' + IntToStr(NotaIn.tipCal) + '</tipCal>');
      XML.Add('        <tipoProcessamento>' + IntToStr(NotaIn.tipoProcessamento) + '</tipoProcessamento>');
      XML.Add('      </parameters>');
      XML.Add('    </ser:GravarNotasFiscaisSaida_2>');
      XML.Add('  </soapenv:Body>');
      XML.Add('</soapenv:Envelope>');
      if not DirectoryExists(Path + 'XML\') then
        ForceDirectories(Path + 'XML\');
      XML.SaveToFile(Path + 'XML\' + Processo + '.xml');

      if Sistema = _Homologacao then
        NotaOut := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalHomo.GravarNotasFiscaisSaida(Usuario, Senha, 0, NotaIn)
      else
        NotaOut := Getsapiens_Synccom_senior_g5_co_mcm_ven_notafiscalProd.GravarNotasFiscaisSaida(Usuario, Senha, 0, NotaIn);

      Result := (NotaOut.erroExecucao = '') and (AnsiIndexText(NotaOut.retornosNotasSaida[0].retorno, ['Ok']) >= 0) or (AnsiIndexText(NotaOut.mensagemRetorno, ['Ok']) >= 0);
      if not Result then
        FMensagemErro := NotaOut.retornosNotasSaida[0].retorno;
    finally
      FreeAndNil(NotaIn);
    end;
    Result := True;
  except
    on E: Exception do
    begin
      FMensagemErro := E.Message;
      Result := False;
    end;
  end;
end;

function TdtmEnvioERP.EnviarNota(AUsuario, ASenha: String; ANota, ASistema: Integer): Boolean;
begin
  Result := EnviarDadosNota(AUsuario, ASenha, ANota, ASistema, _Incluir);
end;

procedure TdtmEnvioERP.qryItensFaturaAfterOpen(DataSet: TDataSet);
var
  Cds: TClientDataSet;
  item_id: Integer;
begin
  if not cdsFaturaNumerarios.Active then
    cdsFaturaNumerarios.Open;
  cdsFaturaNumerarios.EmptyDataSet;

  if not cdsFaturaPagamentos.Active then
    cdsFaturaPagamentos.Open;
  cdsFaturaPagamentos.EmptyDataSet;

  if not cdsFaturaReceitas.Active then
    cdsFaturaReceitas.Open;
  cdsFaturaReceitas.EmptyDataSet;

  qryItensFatura.First;
  while not qryItensFatura.Eof do
  begin
    if CharInSet(qryItensFaturaTipo.AsString[1], ['n', 'N']) then
      Cds := cdsFaturaNumerarios
    else if CharInSet(qryItensFaturaTipo.AsString[1], ['p', 'P']) then
      Cds := cdsFaturaPagamentos
    else if CharInSet(qryItensFaturaTipo.AsString[1], ['r', 'R']) then
      Cds := cdsFaturaReceitas
    else
      Cds := nil;

    if Cds <> nil then
    begin
      Cds.Append;
      Cds.FieldByName('Billing_id').AsInteger := qryItensFaturaBilling_id.AsInteger;
      Cds.FieldByName('Tipo').AsString        := qryItensFaturaTipo.AsString;
      Cds.FieldByName('id').AsInteger         := qryItensFaturaid.AsInteger;
      Cds.FieldByName('destino').AsString     := qryItensFaturadestino.AsString;
      Cds.FieldByName('price').AsFloat        := qryItensFaturaprice.AsFloat;
      Cds.FieldByName('item_id').AsInteger    := qryItensFaturaitem_id.AsInteger;
      Cds.FieldByName('aKey').AsString        := qryItensFaturaaKey.AsString;
      Cds.FieldByName('name').AsString        := qryItensFaturaname.AsString;
      Cds.FieldByName('seniorKey').AsString   := qryItensFaturaseniorKey.AsString;
      Cds.FieldByName('type').AsString        := qryItensFaturatype.AsString;
      Cds.Post;
    end;

    qryItensFatura.Next;
  end;

  // Saldo de Numerários X Pagamentos
  if (cdsFaturaNumerarios.RecordCount > 0) and (cdsFaturaPagamentos.RecordCount > 0) then
  begin
    // Procurar Pagamentos nos Numerários
    cdsFaturaPagamentos.First;
    while not cdsFaturaPagamentos.Eof do
    begin
      item_id := cdsFaturaPagamentositem_id.AsInteger;
      cdsFaturaNumerarios.First;
      if cdsFaturaNumerarios.Locate('item_id', item_id, []) then
      begin
        if cdsFaturaNumerariosprice.AsFloat = cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Delete;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else if cdsFaturaNumerariosprice.AsFloat > cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Edit;
          cdsFaturaNumerariosprice.AsFloat := cdsFaturaNumerariosprice.AsFloat - cdsFaturaPagamentosprice.AsFloat;
          cdsFaturaNumerarios.Post;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else
        begin
          cdsFaturaPagamentos.Edit;
          cdsFaturaPagamentosprice.AsFloat := cdsFaturaPagamentosprice.AsFloat - cdsFaturaNumerariosprice.AsFloat;
          cdsFaturaPagamentos.Post;
          cdsFaturaNumerarios.Delete;
        end;
      end;
      cdsFaturaPagamentos.Next;
    end;

    // Se sobrou é porque tem item no Numerário que não está no Pagamento, e vice-versa... Ou, porque juntaram tudo num único item de numerário
    // Então, começa a subtrair todos os itens dos Pagamentos de todos os itens dos Numerários
    while (cdsFaturaNumerarios.RecordCount > 0) and (cdsFaturaPagamentos.RecordCount > 0) do
    begin
      cdsFaturaPagamentos.First;
      while (not cdsFaturaPagamentos.Eof) and (cdsFaturaNumerarios.RecordCount > 0) do
      begin
        cdsFaturaNumerarios.First;
        if cdsFaturaNumerariosprice.AsFloat = cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Delete;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else if cdsFaturaNumerariosprice.AsFloat > cdsFaturaPagamentosprice.AsFloat then
        begin
          cdsFaturaNumerarios.Edit;
          cdsFaturaNumerariosprice.AsFloat := cdsFaturaNumerariosprice.AsFloat - cdsFaturaPagamentosprice.AsFloat;
          cdsFaturaNumerarios.Post;
          cdsFaturaPagamentos.Delete;
          Continue;
        end
        else
        begin
          cdsFaturaPagamentos.Edit;
          cdsFaturaPagamentosprice.AsFloat := cdsFaturaPagamentosprice.AsFloat - cdsFaturaNumerariosprice.AsFloat;
          cdsFaturaPagamentos.Post;
          cdsFaturaNumerarios.Delete;
          cdsFaturaPagamentos.Next;
        end;
      end;
    end;
  end;

  if not cdsItensFatura.Active then
    cdsItensFatura.Open;
  cdsItensFatura.EmptyDataSet;

  cdsFaturaReceitas.First;
  while not cdsFaturaReceitas.Eof do
  begin
    cdsItensFatura.Append;
    cdsItensFaturaBilling_id.AsInteger := cdsFaturaReceitasBilling_id.AsInteger;
    cdsItensFaturaTipo.AsString        := cdsFaturaReceitasTipo.AsString;
    cdsItensFaturaid.AsInteger         := cdsFaturaReceitasid.AsInteger;
    cdsItensFaturadestino.AsString     := cdsFaturaReceitasdestino.AsString;
    cdsItensFaturaprice.AsFloat        := cdsFaturaReceitasprice.AsFloat;
    cdsItensFaturaitem_id.AsInteger    := cdsFaturaReceitasitem_id.AsInteger;
    cdsItensFaturaaKey.AsString        := cdsFaturaReceitasaKey.AsString;
    cdsItensFaturaname.AsString        := cdsFaturaReceitasname.AsString;
    cdsItensFaturaseniorKey.AsString   := cdsFaturaReceitasseniorKey.AsString;
    cdsItensFaturatype.AsString        := cdsFaturaReceitastype.AsString;
    cdsItensFatura.Post;

    cdsFaturaReceitas.Next;
  end;

  cdsFaturaPagamentos.First;
  while not cdsFaturaPagamentos.Eof do
  begin
    cdsItensFatura.Append;
    cdsItensFaturaBilling_id.AsInteger := cdsFaturaPagamentosBilling_id.AsInteger;
    cdsItensFaturaTipo.AsString        := cdsFaturaPagamentosTipo.AsString;
    cdsItensFaturaid.AsInteger         := cdsFaturaPagamentosid.AsInteger;
    cdsItensFaturadestino.AsString     := cdsFaturaPagamentosdestino.AsString;
    cdsItensFaturaprice.AsFloat        := cdsFaturaPagamentosprice.AsFloat;
    cdsItensFaturaitem_id.AsInteger    := cdsFaturaPagamentositem_id.AsInteger;
    cdsItensFaturaaKey.AsString        := cdsFaturaPagamentosaKey.AsString;
    cdsItensFaturaname.AsString        := cdsFaturaPagamentosname.AsString;
    cdsItensFaturaseniorKey.AsString   := cdsFaturaPagamentosseniorKey.AsString;
    cdsItensFaturatype.AsString        := cdsFaturaPagamentostype.AsString;
    cdsItensFatura.Post;

    cdsFaturaPagamentos.Next;
  end;

  cdsFaturaNumerarios.First;
  while not cdsFaturaPagamentos.Eof do
  begin
    cdsItensFatura.Append;
    cdsItensFaturaBilling_id.AsInteger := cdsFaturaNumerariosBilling_id.AsInteger;
    cdsItensFaturaTipo.AsString        := cdsFaturaNumerariosTipo.AsString;
    cdsItensFaturaid.AsInteger         := cdsFaturaNumerariosid.AsInteger;
    cdsItensFaturadestino.AsString     := cdsFaturaNumerariosdestino.AsString;
    cdsItensFaturaprice.AsFloat        := cdsFaturaNumerariosprice.AsFloat;
    cdsItensFaturaitem_id.AsInteger    := cdsFaturaNumerariositem_id.AsInteger;
    cdsItensFaturaaKey.AsString        := cdsFaturaNumerariosaKey.AsString;
    cdsItensFaturaname.AsString        := cdsFaturaNumerariosname.AsString;
    cdsItensFaturaseniorKey.AsString   := cdsFaturaNumerariosseniorKey.AsString;
    cdsItensFaturatype.AsString        := cdsFaturaNumerariostype.AsString;
    cdsItensFatura.Post;

    cdsFaturaNumerarios.Next;
  end;
end;

function TdtmEnvioERP.ValidaSistema(ASistema: Integer): Boolean;
begin
  Result := ASistema in [_Homologacao, _Producao];
  if not Result then
    FMensagemErro := 'Sistema inválido.'#13#10'Utilize:'#13#10'0 - Homologação'#13#10'1 - Produção';
end;

function TdtmEnvioERP.ValidaTipo(ATipo: Integer): Boolean;
begin
  Result := ATipo in [_Incluir, _Alterar, _Cancelar];
  if not Result then
    FMensagemErro := 'Tipo inválido.'#13#10'Utilize:'#13#10'1 - Incluir'#13#10'2 - Alterar'#13#10'3 - Cancelar';
end;


end.

unit IntegraSG;

interface

uses
  Classes, SysUtils, StrUtils, Windows, Variants, ADODB, uFuncoes, DateUtils, Math;

function LerArquivoSG(NmServer, TxArquivo, CdUsuario: OleVariant): OleVariant;
function LerArquivoFesto(NmServer, TxArquivo, CdUsuario: OleVariant): OleVariant;

{type
  TIntegraSG = class(TObject)
  published
    Constructor Create;
    Destructor Destroy;
  end;
}

var
  Erros: TStrings;

implementation

{uses DB;}

const
  _TAMANHO_DE_PARA = 15;
  _SERVICO         = '475';
  _EXPORTADOR      = '00000';

  _TABELA_TIPO_DECLARACAO       = 56;
  _TABELA_IMPORTADOR            = 57;
  _TABELA_CONSIGNATARIO         = 58;
  _TABELA_TRANSPORTADOR_INT     = 59;
  _TABELA_VEICULO_TRANSPORTE    = 60;
  _TABELA_TIPO_MANIFESTO        = 61;
  _TABELA_TIPO_DOCUMENTO_CARGA  = 62;
  _TABELA_LOCAL_EMBARQUE        = 63;
  _TABELA_AGENTE_CARGA          = 64;
  _TABELA_EXPORTADOR            = 65;
  _TABELA_FABRICANTE            = 66;
  _TABELA_FABRICANTE_EXPORTADOR = 67;
  _TABELA_CONTATO               = 70;
  _TABELA_AREA                  = 71;

var
  Connection: TADOConnection;
  qryConsulta: TADOQuery;
  cmdExec: TADOCommand;
  InstDesemb: String;
  CodUsuario: String;
  Cliente: String;
  GrupoArquivo, Prefixo : String;
  NomeArquivoFesto: String;
type
   TDePara = record
    Codigo: String;
    Texto: String;
  end;

  TDIFestoItem = record                        //Tamanho	Início	Fim
    NCMMaterial: String;                       //20	        11	  30
    ItemDocumento: String;                     //5	        41	  45
    NumeroMaterial: String;                    //10	        46	  55
    TextoMaterial: String;                     //100	      56  	155
    Quantidade: Double;                        //10	        156	  165
    PesoMaterial: Double;                      //15	        166	  180
    PrecoUnitario: Double;                     //15	        181	  195
    PrecoTotal: Double;                        //15	        196  	210
    TaxaICMS: Double;                          //5	        211	  215
    ValorEmbalagem: Double;                    //15	        226 	240
    ValorPIS: Double;                          //6	        241	  246
    ValorCOFINS: Double;                       //6	        247	  252
    CFOP: String;                              //6          253   258
    UnidadeMedida: string;                     //2          259   260
    NrFatura: string;                          //20         263   282
    TextoMaterialCompleto: String;             //500	      283  	782
    NomeFabricante: String;                    //35  	      816  	850
    PaisFabricante: String;                    //3          851   853
    EnderecoFabricante: String;                //35 	      854  	888
    CidadeFabricante: String;                  //30	        889  	918
  end;

  TDIFestoItens = array of TDIFestoItem;

  TDIFesto = record                            //Tamanho  Início  Fim
    Processo: String;                          //10         1     10
    DocumentoFaturamento: String;              //10	        31   	40
    Itens: TDIFestoItens;
  end;

  TArquivoFesto = array of TDIFesto;
                                                  // Ini - Fim - Descrição
  TITDI = record
    Data: TDateTime;                                  // 005 - 010 - DDMMAA
    Hora: TDateTime;                                  // 011 - 016 - HHMMSS
    CNPJ: String;                                 // 017 - 030 - CNPJ do importador - informação digitada no cadastro de Importadores (YT_CGC)
    Nome_Usuario: String;                         // 031 – 050 - Usuário do sistema Protheus
    Nome_Recebedor: String;                       // 051 – 090 - Nome do despachante a receber o arquivo. Digitado em Cadastro de Despachantes ( Y5_NOME)  end;
  end;

  TCAPI = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    Referencia_Cliente: String;                   // 020-039 - Preenchido com o número do processo (W6_HAWB ) para a fase DI , e número do pedido (W2_PO_NUM) para a fase PO
    Data_Processo: TDateTime;                         // 040-045 - DDMMAA
    Tipo_Declaracao: TDePara;                     // 046-047 - Nota2
    Indicador_Consig_Import: Boolean;             // 048-048 - Preenchido com T caso o campo de consignatário no pedido esteja vazio ( W2_CONSIG) caso contrário é preenchido com F
    Codigo_Importador: TDePara;                   // 049-052 - Nota1 - Preenchido com o código do importador descrito na Tabela De/Para (YU_GIP_1) para o importador corrente, se não existir a correspondência será utilizado o código digitado no cadastro de importadores (YT_COD_IMP)
    Codigo_Consignatario: TDePara;                // 053-056 - Nota1 - Preenchido com o código do consignatário descrito na Tabela De/Para (YU_GIP_1) para o consignatário se este estiver descrito no pedido (W2_CONSIG), caso não esteja na tabela será enviado o código digitado no pedido
    Indicador_FUNDAP: Boolean;                    // 057-057 - Preenchido com F fixo .
    Indicador_Cambio_Itens: Boolean;              // 058-058 - Preenchido com F fixo .
    URF_Despacho: String;                         // 070-076 - Nota2 - Preenchido somente na fase DI com a URF de despacho descrita na capa do desembaraço (W6_URF_DES)
    Modalidade_Despacho: String;                  // 086-086 - Nota5 - Somente preenchido na fase DI com a informação de modalidade ( W6_MODAL)
    Condicao_Mercadoria: String;                  // 087-087 - Nota12 - Fixo 1
    Aplicacao_Mercadoria: String;                 // 088-088 - Nota13 - Fixo 1
    Via_Transporte: String;                       // 089-090 - Nota2 - Código da via de transporte para a DI , definida no cadastro de vias de transporte, onde para a fase DI é utilizada a via de transporte definida no desembaraço, para a fase PO a via descrita no pedido.
    Indicador_Multimodal: Boolean;                // 091-091 - Se a via escolhida for marítma e aérea o campo é preenchido com T , senão, com F
    Codigo_Transportador_Int: TDePara;            // 092-095 - Nota1
          {Valores da tabela De/Para (YU_GIP_1) para o agente descrito se este existir, caso contrário o código Easy do agente
          Para a fase DI : utiliza-se o agente de carga digitado no desembaraço (W6_AGENTE)
          Para a fase PO : se for definido o código do agente internacional (W2_FORWARD) este é utilizado, caso contrário o código do agente no pedido (W2_AGENTE) é utilizado.}
    Nome_Veiculo_Transporte: TDePara;             // 111-140 - Somente para a fase DI utiliza-se o nome do veículo definido no desembaraço (W6_IDENTVE)
    Codigo_Bandeira_Veiculo: String;              // 141-143 - Nota2 - Somente para a fase DI caso esteja preenchido (W6_PAISVEI)
    Tipo_Manifesto: TDePara;                      // 144-144 - Nota7 - Somente para a fase DI é preenchido com o tipo do manifesto de carga (W6_TIPODOC)
    Numero_Manifesto: String;                     // 145-159 - Somente para a fase DI – número do manifesto (W6_IDEMANI)
    Tipo_Documento_Carga: TDePara;                // 160-161 - Nota8 - Somente para a fase DI - Tipo do documento de carga ( W6_TIPCON)
    Nr_Documento_Carga_Master: String;            // 162-172 - Somente para a fase DI : número do Master ( W6_MAWB)
    Nr_Documento_Carga_House: String;             // 173-183 - Somente para a fase DI – número do House (W6_HOUSE)
    Data_Emissao_Docto_Carga: TDateTime;              // 184-189 - DDMMAA - Somente para a fase DI – data do conhecimento de transporte (W6_HAWB)
    Codigo_Local_Embarque: TDePara;               // 190-199 - Nota1 - Para a fase DI, se estiver preenchido o campo de origem no desembaraço (W6_ORIGEM) é utilizada esta informação, se estiver vazio, ou a fase for PO , utiliza-se a sigla da Origem preenchida no pedido (W2_ORIGEM)
    Utilizacao_Carga: String;                     // 200-200 - Nota6 - Somente para a fase DI , quando estiver preenchido o campo de utilização de carga (W6_UTILCON)
    Data_Chegada_Carga: TDateTime;                    // 201-206 - DDMMAA - Apenas para a fase DI , é utilizada a data de atracação ( W6_CHEG)
    Peso_Bruto: Double;                           // 222-236 - Nota3 - Para a fase DI é utilizado o campo do desembaraço para peso bruto (W6_PESO_BR) , se este não estiver preenchido o valor será zero. Para a fase PO utiliza-se o peso bruto definido no pedido (W2_PESO_B)
    Pais_Procedencia: String;                     // 237-239 - Nota2 - Para a fase DI é utilizado o código do país de procedência preenchido na capa do desembaraço (W6_PAISPRO) . Para a fase PO é utilizado o país descrito no cadastro de Vias de Transporte ( YR_PAIS_OR) de acordo com a via (W2_TIPO_EMB), origem (W2_ORIGEM) e destino (W2_DESTINO) escolhido no pedido
    House: String;                                // 241-258 - Para a fase DI é utilizado o HOUSE / BL preenchido na pasta embarque na capa do desembaraço (W6_HOUSE). Para a fase PO é preenchido em branco
    Master: String;                               // 259-276 - Para a fase DI é utilizado o MASTER preenchido na pasta embarque na capa do desembaraço (W6_MAWB) . Para a fase PO é preenchido em branco
    Nr_Referencia_Arquivo: String;                // Nome do arquivo para Referência
    Area: TDePara;                                // Area baseada no Cliente
  end;

  TCAP2 = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    Codigo_Agente_Carga: TDePara;                 // 020-023 - Nota1
        {Valores da tabela De/Para (YU_GIP_1) para o agente descrito se este existir, caso contrário o código Easy do agente
        Para a fase DI : utiliza-se o agente de carga digitado no desembaraço (W6_AGENTE)
        Para a fase PO :o código do agente no pedido (W2_AGENTE) é utilizado.}
    URF_Entrada_Pais: String;                     // 024-030 - Nota2 - Somente fase DI : código Siscomex da URF de entrada preenchido no desembaraço (W6_URF_ENT)
    Recinto_Alfandegado: String;                  // 031-037 - Nota2 - Somente fase DI : código Siscomex do recinto alfandegário preenchido no desembaraço (W6_REC_ALF)
    Numero_Itens: String;                         // 038-040 - 001 - Quantidade de ítens descritos no arquivo
    Moeda_Frete: String;                          // 073-075 - Nota2 - Código Siscomex para a moeda do frete digitado no cadastro de moedas (YF_COD_GI) , de acordo com a moeda de frete informada no desembaraço para a fase DI (W6_FREMOED) ou a moeda informada no pedido para a fase PO (W2_MOEDA)
    Valor_Frete_PREPAID: Double;                  // 076-090 - Nota3 - Frete internacional- apenas na fase DI o valor do frete prepaid definido na capa do desembaraço (W6_VLFREPP)
    Valor_Frete_COLLECT: Double;                  // 091-105 - Nota3 - Frete internacional-apenas na fase DI o valor do frete collected definido na capa do desembaraço (W6_VLFRECC)
    Valor_Frete_Territorio_Nac: Double;           // 106-120 - Nota3 - Frete internacional –apenas na fase DI o valor do frete em território nacional definido na capa do desembaraço (W6_VLFRETN)
    Moeda_Seguro: String;                         // 121-123 - Nota2 - Código Siscomex para a moeda do seguro (W6_SEGMOED) digitado no cadastro de moedas (YF_COD_GI) – apenas na fase DI
    Tipo_Seguro: String;                          // 124-124 - Nota10 - Tipo de seguro – somente valor e fase DI – fixo V , para fase PO esta informação é enviada em branco
    Percentual_Seguro: Double;                    // 125-131 - Nota3 - Sempre enviado zero
    Valor_Seguro: Double;                         // 132-146 - Nota3 - Somente fase DI – valor do seguro na moeda negociada ( W6_VLUSSEG)
    Percentual_Comissao_Agente: Double;           // 183-188 - Nota3 - Customização utilizando a variável lDI_Cambio: Caso o processo já tenha sido incluído no Controle de Câmbio para ( Fase DI ) a comissão do agente descrita. (WB_COMAG)
    Indicador_Taxa_Juros: Boolean;                // 191-191 - Fixo F .
  end;

  TCAP3 = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    Valor_Cambio: Double;                         // 020-039 - Nota3 - Customização utilizando a variável lDI_Cambio: Na fase DI ,caso o processo esteja cadastrado no Controle de Câmbio e tenha apenas uma moeda – o valor total do processo – valor da mercadoria na moeda negociada (W6_VLMLEMN) + frete interno no país de origem :inland (W6_INLAND ) + despesas de empacotamento : packing (W6_PACKING) + frete internacional se este for prepaid (W6_FRETEIN) – desconto (W6_DESCONTO)
    Nr_ROF_BACEN: String;                         // 040-047 - Customização utilizando a variável lDI_Cambio: Caso o processo esteja cadastrado no Controle de Câmbio , o núrnero do ROF da primeira parcela não adiantada. (WB_NR_ROF) – Fase DI
  end;

  TITEA = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    Codigo_Produto: String;                       // 020-039 - Nota1 - Somente enviado o código do produto (código no importador) se o parâmetro MV_ITEDESP estiver ativo. (fase PO W5_COD_I , fase DI : W7_COD_I)
    Quantidade: Double;                           // 040-054 - Nota3 - Quantidade do produto : se fase PO e item anuente , quantidade na LI, não anuente, quantidade no pedido (em ambos os casos W3_QTDE quando W3_SEQ = 0), se fase DI , quantidade no desembaraço (W7_QTDE), se o item já tiver invoice, quantidade na invoice (W8_QTDE)
    Codigo_Unidade: String;                       // 055-056 - Nota2 - O código da unidade enviado é o código do Siscomex que está definido no cadastro de unidades (AH_COD_SIS) . A unidade base para este código é a unidade descrita no cadastro de ligação produtoxfabricantexfornecedor (A5_UNID) , caso esteja em branco, será a unidade descrita no cadastro de produtos (B1_UM). Para os sistemas integrados com os módulos Siga, que utilizarem segunda unidade de medida ( MV_UNIDCOM) será utilizado o código descrito na SC (C1_SEGUM) para busca no cadastro
    Peso_Liquido: Double;                         // 057-068 - Nota3 - O peso unitário utilizado segue o seguinte critério : se o peso existir no desembaraço ( fase DI) este será o utillizado (W7_PESO) , caso não exista, para itens anuentes será o definido na LI (W5_PESO) , para itens não anuentes o peso indicado no cadastro de itens (B1_PESO) . O peso enviado não é o peso unitário e sim este multiplicado pela quantidade
    Valor_Unitario: Double;                       // 069-080 - Nota3 - Na fase DI, caso o item esteja associado a uma invoice ,este valor será o valor do INCOTERM – (W8_PRECO+W8_INLAND+W8_OUTDES+W8_PACKIN+ W8_FRETEIN-W8_DESCONT) ,caso não tenha invoice , ainda no desembaraço será utilizado o preço do item (W7_PRECO) , para a fase PO , o preço é o do pedido (W3_PRECO) com as despesas do pedido rateadas pelo valor fob (W2_INLAND+W2_OUT_DES+W2_PACKIN+ W2_FRETEIN-W2_DESCONT)
    Tipo_Calculo: String;                         // 081-081 - Nota14 - Fixo 1
    Filler: String;                               // 099-099 - Nota4 - Vinculação : 1 – Fabricante é o mesmo que o fornecedor. 2 Fabricante não é o fornecedor.
    Codigo_Exportador: TDePara;                   // 100-103 - Nota1 - Código do fornecedor no despachante vindo da tabela De/Para (YU_GIP_1) , fase PO :fornecedor do item do pedido (W3_FORN) ,fase DI : fornecedor do item do desembaraço (W7_FORN) ou da invoice (W8_FORN)
    Codigo_Fabricante: TDePara;                   // 104-107 - Nota1 - Código do fabricante despachante vindo da tabela De/Para (YU_GIP_1) , fase PO :fabricante do item do pedido (W3_FABR ,fase DI : fabricante do item do desembaraço (W7_FABR) ou do item da invoice (W8_FABR)
    Codigo_Pais_Origem: String;                   // 108-110 - Nota2 - Código Siscomex do país do fabricante ( fabricante acima descrito) – informado no cadastro de fornecedores / fabricante (A2_PAIS)
    Codigo_Pais_Aquisicao: String;                // 111-113 - Nota2 - Código Siscomex do país do fornecedor ( fornecedor descrito acima) – informado no cadastro de fornecedores / fabricante (A2_PAIS)
    NCM_SH: String;                               // 114-123 - Nota1 - Para a fase DI , NCM é descrita no desembaraço (W7_TEC) , para a fase PO a NCM é a informada na LI (W5_NCM) ou pedido (W3_TEC)
    NALADI_SH: String;                            // 196-205 - Nota1 - NALADI SH – vindo do cadastro de NCM (YD_NAL_SH)
    Sequencia_Item_Processo: Integer;             // 237-240 - 0001 - Sequencia do item no arquivo para o processo em questão ( PO ou DI)
  end;

  TITEB = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    NALADI_NCCA: String;                          // 020-029 - NALADI NCCA– vindo do cadastro de NCM (YD_NALADI)
    Aplicacao_Mercadoria: String;                 // 069-069 - Nota13 - Classificação da mercadoria – informada na SI e conforme nota 2 (W1_CLASS)
    Moeda_Negociada: String;                      // 082-084 - Nota2 - Código Siscomex presente no cadastro de moedas (YF_COD_GI) de acordo com a moeda na fase PO (W2_MOEDA) .Se o item estiver associado a uma invoice, na fase DI é utilizada a moeda da invoice (W9_MOE_FOB)
    INCOTERM: String;                             // 085-087 - Nota2 - Sigla do Incoterm cadastrado no pedido na fase PO ou DI quando não há invoices (W2_INCOTER) .Se o item estiver associado a uma invoice, na fase DI é utilizada o incoterm da invoice (W9_INCOTER)
    Acordo_ALADI: String;                         // 102-104 - Nota2 - ALADI – vindo do cadastro de NCM (YD_ALADI)
    Aliquotas_Ad_Valorem_II: Double;              // 133-139 - Nota3 - Aliquota de imposto de importação – vindo do cadastro de NCM (YD_PER_II)
    Codigo_Unidade_Medida_II: String;             // 173-174 - Nota2 - Código Siscomex (AH_COD_SIS) da unidade de medida estatística presente no cadastro de NCM (YD_UNID)
    Aliquotas_IPI: Double;                        // 209-215 - Nota3 - Aliquota de imposto sobre produtos industrializados – vindo do cadastro de NCM (YD_PER_IPI)
    Licenca_Importacao: String;                   // 230-239 - Número da Licença de Importação se houver (WP_REGIST) .
  end;

  TITEC = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    Tipo_Cambio: String;                          // 112-112 - Nota20 - Informação do cadastro de condições de pagamento (Y6_TIPOCOB) de acordo com a condição definida na invoice (W9_COND_PA + W9_DIAS_PA) se houver , na fase DI , ou na condição definida no pedido (W2_COND_PA+W2_DIAS_PA) na fase PO (ou fase DI sem invoice)
    Modalidade_Pagto: String;                     // 123-124 - Nota2 - Preenchido apenas para Tipo de Cambio igual a 1 ou 2 com a informação contida em modalidade de pagamento no cadastro de condições de pagamento (Y6_TABELA)
    Indicador_Taxa_Juros: Boolean;                // 125-125 - Fizo F
    Nr_Parcelas: Integer;                         // 140-142 - Nota3 - Se a condição de pagamento apurada for parcelada (Y6_DIAS_PA maior ou igual a 900) , é enviada a quantidade de parcelas definidas pelos campos de porcentagem da condição de pagamento que estiverem preenchidos (Y6_PERC_?)
    Periodicidade: String;                        // 143-145 - Nota3 - Campo de dias indicado no cadastro de condições de pagamento (Y6_DIAS)
    Intituicao_Financiadora: String;              // 159-160 - Nota2 - Se o tipo de câmbio for igual a 3, é enviada a instituição financiadora escolhida no cadastro de condições de pagamento ( Y6_INST_FI)
    Motivo_Cobertura: String;                     // 181-182 - Nota2 - Se o tipo de câmbio for igual a 4 , envia-se o motivo do cadastro de condições de pagamento (Y6_MOTIVO)
    Via_Transporte: String;                       // 225-226 - Nota2 - Código Siscomex da via de transporte no cadastro de vias (YQ_COD_DI) . A via é definida no pedido na para envio na fase PO (W2_TIPO_EMB) e no embarque/desembaraço na fase DI (W6_VIA_TRA)
    Indicador_Multimodal: Boolean;                // 237-237 - Se a via for marítima e aérea ( Y6_DESCR for SEA/AIR) é enviado T senão é enviado F
  end;

  TITED = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    Peso_Liquido: Double;                         // 020-038 - Nota1 - O peso unitário utilizado segue o seguinte critério : se o peso existir no desembaraço ( fase DI) este será o utillizado (W7_PESO) , caso não exista, para itens anuentes será o definido na LI (W5_PESO) , para itens não anuentes o peso indicado no cadastro de itens (B1_PESO) . O peso enviado não é o peso unitário e sim este multiplicado pela quantidade
    Numero_Pedido_Compras: String;                // 039-053 - Nota3 - Número do pedido do Easy (W3_PO_NUM ,para fase PO, para fase DI com invoice W8_PO_NUM, sem invoice (W7_PO_NUM)
    Posicao_Item_Pedido: String;                 // 054-057 - Posição do item no pedido do Easy (W3_POSICAO ,para fase PO, para fase DI com invoice W8_POSICAO, sem invoice (W7_POSICAO)
    Numero_Pedido_Lincenciamento: String;         // 058-067 - Somente para fase DI – número da PLI no Easy (W7_PGI_NUM) ( independente do item ser ou não anuente)
    Invoice: String;                              // 241-255 - Fase DI é preenchido com a Invoice (W9_INVOICE), fase PO é preenchido em branco .
  end;

  TDPnn = record
    Nr_Processo: String;                          // 005-019 - Preenchido com o número do processo (W6_HAWB) para a fase DI ( apenas as 15 primeiras posições), e número do pedido (W2_PO_NUM) para a fase PO
    Descricao: String;                            // 040-240 - Descrição detalhada do item do pedido ou embarque que se encontra no cadastro de produtos – descrição para LI/DI ( B1_DESC_GI – campo virtual)
  end;

  TAG4A = record
    Razao_Social: String;                         // 005-064 - Razão social do fabricante/fornecedor(exportador) (A2_NOME)
    Logradouro: String;                           // 065-144 - Endereço do fabricante/fornecedor(exportador) (A2_END)
    Numero: String;                               // 215-220 - Número do endereço do fabricante/fornecedor(exportador) (A2_NR_END)
    Codigo_Pais: String;                          // 221-223 - Nota2 - Código Siscomex para o país do fabricante/fornecedor(exportador) informado no cadastro de fabricantesxfornecedores (A2_PAIS)
    Codigo_Fabricante_Exportador: TDePara;        // 224-227 - Preenchido com o código do fornecedor/exportador/fabricante descrito na Tabela De/Para (YU_GIP_1) para o importador corrente, se não existir a correspondência será utilizado o código digitado no pedido/ embarque (fase PO W3_FORN./W3_FABR , fase DI :W7_FORN/W7_FABR com invoice W8_FORN/W8_FABR)
  end;

  TAG4B = record
    Nome_Reduzido: String;                        // 005-029 - Nome reduzido do fabricante/fornecedor /exportador no cadastro (A2_NREDUZ)
    Estado: String;                               // 030-054 - Estado do fabricante/fornecedor /exportador no cadastro (A2_ESTADO)
    TeleFone: String;                             // 055-074 - Fone /Fax do fabricante/fornecedor /exportador no cadastro (A2_FAX)
    Idioma: String;                               // 075-075 - Nota22 - Fixo P
    Contato: TDePara;                             // 076-115 - Contato registrado no cadastro de fabricantes/fornecedores (A2_CONTATO)
  end;

  TFTDI = record
    Qtde_Processos_Transmitidos: Integer;         // 005 - 008 - Nota3 - Número de processos por arquivo
  end;

  TItem = record
    ITEA: TITEA;
    ITEB: TITEB;
    ITEC: TITEC;
    ITED: TITED;
    DPnn: TDPnn;
  end;

  TItemList = array of TItem;

  TCapa = record
    CAPI: TCAPI;
    CAP2: TCAP2;
    CAP3: TCAP3;
    Itens: TItemList;
  end;

  TCapaList = array of TCapa;

  TAG = record
    AG4A: TAG4A;
    AG4B: TAG4B;
  end;

  TAGList = array of TAG;

  TArquivoSG = record
    ITDI: TITDI;
    CAP: TCapaList;
    AGs: TAGList;
    FTDI: TFTDI;
  end;


{ Funções Diversas }

function Copy(AStr: String; AStart, AFinish: Integer; ATrim: Boolean = True): String;
begin
  if ATrim then
    Result := Trim(System.Copy(AStr, AStart, AFinish - AStart + 1))
  else
    Result := System.Copy(AStr, AStart, AFinish - AStart + 1);
end;

function DDMMAAToDate(S: String): TDateTime;
begin
  if not TryStrToDate(System.Copy(S, 1, 2) + '/' + System.Copy(S, 3, 2) + '/' + System.Copy(S, 5, 2), Result) then
    Result := 0;
end;

function HHMMSSToTime(S: String): TDateTime;
begin
  if not TryStrToTime(System.Copy(S, 1, 2) + ':' + System.Copy(S, 3, 2) + ':' + System.Copy(S, 5, 2), Result) then
    Result := 0;
end;

function StrToFloat(S: String; ZeroIfBlank: Boolean = False): Double;
begin
  if ZeroIfBlank and (Trim(S) = '') then
    Result := 0
  else
    Result := SysUtils.StrToFloat(StringReplace(Trim(S), '.', ',', []));
end;


{ Leitura de Linhas do Arquivo }

function LerITDI(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}

  C := Erros.Count;
  with ArquivoSG.ITDI do
  begin
    if (Length(ALinha) < 051) then
      Erros.Add('Linha ITDI incompleta.')
    else
    begin
      Data           := DDMMAAToDate(Copy(ALinha, 005, 010)); // 005 - 010
      Hora           := HHMMSSToTime(Copy(ALinha, 011, 016)); // 011 - 016
      CNPJ           := Copy(ALinha, 017, 030); // 017 - 030
      Nome_Usuario   := Copy(ALinha, 031, 050); // 031 – 050
      Nome_Recebedor := Copy(ALinha, 051, 090); // 051 – 090
    end;
  end;
  Result := Erros.Count = C;
end;

function LerCAPI(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
  {if Erros = nil then
    Erros := TstringList.Create;}
    
  C := Erros.Count;
  SetLength(ArquivoSG.CAP, High(ArquivoSG.CAP) + 2);
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].CAPI do
  begin
    if (Length(ALinha) < 240) then
      Erros.Add('Linha CAPI incompleta.')
    else
    begin
      Nr_Processo                    := Copy(ALinha, 005, 019); // 005-019
      Referencia_Cliente             := Copy(ALinha, 020, 039); // 020-039
      Data_Processo                  := DDMMAAToDate(Copy(ALinha, 040, 045)); // 040-045
      Tipo_Declaracao.Texto          := Copy(ALinha, 046, 047); // 046-047
      Indicador_Consig_Import        := SameText(Copy(ALinha, 048, 048), 'T'); // 048-048
      Codigo_Importador.Texto        := Copy(ALinha, 049, 052); // 049-052
      Codigo_Consignatario.Texto     := Copy(ALinha, 053, 056); // 053-056
      Indicador_FUNDAP               := SameText(Copy(ALinha, 057, 057), 'T'); // 057-057
      Indicador_Cambio_Itens         := SameText(Copy(ALinha, 058, 058), 'T'); // 058-058
      URF_Despacho                   := Copy(ALinha, 070, 076); // 070-076
      Modalidade_Despacho            := Copy(ALinha, 086, 086); // 086-086
      Condicao_Mercadoria            := Copy(ALinha, 087, 087); // 087-087
      Aplicacao_Mercadoria           := Copy(ALinha, 088, 088); // 088-088
      Via_Transporte                 := RightStr('0' + Copy(ALinha, 089, 090), 2); // 089-090
      Indicador_Multimodal           := SameText(Copy(ALinha, 091, 091), 'T'); // 091-091
      Codigo_Transportador_Int.Texto := Copy(ALinha, 092, 095); // 092-095
      Nome_Veiculo_Transporte.Texto  := Copy(ALinha, 111, 140); // 111-140
      Codigo_Bandeira_Veiculo        := Copy(ALinha, 141, 143); // 141-143
      Tipo_Manifesto.Texto           := Copy(ALinha, 144, 144); // 144-144
      Numero_Manifesto               := Copy(ALinha, 145, 159); // 145-159
      Tipo_Documento_Carga.Texto     := Copy(ALinha, 160, 161); // 160-161
      Nr_Documento_Carga_Master      := Copy(ALinha, 162, 172); // 162-172
      Nr_Documento_Carga_House       := Copy(ALinha, 173, 183); // 173-183
      Data_Emissao_Docto_Carga       := DDMMAAToDate(Copy(ALinha, 184, 189)); // 184-189
      Codigo_Local_Embarque.Texto    := Copy(ALinha, 190, 199); // 190-199
      Utilizacao_Carga               := Copy(ALinha, 200, 200); // 200-200
      //Data_Chegada_Carga             := DDMMAAToDate(Copy(ALinha, 201, 206)); // 201-206
      Peso_Bruto                     := StrToFloat(Copy(ALinha, 222, 236)); // 222-236
      Pais_Procedencia               := Copy(ALinha, 237, 239); // 237-239
      House                          := Copy(ALinha, 241, 258); // 241-258
      Master                         := Copy(ALinha, 259, 276); // 259-276
    end;
  end;
  Result := Erros.Count = C;
end;

function LerCAP2(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
  valor :string;
begin
  {if Erros = nil then
    Erros := TstringList.Create;}
    
  C := Erros.Count;
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].CAP2 do
  begin
    if (Length(ALinha) < 191) then
      Erros.Add('Linha CAP2 incompleta.')
    else
    begin
      Nr_Processo                := Copy(ALinha, 005, 019); // 005-019
      Codigo_Agente_Carga.Texto  := Copy(ALinha, 020, 023); // 020-023
      URF_Entrada_Pais           := Copy(ALinha, 024, 030); // 024-030
      Recinto_Alfandegado        := Copy(ALinha, 031, 037); // 031-037
      Numero_Itens               := Copy(ALinha, 038, 040); // 038-040
      Moeda_Frete                := Copy(ALinha, 073, 075); // 073-075

      valor := Copy(ALinha, 076, 090); // 076-090
      if valor <> '' then
        Valor_Frete_PREPAID      := StrToFloat(valor)
      else
        Valor_Frete_PREPAID      := 0;
   //   Valor_Frete_PREPAID      := StrToFloat(Copy(ALinha, 076, 090)); // 076-090


      valor := Copy(ALinha, 091, 105); // 091-105
      if valor <> '' then
        Valor_Frete_COLLECT      := StrToFloat(valor)
      else
        Valor_Frete_COLLECT      := 0;
      //Valor_Frete_COLLECT      := StrToFloat(Copy(ALinha, 091, 105)); // 091-105


      valor := Copy(ALinha, 106, 120); // 106-120
      if valor <> '' then
        Valor_Frete_Territorio_Nac := StrToFloat(valor)
      else
        Valor_Frete_Territorio_Nac := 0;
      //Valor_Frete_Territorio_Nac := StrToFloat(Copy(ALinha, 106, 120)); // 106-120


      Moeda_Seguro               := Copy(ALinha, 121, 123); // 121-123
      Tipo_Seguro                := Copy(ALinha, 124, 124); // 124-124


      valor := Copy(ALinha, 125, 131); // 125-131
      if valor <> '' then
        Percentual_Seguro          := StrToFloat(valor)
      else
        Percentual_Seguro          := 0;
     // Percentual_Seguro          := StrToFloat(Copy(ALinha, 125, 131)); // 125-131


      valor := Copy(ALinha, 132, 146); // 132-146
      if valor <> '' then
        Valor_Seguro    := StrToFloat(valor)
      else
        Valor_Seguro    := 0;
      //Valor_Seguro    := StrToFloat(Copy(ALinha, 132, 146)); // 132-146


      valor := Copy(ALinha, 183, 188); // 183-188
      if valor <> '' then
        Percentual_Comissao_Agente := StrToFloat(valor)
      else
        Percentual_Comissao_Agente := 0;
     // Percentual_Comissao_Agente := StrToFloat(Copy(ALinha, 183, 188)); // 183-188

     
      Indicador_Taxa_Juros       := SameText(Copy(ALinha, 191, 191), 'T'); // 191-191
    end;
  end;
  Result := Erros.Count = C;
end;

function LerCAP3(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
  {if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].CAP3 do
  begin
    if (Length(ALinha) < 040) then
      Erros.Add('Linha CAP3 incompleta.')
    else
    begin
      Nr_Processo  := Copy(ALinha, 005, 019); // 005-019
      Valor_Cambio := StrToFloat(Copy(ALinha, 020, 039)); // 020-039
      Nr_ROF_BACEN := Copy(ALinha, 040, 047); // 040-047
    end;
  end;
  Result := Erros.Count = C;
end;

function LerITEA(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  SetLength(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens, High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens) + 2);
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens[High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)].ITEA do
  begin
    if (Length(ALinha) < 237) then
      Erros.Add('Linha ITEA ' + IntToStr(High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)) + ' incompleta.')
    else
    begin
      Nr_Processo             := Copy(ALinha, 005, 019); // 005-019
      Codigo_Produto          := Copy(ALinha, 020, 039); // 020-039
      Quantidade              := StrToFloat(Copy(ALinha, 040, 054)); // 040-054
      Codigo_Unidade          := Copy(ALinha, 055, 056); // 055-056
      Peso_Liquido            := StrToFloat(Copy(ALinha, 057, 068)); // 057-068
      Valor_Unitario          := StrToFloat(Copy(ALinha, 069, 080)); // 069-080
      Tipo_Calculo            := Copy(ALinha, 081, 081); // 081-081
      Filler                  := Copy(ALinha, 099, 099); // 099-099
      Codigo_Exportador.Texto := Copy(ALinha, 100, 103); // 100-103
      Codigo_Fabricante.Texto := Copy(ALinha, 104, 107); // 104-107
      Codigo_Pais_Origem      := Copy(ALinha, 108, 110); // 108-110
      Codigo_Pais_Aquisicao   := Copy(ALinha, 111, 113); // 111-113
      NCM_SH                  := Copy(ALinha, 114, 123); // 114-123
      NALADI_SH               := Copy(ALinha, 196, 205); // 196-205
      Sequencia_Item_Processo := StrToInt(Copy(ALinha, 237, 240)); // 237-240
    end;
  end;
  Result := Erros.Count = C;
end;

function LerITEB(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
  {if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens[High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)].ITEB do
  begin
    if (Length(ALinha) < 230) then
      Erros.Add('Linha ITEB ' + IntToStr(High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)) + ' incompleta.')
    else
    begin
      Nr_Processo              := Copy(ALinha, 005, 019);                   // 005-019
      NALADI_NCCA              := Copy(ALinha, 020, 029);                   // 020-029
      Aplicacao_Mercadoria     := Copy(ALinha, 069, 069);                   // 069-069
      Moeda_Negociada          := Copy(ALinha, 082, 084);                   // 082-084
      INCOTERM                 := Copy(ALinha, 085, 087);                   // 085-087
      Acordo_ALADI             := Copy(ALinha, 102, 104);                   // 102-104
      Aliquotas_Ad_Valorem_II  := StrToFloat(Copy(ALinha, 133, 139), True); // 133-139
      Codigo_Unidade_Medida_II := Copy(ALinha, 173, 174);                   // 173-174
      Aliquotas_IPI            := StrToFloat(Copy(ALinha, 209, 215), True); // 209-215
      Licenca_Importacao       := Copy(ALinha, 230, 239);                   // 230-239
    end;
  end;
  Result := Erros.Count = C;
end;

function LerITEC(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
  valor :string;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens[High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)].ITEC do
  begin
    if (Length(ALinha) < 237) then
      Erros.Add('Linha ITEC ' + IntToStr(High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)) + ' incompleta.')
    else
    begin
      Nr_Processo             := Copy(ALinha, 005, 019); // 005-019
      Tipo_Cambio             := Copy(ALinha, 112, 112); // 112-112
      Modalidade_Pagto        := Copy(ALinha, 123, 124); // 123-124
      Indicador_Taxa_Juros    := SameText(Copy(ALinha, 125, 125), 'T'); // 125-125

      valor := Copy(ALinha, 140, 142); // 140-142
      if valor <> '' then
        Nr_Parcelas           := strtoint(valor)
      else
        Nr_Parcelas           := 0;

      valor := Copy(ALinha, 143, 145); // 143-145
      if valor <> '' then
        Periodicidade           := valor
      else
        Periodicidade           := '000';

      Intituicao_Financiadora := Copy(ALinha, 159, 160); // 159-160
      Motivo_Cobertura        := Copy(ALinha, 181, 182); // 181-182
      Via_Transporte          := RightStr('0' + Copy(ALinha, 225, 226), 2); // 225-226
      Indicador_Multimodal    := SameText(Copy(ALinha, 237, 237), 'T'); // 237-237
    end;
  end;
  Result := Erros.Count = C;
end;

function LerITED(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens[High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)].ITED do
  begin
    if (Length(ALinha) < 200) then
      Erros.Add('Linha ITED ' + IntToStr(High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)) + ' incompleta.')
    else
    begin
      Nr_Processo                  := Copy(ALinha, 005, 019); // 005-019
      Peso_Liquido                 := StrToFloat(Copy(ALinha, 020, 038)); // 020-038
      Numero_Pedido_Compras        := Copy(ALinha, 039, 053); // 039-053
      Posicao_Item_Pedido          := Copy(ALinha, 054, 057); // 054-057
      Numero_Pedido_Lincenciamento := Copy(ALinha, 058, 067); // 058-067
      Invoice                      := Copy(ALinha, 241, 255); // 241-255
    end;
  end;
  Result := Erros.Count = C;
end;

function LerDPnn(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
  {if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  with ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens[High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)].DPnn do
  begin
    if (Length(ALinha) < 040) then
      Erros.Add('Linha DPnn ' + IntToStr(High(ArquivoSG.CAP[High(ArquivoSG.CAP)].Itens)) + ' incompleta.')
    else
    begin
      Nr_Processo := Copy(ALinha, 005, 019); // 005-019
      Descricao   := Copy(ALinha, 040, 240); // 040-240
    end;
  end;
  Result := Erros.Count = C;
end;

function LerAG4A(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
{  if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  SetLength(ArquivoSG.AGs, High(ArquivoSG.AGs) + 2);
  with ArquivoSG.AGs[High(ArquivoSG.AGs)].AG4A do
  begin
    if (Length(ALinha) < 224) then
      Erros.Add('Linha AG4A ' + IntToStr(High(ArquivoSG.AGs)) + ' incompleta.')
    else
    begin
      Razao_Social                       := Copy(ALinha, 005, 064); // 005-064
      Logradouro                         := Copy(ALinha, 065, 144); // 065-144
      Numero                             := Copy(ALinha, 215, 220); // 215-220
      Codigo_Pais                        := Copy(ALinha, 221, 223); // 221-223
      Codigo_Fabricante_Exportador.Texto := Copy(ALinha, 224, 227); // 224-227
    end;
  end;
  Result := Erros.Count = C;
end;

function LerAG4B(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  with ArquivoSG.AGs[High(ArquivoSG.AGs)].AG4B do
  begin
    if (Length(ALinha) < 076) then
      Erros.Add('Linha AG4B ' + IntToStr(High(ArquivoSG.AGs)) + ' incompleta.')
    else
    begin
      Nome_Reduzido := Copy(ALinha, 005, 029); // 005-029
      Estado        := Copy(ALinha, 030, 054); // 030-054
      TeleFone      := Copy(ALinha, 074, 074); // 055-074
      Idioma        := Copy(ALinha, 075, 075); // 075-075
      Contato.Texto := Copy(ALinha, 076, 115); // 076-115
    end;
  end;
  Result := Erros.Count = C;
end;

function LerFTDI(var ArquivoSG: TArquivoSG; ALinha: String): Boolean;
var
  C: Integer;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}
  C := Erros.Count;
  with ArquivoSG.FTDI do
  begin
    if (Length(ALinha) < 005) then
      Erros.Add('Linha FTDI incompleta.')
    else
    begin
      Qtde_Processos_Transmitidos := StrToInt(Copy(ALinha, 005, 008)); // 005 - 008
    end;
  end;
  Result := Erros.Count = C;
end;


{ Operações com Banco de Dados }

function ConsultaSQLPlanilha(ASQL: String): String;
begin
  if qryConsulta.Active then
    qryConsulta.Close;
  qryConsulta.SQL.Text := ASQL;
  qryConsulta.Open;
  Result := Trim(qryConsulta.Fields[0].AsString);
  qryConsulta.Close;
end;

function ConsultaDePara(ATabela: Integer; AValor: String): String;
begin
  AValor := StringReplace(LeftStr(Trim(AValor), _TAMANHO_DE_PARA), '''', '''''', [rfReplaceAll]);
  Result := Trim(ConsultaSQLPlanilha(Format(' SELECT CD_DDBROKER ' +
                                            ' FROM TDE_PARA (NOLOCK) ' +
                                            ' WHERE CD_UNID_NEG = ''07'' ' +
                                            '   AND CD_PRODUTO  = ''06'' ' +
                                            '   AND CD_TABELA   = %d ' +
                                            '   AND CD_EXTERNO  = ''%s'' ', [ATabela, AValor])));
end;

function ConsultaLookup(ATabela, ACampoRetorno, AFiltro: String): String;
var
  SQL: String;
begin
  SQL := 'SELECT ' + ACampoRetorno + ' FROM ' + ATabela;
  if AFiltro <> '' then
    SQL := SQL + ' WHERE ' + AFiltro;
  Result := ConsultaSQLPlanilha(SQL);
end;

procedure ExecuteSQL(ASQL: String);
begin
  cmdExec.CommandText := ASQL;
  cmdExec.Execute;
end;

procedure AjustaDePara(var ArquivoSG: TArquivoSG);
var
  I, C: Integer;
begin
  for C := 0 to High(ArquivoSG.CAP) do
  begin
    with ArquivoSG.CAP[C].CAPI do
    begin
      Tipo_Declaracao.Codigo          := Tipo_Declaracao.Texto; // Está vindo o código correto //ConsultaDePara(_TABELA_TIPO_DECLARACAO, Tipo_Declaracao.Texto);
      Codigo_Importador.Codigo        := ConsultaDePara(_TABELA_IMPORTADOR, Codigo_Importador.Texto);
      Codigo_Consignatario.Codigo     := ConsultaDePara(_TABELA_CONSIGNATARIO, Codigo_Consignatario.Texto);
      Codigo_Transportador_Int.Codigo := ConsultaDePara(_TABELA_TRANSPORTADOR_INT, Codigo_Transportador_Int.Texto);
      Nome_Veiculo_Transporte.Codigo  := ConsultaDePara(_TABELA_VEICULO_TRANSPORTE, Nome_Veiculo_Transporte.Texto);
      Tipo_Manifesto.Codigo           := ConsultaDePara(_TABELA_TIPO_MANIFESTO, Tipo_Manifesto.Texto);
      Tipo_Documento_Carga.Codigo     := ConsultaDePara(_TABELA_TIPO_DOCUMENTO_CARGA, Tipo_Documento_Carga.Texto);
      Codigo_Local_Embarque.Codigo    := ConsultaDePara(_TABELA_LOCAL_EMBARQUE, Codigo_Local_Embarque.Texto);
      Area.Codigo                     := ConsultaDePara(_TABELA_AREA, Cliente);
    end;

    with ArquivoSG.CAP[C].CAP2 do
    begin
      Codigo_Agente_Carga.Codigo := ConsultaDePara(_TABELA_AGENTE_CARGA, Codigo_Agente_Carga.Texto);
    end;

    for I := 0 to High(ArquivoSG.CAP[C].Itens) do
    begin
      with ArquivoSG.CAP[C].Itens[I].ITEA do
      begin
        Codigo_Exportador.Codigo := ConsultaDePara(_TABELA_EXPORTADOR, Codigo_Exportador.Texto);
        Codigo_Fabricante.Codigo := ConsultaDePara(_TABELA_FABRICANTE, Codigo_Fabricante.Texto);
      end;
    end;
  end;

  for I := 0 to High(ArquivoSG.AGs) do
  begin
    ArquivoSG.AGs[I].AG4A.Codigo_Fabricante_Exportador.Codigo := ConsultaDePara(_TABELA_FABRICANTE_EXPORTADOR,
       ArquivoSG.AGs[I].AG4A.Codigo_Fabricante_Exportador.Texto);
    ArquivoSG.AGs[I].AG4B.Contato.Codigo := ConsultaDePara(_TABELA_CONTATO, ArquivoSG.AGs[I].AG4B.Contato.Texto);
  end;
end;

function VerificaDeParas(ArquivoSG: TArquivoSG): Boolean;
var
  Msg: TStrings;
  P, I: Integer;
  procedure Verifica(ATipo: String; ADePara: TDePara);
  begin
    if (Trim(ADePara.Codigo) = '') and (ADePara.Texto <> '') and (Pos(ADePara.Texto, Msg.Text) < 1) then
      Msg.Add('Não encontrada referência para ' + ATipo + ' ''' + ADePara.Texto + '''');
  end;
begin
  {if Erros = nil then
    Erros := TstringList.Create;}

  Msg := TStringList.Create;
  try
    for P := 0 to High(ArquivoSG.CAP) do
    begin
      Verifica('CAPI.Tipo de Declaração' ,ArquivoSG.CAP[P].CAPI.Tipo_Declaracao);
      Verifica('CAPI.Código do Importador' ,ArquivoSG.CAP[P].CAPI.Codigo_Importador);
      Verifica('CAPI.Código do Consignatário' ,ArquivoSG.CAP[P].CAPI.Codigo_Consignatario);
      Verifica('CAPI.Código do Transportador Int' ,ArquivoSG.CAP[P].CAPI.Codigo_Transportador_Int);
      Verifica('CAPI.Nome do Veiculo de Transporte' ,ArquivoSG.CAP[P].CAPI.Nome_Veiculo_Transporte);
      Verifica('CAPI.Tipo do Manifesto' ,ArquivoSG.CAP[P].CAPI.Tipo_Manifesto);
      Verifica('CAPI.Tipo do Documento de Carga' ,ArquivoSG.CAP[P].CAPI.Tipo_Documento_Carga);
      Verifica('CAPI.Código do Local de Embarque' ,ArquivoSG.CAP[P].CAPI.Codigo_Local_Embarque);
      Verifica('CAPI.Código do Agente de Carga' ,ArquivoSG.CAP[P].CAP2.Codigo_Agente_Carga);
      for I := 0 to High(ArquivoSG.CAP[P].Itens) do
      begin
        Verifica('ITEA.Código do Exportador' ,ArquivoSG.CAP[P].Itens[I].ITEA.Codigo_Exportador);
        Verifica('ITEA.Código do Fabricante' ,ArquivoSG.CAP[P].Itens[I].ITEA.Codigo_Fabricante);
      end;
    end;

    for I := 0 to High(ArquivoSG.AGs) do
    begin
      Verifica('AG4A.Código do Fabricante/Exportador', ArquivoSG.AGs[I].AG4A.Codigo_Fabricante_Exportador);
      Verifica('AG4B.Contato', ArquivoSG.AGs[I].AG4B.Contato);
    end;

    Result := True;
    //Result := Msg.Count = 0;

    if Result then
    begin
      Erros.Add('');
      Erros.AddStrings(Msg);
      Erros.Add('');
    end;
  finally
    FreeAndNil(Msg);
  end;
end;

function VerificaMercadorias(ArquivoSG: TArquivoSG): Boolean;
var
  C, I, Cod: Integer;
begin
  for C := 0 to High(ArquivoSG.CAP) do
    for I := 0 to High(ArquivoSG.CAP[C].Itens) do
      with ArquivoSG.CAP[C], ArquivoSG.CAP[C].Itens[I].ITEA, ArquivoSG.CAP[C].Itens[I].DPnn do
      begin
        if Trim(Codigo_Produto) = '' then
          Codigo_Produto := ConsultaSQLPlanilha(' SELECT '''+ Prefixo + '-'' + CONVERT(VARCHAR, ISNULL(MAX(CONVERT(INT, RIGHT(RTRIM(ISNULL(CD_MERCADORIA, ''' + Prefixo + '-0'')), LEN(RTRIM(ISNULL(CD_MERCADORIA, ''' + Prefixo + '-0''))) - 3)) + 1), 0)) ' +
                                                ' FROM TMERCADORIA (NOLOCK) ' +
                                                ' WHERE CD_GRUPO = ''' + GrupoArquivo + '''' +
                                                '   AND CD_MERCADORIA LIKE ''' + Prefixo + '-%''');
        if ConsultaLookup('TMERCADORIA', 'CD_MERCADORIA', 'CD_MERCADORIA = ''' + Codigo_Produto + '''') = '' then
        begin
          qryConsulta.SQL.Clear;
          qryConsulta.SQL.Add('INSERT INTO TMERCADORIA(CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, CD_NCM_SH, CD_EXPORTADOR, CD_PAIS_ORIGEM, CD_FABRICANTE, CD_GRUPO,');
          qryConsulta.SQL.Add('                        CD_AREA, NM_MERC_RESUMIDA, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO)');
          qryConsulta.SQL.Add('VALUES(:CD_MERCADORIA, :NM_MERCADORIA, :AP_MERCADORIA, :CD_NCM_SH, :CD_EXPORTADOR, :CD_PAIS_ORIGEM, :CD_FABRICANTE, :CD_GRUPO,');
          qryConsulta.SQL.Add('       :CD_AREA, :NM_MERC_RESUMIDA, :CD_USUARIO_CRIACAO, GETDATE(), ''1'')');
          qryConsulta.Parameters.ParamByName('CD_MERCADORIA').Value      := Codigo_Produto;
          qryConsulta.Parameters.ParamByName('NM_MERCADORIA').Value      := Descricao;
          qryConsulta.Parameters.ParamByName('AP_MERCADORIA').Value      := LeftStr(Descricao, 25);
          qryConsulta.Parameters.ParamByName('CD_NCM_SH').Value          := NCM_SH;
          qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value      := Codigo_Exportador.Codigo;
          qryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value     := Codigo_Pais_Origem;
          qryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value      := Codigo_Fabricante.Codigo;
          qryConsulta.Parameters.ParamByName('CD_GRUPO').Value           := GrupoArquivo;
          qryConsulta.Parameters.ParamByName('CD_AREA').Value            := ArquivoSG.CAP[C].CAPI.Area.Codigo;
          qryConsulta.Parameters.ParamByName('NM_MERC_RESUMIDA').Value   := LeftStr(Descricao, 60);
          qryConsulta.Parameters.ParamByName('CD_USUARIO_CRIACAO').Value := CodUsuario;
          qryConsulta.ExecSQL;
        end;
      end;
end;

function VerificaMercadoriasFesto(ArquivoFesto: TArquivoFesto): Boolean;
var
  C, I, Cod: Integer;
begin
  for C := 0 to High(ArquivoFesto) do
    for I := 0 to High(ArquivoFesto[C].Itens) do
      with ArquivoFesto[C], ArquivoFesto[C].Itens[I] do
      begin
        if Trim(NumeroMaterial) = '' then
          NumeroMaterial := ConsultaSQLPlanilha(' SELECT '''+ Prefixo + '-'' + CONVERT(VARCHAR, ISNULL(MAX(CONVERT(INT, RIGHT(RTRIM(ISNULL(CD_MERCADORIA, ''' + Prefixo + '-0'')), LEN(RTRIM(ISNULL(CD_MERCADORIA, ''' + Prefixo + '-0''))) - 3)) + 1), 0)) ' +
                                                '   FROM TMERCADORIA (NOLOCK) ' +
                                                '  WHERE CD_GRUPO = ''' + GrupoArquivo + '''' +
                                                '    AND CD_MERCADORIA LIKE ''' + Prefixo + '-%''');
        if ConsultaLookup('TMERCADORIA', 'CD_MERCADORIA', 'CD_MERCADORIA = ''' + NumeroMaterial + '''') = '' then
        begin
          qryConsulta.SQL.Clear;
          qryConsulta.SQL.Add('INSERT INTO TMERCADORIA(CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, CD_NCM_SH, CD_GRUPO,');
          qryConsulta.SQL.Add('                        CD_AREA, NM_MERC_RESUMIDA, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, PC_COFINS, PC_ICMS, PC_PIS, VL_UNITARIO, PL_MERCADORIA)');
          qryConsulta.SQL.Add('VALUES(:CD_MERCADORIA, :NM_MERCADORIA, :AP_MERCADORIA, :CD_NCM_SH, :CD_GRUPO,');
          qryConsulta.SQL.Add('       :CD_AREA, :NM_MERC_RESUMIDA, :CD_USUARIO_CRIACAO, GETDATE(), ''1'', :PC_COFINS, :PC_ICMS, :PC_PIS, :VL_UNITARIO, :PL_MERCADORIA)');
          qryConsulta.Parameters.ParamByName('CD_MERCADORIA').Value      := NumeroMaterial;
          qryConsulta.Parameters.ParamByName('NM_MERCADORIA').Value      := TextoMaterial;
          qryConsulta.Parameters.ParamByName('AP_MERCADORIA').Value      := LeftStr(TextoMaterial, 25);
          qryConsulta.Parameters.ParamByName('CD_NCM_SH').Value          := NCMMaterial;
          qryConsulta.Parameters.ParamByName('CD_GRUPO').Value           := GrupoArquivo;
          qryConsulta.Parameters.ParamByName('CD_AREA').Value            := '58';
          qryConsulta.Parameters.ParamByName('NM_MERC_RESUMIDA').Value   := LeftStr(TextoMaterial, 60);
          qryConsulta.Parameters.ParamByName('CD_USUARIO_CRIACAO').Value := CodUsuario;
          qryConsulta.Parameters.ParamByName('PC_COFINS').Value          := ValorCOFINS;
          qryConsulta.Parameters.ParamByName('PC_ICMS').Value            := TaxaICMS;
          qryConsulta.Parameters.ParamByName('PC_PIS').Value             := ValorPIS;
          qryConsulta.Parameters.ParamByName('VL_UNITARIO').Value        := PrecoUnitario;
          qryConsulta.Parameters.ParamByName('PL_MERCADORIA').Value      := PesoMaterial;
          qryConsulta.ExecSQL;
        end;
      end;
end;

function GetFabricantesFesto(var CodPaisOrigem: string; NomeFabricante, PaisFabricante, EnderecoFabricante, CidadeFabricante: string): Integer;
var
  vPos, i: Integer;
  vUltimaPalavra, vEnderecoFabricante, vApelidoEmpresa, vCodigoPais: string;
  vNumEndFabricante, vCodigoFabricante, vProximoCodEmpresa: Integer;
  IsInteger: Boolean;
begin
  {O Campo EnderecoFabricante vem com o número, e a rotina abaixo é para separá-los, pois no banco são dois campos diferentes}
  vNumEndFabricante := 0;
  vPos := Pos(' ', ReverseString(EnderecoFabricante));
  if vPos > 0 then //Se tiver um espaço pode ter número
  begin
    vUltimaPalavra := RightStr(EnderecoFabricante, vPos-1);

    IsInteger := True; {Verificar se a ultima palavra é um número}
    for i := 1 to Length(vUltimaPalavra) do
    begin
      if not (vUltimaPalavra[i] in ['0'..'9']) then
      begin
        IsInteger := False;
        Break;
      end;
    end;

    if isInteger then
    begin
      vNumEndFabricante := StrToInt(vUltimaPalavra);
      vEnderecoFabricante := LeftStr(EnderecoFabricante, Length(EnderecoFabricante) - vPos);
    end
    else
    begin
      vEnderecoFabricante := EnderecoFabricante;
    end;
  end
  else //Não tem número
  begin
    vEnderecoFabricante := EnderecoFabricante;
  end;

  with qryConsulta do
  begin
    SQL.Clear;
    SQL.Add(Format(
                    'SELECT TOP 1 CD_EMPRESA, CD_PAIS '+
                    '  FROM TEMPRESA_EST (NOLOCK) ' +
                    ' WHERE NM_EMPRESA = ''%s''' +
                    '   AND END_EMPRESA LIKE ''%s''' +
                    '   AND END_CIDADE = ''%s''',
                    [NomeFabricante,
                     LeftStr(vEnderecoFabricante,
                     pos(' ', vEnderecoFabricante) - 1) + '%',
                     CidadeFabricante]
                   ));
    Open;
    if not Eof then
    begin
      Result := FieldByName('CD_EMPRESA').AsInteger;
      CodPaisOrigem := FieldByName('CD_PAIS').Value;
    end
    else
    begin
      vCodigoPais := ConsultaSQLPlanilha(Format('SELECT * FROM TPAIS_BROKER (NOLOCK) WHERE NM_SIGLA_2L = ''%s''', [PaisFabricante]));
      if vCodigoPais = '' then
        vCodigoPais := '994';

      vProximoCodEmpresa := StrToInt(ConsultaSQLPlanilha('SELECT MAX(CD_EMPRESA) + 1  FROM TEMPRESA_EST '));

      if pos(' ', NomeFabricante) <= 11 then
        vApelidoEmpresa := LeftStr(NomeFabricante, pos(' ', NomeFabricante) - 1)
      else
        vApelidoEmpresa := LeftStr(NomeFabricante, 10);

      with qryConsulta do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO TEMPRESA_EST');
        SQL.Add('       ( CD_EMPRESA,  NM_EMPRESA,  AP_EMPRESA,  END_EMPRESA,  END_NUMERO,  END_CIDADE,  CD_PAIS,  DT_INCLUSAO,  IN_ATIVO)');
        SQL.Add('VALUES (:CD_EMPRESA, :NM_EMPRESA, :AP_EMPRESA, :END_EMPRESA, :END_NUMERO, :END_CIDADE, :CD_PAIS, :DT_INCLUSAO, :IN_ATIVO)');
        Parameters.ParamByName('CD_EMPRESA').Value      := vProximoCodEmpresa;
        Parameters.ParamByName('NM_EMPRESA').Value      := AnsiUpperCase(NomeFabricante);
        Parameters.ParamByName('AP_EMPRESA').Value      := AnsiUpperCase(vApelidoEmpresa);
        Parameters.ParamByName('END_EMPRESA').Value     := AnsiUpperCase(vEnderecoFabricante);
        if vNumEndFabricante <> 0 then
          Parameters.ParamByName('END_NUMERO').Value      := vNumEndFabricante
        else
          Parameters.ParamByName('END_NUMERO').Value      := 0;
        Parameters.ParamByName('END_CIDADE').Value      := AnsiUpperCase(CidadeFabricante);
        Parameters.ParamByName('CD_PAIS').Value         := vCodigoPais;
        Parameters.ParamByName('DT_INCLUSAO').Value     := Date;
        Parameters.ParamByName('IN_ATIVO').Value        := 1;
        ExecSQL;
      end;
      Result := vProximoCodEmpresa;
      CodPaisOrigem := vCodigoPais;
    end;
  end;
end;

procedure DefineConexao(NmServer: OleVariant);
//var ObjIntegraSG: TIntegraSG;
begin
 // ObjIntegraSG := TIntegraSG.Create;
  if not SameText(Connection.ConnectionString, 'Provider=SQLOLEDB.1;Data Source=' + NmServer + ';Initial Catalog=BROKER;' +
       'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;') then
  begin
    if Connection.Connected then
      Connection.Close;
    Connection.ConnectionString := 'Provider=SQLOLEDB.1;Data Source=' + NmServer + ';Initial Catalog=BROKER;' +
       'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
    Connection.Open;
  end;
end;

function Gravar(NmServer: OleVariant; ArquivoSG: TArquivoSG): Boolean;
var
  Processo, Grupo, Local_Desemb, CodUsuarioResp, GrupoArea: String;
  Item, NrItem, NrItemCliente, NrParcial: Integer;
  Ped: Integer;
  QtdPedido, PLPedido, VLUnitPedido, VLTotalPedido: Double;
  PathDig, NomeArquivo: String;
  MS: TMemoryStream;
  AssuntoEmail, CorpoEmail, UsuarioEmail, ResponsavelEmail, EmailGrupo: String;
begin

 { if Erros = nil then
    Erros := TstringList.Create;}
  try
    DefineConexao(Servidor);
    Connection.Open;
    if LeftStr(Trim(ArquivoSG.CAP[0].CAPI.Nr_Referencia_Arquivo), 2) = 'id' then
    begin
      GrupoArquivo   := '028';
      GrupoArea      := ArquivoSG.CAP[0].CAPI.Area.Codigo;
      Prefixo        := 'SG';
      CodUsuarioResp :=  '1972';
    end
    else
    begin
      GrupoArquivo   := '440';
      GrupoArea      := '58';
      Prefixo        := 'UP';
      CodUsuarioResp := '0184';
    end;

    Cliente := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', 'CGC_EMPRESA = ''' + ArquivoSG.ITDI.CNPJ + '''');
    Grupo   := ConsultaLookup('TEMPRESA_NAC', 'CD_GRUPO', 'CGC_EMPRESA = ''' + ArquivoSG.ITDI.CNPJ + '''');
    CodUsuarioResp := ConsultaSQLPlanilha(' SELECT CD_ATENDENTE FROM TCLIENTE_HABILITACAO (NOLOCK) WHERE CD_CLIENTE = ''' + ArquivoSG.ITDI.CNPJ + ''' AND CD_PRODUTO = ''01'' AND CD_UNID_NEG = ''01'' ');

    if Grupo = '028' then
    begin
      GrupoArquivo   := '028';
      GrupoArea      := ArquivoSG.CAP[0].CAPI.Area.Codigo;
      Prefixo        := 'SG';
    end
    else
    begin
      if Grupo = '155' then
      begin
        GrupoArquivo   := '155';
        GrupoArea      := '58';
        Prefixo        := 'NE';
      end
      else
      begin
        if Grupo = 'B57' then
        begin
          GrupoArquivo   := 'B57';
          GrupoArea      := '58';
          Prefixo        := 'HW';
        end
        else

        if Grupo = '154' then
        begin
          GrupoArquivo   := '154';
          GrupoArea      := '58';
          Prefixo        := 'PO';
        end
        else
        if Grupo = 'C50' then
        begin
          GrupoArquivo   := 'C50';
          GrupoArea      := '58';
          Prefixo        := 'PO';
        end

        else
        begin
          GrupoArquivo   := '440';
          GrupoArea      := '58';
          Prefixo        := 'UP';
        end;
      end;
    end;

    if Trim(CodUsuarioResp) = '' then
      CodUsuarioResp := '2919';

    AjustaDePara(ArquivoSG);
    if VerificaDeParas(ArquivoSG) then
    begin
      Connection.BeginTrans;
      try
        { ------ Instrução de Desembaraço ------ }
        InstDesemb := ConsultaSQLPlanilha(' SELECT ''ID'' + RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) + 1, ''1'')), 8) + ''-'' + RIGHT(YEAR(GETDATE()), 2) ' +
                                          ' FROM TINSTRUCAO_DESEMBARACO (NOLOCK) ' +
                                          ' WHERE RIGHT(RTRIM(ID_CODIGO), 2) = RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2)');
        qryConsulta.SQL.Clear;
        qryConsulta.SQL.Add('INSERT INTO TINSTRUCAO_DESEMBARACO(ID_CODIGO, CD_USUARIO, DT_CRIACAO, IN_AUTORIZADO, CD_CLIENTE, DT_AUTORIZACAO, CD_USUARIO_AUTORIZACAO,');
        qryConsulta.SQL.Add('                                   CD_RESPONSAVEL, CD_EMBARCACAO, NR_CONHECIMENTO, CD_EMPRESA, CD_MODAL, DT_CONHECIMENTO, CD_PAIS_PROCEDENCIA,');
        qryConsulta.SQL.Add('                                   CD_MOEDA_FRETE, VL_FRETE_PREPAID_MNEG, VL_FRETE_COLLECT_MNEG, VL_FRETE_MN, CD_MOEDA_SEGURO, VL_SEGURO_MNEG,');
        qryConsulta.SQL.Add('                                   VL_SEGURO_MN, CD_LOCAL_EMBARQUE, DT_EMBARQUE, DIAS_CONDICAO_PAGTO, CONDICAO_PAGTO, CD_INCOTERM, CD_AGENTE,');
        qryConsulta.SQL.Add('                                   CD_TIPO_FRETE, ID_CLIENTE)');
        qryConsulta.SQL.Add('VALUES(:ID_CODIGO, :CD_USUARIO, :DT_CRIACAO, :IN_AUTORIZADO, :CD_CLIENTE, :DT_AUTORIZACAO, :CD_USUARIO_AUTORIZACAO,');
        qryConsulta.SQL.Add('       :CD_RESPONSAVEL, :CD_EMBARCACAO, :NR_CONHECIMENTO, :CD_EMPRESA, :CD_MODAL, :DT_CONHECIMENTO, :CD_PAIS_PROCEDENCIA,');
        qryConsulta.SQL.Add('       :CD_MOEDA_FRETE, :VL_FRETE_PREPAID_MNEG, :VL_FRETE_COLLECT_MNEG, :VL_FRETE_MN, :CD_MOEDA_SEGURO, :VL_SEGURO_MNEG,');
        qryConsulta.SQL.Add('       :VL_SEGURO_MN, :CD_LOCAL_EMBARQUE, :DT_EMBARQUE, :DIAS_CONDICAO_PAGTO, :CONDICAO_PAGTO, :CD_INCOTERM, :CD_AGENTE,');
        qryConsulta.SQL.Add('       :CD_TIPO_FRETE, :ID_CLIENTE)');

        qryConsulta.Parameters.ParamByName('ID_CODIGO').Value              := InstDesemb;
        qryConsulta.Parameters.ParamByName('CD_USUARIO').Value             := CodUsuario;
        qryConsulta.Parameters.ParamByName('DT_CRIACAO').Value             := Date;
        qryConsulta.Parameters.ParamByName('IN_AUTORIZADO').Value          := '0';
        qryConsulta.Parameters.ParamByName('CD_CLIENTE').Value             := Cliente;
        //FqryConsulta.Parameters.ParamByName('DT_AUTORIZACAO').Value         := Date;
        //FqryConsulta.Parameters.ParamByName('CD_USUARIO_AUTORIZACAO').Value := FCodUsuario;
        qryConsulta.Parameters.ParamByName('CD_RESPONSAVEL').Value         := CodUsuarioResp;
        qryConsulta.Parameters.ParamByName('CD_EMBARCACAO').Value          := ArquivoSG.CAP[0].CAPI.Nome_Veiculo_Transporte.Codigo;
        //qryConsulta.Parameters.ParamByName('NR_CONHECIMENTO').Value        := '';
        qryConsulta.Parameters.ParamByName('CD_EMPRESA').Value             := Cliente;
        qryConsulta.Parameters.ParamByName('CD_MODAL').Value               := ArquivoSG.CAP[0].CAPI.Via_Transporte;
        //qryConsulta.Parameters.ParamByName('DT_CONHECIMEENTO').Value        := '';
        qryConsulta.Parameters.ParamByName('CD_MOEDA_FRETE').Value         := ArquivoSG.CAP[0].CAP2.Moeda_Frete;
        qryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID_MNEG').Value  := ArquivoSG.CAP[0].CAP2.Valor_Frete_PREPAID;
        qryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT_MNEG').Value  := ArquivoSG.CAP[0].CAP2.Valor_Frete_COLLECT;
        //ArquivoSG.CAP.CAP2.Valor_Frete_PREPAID
        qryConsulta.Parameters.ParamByName('VL_FRETE_MN').Value            := 0;
        qryConsulta.Parameters.ParamByName('CD_MOEDA_SEGURO').Value        := ArquivoSG.CAP[0].CAP2.Moeda_Seguro;
        qryConsulta.Parameters.ParamByName('VL_SEGURO_MNEG').Value         := ArquivoSG.CAP[0].CAP2.Valor_Seguro;
        qryConsulta.Parameters.ParamByName('VL_SEGURO_MN').Value           := 0;
        qryConsulta.Parameters.ParamByName('CD_LOCAL_EMBARQUE').Value      := ArquivoSG.CAP[0].CAPI.Codigo_Local_Embarque.Codigo;
        //qryConsulta.Parameters.ParamByName('DT_CONHECIMENTO').Value        := FCapa.Data_Conhecimento;
        //qryConsulta.Parameters.ParamByName('DT_EMBARQUE').Value            := FCapa.Data_Embarque;
        //qryConsulta.Parameters.ParamByName('DIAS_CONDICAO_PAGTO').Value    := FCapa.Faturas[0].Condicao.Dias;
        //qryConsulta.Parameters.ParamByName('CONDICAO_PAGTO').Value         := FCapa.Faturas[0].Condicao.Codigo;
        qryConsulta.Parameters.ParamByName('CD_INCOTERM').Value            := ArquivoSG.CAP[0].Itens[0].ITEB.INCOTERM;
        qryConsulta.Parameters.ParamByName('CD_AGENTE').Value              := ArquivoSG.CAP[0].CAP2.Codigo_Agente_Carga.Codigo;
        //qryConsulta.Parameters.ParamByName('CD_TIPO_FRETE').Value          := FCapa.Tipo_Frete.Codigo;
        qryConsulta.Parameters.ParamByName('ID_CLIENTE').Value             := ArquivoSG.CAP[0].CAPI.Nr_Referencia_Arquivo;
        qryConsulta.Parameters.ParamByName('CD_PAIS_PROCEDENCIA').Value    := ArquivoSG.CAP[0].CAPI.Pais_Procedencia;
        qryConsulta.ExecSQL;

        for Ped := 0 to High(ArquivoSG.CAP) do
        begin
          { Pedido }
          if ConsultaSQLPlanilha(Format('SELECT COUNT(*)             ' +
                                        ' FROM TPO (NOLOCK)          ' +
                                        ' WHERE NR_PROCESSO = ''%s'' ' +
                                        '   AND CD_EMPRESA  = ''%s''', [ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente, Cliente])) = '0' then
          begin
            { --------------- Processo --------------- }

            Processo := ConsultaSQLPlanilha(' SELECT ISNULL(MAX(ISNULL(CONVERT(INT, SUBSTRING(NR_PROCESSO, 8, CHARINDEX(''-'', NR_PROCESSO, CHARINDEX(''-'', NR_PROCESSO)) - 1)), 0)),0) ' +
                                            '   FROM TPROCESSO (NOLOCK) ' +
                                            '  WHERE CD_UNID_NEG = ''07'' ' +
                                            '    AND CD_PRODUTO  = ''06'' ' +
                                            '    AND DATEPART(YYYY, DT_ABERTURA) = DATEPART(YYYY, GETDATE()) ' +
                                            '    AND SUBSTRING(NR_PROCESSO, 5, 2) = ''' + Prefixo + ''' ');

            Processo := Format('%s%s-%s-%s', ['0706', Prefixo, FormatFloat('000000', StrToInt(Processo) + 1), FormatDateTime('yy', Now)]);
            if qryConsulta.Active then
              qryConsulta.Close;

            qryConsulta.SQL.Clear;
            qryConsulta.SQL.Add('INSERT INTO TPROCESSO(NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_GRUPO, NR_REFERENCIA, CD_CLIENTE, IN_LIBERADO, IN_CANCELADO,');
            qryConsulta.SQL.Add('                      DT_ABERTURA, HR_ABERTURA, IN_DADOS_IGUAIS_ITENS, CD_PAIS_ORIGEM, CD_INCOTERM, CD_LOCAL_DESEMBARQUE, NR_ORDEM,');
            qryConsulta.SQL.Add('                      DT_CONHECIMENTO, IN_SEGURO, CD_ANALISTA_CLIENTE, CD_USUARIO, CD_IMPORTADOR, CD_EXPORTADOR, CD_SERVICO, TP_FRETE,');
            qryConsulta.SQL.Add('                      VL_PESO_BRUTO, NR_MANIFESTO, CD_LOCAL_EMBARQUE, NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER, CD_MOEDA_FRETE, VL_FRETE_PREPAID_MNEG,');
            qryConsulta.SQL.Add('                      VL_FRETE_COLLECT_MNEG, VL_FRETE_TNAC_MNEG, CD_MOEDA_SEGURO, CD_AREA)');
            qryConsulta.SQL.Add('VALUES(:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_GRUPO, :NR_REFERENCIA, :CD_CLIENTE, :IN_LIBERADO, :IN_CANCELADO,');
            qryConsulta.SQL.Add('       :DT_ABERTURA, :HR_ABERTURA, :IN_DADOS_IGUAIS_ITENS, :CD_PAIS_ORIGEM, :CD_INCOTERM, :CD_LOCAL_DESEMBARQUE, :NR_ORDEM,');
            qryConsulta.SQL.Add('       :DT_CONHECIMENTO, :IN_SEGURO, :CD_ANALISTA_CLIENTE, :CD_USUARIO, :CD_IMPORTADOR, :CD_EXPORTADOR, :CD_SERVICO, :TP_FRETE,');
            qryConsulta.SQL.Add('       :VL_PESO_BRUTO, :NR_MANIFESTO, :CD_LOCAL_EMBARQUE, :NR_CONHECIMENTO, :NR_CONHECIMENTO_MASTER, :CD_MOEDA_FRETE, :VL_FRETE_PREPAID_MNEG,');
            qryConsulta.SQL.Add('       :VL_FRETE_COLLECT_MNEG, :VL_FRETE_TNAC_MNEG, :CD_MOEDA_SEGURO, :CD_AREA)');
            qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value           := Processo;
            qryConsulta.Parameters.ParamByName('CD_UNID_NEG').Value           := '07';
            qryConsulta.Parameters.ParamByName('CD_PRODUTO').Value            := '06';
            qryConsulta.Parameters.ParamByName('CD_GRUPO').Value              := Grupo;
            qryConsulta.Parameters.ParamByName('NR_REFERENCIA').Value         := ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente;
            qryConsulta.Parameters.ParamByName('CD_CLIENTE').Value            := Cliente;
            qryConsulta.Parameters.ParamByName('IN_LIBERADO').Value           := '1';
            qryConsulta.Parameters.ParamByName('IN_CANCELADO').Value          := '0';
            qryConsulta.Parameters.ParamByName('DT_ABERTURA').Value           := Date;
            qryConsulta.Parameters.ParamByName('HR_ABERTURA').Value           := Now;
            qryConsulta.Parameters.ParamByName('IN_DADOS_IGUAIS_ITENS').Value := '1';
            qryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value        := ArquivoSG.CAP[Ped].CAPI.Pais_Procedencia;
            qryConsulta.Parameters.ParamByName('CD_INCOTERM').Value           := ArquivoSG.CAP[Ped].Itens[0].ITEB.INCOTERM;
            qryConsulta.Parameters.ParamByName('CD_LOCAL_DESEMBARQUE').Value  := '';
            qryConsulta.Parameters.ParamByName('NR_ORDEM').Value              := '';
            qryConsulta.Parameters.ParamByName('IN_SEGURO').Value             := '';
            qryConsulta.Parameters.ParamByName('CD_ANALISTA_CLIENTE').Value   := ''; //ArquivoSG.AGs[Ped].AG4B.Contato.Codigo;
            qryConsulta.Parameters.ParamByName('CD_USUARIO').Value            := CodUsuario;
            qryConsulta.Parameters.ParamByName('CD_IMPORTADOR').Value         := Cliente;
            qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value         := '';
            qryConsulta.Parameters.ParamByName('CD_SERVICO').Value            := _SERVICO;
            qryConsulta.Parameters.ParamByName('TP_FRETE').Value              := '';
            qryConsulta.Parameters.ParamByName('VL_PESO_BRUTO').Value         := ArquivoSG.CAP[Ped].CAPI.Peso_Bruto;
            qryConsulta.Parameters.ParamByName('NR_MANIFESTO').Value          := ArquivoSG.CAP[Ped].CAPI.Numero_Manifesto;
            qryConsulta.Parameters.ParamByName('CD_LOCAL_EMBARQUE').Value     := ArquivoSG.CAP[Ped].CAPI.Codigo_Local_Embarque.Codigo;
            qryConsulta.Parameters.ParamByName('NR_CONHECIMENTO').Value       := ArquivoSG.CAP[Ped].CAPI.House;
            qryConsulta.Parameters.ParamByName('NR_CONHECIMENTO_MASTER').Value:= ArquivoSG.CAP[Ped].CAPI.Master;
            qryConsulta.Parameters.ParamByName('CD_MOEDA_FRETE').Value        := ArquivoSG.CAP[Ped].CAP2.Moeda_Frete;
            qryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID_MNEG').Value := ArquivoSG.CAP[Ped].CAP2.Valor_Frete_PREPAID;
            qryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT_MNEG').Value := ArquivoSG.CAP[Ped].CAP2.Valor_Frete_COLLECT;
            qryConsulta.Parameters.ParamByName('VL_FRETE_TNAC_MNEG').Value    := ArquivoSG.CAP[Ped].CAP2.Valor_Frete_Territorio_Nac;
            qryConsulta.Parameters.ParamByName('CD_MOEDA_SEGURO').Value       := ArquivoSG.CAP[Ped].CAP2.Moeda_Seguro;
            qryConsulta.Parameters.ParamByName('CD_AREA').Value               := GrupoArea;
            qryConsulta.ExecSQL;

            { --------------- Pedido --------------- }
            qryConsulta.SQL.Clear;
            qryConsulta.SQL.Add('INSERT INTO TPO(NR_PROCESSO, CD_IMPORTADOR, CD_FABRICANTE, CD_EXPORTADOR, CD_VIA_TRANSP, CD_PAIS_ORIGEM, CD_REGIME_TRIB, CD_PAIS_PROCEDENCIA,');
            qryConsulta.SQL.Add('                CD_MOEDA_NEG, CD_URF_DESPACHO, CD_INCOTERM, CD_LOCAL_EMBARQUE, CD_AGENTE_CARGA, CD_URF_ENTRADA, CD_MOEDA_FRETE, CD_MOEDA_SEGURO,');
            qryConsulta.SQL.Add('                DT_ABERTURA, IN_VINC_IMPO_EXPO, IN_FABR_EXPOR_IMP, NM_VEICULO, PL_PO, PB_PO, QT_TOTAL_PESO, QT_TOTAL_ITENS, TP_FRETE,');
            qryConsulta.SQL.Add('                VL_FRETE_PREPAID, VL_FRETE_COLLECT, VL_SEGURO, VL_TOTAL, CD_AREA, CD_TIPO_FRETE, CD_LOCAL_DESEMBARQUE, CD_SERVICO,');
            qryConsulta.SQL.Add('                CD_USUARIO, CD_EMPRESA, CD_TP_DECLARACAO, CD_TRANSP_INTERN, CD_TRANSP_INTERNAC, CD_TP_MANIFESTO,');
            qryConsulta.SQL.Add('                NR_MANIFESTO, CD_TIPO_DOCTO_CARGA, NR_DOCTO_CARGA_MASTER, NR_DOCTO_CARGA_HOUSE, CD_UTILIZACAO_CARGA, DT_CHEGADA_CARGA,');
            qryConsulta.SQL.Add('                NR_HOUSE, NR_MASTER, CD_RECINTO_ALFAND, VL_FRETE_TERRIT_NAC, TP_SEGURO, PC_SEGURO, VL_CAMBIO)');
            qryConsulta.SQL.Add('VALUES(:NR_PROCESSO, :CD_IMPORTADOR, :CD_FABRICANTE, :CD_EXPORTADOR, :CD_VIA_TRANSP, :CD_PAIS_ORIGEM, :CD_REGIME_TRIB, :CD_PAIS_PROCEDENCIA,');
            qryConsulta.SQL.Add('       :CD_MOEDA_NEG, :CD_URF_DESPACHO, :CD_INCOTERM, :CD_LOCAL_EMBARQUE, :CD_AGENTE_CARGA, :CD_URF_ENTRADA, :CD_MOEDA_FRETE, :CD_MOEDA_SEGURO,');
            qryConsulta.SQL.Add('       :DT_ABERTURA, :IN_VINC_IMPO_EXPO, :IN_FABR_EXPOR_IMP, :NM_VEICULO, :PL_PO, :PB_PO, :QT_TOTAL_PESO, :QT_TOTAL_ITENS, :TP_FRETE,');
            qryConsulta.SQL.Add('       :VL_FRETE_PREPAID, :VL_FRETE_COLLECT, :VL_SEGURO, :VL_TOTAL, :CD_AREA, :CD_TIPO_FRETE, :CD_LOCAL_DESEMBARQUE, :CD_SERVICO,');
            qryConsulta.SQL.Add('       :CD_USUARIO, :CD_EMPRESA, :CD_TP_DECLARACAO, :CD_TRANSP_INTERN, :CD_TRANSP_INTERNAC, :CD_TP_MANIFESTO,');
            qryConsulta.SQL.Add('       :NR_MANIFESTO, :CD_TIPO_DOCTO_CARGA, :NR_DOCTO_CARGA_MASTER, :NR_DOCTO_CARGA_HOUSE, :CD_UTILIZACAO_CARGA, :DT_CHEGADA_CARGA,');
            qryConsulta.SQL.Add('       :NR_HOUSE, :NR_MASTER, :CD_RECINTO_ALFAND, :VL_FRETE_TERRIT_NAC, :TP_SEGURO, :PC_SEGURO, :VL_CAMBIO)');

            with ArquivoSG.CAP[Ped].Itens[0] do
            begin
              qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value          := ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente;
              qryConsulta.Parameters.ParamByName('CD_IMPORTADOR').Value        := Cliente;
              qryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value        := ITEA.Codigo_Fabricante.Codigo;
              qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value        := ITEA.Codigo_Exportador.Codigo;
              qryConsulta.Parameters.ParamByName('CD_VIA_TRANSP').Value        := ITEC.Via_Transporte;
              qryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value       := ITEA.Codigo_Pais_Origem;
              qryConsulta.Parameters.ParamByName('CD_REGIME_TRIB').Value       := '1';
              qryConsulta.Parameters.ParamByName('CD_PAIS_PROCEDENCIA').Value  := ArquivoSG.CAP[Ped].CAPI.Pais_Procedencia;
              qryConsulta.Parameters.ParamByName('CD_MOEDA_NEG').Value         := ITEB.Moeda_Negociada;
              qryConsulta.Parameters.ParamByName('CD_URF_DESPACHO').Value      := ArquivoSG.CAP[Ped].CAPI.URF_Despacho;
              qryConsulta.Parameters.ParamByName('CD_INCOTERM').Value          := ITEB.INCOTERM;
              qryConsulta.Parameters.ParamByName('CD_LOCAL_EMBARQUE').Value    := ArquivoSG.CAP[Ped].CAPI.Codigo_Local_Embarque.Codigo;
              qryConsulta.Parameters.ParamByName('CD_AGENTE_CARGA').Value      := ArquivoSG.CAP[Ped].CAP2.Codigo_Agente_Carga.Codigo;
              qryConsulta.Parameters.ParamByName('CD_URF_ENTRADA').Value       := ArquivoSG.CAP[Ped].CAP2.URF_Entrada_Pais;
              qryConsulta.Parameters.ParamByName('CD_MOEDA_FRETE').Value       := ArquivoSG.CAP[Ped].CAP2.Moeda_Frete;
              qryConsulta.Parameters.ParamByName('CD_MOEDA_SEGURO').Value      := ArquivoSG.CAP[Ped].CAP2.Moeda_Seguro;
              qryConsulta.Parameters.ParamByName('DT_ABERTURA').Value          := Date;
              qryConsulta.Parameters.ParamByName('NM_VEICULO').Value           := LeftStr(ArquivoSG.CAP[Ped].CAPI.Nome_Veiculo_Transporte.Texto, 30);
              qryConsulta.Parameters.ParamByName('PL_PO').Value                := PLPedido;
              qryConsulta.Parameters.ParamByName('QT_TOTAL_ITENS').Value       := High(ArquivoSG.CAP[Ped].Itens) + 1;
              qryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID').Value     := ArquivoSG.CAP[Ped].CAP2.Valor_Frete_PREPAID;
              qryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT').Value     := ArquivoSG.CAP[Ped].CAP2.Valor_Frete_COLLECT;
              qryConsulta.Parameters.ParamByName('VL_SEGURO').Value            := ArquivoSG.CAP[Ped].CAP2.Valor_Seguro;
              qryConsulta.Parameters.ParamByName('VL_TOTAL').Value             := VLTotalPedido;
              qryConsulta.Parameters.ParamByName('CD_AREA').Value              := GrupoArea;
              qryConsulta.Parameters.ParamByName('CD_LOCAL_DESEMBARQUE').Value := Local_Desemb;
              qryConsulta.Parameters.ParamByName('CD_SERVICO').Value           := _SERVICO;
              qryConsulta.Parameters.ParamByName('CD_USUARIO').Value           := CodUsuario;
              qryConsulta.Parameters.ParamByName('CD_EMPRESA').Value           := Cliente;

              qryConsulta.Parameters.ParamByName('CD_TP_DECLARACAO').Value     := ArquivoSG.CAP[Ped].CAPI.Tipo_Declaracao.Codigo;
              qryConsulta.Parameters.ParamByName('CD_TRANSP_INTERN').Value     := ArquivoSG.CAP[Ped].CAPi.Codigo_Transportador_Int.Codigo;
              qryConsulta.Parameters.ParamByName('CD_TRANSP_INTERNAC').Value   := ArquivoSG.CAP[Ped].CAPI.Codigo_Transportador_Int.Codigo;
              qryConsulta.Parameters.ParamByName('CD_TP_MANIFESTO').Value      := ArquivoSG.CAP[Ped].CAPI.Tipo_Manifesto.Codigo;
              qryConsulta.Parameters.ParamByName('NR_MANIFESTO').Value         := ArquivoSG.CAP[Ped].CAPI.Numero_Manifesto;
              qryConsulta.Parameters.ParamByName('CD_TIPO_DOCTO_CARGA').Value  := ArquivoSG.CAP[Ped].CAPI.Tipo_Documento_Carga.Codigo;
              qryConsulta.Parameters.ParamByName('NR_DOCTO_CARGA_MASTER').Value:= ArquivoSG.CAP[Ped].CAPI.Nr_Documento_Carga_Master;
              qryConsulta.Parameters.ParamByName('NR_DOCTO_CARGA_HOUSE').Value := ArquivoSG.CAP[Ped].CAPI.Nr_Documento_Carga_House;
              qryConsulta.Parameters.ParamByName('CD_UTILIZACAO_CARGA').Value  := ArquivoSG.CAP[Ped].CAPI.Utilizacao_Carga;
              qryConsulta.Parameters.ParamByName('DT_CHEGADA_CARGA').Value     := ArquivoSG.CAP[Ped].CAPI.Data_Chegada_Carga;
              qryConsulta.Parameters.ParamByName('NR_HOUSE').Value             := ArquivoSG.CAP[Ped].CAPI.House;
              qryConsulta.Parameters.ParamByName('NR_MASTER').Value            := ArquivoSG.CAP[Ped].CAPI.Master;
              qryConsulta.Parameters.ParamByName('CD_RECINTO_ALFAND').Value    := ArquivoSG.CAP[Ped].CAP2.Recinto_Alfandegado;
              qryConsulta.Parameters.ParamByName('VL_FRETE_TERRIT_NAC').Value  := ArquivoSG.CAP[Ped].CAP2.Valor_Frete_Territorio_Nac;
              qryConsulta.Parameters.ParamByName('CD_MOEDA_SEGURO').Value      := ArquivoSG.CAP[Ped].CAP2.Moeda_Seguro;
              qryConsulta.Parameters.ParamByName('TP_SEGURO').Value            := ArquivoSG.CAP[Ped].CAP2.Tipo_Seguro;
              qryConsulta.Parameters.ParamByName('PC_SEGURO').Value            := ArquivoSG.CAP[Ped].CAP2.Percentual_Seguro;
              qryConsulta.Parameters.ParamByName('VL_CAMBIO').Value            := ArquivoSG.CAP[Ped].CAP3.Valor_Cambio;

              qryConsulta.ExecSQL;

              ExecuteSQL(' UPDATE TFLP_PO ' +
                         ' SET DT_REALIZACAO = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103), ' +
                         '     DT_PREVISTA   = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) ' +
                         ' WHERE CD_EVENTO  IN (''003'',''022'') ' +
                         '  AND NR_PROCESSO = ''' + ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente + ''' ' +
                         '  AND CD_EMPRESA  = ''' + Cliente + '''');

              ExecuteSQL('EXEC sp_atz_ev_flp_po ''' + ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente + ''', ''' + Cliente + '''');

            end;
          end
          else
          begin
            Processo := Trim(ConsultaSQLPlanilha(Format(' SELECT NR_PROCESSO ' +
                                                        ' FROM TPROCESSO (NOLOCK)' +
                                                        ' WHERE NR_REFERENCIA = ''%s''', [ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente])));
          end;

          QtdPedido     := 0;
          PLPedido      := 0;
          VLUnitPedido  := 0;
          VLTotalPedido := 0;
          for Item := 0 to High(ArquivoSG.CAP[Ped].Itens) do
          begin
            QtdPedido     := QtdPedido + ArquivoSG.CAP[Ped].Itens[Item].ITEA.Quantidade;
            PLPedido      := PLPedido + ArquivoSG.CAP[Ped].Itens[Item].ITEA.Peso_Liquido;
            VLUnitPedido  := VLUnitPedido + ArquivoSG.CAP[Ped].Itens[Item].ITEA.Valor_Unitario;
          end;
          VLTotalPedido := VLTotalPedido + (ArquivoSG.CAP[Ped].Itens[Item].ITEA.Quantidade * ArquivoSG.CAP[Ped].Itens[Item].ITEA.Valor_Unitario);

          { ---------------- Item ---------------- }
          NrItem := StrToInt(ConsultaSQLPlanilha(Format('SELECT ISNULL(MAX(CONVERT(INT, NR_ITEM)), 0) ' +
                                                        ' FROM TPO_ITEM (NOLOCK) ' +
                                                        ' WHERE NR_PROCESSO = ''%s'' ' +
                                                        '   AND CD_EMPRESA  = ''%s''', [ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente, Cliente])));


          VerificaMercadorias(ArquivoSG);


          for Item := 0 to High(ArquivoSG.CAP[Ped].Itens) do
          begin
            with ArquivoSG.CAP[Ped].Itens[Item] do
            begin
              NrParcial := StrToInt(ConsultaSQLPlanilha(Format('SELECT ISNULL(MAX(NR_PARCIAL), 0) ' +
                                                               ' FROM TPO_ITEM (NOLOCK) ' +
                                                               ' WHERE NR_PROCESSO     = ''%s'' ' +
                                                               '   AND NR_ITEM_CLIENTE = ''%s'' ' +
                                                               '   AND CD_EMPRESA      = ''%s''',
                                                                [ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente,
                                                                 ITED.Posicao_Item_Pedido, Cliente])));

              if NrParcial > 0 then
                NrParcial := NrParcial + 1
              else
                NrParcial := NrParcial;

              qryConsulta.SQL.Clear;
              qryConsulta.SQL.Add('INSERT INTO TPO_ITEM(NR_PROCESSO, NR_ITEM, CD_EXPORTADOR, CD_FABRICANTE, CD_MERCADORIA, CD_NCM_SH, CD_MOEDA_NEGOCIADA, CD_INCOTERM, CD_REG_TRIB_II,');
              qryConsulta.SQL.Add('                     PL_ITEM, QT_INICIAL, QT_DISPONIVEL, TP_CALCULO, TX_MERCADORIA, VL_UNITARIO, VL_TOTAL, VL_FRETE_COLLECT, VL_FRETE_PREPAID_MOEDA,');
              qryConsulta.SQL.Add('                     VL_SEGURO_MOEDA, NR_ITEM_CLIENTE, CD_EMBARCACAO, NR_CONHECIMENTO, NR_PARCIAL, CD_EMPRESA, IN_UTILIZADO_INSTR_DESEMB, ID_CODIGO_INSTR_DESEMB,');
              qryConsulta.SQL.Add('                     CD_LOCAL_DESEMBARQUE, CD_AGENTE, CD_PAIS_ORIGEM, NR_FATURA, DT_FATURA, CD_UNID_MEDIDA, CD_PAIS_AQUISICAO, CD_NALADI_SH, CD_NALADI_NCCA,');
              qryConsulta.SQL.Add('                     CD_APLICACAO_MERCADORIA, CD_ACORDO_ALADI, NR_AL_II, CD_UNID_MED_II, NR_AL_IPI, NR_LI, TP_CAMBIO, CD_MOD_PAGTO, NR_PARCELAS,');
              qryConsulta.SQL.Add('                     NR_PERIODICIDADE, CD_VIA_TRANSP, NR_PROC_ID, NR_PEDIDO_COMPRAS)');
              qryConsulta.SQL.Add('VALUES(:NR_PROCESSO, :NR_ITEM, :CD_EXPORTADOR, :CD_FABRICANTE, :CD_MERCADORIA, :CD_NCM_SH, :CD_MOEDA_NEGOCIADA, :CD_INCOTERM, :CD_REG_TRIB_II,');
              qryConsulta.SQL.Add('       :PL_ITEM, :QT_INICIAL, :QT_DISPONIVEL, :TP_CALCULO, :TX_MERCADORIA, :VL_UNITARIO, :VL_TOTAL, :VL_FRETE_COLLECT, :VL_FRETE_PREPAID_MOEDA,');
              qryConsulta.SQL.Add('       :VL_SEGURO_MOEDA, :NR_ITEM_CLIENTE, :CD_EMBARCACAO, :NR_CONHECIMENTO, :NR_PARCIAL, :CD_EMPRESA, :IN_UTILIZADO_INSTR_DESEMB, :ID_CODIGO_INSTR_DESEMB,');
              qryConsulta.SQL.Add('       :CD_LOCAL_DESEMBARQUE, :CD_AGENTE, :CD_PAIS_ORIGEM, :NR_FATURA, :DT_FATURA, :CD_UNID_MEDIDA, :CD_PAIS_AQUISICAO, :CD_NALADI_SH, :CD_NALADI_NCCA,');
              qryConsulta.SQL.Add('       :CD_APLICACAO_MERCADORIA, :CD_ACORDO_ALADI, :NR_AL_II, :CD_UNID_MED_II, :NR_AL_IPI, :NR_LI, :TP_CAMBIO, :CD_MOD_PAGTO, :NR_PARCELAS,');
              qryConsulta.SQL.Add('       :NR_PERIODICIDADE, :CD_VIA_TRANSP, :NR_PROC_ID, :NR_PEDIDO_COMPRAS)');
              qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value               := ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente;
              qryConsulta.Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 1);
              qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value             := ITEA.Codigo_Exportador.Codigo;
              qryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value             := ITEA.Codigo_Fabricante.Codigo;
              qryConsulta.Parameters.ParamByName('CD_MERCADORIA').Value             := ITEA.Codigo_Produto;
              qryConsulta.Parameters.ParamByName('CD_NCM_SH').Value                 := ITEA.NCM_SH;
              qryConsulta.Parameters.ParamByName('CD_MOEDA_NEGOCIADA').Value        := ITEB.Moeda_Negociada;
              qryConsulta.Parameters.ParamByName('CD_INCOTERM').Value               := ITEB.INCOTERM;
              qryConsulta.Parameters.ParamByName('CD_REG_TRIB_II').Value            := '';
              qryConsulta.Parameters.ParamByName('PL_ITEM').Value                   := ITEA.Peso_Liquido;
              qryConsulta.Parameters.ParamByName('QT_INICIAL').Value                := 0;
              qryConsulta.Parameters.ParamByName('QT_DISPONIVEL').Value             := 0;
              qryConsulta.Parameters.ParamByName('TP_CALCULO').Value                := '1';
              qryConsulta.Parameters.ParamByName('TX_MERCADORIA').Value             := DPnn.Descricao;
              qryConsulta.Parameters.ParamByName('VL_UNITARIO').Value               := ITEA.Valor_Unitario;
              qryConsulta.Parameters.ParamByName('VL_TOTAL').Value                  := ITEA.Quantidade * ITEA.Valor_Unitario;
              qryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT').Value          := (ArquivoSG.CAP[Ped].CAP2.Valor_Frete_COLLECT / QtdPedido) * ITEA.Quantidade;
              qryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID_MOEDA').Value    := (ArquivoSG.CAP[Ped].CAP2.Valor_Frete_PREPAID / QtdPedido) * ITEA.Quantidade;
              qryConsulta.Parameters.ParamByName('VL_SEGURO_MOEDA').Value           := (ArquivoSG.CAP[Ped].CAP2.Valor_Seguro / QtdPedido) * ITEA.Quantidade;
              qryConsulta.Parameters.ParamByName('NR_ITEM_CLIENTE').Value           := ITED.Posicao_Item_Pedido; //FormatFloat('0000', NrItemCliente + 1);
              qryConsulta.Parameters.ParamByName('CD_EMBARCACAO').Value             := ArquivoSG.CAP[Ped].CAPI.Nome_Veiculo_Transporte.Codigo;
              qryConsulta.Parameters.ParamByName('NR_CONHECIMENTO').Value           := '';
              qryConsulta.Parameters.ParamByName('NR_PARCIAL').Value                := NrParcial;
              qryConsulta.Parameters.ParamByName('CD_EMPRESA').Value                := Cliente;
              qryConsulta.Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '0';
              qryConsulta.Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := Null;
              qryConsulta.Parameters.ParamByName('CD_LOCAL_DESEMBARQUE').Value      := Local_Desemb;
              qryConsulta.Parameters.ParamByName('CD_AGENTE').Value                 := ArquivoSG.CAP[Ped].CAP2.Codigo_Agente_Carga.Codigo;
              qryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value            := ArquivoSG.CAP[Ped].CAPI.Pais_Procedencia;
              qryConsulta.Parameters.ParamByName('NR_FATURA').Value                 := Null;
              qryConsulta.Parameters.ParamByName('DT_FATURA').Value                 := Null;
              qryConsulta.Parameters.ParamByName('CD_UNID_MEDIDA').Value            := ITEA.Codigo_Unidade;
              qryConsulta.Parameters.ParamByName('CD_PAIS_AQUISICAO').Value         := ITEA.Codigo_Pais_Aquisicao;
              qryConsulta.Parameters.ParamByName('CD_NALADI_SH').Value              := ITEA.NALADI_SH;
              qryConsulta.Parameters.ParamByName('CD_NALADI_NCCA').Value            := ITEB.NALADI_NCCA;
              qryConsulta.Parameters.ParamByName('CD_APLICACAO_MERCADORIA').Value   := ITEB.Aplicacao_Mercadoria;
              qryConsulta.Parameters.ParamByName('CD_ACORDO_ALADI').Value           := ITEB.Acordo_ALADI;
              qryConsulta.Parameters.ParamByName('NR_AL_II').Value                  := ITEB.Aliquotas_Ad_Valorem_II;
              qryConsulta.Parameters.ParamByName('CD_UNID_MED_II').Value            := ITEB.Codigo_Unidade_Medida_II;
              qryConsulta.Parameters.ParamByName('NR_AL_IPI').Value                 := ITEB.Aliquotas_IPI;
              qryConsulta.Parameters.ParamByName('NR_LI').Value                     := ITEB.Licenca_Importacao;
              qryConsulta.Parameters.ParamByName('TP_CAMBIO').Value                 := ITEC.Tipo_Cambio;
              qryConsulta.Parameters.ParamByName('CD_MOD_PAGTO').Value              := ITEC.Modalidade_Pagto;
              qryConsulta.Parameters.ParamByName('NR_PARCELAS').Value               := ITEC.Nr_Parcelas;
              qryConsulta.Parameters.ParamByName('NR_PERIODICIDADE').Value          := ITEC.Periodicidade;
              qryConsulta.Parameters.ParamByName('CD_VIA_TRANSP').Value             := ITEC.Via_Transporte;
              qryConsulta.Parameters.ParamByName('NR_PROC_ID').Value                := '';
              qryConsulta.Parameters.ParamByName('NR_PEDIDO_COMPRAS').Value         := '';

              if NrParcial = 0 then
                qryConsulta.ExecSQL;

              qryConsulta.Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 2);
              qryConsulta.Parameters.ParamByName('QT_INICIAL').Value                := ITEA.Quantidade;
              qryConsulta.Parameters.ParamByName('QT_DISPONIVEL').Value             := ITEA.Quantidade;
              qryConsulta.Parameters.ParamByName('NR_PARCIAL').Value                := NrParcial + 1;
              qryConsulta.Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '1';
              qryConsulta.Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := InstDesemb;
              qryConsulta.Parameters.ParamByName('NR_FATURA').Value                 := ITED.Invoice;
              qryConsulta.Parameters.ParamByName('DT_FATURA').Value                 := Date;
              qryConsulta.Parameters.ParamByName('NR_PROC_ID').Value                := ITED.Numero_Pedido_Lincenciamento;
              qryConsulta.Parameters.ParamByName('NR_PEDIDO_COMPRAS').Value         := ITED.Numero_Pedido_Compras;
              qryConsulta.ExecSQL;
              { --- Item Instrução de Desembaraço ---- }
              ExecuteSQL(' INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO(ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO) ' +
                         ' VALUES(''' + InstDesemb + ''', ''' + ArquivoSG.CAP[Ped].CAPI.Referencia_Cliente + ''', ''' + ITED.Posicao_Item_Pedido + ''', ' + IntToStr(NrParcial + 1) + ', ' +
                         'CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103))');
              Inc(NrItem, 2);
              //Inc(NrItemCliente);
            end;
          end;
        end;
        Connection.CommitTrans;

        { ----------- Digitalização ------------ }
        {PathDig := Trim(ConsultaLookup('TPARAMETROS', 'PATH_DIGITALIZACAO', ''));
        NomeArquivo := Trim(ConsultaSQLPlanilha(' SELECT NM_PREFIXO_ARQ ' +
                                        ' FROM TTP_DOCTO_DIGITALIZADO ' +
                                        ' WHERE CD_TIPO_DOCTO = 6 ' +
                                        '   AND ID_TABELA = 1225680060 ')) + '01' + ExtractFileExt(FArquivo);
        if PathDig[Length(PathDig)] <> '\' then
          PathDig := PathDig + '\';
        PathDig := PathDig + 'TPROCESSO\' + InstDesemb + '\';
        if not DirectoryExists(PathDig) then
          ForceDirectories(PathDig);
        qryConsulta.SQL.Clear;
        qryConsulta.SQL.Add('INSERT INTO TPROCESSO_DOCTOS(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA)');
        qryConsulta.SQL.Add('VALUES(:NR_PROCESSO, 6, ''Instrução de Desembaraço'', :NM_ARQUIVO, :CD_USUARIO_CRIACAO, GETDATE(), 1, 1225680060)');
        qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value        := InstDesemb;
        qryConsulta.Parameters.ParamByName('NM_ARQUIVO').Value         := NomeArquivo;
        qryConsulta.Parameters.ParamByName('CD_USUARIO_CRIACAO').Value := CodUsuario;
        MS := TMemoryStream.Create;
        MS.LoadFromFile(Arquivo);
        MS.Position := 0;
        try
          MS.SaveToFile(PathDig + NomeArquivo);
          FreeAndNil(MS);
          SetFileAttributes(PAnsiChar(PathDig + NomeArquivo), GetFileAttributes(PAnsiChar(PathDig + NomeArquivo)) or SysUtils.faReadOnly);
          if FileExists(PathDig + NomeArquivo) then
            FqryConsulta.ExecSQL
          else
            FMensagens.Add('Arquivo não incluído na Digitalização de Documentos.');
        except
          FMensagens.Add('Erro na Digitalização do Documento.');
        end;//}



        //NÃO É PRA MANDAR AUTORIZAR
        AssuntoEmail := '[MyIndaiaMail] Cadastro: Referências da ' + InstDesemb;
             Cliente := ConsultaLookup('TEMPRESA_NAC', 'NM_EMPRESA', 'CD_EMPRESA = ''' + Cliente + '''');
        AssuntoEmail := AssuntoEmail + ' / Cliente: ' + Cliente;

        CorpoEmail := '<html>' +
                      '<body>' +
                      '    A planilha foi integrada com sucesso, ' +
                      ' porém alguns dados ficaram sem valor por falta de ' +
                      ' referência. Esta informação que faltou foi enviada ao nosso ' +
                      'setor para que sejam cadastradas, de modo que as próximas integrações sejam ' +
                      'executadas com mais eficiência, melhorando ainda mais o seu processo. Provavelmente ' +
                      'precisaremos de algumas informações para completar esse cadastro, contamos com você!' +
                      '<br><br>' +
                      StringReplace(Erros.Text, #13#10, '<br>', [rfReplaceAll]) +
                      '</body>' +
                      '</html>';

        UsuarioEmail     := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuario + '''');
        ResponsavelEmail := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuarioResp + '''');

        if qryConsulta.Active then
          qryConsulta.Close;
        qryConsulta.SQL.Clear;
        qryConsulta.SQL.Add('SELECT *');
        qryConsulta.SQL.Add('FROM VW_CONFIG_MAIL');
        qryConsulta.Open;

       EmailGrupo := 'ti@myindaia.com.br;';
       if GrupoArquivo = '028' then EmailGrupo := 'sga.imp@myindaia.com.br;';
       if GrupoArquivo = '155' then EmailGrupo := 'nestle.imp@myindaia.com.br;';

       EnviaEmail(qryConsulta.FieldByName('NM_HOST').AsString,
                  qryConsulta.FieldByName('NM_LOGIN').AsString,
                  qryConsulta.FieldByName('NM_SENHA').AsString,
                  qryConsulta.FieldByName('NR_PORTA').AsInteger,
                  AssuntoEmail,
                  CorpoEmail,
                  'ti@myindaia.com.br;'+ EmailGrupo + UsuarioEmail,
                  'ti@myindaia.com.br',
                   []);

        Result := True;
      except
        on E: Exception do
        begin
          if Connection.InTransaction then
            Connection.RollbackTrans;

          Erros.Add('Erro gravando dados.');
          Erros.Add('Mensagem: ' + StringReplace(StringReplace(E.Message, #13, ' ', [rfReplaceAll]), #10, '', [rfReplaceAll]));
          Erros.SaveToFile('C:\errosDLL_'+formatdatetime('ddmmyyhhmmss', now)+'.txt');
          SetFileAttributesA(PAnsiChar(PathDig + NomeArquivo), GetFileAttributesA(PAnsiChar(PathDig + NomeArquivo)) xor SysUtils.faReadOnly);
          DeleteFileA(PAnsiChar(PathDig + NomeArquivo));
        end;
      end;
    end;

  except
    on E: Exception do
    begin
      Result := False;
      Erros.Add('Ocorreu um erro durante a gravação dos dados.'#13 + E.Message);
    end;
  end;
end;

function GravarFesto(NmServer: OleVariant; ArquivoFesto: TArquivoFesto): Boolean;
var
  Processo, Grupo, Local_Desemb, CodUsuarioResp, GrupoArea, CodPaisOrigem: String;
  Item, NrItem, CodFabricante: Integer;
  Ped: Integer;
  QtdPedido, PLPedido, VLUnitPedido, VLTotalPedido: Double;
  PathDig, NomeArquivo: String;
  MS: TMemoryStream;
  AssuntoEmail, CorpoEmail, UsuarioEmail, ResponsavelEmail, EmailGrupo, UnidadeMedidaBroker: String;
 // ObjIntegraSG: TIntegraSG;
 // ProcessoAnterior : String;
begin
 { ObjIntegraSG := TIntegraSG.Create;
  if Erros = nil then
    Erros := TstringList.Create;}
  try
  try
    DefineConexao(NmServer);
    Connection.Open;
    
    GrupoArquivo    := 'B35';
    GrupoArea       := '58';
    Prefixo         := 'FE';
    CodUsuarioResp  := '0184';
    Cliente         := '02274';
    Grupo           := 'B35';


    VerificaMercadoriasFesto(ArquivoFesto);
    InstDesemb := ConsultaSQLPlanilha(' SELECT ''ID'' + RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) + 1, ''1'')), 8) + ''-'' + RIGHT(YEAR(GETDATE()), 2) ' +
                                      '   FROM TINSTRUCAO_DESEMBARACO (NOLOCK) ' +
                                      '  WHERE RIGHT(RTRIM(ID_CODIGO), 2) = RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2)');

    Connection.BeginTrans;
    try
       { ------ Instrução de Desembaraço ------ }
      qryConsulta.SQL.Clear;
      qryConsulta.SQL.text := ' INSERT INTO TINSTRUCAO_DESEMBARACO(ID_CODIGO, CD_USUARIO, DT_CRIACAO,         '+ sLineBreak +
                              '                                    IN_AUTORIZADO, CD_CLIENTE, CD_RESPONSAVEL, '+ sLineBreak +
                              '                                    CD_EMPRESA, ID_CLIENTE)                    '+ sLineBreak +
                              ' VALUES(:ID_CODIGO, :CD_USUARIO, :DT_CRIACAO, :IN_AUTORIZADO, :CD_CLIENTE,     '+ sLineBreak +
                              '        :CD_RESPONSAVEL, :CD_EMPRESA, :ID_CLIENTE)                             '+ sLineBreak ;
      qryConsulta.Parameters.ParamByName('ID_CODIGO').Value              := InstDesemb;
      qryConsulta.Parameters.ParamByName('CD_USUARIO').Value             := CodUsuario;
      qryConsulta.Parameters.ParamByName('DT_CRIACAO').Value             := Date;
      qryConsulta.Parameters.ParamByName('IN_AUTORIZADO').Value          := '0';
      qryConsulta.Parameters.ParamByName('CD_CLIENTE').Value             := Cliente;
      qryConsulta.Parameters.ParamByName('CD_RESPONSAVEL').Value         := CodUsuarioResp;
      qryConsulta.Parameters.ParamByName('CD_EMPRESA').Value             := Cliente;
      qryConsulta.Parameters.ParamByName('ID_CLIENTE').Value             := Trim(ArquivoFesto[0].Processo);
      qryConsulta.ExecSQL;

      //ProcessoAnterior := '';
      for Ped := 0 to High(ArquivoFesto) do
      begin
        { Pedido }
        if ConsultaSQLPlanilha(Format('SELECT COUNT(*) ' +
                                      '  FROM TPO (NOLOCK) ' +
                                      ' WHERE NR_PROCESSO = ''%s'' ' +
                                      '   AND CD_EMPRESA  = ''%s''',
                                      [ArquivoFesto[Ped].DocumentoFaturamento,
                                      Cliente])) = '0' then
        begin
          { --------------- Processo --------------- }
         // if ProcessoAnterior <> ArquivoFesto[Ped].processo then   {Testamos criar um processo só. mas ta ligado na web. não saberiamos o impacto}
          begin
            Processo := ConsultaSQLPlanilha(  ' SELECT ISNULL(MAX(CONVERT(INT, SUBSTRING(NR_PROCESSO, 8, CHARINDEX(''-'', NR_PROCESSO, CHARINDEX(''-'', NR_PROCESSO)) - 1))), 0) ' +
                                              '   FROM TPROCESSO (NOLOCK) ' +
                                              '  WHERE CD_UNID_NEG = ''01'' ' +
                                              '    AND CD_PRODUTO  = ''06'' ' +
                                              '    AND DATEPART(YYYY, DT_ABERTURA)  = DATEPART(YYYY, GETDATE()) ' +
                                              '    AND SUBSTRING(NR_PROCESSO, 5, 2) = ''' + Prefixo + ''' ');

            Processo := Format('%s%s-%s-%s', ['0106', Prefixo, FormatFloat('000000', StrToInt(Processo) + 1), FormatDateTime('yy', Now)]);

            if qryConsulta.Active then
              qryConsulta.Close;

            qryConsulta.SQL.Clear;
            qryConsulta.SQL.text := 'INSERT INTO TPROCESSO(NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_GRUPO, NR_REFERENCIA,    '+ sLineBreak +
                                    '                      CD_CLIENTE, IN_LIBERADO, IN_CANCELADO, DT_ABERTURA, HR_ABERTURA,  '+ sLineBreak +
                                    '                      IN_DADOS_IGUAIS_ITENS, CD_USUARIO, CD_IMPORTADOR, CD_SERVICO,     '+ sLineBreak +
                                    '                      CD_AREA, CD_EXPORTADOR)                                           '+ sLineBreak +
                                    'VALUES(:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_GRUPO, :NR_REFERENCIA, :CD_CLIENTE, '+ sLineBreak +
                                    '       :IN_LIBERADO, :IN_CANCELADO,:DT_ABERTURA, :HR_ABERTURA, :IN_DADOS_IGUAIS_ITENS,  '+ sLineBreak +
                                    '       :CD_USUARIO, :CD_IMPORTADOR, :CD_SERVICO, :CD_AREA, :CD_EXPORTADOR)              '+ sLineBreak ;

            qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value           := Processo;
            qryConsulta.Parameters.ParamByName('CD_UNID_NEG').Value           := '01';
            qryConsulta.Parameters.ParamByName('CD_PRODUTO').Value            := '06';
            qryConsulta.Parameters.ParamByName('CD_GRUPO').Value              := Grupo;
            qryConsulta.Parameters.ParamByName('NR_REFERENCIA').Value         := ArquivoFesto[Ped].DocumentoFaturamento;
            qryConsulta.Parameters.ParamByName('CD_CLIENTE').Value            := Cliente;
            qryConsulta.Parameters.ParamByName('IN_LIBERADO').Value           := '1';
            qryConsulta.Parameters.ParamByName('IN_CANCELADO').Value          := '0';
            qryConsulta.Parameters.ParamByName('DT_ABERTURA').Value           := Date;
            qryConsulta.Parameters.ParamByName('HR_ABERTURA').Value           := Now;
            qryConsulta.Parameters.ParamByName('IN_DADOS_IGUAIS_ITENS').Value := '1';
            qryConsulta.Parameters.ParamByName('CD_USUARIO').Value            := CodUsuario;
            qryConsulta.Parameters.ParamByName('CD_IMPORTADOR').Value         := Cliente;
            qryConsulta.Parameters.ParamByName('CD_SERVICO').Value            := _SERVICO;
            qryConsulta.Parameters.ParamByName('CD_AREA').Value               := GrupoArea;
            qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value         := _EXPORTADOR;
            qryConsulta.ExecSQL;
          end;
          {-----------------------------------------------------------------------------}

         { --------------- Pedido --------------- }
          PLPedido      := 0;
          VLTotalPedido := 0;
          for Item := 0 to High(ArquivoFesto[Ped].Itens) do
          begin
            PLPedido      := PLPedido + ArquivoFesto[Ped].Itens[Item].PesoMaterial;
            VLTotalPedido := VLTotalPedido + ArquivoFesto[Ped].Itens[Item].PrecoTotal;
          end;

          qryConsulta.SQL.Clear;
          qryConsulta.SQL.text := ' INSERT INTO TPO(NR_PROCESSO, CD_IMPORTADOR, CD_REGIME_TRIB, CD_MOEDA_NEG, DT_ABERTURA,      '+ sLineBreak +
                                  '                 QT_TOTAL_ITENS, CD_AREA, CD_SERVICO, CD_USUARIO, CD_EMPRESA, PL_PO,         '+ sLineBreak +
                                  '                 VL_TOTAL, CD_EXPORTADOR, CD_FABRICANTE )                                    '+ sLineBreak +
                                  '          VALUES(:NR_PROCESSO, :CD_IMPORTADOR, :CD_REGIME_TRIB, :CD_MOEDA_NEG, :DT_ABERTURA, '+ sLineBreak +
                                  '                 :QT_TOTAL_ITENS, :CD_AREA, :CD_SERVICO, :CD_USUARIO, :CD_EMPRESA, :PL_PO,   '+ sLineBreak +
                                  '                 :VL_TOTAL, :CD_EXPORTADOR, :CD_FABRICANTE )                                 '+ sLineBreak ;

          with ArquivoFesto[Ped].Itens[0] do
          begin
            qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value     := ArquivoFesto[Ped].DocumentoFaturamento;
            qryConsulta.Parameters.ParamByName('CD_IMPORTADOR').Value   := Cliente;
            qryConsulta.Parameters.ParamByName('CD_REGIME_TRIB').Value  := '1';
            //qryConsulta.Parameters.ParamByName('CD_MOEDA_NEG').Value  := ITEB.Moeda_Negociada;
            qryConsulta.Parameters.ParamByName('DT_ABERTURA').Value     := Date;
            qryConsulta.Parameters.ParamByName('QT_TOTAL_ITENS').Value  := High(ArquivoFesto[Ped].Itens) + 1;
            qryConsulta.Parameters.ParamByName('CD_AREA').Value         := GrupoArea;
            qryConsulta.Parameters.ParamByName('CD_SERVICO').Value      := _SERVICO;
            qryConsulta.Parameters.ParamByName('CD_USUARIO').Value      := CodUsuario;
            qryConsulta.Parameters.ParamByName('CD_EMPRESA').Value      := Cliente;
            qryConsulta.Parameters.ParamByName('PL_PO').Value           := PLPedido;
            qryConsulta.Parameters.ParamByName('VL_TOTAL').Value        := StrToFloat(FormatFloat('0.00000',VLTotalPedido));
            qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value   := _EXPORTADOR;
            qryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value   := _EXPORTADOR;
            qryConsulta.ExecSQL;

            ExecuteSQL(' UPDATE TFLP_PO ' +
                       '    SET DT_REALIZACAO = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103), ' +
                       '        DT_PREVISTA   = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) ' +
                       '  WHERE CD_EVENTO  IN (''003'',''022'') ' +
                       '    AND NR_PROCESSO = ''' + ArquivoFesto[Ped].DocumentoFaturamento + ''' ' +
                       '    AND CD_EMPRESA  = ''' + Cliente + '''');

            ExecuteSQL('EXEC sp_atz_ev_flp_po ''' + ArquivoFesto[Ped].DocumentoFaturamento + ''', ''' + Cliente + '''');

          end;
        end
        else
        begin
          {Processo := Trim(ConsultaSQLPlanilha(Format(' SELECT NR_PROCESSO ' +
                                                      '   FROM TPROCESSO (NOLOCK)' +
                                                      '  WHERE NR_REFERENCIA = ''%s''', [ArquivoFesto[Ped].DocumentoFaturamento]))); }
        end;

          { ---------------- Item ---------------- }
        NrItem := StrToInt(ConsultaSQLPlanilha(Format('SELECT ISNULL(MAX(CONVERT(INT, NR_ITEM)), 0) ' +
                                                      '  FROM TPO_ITEM (NOLOCK) ' +
                                                      ' WHERE NR_PROCESSO = ''%s'' ' +
                                                      '   AND CD_EMPRESA  = ''%s''',
                                                      [ArquivoFesto[Ped].DocumentoFaturamento, Cliente])));

        for Item := 0 to High(ArquivoFesto[Ped].Itens) do
        begin
          with ArquivoFesto[Ped].Itens[Item] do
          begin
            {Pega o código do fabricante(result da função) e do País(por variável)}
            CodFabricante := GetFabricantesFesto(CodPaisOrigem, NomeFabricante, PaisFabricante, EnderecoFabricante, CidadeFabricante);

            UnidadeMedidaBroker := Trim(ConsultaSQLPlanilha(Format(' SELECT TOP 1 CD_UNID_MEDIDA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE NM_SIGLA = ''%s''',
                                                                   [UnidadeMedida])));

            qryConsulta.SQL.Clear;
            qryConsulta.SQL.Text := 'INSERT INTO TPO_ITEM(NR_PROCESSO, NR_ITEM, CD_MERCADORIA, CD_NCM_SH, CD_REG_TRIB_II,                     '+ sLineBreak +
                                    '       PL_ITEM, QT_INICIAL, QT_DISPONIVEL, TP_CALCULO, TX_MERCADORIA, VL_UNITARIO, VL_TOTAL,             '+ sLineBreak +
                                    '       NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA, IN_UTILIZADO_INSTR_DESEMB, ID_CODIGO_INSTR_DESEMB,       '+ sLineBreak +
                                    '       CD_EXPORTADOR, CD_FABRICANTE, CD_CFOP, CD_UNID_MEDIDA, NR_FATURA, CD_PAIS_ORIGEM )                '+ sLineBreak +
                                    'VALUES(:NR_PROCESSO, :NR_ITEM, :CD_MERCADORIA, :CD_NCM_SH, :CD_REG_TRIB_II,                              '+ sLineBreak +
                                    '       :PL_ITEM, :QT_INICIAL, :QT_DISPONIVEL, :TP_CALCULO, :TX_MERCADORIA, :VL_UNITARIO, :VL_TOTAL,      '+ sLineBreak +
                                    '       :NR_ITEM_CLIENTE, :NR_PARCIAL, :CD_EMPRESA, :IN_UTILIZADO_INSTR_DESEMB, :ID_CODIGO_INSTR_DESEMB,  '+ sLineBreak +
                                    '       :CD_EXPORTADOR, :CD_FABRICANTE, :CD_CFOP, :CD_UNID_MEDIDA, :NR_FATURA, :CD_PAIS_ORIGEM )          '+ sLineBreak ;

            qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value               := ArquivoFesto[Ped].DocumentoFaturamento;
            qryConsulta.Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 1);
            qryConsulta.Parameters.ParamByName('CD_MERCADORIA').Value             := NumeroMaterial;
            qryConsulta.Parameters.ParamByName('CD_NCM_SH').Value                 := NCMMaterial;
            qryConsulta.Parameters.ParamByName('CD_REG_TRIB_II').Value            := '';
            qryConsulta.Parameters.ParamByName('PL_ITEM').Value                   := PesoMaterial;
            qryConsulta.Parameters.ParamByName('QT_INICIAL').Value                := 0;
            qryConsulta.Parameters.ParamByName('QT_DISPONIVEL').Value             := 0;
            qryConsulta.Parameters.ParamByName('TP_CALCULO').Value                := '1';
            qryConsulta.Parameters.ParamByName('TX_MERCADORIA').Value             := IfThen(Trim(TextoMaterialCompleto) = '', TextoMaterial, TextoMaterialCompleto);
            qryConsulta.Parameters.ParamByName('VL_UNITARIO').Value               := StrToFloat(FormatFloat('0.00000',((PrecoTotal + ValorEmbalagem)/Quantidade)));
            qryConsulta.Parameters.ParamByName('VL_TOTAL').Value                  := StrToFloat(FormatFloat('0.00000',(PrecoTotal + ValorEmbalagem)));
            qryConsulta.Parameters.ParamByName('NR_ITEM_CLIENTE').Value           := RightStr(ItemDocumento, 4);
            qryConsulta.Parameters.ParamByName('NR_PARCIAL').Value                := 0;
            qryConsulta.Parameters.ParamByName('CD_EMPRESA').Value                := Cliente;
            qryConsulta.Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '0';
            qryConsulta.Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := '';
            qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value             := _EXPORTADOR;
            qryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value             := CodFabricante;
            qryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value            := CodPaisOrigem;
            qryConsulta.Parameters.ParamByName('CD_CFOP').Value                   := CFOP;
            qryConsulta.Parameters.ParamByName('CD_UNID_MEDIDA').Value            := UnidadeMedidaBroker;
            qryConsulta.Parameters.ParamByName('NR_FATURA').Value                 := '';
            qryConsulta.ExecSQL;

            qryConsulta.Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 2);
            qryConsulta.Parameters.ParamByName('QT_INICIAL').Value                := Quantidade ;
            qryConsulta.Parameters.ParamByName('QT_DISPONIVEL').Value             := Quantidade;
            qryConsulta.Parameters.ParamByName('NR_PARCIAL').Value                := 1;
            qryConsulta.Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '1';
            qryConsulta.Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := InstDesemb;
            qryConsulta.Parameters.ParamByName('NR_FATURA').Value                 := NrFatura;
            qryConsulta.ExecSQL;

            { --- Item Instrução de Desembaraço ---- }
            ExecuteSQL(' INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO(ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO) ' +
                       ' VALUES(''' + InstDesemb + ''', ''' + ArquivoFesto[Ped].DocumentoFaturamento + ''', ''' + RightStr(ItemDocumento, 4) + ''', 1, ' +
                       ' CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103))');

            Inc(NrItem, 2);
          end;
        end;

       // ProcessoAnterior := ArquivoFesto[Ped].processo;
      end;
      Connection.CommitTrans;

      //NÃO É PRA MANDAR AUTORIZAR
      AssuntoEmail := '[MyIndaiaMail] Cadastro: Referências da ' + InstDesemb;
           Cliente := ConsultaLookup('TEMPRESA_NAC', 'NM_EMPRESA', 'CD_EMPRESA = ''' + Cliente + '''');
      AssuntoEmail := AssuntoEmail + ' / Cliente: ' + Cliente;

      CorpoEmail := '<html>' +
                    '<body>' +
                    '    A planilha foi integrada com sucesso, ' +
                    ' porém alguns dados ficaram sem valor por falta de ' +
                    ' referência. Esta informação que faltou foi enviada ao nosso ' +
                    'setor para que sejam cadastradas, de modo que as próximas integrações sejam ' +
                    'executadas com mais eficiência, melhorando ainda mais o seu processo. Provavelmente ' +
                    'precisaremos de algumas informações para completar esse cadastro, contamos com você!' +
                    '<br><br>' +
                    StringReplace(Erros.Text, #13#10, '<br>', [rfReplaceAll]) +
                    '</body>' +
                    '</html>';

      UsuarioEmail     := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuario + '''');
      ResponsavelEmail := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuarioResp + '''');

      if qryConsulta.Active then
          qryConsulta.Close;
      qryConsulta.SQL.Clear;
      qryConsulta.SQL.Add('SELECT *');
      qryConsulta.SQL.Add('FROM VW_CONFIG_MAIL');
      qryConsulta.Open;

      EmailGrupo := 'festo.imp@myindaia.com.br;';

      EnviaEmail(qryConsulta.FieldByName('NM_HOST').AsString,
                 qryConsulta.FieldByName('NM_LOGIN').AsString,
                 qryConsulta.FieldByName('NM_SENHA').AsString,
                 qryConsulta.FieldByName('NR_PORTA').AsInteger,
                 AssuntoEmail, CorpoEmail,
                 'ti@myindaia.com.br;'+ EmailGrupo + UsuarioEmail,
                 'ti@myindaia.com.br', []);


      Result := True;
    except
      on E: Exception do
      begin
        if Connection.InTransaction then
          Connection.RollbackTrans;

        Erros.Add('Erro gravando dados.');
        Erros.Add('Mensagem: ' + StringReplace(StringReplace(E.Message, #13, ' ', [rfReplaceAll]), #10, '', [rfReplaceAll]));

        SetFileAttributesA(PAnsiChar(PathDig + NomeArquivo), GetFileAttributesA(PAnsiChar(PathDig + NomeArquivo)) xor SysUtils.faReadOnly);
        DeleteFileA(PAnsiChar(PathDig + NomeArquivo));
      end;
    end;


  except
    on E: Exception do
    begin
      Result := False;
      Erros.Add('Ocorreu um erro durante a gravação dos dados.'#13 + E.Message);
    end;
  end;
  finally
  //  ObjIntegraSG.Destroy;
  end;
end;

function GravarLIFesto(NmServer: OleVariant; ArquivoFesto: TArquivoFesto): Boolean;
var
  Processo, Grupo, Local_Desemb, CodUsuarioResp, GrupoArea, CodPaisOrigem, CodPaisOrigemItem: String;
  Item, NrItem, NrItemCliente, CodFabricante: Integer;
  Ped: Integer;
  QtdPedido, PLPedido, VLUnitPedido, VLTotalPedido, VLFrete, VLSeguro: Double;
  PathDig, NomeArquivo: String;
  MS: TMemoryStream;
  AssuntoEmail, CorpoEmail, UsuarioEmail, ResponsavelEmail, EmailGrupo, ProcessoLI, CodPaisProcedencia: String;
  Exportador, UnidadeMedidaBroker: string;
  QuantidadeTotal, PesoTotal, PrecoTotalPedido: Double;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}
  try
    DefineConexao(NmServer);
    Connection.Open;
    GrupoArquivo   := 'B35';
    GrupoArea      := '58';
    Prefixo        := 'FE';
    CodUsuarioResp := '0184';
    Cliente := '02274';
    Grupo   := 'B35';
    ProcessoLI := '0101' + System.Copy(Trim(NomeArquivoFesto), 4, 12);

    //insere as mercadorias. não precisa estar em transação
    VerificaMercadoriasFesto(ArquivoFesto);

    CodPaisOrigem := ConsultaLookUp('TPROCESSO', 'CD_PAIS_ORIGEM', 'NR_PROCESSO = ''' + ProcessoLI + '''');
    Exportador    := ConsultaLookUp('TPROCESSO', 'CD_EXPORTADOR', 'NR_PROCESSO = ''' + ProcessoLI + '''');

    { Pedido }
    QuantidadeTotal  := 0;
    PesoTotal        := 0;
    PrecoTotalPedido := 0;
    for Ped := 0  to High(ArquivoFesto) do
      for Item := 0 to High(ArquivoFesto[Ped].Itens) do
      begin
        QuantidadeTotal  := QuantidadeTotal + 1;
        PesoTotal        := PesoTotal + ArquivoFesto[Ped].Itens[Item].PesoMaterial;
        PrecoTotalPedido := PrecoTotalPedido +  StrToFloat(FormatFloat('0.00000', (ArquivoFesto[Ped].Itens[Item].PrecoTotal +  ArquivoFesto[Ped].Itens[Item].ValorEmbalagem)));
      end;

    Connection.BeginTrans;
    try

      if qryConsulta.Active then
        qryConsulta.Close;

      qryConsulta.SQL.Clear;
      qryConsulta.SQL.TEXT :=   '  INSERT INTO TLICENCA_IMPORTACAO(NR_PROCESSO, CD_IMPORTADOR,               ' + sLineBreak +
                                '                                  CD_PAIS_PROCEDENCIA, CD_INCOTERM,         ' + sLineBreak +
                                '                                  CD_MOEDA_FRETE, CD_MOEDA_SEGURO,          ' + sLineBreak +
                                '                                  CD_MOEDA_MLE, CD_SERVICO, DT_PROCESSO_LI, ' + sLineBreak +
                                '                                  QT_TOTAL_PES_LIQ, QT_TOTAL_ITEM,          ' + sLineBreak +
                                '                                  VL_FRETE_MOEDA, VL_SEGURO_MOEDA,          ' + sLineBreak +
                                '                                  VL_TOTAL_MOEDA, IN_MONTADA)               ' + sLineBreak +
                                '  SELECT RTRIM(NR_PROCESSO), CD_CLIENTE, CD_PAIS_ORIGEM, CD_INCOTERM,       ' + sLineBreak +
                                '         CD_MOEDA_FRETE, CD_MOEDA_SEGURO, CD_MOEDA_MLE,                     ' + sLineBreak +
                                '         CD_SERVICO, GETDATE(), :QT_TOTAL_PES_LIQ, :QT_TOTAL_ITEM,          ' + sLineBreak +
                                '         ISNULL(VL_FRETE_PREPAID_MNEG,0)+ISNULL(VL_FRETE_COLLECT_MNEG,0),   ' + sLineBreak +
                                '         VL_SEGURO_MNEG, :VL_TOTAL_MOEDA, 0                                 ' + sLineBreak +
                                '    FROM TPROCESSO (NOLOCK)                                                 ' + sLineBreak +
                                '   WHERE NR_PROCESSO = :NR_PROCESSO                                         ' + sLineBreak ;

      qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value      := ProcessoLI;
      qryConsulta.Parameters.ParamByName('QT_TOTAL_PES_LIQ').Value := StrToFloat(FormatFloat('0.00000', PesoTotal));
      qryConsulta.Parameters.ParamByName('QT_TOTAL_ITEM').Value    := FormatFloat('000',QuantidadeTotal);
      qryConsulta.Parameters.ParamByName('VL_TOTAL_MOEDA').Value   := StrToFloat(FormatFloat('0.00000', PrecoTotalPedido));
      qryConsulta.ExecSQL;

      VLFrete       := StrToFloat(ConsultaLookUp('TLICENCA_IMPORTACAO', 'ISNULL(VL_FRETE_MOEDA,0)', 'NR_PROCESSO = ''' + ProcessoLI + ''''));
      VLSeguro      := StrToFloat(ConsultaLookUp('TLICENCA_IMPORTACAO', 'ISNULL(VL_SEGURO_MOEDA,0)', 'NR_PROCESSO = ''' + ProcessoLI + ''''));

      { ---------------- Item ---------------- }
      NrItem := 0;
      for Ped:= 0 to High(ArquivoFesto) do
        for Item := 0 to High(ArquivoFesto[Ped].Itens) do
        begin
          with ArquivoFesto[Ped].Itens[Item] do
          begin
            {Pega o código do fabricante(result da função) e do País(por variável)}
            CodFabricante := GetFabricantesFesto(CodPaisOrigemItem, NomeFabricante, PaisFabricante, EnderecoFabricante, CidadeFabricante);

            UnidadeMedidaBroker := Trim(ConsultaSQLPlanilha(Format(' SELECT TOP 1 CD_UNID_MEDIDA '+
                                                                   '   FROM TUNID_MEDIDA_BROKER (NOLOCK) '+
                                                                   '  WHERE NM_SIGLA = ''%s''',
                                                                   [UnidadeMedida])));

            qryConsulta.SQL.Clear;
            qryConsulta.SQL.TEXT := 'INSERT INTO TLICENCA_ITENS(NR_PROCESSO, NR_ITEM, CD_IMPORTADOR, CD_EXPORTADOR,     ' + sLineBreak +
                                    ' CD_MERCADORIA, CD_NCM_SH, CD_PAIS_ORIGEM, CD_UN_MED_COMERC, PL_MERCADORIA,        ' + sLineBreak +
                                    ' QT_MERC_UN_COMERC, TX_DESC_DET_MERC, VL_UNIT_MLE, VL_TOTAL_MLE,                   ' + sLineBreak +
                                    ' CD_PAIS_PROCEDENCIA, VL_RAT_FRETE, VL_RAT_SEGURO,                                 ' + sLineBreak +
                                    ' NR_ITEM_PO, NR_PROC_PO, CD_REGIME_TRIBUTACAO, NR_FATURA_PO, CD_FABRICANTE)        ' + sLineBreak +
                                    'VALUES(:NR_PROCESSO, :NR_ITEM, :CD_IMPORTADOR, :CD_EXPORTADOR,                     ' + sLineBreak +
                                    ' :CD_MERCADORIA, :CD_NCM_SH, :CD_PAIS_ORIGEM, :CD_UN_MED_COMERC,  :PL_MERCADORIA,  ' + sLineBreak +
                                    ' :QT_MERC_UN_COMERC, :TX_DESC_DET_MERC, :VL_UNIT_MLE, :VL_TOTAL_MLE,               ' + sLineBreak +
                                    ' :CD_PAIS_PROCEDENCIA, :VL_RAT_FRETE, :VL_RAT_SEGURO, :NR_ITEM_PO, :NR_PROC_PO,    ' + sLineBreak +
                                    ':CD_REGIME_TRIBUTACAO, :NR_FATURA_PO, :CD_FABRICANTE )                             ' + sLineBreak ;

            qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value          := ProcessoLI;
            qryConsulta.Parameters.ParamByName('NR_ITEM').Value              := FormatFloat('000', NrItem + 1);
            qryConsulta.Parameters.ParamByName('CD_IMPORTADOR').Value        := Cliente;
            qryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value        := Exportador;
            qryConsulta.Parameters.ParamByName('CD_MERCADORIA').Value        := NumeroMaterial;
            qryConsulta.Parameters.ParamByName('CD_NCM_SH').Value            := NCMMaterial;
            qryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value       := CodPaisOrigem;
            qryConsulta.Parameters.ParamByName('CD_UN_MED_COMERC').Value     := UnidadeMedidaBroker;
            qryConsulta.Parameters.ParamByName('PL_MERCADORIA').Value        := PesoMaterial;
            qryConsulta.Parameters.ParamByName('QT_MERC_UN_COMERC').Value    := Quantidade;
            qryConsulta.Parameters.ParamByName('TX_DESC_DET_MERC').Value     := IfThen(Trim(TextoMaterialCompleto) = '', TextoMaterial, TextoMaterialCompleto);
            qryConsulta.Parameters.ParamByName('VL_UNIT_MLE').Value          := StrToFloat(FormatFloat('0.00000', ((PrecoTotal + ValorEmbalagem)/Quantidade)));
            qryConsulta.Parameters.ParamByName('VL_TOTAL_MLE').Value         := StrToFloat(FormatFloat('0.00000', (PrecoTotal + ValorEmbalagem)));
            qryConsulta.Parameters.ParamByName('CD_PAIS_PROCEDENCIA').Value  := CodPaisOrigem;
            qryConsulta.Parameters.ParamByName('VL_RAT_FRETE').Value         := Math.IfThen(PesoTotal = 0, 0,(VLFrete/PesoTotal)*PesoMaterial);
            qryConsulta.Parameters.ParamByName('VL_RAT_SEGURO').Value        := Math.IfThen(PesoTotal = 0, 0,(VLSeguro/PesoTotal)*PesoMaterial);
            qryConsulta.Parameters.ParamByName('NR_ITEM_PO').Value           := RightStr(ItemDocumento, 4);
            qryConsulta.Parameters.ParamByName('NR_PROC_PO').Value           := ArquivoFesto[Ped].DocumentoFaturamento;
            qryConsulta.Parameters.ParamByName('CD_REGIME_TRIBUTACAO').Value := '1';
            qryConsulta.Parameters.ParamByName('NR_FATURA_PO').Value         := NrFatura;
            qryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value        := CodFabricante;
            qryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value       := CodPaisOrigemItem;
            qryConsulta.ExecSQL;

            Inc(NrItem, 1);
          end;
        end;
      Connection.CommitTrans;

      //NÃO É PRA MANDAR AUTORIZAR
      AssuntoEmail := '[MyIndaiaMail] Cadastro: Referências da ' + InstDesemb;
      Cliente      := ConsultaLookup('TEMPRESA_NAC', 'NM_EMPRESA', 'CD_EMPRESA = ''' + Cliente + '''');
      AssuntoEmail := AssuntoEmail + ' / Cliente: ' + Cliente;

      CorpoEmail := '<html>' +
                    '<body>' +
                    '    A planilha foi integrada com sucesso, ' +
                    ' porém alguns dados ficaram sem valor por falta de ' +
                    ' referência. Esta informação que faltou foi enviada ao nosso ' +
                    'setor para que sejam cadastradas, de modo que as próximas integrações sejam ' +
                    'executadas com mais eficiência, melhorando ainda mais o seu processo. Provavelmente ' +
                    'precisaremos de algumas informações para completar esse cadastro, contamos com você!' +
                    '<br><br>' +
                    StringReplace(Erros.Text, #13#10, '<br>', [rfReplaceAll]) +
                    '</body>' +
                    '</html>';

      UsuarioEmail     := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuario + '''');
      ResponsavelEmail := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuarioResp + '''');

      if qryConsulta.Active then
        qryConsulta.Close;

      qryConsulta.SQL.Clear;
      qryConsulta.SQL.Add('SELECT *');
      qryConsulta.SQL.Add('FROM VW_CONFIG_MAIL');
      qryConsulta.Open;

      EmailGrupo := 'festo.imp@myindaia.com.br;';

      EnviaEmail(qryConsulta.FieldByName('NM_HOST').AsString,
                 qryConsulta.FieldByName('NM_LOGIN').AsString,
                 qryConsulta.FieldByName('NM_SENHA').AsString,
                 qryConsulta.FieldByName('NR_PORTA').AsInteger,
                 AssuntoEmail,
                 CorpoEmail,
                 'ti@myindaia.com.br;'+ EmailGrupo + UsuarioEmail,
                 'ti@myindaia.com.br', []);

      Result := True;

    except
      on E: Exception do
      begin
        if Connection.InTransaction then
          Connection.RollbackTrans;

        Erros.Add('Erro gravando dados.');
        Erros.Add('Mensagem: ' + StringReplace(StringReplace(E.Message, #13, ' ', [rfReplaceAll]), #10, '', [rfReplaceAll]));

        SetFileAttributesA(PAnsiChar(PathDig + NomeArquivo), GetFileAttributesA(PAnsiChar(PathDig + NomeArquivo)) xor SysUtils.faReadOnly);
        DeleteFileA(PAnsiChar(PathDig + NomeArquivo));
      end;
    end;

  except
    on E: Exception do
    begin
      Result := False;
      Erros.Add('Ocorreu um erro durante a gravação dos dados.'#13 + E.Message);
    end;
  end;
end;

{ Leitura Geral do Arquivo }

function LerArquivoSG(NmServer, TxArquivo, CdUsuario: OleVariant): OleVariant;
var
  Arquivo: TStrings;
  ArquivoSG: TArquivoSG;
  L: Integer;
  UsuarioEmail, CorpoEmail: String;
begin
  L := 1;
  L := L div (L - 1);

  {if Erros = nil then
    Erros := TstringList.Create;}

  Erros.Clear;
  Arquivo := TStringList.Create;
  CodUsuario := CdUsuario;
  SetLength(ArquivoSG.CAP, 0);
  SetLength(ArquivoSG.AGs, 0);
  try
    Arquivo.LoadFromFile(TxArquivo);
    for L := 0 to Arquivo.Count - 1 do
      try                                                { 0       1       2       3       4       5       6       7       8       9       10   }
        case AnsiIndexText(LeftStr(Trim(Arquivo[L]), 4), ['ITDI', 'CAPI', 'CAP2', 'CAP3', 'ITEA', 'ITEB', 'ITEC', 'ITED', 'AG4A', 'AG4B', 'FTDI']) of
           0: if not LerITDI(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           1: if not LerCAPI(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end
              else
                ArquivoSG.CAP[High(ArquivoSG.CAP)].CAPI.Nr_Referencia_Arquivo := ExtractFileName(ChangeFileExt(TxArquivo, ''));
           2: if not LerCAP2(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           3: if not LerCAP3(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           4: if not LerITEA(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           5: if not LerITEB(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           6: if not LerITEC(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           7: if not LerITED(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           8: if not LerAG4A(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
           9: if not LerAG4B(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
          10: if not LerFTDI(ArquivoSG, TrimLeft(Arquivo[L])) then
              begin
                Result := '';
                Break;
              end;
        else if SameText(LeftStr(Arquivo[L], 2), 'DP') then
          if not LerDPnn(ArquivoSG, TrimLeft(Arquivo[L])) then
          begin
            Result := '';
            Break;
          end;
        end;
      except
        on E: Exception do
        begin
          Erros.Add('Erro lendo arquivo com a mensagem: "' + E.Message + '".');
          Break;
        end;
      end;
  finally
    FreeAndNil(Arquivo);
    if {(Erros.Count = 0) and} Gravar(Servidor, ArquivoSG) then
    begin
      Result := InstDesemb;
    end
    else
    begin
      Result := '';
      if Erros.Count > 0 then
      begin
        DefineConexao(Servidor);
        UsuarioEmail := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuario + '''');

        if qryConsulta.Active then
          qryConsulta.Close;

        qryConsulta.SQL.Clear;
        qryConsulta.SQL.Add('SELECT *');
        qryConsulta.SQL.Add('FROM VW_CONFIG_MAIL (NOLOCK) ');
        qryConsulta.Open;

        CorpoEmail := '<html>' +
                      '<body>' +
                      '    Erro integrando arquivo.<br><br>Mensagem: ' +
                      StringReplace(StringReplace(Erros.Text, #13, '<br>', [rfReplaceAll]), #10, '', [rfReplaceAll]) +
                      '</body>' +
                      '</html>';

        EnviaEmail(qryConsulta.FieldByName('NM_HOST').AsString,
                   qryConsulta.FieldByName('NM_LOGIN').AsString,
                   qryConsulta.FieldByName('NM_SENHA').AsString,
                   qryConsulta.FieldByName('NR_PORTA').AsInteger,
                   '[MyIndaiaMail] Erro integrando arquivo',
                   CorpoEmail,
                   'ti@myindaia.com.br',
                   'ti@myindaia.com.br',
                   [])
      end;
    end;
  end;
end;

function LerArquivoFesto(NmServer, TxArquivo, CdUsuario: OleVariant): OleVariant;
var
  ArquivoFesto : TArquivoFesto;
  SL : TStringList;       
  I : Integer;
  UsuarioEmail, CorpoEmail: String;
begin
 { if Erros = nil then
    Erros := TstringList.Create;}
  try
    SL:= TStringList.Create;
    NomeArquivoFesto:= ExtractFileName(TxArquivo);
    SetLength(ArquivoFesto, 0);
    SL.LoadFromFile(TxArquivo);
    I:= 0;

    CodUsuario := CdUsuario;
    while I < SL.Count do
    begin
      SetLength(ArquivoFesto, High(ArquivoFesto) + 2);

      ArquivoFesto[High(ArquivoFesto)].Processo := Copy(SL[I], 1 , 10);
      ArquivoFesto[High(ArquivoFesto)].DocumentoFaturamento := System.Copy(SL[I], 31, 10);
      SetLength(ArquivoFesto[High(ArquivoFesto)].Itens, 0);

      while (I < SL.Count) and SameText(ArquivoFesto[High(ArquivoFesto)].DocumentoFaturamento, System.Copy(SL[I], 31 , 10)) do
      begin
        SetLength(ArquivoFesto[High(ArquivoFesto)].Itens, High(ArquivoFesto[High(ArquivoFesto)].Itens) + 2);
        with ArquivoFesto[High(ArquivoFesto)].Itens[High(ArquivoFesto[High(ArquivoFesto)].Itens)] do
        begin
          NCMMaterial           := Trim(System.Copy(SL[I], 11, 8));
//          NCMMaterial           := System.Copy(NCMMaterial, 3, 8) + System.Copy(NCMMaterial, 1, 2);
          ItemDocumento         := System.Copy(SL[I], 41, 5);
          NumeroMaterial        := System.Copy(SL[I], 46, 10);
          TextoMaterial         := Trim(System.Copy(SL[I], 56, 100));
          Quantidade            := StrToFloat(Trim(System.Copy(SL[I], 156, 10)));
          PesoMaterial          := StrToFloat(Trim(System.Copy(SL[I], 166, 15)));
          PrecoUnitario         := StrToFloat(Trim(System.Copy(SL[I], 181, 15)));
          PrecoTotal            := StrToFloat(Trim(System.Copy(SL[I], 196, 15)));
          TaxaICMS              := StrToFloat(Trim(System.Copy(SL[I], 211, 5)));
          ValorEmbalagem        := StrToFloat(Trim(System.Copy(SL[I], 226, 15)));
          ValorPIS              := StrToFloat(Trim(System.Copy(SL[I], 241, 6)));
          ValorCOFINS           := StrToFloat(Trim(System.Copy(SL[I], 247, 6)));
          CFOP                  := Trim(System.Copy(SL[I], 253, 6));
          UnidadeMedida         := Trim(System.Copy(SL[I], 259, 2));
          NrFatura              := System.Copy(SL[I], 263, 20);
          TextoMaterialCompleto := Trim(System.Copy(SL[I], 283, 500));
          NomeFabricante        := Trim(System.Copy(SL[I], 816, 35));
          PaisFabricante        := Trim(System.Copy(SL[I], 851, 3));
          EnderecoFabricante    := Trim(System.Copy(SL[I], 854, 35));
          CidadeFabricante      := Trim(System.Copy(SL[I], 889, 30));

          if TextoMaterialCompleto <> '' then // Incluído porque no Gravar ele verifica se TextoMaterialCompleto <> '', e neste caso nunca será porque ele tem o código da mercadoria - Michel - 04/08/2014
            TextoMaterialCompleto := Trim(NumeroMaterial) + ' - ' + Trim(TextoMaterialCompleto);
          TextoMaterial         := Trim(NumeroMaterial) + ' - ' + Trim(TextoMaterial);
        end;
        Inc(I);
      end;
    end;

  finally
    FreeAndNil(SL);

    if (System.Copy(ExtractFileName(TxArquivo), 1, 3) = 'DI_') and (GravarFesto(NmServer, ArquivoFesto)) then
    begin
      Result := InstDesemb;
    end
    else
    begin
      if (System.Copy(ExtractFileName(TxArquivo), 1, 3) = 'LI_') and (GravarLIFesto(NmServer, ArquivoFesto)) then
      begin
        Result := 'LI';

        DefineConexao(NmServer);
        UsuarioEmail := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuario + '''');

        if qryConsulta.Active then
          qryConsulta.Close;

        qryConsulta.SQL.Clear;
        qryConsulta.SQL.Add('SELECT * FROM VW_CONFIG_MAIL (NOLOCK) ');
        qryConsulta.Open;

        CorpoEmail := '<html>' +
                      '<body>' +
                      '    LI integrada com sucesso!' +
                      '</body>' +
                      '</html>';

        EnviaEmail(qryConsulta.FieldByName('NM_HOST').AsString,
                   qryConsulta.FieldByName('NM_LOGIN').AsString,
                   qryConsulta.FieldByName('NM_SENHA').AsString,
                   qryConsulta.FieldByName('NR_PORTA').AsInteger,
                   '[MyIndaiaMail] LI integrada',
                   CorpoEmail, UsuarioEmail + '; TI@myindaia.com.br',
                   'ti@myindaia.com.br',
                   [])
      end
      else
      begin
        Result := '';
        if Erros.Count > 0 then
        begin
          DefineConexao(NmServer);
          UsuarioEmail := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + CodUsuario + '''');

          if qryConsulta.Active then
            qryConsulta.Close;

          qryConsulta.SQL.Clear;
          qryConsulta.SQL.Add('SELECT * FROM VW_CONFIG_MAIL (NOLOCK) ');
          qryConsulta.Open;

          CorpoEmail := '<html>' +
                        '<body>' +
                        '    Erro integrando arquivo.<br><br>Mensagem: ' +
                        StringReplace(StringReplace(Erros.Text, #13, '<br>', [rfReplaceAll]), #10, '', [rfReplaceAll]) +
                        '</body>' +
                        '</html>';

          EnviaEmail(qryConsulta.FieldByName('NM_HOST').AsString,
                     qryConsulta.FieldByName('NM_LOGIN').AsString,
                     qryConsulta.FieldByName('NM_SENHA').AsString,
                     qryConsulta.FieldByName('NR_PORTA').AsInteger,
                     '[MyIndaiaMail] Erro integrando arquivo',
                     CorpoEmail,
                     UsuarioEmail +';ti@myindaia.com.br',
                     'ti@myindaia.com.br',
                     [])
        end;
      end;
    end;
  end;
end;

{
constructor TIntegraSG.Create;
begin
//initialization
  Erros       := TStringList.Create;
  Connection  := TADOConnection.Create(nil);
  Connection.CommandTimeout := 9999;
  qryConsulta := TADOQuery.Create(nil);
  qryConsulta.CommandTimeout := 9999;
  qryConsulta.Connection := Connection;
  cmdExec     := TADOCommand.Create(nil);
  cmdExec.CommandTimeout := 9999;
  cmdExec.Connection := Connection;
end;

destructor TIntegraSG.Destroy;
begin
//finalization
  FreeAndNil(Erros);
  FreeAndNil(cmdExec);
  FreeAndNil(qryConsulta);
  FreeAndNil(Connection);
end;}

initialization
  Erros       := TStringList.Create;
  Connection  := TADOConnection.Create(nil);
  Connection.CommandTimeout := 9999;
  qryConsulta := TADOQuery.Create(nil);
  qryConsulta.CommandTimeout := 9999;
  qryConsulta.Connection := Connection;
  cmdExec     := TADOCommand.Create(nil);
  cmdExec.CommandTimeout := 9999;
  cmdExec.Connection := Connection;

finalization
  FreeAndNil(Erros);
  FreeAndNil(cmdExec);
  FreeAndNil(qryConsulta);
  FreeAndNil(Connection);

end.

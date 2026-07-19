unit MyEntitiesBroker;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy, 
  Aurelius.Criteria.Dictionary;

type
  TTagente = class;
  TTarmazem = class;
  TTdescricaoMercadoriaDraft = class;
  TTdespachante = class;
  TTdespachanteCliente = class;
  TTembalagem = class;
  TTembarcacao = class;
  TTempresaEst = class;
  TTempresaEstGrupo = class;
  TTempresaNac = class;
  TTenquadOp = class;
  TTfollowup = class;
  TTfundLegRegTribut = class;
  TTgrupo = class;
  TTincotermsVenda = class;
  TTlocalEmbarque = class;
  TTmercadoria = class;
  TTmercadoriaExp = class;
  TTmoedaBroker = class;
  TTncm = class;
  TTncmExp = class;
  TTncmExpAtributo = class;
  TTncmExpAtributoValor = class;
  TTncmExpDestaque = class;
  TTobservacoes = class;
  TTpais = class;
  TTpaisBroker = class;
  TTprocesso = class;
  TTprocessoCntr = class;
  TTprocessoDraftBl = class;
  TTprocessoDraftCntr = class;
  TTprocessoDraftComentarios = class;
  TTprocessoDraftMerc = class;
  TTprocessoDraftMercCntr = class;
  TTprocessoExp = class;
  TTprocessoExpItem = class;
  TTprocessoExpItemContainer = class;
  TTprocessoExpNf = class;
  TTprocessoExpNfItem = class;
  TTprocessoExpNfItemEnquadramento = class;
  TTprocessoExpNfItemNfDrawback = class;
  TTprocessoExpNfItemLpco = class;
  TTprocessoExpNfItemNcmAtributo = class;
  TTprocessoExpNfItemNfComplementar = class;
  TTprocessoExpNfItemNotaReferenciada = class;
  TTproduto = class;
  TTratamentoPrioritario = class;
  TTrecAlfandegado = class;
  TTrefCliente = class;
  TTregraObsAuto = class;
  TTregraObsAutoItem = class;
  TTregraObsAutoTabelas = class;
  TTregraObsAutoTabelasCampos = class;
  TTregraObsDi = class;
  TTregTributario = class;
  TTservico = class;
  TTservicoNovo = class;
  TTtpAcordoTarif = class;
  TTtpCntr = class;
  TTtpComentariosInttra = class;
  TTtpEmbalagemInttra = class;
  TTtpExoneracao = class;
  TTtpFrete = class;
  TTtpMovimentoInttra = class;
  TTtpProcessoVinculado = class;
  TTtpTaxasInttra = class;
  TTunidMedidaBroker = class;
  TTunidNeg = class;
  TTurf = class;
  TTusuario = class;
  TTviagem = class;
  TTviaTransporte = class;
  TVwResumoDi = class;
  TVwServicoGeral = class;
  TTagenteTableDictionary = class;
  TTarmazemTableDictionary = class;
  TTdespachanteTableDictionary = class;
  TTdespachanteClienteTableDictionary = class;
  TTembalagemTableDictionary = class;
  TTembarcacaoTableDictionary = class;
  TTempresaEstTableDictionary = class;
  TTempresaEstGrupoTableDictionary = class;
  TTempresaNacTableDictionary = class;
  TTenquadOpTableDictionary = class;
  TTfollowupTableDictionary = class;
  TTfundLegRegTributTableDictionary = class;
  TTgrupoTableDictionary = class;
  TTincotermsVendaTableDictionary = class;
  TTlocalEmbarqueTableDictionary = class;
  TTmercadoriaTableDictionary = class;
  TTmercadoriaExpTableDictionary = class;
  TTmoedaBrokerTableDictionary = class;
  TTncmTableDictionary = class;
  TTncmExpTableDictionary = class;
  TTobservacoesTableDictionary = class;
  TTpaisTableDictionary = class;
  TTpaisBrokerTableDictionary = class;
  TTprocessoTableDictionary = class;
  TTprocessoCntrTableDictionary = class;
  TTprocessoExpTableDictionary = class;
  TTprocessoExpItemTableDictionary = class;
  TTprocessoExpNfTableDictionary = class;
  TTprocessoExpNfItemTableDictionary = class;
  TTprodutoTableDictionary = class;
  TTrecAlfandegadoTableDictionary = class;
  TTrefClienteTableDictionary = class;
  TTregTributarioTableDictionary = class;
  TTservicoTableDictionary = class;
  TTservicoNovoTableDictionary = class;
  TTtpAcordoTarifTableDictionary = class;
  TTtpCntrTableDictionary = class;
  TTtpEmbalagemInttraTableDictionary = class;
  TTtpExoneracaoTableDictionary = class;
  TTtpFreteTableDictionary = class;
  TTtpProcessoVinculadoTableDictionary = class;
  TTunidMedidaBrokerTableDictionary = class;
  TTunidNegTableDictionary = class;
  TTurfTableDictionary = class;
  TTusuarioTableDictionary = class;
  TTviaTransporteTableDictionary = class;
  TTviagemTableDictionary = class;
  TTregraObsDiTableDictionary = class;
  TTprocessoExpNfItemEnquadramentoTableDictionary = class;
  TTprocessoExpNfItemNfDrawbackTableDictionary = class;
  TTncmExpDestaqueTableDictionary = class;
  TTratamentoPrioritarioTableDictionary = class;
  TTprocessoExpNfItemLpcoTableDictionary = class;
  TTprocessoExpNfItemNotaReferenciadaTableDictionary = class;
  TTregraObsAutoTableDictionary = class;
  TTregraObsAutoItemTableDictionary = class;
  TTregraObsAutoTabelasTableDictionary = class;
  TTregraObsAutoTabelasCamposTableDictionary = class;
  TTprocessoExpNfItemNfComplementarTableDictionary = class;
  TVwResumoDiTableDictionary = class;
  TVwServicoGeralTableDictionary = class;
  TTncmExpAtributoTableDictionary = class;
  TTncmExpAtributoValorTableDictionary = class;
  TTprocessoExpNfItemNcmAtributoTableDictionary = class;
  TTprocessoDraftBlTableDictionary = class;
  TTprocessoDraftCntrTableDictionary = class;
  TTprocessoDraftMercTableDictionary = class;
  TTprocessoDraftMercCntrTableDictionary = class;
  TTtpTaxasInttraTableDictionary = class;
  TTprocessoDraftComentariosTableDictionary = class;
  TTtpComentariosInttraTableDictionary = class;
  TTtpMovimentoInttraTableDictionary = class;
  TTprocessoExpItemContainerTableDictionary = class;
  TTdescricaoMercadoriaDraftTableDictionary = class;
  
  [Entity]
  [Table('TAGENTE')]
  [Id('FCdAgente', TIdGenerator.None)]
  TTagente = class
  private
    [Column('CD_AGENTE', [TColumnProp.Required], 4)]
    FCdAgente: string;
    
    [Column('NM_AGENTE', [TColumnProp.Required], 60)]
    FNmAgente: string;
    
    [Column('NR_CGC_AGENTE', [], 14)]
    FNrCgcAgente: Nullable<string>;
    
    [Column('NR_SIGLA', [], 8)]
    FNrSigla: Nullable<string>;
    
    [Column('DS_ENDERECO', [], 260)]
    FDsEndereco: Nullable<string>;
    
    [Column('NR_ZIP_CODE', [], 8)]
    FNrZipCode: Nullable<string>;
    
    [Column('DS_EMAIL', [], 40)]
    FDsEmail: Nullable<string>;
    
    [Column('END_UF', [], 2)]
    FEndUf: Nullable<string>;
    
    [Column('DS_SCAC_CODE', [], 4)]
    FDsScacCode: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_CIDADE', [], 'CODIGO')]
    FCdCidade: Proxy<TTlocalEmbarque>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_PAIS', [], 'CD_PAIS')]
    FPais: Proxy<TTpaisBroker>;
    function GetCdCidade: TTlocalEmbarque;
    procedure SetCdCidade(const Value: TTlocalEmbarque);
    function GetPais: TTpaisBroker;
    procedure SetPais(const Value: TTpaisBroker);
  public
    property CdAgente: string read FCdAgente write FCdAgente;
    property NmAgente: string read FNmAgente write FNmAgente;
    property NrCgcAgente: Nullable<string> read FNrCgcAgente write FNrCgcAgente;
    property NrSigla: Nullable<string> read FNrSigla write FNrSigla;
    property DsEndereco: Nullable<string> read FDsEndereco write FDsEndereco;
    property NrZipCode: Nullable<string> read FNrZipCode write FNrZipCode;
    property DsEmail: Nullable<string> read FDsEmail write FDsEmail;
    property EndUf: Nullable<string> read FEndUf write FEndUf;
    property DsScacCode: Nullable<string> read FDsScacCode write FDsScacCode;
    property CdCidade: TTlocalEmbarque read GetCdCidade write SetCdCidade;
    property Pais: TTpaisBroker read GetPais write SetPais;
  end;
  
  [Entity]
  [Table('TARMAZEM')]
  [Id('FCdArmazem', TIdGenerator.None)]
  TTarmazem = class
  private
    [Column('CD_ARMAZEM', [TColumnProp.Required], 4)]
    FCdArmazem: string;
    
    [Column('NM_ARMAZEM', [TColumnProp.Required], 50)]
    FNmArmazem: string;
    
    [Column('NM_SIGLA', [], 10)]
    FNmSigla: Nullable<string>;
    
    [Column('IN_ATRACACAO', [], 1)]
    FInAtracacao: Nullable<string>;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_RECINTO', [], 'CODIGO')]
    FRecintoAlfandegado: Proxy<TTrecAlfandegado>;
    function GetRecintoAlfandegado: TTrecAlfandegado;
    procedure SetRecintoAlfandegado(const Value: TTrecAlfandegado);
  public
    property CdArmazem: string read FCdArmazem write FCdArmazem;
    property NmArmazem: string read FNmArmazem write FNmArmazem;
    property NmSigla: Nullable<string> read FNmSigla write FNmSigla;
    property InAtracacao: Nullable<string> read FInAtracacao write FInAtracacao;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property RecintoAlfandegado: TTrecAlfandegado read GetRecintoAlfandegado write SetRecintoAlfandegado;
  end;
  
  [Entity]
  [Table('TDESCRICAO_MERCADORIA_DRAFT')]
  [Id('FCodigo', TIdGenerator.IdentityOrSequence)]
  TTdescricaoMercadoriaDraft = class
  private
    [Column('CODIGO', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCodigo: Integer;
    
    [Column('CD_GRUPO', [TColumnProp.Required], 3)]
    FCdGrupo: string;
    
    [Column('NM_DESCRICAO', [TColumnProp.Required], 200)]
    FNmDescricao: Nullable<String>;
    
    [Column('TX_DESCRICAO_PORTUGUES', [TColumnProp.Required])]
    [DBTypeMemo]
    FTxDescricaoPortugues: Nullable<String>;
    
    [Column('TX_DESCRICAO_INGLES', [TColumnProp.Required])]
    [DBTypeMemo]
    FTxDescricaoIngles: Nullable<String>;
    
    [Column('TX_DESCRICAO_ESPANHOL', [TColumnProp.Required])]
    [DBTypeMemo]
    FTxDescricaoEspanhol: Nullable<String>;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property CdGrupo: string read FCdGrupo write FCdGrupo;
    property NmDescricao: Nullable<String> read FNmDescricao write FNmDescricao;
    property TxDescricaoPortugues: Nullable<String> read FTxDescricaoPortugues write FTxDescricaoPortugues;
    property TxDescricaoIngles: Nullable<String> read FTxDescricaoIngles write FTxDescricaoIngles;
    property TxDescricaoEspanhol: Nullable<String> read FTxDescricaoEspanhol write FTxDescricaoEspanhol;
  end;
  
  [Entity]
  [Table('TDESPACHANTE')]
  [Id('FCdDespachante', TIdGenerator.None)]
  TTdespachante = class
  private
    [Column('CD_DESPACHANTE', [TColumnProp.Required], 3)]
    FCdDespachante: string;
    
    [Column('NM_DESPACHANTE', [], 50)]
    FNmDespachante: Nullable<string>;
    
    [Column('AP_DESPACHANTE', [], 10)]
    FApDespachante: Nullable<string>;
    
    [Column('VL_MIN_SDA', [])]
    FVlMinSda: Nullable<Double>;
    
    [Column('VL_MAX_SDA', [])]
    FVlMaxSda: Nullable<Double>;
    
    [Column('CD_RISC', [], 3)]
    FCdRisc: Nullable<string>;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Column('CD_MOD_SDA', [], 2)]
    FCdModSda: Nullable<string>;
    
    [Column('NR_REGISTRO', [], 9)]
    FNrRegistro: Nullable<string>;
    
    [Column('CPF_DESPACHANTE', [], 11)]
    FCpfDespachante: Nullable<string>;
    
    [Column('CD_DESP_SDA', [], 12)]
    FCdDespSda: Nullable<string>;
    
    [Column('CD_PRODUTO', [], 2)]
    FCdProduto: Nullable<string>;
    
    [Column('NM_SENHA', [], 12)]
    FNmSenha: Nullable<string>;
    
    [Column('IN_CONSULTA_SISCOMEX', [], 1)]
    FInConsultaSiscomex: Nullable<string>;
    
    [Column('CD_USUARIO', [], 4)]
    FCdUsuario: Nullable<string>;
    
    [Column('DT_SENHA', [])]
    FDtSenha: Nullable<TDateTime>;
  public
    property CdDespachante: string read FCdDespachante write FCdDespachante;
    property NmDespachante: Nullable<string> read FNmDespachante write FNmDespachante;
    property ApDespachante: Nullable<string> read FApDespachante write FApDespachante;
    property VlMinSda: Nullable<Double> read FVlMinSda write FVlMinSda;
    property VlMaxSda: Nullable<Double> read FVlMaxSda write FVlMaxSda;
    property CdRisc: Nullable<string> read FCdRisc write FCdRisc;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property CdModSda: Nullable<string> read FCdModSda write FCdModSda;
    property NrRegistro: Nullable<string> read FNrRegistro write FNrRegistro;
    property CpfDespachante: Nullable<string> read FCpfDespachante write FCpfDespachante;
    property CdDespSda: Nullable<string> read FCdDespSda write FCdDespSda;
    property CdProduto: Nullable<string> read FCdProduto write FCdProduto;
    property NmSenha: Nullable<string> read FNmSenha write FNmSenha;
    property InConsultaSiscomex: Nullable<string> read FInConsultaSiscomex write FInConsultaSiscomex;
    property CdUsuario: Nullable<string> read FCdUsuario write FCdUsuario;
    property DtSenha: Nullable<TDateTime> read FDtSenha write FDtSenha;
  end;
  
  [Entity]
  [Table('TDESPACHANTE_CLIENTE')]
  [Id('FEmpresa', TIdGenerator.None)]
  [Id('FDespachante', TIdGenerator.None)]
  [Id('FTipo', TIdGenerator.None)]
  TTdespachanteCliente = class
  private
    [Column('TIPO', [TColumnProp.Required], 5)]
    FTipo: string;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_EMPRESA', [TColumnProp.Required], 'CD_EMPRESA')]
    FEmpresa: Proxy<TTempresaNac>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_DESPACHANTE', [TColumnProp.Required], 'CD_DESPACHANTE')]
    FDespachante: Proxy<TTdespachante>;
    function GetEmpresa: TTempresaNac;
    procedure SetEmpresa(const Value: TTempresaNac);
    function GetDespachante: TTdespachante;
    procedure SetDespachante(const Value: TTdespachante);
  public
    property Tipo: string read FTipo write FTipo;
    property Empresa: TTempresaNac read GetEmpresa write SetEmpresa;
    property Despachante: TTdespachante read GetDespachante write SetDespachante;
  end;
  
  [Entity]
  [Table('TEMBALAGEM')]
  [Id('FCdEmbalagem', TIdGenerator.None)]
  TTembalagem = class
  private
    [Column('CD_EMBALAGEM', [TColumnProp.Required], 4)]
    FCdEmbalagem: string;
    
    [Column('NM_EMBALAGEM_S', [], 50)]
    FNmEmbalagemS: Nullable<string>;
    
    [Column('NM_EMBALAGEM_P', [], 50)]
    FNmEmbalagemP: Nullable<string>;
  public
    property CdEmbalagem: string read FCdEmbalagem write FCdEmbalagem;
    property NmEmbalagemS: Nullable<string> read FNmEmbalagemS write FNmEmbalagemS;
    property NmEmbalagemP: Nullable<string> read FNmEmbalagemP write FNmEmbalagemP;
  end;
  
  [Entity]
  [Table('TEMBARCACAO')]
  [Id('FCdEmbarcacao', TIdGenerator.None)]
  TTembarcacao = class
  private
    [Column('CD_EMBARCACAO', [TColumnProp.Required], 4)]
    FCdEmbarcacao: string;
    
    [Column('NM_EMBARCACAO', [TColumnProp.Required], 40)]
    FNmEmbarcacao: string;
  public
    property CdEmbarcacao: string read FCdEmbarcacao write FCdEmbarcacao;
    property NmEmbarcacao: string read FNmEmbarcacao write FNmEmbarcacao;
  end;
  
  [Entity]
  [Table('TEMPRESA_EST')]
  [Id('FCdEmpresa', TIdGenerator.None)]
  TTempresaEst = class
  private
    [Column('CD_EMPRESA', [TColumnProp.Required], 5)]
    FCdEmpresa: string;
    
    [Column('NM_EMPRESA', [], 100)]
    FNmEmpresa: Nullable<string>;
    
    [Column('AP_EMPRESA', [], 10)]
    FApEmpresa: Nullable<string>;
    
    [Column('END_EMPRESA', [], 100)]
    FEndEmpresa: Nullable<string>;
    
    [Column('END_NUMERO', [], 6)]
    FEndNumero: Nullable<string>;
    
    [Column('END_COMPL', [], 41)]
    FEndCompl: Nullable<string>;
    
    [Column('END_CIDADE', [], 30)]
    FEndCidade: Nullable<string>;
    
    [Column('END_ESTADO', [], 30)]
    FEndEstado: Nullable<string>;
    
    [Column('NR_TELEFONE', [], 15)]
    FNrTelefone: Nullable<string>;
    
    [Column('NR_FAX', [], 15)]
    FNrFax: Nullable<string>;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Column('IN_AGENTE', [TColumnProp.Required])]
    FInAgente: Boolean;
    
    [Column('IN_BANCO', [TColumnProp.Required])]
    FInBanco: Boolean;
    
    [Column('IN_IMPORTADOR', [TColumnProp.Required])]
    FInImportador: Boolean;
    
    [Column('IN_SEGURADORA', [TColumnProp.Required])]
    FInSeguradora: Boolean;
    
    [Column('IN_EXPORTADOR', [TColumnProp.Required])]
    FInExportador: Boolean;
    
    [Column('NR_CLIENTE', [], 15)]
    FNrCliente: Nullable<string>;
    
    [Column('NM_CONTATO', [], 50)]
    FNmContato: Nullable<string>;
    
    [Column('IN_COMPRADOR', [TColumnProp.Required])]
    FInComprador: Boolean;
    
    [Column('CGC_EMPRESA', [], 14)]
    FCgcEmpresa: Nullable<string>;
    
    [Column('IN_PO_TRANS', [], 1)]
    FInPoTrans: Nullable<string>;
    
    [Column('NR_RUC', [], 25)]
    FNrRuc: Nullable<string>;
    
    [Column('NR_NIT', [], 25)]
    FNrNit: Nullable<string>;
    
    [Column('NR_CUIT', [], 25)]
    FNrCuit: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_PAIS', [], 'CD_PAIS')]
    FPais: Proxy<TTpaisBroker>;
    function GetPais: TTpaisBroker;
    procedure SetPais(const Value: TTpaisBroker);
  public
    property CdEmpresa: string read FCdEmpresa write FCdEmpresa;
    property NmEmpresa: Nullable<string> read FNmEmpresa write FNmEmpresa;
    property ApEmpresa: Nullable<string> read FApEmpresa write FApEmpresa;
    property EndEmpresa: Nullable<string> read FEndEmpresa write FEndEmpresa;
    property EndNumero: Nullable<string> read FEndNumero write FEndNumero;
    property EndCompl: Nullable<string> read FEndCompl write FEndCompl;
    property EndCidade: Nullable<string> read FEndCidade write FEndCidade;
    property EndEstado: Nullable<string> read FEndEstado write FEndEstado;
    property NrTelefone: Nullable<string> read FNrTelefone write FNrTelefone;
    property NrFax: Nullable<string> read FNrFax write FNrFax;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property InAgente: Boolean read FInAgente write FInAgente;
    property InBanco: Boolean read FInBanco write FInBanco;
    property InImportador: Boolean read FInImportador write FInImportador;
    property InSeguradora: Boolean read FInSeguradora write FInSeguradora;
    property InExportador: Boolean read FInExportador write FInExportador;
    property NrCliente: Nullable<string> read FNrCliente write FNrCliente;
    property NmContato: Nullable<string> read FNmContato write FNmContato;
    property InComprador: Boolean read FInComprador write FInComprador;
    property CgcEmpresa: Nullable<string> read FCgcEmpresa write FCgcEmpresa;
    property InPoTrans: Nullable<string> read FInPoTrans write FInPoTrans;
    property NrRuc: Nullable<string> read FNrRuc write FNrRuc;
    property NrNit: Nullable<string> read FNrNit write FNrNit;
    property NrCuit: Nullable<string> read FNrCuit write FNrCuit;
    property Pais: TTpaisBroker read GetPais write SetPais;
  end;
  
  [Entity]
  [Table('TEMPRESA_EST_GRUPO')]
  [Id('FEmpresaEst', TIdGenerator.None)]
  TTempresaEstGrupo = class
  private
    [Column('CD_GRUPO', [TColumnProp.Required], 3)]
    FCdGrupo: string;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_EMPRESA', [TColumnProp.Required], 'CD_EMPRESA')]
    FEmpresaEst: Proxy<TTempresaEst>;
    function GetEmpresaEst: TTempresaEst;
    procedure SetEmpresaEst(const Value: TTempresaEst);
  public
    property CdGrupo: string read FCdGrupo write FCdGrupo;
    property EmpresaEst: TTempresaEst read GetEmpresaEst write SetEmpresaEst;
  end;
  
  [Entity]
  [Table('TEMPRESA_NAC')]
  [Id('FCdEmpresa', TIdGenerator.None)]
  TTempresaNac = class
  private
    [Column('CD_EMPRESA', [TColumnProp.Required], 5)]
    FCdEmpresa: string;
    
    [Column('NM_EMPRESA', [], 80)]
    FNmEmpresa: Nullable<string>;
    
    [Column('AP_EMPRESA', [], 10)]
    FApEmpresa: Nullable<string>;
    
    [Column('END_EMPRESA', [], 50)]
    FEndEmpresa: Nullable<string>;
    
    [Column('END_NUMERO', [], 6)]
    FEndNumero: Nullable<string>;
    
    [Column('END_CIDADE', [], 30)]
    FEndCidade: Nullable<string>;
    
    [Column('END_BAIRRO', [], 30)]
    FEndBairro: Nullable<string>;
    
    [Column('END_UF', [], 2)]
    FEndUf: Nullable<string>;
    
    [Column('END_CEP', [], 8)]
    FEndCep: Nullable<string>;
    
    [Column('CD_TIPO_PESSOA', [], 1)]
    FCdTipoPessoa: Nullable<string>;
    
    [Column('CGC_EMPRESA', [], 14)]
    FCgcEmpresa: Nullable<string>;
    
    [Column('CPF_EMPRESA', [], 11)]
    FCpfEmpresa: Nullable<string>;
    
    [Column('IE_EMPRESA', [], 20)]
    FIeEmpresa: Nullable<string>;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Column('IN_CLIENTE', [TColumnProp.Required])]
    FInCliente: Boolean;
    
    [Column('IN_IMPORTADOR', [TColumnProp.Required])]
    FInImportador: Boolean;
    
    [Column('IN_EXPORTADOR', [TColumnProp.Required])]
    FInExportador: Boolean;
    
    [Column('IN_OUTROS', [TColumnProp.Required])]
    FInOutros: Boolean;
    
    [Column('IN_REPRESENTANTE', [TColumnProp.Required])]
    FInRepresentante: Boolean;
    
    [Column('CD_PAIS_IMPORTADOR', [], 3)]
    FCdPaisImportador: Nullable<string>;
    
    [Column('IN_SEGURADORA', [TColumnProp.Required])]
    FInSeguradora: Boolean;
    
    [Column('END_COMPL', [], 50)]
    FEndCompl: Nullable<string>;
    
    [Column('END_COMPLEMENTO', [], 60)]
    FEndComplemento: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_GRUPO', [], 'CD_GRUPO')]
    FGrupo: Proxy<TTgrupo>;
    function GetGrupo: TTgrupo;
    procedure SetGrupo(const Value: TTgrupo);
  public
    property CdEmpresa: string read FCdEmpresa write FCdEmpresa;
    property NmEmpresa: Nullable<string> read FNmEmpresa write FNmEmpresa;
    property ApEmpresa: Nullable<string> read FApEmpresa write FApEmpresa;
    property EndEmpresa: Nullable<string> read FEndEmpresa write FEndEmpresa;
    property EndNumero: Nullable<string> read FEndNumero write FEndNumero;
    property EndCidade: Nullable<string> read FEndCidade write FEndCidade;
    property EndBairro: Nullable<string> read FEndBairro write FEndBairro;
    property EndUf: Nullable<string> read FEndUf write FEndUf;
    property EndCep: Nullable<string> read FEndCep write FEndCep;
    property CdTipoPessoa: Nullable<string> read FCdTipoPessoa write FCdTipoPessoa;
    property CgcEmpresa: Nullable<string> read FCgcEmpresa write FCgcEmpresa;
    property CpfEmpresa: Nullable<string> read FCpfEmpresa write FCpfEmpresa;
    property IeEmpresa: Nullable<string> read FIeEmpresa write FIeEmpresa;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property InCliente: Boolean read FInCliente write FInCliente;
    property InImportador: Boolean read FInImportador write FInImportador;
    property InExportador: Boolean read FInExportador write FInExportador;
    property InOutros: Boolean read FInOutros write FInOutros;
    property InRepresentante: Boolean read FInRepresentante write FInRepresentante;
    property CdPaisImportador: Nullable<string> read FCdPaisImportador write FCdPaisImportador;
    property InSeguradora: Boolean read FInSeguradora write FInSeguradora;
    property EndCompl: Nullable<string> read FEndCompl write FEndCompl;
    property EndComplemento: Nullable<string> read FEndComplemento write FEndComplemento;
    property Grupo: TTgrupo read GetGrupo write SetGrupo;
  end;
  
  [Entity]
  [Table('TENQUAD_OP')]
  [Id('FCdEnquadOp', TIdGenerator.None)]
  TTenquadOp = class
  private
    [Column('CD_ENQUAD_OP', [TColumnProp.Required], 5)]
    FCdEnquadOp: string;
    
    [Column('NM_ENQUAD_OP', [TColumnProp.Required], 60)]
    FNmEnquadOp: string;
    
    [Column('IN_ATIVO', [TColumnProp.Required], 1)]
    FInAtivo: string;
  public
    property CdEnquadOp: string read FCdEnquadOp write FCdEnquadOp;
    property NmEnquadOp: string read FNmEnquadOp write FNmEnquadOp;
    property InAtivo: string read FInAtivo write FInAtivo;
  end;
  
  [Entity]
  [Table('TFOLLOWUP')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FCdServico', TIdGenerator.None)]
  [Id('FCdEvento', TIdGenerator.None)]
  TTfollowup = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('CD_SERVICO', [TColumnProp.Required], 3)]
    FCdServico: string;
    
    [Column('CD_EVENTO', [TColumnProp.Required], 3)]
    FCdEvento: string;
    
    [Column('IN_APLICAVEL', [TColumnProp.Required], 1)]
    FInAplicavel: string;
    
    [Column('CD_RESP_REALIZACAO', [], 4)]
    FCdRespRealizacao: Nullable<string>;
    
    [Column('DT_REALIZACAO', [])]
    FDtRealizacao: Nullable<TDateTime>;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property CdServico: string read FCdServico write FCdServico;
    property CdEvento: string read FCdEvento write FCdEvento;
    property InAplicavel: string read FInAplicavel write FInAplicavel;
    property CdRespRealizacao: Nullable<string> read FCdRespRealizacao write FCdRespRealizacao;
    property DtRealizacao: Nullable<TDateTime> read FDtRealizacao write FDtRealizacao;
  end;
  
  [Entity]
  [Table('TFUND_LEG_REG_TRIBUT')]
  [UniqueKey('Codigo')]
  [Id('FCodigo', TIdGenerator.None)]
  TTfundLegRegTribut = class
  private
    [Column('Codigo', [TColumnProp.Required], 2)]
    FCodigo: string;
    
    [Column('Descricao', [], 120)]
    FDescricao: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TGRUPO')]
  [Id('FCdGrupo', TIdGenerator.None)]
  TTgrupo = class
  private
    [Column('CD_GRUPO', [TColumnProp.Required], 3)]
    FCdGrupo: string;
    
    [Column('NM_GRUPO', [TColumnProp.Required], 50)]
    FNmGrupo: string;
    
    [Column('DT_INCLUSAO', [TColumnProp.Required])]
    FDtInclusao: TDateTime;
    
    [Column('IN_ATIVO', [TColumnProp.Required], 1)]
    FInAtivo: string;
    
    [Column('CNPJ_GRUPO', [], 14)]
    FCnpjGrupo: Nullable<string>;
    
    [Column('DT_NOVO_FOLLOWUP_IMP', [])]
    FDtNovoFollowupImp: Nullable<TDateTime>;
    
    [Column('DT_NOVO_FOLLOWUP_EXP', [])]
    FDtNovoFollowupExp: Nullable<TDateTime>;
    
    [Column('NM_EMAIL_DRAFT_BL', [], 100)]
    FNmEmailDraftBl: Nullable<string>;
  public
    property CdGrupo: string read FCdGrupo write FCdGrupo;
    property NmGrupo: string read FNmGrupo write FNmGrupo;
    property DtInclusao: TDateTime read FDtInclusao write FDtInclusao;
    property InAtivo: string read FInAtivo write FInAtivo;
    property CnpjGrupo: Nullable<string> read FCnpjGrupo write FCnpjGrupo;
    property DtNovoFollowupImp: Nullable<TDateTime> read FDtNovoFollowupImp write FDtNovoFollowupImp;
    property DtNovoFollowupExp: Nullable<TDateTime> read FDtNovoFollowupExp write FDtNovoFollowupExp;
    property NmEmailDraftBl: Nullable<string> read FNmEmailDraftBl write FNmEmailDraftBl;
  end;
  
  [Entity]
  [Table('TINCOTERMS_VENDA')]
  [UniqueKey('CODIGO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTincotermsVenda = class
  private
    [Column('CODIGO', [TColumnProp.Required], 3)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 60)]
    FDescricao: Nullable<string>;
    
    [Column('SINAL', [], 1)]
    FSinal: Nullable<string>;
    
    [Column('IN_TIPO_FRETE', [], 2)]
    FInTipoFrete: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
    property Sinal: Nullable<string> read FSinal write FSinal;
    property InTipoFrete: Nullable<string> read FInTipoFrete write FInTipoFrete;
  end;
  
  [Entity]
  [Table('TLOCAL_EMBARQUE')]
  [Id('FCodigo', TIdGenerator.None)]
  TTlocalEmbarque = class
  private
    [Column('CODIGO', [TColumnProp.Required], 4)]
    FCodigo: string;
    
    [Column('DESCRICAO', [TColumnProp.Required], 50)]
    FDescricao: string;
    
    [Column('CD_UNID_NEG_LOCAL', [], 2)]
    FCdUnidNegLocal: Nullable<string>;
    
    [Column('CD_UF', [], 2)]
    FCdUf: Nullable<string>;
    
    [Column('CD_SIGLA', [], 3)]
    FCdSigla: Nullable<string>;
    
    [Column('NM_CIDADE', [], 50)]
    FNmCidade: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_PAIS', [], 'CD_PAIS')]
    FCdPais: Proxy<TTpaisBroker>;
    function GetCdPais: TTpaisBroker;
    procedure SetCdPais(const Value: TTpaisBroker);
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property CdUnidNegLocal: Nullable<string> read FCdUnidNegLocal write FCdUnidNegLocal;
    property CdUf: Nullable<string> read FCdUf write FCdUf;
    property CdSigla: Nullable<string> read FCdSigla write FCdSigla;
    property NmCidade: Nullable<string> read FNmCidade write FNmCidade;
    property CdPais: TTpaisBroker read GetCdPais write SetCdPais;
  end;
  
  [Entity]
  [Table('TMERCADORIA')]
  [Id('FCdMercadoria', TIdGenerator.None)]
  [Id('FCdGrupo', TIdGenerator.None)]
  TTmercadoria = class
  private
    [Column('CD_MERCADORIA', [TColumnProp.Required], 30)]
    FCdMercadoria: string;
    
    [Column('NM_MERCADORIA', [TColumnProp.Required])]
    [DBTypeMemo]
    FNmMercadoria: Nullable<String>;
    
    [Column('AP_MERCADORIA', [TColumnProp.Required], 50)]
    FApMercadoria: string;
    
    [Column('CD_GRUPO', [TColumnProp.Required], 3)]
    FCdGrupo: string;
    
    [Column('IN_NECESSITA_LI', [TColumnProp.Required])]
    FInNecessitaLi: Boolean;
  public
    property CdMercadoria: string read FCdMercadoria write FCdMercadoria;
    property NmMercadoria: Nullable<String> read FNmMercadoria write FNmMercadoria;
    property ApMercadoria: string read FApMercadoria write FApMercadoria;
    property CdGrupo: string read FCdGrupo write FCdGrupo;
    property InNecessitaLi: Boolean read FInNecessitaLi write FInNecessitaLi;
  end;
  
  [Entity]
  [Table('TMERCADORIA_EXP')]
  [Id('FCdMercadoria', TIdGenerator.None)]
  TTmercadoriaExp = class
  private
    [Column('CD_MERCADORIA', [TColumnProp.Required], 40)]
    FCdMercadoria: string;
    
    [Column('NM_MERCADORIA', [])]
    [DBTypeMemo]
    FNmMercadoria: Nullable<String>;
    
    [Column('AP_MERCADORIA', [TColumnProp.Required], 40)]
    FApMercadoria: string;
    
    [Column('CD_GRUPO', [], 3)]
    FCdGrupo: Nullable<string>;
    
    [Column('IN_NECESSITA_LI', [TColumnProp.Required])]
    FInNecessitaLi: Boolean;
    
    [Column('TX_DESC_INGLES', [TColumnProp.Lazy])]
    [DBTypeMemo]
    FTxDescIngles: TBlob;
    
    [Column('TX_DESC_ESP', [TColumnProp.Lazy])]
    [DBTypeMemo]
    FTxDescEsp: TBlob;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_DESC_MERCADORIA_DRAFT', [], 'CODIGO')]
    FDescMercadoriaDraft: Proxy<TTdescricaoMercadoriaDraft>;
    function GetDescMercadoriaDraft: TTdescricaoMercadoriaDraft;
    procedure SetDescMercadoriaDraft(const Value: TTdescricaoMercadoriaDraft);
  public
    property CdMercadoria: string read FCdMercadoria write FCdMercadoria;
    property NmMercadoria: Nullable<String> read FNmMercadoria write FNmMercadoria;
    property ApMercadoria: string read FApMercadoria write FApMercadoria;
    property CdGrupo: Nullable<string> read FCdGrupo write FCdGrupo;
    property InNecessitaLi: Boolean read FInNecessitaLi write FInNecessitaLi;
    property TxDescIngles: TBlob read FTxDescIngles write FTxDescIngles;
    property TxDescEsp: TBlob read FTxDescEsp write FTxDescEsp;
    property DescMercadoriaDraft: TTdescricaoMercadoriaDraft read GetDescMercadoriaDraft write SetDescMercadoriaDraft;
  end;
  
  [Entity]
  [Table('TMOEDA_BROKER')]
  [Id('FCdMoeda', TIdGenerator.None)]
  TTmoedaBroker = class
  private
    [Column('CD_MOEDA', [TColumnProp.Required], 3)]
    FCdMoeda: string;
    
    [Column('NM_MOEDA', [TColumnProp.Required], 30)]
    FNmMoeda: string;
    
    [Column('AP_MOEDA', [TColumnProp.Required], 6)]
    FApMoeda: string;
    
    [Column('IN_ATIVO', [TColumnProp.Required], 1)]
    FInAtivo: string;
  public
    property CdMoeda: string read FCdMoeda write FCdMoeda;
    property NmMoeda: string read FNmMoeda write FNmMoeda;
    property ApMoeda: string read FApMoeda write FApMoeda;
    property InAtivo: string read FInAtivo write FInAtivo;
  end;
  
  [Entity]
  [Table('TNCM')]
  [UniqueKey('CODIGO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTncm = class
  private
    [Column('CODIGO', [TColumnProp.Required], 8)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 120)]
    FDescricao: Nullable<string>;
    
    [Column('UNIDADE_MEDIDA', [], 4)]
    FUnidadeMedida: Nullable<string>;
    
    [Column('CD_ATRIBUTO', [], 10)]
    FCdAtributo: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
    property UnidadeMedida: Nullable<string> read FUnidadeMedida write FUnidadeMedida;
    property CdAtributo: Nullable<string> read FCdAtributo write FCdAtributo;
  end;
  
  [Entity]
  [Table('TNCM_EXP')]
  [Id('FNrSeq', TIdGenerator.None)]
  [Id('FCodigo', TIdGenerator.None)]
  TTncmExp = class
  private
    [Column('CODIGO', [TColumnProp.Required], 8)]
    FCodigo: string;
    
    [Column('DESCRICAO', [TColumnProp.Required], 255)]
    FDescricao: string;
    
    [Column('NR_SEQ', [TColumnProp.Required])]
    FNrSeq: Integer;
    
    [Column('TX_NCM_FATURA', [TColumnProp.Lazy])]
    [DBTypeMemo]
    FTxNcmFatura: TBlob;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property NrSeq: Integer read FNrSeq write FNrSeq;
    property TxNcmFatura: TBlob read FTxNcmFatura write FTxNcmFatura;
  end;
  
  [Entity]
  [Table('TNCM_EXP_ATRIBUTO')]
  [Id('FCdNcm', TIdGenerator.None)]
  [Id('FCdAtributo', TIdGenerator.None)]
  TTncmExpAtributo = class
  private
    [Column('CD_NCM', [TColumnProp.Required], 8)]
    FCdNcm: string;
    
    [Column('CD_ATRIBUTO', [TColumnProp.Required], 15)]
    FCdAtributo: string;
    
    [Column('NM_ATRIBUTO', [], 50)]
    FNmAtributo: Nullable<string>;
    
    [Column('NM_FORMA_PREENCHIMENTO', [], 50)]
    FNmFormaPreenchimento: Nullable<string>;
    
    [Column('IN_OBRIGATORIO', [])]
    FInObrigatorio: Nullable<Boolean>;
    
    [Column('DT_INICIO_VIGENCIA', [])]
    FDtInicioVigencia: Nullable<TDateTime>;
  public
    property CdNcm: string read FCdNcm write FCdNcm;
    property CdAtributo: string read FCdAtributo write FCdAtributo;
    property NmAtributo: Nullable<string> read FNmAtributo write FNmAtributo;
    property NmFormaPreenchimento: Nullable<string> read FNmFormaPreenchimento write FNmFormaPreenchimento;
    property InObrigatorio: Nullable<Boolean> read FInObrigatorio write FInObrigatorio;
    property DtInicioVigencia: Nullable<TDateTime> read FDtInicioVigencia write FDtInicioVigencia;
  end;
  
  [Entity]
  [Table('TNCM_EXP_ATRIBUTO_VALOR')]
  [Id('FCdNcm', TIdGenerator.None)]
  [Id('FCdAtributo', TIdGenerator.None)]
  [Id('FCdAtributoValor', TIdGenerator.None)]
  TTncmExpAtributoValor = class
  private
    [Column('CD_NCM', [TColumnProp.Required], 8)]
    FCdNcm: string;
    
    [Column('CD_ATRIBUTO', [TColumnProp.Required], 15)]
    FCdAtributo: string;
    
    [Column('CD_ATRIBUTO_VALOR', [TColumnProp.Required], 3)]
    FCdAtributoValor: string;
    
    [Column('NM_ATRIBUTO_VALOR', [], 200)]
    FNmAtributoValor: Nullable<string>;
    
    [Column('NM_ATRIBUTO', [], 50)]
    FNmAtributo: Nullable<string>;
  public
    property CdNcm: string read FCdNcm write FCdNcm;
    property CdAtributo: string read FCdAtributo write FCdAtributo;
    property CdAtributoValor: string read FCdAtributoValor write FCdAtributoValor;
    property NmAtributoValor: Nullable<string> read FNmAtributoValor write FNmAtributoValor;
    property NmAtributo: Nullable<string> read FNmAtributo write FNmAtributo;
  end;
  
  [Entity]
  [Table('TNCM_EXP_DESTAQUE')]
  [Id('FCodigoNcm', TIdGenerator.None)]
  [Id('FCdDominio', TIdGenerator.None)]
  TTncmExpDestaque = class
  private
    [Column('CODIGO_NCM', [TColumnProp.Required], 8)]
    FCodigoNcm: string;
    
    [Column('CD_ATRIBUTO', [TColumnProp.Required], 10)]
    FCdAtributo: string;
    
    [Column('CD_DOMINIO', [TColumnProp.Required], 2)]
    FCdDominio: string;
    
    [Column('NM_DOMINIO', [], 200)]
    FNmDominio: Nullable<string>;
  public
    property CodigoNcm: string read FCodigoNcm write FCodigoNcm;
    property CdAtributo: string read FCdAtributo write FCdAtributo;
    property CdDominio: string read FCdDominio write FCdDominio;
    property NmDominio: Nullable<string> read FNmDominio write FNmDominio;
  end;
  
  [Entity]
  [Table('TOBSERVACOES')]
  [Id('FCdObs', TIdGenerator.None)]
  TTobservacoes = class
  private
    [Column('CD_OBS', [TColumnProp.Required], 4)]
    FCdObs: string;
    
    [Column('CD_PRODUTO', [], 2)]
    FCdProduto: Nullable<string>;
    
    [Column('TX_DESCRICAO', [], 60)]
    FTxDescricao: Nullable<string>;
    
    [Column('TX_OBS', [])]
    [DBTypeMemo]
    FTxObs: String;
  public
    property CdObs: string read FCdObs write FCdObs;
    property CdProduto: Nullable<string> read FCdProduto write FCdProduto;
    property TxDescricao: Nullable<string> read FTxDescricao write FTxDescricao;
    property TxObs: String read FTxObs write FTxObs;
  end;
  
  [Entity]
  [Table('TPAIS')]
  [UniqueKey('CODIGO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTpais = class
  private
    [Column('CODIGO', [TColumnProp.Required], 3)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 120)]
    FDescricao: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TPAIS_BROKER')]
  [Id('FCdPais', TIdGenerator.None)]
  TTpaisBroker = class
  private
    [Column('CD_PAIS', [TColumnProp.Required], 3)]
    FCdPais: string;
    
    [Column('NM_PAIS', [], 120)]
    FNmPais: Nullable<string>;
    
    [Column('NM_SIGLA_CRT', [], 2)]
    FNmSiglaCrt: Nullable<string>;
    
    [Column('NM_SIGLA_2L', [], 2)]
    FNmSigla2l: Nullable<string>;
  public
    property CdPais: string read FCdPais write FCdPais;
    property NmPais: Nullable<string> read FNmPais write FNmPais;
    property NmSiglaCrt: Nullable<string> read FNmSiglaCrt write FNmSiglaCrt;
    property NmSigla2l: Nullable<string> read FNmSigla2l write FNmSigla2l;
  end;
  
  [Entity]
  [Table('TPROCESSO')]
  [UniqueKey('CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO')]
  [Id('FNrProcesso', TIdGenerator.None)]
  TTprocesso = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('DT_ABERTURA', [])]
    FDtAbertura: Nullable<TDateTime>;
    
    [Column('IN_CANCELADO', [], 1)]
    FInCancelado: Nullable<string>;
    
    [Column('VL_MLE_MNEG', [])]
    FVlMleMneg: Nullable<Double>;
    
    [Column('VL_FRETE_PREPAID_MNEG', [])]
    FVlFretePrepaidMneg: Nullable<Double>;
    
    [Column('VL_SEGURO_MN', [])]
    FVlSeguroMn: Nullable<Double>;
    
    [Column('NR_PROCESSO_EXP_TEMP', [], 5)]
    FNrProcessoExpTemp: Nullable<string>;
    
    [Column('VL_PESO_LIQUIDO', [])]
    FVlPesoLiquido: Nullable<Double>;
    
    [Column('VL_PESO_BRUTO', [])]
    FVlPesoBruto: Nullable<Double>;
    
    [Column('TP_PROCESSO', [], 1)]
    FTpProcesso: Nullable<string>;
    
    [Column('NR_FATURA', [], 30)]
    FNrFatura: Nullable<string>;
    
    [Column('CD_GRUPO', [], 3)]
    FCdGrupo: Nullable<string>;
    
    [Column('CD_LINGUA_PEDIDO', [], 1)]
    FCdLinguaPedido: Nullable<string>;
    
    [Column('CD_RUC', [], 35)]
    FCdRuc: Nullable<string>;
    
    [Column('CD_DUE', [], 14)]
    FCdDue: Nullable<string>;
    
    [Column('CD_CHAVE_ACESSO_DUE', [], 20)]
    FCdChaveAcessoDue: Nullable<string>;

    [Column('VL_DESCONTO_MN', [])]
    FVlDescontoMn: Nullable<Double>;
    
    [Column('VL_ACRESCIMO_MN', [])]
    FVlAcrescimoMn: Nullable<Double>;
    
    [Column('IN_PROCESSO_CONSOLIDADO', [])]
    FInProcessoConsolidado: Nullable<Boolean>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_UNID_NEG', [TColumnProp.Required], 'CD_UNID_NEG')]
    FUnidNeg: Proxy<TTunidNeg>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_PRODUTO', [TColumnProp.Required], 'CD_PRODUTO')]
    FProduto: Proxy<TTproduto>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_CLIENTE', [], 'CD_EMPRESA')]
    FCliente: Proxy<TTempresaNac>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_USUARIO', [], 'CD_USUARIO')]
    FUsuario: Proxy<TTusuario>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_MOEDA_MLE', [], 'CD_MOEDA')]
    FMoedaMle: Proxy<TTmoedaBroker>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_PAIS_DESTINO', [], 'CD_PAIS')]
    FPaisDestino: Proxy<TTpaisBroker>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_DESPACHANTE', [], 'CD_DESPACHANTE')]
    FDespachante: Proxy<TTdespachante>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_INCOTERM', [], 'CODIGO')]
    FIncoterm: Proxy<TTincotermsVenda>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_EXPORTADOR', [], 'CD_EMPRESA')]
    FExportador: Proxy<TTempresaNac>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_IMPORTADOR', [], 'CD_EMPRESA')]
    FImportador: Proxy<TTempresaEst>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_SERVICO', [], 'CD_SERVICO')]
    FServico: Proxy<TVwServicoGeral>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_AGENTE', [], 'CD_AGENTE')]
    FAgente: Proxy<TTagente>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_NOTIFY1_PROC', [], 'CD_EMPRESA')]
    FNotify1Proc: Proxy<TTempresaEst>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_NOTIFY2_PROC', [], 'CD_EMPRESA')]
    FNotify2Proc: Proxy<TTempresaEst>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_CONSIGNEE', [], 'CD_EMPRESA')]
    FConsignee: Proxy<TTempresaEst>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_EMBARCACAO', [], 'CD_EMBARCACAO')]
    FEmbarcacao: Proxy<TTembarcacao>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_LOCAL_EMBARQUE', [], 'CODIGO')]
    FLocalEmbarque: Proxy<TTlocalEmbarque>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_LOCAL_DESEMBARQUE', [], 'CODIGO')]
    FLocalDesembarque: Proxy<TTlocalEmbarque>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_LOCAL_ENTREGA', [], 'CODIGO')]
    FLocalEntrega: Proxy<TTlocalEmbarque>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('TP_FRETE', [], 'CODIGO')]
    FTpFrete: Proxy<TTtpFrete>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_UNID_NEG', [TColumnProp.Required], 'CD_UNID_NEG')]
    [JoinColumn('CD_PRODUTO', [TColumnProp.Required], 'CD_PRODUTO')]
    [JoinColumn('CD_EMBARCACAO', [], 'CD_EMBARCACAO')]
    [JoinColumn('NR_VIAGEM', [], 'NR_VIAGEM')]
    FViagem: Proxy<TTviagem>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FProcesso')]
    FProcessoExp: Proxy<TList<TTprocessoExp>>;
    function GetUnidNeg: TTunidNeg;
    procedure SetUnidNeg(const Value: TTunidNeg);
    function GetProduto: TTproduto;
    procedure SetProduto(const Value: TTproduto);
    function GetCliente: TTempresaNac;
    procedure SetCliente(const Value: TTempresaNac);
    function GetUsuario: TTusuario;
    procedure SetUsuario(const Value: TTusuario);
    function GetMoedaMle: TTmoedaBroker;
    procedure SetMoedaMle(const Value: TTmoedaBroker);
    function GetPaisDestino: TTpaisBroker;
    procedure SetPaisDestino(const Value: TTpaisBroker);
    function GetDespachante: TTdespachante;
    procedure SetDespachante(const Value: TTdespachante);
    function GetIncoterm: TTincotermsVenda;
    procedure SetIncoterm(const Value: TTincotermsVenda);
    function GetExportador: TTempresaNac;
    procedure SetExportador(const Value: TTempresaNac);
    function GetImportador: TTempresaEst;
    procedure SetImportador(const Value: TTempresaEst);
    function GetServico: TVwServicoGeral;
    procedure SetServico(const Value: TVwServicoGeral);
    function GetAgente: TTagente;
    procedure SetAgente(const Value: TTagente);
    function GetNotify1Proc: TTempresaEst;
    procedure SetNotify1Proc(const Value: TTempresaEst);
    function GetNotify2Proc: TTempresaEst;
    procedure SetNotify2Proc(const Value: TTempresaEst);
    function GetConsignee: TTempresaEst;
    procedure SetConsignee(const Value: TTempresaEst);
    function GetEmbarcacao: TTembarcacao;
    procedure SetEmbarcacao(const Value: TTembarcacao);
    function GetLocalEmbarque: TTlocalEmbarque;
    procedure SetLocalEmbarque(const Value: TTlocalEmbarque);
    function GetLocalDesembarque: TTlocalEmbarque;
    procedure SetLocalDesembarque(const Value: TTlocalEmbarque);
    function GetLocalEntrega: TTlocalEmbarque;
    procedure SetLocalEntrega(const Value: TTlocalEmbarque);
    function GetTpFrete: TTtpFrete;
    procedure SetTpFrete(const Value: TTtpFrete);
    function GetViagem: TTviagem;
    procedure SetViagem(const Value: TTviagem);
    function GetProcessoExp: TList<TTprocessoExp>;
  public
    constructor Create;
    destructor Destroy; override;
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property DtAbertura: Nullable<TDateTime> read FDtAbertura write FDtAbertura;
    property InCancelado: Nullable<string> read FInCancelado write FInCancelado;
    property VlMleMneg: Nullable<Double> read FVlMleMneg write FVlMleMneg;
    property VlFretePrepaidMneg: Nullable<Double> read FVlFretePrepaidMneg write FVlFretePrepaidMneg;
    property VlSeguroMn: Nullable<Double> read FVlSeguroMn write FVlSeguroMn;
    property NrProcessoExpTemp: Nullable<string> read FNrProcessoExpTemp write FNrProcessoExpTemp;
    property VlPesoLiquido: Nullable<Double> read FVlPesoLiquido write FVlPesoLiquido;
    property VlPesoBruto: Nullable<Double> read FVlPesoBruto write FVlPesoBruto;
    property TpProcesso: Nullable<string> read FTpProcesso write FTpProcesso;
    property NrFatura: Nullable<string> read FNrFatura write FNrFatura;
    property CdGrupo: Nullable<string> read FCdGrupo write FCdGrupo;
    property CdLinguaPedido: Nullable<string> read FCdLinguaPedido write FCdLinguaPedido;
    property CdRuc: Nullable<string> read FCdRuc write FCdRuc;
    property CdDue: Nullable<string> read FCdDue write FCdDue;
    property CdChaveAcessoDue: Nullable<string> read FCdChaveAcessoDue write FCdChaveAcessoDue;
    property VlDescontoMn: Nullable<Double> read FVlDescontoMn write FVlDescontoMn;
    property VlAcrescimoMn: Nullable<Double> read FVlAcrescimoMn write FVlAcrescimoMn;
    property InProcessoConsolidado: Nullable<Boolean> read FInProcessoConsolidado write FInProcessoConsolidado;
    property UnidNeg: TTunidNeg read GetUnidNeg write SetUnidNeg;
    property Produto: TTproduto read GetProduto write SetProduto;
    property Cliente: TTempresaNac read GetCliente write SetCliente;
    property Usuario: TTusuario read GetUsuario write SetUsuario;
    property MoedaMle: TTmoedaBroker read GetMoedaMle write SetMoedaMle;
    property PaisDestino: TTpaisBroker read GetPaisDestino write SetPaisDestino;
    property Despachante: TTdespachante read GetDespachante write SetDespachante;
    property Incoterm: TTincotermsVenda read GetIncoterm write SetIncoterm;
    property Exportador: TTempresaNac read GetExportador write SetExportador;
    property Importador: TTempresaEst read GetImportador write SetImportador;
    property Servico: TVwServicoGeral read GetServico write SetServico;
    property Agente: TTagente read GetAgente write SetAgente;
    property Notify1Proc: TTempresaEst read GetNotify1Proc write SetNotify1Proc;
    property Notify2Proc: TTempresaEst read GetNotify2Proc write SetNotify2Proc;
    property Consignee: TTempresaEst read GetConsignee write SetConsignee;
    property Embarcacao: TTembarcacao read GetEmbarcacao write SetEmbarcacao;
    property LocalEmbarque: TTlocalEmbarque read GetLocalEmbarque write SetLocalEmbarque;
    property LocalDesembarque: TTlocalEmbarque read GetLocalDesembarque write SetLocalDesembarque;
    property LocalEntrega: TTlocalEmbarque read GetLocalEntrega write SetLocalEntrega;
    property TpFrete: TTtpFrete read GetTpFrete write SetTpFrete;
    property Viagem: TTviagem read GetViagem write SetViagem;
    property ProcessoExp: TList<TTprocessoExp> read GetProcessoExp;
  end;
  
  [Entity]
  [Table('TPROCESSO_CNTR')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FCodigo', TIdGenerator.None)]
  TTprocessoCntr = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_CNTR', [], 20)]
    FNrCntr: Nullable<string>;
    
    [Column('NR_LACRE', [], 20)]
    FNrLacre: Nullable<string>;
    
    [Column('CODIGO', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCodigo: Integer;
    
    [Column('VL_CUSTO_TOTAL', [])]
    FVlCustoTotal: Nullable<Double>;
    
    [Column('VL_CUBAGEM', [])]
    FVlCubagem: Nullable<Double>;
    
    [Column('NR_LACRE_SIF', [], 11)]
    FNrLacreSif: Nullable<string>;
    
    [Column('TARA_CNTR', [])]
    FTaraCntr: Nullable<Double>;
    
    [Column('VL_PESO_BRUTO', [])]
    FVlPesoBruto: Nullable<Double>;
    
    [Column('VL_PESO_LIQUIDO', [])]
    FVlPesoLiquido: Nullable<Double>;
    
    [Column('VL_QUANTIDADE_EMBALAGEM', [])]
    FVlQuantidadeEmbalagem: Nullable<Double>;
    
    [Column('DS_TEMPERATURA', [], 6)]
    FDsTemperatura: Nullable<string>;
    
    [Column('CD_NCM', [], 11)]
    FCdNcm: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('TP_CNTR', [], 'TP_CNTR')]
    FTpCntr: Proxy<TTtpCntr>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_EMBALAGEM', [], 'CD_EMBALAGEM')]
    FEmbalagem: Proxy<TTtpEmbalagemInttra>;
    function GetTpCntr: TTtpCntr;
    procedure SetTpCntr(const Value: TTtpCntr);
    function GetEmbalagem: TTtpEmbalagemInttra;
    procedure SetEmbalagem(const Value: TTtpEmbalagemInttra);
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrCntr: Nullable<string> read FNrCntr write FNrCntr;
    property NrLacre: Nullable<string> read FNrLacre write FNrLacre;
    property Codigo: Integer read FCodigo write FCodigo;
    property VlCustoTotal: Nullable<Double> read FVlCustoTotal write FVlCustoTotal;
    property VlCubagem: Nullable<Double> read FVlCubagem write FVlCubagem;
    property NrLacreSif: Nullable<string> read FNrLacreSif write FNrLacreSif;
    property TaraCntr: Nullable<Double> read FTaraCntr write FTaraCntr;
    property VlPesoBruto: Nullable<Double> read FVlPesoBruto write FVlPesoBruto;
    property VlPesoLiquido: Nullable<Double> read FVlPesoLiquido write FVlPesoLiquido;
    property VlQuantidadeEmbalagem: Nullable<Double> read FVlQuantidadeEmbalagem write FVlQuantidadeEmbalagem;
    property DsTemperatura: Nullable<string> read FDsTemperatura write FDsTemperatura;
    property CdNcm: Nullable<string> read FCdNcm write FCdNcm;
    property TpCntr: TTtpCntr read GetTpCntr write SetTpCntr;
    property Embalagem: TTtpEmbalagemInttra read GetEmbalagem write SetEmbalagem;
  end;
  
  [Entity]
  [Table('TPROCESSO_DRAFT_BL')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrAmend', TIdGenerator.None)]
  TTprocessoDraftBl = class
  private
    [Column('NR_AMEND', [TColumnProp.Required])]
    FNrAmend: Integer;
    
    [Column('DT_CRIACAO', [])]
    FDtCriacao: Nullable<TDateTime>;
    
    [Column('DT_ENVIO_DRAFT', [])]
    FDtEnvioDraft: Nullable<TDateTime>;
    
    [Column('CD_ENVIO_INTTRA', [], 15)]
    FCdEnvioInttra: Nullable<string>;
    
    [Column('CLIENTE_NOME', [], 80)]
    FClienteNome: Nullable<string>;
    
    [Column('CLIENTE_ENDERECO', [], 50)]
    FClienteEndereco: Nullable<string>;
    
    [Column('CLIENTE_CIDADE', [], 30)]
    FClienteCidade: Nullable<string>;
    
    [Column('CLIENTE_CEP', [], 8)]
    FClienteCep: Nullable<string>;
    
    [Column('CLIENTE_ESTADO', [], 2)]
    FClienteEstado: Nullable<string>;
    
    [Column('CLIENTE_PAIS_COD', [], 2)]
    FClientePaisCod: Nullable<string>;
    
    [Column('CLIENTE_CNPJ', [], 18)]
    FClienteCnpj: Nullable<string>;
    
    [Column('CONSIG_NOME', [], 100)]
    FConsigNome: Nullable<string>;
    
    [Column('CONSIG_ENDERECO', [], 100)]
    FConsigEndereco: Nullable<string>;
    
    [Column('CONSIG_CIDADE', [], 30)]
    FConsigCidade: Nullable<string>;
    
    [Column('CONSIG_CEP', [], 8)]
    FConsigCep: Nullable<string>;
    
    [Column('CONSIG_ESTADO', [], 30)]
    FConsigEstado: Nullable<string>;
    
    [Column('CONSIG_PAIS_COD', [], 2)]
    FConsigPaisCod: Nullable<string>;
    
    [Column('NOTIFY1_NOME', [], 100)]
    FNotify1Nome: Nullable<string>;
    
    [Column('NOTIFY1_ENDERECO', [], 100)]
    FNotify1Endereco: Nullable<string>;
    
    [Column('NOTIFY1_CIDADE', [], 30)]
    FNotify1Cidade: Nullable<string>;
    
    [Column('NOTIFY1_CEP', [], 8)]
    FNotify1Cep: Nullable<string>;
    
    [Column('NOTIFY1_ESTADO', [], 30)]
    FNotify1Estado: Nullable<string>;
    
    [Column('NOTIFY1_PAIS_COD', [], 2)]
    FNotify1PaisCod: Nullable<string>;
    
    [Column('NOTIFY2_NOME', [], 100)]
    FNotify2Nome: Nullable<string>;
    
    [Column('NOTIFY2_ENDERECO', [], 100)]
    FNotify2Endereco: Nullable<string>;
    
    [Column('NOTIFY2_CIDADE', [], 30)]
    FNotify2Cidade: Nullable<string>;
    
    [Column('NOTIFY2_CEP', [], 8)]
    FNotify2Cep: Nullable<string>;
    
    [Column('NOTIFY2_ESTADO', [], 30)]
    FNotify2Estado: Nullable<string>;
    
    [Column('NOTIFY2_PAIS_COD', [], 2)]
    FNotify2PaisCod: Nullable<string>;
    
    [Column('AGENTE_NOME', [], 60)]
    FAgenteNome: Nullable<string>;
    
    [Column('AGENTE_CD_INTTRA', [], 20)]
    FAgenteCdInttra: Nullable<string>;
    
    [Column('AGENTE_ENDERECO', [], 100)]
    FAgenteEndereco: Nullable<string>;
    
    [Column('AGENTE_CIDADE', [], 30)]
    FAgenteCidade: Nullable<string>;
    
    [Column('AGENTE_CEP', [], 8)]
    FAgenteCep: Nullable<string>;
    
    [Column('AGENTE_ESTADO', [], 30)]
    FAgenteEstado: Nullable<string>;
    
    [Column('AGENTE_PAIS_COD', [], 2)]
    FAgentePaisCod: Nullable<string>;
    
    [Column('BOOKING_ARMADOR', [], 35)]
    FBookingArmador: Nullable<string>;
    
    [Column('REFERENCIA_EMBARQUE', [], 35)]
    FReferenciaEmbarque: Nullable<string>;
    
    [Column('NM_NAVIO', [], 40)]
    FNmNavio: Nullable<string>;
    
    [Column('NR_VIAGEM', [], 15)]
    FNrViagem: Nullable<string>;
    
    [Column('LOCAL_EMBARQUE', [], 50)]
    FLocalEmbarque: Nullable<string>;
    
    [Column('LOCAL_DESEMBARQUE', [], 50)]
    FLocalDesembarque: Nullable<string>;
    
    [Column('LOCAL_DESEMBARQUE_PAIS_COD', [], 2)]
    FLocalDesembarquePaisCod: Nullable<string>;
    
    [Column('MARCACAO_VOLUMES', [], 1000)]
    FMarcacaoVolumes: Nullable<string>;
    
    [Column('CD_RUC', [], 35)]
    FCdRuc: Nullable<string>;
    
    [Column('IN_PGMTO_ABROAD', [], 1)]
    FInPgmtoAbroad: Nullable<string>;
    
    [Column('NM_LOCAL_PGMTO_TAXAS', [], 100)]
    FNmLocalPgmtoTaxas: Nullable<string>;
    
    [Column('DS_EMAIL_INDAIA', [], 100)]
    FDsEmailIndaia: Nullable<string>;
    
    [Column('LOCAL_ENTREGA', [], 50)]
    FLocalEntrega: Nullable<string>;
    
    [Column('LOCAL_EMBARQUE_SIGLA', [], 3)]
    FLocalEmbarqueSigla: Nullable<string>;
    
    [Column('LOCAL_DESEMBARQUE_SIGLA', [], 3)]
    FLocalDesembarqueSigla: Nullable<string>;
    
    [Column('CONSIG_END_NUMERO', [], 6)]
    FConsigEndNumero: Nullable<string>;
    
    [Column('CONSIG_END_COMPL', [], 41)]
    FConsigEndCompl: Nullable<string>;
    
    [Column('CONSIG_NR_TELEFONE', [], 15)]
    FConsigNrTelefone: Nullable<string>;
    
    [Column('CONSIG_NR_FAX', [], 15)]
    FConsigNrFax: Nullable<string>;
    
    [Column('CONSIG_NR_RUC', [], 25)]
    FConsigNrRuc: Nullable<string>;
    
    [Column('CONSIG_NR_NIT', [], 25)]
    FConsigNrNit: Nullable<string>;
    
    [Column('CONSIG_NR_CUIT', [], 25)]
    FConsigNrCuit: Nullable<string>;
    
    [Column('NOTIFY1_END_NUMERO', [], 6)]
    FNotify1EndNumero: Nullable<string>;
    
    [Column('NOTIFY1_END_COMPL', [], 41)]
    FNotify1EndCompl: Nullable<string>;
    
    [Column('NOTIFY1_NR_TELEFONE', [], 15)]
    FNotify1NrTelefone: Nullable<string>;
    
    [Column('NOTIFY1_NR_FAX', [], 15)]
    FNotify1NrFax: Nullable<string>;
    
    [Column('NOTIFY1_NR_RUC', [], 25)]
    FNotify1NrRuc: Nullable<string>;
    
    [Column('NOTIFY1_NR_NIT', [], 25)]
    FNotify1NrNit: Nullable<string>;
    
    [Column('NOTIFY1_NR_CUIT', [], 25)]
    FNotify1NrCuit: Nullable<string>;
    
    [Column('NOTIFY2_END_NUMERO', [], 6)]
    FNotify2EndNumero: Nullable<string>;
    
    [Column('NOTIFY2_END_COMPL', [], 41)]
    FNotify2EndCompl: Nullable<string>;
    
    [Column('NOTIFY2_NR_TELEFONE', [], 15)]
    FNotify2NrTelefone: Nullable<string>;
    
    [Column('NOTIFY2_NR_FAX', [], 15)]
    FNotify2NrFax: Nullable<string>;
    
    [Column('NOTIFY2_NR_RUC', [], 25)]
    FNotify2NrRuc: Nullable<string>;
    
    [Column('NOTIFY2_NR_NIT', [], 25)]
    FNotify2NrNit: Nullable<string>;
    
    [Column('NOTIFY2_NR_CUIT', [], 25)]
    FNotify2NrCuit: Nullable<string>;
    
    [Column('LOCAL_LIBERACAO_BL_COD', [], 5)]
    FLocalLiberacaoBlCod: Nullable<string>;
    
    [Column('LOCAL_LIBERACAO_BL_NOME', [], 50)]
    FLocalLiberacaoBlNome: Nullable<string>;
    
    [Column('LOCAL_LIBERACAO_BL_PAIS', [], 120)]
    FLocalLiberacaoBlPais: Nullable<string>;
    
    [Column('LOCAL_ENTREGA_SIGLA', [], 3)]
    FLocalEntregaSigla: Nullable<string>;
    
    [Column('LOCAL_ENTREGA_PAIS_COD', [], 2)]
    FLocalEntregaPaisCod: Nullable<string>;
    
    [Column('STATUS_ENVIO', [], 100)]
    FStatusEnvio: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_USUARIO_CRIACAO', [], 'CD_USUARIO')]
    FCdUsuarioCriacao: Proxy<TTusuario>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_COLLECT_PREPAID', [], 'CODIGO')]
    FCdCollectPrepaid: Proxy<TTtpFrete>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_TIPO_PGMTO_TAXAS', [], 'CD_TAXA_INTTRA')]
    FCdTipoPgmtoTaxas: Proxy<TTtpTaxasInttra>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_TIPO_MOVIMENTO', [], 'CD_MOVIMENTO_INTTRA')]
    FCdTipoMovimento: Proxy<TTtpMovimentoInttra>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('NR_PROCESSO', [TColumnProp.Required], 'NR_PROCESSO')]
    FNrProcesso: Proxy<TTprocesso>;
    function GetCdUsuarioCriacao: TTusuario;
    procedure SetCdUsuarioCriacao(const Value: TTusuario);
    function GetCdCollectPrepaid: TTtpFrete;
    procedure SetCdCollectPrepaid(const Value: TTtpFrete);
    function GetCdTipoPgmtoTaxas: TTtpTaxasInttra;
    procedure SetCdTipoPgmtoTaxas(const Value: TTtpTaxasInttra);
    function GetCdTipoMovimento: TTtpMovimentoInttra;
    procedure SetCdTipoMovimento(const Value: TTtpMovimentoInttra);
    function GetNrProcesso: TTprocesso;
    procedure SetNrProcesso(const Value: TTprocesso);
  public
    property NrAmend: Integer read FNrAmend write FNrAmend;
    property DtCriacao: Nullable<TDateTime> read FDtCriacao write FDtCriacao;
    property DtEnvioDraft: Nullable<TDateTime> read FDtEnvioDraft write FDtEnvioDraft;
    property CdEnvioInttra: Nullable<string> read FCdEnvioInttra write FCdEnvioInttra;
    property ClienteNome: Nullable<string> read FClienteNome write FClienteNome;
    property ClienteEndereco: Nullable<string> read FClienteEndereco write FClienteEndereco;
    property ClienteCidade: Nullable<string> read FClienteCidade write FClienteCidade;
    property ClienteCep: Nullable<string> read FClienteCep write FClienteCep;
    property ClienteEstado: Nullable<string> read FClienteEstado write FClienteEstado;
    property ClientePaisCod: Nullable<string> read FClientePaisCod write FClientePaisCod;
    property ClienteCnpj: Nullable<string> read FClienteCnpj write FClienteCnpj;
    property ConsigNome: Nullable<string> read FConsigNome write FConsigNome;
    property ConsigEndereco: Nullable<string> read FConsigEndereco write FConsigEndereco;
    property ConsigCidade: Nullable<string> read FConsigCidade write FConsigCidade;
    property ConsigCep: Nullable<string> read FConsigCep write FConsigCep;
    property ConsigEstado: Nullable<string> read FConsigEstado write FConsigEstado;
    property ConsigPaisCod: Nullable<string> read FConsigPaisCod write FConsigPaisCod;
    property Notify1Nome: Nullable<string> read FNotify1Nome write FNotify1Nome;
    property Notify1Endereco: Nullable<string> read FNotify1Endereco write FNotify1Endereco;
    property Notify1Cidade: Nullable<string> read FNotify1Cidade write FNotify1Cidade;
    property Notify1Cep: Nullable<string> read FNotify1Cep write FNotify1Cep;
    property Notify1Estado: Nullable<string> read FNotify1Estado write FNotify1Estado;
    property Notify1PaisCod: Nullable<string> read FNotify1PaisCod write FNotify1PaisCod;
    property Notify2Nome: Nullable<string> read FNotify2Nome write FNotify2Nome;
    property Notify2Endereco: Nullable<string> read FNotify2Endereco write FNotify2Endereco;
    property Notify2Cidade: Nullable<string> read FNotify2Cidade write FNotify2Cidade;
    property Notify2Cep: Nullable<string> read FNotify2Cep write FNotify2Cep;
    property Notify2Estado: Nullable<string> read FNotify2Estado write FNotify2Estado;
    property Notify2PaisCod: Nullable<string> read FNotify2PaisCod write FNotify2PaisCod;
    property AgenteNome: Nullable<string> read FAgenteNome write FAgenteNome;
    property AgenteCdInttra: Nullable<string> read FAgenteCdInttra write FAgenteCdInttra;
    property AgenteEndereco: Nullable<string> read FAgenteEndereco write FAgenteEndereco;
    property AgenteCidade: Nullable<string> read FAgenteCidade write FAgenteCidade;
    property AgenteCep: Nullable<string> read FAgenteCep write FAgenteCep;
    property AgenteEstado: Nullable<string> read FAgenteEstado write FAgenteEstado;
    property AgentePaisCod: Nullable<string> read FAgentePaisCod write FAgentePaisCod;
    property BookingArmador: Nullable<string> read FBookingArmador write FBookingArmador;
    property ReferenciaEmbarque: Nullable<string> read FReferenciaEmbarque write FReferenciaEmbarque;
    property NmNavio: Nullable<string> read FNmNavio write FNmNavio;
    property NrViagem: Nullable<string> read FNrViagem write FNrViagem;
    property LocalEmbarque: Nullable<string> read FLocalEmbarque write FLocalEmbarque;
    property LocalDesembarque: Nullable<string> read FLocalDesembarque write FLocalDesembarque;
    property LocalDesembarquePaisCod: Nullable<string> read FLocalDesembarquePaisCod write FLocalDesembarquePaisCod;
    property MarcacaoVolumes: Nullable<string> read FMarcacaoVolumes write FMarcacaoVolumes;
    property CdRuc: Nullable<string> read FCdRuc write FCdRuc;
    property InPgmtoAbroad: Nullable<string> read FInPgmtoAbroad write FInPgmtoAbroad;
    property NmLocalPgmtoTaxas: Nullable<string> read FNmLocalPgmtoTaxas write FNmLocalPgmtoTaxas;
    property DsEmailIndaia: Nullable<string> read FDsEmailIndaia write FDsEmailIndaia;
    property LocalEntrega: Nullable<string> read FLocalEntrega write FLocalEntrega;
    property LocalEmbarqueSigla: Nullable<string> read FLocalEmbarqueSigla write FLocalEmbarqueSigla;
    property LocalDesembarqueSigla: Nullable<string> read FLocalDesembarqueSigla write FLocalDesembarqueSigla;
    property ConsigEndNumero: Nullable<string> read FConsigEndNumero write FConsigEndNumero;
    property ConsigEndCompl: Nullable<string> read FConsigEndCompl write FConsigEndCompl;
    property ConsigNrTelefone: Nullable<string> read FConsigNrTelefone write FConsigNrTelefone;
    property ConsigNrFax: Nullable<string> read FConsigNrFax write FConsigNrFax;
    property ConsigNrRuc: Nullable<string> read FConsigNrRuc write FConsigNrRuc;
    property ConsigNrNit: Nullable<string> read FConsigNrNit write FConsigNrNit;
    property ConsigNrCuit: Nullable<string> read FConsigNrCuit write FConsigNrCuit;
    property Notify1EndNumero: Nullable<string> read FNotify1EndNumero write FNotify1EndNumero;
    property Notify1EndCompl: Nullable<string> read FNotify1EndCompl write FNotify1EndCompl;
    property Notify1NrTelefone: Nullable<string> read FNotify1NrTelefone write FNotify1NrTelefone;
    property Notify1NrFax: Nullable<string> read FNotify1NrFax write FNotify1NrFax;
    property Notify1NrRuc: Nullable<string> read FNotify1NrRuc write FNotify1NrRuc;
    property Notify1NrNit: Nullable<string> read FNotify1NrNit write FNotify1NrNit;
    property Notify1NrCuit: Nullable<string> read FNotify1NrCuit write FNotify1NrCuit;
    property Notify2EndNumero: Nullable<string> read FNotify2EndNumero write FNotify2EndNumero;
    property Notify2EndCompl: Nullable<string> read FNotify2EndCompl write FNotify2EndCompl;
    property Notify2NrTelefone: Nullable<string> read FNotify2NrTelefone write FNotify2NrTelefone;
    property Notify2NrFax: Nullable<string> read FNotify2NrFax write FNotify2NrFax;
    property Notify2NrRuc: Nullable<string> read FNotify2NrRuc write FNotify2NrRuc;
    property Notify2NrNit: Nullable<string> read FNotify2NrNit write FNotify2NrNit;
    property Notify2NrCuit: Nullable<string> read FNotify2NrCuit write FNotify2NrCuit;
    property LocalLiberacaoBlCod: Nullable<string> read FLocalLiberacaoBlCod write FLocalLiberacaoBlCod;
    property LocalLiberacaoBlNome: Nullable<string> read FLocalLiberacaoBlNome write FLocalLiberacaoBlNome;
    property LocalLiberacaoBlPais: Nullable<string> read FLocalLiberacaoBlPais write FLocalLiberacaoBlPais;
    property LocalEntregaSigla: Nullable<string> read FLocalEntregaSigla write FLocalEntregaSigla;
    property LocalEntregaPaisCod: Nullable<string> read FLocalEntregaPaisCod write FLocalEntregaPaisCod;
    property StatusEnvio: Nullable<string> read FStatusEnvio write FStatusEnvio;
    property CdUsuarioCriacao: TTusuario read GetCdUsuarioCriacao write SetCdUsuarioCriacao;
    property CdCollectPrepaid: TTtpFrete read GetCdCollectPrepaid write SetCdCollectPrepaid;
    property CdTipoPgmtoTaxas: TTtpTaxasInttra read GetCdTipoPgmtoTaxas write SetCdTipoPgmtoTaxas;
    property CdTipoMovimento: TTtpMovimentoInttra read GetCdTipoMovimento write SetCdTipoMovimento;
    property NrProcesso: TTprocesso read GetNrProcesso write SetNrProcesso;
  end;
  
  [Entity]
  [Table('TPROCESSO_DRAFT_CNTR')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrAmend', TIdGenerator.None)]
  [Id('FNrCntr', TIdGenerator.None)]
  TTprocessoDraftCntr = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_AMEND', [TColumnProp.Required])]
    FNrAmend: Integer;
    
    [Column('NR_CNTR', [TColumnProp.Required], 20)]
    FNrCntr: string;
    
    [Column('NR_LACRE', [], 20)]
    FNrLacre: Nullable<string>;
    
    [Column('NR_LACRE_SIF', [], 11)]
    FNrLacreSif: Nullable<string>;
    
    [Column('NM_TP_CNTR', [], 20)]
    FNmTpCntr: Nullable<string>;
    
    [Column('CD_ISO', [], 4)]
    FCdIso: Nullable<string>;
    
    [Column('DS_TEMPERATURA', [], 6)]
    FDsTemperatura: Nullable<string>;
    
    [Column('TARA_CNTR', [], 15, 3)]
    FTaraCntr: Nullable<Double>;
    
    [Column('VL_CUBAGEM', [], 15, 4)]
    FVlCubagem: Nullable<Double>;
    
    [Column('DS_CARGA', [])]
    [DBTypeMemo]
    FDsCarga: String;
    
    [Column('CD_NCM', [], 11)]
    FCdNcm: Nullable<string>;
    
    [Column('CD_EMBALAGEM', [], 3)]
    FCdEmbalagem: Nullable<string>;
    
    [Column('DS_EMBALAGEM', [], 50)]
    FDsEmbalagem: Nullable<string>;
    
    [Column('QT_EMBALAGEM', [])]
    FQtEmbalagem: Nullable<Integer>;
    
    [Column('QT_PESO_BRUTO', [], 15, 3)]
    FQtPesoBruto: Nullable<Double>;
    
    [Column('VL_EXCESSO_CNTR', [])]
    FVlExcessoCntr: Nullable<Double>;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrAmend: Integer read FNrAmend write FNrAmend;
    property NrCntr: string read FNrCntr write FNrCntr;
    property NrLacre: Nullable<string> read FNrLacre write FNrLacre;
    property NrLacreSif: Nullable<string> read FNrLacreSif write FNrLacreSif;
    property NmTpCntr: Nullable<string> read FNmTpCntr write FNmTpCntr;
    property CdIso: Nullable<string> read FCdIso write FCdIso;
    property DsTemperatura: Nullable<string> read FDsTemperatura write FDsTemperatura;
    property TaraCntr: Nullable<Double> read FTaraCntr write FTaraCntr;
    property VlCubagem: Nullable<Double> read FVlCubagem write FVlCubagem;
    property DsCarga: String read FDsCarga write FDsCarga;
    property CdNcm: Nullable<string> read FCdNcm write FCdNcm;
    property CdEmbalagem: Nullable<string> read FCdEmbalagem write FCdEmbalagem;
    property DsEmbalagem: Nullable<string> read FDsEmbalagem write FDsEmbalagem;
    property QtEmbalagem: Nullable<Integer> read FQtEmbalagem write FQtEmbalagem;
    property QtPesoBruto: Nullable<Double> read FQtPesoBruto write FQtPesoBruto;
    property VlExcessoCntr: Nullable<Double> read FVlExcessoCntr write FVlExcessoCntr;
  end;
  
  [Entity]
  [Table('TPROCESSO_DRAFT_COMENTARIOS')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrAmend', TIdGenerator.None)]
  [Id('FNrComentario', TIdGenerator.None)]
  TTprocessoDraftComentarios = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_AMEND', [TColumnProp.Required])]
    FNrAmend: Integer;
    
    [Column('NR_COMENTARIO', [TColumnProp.Required])]
    FNrComentario: Integer;
    
    [Column('DS_COMENTARIO', [], 130)]
    FDsComentario: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_TP_COMENTARIO', [], 'CD_COMENTARIO_INNTRA')]
    FTpComentario: Proxy<TTtpComentariosInttra>;
    function GetTpComentario: TTtpComentariosInttra;
    procedure SetTpComentario(const Value: TTtpComentariosInttra);
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrAmend: Integer read FNrAmend write FNrAmend;
    property NrComentario: Integer read FNrComentario write FNrComentario;
    property DsComentario: Nullable<string> read FDsComentario write FDsComentario;
    property TpComentario: TTtpComentariosInttra read GetTpComentario write SetTpComentario;
  end;
  
  [Entity]
  [Table('TPROCESSO_DRAFT_MERC')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrAmend', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  TTprocessoDraftMerc = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_AMEND', [TColumnProp.Required])]
    FNrAmend: Integer;
    
    [Column('NR_ITEM', [TColumnProp.Required])]
    FNrItem: Integer;
    
    [Column('CD_MERCADORIA', [TColumnProp.Required], 40)]
    FCdMercadoria: string;
    
    [Column('DS_MERCADORIA', [], 200)]
    FDsMercadoria: Nullable<string>;
    
    [Column('CD_NCM', [], 11)]
    FCdNcm: Nullable<string>;
    
    [Column('CD_EMBALAGEM', [], 3)]
    FCdEmbalagem: Nullable<string>;
    
    [Column('DS_EMBALAGEM', [], 50)]
    FDsEmbalagem: Nullable<string>;
    
    [Column('QT_EMBALAGEM', [])]
    FQtEmbalagem: Nullable<Integer>;
    
    [Column('QT_PESO_BRUTO', [], 15, 3)]
    FQtPesoBruto: Nullable<Double>;
    
    [Column('VL_CUBAGEM', [], 15, 4)]
    FVlCubagem: Nullable<Double>;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrAmend: Integer read FNrAmend write FNrAmend;
    property NrItem: Integer read FNrItem write FNrItem;
    property CdMercadoria: string read FCdMercadoria write FCdMercadoria;
    property DsMercadoria: Nullable<string> read FDsMercadoria write FDsMercadoria;
    property CdNcm: Nullable<string> read FCdNcm write FCdNcm;
    property CdEmbalagem: Nullable<string> read FCdEmbalagem write FCdEmbalagem;
    property DsEmbalagem: Nullable<string> read FDsEmbalagem write FDsEmbalagem;
    property QtEmbalagem: Nullable<Integer> read FQtEmbalagem write FQtEmbalagem;
    property QtPesoBruto: Nullable<Double> read FQtPesoBruto write FQtPesoBruto;
    property VlCubagem: Nullable<Double> read FVlCubagem write FVlCubagem;
  end;
  
  [Entity]
  [Table('TPROCESSO_DRAFT_MERC_CNTR')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrAmend', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  [Id('FNrCntr', TIdGenerator.None)]
  TTprocessoDraftMercCntr = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_AMEND', [TColumnProp.Required])]
    FNrAmend: Integer;
    
    [Column('NR_ITEM', [TColumnProp.Required])]
    FNrItem: Integer;
    
    [Column('NR_CNTR', [TColumnProp.Required], 20)]
    FNrCntr: string;
    
    [Column('QT_EMBALAGEM', [])]
    FQtEmbalagem: Nullable<Integer>;
    
    [Column('QT_PESO_BRUTO', [], 15, 3)]
    FQtPesoBruto: Nullable<Double>;
    
    [Column('VL_CUBAGEM', [], 15, 4)]
    FVlCubagem: Nullable<Double>;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrAmend: Integer read FNrAmend write FNrAmend;
    property NrItem: Integer read FNrItem write FNrItem;
    property NrCntr: string read FNrCntr write FNrCntr;
    property QtEmbalagem: Nullable<Integer> read FQtEmbalagem write FQtEmbalagem;
    property QtPesoBruto: Nullable<Double> read FQtPesoBruto write FQtPesoBruto;
    property VlCubagem: Nullable<Double> read FVlCubagem write FVlCubagem;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP')]
  [Id('FProcesso', TIdGenerator.None)]
  TTprocessoExp = class
  private
    [Column('CD_AGENTE', [], 4)]
    FCdAgente: Nullable<string>;
    
    [Column('CD_VIA_TRANSPORTE', [], 2)]
    FCdViaTransporte: Nullable<string>;
    
    [Column('CD_TRANSPORTADORA', [], 4)]
    FCdTransportadora: Nullable<string>;
    
    [Column('CD_SEGURADORA', [], 5)]
    FCdSeguradora: Nullable<string>;
    
    [Column('CD_REPRESENTANTE', [], 5)]
    FCdRepresentante: Nullable<string>;
    
    [Column('CD_LOCAL_ORIGEM', [], 4)]
    FCdLocalOrigem: Nullable<string>;
    
    [Column('CD_LOCAL_DESTINO', [], 4)]
    FCdLocalDestino: Nullable<string>;
    
    [Column('DT_REGISTRO_PEDIDO', [])]
    FDtRegistroPedido: Nullable<TDateTime>;
    
    [Column('TX_MARCACAO_VOLUME', [TColumnProp.Lazy])]
    [DBTypeMemo]
    FTxMarcacaoVolume: TBlob;
    
    [Column('VL_FRETE', [])]
    FVlFrete: Nullable<Double>;
    
    [Column('VL_SEGURO', [])]
    FVlSeguro: Nullable<Double>;
    
    [Column('VL_PESO_LIQUIDO', [])]
    FVlPesoLiquido: Nullable<Double>;
    
    [Column('VL_DESCONTO', [])]
    FVlDesconto: Nullable<Double>;
    
    [Column('VL_COMISSAO_PERCENT', [])]
    FVlComissaoPercent: Nullable<Double>;
    
    [Column('VL_TOT_MCV', [])]
    FVlTotMcv: Nullable<Double>;
    
    [Column('VL_TOT_EXW', [])]
    FVlTotExw: Nullable<Double>;
    
    [Column('IN_DUE', [])]
    FInDue: Nullable<Boolean>;
    
    [Column('IN_REC_ALFANDEGADO_DESPACHO', [])]
    FInRecAlfandegadoDespacho: Nullable<Boolean>;
    
    [Column('NM_REF_END_REC_ALFAND_DESPACHO', [])]
    [DBTypeMemo]
    FNmRefEndRecAlfandDespacho: Nullable<String>;
    
    [Column('IN_UM_ENQUAD_POR_PROC', [])]
    FInUmEnquadPorProc: Nullable<Boolean>;
    
    [Column('TX_INFORMACOES_ADICIONAIS', [])]
    [DBTypeMemo]
    FTxInformacoesAdicionais: Nullable<String>;
    
    [Column('CD_STATUS_DUE', [])]
    FCdStatusDue: Nullable<Integer>;
    
    [Column('DT_ENVIO_DUE', [])]
    FDtEnvioDue: Nullable<TDateTime>;
    
    [Column('CD_CHAVE_ACESSO_DUE', [], 20)]
    FCdChaveAcessoDue: Nullable<string>;
    
    [Column('IN_TIPO_DOCUMENTO_DUE', [])]
    FInTipoDocumentoDue: Nullable<Integer>;
    
    [Column('NR_PROCESSSO_ADM_IMP', [], 17)]
    FNrProcesssoAdmImp: Nullable<string>;
    
    [Column('TX_MOTIVO_RETIFICACAO', [], 200)]
    FTxMotivoRetificacao: Nullable<string>;
    
    [Column('QT_DIAS_PRAZO_VALIDADE_EXP_TEMP', [])]
    FQtDiasPrazoValidadeExpTemp: Nullable<Integer>;
    
    [Column('IN_REC_ALFANDEGADO_EMBARQUE', [])]
    FInRecAlfandegadoEmbarque: Nullable<Boolean>;
    
    [Column('NM_REF_END_REC_ALFAND_EMBARQUE', [])]
    [DBTypeMemo]
    FNmRefEndRecAlfandEmbarque: Nullable<String>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_INCOTERM', [], 'CODIGO')]
    FIncoterm: Proxy<TTincotermsVenda>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_PAIS_DESTINO', [], 'CD_PAIS')]
    FPaisDestino: Proxy<TTpaisBroker>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_MOEDA', [], 'CD_MOEDA')]
    FMoeda: Proxy<TTmoedaBroker>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_URF_DESPACHO', [], 'CODIGO')]
    FUrfDespacho: Proxy<TTurf>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_URF_DESTINO', [], 'CODIGO')]
    FUrfDestino: Proxy<TTurf>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REC_ALFANDEGADO_DESPACHO', [], 'CODIGO')]
    FRecAlfandegadoDespacho: Proxy<TTrecAlfandegado>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REC_ALFANDEGADO_EMBARQUE', [], 'CODIGO')]
    FRecAlfandegadoEmbarque: Proxy<TTrecAlfandegado>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_EXPORTADOR', [TColumnProp.Required], 'CD_EMPRESA')]
    FExportador: Proxy<TTempresaNac>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_ENQUAD_OP', [], 'CD_ENQUAD_OP')]
    FEnquadOp: Proxy<TTenquadOp>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_DESPACHANTE', [], 'CD_DESPACHANTE')]
    FDespachante: Proxy<TTdespachante>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('NR_PROCESSO', [TColumnProp.Required], 'NR_PROCESSO')]
    FProcesso: Proxy<TTprocesso>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_IMPORTADOR', [], 'CD_EMPRESA')]
    FImportador: Proxy<TTempresaEst>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_TIPO_FRETE', [], 'CODIGO')]
    FTipoFrete: Proxy<TTtpFrete>;
    function GetIncoterm: TTincotermsVenda;
    procedure SetIncoterm(const Value: TTincotermsVenda);
    function GetPaisDestino: TTpaisBroker;
    procedure SetPaisDestino(const Value: TTpaisBroker);
    function GetMoeda: TTmoedaBroker;
    procedure SetMoeda(const Value: TTmoedaBroker);
    function GetUrfDespacho: TTurf;
    procedure SetUrfDespacho(const Value: TTurf);
    function GetUrfDestino: TTurf;
    procedure SetUrfDestino(const Value: TTurf);
    function GetRecAlfandegadoDespacho: TTrecAlfandegado;
    procedure SetRecAlfandegadoDespacho(const Value: TTrecAlfandegado);
    function GetRecAlfandegadoEmbarque: TTrecAlfandegado;
    procedure SetRecAlfandegadoEmbarque(const Value: TTrecAlfandegado);
    function GetExportador: TTempresaNac;
    procedure SetExportador(const Value: TTempresaNac);
    function GetEnquadOp: TTenquadOp;
    procedure SetEnquadOp(const Value: TTenquadOp);
    function GetDespachante: TTdespachante;
    procedure SetDespachante(const Value: TTdespachante);
    function GetProcesso: TTprocesso;
    procedure SetProcesso(const Value: TTprocesso);
    function GetImportador: TTempresaEst;
    procedure SetImportador(const Value: TTempresaEst);
    function GetTipoFrete: TTtpFrete;
    procedure SetTipoFrete(const Value: TTtpFrete);
  public
    property CdAgente: Nullable<string> read FCdAgente write FCdAgente;
    property CdViaTransporte: Nullable<string> read FCdViaTransporte write FCdViaTransporte;
    property CdTransportadora: Nullable<string> read FCdTransportadora write FCdTransportadora;
    property CdSeguradora: Nullable<string> read FCdSeguradora write FCdSeguradora;
    property CdRepresentante: Nullable<string> read FCdRepresentante write FCdRepresentante;
    property CdLocalOrigem: Nullable<string> read FCdLocalOrigem write FCdLocalOrigem;
    property CdLocalDestino: Nullable<string> read FCdLocalDestino write FCdLocalDestino;
    property DtRegistroPedido: Nullable<TDateTime> read FDtRegistroPedido write FDtRegistroPedido;
    property TxMarcacaoVolume: TBlob read FTxMarcacaoVolume write FTxMarcacaoVolume;
    property VlFrete: Nullable<Double> read FVlFrete write FVlFrete;
    property VlSeguro: Nullable<Double> read FVlSeguro write FVlSeguro;
    property VlPesoLiquido: Nullable<Double> read FVlPesoLiquido write FVlPesoLiquido;
    property VlDesconto: Nullable<Double> read FVlDesconto write FVlDesconto;
    property VlComissaoPercent: Nullable<Double> read FVlComissaoPercent write FVlComissaoPercent;
    property VlTotMcv: Nullable<Double> read FVlTotMcv write FVlTotMcv;
    property VlTotExw: Nullable<Double> read FVlTotExw write FVlTotExw;
    property InDue: Nullable<Boolean> read FInDue write FInDue;
    property InRecAlfandegadoDespacho: Nullable<Boolean> read FInRecAlfandegadoDespacho write FInRecAlfandegadoDespacho;
    property NmRefEndRecAlfandDespacho: Nullable<String> read FNmRefEndRecAlfandDespacho write FNmRefEndRecAlfandDespacho;
    property InUmEnquadPorProc: Nullable<Boolean> read FInUmEnquadPorProc write FInUmEnquadPorProc;
    property TxInformacoesAdicionais: Nullable<String> read FTxInformacoesAdicionais write FTxInformacoesAdicionais;
    property CdStatusDue: Nullable<Integer> read FCdStatusDue write FCdStatusDue;
    property DtEnvioDue: Nullable<TDateTime> read FDtEnvioDue write FDtEnvioDue;
    property CdChaveAcessoDue: Nullable<string> read FCdChaveAcessoDue write FCdChaveAcessoDue;
    property InTipoDocumentoDue: Nullable<Integer> read FInTipoDocumentoDue write FInTipoDocumentoDue;
    property NrProcesssoAdmImp: Nullable<string> read FNrProcesssoAdmImp write FNrProcesssoAdmImp;
    property TxMotivoRetificacao: Nullable<string> read FTxMotivoRetificacao write FTxMotivoRetificacao;
    property QtDiasPrazoValidadeExpTemp: Nullable<Integer> read FQtDiasPrazoValidadeExpTemp write FQtDiasPrazoValidadeExpTemp;
    property InRecAlfandegadoEmbarque: Nullable<Boolean> read FInRecAlfandegadoEmbarque write FInRecAlfandegadoEmbarque;
    property NmRefEndRecAlfandEmbarque: Nullable<String> read FNmRefEndRecAlfandEmbarque write FNmRefEndRecAlfandEmbarque;
    property Incoterm: TTincotermsVenda read GetIncoterm write SetIncoterm;
    property PaisDestino: TTpaisBroker read GetPaisDestino write SetPaisDestino;
    property Moeda: TTmoedaBroker read GetMoeda write SetMoeda;
    property UrfDespacho: TTurf read GetUrfDespacho write SetUrfDespacho;
    property UrfDestino: TTurf read GetUrfDestino write SetUrfDestino;
    property RecAlfandegadoDespacho: TTrecAlfandegado read GetRecAlfandegadoDespacho write SetRecAlfandegadoDespacho;
    property RecAlfandegadoEmbarque: TTrecAlfandegado read GetRecAlfandegadoEmbarque write SetRecAlfandegadoEmbarque;
    property Exportador: TTempresaNac read GetExportador write SetExportador;
    property EnquadOp: TTenquadOp read GetEnquadOp write SetEnquadOp;
    property Despachante: TTdespachante read GetDespachante write SetDespachante;
    property Processo: TTprocesso read GetProcesso write SetProcesso;
    property Importador: TTempresaEst read GetImportador write SetImportador;
    property TipoFrete: TTtpFrete read GetTipoFrete write SetTipoFrete;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_ITEM')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  TTprocessoExpItem = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;
    
    [Column('CD_MERCADORIA', [], 40)]
    FCdMercadoria: Nullable<string>;
    
    [Column('CD_NCM', [], 11)]
    FCdNcm: Nullable<string>;
    
    [Column('QT_EMBALAGEM', [])]
    FQtEmbalagem: Nullable<Double>;
    
    [Column('QT_MERCADORIA', [])]
    FQtMercadoria: Nullable<Double>;
    
    [Column('VL_TOT_PESO_LIQ', [])]
    FVlTotPesoLiq: Nullable<Double>;
    
    [Column('VL_TOT_PESO_BRUTO', [])]
    FVlTotPesoBruto: Nullable<Double>;
    
    [Column('VL_CUBAGEM', [])]
    FVlCubagem: Nullable<Double>;
    
    [Column('VL_MLE', [])]
    FVlMle: Nullable<Double>;
    
    [Column('IN_ACORDO', [TColumnProp.Required])]
    FInAcordo: Boolean;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_UNID_MEDIDA', [], 'CD_UNID_MEDIDA')]
    FCdUnidMedida: Proxy<TTunidMedidaBroker>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_EMBALAGEM', [], 'CD_EMBALAGEM')]
    FEmbalagem: Proxy<TTembalagem>;
    function GetCdUnidMedida: TTunidMedidaBroker;
    procedure SetCdUnidMedida(const Value: TTunidMedidaBroker);
    function GetEmbalagem: TTembalagem;
    procedure SetEmbalagem(const Value: TTembalagem);
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrItem: string read FNrItem write FNrItem;
    property CdMercadoria: Nullable<string> read FCdMercadoria write FCdMercadoria;
    property CdNcm: Nullable<string> read FCdNcm write FCdNcm;
    property QtEmbalagem: Nullable<Double> read FQtEmbalagem write FQtEmbalagem;
    property QtMercadoria: Nullable<Double> read FQtMercadoria write FQtMercadoria;
    property VlTotPesoLiq: Nullable<Double> read FVlTotPesoLiq write FVlTotPesoLiq;
    property VlTotPesoBruto: Nullable<Double> read FVlTotPesoBruto write FVlTotPesoBruto;
    property VlCubagem: Nullable<Double> read FVlCubagem write FVlCubagem;
    property VlMle: Nullable<Double> read FVlMle write FVlMle;
    property InAcordo: Boolean read FInAcordo write FInAcordo;
    property CdUnidMedida: TTunidMedidaBroker read GetCdUnidMedida write SetCdUnidMedida;
    property Embalagem: TTembalagem read GetEmbalagem write SetEmbalagem;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_ITEM_CONTAINER')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrContr', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  TTprocessoExpItemContainer = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_CONTR', [TColumnProp.Required], 20)]
    FNrContr: string;
    
    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;
    
    [Column('QT_MERCADORIA', [])]
    FQtMercadoria: Nullable<Double>;
    
    [Column('QT_PESO_BRUTO', [])]
    FQtPesoBruto: Nullable<Double>;
    
    [Column('VL_CUBAGEM', [])]
    FVlCubagem: Nullable<Double>;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrContr: string read FNrContr write FNrContr;
    property NrItem: string read FNrItem write FNrItem;
    property QtMercadoria: Nullable<Double> read FQtMercadoria write FQtMercadoria;
    property QtPesoBruto: Nullable<Double> read FQtPesoBruto write FQtPesoBruto;
    property VlCubagem: Nullable<Double> read FVlCubagem write FVlCubagem;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_NF')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrNf', TIdGenerator.None)]
  TTprocessoExpNf = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_NF', [TColumnProp.Required], 10)]
    FNrNf: string;
    
    [Column('DT_NOTA', [])]
    FDtNota: Nullable<TDateTime>;
    
    [Column('VL_NOTA', [])]
    FVlNota: Nullable<Double>;
    
    [Column('NF_SERIE', [], 3)]
    FNfSerie: Nullable<string>;
    
    [Column('VL_TAXA', [])]
    FVlTaxa: Nullable<Double>;
    
    [Column('NR_RE', [], 12)]
    FNrRe: Nullable<string>;
    
    [Column('CHAVE_NOTA', [], 44)]
    FChaveNota: Nullable<string>;
    
    [Column('VL_TOTAL_PRODUTOS', [])]
    FVlTotalProdutos: Nullable<Double>;
    
    [Column('VL_FRETE', [])]
    FVlFrete: Nullable<Double>;
    
    [Column('VL_SEGURO', [])]
    FVlSeguro: Nullable<Double>;
    
    [Column('VL_TOTAL_DESCONTOS', [])]
    FVlTotalDescontos: Nullable<Double>;
    
    [Column('VL_OUTRAS_DESPESAS', [])]
    FVlOutrasDespesas: Nullable<Double>;
    
    [Column('PL_MERCADORIA_TOTAL', [])]
    FPlMercadoriaTotal: Nullable<Double>;
    
    [Column('QT_COMERCIAL_TOTAL', [])]
    FQtComercialTotal: Nullable<Double>;
    
    [Column('QT_TRIBUTAVEL_TOTAL', [])]
    FQtTributavelTotal: Nullable<Double>;
    
    [Column('VL_MLE_MNEG', [])]
    FVlMleMneg: Nullable<Double>;
    
    [Column('VL_LOCAL_EMBARQUE_TOTAL', [])]
    FVlLocalEmbarqueTotal: Nullable<Double>;
    
    [Column('VL_CONDICAO_VENDA_TOTAL', [])]
    FVlCondicaoVendaTotal: Nullable<Double>;
    
    [Column('IN_NF_RETIFICACAO', [])]
    FInNfRetificacao: Nullable<Boolean>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge, TCascadeType.Remove], 'FProcessoExpNf')]
    FProcessoExpNfItem: Proxy<TList<TTprocessoExpNfItem>>;
    function GetProcessoExpNfItem: TList<TTprocessoExpNfItem>;
  public
    constructor Create;
    destructor Destroy; override;
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrNf: string read FNrNf write FNrNf;
    property DtNota: Nullable<TDateTime> read FDtNota write FDtNota;
    property VlNota: Nullable<Double> read FVlNota write FVlNota;
    property NfSerie: Nullable<string> read FNfSerie write FNfSerie;
    property VlTaxa: Nullable<Double> read FVlTaxa write FVlTaxa;
    property NrRe: Nullable<string> read FNrRe write FNrRe;
    property ChaveNota: Nullable<string> read FChaveNota write FChaveNota;
    property VlTotalProdutos: Nullable<Double> read FVlTotalProdutos write FVlTotalProdutos;
    property VlFrete: Nullable<Double> read FVlFrete write FVlFrete;
    property VlSeguro: Nullable<Double> read FVlSeguro write FVlSeguro;
    property VlTotalDescontos: Nullable<Double> read FVlTotalDescontos write FVlTotalDescontos;
    property VlOutrasDespesas: Nullable<Double> read FVlOutrasDespesas write FVlOutrasDespesas;
    property PlMercadoriaTotal: Nullable<Double> read FPlMercadoriaTotal write FPlMercadoriaTotal;
    property QtComercialTotal: Nullable<Double> read FQtComercialTotal write FQtComercialTotal;
    property QtTributavelTotal: Nullable<Double> read FQtTributavelTotal write FQtTributavelTotal;
    property VlMleMneg: Nullable<Double> read FVlMleMneg write FVlMleMneg;
    property VlLocalEmbarqueTotal: Nullable<Double> read FVlLocalEmbarqueTotal write FVlLocalEmbarqueTotal;
    property VlCondicaoVendaTotal: Nullable<Double> read FVlCondicaoVendaTotal write FVlCondicaoVendaTotal;
    property InNfRetificacao: Nullable<Boolean> read FInNfRetificacao write FInNfRetificacao;
    property ProcessoExpNfItem: TList<TTprocessoExpNfItem> read GetProcessoExpNfItem;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_NF_ITEM')]
  [Id('FProcessoExpNf', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  TTprocessoExpNfItem = class
  private
    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;
    
    [Column('PL_MERCADORIA', [])]
    FPlMercadoria: Nullable<Double>;
    
    [Column('CD_MERCADORIA', [], 30)]
    FCdMercadoria: Nullable<string>;
    
    [Column('NM_MERCADORIA', [])]
    [DBTypeMemo]
    FNmMercadoria: Nullable<String>;
    
    [Column('AP_MERCADORIA', [], 200)]
    FApMercadoria: Nullable<string>;
    
    [Column('VL_LOCAL_EMBARQUE', [])]
    FVlLocalEmbarque: Nullable<Double>;
    
    [Column('VL_CONDICAO_VENDA', [])]
    FVlCondicaoVenda: Nullable<Double>;
    
    [Column('VL_ITEM', [])]
    FVlItem: Nullable<Double>;
    
    [Column('VL_OUTRAS_DESP', [])]
    FVlOutrasDesp: Nullable<Double>;
    
    [Column('VL_DESCONTO', [])]
    FVlDesconto: Nullable<Double>;
    
    [Column('VL_TOTAL_FRETE', [])]
    FVlTotalFrete: Nullable<Double>;
    
    [Column('VL_SEGURO', [])]
    FVlSeguro: Nullable<Double>;

    [Column('UN_COMERCIAL', [], 3)]
    FUnComercial: Nullable<string>;
    
    [Column('QT_COMERCIAL', [])]
    FQtComercial: Nullable<Double>;
    
    [Column('UN_TRIBUTAVEL', [], 3)]
    FUnTributavel: Nullable<string>;
    
    [Column('QT_TRIBUTAVEL', [])]
    FQtTributavel: Nullable<Double>;
    
    [Column('VL_ITEM_MNEG', [])]
    FVlItemMneg: Nullable<Double>;
    
    [Column('VL_OUTRAS_DESP_MNEG', [])]
    FVlOutrasDespMneg: Nullable<Double>;
    
    [Column('VL_DESCONTO_MNEG', [])]
    FVlDescontoMneg: Nullable<Double>;
    
    [Column('VL_TOTAL_FRETE_MNEG', [])]
    FVlTotalFreteMneg: Nullable<Double>;
    
    [Column('VL_SEGURO_MNEG', [])]
    FVlSeguroMneg: Nullable<Double>;
    
    [Column('TX_LOG', [])]
    [DBTypeMemo]
    FTxLog: Nullable<String>;
    
    [Column('CD_NCM_DESTAQUE_DOMINIO', [], 2)]
    FCdNcmDestaqueDominio: Nullable<string>;
    
    [Column('NR_ITEM_NF', [])]
    FNrItemNf: Nullable<Integer>;
    
    [Column('NR_ITEM_DUE', [])]
    FNrItemDue: Nullable<Integer>;
    
    [Column('IN_VERIFICACAO_ESTATISTICA', [])]
    FInVerificacaoEstatistica: Nullable<Boolean>;
    
    [Column('NR_DECLARACAO_IMP', [], 10)]
    FNrDeclaracaoImp: Nullable<string>;
    
    [Column('NR_ADICAO_IMP', [], 3)]
    FNrAdicaoImp: Nullable<string>;
    
    [Column('NR_ATO_CONCESSORIO_DRAWBACK', [], 14)]
    FNrAtoConcessorioDrawback: Nullable<string>;
    
    [Column('NR_ITEM_ATO_CONCESSORIO_DRAWBACK', [], 3)]
    FNrItemAtoConcessorioDrawback: Nullable<string>;

    [Column('CNPJ_ATO_CONCESSORIO_DRAWBACK', [], 14)]
    FCnpjAtoConcessorioDrawback: Nullable<string>;

    [Column('NM_SITUACAO_NCM_ATRIBUTO', [], 40)]
    FNmSituacaoNcmAtributo: Nullable<string>;
    
    [Column('CD_CFOP', [], 4)]
    FCdCfop: Nullable<string>;

    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_TRATAMENTO_PRIORITARIO', [], 'CODIGO')]
    FTratamentoPrioritario: Proxy<TTratamentoPrioritario>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('NR_PROCESSO', [TColumnProp.Required], 'NR_PROCESSO')]
    [JoinColumn('NR_NF', [TColumnProp.Required], 'NR_NF')]
    FProcessoExpNf: Proxy<TTprocessoExpNf>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_NCM', [], 'CODIGO')]
    FNcm: Proxy<TTncm>;

    [Column('IN_EXPORT_BENEFIC_ATO_CONCESSORIO', [])]
    FInExportBeneficAtoConcessorio: Nullable<boolean>;

    [Column('NR_NCM_ATO_CONCESSORIO_DRAWBACK', [], 14)]
    FNrNcmAtoConcessorioDrawback: Nullable<string>;

    [Column('QT_UTILIZADA_ATO_CONCESSORIO_DRAWBACK', [])]
    FQtUtilizadaAtoConcessorioDrawback: Nullable<Double>;

    [Column('VMLE_C_COBERT_CAMBIAL_ATO_CONCESSORIO', [])]
    FVmleCCobertCambialAtoConcessorio: Nullable<Double>;

    [Column('VMLE_S_COBERT_CAMBIAL_ATO_CONCESSORIO', [])]
    FVmleSCobertCambialAtoConcessorio: Nullable<Double>;

    function GetTratamentoPrioritario: TTratamentoPrioritario;
    procedure SetTratamentoPrioritario(const Value: TTratamentoPrioritario);
    function GetProcessoExpNf: TTprocessoExpNf;
    procedure SetProcessoExpNf(const Value: TTprocessoExpNf);
    function GetNcm: TTncm;
    procedure SetNcm(const Value: TTncm);
  public
    property NrItem: string read FNrItem write FNrItem;
    property PlMercadoria: Nullable<Double> read FPlMercadoria write FPlMercadoria;
    property CdMercadoria: Nullable<string> read FCdMercadoria write FCdMercadoria;
    property NmMercadoria: Nullable<String> read FNmMercadoria write FNmMercadoria;
    property ApMercadoria: Nullable<string> read FApMercadoria write FApMercadoria;
    property VlLocalEmbarque: Nullable<Double> read FVlLocalEmbarque write FVlLocalEmbarque;
    property VlCondicaoVenda: Nullable<Double> read FVlCondicaoVenda write FVlCondicaoVenda;
    property VlItem: Nullable<Double> read FVlItem write FVlItem;
    property VlOutrasDesp: Nullable<Double> read FVlOutrasDesp write FVlOutrasDesp;
    property VlDesconto: Nullable<Double> read FVlDesconto write FVlDesconto;
    property VlTotalFrete: Nullable<Double> read FVlTotalFrete write FVlTotalFrete;
    property VlSeguro: Nullable<Double> read FVlSeguro write FVlSeguro;
    property UnComercial: Nullable<string> read FUnComercial write FUnComercial;
    property QtComercial: Nullable<Double> read FQtComercial write FQtComercial;
    property UnTributavel: Nullable<string> read FUnTributavel write FUnTributavel;
    property QtTributavel: Nullable<Double> read FQtTributavel write FQtTributavel;
    property VlItemMneg: Nullable<Double> read FVlItemMneg write FVlItemMneg;
    property VlOutrasDespMneg: Nullable<Double> read FVlOutrasDespMneg write FVlOutrasDespMneg;
    property VlDescontoMneg: Nullable<Double> read FVlDescontoMneg write FVlDescontoMneg;
    property VlTotalFreteMneg: Nullable<Double> read FVlTotalFreteMneg write FVlTotalFreteMneg;
    property VlSeguroMneg: Nullable<Double> read FVlSeguroMneg write FVlSeguroMneg;
    property TxLog: Nullable<String> read FTxLog write FTxLog;
    property CdNcmDestaqueDominio: Nullable<string> read FCdNcmDestaqueDominio write FCdNcmDestaqueDominio;
    property NrItemNf: Nullable<Integer> read FNrItemNf write FNrItemNf;
    property NrItemDue: Nullable<Integer> read FNrItemDue write FNrItemDue;
    property InVerificacaoEstatistica: Nullable<Boolean> read FInVerificacaoEstatistica write FInVerificacaoEstatistica;
    property NrDeclaracaoImp: Nullable<string> read FNrDeclaracaoImp write FNrDeclaracaoImp;
    property NrAdicaoImp: Nullable<string> read FNrAdicaoImp write FNrAdicaoImp;
    property NrAtoConcessorioDrawback: Nullable<string> read FNrAtoConcessorioDrawback write FNrAtoConcessorioDrawback;
    property NrItemAtoConcessorioDrawback: Nullable<string> read FNrItemAtoConcessorioDrawback write FNrItemAtoConcessorioDrawback;
    property CnpjAtoConcessorioDrawback: Nullable<string> read FCnpjAtoConcessorioDrawback write FCnpjAtoConcessorioDrawback;
    property NmSituacaoNcmAtributo: Nullable<string> read FNmSituacaoNcmAtributo write FNmSituacaoNcmAtributo;
    property TratamentoPrioritario: TTratamentoPrioritario read GetTratamentoPrioritario write SetTratamentoPrioritario;
    property ProcessoExpNf: TTprocessoExpNf read GetProcessoExpNf write SetProcessoExpNf;
    property Ncm: TTncm read GetNcm write SetNcm;
    property CdCfop: Nullable<string> read FCdCfop write FCdCfop;
    property InExportBeneficAtoConcessorio: Nullable<boolean> read FInExportBeneficAtoConcessorio write FInExportBeneficAtoConcessorio;
    property NrNcmAtoConcessorioDrawback: Nullable<string> read FNrNcmAtoConcessorioDrawback write FNrNcmAtoConcessorioDrawback;
    property QtUtilizadaAtoConcessorioDrawback: Nullable<Double> read FQtUtilizadaAtoConcessorioDrawback write FQtUtilizadaAtoConcessorioDrawback;
    property VmleCCobertCambialAtoConcessorio: Nullable<Double> read FVmleCCobertCambialAtoConcessorio write FVmleCCobertCambialAtoConcessorio;
    property VmleSCobertCambialAtoConcessorio: Nullable<Double> read FVmleSCobertCambialAtoConcessorio write FVmleSCobertCambialAtoConcessorio;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_NF_ITEM_ENQUADRAMENTO')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrNf', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  [Id('FNrSeqEnquadramento', TIdGenerator.None)]
  TTprocessoExpNfItemEnquadramento = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;

    [Column('NR_NF', [TColumnProp.Required], 10)]
    FNrNf: string;

    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;

    [Column('NR_SEQ_ENQUADRAMENTO', [TColumnProp.Required])]
    FNrSeqEnquadramento: Integer;

    [Column('CD_ENQUADRAMENTO', [TColumnProp.Required], 5)]
    FCdEnquadramento: string;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrNf: string read FNrNf write FNrNf;
    property NrItem: string read FNrItem write FNrItem;
    property NrSeqEnquadramento: Integer read FNrSeqEnquadramento write FNrSeqEnquadramento;
    property CdEnquadramento: string read FCdEnquadramento write FCdEnquadramento;
  end;

  [Entity]
  [Table('TPROCESSO_EXP_NF_ITEM_NF_DRAWBACK')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrNf', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  [Id('FNrSeqNfDrawback', TIdGenerator.None)]
  TTProcessoExpNfItemNfDrawback = class
  private

    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;

    [Column('NR_NF', [TColumnProp.Required], 10)]
    FNrNf: string;

    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;

    [Column('NR_SEQ_NF_DRAWBACK', [TColumnProp.Required])]
    FNrSeqNfDrawback: Integer;

    [Column('NR_CHAVE_ACESSO_NF', [TColumnProp.Required], 44)]
    FNrChaveAcessoNf: string;


    [Column('QUANTIDADE_NF', [TColumnProp.Required])]
    FQuantidadeNf: Double;

    [Column('DATA_NF', [TColumnProp.Required])]
    FDataNf: TDate;

    [Column('VALOR_MOEDA_NEGOCIACAO_NF', [TColumnProp.Required])]
    FValorMoedaNegociacaoNf: Double;

  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrNf: string read FNrNf write FNrNf;
    property NrItem: string read FNrItem write FNrItem;
    property NrSeqNfDrawback: Integer read FNrSeqNfDrawback write FNrSeqNfDrawback;
    property NrChaveAcessoNf: string read FNrChaveAcessoNf write FNrChaveAcessoNf;
    property QuantidadeNf: Double read FQuantidadeNf write FQuantidadeNf;
    property DataNf: TDate read FDataNf write FDataNf;
    property ValorMoedaNegociacaoNf: Double read FValorMoedaNegociacaoNf write FValorMoedaNegociacaoNf;

  end;

  [Entity]
  [Table('TPROCESSO_EXP_NF_ITEM_LPCO')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrNf', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  [Id('FNrSeqLpco', TIdGenerator.None)]
  TTprocessoExpNfItemLpco = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_NF', [TColumnProp.Required], 10)]
    FNrNf: string;
    
    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;
    
    [Column('NR_SEQ_LPCO', [TColumnProp.Required])]
    FNrSeqLpco: Integer;
    
    [Column('CD_LPCO', [TColumnProp.Required], 11)]
    FCdLpco: string;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrNf: string read FNrNf write FNrNf;
    property NrItem: string read FNrItem write FNrItem;
    property NrSeqLpco: Integer read FNrSeqLpco write FNrSeqLpco;
    property CdLpco: string read FCdLpco write FCdLpco;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_NF_ITEM_NCM_ATRIBUTO')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrNf', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  [Id('FCdNcm', TIdGenerator.None)]
  [Id('FCdAtributo', TIdGenerator.None)]
  TTprocessoExpNfItemNcmAtributo = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_NF', [TColumnProp.Required], 10)]
    FNrNf: string;
    
    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;
    
    [Column('CD_NCM', [TColumnProp.Required], 8)]
    FCdNcm: string;
    
    [Column('CD_ATRIBUTO', [TColumnProp.Required], 15)]
    FCdAtributo: string;
    
    [Column('CD_ATRIBUTO_VALOR', [TColumnProp.Required], 3)]
    FCdAtributoValor: string;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrNf: string read FNrNf write FNrNf;
    property NrItem: string read FNrItem write FNrItem;
    property CdNcm: string read FCdNcm write FCdNcm;
    property CdAtributo: string read FCdAtributo write FCdAtributo;
    property CdAtributoValor: string read FCdAtributoValor write FCdAtributoValor;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_NF_ITEM_NF_COMPLEMENTAR')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrNf', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  [Id('FChaveAcesso', TIdGenerator.None)]
  TTprocessoExpNfItemNfComplementar = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_NF', [TColumnProp.Required], 10)]
    FNrNf: string;
    
    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;
    
    [Column('CHAVE_ACESSO', [TColumnProp.Required], 44)]
    FChaveAcesso: string;
    
    [Column('NR_ITEM_NF_COMPLEMENTAR_ITEM', [])]
    FNrItemNfComplementarItem: Nullable<Integer>;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrNf: string read FNrNf write FNrNf;
    property NrItem: string read FNrItem write FNrItem;
    property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
    property NrItemNfComplementarItem: Nullable<Integer> read FNrItemNfComplementarItem write FNrItemNfComplementarItem;
  end;
  
  [Entity]
  [Table('TPROCESSO_EXP_NF_ITEM_NOTA_REFERENCIADA')]
  [Id('FNrProcesso', TIdGenerator.None)]
  [Id('FNrNf', TIdGenerator.None)]
  [Id('FNrItem', TIdGenerator.None)]
  [Id('FNrItemNfRef', TIdGenerator.None)]
  TTprocessoExpNfItemNotaReferenciada = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_NF', [TColumnProp.Required], 10)]
    FNrNf: string;
    
    [Column('NR_ITEM', [TColumnProp.Required], 3)]
    FNrItem: string;
    
    [Column('NR_ITEM_NF_REF', [TColumnProp.Required])]
    FNrItemNfRef: Integer;
    
    [Column('CHAVE_ACESSO', [TColumnProp.Required], 44)]
    FChaveAcesso: string;
    
    [Column('QT_TRIBUTAVEL', [])]
    FQtTributavel: Nullable<Double>;
    
    [Column('NR_ITEM_NF_REF_ITEM', [])]
    FNrItemNfRefItem: Nullable<Integer>;
    
    [Column('NR_CPF_CNPJ_SUBMITTER', [], 14)]
    FNrCpfCnpjSubmitter: Nullable<string>;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrNf: string read FNrNf write FNrNf;
    property NrItem: string read FNrItem write FNrItem;
    property NrItemNfRef: Integer read FNrItemNfRef write FNrItemNfRef;
    property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
    property QtTributavel: Nullable<Double> read FQtTributavel write FQtTributavel;
    property NrItemNfRefItem: Nullable<Integer> read FNrItemNfRefItem write FNrItemNfRefItem;
    property NrCpfCnpjSubmitter: Nullable<string> read FNrCpfCnpjSubmitter write FNrCpfCnpjSubmitter;
  end;
  
  [Entity]
  [Table('TPRODUTO')]
  [Id('FCdProduto', TIdGenerator.None)]
  TTproduto = class
  private
    [Column('CD_PRODUTO', [TColumnProp.Required], 2)]
    FCdProduto: string;
    
    [Column('NM_PRODUTO', [TColumnProp.Required], 40)]
    FNmProduto: string;
    
    [Column('AP_PRODUTO', [TColumnProp.Required], 10)]
    FApProduto: string;
    
    [Column('IN_ATIVO', [TColumnProp.Required], 1)]
    FInAtivo: string;
    
    [Column('CD_VIATRANSP', [], 1)]
    FCdViatransp: Nullable<string>;
  public
    property CdProduto: string read FCdProduto write FCdProduto;
    property NmProduto: string read FNmProduto write FNmProduto;
    property ApProduto: string read FApProduto write FApProduto;
    property InAtivo: string read FInAtivo write FInAtivo;
    property CdViatransp: Nullable<string> read FCdViatransp write FCdViatransp;
  end;
  
  [Entity]
  [Table('TRATAMENTO_PRIORITARIO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTratamentoPrioritario = class
  private
    [Column('CODIGO', [TColumnProp.Required], 4)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 200)]
    FDescricao: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TREC_ALFANDEGADO')]
  [UniqueKey('CODIGO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTrecAlfandegado = class
  private
    [Column('CODIGO', [TColumnProp.Required], 7)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 120)]
    FDescricao: Nullable<string>;
    
    [Column('COD_ORGAO_REC', [], 7)]
    FCodOrgaoRec: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
    property CodOrgaoRec: Nullable<string> read FCodOrgaoRec write FCodOrgaoRec;
  end;
  
  [Entity]
  [Table('TREF_CLIENTE')]
  [Id('FNrProcesso', TIdGenerator.None)]
  TTrefCliente = class
  private
    [Column('NR_PROCESSO', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('NR_SEQUENCIA', [TColumnProp.Required], 5)]
    FNrSequencia: string;
    
    [Column('CD_REFERENCIA', [TColumnProp.Required], 30)]
    FCdReferencia: string;
    
    [Column('CD_REF_EXP', [], 15)]
    FCdRefExp: Nullable<string>;
    
    [Column('DT_REFERENCIA', [])]
    FDtReferencia: Nullable<TDateTime>;
    
    [Column('TP_REFERENCIA', [TColumnProp.Required], 2)]
    FTpReferencia: string;
    
    [Column('CD_AREA', [], 2)]
    FCdArea: Nullable<string>;
    
    [Column('NR_ITEM_PO', [], 4)]
    FNrItemPo: Nullable<string>;
    
    [Column('NR_PARCIAL', [])]
    FNrParcial: Nullable<Integer>;
    
    [Column('IN_FLAG_LI', [], 1)]
    FInFlagLi: Nullable<string>;
    
    [Column('CD_EMPRESA', [TColumnProp.Required], 5)]
    FCdEmpresa: string;
  public
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property NrSequencia: string read FNrSequencia write FNrSequencia;
    property CdReferencia: string read FCdReferencia write FCdReferencia;
    property CdRefExp: Nullable<string> read FCdRefExp write FCdRefExp;
    property DtReferencia: Nullable<TDateTime> read FDtReferencia write FDtReferencia;
    property TpReferencia: string read FTpReferencia write FTpReferencia;
    property CdArea: Nullable<string> read FCdArea write FCdArea;
    property NrItemPo: Nullable<string> read FNrItemPo write FNrItemPo;
    property NrParcial: Nullable<Integer> read FNrParcial write FNrParcial;
    property InFlagLi: Nullable<string> read FInFlagLi write FInFlagLi;
    property CdEmpresa: string read FCdEmpresa write FCdEmpresa;
  end;
  
  [Entity]
  [Table('TREGRA_OBS_AUTO')]
  [Id('FCdRegra', TIdGenerator.IdentityOrSequence)]
  TTregraObsAuto = class
  private
    [Column('CD_REGRA', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCdRegra: Integer;
    
    [Column('NM_REGRA', [], 100)]
    FNmRegra: Nullable<string>;
    
    [Column('NM_VALOR_CAMPO', [], 50)]
    FNmValorCampo: Nullable<string>;
    
    [Column('CD_OBSERVACAO', [], 4)]
    FCdObservacao: Nullable<string>;
    
    [Column('CD_SERVICO', [], 5)]
    FCdServico: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_GRUPO', [], 'CD_GRUPO')]
    FGrupo: Proxy<TTgrupo>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REGRA_TABELA', [], 'CD_REGRA_TABELA')]
    FTabela: Proxy<TTregraObsAutoTabelas>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REGRA_CAMPO', [], 'CD_REGRA_CAMPO')]
    FCampo: Proxy<TTregraObsAutoTabelasCampos>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge, TCascadeType.Remove], 'FRegra')]
    FRegraItem: Proxy<TList<TTregraObsAutoItem>>;
    function GetGrupo: TTgrupo;
    procedure SetGrupo(const Value: TTgrupo);
    function GetTabela: TTregraObsAutoTabelas;
    procedure SetTabela(const Value: TTregraObsAutoTabelas);
    function GetCampo: TTregraObsAutoTabelasCampos;
    procedure SetCampo(const Value: TTregraObsAutoTabelasCampos);
    function GetRegraItem: TList<TTregraObsAutoItem>;
  public
    constructor Create;
    destructor Destroy; override;
    property CdRegra: Integer read FCdRegra write FCdRegra;
    property NmRegra: Nullable<string> read FNmRegra write FNmRegra;
    property NmValorCampo: Nullable<string> read FNmValorCampo write FNmValorCampo;
    property CdObservacao: Nullable<string> read FCdObservacao write FCdObservacao;
    property CdServico: Nullable<string> read FCdServico write FCdServico;
    property Grupo: TTgrupo read GetGrupo write SetGrupo;
    property Tabela: TTregraObsAutoTabelas read GetTabela write SetTabela;
    property Campo: TTregraObsAutoTabelasCampos read GetCampo write SetCampo;
    property RegraItem: TList<TTregraObsAutoItem> read GetRegraItem;
  end;
  
  [Entity]
  [Table('TREGRA_OBS_AUTO_ITEM')]
  [Id('FCdRegraItem', TIdGenerator.IdentityOrSequence)]
  TTregraObsAutoItem = class
  private
    [Column('CD_REGRA_ITEM', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCdRegraItem: Integer;
    
    [Column('NM_REGRA_ITEM', [], 100)]
    FNmRegraItem: Nullable<string>;
    
    [Column('NM_VALOR_CAMPO', [], 50)]
    FNmValorCampo: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REGRA', [], 'CD_REGRA')]
    FRegra: Proxy<TTregraObsAuto>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REGRA_TABELA', [], 'CD_REGRA_TABELA')]
    FTabela: Proxy<TTregraObsAutoTabelas>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REGRA_CAMPO', [], 'CD_REGRA_CAMPO')]
    FCampo: Proxy<TTregraObsAutoTabelasCampos>;
    function GetRegra: TTregraObsAuto;
    procedure SetRegra(const Value: TTregraObsAuto);
    function GetTabela: TTregraObsAutoTabelas;
    procedure SetTabela(const Value: TTregraObsAutoTabelas);
    function GetCampo: TTregraObsAutoTabelasCampos;
    procedure SetCampo(const Value: TTregraObsAutoTabelasCampos);
  public
    property CdRegraItem: Integer read FCdRegraItem write FCdRegraItem;
    property NmRegraItem: Nullable<string> read FNmRegraItem write FNmRegraItem;
    property NmValorCampo: Nullable<string> read FNmValorCampo write FNmValorCampo;
    property Regra: TTregraObsAuto read GetRegra write SetRegra;
    property Tabela: TTregraObsAutoTabelas read GetTabela write SetTabela;
    property Campo: TTregraObsAutoTabelasCampos read GetCampo write SetCampo;
  end;
  
  [Entity]
  [Table('TREGRA_OBS_AUTO_TABELAS')]
  [Id('FCdRegraTabela', TIdGenerator.IdentityOrSequence)]
  TTregraObsAutoTabelas = class
  private
    [Column('CD_REGRA_TABELA', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCdRegraTabela: Integer;
    
    [Column('NM_TABELA_REGRA', [], 50)]
    FNmTabelaRegra: Nullable<string>;
    
    [Column('DS_TABELA_REGRA', [], 100)]
    FDsTabelaRegra: Nullable<string>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FTabela')]
    FCampos: Proxy<TList<TTregraObsAutoTabelasCampos>>;
    function GetCampos: TList<TTregraObsAutoTabelasCampos>;
  public
    constructor Create;
    destructor Destroy; override;
    property CdRegraTabela: Integer read FCdRegraTabela write FCdRegraTabela;
    property NmTabelaRegra: Nullable<string> read FNmTabelaRegra write FNmTabelaRegra;
    property DsTabelaRegra: Nullable<string> read FDsTabelaRegra write FDsTabelaRegra;
    property Campos: TList<TTregraObsAutoTabelasCampos> read GetCampos;
  end;
  
  [Entity]
  [Table('TREGRA_OBS_AUTO_TABELAS_CAMPOS')]
  [Id('FCdRegraCampo', TIdGenerator.IdentityOrSequence)]
  TTregraObsAutoTabelasCampos = class
  private
    [Column('CD_REGRA_CAMPO', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCdRegraCampo: Integer;
    
    [Column('NM_CAMPO', [], 50)]
    FNmCampo: Nullable<string>;
    
    [Column('DS_CAMPO', [], 100)]
    FDsCampo: Nullable<string>;
    
    [Column('NM_TABELA_ORIGEM', [], 50)]
    FNmTabelaOrigem: Nullable<string>;
    
    [Column('NM_CAMPO_CD_ORIGEM', [], 50)]
    FNmCampoCdOrigem: Nullable<string>;
    
    [Column('NM_CAMPO_DS_ORIGEM', [], 50)]
    FNmCampoDsOrigem: Nullable<string>;
    
    [Column('TX_WHERE_EXTRA', [], 500)]
    FTxWhereExtra: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_REGRA_TABELA', [], 'CD_REGRA_TABELA')]
    FTabela: Proxy<TTregraObsAutoTabelas>;
    function GetTabela: TTregraObsAutoTabelas;
    procedure SetTabela(const Value: TTregraObsAutoTabelas);
  public
    property CdRegraCampo: Integer read FCdRegraCampo write FCdRegraCampo;
    property NmCampo: Nullable<string> read FNmCampo write FNmCampo;
    property DsCampo: Nullable<string> read FDsCampo write FDsCampo;
    property NmTabelaOrigem: Nullable<string> read FNmTabelaOrigem write FNmTabelaOrigem;
    property NmCampoCdOrigem: Nullable<string> read FNmCampoCdOrigem write FNmCampoCdOrigem;
    property NmCampoDsOrigem: Nullable<string> read FNmCampoDsOrigem write FNmCampoDsOrigem;
    property TxWhereExtra: Nullable<string> read FTxWhereExtra write FTxWhereExtra;
    property Tabela: TTregraObsAutoTabelas read GetTabela write SetTabela;
  end;
  
  [Entity]
  [Table('TREGRA_OBS_DI')]
  [Id('FCdRegra', TIdGenerator.IdentityOrSequence)]
  TTregraObsDi = class
  private
    [Column('CD_REGRA', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCdRegra: Integer;
    
    [Column('NM_REGRA', [], 100)]
    FNmRegra: Nullable<string>;
    
    [Column('CD_GRUPO', [], 3)]
    FCdGrupo: Nullable<string>;
    
    [Column('NM_TABELA_REGRA', [], 50)]
    FNmTabelaRegra: Nullable<string>;
    
    [Column('NM_CAMPO_REGRA', [], 50)]
    FNmCampoRegra: Nullable<string>;
    
    [Column('NM_TABELA_ORIGEM', [], 50)]
    FNmTabelaOrigem: Nullable<string>;
    
    [Column('NM_CAMPO_ORIGEM', [], 50)]
    FNmCampoOrigem: Nullable<string>;
    
    [Column('NM_VALOR_CAMPO', [], 50)]
    FNmValorCampo: Nullable<string>;
    
    [Column('CD_OBSERVACAO', [], 4)]
    FCdObservacao: Nullable<string>;
    
    [Column('CD_REGRA_RELACIONADA', [])]
    FCdRegraRelacionada: Nullable<Integer>;
  public
    property CdRegra: Integer read FCdRegra write FCdRegra;
    property NmRegra: Nullable<string> read FNmRegra write FNmRegra;
    property CdGrupo: Nullable<string> read FCdGrupo write FCdGrupo;
    property NmTabelaRegra: Nullable<string> read FNmTabelaRegra write FNmTabelaRegra;
    property NmCampoRegra: Nullable<string> read FNmCampoRegra write FNmCampoRegra;
    property NmTabelaOrigem: Nullable<string> read FNmTabelaOrigem write FNmTabelaOrigem;
    property NmCampoOrigem: Nullable<string> read FNmCampoOrigem write FNmCampoOrigem;
    property NmValorCampo: Nullable<string> read FNmValorCampo write FNmValorCampo;
    property CdObservacao: Nullable<string> read FCdObservacao write FCdObservacao;
    property CdRegraRelacionada: Nullable<Integer> read FCdRegraRelacionada write FCdRegraRelacionada;
  end;
  
  [Entity]
  [Table('TREG_TRIBUTARIO')]
  [UniqueKey('CODIGO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTregTributario = class
  private
    [Column('CODIGO', [TColumnProp.Required], 1)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 120)]
    FDescricao: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TSERVICO')]
  [Id('FCdServico', TIdGenerator.None)]
  TTservico = class
  private
    [Column('CD_SERVICO', [TColumnProp.Required], 3)]
    FCdServico: string;
    
    [Column('NM_SERVICO', [TColumnProp.Required], 50)]
    FNmServico: string;
    
    [Column('CD_CLASSIFICACAO', [], 2)]
    FCdClassificacao: Nullable<string>;
    
    [Column('CD_VIA_TRANSPORTE', [], 2)]
    FCdViaTransporte: Nullable<string>;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Column('IN_CHECK', [TColumnProp.Required], 1)]
    FInCheck: string;
  public
    property CdServico: string read FCdServico write FCdServico;
    property NmServico: string read FNmServico write FNmServico;
    property CdClassificacao: Nullable<string> read FCdClassificacao write FCdClassificacao;
    property CdViaTransporte: Nullable<string> read FCdViaTransporte write FCdViaTransporte;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property InCheck: string read FInCheck write FInCheck;
  end;
  
  [Entity]
  [Table('TSERVICO_NOVO')]
  [Id('FCdServico', TIdGenerator.IdentityOrSequence)]
  TTservicoNovo = class
  private
    [Column('CD_SERVICO', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FCdServico: Integer;
    
    [Column('NM_SERVICO', [TColumnProp.Required], 50)]
    FNmServico: string;
    
    [Column('CD_CLASSIFICACAO', [], 2)]
    FCdClassificacao: Nullable<string>;
    
    [Column('CD_VIA_TRANSPORTE', [], 2)]
    FCdViaTransporte: Nullable<string>;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Column('IN_CHECK', [TColumnProp.Required], 1)]
    FInCheck: string;
  public
    property CdServico: Integer read FCdServico write FCdServico;
    property NmServico: string read FNmServico write FNmServico;
    property CdClassificacao: Nullable<string> read FCdClassificacao write FCdClassificacao;
    property CdViaTransporte: Nullable<string> read FCdViaTransporte write FCdViaTransporte;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property InCheck: string read FInCheck write FInCheck;
  end;
  
  [Entity]
  [Table('TTP_ACORDO_TARIF')]
  [Id('FCdTipoAcordoTar', TIdGenerator.None)]
  TTtpAcordoTarif = class
  private
    [Column('CD_TIPO_ACORDO_TAR', [TColumnProp.Required], 1)]
    FCdTipoAcordoTar: string;
    
    [Column('DESCRICAO', [], 20)]
    FDescricao: Nullable<string>;
  public
    property CdTipoAcordoTar: string read FCdTipoAcordoTar write FCdTipoAcordoTar;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TTP_CNTR')]
  [Id('FTpCntr', TIdGenerator.None)]
  TTtpCntr = class
  private
    [Column('TP_CNTR', [TColumnProp.Required], 2)]
    FTpCntr: string;
    
    [Column('NM_TP_CNTR', [TColumnProp.Required], 20)]
    FNmTpCntr: string;
    
    [Column('CD_ISO', [], 4)]
    FCdIso: Nullable<string>;
  public
    property TpCntr: string read FTpCntr write FTpCntr;
    property NmTpCntr: string read FNmTpCntr write FNmTpCntr;
    property CdIso: Nullable<string> read FCdIso write FCdIso;
  end;
  
  [Entity]
  [Table('TTP_COMENTARIOS_INTTRA')]
  [Id('FCdComentarioInntra', TIdGenerator.None)]
  TTtpComentariosInttra = class
  private
    [Column('CD_COMENTARIO_INNTRA', [TColumnProp.Required], 2)]
    FCdComentarioInntra: string;
    
    [Column('DESCRICAO', [], 130)]
    FDescricao: Nullable<string>;
  public
    property CdComentarioInntra: string read FCdComentarioInntra write FCdComentarioInntra;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TTP_EMBALAGEM_INTTRA')]
  [Id('FCdEmbalagem', TIdGenerator.None)]
  TTtpEmbalagemInttra = class
  private
    [Column('CD_EMBALAGEM', [TColumnProp.Required])]
    FCdEmbalagem: Integer;
    
    [Column('NM_EMBALAGEM', [], 100)]
    FNmEmbalagem: Nullable<string>;
    
    [Column('CD_EDIFACT', [], 2)]
    FCdEdifact: Nullable<string>;
    
    [Column('CD_ANSI', [], 3)]
    FCdAnsi: Nullable<string>;
  public
    property CdEmbalagem: Integer read FCdEmbalagem write FCdEmbalagem;
    property NmEmbalagem: Nullable<string> read FNmEmbalagem write FNmEmbalagem;
    property CdEdifact: Nullable<string> read FCdEdifact write FCdEdifact;
    property CdAnsi: Nullable<string> read FCdAnsi write FCdAnsi;
  end;
  
  [Entity]
  [Table('TTP_EXONERACAO')]
  [Id('FCdEx', TIdGenerator.None)]
  TTtpExoneracao = class
  private
    [Column('CD_EX', [TColumnProp.Required], 3)]
    FCdEx: string;
    
    [Column('NM_EX', [TColumnProp.Required], 30)]
    FNmEx: string;
    
    [Column('CD_TRIB', [TColumnProp.Required], 1)]
    FCdTrib: string;
    
    [Column('NM_FUND_LEGAL', [], 240)]
    FNmFundLegal: Nullable<string>;
  public
    property CdEx: string read FCdEx write FCdEx;
    property NmEx: string read FNmEx write FNmEx;
    property CdTrib: string read FCdTrib write FCdTrib;
    property NmFundLegal: Nullable<string> read FNmFundLegal write FNmFundLegal;
  end;
  
  [Entity]
  [Table('TTP_FRETE')]
  [Id('FCodigo', TIdGenerator.None)]
  TTtpFrete = class
  private
    [Column('CODIGO', [TColumnProp.Required], 1)]
    FCodigo: string;
    
    [Column('DESCRICAO', [TColumnProp.Required], 30)]
    FDescricao: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TTP_MOVIMENTO_INTTRA')]
  [Id('FCdMovimentoInttra', TIdGenerator.None)]
  TTtpMovimentoInttra = class
  private
    [Column('CD_MOVIMENTO_INTTRA', [TColumnProp.Required])]
    FCdMovimentoInttra: Integer;
    
    [Column('DESCRICAO', [], 10)]
    FDescricao: Nullable<string>;
  public
    property CdMovimentoInttra: Integer read FCdMovimentoInttra write FCdMovimentoInttra;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TTP_PROCESSO_VINCULADO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTtpProcessoVinculado = class
  private
    [Column('CODIGO', [TColumnProp.Required], 1)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 25)]
    FDescricao: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TTP_TAXAS_INTTRA')]
  [Id('FCdTaxaInttra', TIdGenerator.None)]
  TTtpTaxasInttra = class
  private
    [Column('CD_TAXA_INTTRA', [TColumnProp.Required])]
    FCdTaxaInttra: Integer;
    
    [Column('DESCRICAO', [], 50)]
    FDescricao: Nullable<string>;
  public
    property CdTaxaInttra: Integer read FCdTaxaInttra write FCdTaxaInttra;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('TUNID_MEDIDA_BROKER')]
  [Id('FCdUnidMedida', TIdGenerator.None)]
  TTunidMedidaBroker = class
  private
    [Column('CD_UNID_MEDIDA', [TColumnProp.Required], 3)]
    FCdUnidMedida: string;
    
    [Column('NM_UNID_MEDIDA', [TColumnProp.Required], 50)]
    FNmUnidMedida: string;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Column('CD_GIPLITE', [], 2)]
    FCdGiplite: Nullable<string>;
    
    [Column('NM_SIGLA', [], 3)]
    FNmSigla: Nullable<string>;
    
    [Column('CD_SCX_EXP', [], 2)]
    FCdScxExp: Nullable<string>;
    
    [Column('NM_UNID_MEDIDA_ING', [], 50)]
    FNmUnidMedidaIng: Nullable<string>;
    
    [Column('NM_UNID_MEDIDA_ESP', [], 50)]
    FNmUnidMedidaEsp: Nullable<string>;
    
    [Column('NM_SIGLA_ING', [], 3)]
    FNmSiglaIng: Nullable<string>;
    
    [Column('NM_SIGLA_ESP', [], 3)]
    FNmSiglaEsp: Nullable<string>;
  public
    property CdUnidMedida: string read FCdUnidMedida write FCdUnidMedida;
    property NmUnidMedida: string read FNmUnidMedida write FNmUnidMedida;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property CdGiplite: Nullable<string> read FCdGiplite write FCdGiplite;
    property NmSigla: Nullable<string> read FNmSigla write FNmSigla;
    property CdScxExp: Nullable<string> read FCdScxExp write FCdScxExp;
    property NmUnidMedidaIng: Nullable<string> read FNmUnidMedidaIng write FNmUnidMedidaIng;
    property NmUnidMedidaEsp: Nullable<string> read FNmUnidMedidaEsp write FNmUnidMedidaEsp;
    property NmSiglaIng: Nullable<string> read FNmSiglaIng write FNmSiglaIng;
    property NmSiglaEsp: Nullable<string> read FNmSiglaEsp write FNmSiglaEsp;
  end;
  
  [Entity]
  [Table('TUNID_NEG')]
  [Id('FCdUnidNeg', TIdGenerator.None)]
  TTunidNeg = class
  private
    [Column('CD_UNID_NEG', [TColumnProp.Required], 2)]
    FCdUnidNeg: string;
    
    [Column('NM_UNID_NEG', [TColumnProp.Required], 50)]
    FNmUnidNeg: string;
    
    [Column('AP_UNID_NEG', [TColumnProp.Required], 10)]
    FApUnidNeg: string;
    
    [Column('IN_ATIVO', [TColumnProp.Required], 1)]
    FInAtivo: string;
  public
    property CdUnidNeg: string read FCdUnidNeg write FCdUnidNeg;
    property NmUnidNeg: string read FNmUnidNeg write FNmUnidNeg;
    property ApUnidNeg: string read FApUnidNeg write FApUnidNeg;
    property InAtivo: string read FInAtivo write FInAtivo;
  end;
  
  [Entity]
  [Table('TURF')]
  [UniqueKey('CODIGO')]
  [Id('FCodigo', TIdGenerator.None)]
  TTurf = class
  private
    [Column('CODIGO', [TColumnProp.Required], 7)]
    FCodigo: string;
    
    [Column('DESCRICAO', [], 120)]
    FDescricao: Nullable<string>;
    
    [Column('CD_DIGITO', [], 1)]
    FCdDigito: Nullable<string>;
    
    [Column('END_UF', [], 2)]
    FEndUf: Nullable<string>;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
    property CdDigito: Nullable<string> read FCdDigito write FCdDigito;
    property EndUf: Nullable<string> read FEndUf write FEndUf;
  end;
  
  [Entity]
  [Table('TUSUARIO')]
  [Id('FCdUsuario', TIdGenerator.None)]
  TTusuario = class
  private
    [Column('CD_USUARIO', [TColumnProp.Required], 4)]
    FCdUsuario: string;
    
    [Column('CD_SENHA', [], 10)]
    FCdSenha: Nullable<string>;
    
    [Column('CD_CARGO', [TColumnProp.Required], 3)]
    FCdCargo: string;
    
    [Column('NM_USUARIO', [TColumnProp.Required], 50)]
    FNmUsuario: string;
    
    [Column('AP_USUARIO', [TColumnProp.Required], 15)]
    FApUsuario: string;
    
    [Column('IN_ATIVO', [TColumnProp.Required], 1)]
    FInAtivo: string;
    
    [Column('NM_EMAIL', [], 2000)]
    FNmEmail: Nullable<string>;
  public
    property CdUsuario: string read FCdUsuario write FCdUsuario;
    property CdSenha: Nullable<string> read FCdSenha write FCdSenha;
    property CdCargo: string read FCdCargo write FCdCargo;
    property NmUsuario: string read FNmUsuario write FNmUsuario;
    property ApUsuario: string read FApUsuario write FApUsuario;
    property InAtivo: string read FInAtivo write FInAtivo;
    property NmEmail: Nullable<string> read FNmEmail write FNmEmail;
  end;
  
  [Entity]
  [Table('TVIAGEM')]
  [Id('FCdUnidNeg', TIdGenerator.None)]
  [Id('FCdProduto', TIdGenerator.None)]
  [Id('FCdEmbarcacao', TIdGenerator.None)]
  [Id('FNrViagem', TIdGenerator.None)]
  TTviagem = class
  private
    [Column('CD_UNID_NEG', [TColumnProp.Required], 2)]
    FCdUnidNeg: string;
    
    [Column('CD_PRODUTO', [TColumnProp.Required], 2)]
    FCdProduto: string;
    
    [Column('CD_EMBARCACAO', [TColumnProp.Required], 4)]
    FCdEmbarcacao: string;
    
    [Column('NR_VIAGEM', [TColumnProp.Required], 4)]
    FNrViagem: string;
    
    [Column('CD_LOCAL', [TColumnProp.Required], 4)]
    FCdLocal: string;
    
    [Column('NR_VIAGEM_ARMADOR', [], 15)]
    FNrViagemArmador: Nullable<string>;
    
    [Column('DT_CRIACAO_VIAGEM', [])]
    FDtCriacaoViagem: Nullable<TDateTime>;
  public
    property CdUnidNeg: string read FCdUnidNeg write FCdUnidNeg;
    property CdProduto: string read FCdProduto write FCdProduto;
    property CdEmbarcacao: string read FCdEmbarcacao write FCdEmbarcacao;
    property NrViagem: string read FNrViagem write FNrViagem;
    property CdLocal: string read FCdLocal write FCdLocal;
    property NrViagemArmador: Nullable<string> read FNrViagemArmador write FNrViagemArmador;
    property DtCriacaoViagem: Nullable<TDateTime> read FDtCriacaoViagem write FDtCriacaoViagem;
  end;
  
  [Entity]
  [Table('TVIA_TRANSPORTE')]
  [Id('FCdViaTransporte', TIdGenerator.None)]
  TTviaTransporte = class
  private
    [Column('CD_VIA_TRANSPORTE', [TColumnProp.Required], 2)]
    FCdViaTransporte: string;
    
    [Column('NM_VIA_TRANSPORTE', [], 20)]
    FNmViaTransporte: Nullable<string>;
  public
    property CdViaTransporte: string read FCdViaTransporte write FCdViaTransporte;
    property NmViaTransporte: Nullable<string> read FNmViaTransporte write FNmViaTransporte;
  end;
  
  [Entity]
  [Table('VW_RESUMO_DI')]
  [Id('FNrProcessoCompleto', TIdGenerator.None)]
  TVwResumoDi = class
  private
    [Column('NR_PROCESSO_COMPLETO', [TColumnProp.Required], 18)]
    FNrProcessoCompleto: string;
    
    [Column('NR_PROCESSO', [], 14)]
    FNrProcesso: Nullable<string>;
    
    [Column('VL_TOTAL_II', [])]
    FVlTotalIi: Nullable<Double>;
    
    [Column('VL_TOTAL_IPI', [])]
    FVlTotalIpi: Nullable<Double>;
    
    [Column('VL_TOT_ICMS', [])]
    FVlTotIcms: Nullable<Double>;
    
    [Column('VL_TRIBUTO_PAGO', [])]
    FVlTributoPago: Nullable<Double>;
    
    [Column('VL_PIS', [])]
    FVlPis: Nullable<Double>;
    
    [Column('VL_COFINS', [])]
    FVlCofins: Nullable<Double>;
    
    [Column('VL_ICMS_A_RECOLHER_AFRMM', [])]
    FVlIcmsARecolherAfrmm: Nullable<Double>;
    
    [Column('VL_AFRMM', [])]
    FVlAfrmm: Nullable<Double>;
    
    [Column('VL_TOTAL_ANTIDUMPING', [])]
    FVlTotalAntidumping: Nullable<Double>;
    
    [Column('VL_IMPOSTOS', [])]
    FVlImpostos: Nullable<Double>;
    
    [Column('VL_ICMS_ACRESCIMOS', [])]
    FVlIcmsAcrescimos: Nullable<Double>;
  public
    property NrProcessoCompleto: string read FNrProcessoCompleto write FNrProcessoCompleto;
    property NrProcesso: Nullable<string> read FNrProcesso write FNrProcesso;
    property VlTotalIi: Nullable<Double> read FVlTotalIi write FVlTotalIi;
    property VlTotalIpi: Nullable<Double> read FVlTotalIpi write FVlTotalIpi;
    property VlTotIcms: Nullable<Double> read FVlTotIcms write FVlTotIcms;
    property VlTributoPago: Nullable<Double> read FVlTributoPago write FVlTributoPago;
    property VlPis: Nullable<Double> read FVlPis write FVlPis;
    property VlCofins: Nullable<Double> read FVlCofins write FVlCofins;
    property VlIcmsARecolherAfrmm: Nullable<Double> read FVlIcmsARecolherAfrmm write FVlIcmsARecolherAfrmm;
    property VlAfrmm: Nullable<Double> read FVlAfrmm write FVlAfrmm;
    property VlTotalAntidumping: Nullable<Double> read FVlTotalAntidumping write FVlTotalAntidumping;
    property VlImpostos: Nullable<Double> read FVlImpostos write FVlImpostos;
    property VlIcmsAcrescimos: Nullable<Double> read FVlIcmsAcrescimos write FVlIcmsAcrescimos;
  end;
  
  [Entity]
  [Table('VW_SERVICO_GERAL')]
  [Id('FCdServico', TIdGenerator.None)]
  TVwServicoGeral = class
  private
    [Column('CD_SERVICO', [TColumnProp.Required], 3)]
    FCdServico: string;
    
    [Column('NM_SERVICO', [], 50)]
    FNmServico: Nullable<string>;
    
    [Column('CD_VIA_TRANSPORTE', [], 2)]
    FCdViaTransporte: Nullable<string>;
    
    [Column('IN_ATIVO', [], 1)]
    FInAtivo: Nullable<string>;
    
    [Column('IN_NOVO_SERVICO', [])]
    FInNovoServico: Nullable<Integer>;
  public
    property CdServico: string read FCdServico write FCdServico;
    property NmServico: Nullable<string> read FNmServico write FNmServico;
    property CdViaTransporte: Nullable<string> read FCdViaTransporte write FCdViaTransporte;
    property InAtivo: Nullable<string> read FInAtivo write FInAtivo;
    property InNovoServico: Nullable<Integer> read FInNovoServico write FInNovoServico;
  end;
  
  TDicDictionary = class
  private
    FTagente: TTagenteTableDictionary;
    FTarmazem: TTarmazemTableDictionary;
    FTdespachante: TTdespachanteTableDictionary;
    FTdespachanteCliente: TTdespachanteClienteTableDictionary;
    FTembalagem: TTembalagemTableDictionary;
    FTembarcacao: TTembarcacaoTableDictionary;
    FTempresaEst: TTempresaEstTableDictionary;
    FTempresaEstGrupo: TTempresaEstGrupoTableDictionary;
    FTempresaNac: TTempresaNacTableDictionary;
    FTenquadOp: TTenquadOpTableDictionary;
    FTfollowup: TTfollowupTableDictionary;
    FTfundLegRegTribut: TTfundLegRegTributTableDictionary;
    FTgrupo: TTgrupoTableDictionary;
    FTincotermsVenda: TTincotermsVendaTableDictionary;
    FTlocalEmbarque: TTlocalEmbarqueTableDictionary;
    FTmercadoria: TTmercadoriaTableDictionary;
    FTmercadoriaExp: TTmercadoriaExpTableDictionary;
    FTmoedaBroker: TTmoedaBrokerTableDictionary;
    FTncm: TTncmTableDictionary;
    FTncmExp: TTncmExpTableDictionary;
    FTobservacoes: TTobservacoesTableDictionary;
    FTpais: TTpaisTableDictionary;
    FTpaisBroker: TTpaisBrokerTableDictionary;
    FTprocesso: TTprocessoTableDictionary;
    FTprocessoCntr: TTprocessoCntrTableDictionary;
    FTprocessoExp: TTprocessoExpTableDictionary;
    FTprocessoExpItem: TTprocessoExpItemTableDictionary;
    FTprocessoExpNf: TTprocessoExpNfTableDictionary;
    FTprocessoExpNfItem: TTprocessoExpNfItemTableDictionary;
    FTproduto: TTprodutoTableDictionary;
    FTrecAlfandegado: TTrecAlfandegadoTableDictionary;
    FTrefCliente: TTrefClienteTableDictionary;
    FTregTributario: TTregTributarioTableDictionary;
    FTservico: TTservicoTableDictionary;
    FTservicoNovo: TTservicoNovoTableDictionary;
    FTtpAcordoTarif: TTtpAcordoTarifTableDictionary;
    FTtpCntr: TTtpCntrTableDictionary;
    FTtpEmbalagemInttra: TTtpEmbalagemInttraTableDictionary;
    FTtpExoneracao: TTtpExoneracaoTableDictionary;
    FTtpFrete: TTtpFreteTableDictionary;
    FTtpProcessoVinculado: TTtpProcessoVinculadoTableDictionary;
    FTunidMedidaBroker: TTunidMedidaBrokerTableDictionary;
    FTunidNeg: TTunidNegTableDictionary;
    FTurf: TTurfTableDictionary;
    FTusuario: TTusuarioTableDictionary;
    FTviaTransporte: TTviaTransporteTableDictionary;
    FTviagem: TTviagemTableDictionary;
    FTregraObsDi: TTregraObsDiTableDictionary;
    FTprocessoExpNfItemEnquadramento: TTprocessoExpNfItemEnquadramentoTableDictionary;
    FTprocessoExpNfItemNfDrawback: TTProcessoExpNfItemNfDrawbackTableDictionary;
    FTncmExpDestaque: TTncmExpDestaqueTableDictionary;
    FTratamentoPrioritario: TTratamentoPrioritarioTableDictionary;
    FTprocessoExpNfItemLpco: TTprocessoExpNfItemLpcoTableDictionary;
    FTprocessoExpNfItemNotaReferenciada: TTprocessoExpNfItemNotaReferenciadaTableDictionary;
    FTregraObsAuto: TTregraObsAutoTableDictionary;
    FTregraObsAutoItem: TTregraObsAutoItemTableDictionary;
    FTregraObsAutoTabelas: TTregraObsAutoTabelasTableDictionary;
    FTregraObsAutoTabelasCampos: TTregraObsAutoTabelasCamposTableDictionary;
    FTprocessoExpNfItemNfComplementar: TTprocessoExpNfItemNfComplementarTableDictionary;
    FVwResumoDi: TVwResumoDiTableDictionary;
    FVwServicoGeral: TVwServicoGeralTableDictionary;
    FTncmExpAtributo: TTncmExpAtributoTableDictionary;
    FTncmExpAtributoValor: TTncmExpAtributoValorTableDictionary;
    FTprocessoExpNfItemNcmAtributo: TTprocessoExpNfItemNcmAtributoTableDictionary;
    FTprocessoDraftBl: TTprocessoDraftBlTableDictionary;
    FTprocessoDraftCntr: TTprocessoDraftCntrTableDictionary;
    FTprocessoDraftMerc: TTprocessoDraftMercTableDictionary;
    FTprocessoDraftMercCntr: TTprocessoDraftMercCntrTableDictionary;
    FTtpTaxasInttra: TTtpTaxasInttraTableDictionary;
    FTprocessoDraftComentarios: TTprocessoDraftComentariosTableDictionary;
    FTtpComentariosInttra: TTtpComentariosInttraTableDictionary;
    FTtpMovimentoInttra: TTtpMovimentoInttraTableDictionary;
    FTprocessoExpItemContainer: TTprocessoExpItemContainerTableDictionary;
    FTdescricaoMercadoriaDraft: TTdescricaoMercadoriaDraftTableDictionary;
    function GetTagente: TTagenteTableDictionary;
    function GetTarmazem: TTarmazemTableDictionary;
    function GetTdespachante: TTdespachanteTableDictionary;
    function GetTdespachanteCliente: TTdespachanteClienteTableDictionary;
    function GetTembalagem: TTembalagemTableDictionary;
    function GetTembarcacao: TTembarcacaoTableDictionary;
    function GetTempresaEst: TTempresaEstTableDictionary;
    function GetTempresaEstGrupo: TTempresaEstGrupoTableDictionary;
    function GetTempresaNac: TTempresaNacTableDictionary;
    function GetTenquadOp: TTenquadOpTableDictionary;
    function GetTfollowup: TTfollowupTableDictionary;
    function GetTfundLegRegTribut: TTfundLegRegTributTableDictionary;
    function GetTgrupo: TTgrupoTableDictionary;
    function GetTincotermsVenda: TTincotermsVendaTableDictionary;
    function GetTlocalEmbarque: TTlocalEmbarqueTableDictionary;
    function GetTmercadoria: TTmercadoriaTableDictionary;
    function GetTmercadoriaExp: TTmercadoriaExpTableDictionary;
    function GetTmoedaBroker: TTmoedaBrokerTableDictionary;
    function GetTncm: TTncmTableDictionary;
    function GetTncmExp: TTncmExpTableDictionary;
    function GetTobservacoes: TTobservacoesTableDictionary;
    function GetTpais: TTpaisTableDictionary;
    function GetTpaisBroker: TTpaisBrokerTableDictionary;
    function GetTprocesso: TTprocessoTableDictionary;
    function GetTprocessoCntr: TTprocessoCntrTableDictionary;
    function GetTprocessoExp: TTprocessoExpTableDictionary;
    function GetTprocessoExpItem: TTprocessoExpItemTableDictionary;
    function GetTprocessoExpNf: TTprocessoExpNfTableDictionary;
    function GetTprocessoExpNfItem: TTprocessoExpNfItemTableDictionary;
    function GetTproduto: TTprodutoTableDictionary;
    function GetTrecAlfandegado: TTrecAlfandegadoTableDictionary;
    function GetTrefCliente: TTrefClienteTableDictionary;
    function GetTregTributario: TTregTributarioTableDictionary;
    function GetTservico: TTservicoTableDictionary;
    function GetTservicoNovo: TTservicoNovoTableDictionary;
    function GetTtpAcordoTarif: TTtpAcordoTarifTableDictionary;
    function GetTtpCntr: TTtpCntrTableDictionary;
    function GetTtpEmbalagemInttra: TTtpEmbalagemInttraTableDictionary;
    function GetTtpExoneracao: TTtpExoneracaoTableDictionary;
    function GetTtpFrete: TTtpFreteTableDictionary;
    function GetTtpProcessoVinculado: TTtpProcessoVinculadoTableDictionary;
    function GetTunidMedidaBroker: TTunidMedidaBrokerTableDictionary;
    function GetTunidNeg: TTunidNegTableDictionary;
    function GetTurf: TTurfTableDictionary;
    function GetTusuario: TTusuarioTableDictionary;
    function GetTviaTransporte: TTviaTransporteTableDictionary;
    function GetTviagem: TTviagemTableDictionary;
    function GetTregraObsDi: TTregraObsDiTableDictionary;
    function GetTprocessoExpNfItemEnquadramento: TTprocessoExpNfItemEnquadramentoTableDictionary;
    function GetTprocessoExpNfItemNfDrawback: TTprocessoExpNfItemNfDrawbackTableDictionary;
    function GetTncmExpDestaque: TTncmExpDestaqueTableDictionary;
    function GetTratamentoPrioritario: TTratamentoPrioritarioTableDictionary;
    function GetTprocessoExpNfItemLpco: TTprocessoExpNfItemLpcoTableDictionary;
    function GetTprocessoExpNfItemNotaReferenciada: TTprocessoExpNfItemNotaReferenciadaTableDictionary;
    function GetTregraObsAuto: TTregraObsAutoTableDictionary;
    function GetTregraObsAutoItem: TTregraObsAutoItemTableDictionary;
    function GetTregraObsAutoTabelas: TTregraObsAutoTabelasTableDictionary;
    function GetTregraObsAutoTabelasCampos: TTregraObsAutoTabelasCamposTableDictionary;
    function GetTprocessoExpNfItemNfComplementar: TTprocessoExpNfItemNfComplementarTableDictionary;
    function GetVwResumoDi: TVwResumoDiTableDictionary;
    function GetVwServicoGeral: TVwServicoGeralTableDictionary;
    function GetTncmExpAtributo: TTncmExpAtributoTableDictionary;
    function GetTncmExpAtributoValor: TTncmExpAtributoValorTableDictionary;
    function GetTprocessoExpNfItemNcmAtributo: TTprocessoExpNfItemNcmAtributoTableDictionary;
    function GetTprocessoDraftBl: TTprocessoDraftBlTableDictionary;
    function GetTprocessoDraftCntr: TTprocessoDraftCntrTableDictionary;
    function GetTprocessoDraftMerc: TTprocessoDraftMercTableDictionary;
    function GetTprocessoDraftMercCntr: TTprocessoDraftMercCntrTableDictionary;
    function GetTtpTaxasInttra: TTtpTaxasInttraTableDictionary;
    function GetTprocessoDraftComentarios: TTprocessoDraftComentariosTableDictionary;
    function GetTtpComentariosInttra: TTtpComentariosInttraTableDictionary;
    function GetTtpMovimentoInttra: TTtpMovimentoInttraTableDictionary;
    function GetTprocessoExpItemContainer: TTprocessoExpItemContainerTableDictionary;
    function GetTdescricaoMercadoriaDraft: TTdescricaoMercadoriaDraftTableDictionary;
  public
    destructor Destroy; override;
    property Tagente: TTagenteTableDictionary read GetTagente;
    property Tarmazem: TTarmazemTableDictionary read GetTarmazem;
    property Tdespachante: TTdespachanteTableDictionary read GetTdespachante;
    property TdespachanteCliente: TTdespachanteClienteTableDictionary read GetTdespachanteCliente;
    property Tembalagem: TTembalagemTableDictionary read GetTembalagem;
    property Tembarcacao: TTembarcacaoTableDictionary read GetTembarcacao;
    property TempresaEst: TTempresaEstTableDictionary read GetTempresaEst;
    property TempresaEstGrupo: TTempresaEstGrupoTableDictionary read GetTempresaEstGrupo;
    property TempresaNac: TTempresaNacTableDictionary read GetTempresaNac;
    property TenquadOp: TTenquadOpTableDictionary read GetTenquadOp;
    property Tfollowup: TTfollowupTableDictionary read GetTfollowup;
    property TfundLegRegTribut: TTfundLegRegTributTableDictionary read GetTfundLegRegTribut;
    property Tgrupo: TTgrupoTableDictionary read GetTgrupo;
    property TincotermsVenda: TTincotermsVendaTableDictionary read GetTincotermsVenda;
    property TlocalEmbarque: TTlocalEmbarqueTableDictionary read GetTlocalEmbarque;
    property Tmercadoria: TTmercadoriaTableDictionary read GetTmercadoria;
    property TmercadoriaExp: TTmercadoriaExpTableDictionary read GetTmercadoriaExp;
    property TmoedaBroker: TTmoedaBrokerTableDictionary read GetTmoedaBroker;
    property Tncm: TTncmTableDictionary read GetTncm;
    property TncmExp: TTncmExpTableDictionary read GetTncmExp;
    property Tobservacoes: TTobservacoesTableDictionary read GetTobservacoes;
    property Tpais: TTpaisTableDictionary read GetTpais;
    property TpaisBroker: TTpaisBrokerTableDictionary read GetTpaisBroker;
    property Tprocesso: TTprocessoTableDictionary read GetTprocesso;
    property TprocessoCntr: TTprocessoCntrTableDictionary read GetTprocessoCntr;
    property TprocessoExp: TTprocessoExpTableDictionary read GetTprocessoExp;
    property TprocessoExpItem: TTprocessoExpItemTableDictionary read GetTprocessoExpItem;
    property TprocessoExpNf: TTprocessoExpNfTableDictionary read GetTprocessoExpNf;
    property TprocessoExpNfItem: TTprocessoExpNfItemTableDictionary read GetTprocessoExpNfItem;
    property Tproduto: TTprodutoTableDictionary read GetTproduto;
    property TrecAlfandegado: TTrecAlfandegadoTableDictionary read GetTrecAlfandegado;
    property TrefCliente: TTrefClienteTableDictionary read GetTrefCliente;
    property TregTributario: TTregTributarioTableDictionary read GetTregTributario;
    property Tservico: TTservicoTableDictionary read GetTservico;
    property TservicoNovo: TTservicoNovoTableDictionary read GetTservicoNovo;
    property TtpAcordoTarif: TTtpAcordoTarifTableDictionary read GetTtpAcordoTarif;
    property TtpCntr: TTtpCntrTableDictionary read GetTtpCntr;
    property TtpEmbalagemInttra: TTtpEmbalagemInttraTableDictionary read GetTtpEmbalagemInttra;
    property TtpExoneracao: TTtpExoneracaoTableDictionary read GetTtpExoneracao;
    property TtpFrete: TTtpFreteTableDictionary read GetTtpFrete;
    property TtpProcessoVinculado: TTtpProcessoVinculadoTableDictionary read GetTtpProcessoVinculado;
    property TunidMedidaBroker: TTunidMedidaBrokerTableDictionary read GetTunidMedidaBroker;
    property TunidNeg: TTunidNegTableDictionary read GetTunidNeg;
    property Turf: TTurfTableDictionary read GetTurf;
    property Tusuario: TTusuarioTableDictionary read GetTusuario;
    property TviaTransporte: TTviaTransporteTableDictionary read GetTviaTransporte;
    property Tviagem: TTviagemTableDictionary read GetTviagem;
    property TregraObsDi: TTregraObsDiTableDictionary read GetTregraObsDi;
    property TprocessoExpNfItemEnquadramento: TTprocessoExpNfItemEnquadramentoTableDictionary read GetTprocessoExpNfItemEnquadramento;
    property TprocessoExpNfItemNfDrawback: TTprocessoExpNfItemNfDrawbackTableDictionary read GetTprocessoExpNfItemNfDrawback;
    property TncmExpDestaque: TTncmExpDestaqueTableDictionary read GetTncmExpDestaque;
    property TratamentoPrioritario: TTratamentoPrioritarioTableDictionary read GetTratamentoPrioritario;
    property TprocessoExpNfItemLpco: TTprocessoExpNfItemLpcoTableDictionary read GetTprocessoExpNfItemLpco;
    property TprocessoExpNfItemNotaReferenciada: TTprocessoExpNfItemNotaReferenciadaTableDictionary read GetTprocessoExpNfItemNotaReferenciada;
    property TregraObsAuto: TTregraObsAutoTableDictionary read GetTregraObsAuto;
    property TregraObsAutoItem: TTregraObsAutoItemTableDictionary read GetTregraObsAutoItem;
    property TregraObsAutoTabelas: TTregraObsAutoTabelasTableDictionary read GetTregraObsAutoTabelas;
    property TregraObsAutoTabelasCampos: TTregraObsAutoTabelasCamposTableDictionary read GetTregraObsAutoTabelasCampos;
    property TprocessoExpNfItemNfComplementar: TTprocessoExpNfItemNfComplementarTableDictionary read GetTprocessoExpNfItemNfComplementar;
    property VwResumoDi: TVwResumoDiTableDictionary read GetVwResumoDi;
    property VwServicoGeral: TVwServicoGeralTableDictionary read GetVwServicoGeral;
    property TncmExpAtributo: TTncmExpAtributoTableDictionary read GetTncmExpAtributo;
    property TncmExpAtributoValor: TTncmExpAtributoValorTableDictionary read GetTncmExpAtributoValor;
    property TprocessoExpNfItemNcmAtributo: TTprocessoExpNfItemNcmAtributoTableDictionary read GetTprocessoExpNfItemNcmAtributo;
    property TprocessoDraftBl: TTprocessoDraftBlTableDictionary read GetTprocessoDraftBl;
    property TprocessoDraftCntr: TTprocessoDraftCntrTableDictionary read GetTprocessoDraftCntr;
    property TprocessoDraftMerc: TTprocessoDraftMercTableDictionary read GetTprocessoDraftMerc;
    property TprocessoDraftMercCntr: TTprocessoDraftMercCntrTableDictionary read GetTprocessoDraftMercCntr;
    property TtpTaxasInttra: TTtpTaxasInttraTableDictionary read GetTtpTaxasInttra;
    property TprocessoDraftComentarios: TTprocessoDraftComentariosTableDictionary read GetTprocessoDraftComentarios;
    property TtpComentariosInttra: TTtpComentariosInttraTableDictionary read GetTtpComentariosInttra;
    property TtpMovimentoInttra: TTtpMovimentoInttraTableDictionary read GetTtpMovimentoInttra;
    property TprocessoExpItemContainer: TTprocessoExpItemContainerTableDictionary read GetTprocessoExpItemContainer;
    property TdescricaoMercadoriaDraft: TTdescricaoMercadoriaDraftTableDictionary read GetTdescricaoMercadoriaDraft;
  end;
  
  TTagenteTableDictionary = class
  private
    FCdAgente: TDictionaryAttribute;
    FNmAgente: TDictionaryAttribute;
    FNrCgcAgente: TDictionaryAttribute;
    FNrSigla: TDictionaryAttribute;
    FDsEndereco: TDictionaryAttribute;
    FNrZipCode: TDictionaryAttribute;
    FDsEmail: TDictionaryAttribute;
    FEndUf: TDictionaryAttribute;
    FDsScacCode: TDictionaryAttribute;
    FCdCidade: TDictionaryAssociation;
    FPais: TDictionaryAssociation;
  public
    constructor Create;
    property CdAgente: TDictionaryAttribute read FCdAgente;
    property NmAgente: TDictionaryAttribute read FNmAgente;
    property NrCgcAgente: TDictionaryAttribute read FNrCgcAgente;
    property NrSigla: TDictionaryAttribute read FNrSigla;
    property DsEndereco: TDictionaryAttribute read FDsEndereco;
    property NrZipCode: TDictionaryAttribute read FNrZipCode;
    property DsEmail: TDictionaryAttribute read FDsEmail;
    property EndUf: TDictionaryAttribute read FEndUf;
    property DsScacCode: TDictionaryAttribute read FDsScacCode;
    property CdCidade: TDictionaryAssociation read FCdCidade;
    property Pais: TDictionaryAssociation read FPais;
  end;
  
  TTarmazemTableDictionary = class
  private
    FCdArmazem: TDictionaryAttribute;
    FNmArmazem: TDictionaryAttribute;
    FNmSigla: TDictionaryAttribute;
    FInAtracacao: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FRecintoAlfandegado: TDictionaryAssociation;
  public
    constructor Create;
    property CdArmazem: TDictionaryAttribute read FCdArmazem;
    property NmArmazem: TDictionaryAttribute read FNmArmazem;
    property NmSigla: TDictionaryAttribute read FNmSigla;
    property InAtracacao: TDictionaryAttribute read FInAtracacao;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property RecintoAlfandegado: TDictionaryAssociation read FRecintoAlfandegado;
  end;
  
  TTdespachanteTableDictionary = class
  private
    FCdDespachante: TDictionaryAttribute;
    FNmDespachante: TDictionaryAttribute;
    FApDespachante: TDictionaryAttribute;
    FVlMinSda: TDictionaryAttribute;
    FVlMaxSda: TDictionaryAttribute;
    FCdRisc: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FCdModSda: TDictionaryAttribute;
    FNrRegistro: TDictionaryAttribute;
    FCpfDespachante: TDictionaryAttribute;
    FCdDespSda: TDictionaryAttribute;
    FCdProduto: TDictionaryAttribute;
    FNmSenha: TDictionaryAttribute;
    FInConsultaSiscomex: TDictionaryAttribute;
    FCdUsuario: TDictionaryAttribute;
    FDtSenha: TDictionaryAttribute;
  public
    constructor Create;
    property CdDespachante: TDictionaryAttribute read FCdDespachante;
    property NmDespachante: TDictionaryAttribute read FNmDespachante;
    property ApDespachante: TDictionaryAttribute read FApDespachante;
    property VlMinSda: TDictionaryAttribute read FVlMinSda;
    property VlMaxSda: TDictionaryAttribute read FVlMaxSda;
    property CdRisc: TDictionaryAttribute read FCdRisc;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property CdModSda: TDictionaryAttribute read FCdModSda;
    property NrRegistro: TDictionaryAttribute read FNrRegistro;
    property CpfDespachante: TDictionaryAttribute read FCpfDespachante;
    property CdDespSda: TDictionaryAttribute read FCdDespSda;
    property CdProduto: TDictionaryAttribute read FCdProduto;
    property NmSenha: TDictionaryAttribute read FNmSenha;
    property InConsultaSiscomex: TDictionaryAttribute read FInConsultaSiscomex;
    property CdUsuario: TDictionaryAttribute read FCdUsuario;
    property DtSenha: TDictionaryAttribute read FDtSenha;
  end;
  
  TTdespachanteClienteTableDictionary = class
  private
    FTipo: TDictionaryAttribute;
    FEmpresa: TDictionaryAssociation;
    FDespachante: TDictionaryAssociation;
  public
    constructor Create;
    property Tipo: TDictionaryAttribute read FTipo;
    property Empresa: TDictionaryAssociation read FEmpresa;
    property Despachante: TDictionaryAssociation read FDespachante;
  end;
  
  TTembalagemTableDictionary = class
  private
    FCdEmbalagem: TDictionaryAttribute;
    FNmEmbalagemS: TDictionaryAttribute;
    FNmEmbalagemP: TDictionaryAttribute;
  public
    constructor Create;
    property CdEmbalagem: TDictionaryAttribute read FCdEmbalagem;
    property NmEmbalagemS: TDictionaryAttribute read FNmEmbalagemS;
    property NmEmbalagemP: TDictionaryAttribute read FNmEmbalagemP;
  end;
  
  TTembarcacaoTableDictionary = class
  private
    FCdEmbarcacao: TDictionaryAttribute;
    FNmEmbarcacao: TDictionaryAttribute;
  public
    constructor Create;
    property CdEmbarcacao: TDictionaryAttribute read FCdEmbarcacao;
    property NmEmbarcacao: TDictionaryAttribute read FNmEmbarcacao;
  end;
  
  TTempresaEstTableDictionary = class
  private
    FCdEmpresa: TDictionaryAttribute;
    FNmEmpresa: TDictionaryAttribute;
    FApEmpresa: TDictionaryAttribute;
    FEndEmpresa: TDictionaryAttribute;
    FEndNumero: TDictionaryAttribute;
    FEndCompl: TDictionaryAttribute;
    FEndCidade: TDictionaryAttribute;
    FEndEstado: TDictionaryAttribute;
    FNrTelefone: TDictionaryAttribute;
    FNrFax: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FInAgente: TDictionaryAttribute;
    FInBanco: TDictionaryAttribute;
    FInImportador: TDictionaryAttribute;
    FInSeguradora: TDictionaryAttribute;
    FInExportador: TDictionaryAttribute;
    FNrCliente: TDictionaryAttribute;
    FNmContato: TDictionaryAttribute;
    FInComprador: TDictionaryAttribute;
    FCgcEmpresa: TDictionaryAttribute;
    FInPoTrans: TDictionaryAttribute;
    FNrRuc: TDictionaryAttribute;
    FNrNit: TDictionaryAttribute;
    FNrCuit: TDictionaryAttribute;
    FPais: TDictionaryAssociation;
  public
    constructor Create;
    property CdEmpresa: TDictionaryAttribute read FCdEmpresa;
    property NmEmpresa: TDictionaryAttribute read FNmEmpresa;
    property ApEmpresa: TDictionaryAttribute read FApEmpresa;
    property EndEmpresa: TDictionaryAttribute read FEndEmpresa;
    property EndNumero: TDictionaryAttribute read FEndNumero;
    property EndCompl: TDictionaryAttribute read FEndCompl;
    property EndCidade: TDictionaryAttribute read FEndCidade;
    property EndEstado: TDictionaryAttribute read FEndEstado;
    property NrTelefone: TDictionaryAttribute read FNrTelefone;
    property NrFax: TDictionaryAttribute read FNrFax;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property InAgente: TDictionaryAttribute read FInAgente;
    property InBanco: TDictionaryAttribute read FInBanco;
    property InImportador: TDictionaryAttribute read FInImportador;
    property InSeguradora: TDictionaryAttribute read FInSeguradora;
    property InExportador: TDictionaryAttribute read FInExportador;
    property NrCliente: TDictionaryAttribute read FNrCliente;
    property NmContato: TDictionaryAttribute read FNmContato;
    property InComprador: TDictionaryAttribute read FInComprador;
    property CgcEmpresa: TDictionaryAttribute read FCgcEmpresa;
    property InPoTrans: TDictionaryAttribute read FInPoTrans;
    property NrRuc: TDictionaryAttribute read FNrRuc;
    property NrNit: TDictionaryAttribute read FNrNit;
    property NrCuit: TDictionaryAttribute read FNrCuit;
    property Pais: TDictionaryAssociation read FPais;
  end;
  
  TTempresaEstGrupoTableDictionary = class
  private
    FCdGrupo: TDictionaryAttribute;
    FEmpresaEst: TDictionaryAssociation;
  public
    constructor Create;
    property CdGrupo: TDictionaryAttribute read FCdGrupo;
    property EmpresaEst: TDictionaryAssociation read FEmpresaEst;
  end;
  
  TTempresaNacTableDictionary = class
  private
    FCdEmpresa: TDictionaryAttribute;
    FNmEmpresa: TDictionaryAttribute;
    FApEmpresa: TDictionaryAttribute;
    FEndEmpresa: TDictionaryAttribute;
    FEndNumero: TDictionaryAttribute;
    FEndCidade: TDictionaryAttribute;
    FEndBairro: TDictionaryAttribute;
    FEndUf: TDictionaryAttribute;
    FEndCep: TDictionaryAttribute;
    FCdTipoPessoa: TDictionaryAttribute;
    FCgcEmpresa: TDictionaryAttribute;
    FCpfEmpresa: TDictionaryAttribute;
    FIeEmpresa: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FInCliente: TDictionaryAttribute;
    FInImportador: TDictionaryAttribute;
    FInExportador: TDictionaryAttribute;
    FInOutros: TDictionaryAttribute;
    FInRepresentante: TDictionaryAttribute;
    FCdPaisImportador: TDictionaryAttribute;
    FInSeguradora: TDictionaryAttribute;
    FEndCompl: TDictionaryAttribute;
    FEndComplemento: TDictionaryAttribute;
    FGrupo: TDictionaryAssociation;
  public
    constructor Create;
    property CdEmpresa: TDictionaryAttribute read FCdEmpresa;
    property NmEmpresa: TDictionaryAttribute read FNmEmpresa;
    property ApEmpresa: TDictionaryAttribute read FApEmpresa;
    property EndEmpresa: TDictionaryAttribute read FEndEmpresa;
    property EndNumero: TDictionaryAttribute read FEndNumero;
    property EndCidade: TDictionaryAttribute read FEndCidade;
    property EndBairro: TDictionaryAttribute read FEndBairro;
    property EndUf: TDictionaryAttribute read FEndUf;
    property EndCep: TDictionaryAttribute read FEndCep;
    property CdTipoPessoa: TDictionaryAttribute read FCdTipoPessoa;
    property CgcEmpresa: TDictionaryAttribute read FCgcEmpresa;
    property CpfEmpresa: TDictionaryAttribute read FCpfEmpresa;
    property IeEmpresa: TDictionaryAttribute read FIeEmpresa;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property InCliente: TDictionaryAttribute read FInCliente;
    property InImportador: TDictionaryAttribute read FInImportador;
    property InExportador: TDictionaryAttribute read FInExportador;
    property InOutros: TDictionaryAttribute read FInOutros;
    property InRepresentante: TDictionaryAttribute read FInRepresentante;
    property CdPaisImportador: TDictionaryAttribute read FCdPaisImportador;
    property InSeguradora: TDictionaryAttribute read FInSeguradora;
    property EndCompl: TDictionaryAttribute read FEndCompl;
    property EndComplemento: TDictionaryAttribute read FEndComplemento;
    property Grupo: TDictionaryAssociation read FGrupo;
  end;
  
  TTenquadOpTableDictionary = class
  private
    FCdEnquadOp: TDictionaryAttribute;
    FNmEnquadOp: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
  public
    constructor Create;
    property CdEnquadOp: TDictionaryAttribute read FCdEnquadOp;
    property NmEnquadOp: TDictionaryAttribute read FNmEnquadOp;
    property InAtivo: TDictionaryAttribute read FInAtivo;
  end;
  
  TTfollowupTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FCdServico: TDictionaryAttribute;
    FCdEvento: TDictionaryAttribute;
    FInAplicavel: TDictionaryAttribute;
    FCdRespRealizacao: TDictionaryAttribute;
    FDtRealizacao: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property CdServico: TDictionaryAttribute read FCdServico;
    property CdEvento: TDictionaryAttribute read FCdEvento;
    property InAplicavel: TDictionaryAttribute read FInAplicavel;
    property CdRespRealizacao: TDictionaryAttribute read FCdRespRealizacao;
    property DtRealizacao: TDictionaryAttribute read FDtRealizacao;
  end;
  
  TTfundLegRegTributTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTgrupoTableDictionary = class
  private
    FCdGrupo: TDictionaryAttribute;
    FNmGrupo: TDictionaryAttribute;
    FDtInclusao: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FCnpjGrupo: TDictionaryAttribute;
    FDtNovoFollowupImp: TDictionaryAttribute;
    FDtNovoFollowupExp: TDictionaryAttribute;
    FNmEmailDraftBl: TDictionaryAttribute;
  public
    constructor Create;
    property CdGrupo: TDictionaryAttribute read FCdGrupo;
    property NmGrupo: TDictionaryAttribute read FNmGrupo;
    property DtInclusao: TDictionaryAttribute read FDtInclusao;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property CnpjGrupo: TDictionaryAttribute read FCnpjGrupo;
    property DtNovoFollowupImp: TDictionaryAttribute read FDtNovoFollowupImp;
    property DtNovoFollowupExp: TDictionaryAttribute read FDtNovoFollowupExp;
    property NmEmailDraftBl: TDictionaryAttribute read FNmEmailDraftBl;
  end;
  
  TTincotermsVendaTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
    FSinal: TDictionaryAttribute;
    FInTipoFrete: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
    property Sinal: TDictionaryAttribute read FSinal;
    property InTipoFrete: TDictionaryAttribute read FInTipoFrete;
  end;
  
  TTlocalEmbarqueTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
    FCdUnidNegLocal: TDictionaryAttribute;
    FCdUf: TDictionaryAttribute;
    FCdSigla: TDictionaryAttribute;
    FNmCidade: TDictionaryAttribute;
    FCdPais: TDictionaryAssociation;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
    property CdUnidNegLocal: TDictionaryAttribute read FCdUnidNegLocal;
    property CdUf: TDictionaryAttribute read FCdUf;
    property CdSigla: TDictionaryAttribute read FCdSigla;
    property NmCidade: TDictionaryAttribute read FNmCidade;
    property CdPais: TDictionaryAssociation read FCdPais;
  end;
  
  TTmercadoriaTableDictionary = class
  private
    FCdMercadoria: TDictionaryAttribute;
    FNmMercadoria: TDictionaryAttribute;
    FApMercadoria: TDictionaryAttribute;
    FCdGrupo: TDictionaryAttribute;
    FInNecessitaLi: TDictionaryAttribute;
  public
    constructor Create;
    property CdMercadoria: TDictionaryAttribute read FCdMercadoria;
    property NmMercadoria: TDictionaryAttribute read FNmMercadoria;
    property ApMercadoria: TDictionaryAttribute read FApMercadoria;
    property CdGrupo: TDictionaryAttribute read FCdGrupo;
    property InNecessitaLi: TDictionaryAttribute read FInNecessitaLi;
  end;
  
  TTmercadoriaExpTableDictionary = class
  private
    FCdMercadoria: TDictionaryAttribute;
    FNmMercadoria: TDictionaryAttribute;
    FApMercadoria: TDictionaryAttribute;
    FCdGrupo: TDictionaryAttribute;
    FInNecessitaLi: TDictionaryAttribute;
    FTxDescIngles: TDictionaryAttribute;
    FTxDescEsp: TDictionaryAttribute;
    FDescMercadoriaDraft: TDictionaryAssociation;
  public
    constructor Create;
    property CdMercadoria: TDictionaryAttribute read FCdMercadoria;
    property NmMercadoria: TDictionaryAttribute read FNmMercadoria;
    property ApMercadoria: TDictionaryAttribute read FApMercadoria;
    property CdGrupo: TDictionaryAttribute read FCdGrupo;
    property InNecessitaLi: TDictionaryAttribute read FInNecessitaLi;
    property TxDescIngles: TDictionaryAttribute read FTxDescIngles;
    property TxDescEsp: TDictionaryAttribute read FTxDescEsp;
    property DescMercadoriaDraft: TDictionaryAssociation read FDescMercadoriaDraft;
  end;
  
  TTmoedaBrokerTableDictionary = class
  private
    FCdMoeda: TDictionaryAttribute;
    FNmMoeda: TDictionaryAttribute;
    FApMoeda: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
  public
    constructor Create;
    property CdMoeda: TDictionaryAttribute read FCdMoeda;
    property NmMoeda: TDictionaryAttribute read FNmMoeda;
    property ApMoeda: TDictionaryAttribute read FApMoeda;
    property InAtivo: TDictionaryAttribute read FInAtivo;
  end;
  
  TTncmTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
    FUnidadeMedida: TDictionaryAttribute;
    FCdAtributo: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
    property UnidadeMedida: TDictionaryAttribute read FUnidadeMedida;
    property CdAtributo: TDictionaryAttribute read FCdAtributo;
  end;
  
  TTncmExpTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
    FNrSeq: TDictionaryAttribute;
    FTxNcmFatura: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
    property NrSeq: TDictionaryAttribute read FNrSeq;
    property TxNcmFatura: TDictionaryAttribute read FTxNcmFatura;
  end;
  
  TTobservacoesTableDictionary = class
  private
    FCdObs: TDictionaryAttribute;
    FCdProduto: TDictionaryAttribute;
    FTxDescricao: TDictionaryAttribute;
    FTxObs: TDictionaryAttribute;
  public
    constructor Create;
    property CdObs: TDictionaryAttribute read FCdObs;
    property CdProduto: TDictionaryAttribute read FCdProduto;
    property TxDescricao: TDictionaryAttribute read FTxDescricao;
    property TxObs: TDictionaryAttribute read FTxObs;
  end;
  
  TTpaisTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTpaisBrokerTableDictionary = class
  private
    FCdPais: TDictionaryAttribute;
    FNmPais: TDictionaryAttribute;
    FNmSiglaCrt: TDictionaryAttribute;
    FNmSigla2l: TDictionaryAttribute;
  public
    constructor Create;
    property CdPais: TDictionaryAttribute read FCdPais;
    property NmPais: TDictionaryAttribute read FNmPais;
    property NmSiglaCrt: TDictionaryAttribute read FNmSiglaCrt;
    property NmSigla2l: TDictionaryAttribute read FNmSigla2l;
  end;
  
  TTprocessoTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FDtAbertura: TDictionaryAttribute;
    FInCancelado: TDictionaryAttribute;
    FVlMleMneg: TDictionaryAttribute;
    FVlFretePrepaidMneg: TDictionaryAttribute;
    FVlSeguroMn: TDictionaryAttribute;
    FNrProcessoExpTemp: TDictionaryAttribute;
    FVlPesoLiquido: TDictionaryAttribute;
    FVlPesoBruto: TDictionaryAttribute;
    FTpProcesso: TDictionaryAttribute;
    FNrFatura: TDictionaryAttribute;
    FCdGrupo: TDictionaryAttribute;
    FCdLinguaPedido: TDictionaryAttribute;
    FCdRuc: TDictionaryAttribute;
    FCdDue: TDictionaryAttribute;
    FCdChaveAcessoDue: TDictionaryAttribute;
    FVlDescontoMn: TDictionaryAttribute;
    FVlAcrescimoMn: TDictionaryAttribute;
    FInProcessoConsolidado: TDictionaryAttribute;
    FUnidNeg: TDictionaryAssociation;
    FProduto: TDictionaryAssociation;
    FCliente: TDictionaryAssociation;
    FUsuario: TDictionaryAssociation;
    FMoedaMle: TDictionaryAssociation;
    FPaisDestino: TDictionaryAssociation;
    FDespachante: TDictionaryAssociation;
    FIncoterm: TDictionaryAssociation;
    FExportador: TDictionaryAssociation;
    FImportador: TDictionaryAssociation;
    FServico: TDictionaryAssociation;
    FAgente: TDictionaryAssociation;
    FNotify1Proc: TDictionaryAssociation;
    FNotify2Proc: TDictionaryAssociation;
    FConsignee: TDictionaryAssociation;
    FEmbarcacao: TDictionaryAssociation;
    FLocalEmbarque: TDictionaryAssociation;
    FLocalDesembarque: TDictionaryAssociation;
    FLocalEntrega: TDictionaryAssociation;
    FTpFrete: TDictionaryAssociation;
    FViagem: TDictionaryAssociation;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property DtAbertura: TDictionaryAttribute read FDtAbertura;
    property InCancelado: TDictionaryAttribute read FInCancelado;
    property VlMleMneg: TDictionaryAttribute read FVlMleMneg;
    property VlFretePrepaidMneg: TDictionaryAttribute read FVlFretePrepaidMneg;
    property VlSeguroMn: TDictionaryAttribute read FVlSeguroMn;
    property NrProcessoExpTemp: TDictionaryAttribute read FNrProcessoExpTemp;
    property VlPesoLiquido: TDictionaryAttribute read FVlPesoLiquido;
    property VlPesoBruto: TDictionaryAttribute read FVlPesoBruto;
    property TpProcesso: TDictionaryAttribute read FTpProcesso;
    property NrFatura: TDictionaryAttribute read FNrFatura;
    property CdGrupo: TDictionaryAttribute read FCdGrupo;
    property CdLinguaPedido: TDictionaryAttribute read FCdLinguaPedido;
    property CdRuc: TDictionaryAttribute read FCdRuc;
    property CdDue: TDictionaryAttribute read FCdDue;
    property CdChaveAcessoDue: TDictionaryAttribute read FCdChaveAcessoDue;
    property VlDescontoMn: TDictionaryAttribute read FVlDescontoMn;
    property VlAcrescimoMn: TDictionaryAttribute read FVlAcrescimoMn;
    property InProcessoConsolidado: TDictionaryAttribute read FInProcessoConsolidado;
    property UnidNeg: TDictionaryAssociation read FUnidNeg;
    property Produto: TDictionaryAssociation read FProduto;
    property Cliente: TDictionaryAssociation read FCliente;
    property Usuario: TDictionaryAssociation read FUsuario;
    property MoedaMle: TDictionaryAssociation read FMoedaMle;
    property PaisDestino: TDictionaryAssociation read FPaisDestino;
    property Despachante: TDictionaryAssociation read FDespachante;
    property Incoterm: TDictionaryAssociation read FIncoterm;
    property Exportador: TDictionaryAssociation read FExportador;
    property Importador: TDictionaryAssociation read FImportador;
    property Servico: TDictionaryAssociation read FServico;
    property Agente: TDictionaryAssociation read FAgente;
    property Notify1Proc: TDictionaryAssociation read FNotify1Proc;
    property Notify2Proc: TDictionaryAssociation read FNotify2Proc;
    property Consignee: TDictionaryAssociation read FConsignee;
    property Embarcacao: TDictionaryAssociation read FEmbarcacao;
    property LocalEmbarque: TDictionaryAssociation read FLocalEmbarque;
    property LocalDesembarque: TDictionaryAssociation read FLocalDesembarque;
    property LocalEntrega: TDictionaryAssociation read FLocalEntrega;
    property TpFrete: TDictionaryAssociation read FTpFrete;
    property Viagem: TDictionaryAssociation read FViagem;
  end;
  
  TTprocessoCntrTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrCntr: TDictionaryAttribute;
    FNrLacre: TDictionaryAttribute;
    FCodigo: TDictionaryAttribute;
    FVlCustoTotal: TDictionaryAttribute;
    FVlCubagem: TDictionaryAttribute;
    FNrLacreSif: TDictionaryAttribute;
    FTaraCntr: TDictionaryAttribute;
    FVlPesoBruto: TDictionaryAttribute;
    FVlPesoLiquido: TDictionaryAttribute;
    FVlQuantidadeEmbalagem: TDictionaryAttribute;
    FDsTemperatura: TDictionaryAttribute;
    FCdNcm: TDictionaryAttribute;
    FTpCntr: TDictionaryAssociation;
    FEmbalagem: TDictionaryAssociation;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrCntr: TDictionaryAttribute read FNrCntr;
    property NrLacre: TDictionaryAttribute read FNrLacre;
    property Codigo: TDictionaryAttribute read FCodigo;
    property VlCustoTotal: TDictionaryAttribute read FVlCustoTotal;
    property VlCubagem: TDictionaryAttribute read FVlCubagem;
    property NrLacreSif: TDictionaryAttribute read FNrLacreSif;
    property TaraCntr: TDictionaryAttribute read FTaraCntr;
    property VlPesoBruto: TDictionaryAttribute read FVlPesoBruto;
    property VlPesoLiquido: TDictionaryAttribute read FVlPesoLiquido;
    property VlQuantidadeEmbalagem: TDictionaryAttribute read FVlQuantidadeEmbalagem;
    property DsTemperatura: TDictionaryAttribute read FDsTemperatura;
    property CdNcm: TDictionaryAttribute read FCdNcm;
    property TpCntr: TDictionaryAssociation read FTpCntr;
    property Embalagem: TDictionaryAssociation read FEmbalagem;
  end;
  
  TTprocessoExpTableDictionary = class
  private
    FCdAgente: TDictionaryAttribute;
    FCdViaTransporte: TDictionaryAttribute;
    FCdTransportadora: TDictionaryAttribute;
    FCdSeguradora: TDictionaryAttribute;
    FCdRepresentante: TDictionaryAttribute;
    FCdLocalOrigem: TDictionaryAttribute;
    FCdLocalDestino: TDictionaryAttribute;
    FDtRegistroPedido: TDictionaryAttribute;
    FTxMarcacaoVolume: TDictionaryAttribute;
    FVlFrete: TDictionaryAttribute;
    FVlSeguro: TDictionaryAttribute;
    FVlPesoLiquido: TDictionaryAttribute;
    FVlDesconto: TDictionaryAttribute;
    FVlComissaoPercent: TDictionaryAttribute;
    FVlTotMcv: TDictionaryAttribute;
    FVlTotExw: TDictionaryAttribute;
    FInDue: TDictionaryAttribute;
    FInRecAlfandegadoDespacho: TDictionaryAttribute;
    FNmRefEndRecAlfandDespacho: TDictionaryAttribute;
    FInUmEnquadPorProc: TDictionaryAttribute;
    FTxInformacoesAdicionais: TDictionaryAttribute;
    FCdStatusDue: TDictionaryAttribute;
    FDtEnvioDue: TDictionaryAttribute;
    FCdChaveAcessoDue: TDictionaryAttribute;
    FInTipoDocumentoDue: TDictionaryAttribute;
    FNrProcesssoAdmImp: TDictionaryAttribute;
    FTxMotivoRetificacao: TDictionaryAttribute;
    FQtDiasPrazoValidadeExpTemp: TDictionaryAttribute;
    FInRecAlfandegadoEmbarque: TDictionaryAttribute;
    FNmRefEndRecAlfandEmbarque: TDictionaryAttribute;
    FIncoterm: TDictionaryAssociation;
    FPaisDestino: TDictionaryAssociation;
    FMoeda: TDictionaryAssociation;
    FUrfDespacho: TDictionaryAssociation;
    FUrfDestino: TDictionaryAssociation;
    FRecAlfandegadoDespacho: TDictionaryAssociation;
    FRecAlfandegadoEmbarque: TDictionaryAssociation;
    FExportador: TDictionaryAssociation;
    FEnquadOp: TDictionaryAssociation;
    FDespachante: TDictionaryAssociation;
    FProcesso: TDictionaryAssociation;
    FImportador: TDictionaryAssociation;
    FTipoFrete: TDictionaryAssociation;
  public
    constructor Create;
    property CdAgente: TDictionaryAttribute read FCdAgente;
    property CdViaTransporte: TDictionaryAttribute read FCdViaTransporte;
    property CdTransportadora: TDictionaryAttribute read FCdTransportadora;
    property CdSeguradora: TDictionaryAttribute read FCdSeguradora;
    property CdRepresentante: TDictionaryAttribute read FCdRepresentante;
    property CdLocalOrigem: TDictionaryAttribute read FCdLocalOrigem;
    property CdLocalDestino: TDictionaryAttribute read FCdLocalDestino;
    property DtRegistroPedido: TDictionaryAttribute read FDtRegistroPedido;
    property TxMarcacaoVolume: TDictionaryAttribute read FTxMarcacaoVolume;
    property VlFrete: TDictionaryAttribute read FVlFrete;
    property VlSeguro: TDictionaryAttribute read FVlSeguro;
    property VlPesoLiquido: TDictionaryAttribute read FVlPesoLiquido;
    property VlDesconto: TDictionaryAttribute read FVlDesconto;
    property VlComissaoPercent: TDictionaryAttribute read FVlComissaoPercent;
    property VlTotMcv: TDictionaryAttribute read FVlTotMcv;
    property VlTotExw: TDictionaryAttribute read FVlTotExw;
    property InDue: TDictionaryAttribute read FInDue;
    property InRecAlfandegadoDespacho: TDictionaryAttribute read FInRecAlfandegadoDespacho;
    property NmRefEndRecAlfandDespacho: TDictionaryAttribute read FNmRefEndRecAlfandDespacho;
    property InUmEnquadPorProc: TDictionaryAttribute read FInUmEnquadPorProc;
    property TxInformacoesAdicionais: TDictionaryAttribute read FTxInformacoesAdicionais;
    property CdStatusDue: TDictionaryAttribute read FCdStatusDue;
    property DtEnvioDue: TDictionaryAttribute read FDtEnvioDue;
    property CdChaveAcessoDue: TDictionaryAttribute read FCdChaveAcessoDue;
    property InTipoDocumentoDue: TDictionaryAttribute read FInTipoDocumentoDue;
    property NrProcesssoAdmImp: TDictionaryAttribute read FNrProcesssoAdmImp;
    property TxMotivoRetificacao: TDictionaryAttribute read FTxMotivoRetificacao;
    property QtDiasPrazoValidadeExpTemp: TDictionaryAttribute read FQtDiasPrazoValidadeExpTemp;
    property InRecAlfandegadoEmbarque: TDictionaryAttribute read FInRecAlfandegadoEmbarque;
    property NmRefEndRecAlfandEmbarque: TDictionaryAttribute read FNmRefEndRecAlfandEmbarque;
    property Incoterm: TDictionaryAssociation read FIncoterm;
    property PaisDestino: TDictionaryAssociation read FPaisDestino;
    property Moeda: TDictionaryAssociation read FMoeda;
    property UrfDespacho: TDictionaryAssociation read FUrfDespacho;
    property UrfDestino: TDictionaryAssociation read FUrfDestino;
    property RecAlfandegadoDespacho: TDictionaryAssociation read FRecAlfandegadoDespacho;
    property RecAlfandegadoEmbarque: TDictionaryAssociation read FRecAlfandegadoEmbarque;
    property Exportador: TDictionaryAssociation read FExportador;
    property EnquadOp: TDictionaryAssociation read FEnquadOp;
    property Despachante: TDictionaryAssociation read FDespachante;
    property Processo: TDictionaryAssociation read FProcesso;
    property Importador: TDictionaryAssociation read FImportador;
    property TipoFrete: TDictionaryAssociation read FTipoFrete;
  end;
  
  TTprocessoExpItemTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FCdMercadoria: TDictionaryAttribute;
    FCdNcm: TDictionaryAttribute;
    FQtEmbalagem: TDictionaryAttribute;
    FQtMercadoria: TDictionaryAttribute;
    FVlTotPesoLiq: TDictionaryAttribute;
    FVlTotPesoBruto: TDictionaryAttribute;
    FVlCubagem: TDictionaryAttribute;
    FVlMle: TDictionaryAttribute;
    FInAcordo: TDictionaryAttribute;
    FCdUnidMedida: TDictionaryAssociation;
    FEmbalagem: TDictionaryAssociation;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrItem: TDictionaryAttribute read FNrItem;
    property CdMercadoria: TDictionaryAttribute read FCdMercadoria;
    property CdNcm: TDictionaryAttribute read FCdNcm;
    property QtEmbalagem: TDictionaryAttribute read FQtEmbalagem;
    property QtMercadoria: TDictionaryAttribute read FQtMercadoria;
    property VlTotPesoLiq: TDictionaryAttribute read FVlTotPesoLiq;
    property VlTotPesoBruto: TDictionaryAttribute read FVlTotPesoBruto;
    property VlCubagem: TDictionaryAttribute read FVlCubagem;
    property VlMle: TDictionaryAttribute read FVlMle;
    property InAcordo: TDictionaryAttribute read FInAcordo;
    property CdUnidMedida: TDictionaryAssociation read FCdUnidMedida;
    property Embalagem: TDictionaryAssociation read FEmbalagem;
  end;
  
  TTprocessoExpNfTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrNf: TDictionaryAttribute;
    FDtNota: TDictionaryAttribute;
    FVlNota: TDictionaryAttribute;
    FNfSerie: TDictionaryAttribute;
    FVlTaxa: TDictionaryAttribute;
    FNrRe: TDictionaryAttribute;
    FChaveNota: TDictionaryAttribute;
    FVlTotalProdutos: TDictionaryAttribute;
    FVlFrete: TDictionaryAttribute;
    FVlSeguro: TDictionaryAttribute;
    FVlTotalDescontos: TDictionaryAttribute;
    FVlOutrasDespesas: TDictionaryAttribute;
    FPlMercadoriaTotal: TDictionaryAttribute;
    FQtComercialTotal: TDictionaryAttribute;
    FQtTributavelTotal: TDictionaryAttribute;
    FVlMleMneg: TDictionaryAttribute;
    FVlLocalEmbarqueTotal: TDictionaryAttribute;
    FVlCondicaoVendaTotal: TDictionaryAttribute;
    FInNfRetificacao: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrNf: TDictionaryAttribute read FNrNf;
    property DtNota: TDictionaryAttribute read FDtNota;
    property VlNota: TDictionaryAttribute read FVlNota;
    property NfSerie: TDictionaryAttribute read FNfSerie;
    property VlTaxa: TDictionaryAttribute read FVlTaxa;
    property NrRe: TDictionaryAttribute read FNrRe;
    property ChaveNota: TDictionaryAttribute read FChaveNota;
    property VlTotalProdutos: TDictionaryAttribute read FVlTotalProdutos;
    property VlFrete: TDictionaryAttribute read FVlFrete;
    property VlSeguro: TDictionaryAttribute read FVlSeguro;
    property VlTotalDescontos: TDictionaryAttribute read FVlTotalDescontos;
    property VlOutrasDespesas: TDictionaryAttribute read FVlOutrasDespesas;
    property PlMercadoriaTotal: TDictionaryAttribute read FPlMercadoriaTotal;
    property QtComercialTotal: TDictionaryAttribute read FQtComercialTotal;
    property QtTributavelTotal: TDictionaryAttribute read FQtTributavelTotal;
    property VlMleMneg: TDictionaryAttribute read FVlMleMneg;
    property VlLocalEmbarqueTotal: TDictionaryAttribute read FVlLocalEmbarqueTotal;
    property VlCondicaoVendaTotal: TDictionaryAttribute read FVlCondicaoVendaTotal;
    property InNfRetificacao: TDictionaryAttribute read FInNfRetificacao;
  end;
  
  TTprocessoExpNfItemTableDictionary = class
  private
    FNrItem: TDictionaryAttribute;
    FPlMercadoria: TDictionaryAttribute;
    FCdMercadoria: TDictionaryAttribute;
    FNmMercadoria: TDictionaryAttribute;
    FApMercadoria: TDictionaryAttribute;
    FVlLocalEmbarque: TDictionaryAttribute;
    FVlCondicaoVenda: TDictionaryAttribute;
    FVlItem: TDictionaryAttribute;
    FVlOutrasDesp: TDictionaryAttribute;
    FVlDesconto: TDictionaryAttribute;
    FVlTotalFrete: TDictionaryAttribute;
    FVlSeguro: TDictionaryAttribute;
    FUnComercial: TDictionaryAttribute;
    FQtComercial: TDictionaryAttribute;
    FUnTributavel: TDictionaryAttribute;
    FQtTributavel: TDictionaryAttribute;
    FVlItemMneg: TDictionaryAttribute;
    FVlOutrasDespMneg: TDictionaryAttribute;
    FVlDescontoMneg: TDictionaryAttribute;
    FVlTotalFreteMneg: TDictionaryAttribute;
    FVlSeguroMneg: TDictionaryAttribute;
    FTxLog: TDictionaryAttribute;
    FCdNcmDestaqueDominio: TDictionaryAttribute;
    FNrItemNf: TDictionaryAttribute;
    FNrItemDue: TDictionaryAttribute;
    FInVerificacaoEstatistica: TDictionaryAttribute;
    FNrDeclaracaoImp: TDictionaryAttribute;
    FNrAdicaoImp: TDictionaryAttribute;
    FNrAtoConcessorioDrawback: TDictionaryAttribute;
    FNrItemAtoConcessorioDrawback: TDictionaryAttribute;
    FCnpjAtoConcessorioDrawback: TDictionaryAttribute;
    FNmSituacaoNcmAtributo: TDictionaryAttribute;
    FTratamentoPrioritario: TDictionaryAssociation;
    FProcessoExpNf: TDictionaryAssociation;
    FNcm: TDictionaryAssociation;
    FCdCfop: TDictionaryAssociation;
    FInExportBeneficAtoConcessorio: TDictionaryAssociation;
    FNrNcmAtoConcessorioDrawback: TDictionaryAssociation;
    FQtUtilizadaAtoConcessorioDrawback: TDictionaryAssociation;
    FVmleCCobertCambialAtoConcessorio: TDictionaryAssociation;
    FVmleSCobertCambialAtoConcessorio: TDictionaryAssociation;
  public
    constructor Create;
    property NrItem: TDictionaryAttribute read FNrItem;
    property PlMercadoria: TDictionaryAttribute read FPlMercadoria;
    property CdMercadoria: TDictionaryAttribute read FCdMercadoria;
    property NmMercadoria: TDictionaryAttribute read FNmMercadoria;
    property ApMercadoria: TDictionaryAttribute read FApMercadoria;
    property VlLocalEmbarque: TDictionaryAttribute read FVlLocalEmbarque;
    property VlCondicaoVenda: TDictionaryAttribute read FVlCondicaoVenda;
    property VlItem: TDictionaryAttribute read FVlItem;
    property VlOutrasDesp: TDictionaryAttribute read FVlOutrasDesp;
    property VlDesconto: TDictionaryAttribute read FVlDesconto;
    property VlTotalFrete: TDictionaryAttribute read FVlTotalFrete;
    property VlSeguro: TDictionaryAttribute read FVlSeguro;
    property UnComercial: TDictionaryAttribute read FUnComercial;
    property QtComercial: TDictionaryAttribute read FQtComercial;
    property UnTributavel: TDictionaryAttribute read FUnTributavel;
    property QtTributavel: TDictionaryAttribute read FQtTributavel;
    property VlItemMneg: TDictionaryAttribute read FVlItemMneg;
    property VlOutrasDespMneg: TDictionaryAttribute read FVlOutrasDespMneg;
    property VlDescontoMneg: TDictionaryAttribute read FVlDescontoMneg;
    property VlTotalFreteMneg: TDictionaryAttribute read FVlTotalFreteMneg;
    property VlSeguroMneg: TDictionaryAttribute read FVlSeguroMneg;
    property TxLog: TDictionaryAttribute read FTxLog;
    property CdNcmDestaqueDominio: TDictionaryAttribute read FCdNcmDestaqueDominio;
    property NrItemNf: TDictionaryAttribute read FNrItemNf;
    property NrItemDue: TDictionaryAttribute read FNrItemDue;
    property InVerificacaoEstatistica: TDictionaryAttribute read FInVerificacaoEstatistica;
    property NrDeclaracaoImp: TDictionaryAttribute read FNrDeclaracaoImp;
    property NrAdicaoImp: TDictionaryAttribute read FNrAdicaoImp;
    property NrAtoConcessorioDrawback: TDictionaryAttribute read FNrAtoConcessorioDrawback;
    property NrItemAtoConcessorioDrawback: TDictionaryAttribute read FNrItemAtoConcessorioDrawback;
    property CnpjAtoConcessorioDrawback: TDictionaryAttribute read FCnpjAtoConcessorioDrawback;
    property NmSituacaoNcmAtributo: TDictionaryAttribute read FNmSituacaoNcmAtributo;
    property TratamentoPrioritario: TDictionaryAssociation read FTratamentoPrioritario;
    property ProcessoExpNf: TDictionaryAssociation read FProcessoExpNf;
    property Ncm: TDictionaryAssociation read FNcm;
    property CdCfop: TDictionaryAssociation read FCdCfop;
    property InExportBeneficAtoConcessorio: TDictionaryAssociation read FInExportBeneficAtoConcessorio;
    property NrNcmAtoConcessorioDrawback: TDictionaryAssociation read FNrNcmAtoConcessorioDrawback;
    property QtUtilizadaAtoConcessorioDrawback: TDictionaryAssociation read FQtUtilizadaAtoConcessorioDrawback;
    property VmleCCobertCambialAtoConcessorio: TDictionaryAssociation read FVmleCCobertCambialAtoConcessorio;
    property VmleSCobertCambialAtoConcessorio: TDictionaryAssociation read FVmleSCobertCambialAtoConcessorio;
  end;
  
  TTprodutoTableDictionary = class
  private
    FCdProduto: TDictionaryAttribute;
    FNmProduto: TDictionaryAttribute;
    FApProduto: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FCdViatransp: TDictionaryAttribute;
  public
    constructor Create;
    property CdProduto: TDictionaryAttribute read FCdProduto;
    property NmProduto: TDictionaryAttribute read FNmProduto;
    property ApProduto: TDictionaryAttribute read FApProduto;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property CdViatransp: TDictionaryAttribute read FCdViatransp;
  end;
  
  TTrecAlfandegadoTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
    FCodOrgaoRec: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
    property CodOrgaoRec: TDictionaryAttribute read FCodOrgaoRec;
  end;
  
  TTrefClienteTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrSequencia: TDictionaryAttribute;
    FCdReferencia: TDictionaryAttribute;
    FCdRefExp: TDictionaryAttribute;
    FDtReferencia: TDictionaryAttribute;
    FTpReferencia: TDictionaryAttribute;
    FCdArea: TDictionaryAttribute;
    FNrItemPo: TDictionaryAttribute;
    FNrParcial: TDictionaryAttribute;
    FInFlagLi: TDictionaryAttribute;
    FCdEmpresa: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrSequencia: TDictionaryAttribute read FNrSequencia;
    property CdReferencia: TDictionaryAttribute read FCdReferencia;
    property CdRefExp: TDictionaryAttribute read FCdRefExp;
    property DtReferencia: TDictionaryAttribute read FDtReferencia;
    property TpReferencia: TDictionaryAttribute read FTpReferencia;
    property CdArea: TDictionaryAttribute read FCdArea;
    property NrItemPo: TDictionaryAttribute read FNrItemPo;
    property NrParcial: TDictionaryAttribute read FNrParcial;
    property InFlagLi: TDictionaryAttribute read FInFlagLi;
    property CdEmpresa: TDictionaryAttribute read FCdEmpresa;
  end;
  
  TTregTributarioTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTservicoTableDictionary = class
  private
    FCdServico: TDictionaryAttribute;
    FNmServico: TDictionaryAttribute;
    FCdClassificacao: TDictionaryAttribute;
    FCdViaTransporte: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FInCheck: TDictionaryAttribute;
  public
    constructor Create;
    property CdServico: TDictionaryAttribute read FCdServico;
    property NmServico: TDictionaryAttribute read FNmServico;
    property CdClassificacao: TDictionaryAttribute read FCdClassificacao;
    property CdViaTransporte: TDictionaryAttribute read FCdViaTransporte;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property InCheck: TDictionaryAttribute read FInCheck;
  end;
  
  TTservicoNovoTableDictionary = class
  private
    FCdServico: TDictionaryAttribute;
    FNmServico: TDictionaryAttribute;
    FCdClassificacao: TDictionaryAttribute;
    FCdViaTransporte: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FInCheck: TDictionaryAttribute;
  public
    constructor Create;
    property CdServico: TDictionaryAttribute read FCdServico;
    property NmServico: TDictionaryAttribute read FNmServico;
    property CdClassificacao: TDictionaryAttribute read FCdClassificacao;
    property CdViaTransporte: TDictionaryAttribute read FCdViaTransporte;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property InCheck: TDictionaryAttribute read FInCheck;
  end;
  
  TTtpAcordoTarifTableDictionary = class
  private
    FCdTipoAcordoTar: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property CdTipoAcordoTar: TDictionaryAttribute read FCdTipoAcordoTar;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTtpCntrTableDictionary = class
  private
    FTpCntr: TDictionaryAttribute;
    FNmTpCntr: TDictionaryAttribute;
    FCdIso: TDictionaryAttribute;
  public
    constructor Create;
    property TpCntr: TDictionaryAttribute read FTpCntr;
    property NmTpCntr: TDictionaryAttribute read FNmTpCntr;
    property CdIso: TDictionaryAttribute read FCdIso;
  end;
  
  TTtpEmbalagemInttraTableDictionary = class
  private
    FCdEmbalagem: TDictionaryAttribute;
    FNmEmbalagem: TDictionaryAttribute;
    FCdEdifact: TDictionaryAttribute;
    FCdAnsi: TDictionaryAttribute;
  public
    constructor Create;
    property CdEmbalagem: TDictionaryAttribute read FCdEmbalagem;
    property NmEmbalagem: TDictionaryAttribute read FNmEmbalagem;
    property CdEdifact: TDictionaryAttribute read FCdEdifact;
    property CdAnsi: TDictionaryAttribute read FCdAnsi;
  end;
  
  TTtpExoneracaoTableDictionary = class
  private
    FCdEx: TDictionaryAttribute;
    FNmEx: TDictionaryAttribute;
    FCdTrib: TDictionaryAttribute;
    FNmFundLegal: TDictionaryAttribute;
  public
    constructor Create;
    property CdEx: TDictionaryAttribute read FCdEx;
    property NmEx: TDictionaryAttribute read FNmEx;
    property CdTrib: TDictionaryAttribute read FCdTrib;
    property NmFundLegal: TDictionaryAttribute read FNmFundLegal;
  end;
  
  TTtpFreteTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTtpProcessoVinculadoTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTunidMedidaBrokerTableDictionary = class
  private
    FCdUnidMedida: TDictionaryAttribute;
    FNmUnidMedida: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FCdGiplite: TDictionaryAttribute;
    FNmSigla: TDictionaryAttribute;
    FCdScxExp: TDictionaryAttribute;
    FNmUnidMedidaIng: TDictionaryAttribute;
    FNmUnidMedidaEsp: TDictionaryAttribute;
    FNmSiglaIng: TDictionaryAttribute;
    FNmSiglaEsp: TDictionaryAttribute;
  public
    constructor Create;
    property CdUnidMedida: TDictionaryAttribute read FCdUnidMedida;
    property NmUnidMedida: TDictionaryAttribute read FNmUnidMedida;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property CdGiplite: TDictionaryAttribute read FCdGiplite;
    property NmSigla: TDictionaryAttribute read FNmSigla;
    property CdScxExp: TDictionaryAttribute read FCdScxExp;
    property NmUnidMedidaIng: TDictionaryAttribute read FNmUnidMedidaIng;
    property NmUnidMedidaEsp: TDictionaryAttribute read FNmUnidMedidaEsp;
    property NmSiglaIng: TDictionaryAttribute read FNmSiglaIng;
    property NmSiglaEsp: TDictionaryAttribute read FNmSiglaEsp;
  end;
  
  TTunidNegTableDictionary = class
  private
    FCdUnidNeg: TDictionaryAttribute;
    FNmUnidNeg: TDictionaryAttribute;
    FApUnidNeg: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
  public
    constructor Create;
    property CdUnidNeg: TDictionaryAttribute read FCdUnidNeg;
    property NmUnidNeg: TDictionaryAttribute read FNmUnidNeg;
    property ApUnidNeg: TDictionaryAttribute read FApUnidNeg;
    property InAtivo: TDictionaryAttribute read FInAtivo;
  end;
  
  TTurfTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
    FCdDigito: TDictionaryAttribute;
    FEndUf: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
    property CdDigito: TDictionaryAttribute read FCdDigito;
    property EndUf: TDictionaryAttribute read FEndUf;
  end;
  
  TTusuarioTableDictionary = class
  private
    FCdUsuario: TDictionaryAttribute;
    FCdSenha: TDictionaryAttribute;
    FCdCargo: TDictionaryAttribute;
    FNmUsuario: TDictionaryAttribute;
    FApUsuario: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FNmEmail: TDictionaryAttribute;
  public
    constructor Create;
    property CdUsuario: TDictionaryAttribute read FCdUsuario;
    property CdSenha: TDictionaryAttribute read FCdSenha;
    property CdCargo: TDictionaryAttribute read FCdCargo;
    property NmUsuario: TDictionaryAttribute read FNmUsuario;
    property ApUsuario: TDictionaryAttribute read FApUsuario;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property NmEmail: TDictionaryAttribute read FNmEmail;
  end;
  
  TTviaTransporteTableDictionary = class
  private
    FCdViaTransporte: TDictionaryAttribute;
    FNmViaTransporte: TDictionaryAttribute;
  public
    constructor Create;
    property CdViaTransporte: TDictionaryAttribute read FCdViaTransporte;
    property NmViaTransporte: TDictionaryAttribute read FNmViaTransporte;
  end;
  
  TTviagemTableDictionary = class
  private
    FCdUnidNeg: TDictionaryAttribute;
    FCdProduto: TDictionaryAttribute;
    FCdEmbarcacao: TDictionaryAttribute;
    FNrViagem: TDictionaryAttribute;
    FCdLocal: TDictionaryAttribute;
    FNrViagemArmador: TDictionaryAttribute;
    FDtCriacaoViagem: TDictionaryAttribute;
  public
    constructor Create;
    property CdUnidNeg: TDictionaryAttribute read FCdUnidNeg;
    property CdProduto: TDictionaryAttribute read FCdProduto;
    property CdEmbarcacao: TDictionaryAttribute read FCdEmbarcacao;
    property NrViagem: TDictionaryAttribute read FNrViagem;
    property CdLocal: TDictionaryAttribute read FCdLocal;
    property NrViagemArmador: TDictionaryAttribute read FNrViagemArmador;
    property DtCriacaoViagem: TDictionaryAttribute read FDtCriacaoViagem;
  end;
  
  TTregraObsDiTableDictionary = class
  private
    FCdRegra: TDictionaryAttribute;
    FNmRegra: TDictionaryAttribute;
    FCdGrupo: TDictionaryAttribute;
    FNmTabelaRegra: TDictionaryAttribute;
    FNmCampoRegra: TDictionaryAttribute;
    FNmTabelaOrigem: TDictionaryAttribute;
    FNmCampoOrigem: TDictionaryAttribute;
    FNmValorCampo: TDictionaryAttribute;
    FCdObservacao: TDictionaryAttribute;
    FCdRegraRelacionada: TDictionaryAttribute;
  public
    constructor Create;
    property CdRegra: TDictionaryAttribute read FCdRegra;
    property NmRegra: TDictionaryAttribute read FNmRegra;
    property CdGrupo: TDictionaryAttribute read FCdGrupo;
    property NmTabelaRegra: TDictionaryAttribute read FNmTabelaRegra;
    property NmCampoRegra: TDictionaryAttribute read FNmCampoRegra;
    property NmTabelaOrigem: TDictionaryAttribute read FNmTabelaOrigem;
    property NmCampoOrigem: TDictionaryAttribute read FNmCampoOrigem;
    property NmValorCampo: TDictionaryAttribute read FNmValorCampo;
    property CdObservacao: TDictionaryAttribute read FCdObservacao;
    property CdRegraRelacionada: TDictionaryAttribute read FCdRegraRelacionada;
  end;
  
  TTprocessoExpNfItemEnquadramentoTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrNf: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FNrSeqEnquadramento: TDictionaryAttribute;
    FCdEnquadramento: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrNf: TDictionaryAttribute read FNrNf;
    property NrItem: TDictionaryAttribute read FNrItem;
    property NrSeqEnquadramento: TDictionaryAttribute read FNrSeqEnquadramento;
    property CdEnquadramento: TDictionaryAttribute read FCdEnquadramento;
  end;

  TTProcessoExpNfItemNfDrawbackTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrNf: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FNrSeqNfDrawback: TDictionaryAttribute;
    FNrChaveAcessoNf: TDictionaryAttribute;
    FQuantidadeNf: TDictionaryAttribute;
    FDataNf: TDictionaryAttribute;
    FValorMoedaNegociacaoNf: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrNf: TDictionaryAttribute read FNrNf;
    property NrItem: TDictionaryAttribute read FNrItem;
    property NrSeqNfDrawback: TDictionaryAttribute read FNrSeqNfDrawback;
    property NrChaveAcessoNf: TDictionaryAttribute read FNrChaveAcessoNf;
    property QuantidadeNf: TDictionaryAttribute read FQuantidadeNf;
    property DataNf: TDictionaryAttribute read FDataNf;
    property ValorMoedaNegociacaoNf: TDictionaryAttribute read FValorMoedaNegociacaoNf;
  end;

  TTncmExpDestaqueTableDictionary = class
  private
    FCodigoNcm: TDictionaryAttribute;
    FCdAtributo: TDictionaryAttribute;
    FCdDominio: TDictionaryAttribute;
    FNmDominio: TDictionaryAttribute;
  public
    constructor Create;
    property CodigoNcm: TDictionaryAttribute read FCodigoNcm;
    property CdAtributo: TDictionaryAttribute read FCdAtributo;
    property CdDominio: TDictionaryAttribute read FCdDominio;
    property NmDominio: TDictionaryAttribute read FNmDominio;
  end;
  
  TTratamentoPrioritarioTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTprocessoExpNfItemLpcoTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrNf: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FNrSeqLpco: TDictionaryAttribute;
    FCdLpco: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrNf: TDictionaryAttribute read FNrNf;
    property NrItem: TDictionaryAttribute read FNrItem;
    property NrSeqLpco: TDictionaryAttribute read FNrSeqLpco;
    property CdLpco: TDictionaryAttribute read FCdLpco;
  end;
  
  TTprocessoExpNfItemNotaReferenciadaTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrNf: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FNrItemNfRef: TDictionaryAttribute;
    FChaveAcesso: TDictionaryAttribute;
    FQtTributavel: TDictionaryAttribute;
    FNrItemNfRefItem: TDictionaryAttribute;
    FNrCpfCnpjSubmitter: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrNf: TDictionaryAttribute read FNrNf;
    property NrItem: TDictionaryAttribute read FNrItem;
    property NrItemNfRef: TDictionaryAttribute read FNrItemNfRef;
    property ChaveAcesso: TDictionaryAttribute read FChaveAcesso;
    property QtTributavel: TDictionaryAttribute read FQtTributavel;
    property NrItemNfRefItem: TDictionaryAttribute read FNrItemNfRefItem;
    property NrCpfCnpjSubmitter: TDictionaryAttribute read FNrCpfCnpjSubmitter;
  end;
  
  TTregraObsAutoTableDictionary = class
  private
    FCdRegra: TDictionaryAttribute;
    FNmRegra: TDictionaryAttribute;
    FNmValorCampo: TDictionaryAttribute;
    FCdObservacao: TDictionaryAttribute;
    FCdServico: TDictionaryAttribute;
    FGrupo: TDictionaryAssociation;
    FTabela: TDictionaryAssociation;
    FCampo: TDictionaryAssociation;
  public
    constructor Create;
    property CdRegra: TDictionaryAttribute read FCdRegra;
    property NmRegra: TDictionaryAttribute read FNmRegra;
    property NmValorCampo: TDictionaryAttribute read FNmValorCampo;
    property CdObservacao: TDictionaryAttribute read FCdObservacao;
    property CdServico: TDictionaryAttribute read FCdServico;
    property Grupo: TDictionaryAssociation read FGrupo;
    property Tabela: TDictionaryAssociation read FTabela;
    property Campo: TDictionaryAssociation read FCampo;
  end;
  
  TTregraObsAutoItemTableDictionary = class
  private
    FCdRegraItem: TDictionaryAttribute;
    FNmRegraItem: TDictionaryAttribute;
    FNmValorCampo: TDictionaryAttribute;
    FRegra: TDictionaryAssociation;
    FTabela: TDictionaryAssociation;
    FCampo: TDictionaryAssociation;
  public
    constructor Create;
    property CdRegraItem: TDictionaryAttribute read FCdRegraItem;
    property NmRegraItem: TDictionaryAttribute read FNmRegraItem;
    property NmValorCampo: TDictionaryAttribute read FNmValorCampo;
    property Regra: TDictionaryAssociation read FRegra;
    property Tabela: TDictionaryAssociation read FTabela;
    property Campo: TDictionaryAssociation read FCampo;
  end;
  
  TTregraObsAutoTabelasTableDictionary = class
  private
    FCdRegraTabela: TDictionaryAttribute;
    FNmTabelaRegra: TDictionaryAttribute;
    FDsTabelaRegra: TDictionaryAttribute;
  public
    constructor Create;
    property CdRegraTabela: TDictionaryAttribute read FCdRegraTabela;
    property NmTabelaRegra: TDictionaryAttribute read FNmTabelaRegra;
    property DsTabelaRegra: TDictionaryAttribute read FDsTabelaRegra;
  end;
  
  TTregraObsAutoTabelasCamposTableDictionary = class
  private
    FCdRegraCampo: TDictionaryAttribute;
    FNmCampo: TDictionaryAttribute;
    FDsCampo: TDictionaryAttribute;
    FNmTabelaOrigem: TDictionaryAttribute;
    FNmCampoCdOrigem: TDictionaryAttribute;
    FNmCampoDsOrigem: TDictionaryAttribute;
    FTxWhereExtra: TDictionaryAttribute;
    FTabela: TDictionaryAssociation;
  public
    constructor Create;
    property CdRegraCampo: TDictionaryAttribute read FCdRegraCampo;
    property NmCampo: TDictionaryAttribute read FNmCampo;
    property DsCampo: TDictionaryAttribute read FDsCampo;
    property NmTabelaOrigem: TDictionaryAttribute read FNmTabelaOrigem;
    property NmCampoCdOrigem: TDictionaryAttribute read FNmCampoCdOrigem;
    property NmCampoDsOrigem: TDictionaryAttribute read FNmCampoDsOrigem;
    property TxWhereExtra: TDictionaryAttribute read FTxWhereExtra;
    property Tabela: TDictionaryAssociation read FTabela;
  end;
  
  TTprocessoExpNfItemNfComplementarTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrNf: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FChaveAcesso: TDictionaryAttribute;
    FNrItemNfComplementarItem: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrNf: TDictionaryAttribute read FNrNf;
    property NrItem: TDictionaryAttribute read FNrItem;
    property ChaveAcesso: TDictionaryAttribute read FChaveAcesso;
    property NrItemNfComplementarItem: TDictionaryAttribute read FNrItemNfComplementarItem;
  end;
  
  TVwResumoDiTableDictionary = class
  private
    FNrProcessoCompleto: TDictionaryAttribute;
    FNrProcesso: TDictionaryAttribute;
    FVlTotalIi: TDictionaryAttribute;
    FVlTotalIpi: TDictionaryAttribute;
    FVlTotIcms: TDictionaryAttribute;
    FVlTributoPago: TDictionaryAttribute;
    FVlPis: TDictionaryAttribute;
    FVlCofins: TDictionaryAttribute;
    FVlIcmsARecolherAfrmm: TDictionaryAttribute;
    FVlAfrmm: TDictionaryAttribute;
    FVlTotalAntidumping: TDictionaryAttribute;
    FVlImpostos: TDictionaryAttribute;
    FVlIcmsAcrescimos: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcessoCompleto: TDictionaryAttribute read FNrProcessoCompleto;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property VlTotalIi: TDictionaryAttribute read FVlTotalIi;
    property VlTotalIpi: TDictionaryAttribute read FVlTotalIpi;
    property VlTotIcms: TDictionaryAttribute read FVlTotIcms;
    property VlTributoPago: TDictionaryAttribute read FVlTributoPago;
    property VlPis: TDictionaryAttribute read FVlPis;
    property VlCofins: TDictionaryAttribute read FVlCofins;
    property VlIcmsARecolherAfrmm: TDictionaryAttribute read FVlIcmsARecolherAfrmm;
    property VlAfrmm: TDictionaryAttribute read FVlAfrmm;
    property VlTotalAntidumping: TDictionaryAttribute read FVlTotalAntidumping;
    property VlImpostos: TDictionaryAttribute read FVlImpostos;
    property VlIcmsAcrescimos: TDictionaryAttribute read FVlIcmsAcrescimos;
  end;
  
  TVwServicoGeralTableDictionary = class
  private
    FCdServico: TDictionaryAttribute;
    FNmServico: TDictionaryAttribute;
    FCdViaTransporte: TDictionaryAttribute;
    FInAtivo: TDictionaryAttribute;
    FInNovoServico: TDictionaryAttribute;
  public
    constructor Create;
    property CdServico: TDictionaryAttribute read FCdServico;
    property NmServico: TDictionaryAttribute read FNmServico;
    property CdViaTransporte: TDictionaryAttribute read FCdViaTransporte;
    property InAtivo: TDictionaryAttribute read FInAtivo;
    property InNovoServico: TDictionaryAttribute read FInNovoServico;
  end;
  
  TTncmExpAtributoTableDictionary = class
  private
    FCdNcm: TDictionaryAttribute;
    FCdAtributo: TDictionaryAttribute;
    FNmAtributo: TDictionaryAttribute;
    FNmFormaPreenchimento: TDictionaryAttribute;
    FInObrigatorio: TDictionaryAttribute;
    FDtInicioVigencia: TDictionaryAttribute;
  public
    constructor Create;
    property CdNcm: TDictionaryAttribute read FCdNcm;
    property CdAtributo: TDictionaryAttribute read FCdAtributo;
    property NmAtributo: TDictionaryAttribute read FNmAtributo;
    property NmFormaPreenchimento: TDictionaryAttribute read FNmFormaPreenchimento;
    property InObrigatorio: TDictionaryAttribute read FInObrigatorio;
    property DtInicioVigencia: TDictionaryAttribute read FDtInicioVigencia;
  end;
  
  TTncmExpAtributoValorTableDictionary = class
  private
    FCdNcm: TDictionaryAttribute;
    FCdAtributo: TDictionaryAttribute;
    FCdAtributoValor: TDictionaryAttribute;
    FNmAtributoValor: TDictionaryAttribute;
    FNmAtributo: TDictionaryAttribute;
  public
    constructor Create;
    property CdNcm: TDictionaryAttribute read FCdNcm;
    property CdAtributo: TDictionaryAttribute read FCdAtributo;
    property CdAtributoValor: TDictionaryAttribute read FCdAtributoValor;
    property NmAtributoValor: TDictionaryAttribute read FNmAtributoValor;
    property NmAtributo: TDictionaryAttribute read FNmAtributo;
  end;
  
  TTprocessoExpNfItemNcmAtributoTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrNf: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FCdNcm: TDictionaryAttribute;
    FCdAtributo: TDictionaryAttribute;
    FCdAtributoValor: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrNf: TDictionaryAttribute read FNrNf;
    property NrItem: TDictionaryAttribute read FNrItem;
    property CdNcm: TDictionaryAttribute read FCdNcm;
    property CdAtributo: TDictionaryAttribute read FCdAtributo;
    property CdAtributoValor: TDictionaryAttribute read FCdAtributoValor;
  end;
  
  TTprocessoDraftBlTableDictionary = class
  private
    FNrAmend: TDictionaryAttribute;
    FDtCriacao: TDictionaryAttribute;
    FDtEnvioDraft: TDictionaryAttribute;
    FCdEnvioInttra: TDictionaryAttribute;
    FClienteNome: TDictionaryAttribute;
    FClienteEndereco: TDictionaryAttribute;
    FClienteCidade: TDictionaryAttribute;
    FClienteCep: TDictionaryAttribute;
    FClienteEstado: TDictionaryAttribute;
    FClientePaisCod: TDictionaryAttribute;
    FClienteCnpj: TDictionaryAttribute;
    FConsigNome: TDictionaryAttribute;
    FConsigEndereco: TDictionaryAttribute;
    FConsigCidade: TDictionaryAttribute;
    FConsigCep: TDictionaryAttribute;
    FConsigEstado: TDictionaryAttribute;
    FConsigPaisCod: TDictionaryAttribute;
    FNotify1Nome: TDictionaryAttribute;
    FNotify1Endereco: TDictionaryAttribute;
    FNotify1Cidade: TDictionaryAttribute;
    FNotify1Cep: TDictionaryAttribute;
    FNotify1Estado: TDictionaryAttribute;
    FNotify1PaisCod: TDictionaryAttribute;
    FNotify2Nome: TDictionaryAttribute;
    FNotify2Endereco: TDictionaryAttribute;
    FNotify2Cidade: TDictionaryAttribute;
    FNotify2Cep: TDictionaryAttribute;
    FNotify2Estado: TDictionaryAttribute;
    FNotify2PaisCod: TDictionaryAttribute;
    FAgenteNome: TDictionaryAttribute;
    FAgenteCdInttra: TDictionaryAttribute;
    FAgenteEndereco: TDictionaryAttribute;
    FAgenteCidade: TDictionaryAttribute;
    FAgenteCep: TDictionaryAttribute;
    FAgenteEstado: TDictionaryAttribute;
    FAgentePaisCod: TDictionaryAttribute;
    FBookingArmador: TDictionaryAttribute;
    FReferenciaEmbarque: TDictionaryAttribute;
    FNmNavio: TDictionaryAttribute;
    FNrViagem: TDictionaryAttribute;
    FLocalEmbarque: TDictionaryAttribute;
    FLocalDesembarque: TDictionaryAttribute;
    FLocalDesembarquePaisCod: TDictionaryAttribute;
    FMarcacaoVolumes: TDictionaryAttribute;
    FCdRuc: TDictionaryAttribute;
    FInPgmtoAbroad: TDictionaryAttribute;
    FNmLocalPgmtoTaxas: TDictionaryAttribute;
    FDsEmailIndaia: TDictionaryAttribute;
    FLocalEntrega: TDictionaryAttribute;
    FLocalEmbarqueSigla: TDictionaryAttribute;
    FLocalDesembarqueSigla: TDictionaryAttribute;
    FConsigEndNumero: TDictionaryAttribute;
    FConsigEndCompl: TDictionaryAttribute;
    FConsigNrTelefone: TDictionaryAttribute;
    FConsigNrFax: TDictionaryAttribute;
    FConsigNrRuc: TDictionaryAttribute;
    FConsigNrNit: TDictionaryAttribute;
    FConsigNrCuit: TDictionaryAttribute;
    FNotify1EndNumero: TDictionaryAttribute;
    FNotify1EndCompl: TDictionaryAttribute;
    FNotify1NrTelefone: TDictionaryAttribute;
    FNotify1NrFax: TDictionaryAttribute;
    FNotify1NrRuc: TDictionaryAttribute;
    FNotify1NrNit: TDictionaryAttribute;
    FNotify1NrCuit: TDictionaryAttribute;
    FNotify2EndNumero: TDictionaryAttribute;
    FNotify2EndCompl: TDictionaryAttribute;
    FNotify2NrTelefone: TDictionaryAttribute;
    FNotify2NrFax: TDictionaryAttribute;
    FNotify2NrRuc: TDictionaryAttribute;
    FNotify2NrNit: TDictionaryAttribute;
    FNotify2NrCuit: TDictionaryAttribute;
    FLocalLiberacaoBlCod: TDictionaryAttribute;
    FLocalLiberacaoBlNome: TDictionaryAttribute;
    FLocalLiberacaoBlPais: TDictionaryAttribute;
    FLocalEntregaSigla: TDictionaryAttribute;
    FLocalEntregaPaisCod: TDictionaryAttribute;
    FStatusEnvio: TDictionaryAttribute;
    FCdUsuarioCriacao: TDictionaryAssociation;
    FCdCollectPrepaid: TDictionaryAssociation;
    FCdTipoPgmtoTaxas: TDictionaryAssociation;
    FCdTipoMovimento: TDictionaryAssociation;
    FNrProcesso: TDictionaryAssociation;
  public
    constructor Create;
    property NrAmend: TDictionaryAttribute read FNrAmend;
    property DtCriacao: TDictionaryAttribute read FDtCriacao;
    property DtEnvioDraft: TDictionaryAttribute read FDtEnvioDraft;
    property CdEnvioInttra: TDictionaryAttribute read FCdEnvioInttra;
    property ClienteNome: TDictionaryAttribute read FClienteNome;
    property ClienteEndereco: TDictionaryAttribute read FClienteEndereco;
    property ClienteCidade: TDictionaryAttribute read FClienteCidade;
    property ClienteCep: TDictionaryAttribute read FClienteCep;
    property ClienteEstado: TDictionaryAttribute read FClienteEstado;
    property ClientePaisCod: TDictionaryAttribute read FClientePaisCod;
    property ClienteCnpj: TDictionaryAttribute read FClienteCnpj;
    property ConsigNome: TDictionaryAttribute read FConsigNome;
    property ConsigEndereco: TDictionaryAttribute read FConsigEndereco;
    property ConsigCidade: TDictionaryAttribute read FConsigCidade;
    property ConsigCep: TDictionaryAttribute read FConsigCep;
    property ConsigEstado: TDictionaryAttribute read FConsigEstado;
    property ConsigPaisCod: TDictionaryAttribute read FConsigPaisCod;
    property Notify1Nome: TDictionaryAttribute read FNotify1Nome;
    property Notify1Endereco: TDictionaryAttribute read FNotify1Endereco;
    property Notify1Cidade: TDictionaryAttribute read FNotify1Cidade;
    property Notify1Cep: TDictionaryAttribute read FNotify1Cep;
    property Notify1Estado: TDictionaryAttribute read FNotify1Estado;
    property Notify1PaisCod: TDictionaryAttribute read FNotify1PaisCod;
    property Notify2Nome: TDictionaryAttribute read FNotify2Nome;
    property Notify2Endereco: TDictionaryAttribute read FNotify2Endereco;
    property Notify2Cidade: TDictionaryAttribute read FNotify2Cidade;
    property Notify2Cep: TDictionaryAttribute read FNotify2Cep;
    property Notify2Estado: TDictionaryAttribute read FNotify2Estado;
    property Notify2PaisCod: TDictionaryAttribute read FNotify2PaisCod;
    property AgenteNome: TDictionaryAttribute read FAgenteNome;
    property AgenteCdInttra: TDictionaryAttribute read FAgenteCdInttra;
    property AgenteEndereco: TDictionaryAttribute read FAgenteEndereco;
    property AgenteCidade: TDictionaryAttribute read FAgenteCidade;
    property AgenteCep: TDictionaryAttribute read FAgenteCep;
    property AgenteEstado: TDictionaryAttribute read FAgenteEstado;
    property AgentePaisCod: TDictionaryAttribute read FAgentePaisCod;
    property BookingArmador: TDictionaryAttribute read FBookingArmador;
    property ReferenciaEmbarque: TDictionaryAttribute read FReferenciaEmbarque;
    property NmNavio: TDictionaryAttribute read FNmNavio;
    property NrViagem: TDictionaryAttribute read FNrViagem;
    property LocalEmbarque: TDictionaryAttribute read FLocalEmbarque;
    property LocalDesembarque: TDictionaryAttribute read FLocalDesembarque;
    property LocalDesembarquePaisCod: TDictionaryAttribute read FLocalDesembarquePaisCod;
    property MarcacaoVolumes: TDictionaryAttribute read FMarcacaoVolumes;
    property CdRuc: TDictionaryAttribute read FCdRuc;
    property InPgmtoAbroad: TDictionaryAttribute read FInPgmtoAbroad;
    property NmLocalPgmtoTaxas: TDictionaryAttribute read FNmLocalPgmtoTaxas;
    property DsEmailIndaia: TDictionaryAttribute read FDsEmailIndaia;
    property LocalEntrega: TDictionaryAttribute read FLocalEntrega;
    property LocalEmbarqueSigla: TDictionaryAttribute read FLocalEmbarqueSigla;
    property LocalDesembarqueSigla: TDictionaryAttribute read FLocalDesembarqueSigla;
    property ConsigEndNumero: TDictionaryAttribute read FConsigEndNumero;
    property ConsigEndCompl: TDictionaryAttribute read FConsigEndCompl;
    property ConsigNrTelefone: TDictionaryAttribute read FConsigNrTelefone;
    property ConsigNrFax: TDictionaryAttribute read FConsigNrFax;
    property ConsigNrRuc: TDictionaryAttribute read FConsigNrRuc;
    property ConsigNrNit: TDictionaryAttribute read FConsigNrNit;
    property ConsigNrCuit: TDictionaryAttribute read FConsigNrCuit;
    property Notify1EndNumero: TDictionaryAttribute read FNotify1EndNumero;
    property Notify1EndCompl: TDictionaryAttribute read FNotify1EndCompl;
    property Notify1NrTelefone: TDictionaryAttribute read FNotify1NrTelefone;
    property Notify1NrFax: TDictionaryAttribute read FNotify1NrFax;
    property Notify1NrRuc: TDictionaryAttribute read FNotify1NrRuc;
    property Notify1NrNit: TDictionaryAttribute read FNotify1NrNit;
    property Notify1NrCuit: TDictionaryAttribute read FNotify1NrCuit;
    property Notify2EndNumero: TDictionaryAttribute read FNotify2EndNumero;
    property Notify2EndCompl: TDictionaryAttribute read FNotify2EndCompl;
    property Notify2NrTelefone: TDictionaryAttribute read FNotify2NrTelefone;
    property Notify2NrFax: TDictionaryAttribute read FNotify2NrFax;
    property Notify2NrRuc: TDictionaryAttribute read FNotify2NrRuc;
    property Notify2NrNit: TDictionaryAttribute read FNotify2NrNit;
    property Notify2NrCuit: TDictionaryAttribute read FNotify2NrCuit;
    property LocalLiberacaoBlCod: TDictionaryAttribute read FLocalLiberacaoBlCod;
    property LocalLiberacaoBlNome: TDictionaryAttribute read FLocalLiberacaoBlNome;
    property LocalLiberacaoBlPais: TDictionaryAttribute read FLocalLiberacaoBlPais;
    property LocalEntregaSigla: TDictionaryAttribute read FLocalEntregaSigla;
    property LocalEntregaPaisCod: TDictionaryAttribute read FLocalEntregaPaisCod;
    property StatusEnvio: TDictionaryAttribute read FStatusEnvio;
    property CdUsuarioCriacao: TDictionaryAssociation read FCdUsuarioCriacao;
    property CdCollectPrepaid: TDictionaryAssociation read FCdCollectPrepaid;
    property CdTipoPgmtoTaxas: TDictionaryAssociation read FCdTipoPgmtoTaxas;
    property CdTipoMovimento: TDictionaryAssociation read FCdTipoMovimento;
    property NrProcesso: TDictionaryAssociation read FNrProcesso;
  end;
  
  TTprocessoDraftCntrTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrAmend: TDictionaryAttribute;
    FNrCntr: TDictionaryAttribute;
    FNrLacre: TDictionaryAttribute;
    FNrLacreSif: TDictionaryAttribute;
    FNmTpCntr: TDictionaryAttribute;
    FCdIso: TDictionaryAttribute;
    FDsTemperatura: TDictionaryAttribute;
    FTaraCntr: TDictionaryAttribute;
    FVlCubagem: TDictionaryAttribute;
    FDsCarga: TDictionaryAttribute;
    FCdNcm: TDictionaryAttribute;
    FCdEmbalagem: TDictionaryAttribute;
    FDsEmbalagem: TDictionaryAttribute;
    FQtEmbalagem: TDictionaryAttribute;
    FQtPesoBruto: TDictionaryAttribute;
    FVlExcessoCntr: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrAmend: TDictionaryAttribute read FNrAmend;
    property NrCntr: TDictionaryAttribute read FNrCntr;
    property NrLacre: TDictionaryAttribute read FNrLacre;
    property NrLacreSif: TDictionaryAttribute read FNrLacreSif;
    property NmTpCntr: TDictionaryAttribute read FNmTpCntr;
    property CdIso: TDictionaryAttribute read FCdIso;
    property DsTemperatura: TDictionaryAttribute read FDsTemperatura;
    property TaraCntr: TDictionaryAttribute read FTaraCntr;
    property VlCubagem: TDictionaryAttribute read FVlCubagem;
    property DsCarga: TDictionaryAttribute read FDsCarga;
    property CdNcm: TDictionaryAttribute read FCdNcm;
    property CdEmbalagem: TDictionaryAttribute read FCdEmbalagem;
    property DsEmbalagem: TDictionaryAttribute read FDsEmbalagem;
    property QtEmbalagem: TDictionaryAttribute read FQtEmbalagem;
    property QtPesoBruto: TDictionaryAttribute read FQtPesoBruto;
    property VlExcessoCntr: TDictionaryAttribute read FVlExcessoCntr;
  end;
  
  TTprocessoDraftMercTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrAmend: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FCdMercadoria: TDictionaryAttribute;
    FDsMercadoria: TDictionaryAttribute;
    FCdNcm: TDictionaryAttribute;
    FCdEmbalagem: TDictionaryAttribute;
    FDsEmbalagem: TDictionaryAttribute;
    FQtEmbalagem: TDictionaryAttribute;
    FQtPesoBruto: TDictionaryAttribute;
    FVlCubagem: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrAmend: TDictionaryAttribute read FNrAmend;
    property NrItem: TDictionaryAttribute read FNrItem;
    property CdMercadoria: TDictionaryAttribute read FCdMercadoria;
    property DsMercadoria: TDictionaryAttribute read FDsMercadoria;
    property CdNcm: TDictionaryAttribute read FCdNcm;
    property CdEmbalagem: TDictionaryAttribute read FCdEmbalagem;
    property DsEmbalagem: TDictionaryAttribute read FDsEmbalagem;
    property QtEmbalagem: TDictionaryAttribute read FQtEmbalagem;
    property QtPesoBruto: TDictionaryAttribute read FQtPesoBruto;
    property VlCubagem: TDictionaryAttribute read FVlCubagem;
  end;
  
  TTprocessoDraftMercCntrTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrAmend: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FNrCntr: TDictionaryAttribute;
    FQtEmbalagem: TDictionaryAttribute;
    FQtPesoBruto: TDictionaryAttribute;
    FVlCubagem: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrAmend: TDictionaryAttribute read FNrAmend;
    property NrItem: TDictionaryAttribute read FNrItem;
    property NrCntr: TDictionaryAttribute read FNrCntr;
    property QtEmbalagem: TDictionaryAttribute read FQtEmbalagem;
    property QtPesoBruto: TDictionaryAttribute read FQtPesoBruto;
    property VlCubagem: TDictionaryAttribute read FVlCubagem;
  end;
  
  TTtpTaxasInttraTableDictionary = class
  private
    FCdTaxaInttra: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property CdTaxaInttra: TDictionaryAttribute read FCdTaxaInttra;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTprocessoDraftComentariosTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrAmend: TDictionaryAttribute;
    FNrComentario: TDictionaryAttribute;
    FDsComentario: TDictionaryAttribute;
    FTpComentario: TDictionaryAssociation;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrAmend: TDictionaryAttribute read FNrAmend;
    property NrComentario: TDictionaryAttribute read FNrComentario;
    property DsComentario: TDictionaryAttribute read FDsComentario;
    property TpComentario: TDictionaryAssociation read FTpComentario;
  end;
  
  TTtpComentariosInttraTableDictionary = class
  private
    FCdComentarioInntra: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property CdComentarioInntra: TDictionaryAttribute read FCdComentarioInntra;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTtpMovimentoInttraTableDictionary = class
  private
    FCdMovimentoInttra: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property CdMovimentoInttra: TDictionaryAttribute read FCdMovimentoInttra;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TTprocessoExpItemContainerTableDictionary = class
  private
    FNrProcesso: TDictionaryAttribute;
    FNrContr: TDictionaryAttribute;
    FNrItem: TDictionaryAttribute;
    FQtMercadoria: TDictionaryAttribute;
    FQtPesoBruto: TDictionaryAttribute;
    FVlCubagem: TDictionaryAttribute;
  public
    constructor Create;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property NrContr: TDictionaryAttribute read FNrContr;
    property NrItem: TDictionaryAttribute read FNrItem;
    property QtMercadoria: TDictionaryAttribute read FQtMercadoria;
    property QtPesoBruto: TDictionaryAttribute read FQtPesoBruto;
    property VlCubagem: TDictionaryAttribute read FVlCubagem;
  end;
  
  TTdescricaoMercadoriaDraftTableDictionary = class
  private
    FCodigo: TDictionaryAttribute;
    FCdGrupo: TDictionaryAttribute;
    FNmDescricao: TDictionaryAttribute;
    FTxDescricaoPortugues: TDictionaryAttribute;
    FTxDescricaoIngles: TDictionaryAttribute;
    FTxDescricaoEspanhol: TDictionaryAttribute;
  public
    constructor Create;
    property Codigo: TDictionaryAttribute read FCodigo;
    property CdGrupo: TDictionaryAttribute read FCdGrupo;
    property NmDescricao: TDictionaryAttribute read FNmDescricao;
    property TxDescricaoPortugues: TDictionaryAttribute read FTxDescricaoPortugues;
    property TxDescricaoIngles: TDictionaryAttribute read FTxDescricaoIngles;
    property TxDescricaoEspanhol: TDictionaryAttribute read FTxDescricaoEspanhol;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TTagente }

function TTagente.GetCdCidade: TTlocalEmbarque;
begin
  result := FCdCidade.Value;
end;

procedure TTagente.SetCdCidade(const Value: TTlocalEmbarque);
begin
  FCdCidade.Value := Value;
end;

function TTagente.GetPais: TTpaisBroker;
begin
  result := FPais.Value;
end;

procedure TTagente.SetPais(const Value: TTpaisBroker);
begin
  FPais.Value := Value;
end;

{ TTarmazem }

function TTarmazem.GetRecintoAlfandegado: TTrecAlfandegado;
begin
  result := FRecintoAlfandegado.Value;
end;

procedure TTarmazem.SetRecintoAlfandegado(const Value: TTrecAlfandegado);
begin
  FRecintoAlfandegado.Value := Value;
end;

{ TTdespachanteCliente }

function TTdespachanteCliente.GetEmpresa: TTempresaNac;
begin
  result := FEmpresa.Value;
end;

procedure TTdespachanteCliente.SetEmpresa(const Value: TTempresaNac);
begin
  FEmpresa.Value := Value;
end;

function TTdespachanteCliente.GetDespachante: TTdespachante;
begin
  result := FDespachante.Value;
end;

procedure TTdespachanteCliente.SetDespachante(const Value: TTdespachante);
begin
  FDespachante.Value := Value;
end;

{ TTempresaEst }

function TTempresaEst.GetPais: TTpaisBroker;
begin
  result := FPais.Value;
end;

procedure TTempresaEst.SetPais(const Value: TTpaisBroker);
begin
  FPais.Value := Value;
end;

{ TTempresaEstGrupo }

function TTempresaEstGrupo.GetEmpresaEst: TTempresaEst;
begin
  result := FEmpresaEst.Value;
end;

procedure TTempresaEstGrupo.SetEmpresaEst(const Value: TTempresaEst);
begin
  FEmpresaEst.Value := Value;
end;

{ TTempresaNac }

function TTempresaNac.GetGrupo: TTgrupo;
begin
  result := FGrupo.Value;
end;

procedure TTempresaNac.SetGrupo(const Value: TTgrupo);
begin
  FGrupo.Value := Value;
end;

{ TTlocalEmbarque }

function TTlocalEmbarque.GetCdPais: TTpaisBroker;
begin
  result := FCdPais.Value;
end;

procedure TTlocalEmbarque.SetCdPais(const Value: TTpaisBroker);
begin
  FCdPais.Value := Value;
end;

{ TTmercadoriaExp }

function TTmercadoriaExp.GetDescMercadoriaDraft: TTdescricaoMercadoriaDraft;
begin
  result := FDescMercadoriaDraft.Value;
end;

procedure TTmercadoriaExp.SetDescMercadoriaDraft(const Value: TTdescricaoMercadoriaDraft);
begin
  FDescMercadoriaDraft.Value := Value;
end;

{ TTprocesso }

function TTprocesso.GetUnidNeg: TTunidNeg;
begin
  result := FUnidNeg.Value;
end;

procedure TTprocesso.SetUnidNeg(const Value: TTunidNeg);
begin
  FUnidNeg.Value := Value;
end;

function TTprocesso.GetProduto: TTproduto;
begin
  result := FProduto.Value;
end;

procedure TTprocesso.SetProduto(const Value: TTproduto);
begin
  FProduto.Value := Value;
end;

function TTprocesso.GetCliente: TTempresaNac;
begin
  result := FCliente.Value;
end;

procedure TTprocesso.SetCliente(const Value: TTempresaNac);
begin
  FCliente.Value := Value;
end;

function TTprocesso.GetUsuario: TTusuario;
begin
  result := FUsuario.Value;
end;

procedure TTprocesso.SetUsuario(const Value: TTusuario);
begin
  FUsuario.Value := Value;
end;

function TTprocesso.GetMoedaMle: TTmoedaBroker;
begin
  result := FMoedaMle.Value;
end;

procedure TTprocesso.SetMoedaMle(const Value: TTmoedaBroker);
begin
  FMoedaMle.Value := Value;
end;

function TTprocesso.GetPaisDestino: TTpaisBroker;
begin
  result := FPaisDestino.Value;
end;

procedure TTprocesso.SetPaisDestino(const Value: TTpaisBroker);
begin
  FPaisDestino.Value := Value;
end;

function TTprocesso.GetDespachante: TTdespachante;
begin
  result := FDespachante.Value;
end;

procedure TTprocesso.SetDespachante(const Value: TTdespachante);
begin
  FDespachante.Value := Value;
end;

function TTprocesso.GetIncoterm: TTincotermsVenda;
begin
  result := FIncoterm.Value;
end;

procedure TTprocesso.SetIncoterm(const Value: TTincotermsVenda);
begin
  FIncoterm.Value := Value;
end;

function TTprocesso.GetExportador: TTempresaNac;
begin
  result := FExportador.Value;
end;

procedure TTprocesso.SetExportador(const Value: TTempresaNac);
begin
  FExportador.Value := Value;
end;

function TTprocesso.GetImportador: TTempresaEst;
begin
  result := FImportador.Value;
end;

procedure TTprocesso.SetImportador(const Value: TTempresaEst);
begin
  FImportador.Value := Value;
end;

function TTprocesso.GetServico: TVwServicoGeral;
begin
  result := FServico.Value;
end;

procedure TTprocesso.SetServico(const Value: TVwServicoGeral);
begin
  FServico.Value := Value;
end;

function TTprocesso.GetAgente: TTagente;
begin
  result := FAgente.Value;
end;

procedure TTprocesso.SetAgente(const Value: TTagente);
begin
  FAgente.Value := Value;
end;

function TTprocesso.GetNotify1Proc: TTempresaEst;
begin
  result := FNotify1Proc.Value;
end;

procedure TTprocesso.SetNotify1Proc(const Value: TTempresaEst);
begin
  FNotify1Proc.Value := Value;
end;

function TTprocesso.GetNotify2Proc: TTempresaEst;
begin
  result := FNotify2Proc.Value;
end;

procedure TTprocesso.SetNotify2Proc(const Value: TTempresaEst);
begin
  FNotify2Proc.Value := Value;
end;

function TTprocesso.GetConsignee: TTempresaEst;
begin
  result := FConsignee.Value;
end;

procedure TTprocesso.SetConsignee(const Value: TTempresaEst);
begin
  FConsignee.Value := Value;
end;

function TTprocesso.GetEmbarcacao: TTembarcacao;
begin
  result := FEmbarcacao.Value;
end;

procedure TTprocesso.SetEmbarcacao(const Value: TTembarcacao);
begin
  FEmbarcacao.Value := Value;
end;

function TTprocesso.GetLocalEmbarque: TTlocalEmbarque;
begin
  result := FLocalEmbarque.Value;
end;

procedure TTprocesso.SetLocalEmbarque(const Value: TTlocalEmbarque);
begin
  FLocalEmbarque.Value := Value;
end;

function TTprocesso.GetLocalDesembarque: TTlocalEmbarque;
begin
  result := FLocalDesembarque.Value;
end;

procedure TTprocesso.SetLocalDesembarque(const Value: TTlocalEmbarque);
begin
  FLocalDesembarque.Value := Value;
end;

function TTprocesso.GetLocalEntrega: TTlocalEmbarque;
begin
  result := FLocalEntrega.Value;
end;

procedure TTprocesso.SetLocalEntrega(const Value: TTlocalEmbarque);
begin
  FLocalEntrega.Value := Value;
end;

function TTprocesso.GetTpFrete: TTtpFrete;
begin
  result := FTpFrete.Value;
end;

procedure TTprocesso.SetTpFrete(const Value: TTtpFrete);
begin
  FTpFrete.Value := Value;
end;

function TTprocesso.GetViagem: TTviagem;
begin
  result := FViagem.Value;
end;

procedure TTprocesso.SetViagem(const Value: TTviagem);
begin
  FViagem.Value := Value;
end;

constructor TTprocesso.Create;
begin
  inherited;
  FProcessoExp.SetInitialValue(TList<TTprocessoExp>.Create);
end;

destructor TTprocesso.Destroy;
begin
  FProcessoExp.DestroyValue;
  inherited;
end;

function TTprocesso.GetProcessoExp: TList<TTprocessoExp>;
begin
  result := FProcessoExp.Value;
end;

{ TTprocessoCntr }

function TTprocessoCntr.GetTpCntr: TTtpCntr;
begin
  result := FTpCntr.Value;
end;

procedure TTprocessoCntr.SetTpCntr(const Value: TTtpCntr);
begin
  FTpCntr.Value := Value;
end;

function TTprocessoCntr.GetEmbalagem: TTtpEmbalagemInttra;
begin
  result := FEmbalagem.Value;
end;

procedure TTprocessoCntr.SetEmbalagem(const Value: TTtpEmbalagemInttra);
begin
  FEmbalagem.Value := Value;
end;

{ TTprocessoDraftBl }

function TTprocessoDraftBl.GetCdUsuarioCriacao: TTusuario;
begin
  result := FCdUsuarioCriacao.Value;
end;

procedure TTprocessoDraftBl.SetCdUsuarioCriacao(const Value: TTusuario);
begin
  FCdUsuarioCriacao.Value := Value;
end;

function TTprocessoDraftBl.GetCdCollectPrepaid: TTtpFrete;
begin
  result := FCdCollectPrepaid.Value;
end;

procedure TTprocessoDraftBl.SetCdCollectPrepaid(const Value: TTtpFrete);
begin
  FCdCollectPrepaid.Value := Value;
end;

function TTprocessoDraftBl.GetCdTipoPgmtoTaxas: TTtpTaxasInttra;
begin
  result := FCdTipoPgmtoTaxas.Value;
end;

procedure TTprocessoDraftBl.SetCdTipoPgmtoTaxas(const Value: TTtpTaxasInttra);
begin
  FCdTipoPgmtoTaxas.Value := Value;
end;

function TTprocessoDraftBl.GetCdTipoMovimento: TTtpMovimentoInttra;
begin
  result := FCdTipoMovimento.Value;
end;

procedure TTprocessoDraftBl.SetCdTipoMovimento(const Value: TTtpMovimentoInttra);
begin
  FCdTipoMovimento.Value := Value;
end;

function TTprocessoDraftBl.GetNrProcesso: TTprocesso;
begin
  result := FNrProcesso.Value;
end;

procedure TTprocessoDraftBl.SetNrProcesso(const Value: TTprocesso);
begin
  FNrProcesso.Value := Value;
end;

{ TTprocessoDraftComentarios }

function TTprocessoDraftComentarios.GetTpComentario: TTtpComentariosInttra;
begin
  result := FTpComentario.Value;
end;

procedure TTprocessoDraftComentarios.SetTpComentario(const Value: TTtpComentariosInttra);
begin
  FTpComentario.Value := Value;
end;

{ TTprocessoExp }

function TTprocessoExp.GetIncoterm: TTincotermsVenda;
begin
  result := FIncoterm.Value;
end;

procedure TTprocessoExp.SetIncoterm(const Value: TTincotermsVenda);
begin
  FIncoterm.Value := Value;
end;

function TTprocessoExp.GetPaisDestino: TTpaisBroker;
begin
  result := FPaisDestino.Value;
end;

procedure TTprocessoExp.SetPaisDestino(const Value: TTpaisBroker);
begin
  FPaisDestino.Value := Value;
end;

function TTprocessoExp.GetMoeda: TTmoedaBroker;
begin
  result := FMoeda.Value;
end;

procedure TTprocessoExp.SetMoeda(const Value: TTmoedaBroker);
begin
  FMoeda.Value := Value;
end;

function TTprocessoExp.GetUrfDespacho: TTurf;
begin
  result := FUrfDespacho.Value;
end;

procedure TTprocessoExp.SetUrfDespacho(const Value: TTurf);
begin
  FUrfDespacho.Value := Value;
end;

function TTprocessoExp.GetUrfDestino: TTurf;
begin
  result := FUrfDestino.Value;
end;

procedure TTprocessoExp.SetUrfDestino(const Value: TTurf);
begin
  FUrfDestino.Value := Value;
end;

function TTprocessoExp.GetRecAlfandegadoDespacho: TTrecAlfandegado;
begin
  result := FRecAlfandegadoDespacho.Value;
end;

procedure TTprocessoExp.SetRecAlfandegadoDespacho(const Value: TTrecAlfandegado);
begin
  FRecAlfandegadoDespacho.Value := Value;
end;

function TTprocessoExp.GetRecAlfandegadoEmbarque: TTrecAlfandegado;
begin
  result := FRecAlfandegadoEmbarque.Value;
end;

procedure TTprocessoExp.SetRecAlfandegadoEmbarque(const Value: TTrecAlfandegado);
begin
  FRecAlfandegadoEmbarque.Value := Value;
end;

function TTprocessoExp.GetExportador: TTempresaNac;
begin
  result := FExportador.Value;
end;

procedure TTprocessoExp.SetExportador(const Value: TTempresaNac);
begin
  FExportador.Value := Value;
end;

function TTprocessoExp.GetEnquadOp: TTenquadOp;
begin
  result := FEnquadOp.Value;
end;

procedure TTprocessoExp.SetEnquadOp(const Value: TTenquadOp);
begin
  FEnquadOp.Value := Value;
end;

function TTprocessoExp.GetDespachante: TTdespachante;
begin
  result := FDespachante.Value;
end;

procedure TTprocessoExp.SetDespachante(const Value: TTdespachante);
begin
  FDespachante.Value := Value;
end;

function TTprocessoExp.GetProcesso: TTprocesso;
begin
  result := FProcesso.Value;
end;

procedure TTprocessoExp.SetProcesso(const Value: TTprocesso);
begin
  FProcesso.Value := Value;
end;

function TTprocessoExp.GetImportador: TTempresaEst;
begin
  result := FImportador.Value;
end;

procedure TTprocessoExp.SetImportador(const Value: TTempresaEst);
begin
  FImportador.Value := Value;
end;

function TTprocessoExp.GetTipoFrete: TTtpFrete;
begin
  result := FTipoFrete.Value;
end;

procedure TTprocessoExp.SetTipoFrete(const Value: TTtpFrete);
begin
  FTipoFrete.Value := Value;
end;

{ TTprocessoExpItem }

function TTprocessoExpItem.GetCdUnidMedida: TTunidMedidaBroker;
begin
  result := FCdUnidMedida.Value;
end;

procedure TTprocessoExpItem.SetCdUnidMedida(const Value: TTunidMedidaBroker);
begin
  FCdUnidMedida.Value := Value;
end;

function TTprocessoExpItem.GetEmbalagem: TTembalagem;
begin
  result := FEmbalagem.Value;
end;

procedure TTprocessoExpItem.SetEmbalagem(const Value: TTembalagem);
begin
  FEmbalagem.Value := Value;
end;

{ TTprocessoExpNf }

constructor TTprocessoExpNf.Create;
begin
  inherited;
  FProcessoExpNfItem.SetInitialValue(TList<TTprocessoExpNfItem>.Create);
end;

destructor TTprocessoExpNf.Destroy;
begin
  FProcessoExpNfItem.DestroyValue;
  inherited;
end;

function TTprocessoExpNf.GetProcessoExpNfItem: TList<TTprocessoExpNfItem>;
begin
  result := FProcessoExpNfItem.Value;
end;

{ TTprocessoExpNfItem }

function TTprocessoExpNfItem.GetTratamentoPrioritario: TTratamentoPrioritario;
begin
  result := FTratamentoPrioritario.Value;
end;

procedure TTprocessoExpNfItem.SetTratamentoPrioritario(const Value: TTratamentoPrioritario);
begin
  FTratamentoPrioritario.Value := Value;
end;

function TTprocessoExpNfItem.GetProcessoExpNf: TTprocessoExpNf;
begin
  result := FProcessoExpNf.Value;
end;

procedure TTprocessoExpNfItem.SetProcessoExpNf(const Value: TTprocessoExpNf);
begin
  FProcessoExpNf.Value := Value;
end;

function TTprocessoExpNfItem.GetNcm: TTncm;
begin
  result := FNcm.Value;
end;

procedure TTprocessoExpNfItem.SetNcm(const Value: TTncm);
begin
  FNcm.Value := Value;
end;

{ TTregraObsAuto }

function TTregraObsAuto.GetGrupo: TTgrupo;
begin
  result := FGrupo.Value;
end;

procedure TTregraObsAuto.SetGrupo(const Value: TTgrupo);
begin
  FGrupo.Value := Value;
end;

function TTregraObsAuto.GetTabela: TTregraObsAutoTabelas;
begin
  result := FTabela.Value;
end;

procedure TTregraObsAuto.SetTabela(const Value: TTregraObsAutoTabelas);
begin
  FTabela.Value := Value;
end;

function TTregraObsAuto.GetCampo: TTregraObsAutoTabelasCampos;
begin
  result := FCampo.Value;
end;

procedure TTregraObsAuto.SetCampo(const Value: TTregraObsAutoTabelasCampos);
begin
  FCampo.Value := Value;
end;

constructor TTregraObsAuto.Create;
begin
  inherited;
  FRegraItem.SetInitialValue(TList<TTregraObsAutoItem>.Create);
end;

destructor TTregraObsAuto.Destroy;
begin
  FRegraItem.DestroyValue;
  inherited;
end;

function TTregraObsAuto.GetRegraItem: TList<TTregraObsAutoItem>;
begin
  result := FRegraItem.Value;
end;

{ TTregraObsAutoItem }

function TTregraObsAutoItem.GetRegra: TTregraObsAuto;
begin
  result := FRegra.Value;
end;

procedure TTregraObsAutoItem.SetRegra(const Value: TTregraObsAuto);
begin
  FRegra.Value := Value;
end;

function TTregraObsAutoItem.GetTabela: TTregraObsAutoTabelas;
begin
  result := FTabela.Value;
end;

procedure TTregraObsAutoItem.SetTabela(const Value: TTregraObsAutoTabelas);
begin
  FTabela.Value := Value;
end;

function TTregraObsAutoItem.GetCampo: TTregraObsAutoTabelasCampos;
begin
  result := FCampo.Value;
end;

procedure TTregraObsAutoItem.SetCampo(const Value: TTregraObsAutoTabelasCampos);
begin
  FCampo.Value := Value;
end;

{ TTregraObsAutoTabelas }

constructor TTregraObsAutoTabelas.Create;
begin
  inherited;
  FCampos.SetInitialValue(TList<TTregraObsAutoTabelasCampos>.Create);
end;

destructor TTregraObsAutoTabelas.Destroy;
begin
  FCampos.DestroyValue;
  inherited;
end;

function TTregraObsAutoTabelas.GetCampos: TList<TTregraObsAutoTabelasCampos>;
begin
  result := FCampos.Value;
end;

{ TTregraObsAutoTabelasCampos }

function TTregraObsAutoTabelasCampos.GetTabela: TTregraObsAutoTabelas;
begin
  result := FTabela.Value;
end;

procedure TTregraObsAutoTabelasCampos.SetTabela(const Value: TTregraObsAutoTabelas);
begin
  FTabela.Value := Value;
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if FTdescricaoMercadoriaDraft <> nil then FTdescricaoMercadoriaDraft.Free;
  if FTprocessoExpItemContainer <> nil then FTprocessoExpItemContainer.Free;
  if FTtpMovimentoInttra <> nil then FTtpMovimentoInttra.Free;
  if FTtpComentariosInttra <> nil then FTtpComentariosInttra.Free;
  if FTprocessoDraftComentarios <> nil then FTprocessoDraftComentarios.Free;
  if FTtpTaxasInttra <> nil then FTtpTaxasInttra.Free;
  if FTprocessoDraftMercCntr <> nil then FTprocessoDraftMercCntr.Free;
  if FTprocessoDraftMerc <> nil then FTprocessoDraftMerc.Free;
  if FTprocessoDraftCntr <> nil then FTprocessoDraftCntr.Free;
  if FTprocessoDraftBl <> nil then FTprocessoDraftBl.Free;
  if FTprocessoExpNfItemNcmAtributo <> nil then FTprocessoExpNfItemNcmAtributo.Free;
  if FTncmExpAtributoValor <> nil then FTncmExpAtributoValor.Free;
  if FTncmExpAtributo <> nil then FTncmExpAtributo.Free;
  if FVwServicoGeral <> nil then FVwServicoGeral.Free;
  if FVwResumoDi <> nil then FVwResumoDi.Free;
  if FTprocessoExpNfItemNfComplementar <> nil then FTprocessoExpNfItemNfComplementar.Free;
  if FTregraObsAutoTabelasCampos <> nil then FTregraObsAutoTabelasCampos.Free;
  if FTregraObsAutoTabelas <> nil then FTregraObsAutoTabelas.Free;
  if FTregraObsAutoItem <> nil then FTregraObsAutoItem.Free;
  if FTregraObsAuto <> nil then FTregraObsAuto.Free;
  if FTprocessoExpNfItemNotaReferenciada <> nil then FTprocessoExpNfItemNotaReferenciada.Free;
  if FTprocessoExpNfItemLpco <> nil then FTprocessoExpNfItemLpco.Free;
  if FTratamentoPrioritario <> nil then FTratamentoPrioritario.Free;
  if FTncmExpDestaque <> nil then FTncmExpDestaque.Free;
  if FTprocessoExpNfItemEnquadramento <> nil then FTprocessoExpNfItemEnquadramento.Free;
  if FTprocessoExpNfItemNfDrawback <> nil then FTprocessoExpNfItemNfDrawback.Free;
  if FTregraObsDi <> nil then FTregraObsDi.Free;
  if FTviagem <> nil then FTviagem.Free;
  if FTviaTransporte <> nil then FTviaTransporte.Free;
  if FTusuario <> nil then FTusuario.Free;
  if FTurf <> nil then FTurf.Free;
  if FTunidNeg <> nil then FTunidNeg.Free;
  if FTunidMedidaBroker <> nil then FTunidMedidaBroker.Free;
  if FTtpProcessoVinculado <> nil then FTtpProcessoVinculado.Free;
  if FTtpFrete <> nil then FTtpFrete.Free;
  if FTtpExoneracao <> nil then FTtpExoneracao.Free;
  if FTtpEmbalagemInttra <> nil then FTtpEmbalagemInttra.Free;
  if FTtpCntr <> nil then FTtpCntr.Free;
  if FTtpAcordoTarif <> nil then FTtpAcordoTarif.Free;
  if FTservicoNovo <> nil then FTservicoNovo.Free;
  if FTservico <> nil then FTservico.Free;
  if FTregTributario <> nil then FTregTributario.Free;
  if FTrefCliente <> nil then FTrefCliente.Free;
  if FTrecAlfandegado <> nil then FTrecAlfandegado.Free;
  if FTproduto <> nil then FTproduto.Free;
  if FTprocessoExpNfItem <> nil then FTprocessoExpNfItem.Free;
  if FTprocessoExpNf <> nil then FTprocessoExpNf.Free;
  if FTprocessoExpItem <> nil then FTprocessoExpItem.Free;
  if FTprocessoExp <> nil then FTprocessoExp.Free;
  if FTprocessoCntr <> nil then FTprocessoCntr.Free;
  if FTprocesso <> nil then FTprocesso.Free;
  if FTpaisBroker <> nil then FTpaisBroker.Free;
  if FTpais <> nil then FTpais.Free;
  if FTobservacoes <> nil then FTobservacoes.Free;
  if FTncmExp <> nil then FTncmExp.Free;
  if FTncm <> nil then FTncm.Free;
  if FTmoedaBroker <> nil then FTmoedaBroker.Free;
  if FTmercadoriaExp <> nil then FTmercadoriaExp.Free;
  if FTmercadoria <> nil then FTmercadoria.Free;
  if FTlocalEmbarque <> nil then FTlocalEmbarque.Free;
  if FTincotermsVenda <> nil then FTincotermsVenda.Free;
  if FTgrupo <> nil then FTgrupo.Free;
  if FTfundLegRegTribut <> nil then FTfundLegRegTribut.Free;
  if FTfollowup <> nil then FTfollowup.Free;
  if FTenquadOp <> nil then FTenquadOp.Free;
  if FTempresaNac <> nil then FTempresaNac.Free;
  if FTempresaEstGrupo <> nil then FTempresaEstGrupo.Free;
  if FTempresaEst <> nil then FTempresaEst.Free;
  if FTembarcacao <> nil then FTembarcacao.Free;
  if FTembalagem <> nil then FTembalagem.Free;
  if FTdespachanteCliente <> nil then FTdespachanteCliente.Free;
  if FTdespachante <> nil then FTdespachante.Free;
  if FTarmazem <> nil then FTarmazem.Free;
  if FTagente <> nil then FTagente.Free;
  inherited;
end;

function TDicDictionary.GetTagente: TTagenteTableDictionary;
begin
  if FTagente = nil then FTagente := TTagenteTableDictionary.Create;
  result := FTagente;
end;

function TDicDictionary.GetTarmazem: TTarmazemTableDictionary;
begin
  if FTarmazem = nil then FTarmazem := TTarmazemTableDictionary.Create;
  result := FTarmazem;
end;

function TDicDictionary.GetTdespachante: TTdespachanteTableDictionary;
begin
  if FTdespachante = nil then FTdespachante := TTdespachanteTableDictionary.Create;
  result := FTdespachante;
end;

function TDicDictionary.GetTdespachanteCliente: TTdespachanteClienteTableDictionary;
begin
  if FTdespachanteCliente = nil then FTdespachanteCliente := TTdespachanteClienteTableDictionary.Create;
  result := FTdespachanteCliente;
end;

function TDicDictionary.GetTembalagem: TTembalagemTableDictionary;
begin
  if FTembalagem = nil then FTembalagem := TTembalagemTableDictionary.Create;
  result := FTembalagem;
end;

function TDicDictionary.GetTembarcacao: TTembarcacaoTableDictionary;
begin
  if FTembarcacao = nil then FTembarcacao := TTembarcacaoTableDictionary.Create;
  result := FTembarcacao;
end;

function TDicDictionary.GetTempresaEst: TTempresaEstTableDictionary;
begin
  if FTempresaEst = nil then FTempresaEst := TTempresaEstTableDictionary.Create;
  result := FTempresaEst;
end;

function TDicDictionary.GetTempresaEstGrupo: TTempresaEstGrupoTableDictionary;
begin
  if FTempresaEstGrupo = nil then FTempresaEstGrupo := TTempresaEstGrupoTableDictionary.Create;
  result := FTempresaEstGrupo;
end;

function TDicDictionary.GetTempresaNac: TTempresaNacTableDictionary;
begin
  if FTempresaNac = nil then FTempresaNac := TTempresaNacTableDictionary.Create;
  result := FTempresaNac;
end;

function TDicDictionary.GetTenquadOp: TTenquadOpTableDictionary;
begin
  if FTenquadOp = nil then FTenquadOp := TTenquadOpTableDictionary.Create;
  result := FTenquadOp;
end;

function TDicDictionary.GetTfollowup: TTfollowupTableDictionary;
begin
  if FTfollowup = nil then FTfollowup := TTfollowupTableDictionary.Create;
  result := FTfollowup;
end;

function TDicDictionary.GetTfundLegRegTribut: TTfundLegRegTributTableDictionary;
begin
  if FTfundLegRegTribut = nil then FTfundLegRegTribut := TTfundLegRegTributTableDictionary.Create;
  result := FTfundLegRegTribut;
end;

function TDicDictionary.GetTgrupo: TTgrupoTableDictionary;
begin
  if FTgrupo = nil then FTgrupo := TTgrupoTableDictionary.Create;
  result := FTgrupo;
end;

function TDicDictionary.GetTincotermsVenda: TTincotermsVendaTableDictionary;
begin
  if FTincotermsVenda = nil then FTincotermsVenda := TTincotermsVendaTableDictionary.Create;
  result := FTincotermsVenda;
end;

function TDicDictionary.GetTlocalEmbarque: TTlocalEmbarqueTableDictionary;
begin
  if FTlocalEmbarque = nil then FTlocalEmbarque := TTlocalEmbarqueTableDictionary.Create;
  result := FTlocalEmbarque;
end;

function TDicDictionary.GetTmercadoria: TTmercadoriaTableDictionary;
begin
  if FTmercadoria = nil then FTmercadoria := TTmercadoriaTableDictionary.Create;
  result := FTmercadoria;
end;

function TDicDictionary.GetTmercadoriaExp: TTmercadoriaExpTableDictionary;
begin
  if FTmercadoriaExp = nil then FTmercadoriaExp := TTmercadoriaExpTableDictionary.Create;
  result := FTmercadoriaExp;
end;

function TDicDictionary.GetTmoedaBroker: TTmoedaBrokerTableDictionary;
begin
  if FTmoedaBroker = nil then FTmoedaBroker := TTmoedaBrokerTableDictionary.Create;
  result := FTmoedaBroker;
end;

function TDicDictionary.GetTncm: TTncmTableDictionary;
begin
  if FTncm = nil then FTncm := TTncmTableDictionary.Create;
  result := FTncm;
end;

function TDicDictionary.GetTncmExp: TTncmExpTableDictionary;
begin
  if FTncmExp = nil then FTncmExp := TTncmExpTableDictionary.Create;
  result := FTncmExp;
end;

function TDicDictionary.GetTobservacoes: TTobservacoesTableDictionary;
begin
  if FTobservacoes = nil then FTobservacoes := TTobservacoesTableDictionary.Create;
  result := FTobservacoes;
end;

function TDicDictionary.GetTpais: TTpaisTableDictionary;
begin
  if FTpais = nil then FTpais := TTpaisTableDictionary.Create;
  result := FTpais;
end;

function TDicDictionary.GetTpaisBroker: TTpaisBrokerTableDictionary;
begin
  if FTpaisBroker = nil then FTpaisBroker := TTpaisBrokerTableDictionary.Create;
  result := FTpaisBroker;
end;

function TDicDictionary.GetTprocesso: TTprocessoTableDictionary;
begin
  if FTprocesso = nil then FTprocesso := TTprocessoTableDictionary.Create;
  result := FTprocesso;
end;

function TDicDictionary.GetTprocessoCntr: TTprocessoCntrTableDictionary;
begin
  if FTprocessoCntr = nil then FTprocessoCntr := TTprocessoCntrTableDictionary.Create;
  result := FTprocessoCntr;
end;

function TDicDictionary.GetTprocessoExp: TTprocessoExpTableDictionary;
begin
  if FTprocessoExp = nil then FTprocessoExp := TTprocessoExpTableDictionary.Create;
  result := FTprocessoExp;
end;

function TDicDictionary.GetTprocessoExpItem: TTprocessoExpItemTableDictionary;
begin
  if FTprocessoExpItem = nil then FTprocessoExpItem := TTprocessoExpItemTableDictionary.Create;
  result := FTprocessoExpItem;
end;

function TDicDictionary.GetTprocessoExpNf: TTprocessoExpNfTableDictionary;
begin
  if FTprocessoExpNf = nil then FTprocessoExpNf := TTprocessoExpNfTableDictionary.Create;
  result := FTprocessoExpNf;
end;

function TDicDictionary.GetTprocessoExpNfItem: TTprocessoExpNfItemTableDictionary;
begin
  if FTprocessoExpNfItem = nil then FTprocessoExpNfItem := TTprocessoExpNfItemTableDictionary.Create;
  result := FTprocessoExpNfItem;
end;

function TDicDictionary.GetTproduto: TTprodutoTableDictionary;
begin
  if FTproduto = nil then FTproduto := TTprodutoTableDictionary.Create;
  result := FTproduto;
end;

function TDicDictionary.GetTrecAlfandegado: TTrecAlfandegadoTableDictionary;
begin
  if FTrecAlfandegado = nil then FTrecAlfandegado := TTrecAlfandegadoTableDictionary.Create;
  result := FTrecAlfandegado;
end;

function TDicDictionary.GetTrefCliente: TTrefClienteTableDictionary;
begin
  if FTrefCliente = nil then FTrefCliente := TTrefClienteTableDictionary.Create;
  result := FTrefCliente;
end;

function TDicDictionary.GetTregTributario: TTregTributarioTableDictionary;
begin
  if FTregTributario = nil then FTregTributario := TTregTributarioTableDictionary.Create;
  result := FTregTributario;
end;

function TDicDictionary.GetTservico: TTservicoTableDictionary;
begin
  if FTservico = nil then FTservico := TTservicoTableDictionary.Create;
  result := FTservico;
end;

function TDicDictionary.GetTservicoNovo: TTservicoNovoTableDictionary;
begin
  if FTservicoNovo = nil then FTservicoNovo := TTservicoNovoTableDictionary.Create;
  result := FTservicoNovo;
end;

function TDicDictionary.GetTtpAcordoTarif: TTtpAcordoTarifTableDictionary;
begin
  if FTtpAcordoTarif = nil then FTtpAcordoTarif := TTtpAcordoTarifTableDictionary.Create;
  result := FTtpAcordoTarif;
end;

function TDicDictionary.GetTtpCntr: TTtpCntrTableDictionary;
begin
  if FTtpCntr = nil then FTtpCntr := TTtpCntrTableDictionary.Create;
  result := FTtpCntr;
end;

function TDicDictionary.GetTtpEmbalagemInttra: TTtpEmbalagemInttraTableDictionary;
begin
  if FTtpEmbalagemInttra = nil then FTtpEmbalagemInttra := TTtpEmbalagemInttraTableDictionary.Create;
  result := FTtpEmbalagemInttra;
end;

function TDicDictionary.GetTtpExoneracao: TTtpExoneracaoTableDictionary;
begin
  if FTtpExoneracao = nil then FTtpExoneracao := TTtpExoneracaoTableDictionary.Create;
  result := FTtpExoneracao;
end;

function TDicDictionary.GetTtpFrete: TTtpFreteTableDictionary;
begin
  if FTtpFrete = nil then FTtpFrete := TTtpFreteTableDictionary.Create;
  result := FTtpFrete;
end;

function TDicDictionary.GetTtpProcessoVinculado: TTtpProcessoVinculadoTableDictionary;
begin
  if FTtpProcessoVinculado = nil then FTtpProcessoVinculado := TTtpProcessoVinculadoTableDictionary.Create;
  result := FTtpProcessoVinculado;
end;

function TDicDictionary.GetTunidMedidaBroker: TTunidMedidaBrokerTableDictionary;
begin
  if FTunidMedidaBroker = nil then FTunidMedidaBroker := TTunidMedidaBrokerTableDictionary.Create;
  result := FTunidMedidaBroker;
end;

function TDicDictionary.GetTunidNeg: TTunidNegTableDictionary;
begin
  if FTunidNeg = nil then FTunidNeg := TTunidNegTableDictionary.Create;
  result := FTunidNeg;
end;

function TDicDictionary.GetTurf: TTurfTableDictionary;
begin
  if FTurf = nil then FTurf := TTurfTableDictionary.Create;
  result := FTurf;
end;

function TDicDictionary.GetTusuario: TTusuarioTableDictionary;
begin
  if FTusuario = nil then FTusuario := TTusuarioTableDictionary.Create;
  result := FTusuario;
end;

function TDicDictionary.GetTviaTransporte: TTviaTransporteTableDictionary;
begin
  if FTviaTransporte = nil then FTviaTransporte := TTviaTransporteTableDictionary.Create;
  result := FTviaTransporte;
end;

function TDicDictionary.GetTviagem: TTviagemTableDictionary;
begin
  if FTviagem = nil then FTviagem := TTviagemTableDictionary.Create;
  result := FTviagem;
end;

function TDicDictionary.GetTregraObsDi: TTregraObsDiTableDictionary;
begin
  if FTregraObsDi = nil then FTregraObsDi := TTregraObsDiTableDictionary.Create;
  result := FTregraObsDi;
end;

function TDicDictionary.GetTprocessoExpNfItemEnquadramento: TTprocessoExpNfItemEnquadramentoTableDictionary;
begin
  if FTprocessoExpNfItemEnquadramento = nil then FTprocessoExpNfItemEnquadramento := TTprocessoExpNfItemEnquadramentoTableDictionary.Create;
  result := FTprocessoExpNfItemEnquadramento;
end;

function TDicDictionary.GetTprocessoExpNfItemNfDrawback: TTprocessoExpNfItemNfDrawbackTableDictionary;
begin
  if FTprocessoExpNfItemNfDrawback = nil then FTprocessoExpNfItemNfDrawback := TTprocessoExpNfItemNfDrawbackTableDictionary.Create;
  result := FTprocessoExpNfItemNfDrawback;
end;

function TDicDictionary.GetTncmExpDestaque: TTncmExpDestaqueTableDictionary;
begin
  if FTncmExpDestaque = nil then FTncmExpDestaque := TTncmExpDestaqueTableDictionary.Create;
  result := FTncmExpDestaque;
end;

function TDicDictionary.GetTratamentoPrioritario: TTratamentoPrioritarioTableDictionary;
begin
  if FTratamentoPrioritario = nil then FTratamentoPrioritario := TTratamentoPrioritarioTableDictionary.Create;
  result := FTratamentoPrioritario;
end;

function TDicDictionary.GetTprocessoExpNfItemLpco: TTprocessoExpNfItemLpcoTableDictionary;
begin
  if FTprocessoExpNfItemLpco = nil then FTprocessoExpNfItemLpco := TTprocessoExpNfItemLpcoTableDictionary.Create;
  result := FTprocessoExpNfItemLpco;
end;

function TDicDictionary.GetTprocessoExpNfItemNotaReferenciada: TTprocessoExpNfItemNotaReferenciadaTableDictionary;
begin
  if FTprocessoExpNfItemNotaReferenciada = nil then FTprocessoExpNfItemNotaReferenciada := TTprocessoExpNfItemNotaReferenciadaTableDictionary.Create;
  result := FTprocessoExpNfItemNotaReferenciada;
end;

function TDicDictionary.GetTregraObsAuto: TTregraObsAutoTableDictionary;
begin
  if FTregraObsAuto = nil then FTregraObsAuto := TTregraObsAutoTableDictionary.Create;
  result := FTregraObsAuto;
end;

function TDicDictionary.GetTregraObsAutoItem: TTregraObsAutoItemTableDictionary;
begin
  if FTregraObsAutoItem = nil then FTregraObsAutoItem := TTregraObsAutoItemTableDictionary.Create;
  result := FTregraObsAutoItem;
end;

function TDicDictionary.GetTregraObsAutoTabelas: TTregraObsAutoTabelasTableDictionary;
begin
  if FTregraObsAutoTabelas = nil then FTregraObsAutoTabelas := TTregraObsAutoTabelasTableDictionary.Create;
  result := FTregraObsAutoTabelas;
end;

function TDicDictionary.GetTregraObsAutoTabelasCampos: TTregraObsAutoTabelasCamposTableDictionary;
begin
  if FTregraObsAutoTabelasCampos = nil then FTregraObsAutoTabelasCampos := TTregraObsAutoTabelasCamposTableDictionary.Create;
  result := FTregraObsAutoTabelasCampos;
end;

function TDicDictionary.GetTprocessoExpNfItemNfComplementar: TTprocessoExpNfItemNfComplementarTableDictionary;
begin
  if FTprocessoExpNfItemNfComplementar = nil then FTprocessoExpNfItemNfComplementar := TTprocessoExpNfItemNfComplementarTableDictionary.Create;
  result := FTprocessoExpNfItemNfComplementar;
end;

function TDicDictionary.GetVwResumoDi: TVwResumoDiTableDictionary;
begin
  if FVwResumoDi = nil then FVwResumoDi := TVwResumoDiTableDictionary.Create;
  result := FVwResumoDi;
end;

function TDicDictionary.GetVwServicoGeral: TVwServicoGeralTableDictionary;
begin
  if FVwServicoGeral = nil then FVwServicoGeral := TVwServicoGeralTableDictionary.Create;
  result := FVwServicoGeral;
end;

function TDicDictionary.GetTncmExpAtributo: TTncmExpAtributoTableDictionary;
begin
  if FTncmExpAtributo = nil then FTncmExpAtributo := TTncmExpAtributoTableDictionary.Create;
  result := FTncmExpAtributo;
end;

function TDicDictionary.GetTncmExpAtributoValor: TTncmExpAtributoValorTableDictionary;
begin
  if FTncmExpAtributoValor = nil then FTncmExpAtributoValor := TTncmExpAtributoValorTableDictionary.Create;
  result := FTncmExpAtributoValor;
end;

function TDicDictionary.GetTprocessoExpNfItemNcmAtributo: TTprocessoExpNfItemNcmAtributoTableDictionary;
begin
  if FTprocessoExpNfItemNcmAtributo = nil then FTprocessoExpNfItemNcmAtributo := TTprocessoExpNfItemNcmAtributoTableDictionary.Create;
  result := FTprocessoExpNfItemNcmAtributo;
end;

function TDicDictionary.GetTprocessoDraftBl: TTprocessoDraftBlTableDictionary;
begin
  if FTprocessoDraftBl = nil then FTprocessoDraftBl := TTprocessoDraftBlTableDictionary.Create;
  result := FTprocessoDraftBl;
end;

function TDicDictionary.GetTprocessoDraftCntr: TTprocessoDraftCntrTableDictionary;
begin
  if FTprocessoDraftCntr = nil then FTprocessoDraftCntr := TTprocessoDraftCntrTableDictionary.Create;
  result := FTprocessoDraftCntr;
end;

function TDicDictionary.GetTprocessoDraftMerc: TTprocessoDraftMercTableDictionary;
begin
  if FTprocessoDraftMerc = nil then FTprocessoDraftMerc := TTprocessoDraftMercTableDictionary.Create;
  result := FTprocessoDraftMerc;
end;

function TDicDictionary.GetTprocessoDraftMercCntr: TTprocessoDraftMercCntrTableDictionary;
begin
  if FTprocessoDraftMercCntr = nil then FTprocessoDraftMercCntr := TTprocessoDraftMercCntrTableDictionary.Create;
  result := FTprocessoDraftMercCntr;
end;

function TDicDictionary.GetTtpTaxasInttra: TTtpTaxasInttraTableDictionary;
begin
  if FTtpTaxasInttra = nil then FTtpTaxasInttra := TTtpTaxasInttraTableDictionary.Create;
  result := FTtpTaxasInttra;
end;

function TDicDictionary.GetTprocessoDraftComentarios: TTprocessoDraftComentariosTableDictionary;
begin
  if FTprocessoDraftComentarios = nil then FTprocessoDraftComentarios := TTprocessoDraftComentariosTableDictionary.Create;
  result := FTprocessoDraftComentarios;
end;

function TDicDictionary.GetTtpComentariosInttra: TTtpComentariosInttraTableDictionary;
begin
  if FTtpComentariosInttra = nil then FTtpComentariosInttra := TTtpComentariosInttraTableDictionary.Create;
  result := FTtpComentariosInttra;
end;

function TDicDictionary.GetTtpMovimentoInttra: TTtpMovimentoInttraTableDictionary;
begin
  if FTtpMovimentoInttra = nil then FTtpMovimentoInttra := TTtpMovimentoInttraTableDictionary.Create;
  result := FTtpMovimentoInttra;
end;

function TDicDictionary.GetTprocessoExpItemContainer: TTprocessoExpItemContainerTableDictionary;
begin
  if FTprocessoExpItemContainer = nil then FTprocessoExpItemContainer := TTprocessoExpItemContainerTableDictionary.Create;
  result := FTprocessoExpItemContainer;
end;

function TDicDictionary.GetTdescricaoMercadoriaDraft: TTdescricaoMercadoriaDraftTableDictionary;
begin
  if FTdescricaoMercadoriaDraft = nil then FTdescricaoMercadoriaDraft := TTdescricaoMercadoriaDraftTableDictionary.Create;
  result := FTdescricaoMercadoriaDraft;
end;

{ TTagenteTableDictionary }

constructor TTagenteTableDictionary.Create;
begin
  inherited;
  FCdAgente := TDictionaryAttribute.Create('CdAgente');
  FNmAgente := TDictionaryAttribute.Create('NmAgente');
  FNrCgcAgente := TDictionaryAttribute.Create('NrCgcAgente');
  FNrSigla := TDictionaryAttribute.Create('NrSigla');
  FDsEndereco := TDictionaryAttribute.Create('DsEndereco');
  FNrZipCode := TDictionaryAttribute.Create('NrZipCode');
  FDsEmail := TDictionaryAttribute.Create('DsEmail');
  FEndUf := TDictionaryAttribute.Create('EndUf');
  FDsScacCode := TDictionaryAttribute.Create('DsScacCode');
  FCdCidade := TDictionaryAssociation.Create('CdCidade');
  FPais := TDictionaryAssociation.Create('Pais');
end;

{ TTarmazemTableDictionary }

constructor TTarmazemTableDictionary.Create;
begin
  inherited;
  FCdArmazem := TDictionaryAttribute.Create('CdArmazem');
  FNmArmazem := TDictionaryAttribute.Create('NmArmazem');
  FNmSigla := TDictionaryAttribute.Create('NmSigla');
  FInAtracacao := TDictionaryAttribute.Create('InAtracacao');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FRecintoAlfandegado := TDictionaryAssociation.Create('RecintoAlfandegado');
end;

{ TTdespachanteTableDictionary }

constructor TTdespachanteTableDictionary.Create;
begin
  inherited;
  FCdDespachante := TDictionaryAttribute.Create('CdDespachante');
  FNmDespachante := TDictionaryAttribute.Create('NmDespachante');
  FApDespachante := TDictionaryAttribute.Create('ApDespachante');
  FVlMinSda := TDictionaryAttribute.Create('VlMinSda');
  FVlMaxSda := TDictionaryAttribute.Create('VlMaxSda');
  FCdRisc := TDictionaryAttribute.Create('CdRisc');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FCdModSda := TDictionaryAttribute.Create('CdModSda');
  FNrRegistro := TDictionaryAttribute.Create('NrRegistro');
  FCpfDespachante := TDictionaryAttribute.Create('CpfDespachante');
  FCdDespSda := TDictionaryAttribute.Create('CdDespSda');
  FCdProduto := TDictionaryAttribute.Create('CdProduto');
  FNmSenha := TDictionaryAttribute.Create('NmSenha');
  FInConsultaSiscomex := TDictionaryAttribute.Create('InConsultaSiscomex');
  FCdUsuario := TDictionaryAttribute.Create('CdUsuario');
  FDtSenha := TDictionaryAttribute.Create('DtSenha');
end;

{ TTdespachanteClienteTableDictionary }

constructor TTdespachanteClienteTableDictionary.Create;
begin
  inherited;
  FTipo := TDictionaryAttribute.Create('Tipo');
  FEmpresa := TDictionaryAssociation.Create('Empresa');
  FDespachante := TDictionaryAssociation.Create('Despachante');
end;

{ TTembalagemTableDictionary }

constructor TTembalagemTableDictionary.Create;
begin
  inherited;
  FCdEmbalagem := TDictionaryAttribute.Create('CdEmbalagem');
  FNmEmbalagemS := TDictionaryAttribute.Create('NmEmbalagemS');
  FNmEmbalagemP := TDictionaryAttribute.Create('NmEmbalagemP');
end;

{ TTembarcacaoTableDictionary }

constructor TTembarcacaoTableDictionary.Create;
begin
  inherited;
  FCdEmbarcacao := TDictionaryAttribute.Create('CdEmbarcacao');
  FNmEmbarcacao := TDictionaryAttribute.Create('NmEmbarcacao');
end;

{ TTempresaEstTableDictionary }

constructor TTempresaEstTableDictionary.Create;
begin
  inherited;
  FCdEmpresa := TDictionaryAttribute.Create('CdEmpresa');
  FNmEmpresa := TDictionaryAttribute.Create('NmEmpresa');
  FApEmpresa := TDictionaryAttribute.Create('ApEmpresa');
  FEndEmpresa := TDictionaryAttribute.Create('EndEmpresa');
  FEndNumero := TDictionaryAttribute.Create('EndNumero');
  FEndCompl := TDictionaryAttribute.Create('EndCompl');
  FEndCidade := TDictionaryAttribute.Create('EndCidade');
  FEndEstado := TDictionaryAttribute.Create('EndEstado');
  FNrTelefone := TDictionaryAttribute.Create('NrTelefone');
  FNrFax := TDictionaryAttribute.Create('NrFax');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FInAgente := TDictionaryAttribute.Create('InAgente');
  FInBanco := TDictionaryAttribute.Create('InBanco');
  FInImportador := TDictionaryAttribute.Create('InImportador');
  FInSeguradora := TDictionaryAttribute.Create('InSeguradora');
  FInExportador := TDictionaryAttribute.Create('InExportador');
  FNrCliente := TDictionaryAttribute.Create('NrCliente');
  FNmContato := TDictionaryAttribute.Create('NmContato');
  FInComprador := TDictionaryAttribute.Create('InComprador');
  FCgcEmpresa := TDictionaryAttribute.Create('CgcEmpresa');
  FInPoTrans := TDictionaryAttribute.Create('InPoTrans');
  FNrRuc := TDictionaryAttribute.Create('NrRuc');
  FNrNit := TDictionaryAttribute.Create('NrNit');
  FNrCuit := TDictionaryAttribute.Create('NrCuit');
  FPais := TDictionaryAssociation.Create('Pais');
end;

{ TTempresaEstGrupoTableDictionary }

constructor TTempresaEstGrupoTableDictionary.Create;
begin
  inherited;
  FCdGrupo := TDictionaryAttribute.Create('CdGrupo');
  FEmpresaEst := TDictionaryAssociation.Create('EmpresaEst');
end;

{ TTempresaNacTableDictionary }

constructor TTempresaNacTableDictionary.Create;
begin
  inherited;
  FCdEmpresa := TDictionaryAttribute.Create('CdEmpresa');
  FNmEmpresa := TDictionaryAttribute.Create('NmEmpresa');
  FApEmpresa := TDictionaryAttribute.Create('ApEmpresa');
  FEndEmpresa := TDictionaryAttribute.Create('EndEmpresa');
  FEndNumero := TDictionaryAttribute.Create('EndNumero');
  FEndCidade := TDictionaryAttribute.Create('EndCidade');
  FEndBairro := TDictionaryAttribute.Create('EndBairro');
  FEndUf := TDictionaryAttribute.Create('EndUf');
  FEndCep := TDictionaryAttribute.Create('EndCep');
  FCdTipoPessoa := TDictionaryAttribute.Create('CdTipoPessoa');
  FCgcEmpresa := TDictionaryAttribute.Create('CgcEmpresa');
  FCpfEmpresa := TDictionaryAttribute.Create('CpfEmpresa');
  FIeEmpresa := TDictionaryAttribute.Create('IeEmpresa');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FInCliente := TDictionaryAttribute.Create('InCliente');
  FInImportador := TDictionaryAttribute.Create('InImportador');
  FInExportador := TDictionaryAttribute.Create('InExportador');
  FInOutros := TDictionaryAttribute.Create('InOutros');
  FInRepresentante := TDictionaryAttribute.Create('InRepresentante');
  FCdPaisImportador := TDictionaryAttribute.Create('CdPaisImportador');
  FInSeguradora := TDictionaryAttribute.Create('InSeguradora');
  FEndCompl := TDictionaryAttribute.Create('EndCompl');
  FEndComplemento := TDictionaryAttribute.Create('EndComplemento');
  FGrupo := TDictionaryAssociation.Create('Grupo');
end;

{ TTenquadOpTableDictionary }

constructor TTenquadOpTableDictionary.Create;
begin
  inherited;
  FCdEnquadOp := TDictionaryAttribute.Create('CdEnquadOp');
  FNmEnquadOp := TDictionaryAttribute.Create('NmEnquadOp');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
end;

{ TTfollowupTableDictionary }

constructor TTfollowupTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FCdServico := TDictionaryAttribute.Create('CdServico');
  FCdEvento := TDictionaryAttribute.Create('CdEvento');
  FInAplicavel := TDictionaryAttribute.Create('InAplicavel');
  FCdRespRealizacao := TDictionaryAttribute.Create('CdRespRealizacao');
  FDtRealizacao := TDictionaryAttribute.Create('DtRealizacao');
end;

{ TTfundLegRegTributTableDictionary }

constructor TTfundLegRegTributTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTgrupoTableDictionary }

constructor TTgrupoTableDictionary.Create;
begin
  inherited;
  FCdGrupo := TDictionaryAttribute.Create('CdGrupo');
  FNmGrupo := TDictionaryAttribute.Create('NmGrupo');
  FDtInclusao := TDictionaryAttribute.Create('DtInclusao');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FCnpjGrupo := TDictionaryAttribute.Create('CnpjGrupo');
  FDtNovoFollowupImp := TDictionaryAttribute.Create('DtNovoFollowupImp');
  FDtNovoFollowupExp := TDictionaryAttribute.Create('DtNovoFollowupExp');
  FNmEmailDraftBl := TDictionaryAttribute.Create('NmEmailDraftBl');
end;

{ TTincotermsVendaTableDictionary }

constructor TTincotermsVendaTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
  FSinal := TDictionaryAttribute.Create('Sinal');
  FInTipoFrete := TDictionaryAttribute.Create('InTipoFrete');
end;

{ TTlocalEmbarqueTableDictionary }

constructor TTlocalEmbarqueTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
  FCdUnidNegLocal := TDictionaryAttribute.Create('CdUnidNegLocal');
  FCdUf := TDictionaryAttribute.Create('CdUf');
  FCdSigla := TDictionaryAttribute.Create('CdSigla');
  FNmCidade := TDictionaryAttribute.Create('NmCidade');
  FCdPais := TDictionaryAssociation.Create('CdPais');
end;

{ TTmercadoriaTableDictionary }

constructor TTmercadoriaTableDictionary.Create;
begin
  inherited;
  FCdMercadoria := TDictionaryAttribute.Create('CdMercadoria');
  FNmMercadoria := TDictionaryAttribute.Create('NmMercadoria');
  FApMercadoria := TDictionaryAttribute.Create('ApMercadoria');
  FCdGrupo := TDictionaryAttribute.Create('CdGrupo');
  FInNecessitaLi := TDictionaryAttribute.Create('InNecessitaLi');
end;

{ TTmercadoriaExpTableDictionary }

constructor TTmercadoriaExpTableDictionary.Create;
begin
  inherited;
  FCdMercadoria := TDictionaryAttribute.Create('CdMercadoria');
  FNmMercadoria := TDictionaryAttribute.Create('NmMercadoria');
  FApMercadoria := TDictionaryAttribute.Create('ApMercadoria');
  FCdGrupo := TDictionaryAttribute.Create('CdGrupo');
  FInNecessitaLi := TDictionaryAttribute.Create('InNecessitaLi');
  FTxDescIngles := TDictionaryAttribute.Create('TxDescIngles');
  FTxDescEsp := TDictionaryAttribute.Create('TxDescEsp');
  FDescMercadoriaDraft := TDictionaryAssociation.Create('DescMercadoriaDraft');
end;

{ TTmoedaBrokerTableDictionary }

constructor TTmoedaBrokerTableDictionary.Create;
begin
  inherited;
  FCdMoeda := TDictionaryAttribute.Create('CdMoeda');
  FNmMoeda := TDictionaryAttribute.Create('NmMoeda');
  FApMoeda := TDictionaryAttribute.Create('ApMoeda');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
end;

{ TTncmTableDictionary }

constructor TTncmTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
  FUnidadeMedida := TDictionaryAttribute.Create('UnidadeMedida');
  FCdAtributo := TDictionaryAttribute.Create('CdAtributo');
end;

{ TTncmExpTableDictionary }

constructor TTncmExpTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
  FNrSeq := TDictionaryAttribute.Create('NrSeq');
  FTxNcmFatura := TDictionaryAttribute.Create('TxNcmFatura');
end;

{ TTobservacoesTableDictionary }

constructor TTobservacoesTableDictionary.Create;
begin
  inherited;
  FCdObs := TDictionaryAttribute.Create('CdObs');
  FCdProduto := TDictionaryAttribute.Create('CdProduto');
  FTxDescricao := TDictionaryAttribute.Create('TxDescricao');
  FTxObs := TDictionaryAttribute.Create('TxObs');
end;

{ TTpaisTableDictionary }

constructor TTpaisTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTpaisBrokerTableDictionary }

constructor TTpaisBrokerTableDictionary.Create;
begin
  inherited;
  FCdPais := TDictionaryAttribute.Create('CdPais');
  FNmPais := TDictionaryAttribute.Create('NmPais');
  FNmSiglaCrt := TDictionaryAttribute.Create('NmSiglaCrt');
  FNmSigla2l := TDictionaryAttribute.Create('NmSigla2l');
end;

{ TTprocessoTableDictionary }

constructor TTprocessoTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FDtAbertura := TDictionaryAttribute.Create('DtAbertura');
  FInCancelado := TDictionaryAttribute.Create('InCancelado');
  FVlMleMneg := TDictionaryAttribute.Create('VlMleMneg');
  FVlFretePrepaidMneg := TDictionaryAttribute.Create('VlFretePrepaidMneg');
  FVlSeguroMn := TDictionaryAttribute.Create('VlSeguroMn');
  FNrProcessoExpTemp := TDictionaryAttribute.Create('NrProcessoExpTemp');
  FVlPesoLiquido := TDictionaryAttribute.Create('VlPesoLiquido');
  FVlPesoBruto := TDictionaryAttribute.Create('VlPesoBruto');
  FTpProcesso := TDictionaryAttribute.Create('TpProcesso');
  FNrFatura := TDictionaryAttribute.Create('NrFatura');
  FCdGrupo := TDictionaryAttribute.Create('CdGrupo');
  FCdLinguaPedido := TDictionaryAttribute.Create('CdLinguaPedido');
  FCdRuc := TDictionaryAttribute.Create('CdRuc');
  FCdDue := TDictionaryAttribute.Create('CdDue');
  FCdChaveAcessoDue := TDictionaryAttribute.Create('CdChaveAcessoDue');
  FVlDescontoMn := TDictionaryAttribute.Create('VlDescontoMn');
  FVlAcrescimoMn := TDictionaryAttribute.Create('VlAcrescimoMn');
  FInProcessoConsolidado := TDictionaryAttribute.Create('InProcessoConsolidado');
  FUnidNeg := TDictionaryAssociation.Create('UnidNeg');
  FProduto := TDictionaryAssociation.Create('Produto');
  FCliente := TDictionaryAssociation.Create('Cliente');
  FUsuario := TDictionaryAssociation.Create('Usuario');
  FMoedaMle := TDictionaryAssociation.Create('MoedaMle');
  FPaisDestino := TDictionaryAssociation.Create('PaisDestino');
  FDespachante := TDictionaryAssociation.Create('Despachante');
  FIncoterm := TDictionaryAssociation.Create('Incoterm');
  FExportador := TDictionaryAssociation.Create('Exportador');
  FImportador := TDictionaryAssociation.Create('Importador');
  FServico := TDictionaryAssociation.Create('Servico');
  FAgente := TDictionaryAssociation.Create('Agente');
  FNotify1Proc := TDictionaryAssociation.Create('Notify1Proc');
  FNotify2Proc := TDictionaryAssociation.Create('Notify2Proc');
  FConsignee := TDictionaryAssociation.Create('Consignee');
  FEmbarcacao := TDictionaryAssociation.Create('Embarcacao');
  FLocalEmbarque := TDictionaryAssociation.Create('LocalEmbarque');
  FLocalDesembarque := TDictionaryAssociation.Create('LocalDesembarque');
  FLocalEntrega := TDictionaryAssociation.Create('LocalEntrega');
  FTpFrete := TDictionaryAssociation.Create('TpFrete');
  FViagem := TDictionaryAssociation.Create('Viagem');
end;

{ TTprocessoCntrTableDictionary }

constructor TTprocessoCntrTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrCntr := TDictionaryAttribute.Create('NrCntr');
  FNrLacre := TDictionaryAttribute.Create('NrLacre');
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FVlCustoTotal := TDictionaryAttribute.Create('VlCustoTotal');
  FVlCubagem := TDictionaryAttribute.Create('VlCubagem');
  FNrLacreSif := TDictionaryAttribute.Create('NrLacreSif');
  FTaraCntr := TDictionaryAttribute.Create('TaraCntr');
  FVlPesoBruto := TDictionaryAttribute.Create('VlPesoBruto');
  FVlPesoLiquido := TDictionaryAttribute.Create('VlPesoLiquido');
  FVlQuantidadeEmbalagem := TDictionaryAttribute.Create('VlQuantidadeEmbalagem');
  FDsTemperatura := TDictionaryAttribute.Create('DsTemperatura');
  FCdNcm := TDictionaryAttribute.Create('CdNcm');
  FTpCntr := TDictionaryAssociation.Create('TpCntr');
  FEmbalagem := TDictionaryAssociation.Create('Embalagem');
end;

{ TTprocessoExpTableDictionary }

constructor TTprocessoExpTableDictionary.Create;
begin
  inherited;
  FCdAgente := TDictionaryAttribute.Create('CdAgente');
  FCdViaTransporte := TDictionaryAttribute.Create('CdViaTransporte');
  FCdTransportadora := TDictionaryAttribute.Create('CdTransportadora');
  FCdSeguradora := TDictionaryAttribute.Create('CdSeguradora');
  FCdRepresentante := TDictionaryAttribute.Create('CdRepresentante');
  FCdLocalOrigem := TDictionaryAttribute.Create('CdLocalOrigem');
  FCdLocalDestino := TDictionaryAttribute.Create('CdLocalDestino');
  FDtRegistroPedido := TDictionaryAttribute.Create('DtRegistroPedido');
  FTxMarcacaoVolume := TDictionaryAttribute.Create('TxMarcacaoVolume');
  FVlFrete := TDictionaryAttribute.Create('VlFrete');
  FVlSeguro := TDictionaryAttribute.Create('VlSeguro');
  FVlPesoLiquido := TDictionaryAttribute.Create('VlPesoLiquido');
  FVlDesconto := TDictionaryAttribute.Create('VlDesconto');
  FVlComissaoPercent := TDictionaryAttribute.Create('VlComissaoPercent');
  FVlTotMcv := TDictionaryAttribute.Create('VlTotMcv');
  FVlTotExw := TDictionaryAttribute.Create('VlTotExw');
  FInDue := TDictionaryAttribute.Create('InDue');
  FInRecAlfandegadoDespacho := TDictionaryAttribute.Create('InRecAlfandegadoDespacho');
  FNmRefEndRecAlfandDespacho := TDictionaryAttribute.Create('NmRefEndRecAlfandDespacho');
  FInUmEnquadPorProc := TDictionaryAttribute.Create('InUmEnquadPorProc');
  FTxInformacoesAdicionais := TDictionaryAttribute.Create('TxInformacoesAdicionais');
  FCdStatusDue := TDictionaryAttribute.Create('CdStatusDue');
  FDtEnvioDue := TDictionaryAttribute.Create('DtEnvioDue');
  FCdChaveAcessoDue := TDictionaryAttribute.Create('CdChaveAcessoDue');
  FInTipoDocumentoDue := TDictionaryAttribute.Create('InTipoDocumentoDue');
  FNrProcesssoAdmImp := TDictionaryAttribute.Create('NrProcesssoAdmImp');
  FTxMotivoRetificacao := TDictionaryAttribute.Create('TxMotivoRetificacao');
  FQtDiasPrazoValidadeExpTemp := TDictionaryAttribute.Create('QtDiasPrazoValidadeExpTemp');
  FInRecAlfandegadoEmbarque := TDictionaryAttribute.Create('InRecAlfandegadoEmbarque');
  FNmRefEndRecAlfandEmbarque := TDictionaryAttribute.Create('NmRefEndRecAlfandEmbarque');
  FIncoterm := TDictionaryAssociation.Create('Incoterm');
  FPaisDestino := TDictionaryAssociation.Create('PaisDestino');
  FMoeda := TDictionaryAssociation.Create('Moeda');
  FUrfDespacho := TDictionaryAssociation.Create('UrfDespacho');
  FUrfDestino := TDictionaryAssociation.Create('UrfDestino');
  FRecAlfandegadoDespacho := TDictionaryAssociation.Create('RecAlfandegadoDespacho');
  FRecAlfandegadoEmbarque := TDictionaryAssociation.Create('RecAlfandegadoEmbarque');
  FExportador := TDictionaryAssociation.Create('Exportador');
  FEnquadOp := TDictionaryAssociation.Create('EnquadOp');
  FDespachante := TDictionaryAssociation.Create('Despachante');
  FProcesso := TDictionaryAssociation.Create('Processo');
  FImportador := TDictionaryAssociation.Create('Importador');
  FTipoFrete := TDictionaryAssociation.Create('TipoFrete');
end;

{ TTprocessoExpItemTableDictionary }

constructor TTprocessoExpItemTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FCdMercadoria := TDictionaryAttribute.Create('CdMercadoria');
  FCdNcm := TDictionaryAttribute.Create('CdNcm');
  FQtEmbalagem := TDictionaryAttribute.Create('QtEmbalagem');
  FQtMercadoria := TDictionaryAttribute.Create('QtMercadoria');
  FVlTotPesoLiq := TDictionaryAttribute.Create('VlTotPesoLiq');
  FVlTotPesoBruto := TDictionaryAttribute.Create('VlTotPesoBruto');
  FVlCubagem := TDictionaryAttribute.Create('VlCubagem');
  FVlMle := TDictionaryAttribute.Create('VlMle');
  FInAcordo := TDictionaryAttribute.Create('InAcordo');
  FCdUnidMedida := TDictionaryAssociation.Create('CdUnidMedida');
  FEmbalagem := TDictionaryAssociation.Create('Embalagem');
end;

{ TTprocessoExpNfTableDictionary }

constructor TTprocessoExpNfTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrNf := TDictionaryAttribute.Create('NrNf');
  FDtNota := TDictionaryAttribute.Create('DtNota');
  FVlNota := TDictionaryAttribute.Create('VlNota');
  FNfSerie := TDictionaryAttribute.Create('NfSerie');
  FVlTaxa := TDictionaryAttribute.Create('VlTaxa');
  FNrRe := TDictionaryAttribute.Create('NrRe');
  FChaveNota := TDictionaryAttribute.Create('ChaveNota');
  FVlTotalProdutos := TDictionaryAttribute.Create('VlTotalProdutos');
  FVlFrete := TDictionaryAttribute.Create('VlFrete');
  FVlSeguro := TDictionaryAttribute.Create('VlSeguro');
  FVlTotalDescontos := TDictionaryAttribute.Create('VlTotalDescontos');
  FVlOutrasDespesas := TDictionaryAttribute.Create('VlOutrasDespesas');
  FPlMercadoriaTotal := TDictionaryAttribute.Create('PlMercadoriaTotal');
  FQtComercialTotal := TDictionaryAttribute.Create('QtComercialTotal');
  FQtTributavelTotal := TDictionaryAttribute.Create('QtTributavelTotal');
  FVlMleMneg := TDictionaryAttribute.Create('VlMleMneg');
  FVlLocalEmbarqueTotal := TDictionaryAttribute.Create('VlLocalEmbarqueTotal');
  FVlCondicaoVendaTotal := TDictionaryAttribute.Create('VlCondicaoVendaTotal');
  FInNfRetificacao := TDictionaryAttribute.Create('InNfRetificacao');
end;

{ TTprocessoExpNfItemTableDictionary }

constructor TTprocessoExpNfItemTableDictionary.Create;
begin
  inherited;
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FPlMercadoria := TDictionaryAttribute.Create('PlMercadoria');
  FCdMercadoria := TDictionaryAttribute.Create('CdMercadoria');
  FNmMercadoria := TDictionaryAttribute.Create('NmMercadoria');
  FApMercadoria := TDictionaryAttribute.Create('ApMercadoria');
  FVlLocalEmbarque := TDictionaryAttribute.Create('VlLocalEmbarque');
  FVlCondicaoVenda := TDictionaryAttribute.Create('VlCondicaoVenda');
  FVlItem := TDictionaryAttribute.Create('VlItem');
  FVlOutrasDesp := TDictionaryAttribute.Create('VlOutrasDesp');
  FVlDesconto := TDictionaryAttribute.Create('VlDesconto');
  FVlTotalFrete := TDictionaryAttribute.Create('VlTotalFrete');
  FVlSeguro := TDictionaryAttribute.Create('VlSeguro');
  FUnComercial := TDictionaryAttribute.Create('UnComercial');
  FQtComercial := TDictionaryAttribute.Create('QtComercial');
  FUnTributavel := TDictionaryAttribute.Create('UnTributavel');
  FQtTributavel := TDictionaryAttribute.Create('QtTributavel');
  FVlItemMneg := TDictionaryAttribute.Create('VlItemMneg');
  FVlOutrasDespMneg := TDictionaryAttribute.Create('VlOutrasDespMneg');
  FVlDescontoMneg := TDictionaryAttribute.Create('VlDescontoMneg');
  FVlTotalFreteMneg := TDictionaryAttribute.Create('VlTotalFreteMneg');
  FVlSeguroMneg := TDictionaryAttribute.Create('VlSeguroMneg');
  FTxLog := TDictionaryAttribute.Create('TxLog');
  FCdNcmDestaqueDominio := TDictionaryAttribute.Create('CdNcmDestaqueDominio');
  FNrItemNf := TDictionaryAttribute.Create('NrItemNf');
  FNrItemDue := TDictionaryAttribute.Create('NrItemDue');
  FInVerificacaoEstatistica := TDictionaryAttribute.Create('InVerificacaoEstatistica');
  FNrDeclaracaoImp := TDictionaryAttribute.Create('NrDeclaracaoImp');
  FNrAdicaoImp := TDictionaryAttribute.Create('NrAdicaoImp');
  FNrAtoConcessorioDrawback := TDictionaryAttribute.Create('NrAtoConcessorioDrawback');
  FNrItemAtoConcessorioDrawback := TDictionaryAttribute.Create('NrItemAtoConcessorioDrawback');
  FCnpjAtoConcessorioDrawback := TDictionaryAttribute.Create('CnpjAtoConcessorioDrawback');
  FNmSituacaoNcmAtributo := TDictionaryAttribute.Create('NmSituacaoNcmAtributo');
  FTratamentoPrioritario := TDictionaryAssociation.Create('TratamentoPrioritario');
  FProcessoExpNf := TDictionaryAssociation.Create('ProcessoExpNf');
  FNcm := TDictionaryAssociation.Create('Ncm');
end;

{ TTprodutoTableDictionary }

constructor TTprodutoTableDictionary.Create;
begin
  inherited;
  FCdProduto := TDictionaryAttribute.Create('CdProduto');
  FNmProduto := TDictionaryAttribute.Create('NmProduto');
  FApProduto := TDictionaryAttribute.Create('ApProduto');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FCdViatransp := TDictionaryAttribute.Create('CdViatransp');
end;

{ TTrecAlfandegadoTableDictionary }

constructor TTrecAlfandegadoTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
  FCodOrgaoRec := TDictionaryAttribute.Create('CodOrgaoRec');
end;

{ TTrefClienteTableDictionary }

constructor TTrefClienteTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrSequencia := TDictionaryAttribute.Create('NrSequencia');
  FCdReferencia := TDictionaryAttribute.Create('CdReferencia');
  FCdRefExp := TDictionaryAttribute.Create('CdRefExp');
  FDtReferencia := TDictionaryAttribute.Create('DtReferencia');
  FTpReferencia := TDictionaryAttribute.Create('TpReferencia');
  FCdArea := TDictionaryAttribute.Create('CdArea');
  FNrItemPo := TDictionaryAttribute.Create('NrItemPo');
  FNrParcial := TDictionaryAttribute.Create('NrParcial');
  FInFlagLi := TDictionaryAttribute.Create('InFlagLi');
  FCdEmpresa := TDictionaryAttribute.Create('CdEmpresa');
end;

{ TTregTributarioTableDictionary }

constructor TTregTributarioTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTservicoTableDictionary }

constructor TTservicoTableDictionary.Create;
begin
  inherited;
  FCdServico := TDictionaryAttribute.Create('CdServico');
  FNmServico := TDictionaryAttribute.Create('NmServico');
  FCdClassificacao := TDictionaryAttribute.Create('CdClassificacao');
  FCdViaTransporte := TDictionaryAttribute.Create('CdViaTransporte');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FInCheck := TDictionaryAttribute.Create('InCheck');
end;

{ TTservicoNovoTableDictionary }

constructor TTservicoNovoTableDictionary.Create;
begin
  inherited;
  FCdServico := TDictionaryAttribute.Create('CdServico');
  FNmServico := TDictionaryAttribute.Create('NmServico');
  FCdClassificacao := TDictionaryAttribute.Create('CdClassificacao');
  FCdViaTransporte := TDictionaryAttribute.Create('CdViaTransporte');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FInCheck := TDictionaryAttribute.Create('InCheck');
end;

{ TTtpAcordoTarifTableDictionary }

constructor TTtpAcordoTarifTableDictionary.Create;
begin
  inherited;
  FCdTipoAcordoTar := TDictionaryAttribute.Create('CdTipoAcordoTar');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTtpCntrTableDictionary }

constructor TTtpCntrTableDictionary.Create;
begin
  inherited;
  FTpCntr := TDictionaryAttribute.Create('TpCntr');
  FNmTpCntr := TDictionaryAttribute.Create('NmTpCntr');
  FCdIso := TDictionaryAttribute.Create('CdIso');
end;

{ TTtpEmbalagemInttraTableDictionary }

constructor TTtpEmbalagemInttraTableDictionary.Create;
begin
  inherited;
  FCdEmbalagem := TDictionaryAttribute.Create('CdEmbalagem');
  FNmEmbalagem := TDictionaryAttribute.Create('NmEmbalagem');
  FCdEdifact := TDictionaryAttribute.Create('CdEdifact');
  FCdAnsi := TDictionaryAttribute.Create('CdAnsi');
end;

{ TTtpExoneracaoTableDictionary }

constructor TTtpExoneracaoTableDictionary.Create;
begin
  inherited;
  FCdEx := TDictionaryAttribute.Create('CdEx');
  FNmEx := TDictionaryAttribute.Create('NmEx');
  FCdTrib := TDictionaryAttribute.Create('CdTrib');
  FNmFundLegal := TDictionaryAttribute.Create('NmFundLegal');
end;

{ TTtpFreteTableDictionary }

constructor TTtpFreteTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTtpProcessoVinculadoTableDictionary }

constructor TTtpProcessoVinculadoTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTunidMedidaBrokerTableDictionary }

constructor TTunidMedidaBrokerTableDictionary.Create;
begin
  inherited;
  FCdUnidMedida := TDictionaryAttribute.Create('CdUnidMedida');
  FNmUnidMedida := TDictionaryAttribute.Create('NmUnidMedida');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FCdGiplite := TDictionaryAttribute.Create('CdGiplite');
  FNmSigla := TDictionaryAttribute.Create('NmSigla');
  FCdScxExp := TDictionaryAttribute.Create('CdScxExp');
  FNmUnidMedidaIng := TDictionaryAttribute.Create('NmUnidMedidaIng');
  FNmUnidMedidaEsp := TDictionaryAttribute.Create('NmUnidMedidaEsp');
  FNmSiglaIng := TDictionaryAttribute.Create('NmSiglaIng');
  FNmSiglaEsp := TDictionaryAttribute.Create('NmSiglaEsp');
end;

{ TTunidNegTableDictionary }

constructor TTunidNegTableDictionary.Create;
begin
  inherited;
  FCdUnidNeg := TDictionaryAttribute.Create('CdUnidNeg');
  FNmUnidNeg := TDictionaryAttribute.Create('NmUnidNeg');
  FApUnidNeg := TDictionaryAttribute.Create('ApUnidNeg');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
end;

{ TTurfTableDictionary }

constructor TTurfTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
  FCdDigito := TDictionaryAttribute.Create('CdDigito');
  FEndUf := TDictionaryAttribute.Create('EndUf');
end;

{ TTusuarioTableDictionary }

constructor TTusuarioTableDictionary.Create;
begin
  inherited;
  FCdUsuario := TDictionaryAttribute.Create('CdUsuario');
  FCdSenha := TDictionaryAttribute.Create('CdSenha');
  FCdCargo := TDictionaryAttribute.Create('CdCargo');
  FNmUsuario := TDictionaryAttribute.Create('NmUsuario');
  FApUsuario := TDictionaryAttribute.Create('ApUsuario');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FNmEmail := TDictionaryAttribute.Create('NmEmail');
end;

{ TTviaTransporteTableDictionary }

constructor TTviaTransporteTableDictionary.Create;
begin
  inherited;
  FCdViaTransporte := TDictionaryAttribute.Create('CdViaTransporte');
  FNmViaTransporte := TDictionaryAttribute.Create('NmViaTransporte');
end;

{ TTviagemTableDictionary }

constructor TTviagemTableDictionary.Create;
begin
  inherited;
  FCdUnidNeg := TDictionaryAttribute.Create('CdUnidNeg');
  FCdProduto := TDictionaryAttribute.Create('CdProduto');
  FCdEmbarcacao := TDictionaryAttribute.Create('CdEmbarcacao');
  FNrViagem := TDictionaryAttribute.Create('NrViagem');
  FCdLocal := TDictionaryAttribute.Create('CdLocal');
  FNrViagemArmador := TDictionaryAttribute.Create('NrViagemArmador');
  FDtCriacaoViagem := TDictionaryAttribute.Create('DtCriacaoViagem');
end;

{ TTregraObsDiTableDictionary }

constructor TTregraObsDiTableDictionary.Create;
begin
  inherited;
  FCdRegra := TDictionaryAttribute.Create('CdRegra');
  FNmRegra := TDictionaryAttribute.Create('NmRegra');
  FCdGrupo := TDictionaryAttribute.Create('CdGrupo');
  FNmTabelaRegra := TDictionaryAttribute.Create('NmTabelaRegra');
  FNmCampoRegra := TDictionaryAttribute.Create('NmCampoRegra');
  FNmTabelaOrigem := TDictionaryAttribute.Create('NmTabelaOrigem');
  FNmCampoOrigem := TDictionaryAttribute.Create('NmCampoOrigem');
  FNmValorCampo := TDictionaryAttribute.Create('NmValorCampo');
  FCdObservacao := TDictionaryAttribute.Create('CdObservacao');
  FCdRegraRelacionada := TDictionaryAttribute.Create('CdRegraRelacionada');
end;

{ TTprocessoExpNfItemEnquadramentoTableDictionary }

constructor TTprocessoExpNfItemEnquadramentoTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrNf := TDictionaryAttribute.Create('NrNf');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FNrSeqEnquadramento := TDictionaryAttribute.Create('NrSeqEnquadramento');
  FCdEnquadramento := TDictionaryAttribute.Create('CdEnquadramento');
end;

{ TTprocessoExpNfItemNfDrawbackTableDictionary }

constructor TTprocessoExpNfItemNfDrawbackTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrNf := TDictionaryAttribute.Create('NrNf');
  FNrItem := TDictionaryAttribute.Create('NrItem');

  FNrSeqNfDrawback :=  TDictionaryAttribute.Create('NrSeqNfDrawback');
  FNrChaveAcessoNf := TDictionaryAttribute.Create('NrChaveAcessoNf');
  FQuantidadeNf := TDictionaryAttribute.Create('QuantidadeNf');
  FDataNf := TDictionaryAttribute.Create('DataNf');
  FValorMoedaNegociacaoNf := TDictionaryAttribute.Create('ValorMoedaNegociacaoNf');
end;

{ TTncmExpDestaqueTableDictionary }

constructor TTncmExpDestaqueTableDictionary.Create;
begin
  inherited;
  FCodigoNcm := TDictionaryAttribute.Create('CodigoNcm');
  FCdAtributo := TDictionaryAttribute.Create('CdAtributo');
  FCdDominio := TDictionaryAttribute.Create('CdDominio');
  FNmDominio := TDictionaryAttribute.Create('NmDominio');
end;

{ TTratamentoPrioritarioTableDictionary }

constructor TTratamentoPrioritarioTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTprocessoExpNfItemLpcoTableDictionary }

constructor TTprocessoExpNfItemLpcoTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrNf := TDictionaryAttribute.Create('NrNf');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FNrSeqLpco := TDictionaryAttribute.Create('NrSeqLpco');
  FCdLpco := TDictionaryAttribute.Create('CdLpco');
end;

{ TTprocessoExpNfItemNotaReferenciadaTableDictionary }

constructor TTprocessoExpNfItemNotaReferenciadaTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrNf := TDictionaryAttribute.Create('NrNf');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FNrItemNfRef := TDictionaryAttribute.Create('NrItemNfRef');
  FChaveAcesso := TDictionaryAttribute.Create('ChaveAcesso');
  FQtTributavel := TDictionaryAttribute.Create('QtTributavel');
  FNrItemNfRefItem := TDictionaryAttribute.Create('NrItemNfRefItem');
  FNrCpfCnpjSubmitter := TDictionaryAttribute.Create('NrCpfCnpjSubmitter');
end;

{ TTregraObsAutoTableDictionary }

constructor TTregraObsAutoTableDictionary.Create;
begin
  inherited;
  FCdRegra := TDictionaryAttribute.Create('CdRegra');
  FNmRegra := TDictionaryAttribute.Create('NmRegra');
  FNmValorCampo := TDictionaryAttribute.Create('NmValorCampo');
  FCdObservacao := TDictionaryAttribute.Create('CdObservacao');
  FCdServico := TDictionaryAttribute.Create('CdServico');
  FGrupo := TDictionaryAssociation.Create('Grupo');
  FTabela := TDictionaryAssociation.Create('Tabela');
  FCampo := TDictionaryAssociation.Create('Campo');
end;

{ TTregraObsAutoItemTableDictionary }

constructor TTregraObsAutoItemTableDictionary.Create;
begin
  inherited;
  FCdRegraItem := TDictionaryAttribute.Create('CdRegraItem');
  FNmRegraItem := TDictionaryAttribute.Create('NmRegraItem');
  FNmValorCampo := TDictionaryAttribute.Create('NmValorCampo');
  FRegra := TDictionaryAssociation.Create('Regra');
  FTabela := TDictionaryAssociation.Create('Tabela');
  FCampo := TDictionaryAssociation.Create('Campo');
end;

{ TTregraObsAutoTabelasTableDictionary }

constructor TTregraObsAutoTabelasTableDictionary.Create;
begin
  inherited;
  FCdRegraTabela := TDictionaryAttribute.Create('CdRegraTabela');
  FNmTabelaRegra := TDictionaryAttribute.Create('NmTabelaRegra');
  FDsTabelaRegra := TDictionaryAttribute.Create('DsTabelaRegra');
end;

{ TTregraObsAutoTabelasCamposTableDictionary }

constructor TTregraObsAutoTabelasCamposTableDictionary.Create;
begin
  inherited;
  FCdRegraCampo := TDictionaryAttribute.Create('CdRegraCampo');
  FNmCampo := TDictionaryAttribute.Create('NmCampo');
  FDsCampo := TDictionaryAttribute.Create('DsCampo');
  FNmTabelaOrigem := TDictionaryAttribute.Create('NmTabelaOrigem');
  FNmCampoCdOrigem := TDictionaryAttribute.Create('NmCampoCdOrigem');
  FNmCampoDsOrigem := TDictionaryAttribute.Create('NmCampoDsOrigem');
  FTxWhereExtra := TDictionaryAttribute.Create('TxWhereExtra');
  FTabela := TDictionaryAssociation.Create('Tabela');
end;

{ TTprocessoExpNfItemNfComplementarTableDictionary }

constructor TTprocessoExpNfItemNfComplementarTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrNf := TDictionaryAttribute.Create('NrNf');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FChaveAcesso := TDictionaryAttribute.Create('ChaveAcesso');
  FNrItemNfComplementarItem := TDictionaryAttribute.Create('NrItemNfComplementarItem');
end;

{ TVwResumoDiTableDictionary }

constructor TVwResumoDiTableDictionary.Create;
begin
  inherited;
  FNrProcessoCompleto := TDictionaryAttribute.Create('NrProcessoCompleto');
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FVlTotalIi := TDictionaryAttribute.Create('VlTotalIi');
  FVlTotalIpi := TDictionaryAttribute.Create('VlTotalIpi');
  FVlTotIcms := TDictionaryAttribute.Create('VlTotIcms');
  FVlTributoPago := TDictionaryAttribute.Create('VlTributoPago');
  FVlPis := TDictionaryAttribute.Create('VlPis');
  FVlCofins := TDictionaryAttribute.Create('VlCofins');
  FVlIcmsARecolherAfrmm := TDictionaryAttribute.Create('VlIcmsARecolherAfrmm');
  FVlAfrmm := TDictionaryAttribute.Create('VlAfrmm');
  FVlTotalAntidumping := TDictionaryAttribute.Create('VlTotalAntidumping');
  FVlImpostos := TDictionaryAttribute.Create('VlImpostos');
  FVlIcmsAcrescimos := TDictionaryAttribute.Create('VlIcmsAcrescimos');
end;

{ TVwServicoGeralTableDictionary }

constructor TVwServicoGeralTableDictionary.Create;
begin
  inherited;
  FCdServico := TDictionaryAttribute.Create('CdServico');
  FNmServico := TDictionaryAttribute.Create('NmServico');
  FCdViaTransporte := TDictionaryAttribute.Create('CdViaTransporte');
  FInAtivo := TDictionaryAttribute.Create('InAtivo');
  FInNovoServico := TDictionaryAttribute.Create('InNovoServico');
end;

{ TTncmExpAtributoTableDictionary }

constructor TTncmExpAtributoTableDictionary.Create;
begin
  inherited;
  FCdNcm := TDictionaryAttribute.Create('CdNcm');
  FCdAtributo := TDictionaryAttribute.Create('CdAtributo');
  FNmAtributo := TDictionaryAttribute.Create('NmAtributo');
  FNmFormaPreenchimento := TDictionaryAttribute.Create('NmFormaPreenchimento');
  FInObrigatorio := TDictionaryAttribute.Create('InObrigatorio');
  FDtInicioVigencia := TDictionaryAttribute.Create('DtInicioVigencia');
end;

{ TTncmExpAtributoValorTableDictionary }

constructor TTncmExpAtributoValorTableDictionary.Create;
begin
  inherited;
  FCdNcm := TDictionaryAttribute.Create('CdNcm');
  FCdAtributo := TDictionaryAttribute.Create('CdAtributo');
  FCdAtributoValor := TDictionaryAttribute.Create('CdAtributoValor');
  FNmAtributoValor := TDictionaryAttribute.Create('NmAtributoValor');
  FNmAtributo := TDictionaryAttribute.Create('NmAtributo');
end;

{ TTprocessoExpNfItemNcmAtributoTableDictionary }

constructor TTprocessoExpNfItemNcmAtributoTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrNf := TDictionaryAttribute.Create('NrNf');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FCdNcm := TDictionaryAttribute.Create('CdNcm');
  FCdAtributo := TDictionaryAttribute.Create('CdAtributo');
  FCdAtributoValor := TDictionaryAttribute.Create('CdAtributoValor');
end;

{ TTprocessoDraftBlTableDictionary }

constructor TTprocessoDraftBlTableDictionary.Create;
begin
  inherited;
  FNrAmend := TDictionaryAttribute.Create('NrAmend');
  FDtCriacao := TDictionaryAttribute.Create('DtCriacao');
  FDtEnvioDraft := TDictionaryAttribute.Create('DtEnvioDraft');
  FCdEnvioInttra := TDictionaryAttribute.Create('CdEnvioInttra');
  FClienteNome := TDictionaryAttribute.Create('ClienteNome');
  FClienteEndereco := TDictionaryAttribute.Create('ClienteEndereco');
  FClienteCidade := TDictionaryAttribute.Create('ClienteCidade');
  FClienteCep := TDictionaryAttribute.Create('ClienteCep');
  FClienteEstado := TDictionaryAttribute.Create('ClienteEstado');
  FClientePaisCod := TDictionaryAttribute.Create('ClientePaisCod');
  FClienteCnpj := TDictionaryAttribute.Create('ClienteCnpj');
  FConsigNome := TDictionaryAttribute.Create('ConsigNome');
  FConsigEndereco := TDictionaryAttribute.Create('ConsigEndereco');
  FConsigCidade := TDictionaryAttribute.Create('ConsigCidade');
  FConsigCep := TDictionaryAttribute.Create('ConsigCep');
  FConsigEstado := TDictionaryAttribute.Create('ConsigEstado');
  FConsigPaisCod := TDictionaryAttribute.Create('ConsigPaisCod');
  FNotify1Nome := TDictionaryAttribute.Create('Notify1Nome');
  FNotify1Endereco := TDictionaryAttribute.Create('Notify1Endereco');
  FNotify1Cidade := TDictionaryAttribute.Create('Notify1Cidade');
  FNotify1Cep := TDictionaryAttribute.Create('Notify1Cep');
  FNotify1Estado := TDictionaryAttribute.Create('Notify1Estado');
  FNotify1PaisCod := TDictionaryAttribute.Create('Notify1PaisCod');
  FNotify2Nome := TDictionaryAttribute.Create('Notify2Nome');
  FNotify2Endereco := TDictionaryAttribute.Create('Notify2Endereco');
  FNotify2Cidade := TDictionaryAttribute.Create('Notify2Cidade');
  FNotify2Cep := TDictionaryAttribute.Create('Notify2Cep');
  FNotify2Estado := TDictionaryAttribute.Create('Notify2Estado');
  FNotify2PaisCod := TDictionaryAttribute.Create('Notify2PaisCod');
  FAgenteNome := TDictionaryAttribute.Create('AgenteNome');
  FAgenteCdInttra := TDictionaryAttribute.Create('AgenteCdInttra');
  FAgenteEndereco := TDictionaryAttribute.Create('AgenteEndereco');
  FAgenteCidade := TDictionaryAttribute.Create('AgenteCidade');
  FAgenteCep := TDictionaryAttribute.Create('AgenteCep');
  FAgenteEstado := TDictionaryAttribute.Create('AgenteEstado');
  FAgentePaisCod := TDictionaryAttribute.Create('AgentePaisCod');
  FBookingArmador := TDictionaryAttribute.Create('BookingArmador');
  FReferenciaEmbarque := TDictionaryAttribute.Create('ReferenciaEmbarque');
  FNmNavio := TDictionaryAttribute.Create('NmNavio');
  FNrViagem := TDictionaryAttribute.Create('NrViagem');
  FLocalEmbarque := TDictionaryAttribute.Create('LocalEmbarque');
  FLocalDesembarque := TDictionaryAttribute.Create('LocalDesembarque');
  FLocalDesembarquePaisCod := TDictionaryAttribute.Create('LocalDesembarquePaisCod');
  FMarcacaoVolumes := TDictionaryAttribute.Create('MarcacaoVolumes');
  FCdRuc := TDictionaryAttribute.Create('CdRuc');
  FInPgmtoAbroad := TDictionaryAttribute.Create('InPgmtoAbroad');
  FNmLocalPgmtoTaxas := TDictionaryAttribute.Create('NmLocalPgmtoTaxas');
  FDsEmailIndaia := TDictionaryAttribute.Create('DsEmailIndaia');
  FLocalEntrega := TDictionaryAttribute.Create('LocalEntrega');
  FLocalEmbarqueSigla := TDictionaryAttribute.Create('LocalEmbarqueSigla');
  FLocalDesembarqueSigla := TDictionaryAttribute.Create('LocalDesembarqueSigla');
  FConsigEndNumero := TDictionaryAttribute.Create('ConsigEndNumero');
  FConsigEndCompl := TDictionaryAttribute.Create('ConsigEndCompl');
  FConsigNrTelefone := TDictionaryAttribute.Create('ConsigNrTelefone');
  FConsigNrFax := TDictionaryAttribute.Create('ConsigNrFax');
  FConsigNrRuc := TDictionaryAttribute.Create('ConsigNrRuc');
  FConsigNrNit := TDictionaryAttribute.Create('ConsigNrNit');
  FConsigNrCuit := TDictionaryAttribute.Create('ConsigNrCuit');
  FNotify1EndNumero := TDictionaryAttribute.Create('Notify1EndNumero');
  FNotify1EndCompl := TDictionaryAttribute.Create('Notify1EndCompl');
  FNotify1NrTelefone := TDictionaryAttribute.Create('Notify1NrTelefone');
  FNotify1NrFax := TDictionaryAttribute.Create('Notify1NrFax');
  FNotify1NrRuc := TDictionaryAttribute.Create('Notify1NrRuc');
  FNotify1NrNit := TDictionaryAttribute.Create('Notify1NrNit');
  FNotify1NrCuit := TDictionaryAttribute.Create('Notify1NrCuit');
  FNotify2EndNumero := TDictionaryAttribute.Create('Notify2EndNumero');
  FNotify2EndCompl := TDictionaryAttribute.Create('Notify2EndCompl');
  FNotify2NrTelefone := TDictionaryAttribute.Create('Notify2NrTelefone');
  FNotify2NrFax := TDictionaryAttribute.Create('Notify2NrFax');
  FNotify2NrRuc := TDictionaryAttribute.Create('Notify2NrRuc');
  FNotify2NrNit := TDictionaryAttribute.Create('Notify2NrNit');
  FNotify2NrCuit := TDictionaryAttribute.Create('Notify2NrCuit');
  FLocalLiberacaoBlCod := TDictionaryAttribute.Create('LocalLiberacaoBlCod');
  FLocalLiberacaoBlNome := TDictionaryAttribute.Create('LocalLiberacaoBlNome');
  FLocalLiberacaoBlPais := TDictionaryAttribute.Create('LocalLiberacaoBlPais');
  FLocalEntregaSigla := TDictionaryAttribute.Create('LocalEntregaSigla');
  FLocalEntregaPaisCod := TDictionaryAttribute.Create('LocalEntregaPaisCod');
  FStatusEnvio := TDictionaryAttribute.Create('StatusEnvio');
  FCdUsuarioCriacao := TDictionaryAssociation.Create('CdUsuarioCriacao');
  FCdCollectPrepaid := TDictionaryAssociation.Create('CdCollectPrepaid');
  FCdTipoPgmtoTaxas := TDictionaryAssociation.Create('CdTipoPgmtoTaxas');
  FCdTipoMovimento := TDictionaryAssociation.Create('CdTipoMovimento');
  FNrProcesso := TDictionaryAssociation.Create('NrProcesso');
end;

{ TTprocessoDraftCntrTableDictionary }

constructor TTprocessoDraftCntrTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrAmend := TDictionaryAttribute.Create('NrAmend');
  FNrCntr := TDictionaryAttribute.Create('NrCntr');
  FNrLacre := TDictionaryAttribute.Create('NrLacre');
  FNrLacreSif := TDictionaryAttribute.Create('NrLacreSif');
  FNmTpCntr := TDictionaryAttribute.Create('NmTpCntr');
  FCdIso := TDictionaryAttribute.Create('CdIso');
  FDsTemperatura := TDictionaryAttribute.Create('DsTemperatura');
  FTaraCntr := TDictionaryAttribute.Create('TaraCntr');
  FVlCubagem := TDictionaryAttribute.Create('VlCubagem');
  FDsCarga := TDictionaryAttribute.Create('DsCarga');
  FCdNcm := TDictionaryAttribute.Create('CdNcm');
  FCdEmbalagem := TDictionaryAttribute.Create('CdEmbalagem');
  FDsEmbalagem := TDictionaryAttribute.Create('DsEmbalagem');
  FQtEmbalagem := TDictionaryAttribute.Create('QtEmbalagem');
  FQtPesoBruto := TDictionaryAttribute.Create('QtPesoBruto');
  FVlExcessoCntr := TDictionaryAttribute.Create('VlExcessoCntr');
end;

{ TTprocessoDraftMercTableDictionary }

constructor TTprocessoDraftMercTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrAmend := TDictionaryAttribute.Create('NrAmend');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FCdMercadoria := TDictionaryAttribute.Create('CdMercadoria');
  FDsMercadoria := TDictionaryAttribute.Create('DsMercadoria');
  FCdNcm := TDictionaryAttribute.Create('CdNcm');
  FCdEmbalagem := TDictionaryAttribute.Create('CdEmbalagem');
  FDsEmbalagem := TDictionaryAttribute.Create('DsEmbalagem');
  FQtEmbalagem := TDictionaryAttribute.Create('QtEmbalagem');
  FQtPesoBruto := TDictionaryAttribute.Create('QtPesoBruto');
  FVlCubagem := TDictionaryAttribute.Create('VlCubagem');
end;

{ TTprocessoDraftMercCntrTableDictionary }

constructor TTprocessoDraftMercCntrTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrAmend := TDictionaryAttribute.Create('NrAmend');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FNrCntr := TDictionaryAttribute.Create('NrCntr');
  FQtEmbalagem := TDictionaryAttribute.Create('QtEmbalagem');
  FQtPesoBruto := TDictionaryAttribute.Create('QtPesoBruto');
  FVlCubagem := TDictionaryAttribute.Create('VlCubagem');
end;

{ TTtpTaxasInttraTableDictionary }

constructor TTtpTaxasInttraTableDictionary.Create;
begin
  inherited;
  FCdTaxaInttra := TDictionaryAttribute.Create('CdTaxaInttra');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTprocessoDraftComentariosTableDictionary }

constructor TTprocessoDraftComentariosTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrAmend := TDictionaryAttribute.Create('NrAmend');
  FNrComentario := TDictionaryAttribute.Create('NrComentario');
  FDsComentario := TDictionaryAttribute.Create('DsComentario');
  FTpComentario := TDictionaryAssociation.Create('TpComentario');
end;

{ TTtpComentariosInttraTableDictionary }

constructor TTtpComentariosInttraTableDictionary.Create;
begin
  inherited;
  FCdComentarioInntra := TDictionaryAttribute.Create('CdComentarioInntra');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTtpMovimentoInttraTableDictionary }

constructor TTtpMovimentoInttraTableDictionary.Create;
begin
  inherited;
  FCdMovimentoInttra := TDictionaryAttribute.Create('CdMovimentoInttra');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TTprocessoExpItemContainerTableDictionary }

constructor TTprocessoExpItemContainerTableDictionary.Create;
begin
  inherited;
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FNrContr := TDictionaryAttribute.Create('NrContr');
  FNrItem := TDictionaryAttribute.Create('NrItem');
  FQtMercadoria := TDictionaryAttribute.Create('QtMercadoria');
  FQtPesoBruto := TDictionaryAttribute.Create('QtPesoBruto');
  FVlCubagem := TDictionaryAttribute.Create('VlCubagem');
end;

{ TTdescricaoMercadoriaDraftTableDictionary }

constructor TTdescricaoMercadoriaDraftTableDictionary.Create;
begin
  inherited;
  FCodigo := TDictionaryAttribute.Create('Codigo');
  FCdGrupo := TDictionaryAttribute.Create('CdGrupo');
  FNmDescricao := TDictionaryAttribute.Create('NmDescricao');
  FTxDescricaoPortugues := TDictionaryAttribute.Create('TxDescricaoPortugues');
  FTxDescricaoIngles := TDictionaryAttribute.Create('TxDescricaoIngles');
  FTxDescricaoEspanhol := TDictionaryAttribute.Create('TxDescricaoEspanhol');
end;

initialization
  RegisterEntity(TTagente);
  RegisterEntity(TTarmazem);
  RegisterEntity(TTdespachante);
  RegisterEntity(TTdespachanteCliente);
  RegisterEntity(TTembalagem);
  RegisterEntity(TTembarcacao);
  RegisterEntity(TTempresaEst);
  RegisterEntity(TTempresaEstGrupo);
  RegisterEntity(TTempresaNac);
  RegisterEntity(TTenquadOp);
  RegisterEntity(TTfollowup);
  RegisterEntity(TTfundLegRegTribut);
  RegisterEntity(TTgrupo);
  RegisterEntity(TTincotermsVenda);
  RegisterEntity(TTlocalEmbarque);
  RegisterEntity(TTmercadoria);
  RegisterEntity(TTmercadoriaExp);
  RegisterEntity(TTmoedaBroker);
  RegisterEntity(TTncm);
  RegisterEntity(TTncmExp);
  RegisterEntity(TTobservacoes);
  RegisterEntity(TTpais);
  RegisterEntity(TTpaisBroker);
  RegisterEntity(TTprocesso);
  RegisterEntity(TTprocessoCntr);
  RegisterEntity(TTprocessoExp);
  RegisterEntity(TTprocessoExpItem);
  RegisterEntity(TTprocessoExpNf);
  RegisterEntity(TTprocessoExpNfItem);
  RegisterEntity(TTproduto);
  RegisterEntity(TTrecAlfandegado);
  RegisterEntity(TTrefCliente);
  RegisterEntity(TTregTributario);
  RegisterEntity(TTservico);
  RegisterEntity(TTservicoNovo);
  RegisterEntity(TTtpAcordoTarif);
  RegisterEntity(TTtpCntr);
  RegisterEntity(TTtpEmbalagemInttra);
  RegisterEntity(TTtpExoneracao);
  RegisterEntity(TTtpFrete);
  RegisterEntity(TTtpProcessoVinculado);
  RegisterEntity(TTunidMedidaBroker);
  RegisterEntity(TTunidNeg);
  RegisterEntity(TTurf);
  RegisterEntity(TTusuario);
  RegisterEntity(TTviaTransporte);
  RegisterEntity(TTviagem);
  RegisterEntity(TTregraObsDi);
  RegisterEntity(TTprocessoExpNfItemEnquadramento);
  RegisterEntity(TTprocessoExpNfItemNfDrawback);
  RegisterEntity(TTncmExpDestaque);
  RegisterEntity(TTratamentoPrioritario);
  RegisterEntity(TTprocessoExpNfItemLpco);
  RegisterEntity(TTprocessoExpNfItemNotaReferenciada);
  RegisterEntity(TTregraObsAuto);
  RegisterEntity(TTregraObsAutoItem);
  RegisterEntity(TTregraObsAutoTabelas);
  RegisterEntity(TTregraObsAutoTabelasCampos);
  RegisterEntity(TTprocessoExpNfItemNfComplementar);
  RegisterEntity(TVwResumoDi);
  RegisterEntity(TVwServicoGeral);
  RegisterEntity(TTncmExpAtributo);
  RegisterEntity(TTncmExpAtributoValor);
  RegisterEntity(TTprocessoExpNfItemNcmAtributo);
  RegisterEntity(TTprocessoDraftBl);
  RegisterEntity(TTprocessoDraftCntr);
  RegisterEntity(TTprocessoDraftMerc);
  RegisterEntity(TTprocessoDraftMercCntr);
  RegisterEntity(TTtpTaxasInttra);
  RegisterEntity(TTprocessoDraftComentarios);
  RegisterEntity(TTtpComentariosInttra);
  RegisterEntity(TTtpMovimentoInttra);
  RegisterEntity(TTprocessoExpItemContainer);
  RegisterEntity(TTdescricaoMercadoriaDraft);

finalization
  if __Dic <> nil then __Dic.Free

end.

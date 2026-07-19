unit uDmNFe;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Param,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.Intf,
  FireDAC.Phys,
  FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef,
  ACBrNFe,
  ACBrDFeSSL, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt;

type
  TdmNFe = class(TDataModule)
    FDConnection1: TFDConnection;
    QCab: TFDQuery;
    QDet: TFDQuery;
    QCntr: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConfigurarConexao;
    procedure ConfigurarACBr;
    procedure ConfigurarSQLCab;
    procedure ConfigurarSQLDet;
    procedure ConfigurarSQLCntr;
  public
    ACBrNFe1: TACBrNFe;

    procedure PrepararConsultas(const ANrProcesso: string);
    procedure PrepararConsultaDet(const ANrProcesso: string; const ANrAdicao: Integer; const ANrCntr: string);

    function ObterPastaProcesso(const ANrProcesso: string): string;
    function ValidarEListarContainers(const ANrProcesso: string): TStringList; // caller Free
  end;

var
  dmNFe: TdmNFe;

implementation

{$R *.dfm}

procedure TdmNFe.ConfigurarConexao;
begin
  if not FDConnection1.Connected then
    FDConnection1.Connected := True;
end;

procedure TdmNFe.ConfigurarACBr;
begin
  if not Assigned(ACBrNFe1) then
    ACBrNFe1 := TACBrNFe.Create(Self);

  ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
  ACBrNFe1.Configuracoes.Geral.SSLCryptLib   := cryOpenSSL;
  ACBrNFe1.Configuracoes.Geral.SSLHttpLib    := httpWinHttp;
  ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;

//  ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;

  ACBrNFe1.Configuracoes.Arquivos.PathNFe := 'C:\NFe\XML';
  ACBrNFe1.Configuracoes.Arquivos.Salvar := True;

  ForceDirectories(ACBrNFe1.Configuracoes.Arquivos.PathNFe);
end;

procedure TdmNFe.ConfigurarSQLCab;
begin
  QCab.SQL.Clear;

  QCab.SQL.Add('SELECT DISTINCT');
  QCab.SQL.Add('  UF.COD_IBGE AS ide_cUF,');
  QCab.SQL.Add('  SUBSTRING(TP.NR_PROCESSO,15,2) + SUBSTRING(TP.NR_PROCESSO,8,6) AS ide_cNF,');
  QCab.SQL.Add('  CONVERT(VARCHAR(60),RTRIM(LTRIM(CFOP.NM_CFOP))) AS ide_natOp,');
  QCab.SQL.Add('  ''55'' AS ide_mod,');
  QCab.SQL.Add('  ''3''  AS ide_serie,');
  QCab.SQL.Add('  ''DUVIDA'' AS ide_nNF,');
  QCab.SQL.Add('  CONVERT(varchar(19), GETUTCDATE(), 126) + ''-03:00'' AS ide_dhEmi,');
  QCab.SQL.Add('  ''6.0'' AS ide_verProc,');
  QCab.SQL.Add('  LOC.COD_IBGE AS ide_cMunFG,');
  QCab.SQL.Add('');
  QCab.SQL.Add('  EN.CGC_EMPRESA AS emit_CNPJ,');
  QCab.SQL.Add('  EN.NM_EMPRESA AS emit_xNome,');
  QCab.SQL.Add('  EN.NM_EMPRESA AS emit_xFant,');
  QCab.SQL.Add('  EN.END_EMPRESA AS emit_xLgr,');
  QCab.SQL.Add('  EN.END_NUMERO AS emit_nro,');
  QCab.SQL.Add('  EN.END_BAIRRO AS emit_xBairro,');
  QCab.SQL.Add('  LOC.COD_IBGE AS emit_cMun,');
  QCab.SQL.Add('  EN.END_CIDADE AS emit_xMun,');
  QCab.SQL.Add('  EN.END_UF AS emit_UF,');
  QCab.SQL.Add('  EN.END_CEP AS emit_CEP,');
  QCab.SQL.Add('  ''Brasil'' AS emit_xPais,');
  QCab.SQL.Add('  EN.NR_TELEFONE AS emit_fone,');
  QCab.SQL.Add('  EN.IE_EMPRESA AS emit_IE,');
  QCab.SQL.Add('  ''3'' AS emit_CRT,');
  QCab.SQL.Add('');
  QCab.SQL.Add('  AI.NR_ADICAO AS NR_ADICAO,');
  QCab.SQL.Add('  TR.CNPJ_TRANSP_ROD AS TRANSP_CNPJ,');
  QCab.SQL.Add('  TR.NM_TRANSP_ROD   AS TRANSP_XNOME,');
  QCab.SQL.Add('  TR.IE_TRANSP_ROD   AS TRANSP_IE,');
  QCab.SQL.Add('  TR.END_TRANSP_ROD  AS TRANSP_XENDER,');
  QCab.SQL.Add('  TR.END_CIDADE      AS TRANSP_XMUN,');
  QCab.SQL.Add('  TR.END_UF          AS TRANSP_UF');
  QCab.SQL.Add('');
  QCab.SQL.Add('FROM BROKER.DBO.TPROCESSO TP (NOLOCK)');
  QCab.SQL.Add('LEFT JOIN BROKER.DBO.TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = TP.CD_CLIENTE');
  QCab.SQL.Add('LEFT JOIN BROKER.DBO.ESTADO UF (NOLOCK) ON UF.SIGLA = EN.END_UF');
  QCab.SQL.Add('LEFT JOIN BROKER.DBO.LOCALIDADE LOC (NOLOCK) ON LOC.NOME = EN.END_CIDADE');
  QCab.SQL.Add('LEFT JOIN BROKER.DBO.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO');
  QCab.SQL.Add('LEFT JOIN BROKER.DBO.TCFOP CFOP (NOLOCK) ON CFOP.CD_CFOP = AI.CD_CFOP');
  QCab.SQL.Add('LEFT JOIN BROKER.DBO.TTRANSP_ROD TR (NOLOCK) ON TR.CD_TRANSP_ROD = TP.CD_TRANSP_NAC');
  QCab.SQL.Add('WHERE TP.NR_PROCESSO = :NR_PROCESSO');
end;

procedure TdmNFe.ConfigurarSQLDet;
begin
  QDet.SQL.Clear;

  QDet.SQL.Add('SELECT');
  QDet.SQL.Add('  EXPO.NM_EMPRESA AS dest_xNome,');
  QDet.SQL.Add('  EXPO.END_EMPRESA AS dest_xLgr,');
  QDet.SQL.Add('  EXPO.END_NUMERO AS dest_nro,');
  QDet.SQL.Add('  ''EXTERIOR'' AS dest_xBairro,');
  QDet.SQL.Add('  ''9999999'' AS dest_cMun,');
  QDet.SQL.Add('  ''EXTERIOR'' AS dest_xMun,');
  QDet.SQL.Add('  ''EX'' AS dest_UF,');
  QDet.SQL.Add('  ''00000000'' AS dest_CEP,');
  QDet.SQL.Add('  EXPOP.CD_SCX_EXP AS dest_cPais,');
  QDet.SQL.Add('  EXPOP.NM_PAIS AS dest_xPais,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  DM.NR_ITEM AS det_nItem,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  DM.CD_MERCADORIA AS prod_cProd,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2), ISNULL(DM.VL_FRETE_ITEM, 0)) AS prod_vFrete,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2), ISNULL(DM.VL_SEGURO_ITEM, 0)) AS prod_vSeguro,');
  QDet.SQL.Add('  ''SEM GTIN'' AS prod_cEAN,');
  QDet.SQL.Add('  CONVERT(VARCHAR(120),CAST(DM.TX_DESC_DET_MERC AS VARCHAR(MAX))) AS prod_xProd,');
  QDet.SQL.Add('  DM.CD_NCM_SH AS prod_NCM,');
  QDet.SQL.Add('  AI.CD_CFOP AS prod_CFOP,');
  QDet.SQL.Add('  UM.NM_SIGLA AS prod_uCom,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,4), DM.QT_MERC_UN_COMERC) AS prod_qCom,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,10), (DM.VL_BASE_CALC_II + DM.VL_II_ITEM) / NULLIF(DM.QT_MERC_UN_COMERC,0)) AS prod_vUnCom,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2), DM.VL_BASE_CALC_II + DM.VL_II_ITEM) AS prod_vProd,');
  QDet.SQL.Add('  ''SEM GTIN'' AS prod_cEANTrib,');
  QDet.SQL.Add('  UM.NM_SIGLA AS prod_uTrib,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,4), DM.QT_MERC_UN_ESTAT) AS prod_qTrib,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,10), (DM.VL_BASE_CALC_II + DM.VL_II_ITEM) / NULLIF(DM.QT_MERC_UN_ESTAT,0)) AS prod_vUnTrib,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2), DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM + DM.VL_ICMS_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM) AS prod_vOutro,');
  QDet.SQL.Add('  1 AS prod_indTot,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  TP.NR_DI AS DI_nDI,');
  QDet.SQL.Add('  CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,120) AS DI_dDI,');
  QDet.SQL.Add('  LD.NM_CIDADE AS DI_xLocDesemb,');
  QDet.SQL.Add('  URF.END_UF AS DI_UFDesemb,');
  QDet.SQL.Add('  CONVERT(VARCHAR(10),EV088.DT_REALIZACAO,120) AS DI_dDesemb,');
  QDet.SQL.Add('  CONVERT(int,VT.CD_VIA_TRANSP) AS DI_tpViaTransp,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2), DM.VL_AFRMM_ITEM) AS DI_vAFRMM,');
  QDet.SQL.Add('  1 AS DI_tpIntermedio,');
  QDet.SQL.Add('  CONVERT(CHAR(60), EXPO.NR_CLIENTE) AS DI_cExportador,');
  QDet.SQL.Add('  CONVERT(int,DM.NR_ADICAO) AS DI_adi_nAdicao,');
  QDet.SQL.Add('  CONVERT(int,DM.NR_ITEM) AS DI_adi_nSeqAdic,');
  QDet.SQL.Add('  CONVERT(CHAR(60), EXPO.NR_CLIENTE) AS DI_adi_cFabricante,');
  QDet.SQL.Add('  AI.NR_ATO_CONCESSORIO AS DI_adi_nDraw,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN ''ICMS00''');
  QDet.SQL.Add('    WHEN AI.PC_REDUCAO_ICMS > 0 THEN ''ICMS20''');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN ''ICMS40''');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ''ICMS51''');
  QDet.SQL.Add('    ELSE ''ICMS90''');
  QDet.SQL.Add('  END AS ICMS_Grupo,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' THEN ''51''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3127'' THEN ''51''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' THEN ''51''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3930'' THEN ''40''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND AI.PC_REDUCAO_ICMS > 0 THEN ''20''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''90''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND AI.VL_PIS > 0 THEN ''00''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' THEN ''40''');
  QDet.SQL.Add('    ELSE ''00''');
  QDet.SQL.Add('  END AS ICMS_orig,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' THEN ''51''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3127'' THEN ''51''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' THEN ''51''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3930'' THEN ''40''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND AI.PC_REDUCAO_ICMS > 0 THEN ''20''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''90''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND AI.VL_PIS > 0 THEN ''00''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER > 0 AND AI.PC_REDUCAO_ICMS > 0 THEN ''20''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER > 0 AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''90''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER = 0 AND AI.PC_REDUCAO_ICMS > 0 THEN ''20''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER = 0 AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''90''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.PC_ALIQ_NORM_ADVAL = 0 AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''20''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.PC_ALIQ_NORM_ADVAL = 0 AND AI.PC_REDUCAO_ICMS > 0 THEN ''90''');
  QDet.SQL.Add('    WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' THEN ''40''');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN ''00''');
  QDet.SQL.Add('    WHEN AI.PC_REDUCAO_ICMS > 0 THEN ''20''');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN ''40''');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ''51''');
  QDet.SQL.Add('    ELSE ''90''');
  QDet.SQL.Add('  END AS ICMS_CST,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  3 AS ICMS_modBC,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN NULL');
  QDet.SQL.Add('    WHEN AI.PC_REDUCAO_ICMS > 0 THEN CONVERT(DECIMAL(28,4), AI.PC_REDUCAO_ICMS)');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN NULL');
  QDet.SQL.Add('    WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN CONVERT(DECIMAL(28,4), AI.PC_REDUCAO_ICMS)');
  QDet.SQL.Add('    ELSE CONVERT(DECIMAL(28,4), AI.PC_REDUCAO_ICMS)');
  QDet.SQL.Add('  END AS ICMS_pRedBC,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2),');
  QDet.SQL.Add('    CASE');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN ( AI.VL_BASE_CALC_ICMS_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      WHEN AI.PC_REDUCAO_ICMS > 0 THEN ( AI.VL_BASE_CALC_ICMS_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ( AI.VL_BASE_CALC_ICMS_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      ELSE ( AI.VL_BASE_CALC_ICMS_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('    END');
  QDet.SQL.Add('  ) AS ICMS_vBC,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,4),');
  QDet.SQL.Add('    CASE');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN AI.PC_ICMS');
  QDet.SQL.Add('      WHEN AI.PC_REDUCAO_ICMS > 0 THEN AI.PC_ICMS');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN AI.PC_ICMS');
  QDet.SQL.Add('      ELSE AI.PC_ICMS');
  QDet.SQL.Add('    END');
  QDet.SQL.Add('  ) AS ICMS_pICMS,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,4),');
  QDet.SQL.Add('    CASE');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN NULL');
  QDet.SQL.Add('      WHEN AI.PC_REDUCAO_ICMS > 0 THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ( AI.VL_ICMS_DEVIDO_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      ELSE NULL');
  QDet.SQL.Add('    END');
  QDet.SQL.Add('  ) AS ICMS_vICMSOp,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,4),');
  QDet.SQL.Add('    CASE');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN NULL');
  QDet.SQL.Add('      WHEN AI.PC_REDUCAO_ICMS > 0 THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ( CASE WHEN AI.PC_REDUCAO_ICMS > 0 THEN AI.PC_REDUCAO_ICMS ELSE 100 END )');
  QDet.SQL.Add('      ELSE NULL');
  QDet.SQL.Add('    END');
  QDet.SQL.Add('  ) AS ICMS_pDif,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,4),');
  QDet.SQL.Add('    CASE');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN NULL');
  QDet.SQL.Add('      WHEN AI.PC_REDUCAO_ICMS > 0 THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ( AI.VL_ICMS_DEVIDO_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      ELSE NULL');
  QDet.SQL.Add('    END');
  QDet.SQL.Add('  ) AS ICMS_vICMSDif,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2),');
  QDet.SQL.Add('    CASE');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' AND ( AI.PC_REDUCAO_ICMS IS NULL OR AI.PC_REDUCAO_ICMS <= 0 ) THEN ( AI.VL_ICMS_A_RECOLHER_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      WHEN AI.PC_REDUCAO_ICMS > 0 THEN ( AI.VL_ICMS_A_RECOLHER_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN NULL');
  QDet.SQL.Add('      WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ( AI.VL_ICMS_DEVIDO_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('      ELSE ( AI.VL_ICMS_A_RECOLHER_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II');
  QDet.SQL.Add('    END');
  QDet.SQL.Add('  ) AS ICMS_vICMS,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('    WHEN AI.IN_FUNDO_POBREZA = ''1'' THEN CONVERT(DECIMAL(28,4), (SELECT PC_FUNDO_POBREZA_RJ FROM BROKER.DBO.TPARAMETROS (NOLOCK)))');
  QDet.SQL.Add('    ELSE NULL');
  QDet.SQL.Add('  END AS ICMS_pFCP,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('    WHEN AI.IN_FUNDO_POBREZA = ''1'' THEN CONVERT(DECIMAL(28,4), (( ( AI.VL_BASE_CALC_ICMS_AFRMM / AI.VL_BASE_CALC_II) * DM.VL_BASE_CALC_II) * (SELECT PC_FUNDO_POBREZA_RJ FROM BROKER.DBO.TPARAMETROS (NOLOCK)) /100 ))');
  QDet.SQL.Add('    ELSE NULL');
  QDet.SQL.Add('  END AS ICMS_vFCP,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  ''999'' AS IPI_cEnq,');
  QDet.SQL.Add('  CASE        ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' AND IPI.VL_IPT_A_RECOLHER > 0 THEN ''00''    ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' AND IPI.PC_ALIQ_NORM_ADVAL = 0 THEN ''01''    ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' AND IPI.VL_IPT_A_RECOLHER = 0 THEN ''02''    ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3127'' THEN ''02''        ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3930'' THEN ''05''         ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' AND IPI.VL_IPT_A_RECOLHER > 0 THEN ''00''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' AND IPI.VL_IPT_A_RECOLHER = 0 THEN ''02''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' AND AI.IN_MATERIAL_USADO = 1 THEN ''02''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' THEN ''01''      ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND AI.PC_REDUCAO_ICMS > 0 AND IPI.VL_IPT_A_RECOLHER > 0 THEN ''00''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND ( AI.PC_REDUCAO_ICMS = 0 OR AI.PC_REDUCAO_ICMS = NULL ) AND IPI.VL_IPT_A_RECOLHER > 0 THEN ''00''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND IPI.PC_ALIQ_NORM_ADVAL = 0 AND AI.PC_REDUCAO_ICMS > 0 THEN ''01''    ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND IPI.PC_ALIQ_NORM_ADVAL = 0 AND ( AI.PC_REDUCAO_ICMS = 0 OR AI.PC_REDUCAO_ICMS = NULL ) THEN ''01''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND ( AI.PC_REDUCAO_ICMS = 0 OR AI.PC_REDUCAO_ICMS = NULL ) AND IPI.VL_IPT_A_RECOLHER = 0 THEN ''02'' ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND AI.PC_REDUCAO_ICMS > 0 AND IPI.VL_IPT_A_RECOLHER = 0 THEN ''02''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' AND AI.VL_PIS > 0 THEN ''00''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER > 0 AND AI.PC_REDUCAO_ICMS > 0 THEN ''00''      ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER > 0 AND ( AI.PC_REDUCAO_ICMS = NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''00'' ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER = 0 AND AI.PC_REDUCAO_ICMS > 0 THEN ''02''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.VL_IPT_A_RECOLHER = 0 AND ( AI.PC_REDUCAO_ICMS = NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''02''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.PC_ALIQ_NORM_ADVAL = 0 AND ( AI.PC_REDUCAO_ICMS = NULL OR AI.PC_REDUCAO_ICMS = 0 ) THEN ''01''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' AND IPI.PC_ALIQ_NORM_ADVAL = 0 AND AI.PC_REDUCAO_ICMS > 0 THEN ''01''      ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' THEN ''02''  ');
  QDet.SQL.Add('  ELSE ''00'' END AS IPI_CST,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), DM.VL_BASE_CALC_II + DM.VL_II_ITEM) AS IPI_vBC,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), IPI.PC_ALIQ_NORM_ADVAL) AS IPI_pIPI,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2), DM.VL_BASE_CALC_II) AS II_vBC,');
  QDet.SQL.Add('  CONVERT(DECIMAL(28,2), DM.VL_II_ITEM) AS II_vII,');
  QDet.SQL.Add('  0.00 AS II_vIOF,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' THEN ''56''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3127'' THEN ''71''    ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' AND AI.IN_MATERIAL_USADO = 1 THEN ''70'' ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' THEN ''56''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' THEN ''56''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3930'' THEN ''72''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' THEN ''70''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' THEN ''98''   ');
  QDet.SQL.Add('  ELSE ''56'' END AS PIS_CST,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), DM.VL_BASE_PIS_COFINS) AS PIS_vBC,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), AI.ALIQ_PIS) AS PIS_pPIS,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), DM.VL_PIS_ITEM) AS PIS_vPIS,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' THEN ''56''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3127'' THEN ''71''    ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' AND AI.IN_MATERIAL_USADO = 1 THEN ''70'' ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3151'' THEN ''56''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' THEN ''56''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3930'' THEN ''72''   ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' THEN ''70''  ');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' THEN ''98''   ');
  QDet.SQL.Add('  ELSE ''56'' END AS COFINS_CST,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), DM.VL_BASE_PIS_COFINS) AS COFINS_vBC,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), AI.ALIQ_COFINS) AS COFINS_pCOFINS,');
  QDet.SQL.Add('  CONVERT(DECIMAL(13,2), DM.VL_COFINS_ITEM) AS COFINS_vCOFINS,');
  QDet.SQL.Add('');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' THEN ''000''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3127'' THEN ''550''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3551'' THEN ''000''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' THEN ''000''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3930'' THEN ''550''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' THEN ''000''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' THEN ''410''');
  QDet.SQL.Add('  ELSE ''000'' END AS IBS_CST, -- [<IBSCBS> - <CST>]');
  QDet.SQL.Add('  CASE');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3101'' THEN ''000001''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3127'' THEN ''550007''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3551'' THEN ''000001''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3556'' THEN ''000001''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3930'' THEN ''550006''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' AND CD_COBERT_CAMBIAL = ''4'' THEN ''000001''');
  QDet.SQL.Add('  WHEN TP.CD_GRUPO = ''D22'' AND AI.CD_CFOP = ''3949'' THEN ''410999''');
  QDet.SQL.Add('  ELSE ''000001'' END AS IBS_cClassTrib, -- [<IBSCBS> - <cClassTrib>]');
  QDet.SQL.Add('  DM.VL_BASE_IBS_CBS AS IBS_vBC, -- [<IBSCBS> - <gIBSCBS> - <vBC>]');
  QDet.SQL.Add('  AI.ALIQ_IBS_UF AS IBS_pIBSUF, -- [<IBSCBS> - <gIBSCBS> - <gIBSUF> - <pIBSUF>]');
  QDet.SQL.Add('  DM.VL_IBS_UF AS IBS_vIBSUF, -- [<IBSCBS> - <gIBSCBS> - <gIBSUF> - <vIBSUF>]');
  QDet.SQL.Add('  AI.ALIQ_IBS_MUN AS IBS_pIBSMun, -- [<IBSCBS> - <gIBSCBS> - <gIBSMun> - <pIBSMun>]');
  QDet.SQL.Add('  DM.VL_IBS_MUN AS IBS_vIBSMun, -- [<IBSCBS> - <gIBSCBS> - <gIBSMun> - <vIBSMun>]');
  QDet.SQL.Add('  (ISNULL(DM.VL_IBS_UF, 0) + ISNULL(DM.VL_IBS_MUN, 0)) AS IBS_vIBS, -- [<IBSCBS> - <gIBSCBS> - <vIBS>]');
  QDet.SQL.Add('  AI.ALIQ_CBS AS IBS_pCBS, -- [<IBSCBS> - <gIBSCBS> - <gCBS> - <pCBS>]');
  QDet.SQL.Add('  DM.VL_CBS AS IBS_vCBS, -- [<IBSCBS> - <gIBSCBS> - <gCBS> - <vCBS>]');
  QDet.SQL.Add('');
  QDet.SQL.Add('  ''--'' AS infAdProd,');
  QDet.SQL.Add('  '' '' AS infCpl');
  QDet.SQL.Add('');
  QDet.SQL.Add('FROM BROKER.DBO.TPROCESSO TP (NOLOCK)');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TSERVICO_NOVO SN (NOLOCK) ON SN.CD_SERVICO = TP.CD_SERVICO');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TVIA_TRANSP_BROKER VT (NOLOCK) ON VT.CD_VIA_TRANSP = SN.CD_VIA_TRANSPORTE');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO AND DM.NR_ADICAO = AI.NR_ADICAO');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TUNID_MEDIDA_BROKER UM (NOLOCK) ON UM.CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TFOLLOWUP EV021 (NOLOCK) ON EV021.NR_PROCESSO = TP.NR_PROCESSO AND EV021.CD_EVENTO=''021''');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO=''088''');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TURF URF (NOLOCK) ON URF.CODIGO = DI.CD_URF_DESPACHO');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TEMPRESA_EST EXPO (NOLOCK) ON EXPO.CD_EMPRESA = DM.CD_EXPORTADOR');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TPAIS_BROKER_OFICIAL EXPOP (NOLOCK) ON EXPOP.CD_PAIS = EXPO.CD_PAIS');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TLOCAL_EMBARQUE LD (NOLOCK) ON LD.CODIGO = TP.CD_LOCAL_DESEMBARQUE');
  QDet.SQL.Add('LEFT JOIN BROKER.DBO.TRIBUTO IPI (NOLOCK) ON IPI.NR_PROCESSO = TP.NR_PROCESSO AND AI.NR_ADICAO = IPI.NR_ADICAO AND IPI.CD_RECEITA_IMPOSTO = ''0002''');
  QDet.SQL.Add('WHERE TP.NR_PROCESSO = :NR_PROCESSO');
  QDet.SQL.Add('  AND AI.NR_ADICAO = :NR_ADICAO');
  QDet.SQL.Add('  AND ( :NR_CNTR = '''' OR NR_CNTR = :NR_CNTR )');
end;

procedure TdmNFe.ConfigurarSQLCntr;
begin
  QCntr.SQL.Clear;
  QCntr.SQL.Add('SELECT NR_CNTR');
  QCntr.SQL.Add('FROM BROKER.DBO.TDETALHE_MERCADORIA (NOLOCK)');
  QCntr.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
  QCntr.SQL.Add('GROUP BY NR_CNTR');
end;

procedure TdmNFe.DataModuleCreate(Sender: TObject);
begin
  ACBrNFe1 := TACBrNFe.Create(Self);
  ConfigurarConexao;
  ConfigurarACBr;
  ConfigurarSQLCab;
  ConfigurarSQLDet;
  ConfigurarSQLCntr;
end;

procedure TdmNFe.PrepararConsultas(const ANrProcesso: string);
begin
  QCab.Close;
  QCab.ParamByName('NR_PROCESSO').AsString := ANrProcesso;

  QDet.Close;
  QDet.ParamByName('NR_PROCESSO').AsString := ANrProcesso;

  QCntr.Close;
  QCntr.ParamByName('NR_PROCESSO').AsString := ANrProcesso;
end;

procedure TdmNFe.PrepararConsultaDet(const ANrProcesso: string; const ANrAdicao: Integer; const ANrCntr: string);
begin
  QDet.Close;
  QDet.ParamByName('NR_PROCESSO').AsString := ANrProcesso;
  QDet.ParamByName('NR_ADICAO').AsInteger := ANrAdicao;
  QDet.ParamByName('NR_CNTR').AsString := ANrCntr;
end;

function TdmNFe.ObterPastaProcesso(const ANrProcesso: string): string;
begin
  Result := IncludeTrailingPathDelimiter(
              TPath.Combine(ACBrNFe1.Configuracoes.Arquivos.PathNFe, ANrProcesso)
            );
  ForceDirectories(Result);
end;

function TdmNFe.ValidarEListarContainers(const ANrProcesso: string): TStringList;
var
  S: string;
begin
  Result := TStringList.Create;
  Result.Sorted := False;
  Result.Duplicates := dupIgnore;

  PrepararConsultas(ANrProcesso);
  QCntr.Open;

  QCntr.First;
  while not QCntr.Eof do
  begin
    S := Trim(QCntr.FieldByName('NR_CNTR').AsString);
    if S = '' then
    begin
      Result.Free;
      raise Exception.Create(
        'Abortado: existe item com NR_CNTR em branco. ' +
        'Nï¿½o ï¿½ obrigatï¿½rio que todos os itens tenham container preenchido, mas este gerador exige o preenchimento para criar notas filhotes por container.'
      );
    end;

    Result.Add(S);
    QCntr.Next;
  end;
end;

end.


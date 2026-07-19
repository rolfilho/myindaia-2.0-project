unit uNFeService;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  System.Math,
  System.TypInfo,
  FireDAC.Comp.Client,
  uDmNFe,
  ACBrNFe,
  pcnNFe;

type
  TIBSCBSInfo = record
    nItem: Integer;
    CST: string;
    cClassTrib: string;
    vBC: Double;
    pIBSUF: Double;
    vIBSUF: Double;
    pIBSMun: Double;
    vIBSMun: Double;
    vIBS: Double;
    pCBS: Double;
    vCBS: Double;
  end;

  TIBSCBSTotais = record
    vBCIBSCBS: Double;
    vIBSUF: Double;
    vIBSMun: Double;
    vIBS: Double;
    vCBS: Double;
  end;

  TNFeService = class
  private
    FDM: TdmNFe;

    FIBSItensMae: array of TIBSCBSInfo;
    FIBSCountMae: Integer;
    FIBSTotaisMae: TIBSCBSTotais;

    FIBSItensFilha: array of TIBSCBSInfo;
    FIBSCountFilha: Integer;
    FIBSTotaisFilha: TIBSCBSTotais;

    function GetNota(IndexNota: Integer): TNFe;
    function GetBasePathNFe: string;
    function CriarPastaProcesso(const ANrProcesso: string): string;

    procedure ResetIBSDadosMae;
    procedure ResetIBSDadosFilha;
    procedure AdicionarIBSDoItem(IndexNota: Integer; QDet: TFDQuery);
    procedure InserirIBSCBSNosItensComDados(
      const ANomeArquivoXML: string;
      const AIBS: array of TIBSCBSInfo;
      ACount: Integer);
    procedure InserirIBSCBSTotComDados(
      const ANomeArquivoXML: string;
      const ATotais: TIBSCBSTotais);

    procedure ValidarContainersObrigatorios(const ANrProcesso: string);
    procedure AbrirQDet(const ANrProcesso: string; const ANrAdicao: Integer; const ANrCntr: string);

    procedure PreencherCabecalhoDaNota(IndexNota: Integer);
    procedure PreencherIde(IndexNota: Integer);
    procedure PreencherEmit(IndexNota: Integer);
    procedure PreencherDest(IndexNota: Integer);
    procedure PreencherTransp(IndexNota: Integer);

    procedure PreencherItensParaNota(IndexNota: Integer);
    procedure AdicionarItemNaNota(IndexNota: Integer; QDet: TFDQuery);
    procedure PreencherImpostosDoItem(DetItem: TDetCollectionItem; QDet: TFDQuery);

    procedure PreencherInfAdic(IndexNota: Integer);

    procedure ZerarTotais(IndexNota: Integer);
    procedure SomarTotaisDoDet(IndexNota: Integer; QDet: TFDQuery);
    procedure CalcularTotaisManuais(IndexNota: Integer);

    function NomeArquivoMae(const ANrProcesso: string): string;
    function NomeArquivoFilha(const ANrProcesso: string; ANrAdicao: Integer; const ANrCntr: string): string;

  public
    constructor Create(ADM: TdmNFe);
    function GerarNFe(const ANrProcesso: string): TStringList;
  end;

implementation

{ TNFeService }

constructor TNFeService.Create(ADM: TdmNFe);
begin
  inherited Create;
  FDM := ADM;
  SetLength(FIBSItensMae, 0);
  FIBSCountMae := 0;
  FillChar(FIBSTotaisMae, SizeOf(FIBSTotaisMae), 0);
  SetLength(FIBSItensFilha, 0);
  FIBSCountFilha := 0;
  FillChar(FIBSTotaisFilha, SizeOf(FIBSTotaisFilha), 0);
end;

procedure TNFeService.ResetIBSDadosMae;
begin
  FIBSCountMae := 0;
  FillChar(FIBSTotaisMae, SizeOf(FIBSTotaisMae), 0);
end;

procedure TNFeService.ResetIBSDadosFilha;
begin
  FIBSCountFilha := 0;
  FillChar(FIBSTotaisFilha, SizeOf(FIBSTotaisFilha), 0);
end;

function TNFeService.GetNota(IndexNota: Integer): TNFe;
begin
  Result := FDM.ACBrNFe1.NotasFiscais.Items[IndexNota].NFe;
end;

function TNFeService.GetBasePathNFe: string;
begin
  Result := Trim(FDM.ACBrNFe1.Configuracoes.Arquivos.PathNFe);
  if Result = '' then
    Result := TPath.Combine(ExtractFilePath(ParamStr(0)), 'NFe\XML');
end;

function TNFeService.CriarPastaProcesso(const ANrProcesso: string): string;
begin
  Result := TPath.Combine(GetBasePathNFe, ANrProcesso);
  ForceDirectories(Result);
end;

procedure TNFeService.ValidarContainersObrigatorios(const ANrProcesso: string);
var
  Q: TFDQuery;
  Cntr: string;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FDM.FDConnection1;
    Q.SQL.Text :=
      'SELECT NR_CNTR ' + sLineBreak +
      'FROM TDETALHE_MERCADORIA (NOLOCK) ' + sLineBreak +
      'WHERE NR_PROCESSO = :NR_PROCESSO ' + sLineBreak +
      'GROUP BY NR_CNTR';
    Q.ParamByName('NR_PROCESSO').AsString := ANrProcesso;
    Q.Open;

    Q.First;
    while not Q.Eof do
    begin
      Cntr := Trim(Q.Fields[0].AsString);
      if Cntr = '' then
        raise Exception.Create('Existe item com NR_CNTR em branco.');

      Q.Next;
    end;

  finally
    Q.Free;
  end;
end;

procedure TNFeService.AbrirQDet(const ANrProcesso: string; const ANrAdicao: Integer; const ANrCntr: string);
begin
  FDM.QDet.Close;
  FDM.QDet.ParamByName('NR_PROCESSO').AsString := ANrProcesso;
  FDM.QDet.ParamByName('NR_ADICAO').AsInteger := ANrAdicao;
  FDM.QDet.ParamByName('NR_CNTR').AsString := ANrCntr;
  FDM.QDet.Open;
end;

procedure TNFeService.PreencherCabecalhoDaNota(IndexNota: Integer);
begin
  PreencherIde(IndexNota);
  PreencherEmit(IndexNota);
  PreencherTransp(IndexNota);
end;

procedure TNFeService.PreencherIde(IndexNota: Integer);
var
  Q: TFDQuery;
  Nota: TNFe;
begin
  Q := FDM.QCab;
  Nota := GetNota(IndexNota);

  Nota.ide.cUF    := Q.FieldByName('ide_cUF').AsInteger;
  Nota.ide.cNF    := Q.FieldByName('ide_cNF').AsInteger;
  Nota.ide.natOp  := Q.FieldByName('ide_natOp').AsString;
  Nota.ide.modelo := StrToIntDef(Q.FieldByName('ide_mod').AsString, 55);
  Nota.ide.serie  := StrToIntDef(Q.FieldByName('ide_serie').AsString, 3);
  Nota.ide.nNF    := StrToIntDef(Q.FieldByName('ide_nNF').AsString, 0);

  Nota.ide.dEmi := Date;

  Nota.ide.verProc := Q.FieldByName('ide_verProc').AsString;
  Nota.ide.cMunFG  := Q.FieldByName('ide_cMunFG').AsInteger;
end;

procedure TNFeService.PreencherEmit(IndexNota: Integer);
var
  Q: TFDQuery;
  Nota: TNFe;
begin
  Q := FDM.QCab;
  Nota := GetNota(IndexNota);

  Nota.emit.CNPJCPF := Q.FieldByName('emit_CNPJ').AsString;
  Nota.emit.xNome   := Q.FieldByName('emit_xNome').AsString;
  Nota.emit.xFant   := Q.FieldByName('emit_xFant').AsString;

  Nota.emit.enderEmit.xLgr    := Q.FieldByName('emit_xLgr').AsString;
  Nota.emit.enderEmit.nro     := Q.FieldByName('emit_nro').AsString;
  Nota.emit.enderEmit.xBairro := Q.FieldByName('emit_xBairro').AsString;
  Nota.emit.enderEmit.cMun    := Q.FieldByName('emit_cMun').AsInteger;
  Nota.emit.enderEmit.xMun    := Q.FieldByName('emit_xMun').AsString;
  Nota.emit.enderEmit.UF      := Q.FieldByName('emit_UF').AsString;
  Nota.emit.enderEmit.CEP     := Q.FieldByName('emit_CEP').AsInteger;
  Nota.emit.enderEmit.xPais   := Q.FieldByName('emit_xPais').AsString;
  Nota.emit.enderEmit.fone    := Q.FieldByName('emit_fone').AsString;

  Nota.emit.IE := Q.FieldByName('emit_IE').AsString;
end;

procedure TNFeService.PreencherTransp(IndexNota: Integer);
var
  Q: TFDQuery;
  Nota: TNFe;
begin
  Q := FDM.QCab;
  Nota := GetNota(IndexNota);

  // Preenche dados da transportadora, se existirem na consulta
  if Q.FindField('TRANSP_CNPJ') <> nil then
    Nota.Transp.Transporta.CNPJCPF := Trim(Q.FieldByName('TRANSP_CNPJ').AsString);

  if Q.FindField('TRANSP_XNOME') <> nil then
    Nota.Transp.Transporta.xNome := Trim(Q.FieldByName('TRANSP_XNOME').AsString);

  if Q.FindField('TRANSP_IE') <> nil then
    Nota.Transp.Transporta.IE := Trim(Q.FieldByName('TRANSP_IE').AsString);

  if Q.FindField('TRANSP_XENDER') <> nil then
    Nota.Transp.Transporta.xEnder := Trim(Q.FieldByName('TRANSP_XENDER').AsString);

  if Q.FindField('TRANSP_XMUN') <> nil then
    Nota.Transp.Transporta.xMun := Trim(Q.FieldByName('TRANSP_XMUN').AsString);

  if Q.FindField('TRANSP_UF') <> nil then
    Nota.Transp.Transporta.UF := Trim(Q.FieldByName('TRANSP_UF').AsString);
end;

procedure TNFeService.PreencherDest(IndexNota: Integer);
var
  Q: TFDQuery;
  Nota: TNFe;
begin
  Q := FDM.QDet;
  Nota := GetNota(IndexNota);

  Nota.dest.xNome := Q.FieldByName('dest_xNome').AsString;

  Nota.dest.enderDest.xLgr    := Q.FieldByName('dest_xLgr').AsString;
  Nota.dest.enderDest.nro     := Q.FieldByName('dest_nro').AsString;
  Nota.dest.enderDest.xBairro := Q.FieldByName('dest_xBairro').AsString;
  Nota.dest.enderDest.cMun    := StrToIntDef(Q.FieldByName('dest_cMun').AsString, 0);
  Nota.dest.enderDest.xMun    := Q.FieldByName('dest_xMun').AsString;
  Nota.dest.enderDest.UF      := Q.FieldByName('dest_UF').AsString;
  Nota.dest.enderDest.CEP     := StrToIntDef(Q.FieldByName('dest_CEP').AsString, 0);
  Nota.dest.enderDest.cPais   := StrToIntDef(Q.FieldByName('dest_cPais').AsString, 0);
  Nota.dest.enderDest.xPais   := Q.FieldByName('dest_xPais').AsString;
end;

procedure TNFeService.PreencherItensParaNota(IndexNota: Integer);
var
  Q: TFDQuery;
begin
  Q := FDM.QDet;

  Q.First;
  while not Q.Eof do
  begin
    AdicionarItemNaNota(IndexNota, Q);
    Q.Next;
  end;
end;

procedure TNFeService.AdicionarItemNaNota(IndexNota: Integer; QDet: TFDQuery);
var
  Nota: TNFe;
  IdxDet: Integer;
  IdxDI: Integer;
  IdxAdi: Integer;
  DetItem: TDetCollectionItem;
  IBS: TIBSCBSInfo;
  IsMae: Boolean;
  Arr: ^TIBSCBSInfo;
  Count: ^Integer;
  Totais: ^TIBSCBSTotais;
begin
  Nota := GetNota(IndexNota);

  Nota.Det.Add;
  IdxDet := Nota.Det.Count - 1;
  DetItem := Nota.Det.Items[IdxDet];

  DetItem.Prod.nItem := Nota.Det.Count;

  DetItem.Prod.cProd    := QDet.FieldByName('prod_cProd').AsString;
  DetItem.Prod.cEAN     := QDet.FieldByName('prod_cEAN').AsString;
  DetItem.Prod.xProd    := QDet.FieldByName('prod_xProd').AsString;
  DetItem.Prod.NCM      := QDet.FieldByName('prod_NCM').AsString;
  DetItem.Prod.CFOP     := QDet.FieldByName('prod_CFOP').AsString;
  DetItem.Prod.uCom     := QDet.FieldByName('prod_uCom').AsString;
  DetItem.Prod.qCom     := QDet.FieldByName('prod_qCom').AsFloat;
  DetItem.Prod.vUnCom   := QDet.FieldByName('prod_vUnCom').AsFloat;
  DetItem.Prod.vProd    := QDet.FieldByName('prod_vProd').AsFloat;
  DetItem.Prod.cEANTrib := QDet.FieldByName('prod_cEANTrib').AsString;
  DetItem.Prod.uTrib    := QDet.FieldByName('prod_uTrib').AsString;
  DetItem.Prod.qTrib    := QDet.FieldByName('prod_qTrib').AsFloat;
  DetItem.Prod.vUnTrib  := QDet.FieldByName('prod_vUnTrib').AsFloat;
  DetItem.Prod.vOutro   := QDet.FieldByName('prod_vOutro').AsFloat;
  DetItem.Prod.vFrete   := QDet.FieldByName('prod_vFrete').AsFloat;
  DetItem.Prod.vSeg     := QDet.FieldByName('prod_vSeguro').AsFloat;



  DetItem.Prod.DI.Add;
  IdxDI := DetItem.Prod.DI.Count - 1;

  DetItem.Prod.DI.Items[IdxDI].nDI         := QDet.FieldByName('DI_nDI').AsString;
  DetItem.Prod.DI.Items[IdxDI].dDI         := StrToDateDef(QDet.FieldByName('DI_dDI').AsString, 0);
  DetItem.Prod.DI.Items[IdxDI].xLocDesemb  := QDet.FieldByName('DI_xLocDesemb').AsString;
  DetItem.Prod.DI.Items[IdxDI].UFDesemb    := QDet.FieldByName('DI_UFDesemb').AsString;
  DetItem.Prod.DI.Items[IdxDI].dDesemb     := StrToDateDef(QDet.FieldByName('DI_dDesemb').AsString, 0);
  DetItem.Prod.DI.Items[IdxDI].vAFRMM      := QDet.FieldByName('DI_vAFRMM').AsFloat;
  DetItem.Prod.DI.Items[IdxDI].cExportador := QDet.FieldByName('DI_cExportador').AsString;

  DetItem.Prod.DI.Items[IdxDI].adi.Add;
  IdxAdi := DetItem.Prod.DI.Items[IdxDI].adi.Count - 1;

  DetItem.Prod.DI.Items[IdxDI].adi.Items[IdxAdi].nAdicao     := QDet.FieldByName('DI_adi_nAdicao').AsInteger;
  DetItem.Prod.DI.Items[IdxDI].adi.Items[IdxAdi].cFabricante := QDet.FieldByName('DI_adi_cFabricante').AsString;
  DetItem.Prod.DI.Items[IdxDI].adi.Items[IdxAdi].nDraw       := QDet.FieldByName('DI_adi_nDraw').AsString;

  PreencherImpostosDoItem(DetItem, QDet);

  DetItem.infAdProd := QDet.FieldByName('infAdProd').AsString;

  // IBS/CBS para IBSCBS/IBSCBSTot
  AdicionarIBSDoItem(IndexNota, QDet);
end;

procedure TNFeService.AdicionarIBSDoItem(IndexNota: Integer; QDet: TFDQuery);
var
  IBS: TIBSCBSInfo;
  IsMae: Boolean;
  Count: Integer;
begin
  // Determina se a nota é mãe (IndexNota = 0) ou filha
  IsMae := IndexNota = 0;
  if IsMae then
  begin
    if FIBSCountMae >= Length(FIBSItensMae) then
      SetLength(FIBSItensMae, FIBSCountMae + 16);
  end
  else
  begin
    if FIBSCountFilha >= Length(FIBSItensFilha) then
      SetLength(FIBSItensFilha, FIBSCountFilha + 16);
  end;

  IBS.nItem      := QDet.FieldByName('det_nItem').AsInteger;
  IBS.CST        := QDet.FieldByName('IBS_CST').AsString;
  IBS.cClassTrib := QDet.FieldByName('IBS_cClassTrib').AsString;
  IBS.vBC        := QDet.FieldByName('IBS_vBC').AsFloat;
  IBS.pIBSUF     := QDet.FieldByName('IBS_pIBSUF').AsFloat;
  IBS.vIBSUF     := QDet.FieldByName('IBS_vIBSUF').AsFloat;
  IBS.pIBSMun    := QDet.FieldByName('IBS_pIBSMun').AsFloat;
  IBS.vIBSMun    := QDet.FieldByName('IBS_vIBSMun').AsFloat;
  IBS.vIBS       := QDet.FieldByName('IBS_vIBS').AsFloat;
  IBS.pCBS       := QDet.FieldByName('IBS_pCBS').AsFloat;
  IBS.vCBS       := QDet.FieldByName('IBS_vCBS').AsFloat;

  if IsMae then
  begin
    FIBSItensMae[FIBSCountMae] := IBS;
    Inc(FIBSCountMae);
    FIBSTotaisMae.vBCIBSCBS := FIBSTotaisMae.vBCIBSCBS + IBS.vBC;
    FIBSTotaisMae.vIBSUF    := FIBSTotaisMae.vIBSUF    + IBS.vIBSUF;
    FIBSTotaisMae.vIBSMun   := FIBSTotaisMae.vIBSMun   + IBS.vIBSMun;
    FIBSTotaisMae.vIBS      := FIBSTotaisMae.vIBS      + IBS.vIBS;
    FIBSTotaisMae.vCBS      := FIBSTotaisMae.vCBS      + IBS.vCBS;
  end
  else
  begin
    FIBSItensFilha[FIBSCountFilha] := IBS;
    Inc(FIBSCountFilha);
    FIBSTotaisFilha.vBCIBSCBS := FIBSTotaisFilha.vBCIBSCBS + IBS.vBC;
    FIBSTotaisFilha.vIBSUF    := FIBSTotaisFilha.vIBSUF    + IBS.vIBSUF;
    FIBSTotaisFilha.vIBSMun   := FIBSTotaisFilha.vIBSMun   + IBS.vIBSMun;
    FIBSTotaisFilha.vIBS      := FIBSTotaisFilha.vIBS      + IBS.vIBS;
    FIBSTotaisFilha.vCBS      := FIBSTotaisFilha.vCBS      + IBS.vCBS;
  end;
end;

procedure TNFeService.PreencherImpostosDoItem(DetItem: TDetCollectionItem; QDet: TFDQuery);
var
  IPIcEnq: string;
  IPICST: string;
  IPIvBC: Double;
  IPIpIPI: Double;
  IPIvIPI: Double;

  procedure SetCSTIPI(const IPIObj: TObject; const CSTStr: string);
  var
    PI: PPropInfo;
    OrdVal: Integer;
  begin
    if IPIObj = nil then
      Exit;

    PI := GetPropInfo(IPIObj, 'CST');
    if PI = nil then
      Exit;

    case PI.PropType^.Kind of
      tkString, tkLString, tkWString, tkUString:
        SetStrProp(IPIObj, PI, CSTStr);

      tkInteger, tkEnumeration:
        begin
          OrdVal := StrToIntDef(Trim(CSTStr), 99);
          SetOrdProp(IPIObj, PI, OrdVal);
        end;
    else
      // outros tipos: não altera
    end;
  end;

begin
  // Imposto de Importação
  DetItem.Imposto.II.vBC      := QDet.FieldByName('II_vBC').AsFloat;
  DetItem.Imposto.II.vDespAdu := 0;
  DetItem.Imposto.II.vII      := QDet.FieldByName('II_vII').AsFloat;
  DetItem.Imposto.II.vIOF     := QDet.FieldByName('II_vIOF').AsFloat;

  // IPI
  IPIpIPI := 0;
  if (QDet.FindField('IPI_pIPI') <> nil) and (not QDet.FieldByName('IPI_pIPI').IsNull) then
    IPIpIPI := QDet.FieldByName('IPI_pIPI').AsFloat;

//  if IPIpIPI > 0 then
  begin
    IPIcEnq := '';
    if QDet.FindField('IPI_cEnq') <> nil then
      IPIcEnq := Trim(QDet.FieldByName('IPI_cEnq').AsString);

    IPICST := '99';
    if QDet.FindField('IPI_CST') <> nil then
      IPICST := Trim(QDet.FieldByName('IPI_CST').AsString);

    IPIvBC := 0;
    if (QDet.FindField('IPI_vBC') <> nil) and (not QDet.FieldByName('IPI_vBC').IsNull) then
      IPIvBC := QDet.FieldByName('IPI_vBC').AsFloat;

    IPIvIPI := (IPIvBC * IPIpIPI) / 100;
    IPIvIPI := SimpleRoundTo(IPIvIPI, -2);

    // Preenche campos mínimos para o ACBr serializar <IPI>
    DetItem.Imposto.IPI.cEnq := IPIcEnq;

    // CST varia por versão do ACBr; usamos RTTI para setar com segurança
    SetCSTIPI(DetItem.Imposto.IPI, IPICST);

    DetItem.Imposto.IPI.vBC  := IPIvBC;
    DetItem.Imposto.IPI.pIPI := IPIpIPI;
    DetItem.Imposto.IPI.vIPI := IPIvIPI;
  end;

  // ICMS - usa campos calculados na QDet
  if QDet.FindField('ICMS_CST') <> nil then
    SetCSTIPI(DetItem.Imposto.ICMS, QDet.FieldByName('ICMS_CST').AsString);

  if QDet.FindField('ICMS_vBC') <> nil then
    DetItem.Imposto.ICMS.vBC := QDet.FieldByName('ICMS_vBC').AsFloat;

  if QDet.FindField('ICMS_pICMS') <> nil then
    DetItem.Imposto.ICMS.pICMS := QDet.FieldByName('ICMS_pICMS').AsFloat;

  if QDet.FindField('ICMS_vICMS') <> nil then
    DetItem.Imposto.ICMS.vICMS := QDet.FieldByName('ICMS_vICMS').AsFloat;

  if (QDet.FindField('ICMS_pRedBC') <> nil) and (not QDet.FieldByName('ICMS_pRedBC').IsNull) then
    DetItem.Imposto.ICMS.pRedBC := QDet.FieldByName('ICMS_pRedBC').AsFloat;

  // FCP (quando existir)
  if (QDet.FindField('ICMS_pFCP') <> nil) and (not QDet.FieldByName('ICMS_pFCP').IsNull) then
    DetItem.Imposto.ICMS.pFCP := QDet.FieldByName('ICMS_pFCP').AsFloat;

  if (QDet.FindField('ICMS_vFCP') <> nil) and (not QDet.FieldByName('ICMS_vFCP').IsNull) then
    DetItem.Imposto.ICMS.vFCP := QDet.FieldByName('ICMS_vFCP').AsFloat;
end;

procedure TNFeService.PreencherInfAdic(IndexNota: Integer);
var
  Nota: TNFe;
begin
  Nota := GetNota(IndexNota);
  Nota.infAdic.infCpl := FDM.QDet.FieldByName('infCpl').AsString;
end;

procedure TNFeService.ZerarTotais(IndexNota: Integer);
var
  Nota: TNFe;
begin
  Nota := GetNota(IndexNota);

  Nota.total.ICMSTot.vBC     := 0;
  Nota.total.ICMSTot.vICMS   := 0;
  Nota.total.ICMSTot.vBCST   := 0;
  Nota.total.ICMSTot.vST     := 0;
  Nota.total.ICMSTot.vProd   := 0;
  Nota.total.ICMSTot.vFrete  := 0;
  Nota.total.ICMSTot.vSeg    := 0;
  Nota.total.ICMSTot.vDesc   := 0;
  Nota.total.ICMSTot.vII     := 0;
  Nota.total.ICMSTot.vIPI    := 0;
  Nota.total.ICMSTot.vPIS    := 0;
  Nota.total.ICMSTot.vCOFINS := 0;
  Nota.total.ICMSTot.vOutro  := 0;
  Nota.total.ICMSTot.vNF     := 0;
end;

procedure TNFeService.SomarTotaisDoDet(IndexNota: Integer; QDet: TFDQuery);
var
  Nota: TNFe;
begin
  Nota := GetNota(IndexNota);

  Nota.total.ICMSTot.vProd  := Nota.total.ICMSTot.vProd  + QDet.FieldByName('prod_vProd').AsFloat;
  Nota.total.ICMSTot.vOutro := Nota.total.ICMSTot.vOutro + QDet.FieldByName('prod_vOutro').AsFloat;
  Nota.Total.ICMSTot.vFrete := Nota.Total.ICMSTot.vFrete + QDet.FieldByName('prod_vFrete').AsFloat;
  Nota.Total.ICMSTot.vSeg   := Nota.Total.ICMSTot.vSeg + QDet.FieldByName('prod_vSeguro').AsFloat;

  Nota.total.ICMSTot.vII     := Nota.total.ICMSTot.vII     + QDet.FieldByName('II_vII').AsFloat;
  Nota.total.ICMSTot.vPIS    := Nota.total.ICMSTot.vPIS    + QDet.FieldByName('PIS_vPIS').AsFloat;
  Nota.total.ICMSTot.vCOFINS := Nota.total.ICMSTot.vCOFINS + QDet.FieldByName('COFINS_vCOFINS').AsFloat;

  // caso precise totalizar vIPI também, somar aqui,
end;

procedure TNFeService.CalcularTotaisManuais(IndexNota: Integer);
var
  Nota: TNFe;
begin
  Nota := GetNota(IndexNota);

  Nota.total.ICMSTot.vNF :=
      Nota.total.ICMSTot.vProd
    + Nota.total.ICMSTot.vFrete
    + Nota.total.ICMSTot.vSeg
    + Nota.total.ICMSTot.vOutro
    + Nota.total.ICMSTot.vII
    + Nota.total.ICMSTot.vIPI
    - Nota.total.ICMSTot.vDesc;
end;

function TNFeService.NomeArquivoMae(const ANrProcesso: string): string;
begin
  Result := Format('NFe_%s_MAE.xml', [ANrProcesso]);
end;

function TNFeService.NomeArquivoFilha(const ANrProcesso: string; ANrAdicao: Integer; const ANrCntr: string): string;
var
  CntrOk: string;
begin
  CntrOk := StringReplace(Trim(ANrCntr), '/', '_', [rfReplaceAll]);
  CntrOk := StringReplace(CntrOk, '\', '_', [rfReplaceAll]);
  Result := Format('NFe_%s_A%d_CNTR_%s.xml', [ANrProcesso, ANrAdicao, CntrOk]);
end;

procedure CorrigirOrdemAtributosInfNFeNoArquivo(const NomeArquivoXML: string);
var
  S: string;
  PIni, PFim: Integer;
  TagAntiga, TagNova: string;
  IdValue, VerValue: string;

  function ExtractAttr(const Tag, Attr: string): string;
  var
    A, B: Integer;
    Key: string;
  begin
    Result := '';
    Key := Attr + '="';
    A := Pos(Key, Tag);
    if A <= 0 then Exit;
    A := A + Length(Key);
    B := A;
    while (B <= Length(Tag)) and (Tag[B] <> '"') do Inc(B);
    if B > Length(Tag) then Exit;
    Result := Copy(Tag, A, B - A);
  end;

begin
  if not FileExists(NomeArquivoXML) then
    Exit;

  // UTF-8 (padrão NF-e)
  S := TFile.ReadAllText(NomeArquivoXML, TEncoding.UTF8);

  // acha a abertura <infNFe ...>
  PIni := Pos('<infNFe', S);
  if PIni <= 0 then
    Exit;

  PFim := PIni;
  while (PFim <= Length(S)) and (S[PFim] <> '>') do
    Inc(PFim);
  if PFim > Length(S) then
    Exit;

  TagAntiga := Copy(S, PIni, PFim - PIni + 1);

  // extrai Id e versao
  IdValue  := ExtractAttr(TagAntiga, 'Id');
  VerValue := ExtractAttr(TagAntiga, 'versao');

  if (IdValue = '') or (VerValue = '') then
    Exit;

  // se já estiver na ordem correta, não mexe
  if Pos('Id="' + IdValue + '" versao="' + VerValue + '"', TagAntiga) > 0 then
    Exit;

  // monta a nova abertura com a ordem exigida
  TagNova := '<infNFe Id="' + IdValue + '" versao="' + VerValue + '">';

  // substitui exatamente a abertura antiga pela nova
  Delete(S, PIni, Length(TagAntiga));
  Insert(TagNova, S, PIni);

  TFile.WriteAllBytes(NomeArquivoXML, TEncoding.UTF8.GetBytes(S));
end;

procedure TNFeService.InserirIBSCBSNosItensComDados(
  const ANomeArquivoXML: string;
  const AIBS: array of TIBSCBSInfo;
  ACount: Integer);
const
  TAG_FIM = '</COFINS>';
var
  S: string;
  P, N, RealPos, I: Integer;
  FS: TFormatSettings;

  function Fmt(const AValue: Double; Decs: Integer): string;
  var
    Mask: string;
  begin
    Mask := '0.' + StringOfChar('0', Decs);
    Result := FormatFloat(Mask, AValue, FS);
  end;

  function BuildIBSCBS(const Info: TIBSCBSInfo): string;
  begin
    Result :=
      '<IBSCBS>' +
        '<CST>' + Info.CST + '</CST>' +
        '<cClassTrib>' + Info.cClassTrib + '</cClassTrib>' +
        '<gIBSCBS>' +
          '<vBC>' + Fmt(Info.vBC, 2) + '</vBC>' +
          '<gIBSUF>' +
            '<pIBSUF>' + Fmt(Info.pIBSUF, 4) + '</pIBSUF>' +
            '<vIBSUF>' + Fmt(Info.vIBSUF, 2) + '</vIBSUF>' +
          '</gIBSUF>' +
          '<gIBSMun>' +
            '<pIBSMun>' + Fmt(Info.pIBSMun, 4) + '</pIBSMun>' +
            '<vIBSMun>' + Fmt(Info.vIBSMun, 2) + '</vIBSMun>' +
          '</gIBSMun>' +
          '<vIBS>' + Fmt(Info.vIBS, 2) + '</vIBS>' +
          '<gCBS>' +
            '<pCBS>' + Fmt(Info.pCBS, 4) + '</pCBS>' +
            '<vCBS>' + Fmt(Info.vCBS, 2) + '</vCBS>' +
          '</gCBS>' +
        '</gIBSCBS>' +
      '</IBSCBS>';
  end;

begin
  if (ACount <= 0) or (not FileExists(ANomeArquivoXML)) then
    Exit;

  FS := TFormatSettings.Create;
  FS.DecimalSeparator := '.';

  S := TFile.ReadAllText(ANomeArquivoXML, TEncoding.UTF8);

  // Insere IBSCBS apos cada </COFINS>, na ordem dos itens IBS capturados
  P := 1;
  for I := 0 to ACount - 1 do
  begin
    N := Pos(TAG_FIM, Copy(S, P, MaxInt));
    if N <= 0 then
      Break;
    RealPos := P + N - 1;
    Insert(BuildIBSCBS(AIBS[I]), S, RealPos + Length(TAG_FIM));
    P := RealPos + Length(TAG_FIM);
  end;

  TFile.WriteAllBytes(ANomeArquivoXML, TEncoding.UTF8.GetBytes(S));
end;

procedure TNFeService.InserirIBSCBSTotComDados(
  const ANomeArquivoXML: string;
  const ATotais: TIBSCBSTotais);
var
  S: string;
  P: Integer;
  FS: TFormatSettings;
  IBSTot: string;

  function Fmt(const AValue: Double; Decs: Integer): string;
  var
    Mask: string;
  begin
    Mask := '0.' + StringOfChar('0', Decs);
    Result := FormatFloat(Mask, AValue, FS);
  end;

begin
  if not FileExists(ANomeArquivoXML) then
    Exit;

  FS := TFormatSettings.Create;
  FS.DecimalSeparator := '.';

  S := TFile.ReadAllText(ANomeArquivoXML, TEncoding.UTF8);

  // Insere IBSCBSTot apos </ICMSTot> e antes de <vNFTot>
  P := Pos('</ICMSTot>', S);
  if P <= 0 then
    Exit;

  P := P + Length('</ICMSTot>');

  IBSTot :=
    '<IBSCBSTot>' +
      '<vBCIBSCBS>' + Fmt(ATotais.vBCIBSCBS, 2) + '</vBCIBSCBS>' +
      '<gIBS>' +
        '<gIBSUF>' +
          '<vDif>0.00</vDif>' +
          '<vDevTrib>0.00</vDevTrib>' +
          '<vIBSUF>' + Fmt(ATotais.vIBSUF, 2) + '</vIBSUF>' +
        '</gIBSUF>' +
        '<gIBSMun>' +
          '<vDif>0.00</vDif>' +
          '<vDevTrib>0.00</vDevTrib>' +
          '<vIBSMun>' + Fmt(ATotais.vIBSMun, 2) + '</vIBSMun>' +
        '</gIBSMun>' +
        '<vIBS>' + Fmt(ATotais.vIBS, 2) + '</vIBS>' +
        '<vCredPres>0.00</vCredPres>' +
        '<vCredPresCondSus>0.00</vCredPresCondSus>' +
      '</gIBS>' +
      '<gCBS>' +
        '<vDif>0.00</vDif>' +
        '<vDevTrib>0.00</vDevTrib>' +
        '<vCBS>' + Fmt(ATotais.vCBS, 2) + '</vCBS>' +
        '<vCredPres>0.00</vCredPres>' +
        '<vCredPresCondSus>0.00</vCredPresCondSus>' +
      '</gCBS>' +
    '</IBSCBSTot>';

  Insert(IBSTot, S, P);

  TFile.WriteAllBytes(ANomeArquivoXML, TEncoding.UTF8.GetBytes(S));
end;

function TNFeService.GerarNFe(const ANrProcesso: string): TStringList;
var
  PastaProc: string;
  QCntr: TFDQuery;

  IndexMae: Integer;
  IndexFilha: Integer;

  NrAdicao: Integer;
  NrCntr: string;
  NrCntrUnico: string;

  NomeXMLMae: string;
  NomeXMLFilha: string;

  ListaArquivos: TStringList;
  IsAereo: Boolean;
  ContainerCount: Integer;

  procedure GerarSomenteMae(const CntrFiltro: string);
  begin
    FDM.QCab.First;
    while not FDM.QCab.Eof do
    begin
      NrAdicao := FDM.QCab.FieldByName('NR_ADICAO').AsInteger;

      // Se CntrFiltro = '' => depende do seu WHERE do QDet (já ajustado por você)
      // Se CntrFiltro <> '' => filtra por container normalmente
      AbrirQDet(ANrProcesso, NrAdicao, CntrFiltro);

      if not FDM.QDet.IsEmpty then
      begin
        // Dest (uma vez já bastaria; aqui mantém simples e seguro)
        FDM.QDet.First;
        PreencherDest(IndexMae);

        FDM.QDet.First;
        while not FDM.QDet.Eof do
        begin
          AdicionarItemNaNota(IndexMae, FDM.QDet);
          SomarTotaisDoDet(IndexMae, FDM.QDet);
          FDM.QDet.Next;
        end;

        // Mantém o padrão atual (pode sobrescrever em múltiplas adições)
        FDM.QDet.First;
        PreencherInfAdic(IndexMae);
      end;

      FDM.QCab.Next;
    end;

    FDM.QDet.Close;
    CalcularTotaisManuais(IndexMae);

    NomeXMLMae :=
      TPath.Combine(
        PastaProc,
        NomeArquivoMae(ANrProcesso)
      );

    FDM.ACBrNFe1.NotasFiscais.Items[IndexMae].GravarXML(NomeXMLMae);
    CorrigirOrdemAtributosInfNFeNoArquivo(NomeXMLMae);
    InserirIBSCBSNosItensComDados(NomeXMLMae, FIBSItensMae, FIBSCountMae);
    InserirIBSCBSTotComDados(NomeXMLMae, FIBSTotaisMae);
    ListaArquivos.Add(NomeXMLMae);
  end;

begin
  ListaArquivos := TStringList.Create;
  try
    // IA = aéreo -> não tem container e NÃO gera notas filhas
    IsAereo := Pos('IA', UpperCase(ANrProcesso)) > 0;

    if not IsAereo then
      ValidarContainersObrigatorios(ANrProcesso);

    FDM.PrepararConsultas(ANrProcesso);
    FDM.QCab.Open;
    if FDM.QCab.IsEmpty then
      raise Exception.Create('Nenhum cabeçalho encontrado para o processo ' + ANrProcesso);

    PastaProc := CriarPastaProcesso(ANrProcesso);

    // Cria Nota Mae
    FDM.ACBrNFe1.NotasFiscais.Clear;
    FDM.ACBrNFe1.NotasFiscais.Add;
    IndexMae := 0;

    ResetIBSDadosMae;

    PreencherCabecalhoDaNota(IndexMae);
    ZerarTotais(IndexMae);

    // =========================
    // MODO AÉREO (IA) - Só Mae
    // =========================
    if IsAereo then
    begin
      // Aqui usa '' para não filtrar por container (depende do WHERE do QDet já ajustado)
      GerarSomenteMae('');
      Result := ListaArquivos;
      Exit;
    end;

    // =========================
    // MODO MARÍTIMO (IM)
    // - Se 1 container => Só Mae
    // - Se >1 container => Mae + Filhas
    // =========================
    QCntr := TFDQuery.Create(nil);
    try
      QCntr.Connection := FDM.FDConnection1;
      QCntr.SQL.Text :=
        'SELECT NR_CNTR ' + sLineBreak +
        'FROM TDETALHE_MERCADORIA (NOLOCK) ' + sLineBreak +
        'WHERE NR_PROCESSO = :NR_PROCESSO ' + sLineBreak +
        'GROUP BY NR_CNTR';
      QCntr.ParamByName('NR_PROCESSO').AsString := ANrProcesso;
      QCntr.Open;

      ContainerCount := QCntr.RecordCount;

      // Se só tem 1 container, NÃO gera filhas (só Mae)
      if ContainerCount <= 1 then
      begin
        NrCntrUnico := '';
        if (not QCntr.IsEmpty) then
          NrCntrUnico := Trim(QCntr.Fields[0].AsString);

        // Aqui eu filtro pelo container único (mais seguro do que depender do '' no WHERE)
        GerarSomenteMae(NrCntrUnico);

        Result := ListaArquivos;
        Exit;
      end;

      // Se tem mais de 1 container, mantém o comportamento atual
      FDM.QCab.First;
      while not FDM.QCab.Eof do
      begin
        NrAdicao := FDM.QCab.FieldByName('NR_ADICAO').AsInteger;

        QCntr.First;
        while not QCntr.Eof do
        begin
          NrCntr := Trim(QCntr.Fields[0].AsString);

          AbrirQDet(ANrProcesso, NrAdicao, NrCntr);

          if not FDM.QDet.IsEmpty then
          begin
            FDM.ACBrNFe1.NotasFiscais.Add;
            IndexFilha := FDM.ACBrNFe1.NotasFiscais.Count - 1;

            PreencherCabecalhoDaNota(IndexFilha);
            ZerarTotais(IndexFilha);
            ResetIBSDadosFilha;

            FDM.QDet.First;
            PreencherDest(IndexFilha);
            PreencherDest(IndexMae);

            FDM.QDet.First;
            while not FDM.QDet.Eof do
            begin
              AdicionarItemNaNota(IndexFilha, FDM.QDet);
              SomarTotaisDoDet(IndexFilha, FDM.QDet);

              AdicionarItemNaNota(IndexMae, FDM.QDet);
              SomarTotaisDoDet(IndexMae, FDM.QDet);

              FDM.QDet.Next;
            end;

            FDM.QDet.First;
            PreencherInfAdic(IndexFilha);

            CalcularTotaisManuais(IndexFilha);

            NomeXMLFilha :=
              TPath.Combine(
                PastaProc,
                NomeArquivoFilha(ANrProcesso, NrAdicao, NrCntr)
              );

            FDM.ACBrNFe1.NotasFiscais.Items[IndexFilha].GravarXML(NomeXMLFilha);
            CorrigirOrdemAtributosInfNFeNoArquivo(NomeXMLFilha);
            InserirIBSCBSNosItensComDados(NomeXMLFilha, FIBSItensFilha, FIBSCountFilha);
            InserirIBSCBSTotComDados(NomeXMLFilha, FIBSTotaisFilha);
            ListaArquivos.Add(NomeXMLFilha);

            GetNota(IndexFilha).Det.Clear;
          end;

          QCntr.Next;
        end;

        FDM.QCab.Next;
      end;

      FDM.QDet.Close;
      CalcularTotaisManuais(IndexMae);

      NomeXMLMae :=
        TPath.Combine(
          PastaProc,
          NomeArquivoMae(ANrProcesso)
        );

      FDM.ACBrNFe1.NotasFiscais.Items[IndexMae].GravarXML(NomeXMLMae);
      CorrigirOrdemAtributosInfNFeNoArquivo(NomeXMLMae);
      InserirIBSCBSNosItensComDados(NomeXMLMae, FIBSItensMae, FIBSCountMae);
      InserirIBSCBSTotComDados(NomeXMLMae, FIBSTotaisMae);
      ListaArquivos.Add(NomeXMLMae);

    finally
      QCntr.Free;
    end;

    Result := ListaArquivos;

  except
    ListaArquivos.Free;
    raise;
  end;
end;

end.

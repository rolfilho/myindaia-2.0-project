unit Funcoes;
{
APENAS FUNÇÕES GLOBAIS
ATENÇÃO : Não declarar UNITS dos Projetos, exceto "PGGP017" que já está declarada.
}

interface

uses
  Variants,   sysutils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls,
  ComCtrls, Tabnotbk, dbtables, Registry, Printers, ToolEdit, RXDBCtrl, DateUtils,
  Clipbrd, TLHelp32, PsAPI,DBGrids, IniFiles,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxCalendar, cxTextEdit, cxButtonEdit,
  cxLabel, cxGridExportLink, cxGridDBBandedTableView, StrUtils, ServicoNovo;

const
  cRetInclusao    = 'INCLUSAOONLINE';
  cPreencherCampo = 'Campo "%s" deve ser preenchido!';
  _PASTA_CONFIG   = 'H:\DDBroker\Config\Grids\';
  _ZEROS = '00000000000000000000';

type
  TTipoDrawback = (tdSuspensao, tdIsencao);
  TDigits = 0..20;

type
  rDespesasNoArmazem = record
    Item              : string;
    Despesa           : string;
    Hint              : string;
    ValorTotalDespesa : Real;
    PeriodoAtual      : string;
  end;

function VerificaCamposTag(frm: Forms.TForm; pParent: array of TWinControl; MostrarMsg: boolean = true ): Boolean;
function IsNumeric( cNumero : string ): Boolean;
function Lookup( Query : DBTables.TQuery; Campo : TstringField; Codigo: string; Nome: string ) : string;
function BoxMensagem( s_Mensagem : string; nTipo : integer ) : Boolean;
function StrZero(nNumero : Double; i : Integer) : string;
function FStrZero(s : string; i : Integer) : string;
function UltCod(Query: DBTables.TQuery; NovoCodigo: TstringField ): string;
function FastLookup( Tabela : string; Campo : TstringField; Codigo: string; Nome: string; Filtro: string ) : string;
function PoeEmEdicao(vTable : DBTables.TQuery) : Boolean;
function VerIntegridade : Boolean;
function CNPJ(cCodigo: string) : Boolean;
//function MyRound( nNumero : Double; nCasas : Integer ) : Double;
function nAt( Arg1, Arg2: string ) : Integer;
function Commit(DataSet: DBTables.TQuery) : Boolean;
function IIF(pTest: Boolean; const pTrue: Integer; const pFalse: Integer): Integer; overload;
function IIF(pTest: Boolean; const pTrue: string; const pFalse: string): string;    overload;
function IIF(pTest: Boolean; const pTrue: Boolean; const pFalse: Boolean): Boolean; overload;
function IIF(pTest: Boolean; const pTrue: Real; const pFalse: Real): Real; overload;
function SelectSql(Qry_Consulta : DBTables.TQuery; const scriptSql : string) : Boolean;
function PutZeroEsquerda(pS : string; pQtd : Integer) : string;
function ExtractWord(pPosicao : Integer; pTexto,pBusca : string) : string;
function ContaOcorrencias(pTexto,pSubstring : string) : Integer;
function RefClienteHabilitacao(pUnidade, pProduto, pCliente : string; pBarraOuTamanho : Integer) : Integer; // pBarraOuTamanho = 0 -> BARRA
function CalculaPisCofinsICMS(const FlagPisCofins : Integer; ValorCIF, ValorOutrasDesps, AliqII, AliqIPI, AliqICMS, AliqPIS, AliqCOFINS : Real) : Real;
function VerifReferenciaDI(const pNr_processo : string; const pTipoVerificacao : string) : Boolean;                                                                                                         // pBarraOuTamanho = 1 -> TAMANHO
function Existe_Processo_Vinculado( pNR_PROCESSO , pTipo_Retorno : String ) : String;
function ParentFormName(AComponent: TComponent): String;
function ParentForm(AComponent: TComponent): TForm;
function BuscaIndiceColuna(DBGrid :TDBGrid; FindFieldName : String) : Integer;
function RemoveAcentos(str: string): string;
procedure SalvaGridView(AGridView: TcxGridDBTableView); overload;
procedure SalvaGridView(AGridView: TcxGridDBBandedTableView); overload;
procedure CarregaGridView(AGridView: TcxGridDBTableView); overload;
procedure CarregaGridView(AGridView: TcxGridDBBandedTableView); overload;
procedure AtribuiDireitos(var st_modificar: Boolean; var st_incluir: Boolean; var st_excluir: Boolean);
procedure TrataErro(E: Exception );
procedure ValidCodigo( dbedit_Codigo : TDbEdit );
procedure CloseStoredProc( Componente : TStoredProc );
procedure ExecStoredProc( Componente : TStoredProc );
procedure Localiza( Query : DBTables.TQuery; Chave : string; Campo : string );
procedure ChamaFormCadastro(const pNomeForm : string);
procedure ValCodEdt( Edit_Codigo : TMaskEdit );
procedure ApagaDados( Tabela : string; nr_identificador: Integer );
procedure Isql(InsertInto, Values  :string);
procedure Usql(Update, Set_, Where :string);
procedure Dsql(DeleteFrom, Where   :string);
procedure NullToZero( oCampo : TField );
procedure Delay(n: LongInt);
procedure ColaTexto(const pTexto : string);
function  PreencheStr ( pString : Char) : Boolean;
function  PreencheNum ( pNumero : Integer) : Boolean;
function  PreencheCampo ( pValor : string) : Boolean;
function  PreencheCampoEx(pHandle : HWND; pValor : string) : Boolean;
function Arredondar( nNumero : Double; nCasas : Integer ) : Double;
function TiraPonto( cNumero : string ) : string;
//procedure CloseStoredProc( Componente : TStoredProc );
//procedure CloseQuery( Componente : TQuery );
//procedure ExecStoredProc( Componente : TStoredProc );
//procedure OpenQuery( Componente : TQuery );
function CriaAlias(nDataBase, nServer: string; var sesCriaAlias: TSession): Boolean;
function PoeOuTiraDiasUteis(pQtdeDias : Integer; pMaisOuMenos : string; pData : TDateTime) : TDateTime;

function Replicate(cLetra:string; nNum:Integer ) : string;

function RetNum(const Valor : Variant) : Variant;
function RetStr(const Valor : Variant) : string;
function TrocaStr( cMasc : string; cCaracter : string; i : integer ): string;
function AcertaAspas( cTexto : string ): string;
function AllTrim( cstring : string ) : string;
function DespesasNoArmazem(pProcesso, pContainer, pTipoRegistro, pTamanhoCntr : string; pDiasMais : Integer; pTrazerCanceladas : Boolean; pMostrarErro: Boolean = True; pArmazemDescarga : string = ''; pArmazemAtraca : string = '') : Boolean;
function FastExecSQL(const pSQL : string) : Boolean; overload;
function FastExecSQL(const ASQL: string; AParams: array of Variant): Boolean; overload;
function CalculaFrete(pProcesso, pTabela, pItem: string; pConverte: Boolean = True): Real;
function DePara(pUnidade,pProduto,pTabela,pCodigoIndaia:string) : string;
function ParaDe(pUnidade, pProduto, pTabela, pCodigoExterno : string) : string;
function ConfereNF(pNrProcesso: string) : Boolean;

function TerminateProcesso(sFile: string): Bool;
function MyRound(AValue: Double; ADigits: TDigits = 2): Double;
function ValidaContainer( nr_container:String ): Boolean;
//Funções da DLL Consulta
//function ConsultaOnLineEx(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pNomeForm : string; pColunaOrdenada:Integer=1; pQuemChamou:integer=1): string; overload;
//function ConsultaOnLineExFiltro(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; Filtro: string; pNomeForm : string; pQuemChamou:integer=1): string; overload;
//function ConsultaOnLineExSQL(SQL, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pNomeForm : string; pQuemChamou:integer=1): string; overload;
//function ConsultaLookUP(Tabela, Campo, valor, Retorno: string; pQuemChamou:integer=1): string;
//function ConsultaLookUPSQL(pSQL, pRetorno: string; pQuemChamou:integer=1): string;
//function ConsultaOnLineExSQLList(SQL : TstringList; CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pNomeForm : string; pQuemChamou:integer=1): string; overload;

// Atualizar followup geral por viagem - Michel - 14/06/2010
//procedure AtualizarFollowupViagem(CD_UNID_NEG, CD_PRODUTO, CD_EMBARCACAO, NR_VIAGEM: String);
//procedure AtualizarContainers(vNr_Processo: String);

// Verificar se um Programa ou DLL está executando - Michel - 20/10/2010
function Executando(AExecutavel: String): Boolean;

function FileLastModified(AFileName: String): TDateTime;

// Verifica Serviço Novo - Michel - 04/09/2012
//function ProcessoServicoNovo(AProcesso: String): Boolean;
//function AjustaSQLServicoNovo(AServicoNovo: Boolean; ASQL: String): String;
//procedure AjustaQueryServicoNovo(AServicoNovo: Boolean; AQuery: TQuery);
//procedure AjustaControlesServicoNovo(AServicoNovo: Boolean; AParent: TComponent);

Var
  vRetDLL           : string;
  vQtdeDiasConsProc : Integer;
  a_str_indices     : array[0..10] of string[60];  //será alimentado qdo chamar a DLL
  vStr_cd_modulo    : string[2];
  str_cd_rotina     : string[4];
  str_cd_rot        : string[4];
  str_cd_mod        : string[2];
  str_cd_produto    : string[2];
  str_cd_unid_neg   : string[2];
  str_nr_processo   : string[20];
  str_cd_Cliente    : string[4];
  str_cd_Grupo      : string[3];
  vDespesasNoArmazem : array of rDespesasNoArmazem;
  WebConfig: TIniFile;
//  str_cd_cargo      : string[3];
//  str_cd_usuario    : string[4];

function URL_Imp: String;
function URL_Exp: String;


{  procedure AbreFormFinalidade(hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo : string ); stdcall; external 'CadastrosDll.dll';
  procedure AbreFormFamilia   (hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo : string ); stdcall; external 'CadastrosDll.dll';
  procedure AbreFormMoeda     (hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo : string ); stdcall; external 'CadastrosDll.dll';
  procedure AbreFormEmbalagem (hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo : string ); stdcall; external 'CadastrosDll.dll';}
//-------------------------------- Funções de DLL ----------------------------//

//  function ConsultaOnLineExDLL( Tabela, CaptionNaTela: string; Campos, Nomes: array of string;
//                                Retorno: string; pNomeForm : string;
//                                pStr_cd_cargo : string; pBase : TDataBase; pColunaOrdenada:Integer=1; pQuemChamou:integer=1): string;
//                                stdcall; external 'ConsultaDLL.dll';

//  function ConsultaOnLineExFiltroDLL( Tabela, CaptionNaTela: string; Campos,Nomes: array of string;
//                                      Retorno: string; Filtro: string; pNomeForm : string;
//                                      pStr_cd_cargo : string; pBase : TDataBase; pQuemChamou:integer=1): string;
//                                      stdcall; external 'ConsultaDLL.dll';

//  function ConsultaOnLineExSQLDLL(SQL, CaptionNaTela: string; Campos, Nomes: array of string;
//                                  Retorno: string; pNomeForm : string; pStr_cd_cargo : string;
//                                  pBase : TDataBase; pQuemChamou:integer=1): string;
//                                  stdcall; external 'ConsultaDLL.dll';

//  function ConsultaLookUPDLL( Tabela, Campo, valor, Retorno: string; pStr_cd_cargo : string;
//                              pBase : TDataBase; pQuemChamou:integer=1): string;
//                              stdcall; external 'ConsultaDLL.dll';

//  function ConsultaLookUPSQLDLL( pSQL, pRetorno: string; pStr_cd_cargo : string;
//                                 pBase : TDataBase; pQuemChamou:integer=1): string;
//                                 stdcall; external 'ConsultaDLL.dll';

//  function ConsultaOnLineExSQLListDLL( SQL : TstringList; CaptionNaTela: string; Campos, Nomes: array of string;
//                                       Retorno: string; pNomeForm : string; pStr_cd_cargo : string;
//                                       pBase : TDataBase; pQuemChamou:integer=1): string;
//                                       stdcall; external 'ConsultaDLL.dll';

//------------------------------------------------------------------------------


implementation

uses PGGP017, ConsOnLineEx,GSMLIB, PGDE001, PGDE002;

function DePara(pUnidade, pProduto, pTabela, pCodigoIndaia : string) : string;
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT CD_EXTERNO FROM TDE_PARA (NOLOCK) WHERE CD_DDBROKER = ''' + pCodigoIndaia + '''');
    SQL.Add('AND CD_TABELA = '''+ptabela+''' AND CD_UNID_NEG = '''+pUnidade+''' AND CD_PRODUTO = '''+pProduto+'''');
    Open;
    Result := Fields[0].Asstring;
    Free;
  end;
end;

function ParaDe(pUnidade, pProduto, pTabela, pCodigoExterno : string) : string;
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = ''' + pCodigoExterno + '''');
    SQL.Add('AND CD_TABELA = '''+ptabela+''' AND CD_UNID_NEG = '''+pUnidade+''' AND CD_PRODUTO = '''+pProduto+'''');
    Open;
    Result := Fields[0].Asstring;
    Free;
  end;
end;


function RemoveAcentos(str: string): string;
const
  COMACENTO = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SEMACENTO = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  X:integer;
begin
  for X:=1 to length(str) do
  begin
    if pos(str[X],COMACENTO)<>0 then
      str[X]:=SEMACENTO[pos(str[X],COMACENTO)];
  end;
  result:=str;
end;

function CalculaFrete(pProcesso, pTabela, pItem: string; pConverte: Boolean = True): Real;
{
results negativos: os results negativos são para informar erros que ocorrem na
função e mostrar a mensagem ao final de todos os itens que serão passados nela..
}

  function ItemFrete(pProcesso, pTabela, pItem, pEstufagem: string): Real;
  var qryAux, qryAux2: TQuery;
      vlAux: Real;
      i: word;
  begin
  {3a--- primeira verificação: tipo de Estufagem - FCL ------------------------}
      if pEstufagem = '1' then
      begin
      {3a--- lista containers agrupando por tipo ------------------------------}
      qryAux := TQuery.Create(application);
      qryAux.DataBaseName := 'DBBROKER';
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT COUNT(*) QTDE, TP_CNTR FROM TPROCESSO_CNTR (NOLOCK) ');
      qryAux.SQL.Add(' WHERE NR_PROCESSO = "' + pProcesso + '" ');
      qryAux.SQL.Add(' GROUP BY TP_CNTR ');
      try
        qryAux.Open;
        if qryAux.IsEmpty then
        begin
          Result := -11;
          qryAux.Free;
          Exit;
        end;

        Result := 0;
        qryAux.First;
        {3a--- para cada tipo de container multiplica o valor cadastrado na tabela de Frete para ele ---}
        for i := 0 to qryAux.RecordCount - 1 do
        begin
          qryAux2 := TQuery.Create(application);
          qryAux2.DataBaseName := 'DBBROKER';
          qryAux2.Close;
          qryAux2.SQL.Clear;
          qryAux2.SQL.Add('SELECT VOLUME_TAB_FRETE, ISNULL(VL_COMPRA_TAB_FRETE,0) + ISNULL(VL_COMPRA_CIA_ARMADOR,0) FROM TTAB_FRETE_ITEM (NOLOCK) ');
          qryAux2.SQL.Add(' WHERE TP_ESTUFAGEM = "' + pEstufagem + '" ');
          qryAux2.SQL.Add('   AND CD_TAB_FRETE = "' + pTabela + '" ');
          qryAux2.SQL.Add('   AND VOLUME_TAB_FRETE = "' + qryAux.Fields[1].Asstring + '" ');
          try
            qryAux2.Open;
            if qryAux2.IsEmpty then
            begin
              Result := -2;
              Break;
            end
            else
            begin
              Result := Result + (qryAux.Fields[0].AsInteger * qryAux2.Fields[1].AsFloat);
            end;
            qryAux.Next;
            qryAux2.Free;
          except
            Result := -1;
            qryAux2.Free;
            qryAux.Free;
            Break;
          end;
        end;
        qryAux.Free;
      except
        Result := -1;
        qryAux.Free;
        Exit;
      end;
  {3b--- primeira verificação: tipo de Estufagem - LCL ------------------------}
    end else if pEstufagem = '0' then
    begin
      {3b--- lista o peso por tonelado e cubagem, abaixo verifica qual é o maior ---}
      qryAux := TQuery.Create(application);
      qryAux.DataBaseName := 'DBBROKER';
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT ISNULL(SUM(PESO/1000), 0) SOMAPESO, ISNULL(SUM(VL_CUBAGEM_M3), 0) SOMACUBAGEM ');
      qryAux.SQL.Add('  FROM TPROCESSO_CARGA_SOLTA (NOLOCK) ');
      qryAux.SQL.Add(' WHERE NR_PROCESSO = "' + pProcesso + '" ');
      try
        qryAux.Open;
        if qryAux.Fields[0].AsFloat - qryAux.Fields[1].AsFloat > 0 then
          vlAux := qryAux.Fields[0].AsFloat
        else
          vlAux := qryAux.Fields[1].AsFloat;

        qryAux.Free;
      except
        Result := -1;
        qryAux.Free;
        Exit;
      end;
      {3ba--- verifica a via de Tranporte pois os cálculos são diferentes - Maritima ---}
      if ConsultaLookUp('TTAB_FRETE', 'CD_TAB_FRETE', pTabela, 'CD_VIA_TRANSP') = '01' then
      begin
        {--- seleciona o valor cadastrado em Tarifa LCL para realizar o cálculo ---}
        qryAux2 := TQuery.Create(application);
        qryAux2.DataBaseName := 'DBBROKER';
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add('SELECT ISNULL(VL_COMPRA_TAB_FRETE, 0) + ISNULL(VL_COMPRA_CIA_ARMADOR,0) FROM TTAB_FRETE_ITEM (NOLOCK) ');
        qryAux2.SQL.Add(' WHERE TP_ESTUFAGEM = "' + pEstufagem + '" ');
        qryAux2.SQL.Add('   AND CD_TAB_FRETE = "' + pTabela + '" ');
        qryAux2.SQL.Add('   AND TTIPO_SIMBOLO_TAB_FRETE = "0" ');
        try
          qryAux2.Open;
          if qryAux2.IsEmpty then
            Result := -3
          else
          begin
            Result := vlAux* qryAux2.Fields[0].AsFloat;
          end;
          qryAux2.Free;
        except
          Result := -1;
          qryAux2.Free;
        end;
      {3bb--- verifica a via de Tranporte pois os cálculos são diferentes - Aérea Exportação ---}
      end else if (ConsultaLookUp('TTAB_FRETE', 'CD_TAB_FRETE', pTabela, 'CD_VIA_TRANSP') = '04') and (ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', pProcesso, 'CD_PRODUTO') = '02') then
      begin   //aéreo - exportação
        {--- lista o peso do frete mínimo para saber se  é maior que o valor auxiliar ---}
        qryAux2 := TQuery.Create(application);
        qryAux2.DataBaseName := 'DBBROKER';
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add('SELECT PESO_TAB_FRETE, ISNULL(VL_COMPRA_TAB_FRETE, 0) + ISNULL(VL_COMPRA_CIA_ARMADOR,0) FROM TTAB_FRETE_ITEM (NOLOCK) ');
        qryAux2.SQL.Add(' WHERE TP_ESTUFAGEM = "' + pEstufagem + '" ');
        qryAux2.SQL.Add('   AND CD_TAB_FRETE = "' + pTabela + '" ');
        qryAux2.SQL.Add('   AND TTIPO_SIMBOLO_TAB_FRETE = "-" ');
        try
          qryAux2.Open;
          if qryAux2.IsEmpty then
            Result := -4
          else
          begin
            if vlAux <= qryAux2.Fields[0].AsFloat then
              Result := vlAux*qryAux2.Fields[1].ASFloat
            else
            begin
              {--- seleciona os pesos e os valores ordenando por peso }
              qryAux2.Close;
              qryAux2.SQL.Clear;
              qryAux2.SQL.Add('SELECT PESO_TAB_FRETE, ISNULL(VL_COMPRA_TAB_FRETE, 0) + ISNULL(VL_COMPRA_CIA_ARMADOR,0) FROM TTAB_FRETE_ITEM (NOLOCK) ');
              qryAux2.SQL.Add(' WHERE TP_ESTUFAGEM = "' + pEstufagem + '" ');
              qryAux2.SQL.Add('   AND CD_TAB_FRETE = "' + pTabela + '" ');
              qryAux2.SQL.Add('   AND TTIPO_SIMBOLO_TAB_FRETE = "+" ');
              qryAux2.SQL.Add(' ORDER BY PESO_TAB_FRETE ');
              try
                qryAux2.Open;
                if qryAux2.IsEmpty then
                  Result := -5
                else
                begin
                  qryAux2.Last;
                  {--- verifica do último para o primeiro em qual tarifa irá ser feito o cálculo ---}
                  for i := 0 to qryAux2.RecordCount - 1 do
                  begin
                    if vlAux  <= qryAux2.Fields[0].AsFloat then
                    begin
                      qryAux2.Prior;
                      Result := -6;
                    end
                    else
                    begin
                      Result := vlAux*qryAux2.Fields[1].ASFloat;
                      Break;
                    end;
                  end;
              end;

              except
                Result := -1;
              end;
            end;
          end;
          qryAux2.Free;
        except
          Result := -1;
          qryAux2.Free;
        end;
      end else if (ConsultaLookUp('TTAB_FRETE', 'CD_TAB_FRETE', pTabela, 'CD_VIA_TRANSP') = '04') and (ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', pProcesso, 'CD_PRODUTO') = '01') then
      begin
        Result := 0; {AGUARDANDO DEFINIÇÃO DE CÁLCULO}
      {3bc--- verifica a via de Tranporte pois os cálculos são diferentes - sem via de Transporte Válida ---}
      end
      else
        Result := -7;
    {3c--- primeira verificação: tipo de Estufagem - sem estufagem cadastrada----}
    end
    else
      Result := -8;

  end;

var
  vEstufagem: string[1];
  vMoeda: string[3];
  QryAux: TQuery;
  vTaxaConversao: Real;
begin
{0--- verifica se moeda do Processo = moeda da Tabela de Frete ----------------}
  if ConsultaLookUpSQL('SELECT CD_MOEDA_TAB_FRETE FROM TTAB_FRETE (NOLOCK) WHERE CD_TAB_FRETE = "' + pTabela + '" ','CD_MOEDA_TAB_FRETE') <>
     ConsultaLookUpSQL('SELECT CD_MOEDA_FRETE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + pProcesso + '" ','CD_MOEDA_FRETE') then
  begin
    Result := -10;
    Exit;
  end;



  vEstufagem := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', pProcesso, 'TP_ESTUFAGEM');

{1--- verifica se item passado existe na tabela de Frete------------------------}
  if (pItem = ConsultaLookUpSQL('SELECT CD_ITEM FROM TTAB_FRETE_DESPESA (NOLOCK) WHERE CD_ITEM = "' + pItem + '" ' +
                               ' AND CD_TAB_FRETE = "' + pTabela + '" ' +
                               ' AND TP_ESTUFAGEM = "' + vEstufagem + '" ', 'CD_ITEM')) or
     (pItem = ConsultaLookUpSQL('SELECT CD_ITEM_FRETE_MAR   FROM TPARAMETROS', 'CD_ITEM_FRETE_MAR')) or
     (pItem = ConsultaLookUpSQL('SELECT CD_ITEM_FRETE_AEREO FROM TPARAMETROS', 'CD_ITEM_FRETE_AEREO')) then
  begin

  {2--- verifica se o item passado é um item de frete ou apenas uma despesa----}
    if (pItem = ConsultaLookUpSQL('SELECT CD_ITEM_FRETE_MAR   FROM TPARAMETROS', 'CD_ITEM_FRETE_MAR')) or
       (pItem = ConsultaLookUpSQL('SELECT CD_ITEM_FRETE_AEREO FROM TPARAMETROS', 'CD_ITEM_FRETE_AEREO')) then
    begin
  {2a--- verificação de item de frete (função interna)-------------------------}
       vMoeda := ConsultaLookUpSQL('SELECT CD_MOEDA_TAB_FRETE FROM TTAB_FRETE (NOLOCK) WHERE CD_TAB_FRETE = "' + pTabela + '" ','CD_MOEDA_TAB_FRETE');
       Result := ItemFrete(pProcesso, pTabela, pItem, vEstufagem);
    end
    else
    begin
  {2b--- verificação de despesas-----------------------------------------------}
      with TQuery.Create(application) do
      begin
        vMoeda := ConsultaLookUpSQL('SELECT CD_MOEDA FROM TTAB_FRETE_DESPESA (NOLOCK) WHERE CD_ITEM = "' + pItem + '" ' +
                                    ' AND CD_TAB_FRETE = "' + pTabela + '" ' +
                                    ' AND TP_ESTUFAGEM = "' + vEstufagem + '" ', 'CD_MOEDA');
        DataBaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('SELECT ISNULL(VL_COMPRA_AG, 0) + ISNULL(VL_COMPRA_CIA, 0), ISNULL(TP_CNTR, "") TP_CNTR FROM TTAB_FRETE_DESPESA (NOLOCK) WHERE CD_ITEM = "' + pItem + '" ');
        SQL.Add('   AND CD_TAB_FRETE = "' + pTabela + '" ');
        SQL.Add('   AND TP_ESTUFAGEM = "' + vEstufagem + '" ');
        SQL.Add(' ORDER BY TP_CNTR ');
        try
          Open;
        except
          Result := -1;
          Free;
        end;
        if vEstufagem = '0' then
          Result := Fields[0].AsFloat
        else if vEstufagem = '1' then
        begin
          if (RecordCount = 1) and (Fields[1].Asstring = '') then
            Result := Fields[0].AsFloat
          else
          begin
            qryAux := TQuery.Create(application);
            qryAux.DataBaseName := 'DBBROKER';
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT COUNT(*) QTDE, TP_CNTR FROM TPROCESSO_CNTR (NOLOCK) ');
            qryAux.SQL.Add(' WHERE NR_PROCESSO = "' + pProcesso + '" ');
            qryAux.SQL.Add(' GROUP BY TP_CNTR ');
            try
              qryAux.Open;
              if qryAux.IsEmpty then
              begin
                Result := 0;
                qryAux.Free;
                Exit;
              end;
              Result := 0;
              while not QryAux.Eof do
              begin
                if Locate('TP_CNTR', QryAux.Fields[1].Asstring, []) then
                  Result := Result + (QryAux.Fields[0].AsInteger * Fields[0].AsFloat)
                else if Locate('TP_CNTR', '', []) then
                  Result := Result + (QryAux.Fields[0].AsInteger * Fields[0].AsFloat);

                QryAux.Next;
              end;
            except
              Result := -1;
              qryAux.Free;
              Exit;
            end;
            QryAux.Free;
          end;
        end;
        Free;
      end;

    end;

  {0--- converte moeda dependendo da taxa do dia se for necessário a conversão---}
    if pConverte then
    begin
      with TQuery.Create(application) do
      begin
        DataBaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('SELECT ISNULL(TX_CAMBIO, 0) FROM TTAXA_CAMBIO (NOLOCK) ');
        SQL.Add(' WHERE CD_MOEDA = "' + vMoeda + '" ');
        SQL.Add('    AND GETDATE() BETWEEN DT_INICIO_VIGENCIA ');
        SQL.Add('                      AND DT_TERMINO_VIGENCIA ');
        try
          Open;
          if IsEmpty then
            Result := -9
          else
            Result := Result*Fields[0].AsFloat;
        except
          Result := -1;
          Free;
        end;
        Free;
      end;
    end;
  end else
{1--- se item não existe na Tabela de Frete, resultado é zero------------------}
    Result := 0;



end;













(*Componentes tratados pela função: TEdit, TDBEdit, TComboBox, TDBComboBox,
  TDBLookUpComboBox, TMemo, TDBMemo, TMaskEdit, TDateEdit, TDBDateEdit      *)
function VerificaCamposTag(frm: Forms.TForm; pParent: array of TWinControl; MostrarMsg: boolean = true): Boolean;
const cor = clyellow;
var   i, j, k: word;
      input: string;
begin
  Result := true;
{--- loop em todos os componentes ---------------------------------------------}
  for i := 0 to frm.ComponentCount - 1 do
  begin
{--- verificando se é obrigatório através do TAG ------------------------------}
     if frm.Components[i].Tag = 666 then
     begin
{--- loop de todos os parents em cada componente ------------------------------}
       for j := 0 to Length(pParent) do
       begin
{--- se pertencer ao parent inicia a verificação ------------------------------}
         if (TWinControl(frm.Components[i]).Parent = pParent[j]) then
         begin
           {--- TEdit ---------------------------------------------------------}
           if (frm.Components[i] is Tedit) then
           begin
             if  (Trim(Tedit(frm.Components[i]).Text) = '') then
             begin
               Result := false;
               Tedit(frm.Components[i]).Color := cor;
             end
             else
               if Tedit(frm.Components[i]).Enabled = true then Tedit(frm.Components[i]).Color := clwhite
               else Tedit(frm.Components[i]).Color := clmenu;
           end;
           {--- TDBEdit -------------------------------------------------------}
           if (frm.Components[i] is TDBedit) then
           begin
             if  (Trim(TDBedit(frm.Components[i]).Text) = '') then
             begin
               Result := false;
               TDBedit(frm.Components[i]).Color := cor;
             end
             else
               if TDBedit(frm.Components[i]).Enabled = true then TDBedit(frm.Components[i]).Color := clwhite
               else TDBedit(frm.Components[i]).Color := clmenu;
           end;
           {--- TComboBox -----------------------------------------------------}
           if (frm.Components[i] is TComboBox) then
           begin
             if  (Trim(TComboBox(frm.Components[i]).Text) = '') then
             begin
               Result := false;
               TComboBox(frm.Components[i]).Color := cor;
             end
             else
               if TComboBox(frm.Components[i]).Enabled = true then TComboBox(frm.Components[i]).Color := clwhite
               else TComboBox(frm.Components[i]).Color := clmenu;
           end;
           {--- TDBComboBox ---------------------------------------------------}
           if (frm.Components[i] is TDBComboBox) then
           begin
             if  (Trim(TDBComboBox(frm.Components[i]).Text) = '') then
             begin
               Result := false;
               TDBComboBox(frm.Components[i]).Color := cor;
             end
             else
               if TDBComboBox(frm.Components[i]).Enabled = true then TDBComboBox(frm.Components[i]).Color := clwhite
               else TDBComboBox(frm.Components[i]).Color := clmenu;
           end;
           {--- TDBLookUpComboBox ---------------------------------------------}
           if (frm.Components[i] is TDBLookUpComboBox) then
           begin
             if  (Trim(TDBLookUpComboBox(frm.Components[i]).Text) = '') then
             begin
               Result := false;
               TDBLookUpComboBox(frm.Components[i]).Color := cor;
             end
             else
               if TDBLookUpComboBox(frm.Components[i]).Enabled = true then TDBLookUpComboBox(frm.Components[i]).Color := clwhite
               else TDBLookUpComboBox(frm.Components[i]).Color := clmenu;
           end;
           {--- TMemo ---------------------------------------------------------}
           if (frm.Components[i] is TMemo) then
           begin
             if  (Trim(TMemo(frm.Components[i]).Text) = '') then
             begin
               Result := false;
               TMemo(frm.Components[i]).Color := cor;
             end
             else
               if TMemo(frm.Components[i]).Enabled = true then TMemo(frm.Components[i]).Color := clwhite
               else TMemo(frm.Components[i]).Color := clmenu;
           end;
           {--- TDBMemo -------------------------------------------------------}
           if (frm.Components[i] is TDBMemo) then
           begin
             if  (Trim(TDBMemo(frm.Components[i]).Text) = '') then
             begin
               Result := false;
               TDBMemo(frm.Components[i]).Color := cor;
             end
             else
               if TDBMemo(frm.Components[i]).Enabled = true then TDBMemo(frm.Components[i]).Color := clwhite
               else TDBMemo(frm.Components[i]).Color := clmenu;
           end;
           {--- TMaskedit -----------------------------------------------------}
           if (frm.Components[i] is TMaskEdit) then
           begin
             {--- verifica maskEdit quando não salva a máscara ----------------}
             if  (Copy(Trim(TMaskEdit(frm.Components[i]).EditMask), Length(TMaskEdit(frm.Components[i]).EditMask) - 2, 1) = '0') or (Trim(TMaskEdit(frm.Components[i]).EditMask) = '') then
             begin
               if (Trim(TMaskEdit(frm.Components[i]).Text) = '') then
               begin
                 Result := false;
                 TMaskEdit(frm.Components[i]).Color := cor;
               end
               else
                 if TMaskEdit(frm.Components[i]).Enabled = true then TMaskEdit(frm.Components[i]).Color := clwhite
                 else TMaskEdit(frm.Components[i]).Color := clmenu;
             end
             {--- verifica maskEdit quando salva a máscara --------------------}
             else if (Copy(Trim(TMaskEdit(frm.Components[i]).EditMask), Length(TMaskEdit(frm.Components[i]).EditMask) - 2, 1) = '1') then
             begin
               k := 1;
               input := '';
               {--- loop em cada caracter da máscara --------------------------}
               for k := 1 to Length(TMaskEdit(frm.Components[i]).EditMask) - 4 do
               begin

                 if (Copy(Trim(TMaskEdit(frm.Components[i]).EditMask), k, 1) = '9') or
                    (Copy(Trim(TMaskEdit(frm.Components[i]).EditMask), k, 1) = '0') or
                    (Copy(Trim(TMaskEdit(frm.Components[i]).EditMask), k, 1) = 'a') or
                    (Copy(Trim(TMaskEdit(frm.Components[i]).EditMask), k, 1) = 'A') then
                   input := input + ' '
                 else
                   if (Copy(Trim(TMaskEdit(frm.Components[i]).EditMask), k, 1) <> '!') then input := input + Copy( Trim(TMaskEdit(frm.Components[i]).EditMask), k, 1);
               end;

               if (TMaskEdit(frm.Components[i]).Text = input) then
               begin
                 Result := false;
                 TMaskEdit(frm.Components[i]).Color := cor;
               end
               else
               begin
                 if (Copy(TMaskEdit(frm.Components[i]).EditMask, 1, Length(TMaskEdit(frm.Components[i]).EditMask) - 4) = '99/99/9999')  or
                    (Copy(TMaskEdit(frm.Components[i]).EditMask, 1, Length(TMaskEdit(frm.Components[i]).EditMask) - 4) = '00/00/0000')  or
                    (Copy(TMaskEdit(frm.Components[i]).EditMask, 1, Length(TMaskEdit(frm.Components[i]).EditMask) - 4) = '!99/99/9999') or
                    (Copy(TMaskEdit(frm.Components[i]).EditMask, 1, Length(TMaskEdit(frm.Components[i]).EditMask) - 4) = '!00/00/0000') then
                 begin
                   try
                     StrToDate(TMaskEdit(frm.Components[i]).Text);
                     if TMaskEdit(frm.Components[i]).Enabled = true then TMaskEdit(frm.Components[i]).Color := clwhite
                     else TMaskEdit(frm.Components[i]).Color := clmenu;
                   except
                     Result := false;
                     TMaskEdit(frm.Components[i]).Color := cor;
                   end;
                 end
                 else
                   if TMaskEdit(frm.Components[i]).Enabled = true then TMaskEdit(frm.Components[i]).Color := clwhite
                   else TMaskEdit(frm.Components[i]).Color := clmenu;
               end;
             end;
           end;
           {--- TDateEdit -------------------------------------------------------}
           if (frm.Components[i] is TDateEdit) then
           begin

             if  (Trim(TDateEdit(frm.Components[i]).Text) = '  /  /   ') then
             begin
               Result := false;
               TDateEdit(frm.Components[i]).Color := cor;
             end
             else
               try
                 StrToDate(TDateEdit(frm.Components[i]).Text);
                 if TDateEdit(frm.Components[i]).Enabled = true then TDateEdit(frm.Components[i]).Color := clwhite
                 else TDateEdit(frm.Components[i]).Color := clmenu;
               except
                 Result := false;
                 TDateEdit(frm.Components[i]).Color := cor;
               end;
           end;
           {--- TDBDateEdit ---------------------------------------------------}
           if (frm.Components[i] is TDBDateEdit) then
           begin

             if  (Trim(TDBDateEdit(frm.Components[i]).Text) = '  /  /   ') then
             begin
               Result := false;
               TDBDateEdit(frm.Components[i]).Color := cor;
             end
             else
               try
                 StrToDate(TDBDateEdit(frm.Components[i]).Text);
                 if TDBDateEdit(frm.Components[i]).Enabled = true then TDBDateEdit(frm.Components[i]).Color := clwhite
                 else TDBDateEdit(frm.Components[i]).Color := clmenu;
               except
                 Result := false;
                 TDBDateEdit(frm.Components[i]).Color := cor;
               end;
           end;

         end;
       end;
     end;
  end;

{--- Mensagem caso exista campos não preenchidos ------------------------------}
  if (not Result) and (MostrarMsg) then Application.MessageBox('Existem campos obrigatórios não preenchidos ou preenchidos de forma incorreta!' + chr(13) + 'Estes campos estão sinalizados em cor diferente!', 'Campos Obrigatórios', MB_OK + MB_ICONWARNING);
end;

function Lookup( Query : DBTables.TQuery; Campo : TstringField; Codigo: string; Nome: string ) : string;
begin
  If Trim( Campo.Asstring ) <> '' Then
  begin
    Query.Close;
    Query.ParamByName( Codigo ).Asstring := Trim( Campo.Asstring );
    Query.Prepare;
    if Query is TQuery then
      TQuery(Query).Open
    else
      Query.Open;
    If Query.RecordCount > 0 Then
       Lookup := Trim( Query.FieldByName( Nome ).Asstring )
    Else
       Lookup := '';
    Query.Close;
  End
  Else
    Lookup := '';
End;

function BoxMensagem( s_Mensagem : string; nTipo : integer ) : Boolean;
begin
  BoxMensagem := False;
  case nTipo of
    1: begin   { Janela para mensagem de Confirmação }
         BoxMensagem := MessageDlg( s_Mensagem, mtConfirmation, [mbYes, mbNo], 1 ) = mrYes;
       end;
    2: begin   { Janela para mensagem de Erro }
         BoxMensagem := MessageDlg( s_Mensagem, mtError, [mbOk], 0 ) = mrOk;
       end;
    3: begin   { Janela para mensagem de Aviso }
         BoxMensagem := MessageDlg( s_Mensagem, mtWarning, [mbOk], 0 ) = mrOk;
       end;
  end;
end;

procedure AtribuiDireitos(var st_modificar:boolean; var st_incluir:boolean; var st_excluir:boolean);
begin
  Try
    With datm_main.qry_direito_acesso_ Do
    begin
      Close;
      UnPrepare;
      ParamByName('cd_cargo').Asstring  := str_cd_cargo;
      ParamByName('cd_modulo').Asstring := vStr_cd_modulo;
      ParamByName('cd_rotina').Asstring := str_cd_rotina;
      Prepare;
      Open;
      st_modificar := FieldByName('IN_MODIFICAR').AsBoolean;
      st_incluir   := FieldByName('IN_INCLUIR').AsBoolean;
      st_excluir   := FieldByName('IN_EXCLUIR').AsBoolean;
      Close;
    end;
  except
    raise Exception.Create('Não foi possível atribuir direitos a esse usuário!');
    st_modificar := False;
    st_incluir   := False;
    st_excluir   := False;
  end;

  if str_cd_cargo = '000' then
  begin
    st_modificar := True;
    st_incluir   := True;
    st_excluir   := True;
  end;

end;

procedure TrataErro(E: Exception);
var
  i : Integer;
begin
  if E is EDBEngineError then
  begin
    for i := 0 to EDBEngineError(E).ErrorCount - 1 do
    begin
      case EDBEngineError(E).Errors[i].NativeError of
        0:     ;
        547:   MessageDlg('Erro de Chave estrangeira!' + #13#10 +
                          'Operação cancelada!', mtError, [mbOk], 0);
        2627:  MessageDlg('Código do registro já cadastrado!' + #13#10 +
                          'Tente outro código!', mtError, [mbOk], 0);                                           
      else
        MessageDlg('Erro código: ' + IntToStr(EDBEngineError(E).Errors[i].NativeError) + ' Informe ao administrador do sistema!',
                    mtError, [mbOk], 0);
      end;
    end;
  end
  else
  begin
    if E is EConvertError then
    begin
      ShowMessage( EConvertError(E).Message);
    end;
  end;
end;

procedure ValidCodigo( dbedit_Codigo : TDbEdit );
Var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin

  lDigitouLetras := False;
  if dbedit_Codigo.Field.Size = 0 then Exit;

  nFim := Length(Trim(dbedit_Codigo.Text));

  if (nFim > 0) and (nFim <> dbedit_Codigo.Field.Size)then
  begin
    { VERIFICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO }
    nLoop := 1;
    Repeat
      if Not (dbedit_Codigo.Text[nLoop] In ['0'..'9'] ) then
         lDigitouLetras := True;
      nLoop := nLoop + 1;
    Until (lDigitouLetras) or ( nLoop > nFim );

    { SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO }
    if Not( lDigitouLetras ) then
    begin
      nNumero := StrToFloat(dbedit_Codigo.Text);
      if Not dbedit_codigo.ReadOnly then
      dbedit_Codigo.field.Asstring := StrZero( nNumero, dbedit_Codigo.Field.Size );
    end;

  end;

end;

function StrZero(nNumero : double; i : Integer) : string;
Var
  s : string;
begin
  try
    s := FloatToStr( nNumero )
  except
    s := ''
  end;
  While Length( s ) < i do s := '0' + s;
  StrZero := s
end;

procedure CloseStoredProc( Componente : TStoredProc );
begin
  Componente.Close;
  Componente.Unprepare;
end;

procedure ExecStoredProc( Componente : TStoredProc );
begin
  Componente.Prepare;
  Componente.ExecProc;
end;

procedure Localiza( Query : DBTables.TQuery; Chave : string; Campo : string );
begin
  if Chave = '' then Query.First
  else
  begin
    try
       Query.Locate(Campo, Chave, [loCaseInsensitive, loPartialKey]);
    except
      BoxMensagem('Chave inválida!', 2);
    end;
  end;
end;

function FStrZero(s : string; i : Integer) : string;
begin
  while Length( s ) < i do
    s := '0' + s;
  FStrZero := s
end;

function UltCod(Query: DBTables.TQuery; NovoCodigo: TstringField): string;
var
  nCodigo, Code : Integer;
begin
  Query.Close;
  if Query is TQuery then
    TQuery(Query).Open
  else
    Query.Open;
  Val( NovoCodigo.Asstring, nCodigo, Code);
  Inc(nCodigo);
  Result := StrZero( nCodigo, NovoCodigo.Size );
  Query.Close;
end;

function FastLookup( Tabela: string; Campo : TstringField; Codigo: string; Nome: string; Filtro: string ) : string;
var
  Qry: TQuery;
begin
  if Trim( Campo.Asstring ) <> '' then
  begin
    Qry := TQuery.Create(nil);
    with Qry do
    begin
      Close;
      DataBaseName := 'DBBroker';
      RequestLive := False;
      Sql.Clear;
      Sql.Add( 'SELECT ' + Nome + ' FROM ' + Tabela + ' (NOLOCK) WHERE ' + Codigo + ' = ' + QuotedStr( Trim( Campo.Asstring ) ) );
      if Trim( Filtro ) <> '' then
        Sql.Add( ' AND ' + Filtro );
      Prepare;
      Open;
      if Qry.RecordCount > 0 then
      begin
        if Copy( Nome, 1, 3 ) = 'VL_' then
          if Not Qry.FieldByName( Nome ).IsNull then
            FastLookup := FloatToStr( Qry.FieldByName( Nome ).AsFloat )
          else
            FastLookup := '0'
        else
          FastLookup := Trim( Qry.FieldByName( Nome ).Asstring );
      end
      else
        if Copy( Nome, 1, 3 ) = 'VL_' then
          FastLookup := '0'
        else
          FastLookup := '';
      Close;
      Free;
    end;
  end
  else
  begin
    if Copy( Nome, 1, 3 ) = 'VL_' then
      FastLookup := '0'
    else
      FastLookup := '';
  end;
end;

function PoeEmEdicao(vTable : DBTables.TQuery) : Boolean;
begin
  try
    if not (vTable.State in [dsEdit, dsInsert]) then
      vTable.Edit;
    Result := True;
  except
    Result := False;
    BoxMensagem('Ocorreu um problema ao colocar a tabela em edição, informe o desenvolvedor.',2);
  end;
end;
                                                                                                                                                               // 1 = BROKER, 2 = SUPORTE
(*function ConsultaOnLineEx(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pNomeForm : string; pColunaOrdenada:Integer=1; pQuemChamou:integer=1): string;
begin
  if pQuemChamou = 1 then
    vRetDLL := ConsultaOnLineExDLL(Tabela, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm, Str_Cd_Cargo, datm_main.db_broker, pColunaOrdenada, pQuemChamou)
  else vRetDLL := ConsultaOnLineExDLL(Tabela, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm, Str_Cd_Cargo, datm_main.db_suporte, pColunaOrdenada, pQuemChamou );

  If vRetDLL = cRetInclusao Then
  begin
    ChamaFormCadastro(pNomeForm);
    ConsultaOnLineEx(Tabela, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm, pColunaOrdenada);
    Result := vRetDLL;
  End
  Else
    Result := vRetDLL;
End;

function ConsultaOnLineExFiltro( Tabela, CaptionNaTela: string; Campos,Nomes: array of string;
                                    Retorno: string; Filtro: string; pNomeForm : string; pQuemChamou:integer=1): string;
begin
  if pQuemChamou = 1 then
    vRetDLL := ConsultaOnLineExFiltroDLL(Tabela, CaptionNaTela,Campos, Nomes, Retorno, Filtro, pNomeForm, Str_cd_cargo, datm_main.db_broker,pQuemChamou)
  else vRetDLL := ConsultaOnLineExFiltroDLL(Tabela, CaptionNaTela,Campos, Nomes, Retorno, Filtro, pNomeForm, Str_cd_cargo, datm_main.db_suporte,pQuemChamou);

  If vRetDLL = cRetInclusao Then
  begin
    ChamaFormCadastro(pNomeForm);
    ConsultaOnLineExFiltro( Tabela, CaptionNaTela, Campos, Nomes, Retorno, Filtro, pNomeForm);
    Result := vRetDLL;
  End
  Else
    Result := vRetDLL;
End;


function ConsultaOnLineExSQL(SQL, CaptionNaTela: string; Campos, Nomes: array of string;
                                Retorno: string; pNomeForm : string; pQuemChamou:integer=1) : string;
begin
  if pQuemChamou = 1 then
    vRetDLL := ConsultaOnLineExSQLDLL(SQL, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm, Str_Cd_Cargo, datm_main.db_broker, pQuemChamou)
  else vRetDLL := ConsultaOnLineExSQLDLL(SQL, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm, Str_Cd_Cargo, datm_main.db_suporte, pQuemChamou);

  If vRetDLL = cRetInclusao Then
  begin
    ChamaFormCadastro(pNomeForm);
    ConsultaOnLineExSQL(SQL, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm);
    Result := vRetDLL;
  End
  Else
    Result := vRetDLL;
End;

function ConsultaLookUP( Tabela, Campo, valor, Retorno: string; pQuemChamou:integer=1): string;
begin
  if pQuemChamou = 1 then
    Result := ConsultaLookUPDLL(Tabela, Campo, Valor, Retorno, Str_Cd_Cargo, datm_main.db_broker, pQuemChamou)
  else Result := ConsultaLookUPDLL(Tabela, Campo, Valor, Retorno, Str_Cd_Cargo, datm_main.db_suporte, pQuemChamou);
End;


function ConsultaLookUPSQL( pSQL, pRetorno: string; pQuemChamou:integer=1): string;
begin
  if pQuemChamou = 1 then
    Result := ConsultaLookUPSQLDLL(pSql, pRetorno, Str_Cd_Cargo, datm_main.db_broker, pQuemChamou)
  else Result := ConsultaLookUPSQLDLL(pSql, pRetorno, Str_Cd_Cargo, datm_main.db_suporte, pQuemChamou);
End;


function ConsultaOnLineExSQLList( SQL : TstringList; CaptionNaTela: string; Campos, Nomes: array of string;
                                     Retorno: string; pNomeForm : string; pQuemChamou:integer=1): string;
begin
  if pQuemChamou = 1 then
    vRetDLL := ConsultaOnLineExSQLListDLL( SQL, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm, Str_Cd_Cargo, datm_main.db_broker, pQuemChamou)
  else vRetDLL := ConsultaOnLineExSQLListDLL( SQL, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm, Str_Cd_Cargo, datm_main.db_suporte, pQuemChamou);

  If vRetDLL = cRetInclusao Then
  begin
    ChamaFormCadastro(pNomeForm);
    ConsultaOnLineExSQLList(SQL, CaptionNaTela, Campos, Nomes, Retorno, pNomeForm);
    Result := vRetDLL;
  End
  Else
    Result := vRetDLL;
End;
*)
function VerIntegridade : Boolean;
var Origem, Destino: string;
    Relatorios, Plans: TSearchRec;
    Relatorio_Encontrado, Plan_Encontrado: Integer;
    Erro: Boolean;
begin
  Result := True;
  Exit;

  Erro           := False;
  if Not datm_main.tbl_parametro_.Active then
    datm_main.tbl_parametro_.Open;
  datm_main.tbl_parametro_.First;

  Origem         := datm_main.tbl_parametro_PATH_GSM_SERVER.Asstring;
  Destino        := datm_main.tbl_parametro_PATH_GSM_CLIENT.Asstring;

  if ( Not FileExists(Destino + '\DDBROKER.EXE') ) or
     ( FileAge( Origem + '\DDBROKER.EXE' ) > FileAge(Destino + '\DDBROKER.EXE') ) or
     ( Not FileExists( Destino + '\RAS.EXE' ) ) or
     ( FileAge( Origem + '\RAS.EXE' ) > FileAge( Destino + '\RAS.EXE' ) ) then
  begin
//    BoxMensagem('DD Broker desatualizado!', 3);
    Erro := True;
  end;

  {Crystal Reports}
  Relatorio_Encontrado := FindFirst(Origem + '\*.rpt', faAnyFile, Relatorios);
  while Relatorio_Encontrado = 0 do
  begin
    if ( Not FileExists( Destino + '\' + Relatorios.Name ) ) or
       ( FileAge ( Origem + '\' + Relatorios.Name ) > FileAge( Destino + '\' + Relatorios.Name ) ) then
    begin
//      BoxMensagem(Relatorios.Name + ' desatualizado!', 3);
      Erro := True;
    end;
    Relatorio_Encontrado := FindNext(Relatorios);
  end;
  FindClose(Relatorio_Encontrado);

  {Planilhas Excel}
  Plan_Encontrado := FindFirst(Origem + '\*.xls', faAnyFile, Plans);
  while Plan_Encontrado = 0 do
  begin
    if ( Not FileExists(Destino + '\' + Plans.Name) ) or
       ( FileAge ( Origem + '\' + Plans.Name ) > FileAge( Destino + '\' + Plans.Name ) ) then
    begin
//      BoxMensagem(Plans.Name + ' desatualizado!', 3);
      Erro := True;
    end;
    Plan_Encontrado := FindNext(Plans);
  end;
  FindClose(Plan_Encontrado);
  if Erro then BoxMensagem( 'Atenção! Sua versão do DDBroker está desatualizada!', 2 );
  Result := Not Erro;
end;

{$HINTS OFF}
function CNPJ( cCodigo: string ): Boolean;
var
  lRetorno  : Boolean;
  cResto, cPeso, cDigito : string;
  nContador, nSoma, nNum0, nResto, nNum1, nNum2, nNum3, Code : Integer;

begin
  lRetorno  := True;
  cPeso     := '543298765432';
  cDigito   := cCodigo;
  nContador := 1;
  nSoma     := 0;
  nNum0     := 0;
  nResto    := 0;
  nNum1     := 13;

  if Trim(cCodigo) <> '' then
  begin
    while ( nContador < 3 ) do
    begin
      nSoma := 0;
      for nNum0 := 1 to 14 do
      begin
        Val( Copy( cDigito, nNum0, 1 ), nNum2, Code );
        Val( Copy( cPeso, nNum0, 1 ), nNum3, Code );
        nSoma := nSoma + ( nNum2 * nNum3 );
      end;
      nResto := ( nSoma mod 11 );
      if ( nResto < 2 ) then
      begin
        cDigito := Copy( cDigito, 1, nNum1 - 1 ) + '0' + Copy( cDigito, nNum1 + 1, 1 );
      end
      else
      begin
        nResto := ( 11 - nResto );
        Str( nResto, cResto );
        cDigito := Copy( cDigito, 1, nNum1 - 1 ) + cResto + Copy( cDigito, nNum1 + 1, 1 );
      end;
      cPeso := ( '6' + cPeso );
      nNum1 := nNum1+ 1;
      nContador := nContador + 1;
    end;
    if Copy( cCodigo, 13, 2 ) <> Copy( cDigito, 13, 2 ) then
    begin
      BoxMensagem( 'C.N.P.J. Inválido!', 2 );
      lRetorno := False;
    end;
  end;
  Result := lRetorno;
end;
{$HINTS ON}

procedure ChamaFormCadastro(const pNomeForm : string);
begin
{  If pNomeForm = 'frm_finalidade_merc' Then
    AbreFormFinalidade(Application.Handle, datm_main.db_broker, Str_cd_cargo)
  Else If pNomeForm = 'frm_familia_prod' Then
    AbreFormFamilia(Application.Handle, datm_main.db_broker, Str_cd_cargo)
  Else If pNomeForm = 'frm_moeda' Then
    AbreFormMoeda(Application.Handle, datm_main.db_broker, Str_cd_cargo)
  Else If pNomeForm = 'frm_embal' Then
    AbreFormEmbalagem(Application.Handle, datm_main.db_broker, Str_cd_cargo)
  Else
    Application.MessageBox(PChar('Atenção, Formulário "' + pNomeform + '" não encontrado !'),'Atenção!',MB_IconInformation + MB_OK); }
End;

(*function MyRound( nNumero : Double; nCasas : Integer ) : Double;
var
  cNumero : string[40];
  cInteiro : string[20];
  cFracao : string[20];
  nPosicao, nPosicaoPonto, nPosicaoVirgula : Integer;
  nDigito : Integer;
  Separador : string;
begin

  cNumero := FloatToStr( nNumero );
{
  if nAt( 'E', cNumero ) > 0 then
  begin
    Mascara := '#0,.' + Replicate( '0', nCasas );
    cNumero := FormatFloat( Mascara, nNumero );
  end;
  }

  nPosicao        := 0;
  nPosicaoPonto   := nAt( '.', cNumero );
  nPosicaoVirgula := nAt( ',', cNumero );
  if nPosicaoPonto   > 0 then
  begin
    nPosicao  := nPosicaoPonto;
    Separador := '.';
  end;
  if nPosicaoVirgula > 0 then
  begin
    nPosicao := nPosicaoVirgula;
    Separador := ',';
  end;
  if nPosicao > 0 then
  begin
    cInteiro := Copy( cNumero, 1, nPosicao - 1 );
    cFracao := Copy( cNumero, nPosicao + 1, Length( cNumero ) );

    if Length(cFracao) <> nCasas then

    if Length(cFracao) < nCasas then
       begin
         cFracao := cFracao + Copy( '000000000000', 1, nCasas - Length( cFracao ) )
       end
    else
       begin
         cFracao := Copy( cFracao, 1, nCasas + 1 );
         nDigito := StrToInt( Copy( cFracao, nCasas + 1, 1 ) );
         if nDigito >= 5 then
           cFracao := StrZero( StrToFloat( Copy( cFracao, 1, nCasas ) ) + 1 , ncasas )
         else
           cFracao := Copy( cFracao, 1, nCasas );
       end;

    if length (cFracao) <> ncasas then
    begin
      cInteiro := FloattoStr( StrtoFloat( cInteiro ) + 1 );
      cFracao  := Copy( cFracao, 2, Length( cFracao ) );
    end;

    cNumero := cInteiro + Separador + cFracao;
    nNumero := StrToFloat( cNumero );

  end;

  Result := nNumero;
end;*)

function nAt( Arg1, Arg2: string ) : Integer;
Var
  nTamanho1 : Integer;
  nTamanho2 : Integer;
  i : Integer;
begin
  Result := 0;
  nTamanho1 := length( Arg1 );
  nTamanho2 := length( Arg2 );
  if nTamanho1 > 0 then
    for i := 1 to nTamanho2 do
      if ( Copy( Arg2, i, nTamanho1 ) = Arg1 ) then
         begin
           Result := i;
           Exit
         end;
end;

procedure ValCodEdt( Edit_Codigo : TMaskEdit );
var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin

  lDigitouLetras := False;

  if Length(Trim(Edit_Codigo.Text)) = 0 then Exit;

  nFim := length(Edit_Codigo.Text)-1;

  { VERifICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO }
  nLoop := 0;
  Repeat
    if (Edit_Codigo.Text[nLoop]
    In ['a'..'z','A'..'Z']) then lDigitouLetras := True;
    nLoop := nLoop + 1;
  Until (lDigitouLetras = True) or ( nLoop > nFim );

  { SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO }
  if Not( lDigitouLetras ) then
  begin
    nNumero := StrToFloat(Edit_Codigo.Text);
    if Edit_codigo.readonly = false then
    Edit_Codigo.Text := StrZero( nNumero, Edit_Codigo.MaxLength );
  end;
end;

function Commit(DataSet: DBTables.TQuery) : Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    DataSet.ApplyUpdates;
    datm_main.db_broker.Commit;

  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Commit := False;
      Exit;
    end;
  end;
  Commit := True;
end;

procedure ApagaDados( Tabela : string; nr_identificador: Integer );
var
  qry_apaga_dados_ : TQuery;
begin
  qry_apaga_dados_ := TQuery.Create(nil);
  qry_apaga_dados_.DatabaseName := 'DBBROKER';
  qry_apaga_dados_.RequestLive := False;
  qry_apaga_dados_.SQL.Clear;
  qry_apaga_dados_.SQL.Add( 'DELETE ' + Tabela + ' WHERE NR_IDENTIFICADOR = ' + IntToStr( nr_identificador ) );
  qry_apaga_dados_.Prepare;
  qry_apaga_dados_.ExecSQL;
  qry_apaga_dados_.Free;
end;

function IIF(pTest: Boolean; const pTrue: Integer; const pFalse: Integer): Integer;
begin
  if pTest then
    Result := pTrue
  else
    Result := pFalse;
end;

function IIF(pTest: Boolean; const pTrue: string; const pFalse: string): string;
begin
  if pTest then
    Result := pTrue
  else
    Result := pFalse;
end;

function IIF(pTest: Boolean; const pTrue: Boolean; const pFalse: Boolean): Boolean;
begin
  if pTest then
    Result := pTrue
  else
    Result := pFalse;
end;

function IIF(pTest: Boolean; const pTrue: Real; const pFalse: Real): Real; overload;
begin
  if pTest then
    Result := pTrue
  else
    Result := pFalse;
End;

function SelectSql(Qry_Consulta : DBTables.TQuery; const scriptSql : string) : Boolean;
begin
  With Qry_Consulta, Qry_Consulta.Sql Do
  begin
    Close;
    Clear;
    Add(scriptSql);
    Prepare;
    if Qry_Consulta is TQuery then
      TQuery(Qry_Consulta).Open
    else
      Qry_Consulta.Open;
    Result := Not(IsEmpty);
  End;
End;

function PutZeroEsquerda(pS : string; pQtd : Integer) : string;
Var
  I : Integer;
begin
  For I := 1 To pQtd Do
    pS := '0' + pS;
  Result := pS;
end;

function ExtractWord(pPosicao : Integer; pTexto, pBusca : string) : string;
var
  i, vIntAux : Integer;
begin
  vIntAux := 0;
  for i := 0 to pPosicao -1 do
  begin
    if Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) > 0 then
      Result := Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 )
    else Result := Copy(pTexto, vIntAux+1 , Length(pTexto) );
    vIntAux := vIntAux + Length(Result) +1;
  end;
  Result := Trim(Result);
end;

(*function ExtractWord(pPosicao : Integer; pTexto,pBusca : string) : string;
var
  i, vIntAux : Integer;
begin
  vIntAux := 0;
  for i := 0 to pPosicao - 1 do
  begin
    Result := Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 );
    vIntAux := vIntAux + Length(Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 )) + 1;
  end;
end;*)

function RefClienteHabilitacao(pUnidade, pProduto, pCliente : string; pBarraOuTamanho : Integer) : Integer; // pBarraOuTamanho = 0 -> BARRA
begin                                                                                                       // pBarraOuTamanho = 1 -> TAMANHO
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT IN_REF_ACEITA_BARRA, NR_TAMANHO_REF FROM TCLIENTE_HABILITACAO (NOLOCK) ');
    SQL.Add(' WHERE CD_CLIENTE  = ''' + pCliente + '''');
    SQL.Add('   AND CD_UNID_NEG = ''' + pUnidade + '''');
    SQL.Add('   AND CD_PRODUTO  = ''' + pProduto + '''');
    Open;
    if pBarraOuTamanho = 0 then // resultado da barra
      Result := Fields[0].AsInteger
    else // resultado do tamanho
      Result := Fields[1].AsInteger;
    Close;
    Free;
  end;
end;

function IsNumeric( cNumero : string ): Boolean;
const
  s : PChar = '0123456789,';
var
  i : byte;            { byte 0..255 }
  c : string[1];
  d : array[0..0] of Char;
begin
  IsNumeric := True;
  for i := 1 to Length( cNumero ) do
  begin
    c := Copy( cNumero, i, 1 );
    StrPCopy( d, c );
    if StrScan( s, d[0] ) = nil then
    begin
       IsNumeric := False;
       Exit;
    end;
  end;
end;

function CalculaPisCofinsICMS(const FlagPisCofins : Integer; ValorCIF, ValorOutrasDesps, AliqII, AliqIPI, AliqICMS, AliqPIS, AliqCOFINS : Real) : Real;
//FlagPisCofins = 1  - PIS
//FlagPisCofins = 2  - COFINS
//FlagPisCofins = 3  - ICMS
Var
  BC1, BC2, vBaseCalcPis, ValPis, ValCofins : Double;
begin
//alteração no PIS/COFINS feita no dia 26-07-2005
  Result := 0;
  vBaseCalcPis := 0;
(*  vBaseCalcPis := ValorCIF*( 1+((AliqII/100)*(AliqICMS/100)) + ((AliqIPI/100)*(AliqICMS/100))+((AliqII/100)*(AliqIPI/100)*(AliqICMS/100)) );
  vBaseCalcPis := vBaseCalcPis/(1-(AliqICMS/100));
  vBaseCalcPis := vBaseCalcPis/((100-(AliqPIS+AliqCOFINS))/100 );
  ValPis       := vBaseCalcPis*(AliqPIS/100);
  ValCofins    := vBaseCalcPis*(AliqCOFINS/100);
*)
  AliqII     := AliqII/100;
  AliqIPI    := AliqIPI/100;
  AliqICMS   := AliqICMS/100;
  AliqPIS    := AliqPIS/100;
  AliqCOFINS := AliqCOFINS/100;
  BC1 := 0;
  BC2 := 0;
  BC1 := (ValorCIF*(1+((AliqII*AliqICMS)+(AliqIPI*AliqICMS)+(AliqII*AliqIPI*AliqICMS))) +(AliqICMS*ValorOutrasDesps));
  BC1 := BC1/(1-(AliqICMS+AliqPIS+AliqCOFINS));
  BC2 := BC1+((AliqII*ValorCIF)+(AliqIPI*(ValorCIF+(AliqII*ValorCIF)))+ValorOutrasDesps);
  case FlagPisCofins of
  1:Result := BC1*AliqPIS;
  2:Result := BC1*AliqCOFINS;
  3:Result := BC2*AliqICMS;
  end;

{  If FlagPisCofins = 1 Then  //PIS
    Result := ValPis
  Else If FlagPisCofins = 2 Then  //COFINS
    Result := ValCofins
  Else If FlagPisCofins = 3 Then  //ICMS
  begin
    vBaseCalcPis := ValorCIF + ((AliqII/100) * ValorCIF) + ((AliqIPI/100) * ((AliqII/100) * ValorCIF + ValorCIF )) + ValorOutrasDesps + ValPis + ValCofins;
    vBaseCalcPis := vBaseCalcPis / (1 - AliqICMS/100);
    Result := vBaseCalcPis * (AliqICMS/100);
  End;                                      }
End;

function ContaOcorrencias(pTexto,pSubstring : string) : Integer;
var vIntAux, i : Integer;
begin
  vIntAux := 0;
  Result := 0;
  for i := 0 to Length(pTexto) do
  begin
    if Pos(pSubstring, Copy(pTexto,vIntAux+1,Length(pTexto))) > 0 then
    begin
      vIntAux := vIntAux + Pos(pSubstring,Copy(pTexto,vIntAux+1,Length(pTexto)));
      Result := Result + 1;
    end;
  end;
end;

function PoeOuTiraDiasUteis(pQtdeDias : Integer; pMaisOuMenos : string; pData : TDateTime) : TDateTime;

  function Feriado(pData : TDateTime) : Boolean;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TFERIADO (NOLOCK) WHERE DT_FERIADO = :DATA');
      ParamByname('DATA').AsDateTime := pData;
      Open;
      Result := (Fields[0].AsInteger > 0);
      Close;
      Free;
    end;
  end;

var
  Ano, Mes, Dia  : Word;
  DiaDaSemana, i : Integer;
  vJaTirou       : Boolean;
begin
  DecodeDate (pData, Ano, Mes, Dia);
  DiaDaSemana := DayOfWeek(pData);
  vJaTirou := False;
  if pMaisOuMenos = '+' then
  begin
    for i := 0 to pQtdeDias do
    begin
      DiaDaSemana := DayOfWeek(pData);
      if pQtdeDias > 0 then
      begin
        if not vJaTirou then
        begin
          vJaTirou := True;
          continue;
        end;
        //Dia := Dia + 1;
        pData := IncDay(pData, 1);
      end;
      //pData := EncodeDate (Ano, Mes, Dia);
      DiaDaSemana := DayOfWeek(pData);
      while Feriado(pData) do
      begin
        //Dia := Dia + 1;
        //pData := EncodeDate (Ano, Mes, Dia);
        pData := IncDay(pData, 1);
      end;
      if DiaDaSemana = 1 then
        pData := IncDay(pData, 1) //Dia := Dia + 1
      else
      if DiaDaSemana = 7 then
        pData := IncDay(pData, 2); //Dia := Dia + 2;
      //pData := EncodeDate (Ano, Mes, Dia);
    end;
  end else if pMaisOuMenos = '-' then
  begin
    for i := 0 to pQtdeDias do
    begin
      DiaDaSemana := DayOfWeek(pData);
      if pQtdeDias > 0 then
      begin
        if not vJaTirou then
        begin
          vJaTirou := True;
          continue;
        end;
        Dia := Dia - 1;
      end;
      if Dia = 0 then
      begin
        Mes := Mes - 1;
        if Mes = 0 then
          Mes := 12;
        Dia := DaysInMonth(StrToDate('01/'+IntToStr(Mes)+'/'+FormatDateTime('yyyy',now)));
      end;
      pData := EncodeDate (Ano, Mes, Dia);
      DiaDaSemana := DayOfWeek(pData);
      while Feriado(pData) do
      begin
        Dia := Dia - 1;
        pData := EncodeDate (Ano, Mes, Dia);
      end;
      if DiaDaSemana = 1 Then Dia := Dia - 2
        else if DiaDaSemana = 7 Then Dia := Dia - 1;
      pData := EncodeDate (Ano, Mes, Dia);
    end;
  end;
  Result := pData;
end;

procedure Isql(InsertInto, Values :string);
var
  Aux: TQuery;
begin
  Aux := TQuery.Create(Nil);
  with Aux do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Text := 'INSERT INTO '+InsertInto+' VALUES '+Values;
    Prepare;
    ExecSQL;
    Free;
  end;
end;

procedure Usql(Update, Set_, Where :string);
var
  Aux: TQuery;
begin
  Aux := TQuery.Create(Nil);
  with Aux do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Text := 'UPDATE '+Update+' SET '+Set_+' WHERE '+Where;
    Prepare;
    ExecSQL;
    Free;
  end;
end;

procedure Dsql(DeleteFrom, Where :string);
var
  Aux: TQuery;
begin
  Aux := TQuery.Create(nil);
  with Aux do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Text := 'DELETE '+DeleteFrom+' WHERE '+Where;
    Prepare;
    ExecSQL;
    Free;
  end;
end;

function Replicate(cLetra:string; nNum:Integer ) : string;
var i : integer;
    cstring : string;
begin
   cstring := '';
   for i:=1 to nNum do
   begin
       cstring := cstring + cLetra;
   end;

   Result := cstring;
end;

function RetNum(const Valor : Variant) : Variant;
begin
  If (Valor <> Null) or (Valor <> '') Then
    Result := valor
  Else
    Result := 0;
End;

function RetStr(const Valor : Variant) : string;
begin
  If (Valor <> Null) or (Valor <> '') Then
    Result := valor
  Else
    Result := '';
End;

procedure NullToZero( oCampo : TField );
begin
  if oCampo.IsNull then
  begin
     if oCampo is TFloatField then
     begin
        oCampo.AsFloat := 0;
        Exit;
     end;
     if oCampo is TIntegerField then
     begin
        oCampo.AsInteger := 0;
     end
  end;
end;

function Arredondar( nNumero : Double; nCasas : Integer ) : Double;
Var
  cNumero : string[40];
  cInteiro : string[20];
  cFracao : string[20];
//  Mascara : string;
  nPosicaoPonto : Integer;
  nDigito : Integer;
begin
  cNumero := FloatToStr( nNumero );
{
  if nAt( 'E', cNumero ) > 0 then
  begin
    Mascara := '#0,.' + Replicate( '0', nCasas );
    cNumero := FormatFloat( Mascara, nNumero );
  end;
  }
  nPosicaoPonto := nAt( ',', cNumero );
  if nPosicaoPonto > 0 then
  begin
    cInteiro := Copy( cNumero, 1, nPosicaoPonto - 1 );
    cFracao := Copy( cNumero, nPosicaoPonto + 1, Length( cNumero ) );
    if Length(cFracao) <> nCasas then
    if Length(cFracao) < nCasas then
    begin
      cFracao := cFracao + Copy( '000000000000', 1, nCasas - Length( cFracao ) )
    end
    else
    begin
      cFracao := Copy( cFracao, 1, nCasas + 1 );
      nDigito := StrToInt( Copy( cFracao, nCasas + 1, 1 ) );
      if nDigito >= 5 then
        cFracao := StrZero(StrToFloat( Copy( cFracao, 1, nCasas ) ) + 1 , ncasas)
      Else
        cFracao := Copy(cFracao, 1, nCasas);
    end;
    if length (cFracao) <> ncasas then
    begin
      cInteiro := FloattoStr(StrtoFloat(cInteiro) + 1 );
      cFracao  := Copy(cFracao,2,Length(cFracao));
    end;
    cNumero := cInteiro + ',' + cFracao;
    nNumero := StrToFloat( cNumero );
  end;
  Result := nNumero;
end;

function TiraPonto( cNumero : string ) : string;
begin
  while Pos('.',cNumero) > 0 do
    cNumero := TrocaStr( cNumero, ' ', Pos( '.', cNumero ) );
  TiraPonto := Alltrim( cNumero )
end;

function TrocaStr( cMasc : string; cCaracter : string; i : integer ): string;
begin
  TrocaStr := Copy( cMasc, 1, i-1 ) +
              cCaracter +
              Copy( cMasc, i+1, length( cMasc ) );
end;

function AllTrim( cstring : string ) : string;
var
  i : byte;            { byte 0..255 }
  s : string;
begin
  s := '';
  for i := 1 to Length( cstring ) do
  begin
    if Copy( cstring, i, 1 ) <> ' ' then
      s := s + Copy( cstring, i, 1 );
  end;
  AllTrim := s;
end;

// ************************************************************************************************************ //
// MODULO DE CONTROLE E PREVISAO DE DESPESAS NO ARMAZÉM                                                         //
// AUTOR : VÍTOR ZANIN                                                                                          //                                      //
// ************************************************************************************************************ //
// CALCULA AS DESPESAS E PERIODOS DO ARMAZEM. É SÓ PASSAR O PROCESSO, CONTAINER, O TIPO (CO OU CS) E OS DIAS DE //
// PREVISAO ( ZERO PARA NENHUM ). ESSA FUNÇÃO POPULA UM ARRAY "vDespesasNoArmazem" DO TIPO "rDespesasNoArmazem" //
// E QUEM CHAMOU DEVE OLHAR ESSE ARRAY QUE FICA AQUI EM "FUNCOES" COMO GLOBAL.                                  //
// ************************************************************************************************************ //

function DespesasNoArmazem(pProcesso, pContainer, pTipoRegistro, pTamanhoCntr : string; pDiasMais : Integer; pTrazerCanceladas : Boolean; pMostrarErro: Boolean = True; pArmazemDescarga : string = ''; pArmazemAtraca : string = '') : Boolean;
var
  vQuebraValor, vQuebraMargem, vCliente, vServico, vArmazemDescarga, vArmazemAtracacao, vPeriodoAux, vHintAux, vTipoMargem : string;
  vQryListagemDespesas, vQryListagemQuebras, vQryCalculo : TQuery;
  i, j, vTabelaAtiva, vPosicaoBarra, vValorCIFQuebra, vValorLimite1, vValorLimite2, vUltimoQtdeDias, vQtdeCntr,
  vDiaEntrada, vDiaSaida : Integer;
  vValorCIF, vUltimoValorTotalAcumulado : Real;
  vDataValidade : TDateTime;
  vJaSubtraiu : Boolean;

  function DataEntradaArmazem : TDateTime;
  begin
    // retorna a data de entrada no armazem
    if pTipoRegistro = 'CO' then
      Result := StrToDate(ConsultaLookupSQL('SELECT ISNULL(DT_ENT_ARM,0) DT_ENT_ARM FROM TPROCESSO_CNTR ( NOLOCK ) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_CNTR = ''' + pContainer + '''','DT_ENT_ARM'))
    else Result := StrToDate(ConsultaLookupSQL('SELECT ISNULL(DT_ENT_ARM,0) DT_ENT_ARM FROM TPROCESSO_CARGA_SOLTA ( NOLOCK ) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_SEQUENCIA = ''' + pContainer + '''','DT_ENT_ARM'));
    if Result = 2 then
      Result := StrToDate(ConsultaLookupSQL('SELECT ISNULL(DT_REALIZACAO,GETDATE()) DT_REALIZACAO FROM TFOLLOWUP ( NOLOCK ) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND CD_EVENTO = ''161''','DT_REALIZACAO'));
    // mantem a variavel vHintAux informada sobre o calculo
    if vQryListagemDespesas.FieldByName('CD_ITEM').Asstring = '514' then
      vHintAux := vHintAux + 'Ele entrou no armazém no dia ' + FormatDateTime('dd"/"mm"/"yyyy',Result) + '.' + #10#13;
  end;

  function DataSaidaArmazem : TDateTime;
  begin
    // retorna a data de saida do armazem. Se não tiver saida, retorna a data de hoje + os dias informados para previsao ( se for zero ele retorna a data de hoje )
    if pTipoRegistro = 'CO' then
      Result := StrToDate(ConsultaLookupSQL('SELECT ISNULL(DT_SAIDA_ARM,0) DT_SAIDA_ARM FROM TPROCESSO_CNTR ( NOLOCK ) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_CNTR = ''' + pContainer + '''','DT_SAIDA_ARM'))
//      Result := StrToDate(ConsultaLookupSQL('SELECT CONVERT(DATETIME,CONVERT(VARCHAR,ISNULL(DT_SAIDA_ARM,GETDATE()+'+IntToStr(pDiasMais)+'),103),103) DT_SAIDA_ARM FROM TPROCESSO_CNTR ( NOLOCK ) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_CNTR = ''' + pContainer + '''','DT_SAIDA_ARM'))
    else Result := StrToDate(ConsultaLookupSQL('SELECT ISNULL(DT_SAIDA_ARM,0) DT_SAIDA_ARM FROM TPROCESSO_CARGA_SOLTA ( NOLOCK ) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_SEQUENCIA = ''' + pContainer + '''','DT_SAIDA_ARM'));
    if Result = 2 then
      Result := DataEntradaArmazem + pDiasMais;
    if vQryListagemDespesas.FieldByName('CD_ITEM').Asstring = '514' then
    begin
      // mantem a variavel vHintAux informada sobre o calculo
      if FormatDateTime('dd"/"mm"/"yyyy',Result) = FormatDateTime('dd"/"mm"/"yyyy',now) then
        vHintAux := vHintAux + 'O container está lá até hoje, dia ' + FormatDateTime('dd"/"mm"/"yyyy',Result) + '.' + #10#13
      else vHintAux := vHintAux + 'O container ficou lá até o dia ' + FormatDateTime('dd"/"mm"/"yyyy',Result) + '.' + #10#13;
    end;
  end;

  function RetornaValorTotalDespesa(pPeriodoAtual : string) : Real;
  var
    vValorTotalAcumulado : Real;
    i, vPeriodoValido    : Integer;
    vEmDianteAux : Boolean;
  begin
    vPeriodoValido := 1;
    vEmDianteAux := False;
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      vQtdeCntr := StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TPROCESSO_CNTR WHERE NR_PROCESSO = ''' + pProcesso + '''', 'BLA'));
      vJaSubtraiu := False;
      for i := 1 to StrToInt(pPeriodoAtual) do
      begin
        if Active then
        begin
          if Pos('...',FieldByName('TX_PERIODO').Asstring) = 0 then
          begin
            vPeriodoValido := i;
            vEmDianteAux := True;
          end;
        end
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT TX_PERIODO, TX_TIPO_CALCULO, QT_DIAS, VL_PRINCIPAL, VL_MINIMO_20, VL_MINIMO_40');
          SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE ( NOLOCK )');
          SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + '''');
          SQL.Add('   AND CD_TABELA = ''' + IntToStr(vTabelaAtiva) + '''');
          SQL.Add('   AND CD_CLIENTE = ''' + vCliente + '''');
          SQL.Add('   AND TP_REGISTRO = ''' + pTipoRegistro + '''');
          SQL.Add('   AND TX_DESCRICAO_DESPESA = ''' + vQryListagemDespesas.FieldByName('TX_DESCRICAO_DESPESA').Asstring + '''');
          SQL.Add('   AND TX_VALOR_LIMITE = ''' + vQuebraValor + '''');
          SQL.Add('   AND TX_PERIODO = ''' + IntToStr(vPeriodoValido) + '...''');
          if pTipoRegistro = 'CO' then
            SQL.Add('   AND ( TP_TAMANHO = ''' + pTamanhoCntr + ''' OR ISNULL(TP_TAMANHO,''A'') = ''A'')');
          Open;
          if not EOF then
            vEmDianteAux := True;
        end;
        Close;
        SQL.Clear;
        SQL.Add('SELECT TX_PERIODO, TX_TIPO_CALCULO, QT_DIAS, VL_PRINCIPAL, VL_MINIMO_20, VL_MINIMO_40');
        SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE ( NOLOCK )');
        SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + '''');
        SQL.Add('   AND CD_TABELA = ''' + IntToStr(vTabelaAtiva) + '''');
        SQL.Add('   AND CD_CLIENTE = ''' + vCliente + '''');
        SQL.Add('   AND TP_REGISTRO = ''' + pTipoRegistro + '''');
        SQL.Add('   AND TX_DESCRICAO_DESPESA = ''' + vQryListagemDespesas.FieldByName('TX_DESCRICAO_DESPESA').Asstring + '''');
        SQL.Add('   AND TX_VALOR_LIMITE = ''' + vQuebraValor + '''');
        SQL.Add('   AND ( IN_MARGEM = ''' + vTipoMargem + ''' OR ISNULL(IN_MARGEM,''I'') = ''I'')');
        if vEmDianteAux then
          SQL.Add('   AND TX_PERIODO = ''' + IntToStr(vPeriodoValido) + '...''')
        else SQL.Add('   AND TX_PERIODO = ''' + IntToStr(vPeriodoValido) + '''');
        if pTipoRegistro = 'CO' then
          SQL.Add('   AND ( TP_TAMANHO = ''' + pTamanhoCntr + ''' OR ISNULL(TP_TAMANHO,''A'') = ''A'')');
        Open;
        if EOF then
          continue;
        if FieldByName('VL_PRINCIPAL').AsFloat = 0 then
        begin
          if not vJaSubtraiu then
          begin
            vValorTotalAcumulado := vUltimoValorTotalAcumulado;//vValorTotalAcumulado - Arredondar( ( Arredondar( ( vValorTotalAcumulado / vQtdeCntr ) , 2 ) * ( vQtdeCntr - 1 ) ) , 2 );
            vJaSubtraiu := True;
          end;
          vValorTotalAcumulado := vValorTotalAcumulado + Arredondar( ( vUltimoValorTotalAcumulado / vUltimoQtdeDias ) , 15 );
        end
        else
        begin
          if FieldByName('TX_TIPO_CALCULO').Asstring = '%CIF' then
          begin
            if pTamanhoCntr = '4' then
            begin
              if ( ( ( vValorCIF * FieldByName('VL_PRINCIPAL').AsFloat ) / 100 ) / vQtdeCntr ) > FieldByName('VL_MINIMO_40').AsFloat then
                vValorTotalAcumulado := vValorTotalAcumulado + Arredondar( ( ( ( vValorCIF * FieldByName('VL_PRINCIPAL').AsFloat ) / 100 ) / vQtdeCntr ) , 15 )
              else vValorTotalAcumulado := vValorTotalAcumulado + FieldByName('VL_MINIMO_40').AsFloat;
            end
            else
            begin
              if ( ( ( vValorCIF * FieldByName('VL_PRINCIPAL').AsFloat ) / 100 ) / vQtdeCntr ) > FieldByName('VL_MINIMO_20').AsFloat then
                vValorTotalAcumulado := vValorTotalAcumulado + Arredondar( ( ( ( vValorCIF * FieldByName('VL_PRINCIPAL').AsFloat ) / 100 ) / vQtdeCntr ) , 15 )
              else vValorTotalAcumulado := vValorTotalAcumulado + FieldByName('VL_MINIMO_20').AsFloat;
            end;
          end
          else
          begin
            if pTamanhoCntr = '4' then
            begin
              if FieldByName('VL_PRINCIPAL').AsFloat > FieldByName('VL_MINIMO_40').AsFloat then
                vValorTotalAcumulado := vValorTotalAcumulado + FieldByName('VL_PRINCIPAL').AsFloat
              else vValorTotalAcumulado := vValorTotalAcumulado + FieldByName('VL_MINIMO_40').AsFloat;
            end
            else
            begin
              if FieldByName('VL_PRINCIPAL').AsFloat > FieldByName('VL_MINIMO_20').AsFloat then
                vValorTotalAcumulado := vValorTotalAcumulado + FieldByName('VL_PRINCIPAL').AsFloat
              else vValorTotalAcumulado := vValorTotalAcumulado + FieldByName('VL_MINIMO_20').AsFloat;
            end;
          end;
          vUltimoValorTotalAcumulado := vValorTotalAcumulado;//Arredondar( vValorTotalAcumulado / vQtdeCntr , 15 );
          vUltimoQtdeDias            := FieldByName('QT_DIAS').AsInteger;
        end;
      end;
      Free;
    end;
    Result := vValorTotalAcumulado;
  end;

  function RetornaPeriodoAtual : string;
  var
    vDiferencaDias, vCounterPeriodo : Integer;
  begin
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TX_DESCRICAO_DESPESA, TX_PERIODO, QT_DIAS, CD_ITEM');
      SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE ( NOLOCK )');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND CD_CLIENTE = ''' + vCliente + ''' AND TX_DESCRICAO_DESPESA = ''' + vQryListagemDespesas.FieldByName('TX_DESCRICAO_DESPESA').Asstring + '''');
      SQL.Add('   AND TP_REGISTRO = ''' + pTipoRegistro + '''');
      SQL.Add('   AND TX_VALOR_LIMITE = ''' + vQuebraValor + '''');
      SQL.Add('   AND CD_TABELA = ''' + IntToStr(vTabelaAtiva) + '''');
      SQL.Add('   AND ( IN_MARGEM = ''' + vTipoMargem + ''' OR ISNULL(IN_MARGEM,''I'') = ''I'')');
      if pTipoRegistro = 'CO' then
        SQL.Add('   AND ( TP_TAMANHO = ''' + pTamanhoCntr + ''' OR ISNULL(TP_TAMANHO,''A'') = ''A'')');
      Open;
      vDiferencaDias := DaysBetween(DataSaidaArmazem,DataEntradaArmazem) + vDiaEntrada + vDiaSaida;
      if vQryListagemDespesas.FieldByName('CD_ITEM').Asstring = '514' then
      begin
        // mantem a variavel vHintAux informada sobre o calculo
        vHintAux := vHintAux + 'No total, são ' + IntToStr(vDiferencaDias) + ' dias.' + #10#13;
        vHintAux := vHintAux + 'Ou seja :' + #10#13;
      end;
      // calcula o período atual baseado no numero de dias passados
      vCounterPeriodo := 1;
      while not EOF do
      begin
        vDiferencaDias := vDiferencaDias - FieldByName('QT_DIAS').AsInteger;
        if ( ( vDiferencaDias < 0 ) or ( vDiferencaDias = 0 ) ) then
        begin
          // mantem a variavel vHintAux informada sobre o calculo
          if ( vQryListagemDespesas.FieldByName('CD_ITEM').Asstring = '514' ) then
            vHintAux := vHintAux + 'Está agora no ' + IntToStr(vCounterPeriodo) + 'º período de ' + FieldByName('QT_DIAS').Asstring + ' dias.' + #10#13;
          // termina
          Break;
        end;
        // mantem a variavel vHintAux informada sobre o calculo
        if vQryListagemDespesas.FieldByName('CD_ITEM').Asstring = '514' then
          vHintAux := vHintAux + IntToStr(vCounterPeriodo) + 'º período de ' + FieldByName('QT_DIAS').Asstring + ' dias.' + #10#13;
        Inc(vCounterPeriodo);
        if Pos('...',FieldByName('TX_PERIODO').Asstring) = 0 then
          Next;
      end;
      Close;
      Free;
      Result := IntToStr(vCounterPeriodo);
    end;
  end;

begin
  try
    Result := True;
    SetLength(vDespesasNoArmazem,0);
    // verifica cliente, qtde de containers, armazem
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_CLIENTE, CD_SERVICO, CD_ARMAZEM_DESCARGA, CD_ARMAZEM_ATRACACAO, VL_CIF_MN, CONVERT(DECIMAL(15,0),VL_CIF_MN)');
      SQL.Add('  FROM TPROCESSO ( NOLOCK )');
      SQL.Add(' WHERE NR_PROCESSO = ''' + pProcesso + '''');
      Open;
      vCliente         := Fields[0].Asstring;
      vServico         := Fields[1].Asstring;
      if pArmazemDescarga = '' then
        vArmazemDescarga := Fields[2].Asstring
      else vArmazemDescarga := pArmazemDescarga;
      if pArmazemAtraca = '' then
        vArmazemAtracacao := Fields[3].Asstring
      else vArmazemAtracacao := pArmazemAtraca;
      vValorCIF        := Fields[4].AsFloat;
      vValorCIFQuebra  := Fields[5].AsInteger;
      Close;
      Free;
    end;
    // cria as querys utilizadas a seguir
    vQryListagemDespesas := TQuery.Create(application);
    vQryListagemDespesas.Databasename := 'DBBROKER';
    vQryListagemQuebras  := TQuery.Create(application);
    vQryListagemQuebras.Databasename := 'DBBROKER';
    // verifica a tabela ativa nesse cliente
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TOP 1 CD_TABELA, DT_VALIDADE, ISNULL(IN_CONTAR_DIA_ENTRADA, 0), ISNULL(IN_CONTAR_DIA_SAIDA, 0)');
      SQL.Add('  FROM TARMAZEM_TABELAS_CLIENTE ( NOLOCK )');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND CD_CLIENTE = ''' + vCliente + ''' AND IN_ATIVO = ''1''');
      Open;
      vTabelaAtiva  := StrToIntDef( Fields[0].Asstring, 0);
      vDataValidade := Fields[1].AsDateTime;
      vDiaEntrada   := StrToIntDef(Fields[2].Asstring, 0);
      vDiaSaida     := StrToIntDef(Fields[3].Asstring, 0);
      Close;
      Free;
    end;
    // se não tem tabela ativa, PAU !
    if vTabelaAtiva = 0 then
    begin
      if pMostrarErro then  // se for para mostrar erro, mostra 
        raise Exception.Create('Não existe uma tabela definida ou ativa para este cliente/armazem/serviço.')
      else
      begin
        Result := False;
        Exit;
      end;
    end;
    // verifica se as despesas devem calcular como entre margens ou mesma margem
    vTipoMargem := 'M';
    if ConsultaLookUP('TARMAZEM','CD_ARMAZEM',vArmazemDescarga,'CD_MARGEM') <> ConsultaLookUP('TARMAZEM','CD_ARMAZEM',vArmazemAtracacao,'CD_MARGEM') then
      vTipoMargem := 'E';
    // se ela venceu, Erro
    if vDataValidade < now then
      raise Exception.Create('A tabela ativa está vencida. Favor verificar !');
    // mantem a variavel vHintAux informada sobre o calculo
    vHintAux := vHintAux + 'Foi utilizada a tabela número ' + IntToStr(vTabelaAtiva) + ', valida até ' + FormatDateTime('dd"/"mm"/"yyyy',vDataValidade) + '.' + #10#13;
    // traz as despesas disponiveis para esse cliente
    vQryListagemDespesas.SQL.Clear;
    vQryListagemDespesas.SQL.Add('SELECT C.TX_DESCRICAO_DESPESA, C.IN_POR_DIA, C.CD_ITEM');
    vQryListagemDespesas.SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE C ( NOLOCK )');//, TARMAZEM_DESPESAS_CLIENTE_SERVICO CS ( NOLOCK )');
    vQryListagemDespesas.SQL.Add(' WHERE C.CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND C.CD_CLIENTE = ''' + vCliente + '''');
    vQryListagemDespesas.SQL.Add('   AND C.TP_REGISTRO = ''' + pTipoRegistro + '''');
    vQryListagemDespesas.SQL.Add('   AND C.CD_TABELA = ''' + IntToStr(vTabelaAtiva) + '''');
    vQryListagemDespesas.SQL.Add('   AND ( IN_MARGEM = ''' + vTipoMargem + ''' OR ISNULL(IN_MARGEM,''I'') = ''I'')');
    if not pTrazerCanceladas then
      vQryListagemDespesas.SQL.Add('   AND C.CD_ITEM NOT IN ( SELECT CD_ITEM FROM TPROCESSO_ARMAZEM_DESPESAS_CANCELADAS (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + ''')');
    if pTipoRegistro = 'CO' then
      vQryListagemDespesas.SQL.Add('   AND ( TP_TAMANHO = ''' + pTamanhoCntr + ''' OR ISNULL(TP_TAMANHO,''A'') = ''A'')');
//    vQryListagemDespesas.SQL.Add('   AND CS.CD_ITEM = C.CD_ITEM');
//    vQryListagemDespesas.SQL.Add('   AND CS.CD_SERVICO = ''' + vServico + '''');
    vQryListagemDespesas.SQL.Add(' GROUP BY C.TX_DESCRICAO_DESPESA, C.IN_POR_DIA, C.CD_ITEM');
    vQryListagemDespesas.Open;
    SetLength(vDespesasNoArmazem,vQryListagemDespesas.RecordCount);
    i := 0;
    while not vQryListagemDespesas.EOF do
    begin
      // traz as quebras possiveis para a despesa corrente
      vQryListagemQuebras.SQL.Clear;
      vQryListagemQuebras.SQL.Add('SELECT TX_DESCRICAO_DESPESA, TX_VALOR_LIMITE'); //, CD_MARGEM');
      vQryListagemQuebras.SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE ( NOLOCK )');
      vQryListagemQuebras.SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND CD_CLIENTE = ''' + vCliente + ''' AND TX_DESCRICAO_DESPESA = ''' + vQryListagemDespesas.FieldByName('TX_DESCRICAO_DESPESA').Asstring + '''');
      vQryListagemQuebras.SQL.Add('   AND TP_REGISTRO = ''' + pTipoRegistro + '''');
      vQryListagemQuebras.SQL.Add('   AND ( TP_TAMANHO = ''' + pTamanhoCntr + ''' OR ISNULL(TP_TAMANHO,''A'') = ''A'')');
      vQryListagemQuebras.SQL.Add(' GROUP BY TX_DESCRICAO_DESPESA, TX_VALOR_LIMITE'); //, CD_MARGEM');
      vQryListagemQuebras.SQL.Add(' ORDER BY TX_VALOR_LIMITE');
      vQryListagemQuebras.Open;
      // guarda as quebras selecionadas para serem usadas como filtros para os calculos
      vQuebraValor := '.../...';
      // loop para escolher a quebra apropriada - FAZER DEPOIS
      while not vQryListagemQuebras.EOF do
      begin
        // se de cara tiver um '.../...', sinal que não tem quebra por valor
        if vQryListagemQuebras.FieldByName('TX_VALOR_LIMITE').Asstring = '.../...' then
          break;
        // se chegar aqui é por que tem quebra, agora vou fazer a verificação
        vPosicaoBarra    := Pos('/',vQryListagemQuebras.FieldByName('TX_VALOR_LIMITE').Asstring);
        vValorLimite1 := StrToIntDef(Copy(vQryListagemQuebras.FieldByName('TX_VALOR_LIMITE').Asstring,0,vPosicaoBarra-1),0);
        vValorLimite2 := StrToIntDef(Copy(vQryListagemQuebras.FieldByName('TX_VALOR_LIMITE').Asstring,vPosicaoBarra+1,Length(vQryListagemQuebras.FieldByName('TX_VALOR_LIMITE').Asstring)),999999999);
        if ( vValorCIFQuebra > vValorLimite1 ) and ( vValorCIFQuebra < vValorLimite2 ) then
          vQuebraValor := vQryListagemQuebras.FieldByName('TX_VALOR_LIMITE').Asstring;
        // próxima quebra
        vQryListagemQuebras.Next;
      end;
      // começa a popular o array " vDespesasNoArmazem " do tipo rDespesasNoArmazem ( RECORD )
      vDespesasNoArmazem[i].Item              := vQryListagemDespesas.FieldByName('CD_ITEM').Asstring;
      vDespesasNoArmazem[i].Despesa           := vQryListagemDespesas.FieldByName('TX_DESCRICAO_DESPESA').Asstring;
      // verifica o período atual ( chamada de função )
//      if i = 0 then
//        vPeriodoAux := RetornaPeriodoAtual;
//      vDespesasNoArmazem[i].PeriodoAtual      := vPeriodoAux;
      vDespesasNoArmazem[i].PeriodoAtual      := RetornaPeriodoAtual;
      // verifica o valor atual ( chamada de função passando o periodo atual ). Se por container, ele passa um para que seja calculado uma vez só.
      if ( pTrazerCanceladas ) and ( StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TPROCESSO_ARMAZEM_DESPESAS_CANCELADAS (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + ''' AND CD_ITEM = ''' + vDespesasNoArmazem[i].Item + '''','BLA')) > 0 ) then
        vDespesasNoArmazem[i].ValorTotalDespesa := 0
      else
      begin
        if vQryListagemDespesas.FieldByName('IN_POR_DIA').Asstring = '1' then
          vDespesasNoArmazem[i].ValorTotalDespesa := RetornaValorTotalDespesa('1')
//        else vDespesasNoArmazem[i].ValorTotalDespesa := RetornaValorTotalDespesa(vPeriodoAux);
        else vDespesasNoArmazem[i].ValorTotalDespesa := RetornaValorTotalDespesa(vDespesasNoArmazem[i].PeriodoAtual);
      end;
      // e vai para a proxima despesa
      vDespesasNoArmazem[i].Hint := vHintAux;
      vQryListagemDespesas.Next;
      Inc(i);
    end;
    vQryListagemDespesas.Close;
    vQryListagemDespesas.Free;
    // da um update no processo para guardar a tabela que foi utilizada para o calculo das despesas
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TPROCESSO SET CD_ARMAZEM_TABELA_CLIENTE = ''' + IntToStr(vTabelaAtiva) + ''' WHERE NR_PROCESSO = ''' + pProcesso + '''');
      ExecSQL;
      Free;
    end;
    // se terminar e o i continuar zero é pq nao tinha tabela nenhuma para esse cliente
    if i = 0 then
      raise Exception.Create('Não existem despesas cadastradas.'+#10#13+'Reveja as configurações!');
  except
    on e:Exception do
    begin
      ShowMessage('Ocorreu um erro na aplicação' + #10#13 + e.message + #10#13 + 'Informe ao departamento de TI');
      Result := False;
    end;
  end;
end;

function FastExecSQL(const pSQL : string) : Boolean;
begin
  with TQuery.Create(application) do
  begin
    try
      try
        Result := True;
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add(pSQL);
        ExecSQL;
      except
        On e:Exception do
        begin
          Result := False;
          ShowMessage('Ocorreu o seguinte erro na aplicação :' + #13#10 + e.message + #10#13 + 'Informe o departamento de TI.');
        end;
      end;
    finally
      Free;
    end;
  end;
end;

function FastExecSQL(const ASQL: string; AParams: array of Variant): Boolean;
var
  Query: TQuery;
begin
  Query := TQuery.Create(Application);
  with Query do
  begin
    try
      try
        Result := True;
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add(ASQL);
        SetParamValues(Query, AParams);
        ExecSQL;
      except
        on E: Exception do
        begin
          Result := False;
          ShowMessage('Ocorreu o seguinte erro na aplicação:'#13 + E.Message + #13'Informe o departamento de TI.');
        end;
      end;
    finally
      Free;
    end;
  end;
end;

function CriaAlias(nDataBase, nServer: string; var sesCriaAlias: TSession): Boolean;
var
  MyList : TstringList;
begin
  MyList := TstringList.Create;
  try
    try
      if not sesCriaAlias.IsAlias(nDataBase) then
      begin
        with MyList do
        begin
          Add('APPLICATION NAME=DDBROKER');
          Add('BATCH COUNT=500');
          Add('BLOB SIZE=128');
          Add('BLOBS TO CACHE=256');
          Add('DATABASE NAME='+nDataBase);
          Add('LANGDRIVER=''ascii'' ANSI');
          Add('SERVER NAME='+nServer);
          Add('SQLPASSTHRU MODE=SHARED AUTOCOMMIT');
          Add('SQLQRYMODE=SERVER');
          Add('USER NAME=sa');
        end;
        sesCriaAlias.AddAlias(nDataBase, 'MSSQL', MyList);
        sesCriaAlias.Close;
        sesCriaAlias.Open;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        TrataErro(E);
        Result := false;
      end;
    end;
  finally
    MyList.Free;
  end;
end;

function ConfereNF(pNrProcesso: string) : Boolean;
var
  vlTotalNF, vlTotalItem, vlTolerancia: Double;
begin
  result := true;
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TPROCESSO PR (NOLOCK), TEMPRESA_NAC EN (NOLOCK)');
    SQL.Add('WHERE PR.NR_PROCESSO = :NR_PROCESSO AND PR.CD_CLIENTE = EN.CD_EMPRESA AND EN.IN_CONFERE_NF = ''1''');
    ParamByName('NR_PROCESSO').Asstring := pNrProcesso;
    Open;
    //verifica se o cliente faz conferencia de nf
    if Fields[0].AsInteger > 0 then
    begin
      Close;
      //seleciona o valor total das NF's
      SQL.Clear;
      SQL.Add('SELECT ISNULL(SUM((VL_NOTA/VL_TAXA)), 0)');
      SQL.Add('FROM TPROCESSO_EXP_NF (NOLOCK)');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND ISNULL(VL_TAXA, 0) <> 0');
      ParamByName('NR_PROCESSO').Asstring := pNrProcesso;
      Open;
      vlTotalNF := Fields[0].AsFloat;
      Close;
      //seleciona o valor total dos itens
      SQL.Clear;
      SQL.Add('SELECT ISNULL(SUM(VL_TOT_ITEM), 0)');
      SQL.Add('FROM TPROCESSO_EXP_ITEM (NOLOCK)');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
      ParamByName('NR_PROCESSO').Asstring := pNrProcesso;
      Open;
      vlTotalItem := Fields[0].AsFloat;
      Close;
      //seleciona o valor de tolerancia entre NF e Itens.
      SQL.Clear;
      SQL.Add('SELECT VL_TOLERANCIA_NF FROM TPARAMETROS (NOLOCK)');
      Open;
      vlTolerancia := Fields[0].AsFloat;
      //verifica se o valor das NF's com o valor total dos Itens.
      result := false;
      if vlTotalNF = 0 then
        Application.MessageBox(PChar('O valor total das Notas Fiscais não pode ser zero!'+ #13#10 +
          'O sistema não pode continuar a preparação de RE/Emissão de Documentos do processo '+Copy(pNrProcesso,5,13)),
          'Erro', MB_OK + MB_IconstOP)
      else
      if vlTotalItem = 0 then
       Application.MessageBox(PChar('O valor total dos Itens não pode ser zero!'+ #13#10 +
          'O sistema não pode continuar a preparação de RE/Emissão de Documentos do processo '+Copy(pNrProcesso,5,13)),
          'Erro', MB_OK + MB_IconstOP)
      else
      if Abs(vlTotalNF-vlTotalItem) > vlTolerancia then
        Application.MessageBox(PChar('Foi encontrada uma diferença de '+FormatFloat('#,##0.0000',Abs(vlTotalNF-vlTotalItem))+
          '(na moeda) entre o valor total das notas e o valor total dos Itens!'+ #13#10 +
          'O sistema não pode continuar a preparação de RE/Emissão de Documentos do processo '+Copy(pNrProcesso,5,13)),
          'Erro', MB_OK + MB_IconstOP)
      else result := true;
    end;
    Close;
    Free;
  end;
end;

function VerifReferenciaDI(const pNr_processo : string; const pTipoVerificacao : string) : Boolean;
var
  vQryItensDI, vQryRefCliente: TQuery;
  vstringList : TstringList;
begin
  Result := True;
  try
    vstringList    := TstringList.Create;
    vQryRefCliente := TQuery.Create(Application);
    vQryItensDI    := TQuery.Create(Application);

    vQryRefCliente.DatabaseName := 'DBBROKER';
    vQryItensDI.DatabaseName    := 'DBBROKER';

    vQryRefCliente.SQL.Clear;

    vQryRefCliente.SQL.Add('select CD_REFERENCIA, NR_ITEM_PO, NR_PARCIAL');
    vQryRefCliente.SQL.Add('from TREF_CLIENTE');
    vQryRefCliente.SQL.Add('WHERE NR_PROCESSO =:NR_PROCESSO AND TP_REFERENCIA =:TP_REFERENCIA');

    vQryRefCliente.ParamByName('NR_PROCESSO').Asstring := pNr_processo;
    vQryRefCliente.ParamByName('TP_REFERENCIA').Asstring := '01';

    vQryRefCliente.Open;

    while not vQryRefCliente.EOF do
    begin
      vQryItensDI.Close;
      vQryItensDI.SQL.Clear;
      with vQryItensDI do
      begin
        SQL.Add('SELECT COUNT(*) FROM TDETALHE_MERCADORIA (NOLOCK)');
        SQL.Add('WHERE');
        SQL.Add('   NR_PROCESSO    =:NR_PROCESSO AND');
        SQL.Add('   NR_PROC_PO     =:NR_PROC_PO  AND');
        SQL.Add('   NR_ITEM_PO     =:NR_ITEM_PO  AND');
        SQL.Add('   NR_PARCIAL     =:NR_PARCIAL');

        ParamByName('NR_PROCESSO').Asstring := pNr_processo;
        ParamByName('NR_PROC_PO').Asstring  := vQryRefCliente.FieldByName('CD_REFERENCIA').Asstring;
        ParamByName('NR_ITEM_PO').Asstring  := vQryRefCliente.FieldByName('NR_ITEM_PO').Asstring;
        ParamByName('NR_PARCIAL').Asstring  := vQryRefCliente.FieldByName('NR_PARCIAL').Asstring;

        Open;
      end;

      if vQryItensDI.Fields[0].AsInteger = 0 then
      begin
        vstringList.Add('O Pedido "'+ vQryRefCliente.FieldByName('CD_REFERENCIA').Asstring + '", Item "' +
                                      vQryRefCliente.FieldByName('NR_ITEM_PO').Asstring    + '", Parcial "' +
                                      vQryRefCliente.FieldByName('NR_PARCIAL').Asstring    + '" ' + #10#13 +
                        'lançado na manutenção do processo, não foi encontrada nos itens da DI.');
        vstringList.Add('');
      end;
      vQryRefCliente.Next;
    end;

    if vstringList.Count > 0 then
    begin
      BoxMensagem(vstringList.Text, 2);
      Result := False;
    end;
  finally
    vstringList.Free;
    vQryRefCliente.Free;
    vQryItensDI.Free;
  end;
end;

procedure Delay(n: LongInt);
var
  Start: LongInt;
begin
  Start := GetTickCount;
  repeat
    Application.ProcessMessages;
  until (GetTickCount - Start) >= n;
end;

function PreencheStr ( pString : Char) : Boolean;
var
  i : Integer;
begin
  keybd_event(Byte(pString), 0, 0, 0);
  Delay(40);
end;

function PreencheCampo ( pValor : string) : Boolean;
var
  vTestaCaracter : Integer;
  i : Integer;
begin
  for i := 1 to Length(pValor) do
  begin
    vTestaCaracter := StrToIntDef(pValor, 11);
    if vTestaCaracter = 11 then
      PreencheStr(pValor[i])
    else
      PreencheNum(StrToInt(Copy(pValor,i,1)));
  end;
end;

function PreencheNum ( pNumero : Integer) : Boolean;
var
  i : Integer;
begin
  case pNumero of
    0 : keybd_event(VK_NUMPAD0, 0, 0, 0);
    1 : keybd_event(VK_NUMPAD1, 0, 0, 0);
    2 : keybd_event(VK_NUMPAD2, 0, 0, 0);
    3 : keybd_event(VK_NUMPAD3, 0, 0, 0);
    4 : keybd_event(VK_NUMPAD4, 0, 0, 0);
    5 : keybd_event(VK_NUMPAD5, 0, 0, 0);
    6 : keybd_event(VK_NUMPAD6, 0, 0, 0);
    7 : keybd_event(VK_NUMPAD7, 0, 0, 0);
    8 : keybd_event(VK_NUMPAD8, 0, 0, 0);
    9 : keybd_event(VK_NUMPAD9, 0, 0, 0);
  end;
  Delay(40);
end;

function PreencheCampoEx(pHandle : HWND; pValor : string) : Boolean;
begin
  SendMessage(pHandle, WM_SETTEXT, 0, DWord(PChar(pValor)));
end;

procedure ColaTexto(const pTexto : string);
begin
  Clipboard.SetTextBuf(Pointer(PChar(pTexto)));
  //Pressiona e segura o CTRL
  keybd_event(VK_CONTROL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
  //pressiona o V
  keybd_event(Ord(86), 0, 0, 0);
  //solta tecla
  keybd_event(VK_CONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
end;

function TerminateProcesso(sFile: string): Bool;
var
  verSystem: TOSVersionInfo;
  hdlSnap,hdlProcess: THandle;
  bPath,bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: array [0..1023] of DWord;
  iC: DWord;
  k,iCount: Integer;
  arrModul: array [0..299] of Char;
  hdlModul: HMODULE;
begin
  Result := False;
  bPath := IIF(ExtractFileName(sFile) = sFile, False, True);
  verSystem.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
  begin
    hdlSnap        := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
    peEntry.dwSize := Sizeof(peEntry);
    bLoop          := Process32First(hdlSnap,peEntry);
    while Integer(bLoop) <> 0 do
    begin
      if bPath then
      begin
        if CompareText(peEntry.szExeFile,sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID) ,0);
          Result := True;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(peEntry.szExeFile),sFile) = 0 then
        begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID) ,0);
          Result := True;
        end;
      end;
      bLoop := Process32Next(hdlSnap,peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else
    if verSystem.dwPlatformId = VER_PLATFORM_WIN32_NT then
    begin
      EnumProcesses(@arrPid,SizeOf(arrPid),iC);
      iCount := iC div SizeOf(DWORD);
      for k := 0 to Pred(iCount) do
      begin
        hdlProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,arrPid [k]);
        if (hdlProcess <> 0) then
        begin
          EnumProcessModules(hdlProcess,@hdlModul,SizeOf(hdlModul),iC);
          GetModuleFilenameEx(hdlProcess,hdlModul,arrModul,SizeOf(arrModul));
          if bPath then
          begin
            if CompareText(arrModul,sFile) = 0 then
            begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              Result := True;
            end;
          end
          else
          begin
            if CompareText(ExtractFileName(arrModul),sFile)=0 then
            begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              Result := True;
            end;
          end;
          CloseHandle(hdlProcess);
        end;
      end;
    end;
end;

procedure SalvaGridView(AGridView: TcxGridDBTableView);
var
  vFormName: String;
begin
  vFormName := ParentFormName(AGridView);
  AGridView.StorageOptions := [gsoUseSummary];
  AGridView.StoreToIniFile(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini', True, [gsoUseFilter, gsoUseSummary], '');
end;

procedure SalvaGridView(AGridView: TcxGridDBBandedTableView);
var
  vFormName: String;
begin
  vFormName := ParentFormName(AGridView);
  AGridView.StorageOptions := [gsoUseSummary];
  AGridView.StoreToIniFile(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini', True, [gsoUseFilter, gsoUseSummary], '');
end;

procedure CarregaGridView(AGridView: TcxGridDBTableView);
var
  vFormName: String;
begin
  vFormName := ParentFormName(AGridView);
  AGridView.StorageOptions := [gsoUseSummary];
  if not FileExists(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini') then
    if FileExists(_PASTA_CONFIG + 'Default_' + str_cd_produto + '_' + vFormName + '.' + AGridView.Name + '.ini') then
      CopyFile(PAnsiChar(_PASTA_CONFIG + 'Default_' + str_cd_produto + '_' + vFormName + '.' + AGridView.Name + '.ini'),
         PAnsiChar(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini'), False)
    else
      SalvaGridView(AGridView);

  AGridView.RestoreFromIniFile(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini', False, False, [gsoUseFilter, gsoUseSummary], '');
end;

procedure CarregaGridView(AGridView: TcxGridDBBandedTableView);
var
  vFormName: String;
begin
  vFormName := ParentFormName(AGridView);
  AGridView.StorageOptions := [gsoUseSummary];
  if not FileExists(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini') then
    if FileExists(_PASTA_CONFIG + 'Default_' + str_cd_produto + '_' + vFormName + '.' + AGridView.Name + '.ini') then
      CopyFile(PAnsiChar(_PASTA_CONFIG + 'Default_' + str_cd_produto + '_' + vFormName + '.' + AGridView.Name + '.ini'),
         PAnsiChar(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini'), False)
    else
      SalvaGridView(AGridView);

  AGridView.RestoreFromIniFile(_PASTA_CONFIG + str_cd_usuario + '_' + vFormName + '.' + AGridView.Name + '.ini', False, False, [gsoUseFilter, gsoUseSummary], '');
end;

function ParentFormName(AComponent: TComponent): String;
var
  vForm: TForm;
begin
  vForm := ParentForm(AComponent);
  if Assigned(vForm) then
    Result := vForm.Name
  else
    Result := '';   
end;     

function ParentForm(AComponent: TComponent): TForm;
begin
  if not Assigned(AComponent) then
    Result := nil
  else if (AComponent is TForm) or (AComponent is Forms.TForm) then
    Result := TForm(AComponent)
  else
    Result := ParentForm(AComponent.Owner)

end;

{
funcção usada para campos String que contenha Aspas e que as mesmas
não possam ser trocadas por apostrofes pelo fato de representarem toneladas,
assim sendo, esta função simplesmente equaliza a qtd de aspas no texto de modo que
sempre abra e fecha
by Carlos em Mar/2009
}
function AcertaAspas ( cTexto : String ) : String;
var
  i : Integer;
begin
  i := ContaOcorrencias(cTexto,'"');
  if ( i mod 2 ) <> 0 then
     cTexto := cTexto + '"';

  result:=cTexto;
end;


{
  verifica se um processo de Desembaraço está vinculado a um Processo de FI e vice-versa
  e retorna o numero do processo de acordo com o pTipo_Retorno, caso não exista
  um processo vinculado , será retornado um valor em branco.

  pTipo_Retorno é o tipo do processo que se deseja consultar(retornar) e pode conter dois valores: D(desemb) ou F(FI)

  by carlos - jun/2009
}
function Existe_Processo_Vinculado( pNR_PROCESSO , pTipo_Retorno : String ) : String;
var
  tmp_QUERY: TQuery;
begin
  Result:='';
  tmp_QUERY := TQuery.Create(nil);
  with tmp_QUERY do begin
     DatabaseName := 'DBBROKER';
     SQL.Clear;
     if pTipo_Retorno='F' then
        SQl.Add('Select NR_PROCESSO_FI from TESTAGIO_PROCESSO_FI where NR_PROCESSO_DES="'+pNR_PROCESSO+'"')
     else
        SQl.Add('Select NR_PROCESSO_DES from TESTAGIO_PROCESSO_FI where NR_PROCESSO_FI="'+pNR_PROCESSO+'"');
        
     Open;
     Result:=fields[0].AsString;
  end;
  FreeAndNil(tmp_QUERY);
end;

function MyRound(AValue: Double; ADigits: TDigits = 2): Double;
begin
  if ADigits = 0 then
    Result := StrToFloat(FormatFloat('#0', AValue))
  else
    Result := StrToFloat(FormatFloat('#0.' + Copy(_ZEROS, 1, ADigits), AValue));
end;

{
Função para validação do Digito Verificador dos Containers
by carlos em 29/07/2009
}
function ValidaContainer( nr_container:String ): Boolean;
var
L : array[0..35] of String;
V : array[0..35] of Integer;
x,n,vl_inicial,vl_final,sDigitos:Integer;
str_digito:String;
begin
  result:=true;
  {ARMAZENA as Letras com seus respectivos valores padrões}
  L[0]:='0' ; V[0]:=0;
  L[1]:='1' ; V[1]:=1;
  L[2]:='2' ; V[2]:=2;
  L[3]:='3' ; V[3]:=3;
  L[4]:='4' ; V[4]:=4;
  L[5]:='5' ; V[5]:=5;
  L[6]:='6' ; V[6]:=6;
  L[7]:='7' ; V[7]:=7;
  L[8]:='8' ; V[8]:=8;
  L[9]:='9' ; V[9]:=9;
  L[10]:='A' ; V[10]:=10;
  L[11]:='B' ; V[11]:=12;
  L[12]:='C' ; V[12]:=13;
  L[13]:='D' ; V[13]:=14;
  L[14]:='E' ; V[14]:=15;
  L[15]:='F' ; V[15]:=16;
  L[16]:='G' ; V[16]:=17;
  L[17]:='H' ; V[17]:=18;
  L[18]:='I' ; V[18]:=19;
  L[19]:='J' ; V[19]:=20;
  L[20]:='K' ; V[20]:=21;
  L[21]:='L' ; V[21]:=23;
  L[22]:='M' ; V[22]:=24;
  L[23]:='N' ; V[23]:=25;
  L[24]:='O' ; V[24]:=26;
  L[25]:='P' ; V[25]:=27;
  L[26]:='Q' ; V[26]:=28;
  L[27]:='R' ; V[27]:=29;
  L[28]:='S' ; V[28]:=30;
  L[29]:='T' ; V[29]:=31;
  L[30]:='U' ; V[30]:=32;
  L[31]:='V' ; V[31]:=34;
  L[32]:='W' ; V[32]:=35;
  L[33]:='X' ; V[33]:=36;
  L[34]:='Y' ; V[34]:=37;
  L[35]:='Z' ; V[35]:=38;
  sDigitos:=0;
  n       :=1;
  for x:=1 to length(nr_container)-1 do begin
   str_digito:=copy(nr_container,x,1);
   sDigitos:=sDigitos+( V[AnsiIndexStr(str_digito , L)] * n ) ;
   n:=n+n;
  end;
  vl_inicial:=sDigitos;
  vl_final  :=(sDigitos div 11) * 11;
  str_digito:=IntTostr(abs(vl_final-vl_inicial));
  if str_digito='10' then
     str_digito:='0';

  if str_digito<>copy(nr_container,11,1) then begin
     { verifica a lista negra de containers, os containers desta lista não seguem o padrão de calculo dos demais. }
     with TQuery.Create(Application) do  begin
        DataBaseName := 'DBBROKER';
        SQL.Add(' SELECT IsNull(NR_CNTR,"") FROM TCONTAINER_PERMITIDO WHERE NR_CNTR= "' + nr_container + '"');
        Open;
        Result := (Fields[0].Asstring <> '');
        Free;
     end;
  end;

end;

function BuscaIndiceColuna(DBGrid :TDBGrid; FindFieldName : String) : Integer;
var
iCOL : Integer;
begin
   result := -1;
   for iCOL := 0 to DBGrid.Columns.Count -1 do begin
      if UpperCase(DBGrid.Columns.Items[iCOL].FieldName) = UpperCase(FindFieldName) then begin
         result := iCOL;
         exit;
      end;
   end;
end;
{
procedure AtualizarFollowupViagem(CD_UNID_NEG, CD_PRODUTO, CD_EMBARCACAO, NR_VIAGEM: String);
var
  vNr_Processo: string;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.text := '  SELECT NR_PROCESSO,DENSE_RANK() OVER (ORDER BY NR_PROCESSO) AS ORDEM  ' +
                '    FROM TPROCESSO (NOLOCK)                                             ' +
                '   WHERE CD_UNID_NEG   = "' + CD_UNID_NEG   + '"                        ' +
                '     AND CD_PRODUTO    = "' + CD_PRODUTO    + '"                        ' +
                '     AND CD_EMBARCACAO = "' + CD_EMBARCACAO + '"                        ' +
                '     AND NR_VIAGEM     = "' + NR_VIAGEM     + '"                        ' ;
    Open;
    First;
    DisableControls;

    while not Eof do
    begin
      FastExecSQL(' EXEC sp_atz_followup "' + Fields[0].ASString + '" ');
      vNr_Processo:= Fields[0].ASString ;
      AtualizarContainers(vNr_Processo);
      Application.ProcessMessages;
      Next;
    end;
    EnableControls;
    Close;
    Free;
  end;
end; }

{
procedure AtualizarContainers(vNr_Processo: String);
var
vContainers:string;
vData: string;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add(' SELECT NR_CNTR');
    SQL.Add(' FROM   TPROCESSO_CNTR  ');
    SQL.Add(' WHERE NR_PROCESSO = "' + vNr_Processo + '" ');
    open;
    First;
    DisableControls;


    while not Eof do
    begin
      vContainers:= Fields[0].ASString ;
      FastExecSQL(' EXEC sp_calc_dt_demurrage "' + vNr_Processo + '" ,"' + vContainers + '" ,"' + '' + '"   ');
      Application.ProcessMessages;
      Next;
    end;
    EnableControls;
    Close;
    Free;
  end;
end;    }

function Executando(AExecutavel: String): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while ContinueLoop and not Result do
  begin
    Result := AnsiIndexText(AExecutavel, [ExtractFileName(FProcessEntry32.szExeFile), FProcessEntry32.szExeFile]) >= 0;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function FileLastModified(AFileName: String): TDateTime;
var
  FileH: THandle;
  LocalFT: TFileTime;
  DosFT: DWORD;
  FindData: TWin32FindData;
begin
  Result := 0;
  FileH := FindFirstFile(PChar(AFileName), FindData);
  if FileH <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(FileH);
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
     begin
       FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFT);
       FileTimeToDosDateTime(LocalFT,LongRec(DosFT).Hi, LongRec(DosFT).Lo);
       Result := FileDateToDateTime(DosFT);
     end;
  end;
end;

{// Serviço Novo
function ProcessoServicoNovo(AProcesso: String): Boolean;
begin
  Result := ConsultaLookUPSQL('SELECT CASE WHEN P.DT_ABERTURA >= CASE WHEN P.CD_PRODUTO IN ("01") THEN ISNULL(G.DT_NOVO_FOLLOWUP_IMP, DATEADD(YEAR, 1, GETDATE())) ' +
                              '                                  ELSE CASE WHEN P.CD_PRODUTO IN ("02") THEN ISNULL(G.DT_NOVO_FOLLOWUP_EXP, DATEADD(YEAR, 1, GETDATE())) ' +
                              '                                       ELSE DATEADD(YEAR, 1, GETDATE()) ' +
                              '                                       END ' +
                              '                                  END THEN "1" ' +
                              '       ELSE "0" ' +
                              '       END AS IN_NOVO_FOLLOWUP ' +
                              ' FROM TGRUPO G (NOLOCK) ' +
                              '    INNER JOIN TPROCESSO P (NOLOCK) ON P.CD_GRUPO = G.CD_GRUPO ' +
                              ' WHERE P.NR_PROCESSO = "' + AProcesso + '"', 'IN_NOVO_FOLLOWUP') = '1';
end;

function AjustaSQLServicoNovo(AServicoNovo: Boolean; ASQL: String): String;
begin
  if not AnsiContainsText(ASQL, 'TSERVICO') then
    Result := ASQL
  else if AServicoNovo then
  begin
    Result := StringReplace(ASQL, 'TSERVICO ', 'TSERVICO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, 'TSERVICO.', 'TSERVICO_NOVO.', [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, 'TSERVICO_EVENTO ', 'TSERVICO_EVENTO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, 'TSERVICO_EVENTO.', 'TSERVICO_EVENTO_NOVO.', [rfReplaceAll, rfIgnoreCase]);
  end
  else
  begin
    Result := StringReplace(ASQL, 'TSERVICO_NOVO ', 'TSERVICO ', [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, 'TSERVICO_NOVO.', 'TSERVICO.', [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, 'TSERVICO_EVENTO_NOVO ', 'TSERVICO_EVENTO ', [rfReplaceAll, rfIgnoreCase]);
    Result := StringReplace(Result, 'TSERVICO_EVENTO_NOVO.', 'TSERVICO_EVENTO.', [rfReplaceAll, rfIgnoreCase]);
  end;
end;

procedure AjustaQueryServicoNovo(AServicoNovo: Boolean; AQuery: TQuery);
var
  Active: Boolean;
begin
  Active := AQuery.Active;
  if AnsiContainsText(AQuery.SQL.Text, 'TSERVICO') then
  begin
    AQuery.Active := False;
    AQuery.SQL.Text := AjustaSQLServicoNovo(AServicoNovo, AQuery.SQL.Text);
    AQuery.Active := Active;
  end;
end;

procedure AjustaControlesServicoNovo(AServicoNovo: Boolean; AParent: TComponent);
var
  I: Integer;
  B: Boolean;
begin
  for I := 0 to AParent.ComponentCount - 1 do
    if (AParent.Components[I] is TQuery) then
      AjustaQueryServicoNovo(AServicoNovo, TQuery(AParent.Components[I]));
end;}

function URL_Imp: String;
begin
  Result := Trim(WebConfig.ReadString('Imp Web', 'URL', 'https://www1c.siscomex.receita.fazenda.gov.br/'));
  if not SameText(Copy(Result, 1, 4), 'http') then
    Result := 'https://' + Result;
  if Copy(Result, Length(Result), 1) <> '/' then
    Result := Result + '/';
end;

function URL_Exp: String;
begin
  Result := WebConfig.ReadString('Exp Web', 'URL', 'https://siscomex.desenvolvimento.gov.br/');
  if not SameText(Copy(Result, 1, 4), 'http') then
    Result := 'https://' + Result;
  if Copy(Result, Length(Result), 1) <> '/' then
    Result := Result + '/';
end;

initialization
  WebConfig := TIniFile.Create('H:\DDBroker\WebConfig.ini');

finalization
  FreeAndNil(WebConfig);

end.



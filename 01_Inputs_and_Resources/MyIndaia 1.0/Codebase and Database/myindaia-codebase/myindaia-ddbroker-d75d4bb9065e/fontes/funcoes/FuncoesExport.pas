unit FuncoesExport;

interface

uses
  sysutils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ExtCtrls, StdCtrls, Db, Mask, DBCtrls,
  ComCtrls, Tabnotbk, dbtables, StrUtils, ByHLLAPI, MaskUtils, ServicoNovo;

{ Funções de Uso Geral }


// Procedure para Locate do registro
procedure Localiza( Query : DBTables.TQuery; Chave : String; Campo : String );
// Procedure que repassa os dados da manutenção para o RE mantendo a tabela em edição.
procedure Manutencao2RE(pQuery : DBTables.TQuery );
// Procedure que repassa os dados da manutenção para o DDE mantendo a tabela em edição.
procedure Manutencao2DDE(pQuery : DBTables.TQuery );
// Procedure que completa com zeros. O Edit ou DBEdit deve estar com o MaxLength setado corretamente.
procedure CompletaZerosEsq( var pCampo : TDBEdit ); overload;
procedure CompletaZerosEsq( var pCampo : TEdit   ); overload;
// Função que retorna o ultimo anexo do processo.
function UltimoReAnexo(const pProcesso, pComplemento : String ) : Integer;
// Grava Mercadoria com as quebras (marcador pipe "|")
procedure GravaMercComQuebras( pTextos : Array of TEdit; pProcesso, pProcessoCompl, pAnexo : String); overload;
// Grava Obsservação do Exportador com as quebras (marcador pipe "|")
procedure GravaObsExportComQuebras_Pe( pTextos : Array of TEdit; pProcesso : String);
procedure GravaObsExportComQuebras_Exp( pTextos : Array of TEdit; pProcesso : String);
procedure GravaObsExportComQuebras( pTextos : Array of TEdit; pProcesso, pProcessoCompl, pAnexo : String);
// Funcção IIF, dispensa comentarios
Function IIF(Const Condicao : Boolean; RetornoTrue, RetornoFalse : Variant) : Variant;
// Efetua o rateio dos pesos da PE e Processo de Exportação
procedure ChamaRateio(const pNR_PROCESSO, pTabela : String);
// Gera o arquivo para envio ao Siscomex através do AutoSx
function TransmiteRE(const pFileName, pCodigoUsuario : String) : Boolean;
function PosicionaTelaMapaBrasil: Boolean;
function VerificaConexaoEmulador( Sessao : String ): Boolean;
procedure TransmiteProcessos( Usuario : String );
procedure PosicaoPalavra( id_chave, tipo : String );
procedure AtualizaErroRE( Processo, Complemento, Erro : String );
// Gera o arquivo para obter informações e a situação da RE, através do AutoSx
function ConsultaRE(const pFileName, pCodigoUsuario : String) : Boolean;
procedure ConsultaProcessos( Usuario : String );
// Gera o arquivo para obter informações e a situação da DDE, através do AutoSx
function VerificaConexaoEmuladorDDE( Sessao : String ): Boolean;
function ConsultaDDE(const pFileName, pCodigoUsuario : String) : Boolean;
procedure ConsultaProcessosDDE( Usuario : String );
function TransmiteDDE(const pFileName, pCodigoUsuario : String) : Boolean;
procedure TransmiteProcessosDDE( Usuario : String );
function PosicionaTelaMapaBrasilDDE: Boolean;
procedure AtualizaErroDDE( Processo, Erro : String );
// Verifica estado da tabela e coloca ela em edição
Function PoeEmEdicao(pQuery : DBTables.TQuery ) : Boolean;
// Esconder a aplicação, para criar ilusão de que a Exportação faz parte do executavel do broker
procedure EsconderAplicacao;
// Atualiza a tabela de estagios conforme o desenvolvimento da DDE.
procedure AtualizaHistoricoDDE(const pTipoAtualizacao,pProcesso : String);
procedure InsereEspec(pQuery : DBTables.TQuery );
function StrZero(nNumero : double; i : Integer) : String;
function ExtractWord(pPosicao : Integer; pTexto,pBusca : String) : String;
procedure ConverteValoresPE(const pNR_PROCESSO: String);

{Funções da DSE ---------------------------------------------------------------}
function  VerificaConexaoEmuladorDSE( Sessao : String ): Boolean;
function  PosicionaTelaMapaBrasilDSE: Boolean;
function  TransmiteDSE              ( const pFileName, pCodigoUsuario : String) : Boolean;
procedure TransmiteProcessosDSE     ( Usuario : String );
procedure AtualizaErroDSE           ( Processo, Erro : String );
function  MontaLinhaMemo            ( pS: TStringList; pTamLinhaMemo: integer ):String;
procedure AtualizaDSE               ( Processo, NumeroDSE, DataRegistro: String );
function GeraNumeroFatura(pCliente : String) : String;
function BuscaHistoricoSiscomex( NR_DESPACHO, STATUS : String  ) : String ;
//function  PosicionaTelaMapaBrasilDSE: Boolean;




// MySenhas - Pausar e Continuar Bloqueios
const
  WM_LIBECAO_CPF        = WM_USER + 5;
  WM_PAUSAR_BLOQUEIO    = WM_LIBECAO_CPF + 1;
  WM_CONTINUAR_BLOQUEIO = WM_PAUSAR_BLOQUEIO + 1;

function PausarMySenhas: Boolean;
function ContinuarMySenhas: Boolean;


var
  qry_empresa, qry_acesso, qry_param  : TQuery;
  li_timeout, TempoEsperaEmulador, linha_palavra, coluna_palavra, tamanho : Integer;
  vProcesso, palavra, vSenhaSiscomex, vCpfUsuario, vCPFRepresentante, vCGCExportador, str_dt_desembaraco, str_dt_averbacao, str_nr_sd_sem_barra : String;

//var
{  comentado por carlos em 11/02/2010 -  Já estão declaradas no MyIndaia estas mesmas variaveis globais e está causando divergencia.(os campos estão ficando em branco)
  str_nr_processo       : String[18];
  str_cd_unid_neg       : String[2];
  str_cd_produto        : String[2];
  str_cd_modulo         : String[2];
  str_cd_rotina         : String[4];
  str_cd_cargo          : String[3];
  nr_processo_gestao    : String[18]; // Comentada esta linha para utilizar a do PGGP001 - Michel - 22/02/2010
}
  str_cd_instal_user    : String[1];
  str_cd_instal         : String[1];
  a_str_indices         : array[0..10] of String[60];
  cDir_Rpt              : String;
  cDir_Scx              : String;
  cDir_Risc             : String;
  cDir_Contab           : String;
  cDir_Rei              : String;
  cDir_cb_aut_imp       : String;
  cDir_cb_aut_trans     : String;
  vDirAutoSX            : String;
  vDirEmulador          : String;
  vDirBSL               : String;
  vDirArquivos          : String;
  vNomeSession          : string;

implementation

uses ConsOnLineEx, RateioExp, uReCapa, dReCapa, PGGP017, dDDE, uDDE, uHistoricoDDE, udatm_dse, Funcoes;

{$HINTS OFF}

function ExtractWord(pPosicao : Integer; pTexto, pBusca : String) : string;
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

Function PoeEmEdicao(pQuery : DBTables.TQuery ) : Boolean;
begin
  if pQuery.state in [dsEdit, dsInsert] then
    Result := True
  else if not ( pQuery.IsEmpty ) and ( pQuery.state = dsBrowse ) then
  begin
    pQuery.Edit;
    Result := True;
  end else
    Result := False;
end;

procedure InsereEspec(pQuery : DBTables.TQuery );
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_EMBALAGEM, QT_EMBALAGEM');
    SQL.Add('FROM   TPROCESSO_EMBALAGEM');
    SQL.Add('WHERE  NR_PROCESSO = ''' + pQuery.FieldByName('NR_SD').AsString + '''');
    if pQuery is ServicoNovo.TQuery then
      ServicoNovo.TQuery(pQuery).Open
    else
      pQuery.Open;
    datm_dde.qry_dde_espec.Open;
    while not EOF do
    begin
      datm_dde.qry_dde_espec.Insert;
      datm_dde.qry_dde_espec.FieldByName('NR_SD').AsString      := pQuery.FieldByName('NR_SD').AsString;
      datm_dde.qry_dde_espec.FieldByName('CD_ESPECIE').AsString := Fields[0].AsString;
      datm_dde.qry_dde_espec.FieldByName('QT_ESPECIE').AsFloat  := Fields[1].AsFloat;
      datm_dde.qry_dde_espec.Post;
      Next;
    end;
    datm_dde.qry_dde_espec.Close;
   Free;
  end;
end;

procedure ChamaRateio(const pNR_PROCESSO, pTabela : String);
begin
// criando o formulario
  Application.CreateForm(Tfrm_rateio_exp, frm_rateio_exp);
// montando qry_capa1
  frm_rateio_exp.qry_capa1.SQL.Clear;
  frm_rateio_exp.qry_capa1.SQL.Add('SELECT NR_PROCESSO, CAST(ISNULL(VL_PESO_LIQUIDO,0) AS DECIMAL(18,5)) VL_PESO_LIQUIDO, PADRAO_RATEIO_EXP,');
  frm_rateio_exp.qry_capa1.SQL.Add('       (SELECT ISNULL(SUM(QT_MERCADORIA),0) FROM ' + pTabela + '_ITEM WHERE ISNULL(VL_TOT_PESO_LIQ,0) = 0 AND NR_PROCESSO = ''' + pNR_PROCESSO + ''') QT_TOTAL,');
  frm_rateio_exp.qry_capa1.SQL.Add('       (SELECT ISNULL(SUM(VL_MLE),0)        FROM ' + pTabela + '_ITEM WHERE ISNULL(VL_TOT_PESO_LIQ,0) = 0 AND NR_PROCESSO = ''' + pNR_PROCESSO + ''') VL_TOT_MCV');
  frm_rateio_exp.qry_capa1.SQL.Add('FROM   ' + pTabela + '');
  frm_rateio_exp.qry_capa1.SQL.Add('WHERE  NR_PROCESSO = :NR_PROCESSO');
// montando qry_capa2
  frm_rateio_exp.qry_capa2.SQL.Clear;
  frm_rateio_exp.qry_capa2.SQL.Add('SELECT NR_PROCESSO, CAST(ISNULL(VL_PESO_BRUTO,0) AS DECIMAL(18,5)) VL_PESO_BRUTO, PADRAO_RATEIO_EXP,');
  frm_rateio_exp.qry_capa2.SQL.Add('       (SELECT ISNULL(SUM(QT_MERCADORIA),0) QT_MERCADORIA FROM ' + pTabela + '_ITEM WHERE ISNULL(VL_TOT_PESO_BRUTO,0) = 0 AND NR_PROCESSO = ''' + pNR_PROCESSO + ''') QT_TOTAL,');
  frm_rateio_exp.qry_capa2.SQL.Add('       (SELECT ISNULL(SUM(VL_MLE),0) VL_MLE       FROM ' + pTabela + '_ITEM WHERE ISNULL(VL_TOT_PESO_BRUTO,0) = 0 AND NR_PROCESSO = ''' + pNR_PROCESSO + ''') VL_TOT_MCV');
  frm_rateio_exp.qry_capa2.SQL.Add('FROM   ' + pTabela + '');
  frm_rateio_exp.qry_capa2.SQL.Add('WHERE  NR_PROCESSO = :NR_PROCESSO');
// montando qry_itens1
  frm_rateio_exp.qry_itens1.SQL.Clear;
  frm_rateio_exp.qry_itens1.SQL.Add('SELECT CAST(ISNULL(SUM(VL_TOT_PESO_LIQ),0) AS DECIMAL(18,5)) VL_TOT_PESO_LIQ,');
  frm_rateio_exp.qry_itens1.SQL.Add('       ((SELECT CAST(ISNULL(VL_PESO_LIQUIDO,0) AS DECIMAL(18,5)) VL_PESO_LIQUIDO FROM ' + pTabela + ' WHERE NR_PROCESSO = :NR_PROCESSO) - ISNULL(SUM(VL_TOT_PESO_LIQ),0)) LIQ_A_RATEAR');
  frm_rateio_exp.qry_itens1.SQL.Add('FROM   ' + pTabela + '_ITEM ');
  frm_rateio_exp.qry_itens1.SQL.Add('WHERE  NR_PROCESSO = :NR_PROCESSO');
// montando qry_itens2
  frm_rateio_exp.qry_itens2.SQL.Clear;
  frm_rateio_exp.qry_itens2.SQL.Add('SELECT CAST(ISNULL(SUM(VL_TOT_PESO_BRUTO),0) AS DECIMAL(18,5)) VL_TOT_PESO_BRUTO,');
  frm_rateio_exp.qry_itens2.SQL.Add('       ((SELECT CAST(ISNULL(VL_PESO_BRUTO,0) AS DECIMAL(18,5)) VL_PESO_BRUTO FROM ' + pTabela + ' WHERE NR_PROCESSO = :NR_PROCESSO)   - ISNULL(SUM(VL_TOT_PESO_BRUTO),0)) BRU_A_RATEAR');
  frm_rateio_exp.qry_itens2.SQL.Add('FROM   ' + pTabela + '_ITEM ');
  frm_rateio_exp.qry_itens2.SQL.Add('WHERE  NR_PROCESSO = :NR_PROCESSO');
// parametros
  frm_rateio_exp.qry_capa1.ParamByName('NR_PROCESSO').asString  := pNR_PROCESSO;
  frm_rateio_exp.qry_capa2.ParamByName('NR_PROCESSO').asString  := pNR_PROCESSO;
  frm_rateio_exp.qry_itens1.ParamByName('NR_PROCESSO').asString := pNR_PROCESSO;
  frm_rateio_exp.qry_itens2.ParamByName('NR_PROCESSO').asString := pNR_PROCESSO;
// abrindo as queryes
  frm_rateio_exp.qry_capa1.open;
  frm_rateio_exp.qry_capa2.open;
  frm_rateio_exp.qry_itens1.open;
  frm_rateio_exp.qry_itens2.open;
  frm_rateio_exp.vTabela := pTabela;
// abrindoo formulario
  frm_rateio_exp.ShowModal;
end;

procedure GravaMercComQuebras( pTextos : Array of TEdit; pProcesso, pProcessoCompl, pAnexo : String); overload;
var
  vStrAux : String;
  i : Integer;
begin
  vStrAux := '';
  for i := 0 to Length(pTextos)-1 do
    vStrAux := vStrAux + pTextos[i].Text + ' |';
  vStrAux := StringReplace(vStrAux,#13#10,'',[rfReplaceAll]);
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQl.Add('UPDATE TRE_ANEXO');
    SQl.Add('   SET TX_DESC_MERCADORIA = ' + QuotedStr(vStrAux));
    SQl.Add(' WHERE NR_PROCESSO = ' + QuotedStr(pProcesso));
    SQl.Add('   AND NR_PROCESSO_COMPLEMENTO = ' + QuotedStr(pProcessoCompl));
    SQl.Add('   AND CD_RE_ANEXO = ' + QuotedStr(pAnexo));
    ExecSQL;
    Free;
  end;
end;

procedure GravaObsExportComQuebras( pTextos : Array of TEdit; pProcesso, pProcessoCompl, pAnexo : String);
var
  vStrAux : String;
  i : Integer;
begin
  vStrAux := '';
  for i := 0 to Length(pTextos)-1 do
    vStrAux := vStrAux + pTextos[i].Text + ' |';

  vStrAux := StringReplace(vStrAux,#13#10,'',[rfReplaceAll]);
  vStrAux := StringReplace(vStrAux,#39   ,'"',[rfReplaceAll]);     // by Carlos - substituir aspa simples por dupla 03/08/2010


  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQl.Add('UPDATE TRE_ANEXO');
    SQl.Add('   SET TX_OBSERVACAO_EXPORTADOR = ''' + vStrAux + '''');
    SQl.Add(' WHERE NR_PROCESSO = ''' + pProcesso + '''');
    SQl.Add('   AND NR_PROCESSO_COMPLEMENTO = ''' + pProcessoCompl + '''');
    SQl.Add('   AND CD_RE_ANEXO = ''' + pAnexo + '''');
    ExecSQL;
    Free;
  end;
end;

procedure GravaObsExportComQuebras_Exp( pTextos : Array of TEdit; pProcesso : String);
var
  vStrAux : String;
  i : Integer;
begin
  vStrAux := '';
  for i := 0 to Length(pTextos)-1 do
    vStrAux := vStrAux + pTextos[i].Text + ' |';
  vStrAux := StringReplace(vStrAux,#13#10,'',[rfReplaceAll]);
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQl.Add('UPDATE TPROCESSO_EXP SET TX_DECL_EXPORTADOR = ''' + vStrAux + ''' WHERE NR_PROCESSO = ''' + pProcesso + '''');
    ExecSQL;
    Free;
  end;
end;

procedure GravaObsExportComQuebras_Pe( pTextos : Array of TEdit; pProcesso : String);
var
  vStrAux : String;
  i : Integer;
begin
  vStrAux := '';
  for i := 0 to Length(pTextos)-1 do
    vStrAux := vStrAux + pTextos[i].Text + ' |';
  vStrAux := StringReplace(vStrAux,#13#10,'',[rfReplaceAll]);
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQl.Add('UPDATE TPE SET TX_DECL_EXPORTADOR = ''' + vStrAux + ''' WHERE NR_PROCESSO = ''' + pProcesso + '''');
    ExecSQL;
    Free;
  end;
end;

procedure CompletaZerosEsq( var pCampo : TDBEdit ); overload;
var
  vStrAux : String;
  i       : integer;
begin
  if pCampo.Text = '' then
    Exit;
  vStrAux := pCampo.Text;
  pCampo.Text := '';
  for i := 0 to pCampo.MaxLength-(Length(vStrAux)+1) do
    pCampo.Text := pCampo.Text + '0';
  pCampo.Text := pCampo.Text + vStrAux;
end;

procedure CompletaZerosEsq( var pCampo : TEdit ); overload;
var
  vStrAux : String;
  i       : integer;
begin
  vStrAux := pCampo.Text;
  pCampo.Text := '';
  for i := 0 to pCampo.MaxLength-(Length(vStrAux)+1) do
    pCampo.Text := pCampo.Text + '0';
  pCampo.Text := pCampo.Text + vStrAux;
end;

procedure Localiza( Query : DBTables.TQuery; Chave : String; Campo : String );
begin
  if Chave = '' then
    Query.First
  else begin
    try
      Query.Locate(Campo, Chave, [loCaseInsensitive, loPartialKey]);
    except
      ShowMessage('Chave inválida!');
    end;
  end;
end;

procedure Manutencao2RE(pQuery : DBTables.TQuery );
begin
  with ServicoNovo.TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT P.CD_CLIENTE, P.CD_PAIS_DESTINO, P.CD_USUARIO, (EX.CD_URF_DESTINO) as CD_ARMAZEM_ATRACACAO,');
    SQL.Add('       (EX.CD_URF_DESPACHO) as CD_ARMAZEM_DESCARGA, EX.CD_IMPORTADOR, ');
    SQL.Add('        P.NR_FATURA, P.VL_FRETE_PREPAID_MNEG, P.VL_SEGURO_MNEG, P.VL_PESO_LIQUIDO, EX.CD_INCOTERM, ');
    SQL.Add('        TPG.NR_PERIODICIDADE, TPG.NR_PARCELAS, TPG.TP_INDICADOR ');
    SQL.Add('FROM   TPROCESSO P');
    SQL.Add('LEFT OUTER JOIN TPROCESSO_EXP EX ON ( EX.NR_PROCESSO = P.NR_PROCESSO ) ');
    SQL.Add('LEFT OUTER JOIN TPE_TERMO_PAGTO TP ON ( EX.NR_PROCESSO = TP.NR_PROCESSO ) ');
    SQL.Add('LEFT OUTER JOIN TTERMO_PAGTO TPG ON ( TP.CD_TERMO_PAGTO = TPG.CD_TERMO_PAGTO ) ');
    SQL.Add('WHERE  P.NR_PROCESSO = ''' + pQuery.FieldByName('NR_PROCESSO').AsString + '''');

    Open;
    pQuery.FieldByName('IN_ORIGEM_RE').AsString    := '1'; // origem do processo - inclusão manual.
    pQuery.FieldByName('CD_EXPORTADOR').AsString   := FieldByname('CD_CLIENTE').AsString;
    pQuery.FieldByName('CD_PAIS_FINAL').AsString   := FieldByname('CD_PAIS_DESTINO').AsString;
    pQuery.FieldByName('CD_PROPRIETARIO').AsString := FieldByname('CD_USUARIO').AsString;
    pQuery.FieldByName('CD_URF_EMBARQUE').AsString := ConsultaLookUP('TURF', 'CODIGO', FieldByname('CD_ARMAZEM_ATRACACAO').AsString, 'CODIGO');
    pQuery.FieldByName('CD_URF_DESPACHO').AsString := ConsultaLookUP('TURF', 'CODIGO', FieldByname('CD_ARMAZEM_DESCARGA').AsString , 'CODIGO');
    pQuery.FieldByName('CD_IMPORTADOR').AsString   := FieldByname('CD_IMPORTADOR').AsString;
    pQuery.FieldByName('NR_OUTRA_REF').AsString   := FieldByname('NR_FATURA').AsString;
    pQuery.FieldByName('VL_FRETE_TOTAL').AsString   := FieldByname('VL_FRETE_PREPAID_MNEG').AsString;
    pQuery.FieldByName('VL_SEGURO_TOTAL').AsString   := FieldByname('VL_SEGURO_MNEG').AsString;
    pQuery.FieldByName('PESO_LIQUIDO_TOTAL').AsString   := FieldByname('VL_PESO_LIQUIDO').AsString;
    pQuery.FieldByName('CD_INCOTERM').AsString   := FieldByname('CD_INCOTERM').AsString;
//    pQuery.FieldByName('CD_MODALIDADE_TRANS').AsString   := FieldByname('CD_MODALIDADE_TRANS').AsString;
    pQuery.FieldByName('NR_PERIODICIDADE').AsString      := FieldByname('NR_PERIODICIDADE').AsString;
    pQuery.FieldByName('NR_PARCELAS').AsString           := FieldByname('NR_PARCELAS').AsString;
    pQuery.FieldByName('TP_INDICADOR').AsString          := FieldByname('TP_INDICADOR').AsString;
    Close;
    Free;
  end;
end;

procedure Manutencao2DDE(pQuery : DBTables.TQuery );
begin
  with ServicoNovo.TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT PR.CD_CLIENTE, PR.CD_USUARIO, PR.CD_ARMAZEM_ATRACACAO,');
    SQL.Add('       EB.CD_URF_DESPACHO CD_ARMAZEM_DESCARGA, EB.CD_VIA_TRANSPORTE,');
    SQL.Add('       PR.CD_EMBARCACAO');
    SQL.Add('  FROM TPROCESSO PR, TPROCESSO_EXP EB');
    SQL.Add(' WHERE PR.NR_PROCESSO = ' + QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    SQL.Add('       AND EB.NR_PROCESSO =* PR.NR_PROCESSO');
    Open;

    pQuery.FieldByName('CD_EXPORTADOR').AsString        := FieldByname('CD_CLIENTE').AsString;
    pQuery.FieldByName('CD_PROPRIETARIO').AsString      := FieldByname('CD_USUARIO').AsString;
    pQuery.FieldByName('CD_URF_EMBARQUE').AsString      := ConsultaLookUP('TARMAZEM', 'CD_ARMAZEM', FieldByname('CD_ARMAZEM_ATRACACAO').AsString, 'CD_URF');
    pQuery.FieldByName('CD_URF_DESPACHO').AsString      := ConsultaLookUP('TURF', 'CODIGO', FieldByname('CD_ARMAZEM_DESCARGA').AsString , 'CODIGO');
//by Carlos - A via Transporte é puxada da TPROCESSO e na propria DDE  (27/11/2009)
//    pQuery.FieldByName('CD_VIA_TRANSPORTE').AsString    := FieldByname('CD_VIA_TRANSPORTE').AsString;
    pQuery.FieldByName('TX_IDENT_VEIC_TRANSP').AsString := ConsultaLookUP('TEMBARCACAO', 'CD_EMBARCACAO', FieldByname('CD_EMBARCACAO').AsString , 'NM_EMBARCACAO');
    pQuery.FieldByName('QT_ESTAB_DESPACHO').AsString    := '01';

    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(PESO_LIQUIDO), SUM(VL_COND_VENDA) FROM TRE_ANEXO WHERE NR_PROCESSO = '+QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    Open;

    pQuery.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat := Fields[0].AsFloat;
    pQuery.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   := Fields[1].AsFloat;
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO TSD_RE (NR_SD, NR_PROCESSO_RE, NR_RE_SISCOMEX, VL_SOMA_PESO_LIQUIDO, VL_SOMA_COND_VENDA, NR_ANEXO_INICIAL, NR_ANEXO_FINAL)');
    SQL.Add('     SELECT RC.NR_PROCESSO, RC.NR_RE_SISCOMEX, RC.NR_RE_SISCOMEX, SUM(RA.PESO_LIQUIDO), SUM(RA.VL_COND_VENDA), ''001'', SUBSTRING(RC.NR_RE_SISCOMEX,12,3)');
    SQL.Add('       FROM TRE_CAPA RC, TRE_ANEXO RA');
    SQL.Add('      WHERE RC.NR_PROCESSO = '+QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    SQL.Add('        AND RA.NR_PROCESSO = RC.NR_PROCESSO');
    SQL.Add('        AND RA.NR_PROCESSO_COMPLEMENTO = RC.NR_PROCESSO_COMPLEMENTO');
    //by carlos - VERIFICA SE JA NÃO FOI LANÇADO
    SQL.Add('        AND not exists (select NR_PROCESSO_RE from TSD_RE where NR_SD=rc.NR_PROCESSO and NR_PROCESSO_RE=rc.NR_RE_SISCOMEX ) ');
    // Incluído por Michel em 18/11/2011 para não inserir capa sem número de RE, pois gera erro de que não pode inserir NULL em NR_RE_SISCOMEX
    SQL.Add('        AND RC.NR_RE_SISCOMEX IS NOT NULL');
    SQL.Add('      GROUP BY RC.NR_PROCESSO, RC.NR_RE_SISCOMEX, RC.NR_RE_SISCOMEX');
    ExecSQL;
    Free;
  end;
end;

function UltimoReAnexo(const pProcesso, pComplemento : String ) : Integer;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(CD_RE_ANEXO),0) FROM TRE_ANEXO WHERE NR_PROCESSO = ''' + pProcesso + ''' AND NR_PROCESSO_COMPLEMENTO = ''' + pComplemento + '''');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

Function IIF(Const Condicao : Boolean; RetornoTrue, RetornoFalse : Variant) : Variant;
Begin
  If Condicao Then
    Result := RetornoTrue
  Else
    Result := RetornoFalse;
End;

function PosicionaTelaMapaBrasil: Boolean;
var
   Tela1,
   Tela2 : String;
   Res : Integer;
   DataHora1,
   DataHora2 : String;
   Tempo : Double;
   DataHoraLoop : TDateTime;
   l_Abortar : Boolean;
   escape : Integer;
begin
  if VerificaConexaoEmulador( qry_param.FieldByName('TX_NOME_SESSION').AsString ) then
  begin
    l_Abortar := False;
    PosicaoPalavra('REDECOMSERPROBR','ENVRE');
    if datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then
    begin
      Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
      Res := datm_re_capa.ByHLLAPI.Wait( True );
      Result := True;
      Sleep(1000);
    end else begin
      escape := 0;
      PosicaoPalavra('REDESERPROBR','ENVRE');
      if not datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then
      begin
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        Result := True;
        Sleep(1000);
        exit;
      end;
      PosicaoPalavra('REDECOMSERPROBR','ENVRE');
    end;
    Result := True;
  end;
end;


{DSE - PosicionaTelaMapaBrasilDSE ---------------------------------------------}
{function PosicionaTelaMapaBrasilDSE: Boolean;
var
   Tela1, Tela2, DataHora1, DataHora2 : String;
   Res  , escape                      : Integer;
   Tempo                              : Double;
   DataHoraLoop                       : TDateTime;
   l_Abortar                          : Boolean;
begin

  if VerificaConexaoEmuladorDSE( qry_param.FieldByName('TX_NOME_SESSION').AsString ) then
  begin
    l_Abortar := False;
    PosicaoPalavra('REDECOMSERPROBR','ENVDSE');
    if datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then
       begin
       Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
       Res := datm_dse.ByHLLAPI.Wait( True );
       Result := True;
       Sleep(4000);
       end
    else
       begin
       escape := 0;
       PosicaoPalavra('REDESERPROBR','ENVDSE');
       while not ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
       begin
         Tela1 := datm_dse.ByHLLAPI.CopyScreen2String( Res );
         Tela2 := datm_dse.ByHLLAPI.CopyScreen2String( Res );
         Res := datm_dse.ByHLLAPI.SendKey( C_PF3 );
         DataHora1    := '01/12/2000 00:00:00';
         DataHora2    := '01/12/2000 00:00:' + IntToStr( li_timeout );
         Tempo        := StrToDateTime( DataHora2 ) - StrToDateTime( DataHora1 );
         DataHoraLoop := Now;
         while Tela1 = Tela2 do
           begin
           Tela2 := datm_dse.ByHLLAPI.CopyScreen2String( Res );
           Application.ProcessMessages;
           if Now > ( DataHoraLoop + Tempo ) then
              begin
              Result := False;
              l_Abortar := True;
              Break;
              end;
           end;

         if l_Abortar then Break;
         PosicaoPalavra('REDECOMSERPROBR','ENVDSE');
         if datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then
            begin
            Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
            Res := datm_dse.ByHLLAPI.Wait( True );
            Result := True;
            Sleep(4000);
            exit;
            end;
         PosicaoPalavra('REDECOMSERPROBR','ENVDSE');
       end;
       Result := True;
       end;
  end;
end;
}


function PosicionaTelaMapaBrasilDDE: Boolean;
var
   Tela1,
   Tela2 : String;
   Res : Integer;
   DataHora1,
   DataHora2 : String;
   Tempo : Double;
   DataHoraLoop : TDateTime;
   l_Abortar : Boolean;
   escape : Integer;
begin

//     Result := True;

     if VerificaConexaoEmuladorDDE( qry_param.FieldByName('TX_NOME_SESSION').AsString ) then
     begin
        l_Abortar := False;

        PosicaoPalavra('REDECOMSERPROBR','ENVDDE');
        if datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) then
        begin
           Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
           Res := datm_dde.ByHLLAPI_DDE.Wait( True );
           Result := True;
           Sleep(4000);
        end
        else begin
             escape := 0;
             PosicaoPalavra('REDESERPROBR','ENVDDE');
             while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                 Tela1 := datm_dde.ByHLLAPI_DDE.CopyScreen2String( Res );
                 Tela2 := datm_dde.ByHLLAPI_DDE.CopyScreen2String( Res );
                 Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3 );
                 DataHora1    := '01/12/2000 00:00:00';
                 DataHora2    := '01/12/2000 00:00:' + IntToStr( li_timeout );
                 Tempo        := StrToDateTime( DataHora2 ) - StrToDateTime( DataHora1 );
                 DataHoraLoop := Now;
                 while Tela1 = Tela2 do begin
                       Tela2 := datm_dde.ByHLLAPI_DDE.CopyScreen2String( Res );
                       Application.ProcessMessages;
                       if Now > ( DataHoraLoop + Tempo ) then begin
                          Result := False;
                          l_Abortar := True;
                          Break;
                       end;
                 end;
                 if l_Abortar then begin
                    Break;
                 end;
                 PosicaoPalavra('REDECOMSERPROBR','ENVDDE');
                 if datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
                    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
                    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
                    Result := True;
                    {escape := escape + 1;
                    if escape > 30 then
                    begin
                        break;
                    end;}
                    Sleep(4000);
                    exit;
                 end;
                 PosicaoPalavra('REDECOMSERPROBR','ENVDDE');
             end;
             Result := True;
        end;

     end;

end;

function TransmiteRE(const pFileName, pCodigoUsuario : String) : Boolean;
var
   F    : TextFile;
   i, j : integer;
   vProcesso,
   DataHora1,
   DataHora2 : String;
   Tempo : Double;
   DataHoraLoop : TDateTime;

   CurrWnd: hWnd;
   pi: TProcessInformation;
   si: TStartupInfo;

   Emulador : THandle;

begin
  PausarMySenhas;

  Result := True; // Estava no final da função e foi passado para cá pq sempre retornava True - Michel - 12/03/2009
  try
    qry_param := TQuery.Create(application);
    qry_param.DatabaseName := 'DBBROKER';
    qry_param.SQL.Clear;
    qry_param.SQL.Add('SELECT TP_EMULADOR, TIME_WAIT_EMULADOR, EXE_EMULADOR, PARAM_EMULADOR, TX_NOME_SESSION FROM TPARAMETROS');
    qry_param.Open;
    qry_acesso := TQuery.Create(application);
    qry_acesso.DatabaseName := 'DBBROKER';
    qry_acesso.SQL.Clear;
    { comentado por carlos (17/09/2009) - tabela TACESSO_SCX_EXP substituida pela view VW_DESPACHANTE_CLIENTE }
//    qry_acesso.SQL.Add('SELECT CD_SENHA_SCX, CPF_USUARIO, CASE ISNULL(CNPJ_REPRES,'''') WHEN '''' THEN CPF_USUARIO ELSE CNPJ_REPRES END AS CNPJ_REPRES FROM TACESSO_SCX_EXP WHERE CD_ACESSO = ''' + pCodigoUsuario + '''');

    qry_acesso.SQL.Add('SELECT distinct CD_SENHA_SCX, CPF_USUARIO, CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CD_ACESSO = "' + pCodigoUsuario + '"');
    qry_acesso.Open;
    if FindWindow(nil,'TN3270') = 0 then
      WinExec('C:\IWWTCPIP\EMU.EXE SESSIONA.EMU',SHOW_OPENWINDOW);
    vSenhaSiscomex    := qry_acesso.FieldByName('CD_SENHA_SCX').AsString;
    vCpfUsuario       := qry_acesso.FieldByName('CPF_USUARIO').AsString;
    vCPFRepresentante := qry_acesso.FieldByName('CNPJ_REPRES').AsString;
    vProcesso := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
    Sleep(3000);
    TempoEsperaEmulador := qry_param.FieldByName('TIME_WAIT_EMULADOR').AsInteger;
    li_timeout := TempoEsperaEmulador;
    datm_re_capa.ByHLLAPI.ExePath    := ExtractFileDir( Application.ExeName );
    datm_re_capa.ByHLLAPI.ExeName    := 'BySrv16.EXE';
    try
      datm_re_capa.ByHLLAPI.TimeOut := ( TempoEsperaEmulador * 1000 );
      datm_re_capa.ByHLLAPI.CarregaDLL;
      datm_re_capa.ByHLLAPI.ResetaConectaPS( qry_param.FieldByName('TX_NOME_SESSION').AsString );
      TransmiteProcessos(  vCpfUsuario );
    Finally
      try
        datm_re_capa.ByHLLAPI.DesconectaPS;
        datm_re_capa.ByHLLAPI.DescarregaDLL;
        //
        ContinuarMySenhas;
      except
      end;
    end;
    qry_param.Close;
    qry_param.Free;
    qry_acesso.Close;
    qry_acesso.Free;
  except
    Result := False;
  end;

  ContinuarMySenhas;

end;

procedure EncerraTransmissao;
begin
  try
    datm_re_capa.ByHLLAPI.DesconectaPS;
    datm_re_capa.ByHLLAPI.DescarregaDLL;
  except

  end;
end;

procedure TransmiteProcessos( Usuario : String );
var
   Res,
   con_LinhaVol,
   TamLinhaMemo : Integer;
   str_PesoBrutoTotal,
   str_ValorTotal,
   str_QtdeUnidadeMedida,
   str_QtdeUnidadeComerc,
   str_PesoLiquido,
   str_ValorMoeda,
   LinhaParaMemo,
   LinhaMemoDoc,
   LinhaMemoInfo : String;
   l_Retorna : Boolean;
   S : TStringList;
   strvalemb : String;
   vlrcom : String;
   fat, RC : String;
   enquadr : String;
   str_numero_re : String;
   i, v, j : Integer;
   Tela1, Tela2, naladi, dadosexp, obsexp : String;
   escape : Integer;

begin

  try
    while not datm_re_capa.qry_re_capa.EOF do begin
      frm_re_capa.captura_telas.Clear;

      if not PosicionaTelaMapaBrasil then begin
        BoxMensagem( 'Não conectado Siscomex!', 3 );
        Exit;
      end;

      escape := 0;
      PosicaoPalavra('REDESERPROBR','ENVRE');
      while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
        Sleep(1000);

      PosicaoPalavra('REDESERPROBR','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        datm_re_capa.ByHLLAPI.CopyString2PS( 16, 12, vCpfUsuario);    // '16239665827'
        datm_re_capa.ByHLLAPI.CopyString2PS( 17, 12, vSenhaSiscomex); // 'INDAIA10'
        datm_re_capa.ByHLLAPI.CopyString2PS( 18, 12, 'SISCOMEX' );
      end;

      Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
      Res := datm_re_capa.ByHLLAPI.Wait( True );

      PosicaoPalavra('SEN0500','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
        EncerraTransmissao;
        Exit;
      end;
      PosicaoPalavra('SEN0501','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
        EncerraTransmissao;
        Exit;
      end;
      PosicaoPalavra('SEN0502','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
        EncerraTransmissao;
        Exit;
      end;
      PosicaoPalavra('SEN0504','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
        EncerraTransmissao;
        Exit;
      end;
      PosicaoPalavra('SEN0507','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
        EncerraTransmissao;
        Exit;
      end;
      TamLinhaMemo := 240;
      l_Retorna := False;
      PosicaoPalavra('COLETAIMPRLOC','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        PosicaoPalavra('COLETAIMPRLOC','ENVRE');
        while ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
          Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
          Res := datm_re_capa.ByHLLAPI.Wait( True );
        end;
      end;
      PosicaoPalavra('POSICURSOR','ENVRE');
      while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
        PosicaoPalavra('COLETAIMPRLOC','ENVRE');
        if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
          Break;
        PosicaoPalavra('SEN0551','ENVRE');
        if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
          AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, 'VOCE ESTA UTILIZANDO ESTE SISTEMA EM OUTRO TERMINAL.' );
          EncerraTransmissao;
          Exit;
        end;
        Sleep(1000);
        PosicaoPalavra('POSICURSOR','ENVRE');
      end;
      if l_Retorna  then
        l_Retorna := False;
      PosicaoPalavra('COLETAIMPRLOC','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
      end;
      PosicaoPalavra('POSICURSOR','ENVRE');
      while ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
        datm_re_capa.ByHLLAPI.CopyString2PS( 22, 15, 'REGI-OPER' );
        while not( datm_re_capa.ByHLLAPI.CopyPS2String( 22, 15, 9, Res) = 'REGI-OPER' ) do begin
          datm_re_capa.ByHLLAPI.CopyString2PS( 22, 15, 'REGI-OPER' );
          Sleep(1000);
        end;
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        Break;
        Sleep(1000);
      end;
      PosicaoPalavra('EXISTEMNOTI','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        datm_re_capa.ByHLLAPI.CopyString2PS( 16, 41, 'N' );
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
      end;
      PosicaoPalavra('PREENCHASOLIC','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        datm_re_capa.ByHLLAPI.CopyString2PS( 18, 29, ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_re_capa.qry_re_capa.FieldByName('CD_EXPORTADOR').AsString,'CGC_EMPRESA'));//datm_re_capa.qry_re_capa.FieldByName('').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 18, 48, vCPFRepresentante );
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
      end;
      PosicaoPalavra('REGOPEREXP','ENVRE');
      while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
        Sleep(1000);
        PosicaoPalavra('PREENCHASOLIC','ENVRE');
        if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
          datm_re_capa.ByHLLAPI.CopyString2PS( 18, 29, ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_re_capa.qry_re_capa.FieldByName('CD_EXPORTADOR').AsString,'CGC_EMPRESA') );//datm_re_capa.qry_re_capa.FieldByName('').AsString );
          datm_re_capa.ByHLLAPI.CopyString2PS( 18, 48, vCPFRepresentante );
          Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
          Res := datm_re_capa.ByHLLAPI.Wait( True );
        end;
        PosicaoPalavra('REGOPEREXP','ENVRE');
      end;
      PosicaoPalavra('REGOPEREXP','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        datm_re_capa.ByHLLAPI.CopyString2PS( 22, 18, 'PCEX300' );
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        PosicaoPalavra('MCEX300','ENVRE');
        while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do  begin
          PosicaoPalavra('ENTERSEGUE','ENVRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
            Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
            PosicaoPalavra('MCEX300','ENVRE');
            while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
              Sleep(1000);
          end;
          Sleep(1000);
          PosicaoPalavra('MCEX300','ENVRE');
        end;
      end;

      PosicaoPalavra('MCEX300','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then  begin
        datm_re_capa.ByHLLAPI.CopyString2PS( 20, 20, '01' );
        datm_re_capa.ByHLLAPI.CopyString2PS( 20, 41, '         ' );
        datm_re_capa.ByHLLAPI.CopyString2PS( 20, 53, '   ' );
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        PosicaoPalavra('MCEX501A','ENVRE');
        while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
          Sleep(1000);
        strvalemb := '';
        vlrcom := '';
      end;
      // começa aqui - vítor
      PosicaoPalavra('MCEX501A','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        fat := datm_re_capa.qry_re_capa.FieldByName('NR_OUTRA_REF').AsString;
        enquadr := datm_re_capa.qry_re_capa.FieldByName('CD_ENQUAD1').AsString;
        datm_re_capa.ByHLLAPI.CopyString2PS( 11, 26, datm_re_capa.qry_re_capa.FieldByName('CD_ENQUAD1').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 11, 35, datm_re_capa.qry_re_capa.FieldByName('CD_ENQUAD2').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 11, 44, datm_re_capa.qry_re_capa.FieldByName('CD_ENQUAD3').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 11, 53, datm_re_capa.qry_re_capa.FieldByName('CD_ENQUAD4').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 11, 62, datm_re_capa.qry_re_capa.FieldByName('CD_ENQUAD5').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 11, 71, datm_re_capa.qry_re_capa.FieldByName('CD_ENQUAD6').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 12, 26, datm_re_capa.qry_re_capa.FieldByName('NR_REG_VENDA').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 13, 26, datm_re_capa.qry_re_capa.FieldByName('NR_REG_CREDITO').AsString );

        RC := datm_re_capa.qry_re_capa.FieldByName('NR_REG_CREDITO').AsString;
        datm_re_capa.ByHLLAPI.CopyString2PS( 12, 65, datm_re_capa.qry_re_capa.FieldByName('DT_LIMITE_OPERACAO').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 13, 65, StringReplace(datm_re_capa.qry_re_capa.FieldByName('VL_MARGEM_NAO_SACADA').AsString,',','.',[]) );
        datm_re_capa.ByHLLAPI.CopyString2PS( 14, 26, datm_re_capa.qry_re_capa.FieldByName('NR_RE_VINCULADA').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 14, 65, '               ' ); {Processo}
        datm_re_capa.ByHLLAPI.CopyString2PS( 15, 26, datm_re_capa.qry_re_capa.FieldByName('NR_DI_VINCULADA').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 16, 26, datm_re_capa.qry_re_capa.FieldByName('CD_URF_DESPACHO').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 17, 26, datm_re_capa.qry_re_capa.FieldByName('CD_URF_EMBARQUE').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 19, 26, datm_re_capa.qry_re_capa.FieldByName('IMPORTADOR').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 20, 26, datm_re_capa.qry_re_capa.FieldByName('TX_END_IMPORTADOR').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 21, 26, ConsultaLookUP('TPAIS_BROKER','CD_PAIS',datm_re_capa.qry_re_capa.FieldByName('CD_PAIS_IMPORTADOR').AsString,'CD_SCX_EXP' ));
        if RC = '' then begin
          datm_re_capa.ByHLLAPI.CopyString2PS( 19, 26, datm_re_capa.qry_re_capa.FieldByName('IMPORTADOR').AsString );
          datm_re_capa.ByHLLAPI.CopyString2PS( 20, 26, datm_re_capa.qry_re_capa.FieldByName('TX_END_IMPORTADOR').AsString );
          datm_re_capa.ByHLLAPI.CopyString2PS( 21, 26, ConsultaLookUP('TPAIS_BROKER','CD_PAIS',datm_re_capa.qry_re_capa.FieldByName('CD_PAIS_IMPORTADOR').AsString,'CD_SCX_EXP' ));
        end;
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        {salva tela}
        i:=1;
        while i <= 25 do begin
          frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        // caso não mude a tela, espera intervenção do usuario e continua
        PosicaoPalavra('MCEX501B','ENVRE');
        while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
          Sleep(1000);
        end;
        frm_re_capa.captura_telas.Lines.Add(' ');
      end;
      PosicaoPalavra('MCEX501B','ENVRE');
      if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
        if (RC = '') then begin
          datm_re_capa.ByHLLAPI.CopyString2PS( 7, 33, ConsultaLookUP('TPAIS_BROKER','CD_PAIS',datm_re_capa.qry_re_capa.FieldByName('CD_PAIS_FINAL').AsString,'CD_SCX_EXP' ) );
          datm_re_capa.ByHLLAPI.CopyString2PS( 9, 33, datm_re_capa.qry_re_capa.FieldByName('CD_INCOTERM').AsString );
          if (enquadr <> '80113') then begin
            datm_re_capa.ByHLLAPI.CopyString2PS( 12, 33, datm_re_capa.qry_re_capa.FieldByName('CD_MOEDA').AsString );
          end;
          datm_re_capa.ByHLLAPI.CopyString2PS( 19, 33, StringReplace(datm_re_capa.qry_re_capa.FieldByName('VL_CONSIGN').AsString,',','.',[]) );
          datm_re_capa.ByHLLAPI.CopyString2PS( 20, 33, StringReplace(datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_COBER_CAMBIAL').AsString,',','.',[]) );
        end;

        datm_re_capa.ByHLLAPI.CopyString2PS( 8, 33, datm_re_capa.qry_re_capa.FieldByName('CD_INST_NEGO').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 11, 33, datm_re_capa.qry_re_capa.FieldByName('CD_MODALIDADE_TRANS').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 13, 33, StringReplace(datm_re_capa.qry_re_capa.FieldByName('VL_PAGTO_ANTEC').AsString,',','.',[]) );
        datm_re_capa.ByHLLAPI.CopyString2PS( 14, 33, StringReplace(datm_re_capa.qry_re_capa.FieldByName('VL_PAGT_VISTA').AsString,',','.',[]) );
        datm_re_capa.ByHLLAPI.CopyString2PS( 15, 33, datm_re_capa.qry_re_capa.FieldByName('NR_PARCELAS').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 15, 71, datm_re_capa.qry_re_capa.FieldByName('TP_INDICADOR').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 16, 33, datm_re_capa.qry_re_capa.FieldByName('NR_PERIODICIDADE').AsString );
        datm_re_capa.ByHLLAPI.CopyString2PS( 17, 33, StringReplace(datm_re_capa.qry_re_capa.FieldByName('VL_PARCELA').AsString,',','.',[]) );
        datm_re_capa.ByHLLAPI.CopyString2PS( 21, 33, StringReplace(datm_re_capa.qry_re_capa.FieldByName('VL_FINANC_RC').AsString,',','.',[]) );
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        {salva tela}
        i:=1;
        while i <= 25 do  begin
          frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
        Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
        Res := datm_re_capa.ByHLLAPI.Wait( True );
        Application.ProcessMessages;
        frm_re_capa.captura_telas.Lines.Add(' ');
        if ( datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 20, Res) = 'FIM DE DADOS GLOBAIS' ) then begin
          Res := datm_re_capa.ByHLLAPI.SendKey( C_PF8, True );
          Res := datm_re_capa.ByHLLAPI.Wait( True );
          PosicaoPalavra('MCEX501C','ENVRE');
          while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
            Sleep(2000);
          end;
        end;
      end;
      datm_re_capa.qry_re_anexo.Close;
      datm_re_capa.qry_re_anexo.ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
      datm_re_capa.qry_re_anexo.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
      datm_re_capa.qry_re_anexo.Prepare;
      datm_re_capa.qry_re_anexo.Open;
      datm_re_capa.qry_re_anexo.First;
      while not datm_re_capa.qry_re_anexo.Eof do begin
        PosicaoPalavra('MCEX501C','ENVRE');
        if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
          v := 11;
          j := 0;
          while v <= 19 do begin
            datm_re_capa.ByHLLAPI.CopyString2PS( v, 6, Trim(ExtractWord( j + 1 , datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|')) );
            j:= j+1;
            v:= v+1;
          end;
          // PRIMEIRA TELA : NCM, MERCADORIA, UF...
          naladi := datm_re_capa.qry_re_anexo.FieldByName('CD_NALADI').AsString;
          datm_re_capa.ByHLLAPI.CopyString2PS( 9, 20, datm_re_capa.qry_re_anexo.FieldByName('CD_NALADI').AsString );
          datm_re_capa.ByHLLAPI.CopyString2PS( 7, 12, datm_re_capa.qry_re_anexo.FieldByName('CD_NCM').AsString );
          datm_re_capa.ByHLLAPI.CopyString2PS( 7, 23, datm_re_capa.qry_re_anexo.FieldByName('CD_SULF_NCM').AsString );
          datm_re_capa.ByHLLAPI.CopyString2PS( 20, 23, datm_re_capa.qry_re_anexo.FieldByName('TX_CATEGORIA_TEXTIL').AsString );
          datm_re_capa.ByHLLAPI.CopyString2PS( 21, 23, datm_re_capa.qry_re_anexo.FieldByName('CD_UF_PRODUTOR').AsString );
          Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
          Res := datm_re_capa.ByHLLAPI.Wait( True );
          PosicaoPalavra('TABNALADI','ENVRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
            Tela1 := datm_re_capa.ByHLLAPI.CopyPS2String( 9, 20, 8, Res);
            Tela2 := datm_re_capa.ByHLLAPI.CopyPS2String( 9, 20, 8, Res);
            while Tela1 = Tela2 do begin
              Tela2 := datm_re_capa.ByHLLAPI.CopyPS2String( 9, 20, 8, Res);
              Sleep(1000);
            end;
          end;
          {salva tela}
          i:=1;
          while i <= 25 do begin
            frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
            i:=i+1;
          end;
          Application.ProcessMessages;
          frm_re_capa.captura_telas.Lines.Add(' ');
          if naladi = '' then begin
            Tela1 :=  datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
            Tela2 :=  datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
            Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
          end;
          if datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 10, Res) = '          ' then begin
            Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
            PosicaoPalavra('MCEX501D','ENVRE');
            while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
              Sleep(2000);
            end;
          end;
          // SEGUNDA TELA : VALORES...
          if ( datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 10, Res) <> '          ' ) then  begin
            AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 79, Res) );
            EncerraTransmissao;
            Exit;
          end;
          PosicaoPalavra('MCEX501D','ENVRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
            datm_re_capa.ByHLLAPI.CopyString2PS( 8, 63, StringReplace(datm_re_capa.qry_re_anexo.FieldByName('PESO_LIQUIDO').AsString,',','.',[]) );
            datm_re_capa.ByHLLAPI.CopyString2PS( 10, 25, StringReplace(datm_re_capa.qry_re_anexo.FieldByName('QT_UNIDADE_COMERCIAL').AsString,',','.',[]) );
            if enquadr <> '80113' then begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 10, 61, ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', Datm_re_capa.qry_re_anexo.FieldByName('CD_UNID_MEDIDA').AsString, 'NM_UNID_MEDIDA') );
            end;
            datm_re_capa.ByHLLAPI.CopyString2PS( 12, 25, StringReplace(datm_re_capa.qry_re_anexo.FieldByName('QT_MEDIA_NBM').AsString,',','.',[]) );
            datm_re_capa.ByHLLAPI.CopyString2PS( 14, 25, StringReplace(datm_re_capa.qry_re_anexo.FieldByName('VL_COND_VENDA').AsString,',','.',[]) );
            datm_re_capa.ByHLLAPI.CopyString2PS( 14, 63, StringReplace(datm_re_capa.qry_re_anexo.FieldByName('VL_LOCAL_VENDA').AsString,',','.',[]) );
            if RC = '' then begin
              if Length(ExtractWord(1,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.')) < 2 then
              begin
                datm_re_capa.ByHLLAPI.CopyString2PS( 19, 8, '0' + ExtractWord(1,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
                datm_re_capa.ByHLLAPI.CopyString2PS( 19, 11, ExtractWord(2,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
              end else begin
                datm_re_capa.ByHLLAPI.CopyString2PS( 19, 8, ExtractWord(1,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
                datm_re_capa.ByHLLAPI.CopyString2PS( 19, 11, ExtractWord(2,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
              end;
            end;
            if Length(ExtractWord(1,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.')) < 2 then begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 19, 8, '0' + ExtractWord(1,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
              datm_re_capa.ByHLLAPI.CopyString2PS( 19, 11, ExtractWord(2,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
            end else begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 19, 8, ExtractWord(1,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
              datm_re_capa.ByHLLAPI.CopyString2PS( 19, 11, ExtractWord(2,StringReplace(FloatToStrF(datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat,ffNumber,18,2),',','.',[]),'.') );
            end;
            if datm_re_capa.qry_re_anexo.FieldByName('PC_COMISSAO').AsFloat > 0 then
              datm_re_capa.ByHLLAPI.CopyString2PS( 19, 25, datm_re_capa.qry_re_anexo.FieldByName('CD_FORMA_PGTO_REBATE').AsString );
            datm_re_capa.ByHLLAPI.CopyString2PS( 20, 25, datm_re_capa.qry_re_anexo.FieldByName('CD_FINALIDADE').AsString );
            if datm_re_capa.qry_re_anexo.FieldByName('IN_EXPORTADOR_FABRICANTE').AsString = '1' then begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 21, 37, 'S' );
              dadosexp := 'S';
            end else begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 21, 37, 'N' );
              dadosexp := 'N';
            end;
            if datm_re_capa.qry_re_anexo.FieldByName('IN_OBS_EXPORTADOR').AsString <> '0' then begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 21, 74, 'S' );
              obsexp := 'S';
            end else begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 21, 74, 'N' );
              obsexp := 'N';
            end;

            Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
            strvalemb := datm_re_capa.ByHLLAPI.CopyPS2String( 8, 2, 35, Res);
            vlrcom := datm_re_capa.ByHLLAPI.CopyPS2String( 19, 42, 39, Res);
            {salva tela}
            i:=1;
            while i <= 25 do begin
              frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
              i:=i+1;
            end;
            Application.ProcessMessages;
            frm_re_capa.captura_telas.Lines.Add(' ');

            if datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 10, Res) = '          ' then begin
              Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
              Res := datm_re_capa.ByHLLAPI.Wait( True );
              PosicaoPalavra('REGVALDIV','ENVRE');
              if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                TELA1 := datm_re_capa.ByHLLAPI.CopyPS2String( 8, 1, 50, Res);
                TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 8, 1, 50, Res);
                {salva tela}
                i:=1;
                while i <= 25 do begin
                  frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
                  i:=i+1;
                end;
                Application.ProcessMessages;
                frm_re_capa.captura_telas.Lines.Add(' ');

                Res := datm_re_capa.ByHLLAPI.SendKey( C_PF8, True );
                Res := datm_re_capa.ByHLLAPI.Wait( True );
                while TELA1 = TELA2 do
                  TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 8, 1, 50, Res);
              end;
            end;
          end;
          if datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 10, Res) = '          ' then begin
            // se fabricante não é o exportador
            if dadosexp = 'N' then begin
              PosicaoPalavra('MCEX501E','ENVRE');
              while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                Sleep(2000);
              end;
              PosicaoPalavra('MCEX501E','ENVRE');
              if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                v:=11;
                datm_re_capa.qry_re_anexo_fabric.Close;
                datm_re_capa.qry_re_anexo_fabric.ParamByName('NR_PROCESSO').AsString             := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
                datm_re_capa.qry_re_anexo_fabric.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
                datm_re_capa.qry_re_anexo_fabric.ParamByName('CD_RE_ANEXO').AsString             := datm_re_capa.qry_re_anexo.FieldByName('CD_RE_ANEXO').AsString;
                datm_re_capa.qry_re_anexo_fabric.Prepare;
                datm_re_capa.qry_re_anexo_fabric.Open;

                datm_re_capa.qry_re_anexo_fabric.First;
                while not datm_re_capa.qry_re_anexo_fabric.Eof do begin
                  datm_re_capa.ByHLLAPI.CopyString2PS( v, 3, datm_re_capa.qry_re_anexo_fabric.FieldByName('CNPJ').AsString );
                  datm_re_capa.ByHLLAPI.CopyString2PS( v, 18, ( datm_re_capa.qry_re_anexo_fabric.FieldByName('NCM').AsString + datm_re_capa.qry_re_anexo.FieldByName('CD_SULF_NCM').AsString ) );
                  datm_re_capa.ByHLLAPI.CopyString2PS( v, 29, datm_re_capa.qry_re_anexo_fabric.FieldByName('ESTADO_PRODUTOR').AsString );
                  datm_re_capa.ByHLLAPI.CopyString2PS( v, 32, datm_re_capa.qry_re_anexo_fabric.FieldByName('NR_ATO').AsString );
                  datm_re_capa.ByHLLAPI.CopyString2PS( v, 46, StringReplace(datm_re_capa.qry_re_anexo_fabric.Fieldbyname('QT_MERCADORIA').AsString,',','.',[]) );
                  datm_re_capa.ByHLLAPI.CopyString2PS( v, 63, StringReplace(datm_re_capa.qry_re_anexo_fabric.Fieldbyname('VL_TOTAL').AsString,',','.',[]) );
                  Sleep(2000);
                  datm_re_capa.qry_re_anexo_fabric.Next;
                  v:=v+1
                end;
                TELA1 := datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
                TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
                {salva tela}
                i:=1;
                while i <= 25 do begin
                  frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
                  i:=i+1;
                end;
                Application.ProcessMessages;
                frm_re_capa.captura_telas.Lines.Add(' ');

                Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
                Res := datm_re_capa.ByHLLAPI.Wait( True );
                if (datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 10, Res) <> '          ') and datm_re_capa.ByHLLAPI.ScrComp(3,72,'MCEX501E') then begin
                  {salva tela}
                  i:=1;
                  while i <= 25 do begin
                    frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
                    i:=i+1;
                  end;
                  Application.ProcessMessages;
                  frm_re_capa.captura_telas.Lines.Add(' ');
                  AtualizaErroRE( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 75, Res) );
                  EncerraTransmissao;
                  Exit;
                  v:=11;
                  while v <= 20 do begin
                    datm_re_capa.ByHLLAPI.CopyString2PS( v,  3, '              ' );
                    datm_re_capa.ByHLLAPI.CopyString2PS( v, 18, '          ' );
                    datm_re_capa.ByHLLAPI.CopyString2PS( v, 29, '  ' );
                    datm_re_capa.ByHLLAPI.CopyString2PS( v, 32, '             ' );
                    datm_re_capa.ByHLLAPI.CopyString2PS( v, 46, '                ' );
                    datm_re_capa.ByHLLAPI.CopyString2PS( v, 63, '                  ' );
                    v:=v+1
                  end;
                  PosicaoPalavra('REDE','ENVRE');
                  while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                    Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
                    Res := datm_re_capa.ByHLLAPI.Wait( True );
                    Sleep(2000);
                  end;
                  dadosexp := 'S';
                  obsexp := 'N';
                  datm_re_capa.qry_re_capa.Next;
                  Continue;
                  exit;
                end;
              end;
            end;
//25-OBSERVACÂO/EXPORTADOR            
            // se tiver observações do exportador
            if obsexp = 'S' then begin
              PosicaoPalavra('REDE','ENVRE');
              if not datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
                PosicaoPalavra('MCEX501F','ENVRE');
                while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                  Sleep(2000);
                end;
                if datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
                  v := 9;
                  j := 0;
                  while v <= 18 do begin
                    datm_re_capa.ByHLLAPI.CopyString2PS( v, 6, Trim(ExtractWord( j + 1 , datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|')) );
                    j:= j+1;
                    v := v + 1;
                  end;
                  TELA1 := datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
                  TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
                  {salva tela}
                  i:=1;
                  while i <= 25 do begin
                    frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
                    i:=i+1;
                  end;
                  Application.ProcessMessages;
                  frm_re_capa.captura_telas.Lines.Add(' ');
                  Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
                  Res := datm_re_capa.ByHLLAPI.Wait( True );
                  if (datm_re_capa.ByHLLAPI.CopyPS2String( 1, 2, 10, Res) <> '          ') and datm_re_capa.ByHLLAPI.ScrComp(3,72,'MCEX501E') then begin
                    {salva tela}
                    i:=1;
                    while i <= 25 do begin
                      frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
                      i:=i+1;
                    end;
                    Application.ProcessMessages;
                    frm_re_capa.captura_telas.Lines.Add(' ');
                    PosicaoPalavra('REDE','ENVRE');
                    while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                      Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
                      Res := datm_re_capa.ByHLLAPI.Wait( True );
                      Sleep(2000);
                    end;
                    datm_re_capa.qry_re_capa.Next;
                    Continue;
                    exit;
                  end;
                end;
              end;
            end;
          end;
        end;

        // MENSAGEM DE FINAL DAS MERCADORIAS
        PosicaoPalavra('FIMMERC','ENVRE');
        if datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
          TELA1 := datm_re_capa.ByHLLAPI.CopyPS2String( 1, 1, 80, Res);
          TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 1, 1, 80, Res);
//26-MENSAGENS DE ASVERTENCIA
          Res := datm_re_capa.ByHLLAPI.SendKey( C_PF8, True );
          Res := datm_re_capa.ByHLLAPI.Wait( True );
          while TELA1 = TELA2 do begin
            TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 1, 1, 80, Res);
            Sleep(1000);
          end;
          // se tiver mensagem de advertencia, trata ela e pula o fim das mercadorias
          if datm_re_capa.ByHLLAPI.ScrComp( 7, 2, '26-MENSAGENS' ) then begin
            Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
          end else begin
            PosicaoPalavra('CONCLUIDO','ENVRE');
            if not datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
              PosicaoPalavra('MCEX501C','ENVRE');
              while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                if datm_re_capa.qry_re_anexo.Eof then
                  break;
                Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
                Res := datm_re_capa.ByHLLAPI.Wait( True );
                Sleep(2000);
                PosicaoPalavra('MCEX501C','ENVRE');
              end;
            end;
          end;
        end else begin
          PosicaoPalavra('REDE','ENVRE');
          if not datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
            AtualizaErroRE(    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString , 'NÃO CONCLUÍDO' );
            EncerraTransmissao;
            Exit;
          end;
        end;
        datm_re_capa.qry_re_anexo.Next;
      end;
//    Terminaram os anexos, finaliza e grava o status na tabela
      PosicaoPalavra('CONCLUIDO','ENVRE');
      if not datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
        PosicaoPalavra('MCEX501G','ENVRE');
        if datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
          TELA1 := datm_re_capa.ByHLLAPI.CopyPS2String( 15, 1, 80, Res);
          TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 15, 1, 80, Res);
          Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
          Res := datm_re_capa.ByHLLAPI.Wait( True );
          while TELA1 = TELA2 do begin
            TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 15, 1, 80, Res);
            Sleep(1000);
          end;
        end;
      end;
      PosicaoPalavra('CONCLUIDO','ENVRE');
      if datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
        str_numero_re := datm_re_capa.ByHLLAPI.CopyPS2String( 13, 61, 14, Res);
        {salva tela}
        i:=1;
        while i <= 25 do begin
          frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
        // grava na tabela
        datm_re_capa.qry_re_capa.Edit;
        datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString     := str_numero_re;
        datm_re_capa.qry_re_capa.FieldByName('DT_DATA').AsDateTime          := now;
        datm_re_capa.qry_re_capa.FieldByName('DT_ULT_CONSULTA').AsDateTime  := now;
        datm_re_capa.qry_re_capa.FieldByName('TX_SITUACAO_RE').AsString     := 'SITUAÇÃO INICIAL';
        datm_re_capa.qry_re_capa.Post;
        if (qry_param.FieldByName('TP_EMULADOR').AsString <> 'WEB') then begin
          TELA1 := datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
          TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
          Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
          Res := datm_re_capa.ByHLLAPI.Wait( True );
          while TELA1 = TELA2 do begin
            PosicaoPalavra('ENTERSEGUE','ENVRE');
            if datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
              Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
              Res := datm_re_capa.ByHLLAPI.Wait( True );
              while datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) do
                Sleep(1000);
            end;
            TELA2 := datm_re_capa.ByHLLAPI.CopyPS2String( 3, 1, 80, Res);
          end;
          PosicaoPalavra('REDE','ENVRE');
          while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
            Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
            Sleep(2000);
          end;
        end else
          exit;
      end;
      Sleep(2000);
      datm_re_capa.qry_re_capa.Next
    end;
    frm_re_capa.captura_telas.Lines.SaveToFile('H:\TXT_RE\RE'+StringReplace(StringReplace(str_numero_re,'/','',[rfReplaceAll]),'-','',[rfReplaceAll])+'.txt');
  except
    on e:Exception do
      ShowMessage(e.Message);
  end;
end;

procedure PosicaoPalavra( id_chave, tipo : String );
begin
   with TQuery.Create(application) do
   begin
     DatabaseName := 'DBBROKER';
     SQL.Clear;
     SQL.Add('SELECT PALAVRA, LINHA_PALAVRA, COLUNA_PALAVRA, TAMANHO FROM TENVIA_EXP_SISCOMEX');
     SQL.Add('WHERE ID_CHAVE = ' + QuotedStr(id_chave) + ' AND TIPO = ' + QuotedStr(tipo));
     Open;
     palavra := FieldByName('PALAVRA').AsString;
     linha_palavra := FieldByName('LINHA_PALAVRA').AsInteger;
     coluna_palavra := FieldByName('COLUNA_PALAVRA').AsInteger;
     tamanho := FieldByName('TAMANHO').AsInteger;
     Close;
     Free;
   end;
end;

function VerificaConexaoEmulador( Sessao : String ): Boolean;
var
   Res: Integer;
begin
     Result := False;

     try
        Res := datm_re_capa.ByHLLAPI.ResetaConectaPS( Sessao );
        if Res = 0 then begin
           Result := True
        end;
     except
     end;
end;

function VerificaConexaoEmuladorDDE( Sessao : String ): Boolean;
var
   Res: Integer;
begin
  Result := False;
  try
    Res := datm_dde.ByHLLAPI_DDE.ResetaConectaPS( Sessao );
    if Res = 0 then
      Result := True;
  except
  end;
end;


function VerificaConexaoEmuladorDSE( Sessao : String ): Boolean;
var
  Res: Integer;
begin
  Result := False;
  try
    Res := datm_dse.ByHLLAPI.ResetaConectaPS( Sessao );
    if Res = 0 then
      Result := True
  except
  end;
end;


procedure AtualizaErroRE( Processo, Complemento, Erro : String );
var
   li_NovaSequencia : Integer;
   qry_atua_sit : TQuery;
begin
  try
    qry_atua_sit := TQuery.Create(application);
    qry_atua_sit.DatabaseName := 'DBBROKER';
    qry_atua_sit.SQL.Clear;
    qry_atua_sit.SQL.Add('UPDATE  TRE_CAPA');
    qry_atua_sit.SQL.Add('SET     TX_SITUACAO_RE = :TX_SITUACAO_RE');
    qry_atua_sit.SQL.Add('WHERE ( NR_PROCESSO = :NR_PROCESSO )');
    qry_atua_sit.SQL.Add('  AND ( NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO )');
    qry_atua_sit.ParamByName('NR_PROCESSO').AsString := Processo;
    qry_atua_sit.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := Complemento;
    qry_atua_sit.ParamByName('TX_SITUACAO_RE').AsString := Copy( Trim( Erro ), 1, 150 );
    qry_atua_sit.ExecSql;
    qry_atua_sit.Free;
    // volta até a primeira tela.... antes da tela do Mapa do Brasil
    while not ( datm_re_capa.ByHLLAPI.ScrComp( 1, 2, 'I5)' ) ) do
      datm_re_capa.ByHLLAPI.SendKey( C_PF3 );
  except
  end;
end;

procedure AtualizaErroDDE( Processo, Erro : String );
var
   Res, li_NovaSequencia : Integer;
   qry_atua_sit     : TQuery;
begin
  try
    qry_atua_sit := TQuery.Create(application);
    qry_atua_sit.DatabaseName := 'DBBROKER';
    qry_atua_sit.SQL.Clear;
    qry_atua_sit.SQL.Add('UPDATE TSD');
    qry_atua_sit.SQL.Add('SET TX_SITUCAO_DDE = :TX_SITUACAO_DDE');
    qry_atua_sit.SQL.Add('WHERE ( TSD.NR_SD = :NR_SD )');
    qry_atua_sit.ParamByName('NR_SD').AsString := Processo;
    qry_atua_sit.ParamByName('TX_SITUACAO_DDE').AsString := Copy( Trim( Erro ), 1, 60 );
    qry_atua_sit.ExecSql;
  finally
    qry_atua_sit.Free;
    // volta para a tela incial do Siscomex, antes do mapa
    PosicaoPalavra('REDE','CONDDE');
    while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      Sleep(500);
    end;
  end;
end;

procedure AtualizaErroDSE( Processo, Erro : String );
var
   li_NovaSequencia : Integer;
   qry_atua_sit : TQuery;
begin
     try
        qry_atua_sit := TQuery.Create(application);
        qry_atua_sit.DatabaseName := 'DBBROKER';
        qry_atua_sit.SQL.Clear;
        qry_atua_sit.SQL.Add('UPDATE TDSE SET TX_SITUACAO_DSE = :TX_SITUACAO_DSE WHERE NR_PROCESSO = :NR_PROCESSO ');
        qry_atua_sit.ParamByName('NR_PROCESSO').AsString := Processo;
        qry_atua_sit.ParamByName('TX_SITUACAO_DSE').AsString := Trim( Erro );
        qry_atua_sit.ExecSql;
        qry_atua_sit.Free;
     except
     end;
end;


procedure EsconderAplicacao;
var
  H:HWnd;
begin
  H := FindWindow( Nil, 'Export' );
  if H <> 0 then
    ShowWindow(H,SW_HIDE);
end;

function ConsultaRE(const pFileName, pCodigoUsuario : String) : Boolean;
var
   F    : TextFile;
   i, j : integer;
   vProcesso,
   DataHora1,
   DataHora2 : String;
   Tempo : Double;
   DataHoraLoop : TDateTime;

   CurrWnd: hWnd;
   pi: TProcessInformation;
   si: TStartupInfo;

   Emulador : THandle;

begin
    if pCodigoUsuario='' then begin
       Result := False;
       exit;
    end;

    Result := True;
    try
      //
      qry_param := TQuery.Create(application);
      qry_param.DatabaseName := 'DBBROKER';
      qry_param.SQL.Clear;
      qry_param.SQL.Add('SELECT TP_EMULADOR, TIME_WAIT_EMULADOR, EXE_EMULADOR, PARAM_EMULADOR, TX_NOME_SESSION FROM TPARAMETROS');
      qry_param.Open;
      qry_acesso := TQuery.Create(application);
      qry_acesso.DatabaseName := 'DBBROKER';
      qry_acesso.SQL.Clear;
    { comentado por carlos (17/09/2009) - tabela TACESSO_SCX_EXP substituida pela view VW_DESPACHANTE_CLIENTE }
//    qry_acesso.SQL.Add('SELECT CD_SENHA_SCX, CPF_USUARIO, CASE ISNULL(CNPJ_REPRES,'''') WHEN '''' THEN CPF_USUARIO ELSE CNPJ_REPRES END AS CNPJ_REPRES FROM TACESSO_SCX_EXP WHERE CD_ACESSO = ''' + pCodigoUsuario + '''');
      qry_acesso.SQL.Add('SELECT distinct CD_SENHA_SCX, CPF_USUARIO, CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CD_ACESSO = "' + pCodigoUsuario + '"');
      qry_acesso.Open;
      vSenhaSiscomex    := qry_acesso.FieldByName('CD_SENHA_SCX').AsString;
      vCpfUsuario       := qry_acesso.FieldByName('CPF_USUARIO').AsString;
      vCPFRepresentante := qry_acesso.FieldByName('CNPJ_REPRES').AsString;

      vProcesso := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;

      datm_re_capa.qry_recapa.Open;


      TempoEsperaEmulador := qry_param.FieldByName('TIME_WAIT_EMULADOR').AsInteger;

      li_timeout := TempoEsperaEmulador;
{

      if (qry_param.FieldByName('TP_EMULADOR').AsString = 'PACKET') then begin
         datm_re_capa.ByHLLAPI.HLLAPIKind := hkPKG;
         datm_re_capa.ByHLLAPI.DllName    := 'EHLLAPI.DLL';
         datm_re_capa.ByHLLAPI.DllPath    := ExtractFileDir( qry_param.FieldByName('EXE_EMULADOR').AsString );
      end
      else if (qry_param.FieldByName('TP_EMULADOR').AsString = 'IWW 3.0') then begin
          datm_re_capa.ByHLLAPI.HLLAPIKind := hkIWW3;
          datm_re_capa.ByHLLAPI.DllName    := 'WHLLAPI.DLL';
          datm_re_capa.ByHLLAPI.DllPath    := ExtractFileDir( qry_param.FieldByName('EXE_EMULADOR').AsString );
      end
      else if (qry_param.FieldByName('TP_EMULADOR').AsString = 'IWW 4.0') then begin
          datm_re_capa.ByHLLAPI.HLLAPIKind := hkIWW4;
          datm_re_capa.ByHLLAPI.DllName    := 'WHLLAPI.DLL';
          datm_re_capa.ByHLLAPI.DllPath    := ExtractFileDir( qry_param.FieldByName('EXE_EMULADOR').AsString );
      end
      else if (qry_param.FieldByName('TP_EMULADOR').AsString = 'WEB') then begin
          datm_re_capa.ByHLLAPI.HLLAPIKind := hkWEB;
          datm_re_capa.ByHLLAPI.DllName    := 'EHLAPI32.DLL';
          datm_re_capa.ByHLLAPI.DllPath    := 'C:\Arquivos de programas\IBM\EHLLAPI';
      end;
      datm_re_capa.ByHLLAPI.ExePath    := ExtractFileDir( Application.ExeName );
      datm_re_capa.ByHLLAPI.ExeName    := 'BySrv16.EXE';
      }


      try
         { inicia o carregamento do emulador do siscomex } //by Carlos - 07/01/2010
         if FindWindow(nil,'TN3270') = 0 then
           WinExec('C:\IWWTCPIP\EMU.EXE SESSIONA.EMU',SHOW_OPENWINDOW);


         Sleep(3000);
         TempoEsperaEmulador := 240;
         li_timeout          := TempoEsperaEmulador;

         datm_re_capa.ByHLLAPI.ExePath := ExtractFileDir( Application.ExeName );
         datm_re_capa.ByHLLAPI.ExeName := 'BySrv16.EXE';
         datm_re_capa.ByHLLAPI.TimeOut := ( TempoEsperaEmulador * 1000 );

         datm_re_capa.ByHLLAPI.DescarregaDLL;
         Sleep(3000);
         datm_re_capa.ByHLLAPI.CarregaDLL;
         datm_re_capa.ByHLLAPI.ResetaConectaPS( 'A' );
         { finaliza o carregamento do emulador do siscomex }
         //
         ConsultaProcessos(  vCpfUsuario );
         //
      except
         Result := False;
      end;
      qry_param.Close;
      qry_param.Free;
      qry_acesso.Close;
      qry_acesso.Free;
      datm_re_capa.qry_recapa.Close;
    except
      Result := False;
    end;

    { retira da memoria o emulador do siscomex }
    datm_re_capa.ByHLLAPI.DescarregaDLL;
    TerminateProcesso('ntvdm.exe');

end;

procedure ConsultaProcessos( Usuario : String );
var
   Res,
   con_LinhaVol,
   TamLinhaMemo : Integer;
   str_PesoBrutoTotal,
   str_ValorTotal,
   str_QtdeUnidadeMedida,
   str_QtdeUnidadeComerc,
   str_PesoLiquido,
   str_ValorMoeda,
   LinhaParaMemo,
   LinhaMemoDoc,
   LinhaMemoInfo : String;
   l_Retorna : Boolean;
   S : TStringList;
   strvalemb : String;
   vlrcom : String;
   fat, RC : String;
   enquadr : String;
   str_situacao_re : String;
   str_numero_re, str_anexo : String;
   i, v, j, c : Integer;
   qtd_anexos, a : Integer;
   Tela1, Tela2, naladi, dadosexp, obsexp : String;
   escape : Integer;
begin
     try
       TamLinhaMemo := 240;

       l_Retorna := False;

       frm_re_capa.captura_telas.Clear;

       datm_re_capa.qry_re_capa.First;
       while not datm_re_capa.qry_re_capa.Eof do begin
          if (qry_param.FieldByName('TP_EMULADOR').AsString = 'PACKET') then begin
              PosicaoPalavra('PACKET','CONRE');
              if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 datm_re_capa.ByHLLAPI.CopyString2PS( 04, 01, 'RD' );
                 Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
                 Res := datm_re_capa.ByHLLAPI.Wait( True );
              end;
          end;

          if not PosicionaTelaMapaBrasil then begin
             AtualizaErroRE(    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString , 'Não conectado Siscomex!' );
             EncerraTransmissao;
             Exit;
          end;

          escape := 0;
          PosicaoPalavra('REDESERPROBR','CONRE');
          while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
            Sleep(2000);
          end;
          PosicaoPalavra('REDESERPROBR','CONRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then  begin
              datm_re_capa.ByHLLAPI.CopyString2PS( 16, 12, vCpfUsuario );
              datm_re_capa.ByHLLAPI.CopyString2PS( 17, 12, vSenhaSiscomex );
              datm_re_capa.ByHLLAPI.CopyString2PS( 18, 12, 'SISCOMEX' );

              Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
              Res := datm_re_capa.ByHLLAPI.Wait( True );

              PosicaoPalavra('SEN0500','CONRE');
              if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then  begin
                AtualizaErroRE(    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString , datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
                EncerraTransmissao;
                Exit;
              end;
              PosicaoPalavra('SEN0501','CONRE');
              if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then  begin
                AtualizaErroRE(    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString , datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
                EncerraTransmissao;
                Exit;
              end;
              PosicaoPalavra('SEN0502','CONRE');
              if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                AtualizaErroRE(    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString , datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
                EncerraTransmissao;
                Exit;
              end;
              PosicaoPalavra('SEN0507','CONRE');
              if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then  begin
                AtualizaErroRE(    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString , datm_re_capa.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
                EncerraTransmissao;
                Exit;
              end;
          end;

          PosicaoPalavra('COLETAIMPRLOC','CONRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
            Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
            PosicaoPalavra('COLETAIMPRLOC','CONRE');
            while ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
                Res := datm_re_capa.ByHLLAPI.Wait( True );
            end;
          end;

          PosicaoPalavra('POSICURSOR','CONRE');
          while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
               PosicaoPalavra('COLETAIMPRLOC','CONRE');
               if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                  Break;
               end;
               PosicaoPalavra('SEN0551','CONRE');
               if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                  AtualizaErroRE(    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString, datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString , 'VOCE ESTA UTILIZANDO ESTE SISTEMA EM OUTRO TERMINAL.' );
                  EncerraTransmissao;
                  Exit;
                end;
               Sleep(2000);
               PosicaoPalavra('POSICURSOR','CONRE');
          end;

          if l_Retorna  then begin
             l_Retorna := False;
             Continue;
          end;

          PosicaoPalavra('COLETAIMPRLOC','CONRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
             Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
             Res := datm_re_capa.ByHLLAPI.Wait( True );
          end;

          PosicaoPalavra('POSICURSOR','CONRE');
          while ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                datm_re_capa.ByHLLAPI.CopyString2PS( 22, 15, 'REGI-OPER' );
                while not( datm_re_capa.ByHLLAPI.CopyPS2String( 22, 15, 9, Res) = 'REGI-OPER' ) do begin
                      datm_re_capa.ByHLLAPI.CopyString2PS( 22, 15, 'REGI-OPER' );
                Sleep(2000);
                end;
                Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
                Res := datm_re_capa.ByHLLAPI.Wait( True );
                Break;
                Sleep(2000);
          end;

          PosicaoPalavra('EXISTEMNOTI','CONRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
             datm_re_capa.ByHLLAPI.CopyString2PS( 16, 41, 'N' );
             Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
             Res := datm_re_capa.ByHLLAPI.Wait( True );
          end;

          PosicaoPalavra('PREENCHASOLIC','CONRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
             if (ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_re_capa.qry_re_capa.FieldByName('CD_EXPORTADOR').AsString,'CD_TIPO_PESSOA') = '1') then  begin
               datm_re_capa.ByHLLAPI.CopyString2PS( 18, 29, ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_re_capa.qry_re_capa.FieldByName('CD_EXPORTADOR').AsString,'CGC_EMPRESA'));
             end else begin
               datm_re_capa.ByHLLAPI.CopyString2PS( 18, 29, ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_re_capa.qry_re_capa.FieldByName('CD_EXPORTADOR').AsString,'CPF_EMPRESA'));
             end;
             datm_re_capa.ByHLLAPI.CopyString2PS( 18, 48, vCPFRepresentante );
             Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
             Res := datm_re_capa.ByHLLAPI.Wait( True );
          end;

          PosicaoPalavra('REGOPEREXP','CONRE');
          while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
            Sleep(2000);
          end;

          PosicaoPalavra('REGOPEREXP','CONRE');
          if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
             datm_re_capa.ByHLLAPI.CopyString2PS( 22, 18, 'PCEX300' );
             Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
             Res := datm_re_capa.ByHLLAPI.Wait( True );
             PosicaoPalavra('MCEX300','CONRE');
             while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                PosicaoPalavra('ENTERSEGUE','CONRE');
                if ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                   Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
                   Res := datm_re_capa.ByHLLAPI.Wait( True );
                   PosicaoPalavra('MCEX300','CONRE');
                   while not ( datm_re_capa.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                     Sleep(2000);
                   end;
                end;
                Sleep(2000);
                PosicaoPalavra('MCEX300','CONRE');
             end;
          end;

          { by Carlos 06/01/2010 - inclusão de anexos para criação do extrato de RE com as informações 26,27,28 e 29 }
          qtd_anexos:=strToInt( Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,12,3));
          str_numero_re := Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,1,2) + Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,4,7)  ;
          for a:=1 to qtd_anexos do begin
            str_anexo:=strzero(a,3);
            str_numero_re := Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,1,2) + Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,4,7) + Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,12,3) ; //by Carlos 06/01/2010
            datm_re_capa.ByHLLAPI.CopyString2PS( 20, 20, '  ' );
            datm_re_capa.ByHLLAPI.CopyString2PS( 20, 20, '07' );
            datm_re_capa.ByHLLAPI.CopyString2PS( 20, 41, str_numero_re );
            datm_re_capa.ByHLLAPI.CopyString2PS( 20, 53, str_anexo     );

            Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );


            while not ( datm_re_capa.ByHLLAPI.ScrComp( 1, 2, 'ULTIMA PAGINA' ) ) do begin
               {salva tela}
               i:=1;
               while i <= 25 do begin
                 frm_re_capa.captura_telas.Lines.Add( datm_re_capa.ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
                 i:=i+1;
               end;

               Res := datm_re_capa.ByHLLAPI.SendKey( C_ENTER, True );
               Res := datm_re_capa.ByHLLAPI.Wait( True );
            end;

            {  Voltar ao menu para selecionar outro RE }
            Res := datm_re_capa.ByHLLAPI.SendKey( C_PF6 , True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
          end;

          frm_re_capa.captura_telas.Lines.SaveToFile('H:\TXT_RE\CONSULTA_RE'+StringReplace(StringReplace(str_numero_re,'/','',[rfReplaceAll]),'-','',[rfReplaceAll])+'.txt');

          { Voltar ao Logon }
          while not ( datm_re_capa.ByHLLAPI.ScrComp( 1, 3, 'TELA 001' ) ) do begin
            Res := datm_re_capa.ByHLLAPI.SendKey( C_PF3, True );
            Res := datm_re_capa.ByHLLAPI.Wait( True );
            Sleep(2000);
          end;


          Sleep(2000);
          { fim das implantações by Carlos em 06/01/2010 }

          datm_re_capa.qry_re_capa.Next;
       end;

     except
       on e:Exception do
         ShowMessage(e.Message);
     end;
end;

function TransmiteDDE(const pFileName, pCodigoUsuario : String) : Boolean;
var
  F    : TextFile;
  i, j : integer;
  vProcesso, DataHora1, DataHora2 : String;
  Tempo : Double;
  DataHoraLoop : TDateTime;
  CurrWnd: hWnd;
  pi: TProcessInformation;
  si: TStartupInfo;
  Emulador : THandle;
begin
  Result := True; // Estava no final da função e foi passado para cá pq sempre retornava True - Michel - 05/12/2008
  try
    qry_param := TQuery.Create(application);
    qry_param.DatabaseName := 'DBBROKER';
    qry_param.SQL.Clear;
    qry_param.SQL.Add('SELECT TP_EMULADOR, TIME_WAIT_EMULADOR, EXE_EMULADOR, PARAM_EMULADOR, TX_NOME_SESSION FROM TPARAMETROS');
    qry_param.Open;
    qry_acesso := TQuery.Create(application);
    qry_acesso.DatabaseName := 'DBBROKER';
    qry_acesso.SQL.Clear;
    { comentado por carlos (17/09/2009) - tabela TACESSO_SCX_EXP substituida pela view VW_DESPACHANTE_CLIENTE }
//    qry_acesso.SQL.Add('SELECT CD_SENHA_SCX, CPF_USUARIO, CASE ISNULL(CNPJ_REPRES,'''') WHEN '''' THEN CPF_USUARIO ELSE CNPJ_REPRES END AS CNPJ_REPRES FROM TACESSO_SCX_EXP WHERE CD_ACESSO = ''' + pCodigoUsuario + '''');
    qry_acesso.SQL.Add('SELECT distinct CD_SENHA_SCX, CPF_USUARIO, CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CD_ACESSO = "' + pCodigoUsuario + '"');
    qry_acesso.Open;

    if FindWindow(nil,'TN3270') = 0 then
      WinExec('C:\IWWTCPIP\EMU.EXE SESSIONA.EMU',SHOW_OPENWINDOW);
    vSenhaSiscomex    := qry_acesso.FieldByName('CD_SENHA_SCX').AsString;
    vCpfUsuario       := qry_acesso.FieldByName('CPF_USUARIO').AsString;
    vCPFRepresentante := qry_acesso.FieldByName('CNPJ_REPRES').AsString;
    vProcesso         := datm_dde.qry_dde.FieldByName('NR_SD').AsString;

    datm_dde.qry_dde_envio.Open;
    qry_empresa := TQuery.Create(application);
    qry_empresa.DatabaseName := 'DBBROKER';
    qry_empresa.SQL.Clear;
    qry_empresa.SQL.Add('SELECT CGC_EMPRESA, CPF_EMPRESA, CD_TIPO_PESSOA FROM TEMPRESA_NAC');
    qry_empresa.SQL.Add(' WHERE CD_EMPRESA = ''' + datm_dde.qry_dde_envio.FieldByName('CD_EXPORTADOR').AsString + '''');
    qry_empresa.Open;
    if (qry_empresa.FieldByName('CD_TIPO_PESSOA').AsString = '1') then
      vCGCExportador := qry_empresa.FieldByName('CGC_EMPRESA').AsString
    else vCGCExportador := qry_empresa.FieldByName('CPF_EMPRESA').AsString;
    Sleep(3000);
    TempoEsperaEmulador := qry_param.FieldByName('TIME_WAIT_EMULADOR').AsInteger;
    li_timeout := TempoEsperaEmulador;
    datm_dde.ByHLLAPI_DDE.ExePath    := ExtractFileDir( Application.ExeName );
    datm_dde.ByHLLAPI_DDE.ExeName    := 'BySrv16.EXE';
    try
      datm_dde.ByHLLAPI_DDE.TimeOut := ( TempoEsperaEmulador * 1000 );
      datm_dde.ByHLLAPI_DDE.CarregaDLL;
      datm_dde.ByHLLAPI_DDE.ResetaConectaPS( qry_param.FieldByName('TX_NOME_SESSION').AsString );
      TransmiteProcessosDDE(  vCpfUsuario );
    Finally
      try
        datm_dde.ByHLLAPI_DDE.DesconectaPS;
        datm_dde.ByHLLAPI_DDE.DescarregaDLL;
      except
      end;
    end;
    qry_empresa.Close;
    qry_empresa.Free;
    qry_param.Close;
    qry_param.Free;
    qry_acesso.Close;
    qry_acesso.Free;
    datm_dde.qry_dde_envio.Close;
  except
    Result := False;
  end;
end;

{DSE - Transmite DSE ----------------------------------------------------------}
function TransmiteDSE(const pFileName, pCodigoUsuario : String) : Boolean;
var
   F            : TextFile;
   I            : integer;
   J            : integer;
//   vProcesso    : String;
   DataHora1    : String;
   DataHora2    : String;
   Tempo        : Double;
   DataHoraLoop : TDateTime;
   CurrWnd      : hWnd;
   PI           : TProcessInformation;
   SI           : TStartupInfo;
   Emulador     : THandle;
begin
    try
      qry_param := TQuery.Create(application);
      qry_param.DatabaseName := 'DBBROKER';
      qry_param.SQL.Clear;
      qry_param.SQL.Add('SELECT TP_EMULADOR, TIME_WAIT_EMULADOR, EXE_EMULADOR, PARAM_EMULADOR, TX_NOME_SESSION FROM TPARAMETROS');
      qry_param.Open;

      qry_acesso := TQuery.Create(application);
      qry_acesso.DatabaseName := 'DBBROKER';
      qry_acesso.SQL.Clear;
    { comentado por carlos (17/09/2009) - tabela TACESSO_SCX_EXP substituida pela view VW_DESPACHANTE_CLIENTE }
//    qry_acesso.SQL.Add('SELECT CD_SENHA_SCX, CPF_USUARIO, CASE ISNULL(CNPJ_REPRES,'''') WHEN '''' THEN CPF_USUARIO ELSE CNPJ_REPRES END AS CNPJ_REPRES FROM TACESSO_SCX_EXP WHERE CD_ACESSO = ''' + pCodigoUsuario + '''');
      qry_acesso.SQL.Add('SELECT distinct CD_SENHA_SCX, CPF_USUARIO, CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CD_ACESSO = "' + pCodigoUsuario + '"');
      qry_acesso.Open;

      vSenhaSiscomex    := qry_acesso.FieldByName('CD_SENHA_SCX').AsString;
      vCpfUsuario       := qry_acesso.FieldByName('CPF_USUARIO').AsString;
      vCPFRepresentante := qry_acesso.FieldByName('CNPJ_REPRES').AsString;
      vProcesso         := datm_dse.qry_dse.FieldByName('NR_PROCESSO').AsString;

      qry_empresa := TQuery.Create(application);
      qry_empresa.DatabaseName := 'DBBROKER';
      qry_empresa.SQL.Clear;
      qry_empresa.SQL.Add('SELECT CGC_EMPRESA, CPF_EMPRESA, CD_TIPO_PESSOA FROM TEMPRESA_NAC');
      qry_empresa.SQL.Add('WHERE CD_EMPRESA = ''' + datm_dse.qry_dse.FieldByName('CD_EXPORTADOR').AsString + '''');
      qry_empresa.Open;

      if (qry_empresa.FieldByName('CD_TIPO_PESSOA').AsString = '1') then
         begin
         vCGCExportador := qry_empresa.FieldByName('CGC_EMPRESA').AsString;
         end
      else
         begin
         vCGCExportador := qry_empresa.FieldByName('CPF_EMPRESA').AsString;
         end;

      TempoEsperaEmulador := qry_param.FieldByName('TIME_WAIT_EMULADOR').AsInteger;

      li_timeout := TempoEsperaEmulador;

      if (qry_param.FieldByName('TP_EMULADOR').AsString = 'PACKET') then begin
         datm_dse.ByHLLAPI.HLLAPIKind := hkPKG;
         datm_dse.ByHLLAPI.DllName    := 'EHLLAPI.DLL';
         datm_dse.ByHLLAPI.DllPath    := ExtractFileDir( qry_param.FieldByName('EXE_EMULADOR').AsString );
      end
      else if (qry_param.FieldByName('TP_EMULADOR').AsString = 'IWW 3.0') then begin
          datm_dse.ByHLLAPI.HLLAPIKind := hkIWW3;
          datm_dse.ByHLLAPI.DllName    := 'WHLLAPI.DLL';
          datm_dse.ByHLLAPI.DllPath    := ExtractFileDir( qry_param.FieldByName('EXE_EMULADOR').AsString );
      end
      else if (qry_param.FieldByName('TP_EMULADOR').AsString = 'IWW 4.0') then begin
          datm_dse.ByHLLAPI.HLLAPIKind := hkIWW4;
          datm_dse.ByHLLAPI.DllName    := 'WHLLAPI.DLL';
          datm_dse.ByHLLAPI.DllPath    := ExtractFileDir( qry_param.FieldByName('EXE_EMULADOR').AsString );
      end
      else if (qry_param.FieldByName('TP_EMULADOR').AsString = 'WEB') then begin
          datm_dse.ByHLLAPI.HLLAPIKind := hkWEB;
          datm_dse.ByHLLAPI.DllName    := 'EHLAPI32.DLL';
          datm_dse.ByHLLAPI.DllPath    := 'C:\Arquivos de programas\IBM\EHLLAPI';
      end;
      datm_dse.ByHLLAPI.ExePath    := ExtractFileDir( Application.ExeName );
      datm_dse.ByHLLAPI.ExeName    := 'BySrv16.EXE';
      try
         datm_dse.ByHLLAPI.TimeOut := ( TempoEsperaEmulador * 1000 );
         datm_dse.ByHLLAPI.CarregaDLL;
         datm_dse.ByHLLAPI.ResetaConectaPS( qry_param.FieldByName('TX_NOME_SESSION').AsString );
         TransmiteProcessosDSE(  vCpfUsuario );
         datm_dse.ByHLLAPI.DesconectaPS;
         datm_dse.ByHLLAPI.DescarregaDLL;
      except
      end;
      qry_empresa.Close;
      qry_empresa.Free;
      qry_param.Close;
      qry_param.Free;
      qry_acesso.Close;
      qry_acesso.Free;
      datm_dde.qry_dde_envio.Close;
    except
      Result := False;
    end;
    Result := True;
end;




procedure TransmiteProcessosDDE( Usuario : String );
var
   Res, con_LinhaVol, TamLinhaMemo, y, i, v, j, escape : Integer;
   str_PesoBrutoTotal, str_ValorTotal, str_QtdeUnidadeMedida, str_QtdeUnidadeComerc, str_PesoLiquido,
   str_ValorMoeda, LinhaParaMemo,  LinhaMemoDoc, LinhaMemoInfo, strvalemb, vlrcom, fat, RC, enquadr,
   str_nr_dde, Tela1, Tela2, naladi, dadosexp, obsexp, PROCESSO : string;
   l_Retorna : Boolean;
   S : TStringList;
begin
  TamLinhaMemo := 240;
  l_Retorna := False;
  frm_dde.captura_telas.Clear;
  datm_dde.qry_dde_envio.First;
  while not datm_dde.qry_dde_envio.Eof do
  begin
    str_nr_dde := '';
    if (qry_param.FieldByName('TP_EMULADOR').AsString = 'PACKET') then
    begin
      PosicaoPalavra('PACKET','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 04, 01, 'RD' );
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      end;
    end;
    if not PosicionaTelaMapaBrasilDDE then
    begin
      AtualizaErroDDE(vProcesso, 'Não conectado Siscomex!' );
      datm_dde.qry_dde_envio.Next;
      Continue;
    end;
    escape := 0;
    PosicaoPalavra('REDESERPROBR','ENVDDE');
    while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
      Sleep(2000);
    PosicaoPalavra('REDESERPROBR','ENVDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 16, 12, vCpfUsuario );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 17, 12, vSenhaSiscomex );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 18, 12, 'SISCOMEX' );
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      PosicaoPalavra('SEN0500','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        AtualizaErroDDE(    vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
        datm_dde.ByHLLAPI_DDE.DesconectaPS;
        datm_dde.ByHLLAPI_DDE.DescarregaDLL;
        Exit;
      end;
      PosicaoPalavra('SEN0501','ENVRE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        AtualizaErroDDE(    vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
        datm_dde.ByHLLAPI_DDE.DesconectaPS;
        datm_dde.ByHLLAPI_DDE.DescarregaDLL;
        Exit;
      end;
      PosicaoPalavra('SEN0502','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        AtualizaErroDDE(    vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
        datm_dde.ByHLLAPI_DDE.DesconectaPS;
        datm_dde.ByHLLAPI_DDE.DescarregaDLL;
        Exit;
      end;
      PosicaoPalavra('SEN0507','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        AtualizaErroDDE(    vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
        datm_dde.ByHLLAPI_DDE.DesconectaPS;
        datm_dde.ByHLLAPI_DDE.DescarregaDLL;
        Exit;
      end;
    end;
    PosicaoPalavra('COLETAIMPRLOC','ENVDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      PosicaoPalavra('COLETAIMPRLOC','ENVDDE');
      while ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
      begin
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      end;
    end;
    PosicaoPalavra('POSICURSOR','ENVDDE');
    while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      PosicaoPalavra('COLETAIMPRLOC','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
        Break;
      PosicaoPalavra('SEN0551','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        AtualizaErroDDE(    vProcesso , 'SEN0551 - VOCE ESTA UTILIZANDO ESTE SISTEMA EM OUTRO TERMINAL.' );
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
        datm_dde.ByHLLAPI_DDE.DesconectaPS;
        datm_dde.ByHLLAPI_DDE.DescarregaDLL;
        Exit;
      end;
      Sleep(2000);
      PosicaoPalavra('POSICURSOR','ENVDDE');
    end;
    if l_Retorna then
    begin
      l_Retorna := False;
      Continue;
    end;
    PosicaoPalavra('COLETAIMPRLOC','ENVDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    end;
    PosicaoPalavra('POSICURSOR','ENVDDE');
    while ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EXPORT-EX' );
      while not ( datm_dde.ByHLLAPI_DDE.CopyPS2String( 22, 15, 9, Res) = 'EXPORT-EX' ) do
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EXPORT-EX' );
        Sleep(2000);
      end;
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );


      datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-1-DESP' );
      while not ( datm_dde.ByHLLAPI_DDE.CopyPS2String( 22, 15, 10, Res) = 'EEX-1-DESP' ) do
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-1-DESP' );
        Sleep(2000);
      end;
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-DESP01' );
      while not ( datm_dde.ByHLLAPI_DDE.CopyPS2String( 22, 15, 10, Res) = 'EEX-DESP01' ) do
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-DESP01' );
        Sleep(2000);
      end;
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      Break;
      Sleep(2000);
    end;
    PosicaoPalavra('EXISTEMNOTI','ENVDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 16, 41, 'N' );
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    end;
    PosicaoPalavra('EXPORTADOR','ENVDDE');
    while ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 8, 36, Copy(vCGCExportador,1,8) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 8, 47, Copy(vCGCExportador,9,4) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 8, 54, Copy(vCGCExportador,13,2) );

      i:=1;
      while i <= 25 do
      begin
        frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
        i:=i+1;
      end;
      Application.ProcessMessages;
      frm_dde.captura_telas.Lines.Add(' ');
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      PosicaoPalavra('VIATRANSP','ENVDDE');
      while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
      end;
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 9, 36, datm_dde.qry_dde_envio.FieldByName('CD_VIA_TRANSPORTE').AsString );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 10, 61, Copy(FormatFloat('000000000000.00000'     , datm_dde.qry_dde_envio.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat),1,12) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 10, 76, Copy(FormatFloat('000000000000.00000'     , datm_dde.qry_dde_envio.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat),14,5) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 11, 59, Copy(FormatFloat('00000000000000.00000'     , datm_dde.qry_dde_envio.FieldByName('VL_TOTAL_PESO_BRUTO').AsFloat),1,14) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 11, 76, Copy(FormatFloat('00000000000000.00000'     , datm_dde.qry_dde_envio.FieldByName('VL_TOTAL_PESO_BRUTO').AsFloat),16,5) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 12, 58, Copy(FormatFloat('000000000000000.00'     , datm_dde.qry_dde_envio.FieldByName('VL_TOTAL_COND_VENDA').AsFloat),1,15) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 12, 76, Copy(FormatFloat('000000000000000.00'     , datm_dde.qry_dde_envio.FieldByName('VL_TOTAL_COND_VENDA').AsFloat),17,2) );
      PROCESSO := datm_dde.qry_dde_envio.FieldByName('NR_SD').AsString;
      y := 16;
      datm_dde.qry_dde_re_envio.First;
      while not datm_dde.qry_dde_re_envio.Eof do
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 12, Copy(datm_dde.qry_dde_re_envio.FieldByName('NR_RE_SISCOMEX').AsString,1,2) );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 17, Copy(datm_dde.qry_dde_re_envio.FieldByName('NR_RE_SISCOMEX').AsString,4,7) );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 27, FormatFloat('000', datm_dde.qry_dde_re_envio.FieldByName('NR_ANEXO_INICIAL').AsInteger) );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 33, FormatFloat('000', datm_dde.qry_dde_re_envio.FieldByName('NR_ANEXO_FINAL').AsInteger) );
        datm_dde.qry_dde_re_envio.Next;
        y := y + 1;
        if y = 22 then
        begin
          Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
          Res := datm_dde.ByHLLAPI_DDE.Wait( True );
          y := 17;
        end;
      end;
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      PosicaoPalavra('JAUTIL','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 19, 64, 'S' );
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
        i:=1;
        while i <= 25 do
        begin
          frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
        Application.ProcessMessages;
        frm_dde.captura_telas.Lines.Add(' ');
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
        PosicaoPalavra('REDE','ENVDDE');
        while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
        begin
          Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
          Res := datm_dde.ByHLLAPI_DDE.Wait( True );
          Sleep(2000);
        end;
      end;
      PosicaoPalavra('CONFIRMA','ENVDDE');
      while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
      end;
      PosicaoPalavra('CONFIRMA','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 24, 'S' );
        i:=1;
        while i <= 25 do
        begin
          frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
        Application.ProcessMessages;
        frm_dde.captura_telas.Lines.Add(' ');
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      end;
      i:=1;
      while i <= 25 do
      begin
        frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
        i:=i+1;
      end;
      Application.ProcessMessages;
      frm_dde.captura_telas.Lines.Add(' ');
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      PosicaoPalavra('NRDESP','ENVDDE');
      while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
      end;
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 8, 79, FormatFloat('00', datm_dde.qry_dde_envio.FieldByName('QT_ESTAB_DESPACHO').AsFloat) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 9, 55, Copy(FormatMaskText('aaaaaaaaaa', datm_dde.qry_dde_envio.FieldByName('TX_LOCAL_NAO_ALFANDEG').AsString),1,9) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 9, 67, Copy(FormatMaskText('aaaaaaaaaa', datm_dde.qry_dde_envio.FieldByName('TX_LOCAL_NAO_ALFANDEG').AsString),10,1) );
      if datm_dde.qry_dde_envio.FieldByName('CD_VIA_TRANSPORTE').AsString = '01' then
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 10, 43, Copy(ConsultaLookUp('TEMBARCACAO','CD_EMBARCACAO',ConsultaLookUp('TPROCESSO','NR_PROCESSO',PROCESSO,'CD_EMBARCACAO'),'NM_EMBARCACAO'),1,24) )
      else datm_dde.ByHLLAPI_DDE.CopyString2PS( 10, 43, StringReplace(StringReplace(ConsultaLookUp('TPROCESSO','NR_PROCESSO',PROCESSO,'NR_CONHECIMENTO_MASTER') + '/' + ConsultaLookUp('TPROCESSO','NR_PROCESSO',PROCESSO,'NR_CONHECIMENTO'),' ','',[rfReplaceAll]),'-','',[rfReplaceAll]) );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 11, 47, IIF(datm_dde.qry_dde_envio.FieldByName('IN_INF_DESP_CARGA_FRACIONADA').AsString = '1','S','N') );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 11, 72, IIF(datm_dde.qry_dde_envio.FieldByName('IN_INF_DESPACHO_POSTERIOR').AsString = '1','S','N') );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 12, 79, 'N' );
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 14, 19, datm_dde.qry_dde_envio.FieldByName('QT_TOTAL_VOLUMES').AsString );
      i := 16;
      datm_dde.qry_dde_espec_envio.First;
      while not datm_dde.qry_dde_espec_envio.Eof do
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( i, 8, datm_dde.qry_dde_espec_envio.FieldByName('CD_ESPECIE').AsString );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( i, 20, FormatFloat('00000'     , datm_dde.qry_dde_espec_envio.FieldByName('QT_ESPECIE').AsFloat) );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( i, 38, datm_dde.qry_dde_espec_envio.FieldByName('TX_MARCACAO_VOLUME').AsString );
        datm_dde.qry_dde_espec_envio.Next;
        i := i + 1;
      end;
      str_nr_dde := datm_dde.ByHLLAPI_DDE.CopyPS2String( 05, 18, 12, Res);
      i:=1;
      while i <= 25 do
      begin
        frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
        i:=i+1;
      end;
      Application.ProcessMessages;
      frm_dde.captura_telas.Lines.Add(' ');
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      PosicaoPalavra('NFISCAIS','ENVDDE');
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 12, 21, Copy(datm_dde.qry_dde_estab_envio.FieldByName('NR_SUFIXO_CGC').AsString,1,4) );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 12, 28, Copy(datm_dde.qry_dde_estab_envio.FieldByName('NR_SUFIXO_CGC').AsString,5,2) );
        y := 12;
        datm_dde.qry_dde_nf_envio.First;
        while not datm_dde.qry_dde_nf_envio.Eof do
        begin
          datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 50, datm_dde.qry_dde_nf_envio.FieldByName('NR_NF_INICIAL').AsString );
          datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 61, Copy(datm_dde.qry_dde_nf_envio.FieldByName('NR_SERIE_NF').AsString,1,2) );
          if datm_dde.qry_dde_nf_envio.FieldByName('NR_NF_FINAL').AsString <> '' then
          begin
            datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 68, datm_dde.qry_dde_nf_envio.FieldByName('NR_NF_FINAL').AsString );
            datm_dde.ByHLLAPI_DDE.CopyString2PS( y, 79, Copy(datm_dde.qry_dde_nf_envio.FieldByName('NR_SERIE_NF').AsString,1,2) );
          end;
          datm_dde.qry_dde_nf_envio.Next;
          y := y + 1;
          if y = 22 then
          begin
            Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
            Res := datm_dde.ByHLLAPI_DDE.Wait( True );
            y := 13;
          end;
        end;
        i:=1;
        while i <= 25 do
        begin
          frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
        Application.ProcessMessages;
        frm_dde.captura_telas.Lines.Add(' ');
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      end;
      break;
    end;
    // grava na tabela
    datm_dde.qry_dde.First;
    datm_dde.qry_dde.Locate('NR_SD', PROCESSO ,[]);
    datm_dde.qry_dde.Edit;
    datm_dde.qry_dde.FieldByName('NR_REGISTRO_SD').AsString := str_nr_dde;
    datm_dde.qry_dde.FieldByName('DT_DATA_SD').AsDateTime   := now;
    datm_dde.qry_dde.FieldByName('CPF_USUARIO').AsString    := vCpfUsuario;
    datm_dde.qry_dde.Post;
    datm_dde.qry_dde.Close;
    datm_dde.qry_dde.Open;
    datm_dde.qry_dde.Locate('NR_SD', PROCESSO ,[]);

    {// update na TPROCESSO - manutenção do processso
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TPROCESSO');
      SQL.Add('   SET NR_DDE         = ''' + StringReplace(str_nr_dde, '/', '', []) + ''',');
      SQL.Add('       DT_REG_DDE     = :DATA, ');
      SQL.Add('       CD_DESPACHANTE = ''' + ConsultaLookUp('TDESPACHANTE','CPF_DESPACHANTE',vCpfUsuario,'CD_DESPACHANTE') + '''');
      SQL.Add(' WHERE NR_PROCESSO    = ''' + PROCESSO + '''');
      ParamByName('DATA').AsDateTime := datm_dde.qry_dde.FieldByName('DT_DATA_SD').AsDateTime;
    try
      ExecSQL;
    except
      on E: Exception do
      TrataErro(E);
    end;
      Free;
    end;} // Comentado - Atualiza só no evento AfterPost de datm_dde.qry_dde - Michel - 13/11/2008

    // sai do siscomex
    PosicaoPalavra('REDE','ENVDDE');
    while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
      Sleep(2000);
    end;
    Sleep(2000);
    frm_dde.captura_telas.Clear;
    datm_dde.qry_dde_envio.Next
  end;
end;

function MontaLinhaMemo( pS: TStringList; pTamLinhaMemo: integer ):String;
var
  MemoRetorno : string;
  j : integer;
begin
  MemoRetorno := '';
  for j := 0 to ( pS.Count - 1 ) do  begin
     MemoRetorno := MemoRetorno + pS.Strings[ j ];
     if Length( MemoRetorno ) >= pTamLinhaMemo then begin
        MemoRetorno := copy( MemoRetorno, 1, pTamLinhaMemo );
        break;
     end;
  end;
  if Length( MemoRetorno ) < pTamLinhaMemo then begin
     MemoRetorno := MemoRetorno + Replicate( ' ', 240 - Length( MemoRetorno ) );
  end;
  result := MemoRetorno;
end;


{DSE - TransmiteProcessosDSE --------------------------------------------------}
procedure TransmiteProcessosDSE( Usuario : String );
var
   Res                   ,
   con_LinhaVol          ,
   TamLinhaMemo          : Integer;
   str_nr_dse            ,
   str_PesoBrutoTotal    ,
   str_ValorTotal        ,
   str_QtdeUnidadeMedida ,
   str_QtdeUnidadeComerc ,
   str_PesoLiquido       ,
   str_ValorMoeda        ,
   str_NumeroDSESiscomex ,
   str_DataDSESiscomex   ,
   LinhaParaMemo         ,
   LinhaMemoDoc          ,
   LinhaMemoInfo         : String;
   l_Retorna             : Boolean;
   S                     ,
   MEM_DocInstrutivos    ,
   MEM_InformacoesCompl  : TStringList;

begin

   TamLinhaMemo         := 240;
   MEM_DocInstrutivos	:= TStringList.Create;
   MEM_InformacoesCompl := TStringList.Create;
   S                    := TStringList.Create;
   datm_dse.qry_trans_DSE.Close;
   datm_dse.qry_trans_DSE.ParamByName('NR_PROCESSO').AsString := vProcesso;
   datm_dse.qry_trans_DSE.Open;
   l_Retorna := False;

   while not datm_dse.qry_trans_DSE.Eof do begin
         str_nr_dse := datm_dse.qry_trans_DSE.FieldByName('NR_DSE').AsString;

         if not PosicionaTelaMapaBrasilDSE then begin
            AtualizaErroDSE( str_nr_dse, 'Não conectado Siscomex!' );
            datm_dse.qry_trans_DSE.Next;
            Continue;
         end;
         str_NumeroDSESiscomex := '';
         str_DataDSESiscomex   := '';

         PosicaoPalavra('REDESERPROBR','ENVDSE');
         while not ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
           Sleep(2000);
         end;

         datm_dse.ByHLLAPI.CopyString2PS( 16, 12, vCPFUsuario    );
         datm_dse.ByHLLAPI.CopyString2PS( 17, 12, vSenhaSiscomex );
         datm_dse.ByHLLAPI.CopyString2PS( 18, 12, 'SISCOMEX'     );

         Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
         Res := datm_dse.ByHLLAPI.Wait( True );


         PosicaoPalavra('SEN0500','ENVDSE');
         if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
         begin
           AtualizaErroDSE(    vProcesso , datm_dse.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
           datm_dse.qry_trans_DSE.Next;
           Continue;
         end;
         PosicaoPalavra('SEN0501','ENVDSE');
         if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
         begin
           AtualizaErroDSE(    vProcesso , datm_dse.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
           datm_dse.qry_trans_DSE.Next;
           Continue;
         end;
         PosicaoPalavra('SEN0502','ENVDSE');
         if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
         begin
           AtualizaErroDSE(    vProcesso , datm_dse.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
           datm_dse.qry_trans_DSE.Next;
           Continue;
         end;
         PosicaoPalavra('SEN0507','ENVDSE');
         if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
         begin
           AtualizaErroDSE(    vProcesso , datm_dse.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
           datm_dse.qry_trans_DSE.Next;
           Continue;
         end;
         PosicaoPalavra('SEN0540','ENVDSE');
         if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
         begin
           AtualizaErroDSE(    vProcesso , datm_dse.ByHLLAPI.CopyPS2String( 23, 2, 75, Res) );
           datm_dse.qry_trans_DSE.Next;
           Continue;
         end;

         PosicaoPalavra('POSICURSOR','ENVDSE');
         while not ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
              PosicaoPalavra('COLETAIMPRLOC','ENVDSE');
              if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 Break;
              end;
              PosicaoPalavra('SEN0551','ENVDSE');
              if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 AtualizaErroDSE(  vProcesso , 'SEN0551 - VOCE ESTA UTILIZANDO ESTE SISTEMA EM OUTRO TERMINAL.' );
                 Res := datm_dse.ByHLLAPI.SendKey( C_PF3, True );
                 Res := datm_dse.ByHLLAPI.Wait( True );
                 datm_dse.qry_trans_DSE.Next;
                 l_Retorna := True;
                 Break;
              end;
              Sleep(2000);
              PosicaoPalavra('POSICURSOR','ENVDSE');
         end;

         if l_Retorna  then begin
            l_Retorna := False;
            Continue;
         end;

         PosicaoPalavra('COLETAIMPRLOC','ENVDSE');
         if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
            Res := datm_dse.ByHLLAPI.SendKey( C_PF3, True );
            Res := datm_dse.ByHLLAPI.Wait( True );
         end;

         PosicaoPalavra('POSICURSOR','ENVDSE');
         while ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
               datm_dse.ByHLLAPI.CopyString2PS( 22, 15, 'DSE' );
               while not( datm_dse.ByHLLAPI.CopyPS2String( 22, 15, 3, Res) = 'DSE' ) do begin
                     datm_dse.ByHLLAPI.CopyString2PS( 22, 15, 'DSE' );
               Sleep(2000);
               end;
               Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
               Res := datm_dse.ByHLLAPI.Wait( True );
               Break;
               Sleep(2000);
               PosicaoPalavra('POSICURSOR','ENVDSE');
         end;

         PosicaoPalavra('EXISTEMNOTI','ENVDSE');
         if (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
            datm_dse.ByHLLAPI.CopyString2PS( 16, 41, 'N' );
            Res := datm_dse.ByHLLAPI.SendKey( C_PF3, True );
            Res := datm_dse.ByHLLAPI.Wait( True );
         end;

         PosicaoPalavra('SISCOMEXDSE','ENVDSE');
         if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
              datm_dse.ByHLLAPI.CopyString2PS( 22, 15, 'DSE1' );
              while not( datm_dse.ByHLLAPI.CopyPS2String( 22, 15, 4, Res) = 'DSE1' ) do begin
                    datm_dse.ByHLLAPI.CopyString2PS( 22, 15, 'DSE1' );
              end;
              Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
              Res := datm_dse.ByHLLAPI.Wait( True );
         end;

         PosicaoPalavra('SISCOMEXDSE1','ENVDSE');
         if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
              datm_dse.ByHLLAPI.CopyString2PS( 22, 15, 'DSE11' );
              while not( datm_dse.ByHLLAPI.CopyPS2String( 22, 15, 5, Res) = 'DSE11' ) do begin
                    datm_dse.ByHLLAPI.CopyString2PS( 22, 15, 'DSE11' );
              end;
              Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
              Res := datm_dse.ByHLLAPI.Wait( True );
         end;

         PosicaoPalavra('TIPOEXPORTADOR','ENVDSE');
         if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
              datm_dse.ByHLLAPI.CopyString2PS(  7, 28, datm_dse.qry_trans_DSE.FieldByName('TP_EXPORTADOR').AsString   );
              datm_dse.ByHLLAPI.CopyString2PS(  7, 68, datm_dse.qry_trans_DSE.FieldByName('CD_NATUREZA').AsString     );
              datm_dse.ByHLLAPI.CopyString2PS(  9, 28, datm_dse.qry_trans_DSE.FieldByName('CD_URF_DESPACHO').AsString );
              datm_dse.ByHLLAPI.CopyString2PS(  9, 68, datm_dse.qry_trans_DSE.FieldByName('CD_URF_EMBARQUE').AsString );
              datm_dse.ByHLLAPI.CopyString2PS( 11, 44, datm_dse.qry_trans_DSE.FieldByName('IN_CARGA_ARMAZ').AsString  );
              datm_dse.ByHLLAPI.CopyString2PS( 11, 76, datm_dse.qry_trans_DSE.FieldByName('TP_COURRIER').AsString     );
              Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
              Res := datm_dse.ByHLLAPI.Wait( True );

              PosicaoPalavra('ESPACOBRANCO','ENVDSE');
              if  NOT (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 AtualizaErroDSE( vProcesso , datm_dse.ByHLLAPI.CopyPS2String( 1, 2, 70, Res) );
                 datm_dse.qry_trans_DSE.Next;
                 Continue;
              end;

              {Para Tipo = Courrier -------------------------------------------}
              if datm_dse.qry_trans_DSE.FieldByName('TP_COURRIER').AsString  = 'C' then begin
                 datm_dse.ByHLLAPI.CopyString2PS( 19, 43, Copy( datm_dse.qry_trans_DSE.FieldByName('CD_CNPJ_COURRIER').AsString,  1, 8 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 19, 54, Copy( datm_dse.qry_trans_DSE.FieldByName('CD_CNPJ_COURRIER').AsString,  9, 4 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 19, 61, Copy( datm_dse.qry_trans_DSE.FieldByName('CD_CNPJ_COURRIER').AsString, 13, 2 ) );
                 Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                 Res := datm_dse.ByHLLAPI.Wait( True );
                 PosicaoPalavra('SE1534','ENVDSE');
                 if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                      AtualizaErroDSE( vProcesso, 'SE1534 - CNPJ COURIER NÃO INFORMADO' );
                      datm_dse.qry_trans_DSE.Next;
                      Continue;
                 end;
                 PosicaoPalavra('SE1572','ENVDSE');
                 if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                     AtualizaErroDSE( vProcesso, 'SE1572 - NAO EXISTE A REPRESENTACAO [COURIER]' );
                     datm_dse.qry_trans_DSE.Next;
                     Continue;
                 end;
                 PosicaoPalavra('SE1508','ENVDSE');
                 if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                     AtualizaErroDSE( vProcesso, 'SE1508 - CNPJ COURIER INVALIDO' );
                     datm_dse.qry_trans_DSE.Next;
                     Continue;
                 end;
              end;

              {Para Tipo = Postal ---------------------------------------------}

              if datm_dse.qry_trans_DSE.FieldByName('TP_COURRIER').AsString  = 'P' then begin
                 datm_dse.ByHLLAPI.CopyString2PS( 19, 43, Copy( datm_dse.qry_trans_DSE.FieldByName('CD_CNPJ_COURRIER').AsString,  1, 8 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 19, 54, Copy( datm_dse.qry_trans_DSE.FieldByName('CD_CNPJ_COURRIER').AsString,  9, 4 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 19, 61, Copy( datm_dse.qry_trans_DSE.FieldByName('CD_CNPJ_COURRIER').AsString, 13, 2 ) );
                 Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                 Res := datm_dse.ByHLLAPI.Wait( True );

                 PosicaoPalavra('SE1534','ENVDSE');
                 if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                      AtualizaErroDSE( vProcesso, 'SE1534 - CNPJ POSTAL NÃO INFORMADO' );
                      datm_dse.qry_trans_DSE.Next;
                      Continue;
                 end;

                 PosicaoPalavra('SE1572','ENVDSE');
                 if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                     AtualizaErroDSE( vProcesso, 'SE1572 - NAO EXISTE A REPRESENTACAO [POSTAL]' );
                     datm_dse.qry_trans_DSE.Next;
                     Continue;
                 end;

                 PosicaoPalavra('SE1508','ENVDSE');
                 if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                     AtualizaErroDSE( vProcesso, 'SE1508 - CNPJ POSTAL INVALIDO' );
                     datm_dse.qry_trans_DSE.Next;
                     Continue;
                 end;
              end;

              PosicaoPalavra('IDEXPORTADOR','ENVDSE');
              if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                  datm_dse.ByHLLAPI.CopyString2PS( 16, 14, Copy( datm_dse.qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString, 1, 8 ) );
                  datm_dse.ByHLLAPI.CopyString2PS( 16, 25, Copy( datm_dse.qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString, 9, 4 ) );
                  datm_dse.ByHLLAPI.CopyString2PS( 16, 32, Copy( datm_dse.qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString, 13, 2 ) );
                  while not( datm_dse.ByHLLAPI.CopyPS2String( 16, 14, 8, Res ) = Copy( datm_dse.qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString, 1, 8 ) ) do begin
                        datm_dse.ByHLLAPI.CopyString2PS( 16, 14, Copy( datm_dse.qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString, 1, 8 ) );
                        datm_dse.ByHLLAPI.CopyString2PS( 16, 25, Copy( datm_dse.qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString, 9, 4 ) );
                        datm_dse.ByHLLAPI.CopyString2PS( 16, 32, Copy( datm_dse.qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString, 13, 2 ) );
                  end;
                  Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                  Res := datm_dse.ByHLLAPI.Wait( True );
                  if datm_dse.ByHLLAPI.ScrComp( 1, 2, 'SE1508 - CNPJ INVALIDO' ) then begin
                     AtualizaErroDSE( vProcesso, 'SE1508 - CNPJ EXPORTADOR INVALIDO' );
                     datm_dse.qry_trans_DSE.Next;
                     Continue;
                  end;
              end;

              datm_dse.ByHLLAPI.CopyString2PS( 14, 28, datm_dse.qry_trans_DSE.FieldByName('CD_PAIS_FINAL').AsString );
              if datm_dse.qry_trans_DSE.FieldByName('TP_COURRIER').AsString <> 'C' then begin
                 datm_dse.ByHLLAPI.CopyString2PS( 14, 73, datm_dse.qry_trans_DSE.FieldByName('CD_VIA_TRANSPORTE').AsString );
              end;
              datm_dse.ByHLLAPI.CopyString2PS( 15, 45, datm_dse.qry_trans_DSE.FieldByName('CD_IDENT_VEICULO').AsString );
              str_PesoBrutoTotal := FormatFloat( '00000000000000.00000', datm_dse.qry_trans_DSE.FieldByName('VL_PESO_BRUTO').AsFloat );
              datm_dse.ByHLLAPI.CopyString2PS( 16, 40, Copy( str_PesoBrutoTotal, 1, 14 ) );
              datm_dse.ByHLLAPI.CopyString2PS( 16, 57, Copy( str_PesoBrutoTotal, 16, 5 ) );

              PosicaoPalavra('PRAZOEXPTEMP','ENVDSE');
              if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 datm_dse.ByHLLAPI.CopyString2PS( 17, 40, datm_dse.qry_trans_DSE.FieldByName('LI_DIAS').AsString );
              end;
              datm_dse.ByHLLAPI.CopyString2PS( 18, 35, datm_dse.qry_trans_DSE.FieldByName('CD_MOEDA').AsString );
              str_ValorTotal := FormatFloat( '000000000000000.00', datm_dse.qry_trans_DSE.FieldByName('VL_TOTAL_MOEDA').AsFloat );
              datm_dse.ByHLLAPI.CopyString2PS( 19, 50, Copy( str_ValorTotal, 1, 15 ) );
              datm_dse.ByHLLAPI.CopyString2PS( 19, 68, Copy( str_ValorTotal, 17, 2 ) );
              Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
              Res := datm_dse.ByHLLAPI.Wait( True );

              PosicaoPalavra('ESPACOBRANCO','ENVDSE');
              if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, '          ' ) ) then begin
                 Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                 Res := datm_dse.ByHLLAPI.Wait( True );
              end
              else begin
                 AtualizaErroDSE( vProcesso, datm_dse.ByHLLAPI.CopyPS2String( 1, 2, 70, Res) );
                 l_Retorna := True;
                 datm_dse.qry_trans_DSE.Next;
              end;
       end;

       if l_Retorna  then begin
          l_Retorna := False;
          Continue;
       end;


       PosicaoPalavra('VOLUMES','ENVDSE');
       if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
          datm_dse.qry_dse_volume.First;
          datm_dse.ByHLLAPI.CopyString2PS( 7, 21, FormatFloat( '00000000', datm_dse.qry_trans_DSE.FieldByName('VL_QTD_TOTAL').AsFloat ) );
          while not( datm_dse.ByHLLAPI.CopyPS2String( 7, 21, 8, Res ) = FormatFloat( '00000000', datm_dse.qry_trans_DSE.FieldByName('VL_QTD_TOTAL').AsFloat ) ) do begin
                datm_dse.ByHLLAPI.CopyString2PS( 7, 21, FormatFloat( '00000000', datm_dse.qry_trans_DSE.FieldByName('VL_QTD_TOTAL').AsFloat ) );
          end;
          con_LinhaVol := 8;
          while ( not ( datm_dse.qry_dse_volume.Eof ) ) and ( con_LinhaVol <= 22 ) do begin
                Inc( con_LinhaVol );
                datm_dse.ByHLLAPI.CopyString2PS( con_LinhaVol, 10, datm_dse.qry_dse_volume.FieldByName('CD_ESPECIE').AsString );
                datm_dse.ByHLLAPI.CopyString2PS( con_LinhaVol, 18, FormatFloat( '00000', datm_dse.qry_dse_volume.FieldByName('VL_QUANTIDADE').AsFloat ) );
                datm_dse.ByHLLAPI.CopyString2PS( con_LinhaVol, 28, Copy( Trim( datm_dse.qry_dse_volume.FieldByName('TX_MARCA').AsString ), 1, 50 ) );
                datm_dse.qry_dse_volume.Next;
          end;
          Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
          Res := datm_dse.ByHLLAPI.Wait( True );


          PosicaoPalavra('VOLUMES','ENVDSE');
          if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
              PosicaoPalavra('SE1638','ENVDSE');
              if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                  AtualizaErroDSE( vProcesso, 'SE1638 - INFORME CODIGO DE ESPECIE DE VOLUME' );
              end;
              datm_dse.qry_trans_DSE.Next;
              Continue;
          end;
       end;


       PosicaoPalavra('NRODIELETRONICA','ENVDSE');
       if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
           datm_dse.ByHLLAPI.CopyString2PS( 6, 40, Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DIE').AsString, 1, 2 ) );
           while not( datm_dse.ByHLLAPI.CopyPS2String( 6, 40, 2, Res ) =  Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DIE').AsString, 1, 2 ) ) do begin
                 datm_dse.ByHLLAPI.CopyString2PS( 6, 40, Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DIE').AsString, 1, 2 ) );
           end;
           datm_dse.ByHLLAPI.CopyString2PS(  6, 45, Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DIE'           ).AsString,  3, 7 ) );
           datm_dse.ByHLLAPI.CopyString2PS(  6, 55, Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DIE'           ).AsString, 10, 1 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 10, 40, Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DSIE'          ).AsString,  1, 2 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 10, 45, Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DSIE'          ).AsString,  3, 7 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 10, 55, Copy( datm_dse.qry_trans_DSE.FieldByName('NR_DSIE'          ).AsString, 10, 1 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 14, 40,       datm_dse.qry_trans_DSE.FieldByName('NR_DI'            ).AsString          );
           datm_dse.ByHLLAPI.CopyString2PS( 15, 40,       datm_dse.qry_trans_DSE.FieldByName('CD_UL_EMISSAO_DI' ).AsString          );
           datm_dse.ByHLLAPI.CopyString2PS( 16, 40, Copy( datm_dse.qry_trans_DSE.FieldByName('DT_EMISSAO_DI'    ).AsString,  1, 2 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 16, 45, Copy( datm_dse.qry_trans_DSE.FieldByName('DT_EMISSAO_DI'    ).AsString,  4, 2 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 16, 50, Copy( datm_dse.qry_trans_DSE.FieldByName('DT_EMISSAO_DI'    ).AsString,  7, 4 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 20, 40,       datm_dse.qry_trans_DSE.FieldByName('NR_DSI'           ).AsString          );
           datm_dse.ByHLLAPI.CopyString2PS( 21, 45,       datm_dse.qry_trans_DSE.FieldByName('CD_UL_EMISSAO_DSI').AsString          );
           datm_dse.ByHLLAPI.CopyString2PS( 22, 40, Copy( datm_dse.qry_trans_DSE.FieldByName('DT_EMISSAO_DSI'   ).AsString,  1, 2 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 22, 45, Copy( datm_dse.qry_trans_DSE.FieldByName('DT_EMISSAO_DSI'   ).AsString,  4, 2 ) );
           datm_dse.ByHLLAPI.CopyString2PS( 22, 50, Copy( datm_dse.qry_trans_DSE.FieldByName('DT_EMISSAO_DSI'   ).AsString,  7, 4 ) );
           Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
           Res := datm_dse.ByHLLAPI.Wait( True );

           PosicaoPalavra('SE1593','ENVDSE');
           if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
              AtualizaErroDSE( vProcesso, 'SE1593 - INFORME UMA DAS OPCOES' );
              datm_dse.qry_trans_DSE.Next;
              Continue;
           end;
       end;

       MEM_DocInstrutivos.Clear;
       MEM_InformacoesCompl.Clear;
       MEM_DocInstrutivos.Assign  ( TMemoField( datm_dse.qry_trans_DSE.FieldByName('TX_DOC_INSTRUTIVOS'  ) ) );
       MEM_InformacoesCompl.Assign( TMemoField( datm_dse.qry_trans_DSE.FieldByName('TX_INF_COMPLEMENTARES') ) );
       LinhaMemoDoc   := MontaLinhaMemo( MEM_DocInstrutivos   , TamLinhaMemo );
       LinhaMemoInfo  := MontaLinhaMemo( MEM_InformacoesCompl , TamLinhaMemo );


       while not datm_dse.qry_dse_item.Eof do begin

             PosicaoPalavra('CODIGONCM','ENVDSE');
             if  (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 datm_dse.ByHLLAPI.CopyString2PS( 7, 17, Copy( datm_dse.qry_dse_item.FieldByName('CD_NCM').AsString, 1, 8 ) );

                 while not( datm_dse.ByHLLAPI.CopyPS2String( 7, 17, 8, Res ) =  Copy( datm_dse.qry_dse_item.FieldByName('CD_NCM').AsString, 1, 8 ) ) do begin
                       datm_dse.ByHLLAPI.CopyString2PS( 7, 17, Copy( datm_dse.qry_dse_item.FieldByName('CD_NCM').AsString, 1, 8 ) );
                 end;
                 datm_dse.ByHLLAPI.CopyString2PS( 8, 19, datm_dse.qry_dse_item.FieldByName('CD_DESTAQUE_NCM').AsString );

                 str_QtdeUnidadeMedida := FormatFloat( '000000000000.00000', datm_dse.qry_dse_item.FieldByName('QT_UNID_MED_ESTATISTICA').AsFloat );
                 datm_dse.ByHLLAPI.CopyString2PS( 11, 38, Copy( str_QtdeUnidadeMedida, 1, 12 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 11, 53, Copy( str_QtdeUnidadeMedida, 14, 5 ) );

                 datm_dse.ByHLLAPI.CopyString2PS( 12, 38, Copy( Trim( datm_dse.qry_dse_item.FieldByName('LK_UNIDADE_MEDIDA').AsString ), 1, 20 ) );

                 str_QtdeUnidadeComerc := FormatFloat( '000000000000.00000', datm_dse.qry_dse_item.FieldByName('QT_COMERCIALIZADA').AsFloat );
                 datm_dse.ByHLLAPI.CopyString2PS( 13, 38, Copy( str_QtdeUnidadeComerc, 1, 12 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 13, 53, Copy( str_QtdeUnidadeComerc, 14, 5 ) );

                 str_PesoLiquido := FormatFloat( '000000000000.00000', datm_dse.qry_dse_item.FieldByName('VL_PESO_LIQUIDO').AsFloat );
                 datm_dse.ByHLLAPI.CopyString2PS( 14, 38, Copy( str_PesoLiquido, 1, 12 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 14, 53, Copy( str_PesoLiquido, 14, 5 ) );

                 str_ValorMoeda := FormatFloat( '000000000000000.00', datm_dse.qry_dse_item.FieldByName('VL_TOTAL_ITEM').AsFloat );
                 datm_dse.ByHLLAPI.CopyString2PS( 15, 38, Copy( str_ValorMoeda, 1, 15 ) );
                 datm_dse.ByHLLAPI.CopyString2PS( 15, 56, Copy( str_ValorMoeda, 17, 2 ) );

                 datm_dse.ByHLLAPI.CopyString2PS( 17, 5,  datm_dse.qry_dse_item.FieldByName('TX_DESC_MERCADORIA_L1').AsString );
                 datm_dse.ByHLLAPI.CopyString2PS( 18, 5,  datm_dse.qry_dse_item.FieldByName('TX_DESC_MERCADORIA_L2').AsString );
                 datm_dse.ByHLLAPI.CopyString2PS( 19, 5,  datm_dse.qry_dse_item.FieldByName('TX_DESC_MERCADORIA_L3').AsString );

                 Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                 Res := datm_dse.ByHLLAPI.Wait( True );
              end;


              PosicaoPalavra('ESPACOBRANCO','ENVDSE');
              if NOT ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 AtualizaErroDSE( vProcesso , datm_dse.ByHLLAPI.CopyPS2String( 1, 2, 70, Res) );
                 l_Retorna := True;
              end;
              if not ( l_Retorna ) then begin

              PosicaoPalavra('UNIDMEDNCM','ENVDSE');
              while not ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
              PosicaoPalavra('UNIDMEDNCM','ENVDSE');
              end;

              PosicaoPalavra('UNIDMEDNCM','ENVDSE');
              if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                 Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                 Res := datm_dse.ByHLLAPI.Wait( True );
              end;
              datm_dse.qry_dse_item.Next;

              if datm_dse.qry_dse_item.Eof then begin
                 Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                 Res := datm_dse.ByHLLAPI.Wait( True );

                 PosicaoPalavra('DOCINSTDSE','ENVDSE');
                 while NOT ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                 PosicaoPalavra('DOCINSTDSE','ENVDSE');
                 end;

                 PosicaoPalavra('DOCINSTDSE','ENVDSE');
                 if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                    datm_dse.ByHLLAPI.CopyString2PS( 8, 4, Copy( LinhaMemoDoc, 1, 75 ) );
                    datm_dse.ByHLLAPI.CopyString2PS( 9, 4, Copy( LinhaMemoDoc, 76, 75 ) );
                    datm_dse.ByHLLAPI.CopyString2PS( 10, 4, Copy( LinhaMemoDoc, 151, 75 ) );
                 end;

                 PosicaoPalavra('COMPLEMENTARES','ENVDSE');
                 if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                    datm_dse.ByHLLAPI.CopyString2PS( 14, 4, Copy( LinhaMemoInfo, 1, 75 ) );
                    datm_dse.ByHLLAPI.CopyString2PS( 15, 4, Copy( LinhaMemoInfo, 76, 75 ) );
                    datm_dse.ByHLLAPI.CopyString2PS( 16, 4, Copy( LinhaMemoInfo, 151, 75 ) );
                 end;

                 {EFETUA O REGISTRO IMEDIATO DA DSE - PADRÃO DEVE SER S        }
                 {PARA TESTAR - UTILIZAR 'N' ----------------------------------}
                 {-------------------------------------------------------------}
                 PosicaoPalavra('REGISTRADSE','ENVDSE');
                 if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                    datm_dse.ByHLLAPI.CopyString2PS( 18, 53, 'S' );
//                    datm_dse.ByHLLAPI.CopyString2PS( 18, 53, 'N' );
                    Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                    Res := datm_dse.ByHLLAPI.Wait( True );

                    PosicaoPalavra('CONFIRMA','ENVDSE');
                    while not ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                    PosicaoPalavra('CONFIRMA','ENVDSE');
                    end;

                    datm_dse.ByHLLAPI.CopyString2PS( 22, 25, 'S' );
                    while not( datm_dse.ByHLLAPI.CopyPS2String( 22, 25, 1, Res ) =  'S' ) do begin
                          datm_dse.ByHLLAPI.CopyString2PS( 22, 25, 'S' );
                    end;
                    Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                    Res := datm_dse.ByHLLAPI.Wait( True );

                    PosicaoPalavra('DSECONCLUIDA','ENVDSE');
                    while not ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
                          PosicaoPalavra('REINICIACONEXAO','ENVDSE');
                          if ( datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
                             l_Retorna := True;
                             Break;
                          end;
                    end;

                    if l_Retorna  then begin
                       l_Retorna := False;
                    end
                    else begin
                         str_NumeroDSESiscomex := datm_dse.ByHLLAPI.CopyPS2String( 5, 12, 12, Res );
                         str_DataDSESiscomex   := FormatDateTime('dd/mm/yyyy hh:nn:ss', NOW );
                         Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                         Res := datm_dse.ByHLLAPI.Wait( True );
                    end;
                 end;
              end;
           end;
           if l_Retorna then begin
                Break;
           end;
       end;
           if str_NumeroDSESiscomex <> '' then begin
              AtualizaDSE( vProcesso , str_NumeroDSESiscomex , str_DataDSESiscomex );
           end;
            datm_dse.qry_trans_DSE.Next;
      end;

      MEM_DocInstrutivos.Free;
      MEM_InformacoesCompl.Free;
      S.Free;
      PosicionaTelaMapaBrasilDSE;
end;

{Atualiza DSE -----------------------------------------------------------------}
procedure AtualizaDSE( Processo, NumeroDSE, DataRegistro: String );
begin
  try
    if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
    datm_main.db_broker.StartTransaction;
    CloseStoredProc(datm_dse.sp_atualiza_dse);
    datm_dse.sp_atualiza_dse.ParamByName('@NR_PROCESSO').AsString := Processo;
    datm_dse.sp_atualiza_dse.ParamByName('@NR_DSE').AsString      := NumeroDSE;
    datm_dse.sp_atualiza_dse.ParamByName('@DT_REGISTRO').AsString := DataRegistro;
    ExecStoredProc(datm_dse.sp_atualiza_dse);
    CloseStoredProc(datm_dse.sp_atualiza_dse);
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    TrataErro(E);
    end;
  end;
end;

function ConsultaDDE(const pFileName, pCodigoUsuario : String) : Boolean;
var
  F : TextFile;
  i, j : integer;
  vProcesso, DataHora1, DataHora2 : String;
  Tempo : Double;
  DataHoraLoop : TDateTime;
  CurrWnd: hWnd;
  pi: TProcessInformation;
  si: TStartupInfo;
  Emulador : THandle;
begin
  try
    PausarMySenhas;
    qry_param := TQuery.Create(application);
    qry_param.DatabaseName := 'DBBROKER';
    qry_param.SQL.Clear;
    qry_param.SQL.Add('SELECT TP_EMULADOR, TIME_WAIT_EMULADOR, EXE_EMULADOR, PARAM_EMULADOR, TX_NOME_SESSION FROM TPARAMETROS');
    qry_param.Open;
    qry_acesso := TQuery.Create(application);
    qry_acesso.DatabaseName := 'DBBROKER';
    qry_acesso.SQL.Clear;

    { comentado por carlos (17/09/2009) - tabela TACESSO_SCX_EXP substituida pela view VW_DESPACHANTE_CLIENTE }
    if pCodigoUsuario <> '' then
      qry_acesso.SQL.Add('SELECT distinct CD_SENHA_SCX, CPF_USUARIO,  CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CD_ACESSO = "' + pCodigoUsuario + '"')
    else
      qry_acesso.SQL.Add('SELECT distinct CD_SENHA_SCX, CPF_USUARIO,  CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CPF_USUARIO = "' + Trim(datm_dde.qry_dde.FieldByName('CPF_USUARIO').AsString) + '"');


    qry_acesso.Open;
    if FindWindow(nil,'TN3270') = 0 then
      WinExec('C:\IWWTCPIP\EMU.EXE SESSIONA.EMU',SHOW_OPENWINDOW);



    vSenhaSiscomex    := qry_acesso.FieldByName('CD_SENHA_SCX').AsString;
    vCpfUsuario       := qry_acesso.FieldByName('CPF_USUARIO').AsString;
    vCPFRepresentante := qry_acesso.FieldByName('CNPJ_REPRES').AsString;
    vProcesso := datm_dde.qry_dde.FieldByName('NR_SD').AsString;
    // gerando a linha da capa
    qry_empresa := TQuery.Create(application);
    qry_empresa.DatabaseName := 'DBBROKER';
    qry_empresa.SQL.Clear;
    qry_empresa.SQL.Add('SELECT CGC_EMPRESA, CPF_EMPRESA, CD_TIPO_PESSOA FROM TEMPRESA_NAC');
    qry_empresa.SQL.Add('WHERE CD_EMPRESA = ''' + datm_dde.qry_dde.FieldByName('CD_EXPORTADOR').AsString + '''');
    qry_empresa.Open;
    if (qry_empresa.FieldByName('CD_TIPO_PESSOA').AsString = '1') then
      vCGCExportador := qry_empresa.FieldByName('CGC_EMPRESA').AsString
    else
      vCGCExportador := qry_empresa.FieldByName('CPF_EMPRESA').AsString;
    Sleep(3000);
    TempoEsperaEmulador := qry_param.FieldByName('TIME_WAIT_EMULADOR').AsInteger;
    li_timeout := TempoEsperaEmulador;
    datm_dde.ByHLLAPI_DDE.ExePath := ExtractFileDir( Application.ExeName );
    datm_dde.ByHLLAPI_DDE.ExeName := 'BySrv16.EXE';
    datm_dde.ByHLLAPI_DDE.TimeOut := ( TempoEsperaEmulador * 1000 );
    try
      datm_dde.ByHLLAPI_DDE.DescarregaDLL;  //by Carlos 08/07/2010
      Sleep(3000);
      datm_dde.ByHLLAPI_DDE.CarregaDLL;
      datm_dde.ByHLLAPI_DDE.ResetaConectaPS( qry_param.FieldByName('TX_NOME_SESSION').AsString );
      //
      ConsultaProcessosDDE( vCpfUsuario );
    finally
      try
//        datm_dde.ByHLLAPI_DDE.DesconectaPS;
        datm_dde.ByHLLAPI_DDE.DescarregaDLL;
      except
      end;
    end;
    qry_empresa.Close;
    qry_empresa.Free;
    qry_param.Close;
    qry_param.Free;
    qry_acesso.Close;
    qry_acesso.Free;
    Result := True;
  except
    Result := False;
  end;
  ContinuarMySenhas;

  Application.BringToFront; //usar outro metodo para selecionar a aplicação e assim evitar que o showmessage de alerta fique por tras do emulador
end;

procedure ConsultaProcessosDDE( Usuario : String );
var
  H:HWnd;
  F : TextFile;
  vTipo1ou2, l_Retorna, vPresenca : Boolean;
  y, i, v, j, escape, Res, con_LinhaVol, TamLinhaMemo : Integer;
  str_PesoBrutoTotal, str_ValorTotal, str_QtdeUnidadeMedida, str_QtdeUnidadeComerc, str_PesoLiquido,
  Tela1, Tela2, naladi, dadosexp, obsexp, strvalemb, vlrcom, fat, RC, enquadr, str_nr_dde, PROCESSO,
  posicao, vFileName, vAux, vSituacao, str_ValorMoeda, LinhaParaMemo, LinhaMemoDoc, LinhaMemoInfo : String;
  vList, S : TStringList;
begin
  TamLinhaMemo := 240;
  l_Retorna := False;
  frm_dde.captura_telas.Clear;
  str_nr_dde := '';
  if (qry_param.FieldByName('TP_EMULADOR').AsString = 'PACKET') then
  begin
    PosicaoPalavra('PACKET','CONDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 04, 01, 'RD' );
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    end;
  end;
  if not PosicionaTelaMapaBrasilDDE then
    AtualizaErroDDE( vProcesso , 'Não conectado Siscomex!' );
  escape := 0;
  PosicaoPalavra('REDESERPROBR','CONDDE');
  while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    Sleep(2000);
  PosicaoPalavra('REDESERPROBR','CONDDE');
  if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 16, 12, vCpfUsuario );
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 17, 12, vSenhaSiscomex );
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 18, 12, 'SISCOMEX' );
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    PosicaoPalavra('SEN0500','CONDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      AtualizaErroDDE( vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
//      datm_dde.ByHLLAPI_DDE.DesconectaPS;
      datm_dde.ByHLLAPI_DDE.DescarregaDLL;
      Exit;
    end;
    PosicaoPalavra('SEN0501','CONDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      AtualizaErroDDE( vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
//      datm_dde.ByHLLAPI_DDE.DesconectaPS;
      datm_dde.ByHLLAPI_DDE.DescarregaDLL;
      Exit;
    end;
    PosicaoPalavra('SEN0502','CONDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      AtualizaErroDDE( vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
//      datm_dde.ByHLLAPI_DDE.DesconectaPS;
      datm_dde.ByHLLAPI_DDE.DescarregaDLL;
      Exit;
    end;
    PosicaoPalavra('SEN0507','CONDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      AtualizaErroDDE( vProcesso , datm_dde.ByHLLAPI_DDE.CopyPS2String( 23, 2, 75, Res) );
//      datm_dde.ByHLLAPI_DDE.DesconectaPS;
      datm_dde.ByHLLAPI_DDE.DescarregaDLL;
      Exit;
    end;
  end;
  PosicaoPalavra('COLETAIMPRLOC','CONDDE');
  if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    PosicaoPalavra('COLETAIMPRLOC','CONDDE');
    while ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
    begin
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    end;
  end;
  PosicaoPalavra('POSICURSOR','CONDDE');
  while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
  begin
    PosicaoPalavra('USUARIOBLOQ','ENVRE');  //USUARIO BLOQUEADO - Rodrigo Capra - 26/11/2008

    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      AtualizaErroDDE( datm_dde.qry_dde.FieldByName('NR_SD').AsString , palavra );
      Exit;
    end;

    PosicaoPalavra('COLETAIMPRLOC','CONDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
      Break;
    PosicaoPalavra('SEN0551','CONDDE');
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
    begin
      AtualizaErroDDE(datm_dde.qry_dde.FieldByName('NR_SD').AsString , 'SEN0551 - VOCE ESTA UTILIZANDO ESTE SISTEMA EM OUTRO TERMINAL.' );
//      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
//      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
//      l_Retorna := True;
//      datm_dde.ByHLLAPI_DDE.DesconectaPS;
      datm_dde.ByHLLAPI_DDE.DescarregaDLL;
      Exit;
    end;
    Sleep(2000);
    PosicaoPalavra('POSICURSOR','CONDDE');
  end;
  if l_Retorna  then
    l_Retorna := False;
  PosicaoPalavra('COLETAIMPRLOC','CONDDE');
  if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
  end;
  PosicaoPalavra('POSICURSOR','CONDDE');
  while ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
  begin
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EXPORT-EX' );
    while not ( datm_dde.ByHLLAPI_DDE.CopyPS2String( 22, 15, 9, Res) = 'EXPORT-EX' ) do
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EXPORT-EX' );
      Sleep(2000);
    end;
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );

    str_nr_sd_sem_barra:=StringReplace(datm_dde.qry_dde.FieldByName('NR_REGISTRO_SD').AsString,'/','',[rfReplaceAll] ); //retira a barra para padrozinar a digitação ( carlos AGO/2009 )
    str_nr_sd_sem_barra:=StringReplace(str_nr_sd_sem_barra,'-','',[rfReplaceAll] ); //retira o Hifen para padrozinar a digitação ( carlos ABRA/2010 )

    str_dt_desembaraco:=BuscaHistoricoSiscomex(str_nr_sd_sem_barra , 'LIBERADO S/CONF.ADUANEIRA');     // by carlos - 26/09/2011
    str_dt_averbacao  :=BuscaHistoricoSiscomex(str_nr_sd_sem_barra , 'AVERBACAO AUTOMATICA'     );     // by carlos - 23/02/2012

    datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-1-DESP' );
    while not ( datm_dde.ByHLLAPI_DDE.CopyPS2String( 22, 15, 10, Res) = 'EEX-1-DESP' ) do
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-1-DESP' );
      Sleep(2000);
    end;
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-DESP02' );
    while not ( datm_dde.ByHLLAPI_DDE.CopyPS2String( 22, 15, 10, Res) = 'EEX-DESP02' ) do
    begin
      datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-DESP02' );
      Sleep(2000);
    end;
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    Break;
    Sleep(2000);
  end;
  PosicaoPalavra('EXISTEMNOTI','CONDDE');
  if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 16, 41, 'N' );
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
  end;
  PosicaoPalavra('INFORMAR','CONDDE');
  while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
  end;
  PosicaoPalavra('INFORMAR','CONDDE');
  if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then
  begin
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 09, 41, Copy( datm_dde.qry_dde.FieldByName('NR_REGISTRO_SD').AsString,1,10) );
    datm_dde.ByHLLAPI_DDE.CopyString2PS( 09, 54, Copy( datm_dde.qry_dde.FieldByName('NR_REGISTRO_SD').AsString,12,1) );
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
  end;
  PosicaoPalavra('SITDESP','CONDDE');
  while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
  end;
  PosicaoPalavra('SITDESP','CONDDE');
  if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
    i:=1;
    while i <= 25 do begin
      frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
      i:=i+1;
    end;
    Application.ProcessMessages;
    Sleep(1000);

    PosicaoPalavra('SITDESPDDE','CONDDE');
//    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
    if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, 'SITUACAO DESPACHO' ) ) then begin
       //by carlos
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( 11, 3, 'REGIMES ADUANEIROS' ) ) then
          datm_dde.ByHLLAPI_DDE.CopyString2PS( 11, 40, 'X' );



      vTipo1ou2 := True;
      if ( datm_dde.ByHLLAPI_DDE.ScrComp( 15, 57, '  ' ) ) then      begin
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 15, 80, 'X' );
        Sleep(1000);
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );

        //by carlos
        Sleep(1000);
        if ( datm_dde.ByHLLAPI_DDE.ScrComp( 6, 3, 'REGIMES ADUANEIROS' ) ) then begin
           i:=1;
           while i <= 25 do  begin
            frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
            i:=i+1;
           end;
           Sleep(1000);
           Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
           Res := datm_dde.ByHLLAPI_DDE.Wait( True );
        end;


        PosicaoPalavra('INFCARGA','CONDDE');
        while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin end;
        PosicaoPalavra('INFCARGA','CONDDE');
        if ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then  begin
          i:=1;
          while i <= 25 do  begin
            frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
            i:=i+1;
          end;
          Application.ProcessMessages;
          frm_dde.captura_telas.Lines.Add('');
        end;
{
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );
        PosicaoPalavra('PARAUSO','CONDDE');
        while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin end;
        i:=1;
        while i <= 25 do  begin
          frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
          i:=i+1;
        end;
 }
        // volta 1
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );


      end;

//      if ( datm_dde.ByHLLAPI_DDE.ScrComp( 15, 57, 'NAO' ) ) then begin
        // caso não tenha informações de presença de carga
        // tem que pegar informações de RE, NF e Volumes.
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 16, 41, 'X' );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 16, 80, 'X' );
        datm_dde.ByHLLAPI_DDE.CopyString2PS( 21, 79, 'X' );
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );

         //by carlos
         Sleep(1000);
         if ( datm_dde.ByHLLAPI_DDE.ScrComp( 6, 3, 'REGIMES ADUANEIROS' ) ) then begin
            i:=1;
            while i <= 25 do  begin
             frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
             i:=i+1;
            end;
            Sleep(1000);
            Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
            Res := datm_dde.ByHLLAPI_DDE.Wait( True );
         end;


        Sleep(1000);
        i:=1;
        while ( datm_dde.ByHLLAPI_DDE.ScrComp( 23, 70, 'CONTINUA' ) ) or ( i = 1 ) do begin
          i:=1;
          while i <= 25 do begin
            frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
            i:=i+1;
          end;
          Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
          Res := datm_dde.ByHLLAPI_DDE.Wait( True );
        end;
        Application.ProcessMessages;
        Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
        Res := datm_dde.ByHLLAPI_DDE.Wait( True );


//      end;

    end else begin
      // caso a situação não comece com DDE... ele tem q copiar as telas tbm !

       //by carlos
       if ( datm_dde.ByHLLAPI_DDE.ScrComp( 11, 3, 'REGIMES ADUANEIROS' ) ) then
          datm_dde.ByHLLAPI_DDE.CopyString2PS( 11, 40, 'X' );


       vTipo1ou2 := False;
       Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
       Res := datm_dde.ByHLLAPI_DDE.Wait( True );


       //by carlos
       Sleep(1000);
       if ( datm_dde.ByHLLAPI_DDE.ScrComp( 6, 3, 'REGIMES ADUANEIROS' ) ) then begin
          i:=1;
          while i <= 25 do  begin
           frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
           i:=i+1;
          end;
          Sleep(1000);
          Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
          Res := datm_dde.ByHLLAPI_DDE.Wait( True );
       end;


      PosicaoPalavra('PARAUSO','CONDDE');
      while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin end;
      i:=1;
      while i <= 25 do  begin
        frm_dde.captura_telas.Lines.Add( datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res) );
        i:=i+1;
      end;
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    end;

  end;


  Sleep(1000);
  vList := TStringList.Create;
  for i := 0 to frm_dde.captura_telas.Lines.Count - 1 do begin
    vAux := frm_dde.captura_telas.Lines.Strings[i];
    if Pos('SITUACAO',vAux) > 0 then
      vSituacao := Trim(copy(vAux,22,57));
    if Pos('INFORMACOES DE PRESENCA DE CARGA',vAux) > 0 then
      vPresenca := True;
    vList.Add(StringReplace(vAux,'''X''','"X"',[rfReplaceAll]));
  end;
  if Trim(vSituacao) <> '' then  begin
    with TQuery.Create(application) do begin
      databaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TSD_ESTAGIOS SET TX_DOCUMENTO_SISCOMEX = ''' + vList.Text + ''',');
      SQL.Add('IN_CONCLUIDO = ''1'',');
      SQL.Add('DT_CONCLUSAO = GETDATE()');
      SQL.Add('WHERE NR_PROCESSO = ''' + frm_historico_dde.qry_dde_estagiosNR_PROCESSO.AsString + '''');
      SQL.Add('AND NM_ESTAGIO_SISCOMEX like  ''%' + vSituacao + ''' ');
      //SQL.Add('AND NM_ESTAGIO_SISCOMEX like  ''%' + vSituacao + ''' AND IN_CONCLUIDO = ''0''');
      //''' + vSituacao + ''''
      if  copy(vSituacao,1,2)='DE' then
//      if vTipo1ou2 then
      begin
        if vPresenca then
          SQL.Add('AND CD_TIPO = ''2''')
        else SQL.Add('AND CD_TIPO = ''1''');
      end;

      ExecSQL;
      frm_dde.Captura_Telas.Visible:=TRUE;

      //verifica a situação para alimentar o evento 088 - desembaraço - by carlos - 26/09/2011
      if (vSituacao='LIBERADO S/CONF.ADUANEIRA') and (str_dt_desembaraco<>'') then begin
         SQL.Clear;
         SQL.Add(' UPDATE TFOLLOWUP SET DT_REALIZACAO = CONVERT(DATETIME, :DT_DESEMBARACO , 103) , CD_RESP_REALIZACAO = :CD_USUARIO ');
         SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
         SQL.Add(' AND CD_EVENTO = :CD_EVENTO ');
         SQL.Add(' AND DT_REALIZACAO is Null ');
         ParamByname('NR_PROCESSO').AsString  := frm_historico_dde.qry_dde_estagiosNR_PROCESSO.AsString;
         ParamByname('CD_USUARIO').AsString   := '0707';
         ParamByname('CD_EVENTO').AsString    := '088';
         ParamByname('DT_DESEMBARACO').AsString := str_dt_desembaraco;
         ExecSQL;
         //
         SQL.Clear;
         SQL.Add(' EXEC SP_ATZ_FOLLOWUP "'+frm_historico_dde.qry_dde_estagiosNR_PROCESSO.AsString+'"');
         ExecSQL;
      end;

      //verifica a situação para alimentar o evento 141 - averbacao - by carlos - 23/02/2012
      if (vSituacao='AVERBACAO AUTOMATICA') and (str_dt_averbacao<>'') then begin
         SQL.Clear;
         SQL.Add(' UPDATE TFOLLOWUP SET DT_REALIZACAO = CONVERT(DATETIME, :DT_AVERBACAO , 103) , CD_RESP_REALIZACAO = :CD_USUARIO ');
         SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
         SQL.Add(' AND CD_EVENTO = :CD_EVENTO ');
         SQL.Add(' AND DT_REALIZACAO is Null ');
         ParamByname('NR_PROCESSO').AsString  := frm_historico_dde.qry_dde_estagiosNR_PROCESSO.AsString;
         ParamByname('CD_USUARIO').AsString   := '0707';
         ParamByname('CD_EVENTO').AsString    := '141';
         ParamByname('DT_AVERBACAO').AsString := str_dt_averbacao;
         ExecSQL;
         //
         SQL.Clear;
         SQL.Add(' EXEC SP_ATZ_FOLLOWUP "'+frm_historico_dde.qry_dde_estagiosNR_PROCESSO.AsString+'"');
         ExecSQL;
      end;


      Free;
    end;
  end;
  frm_historico_dde.qry_dde_estagios.Close;
  frm_historico_dde.qry_dde_estagios.Prepare;
  frm_historico_dde.qry_dde_estagios.Open;
  PosicaoPalavra('REDE','CONDDE');
  while not ( datm_dde.ByHLLAPI_DDE.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do
  begin
    Res := datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
    Res := datm_dde.ByHLLAPI_DDE.Wait( True );
    Sleep(1000);
  end;
end;

{
Finalidade : Buscar a Data do Status desejado no Siscomex
Programador: Carlos
Data       : Set/2011
}
function BuscaHistoricoSiscomex( NR_DESPACHO, STATUS : String  ) : String ;
var
i,Res,n:Integer;
str_Linha:String;
begin
   Result:='';
   datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-3-CONS' );
   Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
   Res := datm_dde.ByHLLAPI_DDE.Wait( True );
  {ENTER}

   datm_dde.ByHLLAPI_DDE.CopyString2PS( 22, 15, 'EEX-CONS04' );
   Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
   Res := datm_dde.ByHLLAPI_DDE.Wait( True );
  {ENTER}

   datm_dde.ByHLLAPI_DDE.CopyString2PS( 08, 39, Copy( nr_despacho, 1,10) );
   datm_dde.ByHLLAPI_DDE.CopyString2PS( 08, 52, Copy( nr_despacho,11,1) );

   Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
   Res := datm_dde.ByHLLAPI_DDE.Wait( True );
  {ENTER}


   if not datm_dde.ByHLLAPI_DDE.ScrComp( 3, 79, 'CR' )   then begin
     for n:=1 to 3 do begin
       datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
       datm_dde.ByHLLAPI_DDE.Wait( True );
     end;
     result:='';
     exit;
   end;

   while not datm_dde.ByHLLAPI_DDE.ScrComp( 3, 79, 'GS' )  do begin
      i:=1;
      while i <= 25 do begin
        str_linha:= datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 1, 80, Res);
        if Pos(STATUS,str_linha) > 0 then begin
           result:=datm_dde.ByHLLAPI_DDE.CopyPS2String( i, 3, 10, Res);
           break;
        end;
        i:=i+1;
      end;
      Res := datm_dde.ByHLLAPI_DDE.SendKey( C_ENTER, True );
      Res := datm_dde.ByHLLAPI_DDE.Wait( True );
     {ENTER}
   end;

   for n:=1 to 2 do begin
     datm_dde.ByHLLAPI_DDE.SendKey( C_PF3, True );
     datm_dde.ByHLLAPI_DDE.Wait( True );
   end;
end;


procedure AtualizaHistoricoDDE(const pTipoAtualizacao,pProcesso : String);
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    // ao inicializar, ele já joga todos os estagios na tabela, mas como IN_CONCLUIDO = 0
    if pTipoAtualizacao = '0' then
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',1 ,''0'',null,''DDE Concluída''                       ,''DDE CONCLUIDA''                      ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',2 ,''0'',null,''DDE Concluída com Presença de Carga'' ,''DDE CONCLUIDA''                      ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',3 ,''0'',null,''Documentos Apresentados''             ,''DOCUMENTOS APRESENTADOS''            ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',4 ,''0'',null,''Conferência Documental''              ,''DESEMBARACADO C/VERIFIC.-C.LARANJA'' ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',5 ,''0'',null,''Conferência Física e Documental''     ,''DESEMBARACADO C/VERIFIC.-C.VERMELHO'',''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',6 ,''0'',null,''Liberado sem Conferência Aduaneira''  ,''LIBERADO S/CONF.ADUANEIRA''          ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',8 ,''0'',null,''Dados de Embarque Registrados''       ,''DADOS DE EMBARQUE REGISTRADOS''      ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',9 ,''0'',null,''Averbação Automática''                ,''AVERBACAO AUTOMATICA''               ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',10,''0'',null,''Emitido Comprovante de Exportação''   ,''EMITIDO COMPROVANTE DE EXPORTACAO''  ,''0'',''CONS_DDE.BSL'','' '')');
    end;
    ExecSQL;
    Free;
  end;
end;

function StrZero(nNumero : double; i : Integer) : String;
var
  s : string;
begin
  try
    s := FloatToStr( nNumero )
  except
    s := ''
  end;
  while Length( s ) < i do
    s := '0' + s;
  StrZero := s
end;


function PosicionaTelaMapaBrasilDSE : Boolean;
var
   Tela1     ,
   Tela2     : String;
   Res       : Integer;
   DataHora1 ,
   DataHora2 : String;
   Tempo     : Double;
   DataHoraLoop : TDateTime;
   l_Abortar : Boolean;
begin
   Result := True;
   if VerificaConexaoEmulador( 'A' ) then Exit;
   PosicaoPalavra('REDECOMSERPROBR','ENVDSE');
   if datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then
   begin
      Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
      Res := datm_dse.ByHLLAPI.Wait( True );
      Result := True;
   end

      else begin
         PosicaoPalavra('REDESERPROBR','ENVDSE');
         while not (datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra )) do
         begin
               Tela1 := datm_dse.ByHLLAPI.CopyScreen2String( Res );
               Tela2 := datm_dse.ByHLLAPI.CopyScreen2String( Res );
               Res := datm_dse.ByHLLAPI.SendKey( C_PF3 );
               DataHora1    := '01/12/2000 00:00:00';
               DataHora2    := '01/12/2000 00:00:' + IntToStr( li_timeout );
               Tempo        := StrToDateTime( DataHora2 ) - StrToDateTime( DataHora1 );
               DataHoraLoop := Now;
               while Tela1 = Tela2 do
               begin
                     Tela2 := datm_dse.ByHLLAPI.CopyScreen2String( Res );
                     Application.ProcessMessages;
                     if Now > ( DataHoraLoop + Tempo ) then begin
                        Result := False;
                        l_Abortar := True;
                        Break;
                     end;
               end;
               if l_Abortar then  Break;
               PosicaoPalavra('REDECOMSERPROBR','ENVDSE');
               if datm_dse.ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) then begin
                  Res := datm_dse.ByHLLAPI.SendKey( C_ENTER, True );
                  Res := datm_dse.ByHLLAPI.Wait( True );
                  Result := True;
//                  Sleep(4000);
//                  exit;
               end;
               PosicaoPalavra('REDESERPROBR','ENVDSE');
         end;
      end;
end;

procedure ConverteValoresPE(const pNR_PROCESSO: String);
var
  vOperador : String[1];
begin
  try
    With TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT IN_VALORES_CONVERTIDOS, CD_MOEDA FROM TPE WHERE NR_PROCESSO = ''' + pNR_PROCESSO + '''');
      Open;
      If Fields[0].AsString = '1' then
        If Fields[1].AsString <> '790' then
          vOperador := '*'
        else
          vOperador := '/'
      else
        If Fields[1].AsString <> '790' then
          vOperador := '/'
        else
          vOperador := '*';
      Close;
      SQL.Clear;
      SQL.Add('UPDATE TPE SET ');
      SQL.Add('  VL_FRETE                = VL_FRETE              ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_SEGURO               = VL_SEGURO             ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_DESCONTO             = VL_DESCONTO           ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_ACRESCIMO            = VL_ACRESCIMO          ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_TOT_ORIGEM           = VL_TOT_ORIGEM         ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_TOT_CUBAGEM          = VL_TOT_CUBAGEM        ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_TOT_FOB              = VL_TOT_FOB            ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_TOT_COM_AGENTE       = VL_TOT_COM_AGENTE     ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_TOT_MCV              = VL_TOT_MCV            ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_TOT_EXW              = VL_TOT_EXW            ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_FATURA               = VL_FATURA             ' + vOperador + ' VL_TX_CAMBIO, ');
      SQL.Add('  VL_VOLUMES              = VL_VOLUMES            ' + vOperador + ' VL_TX_CAMBIO  ');
      SQL.Add('WHERE  ');
      SQL.Add('  NR_PROCESSO = ''' + pNR_PROCESSO + '''');
      ExecSQL;
      SQL.Clear;
      SQL.Add('UPDATE TPE_ITEM SET ');
      SQL.Add('  VL_POR_EMB              = PI.VL_POR_EMB         ' + vOperador + ' PE.VL_TX_CAMBIO, ');
      SQL.Add('  VL_UNITARIO             = PI.VL_UNITARIO        ' + vOperador + ' PE.VL_TX_CAMBIO, ');
      SQL.Add('  VL_TOT_ITEM             = PI.VL_TOT_ITEM        ' + vOperador + ' PE.VL_TX_CAMBIO, ');
      SQL.Add('  VL_MLE                  = PI.VL_MLE             ' + vOperador + ' PE.VL_TX_CAMBIO, ');
      SQL.Add('  VL_MCV                  = PI.VL_MCV             ' + vOperador + ' PE.VL_TX_CAMBIO, ');
      SQL.Add('  VL_POR_EMB_SUP          = PI.VL_POR_EMB_SUP     ' + vOperador + ' PE.VL_TX_CAMBIO ');
      SQL.Add('FROM  ');
      SQL.Add('  TPE_ITEM PI, TPE PE');
      SQL.Add('WHERE  ');
      SQL.Add('  PI.NR_PROCESSO    = ''' + pNR_PROCESSO + ''' AND ');
      SQL.Add('  PE.NR_PROCESSO = ''' + pNR_PROCESSO + '''');
      ExecSQL;
    end;
  except
    ShowMessage('Ocorreu um erro ao converter os valores.');
  end;
end;

function GeraNumeroFatura(pCliente : string) : string;
var
  vStrAux : String;
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT IN_GERA_NR_FATURA_EXP,');
    SQL.Add('	    SUBSTRING(NR_FATURA_EXP_INICIAL,1,6) NR_FATURA_EXP_INICIAL,');
    SQL.Add('	    SUBSTRING(NR_FATURA_EXP_ATUAL,1,6)   NR_FATURA_EXP_ATUAL,');
    SQL.Add('	    SUBSTRING(NR_FATURA_EXP_INICIAL,8,3) ANO_INICIAL,');
    SQL.Add('	    SUBSTRING(NR_FATURA_EXP_ATUAL,8,3)   ANO_ATUAL');
    SQL.Add('FROM   TEMPRESA_NAC WHERE CD_EMPRESA = ''' + pCliente + '''');
    Open;
    if Fields[0].AsString = '1' then
    begin
      if Fields[4].AsString <> FormatDateTime('yy',now) then
        Result := '000001/' + FormatDateTime('yy',now)
      else
        Result := Fields[2].AsString + '/' + Fields[4].AsString;
      vStrAux := copy('000000',1,6-(Length(IntToStr(StrToInt(copy(Result,0,6)) + 1)))) + IntToStr(StrToInt(copy(Result,0,6)) + 1);
      Close;
      SQL.Clear;
      SQL.Add('UPDATE TEMPRESA_NAC SET');
      SQL.Add('	    NR_FATURA_EXP_ATUAL = ''' + vStrAux + '/' + FormatDateTime('yy',now) + '''');
      SQL.Add('FROM   TEMPRESA_NAC WHERE CD_EMPRESA = ''' + pCliente + '''');
      ExecSQL;
    end
    else
      Result := '';
    Close;
    Free;
  end;
end;

// MySenhas - Pausar e Continuar Bloqueios
function PausarMySenhas: Boolean;
var
  H: HWND;
begin
  H := FindWindow('TfrmMonitorMySenhas', nil);
  Result := H > 0;
  if Result then
    Result := SendMessage(H, WM_PAUSAR_BLOQUEIO, 0, 0) = mrYes;
end;

function ContinuarMySenhas: Boolean;
var
  H: HWND;
begin
  H := FindWindow('TfrmMonitorMySenhas', nil);
  Result := H > 0;
  if Result then
    Result := SendMessage(H, WM_CONTINUAR_BLOQUEIO, 0, 0) = mrYes;
end;

end.


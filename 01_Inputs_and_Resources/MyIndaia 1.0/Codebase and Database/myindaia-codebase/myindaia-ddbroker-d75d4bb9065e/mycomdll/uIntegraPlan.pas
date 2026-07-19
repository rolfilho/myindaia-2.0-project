unit uIntegraPlan;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ComObj, ActiveX, AspTlb, MyCOM_TLB, StdVcl, Classes, SysUtils, DB, ADODB, DateUtils,
  Excel2000, Variants, ComServ, uFuncoes, StrUtils, Dialogs, Graphics, IntegraSG, IdMessage, IdSMTP;

const
  { De Para}
  _TABELA_PAIS               = 43;
  _TABELA_LOCAL_EMBARQUE     = 44;
  _TABELA_LOCAL_DESEMBARQUE  = 44;
  _TABELA_ANALISTA           = 45;
  _TABELA_EMBARCACAO         = 46;
  _TABELA_AREA               = 47;
  _TABELA_MOEDA              = 48;
  _TABELA_VIA_TRANSPORTE     = 49;
  _TABELA_CONDICAO_PAGAMEMTO = 50;
  _TABELA_REGIME_TRIBUTARIO  = 51;
  _TABELA_FABRICANTE         = 52;
  _TABELA_VINCULACAO         = 53;
  _TABELA_FORNECEDOR         = 54;
  _TABELA_AGENTE_CARGA       = 55;

  _TAMANHO_DE_PARA          = 15;

  _SERVICO                  = '475';
  _SERVICO_CRODA            = '390';
  _AREA                     = '58';

type
  TDePara = record
    Codigo: String;
    Texto: String;
  end;

  TValor = record
      Moeda: TDePara;
      Valor: Double;
  end;

  TCondicaoPagamento = record
    Dias: Integer;
    Codigo: String;
    Texto: String;
  end;

  TFatura = record
      Invoice: String;
      Data: TDateTime;
      Condicao: TCondicaoPagamento;
      Fatura: String;
  end;

  TItemPedido = record
      Ncm: String;
      Destaque: String;
      NcmEx: String;
      Nve: String;
      Regime_Trib: TDePara;
      Nr_LI: String;
      Fabricante: TDePara;
      Pedido: String;
      Codigo_Item: String;
      Quantidade: Double;
      Peso_Liquido_Total: Double;
      Valor_Unitario: Double;
      Valor_Total: Double;
      Part_Number: String;
      Descricao: TStrings;
      IndiceInvoice: Integer;
  end;

  TPedido = record
    Numero: String;
    Itens: array of TItemPedido;
  end;

  TCapa_Pedido = record
      Data: TDateTime;
      Nr_Sequencial_Embarque: String;
      Analista: TDePara;
      CNPJ_Importador: String;
      Nr_Conhecimento: String;
      Data_Conhecimento: TDateTime;
      Moeda: TDePara;
      Incoterms: String;
      Data_Embarque: TDateTime;
      Data_ETA: TDateTime;
      Local_Embarque: TDePara;
      Local_Desemb: TDePara;
      Pais_Proced: TDePara;
      Navio: TDePara;
      Peso_Bruto: Double;
      URF_Despacho: String;
      URF_Entrada: String;
      Frete: TValor;
      Seguro: TValor;
      Vinculacao: TDePara;
      Tipo_Frete: TDePara;
      Via_Transporte: TDePara;
      Agente_Transporte: TDePara;
      Fornecedor: TDePara;
      Pedidos: array of TPedido;
      Faturas: array of TFatura;
  end;

type
  TIntegraPlan = class(TASPObject, IIntegraPlan)
  public
    procedure OnEndPage; safecall;
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    function Get_PackingList(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer; safecall;
    function Get_Remessa(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer; safecall;
    function Get_RemessaTxt(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer; safecall;
    function Get_RemessaXls(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer; safecall;
    function Get_TranspXls(NrTransp, NmServer, TxArquivo: OleVariant): Integer; safecall;
    function Get_GeraID(ID, tipo: OleVariant): Integer; safecall;
    function Get_IntegraPlanilhaWhirlpool(NmServer, TxArquivo,
      CdUsuario: OleVariant): OleVariant; safecall;
    function Get_IntegraPlanilhaSG(NmServer, TxArquivo,
      CdUsuario: OleVariant): OleVariant; safecall;
    function Get_EnviaEmailAnexo(TxDe, TxPara, TxCopia, TxAssunto,
      TxAnexo: OleVariant): OleVariant; safecall;
    function Get_IntegraPlanilhaFesto(NmServer: OleVariant; TxArquivo: OleVariant; CdUsuario: OleVariant): OleVariant; safecall;
    function Get_Echo(Msg: OleVariant): OleVariant; safecall;
  private
    FServidor: String;
    FArquivo: String;
    FCliente: String;
    FconBroker: TADOConnection;
    FcmdExec: TADOCommand;
    FqryConsulta: TADOQuery;
    FCodUsuario: String;
    FCapa: TCapa_Pedido;
    FMensagens: TStrings;
    ErrosCroda: TStrings;
    FInstrucaoDesembaraco: String;
    function VerifCubagem(nM3, nComp, nLarg, nAlt : Double) : String;
    function VerifPesoBtoTot(nPeso : Double) : String;
    function VerifPesoLiqTot(nPeso : Double) : String;
    function LerPlanilha(AArquivo: String): Boolean;
    function IntegraPlanilhaCroda(AArquivo: String; AUsuario, AEmpresa: String): Boolean;
    function Gravar: Boolean;
    function ConsultaLookup(ATabela, ACampoRetorno, AFiltro: String): String;
    function ConsultaSQLPlanilha(ASQL: String): String;
    function VerificaDeParas: Boolean;
    function ConsultaDePara(ATabela: Integer; AValor: String): String;
    procedure ExecuteSQL(ASQL: String);
    procedure AjustaDePara;
    procedure VerificaMercadorias;
 // Published
 //   Constructor Create;
  end;

implementation

procedure TIntegraPlan.OnEndPage;
begin
  inherited OnEndPage;
end;

procedure TIntegraPlan.OnStartPage(const AScriptingContext: IUnknown);
begin
  inherited OnStartPage(AScriptingContext);
end;

function TIntegraPlan.Get_PackingList(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer;
var
  conMyIndaia : TADOConnection;
  cmdMyIndaia : TADOCommand;
  qryMercFornec, qryMercPedido, qryExisteFornec, qryVerifPack : TADOQuery;
  objExcel, objBook, objSheet: OleVariant;
  vNrPag, vNrUltLin, vNrLinha, vMercOk : Integer;
  vErro, vCodVolume, vTxEmbalagem, vCodMerc, vCodMercAux, vTxUnMedida, vTpErroPack : String;
  vComprimento, vAltura, vLargura, vVlCubagem, vVlPesoLiqTot, vVlPesoBtoTot, vVlQtdeMerc, vVlPesoLiq, vCubagem : Double;
  vDtEmbalagem : TDateTime;
  vListAux : TStringList;

  function ApagaPacking{(nInApagaList: Boolean)} : Boolean;
  begin
    try
      conMyIndaia.BeginTrans;
      with cmdMyIndaia do begin
        Parameters.Clear;
        //if nInApagaList then begin
          CommandText := 'DELETE TRAP_PACK_LIST WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_VOLUME = :CD_VOLUME AND CD_GRUPO = :CD_GRUPO';
          Parameters.ParamByName('NR_RAP').Value    := NrRap;
          Parameters.ParamByName('CD_VOLUME').Value := vCodVolume;
          Parameters.ParamByName('CD_GRUPO').Value  := NrGrupo;
          Execute;
        //end;
        CommandText := 'DELETE TRAP_PACK_VOLUME WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_VOLUME = :CD_VOLUME AND CD_GRUPO = :CD_GRUPO';
        Parameters.ParamByName('NR_RAP').Value    := NrRap;
        Parameters.ParamByName('CD_VOLUME').Value := vCodVolume;
        Parameters.ParamByName('CD_GRUPO').Value  := NrGrupo;
        Execute;
      end;
      conMyIndaia.CommitTrans;
      result := true;
    except
      conMyIndaia.RollbackTrans;
      vListAux.Add('Erro crítico de sistema: não foi possível excluir o volume para sua atualização.<br>');
      result := false;
    end;
  end;

  procedure SalvaDadosVolume(nTipoPack: integer);
  begin
    //executa verificações nos dados do packing
    vErro := VerifCubagem(vVlCubagem, vComprimento, vLargura, vAltura);
    if vErro <> '' then vListAux.Add(vErro);
    vErro := VerifPesoLiqTot(vVlPesoLiqTot);
    if vErro <> '' then vListAux.Add(vErro);
    vErro := VerifPesoBtoTot(vVlPesoBtoTot);
    if vErro <> '' then vListAux.Add(vErro);

    conMyIndaia.BeginTrans;
    try
      qryVerifPack.Close;
      qryVerifPack.SQL.Clear;
      qryVerifPack.SQL.Add('SELECT COUNT(*) FROM TRAP_PACK_VOLUME (NOLOCK)');
      qryVerifPack.SQL.Add('WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_VOLUME = :CD_VOLUME AND CD_GRUPO = :CD_GRUPO');

      qryVerifPack.Parameters.ParamByName('NR_RAP').Value    := NrRap;
      qryVerifPack.Parameters.ParamByName('CD_VOLUME').Value := vCodVolume;
      qryVerifPack.Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
      qryVerifPack.Open;
      with cmdMyIndaia do begin
        Parameters.Clear;
        if qryVerifPack.Fields[0].Value = 0 then begin
          //se não existir o volume, insere na tabela
          CommandText :=
            'INSERT INTO TRAP_PACK_VOLUME (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_VOLUME, TX_EMBALAGEM, VL_M3, VL_PESO_BRUTO_TOT, VL_PESO_LIQ_TOT, DT_EMBALAGEM) '+
            'VALUES (:CD_RAP, :CD_RAP_ANO, :CD_GRUPO, :CD_VOLUME, :TX_EMBALAGEM, :VL_M3, :VL_PESO_BRUTO_TOT, :VL_PESO_LIQ_TOT, :DT_EMBALAGEM)';
          Parameters.ParamByName('CD_RAP').Value     := Copy(NrRap,1,6);
          Parameters.ParamByName('CD_RAP_ANO').Value := Copy(NrRap,7,2);
          Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
        end
        else begin
          //se existir o volume, atualiza a tabela
          CommandText :=
            'UPDATE TRAP_PACK_VOLUME SET '+
            '  VL_M3             = ISNULL(VL_M3, 0) + :VL_M3, '+
            '  VL_PESO_BRUTO_TOT = ISNULL(VL_PESO_BRUTO_TOT, 0) + :VL_PESO_BRUTO_TOT, '+
            '  VL_PESO_LIQ_TOT   = ISNULL(VL_PESO_LIQ_TOT, 0) + :VL_PESO_LIQ_TOT, '+
            '  TX_EMBALAGEM      = ISNULL(TX_EMBALAGEM, :TX_EMBALAGEM), '+
            '  DT_EMBALAGEM      = ISNULL(DT_EMBALAGEM, :DT_EMBALAGEM)  '+
            '  WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_VOLUME = :CD_VOLUME AND CD_GRUPO = :CD_GRUPO';

          Parameters.ParamByName('NR_RAP').Value := NrRap;
          Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
        end;
        Parameters.ParamByName('CD_VOLUME').Value         := vCodVolume;
        Parameters.ParamByName('VL_M3').Value             := vVlCubagem;
        Parameters.ParamByName('VL_PESO_BRUTO_TOT').Value := vVlPesoBtoTot;
        Parameters.ParamByName('VL_PESO_LIQ_TOT').Value   := vVlPesoLiqTot;
        Parameters.ParamByName('TX_EMBALAGEM').Value      := vTxEmbalagem;
        Parameters.ParamByName('DT_EMBALAGEM').Value      := vDtEmbalagem;
        Execute;
      end;
      qryVerifPack.Close;
      conMyIndaia.CommitTrans;
    except
      conMyIndaia.RollbackTrans;
      vListAux.Add('Não foi possível integrar o volume '+vCodVolume+'. Informe o suporte(suporte@myindaia.com.br)<br>');
    end;
  end;

  procedure SalvaDadosMercadoria(nTipoPack: integer);
  begin
    try
      // verifica se existe fornecimento integrado, caos não exista, ao invés de verificar as mercadorias no fornecimento,
      // verifica nos pedidos.
      qryExisteFornec.Close;
      qryExisteFornec.Parameters.ParamByName('NR_RAP').Value := NrRap;
      qryExisteFornec.Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
      qryExisteFornec.Open;
      if qryExisteFornec.Fields[0].AsInteger = 0 then begin
        // senão, vefifica se a mercadoria existe nos pedidos
        qryMercPedido.Close;
        qryMercPedido.Parameters.ParamByName('NR_RAP').Value := NrRap;
        qryMercPedido.Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
        qryMercPedido.Parameters.ParamByName('CD_MERCADORIA').Value := vCodMerc;
        qryMercPedido.Open;
        if qryMercPedido.Fields[0].AsInteger = 0 then begin
          vTpErroPack := '0,';
          vListAux.Add('Mercadoria '+ vCodMerc +' não foi encontrada nos pedidos.<br>');
        end;
        if (nTipoPack = 1) or (nTipoPack = 5) then begin //packing usa
          //unidade de medida
          vTxUnMedida := Trim(qryMercPedido.Fields[1].AsString);
          //através do unidade de medida verifica se a vai ser a qtde de caixas
          if  nTipoPack = 1 then
            if vTxUnMedida = 'CX' then vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha,10].Value, 0) //coluna J
          else
            if vTxUnMedida = 'CX' then vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha,9].Value, 0); //coluna J
        end;
        qryMercPedido.Close;

      end else begin

        //vefifica se a mercadoria existe no fornecimento
        qryMercFornec.Close;
        qryMercFornec.Parameters.ParamByName('NR_RAP').Value := NrRap;
        qryMercFornec.Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
        qryMercFornec.Parameters.ParamByName('CD_MERCADORIA').Value := vCodMerc;
        qryMercFornec.Open;
        if qryMercFornec.Fields[0].AsInteger = 0 then begin
          vTpErroPack := '0,';
          vListAux.Add('Mercadoria '+ vCodMerc +' não foi encontrada nos fornecimentos.<br>');
        end;
        if (nTipoPack = 1) or (nTipoPack = 5) then begin //packing usa
          //unidade de medida
          vTxUnMedida := Trim(qryMercFornec.Fields[1].AsString);
          //através do unidade de medida verifica se a vai ser a qtde de caixas
          if  nTipoPack = 1 then
            if vTxUnMedida = 'CX' then vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha,10].Value, 0) //coluna J
          else
            if vTxUnMedida = 'CX' then vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha,9].Value, 0); //coluna J
        end;
        qryMercFornec.Close;

      end;
      qryExisteFornec.Close;

      conMyIndaia.BeginTrans;
      try
        qryVerifPack.Close;
        qryVerifPack.SQL.Clear;
        qryVerifPack.SQL.Add('SELECT COUNT(*) FROM TRAP_PACK_LIST (NOLOCK)');
        qryVerifPack.SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_VOLUME = :CD_VOLUME AND CD_MERCADORIA = :CD_MERCADORIA AND CD_GRUPO = :CD_GRUPO');
        qryVerifPack.Parameters.ParamByName('NR_RAP').Value        := NrRap;
        qryVerifPack.Parameters.ParamByName('CD_GRUPO').Value      := NrGrupo;
        qryVerifPack.Parameters.ParamByName('CD_VOLUME').Value     := vCodVolume;
        qryVerifPack.Parameters.ParamByName('CD_MERCADORIA').Value := vCodMerc;
        qryVerifPack.Open;
        with cmdMyIndaia do begin
          Parameters.Clear;
          if qryVerifPack.Fields[0].AsInteger = 0 then begin
            //se não existir a mercadoria no volume, insere na tabela
            CommandText :=
              'INSERT INTO TRAP_PACK_LIST (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_VOLUME, CD_MERCADORIA, VL_QTDE, VL_PESO_LIQ, TX_UNID_MEDIDA, TP_ERRO_VALIDA) '+
              'VALUES(:CD_RAP, :CD_RAP_ANO, :CD_GRUPO, :CD_VOLUME, :CD_MERCADORIA, :VL_QTDE, :VL_PESO_LIQ, :TX_UNID_MEDIDA, :TP_ERRO_VALIDA)';
            Parameters.ParamByName('CD_RAP').Value     := Copy(NrRap,1,6);
            Parameters.ParamByName('CD_RAP_ANO').Value := Copy(NrRap,7,2);
            Parameters.ParamByName('CD_GRUPO').Value   := NrGrupo;
          end
          else begin
            //se já existir a mercadoria no volume, soma as qtdes e peso
            CommandText :=
              'UPDATE TRAP_PACK_LIST SET '+
              '  VL_QTDE        = ISNULL(VL_QTDE, 0) + :VL_QTDE, '+
              '  VL_PESO_LIQ    = ISNULL(VL_PESO_LIQ, 0) + :VL_PESO_LIQ, '+
              '  TX_UNID_MEDIDA = :TX_UNID_MEDIDA, '+
              '  TP_ERRO_VALIDA = :TP_ERRO_VALIDA '+
              '  WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_VOLUME = :CD_VOLUME AND CD_GRUPO = :CD_GRUPO  AND CD_MERCADORIA = :CD_MERCADORIA';
            Parameters.ParamByName('NR_RAP').Value   := NrRap;
            Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
          end;
          Parameters.ParamByName('CD_VOLUME').Value      := vCodVolume;
          Parameters.ParamByName('CD_MERCADORIA').Value  := vCodMerc;
          Parameters.ParamByName('VL_QTDE').Value        := vVlQtdeMerc;
          Parameters.ParamByName('VL_PESO_LIQ').Value    := vVlPesoLiq;
          Parameters.ParamByName('TX_UNID_MEDIDA').Value := vTxUnMedida;
          Parameters.ParamByName('TP_ERRO_VALIDA').Value := vTpErroPack;
          Execute;
        end;
        qryVerifPack.Close;
        conMyIndaia.CommitTrans;
        vMercOk := vMercOk + 1;
      except
        conMyIndaia.RollbackTrans;
        vMercOk := vMercOk - 1;
        vListAux.Add('Não foi possível integrar a mercadoria '+vCodMerc+'. Informe o suporte(suporte@myindaia.com.br)<br>');
      end;
    except
      on e:exception do
        vListAux.Add(e.message);
    end;
  end;
begin
  result := 0;
  conMyIndaia     := TADOConnection.Create(nil);
  cmdMyIndaia     := TADOCommand.Create(nil);
  qryMercFornec   := TADOQuery.Create(nil);
  qryMercPedido   := TADOQuery.Create(nil);
  qryExisteFornec := TADOQuery.Create(nil);
  qryVerifPack    := TADOQuery.Create(nil);
  vListAux        := TStringList.Create;
  try
    //cria a conexão com o banco de dados
    with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor +';Initial Catalog=MYINDAIA;' +
        'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    //cria objeto de comando(para utilizar updates e inserts
    with cmdMyIndaia do begin
      CommandTimeout := 200;
      CommandType := cmdText;
      Connection := conMyIndaia;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryMercFornec do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('SELECT COUNT(*), TX_UNID_MEDIDA FROM TRAP_FORNECIMENTO (NOLOCK)');
      SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_MERCADORIA = :CD_MERCADORIA AND CD_GRUPO = :CD_GRUPO GROUP BY TX_UNID_MEDIDA');
    end;
    //cria a query para consulta de pedidos - VITOR
    with qryMercPedido do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('SELECT COUNT(*), CD_UNID_MEDIDA FROM TPE_ITEM (NOLOCK)');
      SQL.Add(' WHERE LTRIM(RTRIM(CD_RAP))+LTRIM(RTRIM(CD_RAP_ANO)) = :NR_RAP AND CD_PRODUTO = :CD_MERCADORIA AND CD_GRUPO = :CD_GRUPO GROUP BY CD_UNID_MEDIDA');
    end;
    //cria a query para verificar se existem fornecimentos integrados - VITOR
    with qryExisteFornec do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('SELECT COUNT(*) FROM TRAP_FORNECIMENTO (NOLOCK)');
      SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO');
    end;
    //cria a query para consulta de volumes
    with qryVerifPack do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
    end;

    try //abre a pasta do excel
      objExcel := CreateOLEObject('Excel.Application');
      objExcel.DisplayAlerts := false;
      objExcel.Visible       := false;
      objBook  := objExcel.Workbooks.Open(TxArquivo, 0);
      //percorre todas as planilhas da pasta
      for vNrPag := 1 to objExcel.Sheets.Count do begin
        //seleciona a planilha
        objSheet := objBook.WorkSheets[vNrPag];
        //se a planilha for visivel, seleciona informação nela
        if not objSheet.Visible then Continue;
        //verifica que tipo de planilia será lida
        if Pos('CLIENTE', objSheet.Cells[1,1].Value) > 0 then begin //celula A1
          //inicia a leitura da planilha JUMBO
          vNrUltLin := objSheet.Cells.SpecialCells(11).Row;
          vDtEmbalagem := StrToDateDef(objSheet.Cells[2,14].Value, Date); //celula N2
          //nesse tipo de planilha é uma mercadoria por volume
          for vNrLinha := 5 to vNrUltLin do begin
            if Pos('TOTAL',objSheet.Cells[vNrLinha,2].Value) > 0 then Break;
            //leitura do volume
            vCodVolume    := objSheet.Cells[vNrLinha,1].Value; //celula A
            vLargura      := StrToFloatDef(objSheet.Cells[vNrLinha,3].Value, 0); //coluna C
            vComprimento  := StrToFloatDef(objSheet.Cells[vNrLinha,4].Value, 0); //coluna D
            vAltura       := StrToFloatDef(objSheet.Cells[vNrLinha,5].Value, 0); //coluna E
            vTxEmbalagem  := objSheet.Cells[vNrLinha,8].Value; //coluna H
            vVlPesoLiqTot := StrToFloatDef(objSheet.Cells[vNrLinha,12].Value, 0); //coluna L
            vVlPesoBtoTot := StrToFloatDef(objSheet.Cells[vNrLinha,13].Value, 0); //coluna M
            vVlCubagem    := StrToFloatDef(objSheet.Cells[vNrLinha,14].Value, 0); //coluna N
            //leitura da mercadoria
            vCodMercAux    := objSheet.Cells[vNrLinha,2].Value;
            if vCodMercAux <> '' then
              vCodMerc    := Copy('000000000000000000'+vCodMercAux,Length('000000000000000000'+vCodMercAux)-17,18)
            else vCodMerc := vCodMercAux;

            vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha,6].Value, 0); //coluna F
            vTxUnMedida := objSheet.Cells[vNrLinha,7].Value; //coluna G
            vVlPesoLiq  := StrToFloatDef(objSheet.Cells[vNrLinha,12].Value, 0); //coluna L
            vTpErroPack := '';

            if vCodVolume = '' then begin
              if vCodMerc <> '' then vListAux.Add('Não foi encontrado o código do volume.<br>')
            end
            else begin
              vListAux.Add('Volume: <b>'+vCodVolume+'</b><br>');
              //apaga o volume
              if not ApagaPacking then begin
                result := 4;
                Continue;
              end;
              //verifica o código da mercadoria
              vMercOk := 0;
              if vCodMerc <> '' then begin
                // verifica se existe fornecimento integrado, caos não exista, ao invés de verificar as mercadorias no fornecimento,
                // verifica nos pedidos.
                qryExisteFornec.Close;
                qryExisteFornec.Parameters.ParamByName('NR_RAP').Value := NrRap;
                qryExisteFornec.Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                qryExisteFornec.Open;
                if qryExisteFornec.Fields[0].AsInteger = 0 then begin

                  // senão, vefifica se a mercadoria existe nos pedidos
                  qryMercPedido.Close;
                  qryMercPedido.Parameters.ParamByName('NR_RAP').Value := NrRap;
                  qryMercPedido.Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                  qryMercPedido.Parameters.ParamByName('CD_MERCADORIA').Value := vCodMerc;
                  qryMercPedido.Open;
                  if qryMercPedido.Fields[0].AsInteger = 0 then begin
                    vTpErroPack := '0,';
                    vListAux.Add('Mercadoria '+ vCodMerc +' não foi encontrada nos pedidos.<br>');
                  end;
                  qryMercPedido.Close;

                end else begin

                  // senão, vefifica se a mercadoria existe no fornecimento
                  qryMercFornec.Close;
                  qryMercFornec.Parameters.ParamByName('NR_RAP').Value := NrRap;
                  qryMercFornec.Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                  qryMercFornec.Parameters.ParamByName('CD_MERCADORIA').Value := vCodMerc;
                  qryMercFornec.Open;
                  if qryMercFornec.Fields[0].AsInteger = 0 then begin
                    vTpErroPack := '0,';
                    vListAux.Add('Mercadoria '+ vCodMerc +' não foi encontrada nos fornecimentos.<br>');
                  end;
                  qryMercFornec.Close;

                end;

                qryExisteFornec.Close;

                conMyIndaia.BeginTrans;
                try
                  with cmdMyIndaia do begin
                    Parameters.Clear;
                    CommandText :=
                      'INSERT INTO TRAP_PACK_LIST (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_VOLUME, CD_MERCADORIA, VL_QTDE, VL_PESO_LIQ, TX_UNID_MEDIDA, TP_ERRO_VALIDA) '+
                      'VALUES(:CD_RAP, :CD_RAP_ANO, :CD_GRUPO, :CD_VOLUME, :CD_MERCADORIA, :VL_QTDE, :VL_PESO_LIQ, :TX_UNID_MEDIDA, :TP_ERRO_VALIDA)';
                    Parameters.ParamByName('CD_RAP').Value     := Copy(NrRap,1,6);
                    Parameters.ParamByName('CD_RAP_ANO').Value := Copy(NrRap,7,2);
                    Parameters.ParamByName('CD_GRUPO').Value   := NrGrupo;
                    Parameters.ParamByName('CD_VOLUME').Value      := vCodVolume;
                    Parameters.ParamByName('CD_MERCADORIA').Value  := vCodMerc;
                    Parameters.ParamByName('VL_QTDE').Value        := vVlQtdeMerc;
                    Parameters.ParamByName('VL_PESO_LIQ').Value    := vVlPesoLiq;
                    Parameters.ParamByName('TX_UNID_MEDIDA').Value := vTxUnMedida;
                    Parameters.ParamByName('TP_ERRO_VALIDA').Value := vTpErroPack;
                    Execute;
                  end;
                  conMyIndaia.CommitTrans;
                  vMercOk := vMercOk + 1;
                except
                  conMyIndaia.RollbackTrans;
                  vMercOk := vMercOk - 1;
                  vListAux.Add('Não foi possível integrar a mercadoria '+vCodMerc+'. Informe o suporte(suporte@myindaia.com.br)<br>');
                end;
              end
              else
                if (vTxUnMedida <> '') and (vVlQtdeMerc <> 0) and (vVlPesoLiq <> 0) then
                  vListAux.Add('Não foi encontrado o código da mercadoria, linha '+IntToStr(vNrLinha)+'.<br>');

              //executa verificações nos dados do packing
              vErro := VerifCubagem(vVlCubagem, vComprimento, vLargura, vAltura);
              if vErro <> '' then vListAux.Add(vErro);
              vErro := VerifPesoLiqTot(vVlPesoLiqTot);
              if vErro <> '' then vListAux.Add(vErro);
              vErro := VerifPesoBtoTot(vVlPesoBtoTot);
              if vErro <> '' then vListAux.Add(vErro);
              //verifica se a mercadoria foi incluida corretamente, se sim, inclui o volume
              if vMercOk > 0 then begin
                conMyIndaia.BeginTrans;
                try
                  with cmdMyIndaia do begin
                    Parameters.Clear;
                    CommandText :=
                      'INSERT INTO TRAP_PACK_VOLUME (CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_VOLUME, TX_EMBALAGEM, VL_M3, VL_PESO_BRUTO_TOT, VL_PESO_LIQ_TOT, DT_EMBALAGEM) '+
                      'VALUES (:CD_RAP, :CD_RAP_ANO, :CD_GRUPO, :CD_VOLUME, :TX_EMBALAGEM, :VL_M3, :VL_PESO_BRUTO_TOT, :VL_PESO_LIQ_TOT, :DT_EMBALAGEM)';
                    Parameters.ParamByName('CD_RAP').Value     := Copy(NrRap,1,6);
                    Parameters.ParamByName('CD_RAP_ANO').Value := Copy(NrRap,7,2);
                    Parameters.ParamByName('CD_GRUPO').Value   := NrGrupo;
                    Parameters.ParamByName('CD_VOLUME').Value         := vCodVolume;
                    Parameters.ParamByName('VL_M3').Value             := vVlCubagem;
                    Parameters.ParamByName('VL_PESO_BRUTO_TOT').Value := vVlPesoBtoTot;
                    Parameters.ParamByName('VL_PESO_LIQ_TOT').Value   := vVlPesoLiqTot;
                    Parameters.ParamByName('TX_EMBALAGEM').Value      := vTxEmbalagem;
                    Parameters.ParamByName('DT_EMBALAGEM').Value      := vDtEmbalagem;
                    Execute;
                  end;
                  conMyIndaia.CommitTrans;
                except
                  conMyIndaia.RollbackTrans;
                  vListAux.Add('Não foi possível integrar o volume '+vCodVolume+'. Informe o suporte(suporte@myindaia.com.br)<br>');
                end;
              end
              else vListAux.Add('Volume não integrado, pois não foram encontradas as mercadorias.<br>');
            end;
          end;
        end else
        if Pos('CHECK', objSheet.Cells[1,6].Value)   > 0 then begin //celula F1
          //inicia a leitura da planilha EUA
          vCodVolume := objSheet.Cells[1,11].Value; //celula K1
          if vCodVolume = '' then
            vListAux.Add('Não foi encontrado o código do volume.<br>')
          else begin
            vListAux.Add('Volume: <b>'+vCodVolume+'</b><br>');
            //apaga o volume caso já exista e não seja continuação
            if Pos('CONT',objSheet.Name) < 1 then
              if not ApagaPacking then begin
              //Conforme info da Jane(SG-Exp) qdo for continuação pegar sempre o valor da ultima planilha 22/06/2007
              //if not ApagaPacking((Pos('CONT',UpperCase(objSheet.Name)) < 1)) then begin
                result := 4;
                Continue;
              end;
            //inicia a verificação das mercadorias
            vMercOk := 0;
            vNrUltLin := objSheet.Cells.SpecialCells(11).Row;
            for vNrLinha := 3 to vNrUltLin do begin
              if Pos('Emb',objSheet.Cells[vNrLinha,1].Value) > 0 then Break;
              vCodMercAux    := objSheet.Cells[vNrLinha,1].Value;
              if vCodMercAux <> '' then
                vCodMerc    := Copy('000000000000000000'+vCodMercAux,Length('000000000000000000'+vCodMercAux)-17,18)
              else vCodMerc := vCodMercAux;
//              vCodMerc    := Copy('000000000000000000'+objSheet.Cells[vNrLinha,1].Value,Length(objSheet.Cells[vNrLinha,1].Value)-17,18);
              vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha,7].Value, 0); //coluna G
              vVlPesoLiq  := StrToFloatDef(objSheet.Cells[vNrLinha,11].Value, 0); //coluna K
              vTpErroPack := '';
              //verifica o código da mercadoria
              if vCodMerc <> '' then
                SalvaDadosMercadoria(1)
              else
                if (vTxUnMedida <> '') and (vVlQtdeMerc <> 0) and (vVlPesoLiq <> 0) then
                  vListAux.Add('Não foi encontrado o código da mercadoria, linha '+IntToStr(vNrLinha)+'.<br>');
            end;
            //totais e informações gerais do volume
            vComprimento  := StrToFloatDef(objSheet.Cells[vNrLinha+1,2].Value, 0); //celula B13
            vAltura       := StrToFloatDef(objSheet.Cells[vNrLinha+1,4].Value, 0); //celula D13
            vLargura      := StrToFloatDef(objSheet.Cells[vNrLinha+1,6].Value, 0); //celula F13
            vVlCubagem    := StrToFloatDef(objSheet.Cells[vNrLinha,5].Value, 0); //celula E12
            vTxEmbalagem  := objSheet.Cells[vNrLinha,2].Value; //celula B12
            vVlPesoLiqTot := StrToFloatDef(objSheet.Cells[vNrLinha,11].Value, 0); //celula K12
            vVlPesoBtoTot := StrToFloatDef(objSheet.Cells[vNrLinha+1,11].Value, 0); //celula K13
            vDtEmbalagem  := StrToDateDef(objSheet.Cells[vNrLinha,5].Value, Date); //celula B12
            //verifica se alguma mercadoria foi incluida corretamente, se sim, inclui o volume
            if vMercOk > 0 then
              SalvaDadosVolume(1)
            else
              vListAux.Add('Volume não integrado, pois não foram encontradas as mercadorias.<br>');
          end;
        end else
        if Pos('Shipment:', objSheet.Cells[2,1].Value)   > 0 then begin //celula B2
           vNrLinha   := 5;
           while (not (objSheet.Cells[vNrLinha,9].Text = '') or not (objSheet.Cells[vNrLinha+1,9].Text = '') or not (objSheet.Cells[vNrLinha+2,9].Text = '')or not (objSheet.Cells[vNrLinha+3,9].Text = '')or not (objSheet.Cells[vNrLinha+4,9].Text = '')or not (objSheet.Cells[vNrLinha+5,9].Text = '')) do
           begin
             if objSheet.Cells[vNrLinha,8].Value <> 'Total:' then
             begin
                vCodVolume := objSheet.Cells[vNrLinha,3].Value;
               if (vCodVolume = '') or (vCodVolume = 'LPN') then
               begin
                   if vCodVolume <> 'LPN' then
                   begin
                     if (objSheet.Cells[vNrLinha,1].Value <> 'Shipment:') and (objSheet.Cells[vNrLinha+1,3].Value <> 'LPN') and (objSheet.Cells[vNrLinha+1,8].Value <> 'Total:') and (objSheet.Cells[vNrLinha,7].Value <> 'Packing List - Exportação') then
                     begin
                       vListAux.Add('Não foi encontrado o código do volume.<br>'+ IntToStr(vNrLinha));
                     end;
                   end;
               end
               else begin
                 vListAux.Add('Volume: <b>'+vCodVolume+'</b><br>');
                 if objSheet.Cells[vNrLinha-1,3].Value = 'LPN' then
                 begin
                   vCubagem := StrToFloatDef(objSheet.Cells[vNrLinha-1,22].Value, 0);
                   if not ApagaPacking then begin
                    result := 4;
                    Continue;
                   end;
                 end;
                 //valores - MERCADORIAS
                  vCodMercAux    := objSheet.Cells[vNrLinha,6].Value;
                  if vCodMercAux <> '' then
                    vCodMerc    := Copy('000000000000000000'+vCodMercAux,Length('000000000000000000'+vCodMercAux)-17,18)
                  else vCodMerc := vCodMercAux;
                  vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha,9].Value, 0); //coluna I
                  vVlPesoLiq  := StrToFloatDef(objSheet.Cells[vNrLinha,14].Value, 0); //coluna O
                  vTpErroPack := '';
                  if vCodMerc <> '' then
                    SalvaDadosMercadoria(5)
                  else
                      vListAux.Add('Não foi encontrado o código da mercadoria, linha '+IntToStr(vNrLinha)+'.<br>');
                 end;
               end else
               begin
                  if vCodVolume = '' then
                    vCodVolume := objSheet.Cells[vNrLinha-2,4].Value;
                 //valores - TOTAIS
                   vVlCubagem    := vCubagem;
                   vVlPesoBtoTot := StrToFloatDef(objSheet.Cells[vNrLinha,16].Value, 0);
                   vVlPesoLiqTot := StrToFloatDef(objSheet.Cells[vNrLinha,14].Value, 0);
                   vTxEmbalagem := '';
                   if vMercOk > 0 then
                    SalvaDadosVolume(1)
                   else
                    vListAux.Add('Volume não integrado, pois não foram encontradas as mercadorias.<br>');
             end;
             Inc(vNrLinha);
           end;
        end else
        if Pos('PACKING', objSheet.Cells[2,3].Value) > 0 then begin //celula C3
          //inicia a leitura da planilha de VOLUMES
          vCodVolume := objSheet.Cells[1,6].Value; //celula F1
          if vCodVolume = '' then
            vListAux.Add('Não foi encontrado o código do volume.<br>')
          else begin
            vListAux.Add('Volume: <b>'+vCodVolume+'</b><br>');
            //apaga o volume caso já exista e não seja continuação
            if Pos('CONT',objSheet.Name) < 1 then //ver pack check
              if not ApagaPacking then begin
              //if not ApagaPacking((Pos('CONT',UpperCase(objSheet.Name)) < 1)) then begin
                result := 4;
                Continue;
              end;
            //inicia a verificação das mercadorias
            vMercOk := 0;
            vNrUltLin := objSheet.Cells.SpecialCells(11).Row;
            for vNrLinha := 4 to vNrUltLin do begin
              if Pos('COMPR',objSheet.Cells[vNrLinha, 1].Value) > 0 then Break;
              vCodMercAux    := objSheet.Cells[vNrLinha,1].Value;
              if vCodMercAux <> '' then
                vCodMerc    := Copy('000000000000000000'+vCodMercAux,Length('000000000000000000'+vCodMercAux)-17,18)
              else vCodMerc := vCodMercAux;
              vVlQtdeMerc := StrToFloatDef(objSheet.Cells[vNrLinha, 3].Value, 0); //coluna C
              vTxUnMedida := objSheet.Cells[vNrLinha, 5].Value; //coluna E
              vVlPesoLiq  := StrToFloatDef(objSheet.Cells[vNrLinha, 6].Value, 0); //coluna F
              vTpErroPack := '';
              //verifica o código da mercadoria
              if vCodMerc <> '' then
                SalvaDadosMercadoria(2)
              else
                if (vTxUnMedida <> '') and (vVlQtdeMerc <> 0) and (vVlPesoLiq <> 0) then
                  vListAux.Add('Não foi encontrado o código da mercadoria, linha '+IntToStr(vNrLinha)+'.<br>');
            end;
            //totais e informações gerais do volume
            vComprimento  := StrToFloatDef(objSheet.Cells[vNrLinha,2].Value, 0); //celula B45
            vAltura       := StrToFloatDef(objSheet.Cells[vNrLinha+1,2].Value, 0); //celula B46
            vLargura      := StrToFloatDef(objSheet.Cells[vNrLinha+2,2].Value, 0); //celula B47
            vVlCubagem    := StrToFloatDef(objSheet.Cells[vNrLinha+3,2].Value, 0); //celula B48
            vTxEmbalagem  := objSheet.Cells[vNrLinha+4,2].Value; //celula B49
            vVlPesoLiqTot := StrToFloatDef(objSheet.Cells[vNrLinha,5].Value, 0); //celula E45
            vVlPesoBtoTot := StrToFloatDef(objSheet.Cells[vNrLinha+1,5].Value, 0); //celula E46
            vDtEmbalagem  := StrToDateDef(objSheet.Cells[vNrLinha+3,5].Value, Date); //celula E48
            //verifica se alguma mercadoria foi incluida corretamente, se sim, inclui o volume
            if vMercOk > 0 then
              SalvaDadosVolume(2)
            else
              vListAux.Add('Volume não integrado, pois não foram encontradas as mercadorias.<br>');
          end;
        end
        else result := 3;
      end;
      //fecha o arquivo
      try
        objBook.Close(false);
        objExcel.Quit;
      except
        if not TerminarProcesso(TxArquivo) then result := 2;
        Exit;
      end;
    except
      if not TerminarProcesso(TxArquivo) then result := 1;
      Exit;
    end;
  finally
    if vListAux.Text <> '' then Response.Write(vListAux.Text);
    //finaliza todos os objetos
    qryVerifPack.Free;
    qryMercFornec.Free;
    qryMercPedido.Free;
    qryExisteFornec.Free;
    cmdMyIndaia.Free;
    conMyIndaia.Free;
    vListAux.Free;
  end;
end;

function TIntegraPlan.Get_RemessaTxt(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer;
var
  vLinha: String;
  vTxt: TextFile;
  conMyIndaia : TADOConnection;
  cmdExecUpdate, cmdExecProc : TADOCommand;
  qryTxt : TADOQuery;
  vListAux: TStringList;
  vInseriu: integer;
  vNrPedido: string[25]; //NR_PEDIDO
  vNrItem: string[6]; //NR_ITEM
  vNrRap: string[6]; //NR_RAP
  vNrRapAno: string[2]; //NR_RAP_ANO
  vNrLocal: string[4]; //NR_LOCAL
  vCdProduto: string[18]; //CD_PRODUTO
  vTxDesc: string[200]; //TX_DESC
  vTxDescI: string[200]; //TX_DESC_ING
  vTxDescE: string[200]; //TX_DESC_ESP
  vQtFornPedido: real; //QT_FORN_PEDIDO
  vCdUnidMed: string[3]; //CD_UNID_MDIDA
  vVlUnit: real; //VL_UNITARIO
  vCdMoeda: string[3]; //CD_MOEDA
  vVlTotal: real; //VL_TOTAL
  vNrPO: string[35]; //NR_PO
  vDtPedido: TDateTime; //DT_PEDIDO
  vCdIncoterm: string[3]; //CD_ICONTERM
  vCdTermoPagto: string[4]; //CD_TERMO_PAGTO
  vCdPaisDest: string[3]; //CD_PAIS_DESTINO
  vCdNCM: string[8]; //CD_NCM
  vVlPLTot: real; //VL_PL_TOTAL
  vVlPBTot: real; //VL_PB_TOTAL
  vCdUnidPeso: string[3]; //CD_UNID_PESO
  vDtRemessa: TDateTime; //DT_REMESSA
  vCdCliEmissor: string[10]; //CD_CLIENTE_EMISSOR
  vCdCliRecebedor: string[10]; //CD_CLIENTE_RECEBEDOR
  vTxMarcacaoCompl: string[30];
  vTxMarcacao: string[30];
  vCdFornecimento: string[10];

  vMemoCj: TStringList;

  procedure InsereDescCJ;
  begin
    conMyIndaia.BeginTrans;
    with cmdExecUpdate do begin
      Parameters.Clear;
      CommandText := 'UPDATE TPE_ITEM SET TX_DESC_CJ = :DESC ' +
                     ' WHERE CD_RAP = ''' + Copy(NrRap, 1, 6) + ''' AND ' +
                     '       CD_RAP_ANO = ''' + Copy(NrRap,7,2) + ''' AND ' +
                     '       NR_PEDIDO = ''' + vNrPedido + ''' AND ' +
                     '       CD_GRUPO = ''' + NrGrupo + ''' AND ' +
                     '       NR_ITEM = ''' + vNrItem + ''' ';
      Parameters.ParamByName('DESC').Value := vMemoCj.Text;
      Execute;
    end;
    conMyIndaia.CommitTrans;
  end;

begin
  result := 0;
  conMyIndaia := TADOConnection.Create(nil);
  cmdExecProc := TADOCommand.Create(nil);
  cmdExecUpdate := TADOCommand.Create(nil);
  qryTxt := TADOQuery.Create(nil);
  vMemoCj := TStringList.Create;
  //lê arquivo Texto
  try
    AssignFile(vTxt,TxArquivo);
  except
    Result := 1;
  end;

  Reset(vTxt);
  vListAux := TStringList.Create;
  try
      //cria a conexão com o banco de dados
    with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor +';Initial Catalog=MYINDAIA;' +
        'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    //cria objeto de comando(para utilizar stored procedures)
    with cmdExecProc do begin
      Connection := conMyIndaia;
      CommandTimeout := 200;
      CommandType := cmdStoredProc;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria objeto de comando(para utilizar updates e inserts em tabelas)
    with cmdExecUpdate do begin
      Connection := conMyIndaia;
      CommandTimeout := 200;
      CommandType := cmdText;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryTxt do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
    end;

    while not Eof (vTxt) do begin
      Readln(vTxt,vLinha);

      //insere o conjunto
      if Copy(vLinha, 1, 2) = 'CJ' then begin
        if vInseriu = 1 then //caso a inserção tenha sido realizada com sucesso, acumula descrição do conunto
           vMemoCj.Text := vMemoCj.Text + Copy(vLinha, 20, 3) + ' ' + Trim(Copy(vLinha, 24, 50)) + ' - ' + Copy(vLinha, 3, 18) + ' #13#10';
         Continue;
       end else begin
        //quando acabar de acumular a descrição dá update
        if vMemoCj.Text <> '' then begin
          InsereDescCj;
          vMemoCj.Text := '';
        end;
      end;

      //limpando variáveis
      vNrPedido := '';
      vNrItem := '';
      vNrRap := '';
      vNrRapAno := '';
      vNrLocal := '';
      vCdProduto := '';
      vTxDesc := '';
      vTxDescI := '';
      vTxDescE := '';
      vQtFornPedido := 0;
      vCdUnidMed := '';
      vVlUnit := 0;
      vCdMoeda := '';
      vVlTotal := 0;
      vNrPO := '';
      vDtPedido := 0;
      vCdIncoterm := '';
      vCdTermoPagto := '';
      vCdPaisDest := '';
      vCdNCM := '';
      vVlPLTot := 0;
      vVlPBTot := 0;
      vCdUnidPeso := '';
      vDtRemessa := 0;
      vCdCliEmissor := '';
      vCdCliRecebedor := '';
      vTxMarcacaoCompl := '';
      vTxMarcacao := '';
      vCdFornecimento := '';

      //lançando dados do arquivo
      vNrPedido := Copy(vLinha, 249, 10);
      vNrItem := Copy(vLinha, 259, 6);
      vNrRap := Copy(vLinha, 2, 6);
      vNrRapAno := Copy(vLinha, 8, 2);
      vCdFornecimento := Copy(vLinha, 14, 10);
      vNrLocal := Copy(vLinha, 10, 4);
      vCdProduto := Copy(vLinha, 30, 18);
      vTxDesc := Copy(vLinha, 48, 50);
      vTxDescI := Copy(vLinha, 98, 50);
      vTxDescE := Copy(vLinha, 148, 50);
      vQtFornPedido := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 198, 15)), '.', ',', [rfReplaceAll]), 0);
      vCdUnidMed := Copy(vLinha, 213, 3);
      vVlUnit := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 216, 15)), '.', ',', [rfReplaceAll]), 0);
      vCdMoeda := Copy(vLinha, 231, 3);
      vVlTotal := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 234, 15)), '.', ',', [rfReplaceAll]), 0);
      vNrPO := Copy(vLinha, 265, 35);
      vDtPedido := StrToDateDef(Copy(vLinha, 306, 2) + '/' + Copy(vLinha, 304, 2) + '/' + Copy(vLinha, 300, 4), 0);
      vCdIncoterm := Copy(vLinha, 308, 3);
      vCdTermoPagto := Copy(vLinha, 311, 4);
      vCdPaisDest := Copy(vLinha, 315, 3);
      vCdNCM := Copy(vLinha, 318, 8);
      vVlPLTot := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 326, 15)), '.', ',', [rfReplaceAll]), 0);
      vVlPBTot := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 341, 15)), '.', ',', [rfReplaceAll]), 0);
      vCdUnidPeso := Copy(vLinha, 356, 3);
      vDtRemessa := StrToDateDef(Copy(vLinha, 306, 2) + '/' + Copy(vLinha, 304, 2) + '/' + Copy(vLinha, 300, 4), 0);
      vCdCliEmissor := Copy(vLinha, 393, 10);
      vCdCliRecebedor := Copy(vLinha, 671, 10);
      vTxMarcacao := Trim(StringReplace(Copy(vLinha, 965,30),'SI:','',[rfReplaceAll]));
      vTxMarcacaoCompl := Trim(StringReplace(Copy(vLinha, 995,30),'SI:','',[rfReplaceAll]));
      // verifica mercadorias sem alguma descrição
      if vCdProduto = '' then begin
        vListAux.Add('<br> - sem código da mercadoria;');
        Result := 3;
      end
      else vListAux.Add('mercadoria: '+vCdProduto);
      if Trim(vTxDescE) = '' then begin
        vListAux.Add('<br> - mercadoria sem descrição em espanhol;');
        Result := 3;
      end;
      if Trim(vTxDescI) = '' then begin
        vListAux.Add('<br> - mercadoria sem descrição em inglês;');
        Result := 3;
      end;
      //verifica se existe esse PE salvo
      with qryTxt do begin
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) FROM TPE_ITEM (NOLOCK) WHERE NR_PEDIDO = :NR_PEDIDO AND NR_ITEM = :NR_ITEM AND CD_FORNECIMENTO = :CD_FORNECIMENTO');
        Parameters.ParamByName('NR_PEDIDO').Value       := vNrPedido;
        Parameters.ParamByName('NR_ITEM').Value         := vNrItem;
        Parameters.ParamByName('CD_FORNECIMENTO').Value := vCdFornecimento;
        Open;
        if Fields[0].Value > 0 then begin
          Result := 2;
          vListAux.Add('Já existe o Pedido '+vNrPedido +' e item '+vNrItem+' integrado no sistema! <br>' );
        end;
        Close;
      end;

      if Result = 3 then begin
        vListAux.Add('<br> *Erros encontrados na integração dos pedidos: <b>'+vNrPedido+'</b>. Pedidos não integrados.')
      end else if Result = 0 then begin

        try
          conMyIndaia.BeginTrans;
          with cmdExecUpdate do begin
            Parameters.Clear;
            CommandText := 'INSERT INTO TPE_ITEM( ' +
              'NR_PEDIDO, NR_ITEM, CD_RAP, CD_RAP_ANO, CD_GRUPO, NR_LOCAL, CD_PRODUTO, TX_DESC, TX_DESC_ING, TX_DESC_ESP, ' +
              'QT_FORN_PEDIDO, CD_UNID_MEDIDA, VL_UNITARIO, CD_MOEDA, VL_TOTAL, NR_PO, DT_PEDIDO, CD_INCOTERM, ' +
              'CD_TERMO_PAGTO, CD_PAIS_DESTINO, CD_NCM, VL_PL_TOTAL, VL_PB_TOTAL, CD_UNID_PESO, DT_REMESSA, ' +
              'CD_CLIENTE_EMISSOR, CD_CLIENTE_RECEBEDOR, TX_MARCACAO, TX_MARCACAO_COMPL, CD_FORNECIMENTO) ' +
              'VALUES (:NR_PEDIDO, :NR_ITEM, :CD_RAP, :CD_RAP_ANO, :CD_GRUPO, :NR_LOCAL, :CD_PRODUTO, :TX_DESC, :TX_DESC_ING, :TX_DESC_ESP, ' +
              ':QT_FORN_PEDIDO, :CD_UNID_MEDIDA, :VL_UNITARIO, :CD_MOEDA, :VL_TOTAL, :NR_PO, :DT_PEDIDO, :CD_INCOTERM, ' +
              ':CD_TERMO_PAGTO, :CD_PAIS_DESTINO, :CD_NCM, :VL_PL_TOTAL, :VL_PB_TOTAL, :CD_UNID_PESO, :DT_REMESSA, ' +
              ':CD_CLIENTE_EMISSOR, :CD_CLIENTE_RECEBEDOR, :TX_MARCACAO, :TX_MARCACAO_COMPL, ISNULL(:CD_FORNECIMENTO,''X'') ) ';
            Parameters.ParamByName('NR_PEDIDO').Value            := vNrPedido;
            Parameters.ParamByName('NR_ITEM').Value              := vNrItem;
            Parameters.ParamByName('CD_RAP').Value               := Copy(NrRap,1,6);
            Parameters.ParamByName('CD_RAP_ANO').Value           := Copy(NrRap,7,2);
            Parameters.ParamByName('CD_GRUPO').Value             := NrGrupo;
            Parameters.ParamByName('CD_FORNECIMENTO').Value      := vCdFornecimento;
            Parameters.ParamByName('NR_LOCAL').Value             := vNrLocal;
            Parameters.ParamByName('CD_PRODUTO').Value           := vCdProduto;
            Parameters.ParamByName('TX_DESC').Value              := vTxDesc;
            Parameters.ParamByName('TX_DESC_ING').Value          := vTxDescI;
            Parameters.ParamByName('TX_DESC_ESP').Value          := vTxDescE;
            Parameters.ParamByName('QT_FORN_PEDIDO').Value       := vQtFornPedido;
            Parameters.ParamByName('CD_UNID_MEDIDA').Value       := vCdUnidMed;
            Parameters.ParamByName('VL_UNITARIO').Value          := vVlUnit;
            Parameters.ParamByName('CD_MOEDA').Value             := vCdMoeda;
            Parameters.ParamByName('VL_TOTAL').Value             := vVlTotal;
            Parameters.ParamByName('NR_PO').Value                := vNrPO;
            Parameters.ParamByName('DT_PEDIDO').Value            := vDtPedido;
            Parameters.ParamByName('CD_INCOTERM').Value          := vCdIncoterm;
            Parameters.ParamByName('CD_TERMO_PAGTO').Value       := vCdTermoPagto;
            Parameters.ParamByName('CD_PAIS_DESTINO').Value      := vCdPaisDest;
            Parameters.ParamByName('CD_NCM').Value               := vCdNCM;
            Parameters.ParamByName('VL_PL_TOTAL').Value          := vVlPLTot;
            Parameters.ParamByName('VL_PB_TOTAL').Value          := vVlPBTot;
            Parameters.ParamByName('CD_UNID_PESO').Value         := vCdUnidPeso;
            Parameters.ParamByName('DT_REMESSA').Value           := vDtRemessa;
            Parameters.ParamByName('CD_CLIENTE_EMISSOR').Value   := vCdCliEmissor;
            Parameters.ParamByName('CD_CLIENTE_RECEBEDOR').Value := vCdCliRecebedor;
            Parameters.ParamByName('TX_MARCACAO').Value          := vTxMarcacao;
            Parameters.ParamByName('TX_MARCACAO_COMPL').Value    := vTxMarcacaoCompl;

            Execute;
            vInseriu := 1;
          end;
          conMyIndaia.CommitTrans;
        except
          vListAux.Add('Erro ao executar a integração da Remessa do Pedido '+vNrPedido +' e item '+vNrItem+'!' +cSUPORTE);
          conMyIndaia.RollbackTrans;
          vInseriu := 0;
        end;
      end;

    end;
    CloseFile(vTxt);
  finally
    if vListAux.Text <> '' then Response.Write(vListAux.Text);
    //finaliza todos os objetos
    qryTxt.Free;
    cmdExecUpdate.Free;
    cmdExecProc.Free;
    conMyIndaia.Free;
    vListAux.Free;
  end;


end;

function TIntegraPlan.Get_Remessa(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer;
var
  conMyIndaia, conBroker : TADOConnection;
  cmdExecUpdate, cmdExecProc : TADOCommand;
  qryFornecimento, qryMercadoriaEXP : TADOQuery;
  vNrTodosForn, vNrFornecXLS, vNrFornec, vSimFornec, vNaoFornec, vCodItem, vTxMerc, vTxMercI, vTxMercE : string;
  vNrItemCli, vNrReferencia, vCodMerc, vCodIncoterm, vCodModPagto, vTxUnMedida, vTxMoeda, vTxProforma  : string;
  vNrLocal, vNrPO, vCdPaisDest, vCdNCM, vTxUnMedidaPeso, vCdCliEmi, vCdCliRec, vTxMarcacaoCompl, vTxMarcacao, vTxChave, vTxNota: string;
  vVlQtde, vVlPrecoUnit, vVlPrecoTotal, vVlPlTot, vVlPbTot : Double;
  vDtPedido, vDtRemessa : TDateTime;
  vNrUltLin, vNrLinha, num, cont, erros, vInseriu : Integer;
  vListAux, vMemoCJ : TStringList;
  vTxt: TextFile;
  vLinha: string;


  procedure InsereDescCJ;
  begin
    conMyIndaia.BeginTrans;
    with cmdExecUpdate do begin
      Parameters.Clear;
      CommandText := 'UPDATE TRAP_FORNECIMENTO SET TX_DESC_CJ = :DESC ' +
                     ' WHERE CD_RAP = ''' + Copy(NrRap, 1, 6) + ''' AND ' +
                     '       CD_RAP_ANO = ''' + Copy(NrRap,7,2) + ''' AND ' +
                     '       CD_FORNECIMENTO = ''' + vNrFornecXLS + ''' AND ' +
                     '       CD_ITEM = ''' + vCodItem + ''' AND ' +
                     '       CD_GRUPO = ''' + NrGrupo + ''' AND ' +
                     '       CD_MERCADORIA = ''' + vCodMerc + ''' ';
      Parameters.ParamByName('DESC').Value := vMemoCj.Text;
      Execute;
     end;
     conMyIndaia.CommitTrans;
  end;

begin
  result := 0;
  conMyIndaia := TADOConnection.Create(nil);
  cmdExecProc := TADOCommand.Create(nil);
  cmdExecUpdate := TADOCommand.Create(nil);
  qryFornecimento := TADOQuery.Create(nil);
  qryMercadoriaEXP := TADOQuery.Create(nil);
  //vMemoCj := TMemo.Create(nil);
  //lança arquivio no textFile
  try
    AssignFile(vTxt,TxArquivo);
  except
    Result := 1;
  end;

  Reset(vTxt);

  vListAux := TStringList.Create;
//  vListAux.Add('VITOR2');
  try
    //cria a conexão com o banco de dados
    with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor +';Initial Catalog=MYINDAIA;' +
        'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    {
    with conBroker do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor +';Initial Catalog=BROKER;' +
        'User ID=SA;Password=123;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    }
    //cria objeto de comando(para utilizar stored procedures)
    with cmdExecProc do begin
      Connection := conMyIndaia;
      CommandTimeout := 200;
      CommandType := cmdStoredProc;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria objeto de comando(para utilizar updates e inserts em tabelas)
    with cmdExecUpdate do begin
      Connection := conMyIndaia;
      CommandTimeout := 200;
      CommandType := cmdText;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryFornecimento do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
    end;
    //cria a query para consulta de mercadorias

    with qryMercadoriaEXP do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
    end;

    //seleciona os numeros de fornecimentos da rap
    with qryFornecimento do begin
      SQL.Clear;
      SQL.Add('SELECT NR_FORNECIMENTO FROM TRAP (NOLOCK)');
      SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO');
      Parameters.ParamByName('NR_RAP').Value := NrRap;
      Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
      Open;
      vNrTodosForn := Fields[0].Value;
      Close;
    end;

    //verifica se foram digitados os numeros de fornecimento na rap
    if vNrTodosForn = '' then
      vListAux.Add('Não foram informados os números de fornecimento na RAP.')
    else begin
      try
        vSimFornec := '';
    		vNaoFornec := '';
        //verifica nr. do fornecimento
        while not Eof (vTxt) do begin
          Readln(vTxt,vLinha);
          //verifica se é um conjunto, caso seja ignora a linha pois a mesma será inserida na mercadoria
          if Copy(vLinha, 1, 2) = 'CJ' then Continue;
          vNrFornecXls := Copy(vLinha, 14, 10);
          //verifica se é um fornecimento da rap
//          vListAux.Add('vNrFornecXLS: ' + vNrFornecXLS + ' - vNrTodosForn: ' + vNrTodosForn + ' - vSimFornec: ' + vSimFornec);
          if Pos(vNrFornecXLS, vNrTodosForn) > 0 then begin
            if Pos(vNrFornecXLS, vSimFornec) = 0 then vSimFornec := vSimFornec+trim(vNrFornecXLS)+'|';
          end else if vNrFornecXLS <> '' then begin
            if Pos(vNrFornecXLS, vNaoFornec) = 0 then vNaoFornec := vNaoFornec+trim(vNrFornecXLS)+'|';
          end;
				end;
        if vSimFornec <> '' then vSimFornec := Copy(vSimFornec, 1, Length(vSimFornec)-1);
        if vNaoFornec <> '' then vNaoFornec := Copy(vNaoFornec, 1, Length(vNaoFornec)-1);
        //executa tarefas de preparação para a integração
//        vListAux.Add('vSimFornec: ' + vSimFornec);
		    if vSimFornec = '' then
          vListAux.Add('Não foram encontrados os fornecimentos informados na rap nesta planilha integrada.')
        else begin
			    //apaga os fornecimentos da tabela para serem novamente integrados(se existir)
          try
            conMyIndaia.BeginTrans;
            with qryFornecimento do begin
              SQL.Clear;
              SQL.Add('DELETE TRAP_FORNECIMENTO WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO');
              SQL.Add('  AND CD_FORNECIMENTO IN ('''+StringReplace(vSimFornec,'|',''',''',[rfReplaceAll])+''')');
              Parameters.ParamByName('NR_RAP').Value := NrRap;
              Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
              num := ExecSQL;
            end;
            //define o próximo código para o item do fornecimento
            if num > 0 then begin
              //executa procedure para remunerar os itens
              with cmdExecProc do begin
                Parameters.Clear;
                CommandText := 'sp_rap_renum_itens';
                Parameters.CreateParameter('@nrRap', ftString, pdInput, 8, NrRap);
                Parameters.CreateParameter('@nrGrupo', ftString, pdInput, 3, NrGrupo);
                Parameters.CreateParameter('@nrUltimo', ftInteger, pdInputOutput, 10, cont);
                Execute;
                cont := Parameters.ParamByName('@nrUltimo').Value;
              end;
            end
            else begin
              //seleciona o total de fornecimentos
              with qryFornecimento do begin
                SQL.Clear;
                SQL.Add('SELECT COUNT(*) FROM TRAP_FORNECIMENTO (NOLOCK)');
                SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO');
                Parameters.ParamByName('NR_RAP').Value := NrRap;
                Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                Open;
                //define onde vai começar o sequencial de item
                cont := Fields[0].Value + 1;
                Close;
              end;
            end;
            conMyIndaia.CommitTrans;
          except
            vListAux.Add('Erro ao tentar excluir os fornecimentos para nova integração!'+cSUPORTE);
            conMyIndaia.RollbackTrans;
            result := 4;
          end;
          //faz a leitura da planilha e insere na tabela
          vMemoCJ := TStringList.Create;
          if result <> 4 then
          begin
            Reset(vTxt);
            vMemoCJ.Text := '';
            while not Eof (vTxt) do begin
              Readln(vTxt,vLinha);
              //insere o conjunto
              if Copy(vLinha, 1, 2) = 'CJ' then begin
                if vInseriu = 1 then //caso a inserção tenha sido realizada com sucesso, acumula descrição do conunto
                  vMemoCj.Text := vMemoCj.Text + Copy(vLinha, 20, 3) + ' ' + Trim(Copy(vLinha, 24, 50)) + ' - ' + Copy(vLinha, 3, 18) + #13#10;
                Continue;
              end else begin
                //quando acabar de acumular a descrição dá update
                if vMemoCj.Text <> '' then begin
                  InsereDescCj;
                  vMemoCj.Text := '';
                end;
              end;

              vNrFornecXLS := Copy(vLinha, 14, 10);
              //verifica se na celula existe um número de fornecimento
              if Pos(vNrFornecXLS, vSimFornec) > 0 then begin
                vListAux.Add('<p>Integração fornecimento: <b>'+vNrFornecXls+'</b>');
                //recupera os valores da planilha excel
                vNrItemCli := Copy(vLinha, 259, 6);
                vCodMerc := Copy(vLinha, 30, 18);
                vTxMerc  := UpperCase(Copy(vLinha, 48, 50));
                vTxMercI := UpperCase(Copy(vLinha, 98, 50));
                vTxMercE := UpperCase(Copy(vLinha, 148, 50));
                vVlQtde := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 198, 15)), '.', ',', [rfReplaceAll]), 0);
                vTxUnMedida := Copy(vLinha, 213, 3);
                vVlPrecoUnit := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 216, 15)), '.', ',', [rfReplaceAll]), 0);
                vTxMoeda := Copy(vLinha, 231, 3);
                vVlPrecoTotal := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 234, 15)), '.', ',', [rfReplaceAll]), 0);
                //vTxProforma := objSheet.Cells[vNrLinha,11].Value; //Coluna K
                vCodIncoterm := Copy(vLinha, 308, 3);
                vCodModPagto := Copy(vLinha, 311, 4);
                vNrReferencia := Copy(vLinha, 249, 10);
                vDtPedido := StrToDateDef(Copy(vLinha, 306, 2) + '/' + Copy(vLinha, 304, 2) + '/' + Copy(vLinha, 300, 4), 0);
                vNrLocal := Copy(vLinha, 10, 4);
                vNrPO := Copy(vLinha, 265, 35);
                vCdPaisDest := Copy(vLinha, 315, 3);
                vCdNCM := Copy(vLinha, 318, 8);
                vTxUnMedidaPeso := Copy(vLinha, 356, 3);
                vVlPlTot := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 326, 15)), '.', ',', [rfReplaceAll]), 0);
                vVlPbTot := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 341, 15)), '.', ',', [rfReplaceAll]), 0);
                vDtRemessa := StrToDateDef(Copy(vLinha, 365, 2) + '/' + Copy(vLinha, 363, 2) + '/' + Copy(vLinha, 359, 4), 0);
                vCdCliEmi := Copy(vLinha, 393, 10);
                vCdCliRec := Copy(vLinha, 671, 10);
                vTxMarcacao := Trim(StringReplace(Copy(vLinha, 965,30),'SI:','',[rfReplaceAll]));
                vTxMarcacaoCompl := Trim(StringReplace(Copy(vLinha, 995,30),'SI:','',[rfReplaceAll]));
                vTxNota := Copy(vLinha, 1026, 9);
                vTxChave := Copy(vLinha, 1035, 44);
                //faz o tratamento das variaveis para inserir na tabela
                vCodItem := AddZero(IntToStr(cont), 3, diEsquerda);
                vNrReferencia := StringReplace(vNrReferencia,' ','',[rfReplaceAll]);
                vNrPO := StringReplace(vNrPO,' ','',[rfReplaceAll]);
                //verifica se aconteceu algum erro durante a leitura das variaveis
                erros := 0;
                if vCodMerc = '' then begin
                  vListAux.Add('<br> - sem código da mercadoria;');
                  erros := erros + 1;
                end
                else vListAux.Add('mercadoria: '+vCodMerc);
                if vCodModPagto = '' then begin
                  vListAux.Add('<br> - sem código da condição de pagamento;');
                  erros := erros + 1;
                end;
                if Trim(vTxMercE) = '' then begin
                  vListAux.Add('<br> - mercadoria sem descrição em espanhol;');
                  erros := erros + 1;
                end;
                if Trim(vTxMercI) = '' then begin
                  vListAux.Add('<br> - mercadoria sem descrição em inglês;');
                  erros := erros + 1;
                end;
                if vCdPaisDest = '' then begin
                  vListAux.Add('<br> - sem país de destino;');
                  erros := erros + 1;
                end;
                if vTxUnMedida = '' then begin
                  vListAux.Add('<br> - sem unidade de medida;');
                  erros := erros + 1;
                end;
                if vTxMoeda = '' then begin
                  vListAux.Add('<br> - sem moeda MLE;');
                  erros := erros + 1;
                end;
                if vVlPrecoUnit = 0 then begin
                  vListAux.Add('<br> - sem valor de preço unitário;');
                  erros := erros + 1;
                end;
                if vVlPrecoTotal = 0 then begin
                  vListAux.Add('<br> - sem valor de preço total;');
                  erros := erros + 1;
                end;
                if vVlQtde = 0 then begin
                  vListAux.Add('<br> - sem quantidade de mercadoria;');
                  erros := erros + 1;
                end;

                vNrLocal := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNrLocal +''' AND CD_GRUPO IN (''028'') AND CD_TABELA=''81''', 'CD_DDBROKER');

                //verifica se foram encontrados erros
                if erros > 0 then
                  vListAux.Add('<br> *Erros encontrados no fornecimento: <b>'+vNrFornecXLS+'</b>. Fornecimento não integrado.')
                else begin
                  //insere na tabela os dados coletados na planilha
                  try
                    conMyIndaia.BeginTrans;
                    with cmdExecUpdate do begin
                      Parameters.Clear;
                      CommandText := 'UPDATE TRAP SET CD_DEP_COLETA = :CD_DEP_COLETA  '+
                      ' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO';
                      Parameters.ParamByName('NR_RAP').Value   := NrRap;
                      Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                      Parameters.ParamByName('CD_DEP_COLETA').Value := vNrLocal;
                      Execute;
                    end;

                    with cmdExecUpdate do begin
                      Parameters.Clear;
                      CommandText := 'INSERT INTO TRAP_FORNECIMENTO ( CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_FORNECIMENTO, CD_ITEM, CD_MERCADORIA, '+
                        '  VL_QTDE, TX_UNID_MEDIDA, VL_PRECO_UNIT, TX_MOEDA, VL_PRECO_TOT, NR_PROFORMA, '+
                        '  CD_INCOTERM, CD_MOD_PAGTO, CD_REFERENCIA, DT_PEDIDO, NR_ITEM_CLIENTE, ' +
                        '  TX_DESC, TX_DESC_ING, TX_DESC_ESP, NR_PO, CD_PAIS_DESTINO, CD_NCM, VL_PESO_LIQ_TOTAL, VL_PESO_BRUTO_TOTAL, '+// , '+
                        '  TX_UNID_MEDIDA_PESO, DT_REMESSA, CD_CLIENTE_EMISSOR, CD_CLIENTE_RECEBEDOR, NR_LOCAL, TX_MARCACAO, TX_MARCACAO_COMPL, CHAVE_NOTA, NR_NOTA )'+
                        'VALUES ( :CD_RAP, :CD_RAP_ANO, :CD_GRUPO, :CD_FORNECIMENTO, :CD_ITEM, :CD_MERCADORIA, '+
                        '  :VL_QTDE, :TX_UNID_MEDIDA, :VL_PRECO_UNIT, :TX_MOEDA, :VL_PRECO_TOT, :NR_PROFORMA, '+
                        '  :CD_INCOTERM, :CD_MOD_PAGTO, :CD_REFERENCIA, :DT_PEDIDO, :NR_ITEM_CLIENTE,  '+
                        '  :TX_DESC, :TX_DESC_ING, :TX_DESC_ESP, :NR_PO, :CD_PAIS_DESTINO, :CD_NCM, :VL_PESO_LIQ_TOTAL, :VL_PESO_BRUTO_TOTAL, '+  //, '+
                        '  :TX_UNID_MEDIDA_PESO, :DT_REMESSA, :CD_CLIENTE_EMISSOR, :CD_CLIENTE_RECEBEDOR, :NR_LOCAL, :TX_MARCACAO, :TX_MARCACAO_COMPL, :CHAVE_NOTA, :NR_NOTA )';

                      Parameters.ParamByName('CD_RAP').Value               := Copy(NrRap,1,6);
                      Parameters.ParamByName('CD_RAP_ANO').Value           := Copy(NrRap,7,2);
                      Parameters.ParamByName('CD_GRUPO').Value             := NrGrupo;
                      Parameters.ParamByName('CD_FORNECIMENTO').Value      := vNrFornecXLS;
                      Parameters.ParamByName('CD_ITEM').Value              := vCodItem;
                      Parameters.ParamByName('CD_MERCADORIA').Value        := vCodMerc;
                      Parameters.ParamByName('VL_QTDE').Value              := vVlQtde;
                      Parameters.ParamByName('TX_UNID_MEDIDA').Value       := vTxUnMedida;
                      Parameters.ParamByName('VL_PRECO_UNIT').Value        := vVlPrecoUnit;
                      Parameters.ParamByName('TX_MOEDA').Value             := vTxMoeda;
                      Parameters.ParamByName('VL_PRECO_TOT').Value         := vVlPrecoTotal;
                      Parameters.ParamByName('NR_PROFORMA').Value          := vTxProforma;
                      Parameters.ParamByName('CD_INCOTERM').Value          := vCodIncoterm;
                      Parameters.ParamByName('CD_MOD_PAGTO').Value         := vCodModPagto;
                      Parameters.ParamByName('CD_REFERENCIA').Value        := vNrReferencia;
                      Parameters.ParamByName('DT_PEDIDO').Value            := vDtPedido;
                      Parameters.ParamByName('NR_ITEM_CLIENTE').Value      := vNrItemCli;
                      Parameters.ParamByName('TX_DESC').Value              := vTxMerc;
                      Parameters.ParamByName('TX_DESC_ING').Value          := vTxMercI;
                      Parameters.ParamByName('TX_DESC_ESP').Value          := vTxMErcE;
                      Parameters.ParamByName('NR_PO').Value                := vNrPO;
                      Parameters.ParamByName('CD_PAIS_DESTINO').Value      := vCdPaisDest;
                      Parameters.ParamByName('CD_NCM').Value               := vCdNCM;
                      Parameters.ParamByName('VL_PESO_LIQ_TOTAL').Value    := vVlPlTot;
                      Parameters.ParamByName('VL_PESO_BRUTO_TOTAL').Value  := vVlPbTot;
                      Parameters.ParamByName('TX_UNID_MEDIDA_PESO').Value  := vTxUnMedidaPeso;
                      Parameters.ParamByName('DT_REMESSA').Value           := vDtRemessa;
                      Parameters.ParamByName('CD_CLIENTE_EMISSOR').Value   := vCdCliEmi;
                      Parameters.ParamByName('CD_CLIENTE_RECEBEDOR').Value := vCdCliRec;
                      Parameters.ParamByName('TX_MARCACAO').Value          := vTxMarcacao;
                      Parameters.ParamByName('TX_MARCACAO_COMPL').Value    := vTxMarcacaoCompl;
                      Parameters.ParamByName('CHAVE_NOTA').Value           := vTxChave;
                      Parameters.ParamByName('NR_NOTA').Value              := vTxNota;
                      Execute;
                    end;

                    if Trim(vCodMerc) <> '' then
                    begin
                      with qryMercadoriaEXP do begin
                        SQL.Clear;
                        SQL.Add(' UPDATE BROKER.DBO.TMERCADORIA_EXP SET ');
                        SQL.Add(' TX_DESC_ESP = :TX_DESC_ESP, ');
                        SQL.Add(' TX_DESC_INGLES = :TX_DESC_INGLES, ');
                        SQL.Add(' CD_NCM_SH = :CD_NCM_SH ');
                        SQL.Add(' WHERE CD_MERCADORIA = :CD_MERCADORIA ');
                        SQL.Add(' AND CD_GRUPO = :CD_GRUPO ');
                        Parameters.ParamByName('TX_DESC_ESP').Value := vTxMErcE;
                        Parameters.ParamByName('TX_DESC_INGLES').Value := vTxMercI;
                        Parameters.ParamByName('CD_NCM_SH').Value := vCdNCM;
                        Parameters.ParamByName('CD_MERCADORIA').Value := vCodMerc;
                        Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add(' UPDATE TMERCADORIA_EXP SET ');
                        SQL.Add(' TX_DESC_ESP = :TX_DESC_ESP, ');
                        SQL.Add(' TX_DESC_INGLES = :TX_DESC_INGLES, ');
                        SQL.Add(' CD_NCM_SH = :CD_NCM_SH ');
                        SQL.Add(' WHERE CD_MERCADORIA = :CD_MERCADORIA ');
                        SQL.Add(' AND CD_GRUPO = :CD_GRUPO ');
                        Parameters.ParamByName('TX_DESC_ESP').Value := vTxMErcE;
                        Parameters.ParamByName('TX_DESC_INGLES').Value := vTxMercI;
                        Parameters.ParamByName('CD_NCM_SH').Value := vCdNCM;
                        Parameters.ParamByName('CD_MERCADORIA').Value := vCodMerc;
                        Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                        ExecSQL;
                      end;
                    end;

                    conMyIndaia.CommitTrans;
                    cont := cont + 1; //incrementa o contador
                    vInseriu := 1;
                  except
                    on e:exception do
                    begin
//                      vListAux.Add('Erro: '+e.Message+cSUPORTE);
                      vListAux.Add('Erro ao executar a integração do fornecimento '+vNrFornecXLS+', mercadoria '+vCodMerc+'!'+#10#13+'<'+e.message+'>'+#10#13+cSUPORTE);
                      conMyIndaia.RollbackTrans;
                      cont := cont - 1;
                      vInseriu := 0;
                    end;
                  end;
                end;
              end;
            end;
            //verifica se todos os fornecimentos já estão integrados
            try
              conMyIndaia.BeginTrans;
              with qryFornecimento do begin
                SQL.Clear;
                SQL.Add('SELECT CD_FORNECIMENTO FROM TRAP_FORNECIMENTO (NOLOCK)');
                SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO GROUP BY CD_FORNECIMENTO');

                Parameters.ParamByName('NR_RAP').Value := NrRap;
                Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                Open;

                if RecordCount = ContaOcorrencias(vNrTodosForn,';')+1 then begin
                  //se já estiverem integrados, executa procedure de verificação
                  with cmdExecProc do begin
                    Parameters.Clear;
                    CommandText := 'sp_rap_verifica_fornec';
                    Parameters.Refresh;
                    Parameters.ParamByName('@nrRap').Value := NrRap;
                    Parameters.ParamByName('@nrGrupo').Value := NrGrupo;
                    Execute;
                  end;
                end
                else begin
                  //verifica quais fornecimentos faltam integrar
                  while not Eof do begin
                    if Pos(Fields[0].Value, vNrTodosForn) = 0 then
                      vNrFornec := vNrFornec+Fields[0].Value;
                    Next;
                    if not Eof then vNrFornec := vNrFornec+', ';
                  end;

                  with cmdExecUpdate do begin
                    Parameters.Clear;
                    CommandText := 'UPDATE TRAP SET IN_FORN_VALIDA = 0, TX_VALIDACAO = :TX_VALIDACAO  '+
                    ' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO';
                    Parameters.ParamByName('NR_RAP').Value   := NrRap;
                    Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                    Parameters.ParamByName('TX_VALIDACAO').Value := 'Para validar os fornecimentos é necessário integrar todos os fornecimentos. Está faltando integrar os fornecimentos '+vNrFornec+' para validação da rap.';
                    Execute;
                  end;
                end;
                Close;
              end;
              conMyIndaia.CommitTrans;
            except
              vListAux.Add('Erro ao tentar realizar a verificação dos fornecimentos!'+cSUPORTE);
              conMyIndaia.RollbackTrans;
            end;
          end;
        end;
        //fecha o arquivo
        try
          //CloseFile(vTxt);
        except
          result := 2;
        end;
      except
        //CloseFile(vTxt);
        result := 1;
      end;
    end;
  finally
    if vListAux.Text <> '' then Response.Write(vListAux.Text);
    //finaliza todos os objetos
    qryFornecimento.Free;
    cmdExecUpdate.Free;
    cmdExecProc.Free;
    conMyIndaia.Free;
    vListAux.Free;
  end;
end;

function TIntegraPlan.Get_RemessaXls(NrRap, NrGrupo, NmServer, TxArquivo: OleVariant): Integer;
var
  vNrPedido, vNrItem, vNrCentro, vNrDocFat, vNrCliente, vNmCliente, vNrMaterial, vNmDenominacao, vNmSgPais, vNmDenPais, vNrUrf, vNmUrf, vNmDestino : string;
  vVlPesoLiq, vVlPesoBru, vNrUnidMed, vNmIncoterm, vVlMoedaDoc, vNmMoeda, vNmCondPgto, vNmDenCondPgto, vNrMeioTransp, vNmMeioTransp, vCodItem, vTipoContainer : string;
  vNmNavio, vNrAgencia, vNmAgencia, vNmNrReserva, vNmIdContainer, vDtPlanEmbarque, vDtEmbarque, vDtEta, vNrInspecao, vNrCiaInspecao, vNmCiaInspecao: string;
  vVlFumigacao, vNmObs, vNrTransp, vNmTransp, vVlEmbarque, vDtFaturamento, vNrTodosPedidos, vSimFornec, vNaoFornec, vNrFornec,vNrQtde, vNrCaixas : string;
  conMyIndaia : TADOConnection;
  cmdExecUpdate, cmdExecProc : TADOCommand;
  qryFornecimento : TADOQuery;
  vNrUltLin, vNrLinha, num, cont, erros, vInseriu : Integer;
  vListAux, vMemoCJ : TStringList;
  I: Integer;
  vExcelApp: TExcelApplication;
  vExcelWB: TExcelWorkbook;
  vExcelWS: TExcelWorksheet;
  cont_update: Integer;
  Data: TDateTime;
  Float: Double;
  Int: Integer;
  Campos: String;
  Loop: Integer;


  procedure InsereDescCJ;
  begin
    conMyIndaia.BeginTrans;
    with cmdExecUpdate do begin
      Parameters.Clear;
      CommandText := 'UPDATE TRAP_FORNECIMENTO SET TX_DESC_CJ = :DESC ' +
                     ' WHERE CD_RAP = ''' + Copy(NrRap, 1, 6) + ''' AND ' +
                     '       CD_RAP_ANO = ''' + Copy(NrRap,7,2) + ''' AND ' +
                     '       CD_FORNECIMENTO = ''' + vNrPedido   + ''' AND ' +
                     '       CD_ITEM = ''' + vNrItem + ''' AND ' +
                     '       CD_GRUPO = ''' + NrGrupo + ''' AND ' +
                     '       CD_MERCADORIA = ''' + vNrMaterial + ''' ';
      Parameters.ParamByName('DESC').Value := vMemoCj.Text;
      Execute;
     end;
     conMyIndaia.CommitTrans;
  end;

begin
   Log('Get_RemessaXls');
   try
      vListAux := TStringList.Create;
  //  vListAux.Add('VITOR2');

    //vListAux.Add('Começo.<br>');
    Log('Get_RemessaXls->Começo');
    vExcelApp := TExcelApplication.Create(nil);
    vExcelWB  := TExcelWorkbook.Create(nil);
    vExcelWS  := TExcelWorksheet.Create(nil);
    Log('Get_RemessaXls->Passou pelo Excel');
    //vListAux.Add('PASSOU PELO EXCEL.<br>');

    vExcelApp.Workbooks.Open(TxArquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
    vExcelWB.ConnectTo(vExcelApp.ActiveWorkbook);
    vExcelWS.ConnectTo(vExcelWB.Sheets.Item[1] as ExcelWorksheet);

    //vListAux.Add('PASSOU PELO EXCEL2.<br>');

    result := 0;
    cont_update := 0;
    conMyIndaia := TADOConnection.Create(nil);
    cmdExecProc := TADOCommand.Create(nil);
    cmdExecUpdate := TADOCommand.Create(nil);
    qryFornecimento := TADOQuery.Create(nil);

    //vListAux.Add('PASSOU PELO EXCEL2.<br>');

    //vMemoCj := TMemo.Create(nil);
    //lança arquivio no textFile
    try
      //cria a conexão com o banco de dados
      with conMyIndaia do begin
        Provider := 'SQLOLEDB.1';
        ConnectionString :=
          'Provider=SQLOLEDB.1;Data Source=' + Servidor +';Initial Catalog=MYINDAIA;' +
          'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
        CursorLocation := clUseServer;
        LoginPrompt := False;
        Connected := True;
      end;
      //cria objeto de comando(para utilizar stored procedures)
      with cmdExecProc do begin
        Connection := conMyIndaia;
        CommandTimeout := 200;
        CommandType := cmdStoredProc;
        ExecuteOptions := [eoExecuteNoRecords];
      end;
      //cria objeto de comando(para utilizar updates e inserts em tabelas)
      with cmdExecUpdate do begin
        Connection := conMyIndaia;
        CommandTimeout := 200;
        CommandType := cmdText;
        ExecuteOptions := [eoExecuteNoRecords];
      end;
      //cria a query para consulta de fornecimentos
      with qryFornecimento do begin
        Connection := conMyIndaia;
        CursorLocation := clUseServer;
        CursorType := ctStatic;
        LockType   := ltReadOnly;
      end;
      //seleciona os numeros de fornecimentos da rap
      with qryFornecimento do begin
        SQL.Clear;
        SQL.Add('SELECT NR_FORNECIMENTO FROM TRAP (NOLOCK) ');
        SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO');
        Parameters.ParamByName('NR_RAP').Value := NrRap;
        Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
        Open;
        vNrTodosPedidos := Fields[0].Value;
        Close;
      end;
      //verifica se foram digitados os numeros de fornecimento na rap
      if vNrTodosPedidos = '' then
        vListAux.Add('Não foram informados os números de fornecimento na RAP.')
      else begin
        try
          vSimFornec := '';
          vNaoFornec := '';
          //verifica nr. do fornecimento
          I := 6;
          while vExcelWS.Range['B' + IntToStr(I), 'B' + IntToStr(I)].Text <> '' do
          begin
            vNrPedido := vExcelWS.Range['B'+ IntToStr(I), 'B'+ IntToStr(I)].Text;
            //verifica se é um fornecimento da rap
  //          vListAux.Add('vNrFornecXLS: ' + vNrFornecXLS + ' - vNrTodosForn: ' + vNrTodosForn + ' - vSimFornec: ' + vSimFornec);
            if Pos(vNrPedido, vNrTodosPedidos) > 0 then
            begin
              if Pos(vNrPedido, vSimFornec) = 0 then vSimFornec := vSimFornec+trim(vNrPedido)+'|';
            end
            else if vNrPedido <> '' then
            begin
              if Pos(vNrPedido, vNaoFornec) = 0 then vNaoFornec := vNaoFornec+trim(vNrPedido)+'|';
            end;
            Inc(I);
          end;
          if vSimFornec <> '' then vSimFornec := Copy(vSimFornec, 1, Length(vSimFornec)-1);
          if vNaoFornec <> '' then vNaoFornec := Copy(vNaoFornec, 1, Length(vNaoFornec)-1);
          //executa tarefas de preparação para a integração
  //        vListAux.Add('vSimFornec: ' + vSimFornec);
          if vSimFornec = '' then
            vListAux.Add('Não foram encontrados os fornecimentos informados na rap nesta planilha integrada.')
          else begin
            //apaga os fornecimentos da tabela para serem novamente integrados(se existir)
            try
              conMyIndaia.BeginTrans;
              with qryFornecimento do begin
                SQL.Clear;
                SQL.Add('DELETE TRAP_FORNECIMENTO WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO ');
                SQL.Add('  AND CD_FORNECIMENTO IN ('''+StringReplace(vSimFornec,'|',''',''',[rfReplaceAll])+''')');
                Parameters.ParamByName('NR_RAP').Value   := NrRap;
                Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                num := ExecSQL;
              end;
              //define o próximo código para o item do fornecimento
              if num > 0 then begin
                //executa procedure para remunerar os itens
                with cmdExecProc do begin
                  Parameters.Clear;
                  CommandText := 'sp_rap_renum_itens';
                  Parameters.CreateParameter('@nrRap', ftString, pdInput, 8, NrRap);
                  Parameters.CreateParameter('@nrGrupo', ftString, pdInput, 3, NrGrupo);
                  Parameters.CreateParameter('@nrUltimo', ftInteger, pdInputOutput, 10, cont);
                  Execute;
                  cont := Parameters.ParamByName('@nrUltimo').Value;
                end;
              end
              else begin
                //seleciona o total de fornecimentos
                with qryFornecimento do begin
                  SQL.Clear;
                  SQL.Add('SELECT COUNT(*) FROM TRAP_FORNECIMENTO (NOLOCK) ');
                  SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO');
                  Parameters.ParamByName('NR_RAP').Value := NrRap;
                  Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                  Open;
                  //define onde vai começar o sequencial de item
                  cont := Fields[0].Value + 1;
                  Close;
                end;
              end;
              conMyIndaia.CommitTrans;
            except
              vListAux.Add('Erro ao tentar excluir os fornecimentos para nova integração!'+cSUPORTE);
              conMyIndaia.RollbackTrans;
              result := 4;
            end;
            //faz a leitura da planilha e insere na tabela
            vMemoCJ := TStringList.Create;
            if result <> 4 then
            begin
              vMemoCJ.Text := '';
              I := 6;
              while vExcelWS.Range['B' + IntToStr(I), 'B' + IntToStr(I)].Text <> '' do
              begin
                //insere o conjunto
                vNrPedido := vExcelWS.Range['B'+ IntToStr(I), 'B'+ IntToStr(I)].Text;
                //verifica se na celula existe um número de fornecimento
                if Pos(vNrPedido, vSimFornec) > 0 then begin
                  vListAux.Add('<p>Integração processo: <b>'+vNrPedido+'</b>');
                  //recupera os valores da planilha excel
                  vNrItem         := vExcelWS.Range['C'+ IntToStr(I), 'C'+ IntToStr(I)].Text;
                  vNrCentro       := vExcelWS.Range['D'+ IntToStr(I), 'D'+ IntToStr(I)].Text;
                  vNrDocFat       := vExcelWS.Range['E'+ IntToStr(I), 'E'+ IntToStr(I)].Value2;
                  vNrCliente      := vExcelWS.Range['F'+ IntToStr(I), 'F'+ IntToStr(I)].Text;
                  vNmCliente      := vExcelWS.Range['G'+ IntToStr(I), 'G'+ IntToStr(I)].Text;
                  vNrMaterial     := vExcelWS.Range['H'+ IntToStr(I), 'H'+ IntToStr(I)].Text;
                  vNmDenominacao  := vExcelWS.Range['I'+ IntToStr(I), 'I'+ IntToStr(I)].Text;
                  vNmSgPais       := vExcelWS.Range['J'+ IntToStr(I), 'J'+ IntToStr(I)].Text;
                  vNmDenPais      := vExcelWS.Range['K'+ IntToStr(I), 'K'+ IntToStr(I)].Text;
                  vNrUrf          := vExcelWS.Range['L'+ IntToStr(I), 'L'+ IntToStr(I)].Text;
                  vNmUrf          := vExcelWS.Range['M'+ IntToStr(I), 'M'+ IntToStr(I)].Text;
                  vNmDestino      := vExcelWS.Range['N'+ IntToStr(I), 'N'+ IntToStr(I)].Text;
                  vVlPesoLiq      := vExcelWS.Range['O'+ IntToStr(I), 'O'+ IntToStr(I)].Text;
                  vVlPesoBru      := vExcelWS.Range['P'+ IntToStr(I), 'P'+ IntToStr(I)].Text;
                  vNrUnidMed      := vExcelWS.Range['Q'+ IntToStr(I), 'Q'+ IntToStr(I)].Text;
                  vNmIncoterm     := vExcelWS.Range['R'+ IntToStr(I), 'R'+ IntToStr(I)].Text;
                  vVlMoedaDoc     := vExcelWS.Range['S'+ IntToStr(I), 'S'+ IntToStr(I)].Text;
                  vNmMoeda        := vExcelWS.Range['T'+ IntToStr(I), 'T'+ IntToStr(I)].Text;
                  vNmCondPgto     := vExcelWS.Range['U'+ IntToStr(I), 'U'+ IntToStr(I)].Text;
                  vNmDenCondPgto  := vExcelWS.Range['V'+ IntToStr(I), 'V'+ IntToStr(I)].Text;
                  vNrMeioTransp   := vExcelWS.Range['W'+ IntToStr(I), 'W'+ IntToStr(I)].Text;
                  vNmMeioTransp   := vExcelWS.Range['X'+ IntToStr(I), 'X'+ IntToStr(I)].Text;
                  vNrQtde         := vExcelWS.Range['Y'+ IntToStr(I), 'Y'+ IntToStr(I)].Text;
                  vNrCaixas       := vExcelWS.Range['Z'+ IntToStr(I), 'Z'+ IntToStr(I)].Text;
                  vNmNavio        := vExcelWS.Range['AA'+ IntToStr(I), 'AA'+ IntToStr(I)].Text;
                  vNrAgencia      := vExcelWS.Range['AB'+ IntToStr(I), 'AB'+ IntToStr(I)].Text;
                  vNmAgencia      := vExcelWS.Range['AC'+ IntToStr(I), 'AC'+ IntToStr(I)].Text;
                  vNmNrReserva    := vExcelWS.Range['AD'+ IntToStr(I), 'AD'+ IntToStr(I)].Text;
                  vNmIdContainer  := vExcelWS.Range['AE'+ IntToStr(I), 'AE'+ IntToStr(I)].Text;
                  vDtPlanEmbarque := vExcelWS.Range['AF'+ IntToStr(I), 'AF'+ IntToStr(I)].Text;
                  vDtEmbarque     := vExcelWS.Range['AG'+ IntToStr(I), 'AG'+ IntToStr(I)].Text;
                  vDtEta          := vExcelWS.Range['AH'+ IntToStr(I), 'AH'+ IntToStr(I)].Text;
                  vNrInspecao     := vExcelWS.Range['AI'+ IntToStr(I), 'AI'+ IntToStr(I)].Text;
                  vNrCiaInspecao  := vExcelWS.Range['AJ'+ IntToStr(I), 'AJ'+ IntToStr(I)].Text;
                  vNmCiaInspecao  := vExcelWS.Range['AK'+ IntToStr(I), 'AK'+ IntToStr(I)].Text;
                  vVlFumigacao    := vExcelWS.Range['AL'+ IntToStr(I), 'AL'+ IntToStr(I)].Text;
                  vNmObs          := vExcelWS.Range['AM'+ IntToStr(I), 'AM'+ IntToStr(I)].Text;
                  vNrTransp       := vExcelWS.Range['AN'+ IntToStr(I), 'AN'+ IntToStr(I)].Text;
                  vNmTransp       := vExcelWS.Range['AO'+ IntToStr(I), 'AO'+ IntToStr(I)].Text;
                  vVlEmbarque     := vExcelWS.Range['AP'+ IntToStr(I), 'AP'+ IntToStr(I)].Text;
                  vDtFaturamento  := vExcelWS.Range['AQ'+ IntToStr(I), 'AQ'+ IntToStr(I)].Text;
                  vTipoContainer  := vExcelWS.Range['AR'+ IntToStr(I), 'AR'+ IntToStr(I)].Text;
                  vCodItem        := AddZero(IntToStr(cont), 3, diEsquerda);

                  vNmMoeda        := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNmMoeda +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''33''', 'CD_DDBROKER');
                  vNrCliente      := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNrCliente +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''26''', 'CD_DDBROKER');
                  vNmSgPais       := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNmSgPais +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''27''', 'CD_DDBROKER');
                  vNmCondPgto     := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNmCondPgto +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''28''', 'CD_DDBROKER');
                  vNrAgencia      := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNrAgencia +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''30''', 'CD_DDBROKER');
                  vNrTransp       := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNrTransp +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''31''', 'CD_DDBROKER');
                  vNmNavio        := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ Copy(vNmNavio,1,15) +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''32''', 'CD_DDBROKER');
                  vNrUrf          := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNrUrf +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''40''', 'CD_DDBROKER');
                  vNmDestino      := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = '''+ vNmDestino +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''40''', 'CD_DDBROKER');

                  //verifica se aconteceu algum erro durante a leitura das variaveis
                  erros := 0;
                  if vNrMaterial = '' then begin
                    vListAux.Add('<br> - sem código da mercadoria;');
                    erros := erros + 1;
                  end;

                  if vNmMoeda = '' then begin
                    vListAux.Add('<br> - sem codigo da moeda MLE;');
                    erros := erros + 1;
                  end;

                  if vNrCliente = '' then begin
                    vListAux.Add('<br> - sem codigo do cliente;');
                    erros := erros + 1;
                  end;
                  if vNmSgPais = '' then begin
                    vListAux.Add('<br> - sem codigo do país de destino;');
                    erros := erros + 1;
                  end;
                  if vNmCondPgto = '' then begin
                    vListAux.Add('<br> - sem código da condição de pagamento;');
                    erros := erros + 1;
                  end;
                  if vNrMeioTransp = '' then begin
                    vListAux.Add('<br> - sem código da via de transporte;');
                    erros := erros + 1;
                  end;
                  if vNrAgencia = '' then begin
                    vListAux.Add('<br> - sem código do agente;');
                    erros := erros + 1;
                  end;
                  if vNrTransp = '' then begin
                    vListAux.Add('<br> - sem código da transportadora;');
                    erros := erros + 1;
                  end;
                  if vNrMeioTransp = '1' then
                  begin
                    if vNmNavio = '' then begin
                      vListAux.Add('<br> - sem código do navio;');
                      erros := erros + 1;
                    end;
                  end;
                  if vNrUrf = '' then begin
                    vListAux.Add('<br> - sem codigo do local de origem;');
                    erros := erros + 1;
                  end;
                  if vNmDestino = '' then begin
                    vListAux.Add('<br> - sem codigo do local de destino;');
                    erros := erros + 1;
                  end;

                  //else vListAux.Add('mercadoria: '+vNrMaterial);
                  //if vNmCondPgto = '' then begin
                  //  vListAux.Add('<br> - sem código da condição de pagamento;');
                  //  erros := erros + 1;
                  //end;
                  //if vNmSgPais = '' then begin
                  //  vListAux.Add('<br> - sem país de destino;');
                  //  erros := erros + 1;
                  //end;
                  //if vNrUnidMed = '' then begin
                  //  vListAux.Add('<br> - sem unidade de medida;');
                  //  erros := erros + 1;
                  //end;
                  //if vNmMoeda = '' then begin
                  //  vListAux.Add('<br> - sem moeda MLE;');
                  //  erros := erros + 1;
                  //end;
                  //if (vNrQtde = '0') or (vNrQtde = '') then begin
                  //  vListAux.Add('<br> - sem quantidade de mercadoria;');
                  //  erros := erros + 1;
                  //end;

                  //verifica se foram encontrados erros
                  if erros > 0 then begin
                    vListAux.Add('<br> *Erros encontrados no processo: <b>'+vNrPedido+'</b>. Fornecimento não integrado.');
                    Inc(I);
                  end
                  else begin
                    //insere na tabela os dados coletados na planilha
                    try
                      conMyIndaia.BeginTrans;

                      with cmdExecUpdate do begin
                        Parameters.Clear;
                        if cont_update = 0 Then
                        begin
                          CommandText := 'UPDATE TRAP ' +
                          ' SET CD_RAP = :CD_RAP, ' +
                          '     CD_RAP_ANO = :CD_RAP_ANO, ' +
                          '     NR_CENTRO = :NR_CENTRO, ' +
                          '     CD_CLIENTE = :CD_CLIENTE, ' +
                          '     CD_PAIS = :CD_PAIS, ' +
                          '     CD_LOCAL_ORIGEM = :CD_LOCAL_ORIGEM, ' +
                          '     CD_LOCAL_DESTINO = :CD_LOCAL_DESTINO, ' +
                          '     CD_INCOTERM = :CD_INCOTERM, ' +
                          '     CD_MOEDA_MLE = :CD_MOEDA_MLE, ' +
                          '     CD_TERMO_PAGTO = :CD_TERMO_PAGTO, '+
                          '     CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE, '+
                          '     CD_EMBARCACAO = :CD_EMBARCACAO, ' +
                          '     CD_EMBARCADOR = :CD_EMBARCADOR, ' +
                          '     NR_RESERVA = :NR_RESERVA, ' +
                          '     DT_PREV_EMBARQUE = :DT_PREV_EMBARQUE, ' +
                          '     DT_EMBARQUE = :DT_EMBARQUE, ' +
                          '     DT_ETA = :DT_ETA, ' +
                          '     NR_INSPECAO = :NR_INSPECAO, ' +
                          '     TX_ORGAO = :TX_ORGAO, ' +
                          '     CD_ORGAO = :CD_ORGAO, ' +
                          '     IN_FUMIGACAO = :IN_FUMIGACAO, ' +
                          '     TX_OBS = :TX_OBS, ' +
                          '     CD_TRANSPORTADORA = :CD_TRANSPORTADORA, ' +
                          '     IN_EMBARQUE = :IN_EMBARQUE, ' +
                          '     DT_FATURAMENTO = :DT_FATURAMENTO ' +
                          ' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO';

                          if Pos('X', vVlFumigacao) > 0  then
                             vVlFumigacao := '1'
                          else
                             vVlFumigacao := '0';

                          if Pos('X', vVlEmbarque) > 0 then
                            vVlEmbarque := '1'
                          else
                            vVlEmbarque := '0';

                          Parameters.ParamByName('NR_RAP').Value             := trim(NrRap);
                          Parameters.ParamByName('CD_GRUPO').Value           := trim(NrGrupo);
                          Parameters.ParamByName('CD_RAP').Value             := Copy(NrRap,1,6);
                          Parameters.ParamByName('CD_RAP_ANO').Value         := Copy(NrRap,7,2);
                          Parameters.ParamByName('NR_CENTRO').Value          := trim(vNrCentro);
                          Parameters.ParamByName('CD_CLIENTE').Value         := trim(vNrCliente);
                          Parameters.ParamByName('CD_PAIS').Value            := trim(vNmSgPais);
                          Parameters.ParamByName('CD_LOCAL_ORIGEM').Value    := trim(vNrUrf);
                          Parameters.ParamByName('CD_LOCAL_DESTINO').Value   := trim(vNmDestino);
                          Parameters.ParamByName('CD_INCOTERM').Value        := trim(vNmIncoterm);
                          Parameters.ParamByName('CD_MOEDA_MLE').Value       := trim(vNmMoeda);
                          Parameters.ParamByName('CD_TERMO_PAGTO').Value     := trim(vNmCondPgto);
                          Parameters.ParamByName('CD_VIA_TRANSPORTE').Value  := trim(AddZero(vNrMeioTransp,2,diEsquerda));

                          if vNrMeioTransp = '1' then
                            Parameters.ParamByName('CD_EMBARCACAO').Value      := trim(vNmNavio)
                          else
                            Parameters.ParamByName('CD_EMBARCACAO').Value      := null;

                          Parameters.ParamByName('CD_EMBARCADOR').Value      := trim(vNrAgencia);
                          Parameters.ParamByName('NR_RESERVA').Value         := trim(vNmNrReserva);
                          Parameters.ParamByName('NR_INSPECAO').Value        := trim(vNrInspecao);
                          Parameters.ParamByName('TX_ORGAO').Value           := trim(vNmCiaInspecao);
                          Parameters.ParamByName('CD_ORGAO').Value           := trim(vNrCiaInspecao);
                          Parameters.ParamByName('IN_FUMIGACAO').Value       := trim(vVlFumigacao);
                          Parameters.ParamByName('TX_OBS').Value             := trim(vNmObs);
                          Parameters.ParamByName('CD_TRANSPORTADORA').Value  := trim(vNrTransp);
                          Parameters.ParamByName('IN_EMBARQUE').Value        := trim(vVlEmbarque);

                          if TryStrToDate(StringReplace(vDtPlanEmbarque,'.','/',[rfReplaceAll]), Data) then
                            Parameters.ParamByName('DT_PREV_EMBARQUE').Value := Data
                          else
                            Parameters.ParamByName('DT_PREV_EMBARQUE').Value := Null;

                          if TryStrToDate(StringReplace(vDtEmbarque,'.','/',[rfReplaceAll]), Data) then
                            Parameters.ParamByName('DT_EMBARQUE').Value := Data
                          else
                            Parameters.ParamByName('DT_EMBARQUE').Value := Null;

                          if TryStrToDate(StringReplace(vDtEta,'.','/',[rfReplaceAll]), Data) then
                            Parameters.ParamByName('DT_ETA').Value := Data
                          else
                            Parameters.ParamByName('DT_ETA').Value := Null;

                          if TryStrToDate(StringReplace(vDtFaturamento,'.','/',[rfReplaceAll]), Data) then
                            Parameters.ParamByName('DT_FATURAMENTO').Value := Data
                          else
                            Parameters.ParamByName('DT_FATURAMENTO').Value := Null;

                          //Campos := '';
                          //for Loop := 0 to Parameters.Count - 1 do
                          //  Campos := Campos + #13#10 + Parameters[Loop].Name + '   ' + VarTypeAsText(VarType(Parameters[Loop].Value)) + '   ' +
                          //     IntToStr(Length(VarToStr(Parameters[Loop].Value)));
                          //ShowMessage(Campos);
                          Execute;
                          cont_update := 1;
                        End;

                        CommandText := 'INSERT INTO TRAP_FORNECIMENTO ( CD_RAP, CD_RAP_ANO, CD_GRUPO, CD_FORNECIMENTO, CD_ITEM, NR_ITEM_CLIENTE, NR_DOC_FATURAMENTO, ' +
                        '  CD_MERCADORIA, TX_DESC, TX_DESC_ING, TX_DESC_ESP, VL_PESO_LIQ_UN, VL_PESO_BRUTO_UN, TX_UNID_MEDIDA, VL_PRECO_UNIT, VL_PRECO_TOT, ' +
                        '  QT_QTDE, QT_CAIXAS, NR_CONTAINER, CD_TIPO_CONTAINER) ' +
                        '  VALUES ( :CD_RAP, :CD_RAP_ANO, :CD_GRUPO, :CD_FORNECIMENTO, :CD_ITEM, :NR_ITEM_CLIENTE, :NR_DOC_FATURAMENTO, ' +
                        '  :CD_MERCADORIA, :TX_DESC, :TX_DESC_ING, :TX_DESC_ESP, :VL_PESO_LIQ_UN, :VL_PESO_BRUTO_UN, :TX_UNID_MEDIDA, :VL_PRECO_UNIT, :VL_PRECO_TOT, ' +
                        '  :QT_QTDE, :QT_CAIXAS, :NR_CONTAINER, :CD_TIPO_CONTAINER )';

                        Parameters.ParamByName('CD_RAP').Value              := Copy(NrRap,1,6);
                        Parameters.ParamByName('CD_RAP_ANO').Value          := Copy(NrRap,7,2);
                        Parameters.ParamByName('CD_GRUPO').Value            := trim(NrGrupo);
                        Parameters.ParamByName('CD_FORNECIMENTO').Value     := vNrPedido;
                        Parameters.ParamByName('CD_ITEM').Value             := vCodItem;
                        Parameters.ParamByName('NR_ITEM_CLIENTE').Value     := vNrItem;
                        Parameters.ParamByName('NR_DOC_FATURAMENTO').Value  := vNrDocFat;
                        Parameters.ParamByName('CD_MERCADORIA').Value       := vNrMaterial;
                        Parameters.ParamByName('TX_DESC').Value             := vNmDenominacao;
                        Parameters.ParamByName('TX_DESC_ING').Value         := vNmDenominacao;
                        Parameters.ParamByName('TX_DESC_ESP').Value         := vNmDenominacao;
                        Parameters.ParamByName('TX_UNID_MEDIDA').Value      := vNrUnidMed;
                        Parameters.ParamByName('NR_CONTAINER').Value        := StringReplace(StringReplace(vNmIdContainer,'.','',[rfReplaceAll]),'-','',[rfReplaceAll]);
                        Parameters.ParamByName('CD_TIPO_CONTAINER').Value   := vTipoContainer;

                        if TryStrToFloat(StringReplace(vVlPesoLiq,'.','',[rfReplaceAll]), Float) then
                          Parameters.ParamByName('VL_PESO_LIQ_UN').Value := Float
                        else
                          Parameters.ParamByName('VL_PESO_LIQ_UN').Value := Null;

                        if TryStrToFloat(StringReplace(vVlPesoBru,'.','',[rfReplaceAll]), Float) then
                          Parameters.ParamByName('VL_PESO_BRUTO_UN').Value     := Float
                        else
                          Parameters.ParamByName('VL_PESO_BRUTO_UN').Value  := Null;

                        if TryStrToFloat(StringReplace(vVlMoedaDoc,'.','',[rfReplaceAll]), Float) then
                          begin
                            Parameters.ParamByName('VL_PRECO_UNIT').Value := Float;
                            Parameters.ParamByName('VL_PRECO_TOT').Value := Float;
                          end
                        else
                          begin
                            Parameters.ParamByName('VL_PRECO_UNIT').Value := Null;
                            Parameters.ParamByName('VL_PRECO_TOT').Value := Null;
                          end;

                        if TryStrToInt(vNrQtde, Int) then
                          Parameters.ParamByName('QT_QTDE').Value := Int
                        else
                          Parameters.ParamByName('QT_QTDE').Value := Null;

                        if TryStrToInt(vNrCaixas, Int) then
                          Parameters.ParamByName('QT_CAIXAS').Value := Int
                        else
                          Parameters.ParamByName('QT_CAIXAS').Value := Null;

                        Execute;

                        conMyIndaia.CommitTrans;
                        cont := cont + 1; //incrementa o contador
                        Inc(I);
                        vInseriu := 1;
                      end;
                    except
                      on e:exception do
                      begin
  //                      vListAux.Add('Erro: '+e.Message+cSUPORTE);
                        vListAux.Add('Erro ao executar a integração do processo '+vNrPedido+', mercadoria '+vNrMaterial+'!'+#10#13+'<'+e.message+'>'+#10#13+cSUPORTE);
                        if conMyIndaia.InTransaction then
                          conMyIndaia.RollbackTrans;
                        cont := cont - 1;
                        vInseriu := 0;
                        Inc(I);
                      end; // exception
                    end; // try
                  end;
                end;
              end;

              end;
              //verifica se todos os fornecimentos já estão integrados
              try
                conMyIndaia.BeginTrans;
                with qryFornecimento do begin
                  SQL.Clear;
                  SQL.Add('SELECT CD_FORNECIMENTO FROM TRAP_FORNECIMENTO (NOLOCK)');
                  SQL.Add(' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO GROUP BY CD_FORNECIMENTO');

                  Parameters.ParamByName('NR_RAP').Value := NrRap;
                  Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                  Open;

                  if RecordCount = ContaOcorrencias(vNrTodosPedidos,';')+1 then begin
                    //se já estiverem integrados, executa procedure de verificação
                    with cmdExecProc do begin
                      Parameters.Clear;
                      CommandText := 'sp_rap_verifica_fornec';
                      Parameters.Refresh;
                      Parameters.ParamByName('@nrRap').Value := NrRap;
                      Parameters.ParamByName('@nrGrupo').Value := NrGrupo;
                      Execute;
                    end;
                  end
                  else begin
                    //verifica quais fornecimentos faltam integrar
                    while not Eof do begin
                      if Pos(Fields[0].Value, vNrTodosPedidos) = 0 then
                        vNrFornec := vNrFornec+Fields[0].Value;
                      Next;
                      if not Eof then vNrFornec := vNrFornec+', ';
                    end;

                    with cmdExecUpdate do begin
                      Parameters.Clear;
                      CommandText := 'UPDATE TRAP SET IN_FORN_VALIDA = 0, TX_VALIDACAO = :TX_VALIDACAO '+
                      ' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP AND CD_GRUPO = :CD_GRUPO';

                      Parameters.ParamByName('NR_RAP').Value := NrRap;
                      Parameters.ParamByName('CD_GRUPO').Value := NrGrupo;
                      Parameters.ParamByName('TX_VALIDACAO').Value := 'Para validar os fornecimentos é necessário integrar todos os fornecimentos. Está faltando integrar os fornecimentos '+vNrFornec+' para validação da rap.';
                      Execute;
                    end;
                  end;
                  Close;
                end;
                conMyIndaia.CommitTrans;
              except
                vListAux.Add('Erro ao tentar realizar a verificação dos processos!'+cSUPORTE);
                conMyIndaia.RollbackTrans;
              end;
            end;
          //fecha o arquivo
        except
          result := 1;
        end;
      end;
    finally
      //if vListAux.Text <> '' then Response.Write(vListAux.Text);
      //if vListAux.Text <> '' then ShowMessage(vListAux.Text);
      Response.Write(StringReplace(vListAux.Text, #13#10, '<br>', [rfReplaceAll]));
      //finaliza todos os objetos
      qryFornecimento.Free;
      cmdExecUpdate.Free;
      cmdExecProc.Free;
      conMyIndaia.Free;
      vListAux.Free;
      vExcelWS.Free;
      vExcelWB.Close(True);
      vExcelWB.Free;
      vExcelApp.Quit;
      vExcelApp.Free;
    end;
  except
    on E: Exception do
      Log(E.Message);
    //raise;
  end;
end;

function TIntegraPlan.Get_TranspXls(NrTransp, NmServer, TxArquivo: OleVariant): Integer;
var
  vNrContainer, vNrProcesso, vNrProcessoCompleto, vDtChegadaFabr, vDtEntrTerminal, vDtPreStacking, vDtRealizacao, vDtCarregamento, vDtSolicRetVazio, vDtRetVazio, vDtPrimeiraIntegracao: string;
  vDtChegadaFronteira, vDtSaidaFabr, vDtChegadaAduanaBrasil, vDtSaidaAduanaBrasil, vCruze, vDtChegadaAduanaImportador,
  vDtSaidaAduanaImportador, vDtChegadaImportador, vDtDescargaImportador : string;
  conMyIndaia : TADOConnection;
  cmdExecUpdate : TADOCommand;
  qryContainer : TADOQuery;
  vListAux: TStringList;
  I, cont_datas: Integer;
  vExcelApp: TExcelApplication;
  vExcelWB: TExcelWorkbook;
  vExcelWS: TExcelWorksheet;
  InValidaCntr: Boolean;
  Data : TDateTime;
  vSiglaModal : String;
begin
  vListAux := TStringList.Create;
  vExcelApp := TExcelApplication.Create(nil);
  vExcelWB  := TExcelWorkbook.Create(nil);
  vExcelWS  := TExcelWorksheet.Create(nil);

  vExcelApp.Workbooks.Open(TxArquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
  vExcelWB.ConnectTo(vExcelApp.ActiveWorkbook);
  vExcelWS.ConnectTo(vExcelWB.Sheets.Item[1] as ExcelWorksheet);

  result := 0;
  InValidaCntr := False;
  conMyIndaia := TADOConnection.Create(nil);
  cmdExecUpdate := TADOCommand.Create(nil);
  qryContainer := TADOQuery.Create(nil);

  //cria a conexão com o banco de dados
  with conMyIndaia do
  begin
    Provider := 'SQLOLEDB.1';
    ConnectionString := 'Provider=SQLOLEDB.1;Data Source=' + Servidor +';Initial Catalog=BROKER;' +
      'User ID=SA;Password=123;Persist Security Info=True;';
    CursorLocation := clUseServer;
    LoginPrompt := False;
    Connected := True;
  end;
  with cmdExecUpdate do
  begin
    Connection := conMyIndaia;
    CommandTimeout := 200;
    CommandType := cmdText;
    ExecuteOptions := [eoExecuteNoRecords];
  end;
  with qryContainer do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
  end;
  try
  I := 3;
  while vExcelWS.Range['B' + IntToStr(I), 'B' + IntToStr(I)].Text <> '' do
  begin
    vNrProcesso  := vExcelWS.Range['B'+ IntToStr(I), 'B'+ IntToStr(I)].Text;
    vNrContainer := vExcelWS.Range['C'+ IntToStr(I), 'C'+ IntToStr(I)].Text;
    with qryContainer do
    begin
       SQL.Clear;
       SQL.Add('SELECT PC.NR_PROCESSO AS NR_PROCESSO, ISNULL(CONVERT(VARCHAR,PC.DT_PRIMEIRA_INTEGRACAO,103),'''') AS DT_PRIMEIRA_INTEGRACAO FROM TPROCESSO P (NOLOCK) ');
       SQL.Add(' INNER JOIN TPROCESSO_CNTR PC (NOLOCK) ON PC.NR_PROCESSO = P.NR_PROCESSO');
       SQL.Add(' INNER JOIN TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO = PC.NR_PROCESSO AND RC.TP_REFERENCIA = ''08'' ');
       SQL.Add(' WHERE RC.CD_REFERENCIA LIKE ''%' + vNrProcesso + '%'' AND PC.NR_CNTR = '''+ StringReplace(StringReplace(vNrContainer,'-','',[rfReplaceAll]),'.','',[rfReplaceAll]) +''' AND P.CD_TRANSP_NAC = '''+ NrTransp +'''');
         //Parameters.ParamByName('NR_PROCESSO').Value := vNrProcesso;
         //Parameters.ParamByName('NR_CNTR').Value :=  StringReplace(StringReplace(vNrContainer,'-','',[rfReplaceAll]),'.','',[rfReplaceAll]) ;
         //Parameters.ParamByName('CD_TRANSP_NAC').Value := NrTransp;
       Open;
       if not isEmpty then
       begin
        InValidaCntr := True;
        vNrProcessoCompleto   := FieldByName('NR_PROCESSO').AsString;
        vDtPrimeiraIntegracao := FieldByName('DT_PRIMEIRA_INTEGRACAO').AsString;
        vSiglaModal := Copy(vNrProcessoCompleto, 5, 2);
       end;
       Close;
    end;
    If InValidaCntr Then
    begin
      //recupera os valores da planilha excel
      if vSiglaModal <> 'ER' then
      begin
        vDtSolicRetVazio := vExcelWS.Range['D'+ IntToStr(I), 'D'+ IntToStr(I)].Text;
        vDtRetVazio      := vExcelWS.Range['E'+ IntToStr(I), 'E'+ IntToStr(I)].Text;
        vDtChegadaFabr   := vExcelWS.Range['F'+ IntToStr(I), 'F'+ IntToStr(I)].Text;
        vDtCarregamento  := vExcelWS.Range['G'+ IntToStr(I), 'G'+ IntToStr(I)].Text;
        vDtEntrTerminal  := vExcelWS.Range['H'+ IntToStr(I), 'H'+ IntToStr(I)].Text;
        vDtPreStacking   := vExcelWS.Range['I'+ IntToStr(I), 'I'+ IntToStr(I)].Text;
      end
      else
      begin
        vDtChegadaFabr             := vExcelWS.Range['D'+ IntToStr(I), 'D'+ IntToStr(I)].Text;
        vDtSaidaFabr               := vExcelWS.Range['E'+ IntToStr(I), 'E'+ IntToStr(I)].Text;
        vDtChegadaFronteira        := vExcelWS.Range['F'+ IntToStr(I), 'F'+ IntToStr(I)].Text;
        vDtChegadaAduanaBrasil     := vExcelWS.Range['G'+ IntToStr(I), 'G'+ IntToStr(I)].Text;
        vDtSaidaAduanaBrasil       := vExcelWS.Range['H'+ IntToStr(I), 'H'+ IntToStr(I)].Text;
        vCruze                     := vExcelWS.Range['I'+ IntToStr(I), 'I'+ IntToStr(I)].Text;
        vDtChegadaAduanaImportador := vExcelWS.Range['J'+ IntToStr(I), 'J'+ IntToStr(I)].Text;
        vDtSaidaAduanaImportador   := vExcelWS.Range['K'+ IntToStr(I), 'K'+ IntToStr(I)].Text;
        vDtChegadaImportador       := vExcelWS.Range['L'+ IntToStr(I), 'L'+ IntToStr(I)].Text;
        vDtDescargaImportador      := vExcelWS.Range['M'+ IntToStr(I), 'M'+ IntToStr(I)].Text;
      end;


      try
      conMyIndaia.BeginTrans;
      with cmdExecUpdate do
      begin
        if vSiglaModal <> 'ER' then
        begin

          Parameters.Clear;
          CommandText := 'UPDATE TPROCESSO_CNTR ' +
          ' SET DT_CHEGADA_FABR    = :DT_CHEGADA_FABR, ' +
          '     DT_SOLIC_RET_VAZIO = :DT_SOLIC_RET_VAZIO, ' +
          '     DT_RET_VAZIO       = :DT_RET_VAZIO, ' +
          '     DT_ENTR_TERMINAL   = :DT_ENTR_TERMINAL, ' +
          '     DT_PRE_STACKING    = :DT_PRE_STACKING, ' +
          '     DT_SAIDA_FABR      = :DT_SAIDA_FABR ' +
          ' WHERE NR_PROCESSO = ''' + vNrProcessoCompleto + '''  AND NR_CNTR = '''+StringReplace(StringReplace(vNrContainer,'-','',[rfReplaceAll]),'.','',[rfReplaceAll])+'''';

          if TryStrToDateTime(vDtChegadaFabr, Data) then
            Parameters.ParamByName('DT_CHEGADA_FABR').Value := Data
          else
            Parameters.ParamByName('DT_CHEGADA_FABR').Value := Null;

          if TryStrToDateTime(vDtEntrTerminal, Data) then
            Parameters.ParamByName('DT_ENTR_TERMINAL').Value := Data
          else
            Parameters.ParamByName('DT_ENTR_TERMINAL').Value := Null;

          if TryStrToDateTime(vDtPreStacking, Data) then
            Parameters.ParamByName('DT_PRE_STACKING').Value := Data
          else
            Parameters.ParamByName('DT_PRE_STACKING').Value := Null;

          if TryStrToDateTime(vDtCarregamento, Data) then
            Parameters.ParamByName('DT_SAIDA_FABR').Value := Data
          else
            Parameters.ParamByName('DT_SAIDA_FABR').Value := Null;

          if TryStrToDateTime(vDtSolicRetVazio, Data) then
            Parameters.ParamByName('DT_SOLIC_RET_VAZIO').Value := Data
          else
            Parameters.ParamByName('DT_SOLIC_RET_VAZIO').Value := Null;

          if TryStrToDateTime(vDtRetVazio, Data) then
            Parameters.ParamByName('DT_RET_VAZIO').Value := Data
          else
            Parameters.ParamByName('DT_RET_VAZIO').Value := Null;
        end
        else
        begin
          Parameters.Clear;
          CommandText := 'UPDATE TPROCESSO_CNTR ' +
          ' SET DT_CHEGADA_FABR = :DT_CHEGADA_FABR, ' +
          '     DT_SAIDA_FABR = :DT_SAIDA_FABR, ' +
          '     DT_CHEGADA_FRONTEIRA = :DT_CHEGADA_FRONTEIRA, ' +
          '     DT_CHEGADA_ADUANA_BRASIL = :DT_CHEGADA_ADUANA_BRASIL, ' +
          '     DT_SAIDA_ADUANA_BRASIL = :DT_SAIDA_ADUANA_BRASIL, ' +
          '     DT_CRUZE = :DT_CRUZE, ' +
          '     DT_CHEGADA_ADUANA_IMPORTADOR = :DT_CHEGADA_ADUANA_IMPORTADOR, ' +
          '     DT_SAIDA_ADUANA_IMPORTADOR = :DT_SAIDA_ADUANA_IMPORTADOR, ' +
          '     DT_CHEGADA_IMPORTADOR = :DT_CHEGADA_IMPORTADOR, ' +
          '     DT_DESCARGA_IMPORTADOR = :DT_DESCARGA_IMPORTADOR ' +
          ' WHERE NR_PROCESSO = ''' + vNrProcessoCompleto + '''  AND NR_CNTR = '''+StringReplace(StringReplace(vNrContainer,'-','',[rfReplaceAll]),'.','',[rfReplaceAll])+'''';

          if TryStrToDateTime(vDtChegadaFabr, Data) then
            Parameters.ParamByName('DT_CHEGADA_FABR').Value := Data
          else
            Parameters.ParamByName('DT_CHEGADA_FABR').Value := Null;

          if TryStrToDateTime(vDtSaidaFabr, Data) then
            Parameters.ParamByName('DT_SAIDA_FABR').Value := Data
          else
            Parameters.ParamByName('DT_SAIDA_FABR').Value := Null;

          if TryStrToDateTime(vDtChegadaFronteira, Data) then
            Parameters.ParamByName('DT_CHEGADA_FRONTEIRA').Value := Data
          else
            Parameters.ParamByName('DT_CHEGADA_FRONTEIRA').Value := Null;

          if TryStrToDateTime(vDtChegadaAduanaBrasil, Data) then
            Parameters.ParamByName('DT_CHEGADA_ADUANA_BRASIL').Value := Data
          else
            Parameters.ParamByName('DT_CHEGADA_ADUANA_BRASIL').Value := Null;

          if TryStrToDateTime(vDtSaidaAduanaBrasil, Data) then
            Parameters.ParamByName('DT_SAIDA_ADUANA_BRASIL').Value := Data
          else
            Parameters.ParamByName('DT_SAIDA_ADUANA_BRASIL').Value := Null;

          if TryStrToDateTime(vCruze, Data) then
            Parameters.ParamByName('DT_CRUZE').Value := Data
          else
            Parameters.ParamByName('DT_CRUZE').Value := Null;

          if TryStrToDateTime(vDtChegadaAduanaImportador, Data) then
            Parameters.ParamByName('DT_CHEGADA_ADUANA_IMPORTADOR').Value := Data
          else
            Parameters.ParamByName('DT_CHEGADA_ADUANA_IMPORTADOR').Value := Null;

          if TryStrToDateTime(vDtSaidaAduanaImportador, Data) then
            Parameters.ParamByName('DT_SAIDA_ADUANA_IMPORTADOR').Value := Data
          else
            Parameters.ParamByName('DT_SAIDA_ADUANA_IMPORTADOR').Value := Null;

          if TryStrToDateTime(vDtChegadaImportador, Data) then
            Parameters.ParamByName('DT_CHEGADA_IMPORTADOR').Value := Data
          else
            Parameters.ParamByName('DT_CHEGADA_IMPORTADOR').Value := Null;

          if TryStrToDateTime(vDtDescargaImportador, Data) then
            Parameters.ParamByName('DT_DESCARGA_IMPORTADOR').Value := Data
          else
            Parameters.ParamByName('DT_DESCARGA_IMPORTADOR').Value := Null;

        end;

        Execute;
        conMyIndaia.CommitTrans;

        vListAux.Add('<p>Integração container: <b>'+vNrContainer+'</b>');

        with qryContainer do
        begin
         SQL.Clear;
         SQL.Add(' UPDATE PC ');
         if vDtPrimeiraIntegracao = '' then
          SQL.Add(' SET PC.DT_PRIMEIRA_INTEGRACAO = GETDATE()')
         else
          SQL.Add(' SET PC.DT_ULTIMA_INTEGRACAO = GETDATE()');
         SQL.Add(' FROM TPROCESSO P (NOLOCK) INNER JOIN TPROCESSO_CNTR PC (NOLOCK) ON (PC.NR_PROCESSO = P.NR_PROCESSO) ');
         SQL.Add(' WHERE PC.NR_PROCESSO = ''' + vNrProcessoCompleto + ''' AND PC.NR_CNTR = '''+ StringReplace(StringReplace(vNrContainer,'-','',[rfReplaceAll]),'.','',[rfReplaceAll]) +''' AND P.CD_TRANSP_NAC = '''+ NrTransp +''' ');
           //Parameters.ParamByName('NR_PROCESSO').Value := vNrProcesso;
           //Parameters.ParamByName('NR_CNTR').Value :=  StringReplace(StringReplace(vNrContainer,'-','',[rfReplaceAll]),'.','',[rfReplaceAll]) ;
           //Parameters.ParamByName('CD_TRANSP_NAC').Value := NrTransp;
         ExecSQL;
        end;
        Inc(I);
      end;
      except
        on e:exception do
        begin
          vListAux.Add('Erro ao executar a integração do container '+vNrContainer+'!'+#10#13+'<'+e.message+'>'+#10#13+cSUPORTE);
          if conMyIndaia.InTransaction then
            conMyIndaia.RollbackTrans;
          Inc(I);
        end;

      end;
    end;
  end;
  finally
    //if vListAux.Text <> '' then Response.Write(vListAux.Text);
    //if vListAux.Text <> '' then ShowMessage(vListAux.Text);
    Response.Write(StringReplace(vListAux.Text, #13#10, '<br>', [rfReplaceAll]));
    //finaliza todos os objetos
    cmdExecUpdate.Free;
    conMyIndaia.Free;
    vListAux.Free;
    vExcelWS.Free;
    vExcelWB.Close(True);
    vExcelWB.Free;
    vExcelApp.Quit;
    vExcelApp.Free;
  end;
end;


{

function TIntegraPlan.Get_Remessa(NrRap, NmServer, TxArquivo: OleVariant): Integer;
var
  conMyIndaia : TADOConnection;
  cmdExecUpdate, cmdExecProc : TADOCommand;
  qryFornecimento : TADOQuery;
  vNrTodosForn, vNrFornecXLS, vNrFornec, vSimFornec, vNaoFornec, vCodItem, vTxMerc, vTxMercI, vTxMercE : string;
  vNrItemCli, vNrReferencia, vCodMerc, vCodIncoterm, vCodModPagto, vTxUnMedida, vTxMoeda, vTxProforma  : string;
  vNrLocal, vNrPO, vCdPaisDest, vCdNCM, vTxUnMedidaPeso, vCdCliEmi, vCdCliRec: string;
  vVlQtde, vVlPrecoUnit, vVlPrecoTotal, vVlPlTot, vVlPbTot : Double;
  vDtPedido, vDtRemessa : TDateTime;
  vNrUltLin, vNrLinha, num, cont, erros, vInseriu : Integer;
  vListAux : TStringList;
  vTxt: TextFile;
  vLinha: string;
  vMemoCj: TMemo;
  vTxtPau: TextFile;

  procedure InsereDescCJ;
  var vDesc: string;
  begin
    conMyIndaia.BeginTrans;
    with cmdExecUpdate do begin
      Parameters.Clear;
      CommandText := 'UPDATE TRAP_FORNECIMENTO SET TX_DESC_CJ = :DESC ' +
                     ' WHERE CD_RAP = ''' + Copy(NrRap, 1, 6) + ''' AND ' +
                     '       CD_RAP_ANO = ''' + Copy(NrRap,7,2) + ''' AND ' +
                     '       CD_FORNECIMENTO = ''' + vNrFornecXLS + ''' AND ' +
                     '       CD_ITEM = ''' + vCodItem + ''' AND ' +
                     '       CD_MERCADORIA = ''' + vCodMerc + ''' ';
      Parameters.ParamByName('DESC').Value               := vMemoCj.Text;
      Execute;
      writeLn('insere desc.');
    end;
    conMyIndaia.CommitTrans;
  end;

begin
  result := 0;
  conMyIndaia := TADOConnection.Create(nil);
  cmdExecProc := TADOCommand.Create(nil);
  cmdExecUpdate := TADOCommand.Create(nil);
  qryFornecimento := TADOQuery.Create(nil);
  //vMemoCj := TMemo.Create(nil);
  //lança arquivio no textFile
  AssignFile(vTxtPau, 'c:\pau.txt');
  ReWrite(vTxtPau);
  writeLn('começo de tudo');
  try
    AssignFile(vTxt,TxArquivo);
  except
    Result := 1;
  end;
  writeLn('integrou arquivo');

  Reset(vTxt);
  writeLn('deu reset nele');

  vListAux := TStringList.Create;
  try
    //cria a conexão com o banco de dados
    with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + NmServer +';Initial Catalog=MYINDAIA;' +
        'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    //cria objeto de comando(para utilizar stored procedures)
    with cmdExecProc do begin
      Connection := conMyIndaia;
      CommandTimeout := 60;
      CommandType := cmdStoredProc;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria objeto de comando(para utilizar updates e inserts em tabelas)
    with cmdExecUpdate do begin
      Connection := conMyIndaia;
      CommandTimeout := 60;
      CommandType := cmdText;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryFornecimento do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
    end;
    writeLn('instanciou as querys e connections');
    //seleciona os numeros de fornecimentos da rap
    with qryFornecimento do begin
      SQL.Clear;
      SQL.Add('SELECT NR_FORNECIMENTO FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = :NR_RAP');
      Parameters.ParamByName('NR_RAP').Value := NrRap;
      Open;
      vNrTodosForn := Fields[0].Value;
      Close;
    end;
    writeLn('lançou quantidade total de fornecimentos');
    //verifica se foram digitados os numeros de fornecimento na rap
    if vNrTodosForn = '' then
      vListAux.Add('Não foram informados os números de fornecimento na RAP.')
    else begin
      try
        vSimFornec := '';
    		vNaoFornec := '';
        writeLn('antes do while do número do fornec');
        //verifica nr. do fornecimento
        while not Eof (vTxt) do begin
          writeLn('  entrou no while');
          Readln(vTxt,vLinha);
          writeLn('  leu a linha');
          //verifica se é um conjunto, caso seja ignora a linha pois a mesma será inserida na mercadoria
          if Copy(vLinha, 1, 2) = 'CJ' then Continue;
          vNrFornecXls := Copy(vLinha, 14, 10);
          //verifica se é um fornecimento da rap
          if Pos(vNrFornecXLS, vNrTodosForn) > 0 then begin
            if Pos(vNrFornecXLS, vSimFornec) = 0 then vSimFornec := vSimFornec+trim(vNrFornecXLS)+'|';
          end else if vNrFornecXLS <> '' then begin
            if Pos(vNrFornecXLS, vNaoFornec) = 0 then vNaoFornec := vNaoFornec+trim(vNrFornecXLS)+'|';
          end;
          writeLn('  viu se tinha ou não fornecimento');
				end;
        if vSimFornec <> '' then vSimFornec := Copy(vSimFornec, 1, Length(vSimFornec)-1);
        if vNaoFornec <> '' then vNaoFornec := Copy(vNaoFornec, 1, Length(vNaoFornec)-1);
        //executa tarefas de preparação para a integração
		    if vSimFornec = '' then
          vListAux.Add('Não foram encontrados os fornecimentos informados na rap nesta planilha integrada.')
        else begin
			    //apaga os fornecimentos da tabela para serem novamente integrados(se existir)
          try
            conMyIndaia.BeginTrans;
            with qryFornecimento do begin
              SQL.Clear;
              SQL.Add('DELETE TRAP_FORNECIMENTO WHERE CD_RAP+CD_RAP_ANO = :NR_RAP');
              SQL.Add('  AND CD_FORNECIMENTO IN ('''+StringReplace(vSimFornec,'|',''',''',[rfReplaceAll])+''')');
              Parameters.ParamByName('NR_RAP').Value := NrRap;
              num := ExecSQL;
            end;
            writeLn('apagou a rap');
            //define o próximo código para o item do fornecimento
            if num > 0 then begin
              //executa procedure para remunerar os itens
              with cmdExecProc do begin
                Parameters.Clear;
                CommandText := 'sp_rap_renum_itens';
                Parameters.CreateParameter('@nrRap', ftString, pdInput, 8, NrRap);
                Parameters.CreateParameter('@nrUltimo', ftInteger, pdInputOutput, 10, cont);
                Execute;
                cont := Parameters.ParamByName('@nrUltimo').Value;
              end;
              writeLn('se tinha forn antigo renumera os itens');
            end
            else begin
              //seleciona o total de fornecimentos
              with qryFornecimento do begin
                SQL.Clear;
                SQL.Add('SELECT COUNT(*) FROM TRAP_FORNECIMENTO WHERE CD_RAP+CD_RAP_ANO = :NR_RAP');
                Parameters.ParamByName('NR_RAP').Value := NrRap;
                Open;
                //define onde vai começar o sequencial de item
                cont := Fields[0].Value + 1;
                Close;
              end;
              writeLn('se não tinha forn antigo verifica quantos tem e faz o contador');
            end;
            conMyIndaia.CommitTrans;
          except
            vListAux.Add('Erro ao tentar excluir os fornecimentos para nova integração!'+cSUPORTE);
            conMyIndaia.RollbackTrans;
            result := 4;
          end;
          //faz a leitura da planilha e insere na tabela
          if result <> 4 then
            Reset(vTxt);
            writeLn('vai pro inicio do arquivo');
            //vMemoCJ.Text := '';
            while not Eof (vTxt) do begin
              writeLn('  entra no while do arquivo');
              Readln(vTxt,vLinha);
              writeLn('  le a linha');
               //insere o conjunto
              if Copy(vLinha, 1, 2) = 'CJ' then begin
                if vInseriu = 1 then //caso a inserção tenha sido realizada com sucesso, acumula descrição do conunto
                  vMemoCj.Text := vMemoCj.Text + Copy(vLinha, 20, 3) + ' ' + Trim(Copy(vLinha, 24, 50)) + ' - ' + Copy(vLinha, 3, 18) + #13#10;
                writeLn('    é conjunto, lançou no memo'); 
                Continue;
              end else begin
                //quando acabar de acumular a descrição dá update
                if vMemoCj.Text <> '' then begin
                  InsereDescCj;
                  writeLn('    vai inserir desc. do cj.');
                  vMemoCj.Text := '';
                end;
              end;

              vNrFornecXLS := Copy(vLinha, 14, 10);
              //verifica se na celula existe um número de fornecimento
              if Pos(vNrFornecXLS, vSimFornec) > 0 then begin
                vListAux.Add('<p>Integração fornecimento: <b>'+vNrFornecXls+'</b>');
                //recupera os valores da planilha excel
                vNrItemCli := Copy(vLinha, 259, 6);
                vCodMerc := Copy(vLinha, 30, 18);
                vTxMerc  := UpperCase(Copy(vLinha, 48, 50));
                vTxMercI := UpperCase(Copy(vLinha, 98, 50));
                vTxMercE := UpperCase(Copy(vLinha, 148, 50));
                vVlQtde := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 198, 15)), '.', ',', [rfReplaceAll]), 0);
                vTxUnMedida := Copy(vLinha, 213, 3);
                vVlPrecoUnit := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 216, 15)), '.', ',', [rfReplaceAll]), 0);
                vTxMoeda := Copy(vLinha, 231, 3);
                vVlPrecoTotal := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 234, 15)), '.', ',', [rfReplaceAll]), 0);
                //vTxProforma := objSheet.Cells[vNrLinha,11].Value; //Coluna K
                vCodIncoterm := Copy(vLinha, 308, 3);
                vCodModPagto := Copy(vLinha, 311, 4);
                vNrReferencia := Copy(vLinha, 249, 10);
                vDtPedido := StrToDateDef(Copy(vLinha, 306, 2) + '/' + Copy(vLinha, 304, 2) + '/' + Copy(vLinha, 300, 4), 0);
                vNrLocal := Copy(vLinha, 10, 4);
                vNrPO := Copy(vLinha, 265, 35);
                vCdPaisDest := Copy(vLinha, 315, 3);
                vCdNCM := Copy(vLinha, 318, 8);
                vTxUnMedidaPeso := Copy(vLinha, 356, 3);
                vVlPlTot := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 326, 15)), '.', ',', [rfReplaceAll]), 0);
                vVlPbTot := StrToFloatDef(StringReplace(Trim(Copy(vLinha, 341, 15)), '.', ',', [rfReplaceAll]), 0);
                vDtRemessa := StrToDateDef(Copy(vLinha, 365, 2) + '/' + Copy(vLinha, 363, 2) + '/' + Copy(vLinha, 359, 4), 0);
                vCdCliEmi := Copy(vLinha, 393, 10);
                vCdCliRec := Copy(vLinha, 671, 10);
                //faz o tratamento das variaveis para inserir na tabela
                vCodItem := AddZero(IntToStr(cont), 3, diEsquerda);
                vNrReferencia := StringReplace(vNrReferencia,' ','',[rfReplaceAll]);
                vNrPO := StringReplace(vNrPO,' ','',[rfReplaceAll]);
                writeLn('  passa valores pras variáveis');
                //verifica se aconteceu algum erro durante a leitura das variaveis
                erros := 0;
                if vCodMerc = '' then begin
                  vListAux.Add('<br> - sem código da mercadoria;');
                  erros := erros + 1;
                end
                else vListAux.Add('mercadoria: '+vCodMerc);
                if vCodModPagto = '' then begin
                  vListAux.Add('<br> - sem código da condição de pagamento;');
                  erros := erros + 1;
                end;
                if vCdPaisDest = '' then begin
                  vListAux.Add('<br> - sem país de destino;');
                  erros := erros + 1;
                end;
                if vTxUnMedida = '' then begin
                  vListAux.Add('<br> - sem unidade de medida;');
                  erros := erros + 1;
                end;
                if vTxMoeda = '' then begin
                  vListAux.Add('<br> - sem moeda MLE;');
                  erros := erros + 1;
                end;
                if vVlPrecoUnit = 0 then begin
                  vListAux.Add('<br> - sem valor de preço unitário;');
                  erros := erros + 1;
                end;
                if vVlPrecoTotal = 0 then begin
                  vListAux.Add('<br> - sem valor de preço total;');
                  erros := erros + 1;
                end;
                if vVlQtde = 0 then begin
                  vListAux.Add('<br> - sem quantidade de mercadoria;');
                  erros := erros + 1;
                end;
                //verifica se foram encontrados erros
                 writeLn('analisa erros');
                if erros > 0 then
                  vListAux.Add('*Erros encontrados no fornecimento: <b>'+vNrFornecXLS+'</b>. Fornecimento não integrado.')
                else begin
                  //insere na tabela os dados coletados na planilha
                  try
                    conMyIndaia.BeginTrans;
                    with cmdExecUpdate do begin
                      Parameters.Clear;
                      CommandText := 'INSERT INTO TRAP_FORNECIMENTO ( CD_RAP, CD_RAP_ANO, CD_FORNECIMENTO, CD_ITEM, CD_MERCADORIA, '+
                        '  VL_QTDE, TX_UNID_MEDIDA, VL_PRECO_UNIT, TX_MOEDA, VL_PRECO_TOT, NR_PROFORMA, '+
                        '  CD_INCOTERM, CD_MOD_PAGTO, CD_REFERENCIA, DT_PEDIDO, NR_ITEM_CLIENTE, ' +
                        '  TX_DESC, TX_DESC_ING, TX_DESC_ESP, NR_PO, CD_PAIS_DESTINO, CD_NCM, VL_PESO_LIQ_TOTAL, VL_PESO_BRUTO_TOTAL, '+
                        '  TX_UNID_MEDIDA_PESO, DT_REMESSA, CD_CLIENTE_EMISSOR, CD_CLIENTE_RECEBEDOR, NR_LOCAL )'+
                        'VALUES ( :CD_RAP, :CD_RAP_ANO, :CD_FORNECIMENTO, :CD_ITEM, :CD_MERCADORIA, '+
                        '  :VL_QTDE, :TX_UNID_MEDIDA, :VL_PRECO_UNIT, :TX_MOEDA, :VL_PRECO_TOT, :NR_PROFORMA, '+
                        '  :CD_INCOTERM, :CD_MOD_PAGTO, :CD_REFERENCIA, :DT_PEDIDO, :NR_ITEM_CLIENTE '+
                        '  :TX_DESC, :TX_DESC_ING, :TX_DESC_ESP, :NR_PO, :CD_PAIS_DESTINO, :CD_NCM, :VL_PESO_LIQ_TOTAL, :VL_PESO_BRUTO_TOTAL, '+
                        '  :TX_UNID_MEDIDA_PESO, :DT_REMESSA, :CD_CLIENTE_EMISSOR, :CD_CLIENTE_RECEBEDOR, :NR_LOCAL )';

                      Parameters.ParamByName('CD_RAP').Value               := Copy(NrRap,1,6);
                      Parameters.ParamByName('CD_RAP_ANO').Value           := Copy(NrRap,7,2);
                      Parameters.ParamByName('CD_FORNECIMENTO').Value      := vNrFornecXLS;
                      Parameters.ParamByName('CD_ITEM').Value              := vCodItem;
                      Parameters.ParamByName('CD_MERCADORIA').Value        := vCodMerc;
                      Parameters.ParamByName('VL_QTDE').Value              := vVlQtde;
                      Parameters.ParamByName('TX_UNID_MEDIDA').Value       := vTxUnMedida;
                      Parameters.ParamByName('VL_PRECO_UNIT').Value        := vVlPrecoUnit;
                      Parameters.ParamByName('TX_MOEDA').Value             := vTxMoeda;
                      Parameters.ParamByName('VL_PRECO_TOT').Value         := vVlPrecoTotal;
                      Parameters.ParamByName('NR_PROFORMA').Value          := vTxProforma;
                      Parameters.ParamByName('CD_INCOTERM').Value          := vCodIncoterm;
                      Parameters.ParamByName('CD_MOD_PAGTO').Value         := vCodModPagto;
                      Parameters.ParamByName('CD_REFERENCIA').Value        := vNrReferencia;
                      Parameters.ParamByName('DT_PEDIDO').Value            := vDtPedido;
                      Parameters.ParamByName('NR_ITEM_CLIENTE').Value      := vNrItemCli;
                      Parameters.ParamByName('NR_LOCAL').Value             := vNrLocal;
                      Parameters.ParamByName('TX_DESC').Value              := vTxMerc;
                      Parameters.ParamByName('TX_DESC_ING').Value          := vTxMercI;
                      Parameters.ParamByName('TX_DESC_ESP').Value          := vTxMErcE;
                      Parameters.ParamByName('NR_PO').Value                := vNrPO;
                      Parameters.ParamByName('CD_PAIS_DESTINO').Value      := vCdPaisDest;
                      Parameters.ParamByName('CD_NCM').Value               := vCdNCM;
                      Parameters.ParamByName('VL_PESO_LIQ_TOTAL').Value    := vVlPlTot;
                      Parameters.ParamByName('VL_PESO_BRUTO_TOTAL').Value  := vVlPbTot;
                      Parameters.ParamByName('TX_UNID_MEDIDA_PESO').Value  := vTxUnMedidaPeso;
                      Parameters.ParamByName('DT_REMESSA').Value           := vDtRemessa;
                      Parameters.ParamByName('CD_CLIENTE_EMISSOR').Value   := vCdCliEmi;
                      Parameters.ParamByName('CD_CLIENTE_RECEBEDOR').Value := vCdCliRec;
                      Execute;
                      writeLn('  insere linhas');
                    end;
                    conMyIndaia.CommitTrans;
                    cont := cont + 1; //incrementa o contador
                    vInseriu := 1;
                  except
                    vListAux.Add('Erro ao executar a integração do fornecimento '+vNrFornecXLS+', mercadoria '+vCodMerc+'!'+cSUPORTE);
                    conMyIndaia.RollbackTrans;
                    cont := cont - 1;
                    vInseriu := 0;
                  end;
                end;
              end;
            end;
            //verifica se todos os fornecimentos já estão integrados
            try
              conMyIndaia.BeginTrans;
              with qryFornecimento do begin
                SQL.Clear;
                SQL.Add('SELECT CD_FORNECIMENTO FROM TRAP_FORNECIMENTO (NOLOCK)');
                SQL.Add('WHERE CD_RAP+CD_RAP_ANO = :NR_RAP GROUP BY CD_FORNECIMENTO');
                Parameters.ParamByName('NR_RAP').Value := NrRap;
                Open;
                writeLn('conta os fornecs.');
                if RecordCount = ContaOcorrencias(vNrTodosForn,';')+1 then begin
                  //se já estiverem integrados, executa procedure de verificação
                  with cmdExecProc do begin
                    Parameters.Clear;
                    CommandText := 'sp_rap_verifica_fornec';
                    Parameters.Refresh;
                    Parameters.ParamByName('@nrRap').Value := NrRap;
                    Execute;
                  end;
                  writeLn('se a quantidade é igual verifica fornecimento');
                end
                else begin
                  //verifica quais fornecimentos faltam integrar
                  while not Eof do begin
                    if Pos(Fields[0].Value, vNrTodosForn) = 0 then
                      vNrFornec := vNrFornec+Fields[0].Value;
                    Next;
                    if not Eof then vNrFornec := vNrFornec+', ';
                  end;

                  with cmdExecUpdate do begin
                    Parameters.Clear;
                    CommandText := 'UPDATE TRAP SET IN_FORN_VALIDA = 0, TX_VALIDACAO = :TX_VALIDACAO WHERE CD_RAP+CD_RAP_ANO = :NR_RAP';
                    Parameters.ParamByName('NR_RAP').Value := NrRap;
                    Parameters.ParamByName('TX_VALIDACAO').Value := 'Para validar os fornecimentos é necessário integrar todos os fornecimentos. Está faltando integrar os fornecimentos '+vNrFornec+' para validação da rap.';
                    Execute;
                  end;
                  writeLn('se a quantidade é diferente diz que ainda falta');
                end;
                Close;
              end;
              conMyIndaia.CommitTrans;
            except
              vListAux.Add('Erro ao tentar realizar a verificação dos fornecimentos!'+cSUPORTE);
              conMyIndaia.RollbackTrans;
            end;
        end;
        //fecha o arquivo
        try
          CloseFile(vTxt);
          writeLn('fecha arquivo');
        except
          result := 2;
        end;
      except
        CloseFile(vTxt);
        writeLn('fecha arquivo 2');        
        result := 1;
      end;
    end;
  finally
    if vListAux.Text <> '' then Response.Write(vListAux.Text);
    //finaliza todos os objetos
    //vMemoCj.Free;
    qryFornecimento.Free;
    cmdExecUpdate.Free;
    cmdExecProc.Free;
    conMyIndaia.Free;
    vListAux.Free;
  end;
end;
}
function TIntegraPlan.VerifCubagem(nM3, nComp, nLarg, nAlt : Double) : String;
begin
  result := '';
  //se a cubagem não for valida, calcula o valor
  if nM3 = 0 then begin
    nM3 := nComp * nLarg * nAlt;
    if nM3 = 0 then result := 'O valor da cubagem não foi encontrado e não foi possível calcular seu valor.<br>';
  end;
end;

function TIntegraPlan.VerifPesoBtoTot(nPeso : Double) : String;
begin
  //se o peso bruto for zero
  if nPeso = 0 then
    result := 'O valor do Peso Bruto Total não foi encontrado.<br>'
  else
    result := '';
end;

function TIntegraPlan.VerifPesoLiqTot(nPeso : Double) : String;
begin
  //se o peso liquido for zero
  if nPeso = 0 then
    result := 'O valor do Peso Liquido Total não foi encontrado.<br>'
  else
    result := '';
end;



function TIntegraPlan.Get_GeraID(ID, tipo: OleVariant): Integer;
var
  vExcelApp: TExcelApplication;
  vExcelWB: TExcelWorkbook;
  vExcelWS: TExcelWorksheet;
  vContGeradas, vContFechadas, vContDeclinadas, vCorLinha,
  Linha, I,J, vContEfetuados, vContPropostas : Integer;
  vCondPagto, vContatos, a, cDir_RPT : string;
  conMyIndaia : TADOConnection;
  cmdMyIndaia : TADOCommand;
  qryAux, qryAux2 : TADOQuery;
  PathDig, Assunto, Cliente, Grupo, Modal, vTo, ArquivoPai, vEmailModal : String;
  QtdPai    : Integer;
  Body: TStrings;
  cargo_usuario, id_cliente : String;

  procedure PintaBordas(vCol,vLinha : Integer);
  var
    S: String;
  begin
    S := vExcelWS.Cells.Item[vLinha, vCol].Address;
    //TOP
    vExcelWS.Range[ S, S ].Borders.Item[$00000008].Weight := $00000002;
    vExcelWS.Range[ S, S ].Borders.Item[$00000008].Color  := clBlack;

    //Right
    vExcelWS.Range[ S, S ].Borders.Item[$0000000A].Weight := $00000002;
    vExcelWS.Range[ S, S ].Borders.Item[$0000000A].Color  := clBlack;

    //Left
    vExcelWS.Range[ S, S ].Borders.Item[$00000007].Weight := $00000002;
    vExcelWS.Range[ S, S ].Borders.Item[$00000007].Color  := clBlack;

    //Bottom
    vExcelWS.Range[ S, S ].Borders.Item[$00000009].Weight := $00000002;
    vExcelWS.Range[ S, S ].Borders.Item[$00000009].Color  := clBlack;
  end;
begin
  //ShowMessage('Entrou');
  result := 0;
  cargo_usuario := '';
  id_cliente := '';
  Body := TStringList.Create;
  conMyIndaia := TADOConnection.Create(nil);
  cmdMyIndaia := TADOCommand.Create(nil);
  qryAux      := TADOQuery.Create(nil);
  qryAux2     := TADOQuery.Create(nil);

  vExcelApp := TExcelApplication.Create(nil);
  vExcelWB  := TExcelWorkbook.Create(nil);
  vExcelWS  := TExcelWorksheet.Create(nil);

  //vListAux.Add('PASSOU PELO EXCEL.<br>');

  try
    vExcelApp.Workbooks.Open( 'D:\sites\myindaia\arquivo\upload\InstrucaoDesembaraco.xls', EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
    vExcelWB.ConnectTo(vExcelApp.ActiveWorkbook);
    vExcelWS.ConnectTo(vExcelWB.Sheets.Item[1] as ExcelWorksheet);

    //'C:\sites\myindaia\arquivo\upload\fornec_00626511_07062011_141720.xls'
    //vExcelApp.Workbooks.Open('C:\sites\myindaia\arquivo\upload\fornec_00626511_07062011_141720.xls', EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
    //SL.Add('WB');
    //vExcelWB.ConnectTo(vExcelApp.ActiveWorkbook);
    //SL.Add('WS');
    //vExcelWS.ConnectTo(vExcelWB.Sheets.Item[1] as ExcelWorksheet);
    //vExcelApp.Workbooks.Open(cDir_RPT + '\InstrucaoDesembaraco_' + ID + '.XLS', EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
  except
    on E: Exception do
    begin
      result:=1;
      Exit;
    end;
  end;
  Try
    with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor + ';Initial Catalog=BROKER;' +
        'User ID=SA;Password=123;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    //cria objeto de comando(para utilizar updates e inserts
    with cmdMyIndaia do begin
      CommandTimeout := 200;
      CommandType := cmdText;
      Connection := conMyIndaia;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryAux do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

     with qryAux2 do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

    with qryAux do
    begin
      SQL.Add('SELECT *');
      SQL.Add('FROM TINSTRUCAO_DESEMBARACO (NOLOCK) ');
      SQL.Add('WHERE ID_CODIGO = :ID_CODIGO');
      qryAux.Parameters.ParamByName('ID_CODIGO').Value := ID;
      Open;
      //COLOCAR ID DO CLIENTE NA PLANILHA  - guilherme 31/10/2011
      cargo_usuario := ConsultaSQL(Servidor,'BROKER', ' SELECT CD_CARGO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = ''' + qryAux.FieldByName('CD_USUARIO').Value + '''', 'CD_CARGO');
      //cargo_usuario := ConsultaSQLPlanilha(' SELECT CD_CARGO FROM TUSUARIO WHERE CD_USUARIO = ''' + qryAux.FieldByName('CD_USUARIO').Value + ''' ');
      if cargo_usuario = '040' then
        id_cliente := '/' + qryAux.FieldByName('ID_CLIENTE').Value
      else
        id_cliente := '';

      // Código abaixo incluido por Michel em 08/06/2010 para inserir na planilha as despesas e as observações
      vExcelWS.Range[vExcelWS.Cells.Item[29, 3].Address, vExcelWS.Cells.Item[29, 3].Address].Value2  := StringReplace(qryAux.FieldByName('TX_OBSERVACOES').Value, #13, '', [rfReplaceAll]);
      vExcelWS.Columns.EntireRow.AutoFit;

      with qryAux2 do
      begin
        // Código abaixo incluido por Michel em 08/06/2010 para inserir na planilha as despesas e as observações
        SQL.Add('SELECT NM_ITEM, NR_FATURA, VL_ITEM');
        SQL.Add('FROM TINSTRUCAO_DESEMBARACO_DESPESAS (NOLOCK) ');
        SQL.Add('WHERE ID_CODIGO = :ID_CODIGO');

        qryAux2.Parameters.ParamByName('ID_CODIGO').Value := qryAux.FieldByName('ID_CODIGO').Value;
        try
          Open;
        except
          on E: Exception do
          begin
            //ShowMessage('Erro executando a consulta das despesas.'#13'Mensagem original: ''' + E.Message + '''.') ;
            vExcelApp.Quit;
            result:=2;
            Exit;
          end;
        end;

        Linha := 25;
        First;
        while not Eof do
        begin
          vExcelWS.Range[ vExcelWS.Cells.Item[Linha, 1].Address, vExcelWS.Cells.Item[Linha, 1].Address ].EntireRow.Insert(xlDown);
          if FieldByName('NR_FATURA').AsString = '' then
            vExcelWS.Range[ vExcelWS.Cells.Item[Linha, 3].Address, vExcelWS.Cells.Item[Linha,3].Address ].Value2  := FieldByName('NM_ITEM').AsString
          else
            vExcelWS.Range[ vExcelWS.Cells.Item[Linha, 3].Address, vExcelWS.Cells.Item[Linha, 3].Address ].Value2  := FieldByName('NM_ITEM').AsString + ' (Invoice: ' + FieldByName('NR_FATURA').AsString + ')';
          vExcelWS.Range[ vExcelWS.Cells.Item[Linha, 8].Address, vExcelWS.Cells.Item[Linha, 8].Address ].Value2  := FieldByName('VL_ITEM').AsFloat;
          Next;
        end;

        Close;
        SQL.Clear;
        Sql.Add('SELECT DISTINCT RTRIM(U.NM_USUARIO) AS NM_USUARIO');
        Sql.Add('FROM TINSTRUCAO_DESEMBARACO ID (NOLOCK) ');
        Sql.Add('   INNER JOIN TINSTRUCAO_DESEMBARACO_PEDIDO IDP (NOLOCK) ON IDP.ID_CODIGO = ID.ID_CODIGO');
        Sql.Add('   INNER JOIN TESTAGIO_PROCESSO EP (NOLOCK) ON EP.NR_REFERENCIA = IDP.NR_REFERENCIA');
        Sql.Add('                                  AND EP.CD_EMPRESA    = ID.CD_CLIENTE');
        Sql.Add('   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = EP.NR_PROCESSO_ADM');
        Sql.Add('   INNER JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = P.CD_ANALISTA_CLIENTE');
        Sql.Add('WHERE ID.ID_CODIGO = :ID_CODIGO');
        Sql.Add('ORDER BY U.NM_USUARIO');
        qryAux2.Parameters.ParamByName('ID_CODIGO').Value := qryAux.FieldByName('ID_CODIGO').Value;
        Open;
        First;
        vContatos := '';
        while not Eof do
        begin
          vContatos := vContatos + ', ' + FieldByName('NM_USUARIO').AsString;
          Next;
        end;
        System.Delete(vContatos, 1, 2);
        vExcelWS.Range[vExcelWS.Cells.Item[18, 4].Address, vExcelWS.Cells.Item[18, 4].Address].Value2 := vContatos;

        Close;
        SQL.Clear;

        Sql.Add(' SELECT ID.CD_MODAL, PO.CD_IMPORTADOR, ISNULL(PO.CD_EXPORTADOR,'''') CD_EXPORTADOR, PO.CD_FABRICANTE, PO.CD_AREA, PO.CD_INCOTERM,                                                     ');
        Sql.Add('PO.IN_ENTREPOSTO, PO.CD_SERVICO, P.NR_CONHECIMENTO, P.CD_ANALISTA_COMISSARIA, POI.IN_NECESSITA_LI,POI.IN_DRAWBACK,                                                 ');
        Sql.Add('POI.NR_PROCESSO, POI.NR_ITEM, POI.NR_ITEM_CLIENTE, POI.QT_INICIAL, POI.CD_UNID_MEDIDA, POI.CD_NCM_SH,                                                              ');
        Sql.Add('POI.NR_CONHECIMENTO, POI.IN_NECESSITA_LI, EN.AP_EMPRESA AP_IMPORTADOR, ISNULL(EE.AP_EMPRESA,'''') AP_EXPORTADOR,                                                               ');
        Sql.Add(' UM.NM_SIGLA, U.AP_USUARIO, VT.NM_VIA_TRANSP, A.NM_AREA, P.CD_INCOTERM, INC.DESCRICAO DESC_INCOTERM,                                                              ');
        Sql.Add(' POI.CD_MERCADORIA, POI.VL_TOTAL, POI.NR_FATURA, TP.NM_PEDIDO, EEF.AP_EMPRESA AP_FABRICANTE,                                                                      ');
        Sql.Add(' P.DIAS_CONDICAO_PAGTO, P.CONDICAO_PAGTO, IDP.NR_PARCIAL, ISNULL(EE.NR_CLIENTE,'''') NR_CLIENTE, EN.CD_EMPRESA CD_IMPORTADOR,');
        Sql.Add(' POI.CD_FABRICANTE CD_FABRICANTE_ITEM ,');
        Sql.Add('(case ISNULL(POI.CD_MERC_FORNEC,'''') when '''' then TM.AP_MERCADORIA ');
        Sql.Add(' else RTRIM(TM.AP_MERCADORIA)+''-''+ ISNULL(POI.CD_MERC_FORNEC,'''') END) AS MERCADORIA_FORNECEDOR,');
        Sql.Add(' (SELECT REPLACE(master.dbo.RowConcat(distinct ');
        Sql.Add('     CASE WHEN ISNULL(TP.NM_PEDIDO, '''') = '''' THEN ''*'' ');
        Sql.Add('       ELSE LTRIM(RTRIM( TP.NM_PEDIDO)) +'' - ''+ LTRIM(RTRIM(POI.NR_PROCESSO))END), ''*,'' , '''') AS TIPO_MATERIAL1                                                  ');
        Sql.Add(' FROM TINSTRUCAO_DESEMBARACO_PEDIDO  IDP1 (NOLOCK)  ');
        Sql.Add('  INNER JOIN TINSTRUCAO_DESEMBARACO ID  (NOLOCK) ON ID.ID_CODIGO = IDP1.ID_CODIGO                                                                                   ');
        Sql.Add('  INNER JOIN TPO_ITEM               POI (NOLOCK) ON POI.NR_PROCESSO     = IDP1.NR_REFERENCIA                                                                        ');
        Sql.Add('                                               AND POI.NR_ITEM_CLIENTE = IDP1.NR_ITEM_PO AND POI.NR_PARCIAL = IDP1.NR_PARCIAL AND POI.CD_EMPRESA = ID.CD_CLIENTE    ');
        Sql.Add(' INNER JOIN TPROCESSO              P   (NOLOCK) ON P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA   ');
        Sql.Add(' LEFT  JOIN TTP_PEDIDO             TP  (NOLOCK) ON TP.CD_PEDIDO = P.CD_TP_PEDIDO ');
        Sql.Add(' WHERE IDP1.ID_CODIGO  = IDP.ID_CODIGO  ');
        Sql.Add('  AND P.IN_CANCELADO = ''0'') AS TIPO_MATERIAL, ID.NR_PLANTA ');
        Sql.Add(' FROM TINSTRUCAO_DESEMBARACO_PEDIDO   IDP (NOLOCK)');
        Sql.Add('  INNER JOIN TINSTRUCAO_DESEMBARACO ID  (NOLOCK) ON ID.ID_CODIGO = IDP.ID_CODIGO  ');
        Sql.Add('  INNER JOIN TPO_ITEM               POI (NOLOCK) ON POI.NR_PROCESSO     = IDP.NR_REFERENCIA ');
        Sql.Add('                                             AND POI.NR_ITEM_CLIENTE = IDP.NR_ITEM_PO ');
        Sql.Add('                                            AND POI.NR_PARCIAL      = IDP.NR_PARCIAL ');
        Sql.Add('                                           AND POI.CD_EMPRESA      = ID.CD_CLIENTE ');
        Sql.Add('                                           AND POI.ID_CODIGO_INSTR_DESEMB = ID.ID_CODIGO ');
        Sql.Add('  INNER JOIN TMERCADORIA            TM           ON TM.CD_MERCADORIA=POI.CD_MERCADORIA');
        Sql.Add('INNER JOIN TPO                    PO  (NOLOCK) ON PO.NR_PROCESSO = POI.NR_PROCESSO');
        Sql.Add('                                               AND PO.CD_EMPRESA  = POI.CD_EMPRESA ');
        Sql.Add('  INNER JOIN TPROCESSO              P   (NOLOCK) ON P.NR_REFERENCIA = POI.NR_PROCESSO ');
        Sql.Add('                                                AND P.CD_CLIENTE    = POI.CD_EMPRESA ');
        Sql.Add(' INNER JOIN TEMPRESA_NAC           EN  (NOLOCK) ON EN.CD_EMPRESA = PO.CD_IMPORTADOR ');
        Sql.Add(' LEFT JOIN TEMPRESA_EST           EE  (NOLOCK) ON EE.CD_EMPRESA = PO.CD_EXPORTADOR');
        Sql.Add(' LEFT  JOIN TUNID_MEDIDA_BROKER    UM  (NOLOCK) ON UM.CD_UNID_MEDIDA = POI.CD_UNID_MEDIDA ');
        Sql.Add(' LEFT  JOIN TUSUARIO               U   (NOLOCK) ON U.CD_USUARIO = P.CD_ANALISTA_COMISSARIA ');
        Sql.Add(' INNER JOIN TSERVICO               S   (NOLOCK) ON S.CD_SERVICO = PO.CD_SERVICO ');
        Sql.Add(' INNER JOIN TVIA_TRANSP_BROKER     VT  (NOLOCK) ON VT.CD_VIA_TRANSP = ID.CD_MODAL ');
        Sql.Add(' LEFT  JOIN TAREA                  A   (NOLOCK) ON A.CD_AREA = P.CD_AREA ');
        Sql.Add(' LEFT  JOIN TINCOTERMS_VENDA       INC (NOLOCK) ON INC.CODIGO = P.CD_INCOTERM ');
        Sql.Add(' LEFT  JOIN TTP_PEDIDO             TP  (NOLOCK) ON TP.CD_PEDIDO = P.CD_TP_PEDIDO  ');
        Sql.Add('   LEFT  JOIN TEMPRESA_EST           EEF (NOLOCK) ON EEF.CD_EMPRESA = POI.CD_FABRICANTE  ');
        Sql.Add(' WHERE IDP.ID_CODIGO  = :ID_CODIGO  ');
        Sql.Add('  AND P.IN_CANCELADO = ''0'' ');

        qryAux2.Parameters.ParamByName('ID_CODIGO').Value := qryAux.FieldByName('ID_CODIGO').Value;

        try
          Open;
        except
          on E: Exception do
          begin
            //ShowMessage('Erro executando a consulta.'#13'Mensagem original: ''' + E.Message + '''.') ;
            result := 3;
            vExcelApp.Quit;
            Exit;
          end;
        end;

        if FieldByName('CONDICAO_PAGTO').AsString      = 'E' then
          vCondPagto := 'INVOICE - Especial'
        else if FieldByName('CONDICAO_PAGTO').AsString = 'R' then
          vCondPagto := 'Registro da DI'
        else if FieldByName('CONDICAO_PAGTO').AsString = 'C' then
          vCondPagto := 'Conhecimento Embarque'
        else if FieldByName('CONDICAO_PAGTO').AsString = 'I' then
          vCondPagto := 'INVOICE'
        else if FieldByName('CONDICAO_PAGTO').AsString = 'P' then
          vCondPagto := 'PROFORMA'
        else if FieldByName('CONDICAO_PAGTO').AsString = 'A' then
          vCondPagto := 'ANTECIPADO'
        else if FieldByName('CONDICAO_PAGTO').AsString = 'V' then
          vCondPagto := 'A Vista'
        else if FieldByName('CONDICAO_PAGTO').AsString = 'S' then
          vCondPagto := 'Sem Cobertura Cambial';

        if (FieldByName('DIAS_CONDICAO_PAGTO').AsString = '') and (FieldByName('CONDICAO_PAGTO').AsString = '') then
          vCondPagto := 'Sem cobertura cambial'
        else if (FieldByName('DIAS_CONDICAO_PAGTO').AsString <> '') then
          vCondPagto := FieldByName('DIAS_CONDICAO_PAGTO').AsString + ' dias do(a) ' + vCondPagto;

        vExcelWS.Range[vExcelWS.Cells.Item[2, 2].Address, vExcelWS.Cells.Item[2, 2].Address].Value2 := 'Instrução de Desembaraço - ' + qryAux.FieldByName('ID_CODIGO').Value + id_cliente; //Título
        vExcelWS.Range[vExcelWS.Cells.Item[5, 4].Address, vExcelWS.Cells.Item[5, 4].Address].Value2 := FieldByName('NM_VIA_TRANSP').AsString;  // Modalidade
        vExcelWS.Range[vExcelWS.Cells.Item[6, 4].Address, vExcelWS.Cells.Item[6, 4].Address].Value2 := FieldByName('AP_EXPORTADOR').AsString;  // Exportador
        vExcelWS.Range[vExcelWS.Cells.Item[7, 4].Address, vExcelWS.Cells.Item[7, 4].Address].Value2 := FieldByName('CD_EXPORTADOR').AsString;  // Exportador (Cód MyIndaia)
        vExcelWS.Range[vExcelWS.Cells.Item[8, 4].Address, vExcelWS.Cells.Item[8, 4].Address].Value2 := FieldByName('NR_CLIENTE').AsString;     // Exportador (Cód Cliente)
        vExcelWS.Range[vExcelWS.Cells.Item[9, 4].Address, vExcelWS.Cells.Item[9, 4].Address].Value2 := FieldByName('CD_IMPORTADOR').AsString + ' - ' + FieldByName('AP_IMPORTADOR').AsString;  // Importador
        vExcelWS.Range[vExcelWS.Cells.Item[10, 4].Address, vExcelWS.Cells.Item[10, 4].Address].Value2 := vCondPagto;   //Fechamento de cambio
        vExcelWS.Range[vExcelWS.Cells.Item[11, 4].Address, vExcelWS.Cells.Item[11, 4].Address].Value2 := FieldByName('DESC_INCOTERM').AsString;  //Incoterm
        vExcelWS.Range[vExcelWS.Cells.Item[12, 4].Address, vExcelWS.Cells.Item[12, 4].Address].Value2 := IfThen(FieldByName('IN_NECESSITA_LI').AsBoolean, 'Sim', 'Não'); //Necessidade de LI
        vExcelWS.Range[vExcelWS.Cells.Item[13, 4].Address, vExcelWS.Cells.Item[13, 4].Address].Value2 := IfThen(FieldByName('IN_ENTREPOSTO').AsBoolean, 'Sim', 'Não'); //Entreposto
        //vExcelWS.Cells[14, 4].Value := FieldByName('NM_PEDIDO').AsString;
        vExcelWS.Range[vExcelWS.Cells.Item[14, 4].Address, vExcelWS.Cells.Item[14, 4].Address].Value2 := FieldByName('TIPO_MATERIAL').AsString;//tipos de material
        vExcelWS.Range[vExcelWS.Cells.Item[15, 4].Address, vExcelWS.Cells.Item[15, 4].Address].Value2 := FieldByName('NM_AREA').AsString; //Area
        vExcelWS.Range[vExcelWS.Cells.Item[16, 4].Address, vExcelWS.Cells.Item[16, 4].Address].Value2 := FieldByName('AP_USUARIO').AsString;//Analista
        vExcelWS.Range[vExcelWS.Cells.Item[17, 4].Address, vExcelWS.Cells.Item[17, 4].Address].Value2 := qryAux.FieldByName('NR_CONHECIMENTO').Value;
        vExcelWS.Range[vExcelWS.Cells.Item[19, 4].Address, vExcelWS.Cells.Item[19, 4].Address].Value2 := FieldByName('NR_PLANTA').AsString; //Area
        Linha := 22;
        First;
        while not Eof do
        begin
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 1].Address, vExcelWS.Cells.Item[Linha, 1].Address].EntireRow.Insert(xlDown);
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 3].Address, vExcelWS.Cells.Item[Linha, 3].Address].Value2  := FieldByName('NR_PROCESSO').AsString;
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 4].Address, vExcelWS.Cells.Item[Linha, 4].Address].Value2  := FieldByName('NR_ITEM_CLIENTE').AsString + ' (' + FieldByName('NR_PARCIAL').AsString + ')';
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 5].Address, vExcelWS.Cells.Item[Linha, 5].Address].Value2  := FieldByName('QT_INICIAL').AsFloat;
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 6].Address, vExcelWS.Cells.Item[Linha, 6].Address].Value2  := FieldByName('NM_SIGLA').AsString;
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 7].Address, vExcelWS.Cells.Item[Linha, 7].Address].Value2  := FieldByName('CD_MERCADORIA').AsString;
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 8].Address, vExcelWS.Cells.Item[Linha, 8].Address].Value2  := FieldByName('VL_TOTAL').AsFloat;
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 9].Address, vExcelWS.Cells.Item[Linha, 9].Address].Value2  := FieldByName('CD_FABRICANTE_ITEM').AsString + ' - ' + FieldByName('AP_FABRICANTE').AsString;
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 10].Address, vExcelWS.Cells.Item[Linha, 10].Address].Value2 := FieldByName('NR_FATURA').AsString;
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 11].Address, vExcelWS.Cells.Item[Linha, 11].Address].Value2 := VerificaNumLI(FieldByName('NR_PROCESSO').AsString, FieldByName('NR_ITEM_CLIENTE').AsString);//'Num-LI';
        if  trim(FieldByName('IN_DRAWBACK').AsString)='1' then
        begin
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 12].Address, vExcelWS.Cells.Item[Linha, 12].Address].Value2 := 'Sim';
        end
        else
        begin
          vExcelWS.Range[vExcelWS.Cells.Item[Linha, 12].Address, vExcelWS.Cells.Item[Linha, 12].Address].Value2 := 'Não';
        end;
        vExcelWS.Range[vExcelWS.Cells.Item[Linha, 13].Address, vExcelWS.Cells.Item[Linha, 13].Address].Value2  := FieldByName('MERCADORIA_FORNECEDOR').AsString;
        Next;
      end;
      DeleteFile('D:\sites\myindaia\arquivo\upload\InstrucaoDesembaraco'+Trim(ID)+'.xls');
      vExcelWB.SaveAs('D:\sites\myindaia\arquivo\upload\InstrucaoDesembaraco'+Trim(ID)+'.xls', xlWorkbookNormal, EmptyParam, EmptyParam, False, False, xlNoChange, xlLocalSessionChanges, True, 0, 0, 0);
      //vExcelApp.Quit;
      vExcelWB.Close;
      vExcelApp.Quit;
      FreeAndNil(vExcelWS);
      FreeAndNil(vExcelWB);
      FreeAndNil(vExcelApp);

      if tipo = '2' then
      begin
      //{*
      //PathDig := ConsultaSQL('INDAIA10', 'BROKER', 'SELECT PATH_DIGITALIZACAO FROM TPARAMETROS', 'PATH_DIGITALIZACAO');
      //if PathDig[Length(PathDig)] <> '\' then
      //  PathDig := PathDig + '\';
      PathDig := '\\indaiaweb\sites\digitalizacao_novo\TPROCESSO\' + Trim(ID) + '\';

      if Trim(qryAux.FieldByName('CD_CLIENTE').Value) = '' then
      begin
        Cliente := '';
        Grupo := '';
      end
      else
      begin
        Cliente := Trim(ConsultaSQL(Servidor, 'BROKER', 'SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '''+ qryAux.FieldByName('CD_CLIENTE').Value+'''', 'NM_EMPRESA'));
        Grupo   := Trim(ConsultaSQL(Servidor, 'BROKER', 'SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '''+ qryAux.FieldByName('CD_CLIENTE').Value+'''', 'CD_GRUPO'));
      end;

      if Trim(qryAux.FieldByName('CD_MODAL').Value) = '' then
        Modal := ''
      else
      begin
        Modal   := ConsultaSQL(Servidor,'BROKER', ' SELECT NM_VIA_TRANSPORTE AS MODAL FROM TVIA_TRANSPORTE (NOLOCK) WHERE CD_VIA_TRANSPORTE = ''' + qryAux.FieldByName('CD_MODAL').Value + '''', 'MODAL');
      end;

      vEmailModal := 'ti@myindaia.com.br';
      if Grupo = '028' then
        vEmailModal := 'sga.imp@myindaia.com.br';

      if Grupo = 'A77' then
        vEmailModal := 'whirlpool.imp@myindaia.com.br';

      if Grupo = '949' then
        vEmailModal := 'linde.imp@myindaia.com.br';

      if Grupo = '895' then
        vEmailModal := 'airproducts.imp@myindaia.com.br';

      if Grupo = '155' then
        vEmailModal := 'nestle.imp@myindaia.com.br';

      if Grupo = '389' then
        vEmailModal := 'feral.imp@myindaia.com.br';

      if Grupo = '083' then
        vEmailModal := 'croda.imp@myindaia.com.br';

      if cargo_usuario = '040' then
        Assunto
         := '[MyIndaiaMail] Nova Instrução de Desembaraço Autorizada :' + Trim(ID) + Trim(id_cliente)
      else
        Assunto := '[MyIndaiaMail] Nova Instrução de Desembaraço Autorizada :' + Trim(ID);

      if Cliente <> '' then
        Assunto := Assunto + ' / Cliente: ' + Cliente;
      if Modal <> '' then
        Assunto := Assunto + ' / Modal: ' + Modal;

      Body.Add('<html>');
      Body.Add('<body>');
      Body.Add('Segue planilha em anexo');
      Body.Add('<br><br>');
      Body.Add('<b>Instrução: </b>' + Trim(ID));


      if Cliente <> '' then
      begin
        Body.Add('<br>');
        Body.Add('<b>Cliente: </b>' + Cliente);
      end;
      if Modal <> '' then
      begin
        Body.Add('<br>');
        Body.Add('<b>Modal: </b>' + Modal);
      end;
      Body.Add('<br><br>');


      with qryAux2 do
      begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT CASE RTRIM(ISNULL(PD.NM_DESCRICAO, ''''))');
        Sql.Add('   WHEN '''' THEN TDD.NM_TIPO_DOCTO              ');
        Sql.Add('ELSE LTRIM(RTRIM(PD.NM_DESCRICAO))             ');
        Sql.Add('END AS NM_DESCRICAO,                           ');
        Sql.Add('PD.NM_ARQUIVO,                                 ');
        Sql.Add(' ''https://www.myindaiaweb.com.br/redireciona_doc.asp?cod='' + MASTER.DBO.FN_CRIPROGRAFA(''docs_novo/'' + RTRIM(NR_PROCESSO) + ''/'' + RTRIM(PD.NM_ARQUIVO)) AS NM_LINK, ');
        Sql.Add('ISNULL(PD.NM_ARQUIVO_PAI,'''') AS NM_ARQUIVO_PAI ');
        Sql.Add('FROM TPROCESSO_DOCTOS PD (NOLOCK) INNER JOIN TTP_DOCTO_DIGITALIZADO TDD (NOLOCK) ON TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ');
        Sql.Add('                                                      AND TDD.ID_TABELA     = PD.ID_TABELA             ');
        Sql.Add('   INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD (NOLOCK) ON CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO               ');
        Sql.Add('                                                AND CAD.ID_TABELA     = PD.ID_TABELA                   ');
        Sql.Add('   INNER JOIN SYS.TABLES ST ON ST.OBJECT_ID = PD.ID_TABELA                                             ');
        Sql.Add('WHERE PD.NR_PROCESSO      = :NR_PROCESSO                                                               ');
        Sql.Add('  AND CAD.CD_CARGO        = :CD_CARGO                                                                  ');
        Sql.Add('  AND ST.NAME             = ''TINSTRUCAO_DESEMBARACO''                                                 ');
        Sql.Add('  AND PD.IN_ATIVO         = ''1''                                                                      ');
        Sql.Add('  AND CAD.IN_VISUALIZACAO = ''1''                                                                      ');
        Sql.Add('ORDER BY CASE ISNULL(NM_ARQUIVO_PAI, '''')                                                             ');
        Sql.Add('             WHEN '''' THEN NM_ARQUIVO                                                                 ');
        Sql.Add('         ELSE NM_ARQUIVO_PAI                                                                           ');
        Sql.Add('         END                                                                                           ');

        qryAux2.Parameters.ParamByName('NR_PROCESSO').Value := qryAux.FieldByName('ID_CODIGO').Value;
        qryAux2.Parameters.ParamByName('CD_CARGO').Value    := ConsultaSQL(Servidor, 'BROKER', 'SELECT CD_CARGO FROM TUSUARIO WHERE CD_USUARIO = ' + qryAux.FieldByName('CD_USUARIO_AUTORIZACAO').Value+'','CD_CARGO');
        Open;

        if not qryAux2.eof then
        begin
          Body.Add('<br>');
          Body.Add('<b>Arquivos Digitalizados:</b>');
          Body.Add('<br>');
          ArquivoPai := '';
          qryAux2.First;
          while not qryAux2.Eof do
          begin
            if (Trim(qryAux2.FieldByName('NM_ARQUIVO_PAI').Value) <> '') and (ArquivoPai <> '') then
            begin
              Inc(QtdPai);
              Body.Add('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="' + qryAux2.FieldByName('NM_LINK').Value + '">' + ArquivoPai + ' Parte ' + FormatFloat('00', QtdPai) + '</a>');
            end
            else
            begin
              Qtdpai := 1;
              Body.Add('<a href="' + qryAux2.FieldByName('NM_LINK').Value + '">' + qryAux2.FieldByName('NM_DESCRICAO').Value + '</a>');
              ArquivoPai := qryAux2.FieldByName('NM_DESCRICAO').Value;
            end;
            Body.Add('<br>');
            qryAux2.Next;
          end;
          Body.Add('<br><br>');
        end;
      end;

      Body.Add('Este é um email gerado automaticamente pelo MyIndaiá.');
      Body.Add(' Dúvidas: <a href="mailto:myindaia@myindaia.com.br">myindaia@myindaia.com.br</a>');
      Body.Add('');
      Body.Add('</body>');
      Body.Add('</html>');

      vTo := Trim(ConsultaSQL(Servidor, 'BROKER', 'SELECT NM_EMAIL FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = ''' + qryAux.FieldByName('CD_USUARIO_AUTORIZACAO').Value+'''', 'NM_EMAIL'));

      EnviaEmailHtmlDe(Assunto, Body.Text, vEmailModal + ';' + vTo, ConsultaSQL(Servidor, 'BROKER', 'SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO = ''' + qryAux.FieldByName('CD_USUARIO_AUTORIZACAO').Value+'''','NM_EMAIL'), ['D:\sites\myindaia\arquivo\upload\InstrucaoDesembaraco' + Trim(ID) + '.XLS']);
      //EnviaEmailHtmlDe(Assunto, Body.Text, 'guilherme.devezas@myindaia.com.br', 'guilherme.devezas@myindaia.com.br', ['C:\sites\myindaia\arquivo\upload\InstrucaoDesembaraco' + Trim(ID) + '.XLS']);

      Close;
      Free;
      end;
    end;
    end;
  finally
    // Linha abaixo comentada por estar dentro do FINALLY e sempre vai mostrar como erro, mesmo quando não houver - Michel - 09/06/2010
    //Application.MessageBox('Verifique se a planilha já está aberta. Salve-a e feche-a!', 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
    //vExcelWB.Close;
    //vExcelApp.Quit;
  end;
end;

function TIntegraPlan.Gravar: Boolean;
var
  Prefixo, Processo, Cliente, Grupo, CargoUsuario, CodResp: String;
  Item, NrItem, NrItemCliente: Integer;
  Ped: Integer;
  QtdPedido, PLPedido, VLUnitPedido, VLTotalPedido: Double;
  PathDig, NomeArquivo: String;
  MS: TMemoryStream;
  AssuntoEmail, CorpoEmail, UsuarioEmail: String;
begin
  Result := False;
  try
    try
      Cliente  := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', 'CGC_EMPRESA = ''' + FCapa.CNPJ_Importador + '''');
      FCliente := Cliente;
      Grupo    := ConsultaLookup('TEMPRESA_NAC', 'CD_GRUPO', 'CGC_EMPRESA = ''' + FCapa.CNPJ_Importador + '''');
      CargoUsuario := ConsultaSQLPlanilha(' SELECT CD_CARGO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = ''' + FCodUsuario + ''' ');
      if CargoUsuario = '040' then
        CodResp := ConsultaSQLPlanilha(' SELECT ISNULL(CD_ATENDENTE, ''' + FCodUsuario + ''')' +
                                       ' FROM TCLIENTE_HABILITACAO (NOLOCK) ' +
                                       ' WHERE CD_CLIENTE = ''' + Cliente + ''' ' +
                                       '   AND CD_PRODUTO = ''01'' ' +
                                       '   AND CD_UNID_NEG = ''07'' ')
      else
        CodResp := FCodUsuario;
      Prefixo := ConsultaSQLPlanilha(' SELECT CASE ISNULL(E.IN_COMPRADOR, 0) ' +
                             '            WHEN 0 THEN S.CD_PREFIXO ' +
                             '            WHEN 1 THEN ''IT'' ' +
                             '        END ' +
                             ' FROM TCLIENTE_HABILITACAO H (NOLOCK) ' +
                             '    INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = H.CD_CLIENTE ' +
                             '    INNER JOIN TCLIENTE_SERVICO S (NOLOCK) ON S.CD_CLIENTE  = H.CD_CLIENTE ' +
                             '                                          AND S.CD_UNID_NEG = H.CD_UNID_NEG ' +
                             '                                          AND S.CD_PRODUTO  = H.CD_PRODUTO ' +
                             ' WHERE H.CD_CLIENTE  = ''' + Cliente + ''' ' +
                             '   AND H.CD_UNID_NEG = ''07'' ' +
                             '   AND H.CD_PRODUTO  = ''06'' ' +
                             '   AND S.CD_SERVICO  = ''' + _SERVICO + ''' '); Prefixo := 'WP';
      AjustaDePara;
      if VerificaDeParas then
      begin
        FconBroker.BeginTrans;

        { ------ Instrução de Desembaraço ------ }
        FInstrucaoDesembaraco := ConsultaSQLPlanilha(' SELECT ''ID'' + RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) + 1, ''1'')), 8) + ''-'' + RIGHT(YEAR(GETDATE()), 2) ' +
                                             ' FROM TINSTRUCAO_DESEMBARACO (NOLOCK)' +
                                             ' WHERE RIGHT(RTRIM(ID_CODIGO), 2) = RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2)');
        FqryConsulta.SQL.Clear;
        FqryConsulta.SQL.Add('INSERT INTO TINSTRUCAO_DESEMBARACO(ID_CODIGO, CD_USUARIO, DT_CRIACAO, IN_AUTORIZADO, CD_CLIENTE, DT_AUTORIZACAO, CD_USUARIO_AUTORIZACAO,');
        FqryConsulta.SQL.Add('                                   CD_RESPONSAVEL, CD_EMBARCACAO, NR_CONHECIMENTO, CD_EMPRESA, CD_MODAL, DT_CONHECIMENTO, CD_PAIS_PROCEDENCIA,');
        FqryConsulta.SQL.Add('                                   CD_MOEDA_FRETE, VL_FRETE_PREPAID_MNEG, VL_FRETE_COLLECT_MNEG, VL_FRETE_MN, CD_MOEDA_SEGURO, VL_SEGURO_MNEG,');
        FqryConsulta.SQL.Add('                                   VL_SEGURO_MN, CD_LOCAL_EMBARQUE, DT_EMBARQUE, DIAS_CONDICAO_PAGTO, CONDICAO_PAGTO, CD_INCOTERM, CD_AGENTE,');
        FqryConsulta.SQL.Add('                                   CD_TIPO_FRETE, ID_CLIENTE)');
        FqryConsulta.SQL.Add('VALUES(:ID_CODIGO, :CD_USUARIO, :DT_CRIACAO, :IN_AUTORIZADO, :CD_CLIENTE, :DT_AUTORIZACAO, :CD_USUARIO_AUTORIZACAO,');
        FqryConsulta.SQL.Add('       :CD_RESPONSAVEL, :CD_EMBARCACAO, :NR_CONHECIMENTO, :CD_EMPRESA, :CD_MODAL, :DT_CONHECIMENTO, :CD_PAIS_PROCEDENCIA,');
        FqryConsulta.SQL.Add('       :CD_MOEDA_FRETE, :VL_FRETE_PREPAID_MNEG, :VL_FRETE_COLLECT_MNEG, :VL_FRETE_MN, :CD_MOEDA_SEGURO, :VL_SEGURO_MNEG,');
        FqryConsulta.SQL.Add('       :VL_SEGURO_MN, :CD_LOCAL_EMBARQUE, :DT_EMBARQUE, :DIAS_CONDICAO_PAGTO, :CONDICAO_PAGTO, :CD_INCOTERM, :CD_AGENTE,');
        FqryConsulta.SQL.Add('       :CD_TIPO_FRETE, :ID_CLIENTE)');
        FqryConsulta.Parameters.ParamByName('ID_CODIGO').Value              := FInstrucaoDesembaraco;
        FqryConsulta.Parameters.ParamByName('CD_USUARIO').Value             := FCodUsuario;
        FqryConsulta.Parameters.ParamByName('DT_CRIACAO').Value             := Date;
        FqryConsulta.Parameters.ParamByName('IN_AUTORIZADO').Value          := '0';
        FqryConsulta.Parameters.ParamByName('CD_CLIENTE').Value             := Cliente;
        //FqryConsulta.Parameters.ParamByName('DT_AUTORIZACAO').Value         := Date;
        //FqryConsulta.Parameters.ParamByName('CD_USUARIO_AUTORIZACAO').Value := FCodUsuario;
        FqryConsulta.Parameters.ParamByName('CD_RESPONSAVEL').Value         := CodResp;
        FqryConsulta.Parameters.ParamByName('CD_EMBARCACAO').Value          := FCapa.Navio.Codigo;
        FqryConsulta.Parameters.ParamByName('NR_CONHECIMENTO').Value        := FCapa.Nr_Conhecimento;
        FqryConsulta.Parameters.ParamByName('CD_EMPRESA').Value             := Cliente;
        FqryConsulta.Parameters.ParamByName('CD_MODAL').Value               := FCapa.Via_Transporte.Codigo;
        FqryConsulta.Parameters.ParamByName('DT_CONHECIMENTO').Value        := FCapa.Data_Conhecimento;

        FqryConsulta.Parameters.ParamByName('CD_MOEDA_FRETE').Value         := FCapa.Frete.Moeda.Codigo;
        if FCapa.Tipo_Frete.Codigo = '0' then
        begin
          FqryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID_MNEG').Value  := 0;
          FqryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT_MNEG').Value  := FCapa.Frete.Valor;
        end
        else
        begin
          FqryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID_MNEG').Value  := FCapa.Frete.Valor;
          FqryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT_MNEG').Value  := 0;
        end;
        FqryConsulta.Parameters.ParamByName('VL_FRETE_MN').Value            := 0;
        FqryConsulta.Parameters.ParamByName('CD_MOEDA_SEGURO').Value        := FCapa.Seguro.Moeda.Codigo;
        FqryConsulta.Parameters.ParamByName('VL_SEGURO_MNEG').Value         := FCapa.Seguro.Valor;
        FqryConsulta.Parameters.ParamByName('VL_SEGURO_MN').Value           := 0;
        FqryConsulta.Parameters.ParamByName('CD_LOCAL_EMBARQUE').Value      := FCapa.Local_Embarque.Codigo;
        FqryConsulta.Parameters.ParamByName('DT_CONHECIMENTO').Value        := FCapa.Data_Conhecimento;
        FqryConsulta.Parameters.ParamByName('DT_EMBARQUE').Value            := FCapa.Data_Embarque;
        FqryConsulta.Parameters.ParamByName('DIAS_CONDICAO_PAGTO').Value    := FCapa.Faturas[0].Condicao.Dias;
        FqryConsulta.Parameters.ParamByName('CONDICAO_PAGTO').Value         := FCapa.Faturas[0].Condicao.Codigo;
        FqryConsulta.Parameters.ParamByName('CD_INCOTERM').Value            := FCapa.Incoterms;
        FqryConsulta.Parameters.ParamByName('CD_AGENTE').Value              := FCapa.Agente_Transporte.Codigo;
        FqryConsulta.Parameters.ParamByName('CD_TIPO_FRETE').Value          := FCapa.Tipo_Frete.Codigo;
        FqryConsulta.Parameters.ParamByName('ID_CLIENTE').Value             := FCapa.Nr_Sequencial_Embarque;

        FqryConsulta.ExecSQL;

        for Ped := 0 to High(FCapa.Pedidos) do
        begin
          with FCapa.Pedidos[Ped] do
          begin
            QtdPedido     := 0;
            PLPedido      := 0;
            VLUnitPedido  := 0;
            VLTotalPedido := 0;
            for Item := 0 to High(Itens) do
            begin
              QtdPedido     := QtdPedido + Itens[Item].Quantidade;
              PLPedido      := PLPedido + Itens[Item].Peso_Liquido_Total;
              VLUnitPedido  := VLUnitPedido + Itens[Item].Valor_Unitario;
              VLTotalPedido := VLTotalPedido + Itens[Item].Valor_Total;
            end;
          end;

          if ConsultaSQLPlanilha(Format('SELECT COUNT(*) ' +
                                ' FROM TPO (NOLOCK) ' +
                                ' WHERE NR_PROCESSO = ''%s'' ' +
                                '   AND CD_EMPRESA  = ''%s''', [FCapa.Pedidos[Ped].Numero, Cliente])) = '0' then
          begin
            { --------------- Processo --------------- }
            Processo := ConsultaSQLPlanilha(' SELECT MAX(ISNULL(CONVERT(INT, SUBSTRING(NR_PROCESSO, 8, CHARINDEX(''-'', NR_PROCESSO, CHARINDEX(''-'', NR_PROCESSO)) - 1)), 0)) ' +
                                    ' FROM TPROCESSO (NOLOCK) ' +
                                    ' WHERE CD_UNID_NEG = ''07'' ' +
                                    '   AND CD_PRODUTO  = ''06'' ' +
                                    '   AND DATEPART(YYYY, DT_ABERTURA) = DATEPART(YYYY, GETDATE()) ' +
                                    '   AND SUBSTRING(NR_PROCESSO, 5, 2) = ''' + Prefixo + ''' ');
            Processo := Format('%s%s-%s-%s', ['0706', Prefixo, FormatFloat('000000', StrToInt(Processo) + 1), FormatDateTime('yy', Now)]);
            if FqryConsulta.Active then
              FqryConsulta.Close;
            FqryConsulta.SQL.Clear;
            FqryConsulta.SQL.Add('INSERT INTO TPROCESSO(NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_GRUPO, NR_REFERENCIA, CD_CLIENTE, IN_LIBERADO, IN_CANCELADO,');
            FqryConsulta.SQL.Add('                      DT_ABERTURA, HR_ABERTURA, IN_DADOS_IGUAIS_ITENS, CD_PAIS_ORIGEM, CD_INCOTERM, CD_LOCAL_DESEMBARQUE, NR_ORDEM,');
            FqryConsulta.SQL.Add('                      NR_CONHECIMENTO, DT_CONHECIMENTO, IN_SEGURO, CD_ANALISTA_CLIENTE, CD_USUARIO, CD_IMPORTADOR, CD_EXPORTADOR, CD_SERVICO,');
            FqryConsulta.SQL.Add('                      TP_FRETE, CD_AREA, CONDICAO_PAGTO)');
            FqryConsulta.SQL.Add('VALUES(:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_GRUPO, :NR_REFERENCIA, :CD_CLIENTE, :IN_LIBERADO, :IN_CANCELADO,');
            FqryConsulta.SQL.Add('       :DT_ABERTURA, :HR_ABERTURA, :IN_DADOS_IGUAIS_ITENS, :CD_PAIS_ORIGEM, :CD_INCOTERM, :CD_LOCAL_DESEMBARQUE, :NR_ORDEM,');
            FqryConsulta.SQL.Add('       :NR_CONHECIMENTO, :DT_CONHECIMENTO, :IN_SEGURO, :CD_ANALISTA_CLIENTE, :CD_USUARIO, :CD_IMPORTADOR, :CD_EXPORTADOR, :CD_SERVICO,');
            FqryConsulta.SQL.Add('       :TP_FRETE, :CD_AREA, :CONDICAO_PAGTO)');
            FqryConsulta.Parameters.ParamByName('NR_PROCESSO').Value           := Processo;
            FqryConsulta.Parameters.ParamByName('CD_UNID_NEG').Value           := '07';
            FqryConsulta.Parameters.ParamByName('CD_PRODUTO').Value            := '06';
            FqryConsulta.Parameters.ParamByName('CD_GRUPO').Value              := 'A77';
            FqryConsulta.Parameters.ParamByName('NR_REFERENCIA').Value         := FCapa.Pedidos[Ped].Numero;
            FqryConsulta.Parameters.ParamByName('CD_CLIENTE').Value            := Cliente;
            FqryConsulta.Parameters.ParamByName('IN_LIBERADO').Value           := '1';
            FqryConsulta.Parameters.ParamByName('IN_CANCELADO').Value          := '0';
            FqryConsulta.Parameters.ParamByName('DT_ABERTURA').Value           := Date;
            FqryConsulta.Parameters.ParamByName('HR_ABERTURA').Value           := Now;
            FqryConsulta.Parameters.ParamByName('IN_DADOS_IGUAIS_ITENS').Value := '1';
            FqryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value        := FCapa.Pais_Proced.Codigo;
            FqryConsulta.Parameters.ParamByName('CD_INCOTERM').Value           := FCapa.Incoterms;
            FqryConsulta.Parameters.ParamByName('CD_LOCAL_DESEMBARQUE').Value  := FCapa.Local_Desemb.Codigo;
            FqryConsulta.Parameters.ParamByName('NR_ORDEM').Value              := '';
            FqryConsulta.Parameters.ParamByName('NR_CONHECIMENTO').Value       := FCapa.Nr_Conhecimento;
            FqryConsulta.Parameters.ParamByName('DT_CONHECIMENTO').Value       := FCapa.Data_Conhecimento;
            FqryConsulta.Parameters.ParamByName('IN_SEGURO').Value             := '';
            FqryConsulta.Parameters.ParamByName('CD_ANALISTA_CLIENTE').Value   := FCapa.Analista.Codigo;
            FqryConsulta.Parameters.ParamByName('CD_IMPORTADOR').Value         := Cliente;
            if Trim(FCapa.Fornecedor.Codigo) <> '' then
              FqryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value        := FCapa.Fornecedor.Codigo
            else
              FqryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value        := '00000';
            FqryConsulta.Parameters.ParamByName('CD_SERVICO').Value            := _SERVICO;
            FqryConsulta.Parameters.ParamByName('TP_FRETE').Value              := FCapa.Tipo_Frete.Codigo;
            FqryConsulta.Parameters.ParamByName('CD_AREA').Value               := _AREA;
            FqryConsulta.Parameters.ParamByName('CONDICAO_PAGTO').Value        := FCapa.Faturas[0].Condicao.Codigo;
            FqryConsulta.ExecSQL;

            { --------------- Pedido --------------- }
            FqryConsulta.SQL.Clear;
            FqryConsulta.SQL.Add('INSERT INTO TPO(NR_PROCESSO, CD_IMPORTADOR, CD_FABRICANTE, CD_EXPORTADOR, CD_VIA_TRANSP, CD_PAIS_ORIGEM, CD_REGIME_TRIB, CD_PAIS_PROCEDENCIA,');
            FqryConsulta.SQL.Add('                CD_MOEDA_NEG, CD_URF_DESPACHO, CD_INCOTERM, CD_LOCAL_EMBARQUE, CD_AGENTE_CARGA, CD_URF_ENTRADA, CD_MOEDA_FRETE, CD_MOEDA_SEGURO,');
            FqryConsulta.SQL.Add('                DT_ABERTURA, IN_VINC_IMPO_EXPO, IN_FABR_EXPOR_IMP, NM_VEICULO, PL_PO, PB_PO, QT_TOTAL_PESO, QT_TOTAL_ITENS, TP_FRETE,');
            FqryConsulta.SQL.Add('                VL_FRETE_PREPAID, VL_FRETE_COLLECT, VL_SEGURO, VL_TOTAL, CD_AREA, CD_TIPO_FRETE, CD_LOCAL_DESEMBARQUE, CD_SERVICO,');
            FqryConsulta.SQL.Add('                CD_USUARIO, DT_CONHECIMENTO, CD_EMPRESA)');
            FqryConsulta.SQL.Add('VALUES(:NR_PROCESSO, :CD_IMPORTADOR, :CD_FABRICANTE, :CD_EXPORTADOR, :CD_VIA_TRANSP, :CD_PAIS_ORIGEM, :CD_REGIME_TRIB, :CD_PAIS_PROCEDENCIA,');
            FqryConsulta.SQL.Add('       :CD_MOEDA_NEG, :CD_URF_DESPACHO, :CD_INCOTERM, :CD_LOCAL_EMBARQUE, :CD_AGENTE_CARGA, :CD_URF_ENTRADA, :CD_MOEDA_FRETE, :CD_MOEDA_SEGURO,');
            FqryConsulta.SQL.Add('       :DT_ABERTURA, :IN_VINC_IMPO_EXPO, :IN_FABR_EXPOR_IMP, :NM_VEICULO, :PL_PO, :PB_PO, :QT_TOTAL_PESO, :QT_TOTAL_ITENS, :TP_FRETE,');
            FqryConsulta.SQL.Add('       :VL_FRETE_PREPAID, :VL_FRETE_COLLECT, :VL_SEGURO, :VL_TOTAL, :CD_AREA, :CD_TIPO_FRETE, :CD_LOCAL_DESEMBARQUE, :CD_SERVICO,');
            FqryConsulta.SQL.Add('       :CD_USUARIO, :DT_CONHECIMENTO, :CD_EMPRESA)');
            with FCapa, FCapa.Pedidos[Ped], Itens[0] do
            begin
              FqryConsulta.Parameters.ParamByName('NR_PROCESSO').Value          := Numero;
              FqryConsulta.Parameters.ParamByName('CD_IMPORTADOR').Value        := Cliente;
              FqryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value        := Fabricante.Codigo;
              if Trim(Fornecedor.Codigo) <> '' then
                FqryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value        := Fornecedor.Codigo
              else
                FqryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value        := '00000';
              FqryConsulta.Parameters.ParamByName('CD_VIA_TRANSP').Value        := Via_Transporte.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value       := Pais_Proced.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_REGIME_TRIB').Value       := Regime_Trib.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_PAIS_PROCEDENCIA').Value  := Pais_Proced.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_MOEDA_NEG').Value         := Moeda.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_URF_DESPACHO').Value      := URF_Despacho;
              FqryConsulta.Parameters.ParamByName('CD_INCOTERM').Value          := Incoterms;
              FqryConsulta.Parameters.ParamByName('CD_LOCAL_EMBARQUE').Value    := Local_Embarque.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_AGENTE_CARGA').Value      := Agente_Transporte.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_URF_ENTRADA').Value       := URF_Entrada;
              FqryConsulta.Parameters.ParamByName('CD_MOEDA_FRETE').Value       := Frete.Moeda.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_MOEDA_SEGURO').Value      := Seguro.Moeda.Codigo;
              FqryConsulta.Parameters.ParamByName('DT_ABERTURA').Value          := Date;
              FqryConsulta.Parameters.ParamByName('IN_VINC_IMPO_EXPO').Value    := Vinculacao.Codigo;
              FqryConsulta.Parameters.ParamByName('NM_VEICULO').Value           := LeftStr(Navio.Texto, 30);
              FqryConsulta.Parameters.ParamByName('PL_PO').Value                := PLPedido;
              FqryConsulta.Parameters.ParamByName('QT_TOTAL_ITENS').Value       := High(Itens) + 1;
              if Tipo_Frete.Codigo = '0' then
              begin
                FqryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT').Value   := Frete.Valor;
                FqryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID').Value   := 0;
              end
              else
              begin
                FqryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT').Value   := 0;
                FqryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID').Value   := Frete.Valor;
              end;
              FqryConsulta.Parameters.ParamByName('VL_SEGURO').Value            := Seguro.Valor;
              FqryConsulta.Parameters.ParamByName('VL_TOTAL').Value             := VLTotalPedido;
              FqryConsulta.Parameters.ParamByName('CD_AREA').Value              := _AREA;
              FqryConsulta.Parameters.ParamByName('CD_LOCAL_DESEMBARQUE').Value := Local_Desemb.Codigo;
              FqryConsulta.Parameters.ParamByName('CD_SERVICO').Value           := _SERVICO;
              FqryConsulta.Parameters.ParamByName('CD_USUARIO').Value           := FCodUsuario;
              FqryConsulta.Parameters.ParamByName('DT_CONHECIMENTO').Value      := Data_Conhecimento;
              FqryConsulta.Parameters.ParamByName('CD_EMPRESA').Value           := Cliente;
              FqryConsulta.ExecSQL;

              ExecuteSQL(' UPDATE TFLP_PO ' +
                         ' SET DT_REALIZACAO = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103), ' +
                         '     DT_PREVISTA   = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) ' +
                         ' WHERE CD_EVENTO  IN (''003'',''022'') ' +
                         '  AND NR_PROCESSO = ''' + Numero + ''' ' +
                         '  AND CD_EMPRESA  = ''' + Cliente + '''');
              ExecuteSQL('EXEC sp_atz_ev_flp_po ''' + Numero + ''', ''' + Cliente + '''');
            end;
          end
          else
          begin
            Processo := Trim(ConsultaSQLPlanilha(Format(' SELECT NR_PROCESSO ' +
                                                ' FROM TPROCESSO ' +
                                                ' WHERE NR_REFERENCIA = ''%s''', [FCapa.Pedidos[Ped].Numero])));
          end;

          { ---------------- Item ---------------- }
          NrItem := StrToInt(ConsultaSQLPlanilha(Format('SELECT ISNULL(MAX(CONVERT(INT, NR_ITEM)), 0) ' +
                                                ' FROM TPO_ITEM ' +
                                                ' WHERE NR_PROCESSO = ''%s'' ' +
                                                '   AND CD_EMPRESA  = ''%s''', [FCapa.Pedidos[Ped].Numero, Cliente])));
          NrItemCliente := StrToInt(ConsultaSQLPlanilha(Format('SELECT ISNULL(MAX(CONVERT(INT, NR_ITEM_CLIENTE)), 0) ' +
                                                       ' FROM TPO_ITEM ' +
                                                       ' WHERE NR_PROCESSO = ''%s'' ' +
                                                       '   AND CD_EMPRESA  = ''%s''', [FCapa.Pedidos[Ped].Numero, Cliente])));
          VerificaMercadorias;
          FqryConsulta.SQL.Clear;
          FqryConsulta.SQL.Add(' INSERT INTO TPO_ITEM(NR_PROCESSO, NR_ITEM, CD_EXPORTADOR, CD_FABRICANTE, CD_MERCADORIA, CD_NCM_SH, CD_MOEDA_NEGOCIADA, CD_INCOTERM, CD_REG_TRIB_II,');
          FqryConsulta.SQL.Add('                      PL_ITEM, QT_INICIAL, QT_DISPONIVEL, TP_CALCULO, TX_MERCADORIA, VL_UNITARIO, VL_TOTAL, VL_FRETE_COLLECT, VL_FRETE_PREPAID_MOEDA,');
          FqryConsulta.SQL.Add('                      VL_SEGURO_MOEDA, NR_ITEM_CLIENTE, CD_EMBARCACAO, NR_CONHECIMENTO, NR_PARCIAL, CD_EMPRESA, IN_UTILIZADO_INSTR_DESEMB, ID_CODIGO_INSTR_DESEMB,');
          FqryConsulta.SQL.Add('                      CD_LOCAL_DESEMBARQUE, CD_AGENTE, CD_PAIS_ORIGEM, NR_FATURA, DT_FATURA, CD_AREA)');
          FqryConsulta.SQL.Add('VALUES(:NR_PROCESSO, :NR_ITEM, :CD_EXPORTADOR, :CD_FABRICANTE, :CD_MERCADORIA, :CD_NCM_SH, :CD_MOEDA_NEGOCIADA, :CD_INCOTERM, :CD_REG_TRIB_II,');
          FqryConsulta.SQL.Add('       :PL_ITEM, :QT_INICIAL, :QT_DISPONIVEL, :TP_CALCULO, :TX_MERCADORIA, :VL_UNITARIO, :VL_TOTAL, :VL_FRETE_COLLECT, :VL_FRETE_PREPAID_MOEDA,');
          FqryConsulta.SQL.Add('       :VL_SEGURO_MOEDA, :NR_ITEM_CLIENTE, :CD_EMBARCACAO, :NR_CONHECIMENTO, :NR_PARCIAL, :CD_EMPRESA, :IN_UTILIZADO_INSTR_DESEMB, :ID_CODIGO_INSTR_DESEMB,');
          FqryConsulta.SQL.Add('       :CD_LOCAL_DESEMBARQUE, :CD_AGENTE, :CD_PAIS_ORIGEM, :NR_FATURA, :DT_FATURA, :CD_AREA)');
          with FCapa, FCapa.Pedidos[Ped] do
          begin
            for Item := 0 to High(Itens) do
            begin
              with Itens[Item] do
              begin
                FqryConsulta.Parameters.ParamByName('NR_PROCESSO').Value               := Numero;
                FqryConsulta.Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 1);
                FqryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value             := Fornecedor.Codigo;
                FqryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value             := Fabricante.Codigo;
                FqryConsulta.Parameters.ParamByName('CD_MERCADORIA').Value             := Codigo_Item;
                FqryConsulta.Parameters.ParamByName('CD_NCM_SH').Value                 := Ncm;
                FqryConsulta.Parameters.ParamByName('CD_MOEDA_NEGOCIADA').Value        := Moeda.Codigo;
                FqryConsulta.Parameters.ParamByName('CD_INCOTERM').Value               := Incoterms;
                FqryConsulta.Parameters.ParamByName('CD_REG_TRIB_II').Value            := Regime_Trib.Codigo;
                FqryConsulta.Parameters.ParamByName('PL_ITEM').Value                   := Peso_Liquido_Total;
                FqryConsulta.Parameters.ParamByName('QT_INICIAL').Value                := 0;
                FqryConsulta.Parameters.ParamByName('QT_DISPONIVEL').Value             := 0;
                FqryConsulta.Parameters.ParamByName('TP_CALCULO').Value                := '1';
                FqryConsulta.Parameters.ParamByName('TX_MERCADORIA').Value             := Descricao.Text;
                FqryConsulta.Parameters.ParamByName('VL_UNITARIO').Value               := Valor_Unitario;
                FqryConsulta.Parameters.ParamByName('VL_TOTAL').Value                  := Valor_Total;
                if Tipo_Frete.Codigo = '0' then
                begin
                  FqryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT').Value        := (Frete.Valor / QtdPedido) * Quantidade;
                  FqryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID_MOEDA').Value  := 0;
                end
                else
                begin
                  FqryConsulta.Parameters.ParamByName('VL_FRETE_COLLECT').Value        := 0;
                  FqryConsulta.Parameters.ParamByName('VL_FRETE_PREPAID_MOEDA').Value  := (Frete.Valor / QtdPedido) * Quantidade;
                end;
                FqryConsulta.Parameters.ParamByName('VL_SEGURO_MOEDA').Value           := (Seguro.Valor / QtdPedido) * Quantidade;
                FqryConsulta.Parameters.ParamByName('NR_ITEM_CLIENTE').Value           := FormatFloat('0000', NrItemCliente + 1);
                FqryConsulta.Parameters.ParamByName('CD_EMBARCACAO').Value             := Navio.Codigo;
                FqryConsulta.Parameters.ParamByName('NR_CONHECIMENTO').Value           := Nr_Conhecimento;
                FqryConsulta.Parameters.ParamByName('NR_PARCIAL').Value                := 0;
                FqryConsulta.Parameters.ParamByName('CD_EMPRESA').Value                := Cliente;
                FqryConsulta.Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '0';
                FqryConsulta.Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := Null;
                FqryConsulta.Parameters.ParamByName('CD_LOCAL_DESEMBARQUE').Value      := FCapa.Local_Desemb.Codigo;
                FqryConsulta.Parameters.ParamByName('CD_AGENTE').Value                 := FCapa.Agente_Transporte.Codigo;
                FqryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value            := FCapa.Pais_Proced.Codigo;
                FqryConsulta.Parameters.ParamByName('NR_FATURA').Value                 := Null;
                FqryConsulta.Parameters.ParamByName('DT_FATURA').Value                 := Null;
                FqryConsulta.ExecSQL;
                FqryConsulta.Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 2);
                FqryConsulta.Parameters.ParamByName('QT_INICIAL').Value                := Quantidade;
                FqryConsulta.Parameters.ParamByName('QT_DISPONIVEL').Value             := Quantidade;
                FqryConsulta.Parameters.ParamByName('NR_PARCIAL').Value                := 1;
                FqryConsulta.Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '1';
                FqryConsulta.Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := FInstrucaoDesembaraco;
                if High(FCapa.Faturas) = 0 then // Se tiver apenas uma fatura pode utilizar
                begin
                  FqryConsulta.Parameters.ParamByName('NR_FATURA').Value               := FCapa.Faturas[0].Invoice;
                  FqryConsulta.Parameters.ParamByName('DT_FATURA').Value               := FCapa.Faturas[0].Data;
                end;
                FqryConsulta.Parameters.ParamByName('CD_AREA').Value               := _AREA;
                FqryConsulta.ExecSQL;

                { --- Item Instrução de Desembaraço ---- }
                ExecuteSQL(' INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO(ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO) ' +
                           ' VALUES(''' + FInstrucaoDesembaraco + ''', ''' + Numero + ''', ''' + FormatFloat('0000', NrItemCliente + 1) + ''', 1, ' +
                              'CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103))');
                Inc(NrItem, 2);
                Inc(NrItemCliente);
              end;
            end;
          end;
        end;

        { ----------- Digitalização ------------ }
        PathDig := Trim(ConsultaLookup('TPARAMETROS', 'PATH_DIGITALIZACAO', ''));
        NomeArquivo := Trim(ConsultaSQLPlanilha(' SELECT NM_PREFIXO_ARQ ' +
                                        ' FROM TTP_DOCTO_DIGITALIZADO (NOLOCK) ' +
                                        ' WHERE CD_TIPO_DOCTO = 6 ' +
                                        '   AND ID_TABELA = 1225680060 ')) + '01' + ExtractFileExt(FArquivo);
        if PathDig[Length(PathDig)] <> '\' then
          PathDig := PathDig + '\';
        PathDig := PathDig + 'TPROCESSO\' + FInstrucaoDesembaraco + '\';
        if not DirectoryExists(PathDig) then
          ForceDirectories(PathDig);
        FqryConsulta.SQL.Clear;
        FqryConsulta.SQL.Add('INSERT INTO TPROCESSO_DOCTOS(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA)');
        FqryConsulta.SQL.Add('VALUES(:NR_PROCESSO, 6, ''Instrução de Desembaraço'', :NM_ARQUIVO, :CD_USUARIO_CRIACAO, GETDATE(), 1, 1225680060)');
        FqryConsulta.Parameters.ParamByName('NR_PROCESSO').Value        := FInstrucaoDesembaraco;
        FqryConsulta.Parameters.ParamByName('NM_ARQUIVO').Value         := NomeArquivo;
        FqryConsulta.Parameters.ParamByName('CD_USUARIO_CRIACAO').Value := FCodUsuario;
        MS := TMemoryStream.Create;
        MS.LoadFromFile(FArquivo);
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
        end;

        {//NÃO É PRA MANDAR AUTORIZAR
        AssuntoEmail := '[MyIndaiaMail] Nova Instrução de Desembaraço Autorizada :' + FInstrucaoDesembaraco;
        Cliente := ConsultaLookup('TEMPRESA_NAC', 'NM_EMPRESA', 'CD_EMPRESA = ''' + Cliente + '''');
        AssuntoEmail := AssuntoEmail + ' / Cliente: ' + Cliente;
        if FCapa.Via_Transporte.Texto <> '' then
          AssuntoEmail := AssuntoEmail + ' / Modal: ' + FCapa.Via_Transporte.Texto;

        CorpoEmail := '<html>' +
                      '<body>' +
                      '    Segue planilha em anexo' +
                      '    <br><br>' +
                      '    <b>Instrução: </b>' + FInstrucaoDesembaraco +
                      '    <br>' +
                      '    <b>Cliente: </b>' + Cliente +
                      '    <br>' +
                      '    <b>Modal: </b>' + FCapa.Via_Transporte.Texto +
                      '    <br><br>' +
                      '    <br>' +
                      '    <b>Arquivos Digitalizados:</b>' +
                      '    <br>' +
                      '    <a href="' + PathDig + NomeArquivo + '">Instrução de Desembaraço</a>';

        UsuarioEmail := ConsultaLookUp('TUSUARIO', 'NM_EMAIL', 'CD_USUARIO = ''' + FCodUsuario + '''');

        if FqryConsulta.Active then
          FqryConsulta.Close;
        FqryConsulta.SQL.Clear;
        FqryConsulta.SQL.Add('SELECT *');
        FqryConsulta.SQL.Add('FROM VW_CONFIG_MAIL');
        FqryConsulta.Open;

        if FCapa.Via_Transporte.Codigo = '01' then
          EnviaEmail(FqryConsulta.FieldByName('NM_HOST').AsString, FqryConsulta.FieldByName('NM_LOGIN').AsString, FqryConsulta.FieldByName('NM_SENHA').AsString,
             FqryConsulta.FieldByName('NR_PORTA').AsInteger, AssuntoEmail, CorpoEmail, 'registro03@myindaia.com.br;' + UsuarioEmail,
             'ti@myindaia.com.br', [FArquivo])
        else
          EnviaEmail(FqryConsulta.FieldByName('NM_HOST').AsString, FqryConsulta.FieldByName('NM_LOGIN').AsString, FqryConsulta.FieldByName('NM_SENHA').AsString,
             FqryConsulta.FieldByName('NR_PORTA').AsInteger, AssuntoEmail, CorpoEmail, 'analise.aero@myindaia.com.br;' + UsuarioEmail,
             'ti@myindaia.com.br', [FArquivo]);
        }
        FconBroker.CommitTrans;
        Result := True;
        {FMensagens.Add('Instrução de Desembaraço: ' + FInstrucaoDesembaraco);
        for Ped := 0 to High(FCapa.Pedidos) do
        begin
          FMensagens.Add('Pedido: ' + FCapa.Pedidos[Ped].Numero);
          for Item := 0 to High(FCapa.Pedidos[Ped].Itens) do
            FMensagens.Add('      ' + FormatFloat('000', + (Item * 2) + 1) + ' - ' + FCapa.Pedidos[Ped].Itens[Item].Codigo_Item);
        end;}
      end; // VerificaDeParas
    except
      on E: Exception do
      begin
        FMensagens.Add('Erro gravando dados.');
        FMensagens.Add('Mensagem: ' + StringReplace(StringReplace(E.Message, #13, ' ', [rfReplaceAll]), #10, '', [rfReplaceAll]));
        if FconBroker.InTransaction then
          FconBroker.RollbackTrans;
        SetFileAttributes(PAnsiChar(PathDig + NomeArquivo), GetFileAttributes(PAnsiChar(PathDig + NomeArquivo)) xor SysUtils.faReadOnly);
        DeleteFile(PAnsiChar(PathDig + NomeArquivo));
      end;
    end;
  finally
  end;
end;

function TIntegraPlan.IntegraPlanilhaCroda(AArquivo: String; AUsuario, AEmpresa: String): Boolean;
var
  ExcelApp: TExcelApplication;
  ExcelWB : TExcelWorkbook;
  ExcelWS : TExcelWorksheet;
  conBroker : TADOConnection;
  cmdBroker : TADOCommand;
  qryPedido : TADOQuery;
  qryAux    : TADOQuery;
  qryProcesso   : TADOQuery;
  qryPO      : TADOQuery;
  qryPOItem  : TADOQuery;
  qryID : TADOQuery;
  //qryMercadoria : TADOQuery; CRODA NAO VAI CADASTRAR MERCADORIA - Guilherme 04/12/2013
  NrProcesso, NrPedido, NmUnidMedida, NmMoeda : String;
  vNCM, vLI, NrInvoice, TxMercadoria, TxMercadoriaIngles, CdMercadoria, CdExportador, TpCalculo, CdIncoterm, CdUsuario, TxArquivo, DescNmCliente : String;
  vContador, vContadorMercadoria, vLinha, NrItem, NrItemCliente, FazID, vLeadTime : Integer;
  VlUnitario, VlTotal, QtMercadoria :  Double;
  DtRecebPO, DtDeliv : TDateTime;
  PathDig, NomeArquivo: String;
  MS: TMemoryStream;
  Decimal: Char;
  Milhar: Char;
begin
  Decimal           := DecimalSeparator;
  Milhar            := ThousandSeparator;
  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  ShortDateFormat   := 'dd/mm/yyyy';

  Result := False;
  CdUsuario := AUsuario;
  TxArquivo := AArquivo;
  vContador := 0;
  ErrosCroda.Clear;
  FMensagens.Clear;
  //vContadorMercadoria := 0; CRODA NAO VAI CADASTRAR MERCADORIA - Guilherme 04/12/2013
  vLinha := 2;
  NrItem := 0;
  FazID := 0;
  try
    conBroker := TADOConnection.Create(nil);
    cmdBroker := TADOCommand.Create(nil);
    qryPedido := TADOQuery.Create(nil);
    qryAux    := TADOQuery.Create(nil);
    qryProcesso := TADOQuery.Create(nil);
    qryPO := TADOQuery.Create(nil);
    qryPOItem := TADOQuery.Create(nil);
    qryID := TADOQuery.Create(nil);
    //qryMercadoria := TADOQuery.Create(nil); CRODA NAO VAI CADASTRAR MERCADORIA - Guilherme 04/12/2013

    with conBroker do
    begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor + ';Initial Catalog=BROKER;' +
        'User ID=SA;Password=123;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;

    with cmdBroker do
    begin
      CommandTimeout := 200;
      CommandType := cmdText;
      Connection := conBroker;
      ExecuteOptions := [eoExecuteNoRecords];
    end;

    with qryPedido do
    begin
      Connection := conBroker;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

    with qryAux do
    begin
      Connection := conBroker;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

    with qryID do
    begin
      Connection := conBroker;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

    with qryProcesso do
    begin
      Connection := conBroker;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

    with qryPO do
    begin
      Connection := conBroker;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

    with qryPOItem do
    begin
      Connection := conBroker;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

    {* CRODA NAO VAI CADASTRAR MERCADORIA - Guilherme 04/12/2013
    with qryMercadoria do
    begin
      Connection := conBroker;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;
    *}

    ExcelApp  := TExcelApplication.Create(nil);
    ExcelWB   := TExcelWorkbook.Create(nil);
    ExcelWS   := TExcelWorksheet.Create(nil);

    try
      ExcelApp.Workbooks.Open(TxArquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
         EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
      try
        ExcelWB.ConnectTo(ExcelApp.ActiveWorkbook);
        ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] as ExcelWorksheet);

        while not (ExcelWS.Range['A' + IntToStr(vLinha), 'A' + IntToStr(vLinha)].Text = '') do
        begin
          //Leitura da Planilha
          NrPedido           := ExcelWS.Range['A' + IntToStr(vLinha), 'A' + IntToStr(vLinha)].Text;
          NrItemCliente      := ExcelWS.Range['B' + IntToStr(vLinha), 'B' + IntToStr(vLinha)].Text;
          CdExportador       := ConsultaLookup('TEMPRESA_EST', 'CD_EMPRESA', 'NR_CLIENTE = ''' + ExcelWS.Range['C' + IntToStr(vLinha), 'C' + IntToStr(vLinha)].Text + ''' AND IN_EXPORTADOR = ''1'' ');
          DtRecebPO          := StrToDateTime(ExcelWS.Range['E' + IntToStr(vLinha), 'E' + IntToStr(vLinha)].Text);
          CdMercadoria       := ExcelWS.Range['F' + IntToStr(vLinha), 'F' + IntToStr(vLinha)].Text;
          QtMercadoria       := StrToFloat(ExcelWS.Range['H' + IntToStr(vLinha), 'H' + IntToStr(vLinha)].Text);
          NmUnidMedida       := ConsultaLookup('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', 'NM_SIGLA = ''' + ExcelWS.Range['I' + IntToStr(vLinha), 'I' + IntToStr(vLinha)].Text + '''');
          VlUnitario         := StrToFloat(ExcelWS.Range['J' + IntToStr(vLinha), 'J' + IntToStr(vLinha)].Value);
          TpCalculo          := ExcelWS.Range['L' + IntToStr(vLinha), 'L' + IntToStr(vLinha)].Text;
          NmMoeda            := ConsultaLookup('TMOEDA_BROKER', 'CD_MOEDA', 'AP_MOEDA = ''' + ExcelWS.Range['M' + IntToStr(vLinha), 'M' + IntToStr(vLinha)].Text + '''');
          VlTotal            := StrToFloat(ExcelWS.Range['N' + IntToStr(vLinha), 'N' + IntToStr(vLinha)].Value);
          CdIncoterm         := ExcelWS.Range['O' + IntToStr(vLinha), 'O' + IntToStr(vLinha)].Text;
          DescNmCliente      := ExcelWS.Range['R' + IntToStr(vLinha), 'R' + IntToStr(vLinha)].Text;
          DtDeliv            := StrToDateTime(ExcelWS.Range['S' + IntToStr(vLinha), 'S' + IntToStr(vLinha)].Text);


          if UpperCase(TpCalculo) = 'TO' then
            TpCalculo := '3'
          else
            TpCalculo := '1';

          //INSTRUCAO DE DESEMBARAÇO
          if FazID = 0 then
          begin
            with qryID do
            begin
              FInstrucaoDesembaraco := ConsultaSQLPlanilha(' SELECT ''ID'' + RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) + 1, ''1'')), 8) + ''-'' + RIGHT(YEAR(GETDATE()), 2) ' +
                                                           ' FROM TINSTRUCAO_DESEMBARACO (NOLOCK)' +
                                                           ' WHERE RIGHT(RTRIM(ID_CODIGO), 2) = RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2)');
              SQL.Clear;
              SQL.Add(' INSERT INTO TINSTRUCAO_DESEMBARACO (ID_CODIGO, CD_USUARIO, DT_CRIACAO, IN_AUTORIZADO, CD_CLIENTE, CD_RESPONSAVEL, CD_EMPRESA)');
              SQL.Add(' VALUES (:ID_CODIGO, :CD_USUARIO, :DT_CRIACAO, :IN_AUTORIZADO, :CD_CLIENTE, :CD_RESPONSAVEL, :CD_EMPRESA)');
              Parameters.ParamByName('ID_CODIGO').Value              := FInstrucaoDesembaraco;
              Parameters.ParamByName('CD_USUARIO').Value             := CdUsuario;
              Parameters.ParamByName('DT_CRIACAO').Value             := Date;
              Parameters.ParamByName('IN_AUTORIZADO').Value          := '0';
              Parameters.ParamByName('CD_CLIENTE').Value             := AEmpresa;
              Parameters.ParamByName('CD_RESPONSAVEL').Value         := '0088';
              Parameters.ParamByName('CD_EMPRESA').Value             := AEmpresa;
              ExecSQL;
            end;
            FazID := 1;
          end;


          with qryPedido do
          begin
            SQL.Clear;
            SQL.Add(' SELECT COUNT(*) AS CONTADOR FROM TPO ');
            SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
            SQL.Add('   AND CD_EMPRESA = :CD_EMPRESA ');
            Parameters.ParamByName('NR_PROCESSO').Value := NrPedido;
            Parameters.ParamByName('CD_EMPRESA').Value := AEmpresa;
            Open;
            vContador := FieldByName('CONTADOR').Value;
            Close;
          end;

          if vContador = 0 then
          begin
            with qryAux do
            begin
              SQL.Clear;
              SQL.Add(' SELECT ISNULL(MAX(ISNULL(CONVERT(INT, SUBSTRING(NR_PROCESSO, 8, CHARINDEX(''-'', NR_PROCESSO, CHARINDEX(''-'', NR_PROCESSO)) - 1)), 0)),0) AS PROCESSO ');
              SQL.Add(' FROM TPROCESSO ');
              SQL.Add(' WHERE CD_UNID_NEG = ''01'' ');
              SQL.Add('   AND CD_PRODUTO  = ''06'' ');
              SQL.Add('   AND DATEPART(YYYY, DT_ABERTURA) = DATEPART(YYYY, GETDATE()) ');
              SQL.Add('   AND SUBSTRING(NR_PROCESSO, 5, 2) = ''CR'' ');
              Open;
              NrProcesso := FieldByName('PROCESSO').Value;
              Close;

              NrProcesso := Format('%s%s-%s-%s', ['0106', 'CR', FormatFloat('000000', StrToInt(NrProcesso) + 1), FormatDateTime('yy', Now)]);
            end;
                //TPROCESSO
            with qryProcesso do
            begin
              SQL.Clear;
              SQL.Add(' INSERT INTO TPROCESSO(NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_GRUPO, NR_REFERENCIA, CD_CLIENTE, IN_LIBERADO, IN_CANCELADO,');
              SQL.Add('                      DT_ABERTURA, HR_ABERTURA, IN_DADOS_IGUAIS_ITENS, CD_INCOTERM, CD_ANALISTA_CLIENTE, CD_USUARIO, ');
              SQL.Add('                      CD_IMPORTADOR, CD_EXPORTADOR, CD_SERVICO, CD_AREA, IN_WEB, CD_TP_PEDIDO)');
              SQL.Add(' VALUES(:NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_GRUPO, :NR_REFERENCIA, :CD_CLIENTE, :IN_LIBERADO, :IN_CANCELADO,');
              SQL.Add('       :DT_ABERTURA, :HR_ABERTURA, :IN_DADOS_IGUAIS_ITENS, :CD_INCOTERM, :CD_ANALISTA_CLIENTE, :CD_USUARIO, ');
              SQL.Add('       :CD_IMPORTADOR, :CD_EXPORTADOR,  :CD_SERVICO, :CD_AREA, ''1'', :CD_TP_PEDIDO )');
              Parameters.ParamByName('NR_PROCESSO').Value           := NrProcesso;
              Parameters.ParamByName('CD_UNID_NEG').Value           := '01';
              Parameters.ParamByName('CD_PRODUTO').Value            := '06';
              Parameters.ParamByName('CD_GRUPO').Value              := '083';
              Parameters.ParamByName('NR_REFERENCIA').Value         := NrPedido;
              Parameters.ParamByName('CD_CLIENTE').Value            := AEmpresa;
              Parameters.ParamByName('IN_LIBERADO').Value           := '1';
              Parameters.ParamByName('IN_CANCELADO').Value          := '0';
              Parameters.ParamByName('DT_ABERTURA').Value           := Date;
              Parameters.ParamByName('HR_ABERTURA').Value           := Now;
              Parameters.ParamByName('IN_DADOS_IGUAIS_ITENS').Value := '1';
              Parameters.ParamByName('CD_INCOTERM').Value           := CdIncoterm;
              Parameters.ParamByName('CD_ANALISTA_CLIENTE').Value   := NULL;
              Parameters.ParamByName('CD_USUARIO').Value            := CdUsuario;
              Parameters.ParamByName('CD_IMPORTADOR').Value         := AEmpresa;
              Parameters.ParamByName('CD_EXPORTADOR').Value         := CdExportador ;
              Parameters.ParamByName('CD_SERVICO').Value            := _SERVICO_CRODA;
              Parameters.ParamByName('CD_AREA').Value               := _AREA;
              Parameters.ParamByName('CD_TP_PEDIDO').Value          := '11';
              ExecSQL;
            end;
              //TPO
            with qryPO do
            begin
              SQL.Clear;
              SQL.Add(' INSERT INTO TPO(NR_PROCESSO, CD_IMPORTADOR, CD_EXPORTADOR, CD_MOEDA_NEG, CD_INCOTERM, DT_ABERTURA, VL_TOTAL, CD_AREA, CD_SERVICO, CD_USUARIO, CD_EMPRESA, IN_WEB)');
              SQL.Add(' VALUES(:NR_PROCESSO, :CD_IMPORTADOR, :CD_EXPORTADOR, :CD_MOEDA_NEG, :CD_INCOTERM, :DT_ABERTURA, :VL_TOTAL, :CD_AREA, :CD_SERVICO, :CD_USUARIO, :CD_EMPRESA, ''1'')');
              Parameters.ParamByName('NR_PROCESSO').Value          := NrPedido;
              Parameters.ParamByName('CD_IMPORTADOR').Value        := AEmpresa;
              Parameters.ParamByName('CD_EXPORTADOR').Value        := CdExportador;
              Parameters.ParamByName('CD_MOEDA_NEG').Value         := NmMoeda;
              Parameters.ParamByName('CD_INCOTERM').Value          := CdIncoterm;
              Parameters.ParamByName('DT_ABERTURA').Value          := Date;
              Parameters.ParamByName('VL_TOTAL').Value             := VlTotal;
              Parameters.ParamByName('CD_AREA').Value              := _AREA;
              Parameters.ParamByName('CD_SERVICO').Value           := _SERVICO_CRODA;
              Parameters.ParamByName('CD_USUARIO').Value           := CdUsuario;
              Parameters.ParamByName('CD_EMPRESA').Value           := AEmpresa;
              ExecSQL;

              SQL.Clear;
              SQL.Add(' UPDATE TFLP_PO ');
              SQL.Add(' SET DT_REALIZACAO = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103), ');
              SQL.Add('     DT_PREVISTA   = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) ');
              SQL.Add(' WHERE CD_EVENTO  IN (''003'',''022'') ');
              SQL.Add('  AND NR_PROCESSO = ''' + NrPedido + ''' ');
              SQL.Add('  AND CD_EMPRESA  = '+ QuotedStr(AEmpresa) );
              ExecSQL;

              SQL.Clear;
              SQL.Add(' EXEC sp_atz_ev_flp_po ''' + NrPedido + ''','+ QuotedStr(AEmpresa) );
              ExecSQL;
            end;
          end;

          //TPO_ITEM
          with qryPOItem do
          begin
            SQL.Clear;
            SQL.Add('SELECT ISNULL(MIN(CONVERT(INT, NR_ITEM)), 0) AS MIN_ITEM');
            SQL.Add(' FROM TPO_ITEM ');
            SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
            SQL.Add('   AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ');
            SQL.Add('   AND CD_EMPRESA  = :CD_EMPRESA ');
            Parameters.ParamByName('NR_PROCESSO').Value := NrPedido;
            Parameters.ParamByName('NR_ITEM_CLIENTE').Value := FormatFloat('0000', NrItemCliente);
            Parameters.ParamByName('CD_EMPRESA').Value  := AEmpresa;
            Open;
            NrItem := FieldByName('MIN_ITEM').Value;
            Close;

            if NrItem > 0 then
            begin
              SQL.Clear;
              SQL.Add(' DELETE FROM TPO_ITEM  ');
              SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
              SQL.Add('   AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ');
              SQL.Add('   AND CD_EMPRESA  = :CD_EMPRESA ');
              Parameters.ParamByName('NR_PROCESSO').Value := NrPedido;
              Parameters.ParamByName('NR_ITEM_CLIENTE').Value := FormatFloat('0000', NrItemCliente);;
              Parameters.ParamByName('CD_EMPRESA').Value  := AEmpresa;
              ExecSQL;
              Dec(NrItem);
            end
            else
            begin
              SQL.Clear;
              SQL.Add('SELECT ISNULL(MAX(CONVERT(INT, NR_ITEM)), 0) AS MAX_ITEM');
              SQL.Add(' FROM TPO_ITEM ');
              SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
              SQL.Add('   AND CD_EMPRESA  = :CD_EMPRESA ');
              Parameters.ParamByName('NR_PROCESSO').Value := NrPedido;
              Parameters.ParamByName('CD_EMPRESA').Value  := AEmpresa;
              Open;
              NrItem := FieldByName('MAX_ITEM').Value;
              Close;
            end;

            //MERCADORIA
            SQL.Clear;
            SQL.Add('SELECT MERC.CD_NCM_SH, MERC.NM_MERCADORIA, ISNULL(FMERC.LEAD_TIME, 0) AS LEAD_TIME');
            SQL.Add(' FROM TMERCADORIA MERC ');
            SQL.Add(' LEFT JOIN TFINALIDADE_MERC FMERC ON FMERC.CD_FINALIDADE_MERC = MERC.CD_FINALIDADE_MERC ');
            SQL.Add(' WHERE CD_MERCADORIA = :CD_MERCADORIA ');
            Parameters.ParamByName('CD_MERCADORIA').Value := CdMercadoria;
            Open;
            vNCM := FieldByName('CD_NCM_SH').Value;
            TxMercadoria := FieldByName('NM_MERCADORIA').Value;
            vLeadTime := FieldByName('LEAD_TIME').Value;
            Close;

            try
              SQL.Clear;
              SQL.Add(' INSERT INTO TPO_ITEM(NR_PROCESSO, NR_ITEM, CD_EXPORTADOR, CD_MERCADORIA, CD_NCM_SH, CD_MOEDA_NEGOCIADA, CD_INCOTERM, ');
              SQL.Add('                      PL_ITEM, QT_INICIAL, QT_DISPONIVEL, TP_CALCULO, TX_MERCADORIA, VL_UNITARIO, VL_TOTAL, CD_UNID_MEDIDA, ');
              SQL.Add('                      NR_ITEM_CLIENTE, NR_PARCIAL, CD_EMPRESA, IN_UTILIZADO_INSTR_DESEMB, ID_CODIGO_INSTR_DESEMB, CD_AREA, CD_MERC_FORNEC, IN_WEB)');
              SQL.Add('VALUES(:NR_PROCESSO, :NR_ITEM, :CD_EXPORTADOR, :CD_MERCADORIA, :CD_NCM_SH, :CD_MOEDA_NEGOCIADA, :CD_INCOTERM,');
              SQL.Add('       :PL_ITEM, :QT_INICIAL, :QT_DISPONIVEL, :TP_CALCULO, :TX_MERCADORIA, :VL_UNITARIO, :VL_TOTAL, :CD_UNID_MEDIDA, ');
              SQL.Add('       :NR_ITEM_CLIENTE, :NR_PARCIAL, :CD_EMPRESA, :IN_UTILIZADO_INSTR_DESEMB, :ID_CODIGO_INSTR_DESEMB, :CD_AREA, :CD_MERC_FORNEC, ''1'')');
              Parameters.ParamByName('NR_PROCESSO').Value               := NrPedido;
              Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 1);
              Parameters.ParamByName('CD_EXPORTADOR').Value             := CdExportador;
              Parameters.ParamByName('CD_MERCADORIA').Value             := CdMercadoria;
              Parameters.ParamByName('CD_NCM_SH').Value                 := vNCM;
              Parameters.ParamByName('CD_MOEDA_NEGOCIADA').Value        := NmMoeda;
              Parameters.ParamByName('CD_INCOTERM').Value               := CdIncoterm;
              Parameters.ParamByName('PL_ITEM').Value                   := 0;
              Parameters.ParamByName('QT_INICIAL').Value                := QtMercadoria;
              Parameters.ParamByName('QT_DISPONIVEL').Value             := 0;
              Parameters.ParamByName('TP_CALCULO').Value                := TpCalculo;
              Parameters.ParamByName('TX_MERCADORIA').Value             := TxMercadoria;
              Parameters.ParamByName('VL_UNITARIO').Value               := VlUnitario;
              Parameters.ParamByName('VL_TOTAL').Value                  := VlTotal;
              Parameters.ParamByName('CD_UNID_MEDIDA').Value            := NmUnidMedida;
              Parameters.ParamByName('NR_ITEM_CLIENTE').Value           := FormatFloat('0000', NrItemCliente);
              Parameters.ParamByName('NR_PARCIAL').Value                := 0;
              Parameters.ParamByName('CD_EMPRESA').Value                := AEmpresa;
              Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '0';
              Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := NULL;
              Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').DataType := ftString;
              Parameters.ParamByName('CD_AREA').Value                   := _AREA;
              Parameters.ParamByName('CD_MERC_FORNEC').Value            := DescNmCliente;
              ExecSQL;
              Parameters.ParamByName('NR_ITEM').Value                   := FormatFloat('000', NrItem + 2);
              Parameters.ParamByName('QT_INICIAL').Value                := QtMercadoria;
              Parameters.ParamByName('QT_DISPONIVEL').Value             := QtMercadoria;
              Parameters.ParamByName('NR_PARCIAL').Value                := 1;
              Parameters.ParamByName('IN_UTILIZADO_INSTR_DESEMB').Value := '1';
              Parameters.ParamByName('ID_CODIGO_INSTR_DESEMB').Value    := FInstrucaoDesembaraco;
              ExecSQL;
              SQL.Clear;
              SQL.Add(' UPDATE TFLP_PO_ITEM ');
              SQL.Add(' SET DT_REALIZACAO = :DT_REALIZACAO ');
              SQL.Add(' WHERE CD_EVENTO  IN (''257'') ');
              SQL.Add('  AND NR_PROCESSO = :NR_PROCESSO ');
              SQL.Add('  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ');
              SQL.Add('  AND CD_EMPRESA  = ' + QuotedStr(AEmpresa) );
              Parameters.ParamByName('DT_REALIZACAO').Value := DtRecebPO;
              Parameters.ParamByName('NR_PROCESSO').Value   := NrPedido;
              Parameters.ParamByName('NR_ITEM_CLIENTE').Value   := FormatFloat('0000', NrItemCliente);
              ExecSQL;

              (*EVENTO 798*)
              SQL.Clear;
              SQL.Add(' UPDATE TFLP_PO_ITEM ');
              SQL.Add(' SET DT_REALIZACAO = :DT_REALIZACAO ');
              SQL.Add(' WHERE CD_EVENTO  IN (''798'') ');
              SQL.Add('  AND NR_PROCESSO = :NR_PROCESSO ');
              SQL.Add('  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ');
              SQL.Add('  AND CD_EMPRESA  = ' + QuotedStr(AEmpresa) );
              Parameters.ParamByName('DT_REALIZACAO').Value := IncDay(DtRecebPO, vLeadTime);
              Parameters.ParamByName('NR_PROCESSO').Value   := NrPedido;
              Parameters.ParamByName('NR_ITEM_CLIENTE').Value   := FormatFloat('0000', NrItemCliente);
              ExecSQL;

              (*EVENTO 275*)
              SQL.Clear;
              SQL.Add(' UPDATE TFLP_PO_ITEM ');
              SQL.Add(' SET DT_REALIZACAO = :DT_REALIZACAO ');
              SQL.Add(' WHERE CD_EVENTO  IN (''275'') ');
              SQL.Add('  AND NR_PROCESSO = :NR_PROCESSO ');
              SQL.Add('  AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE ');
              SQL.Add('  AND CD_EMPRESA  = ' + QuotedStr(AEmpresa));
              Parameters.ParamByName('DT_REALIZACAO').Value := DtDeliv;
              Parameters.ParamByName('NR_PROCESSO').Value   := NrPedido;
              Parameters.ParamByName('NR_ITEM_CLIENTE').Value   := FormatFloat('0000', NrItemCliente);
              ExecSQL;


              //ITEM - INSTRUCAO DE DESEMBARAÇO
              ExecuteSQL(' INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO(ID_CODIGO, NR_REFERENCIA, NR_ITEM_PO, NR_PARCIAL, DT_INCLUSAO) ' +
                         ' VALUES(''' + FInstrucaoDesembaraco + ''', ''' + NrPedido + ''', ''' + FormatFloat('0000', NrItemCliente) + ''', 1, ' +
                         ' CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103))');

            except
              on E: Exception do
              begin
                 ErrosCroda.Add('');
                 ErrosCroda.Add(E.Message);
                 ErrosCroda.Add('');
              end;
            end;
          end;
          Inc(vLinha);
          Inc(NrItem, 2);
        end;
      finally
        ExcelWS.Disconnect;
        ExcelWB.Disconnect;
        ExcelApp.Quit;
      end;
    finally
      FreeAndNil(ExcelWS);
      FreeAndNil(ExcelWB);
      FreeAndNil(ExcelApp);
      FreeAndNil(qryPedido);
      FreeAndNil(qryProcesso);
      FreeAndNil(qryPO);
      FreeAndNil(qryPOItem);
      FreeAndNil(qryAux);
      FreeAndNil(qryID);
    end;
    Result := True;
  except
    on E: Exception do
    begin
      ErrosCroda.Add('');
      ErrosCroda.Add(E.Message);
      ErrosCroda.Add('');
      Result := False;
    end;
  end;
  DecimalSeparator  := Decimal;
  ThousandSeparator := Milhar;
end;

function TIntegraPlan.LerPlanilha(AArquivo: String): Boolean;
var
  Plan : TCapa_Pedido;
  ExcelApp: TExcelApplication;
  ExcelWB: TExcelWorkbook;
  ExcelWS: TExcelWorksheet;
  Linha, LinhaAux: Integer;
  S: String;
  I: Integer;
  Decimal: Char;
  Milhar: Char;

  function GetIndicePedido(APedido: String): Integer;
  begin
    Result := 0;
    while (Result <= High(Plan.Pedidos)) and not SameText(Plan.Pedidos[Result].Numero, APedido) do
      Inc(Result);
    if Result > High(Plan.Pedidos) then
    begin
      SetLength(Plan.Pedidos, High(Plan.Pedidos) + 2);
      Plan.Pedidos[Result].Numero := APedido;
      SetLength(Plan.Pedidos[Result].Itens, 0);
    end;
  end;
begin
  Result := False;
  Decimal           := DecimalSeparator;
  Milhar            := ThousandSeparator;
  DecimalSeparator  := '.';
  ThousandSeparator := ',';
  try
    FMensagens.Clear;
    ErrosCroda.Clear;
    try
      ExcelApp  := TExcelApplication.Create(nil);
      ExcelWB   := TExcelWorkbook.Create(nil);
      ExcelWS   := TExcelWorksheet.Create(nil);
      try
        ExcelApp.Workbooks.Open(AArquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
        try
          ExcelWB.ConnectTo(ExcelApp.ActiveWorkbook);
          ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] as ExcelWorksheet);
          { --------------- Capa --------------- }
          SetLength(Plan.Faturas, 0);
          SetLength(Plan.Pedidos, 0);
          Plan.Data                    := StrToDate(StringReplace(ExcelWS.Range['P4', 'P4'].Text, '.', '/', [rfReplaceAll]));
          Plan.Nr_Sequencial_Embarque  := ExcelWS.Range['F9', 'F9'].Text;
          Plan.Analista.Texto          := ExcelWS.Range['F11', 'F11'].Text;
          Plan.CNPJ_Importador         := StringReplace(StringReplace(StringReplace(ExcelWS.Range['E15', 'E15'].Text, '.', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]);
          Plan.Nr_Conhecimento         := ExcelWS.Range['E21', 'E21'].Value2;
          Plan.Data_Conhecimento       := StrToDate(StringReplace(ExcelWS.Range['N21', 'N21'].Text, '.', '/', [rfReplaceAll]));;
          Plan.Moeda.Texto             := ExcelWS.Range['E22', 'E22'].Text;
          Plan.Incoterms               := ExcelWS.Range['N22', 'N22'].Text;
          Plan.Data_Embarque           := StrToDate(StringReplace(ExcelWS.Range['E23', 'E23'].Text, '.', '/', [rfReplaceAll]));
          Plan.Data_ETA                := StrToDate(StringReplace(ExcelWS.Range['N23', 'N23'].Text, '.', '/', [rfReplaceAll]));
          Plan.Local_Embarque.Texto    := ExcelWS.Range['E24', 'E24'].Text;
          Plan.Local_Desemb.Texto      := ExcelWS.Range['N24', 'N24'].Text;
          Plan.Pais_Proced.Texto       := ExcelWS.Range['E25', 'E25'].Text;
          Plan.Navio.Texto             := ExcelWS.Range['E26', 'E26'].Text;
          Plan.Peso_Bruto              := StrToFloat(StringReplace(StringReplace(ExcelWS.Range['N26', 'N26'].Text, '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]));
          S := Trim(ExcelWS.Range['E27', 'E27'].Text);
          Plan.URF_Despacho := '';
          while (S <> '') and (S[1] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) do
          begin
            Plan.URF_Despacho := Plan.URF_Despacho + S[1];
            Delete(S, 1, 1);
          end;
          S := Trim(ExcelWS.Range['N27', 'N27'].Text);
          Plan.URF_Entrada := '';
          while (S <> '') and (S[1] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) do
          begin
            Plan.URF_Entrada := Plan.URF_Entrada + S[1];
            Delete(S, 1, 1);
          end;
          S := ExcelWS.Range['E28', 'E28'].Text;
          I := Pos(' ', S);
          Plan.Frete.Moeda.Texto       := Copy(S, 1, I - 1);
          Delete(S, 1, I);
          //Plan.Frete.Valor             := StrToFloat(StringReplace(StringReplace(Trim(S), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]));
          Plan.Frete.Valor             := StrToFloat(Trim(S));
          S := Trim(ExcelWS.Range['N28', 'N28'].Text);
          if S <> '' then // Verifica se tem seguro
          begin
            I := Pos(' ', S);
            Plan.Seguro.Moeda.Texto      := Copy(S, 1, I - 1);
            Delete(S, 1, I);
            Plan.Seguro.Valor            := StrToFloat(StringReplace(StringReplace(Trim(S), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]));
          end;
          Plan.Vinculacao.Texto        := ExcelWS.Range['E29', 'E29'].Text;
          Plan.Tipo_Frete.Texto        := ExcelWS.Range['N29', 'N29'].Text;
          Plan.Via_Transporte.Texto    := ExcelWS.Range['E30', 'E30'].Text;
          Plan.Agente_Transporte.Texto := ExcelWS.Range['E31', 'E31'].Text;
          Plan.Fornecedor.Texto        := ExcelWS.Range['E33', 'E33'].Text;

          { -------------- Fatura -------------- }
          Linha := 35;
          while (Linha < 100) and not SameText(Trim(ExcelWS.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Text), 'Fatura Invoice') do
            Inc(Linha);
          if not SameText(Trim(ExcelWS.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Text), 'Fatura Invoice') then
          begin
            FMensagens.Add('Faturas não encontradas.');
            Exit;
          end;

          SetLength(Plan.Faturas, 0);
          while SameText(Trim(ExcelWS.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Text), 'Fatura Invoice') do
          begin
            SetLength(Plan.Faturas, High(Plan.Faturas) + 2);
            Plan.Faturas[High(Plan.Faturas)].Invoice        := ExcelWS.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Text;
            Plan.Faturas[High(Plan.Faturas)].Data           := StrToDate(StringReplace(ExcelWS.Range['H' + IntToStr(Linha), 'H' + IntToStr(Linha)].Text, '.', '/', [rfReplaceAll]));;
            Plan.Faturas[High(Plan.Faturas)].Condicao.Texto := ExcelWS.Range['M' + IntToStr(Linha), 'M' + IntToStr(Linha)].Text;
            Plan.Faturas[High(Plan.Faturas)].Fatura         := ExcelWS.Range['Q' + IntToStr(Linha), 'Q' + IntToStr(Linha)].Text;
            Inc(Linha);
          end;

          { --------------- Item --------------- }
          while True do
          begin
            // Procura próximo NCM
            LinhaAux := Linha;
            while (Linha < 10000) and (Linha - LinhaAux <= 20) and
               not SameText(Trim(ExcelWS.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Text), 'NCM') do
              Inc(Linha);
            if not SameText(Trim(ExcelWS.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Text), 'NCM') then
              Break;

            // Procura P.O.
            LinhaAux := Linha;
            while (LinhaAux < 10000) and not SameText(Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text), 'P.O.') do
              Inc(LinhaAux);
            if not SameText(Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text), 'P.O.') then
            begin
              FMensagens.Add('P.O. não encontrado para o NCM ''' + ExcelWS.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Text +
                 ''' na linha ' + IntToStr(Linha) + '.');
              Exit;
            end;
            Inc(LinhaAux);
            I := GetIndicePedido(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text);
            SetLength(Plan.Pedidos[I].Itens, High(Plan.Pedidos[I].Itens) + 2);
            with Plan.Pedidos[I].Itens[High(Plan.Pedidos[I].Itens)] do
            begin
              Ncm                := ExcelWS.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Text;
              Destaque           := ExcelWS.Range['I' + IntToStr(Linha), 'I' + IntToStr(Linha)].Text;
              NcmEx              := ExcelWS.Range['N' + IntToStr(Linha), 'N' + IntToStr(Linha)].Text;
              Nve                := ExcelWS.Range['Q' + IntToStr(Linha), 'Q' + IntToStr(Linha)].Text;
              Regime_Trib.Texto  := ExcelWS.Range['E' + IntToStr(Linha + 1), 'E' + IntToStr(Linha + 1)].Text;
              Nr_LI              := ExcelWS.Range['N' + IntToStr(Linha + 1), 'N' + IntToStr(Linha + 1)].Text;
              Fabricante.Texto   := ExcelWS.Range['E' + IntToStr(Linha + 2), 'E' + IntToStr(Linha + 2)].Text;
              Pedido             := ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text;
              Codigo_Item        := ExcelWS.Range['D' + IntToStr(LinhaAux), 'D' + IntToStr(LinhaAux)].Text;
              Quantidade         := StrToFloat(StringReplace(StringReplace(ExcelWS.Range['F' + IntToStr(LinhaAux), 'F' + IntToStr(LinhaAux)].Text, '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]));
              Peso_Liquido_Total := StrToFloat(StringReplace(StringReplace(ExcelWS.Range['H' + IntToStr(LinhaAux), 'H' + IntToStr(LinhaAux)].Text, '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]));
              Valor_Unitario     := StrToFloat(StringReplace(StringReplace(ExcelWS.Range['J' + IntToStr(LinhaAux), 'J' + IntToStr(LinhaAux)].Text, '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]));
              Valor_Total        := StrToFloat(StringReplace(StringReplace(ExcelWS.Range['L' + IntToStr(LinhaAux), 'L' + IntToStr(LinhaAux)].Text, '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]));
              Part_Number        := ExcelWS.Range['O' + IntToStr(LinhaAux), 'O' + IntToStr(LinhaAux)].Text;
              Descricao          := TStringList.Create;
              IndiceInvoice      := 0;

              Inc(LinhaAux);
              while (LinhaAux < 10000) and (Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text) = '') do
                Inc(LinhaAux);
              if (Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text) <> '') and
                 not SameText(Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text), 'NCM') then
                with Descricao do
                  repeat
                    while (Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text) <> '') and
                       not SameText(Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text), 'NCM') do
                    begin
                      S := Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text);
                      if (S <> '') and (S[1] = '"') then
                        System.Delete(S, 1, 1);
                      if (S <> '') and (S[Length(S)] = '"') then
                        S := Copy(S, 1, Length(S) - 1);
                      if (S <> '') then
                        Add(S);
                      Inc(LinhaAux);
                    end;
                    Inc(LinhaAux);
                    Linha := LinhaAux;
                    while (LinhaAux < 10000) and (LinhaAux - Linha <= 20) and (Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text) = '') and
                       not SameText(Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text), 'NCM') do
                      Inc(LinhaAux);
                  until (Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text) = '') or
                     SameText(Trim(ExcelWS.Range['B' + IntToStr(LinhaAux), 'B' + IntToStr(LinhaAux)].Text), 'NCM');
              Descricao.Text := AnsiUpperCase(Descricao.Text);
              Codigo_Item    := AnsiUpperCase(Codigo_Item);
              Part_Number    := AnsiUpperCase(Part_Number);
            end;
            Linha := LinhaAux;
          end;
        finally
          ExcelWS.Disconnect;
          ExcelWB.Disconnect;
          ExcelApp.Quit;
        end;
      finally
        FreeAndNil(ExcelWS);
        FreeAndNil(ExcelWB);
        FreeAndNil(ExcelApp);
      end;
      Result := True;
      FCapa := Plan;
    except
      on E: Exception do
      begin
        Result := False;
        FMensagens.Add('Erro integrando a planilha.');
        FMensagens.Add('Mensagem: ' + StringReplace(StringReplace(E.Message, #13, ' ', [rfReplaceAll]), #10, '', [rfReplaceAll]));
      end;
    end;
  finally
    DecimalSeparator  := Decimal;
    ThousandSeparator := Milhar;
  end;
end;

procedure TIntegraPlan.VerificaMercadorias;
var
  P, I: Integer;
begin
  for P := 0 to High(FCapa.Pedidos) do
    for I := 0 to High(FCapa.Pedidos[P].Itens) do
      with FCapa, FCapa.Pedidos[P], FCapa.Pedidos[P].Itens[I] do
      begin
        if Trim(Codigo_Item) = '' then
          Codigo_Item := ConsultaSQLPlanilha(' SELECT ''A77-'' + CONVERT(VARCHAR, MAX(CONVERT(INT, RIGHT(RTRIM(ISNULL(CD_MERCADORIA, ''A77-0'')), LEN(RTRIM(ISNULL(CD_MERCADORIA, ''A77-0''))) - 4)) + 1)) ' +
                                             ' FROM TMERCADORIA (NOLOCK) ' +
                                             ' WHERE CD_GRUPO = ''A77''' +
                                             '   AND CD_MERCADORIA LIKE ''A77-%''');
        if ConsultaLookup('TMERCADORIA', 'CD_MERCADORIA', 'CD_MERCADORIA = ''' + Codigo_Item + '''') = '' then
        begin
          FqryConsulta.SQL.Clear;
          FqryConsulta.SQL.Add('INSERT INTO TMERCADORIA(CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, CD_NCM_SH, CD_EXPORTADOR, CD_PAIS_ORIGEM, CD_FABRICANTE, CD_GRUPO,');
          FqryConsulta.SQL.Add('                        CD_AREA, NM_MERC_RESUMIDA, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO)');
          FqryConsulta.SQL.Add('VALUES(:CD_MERCADORIA, :NM_MERCADORIA, :AP_MERCADORIA, :CD_NCM_SH, :CD_EXPORTADOR, :CD_PAIS_ORIGEM, :CD_FABRICANTE, ''A77'',');
          FqryConsulta.SQL.Add('       :CD_AREA, :NM_MERC_RESUMIDA, :CD_USUARIO_CRIACAO, GETDATE(), ''1'')');
          FqryConsulta.Parameters.ParamByName('CD_MERCADORIA').Value      := Codigo_Item;
          FqryConsulta.Parameters.ParamByName('NM_MERCADORIA').Value      := Descricao.Text;
          if Descricao.Count > 0 then
            FqryConsulta.Parameters.ParamByName('AP_MERCADORIA').Value    := LeftStr(Descricao[0], 25)
          else
            FqryConsulta.Parameters.ParamByName('AP_MERCADORIA').Value    := Codigo_Item;
          FqryConsulta.Parameters.ParamByName('CD_NCM_SH').Value          := Ncm;
          FqryConsulta.Parameters.ParamByName('CD_EXPORTADOR').Value      := Fornecedor.Codigo;
          FqryConsulta.Parameters.ParamByName('CD_PAIS_ORIGEM').Value     := Pais_Proced.Codigo;
          FqryConsulta.Parameters.ParamByName('CD_FABRICANTE').Value      := Fabricante.Codigo;
          FqryConsulta.Parameters.ParamByName('CD_AREA').Value            := _AREA;
          if Descricao.Count > 0 then
            FqryConsulta.Parameters.ParamByName('NM_MERC_RESUMIDA').Value := LeftStr(Descricao[0], 60)
          else
            FqryConsulta.Parameters.ParamByName('NM_MERC_RESUMIDA').Value := '';
          FqryConsulta.Parameters.ParamByName('CD_USUARIO_CRIACAO').Value := FCodUsuario;
          FqryConsulta.ExecSQL;
        end;
      end;
end;

function TIntegraPlan.ConsultaSQLPlanilha(ASQL: String): String;
begin
  if FqryConsulta.Active then
    FqryConsulta.Close;
  FqryConsulta.SQL.Text := ASQL;
  FqryConsulta.Open;
  Result := Trim(FqryConsulta.Fields[0].AsString);
  FqryConsulta.Close;
end;

procedure TIntegraPlan.AjustaDePara;
type
  TDeParaLista = record
    Tabela: Integer;
    DePara: TDePara;
  end;

var
  P, I, I2: Integer;
  S, S2: String;
  DeParas: array of TDeParaLista;

  function DeParaIndice(ATabela: Integer; ATexto: String): Integer;
  begin
    Result := 0;
    ATexto := LeftStr(ATexto, _TAMANHO_DE_PARA);
    while (Result <= High(DeParas)) and not
       ((DeParas[Result].Tabela = ATabela) and SameText(LeftStr(DeParas[Result].DePara.Texto, _TAMANHO_DE_PARA), ATexto)) do
      Inc(Result);
    if (Result > High(DeParas)) then
      Result := -1;
  end;

  procedure AddDePara(ATabela: Integer; ATexto, ACodigo: String);
  var
    I: Integer;
  begin
    I := DeParaIndice(ATabela, ATexto);
    if I < 0 then
    begin
      SetLength(DeParas, High(DeParas) + 2);
      DeParas[High(DeParas)].Tabela        := ATabela;
      DeParas[High(DeParas)].DePara.Codigo := ACodigo;
      DeParas[High(DeParas)].DePara.Texto  := ATexto;
    end
    else
    begin
      if (DeParas[High(DeParas)].DePara.Codigo = '') and (ACodigo <> '') then
        DeParas[High(DeParas)].DePara.Codigo := ACodigo;
    end;
  end;

  function ValorDePara(ATabela: Integer; ATexto: String): String;
  var
    I: Integer;
  begin
    I := 0;
    ATexto := LeftStr(ATexto, _TAMANHO_DE_PARA);
    while (I <= High(DeParas)) and
       not ((DeParas[I].Tabela = ATabela) and SameText(LeftStr(DeParas[I].DePara.Texto, _TAMANHO_DE_PARA), ATexto)) do
      Inc(I);
    if (I > High(DeParas)) then
    begin
      AddDePara(ATabela, ATexto, ConsultaDePara(ATabela, ATexto));
      Result := DeParas[High(DeParas)].DePara.Codigo;
    end
    else
      Result := DeParas[I].DePara.Codigo;
  end;
begin
  FCapa.Analista.Codigo              := ValorDePara(_TABELA_ANALISTA, FCapa.Analista.Texto);
  FCapa.Moeda.Codigo                 := ValorDePara(_TABELA_MOEDA, FCapa.Moeda.Texto);
  FCapa.Local_Embarque.Codigo        := ValorDePara(_TABELA_LOCAL_EMBARQUE, FCapa.Local_Embarque.Texto);
  FCapa.Local_Desemb.Codigo          := ValorDePara(_TABELA_LOCAL_DESEMBARQUE, FCapa.Local_Desemb.Texto);
  FCapa.Pais_Proced.Codigo           := ValorDePara(_TABELA_PAIS, FCapa.Pais_Proced.Texto);
  FCapa.Navio.Codigo                 := ValorDePara(_TABELA_EMBARCACAO, FCapa.Navio.Texto);
  FCapa.Frete.Moeda.Codigo           := ValorDePara(_TABELA_MOEDA, FCapa.Frete.Moeda.Texto);
  FCapa.Seguro.Moeda.Codigo          := ValorDePara(_TABELA_MOEDA, FCapa.Seguro.Moeda.Texto);
  FCapa.Fornecedor.Codigo            := ValorDePara(_TABELA_FORNECEDOR, FCapa.Fornecedor.Texto);
  FCapa.Agente_Transporte.Codigo     := ValorDePara(_TABELA_AGENTE_CARGA, FCapa.Agente_Transporte.Texto);
  if SameText(FCapa.Tipo_Frete.Texto, 'Collect') then
    FCapa.Tipo_Frete.Codigo          := '0'
  else
    FCapa.Tipo_Frete.Codigo          := '1';
  if SameText(FCapa.Vinculacao.Texto, 'Sem Vinculação') then
    FCapa.Vinculacao.Codigo   := '1'
  else if SameText(FCapa.Vinculacao.Texto, 'Com Vinculação, sem influência no preço') then
    FCapa.Vinculacao.Codigo   := '2'
  else
    FCapa.Vinculacao.Codigo   := '3';
  FCapa.Via_Transporte.Codigo := ValorDePara(_TABELA_VIA_TRANSPORTE, FCapa.Via_Transporte.Texto);
  for P := 0 to High(FCapa.Pedidos) do
    for I := 0 to High(FCapa.Pedidos[P].Itens) do
    begin
      FCapa.Pedidos[P].Itens[I].Regime_Trib.Codigo := ValorDePara(_TABELA_REGIME_TRIBUTARIO, FCapa.Pedidos[P].Itens[I].Regime_Trib.Texto);
      FCapa.Pedidos[P].Itens[I].Fabricante.Codigo := ValorDePara(_TABELA_FABRICANTE, FCapa.Pedidos[P].Itens[I].Fabricante.Texto);
    end;
  for I := 0 to High(FCapa.Faturas) do
  begin
    I2 := 0;
    while (I2 < I) and not SameText(FCapa.Faturas[I].Condicao.Texto, FCapa.Faturas[I2].Condicao.Texto) do
      Inc(I2);
    if I2 < I then
    begin
      FCapa.Faturas[I].Condicao.Dias   := FCapa.Faturas[I2].Condicao.Dias;
      FCapa.Faturas[I].Condicao.Codigo := FCapa.Faturas[I2].Condicao.Codigo;
    end
    else
    begin
      S := Trim(FCapa.Faturas[I].Condicao.Texto);
      FCapa.Faturas[I].Condicao.Dias := 0;
      if (S <> '') and (S[1] in ['0','1','2','3','4','5','6','7','8','9']) then
      begin
        S2 := '';
        while (S <> '') and (S[1] in ['0','1','2','3','4','5','6','7','8','9']) do
        begin
          S2 := S2 + S[1];
          Delete(S, 1, 1);
        end;
        FCapa.Faturas[I].Condicao.Dias := StrToInt(S2);
        S := Trim(S);
      end;
      FCapa.Faturas[I].Condicao.Codigo := ConsultaDePara(_TABELA_CONDICAO_PAGAMEMTO, S);
    end;
  end;
end;

function TIntegraPlan.ConsultaDePara(ATabela: Integer; AValor: String): String;
begin
  AValor := StringReplace(LeftStr(Trim(AValor), _TAMANHO_DE_PARA), '''', '''''', [rfReplaceAll]);
  Result := Trim(ConsultaSQLPlanilha(Format(' SELECT CD_DDBROKER ' +
                                    ' FROM TDE_PARA (NOLOCK) ' +
                                    ' WHERE CD_UNID_NEG = ''07'' ' +
                                    '   AND CD_PRODUTO  = ''06'' ' +
                                    '   AND CD_TABELA   = %d ' +
                                    '   AND CD_EXTERNO  = ''%s'' ', [ATabela, AValor])));
end;

function TIntegraPlan.ConsultaLookup(ATabela, ACampoRetorno, AFiltro: String): String;
var
  SQL: String;
begin
  SQL := 'SELECT ' + ACampoRetorno + ' FROM ' + ATabela + ' (NOLOCK) ';
  if AFiltro <> '' then
    SQL := SQL + ' WHERE ' + AFiltro;
  Result := ConsultaSQLPlanilha(SQL);
end;

procedure TIntegraPlan.ExecuteSQL(ASQL: String);
begin
  FcmdExec.CommandText := ASQL;
  FcmdExec.Execute;
end;

function TIntegraPlan.VerificaDeParas: Boolean;
var
  Msg: TStrings;
  P, I: Integer;
  procedure Verifica(ATipo: String; ADePara: TDePara);
  begin
    if (Trim(ADePara.Codigo) = '') and (ADePara.Texto <> '') and (Pos(ADePara.Texto, Msg.Text) < 1) then
      Msg.Add('Não encontrada referência para ' + ATipo + ' ''' + ADePara.Texto + '''');
  end;
begin
  Msg := TStringList.Create;
  try
    with FCapa do
    begin
      Verifica('Analista', Analista);
      Verifica('Moeda', Moeda);
      Verifica('Local de Embarque', Local_Embarque);
      Verifica('Local de Desembarque', Local_Desemb);
      Verifica('País de Procedência', Pais_Proced);
      //Verifica('Navio', Navio); // Não verificar Navio, pois vem nome incompleto na planilha.
      Verifica('Moeda do Frete', Frete.Moeda);
      Verifica('Moeda do Seguro', Seguro.Moeda);
      Verifica('Vinculação', Vinculacao);
      Verifica('Tipo do Frete', Tipo_Frete);
      Verifica('Via de Transporte', Via_Transporte);
      Verifica('Agente de Transporte', Agente_Transporte);
      Verifica('Fornecedor', Fornecedor);
      for P := 0 to High(Pedidos) do
        for I := 0 to High(Pedidos[P].Itens) do
          with Pedidos[P].Itens[I] do
          begin
            Verifica('Regime_Trib', Regime_Trib);
            Verifica('Fabricante', Fabricante);
          end;
    end;
    Result := True; //Msg.Count = 0;
    if Result then
    begin
      FMensagens.Add('');
      FMensagens.AddStrings(Msg);
      FMensagens.Add('');
    end;
  finally
    FreeAndNil(Msg);
  end;
end;

function TIntegraPlan.Get_IntegraPlanilhaWhirlpool(NmServer, TxArquivo,
  CdUsuario: OleVariant): OleVariant;
var
  vNmEmailAtendente, vNmEmailIntegracao: String;
  AssuntoEmail: String;
  Cliente: String;
  CorpoEmail: String;
  CargoUsuario: String;
begin
  FMensagens   := TStringList.Create;
  ErrosCroda   := TStringList.Create;
  FconBroker   := TADOConnection.Create(nil);
  FcmdExec     := TADOCommand.Create(nil);
  FqryConsulta := TADOQuery.Create(nil);

  FconBroker.ConnectionString := 'Provider=SQLOLEDB.1;Data Source=' + NmServer + ';Initial Catalog=BROKER;' +
     'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
  //FconBroker.ConnectionString := 'Provider=SQLOLEDB.1;Data Source=' + AServidor + ';Initial Catalog=BROKER_BKP;' +
  //   'User ID=MYINDAIAWEB;Password=myindaiaweb;Persist Security Info=True;';
  Fconbroker.Open;

  FcmdExec.Connection     := FconBroker;
  FqryConsulta.Connection := FconBroker;
  FCodUsuario             := CdUsuario;
  FServidor               := Servidor;
  FArquivo                := TxArquivo;

  try
    FServidor := Servidor;
    if SameText(ExtractFileExt(TxArquivo), '.txt') then
      Result := Get_IntegraPlanilhaSG(Servidor, TxArquivo, CdUsuario)
    else
      if  AnsiContainsText(TxArquivo, 'CRODA') then
        if IntegraPlanilhaCroda(TxArquivo, CdUsuario, '00500') then
          Result := FInstrucaoDesembaraco
        else
          Result := ''
      else if AnsiContainsText(TxArquivo, 'EQUUS') then
      begin
        if IntegraPlanilhaCroda(TxArquivo, CdUsuario, '03185') then
          Result := FInstrucaoDesembaraco
        else
          Result := ''
      end
      else
        if SameText(ExtractFileExt(TxArquivo), '.prn') then
          Result := Get_IntegraPlanilhaFesto(NmServer, TxArquivo, CdUsuario)
        else
          if LerPlanilha(TxArquivo) and Gravar then
            Result := FInstrucaoDesembaraco
          else
            Result := '';
  finally
    //{
    if (FMensagens.Count > 0) or (ErrosCroda.Count > 0) then
    begin
      if  (FMensagens.Count > 0) then
      begin
        vNmEmailAtendente := ConsultaSQLPlanilha('  SELECT RTRIM(U.NM_EMAIL) AS NM_EMAIL ' +
                                                 '    FROM TCLIENTE_HABILITACAO CH  (NOLOCK)        ' +
                                                 '   INNER JOIN TUSUARIO        U   (NOLOCK) ON U.CD_USUARIO = CH.CD_ATENDENTE ' +
                                                 '   WHERE CD_PRODUTO = ''01'' ' +
                                                 '     AND CD_CLIENTE = ''' + FCliente + '''');

        vNmEmailIntegracao := ConsultaSQLPlanilha(' SELECT RTRIM(NM_EMAIL) AS NM_EMAIL ' +
                                                  '   FROM TUSUARIO (NOLOCK) ' +
                                                  '  WHERE CD_USUARIO = ''' + CdUsuario + '''');


        AssuntoEmail := '[MyIndaiaMail] Cadastro: Referências da ' + FInstrucaoDesembaraco;
        Cliente := ConsultaLookup('TEMPRESA_NAC', 'NM_EMPRESA', 'CD_EMPRESA = ''' + FCliente + '''');
        AssuntoEmail := AssuntoEmail + ' / Cliente: ' + Cliente;
        if FCapa.Via_Transporte.Texto <> '' then
          AssuntoEmail := AssuntoEmail + ' / Modal: ' + FCapa.Via_Transporte.Texto;

        CorpoEmail := '<html>' +
                      '<body>' +
                      '    A planilha foi integrada com sucesso, porém alguns dados ficaram sem valor por falta de referência. ' +
                      'Esta informação que faltou foi enviada ao nosso setor para que sejam cadastradas, de modo que as próximas integrações ' +
                      'sejam executadas com mais eficiência, melhorando ainda mais o seu processo. Provavelmente precisaremos de algumas informações ' +
                      'para completar esse cadastro, contamos com você! ' +
                      '    <br><br>' +
                      StringReplace(FMensagens.Text, #13#10, '<br>',[rfReplaceAll]);
        CorpoEmail := CorpoEmail + '</body></html>';

        //NÃO ENVIAR EMAIL DE ERRO QUANDO FOR CLIENTE - guilherme 31/10/2011
        CargoUsuario := ConsultaSQLPlanilha(' SELECT CD_CARGO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = ''' + FCodUsuario + ''' ');

        if FqryConsulta.Active then
          FqryConsulta.Close;
        FqryConsulta.SQL.Clear;
        FqryConsulta.SQL.Add('SELECT * FROM VW_CONFIG_MAIL');
        FqryConsulta.Open;

        if CargoUsuario <> '040' then
          EnviaEmail(FqryConsulta.FieldByName('NM_HOST').AsString,
                     FqryConsulta.FieldByName('NM_LOGIN').AsString,
                     FqryConsulta.FieldByName('NM_SENHA').AsString,
                     FqryConsulta.FieldByName('NR_PORTA').AsInteger,
                     AssuntoEmail,
                     CorpoEmail,
                     'ti@myindaia.com.br;whirlpool.imp@myindaia.com.br;' + vNmEmailAtendente + ';' + vNmEmailIntegracao,
                     'ti@myindaia.com.br',
                     []);
      end
      else
      begin
        vNmEmailIntegracao := ConsultaSQLPlanilha(' SELECT RTRIM(NM_EMAIL) AS NM_EMAIL ' +
                                                  '   FROM TUSUARIO (NOLOCK) ' +
                                                  '  WHERE CD_USUARIO = ''' + CdUsuario + '''');


        AssuntoEmail := '[MyIndaiaMail] Cadastro: Referências da ' + FInstrucaoDesembaraco;
        Cliente := ConsultaLookup('TEMPRESA_NAC', 'NM_EMPRESA', 'CD_EMPRESA = ''00500''');
        AssuntoEmail := AssuntoEmail + ' / Cliente: ' + Cliente;

        CorpoEmail := '<html>' +
                      '<body>' +
                       StringReplace(ErrosCroda.Text, #13#10, '<br>',[rfReplaceAll]);
        CorpoEmail := CorpoEmail + '</body></html>';

        if FqryConsulta.Active then
          FqryConsulta.Close;
        FqryConsulta.SQL.Clear;
        FqryConsulta.SQL.Add('SELECT *');
        FqryConsulta.SQL.Add('FROM VW_CONFIG_MAIL');
        FqryConsulta.Open;

        EnviaEmail(FqryConsulta.FieldByName('NM_HOST').AsString,
                   FqryConsulta.FieldByName('NM_LOGIN').AsString,
                   FqryConsulta.FieldByName('NM_SENHA').AsString,
                   FqryConsulta.FieldByName('NR_PORTA').AsInteger,
                   AssuntoEmail,
                   CorpoEmail,
                   'ti@myindaia.com.br;' +
                   vNmEmailIntegracao,
                   'ti@myindaia.com.br',[]);
      end;
    end;
    //Response.Write(StringReplace(FMensagens.Text, #13#10, '<br>', [rfReplaceAll]));
    //}ShowMessage('Mensagens: '#13 + FMensagens.Text);
    FreeAndNil(FconBroker);
    FreeAndNil(FcmdExec);
    FreeAndNil(FqryConsulta);
  end;
end;

function TIntegraPlan.Get_IntegraPlanilhaSG(NmServer, TxArquivo,
  CdUsuario: OleVariant): OleVariant;
begin
   Result := LerArquivoSG(Servidor, TxArquivo, CdUsuario);
end;

function TIntegraPlan.Get_IntegraPlanilhaFesto(NmServer, TxArquivo,
  CdUsuario: OleVariant): OleVariant;
begin
   Result := LerArquivoFesto(NmServer, TxArquivo, CdUsuario);
end;

function TIntegraPlan.Get_EnviaEmailAnexo(TxDe, TxPara, TxCopia, TxAssunto,
  TxAnexo: OleVariant): OleVariant;
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  I: Integer;
  P: Integer;
  S, U: string;
  UserName: array[0..MAX_PATH] of Char; Size: Cardinal;
  str_anexo: string;
  NewText   : TIdText;
  conMyIndaia : TADOConnection;
  cmdMyIndaia : TADOCommand;
  qryAux : TADOQuery;
begin
  Log('Método EnviarEmailAnexo invocado');
  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);

  conMyIndaia := TADOConnection.Create(nil);
  cmdMyIndaia := TADOCommand.Create(nil);
  qryAux      := TADOQuery.Create(nil);

  with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source='+Servidor+';Initial Catalog=BROKER;' +
        'User ID=SA;Password=123;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    //cria objeto de comando(para utilizar updates e inserts
    with cmdMyIndaia do begin
      CommandTimeout := 200;
      CommandType := cmdText;
      Connection := conMyIndaia;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryAux do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

  try
    with qryAux do begin
    SQL.Add('SELECT *');
    SQL.Add('FROM VW_CONFIG_MAIL');
    Open;
    SMTP.Host     := qryAux.FieldByName('NM_HOST').AsString;
    SMTP.Port     := qryAux.FieldByName('NR_PORTA').AsInteger;
    SMTP.Username := qryAux.FieldByName('NM_LOGIN').AsString;
    SMTP.Password := qryAux.FieldByName('NM_SENHA').AsString;
    SMTP.AuthenticationType := atLogin;
    Close;
    end;

    Size := MAX_PATH; Windows.GetUserName(@UserName,Size);
    U := AnsiLowerCase(StrPas(UserName));


    Msg.ContentType := 'text/html' ;
    Msg.Body.Text := U;

    str_anexo := TxAnexo;
    while str_anexo <> '' do
    begin
      P := Pos(';', str_anexo);
      if P = 0 then
        P := Length(str_anexo) + 1;
      S := Trim(Copy(str_anexo, 1, P - 1));
      Delete(str_anexo, 1, P);
      if S <> '' then
        TIdAttachment.Create(Msg.MessageParts, S);
    end;
    
    if TxDe = '' then
      TxDe := SMTP.Username;
    Msg.From.Text := TxDe;
    Msg.ReplyTo.EMailAddresses := TxPara;
    Msg.Recipients.EMailAddresses := TxPara;
    Msg.Subject := TxAssunto;

    try
      SMTP.Connect;
      SMTP.Send(Msg);
      Result := 1;
    except
      on E:Exception do
      begin
        //Get_EnviaEmailAnexo('guilherme.devezas@myindaia.com.br','guilherme.devezas@myindaia.com.br','',e.Message,'');
        Get_EnviaEmailAnexo('ti@myindaia.com.br','marcio.myindaia@gmail.com','',e.Message,'');
        Result := 0;
      end;
    end;
  finally
    FreeAndNil(Msg);
    if SMTP.Connected then
      SMTP.Disconnect;
    FreeAndNil(SMTP);
  end;
end;

{
constructor TIntegraPlan.Create;
begin
//initialization
//  TAutoObjectFactory.Create(ComServer, TIntegraPlan, Class_IntegraPlan,
//    ciMultiInstance, tmApartment);

  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  ShortDateFormat   := 'dd/mm/yyyy';
end;
}



function TIntegraPlan.Get_Echo(Msg: OleVariant): OleVariant;
begin
  Log('Método Echo invocado');
  Result := Msg;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TIntegraPlan, Class_IntegraPlan,
    ciMultiInstance, tmApartment);

  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  ShortDateFormat   := 'dd/mm/yyyy';
end.


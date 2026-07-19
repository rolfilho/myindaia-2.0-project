unit Unit2;

interface

uses
  ComObj, ActiveX, AspTlb, StdVcl, Classes, SysUtils, DB, ADODB,
  ExcelXP, Variants, ComServ, uFuncoes, Dialogs, StrUtils;

function Get_RemessaXls(NrRap, NmServer, TxArquivo: OleVariant): Integer;

implementation

uses Math;

function Get_RemessaXls(NrRap, NmServer, TxArquivo: OleVariant): Integer;
var
  vNrPedido, vNrItem, vNrCentro, vNrDocFat, vNrCliente, vNmCliente, vNrMaterial, vNmDenominacao, vNmSgPais, vNmDenPais, vNrUrf, vNmUrf, vNmDestino : string;
  vVlPesoLiq, vVlPesoBru, vNrUnidMed, vNmIncoterm, vVlMoedaDoc, vNmMoeda, vNmCondPgto, vNmDenCondPgto, vNrMeioTransp, vNmMeioTransp : string;
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
                     '       CD_MERCADORIA = ''' + vNrMaterial + ''' ';
      Parameters.ParamByName('DESC').Value := vMemoCj.Text;
      Execute;
     end;
     conMyIndaia.CommitTrans;
  end;

begin
  vExcelApp := TExcelApplication.Create(nil);
  vExcelWB  := TExcelWorkbook.Create(nil);
  vExcelWS  := TExcelWorksheet.Create(nil);

  vExcelApp.Workbooks.Open(TxArquivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0);
  vExcelWB.ConnectTo(vExcelApp.ActiveWorkbook);
  vExcelWS.ConnectTo(vExcelWB.Sheets.Item[1] as ExcelWorksheet);
  result := 0;
  cont_update := 0;
  conMyIndaia := TADOConnection.Create(nil);
  cmdExecProc := TADOCommand.Create(nil);
  cmdExecUpdate := TADOCommand.Create(nil);
  qryFornecimento := TADOQuery.Create(nil);
  //vMemoCj := TMemo.Create(nil);
  //lança arquivio no textFile

  vListAux := TStringList.Create;
//  vListAux.Add('VITOR2');
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
      SQL.Add('SELECT NR_FORNECIMENTO FROM TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = :NR_RAP');
      Parameters.ParamByName('NR_RAP').Value := NrRap;
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
        I := 7;
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
              SQL.Add('DELETE TRAP_FORNECIMENTO WHERE CD_RAP+CD_RAP_ANO = :NR_RAP');
              SQL.Add('  AND CD_FORNECIMENTO IN ('''+StringReplace(vSimFornec,'|',''',''',[rfReplaceAll])+''')');
              Parameters.ParamByName('NR_RAP').Value := NrRap;
              num := ExecSQL;
            end;
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
            I := 7;
            while vExcelWS.Range['B' + IntToStr(I), 'B' + IntToStr(I)].Text <> '' do
            begin
              //insere o conjunto
              vNrPedido := vExcelWS.Range['B'+ IntToStr(I), 'B'+ IntToStr(I)].Text;
              //verifica se na celula existe um número de fornecimento
              if Pos(vNrPedido, vSimFornec) > 0 then begin
                vListAux.Add('<p>Integração fornecimento: <b>'+vNrPedido+'</b>');
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

                //verifica se aconteceu algum erro durante a leitura das variaveis
                erros := 0;
                if vNrMaterial = '' then begin
                  vListAux.Add('<br> - sem código da mercadoria;');
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
                if erros > 0 then
                  vListAux.Add('<br> *Erros encontrados no fornecimento: <b>'+vNrPedido+'</b>. Fornecimento não integrado.')
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
                        '     NR_URF = :NR_URF, ' +
                        '     CD_LOCAL_DESTINO = :CD_LOCAL_DESTINO, ' +
                        '     CD_INCOTERM = :CD_INCOTERM, ' +
                        '     CD_MOEDA_MLE = :CD_MOEDA_MLE, ' +
                        '     CD_TERMO_PAGTO = :CD_TERMO_PAGTO, '+
                        '     CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE, '+
                        '     CD_EMBARCACAO = :CD_EMBARCACAO, ' +
                        '     CD_AGENTE_COMISSAO = :CD_AGENTE_COMISSAO, ' +
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
                        ' WHERE CD_RAP+CD_RAP_ANO = :NR_RAP';

                        vNmMoeda      := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ vNmMoeda +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''25''', 'CD_DDBROKER');
                        vNrCliente    := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ vNrCliente +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''26''', 'CD_DDBROKER');
                        vNmSgPais     := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ vNmSgPais +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''27''', 'CD_DDBROKER');
                        vNmCondPgto   := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ vNmCondPgto +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''28''', 'CD_DDBROKER');
                        vNrMeioTransp := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ vNrMeioTransp +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''29''', 'CD_DDBROKER');
                        vNrAgencia    := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ vNrAgencia +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''30''', 'CD_DDBROKER');
                        vNrTransp     := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ vNrTransp +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''31''', 'CD_DDBROKER');
                        vNmNavio      := ConsultaSQL('INDAIA07','BROKER', ' SELECT CD_DDBROKER FROM TDE_PARA WHERE CD_EXTERNO = '''+ Copy(vNmNavio,1,15) +''' AND CD_GRUPO IN (''241'') AND CD_TABELA=''32''', 'CD_DDBROKER');

                        if Pos('X', vVlFumigacao) > 0  then
                           vVlFumigacao := '1'
                        else
                           vVlFumigacao := '0';

                        if Pos('X', vVlEmbarque) > 0 then
                          vVlEmbarque := '1'
                        else
                          vVlEmbarque := '0';

                        Parameters.ParamByName('NR_RAP').Value             := trim(NrRap);
                        Parameters.ParamByName('CD_RAP').Value             := Copy(NrRap,1,6);
                        Parameters.ParamByName('CD_RAP_ANO').Value         := Copy(NrRap,7,2);
                        Parameters.ParamByName('NR_CENTRO').Value          := trim(vNrCentro);
                        Parameters.ParamByName('CD_CLIENTE').Value         := trim(vNrCliente);
                        Parameters.ParamByName('CD_PAIS').Value            := trim(vNmSgPais);
                        Parameters.ParamByName('NR_URF').Value             := trim(vNrUrf);
                        Parameters.ParamByName('CD_LOCAL_DESTINO').Value   := trim(vNmSgPais);
                        Parameters.ParamByName('CD_INCOTERM').Value        := trim(vNmIncoterm);
                        Parameters.ParamByName('CD_MOEDA_MLE').Value       := trim(vNmMoeda);
                        Parameters.ParamByName('CD_TERMO_PAGTO').Value     := trim(vNmCondPgto);
                        Parameters.ParamByName('CD_VIA_TRANSPORTE').Value  := trim(vNrMeioTransp);
                        Parameters.ParamByName('CD_EMBARCACAO').Value      := trim(vNmNavio);
                        Parameters.ParamByName('CD_AGENTE_COMISSAO').Value := trim(vNrAgencia);
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

                      CommandText := 'INSERT INTO TRAP_FORNECIMENTO ( CD_RAP, CD_RAP_ANO, CD_FORNECIMENTO, CD_ITEM, NR_DOC_FATURAMENTO, ' +
                      '  CD_MERCADORIA, TX_DESC, VL_PESO_LIQ_UN, VL_PESO_BRUTO_UN, TX_UNID_MEDIDA_PESO, VL_PRECO_UNIT, ' +
                      '  QT_QTDE, QT_CAIXAS, NR_CONTAINER) ' +
                      '  VALUES ( :CD_RAP, :CD_RAP_ANO, :CD_FORNECIMENTO, :CD_ITEM, :NR_DOC_FATURAMENTO, ' +
                      '  :CD_MERCADORIA, :TX_DESC, :VL_PESO_LIQ_UN, :VL_PESO_BRUTO_UN, :TX_UNID_MEDIDA_PESO, :VL_PRECO_UNIT, ' +
                      '  :QT_QTDE, :QT_CAIXAS, :NR_CONTAINER )';
                      Parameters.ParamByName('CD_RAP').Value              := Copy(NrRap,1,6);
                      Parameters.ParamByName('CD_RAP_ANO').Value          := Copy(NrRap,7,2);
                      Parameters.ParamByName('CD_FORNECIMENTO').Value     := vNrPedido;
                      Parameters.ParamByName('CD_ITEM').Value             := vNrItem;
                      Parameters.ParamByName('NR_DOC_FATURAMENTO').Value  := vNrDocFat;
                      Parameters.ParamByName('CD_MERCADORIA').Value       := vNrMaterial;
                      Parameters.ParamByName('TX_DESC').Value             := vNmDenominacao;
                      Parameters.ParamByName('TX_UNID_MEDIDA_PESO').Value := vNrUnidMed;
                      Parameters.ParamByName('NR_CONTAINER').Value        := StringReplace(StringReplace(vNmIdContainer,'.','',[rfReplaceAll]),'-','',[rfReplaceAll]);

                      if TryStrToFloat(StringReplace(vVlPesoLiq,'.','',[rfReplaceAll]), Float) then
                        Parameters.ParamByName('VL_PESO_LIQ_UN').Value := Float
                      else
                        Parameters.ParamByName('VL_PESO_LIQ_UN').Value := Null;

                      if TryStrToFloat(StringReplace(vVlPesoBru,'.','',[rfReplaceAll]), Float) then
                        Parameters.ParamByName('VL_PESO_BRUTO_UN').Value     := Float
                      else
                        Parameters.ParamByName('VL_PESO_BRUTO_UN').Value  := Null;

                      if TryStrToFloat(StringReplace(vVlMoedaDoc,'.','',[rfReplaceAll]), Float) then
                        Parameters.ParamByName('VL_PRECO_UNIT').Value := Float
                      else
                        Parameters.ParamByName('VL_PRECO_UNIT').Value := Null;

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
                      vListAux.Add('Erro ao executar a integração do fornecimento '+vNrPedido+', mercadoria '+vNrMaterial+'!'+#10#13+'<'+e.message+'>'+#10#13+cSUPORTE);
                      if conMyIndaia.InTransaction then
                        conMyIndaia.RollbackTrans;
                      cont := cont - 1;
                      vInseriu := 0;
                    end;
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
                SQL.Add('WHERE CD_RAP+CD_RAP_ANO = :NR_RAP GROUP BY CD_FORNECIMENTO');
                Parameters.ParamByName('NR_RAP').Value := NrRap;
                Open;

                if RecordCount = ContaOcorrencias(vNrTodosPedidos,';')+1 then begin
                  //se já estiverem integrados, executa procedure de verificação
                  with cmdExecProc do begin
                    Parameters.Clear;
                    CommandText := 'sp_rap_verifica_fornec';
                    Parameters.Refresh;
                    Parameters.ParamByName('@nrRap').Value := NrRap;
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
                    CommandText := 'UPDATE TRAP SET IN_FORN_VALIDA = 0, TX_VALIDACAO = :TX_VALIDACAO WHERE CD_RAP+CD_RAP_ANO = :NR_RAP';
                    Parameters.ParamByName('NR_RAP').Value := NrRap;
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
        //fecha o arquivo
      except
        result := 1;
      end;
    end;
  finally
    //if vListAux.Text <> '' then Response.Write(vListAux.Text);
    if vListAux.Text <> '' then ShowMessage(vListAux.Text);
    //finaliza todos os objetos
    qryFornecimento.Free;
    cmdExecUpdate.Free;
    cmdExecProc.Free;
    conMyIndaia.Free;
    vListAux.Free;
  end;
end;

end.

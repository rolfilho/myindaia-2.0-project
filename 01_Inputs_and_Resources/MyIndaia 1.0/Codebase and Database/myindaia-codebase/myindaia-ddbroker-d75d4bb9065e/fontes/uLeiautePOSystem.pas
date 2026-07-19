unit uLeiautePOSystem;

interface

uses Classes, KrQuery, Dialogs;

type
  TLeiautePoSystem = class
  private
    FNomeArquivo: string;
    FHandle: Integer;
    Query: TLocalQuery;
    function GetSQLSelectNotas: string;
    function CalculaValorBaseIPI: Double;
    function CalculaValorItem: Double;
    function DeclaracaoImpotacao: string;
    function PartNumber: string;
    function SituacaoTributaria: string;
    function CalculaValorICMS: Double;
    function CalculaValorBaseICMS: Double;
    function ValorUnitario: Double;
    function AliquotaII: Double;
    function Requeridos: string;
    function RequeridosItens: string;

    function NumCliente: string;
  public
    constructor Create(const NomeArquivo: string; Handle: Integer);
    procedure GerarArquivo;
  end;

implementation

uses Funcoes, KrHandle, KrFormat, KrUtil, MaskUtils, SysUtils;

{ TLeiautePoSystem }

constructor TLeiautePoSystem.Create(const NomeArquivo: string; Handle: Integer);
begin
  FNomeArquivo := NomeArquivo;
  FHandle := Handle;
end;

function TLeiautePoSystem.CalculaValorItem: Double;
begin
  Result := Query.FieldByName('VL_UNITARIO_FOB').AsFloat;
end;

function TLeiautePoSystem.CalculaValorBaseIPI: Double;
begin
  Result := Query.FieldByName('VL_BASE_CALC_II').AsFloat + Query.FieldByName('VL_II_ITEM').AsFloat
end;

function TLeiautePoSystem.DeclaracaoImpotacao: string;
begin
  Result := FormatMaskText('99/9999999-9;0', Query.FieldByName('NR_DECLARACAO_IMP').AsString);
end;

function TLeiautePoSystem.PartNumber: string;
var
  Aux: string;
  P: Integer;
begin
  Aux := Query.FieldByName('CD_MERCADORIA').AsString;
  P := Pos('-', Aux);
  Result := Copy(Aux, P+1, Length(Aux)-P);
end;

function TLeiautePoSystem.SituacaoTributaria: string;
begin
  if Query.FieldByName('CD_CLIENTE').AsString = '03278' then
    Result := '151'
  else
    Result := '190';
end;

function TLeiautePoSystem.CalculaValorICMS: Double;
begin
  Result := Query.FieldByName('VL_ICMS_DEVIDO_AFRMM').AsFloat - Query.FieldByName('VL_ICMS_A_RECOLHER_AFRMM').AsFloat
end;

function TLeiautePoSystem.CalculaValorBaseICMS: Double;
var
  Soma: Double;
begin
  if (Query.FieldByName('CD_CLIENTE').AsString = '03278') and (Query.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7') then
  begin
    Result := 0;
  end
  else
  begin
    Soma := ((Query.FieldByName('VL_BASE_CALC_II').AsFloat+
               Query.FieldByName('VL_II_ITEM').AsFloat+
               Query.FieldByName('VL_IPI_ITEM').AsFloat+
               Query.FieldByName('VL_PIS_ITEM').AsFloat+
               Query.FieldByName('VL_COFINS_ITEM').AsFloat+
               Query.FieldByName('VL_TX_SCX_ITEM').AsFloat+
               Query.FieldByName('VL_AFRMM_ITEM').AsFloat)/
               ((100-Query.FieldByName('PC_ICMS').AsFloat)/100));
    Result := Soma - (Soma * (Query.FieldByName('PC_REDUCAO_ICMS').AsFloat/100));
  end;
end;

function TLeiautePoSystem.ValorUnitario: Double;
begin
  Result := (Query.FieldByName('VL_ACRESCIMO_ITEM').AsFloat / Query.FieldByName('QT_MERC_UN_COMERC').AsFloat) +
    Query.FieldByName('VL_UNITARIO').AsFloat;
end;

function TLeiautePoSystem.AliquotaII: Double;
begin
  if (Query.FieldByName('CD_ACORDO_ALADI').IsNull) or (Trim(Query.FieldByName('CD_ACORDO_ALADI').AsString) = '') then
    Result := Query.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat
  else
    Result := Query.FieldByName('PC_ALIQ_ACOR_TARIF').AsFloat;
end;

function TLeiautePoSystem.NumCliente: string;
begin
  if not Query.FieldByName('NR_CLIENTE_F').IsNull then
    Result := FormataNumero(Query.FieldByName('NR_CLIENTE_F').AsInteger, 8)
  else
    Result := FormataNumero(Query.FieldByName('NR_CLIENTE_E').AsInteger, 8);
end;

procedure TLeiautePoSystem.GerarArquivo;
var
  NR_Processo: string;
  NR_Adicao: string;
  NR_NOTA: Integer;
  Header: string;
  Linha: string;
  Itens: TStrings;
  Lista: TStrings;
  ValorICMS: Double;
  Msg: string;
  Codigo1: string;
  Codigo2: integer;

  function tiraTraco(value: string): string;
  begin
    Result := StringReplace(value, '-', ' ', []);
    Result := Trim(Result);
    Result := PadL(Result, 5, ' ');
  end;
begin
  Itens := TStringList.Create;
  try
    Lista := TStringList.Create;
    try
      Query := AutoQuery.Query(GetSQLSelectNotas);
      Query.ParamByName('HANDLE').AsInteger := FHandle;
      Query.Open;
      NR_Adicao := '';

      if Query.FieldByName('CD_CLIENTE').AsString = '03278' then
      begin
        Codigo1 := 'RECE2';
        Codigo2 := 2000201;
      end
      else
      begin
        Codigo1 := 'RECE5';
        Codigo2 := 2000002;
      end;

      while not Query.Eof do
      begin
        ValorICMS := 0;
        Msg := Requeridos;
        NR_Processo := Query.FieldByName('NR_PROCESSO').AsString;
        NR_NOTA := Query.FieldByName('NR_NOTA').AsInteger;
        Header :={01}'1'+
                 {02}FormataAlfaNumerico(Query.FieldByName('NR_PROC_PO').AsString, 30)+
                 {03}FormataValor(Query.FieldByName('TX_MLE').AsFloat, 18, ',0.0000')+
                 {04}FormataValor(Query.FieldByName('VL_TRIBUTO_PAGO').AsFloat, 18, ',0.00')+
                 {05}FormataValor(Query.FieldByName('PB_CARGA').AsFloat, 18, ',0.00')+
                 {06}FormataValor(Query.FieldByName('PL_CARGA').AsFloat, 18, ',0.00')+
                 {07}FormataAlfaNumerico(DeclaracaoImpotacao, 30)+
                 {08}FormataNumero(Trunc(Query.FieldByName('QT_VOLUME_CARGA').AsFloat), 18)+
                 {09}FormataAlfaNumerico(FormataNumero(Query.FieldByName('NR_NOTA').AsString, 6), 20)+
                 {10}FormataData(Query.FieldByName('DT_NOTA').AsDateTime)+
                 {11}FormataAlfaNumerico(Query.FieldByName('COD_INTERNO').AsString, 10)+
                 {12}FormataAlfaNumerico(Codigo1 , 5)+
                 {13}FormataNumero(Codigo2 , 18)+
                 {14}FormataAlfaNumerico(Query.FieldByName('SERIE').AsString, 20)+
                 {15}FormataNumero(Query.FieldByName('CD_CFOP').AsInteger, 4)+
                 {16}FormataData(ConverteData(Query.FieldByName('DT_REGISTRO_DI').AsString))+
                 {17}FormataAlfaNumerico(Query.FieldByName('LOCALDESEMB').AsString, 50)+
                 {18}FormataData(Query.FieldByName('DT_REALIZACAO').AsDateTime)+
                 {19}FormataAlfaNumerico(Query.FieldByName('END_UF').AsString, 2)+
                 {20}NumCliente;
        repeat
          if Query.FieldByName('VL_UNITARIO_FOB').IsNull or (Query.FieldByName('VL_UNITARIO_FOB').AsFloat <= 0) then
          begin
            ShowMessage('Valor Unitário FOB não informado para todos os itens.'+#13#10+
                                   'Favor ajustar antes de prosseguir.');
            Abort;
          end;
          Msg := Msg + RequeridosItens;
          Linha := {01}'2'+
                   {02}FormataAlfaNumerico(Query.FieldByName('NR_PROC_PO').AsString, 30)+
                   {03}FormataAlfaNumerico(tiraTraco(Copy(Query.FieldByName('CD_MERCADORIA').AsString, 1, 5)), 6)+
                   {04}FormataNumero(Trunc(Query.FieldByName('QT_MERC_UN_COMERC').AsFloat), 18)+
                   {05}FormataValor(ValorUnitario, 18, ',0.0000')+
                   {06}FormataValor(CalculaValorItem, 18, ',0.0000')+
                   {07}FormataValor(AliquotaII, 18, ',0.00')+
                   {08}FormataValor(Query.FieldByName('ALIQ_IPI').AsFloat, 18, ',0.00')+
                   {09}FormataValor(Query.FieldByName('ALIQ_PIS').AsFloat, 18, ',0.00')+
                   {10}FormataValor(Query.FieldByName('ALIQ_COFINS').AsFloat, 18, ',0.00')+
                   {11}FormataValor(Query.FieldByName('PC_ICMS').AsFloat, 18, ',0.00')+
                   {12}FormataValor(CalculaValorBaseIPI, 18, ',0.00')+
                   {13}FormataNumero(Query.FieldByName('NR_ITEM').AsInteger, 4)+
                   {14}FormataAlfaNumerico(Query.FieldByName('CD_NCM_SH').AsString, 10)+
                   {15}FormataAlfaNumerico(SituacaoTributaria, 5)+
                   {16}FormataValor(Query.FieldByName('VL_BASE_CALC_II').AsFloat, 18, ',0.00')+
                   {17}FormataValor(Query.FieldByName('VL_BASE_CALC_II').AsFloat, 18, ',0.00')+
                   {18}FormataValor(CalculaValorBaseICMS, 18, ',0.00')+
                   {19}FormataNumero(Query.FieldByName('NR_ADICAO').AsInteger, 3)+
                   {20}FormataNumero(Query.FieldByName('NR_ITEM').AsInteger, 2)+
                   {21}FormataAlfaNumerico(PartNumber, 20);
          Itens.Add(Linha);
          if NR_Adicao <> Query.FieldByName('NR_ADICAO').AsString then
          begin
            if (Query.FieldByName('CD_CLIENTE').AsString = '03278') and (Query.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7') then
              ValorICMS := 0
            else
              ValorICMS := ValorICMS + CalculaValorICMS;
          end;
          NR_Adicao := Query.FieldByName('NR_ADICAO').AsString;
          Query.Next;
        until Query.Eof or
              (NR_Processo <> Query.FieldByName('NR_PROCESSO').AsString) or
              (NR_NOTA <> Query.FieldByName('NR_NOTA').AsInteger);

        Header := Header + FormataValor(ValorICMS, 16, 2);
        Lista.Add(Header);
        Lista.AddStrings(Itens);
        Itens.Clear;
      end;
      if Msg <> '' then
      begin
        ShowMessage('Não foi possível gerar o arquivo.'+#13#10+'Motivos:'+Msg);
        Abort;
      end;
      Lista.SaveToFile(FNomeArquivo);
    finally
      Lista.Free;
    end;
  finally
    Itens.Free;
  end;
end;

function TLeiautePoSystem.GetSQLSelectNotas: string;
begin
  Result := 'SELECT '+
            '  DI.NR_PROCESSO, '+
            //PO_HEADER
            '  DM.NR_PROC_PO, '+                   //002 Referência do Cliente
            '  DI.TX_MLE, '+                     //003 Taxa do Dolar
            '  PT.VL_TRIBUTO_PAGO, '+              //004 Valor da Taxa Siscomex
            '  DI.PB_CARGA, '+                     //005 Valor do Peso Bruto Total do Processo
            '  DI.PL_CARGA, '+                     //006 Valor do Peso Líquido Total do Processo
            '  DI.NR_DECLARACAO_IMP, '+            //007 Número de Registro da DI
            '  EB.QT_VOLUME_CARGA, '+              //008 Quantidade de Volumes Total da tela de Transportes/Carga
            '  PNF.NR_NOTA, '+                     //009 Número da Nota Fiscal Emitida
            '  PNF.DT_NOTA, '+                     //010 Data da 1ª Nota Fiscal Emitida para o processo
            '  E.COD_INTERNO, '+                   //011 Referência a unidade operacional a partir do CNPJ do Importador. / Exemplo: se o CNPJ do importador tiver o sufixo xx.xxx.xxx/0001-xx, o valor a ser exportado é 1, se for, xx.xxx.xxx/0002-xx, o número a ser valor é 2.
                                                   //012 Fixo RECE5 - Utiliza DE Para do Grupo importador.
                                                   //013 Fixo: 2000002 - Utiliza DE Para do Grupo Exportador. Observações : É importante que as notas montadas tenham um exportador para que esse campo possa ser exportado.
            '  PNF.SERIE, '+                       //014 Nr de Série para Integrações (configurações modelo de Nr de serie da NF-E, porém não temos este campo no MyIndaia LOCAL. Criar na tabela TPROCESSO_NF
            '  PNF.CD_CFOP, '+                     //015 Código CFOP
            '  DI.DT_REGISTRO_DI, '+               //016 Data do Registro da DI
            '  TURF.DESCRICAO AS LOCALDESEMB, '+   //017 Local do Desembaraço
            '  FU.DT_REALIZACAO, '+                //018 Data do Desembaraço
            '  TURF.END_UF, '+                     //019 UF do Desembaraço - Sigla da UF do desembaraço
            '  EMP_EST_F.NR_CLIENTE AS NR_CLIENTE_F, '+//020 Código do Fabricante do primeiro item da DI Ver DE>PARA
            '  EMP_EST_E.NR_CLIENTE AS NR_CLIENTE_E, '+//020 Código do Fabricante do primeiro item da DI Ver DE>PARA
            '  AI.VL_ICMS_A_RECOLHER_AFRMM, '+     //021 - não constava no manual'
            '  AI.VL_ICMS_DEVIDO_AFRMM, '+
            //PO_ITENS
            //DM.NR_PROC_PO,                       //002 Referência do Cliente
            '  DM.CD_MERCADORIA, '+                //003 Código do produto - gerar com apenas 5 casas, a ultima posição gerar “ “
            '  DM.QT_MERC_UN_COMERC, '+            //004 Quantidade do Item
            '  DM.VL_UNITARIO, '+                  //005 Valor da Mercadoria Observações : Valor unitário enviado para o siscomex (adição – mercadoria – guia 2 – valor unitário)
            '  DM.VL_UNITARIO_FOB, '+
            '  DM.VL_ACRESCIMO_ITEM, '+
            '  DI.IN_EMBUT_FRT_ITENS, '+           //006 Valor da Mercadoria no Local de Embarque em Dólar(VMLE)
            '  DI.IN_EMBUT_SEG_ITENS, '+           //006 Verificar a frmular de cáculo definida na documentação
            '  DM.VL_MCV_ITEM_MN, '+               //006
            '  DM.VL_FRETE_ITEM_MN, '+             //006
            '  DM.VL_SEGURO_ITEM_MN, '+            //006
            '  TII.PC_ALIQ_NORM_ADVAL, '+          //007 Alíquota do II
            '  TII.PC_ALIQ_ACOR_TARIF, '+          //007 Alíquota do II
            '  AI.CD_ACORDO_ALADI, '+              //007 Alíquota do II
            '  TIPI.PC_ALIQ_NORM_ADVAL AS ALIQ_IPI, '+  //008 Alíquota do IPI
            '  AI.ALIQ_PIS, '+                     //009 Alíquota do PIS
            '  AI.ALIQ_COFINS, '+                  //010 Alíquota do COFINS
            '  AI.PC_ICMS, '+                      //011 Alíquota de ICMS
            '  DM.VL_BASE_CALC_II, '+              //012 Valor total da Base de Calculo do IPI em R$ do item da NF.
            '  DM.VL_II_ITEM, '+                   //012 DM.VL_BASE_CALC_II + DM.VL_II_ITEM
            '  DM.NR_ITEM, '+                      //013 Número de Sequência do Item na NF. Obs. Se houver mais de uma adição, usar o sequencial a partir da primeira.
            '  DM.CD_NCM_SH, '+                    //014 NF Class Fiscal - NCM
            '  AI.CD_TRIBUTACAO_ICMS, '+           //015 Situação Tributária do Item da NF.
            '  DM.VL_BASE_CALC_II, '+              //016 Valor da Base de Cálculo do PIS/COFINS
                                                   //017 DM.VL_BASE_CALC_II - Valor da Base de Cálculo do PIS/COFINS
            '  DM.VL_BASE_ICMS_ITEM, '+            //018 Valor da Base de Cálculo do ICMS
            '  DM.VL_IPI_ITEM, '+                  //018 Valor da Base de Cálculo do ICMS
            '  DM.VL_PIS_ITEM, '+                  //018 Valor da Base de Cálculo do ICMS
            '  DM.VL_COFINS_ITEM, '+               //018 Valor da Base de Cálculo do ICMS
            '  DM.VL_TX_SCX_ITEM, '+               //018 Valor da Base de Cálculo do ICMS
            '  DM.VL_AFRMM_ITEM, '+                //018 Valor da Base de Cálculo do ICMS
            '  AI.PC_REDUCAO_ICMS, '+              //018 Valor da Base de Cálculo do ICMS
            '  DM.NR_ADICAO, '+                     //019 Número da Adição
                                                   //020 DM.NR_ITEM - Sequencia do item na ADIÇÃO
                                                   //021 DM.CD_MERCADORIA - Part- Number do Produto - Vincular o texto à direita do hífen do cadastro do Produto DO DDGip Lite. Exemplo : Código do Produto (ITEMDI.STR_CODIGOPRODUTO) = T2069-9868 Vincular no campo a informação à direita do hífen: 9868
            '  P.CD_CLIENTE ' +                                                   
            'FROM TDECLARACAO_IMPORTACAO DI '+
            'INNER JOIN TPROCESSO_H H ON H.HANDLE = :HANDLE AND H.NR_PROCESSO = RTRIM(DI.NR_PROCESSO) '+
            'INNER JOIN TPROCESSO P ON P.NR_PROCESSO = DI.NR_PROCESSO '+
            'INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE '+
            'INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = DI.NR_PROCESSO '+
            'INNER JOIN TPAGAMENTO_TRIBUTOS PT ON PT.NR_PROCESSO = DI.NR_PROCESSO '+
            'INNER JOIN TEMBALAGEM_CARGA EB ON EB.NR_PROCESSO = DI.NR_PROCESSO '+
            'INNER JOIN TPROCESSO_NF PNF ON PNF.NR_PROCESSO = DI.NR_PROCESSO '+
            'INNER JOIN TURF ON TURF.CODIGO = DI.CD_URF_DESPACHO '+
            'LEFT JOIN TFOLLOWUP FU ON FU.NR_PROCESSO = DI.NR_PROCESSO AND FU.CD_EVENTO = ''088'' '+
            'LEFT JOIN TEMPRESA_EST EMP_EST_F ON EMP_EST_F.CD_EMPRESA = DM.CD_FABRICANTE '+
            'LEFT JOIN TEMPRESA_EST EMP_EST_E ON EMP_EST_E.CD_EMPRESA = DM.CD_EXPORTADOR '+
            'LEFT JOIN TRIBUTO TII ON TII.NR_PROCESSO = DI.NR_PROCESSO AND '+
            '                          TII.NR_ADICAO = DM.NR_ADICAO AND '+
            '                          TII.CD_RECEITA_IMPOSTO = ''0001'' '+
            'LEFT JOIN TRIBUTO TIPI ON TIPI.NR_PROCESSO = DI.NR_PROCESSO AND '+
            '                           TIPI.NR_ADICAO = DM.NR_ADICAO AND '+
            '                           TIPI.CD_RECEITA_IMPOSTO = ''0002'' '+
            'LEFT JOIN TADICAO_DE_IMPORTACAO AI ON AI.NR_PROCESSO = DI.NR_PROCESSO AND '+
            '                                       AI.NR_ADICAO = DM.NR_ADICAO '+
            'WHERE PT.CD_RECEITA_PGTO = 7811 AND '+
            '      PNF.IN_COMPLEMENTAR = ''0'' AND '+
            '      PNF.DT_NOTA = (SELECT MIN(DT_NOTA) FROM TPROCESSO_NF '+
            '                     WHERE NR_PROCESSO = DI.NR_PROCESSO AND IN_COMPLEMENTAR = ''0'' ) '+
            'ORDER BY '+
            '  DI.NR_PROCESSO, '+
            '  DM.NR_ADICAO, '+
            '  DM.NR_ITEM';
end;

function TLeiautePoSystem.Requeridos: string;
begin
  Result := '';
  if Query.FieldByName('VL_TRIBUTO_PAGO').AsFloat = 0 then
    Result := #13#10 + {04}'Processo sem taxa de Siscomex';
  if Query.FieldByName('PB_CARGA').AsFloat = 0 then
    Result := #13#10 + {05}'Favor informar Peso Bruto na DI';
  if Query.FieldByName('PL_CARGA').AsFloat = 0 then
    Result := #13#10 + {06}'Favor informar Peso Líquido na DI';
  if DeclaracaoImpotacao = '' then
    Result := #13#10 + {07}'Favor informar numero da DI';
  if Query.FieldByName('QT_VOLUME_CARGA').AsFloat = 0 then
    Result := #13#10 + {08}'Favor informar volumes da DI';
  if Trim(Query.FieldByName('NR_NOTA').AsString) = '' then
    Result := #13#10 + {09}'Favor informar numero da nota fiscal do processo';
  if Query.FieldByName('DT_NOTA').AsDateTime = 0 then
    Result := #13#10 + {10}'Favor informar data da nota fiscal do processo';
  if Query.FieldByName('CD_CFOP').AsInteger = 0 then
    Result := #13#10 + {15}'Favor informar CFOP nos dados da Nota fiscal do processo';
  if Trim(Query.FieldByName('DT_REGISTRO_DI').AsString) = '' then
    Result := #13#10 + {16}'Favor informar data de registro da DI';
  if Trim(Query.FieldByName('LOCALDESEMB').AsString) = '' then
    Result := #13#10 + {17}'Favor informar URF de Despacho (Armazém de Descarga)';
  if Query.FieldByName('DT_REALIZACAO').AsDateTime = 0 then
    Result := #13#10 + {18}'Favor informar data de Desembaraço no Follow-up do processo';
  if Trim(Query.FieldByName('END_UF').AsString) = '' then
    Result := #13#10 + {19}'Favor informar URF de Despacho (Armazém de Descarga)';
  if NumCliente = '' then
    Result := #13#10 + {20}'Favor informar Fabricante e/ou código do cliente em seu cadastro';
end;

function TLeiautePoSystem.RequeridosItens: string;
begin
  if Copy(Trim(Query.FieldByName('CD_MERCADORIA').AsString), 1, 5) = '' then
    Result := #13#10 + {03}'Favor informar Fabricante e/ou código do cliente em seu cadastro';
  if Query.FieldByName('QT_MERC_UN_COMERC').AsFloat = 0 then
    Result := #13#10 + {04}'Favor informar a quantidade comercializada nos itens da DI';
  if ValorUnitario = 0 then
    Result := #13#10 + {05}'Favor informar valor unitário nos itens da DI';
  if Trim(Query.FieldByName('CD_NCM_SH').AsString) = '' then
    Result := #13#10 + {14}'Favor informar NCM nos itens da DI';
  if Query.FieldByName('NR_ADICAO').AsInteger = 0 then
    Result := #13#10 + {19}'Favor informar o código do produto nos itens da DI';
end;

end.
 
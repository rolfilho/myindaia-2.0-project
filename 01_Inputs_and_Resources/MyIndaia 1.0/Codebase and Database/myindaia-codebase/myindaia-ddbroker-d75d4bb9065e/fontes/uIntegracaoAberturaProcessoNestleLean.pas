unit uIntegracaoAberturaProcessoNestleLean;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils,
  StdCtrls, Mask, Buttons, ExtCtrls, Funcoes, DB, DBTables, Excel2000, OleServer, ComObj;

type

  TAberturaProcessos = class;
  TIntegracaoPlanilha = class;
  TLogCallBack = procedure of object;

  Tfrm_integracao_abertura_processo_nestle_Lean = class(TForm)
    Panel1: TPanel;
    btn_fechar: TButton;
    shpTitulo: TShape;
    lblTitulo: TLabel;
    OpenDialog1: TOpenDialog;
    btnIntegrarPlanilha: TButton;
    Memo1: TMemo;
    lblArquivoLog: TLabel;
    procedure btn_fecharClick(Sender: TObject);
    procedure btnIntegrarPlanilhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    IntegracaoPlanilha: TIntegracaoPlanilha;
  public
    procedure getLogAtualizado;
    { Public declarations }
  end;

  TIntegracaoPlanilha = class
  private
    arquivoPlanilha: String;
    LinhaItem: Integer;
    Excel: OleVariant;
    oSheet: OleVariant;
    AberturaProcessos: TAberturaProcessos;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    procedure IntegrarPlanilhaAberturaProcessos;
  public
  end;

  TAberturaProcessos = class
  public
    ExisteProcessoDF: Boolean;
    NumeroProcesso: String;
    DataServidor: TDateTime;
    CodigoUnidade: string;
    CodigoProduto: string;
    CodigoServico: string;
    CodigoPrefixo: string;
    CodigoCelula: string;
    CodigoFabrica: string;
    CodigoArea: string;
    CodigoOrdem: string;
    CodigoPlanta: string;
    Categoria: string;
    PaisDestino: string;
    TipoContainer: string;
    SemanaExpedicao: string;
    Regiao: string;
    PO: string;
    LDP: string;
    mes: string;
    LogCallBack: TLogCallBack;
    NomeArquivoLog: string;
    mensagemAbertura: string;
    procedure Log(const Msg: string);
    constructor Create;
    destructor Destroy; override;
  private
    queryInsereNovoProcesso: TQuery;
    queryGetNumeroProcesso: TQuery;
    queryServerDateTime: TQuery;
    queryExisteProcessoDF: TQuery;
    queryExisteProcesso: TQuery;
    queryAtualizaEvento147: TQuery;
    queryAtualizaEvento003: TQuery;    
    queryInsertContainers: TQuery;
    queryDeleteContainers: TQuery;
    queryInsertReferencias: TQuery;
    queryDeleteReferencias: TQuery;
    function AbrirProcesso: string;
    procedure getNumeroNovoProcesso;
    procedure ServerDateTime;
    procedure InsereNovoProcesso;
    procedure AtualizaEvento147;
    procedure DeleteContainers;
    procedure DeleteReferencias;
    function ExisteProcesso: Boolean;
    procedure VerificaProcessoDF;
    procedure InsertContainers;
    procedure InsertReferencias;
    procedure AtualizaEvento003;
  end;

var
  frm_integracao_abertura_processo_nestle_Lean: Tfrm_integracao_abertura_processo_nestle_Lean;

implementation

uses
  GSMLIB, PGGP017,  KrDialog, TypInfo;

{$R *.DFM}

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  ForceDirectories(GetLocalPath +'TEMP');

  Result := GetLocalPath + 'TEMP\IntegracaoProcessosNestleLean_' + FormatDateTime('yyyy-mm-dd', Now) + '.log';
end;

//procedure Log(const Msg: string; CallBack: TLogCallBack);
//var
//  Filename: string;
//  LogFile: TextFile;
//begin
//  Filename := NomeArquivoLog;
//  AssignFile (LogFile, Filename);
//  if FileExists (FileName) then
//    Append (LogFile)
//  else
//    Rewrite (LogFile);
//  try
//    Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
//  finally
//    CloseFile (LogFile);
//    if Assigned(CallBack) then
//      CallBack;
//  end;
//end;

procedure Tfrm_integracao_abertura_processo_nestle_Lean.FormShow(
  Sender: TObject);
begin
  lblArquivoLog.Caption := 'Arquivo log: ' + NomeArquivoLog;
  getLogAtualizado;
end;

procedure Tfrm_integracao_abertura_processo_nestle_Lean.getLogAtualizado;
begin
  if not FileExists(NomeArquivoLog) then
    Memo1.Lines.SaveToFile(NomeArquivoLog)
  else
    Memo1.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure Tfrm_integracao_abertura_processo_nestle_Lean.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integracao_abertura_processo_nestle_Lean.btnIntegrarPlanilhaClick(
  Sender: TObject);
begin
  IntegracaoPlanilha := TIntegracaoPlanilha.Create;
  try
    if not OpenDialog1.Execute then
      Exit;

    IntegracaoPlanilha.NomeArquivoLog := NomeArquivoLog;
    IntegracaoPlanilha.LogCallBack := Self.getLogAtualizado;
    IntegracaoPlanilha.arquivoPlanilha := OpenDialog1.FileName;
    IntegracaoPlanilha.IntegrarPlanilhaAberturaProcessos;
  finally
    IntegracaoPlanilha.Free;
  end;
end;


{ TIntegracaoPlanilha }

procedure TIntegracaoPlanilha.IntegrarPlanilhaAberturaProcessos;
var
  vArquivoSalvo: string;
begin
  Excel := CreateOleObject('Excel.Application');
  try
    Excel.Visible := True;

    Excel.WorkBooks.Add(arquivoPlanilha);
    oSheet := Excel.Workbooks[1].WorkSheets[1];

    LinhaItem := 2;

    while oSheet.Cells[LinhaItem, 8].Value <> '' do
    begin

      AberturaProcessos := TAberturaProcessos.Create;
      try

        AberturaProcessos.NomeArquivoLog := NomeArquivoLog;
        AberturaProcessos.LogCallBack := LogCallBack;

        AberturaProcessos.Log('');
        AberturaProcessos.Log('Lendo a linha: ' + IntToStr(LinhaItem));

        AberturaProcessos.CodigoUnidade := '01';
        AberturaProcessos.CodigoProduto := '02';
        AberturaProcessos.CodigoCelula := '89';
        AberturaProcessos.CodigoOrdem := Trim(oSheet.Cells[LinhaItem,1].value); {Col A}
        AberturaProcessos.CodigoPlanta := Trim(oSheet.Cells[LinhaItem,5].value); {Col E}
        AberturaProcessos.Categoria := Trim(oSheet.Cells[LinhaItem,8].value); {Col H}
        AberturaProcessos.PaisDestino := Trim(oSheet.Cells[LinhaItem,9].value); {Col I}
        AberturaProcessos.TipoContainer := Trim(oSheet.Cells[LinhaItem,10].value); {Col J}
        AberturaProcessos.SemanaExpedicao := Trim(oSheet.Cells[LinhaItem,11].value); {Col K}
        AberturaProcessos.Regiao := Trim(oSheet.Cells[LinhaItem,13].value); {Col M}
        AberturaProcessos.PO := Trim(oSheet.Cells[LinhaItem,19].value);  {Col S}
        AberturaProcessos.LDP := Trim(oSheet.Cells[LinhaItem,20].value); {Col T}
        AberturaProcessos.mes := Trim(oSheet.Cells[LinhaItem,21].value); {Col U}


        try
          if not AberturaProcessos.ExisteProcesso then
          begin
            AberturaProcessos.VerificaProcessoDF;
            if AberturaProcessos.ExisteProcessoDF then
            begin
              AberturaProcessos.CodigoArea := AberturaProcessos.queryExisteProcessoDF.FieldByName('CD_AREA').AsString;
              AberturaProcessos.CodigoFabrica := AberturaProcessos.queryExisteProcessoDF.FieldByName('CD_CLIENTE').AsString;
            end;

            AberturaProcessos.AbrirProcesso;

            oSheet.Cells[LinhaItem,24].value := AberturaProcessos.MensagemAbertura;
            AberturaProcessos.Log(AberturaProcessos.MensagemAbertura);
          end
          else
          begin
            oSheet.Cells[LinhaItem,24].value := 'Não incluído. Já existe o processo: ' + AberturaProcessos.NumeroProcesso;
            AberturaProcessos.Log('Não incluído. Já existe o processo: ' + AberturaProcessos.NumeroProcesso);
          end;
        except
//          oSheet.Cells[LinhaItem,24].value := 'Erro ao incluir processo no banco de dados.';
//          AberturaProcessos.Log('Erro ao incluir processo no banco de dados.');
          on E: Exception do
          begin
            AberturaProcessos.log('ERRO. ' + E.Message);
            oSheet.Cells[LinhaItem,24].value := 'ERRO. ' + E.Message;
          end;
        end;

      finally
        AberturaProcessos.Free;
      end;

      Inc(LinhaItem);
    end;

    vArquivoSalvo := ExtractFilePath(arquivoPlanilha) +
                     StringReplace(ExtractFileName(arquivoPlanilha), ExtractFileExt(arquivoPlanilha), '_Integrado', [rfReplaceAll]) +
                     ExtractFileExt(arquivoPlanilha);
    Excel.ActiveWorkBook.SaveAs(vArquivoSalvo);
    Information('Integração realizada com SUCESSO. ' + #13#10 + 'Arquivo com os números dos processos criados salvo: ' + vArquivoSalvo);
  finally
    Excel.WorkBooks.Close;
    Excel.Quit;
  end;
end;

{ TAberturaProcessos }

constructor TAberturaProcessos.Create;
begin

  queryGetNumeroProcesso := TQuery.Create(nil);
  queryGetNumeroProcesso.DatabaseName := 'DBBROKER';

  queryServerDateTime := TQuery.Create(nil);
  queryServerDateTime.DatabaseName := 'DBBROKER';

  queryInsereNovoProcesso := TQuery.Create(nil);
  queryInsereNovoProcesso.DatabaseName := 'DBBROKER';

  queryAtualizaEvento147 := TQuery.Create(nil);
  queryAtualizaEvento147.DatabaseName := 'DBBROKER';

  queryAtualizaEvento003 := TQuery.Create(nil);
  queryAtualizaEvento003.DatabaseName := 'DBBROKER';

  queryExisteProcessoDF := TQuery.Create(nil);
  queryExisteProcessoDF.DatabaseName := 'DBBROKER';

  queryExisteProcesso := TQuery.Create(nil);
  queryExisteProcesso.DatabaseName := 'DBBROKER';

  queryInsertContainers := TQuery.Create(nil);
  queryInsertContainers.DatabaseName := 'DBBROKER';

  queryDeleteContainers := TQuery.Create(nil);
  queryDeleteContainers.DatabaseName := 'DBBROKER';

  queryInsertReferencias := TQuery.Create(nil);
  queryInsertReferencias.DatabaseName := 'DBBROKER';

  queryDeleteReferencias := TQuery.Create(nil);
  queryDeleteReferencias.DatabaseName := 'DBBROKER';

  ServerDateTime;

end;

destructor TAberturaProcessos.Destroy;
begin
  queryGetNumeroProcesso.Free;
  queryServerDateTime.Free;
  queryInsereNovoProcesso.Free;
  queryAtualizaEvento147.Free;
  queryAtualizaEvento003.Free;
  queryExisteProcessoDF.Free;
  queryExisteProcesso.Free;
  queryInsertContainers.Free;
  queryDeleteContainers.Free;
  queryInsertReferencias.Free;
  queryDeleteReferencias.Free;
  inherited;
end;

function TAberturaProcessos.AbrirProcesso: string;
begin
  datm_main.db_broker.StartTransaction;
  try
    if ExisteProcessoDF then
    begin
      Log('Alterando Processo: ' + NumeroProcesso);
      DeleteReferencias;
      InsertReferencias;
      DeleteContainers;
      if (TipoContainer <> 'AIR') and (TipoContainer <> 'AEREO')  then
        InsertContainers;
      AtualizaEvento147;
      mensagemAbertura := 'Processo ALTERADO: ' + NumeroProcesso;
    end
    else
    begin
      InsereNovoProcesso;
      InsertReferencias;
      if (TipoContainer <> 'AIR') and (TipoContainer <> 'AEREO')  then
        InsertContainers;
      AtualizaEvento147;
      AtualizaEvento003;
      mensagemAbertura := 'Novo Processo INCLUÍDO: ' + NumeroProcesso;
    end;
//    datm_main.db_broker.Rollback;
    datm_main.db_broker.Commit;
    Sleep(1000);
  except
    datm_main.db_broker.Rollback;
    Raise;
  end;
end;

procedure TAberturaProcessos.InsereNovoProcesso;

  function GetCliente: String;
  begin
    if CodigoPlanta = '1179' then result :=  '00780' else
    if CodigoPlanta = '1212' then result :=  '02209' else
    if CodigoPlanta = '1284' then result :=  '00785' else
    if CodigoPlanta = '2949' then result :=  '02209' else
    if CodigoPlanta = '2957' then result :=  '00783' else
    if CodigoPlanta = '2958' then result :=  '00781' else
    if CodigoPlanta = '3631' then result :=  '00782' else
    if CodigoPlanta = '7888' then result :=  '01140' else
    if CodigoPlanta = '7890' then result :=  '02632' else
    if CodigoPlanta = '8230' then result :=  '02354' else
    if CodigoPlanta = '8231' then result :=  '02716' else
    if CodigoPlanta = '9959' then result :=  '02948'
    else
      raise exception.Create('Cliente: ' + CodigoPlanta + ' não encontrado. Processo não incluído.');
  end;

  function GetServico: string;
  begin
    if (UpperCase(TipoContainer) = UpperCase('Air')) or (UpperCase(TipoContainer) = UpperCase('Aéreo')) then
      result :=  '4'
    else
    if (UpperCase(TipoContainer) = UpperCase('carreta climatizada')) or
       (UpperCase(TipoContainer) = UpperCase('Carreta refrigerada ')) or
       (UpperCase(TipoContainer) = UpperCase('carreta seca')) then
      result :=  '6'
    else
      result := '2';
  end;

  function GetArea: string;
  begin
    if UpperCase(Categoria) = UpperCase('Exp Aff Biscoitos - 40')            then result := 'IS' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Cafes - 40')                then result := 'IO' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Other Chocolate - 40')      then result := 'IP' else
    if UpperCase(Categoria) = UpperCase('Exp Prof Aff Cafes - 40')           then result := 'IO' else
    if UpperCase(Categoria) = UpperCase('Exp Aff NDG - 40')                  then result := 'JD' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Other Infant Products - 40')then result := 'IZ' else
    if UpperCase(Categoria) = UpperCase('Exp Aff MN - 40')                   then result := 'IQ' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Tampas e Fundos - 40')      then result := 'IX' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Meals & Drinks - 40')       then result := 'IU' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Maggi - 40')                then result := 'IW' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Cereais Familia - 40')      then result := 'IU' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Leite Condensado  - 40')    then result := 'DC' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Creme de leite - 40')       then result := 'DC' else
    if UpperCase(Categoria) = UpperCase('Exp Prof Aff Lacteos - 40')         then result := 'DC' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Bebidas Liquidas - 40')     then result := 'IQ' else
    if UpperCase(Categoria) = UpperCase('CPW')                               then result := 'IU' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Kit Kat - 40')              then result := 'IP' else
    if UpperCase(Categoria) = UpperCase('Bastoes - 40')                      then result := 'IP' else
    if UpperCase(Categoria) = UpperCase('Exp Prof Aff Chocolates - 40')      then result := 'IP' else
    if UpperCase(Categoria) = UpperCase('Exp 3rd Cafes - 20')                then result := 'IO' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Bebidas Pos - 40')          then result := 'IQ' else
    if UpperCase(Categoria) = UpperCase('Maggi')                             then result := 'OG' else
    if UpperCase(Categoria) = UpperCase('Bebidas Liquidas')                  then result := 'MR' else
    if UpperCase(Categoria) = UpperCase('Chocolates Nestle')                 then result := 'OD' else
    if UpperCase(Categoria) = UpperCase('Biscoitos')                         then result := 'IS' else
    if UpperCase(Categoria) = UpperCase('Nutrição Infantil')                 then result := 'OH' else
    if UpperCase(Categoria) = UpperCase('Chocolates Garoto')                 then result := 'OC' else
    if UpperCase(Categoria) = UpperCase('Health Science -  Medical Nutrition') then result := 'MS' else
    if UpperCase(Categoria) = UpperCase('Cafés Solúveis')                    then result := 'IO' else
    if UpperCase(Categoria) = UpperCase('Purina')                            then result := 'PUR' else
    if UpperCase(Categoria) = UpperCase('CPW')                               then result := 'OE' else
    if UpperCase(Categoria) = UpperCase('Professional -  Food')              then result := 'OJ' else
    if UpperCase(Categoria) = UpperCase('Professional -  Bebidas')           then result := 'OI' else
    if UpperCase(Categoria) = UpperCase('Leite Culinários')                  then result := 'OF' else
    if UpperCase(Categoria) = UpperCase('D Leite Culinários')                then result := 'OF' else
    if UpperCase(Categoria) = UpperCase('TerraFertil')                       then result := 'OK' else
    if UpperCase(Categoria) = UpperCase('Dolce Gusto')                       then result := 'JD' else
    if UpperCase(Categoria) = UpperCase('Bebidas Pós (em pó)')               then result := 'AO' else
    if UpperCase(Categoria) = UpperCase('Cereais Familia')                   then result := 'OB' else
    if UpperCase(Categoria) = UpperCase('Exp Aff Seasonal - 40')             then result := 'IP'
    else
      raise exception.Create('Area: ' + Categoria + ' não encontrada. Processo não incluído.');
  end;

  function GetRepresentante: string;
  begin
    if CodigoPlanta = '8230' then
      result := '02680'
    else
    if ((UpperCase(TipoContainer) = UpperCase('carreta climatizada')) or
        (UpperCase(TipoContainer) = UpperCase('Carreta refrigerada')) or
        (UpperCase(TipoContainer) = UpperCase('carreta seca'))
        ) and (UpperCase(PaisDestino) = UpperCase('Argentina')) then
      result := '02891';
    if ((UpperCase(TipoContainer) = UpperCase('carreta climatizada')) or
        (UpperCase(TipoContainer) = UpperCase('Carreta refrigerada')) or
        (UpperCase(TipoContainer) = UpperCase('carreta seca'))
        ) and (UpperCase(PaisDestino) = UpperCase('Chile')) then
      result := '02891';
    if ((UpperCase(TipoContainer) = UpperCase('carreta climatizada')) or
        (UpperCase(TipoContainer) = UpperCase('Carreta refrigerada')) or
        (UpperCase(TipoContainer) = UpperCase('carreta seca'))
        ) and (UpperCase(PaisDestino) = UpperCase('Bolivia')) then
      result := '02232';
    if ((UpperCase(TipoContainer) = UpperCase('carreta climatizada')) or
        (UpperCase(TipoContainer) = UpperCase('Carreta refrigerada')) or
        (UpperCase(TipoContainer) = UpperCase('carreta seca'))
        ) and (UpperCase(PaisDestino) = UpperCase('Paraguai')) then
      result := '02233';
    if ((UpperCase(TipoContainer) = UpperCase('carreta climatizada')) or
        (UpperCase(TipoContainer) = UpperCase('Carreta refrigerada')) or
        (UpperCase(TipoContainer) = UpperCase('carreta seca'))
        ) and (UpperCase(PaisDestino) = UpperCase('Uruguai')) then
      result := '02223'
    else
      result := '00271';
  end;

  function GetEstufagem: string;
  begin
    if (UpperCase(TipoContainer) = UpperCase('Air')) or (UpperCase(TipoContainer) = UpperCase('Aéreo')) then
      result :=  '2' {Carga Solta}
    else
      result := '1'; {FCL}
  end;

  function GetPaisDestino: string;
  begin
    if UpperCase(PaisDestino) = UpperCase('Afghanistan')        then result := '013' else
    if UpperCase(PaisDestino) = UpperCase('Argentina')          then result := '063' else
    if UpperCase(PaisDestino) = UpperCase('Bahrain')            then result := '080' else
    if UpperCase(PaisDestino) = UpperCase('Bolivia')            then result := '097' else
    if UpperCase(PaisDestino) = UpperCase('Bulgaria')           then result := '111' else
    if UpperCase(PaisDestino) = UpperCase('Camarões')           then result := '145' else
    if UpperCase(PaisDestino) = UpperCase('Canadá')             then result := '149' else
    if UpperCase(PaisDestino) = UpperCase('Chile')              then result := '158' else
    if UpperCase(PaisDestino) = UpperCase('Colombia')           then result := '169' else
    if UpperCase(PaisDestino) = UpperCase('Costa Rica')         then result := '196' else
    if UpperCase(PaisDestino) = UpperCase('Dubai (GAC)')        then result := '244' else
    if UpperCase(PaisDestino) = UpperCase('El Salvador')        then result := '687' else
    if UpperCase(PaisDestino) = UpperCase('Equador')            then result := '239' else
    if UpperCase(PaisDestino) = UpperCase('Estados Unidos')     then result := '249' else
    if UpperCase(PaisDestino) = UpperCase('Estados Unidos - Duty free MX') then result := '249' else
    if UpperCase(PaisDestino) = UpperCase('Free Zone')          then result := '515' else
    if UpperCase(PaisDestino) = UpperCase('Guatemala')          then result := '317' else
    if UpperCase(PaisDestino) = UpperCase('Guyana')             then result := '337' else
    if UpperCase(PaisDestino) = UpperCase('Holanda')            then result := '573' else
    if UpperCase(PaisDestino) = UpperCase('Honduras')           then result := '345' else
    if UpperCase(PaisDestino) = UpperCase('Hong Kong')          then result := '351' else
    if UpperCase(PaisDestino) = UpperCase('Ilhas Cayman')       then result := '137' else
    if UpperCase(PaisDestino) = UpperCase('Iran')               then result := '372' else
    if UpperCase(PaisDestino) = UpperCase('Jamaica')            then result := '391' else
    if UpperCase(PaisDestino) = UpperCase('Japan')              then result := '399' else
    if UpperCase(PaisDestino) = UpperCase('Jordan')             then result := '403' else
    if UpperCase(PaisDestino) = UpperCase('Kenya')              then result := '623' else
    if UpperCase(PaisDestino) = UpperCase('Korea')              then result := '190' else
    if UpperCase(PaisDestino) = UpperCase('Lithuania')          then result := '442' else
    if UpperCase(PaisDestino) = UpperCase('Malta')              then result := '467' else
    if UpperCase(PaisDestino) = UpperCase('Mauritius')          then result := '485' else
    if UpperCase(PaisDestino) = UpperCase('Mexico')             then result := '493' else
    if UpperCase(PaisDestino) = UpperCase('México')             then result := '493' else
    if UpperCase(PaisDestino) = UpperCase('New Zealand')        then result := '548' else
    if UpperCase(PaisDestino) = UpperCase('Nicaragua')          then result := '521' else
    if UpperCase(PaisDestino) = UpperCase('Oman')               then result := '556' else
    if UpperCase(PaisDestino) = UpperCase('Paraguai')           then result := '586' else
    if UpperCase(PaisDestino) = UpperCase('Panama')             then result := '580' else
    if UpperCase(PaisDestino) = UpperCase('Panamá')             then result := '580' else
    if UpperCase(PaisDestino) = UpperCase('Peru')               then result := '589' else
    if UpperCase(PaisDestino) = UpperCase('Philippines Batino') then result := '267' else
    if UpperCase(PaisDestino) = UpperCase('Philippines Cagayan')then result := '267' else
    if UpperCase(PaisDestino) = UpperCase('Polonia')            then result := '603' else
    if UpperCase(PaisDestino) = UpperCase('Qatar')              then result := '154' else
    if UpperCase(PaisDestino) = UpperCase('Rep. Dominicana')    then result := '647' else
    if UpperCase(PaisDestino) = UpperCase('Reino Unido')        then result := '628' else
    if UpperCase(PaisDestino) = UpperCase('Saudi')              then result := '053' else
    if UpperCase(PaisDestino) = UpperCase('Servia')             then result := '737' else
    if UpperCase(PaisDestino) = UpperCase('Singapore')          then result := '741' else
    if UpperCase(PaisDestino) = UpperCase('South Africa')       then result := '756' else
    if UpperCase(PaisDestino) = UpperCase('Spain')              then result := '245' else
    if UpperCase(PaisDestino) = UpperCase('Suriname')           then result := '770' else
    if UpperCase(PaisDestino) = UpperCase('Trinidad & tobago')  then result := '515' else
    if UpperCase(PaisDestino) = UpperCase('Taiwan')             then result := '161' else
    if UpperCase(PaisDestino) = UpperCase('Turquia')            then result := '827' else
    if UpperCase(PaisDestino) = UpperCase('UAE')                then result := '244' else
    if UpperCase(PaisDestino) = UpperCase('UAE Flemingo')       then result := '244' else
    if UpperCase(PaisDestino) = UpperCase('Uganda-Translink')   then result := '833' else
    if UpperCase(PaisDestino) = UpperCase('UK')                 then result := '628' else
    if UpperCase(PaisDestino) = UpperCase('Ukraine')            then result := '831' else
    if UpperCase(PaisDestino) = UpperCase('Uruguai')            then result := '845' else
    if UpperCase(PaisDestino) = UpperCase('Venezuela')          then result := '850' else
    if UpperCase(PaisDestino) = UpperCase('Yemen')              then result := '357' else
    if UpperCase(PaisDestino) = UpperCase('United Kingdom')     then result := '628' else
    if UpperCase(PaisDestino) = UpperCase('Tailandia')          then result := '776' else
    if UpperCase(PaisDestino) = UpperCase('Sri Lanka')          then result := '750' else
    if UpperCase(PaisDestino) = UpperCase('Paraguay')           then result := '586' else
    if UpperCase(PaisDestino) = UpperCase('Egypt')              then result := '240' else
    if UpperCase(PaisDestino) = UpperCase('Palestina')          then result := '383' else
    if UpperCase(PaisDestino) = UpperCase('Pakistan')           then result := '576' else
    if UpperCase(PaisDestino) = UpperCase('Syria')              then result := '744' else
    if UpperCase(PaisDestino) = UpperCase('Hungary')            then result := '355' else
    if UpperCase(PaisDestino) = UpperCase('Nicaragua')          then result := '521' else
    if UpperCase(PaisDestino) = UpperCase('Nicaragua - Cia. Centroam. Prod.Láct.') then result := '521' else
    if UpperCase(PaisDestino) = UpperCase('Ruanda - Eri Rwanda')                   then result := '675'
    else
      raise exception.Create('País destino: ' + PaisDestino + ' não encontrado. Processo não incluído.');
  end;

begin
  queryInsereNovoProcesso.Close;
  queryInsereNovoProcesso.SQL.Text :=
          'INSERT INTO TPROCESSO (  NR_PROCESSO,  CD_UNID_NEG,  CD_PRODUTO,  CD_SERVICO,  CD_CLIENTE, CD_AREA, CD_CELULA,  CD_REPRESENTANTE,  TP_ESTUFAGEM, ' + #13#10 +
          '                        CD_USUARIO,  DT_ABERTURA,  IN_CANCELADO,  IN_LIBERADO, CD_PAIS_DESTINO) ' + #13#10 +
          '               VALUES ( :NR_PROCESSO, :CD_UNID_NEG, :CD_PRODUTO, :CD_SERVICO, :CD_CLIENTE, :CD_AREA, :CD_CELULA, :CD_REPRESENTANTE, :TP_ESTUFAGEM, ' + #13#10 +
          '                        :CD_USUARIO, :DT_ABERTURA, :IN_CANCELADO, :IN_LIBERADO, :CD_PAIS_DESTINO) ';



  queryInsereNovoProcesso.ParamByName('CD_SERVICO').AsString := GetServico;

  if queryInsereNovoProcesso.ParamByName('CD_SERVICO').AsString = '4' then
    CodigoPrefixo := 'EA'
  else if queryInsereNovoProcesso.ParamByName('CD_SERVICO').AsString = '6' then
    CodigoPrefixo := 'ER'
  else if queryInsereNovoProcesso.ParamByName('CD_SERVICO').AsString = '2' then
    CodigoPrefixo := 'EM';

  GetNumeroNovoProcesso;
  Log('Incluindo o Processo: ' + NumeroProcesso);

  queryInsereNovoProcesso.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsereNovoProcesso.ParamByName('CD_UNID_NEG').AsString := CodigoUnidade;
  queryInsereNovoProcesso.ParamByName('CD_PRODUTO').AsString := CodigoProduto;
  queryInsereNovoProcesso.ParamByName('CD_CELULA').AsString := CodigoCelula;
  queryInsereNovoProcesso.ParamByName('CD_CLIENTE').AsString := GetCliente;
  queryInsereNovoProcesso.ParamByName('CD_AREA').AsString := GetArea;
  queryInsereNovoProcesso.ParamByName('CD_REPRESENTANTE').AsString := GetRepresentante;
  queryInsereNovoProcesso.ParamByName('TP_ESTUFAGEM').AsString := GetEstufagem;
  queryInsereNovoProcesso.ParamByName('CD_PAIS_DESTINO').AsString := GetPaisDestino;
  queryInsereNovoProcesso.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  queryInsereNovoProcesso.ParamByName('DT_ABERTURA').AsDateTime := DateOf(DataServidor);
  queryInsereNovoProcesso.ParamByName('IN_LIBERADO').AsString := '1';
  queryInsereNovoProcesso.ParamByName('IN_CANCELADO').AsString := '0';

  queryInsereNovoProcesso.ExecSQL;
end;

procedure TAberturaProcessos.DeleteReferencias;
begin
  queryDeleteReferencias.Close;
  queryDeleteReferencias.SQL.Text := ' DELETE BROKER.dbo.TREF_CLIENTE '+
                                     ' WHERE CD_REFERENCIA LIKE ''%DF%'' '+
                                     ' AND NR_PROCESSO = :NR_PROCESSO';
  queryDeleteReferencias.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryDeleteReferencias.ExecSQL;
end;

procedure TAberturaProcessos.InsertReferencias;
begin
  queryInsertReferencias.Close;
  queryInsertReferencias.SQL.Text := ' INSERT INTO BROKER.dbo.TREF_CLIENTE ' + #13#10 +
                                     '   (NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, DT_REFERENCIA, TP_REFERENCIA, ' + #13#10 +
                                     '    CD_AREA, NR_ITEM_PO, NR_PARCIAL, IN_FLAG_LI, CD_EMPRESA) ' + #13#10 +
                                     ' VALUES ' + #13#10 +
                                     '   (:NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, :DT_REFERENCIA, :TP_REFERENCIA, ' + #13#10 +
                                     '    :CD_AREA, :NR_ITEM_PO, :NR_PARCIAL, :IN_FLAG_LI, :CD_EMPRESA) ';

  {insert referencias order}
  queryInsertReferencias.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsertReferencias.ParamByName('NR_SEQUENCIA').AsString := '00001';
  queryInsertReferencias.ParamByName('CD_REFERENCIA').AsString := CodigoOrdem;
  queryInsertReferencias.ParamByName('DT_REFERENCIA').AsDateTime := DataServidor;
  queryInsertReferencias.ParamByName('TP_REFERENCIA').AsString := '02';
  queryInsertReferencias.ParamByName('CD_AREA').AsString := CodigoArea;
  queryInsertReferencias.ParamByName('NR_ITEM_PO').AsString := '0000';
  queryInsertReferencias.ParamByName('NR_PARCIAL').AsInteger := 1;
  queryInsertReferencias.ParamByName('IN_FLAG_LI').AsString := '0';
  queryInsertReferencias.ParamByName('CD_EMPRESA').AsString := CodigoFabrica;
  queryInsertReferencias.ExecSQL;

  {insert referencias remessa}

  queryInsertReferencias.Close;
  queryInsertReferencias.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsertReferencias.ParamByName('NR_SEQUENCIA').AsString := '00002';
  queryInsertReferencias.ParamByName('CD_REFERENCIA').AsString := CodigoOrdem;
  queryInsertReferencias.ParamByName('DT_REFERENCIA').AsDateTime := DataServidor;
  queryInsertReferencias.ParamByName('TP_REFERENCIA').AsString := '03';
  queryInsertReferencias.ParamByName('CD_AREA').AsString := CodigoArea;
  queryInsertReferencias.ParamByName('NR_ITEM_PO').AsString := '0000';
  queryInsertReferencias.ParamByName('NR_PARCIAL').AsInteger := 1;
  queryInsertReferencias.ParamByName('IN_FLAG_LI').AsString := '0';
  queryInsertReferencias.ParamByName('CD_EMPRESA').AsString := CodigoFabrica;
  queryInsertReferencias.ExecSQL;

  {insert referencia OUTROS}
  queryInsertReferencias.Close;
  queryInsertReferencias.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsertReferencias.ParamByName('NR_SEQUENCIA').AsString := '00003';
  queryInsertReferencias.ParamByName('CD_REFERENCIA').AsString := 'LEAN W' + SemanaExpedicao;
  queryInsertReferencias.ParamByName('DT_REFERENCIA').AsDateTime := DataServidor;
  queryInsertReferencias.ParamByName('TP_REFERENCIA').AsString := '04';
  queryInsertReferencias.ParamByName('CD_AREA').AsString := CodigoArea;
  queryInsertReferencias.ParamByName('NR_ITEM_PO').AsString := '0000';
  queryInsertReferencias.ParamByName('NR_PARCIAL').AsInteger := 1;
  queryInsertReferencias.ParamByName('IN_FLAG_LI').AsString := '0';
  queryInsertReferencias.ParamByName('CD_EMPRESA').AsString := CodigoFabrica;
  queryInsertReferencias.ExecSQL;

  {insert Referencia REGIÃO}
  queryInsertReferencias.Close;
  queryInsertReferencias.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsertReferencias.ParamByName('NR_SEQUENCIA').AsString := '00004';
  queryInsertReferencias.ParamByName('CD_REFERENCIA').AsString := Regiao;
  queryInsertReferencias.ParamByName('DT_REFERENCIA').AsDateTime := DataServidor;
  queryInsertReferencias.ParamByName('TP_REFERENCIA').AsString := '47';
  queryInsertReferencias.ParamByName('CD_AREA').AsString := CodigoArea;
  queryInsertReferencias.ParamByName('NR_ITEM_PO').AsString := '0000';
  queryInsertReferencias.ParamByName('NR_PARCIAL').AsInteger := 1;
  queryInsertReferencias.ParamByName('IN_FLAG_LI').AsString := '0';
  queryInsertReferencias.ParamByName('CD_EMPRESA').AsString := CodigoFabrica;
  queryInsertReferencias.ExecSQL;

  {insert Referencia PEDIDO}
  if PO <> '0' then
  begin
    queryInsertReferencias.Close;
    queryInsertReferencias.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
    queryInsertReferencias.ParamByName('NR_SEQUENCIA').AsString := '00005';
    queryInsertReferencias.ParamByName('CD_REFERENCIA').AsString := PO;
    queryInsertReferencias.ParamByName('DT_REFERENCIA').AsDateTime := DataServidor;
    queryInsertReferencias.ParamByName('TP_REFERENCIA').AsString := '01';
    queryInsertReferencias.ParamByName('CD_AREA').AsString := CodigoArea;
    queryInsertReferencias.ParamByName('NR_ITEM_PO').AsString := '0000';
    queryInsertReferencias.ParamByName('NR_PARCIAL').AsInteger := 1;
    queryInsertReferencias.ParamByName('IN_FLAG_LI').AsString := '0';
    queryInsertReferencias.ParamByName('CD_EMPRESA').AsString := CodigoFabrica;
    queryInsertReferencias.ExecSQL;
  end;
  if LDP <> '0' then
  begin
    queryInsertReferencias.Close;
    queryInsertReferencias.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
    queryInsertReferencias.ParamByName('NR_SEQUENCIA').AsString := '00006';
    queryInsertReferencias.ParamByName('CD_REFERENCIA').AsString := LDP;
    queryInsertReferencias.ParamByName('DT_REFERENCIA').AsDateTime := DataServidor;
    queryInsertReferencias.ParamByName('TP_REFERENCIA').AsString := '01';
    queryInsertReferencias.ParamByName('CD_AREA').AsString := CodigoArea;
    queryInsertReferencias.ParamByName('NR_ITEM_PO').AsString := '0000';
    queryInsertReferencias.ParamByName('NR_PARCIAL').AsInteger := 1;
    queryInsertReferencias.ParamByName('IN_FLAG_LI').AsString := '0';
    queryInsertReferencias.ParamByName('CD_EMPRESA').AsString := CodigoFabrica;
    queryInsertReferencias.ExecSQL;
  end;
end;

procedure TAberturaProcessos.DeleteContainers;
begin
  queryDeleteContainers.Close;
  queryDeleteContainers.SQL.Text := 'DELETE BROKER.DBO.TPROCESSO_CNTR ' +
                                     'WHERE NR_PROCESSO = :NR_PROCESSO' ;
  queryDeleteContainers.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryDeleteContainers.ExecSQL;
end;

procedure TAberturaProcessos.InsertContainers;

  function GetTipoContainer: String;
  begin
    if TipoContainer = '1x20' + Chr(39) + 'DRY'   then result := '02' else
    if TipoContainer = '1x40' + Chr(39) + 'HC'    then result := '11' else
    if TipoContainer = '20 dry'                   then result := '02' else
    if TipoContainer = '40 HC'                    then result := '11' else
    if TipoContainer = '20' + Chr(39) + 'Dry'     then result := '02' else
    if TipoContainer = '20' + Chr(39) + ' Dry'    then result := '02' else
    if TipoContainer = '20' + Chr(39) + 'REEFER'  then result := '07' else
    if TipoContainer = '40' + Chr(39) + ' Reefer' then result := '08' else
    if TipoContainer = '40' + Chr(39) + 'REEFER'  then result := '08' else
    if TipoContainer = '40' + Chr(39) + ' HC'     then result := '11' else
    if TipoContainer = '40HC'                     then result := '11' else
    if TipoContainer = 'carreta climatizada'      then result := '22' else
    if TipoContainer = 'Carreta refrigerada'      then result := '23' else
    if TipoContainer = 'carreta seca'             then result := '21';
  end;
begin

  queryInsertContainers.Close;
  queryInsertContainers.SQL.Text := ' INSERT INTO BROKER.dbo.TPROCESSO_CNTR ' + #13#10 +
                                    '   (NR_PROCESSO, NR_CNTR, IN_DESOVA, IN_DEMURRAGE, TP_CNTR, IN_PAGTO_EFETIVADO, TP_DIAS, TX_DEPOSITO, VL_DEPOSITO, ' + #13#10 +
                                    '   IN_DEPOSITADO, IN_DEVOLVIDO, IN_AVARIA, TX_OBS_AVARIA, VL_AVARIA, IN_LAVAGEM, VL_LAVAGEM, IN_MESQUITA, IN_PARTE_LOTE) ' + #13#10 +
                                    ' VALUES ' + #13#10 +
                                    '   (:NR_PROCESSO, :NR_CNTR, :IN_DESOVA, :IN_DEMURRAGE, :TP_CNTR, :IN_PAGTO_EFETIVADO, :TP_DIAS, :TX_DEPOSITO, :VL_DEPOSITO, ' + #13#10 +
                                    '   :IN_DEPOSITADO, :IN_DEVOLVIDO, :IN_AVARIA, :TX_OBS_AVARIA, :VL_AVARIA, :IN_LAVAGEM, :VL_LAVAGEM, :IN_MESQUITA, :IN_PARTE_LOTE) ';

  queryInsertContainers.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryInsertContainers.ParamByName('NR_CNTR').AsString := 'A';
  queryInsertContainers.ParamByName('IN_DESOVA').AsString := '0';
  queryInsertContainers.ParamByName('IN_DEMURRAGE').AsString := '0';
  queryInsertContainers.ParamByName('TP_CNTR').AsString := GetTipoContainer;
  queryInsertContainers.ParamByName('IN_PAGTO_EFETIVADO').AsString := '0';
  queryInsertContainers.ParamByName('TP_DIAS').AsString := '1';
  queryInsertContainers.ParamByName('TX_DEPOSITO').AsString := '';
  queryInsertContainers.ParamByName('VL_DEPOSITO').AsFloat := 0;
  queryInsertContainers.ParamByName('IN_DEPOSITADO').AsString := '0';
  queryInsertContainers.ParamByName('IN_DEVOLVIDO').AsString := '0';
  queryInsertContainers.ParamByName('IN_AVARIA').AsString := '0';
  queryInsertContainers.ParamByName('TX_OBS_AVARIA').AsString := '';
  queryInsertContainers.ParamByName('VL_AVARIA').AsString := '0';
  queryInsertContainers.ParamByName('IN_LAVAGEM').AsString := '0';
  queryInsertContainers.ParamByName('VL_LAVAGEM').AsFloat := 0;
  queryInsertContainers.ParamByName('IN_MESQUITA').AsString := '0';
  queryInsertContainers.ParamByName('IN_PARTE_LOTE').AsString := '0';
  queryInsertContainers.ExecSQL;

end;

procedure TAberturaProcessos.AtualizaEvento147;
begin
  queryAtualizaEvento147.Close;
  queryAtualizaEvento147.SQL.Text := 'UPDATE BROKER.dbo.TFOLLOWUP SET DT_REALIZACAO = :DT_REALIZACAO ' +
                                     'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''147'' ';
  queryAtualizaEvento147.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryAtualizaEvento147.ParamByName('DT_REALIZACAO').AsDateTime := StrToDateTime(Mes);
  queryAtualizaEvento147.ExecSQL;
end;

procedure TAberturaProcessos.AtualizaEvento003;
begin
  queryAtualizaEvento003.Close;
  queryAtualizaEvento003.SQL.Text := 'UPDATE BROKER.dbo.TFOLLOWUP SET DT_REALIZACAO = GETDATE() ' +
                                     'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''003'' ';
  queryAtualizaEvento003.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
  queryAtualizaEvento003.ExecSQL;
end;

function TAberturaProcessos.ExisteProcesso: Boolean;
begin
  queryExisteProcesso.Close;
  queryExisteProcesso.SQL.Text := ' SELECT TP.NR_PROCESSO FROM BROKER.DBO.TPROCESSO TP (NOLOCK) ' +
                                  ' LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO = TP.NR_PROCESSO ' +
                                  ' WHERE TP.CD_GRUPO = ''155'' ' +
                                  ' AND TP.CD_PRODUTO = ''02'' ' +
                                  ' AND RC.TP_REFERENCIA = ''02'' ' +
                                  ' AND RC.CD_REFERENCIA = :REFERENCIA';

  queryExisteProcesso.ParamByName('REFERENCIA').AsString := CodigoOrdem;
  queryExisteProcesso.Open;
  NumeroProcesso := queryExisteProcesso.FieldByName('NR_PROCESSO').AsString;
  result := not queryExisteProcesso.IsEmpty;
end;


procedure TAberturaProcessos.VerificaProcessoDF;
var
  dataTemp: TDateTime;
begin
  queryExisteProcessoDF.Close;
  queryExisteProcessoDF.SQL.Text :=
                                  ' DECLARE @Mes varchar(10) = :Mes'+ #13#10 +
                                  ' DECLARE @CodigoPlanta varchar(6) = :CodigoPlanta'+ #13#10 +
                                  ' DECLARE @PaisDestino varchar(40) = :PaisDestino' + #13#10 +
                                  ' DECLARE @Categoria varchar(40) = :Categoria ' + #13#10 +
                                  ' SELECT TOP 1 TP.CD_AREA, TP.CD_CLIENTE, ' + #13#10 +
                                  ' TP.NR_PROCESSO FROM BROKER.DBO.TPROCESSO TP (NOLOCK) ' + #13#10 +
                                  ' LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
                                  ' WHERE TP.CD_GRUPO=''155'' ' + #13#10 +
                                  ' AND TP.CD_PRODUTO=''02'' ' + #13#10 +
                                  ' AND RC.TP_REFERENCIA=''04'' ' + #13#10 +
                                  ' AND RC.CD_REFERENCIA = ''DF ''+' + #13#10 +
                                  ' (CASE ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=1 THEN ''JANEIRO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=2 THEN ''FEVEREIRO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=3 THEN ''MARCO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=4 THEN ''ABRIL'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=5 THEN ''MAIO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=6 THEN ''JUNHO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=7 THEN ''JULHO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=8 THEN ''AGOSTO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=9 THEN ''SETEMBRO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=10 THEN ''OUTUBRO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=11 THEN ''NOVEMBRO'' ' + #13#10 +
                                  '   WHEN MONTH(CAST(@Mes AS DATE))=12 THEN ''DEZEMBRO'' ' + #13#10 +

                                  ' END) ' + #13#10 +
                                  ' ' + #13#10 +
                                  ' AND TP.CD_CLIENTE = ' + #13#10 +
                                  ' CASE ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''1179'' THEN ''00780'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''1212'' THEN ''02209'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''1284'' THEN ''00785'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''2949'' THEN ''02209'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''2957'' THEN ''00783'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''2958'' THEN ''00781'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''3631'' THEN ''00782'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''7888'' THEN ''01140'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''7890'' THEN ''02632'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''8230'' THEN ''02354'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''8231'' THEN ''02716'' ' + #13#10 +
                                  '   WHEN @CodigoPlanta = ''9959'' THEN ''02948'' ' + #13#10 +
                                  ' END ' + #13#10 +
                                  ' ' + #13#10 +
                                  ' AND TP.CD_PAIS_DESTINO = ' + #13#10 +
                                  ' CASE ' + #13#10 +
                                  '   WHEN @PaisDestino =''Afghanistan'' THEN ''013'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Argentina'' THEN ''063'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Bahrain'' THEN ''080'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Bolivia'' THEN ''097'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Bulgaria'' THEN ''111'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Camarões'' THEN ''145'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Canadá'' THEN ''149'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Chile'' THEN ''158'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Colombia'' THEN ''169'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Costa Rica'' THEN ''196'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Dubai (GAC)'' THEN ''244'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''El Salvador'' THEN ''687'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Equador'' THEN ''239'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Estados Unidos'' THEN ''249'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Free Zone'' THEN ''515'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Guatemala'' THEN ''317'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Guyana'' THEN ''337'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Holanda'' THEN ''573'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Honduras'' THEN ''345'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Hong Kong'' THEN ''351'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Ilhas Cayman'' THEN ''137'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Iran'' THEN ''372'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Jamaica'' THEN ''391'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Japan'' THEN ''399'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Jordan'' THEN ''403'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Kenya'' THEN ''623'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Korea'' THEN ''190'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Lithuania'' THEN ''442'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Malta'' THEN ''467'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Mauritius'' THEN ''485'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Mexico'' THEN ''493'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''México'' THEN ''493'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''New Zealand'' THEN ''548'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Nicaragua'' THEN ''521'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Oman'' THEN ''556'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Paraguai'' THEN ''586'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Panama'' THEN ''580'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Panamá'' THEN ''580'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Peru'' THEN ''589'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Philippines Batino'' THEN ''267'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Philippines Cagayan'' THEN ''267'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Polonia'' THEN ''603'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Qatar'' THEN ''154'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Rep. Dominicana'' THEN ''647'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Reino Unido'' THEN ''628'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Saudi'' THEN ''053'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Servia'' THEN ''737'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Singapore'' THEN ''741'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''South Africa'' THEN ''756'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Spain'' THEN ''245'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Suriname'' THEN ''770'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Trinidad & tobago'' THEN ''515'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Turquia'' THEN ''827'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Taiwan'' THEN ''161'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''UAE'' THEN ''244'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''UAE Flemingo'' THEN ''244'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Uganda-Translink'' THEN ''833'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''UK'' THEN ''628'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Ukraine'' THEN ''831'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Uruguai'' THEN ''845'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Venezuela'' THEN ''850'' ' + #13#10 +
                                  '   WHEN @PaisDestino =''Yemen'' THEN ''357'' ' + #13#10 +
                                  ' END ' + #13#10 +
                                  ' ' + #13#10 +
                                  ' AND TP.CD_AREA = ' + #13#10 +
                                  ' CASE ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Biscoitos - 40''              THEN ''IS'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Cafes - 40''                  THEN ''IO'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Other Chocolate - 40''        THEN ''IP'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Prof Aff Cafes - 40''             THEN ''IO'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff NDG - 40''                    THEN ''JD'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Other Infant Products - 40''  THEN ''IZ'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff MN - 40''                     THEN ''IQ'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Tampas e Fundos - 40''        THEN ''IX'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Meals & Drinks - 40''         THEN ''IU'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Maggi - 40''                  THEN ''IW'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Cereais Familia - 40''        THEN ''IU'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Leite Condensado  - 40''      THEN ''DC'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Creme de leite - 40''         THEN ''DC'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Prof Aff Lacteos - 40''           THEN ''DC'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Bebidas Liquidas - 40''       THEN ''IQ'' ' + #13#10 +
                                  '   WHEN @Categoria = ''CPW''                                 THEN ''IU'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Kit Kat - 40''                THEN ''IP'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Bastoes - 40''                        THEN ''IP'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Prof Aff Chocolates - 40''        THEN ''IP'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp 3rd Cafes - 20''                  THEN ''IO'' ' + #13#10 +
                                  '   WHEN @Categoria = ''Chocolates Nestle''                   THEN ''OD''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Biscoitos''                           THEN ''IS''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Nutrição Infantil''                   THEN ''OH''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Chocolates Garoto''                   THEN ''OC''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Health Science -  Medical Nutrition'' THEN ''MS''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Cafés Solúveis''                      THEN ''IO''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Purina''                              THEN ''PUR'' ' + #13#10 +
                                  '   WHEN @Categoria = ''CPW''                                 THEN ''OE''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Professional -  Food''                THEN ''OJ''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Professional -  Bebidas''             THEN ''OI''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Leite Culinários''                    THEN ''OF''  ' + #13#10 +
                                  '   WHEN @Categoria = ''D Leite Culinários''                  THEN ''OF''  ' + #13#10 +
                                  '   WHEN @Categoria = ''TerraFertil''                         THEN ''OK''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Dolce Gusto''                         THEN ''JD''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Bebidas Pós (em pó)''                 THEN ''AO''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Cereais Familia''                     THEN ''OB''  ' + #13#10 +
                                  '   WHEN @Categoria = ''Exp Aff Seasonal - 40''               THEN ''IP''  ' + #13#10 +
                                  ' END ';








  dataTemp := StrToDateTime(mes);
  queryExisteProcessoDF.ParamByName('Mes').AsString := FormatDateTime('yyyy-mm-dd', dataTemp);
  queryExisteProcessoDF.ParamByName('CodigoPlanta').AsString := CodigoPlanta;
  queryExisteProcessoDF.ParamByName('PaisDestino').AsString := PaisDestino;
  queryExisteProcessoDF.ParamByName('Categoria').AsString := Categoria;
  queryExisteProcessoDF.Open;

  NumeroProcesso := queryExisteProcessoDF.FieldByName('NR_PROCESSO').AsString;
  ExisteProcessoDF := not queryExisteProcessoDF.IsEmpty;
end;

procedure TAberturaProcessos.getNumeroNovoProcesso;
var
  InicioProcesso: String;
  NumeroBase: Integer;
begin
  InicioProcesso := CodigoUnidade +  CodigoProduto + CodigoPrefixo;

  queryGetNumeroProcesso.Close;
  queryGetNumeroProcesso.SQL.Text := 'SELECT MAX(NR_PROCESSO) ULTIMO FROM TPROCESSO '+
                                     ' WHERE SUBSTRING(NR_PROCESSO, 1, 6) = :NR_PROCESSO '+
                                     '  AND DT_ABERTURA BETWEEN (:DTINICIAL) AND (:DTFINAL) ';
  queryGetNumeroProcesso.ParamByName('NR_PROCESSO').AsString := InicioProcesso;
  queryGetNumeroProcesso.ParamByName('DTINICIAL').AsDateTime :=  StartOfTheYear(DataServidor);
  queryGetNumeroProcesso.ParamByName('DTFINAL').AsDateTime := EndOfTheYear(DataServidor);
  queryGetNumeroProcesso.Open;

  if not queryGetNumeroProcesso.IsEmpty then
    NumeroBase := StrToIntDef(Copy(queryGetNumeroProcesso.FieldByName('ULTIMO').AsString, 8, 6), 0) + 1
  else
    NumeroBase := 1;

  NumeroProcesso := InicioProcesso + '-' + FormatFloat('000000', NumeroBase) + '-' + FormatDateTime('YY', DataServidor);
end;

procedure TAberturaProcessos.ServerDateTime;
begin
  queryServerDateTime.Close;
  queryServerDateTime.SQL.Text := 'SELECT GETDATE() AS CurrentDateTime ';
  queryServerDateTime.Open;
  DataServidor := queryServerDateTime.FieldByName('CurrentDateTime').AsDateTime;

end;

procedure TAberturaProcessos.Log(const Msg: string);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    if Msg = '' then
      Writeln (LogFile, Msg)
    else
      Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);  finally
    CloseFile (LogFile);
    if Assigned(LogCallBack) then
      LogCallBack;
  end;
end;

end.



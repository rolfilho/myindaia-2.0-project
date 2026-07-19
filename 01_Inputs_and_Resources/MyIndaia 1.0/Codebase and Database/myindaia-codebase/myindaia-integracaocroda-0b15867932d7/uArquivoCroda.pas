unit uArquivoCroda;

interface

uses System.Classes, System.SysUtils, System.Generics.Collections,
  System.Generics.Defaults, Utils;

type

  TAcaoItem = (taInserir, taAlterar, taExcluir);

  TItem = class
  public
    AcaoItem: TAcaoItem;
    NrItemCliente: Integer;
    CdMercadoria: String;
    QtMercadoria: Double;
    NmUnidMedida: String;
    VlUnitario: Double;
    TpCalculo: String;
    TpCalculoNovo: String;
    VlTotal: Double;
    DescNmCliente: String;
    DtDeliv: TDateTime;
    DtATP: TDateTime;
    Observações: String;
    NCM: String;
    TxMercadoria: String;
    LeadTime: Integer;
    ObservacaoEvento22: String;
    CdPais: String;
  end;

  THeader = class
  public
    NrPedido: String;
    CdExportador: String;
    DtRecebPO: TDateTime;
    NmMoeda: String;
    CdIncoterm: String;
    Itens: TObjectList<TItem>;
    VlTotal: Double;
    Modal: String;
    CdEmpresa: String;
  end;

  TArquivoCroda = class
  private
    FNomeArquivo: string;
    FArquivo: TStrings;
    function GetCodigoPais(value: String): String;
    function GetCodigoModal(value: String): String;
    function GetTipoAcaoItem(value: String): TAcaoItem;
    function GetCodigoMoeda(value: String): String;
    function GetCodigoUnMedida(value: String): String;
    function GetEmpresa(value: String): String;

  public
    destructor Destroy; override;
    constructor Create(const NomeArquivo: string);
    function Processa(var Headers: TObjectList<THeader>; CallBack: TLogCallBack): Boolean;
  end;

implementation

uses DmMain;

{ TArquivoCroda }

constructor TArquivoCroda.Create(const NomeArquivo: string);
begin
  FNomeArquivo := NomeArquivo;
  FArquivo := TStringList.Create;
  FArquivo.LoadFromFile(FNomeArquivo, TEncoding.UTF8);
end;

destructor TArquivoCroda.Destroy;
begin
  FArquivo.Free;
  inherited;
end;

function TArquivoCroda.Processa(var Headers: TObjectList<THeader>; CallBack: TLogCallBack): Boolean;
var
  I: Integer;
  HeaderIndex, ItemIndex: Integer;
  Tag: string;
  vNumeroPedido: Integer;
begin
  Log('Lendo arquivo '+ FNomeArquivo, CallBack);
  HeaderIndex := 0;
  try
    for I := 0 to FArquivo.Count - 1 do
    begin

      Tag := TokenN(FArquivo.Strings[I], 1);

      if Tag = 'PEDIDOCOMPRAS' then
      begin

        HeaderIndex := Headers.Add(THeader.Create);

        ItemIndex := 0;
        vNumeroPedido := 0;
        Headers.Items[HeaderIndex].VlTotal := 0;
        vNumeroPedido  := StrToInt(TokenN(FArquivo.Strings[I], 2));
      end;

      if Tag = 'PH' then
      begin
        Headers.Items[HeaderIndex].NrPedido  := TokenN(FArquivo.Strings[I], 2);
        Headers.Items[HeaderIndex].CdExportador := dmdMain.GetCodigoExportador(TokenN(FArquivo.Strings[I], 3));
        Headers.Items[HeaderIndex].DtRecebPO := StrToDateTime(StringReplace(TokenN(FArquivo.Strings[I], 5), '.', '/', [rfReplaceAll]) );
        Headers.Items[HeaderIndex].NmMoeda := GetCodigoMoeda(TokenN(FArquivo.Strings[I], 6));
        Headers.Items[HeaderIndex].CdIncoterm := TokenN(FArquivo.Strings[I], 7);
        Headers.Items[HeaderIndex].Itens := TObjectList<TItem>.Create;
      end
      else if Tag = 'H' then
      begin
        ItemIndex := Headers.Items[HeaderIndex].Itens.Add(TItem.Create);
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].NrItemCliente := StrToInt(TokenN(FArquivo.Strings[I], 2));
      end
      else if Tag = 'PI' then
      begin
        Headers.Items[HeaderIndex].CdEmpresa := GetEmpresa(TokenN(FArquivo.Strings[I], 2));
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].AcaoItem := GetTipoAcaoItem(TokenN(FArquivo.Strings[I], 3));
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].CdMercadoria := TokenN(FArquivo.Strings[I], 4);
        dmdMain.PreencheCamposMercadoria(Headers.Items[HeaderIndex].Itens.Items[ItemIndex]);
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].QtMercadoria := StrToFloat(StringReplace(TokenN(FArquivo.Strings[I], 6), '.', ',', [rfReplaceAll]));
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].NmUnidMedida := GetCodigoUnMedida(TokenN(FArquivo.Strings[I], 7));
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].VlUnitario := StrToFloat(StringReplace(TokenN(FArquivo.Strings[I], 8), '.', ',', [rfReplaceAll]));
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].TpCalculo := TokenN(FArquivo.Strings[I], 9);
        if UpperCase(Headers.Items[HeaderIndex].Itens.Items[ItemIndex].TpCalculo) = 'TO' then
          Headers.Items[HeaderIndex].Itens.Items[ItemIndex].TpCalculoNovo := '3'
        else
          Headers.Items[HeaderIndex].Itens.Items[ItemIndex].TpCalculoNovo := '1';
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].VlTotal := StrToFloat(StringReplace(TokenN(FArquivo.Strings[I], 11), '.', ',', [rfReplaceAll]));
        Headers.Items[HeaderIndex].VlTotal := Headers.Items[HeaderIndex].VlTotal + Headers.Items[HeaderIndex].Itens.Items[ItemIndex].VlTotal;
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].DescNmCliente := TokenN(FArquivo.Strings[I], 12);
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].DtDeliv := StrToDateTime(StringReplace(TokenN(FArquivo.Strings[I], 13), '.', '/', [rfReplaceAll]));
        if TokenN(FArquivo.Strings[I], 14) <> '' then
          Headers.Items[HeaderIndex].Itens.Items[ItemIndex].DtATP := StrToDateTime(StringReplace(TokenN(FArquivo.Strings[I], 14), '.', '/', [rfReplaceAll]));
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].Observações := TokenN(FArquivo.Strings[I], 15);
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].CdPais := GetCodigoPais(TokenN(FArquivo.Strings[I], 16));

        if Headers.Items[HeaderIndex].Itens.Items[ItemIndex].CdPais = '' then
          raise Exception.Create('ERRO. país não encontrado: ' + TokenN(FArquivo.Strings[I], 16));

        Headers.Items[HeaderIndex].Modal := GetCodigoModal(TokenN(FArquivo.Strings[I], 17));
        Headers.Items[HeaderIndex].Itens.Items[ItemIndex].ObservacaoEvento22 := TokenN(FArquivo.Strings[I], 18);
      end;
    end;
    Result := True;
  except
    raise;
  end;
end;

function TArquivoCroda.GetTipoAcaoItem(value: String): TAcaoItem;
begin
  if value = '' then
    result := taInserir
  else if upperCase(value) = 'L' then
    result := taExcluir;
end;

function TArquivoCroda.GetCodigoModal(value: String): String;
begin
  if UpperCase(value) = UpperCase('AIR') then result := '04' else
  if UpperCase(value) = UpperCase('SEA') then result := '01' else
  if UpperCase(value) = UpperCase('ROAD') then result := '07';
end;

function TArquivoCroda.GetCodigoMoeda(value: String): String;
begin
  if UpperCase(value) = UpperCase('USD') then result := '220' else
  if UpperCase(value) = UpperCase('EUR') then result := '978' else
  if UpperCase(value) = UpperCase('GBP') then result := '540' else
  if UpperCase(value) = UpperCase('BRL') then result := '790';

end;

function TArquivoCroda.GetCodigoUnMedida(value: String): String;
begin
   if UpperCase(value) = UpperCase('KG') then result := '010' else
   if UpperCase(value) = UpperCase('UN') then result := '011' else
   if UpperCase(value) = UpperCase('CDA') then result := '011' else
   if UpperCase(value) = UpperCase('EA') then result := '011';
end;

function TArquivoCroda.GetEmpresa(value: String): String;
begin
  if upperCase(value) = 'CBR1' then
    result := '00500'
  else if upperCase(value) = 'BR51' then
    result := '03185';
end;

function TArquivoCroda.GetCodigoPais(value: String): String;
begin
  if AnsiUpperCase(value) = AnsiUpperCase('Andorra') then result := '037' else
  if AnsiUpperCase(value) = AnsiUpperCase('Utd.Arab.Emir.') then result := '244' else
  if AnsiUpperCase(value) = AnsiUpperCase('Afeganistão') then result := '013' else
  if AnsiUpperCase(value) = AnsiUpperCase('Albania') then result := '017' else
  if AnsiUpperCase(value) = AnsiUpperCase('Alemanha') then result := '023' else
  if AnsiUpperCase(value) = AnsiUpperCase('Amer.Virgin Is.') then result := '866' else
  if AnsiUpperCase(value) = AnsiUpperCase('Angola') then result := '040' else
  if AnsiUpperCase(value) = AnsiUpperCase('Anguilla') then result := '041' else
  if AnsiUpperCase(value) = AnsiUpperCase('Antartica') then result := '999' else
  if AnsiUpperCase(value) = AnsiUpperCase('Antigua/Barbuda') then result := '043' else
  if AnsiUpperCase(value) = AnsiUpperCase('Argelia') then result := '059' else
  if AnsiUpperCase(value) = AnsiUpperCase('Argentina') then result := '063' else
  if AnsiUpperCase(value) = AnsiUpperCase('Armenia') then result := '064' else
  if AnsiUpperCase(value) = AnsiUpperCase('Aruba') then result := '065' else
  if AnsiUpperCase(value) = AnsiUpperCase('Australia') then result := '069' else
  if AnsiUpperCase(value) = AnsiUpperCase('Austria') then result := '072' else
  if AnsiUpperCase(value) = AnsiUpperCase('Azerbaijan') then result := '073' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bahamas') then result := '077' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bahrain') then result := '080' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bangladesh') then result := '081' else
  if AnsiUpperCase(value) = AnsiUpperCase('Barbados') then result := '083' else
  if AnsiUpperCase(value) = AnsiUpperCase('Belarus') then result := '085' else
  if AnsiUpperCase(value) = AnsiUpperCase('Belgica') then result := '087' else
  if AnsiUpperCase(value) = AnsiUpperCase('Belize') then result := '088' else
  if AnsiUpperCase(value) = AnsiUpperCase('Benin') then result := '229' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bermuda') then result := '090' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bhutan') then result := '119' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bolivia') then result := '097' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bosnia-Herz.') then result := '098' else
  if AnsiUpperCase(value) = AnsiUpperCase('Botswana') then result := '101' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bouvet Island') then result := '538' else
  if AnsiUpperCase(value) = AnsiUpperCase('Brasil') then result := '105' else
  if AnsiUpperCase(value) = AnsiUpperCase('Brit.Ind.Oc.Ter') then result := '628' else
  if AnsiUpperCase(value) = AnsiUpperCase('Brit.Virgin Is.') then result := '863' else
  if AnsiUpperCase(value) = AnsiUpperCase('Brunei Dar-es-S') then result := '108' else
  if AnsiUpperCase(value) = AnsiUpperCase('Bulgaria') then result := '111' else
  if AnsiUpperCase(value) = AnsiUpperCase('Burkina-Faso') then result := '031' else
  if AnsiUpperCase(value) = AnsiUpperCase('Burundi') then result := '115' else
  if AnsiUpperCase(value) = AnsiUpperCase('Cambodia') then result := '141' else
  if AnsiUpperCase(value) = AnsiUpperCase('Cameroon') then result := '145' else
  if AnsiUpperCase(value) = AnsiUpperCase('Canada') then result := '149' else
  if AnsiUpperCase(value) = AnsiUpperCase('Cape Verde') then result := '127' else
  if AnsiUpperCase(value) = AnsiUpperCase('Catar') then result := '154' else
  if AnsiUpperCase(value) = AnsiUpperCase('Cazaquistão') then result := '153' else
  if AnsiUpperCase(value) = AnsiUpperCase('Central Afr.Rep') then result := '640' else
  if AnsiUpperCase(value) = AnsiUpperCase('Chad') then result := '788' else
  if AnsiUpperCase(value) = AnsiUpperCase('Chile') then result := '158' else
  if AnsiUpperCase(value) = AnsiUpperCase('China') then result := '896' else
  if AnsiUpperCase(value) = AnsiUpperCase('Christmas Islnd') then result := '511' else
  if AnsiUpperCase(value) = AnsiUpperCase('Coconut Islands') then result := '165' else
  if AnsiUpperCase(value) = AnsiUpperCase('Colombia') then result := '169' else
  if AnsiUpperCase(value) = AnsiUpperCase('Comoros') then result := '173' else
  if AnsiUpperCase(value) = AnsiUpperCase('Congo') then result := '177' else
  if AnsiUpperCase(value) = AnsiUpperCase('Congo (Dem Rep)') then result := '177' else
  if AnsiUpperCase(value) = AnsiUpperCase('Cook Islands') then result := '183' else
  if AnsiUpperCase(value) = AnsiUpperCase('Coréia do Norte') then result := '190' else
  if AnsiUpperCase(value) = AnsiUpperCase('Coréia do Sul') then result := '190' else
  if AnsiUpperCase(value) = AnsiUpperCase('Costa Rica') then result := '196' else
  if AnsiUpperCase(value) = AnsiUpperCase('Croacia') then result := '195' else
  if AnsiUpperCase(value) = AnsiUpperCase('Cuba') then result := '199' else
  if AnsiUpperCase(value) = AnsiUpperCase('Cyprus') then result := '830' else
  if AnsiUpperCase(value) = AnsiUpperCase('Dinamarca') then result := '232' else
  if AnsiUpperCase(value) = AnsiUpperCase('Djibouti') then result := '783' else
  if AnsiUpperCase(value) = AnsiUpperCase('Dominica') then result := '235' else
  if AnsiUpperCase(value) = AnsiUpperCase('Dutch Antilles	0') then result := '47.' else
  if AnsiUpperCase(value) = AnsiUpperCase('East Timor') then result := '795' else
  if AnsiUpperCase(value) = AnsiUpperCase('Egito') then result := '240' else
  if AnsiUpperCase(value) = AnsiUpperCase('El Salvador') then result := '687' else
  if AnsiUpperCase(value) = AnsiUpperCase('Equador') then result := '239' else
  if AnsiUpperCase(value) = AnsiUpperCase('Eritreia') then result := '999' else
  if AnsiUpperCase(value) = AnsiUpperCase('Espanha') then result := '245' else
  if AnsiUpperCase(value) = AnsiUpperCase('Estônia') then result := '251' else
  if AnsiUpperCase(value) = AnsiUpperCase('Etiopia') then result := '253' else
  if AnsiUpperCase(value) = AnsiUpperCase('Faeroe') then result := '259' else
  if AnsiUpperCase(value) = AnsiUpperCase('Falkland Islnds') then result := '255' else
  if AnsiUpperCase(value) = AnsiUpperCase('Fiji') then result := '870' else
  if AnsiUpperCase(value) = AnsiUpperCase('Filipinas') then result := '267' else
  if AnsiUpperCase(value) = AnsiUpperCase('Finlândia') then result := '271' else
  if AnsiUpperCase(value) = AnsiUpperCase('França') then result := '275' else
  if AnsiUpperCase(value) = AnsiUpperCase('Frenc.Polynesia') then result := '599' else
  if AnsiUpperCase(value) = AnsiUpperCase('Gabão') then result := '281' else
  if AnsiUpperCase(value) = AnsiUpperCase('Gâmbia') then result := '285' else
  if AnsiUpperCase(value) = AnsiUpperCase('Gana') then result := '289' else
  if AnsiUpperCase(value) = AnsiUpperCase('Geórgia') then result := '291' else
  if AnsiUpperCase(value) = AnsiUpperCase('Gibraltar') then result := '293' else
  if AnsiUpperCase(value) = AnsiUpperCase('Granada') then result := '297' else
  if AnsiUpperCase(value) = AnsiUpperCase('Grécia') then result := '301' else
  if AnsiUpperCase(value) = AnsiUpperCase('Groenlândia') then result := '305' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guadalupe') then result := '309' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guam') then result := '313' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guatemala') then result := '317' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guiana') then result := '337' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guiana Francesa') then result := '325' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guin Equatorial') then result := '331' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guiné') then result := '329' else
  if AnsiUpperCase(value) = AnsiUpperCase('Guinea-Bissau') then result := '334' else
  if AnsiUpperCase(value) = AnsiUpperCase('Haiti') then result := '341' else
  if AnsiUpperCase(value) = AnsiUpperCase('Heard/McDon.Isl') then result := '069' else
  if AnsiUpperCase(value) = AnsiUpperCase('Holanda') then result := '573' else
  if AnsiUpperCase(value) = AnsiUpperCase('Honduras') then result := '345' else
  if AnsiUpperCase(value) = AnsiUpperCase('Hong Kong') then result := '351' else
  if AnsiUpperCase(value) = AnsiUpperCase('Hungria') then result := '355' else
  if AnsiUpperCase(value) = AnsiUpperCase('Ilhas Cayman') then result := '137' else
  if AnsiUpperCase(value) = AnsiUpperCase('India') then result := '361' else
  if AnsiUpperCase(value) = AnsiUpperCase('Indonesia') then result := '365' else
  if AnsiUpperCase(value) = AnsiUpperCase('Irã') then result := '372' else
  if AnsiUpperCase(value) = AnsiUpperCase('Iraque') then result := '369' else
  if AnsiUpperCase(value) = AnsiUpperCase('Irlanda') then result := '375' else
  if AnsiUpperCase(value) = AnsiUpperCase('Islândia') then result := '379' else
  if AnsiUpperCase(value) = AnsiUpperCase('Israel') then result := '383' else
  if AnsiUpperCase(value) = AnsiUpperCase('Itália') then result := '386' else
  if AnsiUpperCase(value) = AnsiUpperCase('Ivory Coast') then result := '193' else
  if AnsiUpperCase(value) = AnsiUpperCase('Jamaica') then result := '391' else
  if AnsiUpperCase(value) = AnsiUpperCase('Japão') then result := '399' else
  if AnsiUpperCase(value) = AnsiUpperCase('Jordânia') then result := '403' else
  if AnsiUpperCase(value) = AnsiUpperCase('Kiribati') then result := '411' else
  if AnsiUpperCase(value) = AnsiUpperCase('Kosovo') then result := '737' else
  if AnsiUpperCase(value) = AnsiUpperCase('Kuwait') then result := '198' else
  if AnsiUpperCase(value) = AnsiUpperCase('Kyrgyzstan') then result := '415' else
  if AnsiUpperCase(value) = AnsiUpperCase('Laos') then result := '420' else
  if AnsiUpperCase(value) = AnsiUpperCase('Látvia') then result := '604' else
  if AnsiUpperCase(value) = AnsiUpperCase('Lesoto') then result := '426' else
  if AnsiUpperCase(value) = AnsiUpperCase('Líbano') then result := '431' else
  if AnsiUpperCase(value) = AnsiUpperCase('Libéria') then result := '434' else
  if AnsiUpperCase(value) = AnsiUpperCase('Líbia') then result := '438' else
  if AnsiUpperCase(value) = AnsiUpperCase('Liechtenstein') then result := '440' else
  if AnsiUpperCase(value) = AnsiUpperCase('Lituânia') then result := '442' else
  if AnsiUpperCase(value) = AnsiUpperCase('Luxemburgo') then result := '445' else
  if AnsiUpperCase(value) = AnsiUpperCase('Macau') then result := '447' else
  if AnsiUpperCase(value) = AnsiUpperCase('Madagascar') then result := '450' else
  if AnsiUpperCase(value) = AnsiUpperCase('Malásia') then result := '455' else
  if AnsiUpperCase(value) = AnsiUpperCase('Malavi') then result := '458' else
  if AnsiUpperCase(value) = AnsiUpperCase('Maldivas') then result := '461' else
  if AnsiUpperCase(value) = AnsiUpperCase('Mali') then result := '464' else
  if AnsiUpperCase(value) = AnsiUpperCase('Malta') then result := '467' else
  if AnsiUpperCase(value) = AnsiUpperCase('Marrocos') then result := '474' else
  if AnsiUpperCase(value) = AnsiUpperCase('Marshall Islnds') then result := '476' else
  if AnsiUpperCase(value) = AnsiUpperCase('Martinique') then result := '477' else
  if AnsiUpperCase(value) = AnsiUpperCase('Maurício') then result := '485' else
  if AnsiUpperCase(value) = AnsiUpperCase('Mauritânia') then result := '488' else
  if AnsiUpperCase(value) = AnsiUpperCase('Mayotte') then result := '003' else
  if AnsiUpperCase(value) = AnsiUpperCase('México') then result := '493' else
  if AnsiUpperCase(value) = AnsiUpperCase('Micronesia') then result := '499' else
  if AnsiUpperCase(value) = AnsiUpperCase('Minor Outl.Isl.') then result := '249' else
  if AnsiUpperCase(value) = AnsiUpperCase('Moçambique') then result := '505' else
  if AnsiUpperCase(value) = AnsiUpperCase('Moldávia') then result := '494' else
  if AnsiUpperCase(value) = AnsiUpperCase('Mônaco') then result := '495' else
  if AnsiUpperCase(value) = AnsiUpperCase('Mongólia') then result := '497' else
  if AnsiUpperCase(value) = AnsiUpperCase('Montenegro') then result := '737' else
  if AnsiUpperCase(value) = AnsiUpperCase('Montserrat') then result := '501' else
  if AnsiUpperCase(value) = AnsiUpperCase('Myanmar') then result := '093' else
  if AnsiUpperCase(value) = AnsiUpperCase('N.Mariana Islnd') then result := '472' else
  if AnsiUpperCase(value) = AnsiUpperCase('Namíbia') then result := '507' else
  if AnsiUpperCase(value) = AnsiUpperCase('Nauru') then result := '508' else
  if AnsiUpperCase(value) = AnsiUpperCase('Nepal') then result := '517' else
  if AnsiUpperCase(value) = AnsiUpperCase('Nicaragua') then result := '521' else
  if AnsiUpperCase(value) = AnsiUpperCase('Niger') then result := '525' else
  if AnsiUpperCase(value) = AnsiUpperCase('Nigeria') then result := '528' else
  if AnsiUpperCase(value) = AnsiUpperCase('Niue Islands') then result := '531' else
  if AnsiUpperCase(value) = AnsiUpperCase('Norfolk Island') then result := '535' else
  if AnsiUpperCase(value) = AnsiUpperCase('North Macedonia') then result := '472' else
  if AnsiUpperCase(value) = AnsiUpperCase('Norway') then result := '538' else
  if AnsiUpperCase(value) = AnsiUpperCase('Nova Caledônia') then result := '542' else
  if AnsiUpperCase(value) = AnsiUpperCase('Nova Zelândia') then result := '548' else
  if AnsiUpperCase(value) = AnsiUpperCase('Omã') then result := '556' else
  if AnsiUpperCase(value) = AnsiUpperCase('Palau') then result := '575' else
  if AnsiUpperCase(value) = AnsiUpperCase('Palestine O/Ter') then result := '578' else
  if AnsiUpperCase(value) = AnsiUpperCase('Panamá') then result := '580' else
  if AnsiUpperCase(value) = AnsiUpperCase('Pap. New Guinea') then result := '545' else
  if AnsiUpperCase(value) = AnsiUpperCase('Paquistão') then result := '576' else
  if AnsiUpperCase(value) = AnsiUpperCase('Paraguai') then result := '586' else
  if AnsiUpperCase(value) = AnsiUpperCase('Peru') then result := '589' else
  if AnsiUpperCase(value) = AnsiUpperCase('Pitcairn Islnds') then result := '593' else
  if AnsiUpperCase(value) = AnsiUpperCase('Polônia') then result := '603' else
  if AnsiUpperCase(value) = AnsiUpperCase('Porto Rico') then result := '611' else
  if AnsiUpperCase(value) = AnsiUpperCase('Portugal') then result := '607' else
  if AnsiUpperCase(value) = AnsiUpperCase('Quênia') then result := '623' else
  if AnsiUpperCase(value) = AnsiUpperCase('Reino Unido') then result := '628' else
  if AnsiUpperCase(value) = AnsiUpperCase('Republica Checa') then result := '123' else
  if AnsiUpperCase(value) = AnsiUpperCase('Republica Domin') then result := '647' else
  if AnsiUpperCase(value) = AnsiUpperCase('Reunion') then result := '275' else
  if AnsiUpperCase(value) = AnsiUpperCase('Romênia') then result := '670' else
  if AnsiUpperCase(value) = AnsiUpperCase('Russian Fed.') then result := '676' else
  if AnsiUpperCase(value) = AnsiUpperCase('Rwanda') then result := '675' else
  if AnsiUpperCase(value) = AnsiUpperCase('S.Tome,Principe') then result := '720' else
  if AnsiUpperCase(value) = AnsiUpperCase('Samoa,American') then result := '691' else
  if AnsiUpperCase(value) = AnsiUpperCase('San Marino') then result := '697' else
  if AnsiUpperCase(value) = AnsiUpperCase('Saudi Arabia') then result := '053' else
  if AnsiUpperCase(value) = AnsiUpperCase('Senegal') then result := '728' else
  if AnsiUpperCase(value) = AnsiUpperCase('Serbia') then result := '737' else
  if AnsiUpperCase(value) = AnsiUpperCase('Serbia') then result := '737' else
  if AnsiUpperCase(value) = AnsiUpperCase('Serbia/Monteneg') then result := '737' else
  if AnsiUpperCase(value) = AnsiUpperCase('Seychelles') then result := '731' else
  if AnsiUpperCase(value) = AnsiUpperCase('Sierra Leone') then result := '735' else
  if AnsiUpperCase(value) = AnsiUpperCase('Singapore') then result := '741' else
  if AnsiUpperCase(value) = AnsiUpperCase('Slovakia') then result := '247' else
  if AnsiUpperCase(value) = AnsiUpperCase('Slovenia') then result := '246' else
  if AnsiUpperCase(value) = AnsiUpperCase('Solomon Islands') then result := '677' else
  if AnsiUpperCase(value) = AnsiUpperCase('Somalia') then result := '748' else
  if AnsiUpperCase(value) = AnsiUpperCase('South Africa') then result := '756' else
  if AnsiUpperCase(value) = AnsiUpperCase('Sri Lanka') then result := '750' else
  if AnsiUpperCase(value) = AnsiUpperCase('St Kitts&Nevis') then result := '695' else
  if AnsiUpperCase(value) = AnsiUpperCase('St. Helena') then result := '710' else
  if AnsiUpperCase(value) = AnsiUpperCase('St. Lucia') then result := '715' else
  if AnsiUpperCase(value) = AnsiUpperCase('St. Vincent') then result := '705' else
  if AnsiUpperCase(value) = AnsiUpperCase('St.Pier,Miquel.') then result := '700' else
  if AnsiUpperCase(value) = AnsiUpperCase('stateless') then result := '999' else
  if AnsiUpperCase(value) = AnsiUpperCase('Sth Sandwich Is') then result := '291' else
  if AnsiUpperCase(value) = AnsiUpperCase('Sudan') then result := '759' else
  if AnsiUpperCase(value) = AnsiUpperCase('Suécia') then result := '764' else
  if AnsiUpperCase(value) = AnsiUpperCase('Suiça') then result := '767' else
  if AnsiUpperCase(value) = AnsiUpperCase('Suriname') then result := '770' else
  if AnsiUpperCase(value) = AnsiUpperCase('Svalbard') then result := '538' else
  if AnsiUpperCase(value) = AnsiUpperCase('Swaziland') then result := '754' else
  if AnsiUpperCase(value) = AnsiUpperCase('Syria') then result := '744' else
  if AnsiUpperCase(value) = AnsiUpperCase('Taiwan') then result := '161' else
  if AnsiUpperCase(value) = AnsiUpperCase('Tajikstan') then result := '772' else
  if AnsiUpperCase(value) = AnsiUpperCase('Tanzania') then result := '780' else
  if AnsiUpperCase(value) = AnsiUpperCase('Thailand') then result := '776' else
  if AnsiUpperCase(value) = AnsiUpperCase('Togo') then result := '800' else
  if AnsiUpperCase(value) = AnsiUpperCase('Tokelau Islands') then result := '805' else
  if AnsiUpperCase(value) = AnsiUpperCase('Tonga') then result := '810' else
  if AnsiUpperCase(value) = AnsiUpperCase('Trinidad,Tobago') then result := '815' else
  if AnsiUpperCase(value) = AnsiUpperCase('Tunisia') then result := '820' else
  if AnsiUpperCase(value) = AnsiUpperCase('Turkey') then result := '827' else
  if AnsiUpperCase(value) = AnsiUpperCase('Turkmenistan') then result := '824' else
  if AnsiUpperCase(value) = AnsiUpperCase('Turksh Caicosin') then result := '823' else
  if AnsiUpperCase(value) = AnsiUpperCase('Tuvalu') then result := '828' else
  if AnsiUpperCase(value) = AnsiUpperCase('Uganda') then result := '833' else
  if AnsiUpperCase(value) = AnsiUpperCase('Ukraine') then result := '831' else
  if AnsiUpperCase(value) = AnsiUpperCase('Uruguai') then result := '845' else
  if AnsiUpperCase(value) = AnsiUpperCase('USA') then result := '249' else
  if AnsiUpperCase(value) = AnsiUpperCase('Uzbekistan') then result := '847' else
  if AnsiUpperCase(value) = AnsiUpperCase('Vanuatu') then result := '551' else
  if AnsiUpperCase(value) = AnsiUpperCase('Vatican City') then result := '848' else
  if AnsiUpperCase(value) = AnsiUpperCase('Venezuela') then result := '850' else
  if AnsiUpperCase(value) = AnsiUpperCase('Vietnam') then result := '858' else
  if AnsiUpperCase(value) = AnsiUpperCase('Wallis,Futuna') then result := '875' else
  if AnsiUpperCase(value) = AnsiUpperCase('Western Samoa') then result := '690' else
  if AnsiUpperCase(value) = AnsiUpperCase('Yemen') then result := '357' else
  if AnsiUpperCase(value) = AnsiUpperCase('Yugoslavia') then result := '388' else
  if AnsiUpperCase(value) = AnsiUpperCase('Zaire(OBSOLETE)') then result := '999' else
  if AnsiUpperCase(value) = AnsiUpperCase('Zambia') then result := '890' else
  if AnsiUpperCase(value) = AnsiUpperCase('Zimbabwe') then result := '665';

end;

end.

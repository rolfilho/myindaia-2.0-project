unit Global;

interface

type
  TParametros = class
  private
    FProduto: string;
    FProcessoid: Integer;
    FCNPJ: string;
    FProcesso: string;
    FProcessoCompleto: string;
    FGrupoBroker: string;
    FUnidade: string;
    FCNPJAgente:string;
  public
    property Produto: string read FProduto write FProduto;
    property Unidade: string read FUnidade write FUnidade;
    property Processoid: Integer read FProcessoid write FProcessoid;
    property Processo:string read FProcesso write FProcesso;
    property ProcessoCompleto:string read FProcessoCompleto write FProcessoCompleto;
    property GrupoBroker:string read FGrupoBroker write FGrupoBroker;
    property CNPJAgente:string read FCNPJAgente write FCNPJAgente;
    property CNPJ: string read FCNPJ write FCNPJ;
  end;

var
  Parametros: TParametros;

implementation

initialization
  Parametros := TParametros.Create;

finalization
  if Parametros <> nil then
    Parametros.Free;

end.

unit RootUnit;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TMensagens = class
  private
    [JSONName('$id')]
    FId: Integer;
    FLinha: Integer;
    FMensagem: string;
    FRefCount: Integer;
  published
    property Id: Integer read FId write FId;
    property Linha: Integer read FLinha write FLinha;
    property Mensagem: string read FMensagem write FMensagem;
    property RefCount: Integer read FRefCount write FRefCount;
  end;
  
  TRoot = class(TJsonDTO)
  private
    [JSONName('$id')]
    FId: Integer;
    [JSONName('Mensagens'), JSONMarshalled(False)]
    FMensagensArray: TArray<TMensagens>;
    [GenericListReflect]
    FMensagens: TObjectList<TMensagens>;
    FPlanilha: Integer;
    FRefCount: Integer;
    FSucesso: Boolean;
    function GetMensagens: TObjectList<TMensagens>;
  protected
    function GetAsJson: string; override;
  published
    property Id: Integer read FId write FId;
    property Mensagens: TObjectList<TMensagens> read GetMensagens;
    property Planilha: Integer read FPlanilha write FPlanilha;
    property RefCount: Integer read FRefCount write FRefCount;
    property Sucesso: Boolean read FSucesso write FSucesso;
  public
    destructor Destroy; override;
  end;
  
implementation

{ TRoot }

destructor TRoot.Destroy;
begin
  GetMensagens.Free;
  inherited;
end;

function TRoot.GetMensagens: TObjectList<TMensagens>;
begin
  Result := ObjectList<TMensagens>(FMensagens, FMensagensArray);
end;

function TRoot.GetAsJson: string;
begin
  RefreshArray<TMensagens>(FMensagens, FMensagensArray);
  Result := inherited;
end;

end.

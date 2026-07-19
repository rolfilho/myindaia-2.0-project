unit MyAuditoria;
{
CREATE TABLE [AUDITORIA](
	[DATA] [datetime] NULL,
	[MAQUINA] [varchar](50) NULL,
	[USUARIO] [varchar](50) NULL,
	[ENTIDADE] [varchar](50) NULL,
	[ENTIDADE_PAI] [varchar](50) NULL,
	[OPERACAO] [char](1) NULL,
	[DETALHES] [text] NULL
)
}
interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  MyQuery,
  FireDAC.Stan.Param,
  Generics.Collections,
  Aurelius.Mapping.Explorer,
  Aurelius.Events.Manager,
  Aurelius.Mapping.Metadata,
  Aurelius.Mapping.Optimization,
  dialogs;

type
  TAuditoria = class
  private
    FQuery: TMyQuery;
    FInsertedProc: TInsertedProc;
    FDeletedProc: TDeletedProc;
    FUpdatedProc: TUpdatedProc;
    FCollectionItemAddedProc: TCollectionItemAddedProc;
    FCollectionItemRemovedProc: TCollectionItemRemovedProc;
    procedure InsertedHandler(Args: TInsertedArgs);
    procedure DeletedHandler(Args: TDeletedArgs);
    procedure UpdatedHandler(Args: TUpdatedArgs);
    procedure CollectionItemAddedHandler(Args: TCollectionItemAddedArgs);
    procedure CollectionItemRemovedHandler(Args: TCollectionItemRemovedArgs);
  private
    FUsuario: string;
    FAuditar: Boolean;
    function GetEnityValues(Entity: TObject; Entity_Parent: TObject; Manager: TObject): string;
    procedure RegistraAuditoria(const Entidade, Entidade_Pai, Operacao, Detalhes: string);
    procedure SubscribeListeners;
    procedure UnsubscribeListeners;
  public
    property Auditar: Boolean read FAuditar write FAuditar;
    property Usuario: string read FUsuario write FUsuario;
    constructor Create;
    destructor Destroy; override;
  end;

function Auditoria: TAuditoria;

implementation

uses
  Aurelius.Engine.ObjectManager, Aurelius.Global.Utils, MyUtil;

var
  Instance: TAuditoria;

function Auditoria: TAuditoria;
begin
  if not Assigned(Instance) then
    Instance := TAuditoria.Create;

  Result := Instance;
end;
{ TAuditoria }

procedure TAuditoria.CollectionItemAddedHandler(Args: TCollectionItemAddedArgs);
begin
  if not FAuditar then
    Exit;
  RegistraAuditoria(Args.Item.ClassName, Args.Parent.ClassName, 'I', GetEnityValues(Args.Item, Args.Parent, Args.Manager));
end;

procedure TAuditoria.CollectionItemRemovedHandler(
  Args: TCollectionItemRemovedArgs);
begin
  if not FAuditar then
    Exit;
  RegistraAuditoria(Args.Item.ClassName, Args.Parent.ClassName, 'D', GetEnityValues(Args.Item, Args.Parent, Args.Manager));
end;

constructor TAuditoria.Create;
begin
  FAuditar      := True;
  FInsertedProc := InsertedHandler;
  FDeletedProc  := DeletedHandler;
  FUpdatedProc  := UpdatedHandler;

  FCollectionItemAddedProc   := CollectionItemAddedHandler;
  FCollectionItemRemovedProc := CollectionItemRemovedHandler;

  SubscribeListeners;

  FQuery := TMyQuery.Create(nil);
  FQuery.SQL.Text := 'INSERT INTO AUDITORIA (DATA, USUARIO, ENTIDADE, ENTIDADE_PAI,  MAQUINA, OPERACAO, DETALHES) '+
                     'VALUES(:DATA, :USUARIO, :ENTIDADE, :ENTIDADE_PAI, :MAQUINA, :OPERACAO, :DETALHES)';
end;

function TAuditoria.GetEnityValues(Entity: TObject; Entity_Parent: TObject; Manager: TObject): string;
var
  Detalhes: TStrings;
  Members: TList<TRttiOptimization>;
  Member: TRttiOptimization;
  Explorer: TMappingExplorer;
  EntidadePai: string;
  IdName: string;
  IdValue: Variant;
  IdString: string;
  Entidade: string;
  Aux: string;
begin

  if not FAuditar then
    Exit;
  Explorer := TObjectManager(Manager).Explorer;
  Detalhes := TStringList.Create;
  try
    Entidade := Entity.ClassName;
    IdName   := Explorer.GetIdColumns(Entity.ClassType)[0].Name;
    IdValue  :=  Explorer.GetIdValue(Entity);
    IdString := TUtils.VariantToString(IdValue);

    Detalhes.Add('[CHAVE]');
    Detalhes.Add(IdName+'='+IdString);
    Detalhes.Add('Origem='+Screen.ActiveForm.Name);

    if Assigned(Entity_Parent) then
    begin
      EntidadePai := Entity_Parent.ClassName;
      IdName      := TObjectManager(Manager).Explorer.GetIdColumns(Entity_Parent.ClassType)[0].Name;
      IdValue     :=  TObjectManager(Manager).Explorer.GetIdValue(Entity_Parent);
      IdString    := TUtils.VariantToString(IdValue);

      Detalhes.Add('[CHAVE_PAI]');
      Detalhes.Add(IdName+'='+IdString);
      Detalhes.Add('Origem='+Screen.ActiveForm.Name);
    end;

    Explorer.GetAssociations(Entity.ClassType,False,False);
    Members := Explorer.GetClassVisibleMembers(Entity.ClassType, True);

    Detalhes.Add('[COLUNAS]');

    for Member in Members do
      if Explorer.GetMemberValue(Entity, Member).IsObject then
      begin
        if not Explorer.IsObjectList(Member.MemberClass) then
        begin
          if Explorer.GetMemberValue(Entity, Member).AsObject <> nil then
          begin
            IdValue  := Explorer.GetidValue(Explorer.GetMemberValue(Entity, Member).AsObject);
            IdString := TUtils.VariantToString(IdValue);

            Detalhes.Add(Member.MemberName+'='+IdString)
          end;
        end;
      end
      else
        Detalhes.Add(Member.MemberName+'='+Explorer.GetMemberValue(Entity, Member).ToString);

    Result := Detalhes.Text;
  finally
    Detalhes.Free;
  end;
end;

procedure TAuditoria.DeletedHandler(Args: TDeletedArgs);
begin
  if not FAuditar then
    Exit;
  RegistraAuditoria(Args.Entity.ClassName, '', 'E', GetEnityValues(Args.Entity, nil, Args.Manager));
end;

destructor TAuditoria.Destroy;
begin
  FQuery.Free;
  UnsubscribeListeners;
  inherited;
end;

procedure TAuditoria.InsertedHandler(Args: TInsertedArgs);
begin
  if not FAuditar then
    Exit;
  RegistraAuditoria(Args.Entity.ClassName, '', 'I', GetEnityValues(Args.Entity, nil, Args.Manager));
end;

procedure TAuditoria.RegistraAuditoria(const Entidade, Entidade_Pai, Operacao, Detalhes: string);
begin
  if not FAuditar then
    Exit;
  FQuery.ParamByName('DATA').AsDateTime := Now;
  FQuery.ParamByName('USUARIO').AsString := Usuario;
  FQuery.ParamByName('ENTIDADE').AsString := Entidade;
  if Entidade_Pai <> '' then
    FQuery.ParamByName('ENTIDADE_PAI').AsString := Entidade_Pai
  else
  begin
    FQuery.ParamByName('ENTIDADE_PAI').DataType := ftString;
    FQuery.ParamByName('ENTIDADE_PAI').Clear;
  end;
  FQuery.ParamByName('OPERACAO').AsString := Operacao;
  FQuery.ParamByName('MAQUINA').AsString := GetMachineName;
  FQuery.ParamByName('DETALHES').AsString := Detalhes;
  FQuery.ExecSQL;
end;

procedure TAuditoria.SubscribeListeners;
var
  E: TManagerEvents;
begin
  if not FAuditar then
    Exit;
  E := TMappingExplorer.Default.Events;
  E.OnInserted.Subscribe(FInsertedProc);
  E.OnUpdated.Subscribe(FUpdatedProc);
  E.OnDeleted.Subscribe(FDeletedProc);
  E.OnCollectionItemAdded.Subscribe(FCollectionItemAddedProc);
  E.OnCollectionItemRemoved.Subscribe(FCollectionItemRemovedProc);
end;

procedure TAuditoria.UnsubscribeListeners;
var
  E: TManagerEvents;
begin
  if not FAuditar then
    Exit;
  E := TMappingExplorer.Default.Events;
  E.OnInserted.Unsubscribe(FInsertedProc);
  E.OnUpdated.Unsubscribe(FUpdatedProc);
  E.OnDeleted.Unsubscribe(FDeletedProc);
  E.OnCollectionItemAdded.Unsubscribe(FCollectionItemAddedProc);
  E.OnCollectionItemRemoved.Unsubscribe(FCollectionItemRemovedProc);
end;

function IsInstance(Data: Pointer): Boolean;
var
  VMT: Pointer;
begin
  VMT := PPointer(Data)^;
  Result := PPointer(PByte(VMT) + vmtSelfPtr)^ = VMT;
end;

procedure TAuditoria.UpdatedHandler(Args: TUpdatedArgs);
var
  Pair: TPair<string, Variant>;
  OldValue: Variant;
  Entity: string;
  IdValue: Variant;
  IdString: string;
  Detalhes: TStrings;
  IdName: string;
begin
  Detalhes := TStringList.Create;
  try
    Entity   := Args.Entity.ClassName;
    IdName   := TObjectManager(Args.Manager).Explorer.GetIdColumns(Args.Entity.ClassType)[0].Name;
    IdValue  :=  TObjectManager(Args.Manager).Explorer.GetIdValue(Args.Entity);
    IdString := TUtils.VariantToString(IdValue);

    Detalhes.Add('[CHAVE]');
    Detalhes.Add(IdName+'='+IdString);
    Detalhes.Add('Origem='+Screen.ActiveForm.Name);
    Detalhes.Add('[COLUNAS]');

    for Pair in Args.NewColumnValues do
    begin
      if not (Args.OldColumnValues.TryGetValue(Pair.Key, OldValue) and (OldValue = Pair.Value)) then
        Detalhes.Add(Pair.Key+'='+TUtils.VariantToString(OldValue)+'|'+TUtils.VariantToString(Pair.Value));
    end;

    RegistraAuditoria(Entity, '', 'A', Detalhes.Text);
  finally
    Detalhes.Free;
  end;
end;

initialization
   Instance := TAuditoria.Create;

finalization
  if Assigned(Instance) then
    Instance.Free;

end.

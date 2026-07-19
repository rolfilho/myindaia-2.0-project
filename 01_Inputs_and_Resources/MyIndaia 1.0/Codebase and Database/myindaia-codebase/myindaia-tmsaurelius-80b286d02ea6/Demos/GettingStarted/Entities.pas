unit Entities;

interface

uses
  Aurelius.Mapping.Attributes;

type
  [Entity]
  [Automapping]
  TPerson = class
  private
    FId: integer;
    FLastName: string;
    FFirstName: string;
    FEmail: string;
    function GetFullName: string;
  public
    property Id: integer read FId;
    property LastName: string read FLastName write FLastName;
    property FirstName: string read FFirstName write FFirstName;
    property Email: string read FEmail write FEmail;
  public
    property FullName: string read GetFullName;
  end;

implementation

{ TPerson }

function TPerson.GetFullName: string;
begin
  Result := FirstName + ' ' + LastName;
end;

initialization
  RegisterEntity(TPerson);
end.

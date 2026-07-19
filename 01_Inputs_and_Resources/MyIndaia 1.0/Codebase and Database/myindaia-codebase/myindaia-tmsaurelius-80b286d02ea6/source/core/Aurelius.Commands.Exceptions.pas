unit Aurelius.Commands.Exceptions;

{$I Aurelius.inc}

interface

uses
  Aurelius.Global.Exceptions;

type
  ESelectAlreadyOpen = class(EOPFBaseException)
  public
    constructor Create;
  end;

  ESelectNotOpen = class(EOPFBaseException)
    constructor Create;
  end;

  ECursorNotFetching = class(EOPFBaseException)
    constructor Create;
  end;

  ENilObjectReturned = class(EOPFBaseException)
    constructor Create;
  end;

  EVersionedConcurrencyControl = class(EOPFBaseException)
    constructor Create(const AClassName, AId, AVersion: string);
  end;

  ENoRecordsDeleted = class(EOPFBaseException)
    constructor Create(const AClassName, AId: string);
  end;

  ENoRecordsUpdated = class(EOPFBaseException)
    constructor Create(const AClassName, AId: string);
  end;

implementation

{ ESelectAlreadyOpen }

constructor ESelectAlreadyOpen.Create;
begin
  inherited Create('Cannot start selecting objects. A select operation has been already started.');
end;

{ ESelectNotOpen }

constructor ESelectNotOpen.Create;
begin
  inherited Create('Cannot fetch object. A select operation has not been started.');
end;

{ ECursorNotFetching }

constructor ECursorNotFetching.Create;
begin
  inherited Create('Cannot fetch object, cursor fetching has not started.');
end;

{ ENilObjectReturned }

constructor ENilObjectReturned.Create;
begin
  inherited Create('No object returned from database. Check if id column in database has a valid value.');
end;

{ EVersionedConcurrencyControl }

constructor EVersionedConcurrencyControl.Create(const AClassName, AId, AVersion: string);
begin
  inherited CreateFmt('Could not perform database operation due to optimistic concurrency control. ' +
    'Entity class: "%s", Id: "%s", Version: %s', [AClassName, AId, AVersion]);
end;

{ ENoRecordsUpdated }

constructor ENoRecordsUpdated.Create(const AClassName, AId: string);
begin
  inherited CreateFmt('No records affected by update operation. ' +
    'Entity class: "%s", Id: "%s"', [AClassName, AId]);
end;

{ ENoRecordsDeleted }

constructor ENoRecordsDeleted.Create(const AClassName, AId: string);
begin
  inherited CreateFmt('No records affected by delete operation. ' +
    'Entity class: "%s", Id: "%s"', [AClassName, AId]);
end;

end.

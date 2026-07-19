unit ConnectionModule.Wizard.Registration;

{$I Aurelius.inc}

interface

{$IFDEF DELPHIXE2_LVL}

procedure Register;

{$ENDIF}

implementation

{$IFDEF DELPHIXE2_LVL}

uses
  ToolsAPI, ConnectionModule.Wizard;

var
  SparkleServerWizardIndex : Integer;

function InitialiseWizard : IOTAWizard;
begin
  // The trick to getting a repository wizard to work - register a normal wizard
  // here (returned through RegisterProc) and add the repository wizard via
  // AddWizard
  SparkleServerWizardIndex := (BorlandIDEServices as IOTAWizardServices).AddWizard(
    TConnModuleServerWizard.Create);
  Result := nil;
end;

procedure Register;
begin
  InitialiseWizard;
end;

initialization
  SparkleServerWizardIndex := -1;

finalization
  if SparkleServerWizardIndex >= 0 then begin
    (BorlandIDEServices As IOTAWizardServices).RemoveWizard(SparkleServerWizardIndex);
    SparkleServerWizardIndex := -1;
  end;

{$ENDIF}

end.

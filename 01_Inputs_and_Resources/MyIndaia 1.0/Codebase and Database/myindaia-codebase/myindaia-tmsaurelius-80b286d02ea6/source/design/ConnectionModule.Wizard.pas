unit ConnectionModule.Wizard;

{$I Aurelius.inc}

interface

{$IFDEF DELPHIXE2_LVL}

uses
  TMS.ServerWizard.WizardAbstract, TMS.ServerWizard.Types;

type
  TConnModuleServerWizard = class(TTMSServerWizardAbstract)
  protected
    function GetServerKind : TServerKind; override;
    function BeforeExecute: Boolean; override;
  public
    constructor Create; override;
    function GetName: string; override;
  end;

{$ENDIF}

implementation

{$IFDEF DELPHIXE2_LVL}

uses
  ToolsAPI;

{ TConnModuleServerWizard }

function TConnModuleServerWizard.BeforeExecute: Boolean;
begin
  Result := true; // Can always execute this wizard
end;

constructor TConnModuleServerWizard.Create;
var
  CategoryManager : IOTAGalleryCategoryManager;
begin
  inherited;

  CategoryManager := (BorlandIDEServices as IOTAGalleryCategoryManager);

  CategoryManager.AddCategory(CategoryManager.FindCategory(sCategoryDelphiNewFiles),
    strMyCustomCategory, strMyCustomCategory);
end;

function TConnModuleServerWizard.GetName: string;
begin
  Result := 'TMS Aurelius DBConnection';
end;

function TConnModuleServerWizard.GetServerKind: TServerKind;
begin
  Result := TServerKind.skStandAloneConnModule;
end;

{$ENDIF}

end.

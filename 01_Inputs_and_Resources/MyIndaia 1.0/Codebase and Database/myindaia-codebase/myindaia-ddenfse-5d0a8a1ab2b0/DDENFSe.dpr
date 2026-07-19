library DDENFSe;


uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.SysUtils,
  System.Classes,
  DDENFSEIntf in 'DDENFSEIntf.pas',
  DDENFSeImpl in 'DDENFSeImpl.pas',
  Util in 'Util.pas',
  DmMain in 'DmMain.pas' {dmdMain: TDataModule};

{$R *.res}

function GetNFSe: INFSe;
begin
  Result := TNFSe.Create;
end;

exports
  GetNFSe;

begin

end.

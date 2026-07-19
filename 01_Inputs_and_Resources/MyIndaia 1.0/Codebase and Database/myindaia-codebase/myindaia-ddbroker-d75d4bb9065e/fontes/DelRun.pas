(**************************************************************)
(* Unit Name:   DelRun                                        *) 
(* Description: Detect whether the current process is running *) 
(*              under the control of Delphi under Windows 95  *) 
(*              and NT.                                       *) 
(* Author:      Yorai Aminov                                  *) 
(* Created:     30 April 1998                                 *) 
(* Updates:     12 April 1999                                 *)
(*                Use correct IsDebuggerPresent on Windows 98 *) 
(*                                                            *) 
(* Copyright (c) 1998, 99 Yorai Aminov                        *) 
(**************************************************************) 
unit DelRun;

interface 

uses
  Windows, Classes, SysUtils;

function RunningUnderDelphi: Boolean;

implementation

{ NtQueryInformation constants }

const
  ProcessBasicInformation = 0;

{ NtQueryInformation types }

type
  TProcessBasicInformation = packed record
    ExitStatus: Integer;
    PebBaseAddress: Pointer;
    AffinityMask: Integer;
    BasePriority: Integer;
    UniqueProcessID: Integer;
    InheritedFromUniqueProcessID: Integer;
  end;
  TNtQueryInformationProcess =
    function(hProcess: THandle; ProcessInformationClass: Integer;
      var ProcessInformation; ProcessInformationLength: Integer;
      var ReturnLength: Integer): Integer; stdcall;

{ NT IsDebuggerPresent prototype }

type
  TIsDebuggerPresent = function: BOOL; stdcall;

{ Retrieve parent process ID from NtQueryInformation }

function GetParentProcessIDForNT: Integer;
var
  hNTDLL: Integer;
  NtQueryInformationProcess: TNtQueryInformationProcess;
  PBI: TProcessBasicInformation;
  ReturnLength: Integer;
begin
  Result := 0;
  // Attempt to load NTDLL
  hNTDLL := LoadLibrary('NTDLL.DLL');
  if hNTDLL <> 0 then
  begin
    // Retrieve address of NtQueryInformationProcess
    NtQueryInformationProcess := GetProcAddress(hNTDLL, 'NtQueryInformationProcess');
    if Assigned(NTQueryInformationProcess) then
    begin
      // Call NtQueryInformationProcess
      NtQueryInformationProcess(GetCurrentProcess, ProcessBasicInformation, PBI, SizeOf(PBI), ReturnLength);
      // Return parent process ID
      Result := PBI.InheritedFromUniqueProcessID;
    end;
    // Release NTDLL 
    FreeLibrary(hNTDLL); 
  end; 
end; 

{ Check for debugger under NT }

function IsDebuggerPresentForNT: Boolean;
var
  Kernel32: THandle;
  FIsDebuggerPresent: TIsDebuggerPresent;
begin
  Result := False;
  // Attempt to load KERNEL32
  Kernel32 := LoadLibrary('KERNEL32.DLL');
  if Kernel32 <> 0 then
  begin
    // Retrieve address of IsDebuggerPresent
    FIsDebuggerPresent := GetProcAddress(Kernel32, 'IsDebuggerPresent');
    // Return True if a debugger is present
    if Assigned(FIsDebuggerPresent) then
      Result := FIsDebuggerPresent;
    // Release KERNEL32
    FreeLibrary(Kernel32);
  end;
end;

{ ToolHelp32 constants }

const
  TH32CS_SNAPPROCESS  = $00000002;

{ ToolHelp32 types }

type
  PProcessEntry32 = ^TProcessEntry32;
  TProcessEntry32 = record
    dwSize: DWORD;
    cntUsage: DWORD;
    th32ProcessID: DWORD;
    th32DefaultHeapID: DWORD;
    th32ModuleID: DWORD;
    cntThreads: DWORD;
    th32ParentProcessID: DWORD;
    pcPriClassBase: Longint;
    dwFlags: DWORD;
    szExeFile: array[0..MAX_PATH - 1] of Char;// Path
  end;

{ ToolHelp32 function prototypes }

type
  TCreateToolhelp32Snapshot = function(dwFlags, th32ProcessID: DWORD): THandle; stdcall;
  TProcess32First = function(hSnapshot: THandle; var lppe: TProcessEntry32): BOOL; stdcall;
  TProcess32Next = function(hSnapshot: THandle; var lppe: TProcessEntry32): BOOL; stdcall;

function GetParentProcessIDForWindows: Integer;
var 
  Kernel32: THandle; 
  CreateToolhelp32Snapshot: TCreateToolhelp32Snapshot; 
  Process32First: TProcess32First; 
  Process32Next: TProcess32Next; 
  Snapshot: THandle; 
  Entry: TProcessEntry32; 
  WalkResult: Boolean; 
  ID: ULONG; 
begin 
  Result := 0; 
  // Attempt to load KERNEL32 
  Kernel32 := LoadLibrary('KERNEL32.DLL'); 
  if Kernel32 <> 0 then 
  begin 
    // Retrieve ToolHelp32 function addresses 
    CreateToolhelp32Snapshot := 
      GetProcAddress(Kernel32, 'CreateToolhelp32Snapshot'); 
    Process32First := GetProcAddress(Kernel32, 'Process32First'); 
    Process32Next := GetProcAddress(Kernel32, 'Process32Next'); 
    if Assigned(CreateToolhelp32Snapshot) and 
       Assigned(Process32First) and 
       Assigned(Process32Next) then 
    begin 
      // Retrieve current process ID for comparison 
      ID := GetCurrentProcessId; 
      // Create processes snapshot 
      Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0); 
      if Integer(Snapshot) <> -1 then 
      begin 
        // Start walking list of processes 
        Entry.dwSize := SizeOf(TProcessEntry32); 
        WalkResult := Process32First(Snapshot, Entry); 
        // Walk through entire list until result can be determined 
        while (GetLastError <> ERROR_NO_MORE_FILES) and (Result = 0) do
        begin 
          if WalkResult then 
          begin 
            // If this is the current process, return its parent 
            if Entry.th32ProcessID = ID then 
              Result := Entry.th32ParentProcessID; 
          end; 
          // Move to next item in the process list 
          Entry.dwSize := SizeOf(TProcessEntry32); 
          WalkResult := Process32Next(Snapshot, Entry); 
        end; 
        // Release handle to the snapshot 
        CloseHandle(Snapshot); 
      end; 
    end; 
    // Release KERNEL32 
    FreeLibrary(Kernel32); 
  end; 
end; 

{ Process database constants }

const
  fDebugSingle = $00000001;

{ Process database types }

type 
  PProcessDatabase = ^TProcessDatabase; 
  TProcessDatabase = packed record 
    DontCare1: array[0..7] of Integer; 
    Flags: Integer; 
    DontCare2: array[0..11] of Integer; 
    DebugeeCB: Integer; 
    DontCare3: array[0..22] of Integer; 
    DontCare4: Word; 
  end; 

function IsDebuggerPresentForWindows: Boolean;
var 
  PDB: PProcessDatabase; 
  TID: Integer; 
  Obsfucator: ULONG; 
begin 
  Result := False; 
  Obsfucator := 0; 
  TID := GetCurrentThreadID; 
  // Calculate Obsfucator 
  asm 
    MOV     EAX, FS:[18h] 
    SUB     EAX, 10h 
    XOR     EAX, [TID] 
    MOV     [Obsfucator], EAX 
    // Obsfucator := (@TIB - $10) xor GetCurrentThreadID 
  end; 
  if Obsfucator <> 0 then 
  begin 
    // Retriece pointer to the PDB 
    PDB := Pointer(GetCurrentProcessID xor Obsfucator); 
    // Return True if process is being debugged 
    Result := (PDB^.Flags and fDebugSingle) <> 0; 
  end; 
end; 

function GetParentProcessID: Integer;
begin
  // If Windows 95/98 or NT 5.0+, use ToolHelp32
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion < 5) then
    Result := GetParentProcessIDForNT
  else
    Result := GetParentProcessIDForWindows;
end;

function IsDebuggerPresent: Boolean; 
begin 
  // If Windows 95, use PDB. Otherwise, use NT's IsDebuggerPresent 
  if (Win32Platform = VER_PLATFORM_WIN32_NT) or
    ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and 
     ((Win32MajorVersion > 4) or 
      ((Win32MajorVersion = 4) and (Win32MinorVersion > 0)))) then 
    Result := IsDebuggerPresentForNT
  else
    Result := IsDebuggerPresentForWindows;
end;

procedure EnumWindowsProc(Window: THandle; LParam: Integer); stdcall; 
var 
  ClassName: string; 
begin 
  // Allocate space for class name 
  SetLength(ClassName, 255); 
  // Retrieve window's class name 
  GetClassName(Window, PChar(ClassName), 255); 
  // Reallocate string length 
  SetLength(ClassName, StrLen(PChar(ClassName))); 
  // If window belongs to an instance of Delphi, add to list 
  if ClassName = 'TAppBuilder' then 
    TList(LParam).Add(Pointer(Window)); 
end;

function RunningUnderDelphi: Boolean; 
var 
  List: TList; 
  i: Integer; 
  ID, ParentID: Integer; 
begin 
  Result := False; 
  // Retrieve ID for the parent process 
  ParentID := GetParentProcessID; 
  // If ID found and being debugged, check for Delphi 
  if (ParentID <> 0) and (IsDebuggerPresent) then 
  begin 
    // Create a list of window handles 
    List := TList.Create; 
    // Fill list with window handles for instances of Delphi 
    EnumWindows(@EnumWindowsProc, Integer(List)); 
    // Check Delphi instances 
    for i := 0 to List.Count - 1 do 
    begin 
      // Get process ID for the Delphi window 
      GetWindowThreadProcessID(Integer(List[i]), @ID); 
      // Compare IDs 
      if ID = ParentID then 
      begin 
        // The process parent ID is Delphi's process ID 
        Result := True; 
        Break; 
      end; 
    end; 
    // Free list 
    List.Free; 
  end; 
end;

end.


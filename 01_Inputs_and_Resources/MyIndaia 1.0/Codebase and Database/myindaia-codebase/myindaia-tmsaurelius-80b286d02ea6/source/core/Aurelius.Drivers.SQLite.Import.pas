unit Aurelius.Drivers.SQLite.Import;

{$I Aurelius.inc}

interface

{$IFDEF ANDROID}
  {$DEFINE AURELIUS_SQLITE_STATIC}
{$ENDIF}

const
{$IFDEF MSWINDOWS}
  SQLiteDLLName = 'sqlite3.dll';
{$ENDIF}
{$IFDEF MACOS}
  {$IFDEF IOS}
  SQLiteDLLName = '/usr/lib/libsqlite3.dylib';
  {$ELSE}
  SQLiteDLLName = 'libsqlite3.dylib';
  {$ENDIF}
{$ENDIF}
{$IFDEF ANDROID}
  SQLiteDLLName = 'libsqlite.so';
{$ENDIF}
{$IFDEF LINUX}
  SQLiteDLLName = 'libsqlite3.so';
{$ENDIF}

const
  SQLITE_OK = 0;
  SQLITE_ROW = 100;
	SQLITE_DONE = 101;

  SQLITE_TRANSIENT = Pointer(-1);

{$IFDEF AURELIUS_SQLITE_STATIC}
  {$IFDEF UNDERSCOREIMPORTNAME}
    _UND_ = '_';
  {$ELSE}
    _UND_ = '';
  {$ENDIF}
  {$IFDEF ANDROID}
    SQLiteLib = 'libsqlite.a';
  {$ENDIF}

  function sqlite3_open16(filename: pchar; var db: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_open16';
  function sqlite3_close(db: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_close';
  function sqlite3_prepare16_v2(db: pointer; sql: pchar; nBytes: integer; var stmt: pointer; var ztail: pchar): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_prepare16_v2';
  function sqlite3_step(stmt: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_step';
  function sqlite3_finalize(stmt: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_finalize';
  function sqlite3_errmsg16(db: pointer): pchar; cdecl; external SqliteLib name _UND_ + 'sqlite3_errmsg16';
  function sqlite3_errcode(db: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_errcode';
  function sqlite3_last_insert_rowid(db: pointer): int64; cdecl; external SqliteLib name _UND_ + 'sqlite3_last_insert_rowid';
  function sqlite3_changes(db: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_changes';

  function sqlite3_column_count(stmt: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_count';
  function sqlite3_column_name16(stmt: pointer; ColNum: integer): pchar; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_name16';
  function sqlite3_column_type(stmt: pointer; col: integer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_type';
  function sqlite3_column_bytes16(stmt: pointer; col: integer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_bytes16';
  function sqlite3_column_blob(stmt: pointer; col: integer): pointer; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_blob';
  function sqlite3_column_double(stmt: pointer; col: integer): double; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_double';
  function sqlite3_column_int(stmt: pointer; col: integer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_int';
  function sqlite3_column_int64(stmt: pointer; col: integer): Int64; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_int64';
  function sqlite3_column_text16(stmt: pointer; col: integer): pchar; cdecl; external SqliteLib name _UND_ + 'sqlite3_column_text16';

  function sqlite3_bind_blob(stmt: pointer; param: integer; blob: pointer; size: integer; freeproc: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_blob';
  function sqlite3_bind_text16(stmt: pointer; param: integer; text: PChar; size: integer; freeproc: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_text16';
  function sqlite3_bind_int64(stmt: pointer; param: integer; value: int64): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_int64';
  function sqlite3_bind_double(stmt: pointer; param: integer; value: double): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_double';
  function sqlite3_bind_null(stmt: pointer; param: integer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_null';
  function sqlite3_bind_parameter_count(stmt: pointer): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_parameter_count';

  {$IFDEF NEXTGEN}
  function sqlite3_bind_parameter_index(stmt: pointer; paramname: MarshaledAString): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_parameter_index';
  function sqlite3_bind_parameter_name(stmt: pointer; paramindex: integer): MarshaledAString; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_parameter_name';
  {$ELSE}
  function sqlite3_bind_parameter_index(stmt: pointer; paramname: PAnsiChar): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_parameter_index';
  function sqlite3_bind_parameter_name(stmt: pointer; paramindex: integer): PAnsiChar; cdecl; external SqliteLib name _UND_ + 'sqlite3_bind_parameter_name';
  {$ENDIF}

  function sqlite3_initialize(): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_initialize';
  function sqlite3_shutdown(): integer; cdecl; external SqliteLib name _UND_ + 'sqlite3_shutdown';
{$ENDIF}

type
  Tsqlite3_open16 = function(filename: pchar; var db: pointer): integer; cdecl;
  Tsqlite3_close = function(db: pointer): integer; cdecl;
  Tsqlite3_prepare16_v2 = function(db: pointer; sql: pchar; nBytes: integer; var stmt: pointer; var ztail: pchar): integer; cdecl;
  Tsqlite3_step = function(stmt: pointer): integer; cdecl;
  Tsqlite3_finalize = function(stmt: pointer): integer; cdecl;
  Tsqlite3_errmsg16 = function(db: pointer): pchar; cdecl;
  Tsqlite3_errcode = function(db: pointer): integer; cdecl;
  Tsqlite3_last_insert_rowid = function(db: pointer): int64; cdecl;
  Tsqlite3_changes = function(db: pointer): integer; cdecl;

  Tsqlite3_column_count = function(stmt: pointer): integer; cdecl;
  Tsqlite3_column_name16 = function(stmt: pointer; ColNum: integer): pchar; cdecl;
  Tsqlite3_column_type = function(stmt: pointer; col: integer): integer; cdecl;
  Tsqlite3_column_bytes16 = function(stmt: pointer; col: integer): integer; cdecl;
  Tsqlite3_column_blob = function(stmt: pointer; col: integer): pointer; cdecl;
  Tsqlite3_column_double = function(stmt: pointer; col: integer): double; cdecl;
  Tsqlite3_column_int = function(stmt: pointer; col: integer): integer; cdecl;
  Tsqlite3_column_int64 = function(stmt: pointer; col: integer): Int64; cdecl;
  Tsqlite3_column_text16 = function(stmt: pointer; col: integer): pchar; cdecl;

  Tsqlite3_bind_blob = function(stmt: pointer; param: integer; blob: pointer; size: integer; freeproc: pointer): integer; cdecl;
  Tsqlite3_bind_text16 = function(stmt: pointer; param: integer; text: PChar; size: integer; freeproc: pointer): integer; cdecl;
  Tsqlite3_bind_int64 = function(stmt: pointer; param: integer; value: int64): integer; cdecl;
  Tsqlite3_bind_double = function(stmt: pointer; param: integer; value: double): integer; cdecl;
  Tsqlite3_bind_null = function(stmt: pointer; param: integer): integer; cdecl;
  Tsqlite3_bind_parameter_count = function(stmt: pointer): integer; cdecl;

  {$IFDEF NEXTGEN}
  Tsqlite3_bind_parameter_index = function(stmt: pointer; paramname: MarshaledAString): integer; cdecl;
  Tsqlite3_bind_parameter_name = function(stmt: pointer; paramindex: integer): MarshaledAString; cdecl;
  {$ELSE}
  Tsqlite3_bind_parameter_index = function(stmt: pointer; paramname: PAnsiChar): integer; cdecl;
  Tsqlite3_bind_parameter_name = function(stmt: pointer; paramindex: integer): PAnsiChar; cdecl;
  {$ENDIF}

  Tsqlite3_initialize = function(): integer; cdecl;
  Tsqlite3_shutdown = function(): integer; cdecl;

var
  f_sqlite3_open16: Tsqlite3_open16;
  f_sqlite3_close: Tsqlite3_close;
  f_sqlite3_prepare16_v2: Tsqlite3_prepare16_v2;
  f_sqlite3_step: Tsqlite3_step;
  f_sqlite3_finalize: Tsqlite3_finalize;
  f_sqlite3_errmsg16: Tsqlite3_errmsg16;
  f_sqlite3_errcode: Tsqlite3_errcode;
  f_sqlite3_last_insert_rowid: Tsqlite3_last_insert_rowid;
  f_sqlite3_changes: Tsqlite3_changes;

  f_sqlite3_column_count: Tsqlite3_column_count;
  f_sqlite3_column_name16: Tsqlite3_column_name16;
  f_sqlite3_column_type: Tsqlite3_column_type;
  f_sqlite3_column_bytes16: Tsqlite3_column_bytes16;
  f_sqlite3_column_blob: Tsqlite3_column_blob;
  f_sqlite3_column_double: Tsqlite3_column_double;
  f_sqlite3_column_int: Tsqlite3_column_int;
  f_sqlite3_column_int64: Tsqlite3_column_int64;
  f_sqlite3_column_text16: Tsqlite3_column_text16;

  f_sqlite3_bind_blob: Tsqlite3_bind_blob;
  f_sqlite3_bind_text16: Tsqlite3_bind_text16;
  f_sqlite3_bind_int64: Tsqlite3_bind_int64;
  f_sqlite3_bind_double: Tsqlite3_bind_double;
  f_sqlite3_bind_null: Tsqlite3_bind_null;
  f_sqlite3_bind_parameter_count: Tsqlite3_bind_parameter_count;

  f_sqlite3_bind_parameter_index: Tsqlite3_bind_parameter_index;
  f_sqlite3_bind_parameter_name: Tsqlite3_bind_parameter_name;

  f_sqlite3_initialize: Tsqlite3_initialize;
  f_sqlite3_shutdown: Tsqlite3_shutdown;

function LoadSQLiteLibrary: boolean;

implementation
uses
  {$IFDEF MSWINDOWS}
    {$IFDEF DELPHIXE2_LVL}
    Winapi.Windows,
    {$ELSE} 
    Windows,
    {$ENDIF}
 {$ENDIF}
  SysUtils;


{$IFDEF AURELIUS_SQLITE_STATIC}
var
  LibLoaded: Boolean;

procedure InitSQLiteUnit;
begin
  LibLoaded := False;
end;

procedure FinalizeSQLiteUnit;
begin
  if Assigned(f_sqlite3_shutdown) then
    f_sqlite3_shutdown();
end;

function LoadSQLiteLibrary: boolean;
begin
  Result := True;
  if LibLoaded then Exit(True);

  f_sqlite3_open16 := @sqlite3_open16;
  f_sqlite3_close := @sqlite3_close;
  f_sqlite3_prepare16_v2 := @sqlite3_prepare16_v2;
  f_sqlite3_errmsg16 := @sqlite3_errmsg16;
  f_sqlite3_errcode := @sqlite3_errcode;
  f_sqlite3_step := @sqlite3_step;
  f_sqlite3_finalize := @sqlite3_finalize;
  f_sqlite3_last_insert_rowid := @sqlite3_last_insert_rowid;
  f_sqlite3_changes := @sqlite3_changes;

  f_sqlite3_column_count := @sqlite3_column_count;
  f_sqlite3_column_name16 := @sqlite3_column_name16;
  f_sqlite3_column_type := @sqlite3_column_type;
  f_sqlite3_column_bytes16 := @sqlite3_column_bytes16;
  f_sqlite3_column_blob := @sqlite3_column_blob;
  f_sqlite3_column_double := @sqlite3_column_double;
  f_sqlite3_column_int := @sqlite3_column_int;
  f_sqlite3_column_int64 := @sqlite3_column_int64;
  f_sqlite3_column_text16 := @sqlite3_column_text16;

  f_sqlite3_bind_blob := @sqlite3_bind_blob;
  f_sqlite3_bind_text16 := @sqlite3_bind_text16;
  f_sqlite3_bind_double := @sqlite3_bind_double;
  f_sqlite3_bind_int64 := @sqlite3_bind_int64;
  f_sqlite3_bind_null := @sqlite3_bind_null;
  f_sqlite3_bind_parameter_count := @sqlite3_bind_parameter_count;
  f_sqlite3_bind_parameter_index := @sqlite3_bind_parameter_index;
  f_sqlite3_bind_parameter_name := @sqlite3_bind_parameter_name;

  f_sqlite3_initialize := @sqlite3_initialize;
  f_sqlite3_shutdown := @sqlite3_shutdown;

  Result := Assigned(f_sqlite3_initialize) and (f_sqlite3_initialize() = 0);
  LibLoaded := Result;
end;
{$ELSE}
var
  LibraryHandle: THandle;

procedure InitSQLiteUnit;
begin
  LibraryHandle := 0;
end;

procedure FinalizeSQLiteUnit;
begin
  if LibraryHandle <> 0 then
    FreeLibrary(LibraryHandle);
end;

function LoadSQLiteLibrary: boolean;

  function LoadProc(ProcName: string): Pointer;
  begin
    Result := GetProcAddress(LibraryHandle, PChar(ProcName));
    Assert(Assigned(Result), SQLiteDLLName + ' - Could not find method: ' + ProcName);
  end;

begin
  if LibraryHandle <> 0 then
    Exit(True);

  Result := False;
  LibraryHandle := SafeLoadLibrary(PChar(SQLiteDLLName));
  if (LibraryHandle <> 0) then
  begin
    Result := True;

    f_sqlite3_open16 := LoadProc('sqlite3_open16');
    f_sqlite3_close := LoadProc('sqlite3_close');
    f_sqlite3_prepare16_v2 := LoadProc('sqlite3_prepare16_v2');
    f_sqlite3_errmsg16 := LoadProc('sqlite3_errmsg16');
    f_sqlite3_errcode := LoadProc('sqlite3_errcode');
    f_sqlite3_step := LoadProc('sqlite3_step');
    f_sqlite3_finalize := LoadProc('sqlite3_finalize');
    f_sqlite3_last_insert_rowid := LoadProc('sqlite3_last_insert_rowid');
    f_sqlite3_changes := LoadProc('sqlite3_changes');

    f_sqlite3_column_count := LoadProc('sqlite3_column_count');
    f_sqlite3_column_name16 := LoadProc('sqlite3_column_name16');
    f_sqlite3_column_type := LoadProc('sqlite3_column_type');
    f_sqlite3_column_bytes16 := LoadProc('sqlite3_column_bytes16');
    f_sqlite3_column_blob := LoadProc('sqlite3_column_blob');
    f_sqlite3_column_double := LoadProc('sqlite3_column_double');
    f_sqlite3_column_int := LoadProc('sqlite3_column_int');
    f_sqlite3_column_int64 := LoadProc('sqlite3_column_int64');
    f_sqlite3_column_text16 := LoadProc('sqlite3_column_text16');

    f_sqlite3_bind_blob := LoadProc('sqlite3_bind_blob');
    f_sqlite3_bind_text16 := LoadProc('sqlite3_bind_text16');
    f_sqlite3_bind_double := LoadProc('sqlite3_bind_double');
    f_sqlite3_bind_int64 := LoadProc('sqlite3_bind_int64');
    f_sqlite3_bind_null := LoadProc('sqlite3_bind_null');
    f_sqlite3_bind_parameter_count := LoadProc('sqlite3_bind_parameter_count');
    f_sqlite3_bind_parameter_index := LoadProc('sqlite3_bind_parameter_index');
    f_sqlite3_bind_parameter_name := LoadProc('sqlite3_bind_parameter_name');

    f_sqlite3_initialize := LoadProc('sqlite3_initialize');
  end;
end;
{$ENDIF}

Initialization
  InitSQLiteUnit;

finalization
  FinalizeSQLiteUnit;

end.


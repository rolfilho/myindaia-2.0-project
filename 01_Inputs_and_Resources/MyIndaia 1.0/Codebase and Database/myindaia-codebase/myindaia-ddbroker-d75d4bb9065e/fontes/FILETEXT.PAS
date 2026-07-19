unit Filetext;

{
  Projeto					  :	EDI/BS Continental
  Para						  :	BS Continental/Tecnosis/Press Informática
  Autor					  	:	José Carlos Monteiro de Oliveira Junior
  Versão	   				:	1.03
  Versão do módulo	:	1.0
  Data						  :	21/06/96

  Descrição				  :	Módulo que define o objeto TFileText que faz a leitura de arquivos textos
  								    do tipo sequencial.

  Objetos					  :	TFileText
  									  property  Handle: integer;
        							property  Name: TFileName;
        							property  Exist: boolean;
        							property  Eof: boolean;
        							property  Bof: boolean;
        							property  FType: TFileType;
        							property  FSize: longint;
        							property  Active: boolean;
        							property  Buffer: PChar;
        							function  Open: boolean;
        							function  Close: boolean;
        							function  Read( length: integer): integer;
        							procedure Destroy;

}

interface

uses
  SysUtils,
  WinTypes,
  WinProcs,
  Messages,
  Classes;

const
	HFILE_ERROR = -1;
   MAXBUFFSIZE = 1024;
   MAXPOSI     = 4096;

type
	TBuffer = array [0..MAXBUFFSIZE] of Char;

type
	TFileType = ( itSeq, itLine );

type
	TFileText = class( TObject )
  	private
        file_handle: integer;
        file_name: TFileName;
        file_eof: boolean;
        file_bof: boolean;
        file_type: TFileType;
        file_opened: boolean;
        file_buffer: TBuffer;
        file_size: longint;
        file_open_mode: word;
        procedure SetFileName( s: TFileName );
        function  ExistFile: boolean;
        procedure SetFileType( t: TFileType );
        function  CalcFileSize: longint;
        function  GetFileBuffer: PChar;
     public
        property  Handle: integer read file_handle;
        property  Name: TFileName read file_name write SetFileName;
        property  Exist: boolean read ExistFile;
        property  Eof: boolean read file_eof;
        property  Bof: boolean read file_bof;
        property  FType: TFileType read file_type write SetFileType;
        property  FSize: longint read file_size;
        property  Active: boolean read file_opened;
        property  Buffer: PChar read GetFileBuffer;
        property  Mode: word read file_open_mode;
        function  Open: boolean;
        function  CreateFile: boolean;
        function  Close: boolean;
        function  Read( length: integer): integer;
        function  Write( b: PChar ): integer;
{        destructor Destroy; override;}
     end;


implementation

function TFileText.GetFileBuffer: PChar;
begin
	GetFileBuffer := file_buffer;
end;

procedure TFileText.SetFileName( s: TFileName );
begin
	file_name := s;
end;

function TFileText.ExistFile: boolean;
begin
	ExistFile := FileExists( file_name );
end;

procedure TFileText.SetFileType( t: TFileType );
begin
	file_type := t;
end;

function TFileText.Open: boolean;
var aPath: array [0..255] of char;
begin
	{ Verificando a existencia do arquivo }
  Open := false;
  if Exist then begin
		StrPCopy( aPath, file_name );
  	file_handle := _lopen( aPath, OF_READ );
     if file_handle <> HFILE_ERROR then begin
  		file_eof := false;
        file_bof := true;
        file_opened := true;
        Open := true;
        file_size := CalcFileSize;
     end
     else begin
     	file_eof := false;
        file_bof := false;
        file_opened := false;
     end;
	end;
end;

function TFileText.CreateFile: boolean;
var
	aPath: array [0..255] of char;
begin
	StrPCopy( aPath, file_name );
 	file_handle := _lcreat( aPath, 0 );
  if file_handle <> HFILE_ERROR then begin
  		file_eof := false;
        file_bof := true;
        file_opened := true;
        CreateFile := true;
        file_size := 0;
  end
  else begin
     	file_eof := false;
        file_bof := false;
        file_opened := false;
        CreateFile := false;
  end;
end;

function TFileText.Close: boolean;
begin
	if _lclose( file_handle ) <> HFILE_ERROR then begin
     file_opened := false;
     Close := true;
  end
  else begin
  	file_opened := true;
  	Close := false;
  end;
end;

function TFileText.Read( length: integer): integer;
var
  ch :	Char;
  Pos:	Integer;
  i: integer;
begin
	ch		:= #0;
  Pos	:= 0;
  while (Pos < length ) and not file_eof do begin
     i := _lread( file_handle, @ch, 1 );
     if i < 1 then begin
     	file_eof := True;
     end
     else begin
     	file_buffer[ Pos ] := ch;
        Inc( Pos );
     end;
  end;
  file_buffer[ Pos ] := #0;
  Read := Pos;
end;

function TFileText.Write( b: PChar ): integer;
var
  w: longint;
begin
	w := _lwrite( file_handle, b, StrLen( b ) );
   Write := w;
end;

{
destructor TFileText.Destroy;
begin

     inherited Destroy;

end;
}

function TFileText.CalcFileSize: longint;
var
  posi: integer;
  total: longint;
  buf: array [0..MAXPOSI] of char;
begin
	if Active then begin
  	{posiciona o ponteiro na primeira posição }
     _llseek( file_handle, 0, 0);
     total := 0;

     { Começa o posicionamento do ponteiro em MAXPOSI / MAXPOSI posiçoes }
     posi := _lread( file_handle, @buf, MAXPOSI );
     while ( posi = MAXPOSI ) do begin
     	total := total + posi;
        posi := _lread( file_handle, @buf, MAXPOSI );
     end;

     if posi <> HFILE_ERROR then begin
     	total := total + posi;
     end;

     CalcFileSize := total;
  end
  else begin
  	CalcFileSize := 0;
  end;
	_llseek( file_handle, 0, 0 );
  file_eof := false;
  file_bof := true;
end;

end.

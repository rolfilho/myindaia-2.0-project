unit atz_web;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables;

type
  Tatz_webForm = class(TForm)
    db_proc_web: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  atz_webForm: Tatz_webForm;

implementation

{$R *.DFM}

end.

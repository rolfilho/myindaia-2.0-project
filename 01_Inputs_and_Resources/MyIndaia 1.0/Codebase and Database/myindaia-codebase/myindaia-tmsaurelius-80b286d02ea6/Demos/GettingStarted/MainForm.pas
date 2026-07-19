unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Entities, // our business entities
  Aurelius.Drivers.Interfaces, // general-purpose db interfaces, like IDBConnection
  Aurelius.Sql.SQLite, // adds SQLite sql dialect for DML statements
  Aurelius.Schema.SQLite,  // adds SQLite sql dialect for DDL statement
  Aurelius.Engine.ObjectManager; // To manipulate objects (TObjectManager)

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    btUpdateSchema: TButton;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edFirstName: TEdit;
    Label5: TLabel;
    edLastName: TEdit;
    Label6: TLabel;
    edEmail: TEdit;
    btSavePerson: TButton;
    Label7: TLabel;
    edLastId: TEdit;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    Label8: TLabel;
    Panel9: TPanel;
    GroupBox2: TGroupBox;
    lbFoundPerson: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edEmailToUpdate: TEdit;
    btUpdateEmail: TButton;
    edIdToFind: TEdit;
    btFindPerson: TButton;
    TabSheet5: TTabSheet;
    Panel10: TPanel;
    Label9: TLabel;
    Panel11: TPanel;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    edNameToFind: TEdit;
    btListPeople: TButton;
    lbResults: TListBox;
    TabSheet6: TTabSheet;
    Panel12: TPanel;
    Label10: TLabel;
    Panel13: TPanel;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btUpdateSchemaClick(Sender: TObject);
    procedure btSavePersonClick(Sender: TObject);
    procedure btFindPersonClick(Sender: TObject);
    procedure btUpdateEmailClick(Sender: TObject);
    procedure btListPeopleClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Connection: IDBConnection;
    Manager: TObjectManager;
    LastPersonFound: TPerson;
  end;

var
  Form1: TForm1;

implementation

uses
  Generics.Collections,
  Aurelius.Drivers.SQLite, // Adapter for connecting to SQLite databae (could be FireDac, ADO...)
  Aurelius.Criteria.Base, Aurelius.Criteria.Linq, // To use Linq query system
  Aurelius.Engine.DatabaseManager; // To update the database schema (TDatabaseManager)

{$R *.dfm}

procedure TForm1.btUpdateSchemaClick(Sender: TObject);
begin
  TDatabaseManager.Update(Connection);
  ShowMessage('Database updated.');
end;

procedure TForm1.btFindPersonClick(Sender: TObject);
begin
  LastPersonFound := Manager.Find<TPerson>(StrToInt(edIdToFind.Text));
  if LastPersonFound <> nil then
  begin
    lbFoundPerson.Caption := LastPersonFound.FullName;
    edEmailToUpdate.Text := LastPersonFound.Email;
    btUpdateEmail.Enabled := True;
  end else
  begin
    lbFoundPerson.Caption := '(no person found)';
    edEmailToUpdate.Text := '';
    btUpdateEmail.Enabled := False;
  end;
end;

procedure TForm1.btListPeopleClick(Sender: TObject);
var
  SearchTerm: string;
  PersonList: TList<TPerson>;
  Person: TPerson;
begin
  SearchTerm := Trim(edNameToFind.Text);

  PersonList := Manager.Find<TPerson>
    .Where(
      Linq['FirstName'].Contains(SearchTerm)
      or Linq['LastName'].Contains(SearchTerm)
      or Linq['Email'].Contains(SearchTerm)
    )
    .OrderBy('FirstName')
    .List;
  try
    lbResults.Items.Clear;
    for Person in PersonList do
      lbResults.Items.Add(Format('(%d) %s - %s',
        [Person.Id,
         Person.FullName,
         Person.Email
        ]));
  finally
    PersonList.Free;
  end;
end;

procedure TForm1.btSavePersonClick(Sender: TObject);
var
  Person: TPerson;
begin
  Person := TPerson.Create;
  try
    Person.LastName := edLastName.Text;
    Person.FirstName := edFirstName.Text;
    Person.Email := edEmail.Text;
    Manager.Save(Person);
    edLastId.Text := IntToStr(Person.Id);
    edFirstName.Text := '';
    edLastName.Text := '';
    edEmail.Text := '';
  except
    if not Manager.IsAttached(Person) then
      Person.Free;
    raise;
  end;
  ShowMessage('Person saved.');
end;

procedure TForm1.btUpdateEmailClick(Sender: TObject);
begin
  if LastPersonFound = nil then Exit;
  LastPersonFound.Email := edEmailToUpdate.Text;
  Manager.Flush;
  ShowMessage('E-mail updated.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  Connection := TSQLiteNativeConnectionAdapter.Create(ParamStr(0) + '.db');
  TDatabaseManager.Update(Connection);

  { Creates the manager to manipulate objects. Do not create a global manager for the whole
    application. It looks global here because this demo is very simple.
    Usually you could use it as a unit-of-work concept. You would create the manager,
    process data, and then destroy it. Or in case of end-user interface like this form, you'd
    keep the manager alive while the form is open and objects are being manipulated, but as
    soon as operations are finished (or form is closed for example), discard the manager }
  Manager := TObjectManager.Create(Connection);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Manager.Free;
end;

end.



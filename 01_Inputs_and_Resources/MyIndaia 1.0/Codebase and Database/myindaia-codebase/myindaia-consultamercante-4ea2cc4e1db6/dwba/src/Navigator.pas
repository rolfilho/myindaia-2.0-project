unit Navigator;

interface

type
  INavigator = interface
    procedure Navegate(const Url: string; Flags : OleVariant);
    procedure ExecuteScript(Script: string);
    procedure AddjQueryXPathPlugin;
    function GetFieldValueByXPath(const XPath, FieldName: string): string; overload;
    function GetFieldValueByXPath(const XPath: string): string; overload;
  end;

implementation

end.

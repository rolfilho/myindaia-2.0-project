unit InterfacesEmail;

interface

type
  IAttachmentFileList = interface;
  IEMailAddressList = interface;
  IMessage = interface;
  ISMTP = interface;

  IAttachmentFileList = interface
    procedure Clear;
    function GetAttachments: String;
    procedure SetAttachments(AAttachments: String);
    function GetItem(Index: Integer): String;
    procedure SetItem(Index: Integer; AFileName: String);
    function GetCount: Integer;
    function Add(AAttachment: String): Integer;
    property Items[Index: Integer]: String read GetItem write SetItem;
    property Attachments: String read GetAttachments write SetAttachments;
    property Count: Integer read GetCount;
  end;

  IEmailAddressList = interface
    procedure Clear;
    function GetAddresses: String;
    procedure SetAddresses(AAddresses: String);
    function GetItem(AIndex: Integer): String;
    procedure SetItem(AIndex: Integer; AAddress: String);
    function GetCount: Integer;
    procedure Add(AAddress: String);
    property Items[Index: Integer]: String read GetItem write SetItem; default;
    property Addresses: String read GetAddresses write SetAddresses;
    property Count: Integer read GetCount;
  end;

  IMessage = interface
    procedure Clear;
    function GetBody: String;
    procedure SetBody(ABody: String);
    function GetBccList: IEMailAddressList;
    function GetCharSet: String;
    procedure SetCharSet(ACharSet: String);
    function GetCcList: IEMailAddressList;
    function GetContentType: String;
    procedure SetContentType(AContentType: String);
    function GetFrom: String;
    procedure SetFrom(AFrom: String);
    function GetRecipients: IEMailAddressList;
    function GetReplyTo: String;
    procedure SetReplyTo(AReplyTo: String);
    function GetSubject: String;
    procedure SetSubject(ASubject: String);
    function GetAttachments: IAttachmentFileList;
    property Body: String read GetBody write SetBody;
    property BccList: IEmailAddressList read GetBccList;
    property CharSet: String read GetCharSet write SetCharSet;
    property CcList: IEmailAddressList read GetCcList;
    property ContentType: String read GetContentType write SetContentType;
    property From: String read GetFrom write SetFrom;
    property Recipients: IEmailAddressList read GetRecipients;
    property ReplyTo: String read GetReplyTo write SetReplyTo;
    property Subject: String read GetSubject write SetSubject;
    property Attachments: IAttachmentFileList read GetAttachments;
  end;

  TAuthenticationType = (None, Default, SASL);
  TSSLVersion = (SSLv2, SSLv23, SSLv3, TLSv1);
  TSSLVersions = set of TSSLVersion;
  TTLSType = (
    NoTLSSupport,
    UseImplicitTLS, // ssl iohandler req, allways tls
    UseRequireTLS, // ssl iohandler req, user command only accepted when in tls
    UseExplicitTLS // < user can choose to use tls
    );

  ISMTP = interface
    procedure Clear;
    procedure Free;
    function GetAuthType: TAuthenticationType;
    procedure SetAuthType(AAuthType: TAuthenticationType);
    function GetHost: String;
    procedure SetHost(AHost: String);
    function GetPassword: String;
    procedure SetPassword(APassword: String);
    function GetPort: Integer;
    procedure SetPort(APort: Integer);
    function GetSSLVersions: TSSLVersions;
    procedure SetSSLVersions(ASSLVersions: TSSLVersions);
    function GetUseTLS: Boolean;
    procedure SetUseTLS(AUseTLS: Boolean);
    function GetTLSType: TTLSType;
    procedure SetTLSType(ATLSType: TTLSType);
    function GetUsername: String;
    procedure SetUsername(AUsername: String);
    function GetMessage: IMessage;
    function GetErrorMessage: String;
    function Connect: Boolean;
    procedure Disconnect(ANotifyPeer: Boolean);
    function Connected: Boolean;
    function SendMail(DisconnectAfterSend: Boolean): Boolean;
    property AuthType: TAuthenticationType read GetAuthType write SetAuthType;
    property Host: String read GetHost write SetHost;
    property Password: String read GetPassword write SetPassword;
    property Port: Integer read GetPort write SetPort;
    property SSLVersions: TSSLVersions read GetSSLVersions write SetSSLVersions;
    property UseTLS: Boolean read GetUseTLS write SetUseTLS;
    property TLSType: TTLSType read GetTLSType write SetTLSType;
    property Username: String read GetUsername write SetUsername;
    property Message: IMessage read GetMessage;
    property ErrorMessage: String read GetErrorMessage;
  end;

  function MySMTP: ISMTP; stdcall;

implementation

function MySMTP: ISMTP; external 'myEmail.dll';

end.

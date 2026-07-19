{*****************************************************************************}
{                                                                             }
{ WAB Demo application - v 1.0                                                }
{                                                                             }
{ Based on Microsoft WabTool Example:                                         }
{ http://msdn.microsoft.com/downloads/samples/internet/messaging/wabtool      }
{                                                                             }
{*****************************************************************************}

unit uCatalogoEnderecos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ToolWin, ComCtrls, ActnList, WabDefs, WabApi, WabIab,
  ImgList, ExtCtrls, Buttons;

type
  TfrmCatalogoEnderecos = class(TForm)
    AdrBookListView: TListView;
    ImageList1: TImageList;
    Panel1: TPanel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Shape1: TShape;
    procedure Open1Execute(Sender: TObject);
    procedure AdrBookListViewDeletion(Sender: TObject; Item: TListItem);
    procedure Properties1Update(Sender: TObject);
    procedure AdrBookListViewDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DetailListViewData(Sender: TObject; Item: TListItem);
    procedure AdrBookListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Exit1Execute(Sender: TObject);
    procedure Find1Update(Sender: TObject);
    procedure Find1Execute(Sender: TObject);
    procedure Delete1Execute(Sender: TObject);
    procedure OpenDialogShow(Sender: TObject);
    procedure About1Execute(Sender: TObject);
    procedure AdrBookListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure NewUser1Execute(Sender: TObject);
    procedure EditValue1Update(Sender: TObject);
    procedure DetailListViewDblClick(Sender: TObject);
    procedure EditValue1Execute(Sender: TObject);
    procedure DetailListViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdrBookListViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    FFileName: TFileName;
    FLastDetails: PSPropsArray;
    FLastDetailsCount: Integer;
    FLastDetailID: PSBinary;
    AddrBook: IAddrBook;
    WabObject: IWabObject;
  public
  vMailSelecionado : String;
    procedure ClearLastDetails;
    procedure CloseWabFile;
    procedure CreateNewEntry(ulObjectType: ULONG);
    procedure DeleteEntry(EntryIDData: PSBinary);
    procedure FreeSBinary(var P: PSBinary);
    procedure FreeSRowSet(var P: PSRowSet);
    function HrGetWABTemplateID(ulObjectType: ULONG; var lpcbEID: ULONG;
      var lppEID: PEntryId): HResult;
    procedure LoadItems(RememberSelected: Boolean);
    procedure OpenCopyOfFileName(const FileName: TFileName; CreateCopy: Boolean);
    procedure OpenWabFile(const FileName: TFileName);
    procedure ReadDetails(EntryIDData: PSBinary);
    function SetCurrentPropValue: Boolean;
  end;

var
  frmCatalogoEnderecos: TfrmCatalogoEnderecos;

implementation

{$R *.DFM}

uses
  ComObj, Dlgs, WabTags, WabCode;

function SPropValueToStr(PropValue: TSPropValue): string;
var
  LT: TFileTime;
  ST: TSystemTime;
begin
  with PropValue do
    case PROP_TYPE(ulPropTag) of
      PT_TSTRING:
        Result := Value.lpszA;
      PT_BINARY:
        if Value.bin.cb = 4 then
          Result := Format('[Binary - Size: %d bytes] (%.8x)', [Value.bin.cb, PDWORD(Value.bin.lpb)^])
        else
          Result := Format('[Binary - Size: %d bytes]', [Value.bin.cb]);
      PT_I2:
        Result := IntToStr(Value.i);
      PT_LONG:
        Result := IntToStr(Value.l);
      PT_R4:
        Result := FloatToStr(Value.flt);
      PT_DOUBLE:
        Result := FloatToStr(Value.dbl);
      PT_BOOLEAN:
        Result := IntToStr(Value.b);
      PT_SYSTIME:
        begin
          FileTimeToLocalFileTime(Value.ft, LT);
          FileTimeToSystemTime(LT, ST);
          Result := DateTimeToStr(SystemTimeToDateTime(ST));
        end;
      PT_ERROR:
        Result := '';
    else
      Result := Format('[Unknown type %x]', [PROP_TYPE(ulPropTag)]);
    end;
end;

function StrToSPropValue(const TextValue: String; var PropValue: TSPropValue): Boolean;
begin
  Result := True;
  with PropValue do
    case PROP_TYPE(ulPropTag) of
      PT_TSTRING:
        Value.lpszA := PChar(TextValue);
      PT_I2:
        Value.i := StrToInt(TextValue);
      PT_LONG:
        Value.l := StrToInt(TextValue);
      PT_R4:
        Value.flt := StrToFloat(TextValue);
      PT_DOUBLE:
        Value.dbl := StrToFloat(TextValue);
      PT_BOOLEAN:
        Value.b := StrToInt(TextValue);
    else
      Result := False;
    end;
end;

function IsPropSimpleEditable(PropValue: TSPropValue): Boolean;
begin
  case PROP_TYPE(PropValue.ulPropTag) of
    PT_TSTRING, PT_I2, PT_LONG, PT_R4, PT_DOUBLE, PT_BOOLEAN:
      Result := True;
  else
    Result := False;
  end;
end;        

function SPropValueToTypeStr(PropValue: TSPropValue): string;
const
  TagNames: array[1..321] of record
    Tag: ULONG;
    Name: PChar
  end = (
    (Tag: PR_ENTRYID; Name: 'ENTRYID'),
    (Tag: PR_OBJECT_TYPE; Name: 'OBJECT_TYPE'),
    (Tag: PR_ICON; Name: 'ICON'),
    (Tag: PR_MINI_ICON; Name: 'MINI_ICON'),
    (Tag: PR_STORE_ENTRYID; Name: 'STORE_ENTRYID'),
    (Tag: PR_STORE_RECORD_KEY; Name: 'STORE_RECORD_KEY'),
    (Tag: PR_RECORD_KEY; Name: 'RECORD_KEY'),
    (Tag: PR_MAPPING_SIGNATURE; Name: 'MAPPING_SIGNATURE'),
    (Tag: PR_ACCESS_LEVEL; Name: 'ACCESS_LEVEL'),
    (Tag: PR_INSTANCE_KEY; Name: 'INSTANCE_KEY'),
    (Tag: PR_ROW_TYPE; Name: 'ROW_TYPE'),
    (Tag: PR_ACCESS; Name: 'ACCESS'),
    (Tag: PR_ROWID; Name: 'ROWID'),
    (Tag: PR_DISPLAY_NAME; Name: 'DISPLAY_NAME'),
    (Tag: PR_DISPLAY_NAME_W; Name: 'DISPLAY_NAME_W'),
    (Tag: PR_DISPLAY_NAME_A; Name: 'DISPLAY_NAME_A'),
    (Tag: PR_ADDRTYPE; Name: 'ADDRTYPE'),
    (Tag: PR_ADDRTYPE_W; Name: 'ADDRTYPE_W'),
    (Tag: PR_ADDRTYPE_A; Name: 'ADDRTYPE_A'),
    (Tag: PR_EMAIL_ADDRESS; Name: 'EMAIL_ADDRESS'),
    (Tag: PR_EMAIL_ADDRESS_W; Name: 'EMAIL_ADDRESS_W'),
    (Tag: PR_EMAIL_ADDRESS_A; Name: 'EMAIL_ADDRESS_A'),
    (Tag: PR_COMMENT; Name: 'COMMENT'),
    (Tag: PR_COMMENT_W; Name: 'COMMENT_W'),
    (Tag: PR_COMMENT_A; Name: 'COMMENT_A'),
    (Tag: PR_DEPTH; Name: 'DEPTH'),
    (Tag: PR_PROVIDER_DISPLAY; Name: 'PROVIDER_DISPLAY'),
    (Tag: PR_PROVIDER_DISPLAY_W; Name: 'PROVIDER_DISPLAY_W'),
    (Tag: PR_PROVIDER_DISPLAY_A; Name: 'PROVIDER_DISPLAY_A'),
    (Tag: PR_CREATION_TIME; Name: 'CREATION_TIME'),
    (Tag: PR_LAST_MODIFICATION_TIME; Name: 'LAST_MODIFICATION_TIME'),
    (Tag: PR_RESOURCE_FLAGS; Name: 'RESOURCE_FLAGS'),
    (Tag: PR_PROVIDER_DLL_NAME; Name: 'PROVIDER_DLL_NAME'),
    (Tag: PR_PROVIDER_DLL_NAME_W; Name: 'PROVIDER_DLL_NAME_W'),
    (Tag: PR_PROVIDER_DLL_NAME_A; Name: 'PROVIDER_DLL_NAME_A'),
    (Tag: PR_SEARCH_KEY; Name: 'SEARCH_KEY'),
    (Tag: PR_PROVIDER_UID; Name: 'PROVIDER_UID'),
    (Tag: PR_PROVIDER_ORDINAL; Name: 'PROVIDER_ORDINAL'),
    (Tag: PR_CONTAINER_FLAGS; Name: 'CONTAINER_FLAGS'),
    (Tag: PR_FOLDER_TYPE; Name: 'FOLDER_TYPE'),
    (Tag: PR_CONTENT_COUNT; Name: 'CONTENT_COUNT'),
    (Tag: PR_CONTENT_UNREAD; Name: 'CONTENT_UNREAD'),
    (Tag: PR_CREATE_TEMPLATES; Name: 'CREATE_TEMPLATES'),
    (Tag: PR_DETAILS_TABLE; Name: 'DETAILS_TABLE'),
    (Tag: PR_SEARCH; Name: 'SEARCH'),
    (Tag: PR_SELECTABLE; Name: 'SELECTABLE'),
    (Tag: PR_SUBFOLDERS; Name: 'SUBFOLDERS'),
    (Tag: PR_STATUS; Name: 'STATUS'),
    (Tag: PR_ANR; Name: 'ANR'),
    (Tag: PR_ANR_W; Name: 'ANR_W'),
    (Tag: PR_ANR_A; Name: 'ANR_A'),
    (Tag: PR_CONTENTS_SORT_ORDER; Name: 'CONTENTS_SORT_ORDER'),
    (Tag: PR_CONTAINER_HIERARCHY; Name: 'CONTAINER_HIERARCHY'),
    (Tag: PR_CONTAINER_CONTENTS; Name: 'CONTAINER_CONTENTS'),
    (Tag: PR_FOLDER_ASSOCIATED_CONTENTS; Name: 'FOLDER_ASSOCIATED_CONTENTS'),
    (Tag: PR_DEF_CREATE_DL; Name: 'DEF_CREATE_DL'),
    (Tag: PR_DEF_CREATE_MAILUSER; Name: 'DEF_CREATE_MAILUSER'),
    (Tag: PR_CONTAINER_CLASS; Name: 'CONTAINER_CLASS'),
    (Tag: PR_CONTAINER_CLASS_W; Name: 'CONTAINER_CLASS_W'),
    (Tag: PR_CONTAINER_CLASS_A; Name: 'CONTAINER_CLASS_A'),
    (Tag: PR_CONTAINER_MODIFY_VERSION; Name: 'CONTAINER_MODIFY_VERSION'),
    (Tag: PR_AB_PROVIDER_ID; Name: 'AB_PROVIDER_ID'),
    (Tag: PR_DEFAULT_VIEW_ENTRYID; Name: 'DEFAULT_VIEW_ENTRYID'),
    (Tag: PR_ASSOC_CONTENT_COUNT; Name: 'ASSOC_CONTENT_COUNT'),
    (Tag: PR_DISPLAY_TYPE; Name: 'DISPLAY_TYPE'),
    (Tag: PR_TEMPLATEID; Name: 'TEMPLATEID'),
    (Tag: PR_PRIMARY_CAPABILITY; Name: 'PRIMARY_CAPABILITY'),
    (Tag: PR_7BIT_DISPLAY_NAME; Name: '7BIT_DISPLAY_NAME'),
    (Tag: PR_ACCOUNT; Name: 'ACCOUNT'),
    (Tag: PR_ACCOUNT_W; Name: 'ACCOUNT_W'),
    (Tag: PR_ACCOUNT_A; Name: 'ACCOUNT_A'),
    (Tag: PR_ALTERNATE_RECIPIENT; Name: 'ALTERNATE_RECIPIENT'),
    (Tag: PR_CALLBACK_TELEPHONE_NUMBER; Name: 'CALLBACK_TELEPHONE_NUMBER'),
    (Tag: PR_CALLBACK_TELEPHONE_NUMBER_W; Name: 'CALLBACK_TELEPHONE_NUMBER_W'),
    (Tag: PR_CALLBACK_TELEPHONE_NUMBER_A; Name: 'CALLBACK_TELEPHONE_NUMBER_A'),
    (Tag: PR_CONVERSION_PROHIBITED; Name: 'CONVERSION_PROHIBITED'),
    (Tag: PR_DISCLOSE_RECIPIENTS; Name: 'DISCLOSE_RECIPIENTS'),
    (Tag: PR_GENERATION; Name: 'GENERATION'),
    (Tag: PR_GENERATION_W; Name: 'GENERATION_W'),
    (Tag: PR_GENERATION_A; Name: 'GENERATION_A'),
    (Tag: PR_GIVEN_NAME; Name: 'GIVEN_NAME'),
    (Tag: PR_GIVEN_NAME_W; Name: 'GIVEN_NAME_W'),
    (Tag: PR_GIVEN_NAME_A; Name: 'GIVEN_NAME_A'),
    (Tag: PR_GOVERNMENT_ID_NUMBER; Name: 'GOVERNMENT_ID_NUMBER'),
    (Tag: PR_GOVERNMENT_ID_NUMBER_W; Name: 'GOVERNMENT_ID_NUMBER_W'),
    (Tag: PR_GOVERNMENT_ID_NUMBER_A; Name: 'GOVERNMENT_ID_NUMBER_A'),
    (Tag: PR_BUSINESS_TELEPHONE_NUMBER; Name: 'BUSINESS_TELEPHONE_NUMBER'),
    (Tag: PR_BUSINESS_TELEPHONE_NUMBER_W; Name: 'BUSINESS_TELEPHONE_NUMBER_W'),
    (Tag: PR_BUSINESS_TELEPHONE_NUMBER_A; Name: 'BUSINESS_TELEPHONE_NUMBER_A'),
    (Tag: PR_OFFICE_TELEPHONE_NUMBER; Name: 'OFFICE_TELEPHONE_NUMBER'),
    (Tag: PR_OFFICE_TELEPHONE_NUMBER_W; Name: 'OFFICE_TELEPHONE_NUMBER_W'),
    (Tag: PR_OFFICE_TELEPHONE_NUMBER_A; Name: 'OFFICE_TELEPHONE_NUMBER_A'),
    (Tag: PR_HOME_TELEPHONE_NUMBER; Name: 'HOME_TELEPHONE_NUMBER'),
    (Tag: PR_HOME_TELEPHONE_NUMBER_W; Name: 'HOME_TELEPHONE_NUMBER_W'),
    (Tag: PR_HOME_TELEPHONE_NUMBER_A; Name: 'HOME_TELEPHONE_NUMBER_A'),
    (Tag: PR_INITIALS; Name: 'INITIALS'),
    (Tag: PR_INITIALS_W; Name: 'INITIALS_W'),
    (Tag: PR_INITIALS_A; Name: 'INITIALS_A'),
    (Tag: PR_KEYWORD; Name: 'KEYWORD'),
    (Tag: PR_KEYWORD_W; Name: 'KEYWORD_W'),
    (Tag: PR_KEYWORD_A; Name: 'KEYWORD_A'),
    (Tag: PR_LANGUAGE; Name: 'LANGUAGE'),
    (Tag: PR_LANGUAGE_W; Name: 'LANGUAGE_W'),
    (Tag: PR_LANGUAGE_A; Name: 'LANGUAGE_A'),
    (Tag: PR_LOCATION; Name: 'LOCATION'),
    (Tag: PR_LOCATION_W; Name: 'LOCATION_W'),
    (Tag: PR_LOCATION_A; Name: 'LOCATION_A'),
    (Tag: PR_MAIL_PERMISSION; Name: 'MAIL_PERMISSION'),
    (Tag: PR_MHS_COMMON_NAME; Name: 'MHS_COMMON_NAME'),
    (Tag: PR_MHS_COMMON_NAME_W; Name: 'MHS_COMMON_NAME_W'),
    (Tag: PR_MHS_COMMON_NAME_A; Name: 'MHS_COMMON_NAME_A'),
    (Tag: PR_ORGANIZATIONAL_ID_NUMBER; Name: 'ORGANIZATIONAL_ID_NUMBER'),
    (Tag: PR_ORGANIZATIONAL_ID_NUMBER_W; Name: 'ORGANIZATIONAL_ID_NUMBER_W'),
    (Tag: PR_ORGANIZATIONAL_ID_NUMBER_A; Name: 'ORGANIZATIONAL_ID_NUMBER_A'),
    (Tag: PR_SURNAME; Name: 'SURNAME'),
    (Tag: PR_SURNAME_W; Name: 'SURNAME_W'),
    (Tag: PR_SURNAME_A; Name: 'SURNAME_A'),
    (Tag: PR_ORIGINAL_ENTRYID; Name: 'ORIGINAL_ENTRYID'),
    (Tag: PR_ORIGINAL_DISPLAY_NAME; Name: 'ORIGINAL_DISPLAY_NAME'),
    (Tag: PR_ORIGINAL_DISPLAY_NAME_W; Name: 'ORIGINAL_DISPLAY_NAME_W'),
    (Tag: PR_ORIGINAL_DISPLAY_NAME_A; Name: 'ORIGINAL_DISPLAY_NAME_A'),
    (Tag: PR_ORIGINAL_SEARCH_KEY; Name: 'ORIGINAL_SEARCH_KEY'),
    (Tag: PR_POSTAL_ADDRESS; Name: 'POSTAL_ADDRESS'),
    (Tag: PR_POSTAL_ADDRESS_W; Name: 'POSTAL_ADDRESS_W'),
    (Tag: PR_POSTAL_ADDRESS_A; Name: 'POSTAL_ADDRESS_A'),
    (Tag: PR_COMPANY_NAME; Name: 'COMPANY_NAME'),
    (Tag: PR_COMPANY_NAME_W; Name: 'COMPANY_NAME_W'),
    (Tag: PR_COMPANY_NAME_A; Name: 'COMPANY_NAME_A'),
    (Tag: PR_TITLE; Name: 'TITLE'),
    (Tag: PR_TITLE_W; Name: 'TITLE_W'),
    (Tag: PR_TITLE_A; Name: 'TITLE_A'),
    (Tag: PR_DEPARTMENT_NAME; Name: 'DEPARTMENT_NAME'),
    (Tag: PR_DEPARTMENT_NAME_W; Name: 'DEPARTMENT_NAME_W'),
    (Tag: PR_DEPARTMENT_NAME_A; Name: 'DEPARTMENT_NAME_A'),
    (Tag: PR_OFFICE_LOCATION; Name: 'OFFICE_LOCATION'),
    (Tag: PR_OFFICE_LOCATION_W; Name: 'OFFICE_LOCATION_W'),
    (Tag: PR_OFFICE_LOCATION_A; Name: 'OFFICE_LOCATION_A'),
    (Tag: PR_PRIMARY_TELEPHONE_NUMBER; Name: 'PRIMARY_TELEPHONE_NUMBER'),
    (Tag: PR_PRIMARY_TELEPHONE_NUMBER_W; Name: 'PRIMARY_TELEPHONE_NUMBER_W'),
    (Tag: PR_PRIMARY_TELEPHONE_NUMBER_A; Name: 'PRIMARY_TELEPHONE_NUMBER_A'),
    (Tag: PR_BUSINESS2_TELEPHONE_NUMBER; Name: 'BUSINESS2_TELEPHONE_NUMBER'),
    (Tag: PR_BUSINESS2_TELEPHONE_NUMBER_W; Name: 'BUSINESS2_TELEPHONE_NUMBER_W'),
    (Tag: PR_BUSINESS2_TELEPHONE_NUMBER_A; Name: 'BUSINESS2_TELEPHONE_NUMBER_A'),
    (Tag: PR_OFFICE2_TELEPHONE_NUMBER; Name: 'OFFICE2_TELEPHONE_NUMBER'),
    (Tag: PR_OFFICE2_TELEPHONE_NUMBER_W; Name: 'OFFICE2_TELEPHONE_NUMBER_W'),
    (Tag: PR_OFFICE2_TELEPHONE_NUMBER_A; Name: 'OFFICE2_TELEPHONE_NUMBER_A'),
    (Tag: PR_MOBILE_TELEPHONE_NUMBER; Name: 'MOBILE_TELEPHONE_NUMBER'),
    (Tag: PR_MOBILE_TELEPHONE_NUMBER_W; Name: 'MOBILE_TELEPHONE_NUMBER_W'),
    (Tag: PR_MOBILE_TELEPHONE_NUMBER_A; Name: 'MOBILE_TELEPHONE_NUMBER_A'),
    (Tag: PR_CELLULAR_TELEPHONE_NUMBER; Name: 'CELLULAR_TELEPHONE_NUMBER'),
    (Tag: PR_CELLULAR_TELEPHONE_NUMBER_W; Name: 'CELLULAR_TELEPHONE_NUMBER_W'),
    (Tag: PR_CELLULAR_TELEPHONE_NUMBER_A; Name: 'CELLULAR_TELEPHONE_NUMBER_A'),
    (Tag: PR_RADIO_TELEPHONE_NUMBER; Name: 'RADIO_TELEPHONE_NUMBER'),
    (Tag: PR_RADIO_TELEPHONE_NUMBER_W; Name: 'RADIO_TELEPHONE_NUMBER_W'),
    (Tag: PR_RADIO_TELEPHONE_NUMBER_A; Name: 'RADIO_TELEPHONE_NUMBER_A'),
    (Tag: PR_CAR_TELEPHONE_NUMBER; Name: 'CAR_TELEPHONE_NUMBER'),
    (Tag: PR_CAR_TELEPHONE_NUMBER_W; Name: 'CAR_TELEPHONE_NUMBER_W'),
    (Tag: PR_CAR_TELEPHONE_NUMBER_A; Name: 'CAR_TELEPHONE_NUMBER_A'),
    (Tag: PR_OTHER_TELEPHONE_NUMBER; Name: 'OTHER_TELEPHONE_NUMBER'),
    (Tag: PR_OTHER_TELEPHONE_NUMBER_W; Name: 'OTHER_TELEPHONE_NUMBER_W'),
    (Tag: PR_OTHER_TELEPHONE_NUMBER_A; Name: 'OTHER_TELEPHONE_NUMBER_A'),
    (Tag: PR_TRANSMITABLE_DISPLAY_NAME; Name: 'TRANSMITABLE_DISPLAY_NAME'),
    (Tag: PR_TRANSMITABLE_DISPLAY_NAME_W; Name: 'TRANSMITABLE_DISPLAY_NAME_W'),
    (Tag: PR_TRANSMITABLE_DISPLAY_NAME_A; Name: 'TRANSMITABLE_DISPLAY_NAME_A'),
    (Tag: PR_PAGER_TELEPHONE_NUMBER; Name: 'PAGER_TELEPHONE_NUMBER'),
    (Tag: PR_PAGER_TELEPHONE_NUMBER_W; Name: 'PAGER_TELEPHONE_NUMBER_W'),
    (Tag: PR_PAGER_TELEPHONE_NUMBER_A; Name: 'PAGER_TELEPHONE_NUMBER_A'),
    (Tag: PR_BEEPER_TELEPHONE_NUMBER; Name: 'BEEPER_TELEPHONE_NUMBER'),
    (Tag: PR_BEEPER_TELEPHONE_NUMBER_W; Name: 'BEEPER_TELEPHONE_NUMBER_W'),
    (Tag: PR_BEEPER_TELEPHONE_NUMBER_A; Name: 'BEEPER_TELEPHONE_NUMBER_A'),
    (Tag: PR_USER_CERTIFICATE; Name: 'USER_CERTIFICATE'),
    (Tag: PR_PRIMARY_FAX_NUMBER; Name: 'PRIMARY_FAX_NUMBER'),
    (Tag: PR_PRIMARY_FAX_NUMBER_W; Name: 'PRIMARY_FAX_NUMBER_W'),
    (Tag: PR_PRIMARY_FAX_NUMBER_A; Name: 'PRIMARY_FAX_NUMBER_A'),
    (Tag: PR_BUSINESS_FAX_NUMBER; Name: 'BUSINESS_FAX_NUMBER'),
    (Tag: PR_BUSINESS_FAX_NUMBER_W; Name: 'BUSINESS_FAX_NUMBER_W'),
    (Tag: PR_BUSINESS_FAX_NUMBER_A; Name: 'BUSINESS_FAX_NUMBER_A'),
    (Tag: PR_HOME_FAX_NUMBER; Name: 'HOME_FAX_NUMBER'),
    (Tag: PR_HOME_FAX_NUMBER_W; Name: 'HOME_FAX_NUMBER_W'),
    (Tag: PR_HOME_FAX_NUMBER_A; Name: 'HOME_FAX_NUMBER_A'),
    (Tag: PR_COUNTRY; Name: 'COUNTRY'),
    (Tag: PR_COUNTRY_W; Name: 'COUNTRY_W'),
    (Tag: PR_COUNTRY_A; Name: 'COUNTRY_A'),
    (Tag: PR_LOCALITY; Name: 'LOCALITY'),
    (Tag: PR_LOCALITY_W; Name: 'LOCALITY_W'),
    (Tag: PR_LOCALITY_A; Name: 'LOCALITY_A'),
    (Tag: PR_STATE_OR_PROVINCE; Name: 'STATE_OR_PROVINCE'),
    (Tag: PR_STATE_OR_PROVINCE_W; Name: 'STATE_OR_PROVINCE_W'),
    (Tag: PR_STATE_OR_PROVINCE_A; Name: 'STATE_OR_PROVINCE_A'),
    (Tag: PR_STREET_ADDRESS; Name: 'STREET_ADDRESS'),
    (Tag: PR_STREET_ADDRESS_W; Name: 'STREET_ADDRESS_W'),
    (Tag: PR_STREET_ADDRESS_A; Name: 'STREET_ADDRESS_A'),
    (Tag: PR_POSTAL_CODE; Name: 'POSTAL_CODE'),
    (Tag: PR_POSTAL_CODE_W; Name: 'POSTAL_CODE_W'),
    (Tag: PR_POSTAL_CODE_A; Name: 'POSTAL_CODE_A'),
    (Tag: PR_POST_OFFICE_BOX; Name: 'POST_OFFICE_BOX'),
    (Tag: PR_POST_OFFICE_BOX_W; Name: 'POST_OFFICE_BOX_W'),
    (Tag: PR_POST_OFFICE_BOX_A; Name: 'POST_OFFICE_BOX_A'),
    (Tag: PR_BUSINESS_ADDRESS_POST_OFFICE_BOX; Name: 'BUSINESS_ADDRESS_POST_OFFICE_BOX'),
    (Tag: PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_W; Name: 'BUSINESS_ADDRESS_POST_OFFICE_BOX_W'),
    (Tag: PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_A; Name: 'BUSINESS_ADDRESS_POST_OFFICE_BOX_A'),
    (Tag: PR_TELEX_NUMBER; Name: 'TELEX_NUMBER'),
    (Tag: PR_TELEX_NUMBER_W; Name: 'TELEX_NUMBER_W'),
    (Tag: PR_TELEX_NUMBER_A; Name: 'TELEX_NUMBER_A'),
    (Tag: PR_ISDN_NUMBER; Name: 'ISDN_NUMBER'),
    (Tag: PR_ISDN_NUMBER_W; Name: 'ISDN_NUMBER_W'),
    (Tag: PR_ISDN_NUMBER_A; Name: 'ISDN_NUMBER_A'),
    (Tag: PR_ASSISTANT_TELEPHONE_NUMBER; Name: 'ASSISTANT_TELEPHONE_NUMBER'),
    (Tag: PR_ASSISTANT_TELEPHONE_NUMBER_W; Name: 'ASSISTANT_TELEPHONE_NUMBER_W'),
    (Tag: PR_ASSISTANT_TELEPHONE_NUMBER_A; Name: 'ASSISTANT_TELEPHONE_NUMBER_A'),
    (Tag: PR_HOME2_TELEPHONE_NUMBER; Name: 'HOME2_TELEPHONE_NUMBER'),
    (Tag: PR_HOME2_TELEPHONE_NUMBER_W; Name: 'HOME2_TELEPHONE_NUMBER_W'),
    (Tag: PR_HOME2_TELEPHONE_NUMBER_A; Name: 'HOME2_TELEPHONE_NUMBER_A'),
    (Tag: PR_ASSISTANT; Name: 'ASSISTANT'),
    (Tag: PR_ASSISTANT_W; Name: 'ASSISTANT_W'),
    (Tag: PR_ASSISTANT_A; Name: 'ASSISTANT_A'),
    (Tag: PR_SEND_RICH_INFO; Name: 'SEND_RICH_INFO'),
    (Tag: PR_WEDDING_ANNIVERSARY; Name: 'WEDDING_ANNIVERSARY'),
    (Tag: PR_BIRTHDAY; Name: 'BIRTHDAY'),
    (Tag: PR_HOBBIES; Name: 'HOBBIES'),
    (Tag: PR_HOBBIES_W; Name: 'HOBBIES_W'),
    (Tag: PR_HOBBIES_A; Name: 'HOBBIES_A'),
    (Tag: PR_MIDDLE_NAME; Name: 'MIDDLE_NAME'),
    (Tag: PR_MIDDLE_NAME_W; Name: 'MIDDLE_NAME_W'),
    (Tag: PR_MIDDLE_NAME_A; Name: 'MIDDLE_NAME_A'),
    (Tag: PR_DISPLAY_NAME_PREFIX; Name: 'DISPLAY_NAME_PREFIX'),
    (Tag: PR_DISPLAY_NAME_PREFIX_W; Name: 'DISPLAY_NAME_PREFIX_W'),
    (Tag: PR_DISPLAY_NAME_PREFIX_A; Name: 'DISPLAY_NAME_PREFIX_A'),
    (Tag: PR_PROFESSION; Name: 'PROFESSION'),
    (Tag: PR_PROFESSION_W; Name: 'PROFESSION_W'),
    (Tag: PR_PROFESSION_A; Name: 'PROFESSION_A'),
    (Tag: PR_PREFERRED_BY_NAME; Name: 'PREFERRED_BY_NAME'),
    (Tag: PR_PREFERRED_BY_NAME_W; Name: 'PREFERRED_BY_NAME_W'),
    (Tag: PR_PREFERRED_BY_NAME_A; Name: 'PREFERRED_BY_NAME_A'),
    (Tag: PR_SPOUSE_NAME; Name: 'SPOUSE_NAME'),
    (Tag: PR_SPOUSE_NAME_W; Name: 'SPOUSE_NAME_W'),
    (Tag: PR_SPOUSE_NAME_A; Name: 'SPOUSE_NAME_A'),
    (Tag: PR_COMPUTER_NETWORK_NAME; Name: 'COMPUTER_NETWORK_NAME'),
    (Tag: PR_COMPUTER_NETWORK_NAME_W; Name: 'COMPUTER_NETWORK_NAME_W'),
    (Tag: PR_COMPUTER_NETWORK_NAME_A; Name: 'COMPUTER_NETWORK_NAME_A'),
    (Tag: PR_CUSTOMER_ID; Name: 'CUSTOMER_ID'),
    (Tag: PR_CUSTOMER_ID_W; Name: 'CUSTOMER_ID_W'),
    (Tag: PR_CUSTOMER_ID_A; Name: 'CUSTOMER_ID_A'),
    (Tag: PR_TTYTDD_PHONE_NUMBER; Name: 'TTYTDD_PHONE_NUMBER'),
    (Tag: PR_TTYTDD_PHONE_NUMBER_W; Name: 'TTYTDD_PHONE_NUMBER_W'),
    (Tag: PR_TTYTDD_PHONE_NUMBER_A; Name: 'TTYTDD_PHONE_NUMBER_A'),
    (Tag: PR_FTP_SITE; Name: 'FTP_SITE'),
    (Tag: PR_FTP_SITE_W; Name: 'FTP_SITE_W'),
    (Tag: PR_FTP_SITE_A; Name: 'FTP_SITE_A'),
    (Tag: PR_GENDER; Name: 'GENDER'),
    (Tag: PR_MANAGER_NAME; Name: 'MANAGER_NAME'),
    (Tag: PR_MANAGER_NAME_W; Name: 'MANAGER_NAME_W'),
    (Tag: PR_MANAGER_NAME_A; Name: 'MANAGER_NAME_A'),
    (Tag: PR_NICKNAME; Name: 'NICKNAME'),
    (Tag: PR_NICKNAME_W; Name: 'NICKNAME_W'),
    (Tag: PR_NICKNAME_A; Name: 'NICKNAME_A'),
    (Tag: PR_PERSONAL_HOME_PAGE; Name: 'PERSONAL_HOME_PAGE'),
    (Tag: PR_PERSONAL_HOME_PAGE_W; Name: 'PERSONAL_HOME_PAGE_W'),
    (Tag: PR_PERSONAL_HOME_PAGE_A; Name: 'PERSONAL_HOME_PAGE_A'),
    (Tag: PR_BUSINESS_HOME_PAGE; Name: 'BUSINESS_HOME_PAGE'),
    (Tag: PR_BUSINESS_HOME_PAGE_W; Name: 'BUSINESS_HOME_PAGE_W'),
    (Tag: PR_BUSINESS_HOME_PAGE_A; Name: 'BUSINESS_HOME_PAGE_A'),
    (Tag: PR_CONTACT_VERSION; Name: 'CONTACT_VERSION'),
    (Tag: PR_CONTACT_ENTRYIDS; Name: 'CONTACT_ENTRYIDS'),
    (Tag: PR_CONTACT_ADDRTYPES; Name: 'CONTACT_ADDRTYPES'),
    (Tag: PR_CONTACT_ADDRTYPES_W; Name: 'CONTACT_ADDRTYPES_W'),
    (Tag: PR_CONTACT_ADDRTYPES_A; Name: 'CONTACT_ADDRTYPES_A'),
    (Tag: PR_CONTACT_DEFAULT_ADDRESS_INDEX; Name: 'CONTACT_DEFAULT_ADDRESS_INDEX'),
    (Tag: PR_CONTACT_EMAIL_ADDRESSES; Name: 'CONTACT_EMAIL_ADDRESSES'),
    (Tag: PR_CONTACT_EMAIL_ADDRESSES_W; Name: 'CONTACT_EMAIL_ADDRESSES_W'),
    (Tag: PR_CONTACT_EMAIL_ADDRESSES_A; Name: 'CONTACT_EMAIL_ADDRESSES_A'),
    (Tag: PR_COMPANY_MAIN_PHONE_NUMBER; Name: 'COMPANY_MAIN_PHONE_NUMBER'),
    (Tag: PR_COMPANY_MAIN_PHONE_NUMBER_W; Name: 'COMPANY_MAIN_PHONE_NUMBER_W'),
    (Tag: PR_COMPANY_MAIN_PHONE_NUMBER_A; Name: 'COMPANY_MAIN_PHONE_NUMBER_A'),
    (Tag: PR_CHILDRENS_NAMES; Name: 'CHILDRENS_NAMES'),
    (Tag: PR_CHILDRENS_NAMES_W; Name: 'CHILDRENS_NAMES_W'),
    (Tag: PR_CHILDRENS_NAMES_A; Name: 'CHILDRENS_NAMES_A'),
    (Tag: PR_HOME_ADDRESS_CITY; Name: 'HOME_ADDRESS_CITY'),
    (Tag: PR_HOME_ADDRESS_CITY_W; Name: 'HOME_ADDRESS_CITY_W'),
    (Tag: PR_HOME_ADDRESS_CITY_A; Name: 'HOME_ADDRESS_CITY_A'),
    (Tag: PR_HOME_ADDRESS_COUNTRY; Name: 'HOME_ADDRESS_COUNTRY'),
    (Tag: PR_HOME_ADDRESS_COUNTRY_W; Name: 'HOME_ADDRESS_COUNTRY_W'),
    (Tag: PR_HOME_ADDRESS_COUNTRY_A; Name: 'HOME_ADDRESS_COUNTRY_A'),
    (Tag: PR_HOME_ADDRESS_POSTAL_CODE; Name: 'HOME_ADDRESS_POSTAL_CODE'),
    (Tag: PR_HOME_ADDRESS_POSTAL_CODE_W; Name: 'HOME_ADDRESS_POSTAL_CODE_W'),
    (Tag: PR_HOME_ADDRESS_POSTAL_CODE_A; Name: 'HOME_ADDRESS_POSTAL_CODE_A'),
    (Tag: PR_HOME_ADDRESS_STATE_OR_PROVINCE; Name: 'HOME_ADDRESS_STATE_OR_PROVINCE'),
    (Tag: PR_HOME_ADDRESS_STATE_OR_PROVINCE_W; Name: 'HOME_ADDRESS_STATE_OR_PROVINCE_W'),
    (Tag: PR_HOME_ADDRESS_STATE_OR_PROVINCE_A; Name: 'HOME_ADDRESS_STATE_OR_PROVINCE_A'),
    (Tag: PR_HOME_ADDRESS_STREET; Name: 'HOME_ADDRESS_STREET'),
    (Tag: PR_HOME_ADDRESS_STREET_W; Name: 'HOME_ADDRESS_STREET_W'),
    (Tag: PR_HOME_ADDRESS_STREET_A; Name: 'HOME_ADDRESS_STREET_A'),
    (Tag: PR_HOME_ADDRESS_POST_OFFICE_BOX; Name: 'HOME_ADDRESS_POST_OFFICE_BOX'),
    (Tag: PR_HOME_ADDRESS_POST_OFFICE_BOX_W; Name: 'HOME_ADDRESS_POST_OFFICE_BOX_W'),
    (Tag: PR_HOME_ADDRESS_POST_OFFICE_BOX_A; Name: 'HOME_ADDRESS_POST_OFFICE_BOX_A'),
    (Tag: PR_OTHER_ADDRESS_CITY; Name: 'OTHER_ADDRESS_CITY'),
    (Tag: PR_OTHER_ADDRESS_CITY_W; Name: 'OTHER_ADDRESS_CITY_W'),
    (Tag: PR_OTHER_ADDRESS_CITY_A; Name: 'OTHER_ADDRESS_CITY_A'),
    (Tag: PR_OTHER_ADDRESS_COUNTRY; Name: 'OTHER_ADDRESS_COUNTRY'),
    (Tag: PR_OTHER_ADDRESS_COUNTRY_W; Name: 'OTHER_ADDRESS_COUNTRY_W'),
    (Tag: PR_OTHER_ADDRESS_COUNTRY_A; Name: 'OTHER_ADDRESS_COUNTRY_A'),
    (Tag: PR_OTHER_ADDRESS_POSTAL_CODE; Name: 'OTHER_ADDRESS_POSTAL_CODE'),
    (Tag: PR_OTHER_ADDRESS_POSTAL_CODE_W; Name: 'OTHER_ADDRESS_POSTAL_CODE_W'),
    (Tag: PR_OTHER_ADDRESS_POSTAL_CODE_A; Name: 'OTHER_ADDRESS_POSTAL_CODE_A'),
    (Tag: PR_OTHER_ADDRESS_STATE_OR_PROVINCE; Name: 'OTHER_ADDRESS_STATE_OR_PROVINCE'),
    (Tag: PR_OTHER_ADDRESS_STATE_OR_PROVINCE_W; Name: 'OTHER_ADDRESS_STATE_OR_PROVINCE_W'),
    (Tag: PR_OTHER_ADDRESS_STATE_OR_PROVINCE_A; Name: 'OTHER_ADDRESS_STATE_OR_PROVINCE_A'),
    (Tag: PR_OTHER_ADDRESS_STREET; Name: 'OTHER_ADDRESS_STREET'),
    (Tag: PR_OTHER_ADDRESS_STREET_W; Name: 'OTHER_ADDRESS_STREET_W'),
    (Tag: PR_OTHER_ADDRESS_STREET_A; Name: 'OTHER_ADDRESS_STREET_A'),
    (Tag: PR_OTHER_ADDRESS_POST_OFFICE_BOX; Name: 'OTHER_ADDRESS_POST_OFFICE_BOX'),
    (Tag: PR_OTHER_ADDRESS_POST_OFFICE_BOX_W; Name: 'OTHER_ADDRESS_POST_OFFICE_BOX_W'),
    (Tag: PR_OTHER_ADDRESS_POST_OFFICE_BOX_A; Name: 'OTHER_ADDRESS_POST_OFFICE_BOX_A'),
    (Tag: PR_USER_X509_CERTIFICATE; Name: 'USER_X509_CERTIFICATE'),
    (Tag: PR_SEND_INTERNET_ENCODING; Name: 'SEND_INTERNET_ENCODING'),
    (Tag: PR_BUSINESS_ADDRESS_CITY; Name: 'BUSINESS_ADDRESS_CITY'),
    (Tag: PR_BUSINESS_ADDRESS_COUNTRY; Name: 'BUSINESS_ADDRESS_COUNTRY'),
    (Tag: PR_BUSINESS_ADDRESS_POSTAL_CODE; Name: 'BUSINESS_ADDRESS_POSTAL_CODE'),
    (Tag: PR_BUSINESS_ADDRESS_STATE_OR_PROVINCE; Name: 'BUSINESS_ADDRESS_STATE_OR_PROVINCE'),
    (Tag: PR_BUSINESS_ADDRESS_STREET; Name: 'BUSINESS_ADDRESS_STREET'),
    (Tag: PR_RECIPIENT_TYPE; Name: 'RECIPIENT_TYPE')
      );
var
  I: Integer;
  PropID: ULONG;
begin
  Result := '';
  PropID := PROP_ID(PropValue.ulPropTag);
  for I := Low(TagNames) to High(TagNames) do
    if PROP_ID(TagNames[I].Tag) = PropID then
    begin
      Result := TagNames[I].Name;
      Break;
    end;
  if Result = '' then Result := Format('[%x]', [PropID]);
end;

const
  imgIndexUser = 0;
  imgIndexDL = 0;

{ TMainForm }

procedure TfrmCatalogoEnderecos.ClearLastDetails;
begin
  if FLastDetails <> nil then
  begin
//    DetailListView.Items.Count := 0;
    OleCheck(WabObject.FreeBuffer(FLastDetails));
    FreeSBinary(FLastDetailID);
    FLastDetails := nil;
    FLastDetailsCount := 0;
  end;
end;

procedure TfrmCatalogoEnderecos.CloseWabFile;
begin
  with AdrBookListView.Items do
  begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;
  ClearLastDetails;
  AddrBook := nil;
  WabObject := nil;
  Sleep(0);
end;

procedure TfrmCatalogoEnderecos.CreateNewEntry(ulObjectType: ULONG);
var
  WabEntryID, WabNewEntryID: PEntryID;
  WabEntryIDSize, WabNewEntryIDSize: ULONG;
  Wnd: ULONG;
  Res: HResult;
begin
  OleCheck(HrGetWABTemplateID(ulObjectType, WabEntryIDSize, WabEntryID));
  Wnd := Application.Handle;
  Res := AddrBook.NewEntry(Wnd, 0, 0, nil, WabEntryIDSize, WabEntryID,
    WabNewEntryIDSize, WabNewEntryID);
  if Res <> MAPI_E_USER_CANCEL then OleCheck(Res);
  LoadItems(True);
end;

procedure TfrmCatalogoEnderecos.DeleteEntry(EntryIDData: PSBinary);
var
  Container: IABContainer;
  WabEntryID: PEntryID;
  WabEntryIDSize, ObjType: ULONG;
  BinArray: TSBinaryArray;
begin
  OleCheck(AddrBook.GetPAB(WabEntryIDSize, WabEntryID));
  OleCheck(AddrBook.OpenEntry(WabEntryIDSize, WabEntryID, nil, 0, ObjType,
    IUnknown(Container)));
  BinArray.cValues := 1;
  BinArray.lpbin := EntryIDData;
  OleCheck(Container.DeleteEntries(PEntryList(@BinArray), 0));
  ClearLastDetails;
  OleCheck(WabObject.FreeBuffer(WabEntryID));
  LoadItems(True);
end;

procedure TfrmCatalogoEnderecos.FreeSBinary(var P: PSBinary);
begin
  if P = nil then Exit;
  FreeMem(P.lpb);
  Dispose(P);
  P := nil;
end;

procedure TfrmCatalogoEnderecos.FreeSRowSet(var P: PSRowSet);
var
  I: Integer;
begin
  for I := 0 to P^.cRows - 1 do
    OleCheck(WabObject.FreeBuffer(P^.aRow[I].lpProps));
  OleCheck(WabObject.FreeBuffer(P));
  P := nil;
end;

function TfrmCatalogoEnderecos.HrGetWABTemplateID(ulObjectType: ULONG;
  var lpcbEID: ULONG; var lppEID: PEntryId): HResult;
const
  CreateProps: record // SizedSPropTagArray macro
    Count: ULONG;
    Values: array[0..1] of ULONG;
  end = (
    Count: 2; Values: (PR_DEF_CREATE_MAILUSER, PR_DEF_CREATE_DL)
    );
var
  Container: IABContainer;
  WabEntryID: PEntryID;
  WabEntryIDSize, ObjType, NewProps: ULONG;
  CreateEIDs: PSPropsArray;
  PropsIndex: Integer;
begin
  CreateEIDs := nil;
  WabEntryID := nil;
  Result := MAPI_E_CALL_FAILED;
  try
    try
      if not (ulObjectType in [MAPI_MAILUSER, MAPI_DISTLIST]) then
      begin
        Result := MAPI_E_INVALID_PARAMETER;
        OleCheck(Result);
      end;
      Result := AddrBook.GetPAB(WabEntryIDSize, WabEntryID);
      OleCheck(Result);
      Result := AddrBook.OpenEntry(WabEntryIDSize, WabEntryID, nil, 0, ObjType,
        IUnknown(Container));
      OleCheck(Result);
      Result := Container.GetProps(@CreateProps, 0, @NewProps, PSPropValue(CreateEIDs));
      OleCheck(Result);

      case ulObjectType of
        MAPI_MAILUSER: PropsIndex := 0;
        MAPI_DISTLIST: PropsIndex := 1;
      else
        PropsIndex := -1;
      end;
      lpcbEID := CreateEIDs^[PropsIndex].Value.bin.cb;

      Result := WabObject.AllocateBuffer(lpcbEID, Pointer(lppEID));
      OleCheck(Result);
      CopyMemory(lppEID, CreateEIDs^[PropsIndex].Value.bin.lpb, lpcbEID);
    except
    end;
  finally
    if Assigned(CreateEIDs) then WabObject.FreeBuffer(CreateEIDs);
    Container := nil;
    if Assigned(WabEntryID) then WabObject.FreeBuffer(WabEntryID);
  end;
end;

procedure TfrmCatalogoEnderecos.LoadItems(RememberSelected: Boolean);
const
  TableColumns: record // SizedSPropTagArray macro
    Count: ULONG;
    Definition: array[0..4] of ULONG;
  end = (
    Count: 5;
    Definition:
      (PR_DISPLAY_NAME,
       PR_EMAIL_ADDRESS,
       PR_PERSONAL_HOME_PAGE,
       PR_ENTRYID,
       PR_OBJECT_TYPE);
   );
var
  Container: IABContainer;
  EntryID: PEntryID;
  EntryIDSize, ObjType: ULONG;
  Table: IMAPITable;
  TableRow: PSRowSet;
  EntryIDData: PSBinary;
  Item, LastSelectedItem: TListItem;

function IsLastDetailItem: Boolean;
var
  Res: ULONG;
begin
  Result := (FLastDetailID <> nil) and RememberSelected;
  if not Result then Exit;
  with FLastDetailID^ do
    OleCheck(AddrBook.CompareEntryIDs(EntryIDSize, EntryID, cb, PEntryID(lpb), 0, Res));
  Result := Res <> 0;
end;

begin
  LastSelectedItem := nil;

  OleCheck(AddrBook.GetPAB(EntryIDSize, EntryID));
  OleCheck(AddrBook.OpenEntry(EntryIDSize, EntryID, nil, 0,
    ObjType, IUnknown(Container)));
  OleCheck(WabObject.FreeBuffer(EntryID));

  OleCheck(Container.GetContentsTable(0, Table));
  OleCheck(Table.SetColumns(@TableColumns, 0));
  OleCheck(Table.SeekRow(BOOKMARK_BEGINNING, 0, nil));

  with AdrBookListView do
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      repeat
        OleCheck(Table.QueryRows(1, 0, TableRow));
        if TableRow.cRows > 0 then with TableRow^.aRow[0] do
        begin
          if ULONG(lpProps[4].Value.l) in [MAPI_MAILUSER, MAPI_DISTLIST] then
          begin
            EntryID := lpProps[3].Value.bin.lpb;
            EntryIDSize := lpProps[3].Value.bin.cb;

            OleCheck(WabObject.AllocateBuffer(Sizeof(TSBinary), Pointer(EntryIDData)));
            OleCheck(WabObject.AllocateMore(EntryIDSize, EntryIDData, Pointer(EntryIDData.lpb)));
            CopyMemory(EntryIDData.lpb, EntryID, EntryIDSize);
            EntryIDData^.cb := EntryIDSize;

            Item := Items.Add;
            with Item do
            begin
              Caption := SPropValueToStr(lpProps[0]);
              SubItems.Add(SPropValueToStr(lpProps[1]));
              SubItems.Add(SPropValueToStr(lpProps[2]));
              Data := EntryIDData;
              case ULONG(lpProps[4].Value.l) of
                MAPI_MAILUSER:
                  ImageIndex := imgIndexUser;
                MAPI_DISTLIST:
                  ImageIndex := imgIndexDL;
              end;
            end;
            if IsLastDetailItem then LastSelectedItem := Item;
          end;
          FreeSRowSet(TableRow);
        end else Break;
      until False;

//      StatusBar.Panels[0].Text := Format('%d items', [Items.Count]);
      ClearLastDetails;
      Selected := LastSelectedItem;
      if Selected <> nil then Selected.MakeVisible(False);
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TfrmCatalogoEnderecos.OpenCopyOfFileName(const FileName: TFileName; CreateCopy: Boolean);
var
  CopyOfFile: TFileName;
begin
  if CreateCopy then
  begin
    CopyOfFile := Format('%s\CopyOf%s', [
      ExcludeTrailingBackslash(ExtractFilePath(FileName)), ExtractFileName(FileName)]);
    Win32Check(CopyFile(PChar(FileName), PChar(CopyOfFile), False));
  end else
    CopyOfFile := FileName;
  OpenWabFile(CopyOfFile);
  LoadItems(False);
end;

procedure TfrmCatalogoEnderecos.OpenWabFile(const FileName: TFileName);
var
  WP: TWabParam;
begin
  CloseWabFile;

  ZeroMemory(@WP, Sizeof(WP));
  WP.cbSize := Sizeof(WP);
  WP.szFileName := PChar(FileName);
  WP.hwnd := Application.Handle;
  OleCheck(WabOpen(AddrBook, WabObject, @WP, 0));

//  StatusBar.Panels[1].Text := FileName;
  FFileName := FileName;
end;

procedure TfrmCatalogoEnderecos.ReadDetails(EntryIDData: PSBinary);
var
  MailUser: IMailUser;
  ObjType: ULONG;
begin
  ClearLastDetails;
  if EntryIDData = nil then Exit;
  ObjType := 0;
  with EntryIDData^ do
  begin
    New(FLastDetailID);
    FLastDetailID.cb := cb;
    GetMem(FLastDetailID.lpb, cb);
    CopyMemory(FLastDetailID.lpb, lpb, cb);
    OleCheck(AddrBook.OpenEntry(cb, lpb, nil, 0, ObjType, IUnknown(MailUser)));
  end;
  OleCheck(MailUser.GetProps(nil, 0, @FLastDetailsCount, PSPropValue(FLastDetails)));
//  DetailListView.Items.Count := FLastDetailsCount;
//  DetailListView.Invalidate;
end;

function TfrmCatalogoEnderecos.SetCurrentPropValue: Boolean;
var
  PropValue: TSPropValue;
  TextValue: string;
  MailUser: IMailUser;
  ObjType: ULONG;
  SPTA: TSPropTagArray;
begin
  Result := False;
//  PropValue := FLastDetails[DetailListView.Selected.Index];
  TextValue := SPropValueToStr(PropValue);
  if InputQuery('Edit value (empty string means delete)', SPropValueToTypeStr(PropValue), TextValue) then
  begin
    with FLastDetailID^ do
      OleCheck(AddrBook.OpenEntry(cb, lpb, nil, MAPI_MODIFY, ObjType, IUnknown(MailUser)));
    SPTA.cValues := 1;
    SPTA.aulPropTag[0] := PropValue.ulPropTag;
    OleCheck(MailUser.DeleteProps(@SPTA, nil));
    TextValue := Trim(TextValue);
    if Length(TextValue) > 0 then
    begin
      StrToSPropValue(TextValue, PropValue);
      OleCheck(MailUser.SetProps(1, @PropValue, nil));
    end;
    OleCheck(MailUser.SaveChanges(0));
    Result := True;
  end;
end;

procedure TfrmCatalogoEnderecos.FormCreate(Sender: TObject);
begin
  if not WabApiLoaded then
    raise Exception.Create('Error loading WAB API');
//  GetRegStringValue('HKEY_LOCAL_MACHINE\Software\Microsoft\WAB\WAB4\Wab File Name','Padrão');
  OpenCopyOfFileName( GetRegStringValue('HKEY_LOCAL_MACHINE\Software\Microsoft\WAB\WAB4\Wab File Name','Padrão'), False);
  // 'C:\Documents and Settings\vitor.zanin\Dados de aplicativos\Microsoft\Address Book\vitor_zanin.wab', False);
end;

procedure TfrmCatalogoEnderecos.FormDestroy(Sender: TObject);
begin
  CloseWabFile;
end;

procedure TfrmCatalogoEnderecos.Open1Execute(Sender: TObject);
begin
//  with OpenDialog do
//  begin
//    FileName := '';
//    if Execute then OpenCopyOfFileName(FileName, ofReadOnly in Options);
//  end;
end;

procedure TfrmCatalogoEnderecos.AdrBookListViewDeletion(Sender: TObject; Item: TListItem);
begin
  OleCheck(WabObject.FreeBuffer(PSBinary(Item.Data)));
end;

procedure TfrmCatalogoEnderecos.Properties1Update(Sender: TObject);
begin
  TAction(Sender).Enabled := (AdrBookListView.Selected <> nil);
end;

procedure TfrmCatalogoEnderecos.AdrBookListViewDblClick(Sender: TObject);
begin

//  Properties1.Execute;
  vMailSelecionado := Trim(AdrBookListView.Selected.SubItems.Text);
  Close;
end;

procedure TfrmCatalogoEnderecos.DetailListViewData(Sender: TObject; Item: TListItem);
begin
  with Item do
  begin
    Caption := IntToStr(Index);
    SubItems.Add(SPropValueToTypeStr(FLastDetails[Index]));
    SubItems.Add(SPropValueToStr(FLastDetails[Index]));
    Data := Pointer(IsPropSimpleEditable(FLastDetails[Index]));
  end;
end;

procedure TfrmCatalogoEnderecos.AdrBookListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
    ReadDetails(AdrBookListView.Selected.Data);
end;

procedure TfrmCatalogoEnderecos.Exit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCatalogoEnderecos.Find1Update(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(AddrBook);
end;

procedure TfrmCatalogoEnderecos.Find1Execute(Sender: TObject);
begin
  OleCheck(WabObject.Find(AddrBook, Handle));
end;

procedure TfrmCatalogoEnderecos.Delete1Execute(Sender: TObject);
begin
  with Application do
    if MessageBox('Delete ?', PChar(Caption),
      MB_ICONEXCLAMATION or MB_YESNO or MB_DEFBUTTON2) = ID_YES then
      DeleteEntry(AdrBookListView.Selected.Data);
end;

procedure TfrmCatalogoEnderecos.OpenDialogShow(Sender: TObject);
begin
  SetDlgItemText(GetParent(TOpenDialog(Sender).Handle), chx1, 'Open a copy of file');
end;

procedure TfrmCatalogoEnderecos.About1Execute(Sender: TObject);
begin
//  ShowAboutBox;
end;

procedure TfrmCatalogoEnderecos.AdrBookListViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.ImageIndex = imgIndexDL then Sender.Canvas.Font.Style := [fsBold];
end;

procedure TfrmCatalogoEnderecos.NewUser1Execute(Sender: TObject);
begin
  CreateNewEntry(MAPI_MAILUSER);
end;

procedure TfrmCatalogoEnderecos.EditValue1Update(Sender: TObject);
begin
//  TAction(Sender).Enabled := Assigned(AddrBook) and (ActiveControl = DetailListView)
//    and (DetailListView.Selected <> nil) and Boolean(DetailListView.Selected.Data);
end;

procedure TfrmCatalogoEnderecos.DetailListViewDblClick(Sender: TObject);
begin
//  EditValue1.Execute;
end;

procedure TfrmCatalogoEnderecos.EditValue1Execute(Sender: TObject);
begin
  if SetCurrentPropValue then LoadItems(True);
end;

procedure TfrmCatalogoEnderecos.DetailListViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Boolean(Item.Data) then Sender.Canvas.Font.Style := [fsBold];
end;

procedure TfrmCatalogoEnderecos.SpeedButton1Click(Sender: TObject);
begin
  vMailSelecionado := '';
  Close;
end;

procedure TfrmCatalogoEnderecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCatalogoEnderecos.AdrBookListViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
    AdrBookListViewDblClick(nil);
end;

procedure TfrmCatalogoEnderecos.FormShow(Sender: TObject);
begin
  AdrBookListView.SetFocus;
end;

procedure TfrmCatalogoEnderecos.Edit1Change(Sender: TObject);
//var S : Array[0..255] of Char;

begin
//  StrPCopy(S, Edit1.Text);
//  AdrBookListView.ItemIndex := SendMessage(hWnd, LVM_FINDITEM, iStart, Longint(@plvfi));
//  AdrBookListView.FindCaption(0,S,False,True,True);
//  AdrBookListView.GetSearchString;
//  AdrBookListView.GetNearestItem(0,S@,True,True);

end;

end.

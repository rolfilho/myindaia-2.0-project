{******************************************************************}
{                                                                  }
{ Borland Delphi Runtime Library                                   }
{ Windows Address Book (WAB) functions interface unit              }
{                                                                  }
{ Portions created by Microsoft are                                }
{ Copyright (C) 1995-2000 Microsoft Corporation.                   }
{ All Rights Reserved.                                             }
{                                                                  }
{ The original file is: wabiab.h, released 31 Jan 2000.            }
{ The original Pascal code is: WabIab.pas, released 15 Mar 2000.   }
{ The initial developer of the Pascal code is Petr Vones           }
{ (petr.v@mujmail.cz).                                             }
{                                                                  }
{ Portions created by Petr Vones are                               }
{ Copyright (C) 2000 Petr Vones                                    }
{                                                                  }
{ Obtained through:                                                }
{                                                                  }
{ Joint Endeavour of Delphi Innovators (Project JEDI)              }
{                                                                  }
{ You may retrieve the latest version of this file at the Project  }
{ JEDI home page, located at http://delphi-jedi.org                }
{                                                                  }
{ The contents of this file are used with permission, subject to   }
{ the Mozilla Public License Version 1.1 (the "License"); you may  }
{ not use this file except in compliance with the License. You may }
{ obtain a copy of the License at                                  }
{ http://www.mozilla.org/MPL/MPL-1.1.html                          }
{                                                                  }
{ Software distributed under the License is distributed on an      }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or   }
{ implied. See the License for the specific language governing     }
{ rights and limitations under the License.                        }
{                                                                  }
{******************************************************************}

unit WabIab;

interface

uses
  Windows, ActiveX, WabDefs;

{$I WAB.INC}  

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

(*$HPPEMIT '#include <wabiab.h>'*)

{ CreateOneOff *}
//****** MAPI_UNICODE			((ULONG) 0x80000000) */
//****** MAPI_SEND_NO_RICH_INFO		((ULONG) 0x00010000) */

{ RecipOptions }
//****** MAPI_UNICODE			((ULONG) 0x80000000) */

{ QueryDefaultRecipOpt }
//****** MAPI_UNICODE			((ULONG) 0x80000000) */

{ GetSearchPath }
//****** MAPI_UNICODE			((ULONG) 0x80000000) */

const

{ These are WAB only flags for IAdrBook::ResolveName }

//      MAPI_UNICODE                        ((ULONG) 0x80000000)
  WAB_RESOLVE_LOCAL_ONLY                = ULONG($80000000);
  {$EXTERNALSYM WAB_RESOLVE_LOCAL_ONLY}
  WAB_RESOLVE_ALL_EMAILS                = ULONG($40000000);
  {$EXTERNALSYM WAB_RESOLVE_ALL_EMAILS}
  WAB_RESOLVE_NO_ONE_OFFS               = ULONG($20000000);
  {$EXTERNALSYM WAB_RESOLVE_NO_ONE_OFFS}
  WAB_RESOLVE_NEED_CERT                 = ULONG($10000000);
  {$EXTERNALSYM WAB_RESOLVE_NEED_CERT}
  WAB_RESOLVE_NO_NOT_FOUND_UI           = ULONG($08000000);
  {$EXTERNALSYM WAB_RESOLVE_NO_NOT_FOUND_UI}
  WAB_RESOLVE_USE_CURRENT_PROFILE       = ULONG($04000000);
  {$EXTERNALSYM WAB_RESOLVE_USE_CURRENT_PROFILE}
  WAB_RESOLVE_FIRST_MATCH               = ULONG($02000000);
  {$EXTERNALSYM WAB_RESOLVE_FIRST_MATCH}
  WAB_RESOLVE_UNICODE                   = ULONG($01000000);
  {$EXTERNALSYM WAB_RESOLVE_UNICODE}
//      MAPI_DIALOG                         ((ULONG) 0x00000008)

type
  IAddrBook = interface(IMAPIProp)
    function OpenEntry(cbEntryID: ULONG; lpEntryID: PEntryID; lpInterface: PIID;
      ulFlags: ULONG; var lpulObjType: ULONG; out lppUnk: IUnknown): HResult; stdcall;
    function CompareEntryIDs(cbEntryID1: ULONG; lpEntryID1: PEntryID;
      cbEntryID2: ULONG; lpEntryID2: PEntryID; ulFlags: ULONG;
      var lpulResult: ULONG): HResult; stdcall;
    function Advise(cbEntryID: ULONG; lpEntryID: PEntryID; ulEventMask: ULONG;
      lpAdviseSink: IMAPIAdviseSink; var lpulConnection: ULONG): HResult; stdcall;
    function Unadvise(ulConnection: ULONG): HResult; stdcall;
    function CreateOneOff(lpszName, lpszAdrType, lpszAddress: LPTSTR; ulFlags: ULONG;
      var lpcbEntryID: ULONG; var lppEntryID: PEntryID): HResult; stdcall;
    function NewEntry(ulUIParam, ulFlags, cbEIDContainer: ULONG;
      lpEIDContainer: PEntryID; cbEIDNewEntryTpl: ULONG; lpEIDNewEntryTpl: PEntryID;
      var lpcbEIDNewEntry: ULONG; var lppEIDNewEntry: PEntryID): HResult; stdcall;
    function ResolveName(ulUIParam, ulFlags: ULONG; lpszNewEntryTitle: LPTSTR;
      var lpAdrList: PAdrList): HResult; stdcall;
    function Address(var lpulUIParam: ULONG; lpAdrParms: PAdrParam;
      var lppAdrList: PAdrList): HResult; stdcall;
    function Details(var lpulUIParam: ULONG; lpfnDismiss: PFnDismiss;
      lpvDismissContext: Pointer; cbEntryID: ULONG; lpEntryID: PEntryID;
      lpfButtonCallback: PFnButton; lpvButtonContext: Pointer; lpszButtonText: LPTSTR;
      ulFlags: ULONG): HResult; stdcall;
    function RecipOptions(ulUIParam, ulFlags: ULONG; lpRecip: PAdrEntry): HResult; stdcall;
    function QueryDefaultRecipOpt(lpszAdrType: LPTSTR; ulFlags: ULONG;
      var lpcValues: ULONG; var lppOptions: PSPropValue): HResult; stdcall;
    function GetPAB(var lpcbEntryID: ULONG; var lppEntryID: PEntryID): HResult; stdcall;
    function SetPAB(cbEntryID: ULONG; lpEntryID: PEntryID): HResult; stdcall;
    function GetDefaultDir(var lpcbEntryID: ULONG; var lppEntryID: PEntryID): HResult; stdcall;
    function SetDefaultDir(cbEntryID: ULONG; lpEntryID: PEntryID): HResult; stdcall;
    function GetSearchPath(ulFlags: ULONG; var lppSearchPath: PSRowSet): HResult; stdcall;
    function SetSearchPath(ulFlags: ULONG; lpSearchPath: PSRowSet): HResult; stdcall;
    function PrepareRecips(ulFlags: ULONG; lpPropTagArray: PSPropTagArray;
      lpRecipList: PSPropTagArray): HResult; stdcall;
  end;
  {$EXTERNALSYM IAddrBook}

implementation

end.

{******************************************************************}
{                                                                  }
{ Borland Delphi Runtime Library                                   }
{ Windows Address Book (WAB) functions interface unit              }
{                                                                  }
{ Portions created by Microsoft are                                }
{ Copyright (C) 1995-2000 Microsoft Corporation.                   }
{ All Rights Reserved.                                             }
{                                                                  }
{ The original file is: wabmem.h, released 31 Jan 2000.            }
{ The original Pascal code is: WabMem.pas, released 15 Mar 2000.   }
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

unit WabMem;

interface

uses
  Windows, ActiveX, WabApi;

{$I WAB.INC}

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

(*$HPPEMIT '#include <wabmem.h>'*)

type
  PMapiAllocateBuffer = ^TMapiAllocateBuffer;
  MAPIALLOCATEBUFFER = function (cbSize: ULONG; var lppBuffer: Pointer): SCODE; stdcall;
  {$EXTERNALSYM MAPIALLOCATEBUFFER}
  TMapiAllocateBuffer = MAPIALLOCATEBUFFER;

  PMapiAllocateMore = ^TMapiAllocateMore;
  MAPIALLOCATEMORE = function (cbSize: ULONG; lpObject: Pointer;
    var lppBuffer: Pointer): SCODE; stdcall;
  {$EXTERNALSYM MAPIALLOCATEMORE}
  TMapiAllocateMore = MAPIALLOCATEMORE;

  PMapiFreeBuffer = ^TMapiFreeBuffer;
  MAPIFREEBUFFER = function (lpBuffer: Pointer): SCODE; stdcall;
  {$EXTERNALSYM MAPIFREEBUFFER}
  TMapiFreeBuffer = MAPIFREEBUFFER;

  PWabAllocateBuffer = ^TWabAllocateBuffer;
  WABALLOCATEBUFFER = function (lpWABObject: IWabObject; cbSize: ULONG;
    var lppBuffer: Pointer): SCODE; stdcall;
  {$EXTERNALSYM WABALLOCATEBUFFER}
  TWabAllocateBuffer = WABALLOCATEBUFFER;

  PWabAllocateMore = ^TWabAllocateMore;
  WABALLOCATEMORE = function (lpWABObject: IWabObject; cbSize: ULONG;
    lpObject: Pointer; var lppBuffer: Pointer): SCODE; stdcall;
  {$EXTERNALSYM WABALLOCATEMORE}
  TWabAllocateMore = WABALLOCATEMORE;

  PWabFreeBuffer = ^TWabFreeBuffer;
  WABFREEBUFFER = function (lpWABObject: IWabObject; lppBuffer: Pointer): SCODE; stdcall;
  {$EXTERNALSYM WABFREEBUFFER}
  TWabFreeBuffer = WABFREEBUFFER;

implementation

end.

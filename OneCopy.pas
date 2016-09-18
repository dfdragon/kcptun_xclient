unit OneCopy;

interface

//** Converted with Mida BASIC 275     http://www.midaconverter.com



uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IniFiles,
  Data.DB,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Menus,
  FMX.Grid,
  FMX.ExtCtrls,
  FMX.ListBox,
  FMX.TreeView,
  FMX.Memo,
  FMX.TabControl,
  FMX.Layouts,
  FMX.Edit,
  FMX.Platform,
  FMX.Bind.DBEngExt,
  FMX.Bind.Editors,
  FMX.Bind.DBLinks,
  FMX.Bind.Navigator,
  Data.Bind.EngExt,
  Data.Bind.Components,
  Data.Bind.DBScope,
  Data.Bind.DBLinks,
  Datasnap.DBClient,
  Fmx.Bind.Grid,
  System.Rtti,
  System.Bindings.Outputs,
  Data.Bind.Grid,
  Fmx.StdCtrls,
  FMX.Header,
  FMX.Graphics,

  Macapi.AppKit, Macapi.Foundation, Macapi.Helpers;

//**   Original VCL Uses section : 


//**   Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
//**   ComCtrls, ExtCtrls, StdCtrls;


//const
//  MI_QueryWindowHandle = 1;
//  MI_RespondWindowHandle = 2;
//
//  MI_Error_None = 0;
//  MI_Error_FailSubClass = 1;
//  MI_Error_CreatingMutex = 2;
//
const
  UniqueAppStr = 'kcptun_xclient';

//var
//  MessageID: Integer;
//  WProc: TFNWndProc;
//  MutHandle: THandle;
//  MIError: Integer;

procedure InitInstance;

implementation

procedure GetRunningApplications(Applist: TStringlist);
var
  fWorkSpace: NSWorkSpace;
  list: NSArray;
  i: Integer;
  lItem: NSDictionary;
  key, value: NSString;
begin
  fWorkSpace:= TNsWorkspace.Wrap(TNsWorkSpace.OCClass.sharedWorkspace);
  list:= fWorkspace.launchedApplications;
  if (List <> nil) and (List.count > 0) then
  begin
    for i := 0 to list.count - 1 do
      begin
        lItem:= TNSDictionary.Wrap(List.objectAtIndex(i));
//        key:= NSSTR(String(PAnsiChar(UTF8Encode('NSApplicationBundleIdentifier'))));
        key:= StrToNSStr(String(PAnsiChar(UTF8Encode('NSApplicationBundleIdentifier'))));
        // You can also use NSApplicationPath or NSApplicationName
        value:= TNSString.Wrap(lItem.valueForKey(key));
        Applist.Add(String(value.UTF8String));
      end;
  end;
end;

procedure InitInstance;
var
  Applist: TStringlist;
  i: Integer;
  isFind: Boolean;
begin
  Applist:= TStringlist.Create;
  try
    GetRunningApplications(Applist);
    isFind:= Applist.Find(UniqueAppStr, i);
  finally
    Applist.Free;
  end;

  if isFind then
    Halt;
end;

end.

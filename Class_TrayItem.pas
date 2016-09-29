unit Class_TrayItem;

interface

uses
  Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.Foundation, Macapi.AppKit, FMX.Dialogs, System.SysUtils,
  Macapi.Helpers, Macapi.ObjcRuntime, System.TypInfo, FMX.Platform, FMX.Platform.Mac;

type
  TFMXTrayItem = class(TOCLocal)
  private
    NSStatItem: NSStatusItem;
  public
    constructor Create;
    destructor Destroy; override;
    function GetObjectiveCClass: PTypeInfo; override;
    procedure Menu_Show; cdecl;
    procedure Menu_StartAll; cdecl;
    procedure Menu_StopAll; cdecl;
    procedure Menu_Exit; cdecl;
  end;

  IFMXTrayItem = interface(NSObject)
    ['{A21A057E-E8C9-4417-A9B3-CF8B84FB72DB}']
    procedure Menu_Show; cdecl;
    procedure Menu_StartAll; cdecl;
    procedure Menu_StopAll; cdecl;
    procedure Menu_Exit; cdecl;
  end;

implementation

uses
  Main, PublicVar;

constructor TFMXTrayItem.Create;
var
  NSContMenu: NSMenu;
  NSContItem_Show, NSContItem_StartAll, NSContItem_StopAll, NSContItem_Exit: NSMenuItem;
  NSStatBar: NSStatusBar;
  NSImg: NSImage;
  AppBundle: NSBundle;
  NSpImg: Pointer;
  Path: String;
begin
  inherited Create;

  NSStatBar:= TNSStatusBar.Create;
  NSStatBar:= TNSStatusBar.Wrap(TNSStatusBar.OCClass.systemStatusBar);
  NSStatItem:= NSStatBar.statusItemWithLength(NSVariableStatusItemLength);
  NSStatItem.setTarget(GetObjectID);

  // Create context menu
  NSContMenu:= TNSMenu.Create;
  NSContMenu:= TNSMenu.Wrap(NSContMenu.initWithTitle(StrToNSStr('kcptun_xclient')));
  try
    NSContItem_Show:= TNSMenuItem.Create;
    try
      NSContItem_Show:= TNSMenuItem.Wrap(NSContItem_Show.initWithTitle(StrToNSStr('显示'),
        sel_getUid(PAnsiChar('Menu_Show')), StrToNSStr('')));
      NSContItem_Show.setTarget(GetObjectID);
      NSContMenu.addItem(NSContItem_Show);
    finally
      NSContItem_Show.release;
    end;

    NSContItem_StartAll:= TNSMenuItem.Create;
    try
      NSContItem_StartAll:= TNSMenuItem.Wrap(NSContItem_StartAll.initWithTitle(StrToNSStr('全部启动'),
        sel_getUid(PAnsiChar('Menu_StartAll')), StrToNSStr('')));
      NSContItem_StartAll.setTarget(GetObjectID);
      NSContMenu.addItem(NSContItem_StartAll);
    finally
      NSContItem_StartAll.release;
    end;

    NSContItem_StopAll:= TNSMenuItem.Create;
    try
      NSContItem_StopAll:= TNSMenuItem.Wrap(NSContItem_StopAll.initWithTitle(StrToNSStr('全部停止'),
        sel_getUid(PAnsiChar('Menu_StopAll')), StrToNSStr('')));
      NSContItem_StopAll.setTarget(GetObjectID);
      NSContMenu.addItem(NSContItem_StopAll);
    finally
      NSContItem_StopAll.release;
    end;

    NSContItem_Exit:= TNSMenuItem.Create;
    try
      NSContItem_Exit:= TNSMenuItem.Wrap(NSContItem_Exit.initWithTitle(StrToNSStr('退出'),
        sel_getUid(PAnsiChar('Menu_Exit')), StrToNSStr('')));
      NSContItem_Exit.setTarget(GetObjectID);
      NSContMenu.addItem(NSContItem_Exit);
    finally
      NSContItem_Exit.release;
    end;

    // Add menu
    NSStatItem.retain;
    NSStatItem.setHighlightMode(true);
    NSStatItem.setMenu(NSContMenu);
  finally
    NSContMenu.release;
  end;

  // Get path to dir
  AppBundle:= TNSBundle.Wrap(TNSBundle.OCClass.mainBundle);
  Path:= AppBundle.bundlePath.UTF8String + '/Contents/Resources/k.png';
  NSpImg:= TNSImage.Alloc.initWithContentsOfFile(StrToNSStr(Path));

  // Create Icon
  NSImg:= TNSImage.Create;
  NSImg:= TNSImage.Wrap(NSpImg);
  NSStatItem.setImage(NSImg);
  NSImg.release;
end;

destructor TFMXTrayItem.Destroy;
begin
  NSStatItem.release;
  inherited;
end;

function TFMXTrayItem.GetObjectiveCClass: PTypeInfo;
begin
  Result:= TypeInfo(IFMXTrayItem);
end;

procedure TFMXTrayItem.Menu_Show;
begin
  FMain.Show;
end;

procedure TFMXTrayItem.Menu_StartAll;
begin
  FMain.Btn_StartAllClick(FMain);
end;

procedure TFMXTrayItem.Menu_StopAll;
begin
  FMain.Btn_StopAllClick(FMain);
end;

procedure TFMXTrayItem.Menu_Exit;
begin
  PublicVar.CanCloseMain:= True;
  FMain.Close;
end;

end.

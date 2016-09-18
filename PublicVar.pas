unit PublicVar;

interface

//** Converted with Mida BASIC 275     http://www.midaconverter.com



uses
  Xml.XMLIntf, Xml.XMLDoc,

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
  FMX.Graphics;

//**   Original VCL Uses section : 


//**   Winapi.Messages, Xml.XMLIntf, Xml.XMLDoc;

const
//  WM_PHOTO = WM_USER + 7788;
//  WM_DOSCOMMANDSTOP = WM_USER + 9527;

  SelfUpdateURL = 'https://github.com/dfdragon/kcptun_gclient/releases';
  IssuesURL = 'https://github.com/dfdragon/kcptun_gclient';
  KcpTunClientDownloadURL = 'https://github.com/xtaci/kcptun/releases';

var
  FileVer: string;

  XMLDocument_Para: TXMLDocument;

  ParaXMLPathName: string;
  MainNode, ProgramNode, ClientNodes: IXMLNode;

  CanModifyXML: Boolean;
  AutoStart: Integer;
  Minimize: Integer;
  ClientEXEDir: string;

  CanFoucs: Boolean;
  ModeCanFouse: Boolean;

implementation

end.

unit PublicFun;

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

  Macapi.Foundation, Macapi.Helpers,

  Xml.XMLIntf, Xml.XMLDoc, Macapi.CoreFoundation;

//**   Original VCL Uses section : 


//**   Xml.XMLIntf, Xml.XMLDoc, Winapi.Windows, Vcl.Forms, System.Win.Registry;

procedure CreateBlankParaXML(ParaXMLPathName: string);
procedure RepaireParaXML(ParaXMLPathName: string);
//procedure WriteREGAutoRun(AutoStart: Integer; FileFullName: string);
function GetAppVersionStr: string;

implementation

procedure CreateBlankParaXML(ParaXMLPathName: string);
var
  XMLDocument_BlankPara: TXMLDocument;
  Blank_ParasNode, Blank_ProgramParaNode: IXMLNode;
begin
  XMLDocument_BlankPara:= TXMLDocument.Create(Application);
  XMLDocument_BlankPara.Active:= True;
  XMLDocument_BlankPara.Version:='1.0';
  XMLDocument_BlankPara.Encoding:= 'utf-8';
  XMLDocument_BlankPara.NodeIndentStr:= #9;
  XMLDocument_BlankPara.Options:= XMLDocument_BlankPara.Options + [doNodeAutoIndent];
  try
    Blank_ParasNode:= XMLDocument_BlankPara.AddChild('paras');
    Blank_ParasNode.Attributes['author']:= 'badcat';

    Blank_ProgramParaNode:= Blank_ParasNode.AddChild('programpara');
    Blank_ProgramParaNode.AddChild('autostart').NodeValue:= 0;
    Blank_ProgramParaNode.AddChild('minimize').NodeValue:= 0;
    Blank_ProgramParaNode.AddChild('clientexedir');

    Blank_ParasNode.AddChild('clientnodes');

    XMLDocument_BlankPara.SaveToFile(ParaXMLPathName);
  finally
    XMLDocument_BlankPara.Free;
  end;
end;

//实现-c参数，Node中加入json节点
procedure RepaireParaXML(ParaXMLPathName: string);
var
  isModify: Boolean;
  XMLDocument_BlankPara: TXMLDocument;
  ParasNode, ClientNode, Node, JsonNode: IXMLNode;
  i: Integer;
begin
  isModify:= False;
  XMLDocument_BlankPara:= TXMLDocument.Create(Application);
  XMLDocument_BlankPara.Active:= True;
  XMLDocument_BlankPara.Version:='1.0';
  XMLDocument_BlankPara.Encoding:= 'gbk';
  XMLDocument_BlankPara.NodeIndentStr:= #9;
  XMLDocument_BlankPara.Options:= XMLDocument_BlankPara.Options + [doNodeAutoIndent];
  XMLDocument_BlankPara.LoadFromFile(ParaXMLPathName);
  try
    ParasNode:= XMLDocument_BlankPara.DocumentElement;
    ClientNode:= ParasNode.ChildNodes.FindNode('clientnodes');
    for i := 0 to (ClientNode.ChildNodes.Count - 1) do
      begin
        Node:= ClientNode.ChildNodes[i];
        JsonNode:= Node.ChildNodes.FindNode('json');
        if JsonNode = nil then
          begin
            isModify:= True;
            JsonNode:= Node.AddChild('json');
            JsonNode.Attributes['enable']:= 0;
          end;
      end;
    if isModify then
      XMLDocument_BlankPara.SaveToFile(ParaXMLPathName);
  finally
    XMLDocument_BlankPara.Free;
  end;
end;

function GetAppVersionStr: string;
var
  CFStr: CFStringRef;
  Range: CFRange;
begin
  CFStr:= CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle, kCFBundleVersionKey);
  Range.location:= 0;
  Range.length:= CFStringGetLength(CFStr);
  SetLength(Result, Range.length);
  CFStringGetCharacters(CFStr, Range, PChar(Result));
end;

//procedure WriteREGAutoRun(AutoStart: Integer; FileFullName: string);
//var
//  loginItems: LSSharedFileListRef;
//  url: string;
//  item: LSSharedFileListItemRef;
//begin
//  loginItems:= LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
//  //url为app所在的目录
//  url:= TNSBundle.Wrap(TNSBundle.OCClass.mainBundle).bundlePath.UTF8String;
//  item = LSSharedFileListInsertItemURL(loginItems, kLSSharedFileListItemLast, NULL, NULL, StrToNSStr(url), NULL, NULL);
//  CFRelease(item);
//  CFRelease(loginItems);
//end;

end.

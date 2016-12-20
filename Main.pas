unit Main;

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
  FMX.DialogService,

  Posix.Stdlib, Class_TrayItem,
  Macapi.Foundation, Macapi.AppKit, Macapi.Helpers,

  PublicVar, FMX.ListView.Types, FMX.ListView, Xml.XMLIntf, Xml.XMLDoc,
  FMX.ScrollBox, FMX.Controls.Presentation;



//**   Original VCL Uses section : 


//**   Winapi.Windows, Winapi.ShellAPI, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
//**   Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
//**   Xml.XMLIntf, Xml.XMLDoc, Vcl.Menus, Vcl.Buttons, Vcl.ImgList, PublicVar;



type
  TFMain = class(TForm)
    Btn_AddNode: TButton;
    Btn_DeleteNode: TButton;
    Btn_StartAll: TButton;
    Btn_StopAll: TButton;
    StatusBar_Status: TStatusBar;
    Panel_ClientNodeInfo: TPanel;
    GroupBox_BascPara: TGroupBox;
    Label_LocalPort: TLabel;
    Label_KCPServerIP: TLabel;
    Edit_LocalPort: TEdit;
    Edit_KCPServerIP: TEdit;
    Edit_KCPServerPort: TEdit;
    Label_KCPServerPort: TLabel;
    GroupBox_SelectPara: TGroupBox;
    CheckBox_Key: TCheckBox;
    Label_Key: TLabel;
    Edit_Key: TEdit;
    CheckBox_Crypt: TCheckBox;
    Label_Crypt: TLabel;
    ComboBox_Crypt: TComboBox;
    CheckBox_Conn: TCheckBox;
    Label_Conn: TLabel;
    Edit_Conn: TEdit;
    CheckBox_MTU: TCheckBox;
    Label_MTU: TLabel;
    Edit_MTU: TEdit;
    CheckBox_SndWnd: TCheckBox;
    Label_SndWnd: TLabel;
    Edit_SndWnd: TEdit;
    CheckBox_RcvWnd: TCheckBox;
    Label_RcvWnd: TLabel;
    Edit_RcvWnd: TEdit;
    CheckBox_NoComp: TCheckBox;
    CheckBox_DSCP: TCheckBox;
    Label_DSCP: TLabel;
    Edit_DSCP: TEdit;
    CheckBox_DataShard: TCheckBox;
    Label_DataShard: TLabel;
    Edit_DataShard: TEdit;
    CheckBox_ParityShard: TCheckBox;
    Label_ParityShard: TLabel;
    Edit_ParityShard: TEdit;
    GroupBox_Mode: TGroupBox;
    Memo_Log: TMemo;
    CheckBox_NoDelay: TCheckBox;
    CheckBox_Interval: TCheckBox;
    Label_Interval: TLabel;
    Edit_Interval: TEdit;
    CheckBox_Resend: TCheckBox;
    Label_Resend: TLabel;
    Edit_Resend: TEdit;
    CheckBox_NC: TCheckBox;
    Label_NC: TLabel;
    Edit_Remark: TEdit;
    Label_Remark: TLabel;
    Btn_Start: TButton;
    Btn_Stop: TButton;
    CheckBox_AutoStart: TCheckBox;
    Label_ClientEXEDir: TLabel;
    Edit_ClientEXEDir: TEdit;
    Btn_FindClientEXE: TButton;
    Memo_CMDLine: TMemo;
    OpenDialog_ClientEXE: TOpenDialog;
    CheckBox_Mode: TCheckBox;
    Label_Mode: TLabel;
    ComboBox_Mode: TComboBox;
    Label_NoComp: TLabel;
    Label_NoDelay: TLabel;
    GroupBox_HiddenPara: TGroupBox;
    CheckBox_ACKNoDelay: TCheckBox;
    Label_ACKNoDelay: TLabel;
    Label_SockBuf: TLabel;
    CheckBox_SockBuf: TCheckBox;
    Edit_SockBuf: TEdit;
    CheckBox_KeepAlive: TCheckBox;
    Label_KeepAlive: TLabel;
    Edit_KeepAlive: TEdit;
    CheckBox_Minimize: TCheckBox;
    CheckBox_AutoExpire: TCheckBox;
    Label_AutoExpire: TLabel;
    Edit_AutoExpire: TEdit;
    SpeedBtn_ClearLog: TSpeedButton;
    SpeedBtn_CMDLine: TSpeedButton;
    CheckBox_ConfigFileDir: TCheckBox;
    PopupMenu_ClientNode: TPopupMenu;
    Menu_Start: TMenuItem;
    Menu_Stop: TMenuItem;
    N4: TMenuItem;
    Menu_Copy: TMenuItem;
    N7: TMenuItem;
    Menu_Delete: TMenuItem;
    Edit_ConfigFileDir: TEdit;
    Label_ConfigFileDir: TLabel;
    Btn_FindConfigFileDir: TButton;
    OpenDialog_JSON: TOpenDialog;
    Menu_JSON: TMenuItem;
    SaveDialog_JSON: TSaveDialog;
    ListBox_Node: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    Label_KcpTun: TLabel;
    Image_CMDLine: TImage;
    Image_ClearLog: TImage;
    Popup_Hint: TPopup;
    CalloutPanel_Hint: TCalloutPanel;
    Label_Hint: TLabel;
    procedure Btn_AddNodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_FindClientEXEClick(Sender: TObject);
    procedure ComboBox_CryptChange(Sender: TObject);
    procedure ComboBox_ModeChange(Sender: TObject);
    procedure Btn_StartClick(Sender: TObject);
    procedure Btn_StopClick(Sender: TObject);
    procedure Btn_DeleteNodeClick(Sender: TObject);
    procedure TrayIcon_SysClick(Sender: TObject);
    procedure Memo_CMDLineDblClick(Sender: TObject);
    procedure Edit_LocalPortKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_StartAllClick(Sender: TObject);
    procedure Btn_StopAllClick(Sender: TObject);
    procedure SpeedBtn_CMDLineClick(Sender: TObject);
    procedure SpeedBtn_ClearLogClick(Sender: TObject);
    procedure Btn_FindConfigFileDirClick(Sender: TObject);
    procedure Menu_StartClick(Sender: TObject);
    procedure Menu_StopClick(Sender: TObject);
    procedure Menu_DeleteClick(Sender: TObject);
    procedure Menu_JSONClick(Sender: TObject);
    procedure Menu_CopyClick(Sender: TObject);
    procedure ListBox_NodeClick(Sender: TObject);
    procedure Label_KcpTunClick(Sender: TObject);
    procedure ListBox_NodeDblClick(Sender: TObject);
    procedure Edit_RemarkChangeTracking(Sender: TObject);
    procedure Edit_ClientEXEDirChangeTracking(Sender: TObject);
    procedure Edit_ConfigFileDirChangeTracking(Sender: TObject);
    procedure Edit_LocalPortChangeTracking(Sender: TObject);
    procedure Edit_KCPServerIPChangeTracking(Sender: TObject);
    procedure Edit_KCPServerPortChangeTracking(Sender: TObject);
    procedure Edit_KeyChangeTracking(Sender: TObject);
    procedure Edit_DataShardChangeTracking(Sender: TObject);
    procedure Edit_ParityShardChangeTracking(Sender: TObject);
    procedure Edit_ConnChangeTracking(Sender: TObject);
    procedure Edit_MTUChangeTracking(Sender: TObject);
    procedure Edit_SndWndChangeTracking(Sender: TObject);
    procedure Edit_RcvWndChangeTracking(Sender: TObject);
    procedure Edit_DSCPChangeTracking(Sender: TObject);
    procedure Edit_AutoExpireChangeTracking(Sender: TObject);
    procedure Edit_IntervalChangeTracking(Sender: TObject);
    procedure Edit_ResendChangeTracking(Sender: TObject);
    procedure Edit_KeepAliveChangeTracking(Sender: TObject);
    procedure Edit_SockBufChangeTracking(Sender: TObject);
    procedure CheckBox_KeyChange(Sender: TObject);
    procedure CheckBox_CryptChange(Sender: TObject);
    procedure CheckBox_NoCompChange(Sender: TObject);
    procedure CheckBox_DataShardChange(Sender: TObject);
    procedure CheckBox_ParityShardChange(Sender: TObject);
    procedure CheckBox_ConnChange(Sender: TObject);
    procedure CheckBox_MTUChange(Sender: TObject);
    procedure CheckBox_SndWndChange(Sender: TObject);
    procedure CheckBox_RcvWndChange(Sender: TObject);
    procedure CheckBox_DSCPChange(Sender: TObject);
    procedure CheckBox_AutoExpireChange(Sender: TObject);
    procedure CheckBox_ModeChange(Sender: TObject);
    procedure CheckBox_NoDelayChange(Sender: TObject);
    procedure CheckBox_IntervalChange(Sender: TObject);
    procedure CheckBox_ResendChange(Sender: TObject);
    procedure CheckBox_NCChange(Sender: TObject);
    procedure CheckBox_ACKNoDelayChange(Sender: TObject);
    procedure CheckBox_KeepAliveChange(Sender: TObject);
    procedure CheckBox_SockBufChange(Sender: TObject);
    procedure CheckBox_ConfigFileDirChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CheckBox_MinimizeChange(Sender: TObject);
    procedure CheckBox_AutoStartChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_KCPServerPortMouseEnter(Sender: TObject);
    procedure Edit_KCPServerPortMouseLeave(Sender: TObject);
  private
    { Private declarations }
//    procedure WMSYSCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
  protected
//    procedure WMDropFiles(var Msg: TMessage); message WM_DROPFILES;
//    procedure WMDOSCommandStop(var Msg: TMessage); message WM_DOSCOMMANDSTOP;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  TrayItem: TFMXTrayItem;

implementation

uses
  Interface_op, Class_ClientNode, OneCopy, PublicFun, Photo;

{$R *.FMX}
{$R photo.RES}

//procedure TFMain.WMSYSCommand;
//begin
//  if (Msg.CmdType = SC_MINIMIZE) or (Msg.CmdType = SC_CLOSE)  then
//    begin
//      FMain.Visible:= False;
//    end
//  else
//    DefaultHandler(Msg);
//
//  if (Msg.CmdType = WM_PHOTO)  then
//    FPhoto.ShowModal;
//end;

//procedure TFMain.WMDropFiles(var Msg:TMessage);
//var
//  i: Integer;
//  Buffer: array[0..8190] of Char;
//  FileFullName, LowerCaseFileName: string;
//  FindFiles: Boolean;
//begin
//  FindFiles:= False;
//  i:= DragQueryFile(Msg.wParam, $FFFFFFFF, Buffer, 8190);
//  for i:= 0 to (i - 1) do
//    begin    //处理选择多个文件
//      DragQueryFile(Msg.wParam, i, Buffer, 8190);
//      FileFullName:= Buffer;
//      LowerCaseFileName:= LowerCase(ExtractFileName(FileFullName));
//      if (LowerCaseFileName = 'client_windows_amd64.exe') or (LowerCaseFileName = 'client_windows_386.exe') then
//        begin
//          FindFiles:= True;
//          Break;
//        end;//if
//    end;//for
//  DragFinish(Msg.wParam);
//  if FindFiles then
//    begin
//      PublicVar.ClientEXEDir:= FileFullName;
//      Edit_ClientEXEDir.Text:= FileFullName;
//    end;
//end;

//procedure TFMain.WMDOSCommandStop(var Msg: TMessage);
//var
//  ClientNode: TClientNode;
//begin
//  ClientNode:= TClientNode(Msg.LParam);
//  ClientNode.StopCommand;
//  if (ListView_Node.Selected <> nil) and (ListView_Node.Selected.Data = ClientNode) then
//    begin
//      Btn_Start.Enabled:= True;
//      Btn_Stop.Enabled:= False;
//    end;
//  ListView_Node.Repaint;
//end;

procedure TFMain.Btn_AddNodeClick(Sender: TObject);
var
  NewClientNode: TClientNode;
  NodeItem: TListBoxItem;
  NewXMLNode: IXMLNode;
begin
  Btn_AddNode.Enabled:= False;
  try
    NewClientNode:= TClientNode.Create;
    NewClientNode.XMLDocument_Para:= PublicVar.XMLDocument_Para;

    NodeItem:= TListBoxItem.Create(ListBox_Node);
    NodeItem.Parent:= ListBox_Node;
    NodeItem.Text:= NewClientNode.KCPServerIP + ':' + NewClientNode.KCPServerPort + '——' + NewClientNode.LocalPort;
    NodeItem.Data:= NewClientNode;

    NewXMLNode:= PublicVar.ClientNodes.AddChild('node');
    NewClientNode.XMLNode:= NewXMLNode;
    NewClientNode.WriteToXMLNode(NewXMLNode);
    PublicVar.XMLDocument_Para.SaveToFile();
  finally
    Btn_AddNode.Enabled:= True;
  end;
end;

procedure TFMain.Btn_DeleteNodeClick(Sender: TObject);
var
  ClientNode: TClientNode;
begin
  TDialogService.MessageDialog('确定要删除所选中的节点吗？删除后无法恢复！', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
    procedure(const aResult: TModalResult)
      begin
        if aResult = mrNo then
          Exit
        else
          begin
            ClientNode:= TClientNode(ListBox_Node.Selected.Data);
            ClientNode.XMLNode.ParentNode.ChildNodes.Remove(ClientNode.XMLNode);
            PublicVar.XMLDocument_Para.SaveToFile;

            if ClientNode.isRunCMD <> 0  then
              begin
                ClientNode.CorrectQuit:= True;
                ClientNode.StopCommand;
              end;
            ClientNode.Free;
            ListBox_Node.Items.Delete(ListBox_Node.Selected.Index);
            ListBox_NodeClick(Self);
          end;
      end
  );
end;

procedure TFMain.Btn_FindClientEXEClick(Sender: TObject);
begin
  if not OpenDialog_ClientEXE.Execute then
    Exit;
  PublicVar.ClientEXEDir:= OpenDialog_ClientEXE.FileName;
  Edit_ClientEXEDir.Text:= OpenDialog_ClientEXE.FileName;
end;

procedure TFMain.Btn_FindConfigFileDirClick(Sender: TObject);
begin
  if not OpenDialog_JSON.Execute then
    Exit;
  Edit_ConfigFileDir.Text:= OpenDialog_JSON.FileName;
end;

procedure TFMain.Btn_StartAllClick(Sender: TObject);
var
  i: Integer;
  ClientNode: TClientNode;
  CMDLineStr: string;
begin
  for i := 0 to (ListBox_Node.Count - 1) do
    begin
      if (ListBox_Node.ListItems[i] is TListBoxGroupHeader) then
        Continue;
      ClientNode:= TClientNode(ListBox_Node.ListItems[i].Data);
      if (ClientNode.isRunCMD = 0) then
        begin
          CMDLineStr:= ClientNode.CreateCMDLine(Edit_ClientEXEDir.Text);
          ClientNode.RunCommand(CMDLineStr);
          ClientNode.RunState:= '1';
        end;
    end;
  ListBox_Node.Repaint;
  ListBox_NodeClick(Self);
end;

procedure TFMain.Btn_StartClick(Sender: TObject);
var
  CMDLineStr: string;
begin
  CMDLineStr:= TClientNode(ListBox_Node.Selected.Data).CreateCMDLine(Edit_ClientEXEDir.Text);
  Memo_CMDLine.Lines.Text:= CMDLineStr;
  TClientNode(ListBox_Node.Selected.Data).RunCommand(CMDLineStr);
  TClientNode(ListBox_Node.Selected.Data).RunState:= '1';
  ListBox_Node.Repaint;
  Btn_Start.Enabled:= False;
  Btn_Stop.Enabled:= True;
end;

procedure TFMain.Btn_StopAllClick(Sender: TObject);
var
  i: Integer;
  ClientNode: TClientNode;
begin
  for i := 0 to (ListBox_Node.Count - 1) do
    begin
      if (ListBox_Node.ListItems[i] is TListBoxGroupHeader) then
        Continue;
      ClientNode:= TClientNode(ListBox_Node.ListItems[i].Data);
      if (ClientNode.isRunCMD = 1) then
        begin
          ClientNode.CorrectQuit:= True;
          ClientNode.StopCommand;
          ClientNode.RunState:= '0';
        end;
    end;
  ListBox_Node.Repaint;
  ListBox_NodeClick(Self);
end;

procedure TFMain.Btn_StopClick(Sender: TObject);
begin
  TClientNode(ListBox_Node.Selected.Data).CorrectQuit:= True;
  TClientNode(ListBox_Node.Selected.Data).StopCommand;
  TClientNode(ListBox_Node.Selected.Data).RunState:= '0';
  ListBox_Node.Repaint;
  Btn_Start.Enabled:= True;
  Btn_Stop.Enabled:= False;
end;

procedure TFMain.CheckBox_ACKNoDelayChange(Sender: TObject);
begin
  Label_ACKNoDelay.Enabled:= CheckBox_ACKNoDelay.isChecked;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isACKNoDelay:= Integer(CheckBox_ACKNoDelay.isChecked);
end;

procedure TFMain.CheckBox_AutoExpireChange(Sender: TObject);
begin
  Label_AutoExpire.Enabled:= CheckBox_AutoExpire.isChecked;
  Edit_AutoExpire.Enabled:= CheckBox_AutoExpire.isChecked;
  if CheckBox_AutoExpire.isChecked then
    begin
//      Edit_AutoExpire.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_AutoExpire.SetFocus;
    end
  else
    begin
//      Edit_AutoExpire.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isAutoExpire:= Integer(CheckBox_AutoExpire.isChecked);
end;

procedure TFMain.CheckBox_AutoStartChange(Sender: TObject);
begin
//  PublicVar.AutoStart:= Integer(CheckBox_AutoStart.isChecked);
//  if not PublicVar.CanModifyXML then
//    Exit;
//  try
//    WriteREGAutoRun(PublicVar.AutoStart, Application.ExeName);
//    PublicVar.ProgramNode.ChildNodes['autostart'].NodeValue:= PublicVar.AutoStart;
//    PublicVar.XMLDocument_Para.SaveToFile;
//  except
//    Application.MessageBox('试图操作注册表时出现错误，请以系统管理员身份运行后再次重试！', '提示', MB_OK);
//    Exit;
//  end;
end;

procedure TFMain.CheckBox_ConfigFileDirChange(Sender: TObject);
begin
  Label_ConfigFileDir.Enabled:= CheckBox_ConfigFileDir.isChecked;
  Edit_ConfigFileDir.Enabled:= CheckBox_ConfigFileDir.isChecked;
  Btn_FindConfigFileDir.Enabled:= CheckBox_ConfigFileDir.isChecked;
  if CheckBox_ConfigFileDir.isChecked then
    begin
      if PublicVar.CanFoucs then
        Btn_FindConfigFileDir.SetFocus;

      Interface_op.Enable_DisableAllCheckbox(False);
      Interface_op.Enable_DisableBasePara(False);
      DisableAllInterfaceExceptJSON;
//      Interface_op.Enable_DisableSelectPara(False);
//      Interface_op.Enable_DisableModePara(False);
//      Interface_op.Enable_DisableHiddenPara(False);
    end
  else
    begin
      Interface_op.Enable_DisableAllCheckbox(True);
      Interface_op.Enable_DisableBasePara(True);
      Interface_op.Enable_DisableSelectPara(True);
      Interface_op.Enable_DisableModePara(True);
      Interface_op.Enable_DisableHiddenPara(True);
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isJson:= Integer(CheckBox_ConfigFileDir.isChecked);
end;

procedure TFMain.CheckBox_ConnChange(Sender: TObject);
begin
  Label_Conn.Enabled:= CheckBox_Conn.isChecked;
  Edit_Conn.Enabled:= CheckBox_Conn.isChecked;
  if CheckBox_Conn.isChecked then
    begin
//      Edit_Conn.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_Conn.SetFocus;
    end
  else
    begin
//      Edit_Conn.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isConn:= Integer(CheckBox_Conn.isChecked);
end;

procedure TFMain.CheckBox_CryptChange(Sender: TObject);
begin
  Label_Crypt.Enabled:= CheckBox_Crypt.isChecked;
  ComboBox_Crypt.Enabled:= CheckBox_Crypt.isChecked;
  if CheckBox_Crypt.isChecked then
    begin
      if PublicVar.CanFoucs then
        ComboBox_Crypt.SetFocus;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isCrypt:= Integer(CheckBox_Crypt.isChecked);
end;

procedure TFMain.CheckBox_DataShardChange(Sender: TObject);
begin
  Label_DataShard.Enabled:= CheckBox_DataShard.isChecked;
  Edit_DataShard.Enabled:= CheckBox_DataShard.isChecked;
  if CheckBox_DataShard.isChecked then
    begin
//      Edit_DataShard.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_DataShard.SetFocus;
    end
  else
    begin
//      Edit_DataShard.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isDataShard:= Integer(CheckBox_DataShard.isChecked);
end;

procedure TFMain.CheckBox_DSCPChange(Sender: TObject);
begin
  Label_DSCP.Enabled:= CheckBox_DSCP.isChecked;
  Edit_DSCP.Enabled:= CheckBox_DSCP.isChecked;
  if CheckBox_DSCP.isChecked then
    begin
//      Edit_DSCP.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_DSCP.SetFocus;
    end
  else
    begin
//      Edit_DSCP.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isDSCP:= Integer(CheckBox_DSCP.isChecked);
end;

procedure TFMain.CheckBox_IntervalChange(Sender: TObject);
begin
  if (CheckBox_Mode.isChecked) and (ComboBox_Mode.Selected <> nil) and (ComboBox_Mode.Selected.Text = 'manual') and (CheckBox_Interval.isChecked) then
    begin
      Label_Interval.Enabled:= True;
//      Edit_Interval.Color:= clWindow;
      Edit_Interval.Enabled:= True;
      if PublicVar.CanFoucs and PublicVar.ModeCanFouse then
        Edit_Interval.SetFocus;
    end
  else
    begin
      Label_Interval.Enabled:= False;
//      Edit_Interval.Color:= clBtnFace;
      Edit_Interval.Enabled:= False;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isInterval:= Integer(CheckBox_Interval.isChecked);
end;

procedure TFMain.CheckBox_KeepAliveChange(Sender: TObject);
begin
  Label_KeepAlive.Enabled:= CheckBox_KeepAlive.isChecked;
  Edit_KeepAlive.Enabled:= CheckBox_KeepAlive.isChecked;
  if CheckBox_KeepAlive.isChecked then
    begin
//      Edit_KeepAlive.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_KeepAlive.SetFocus;
    end
  else
    begin
//      Edit_KeepAlive.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isKeepAlive:= Integer(CheckBox_KeepAlive.isChecked);
end;

procedure TFMain.CheckBox_KeyChange(Sender: TObject);
begin
  Label_Key.Enabled:= CheckBox_Key.isChecked;
  Edit_Key.Enabled:= CheckBox_Key.isChecked;
  if CheckBox_Key.isChecked then
    begin
//      Edit_Key.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_Key.SetFocus;
    end
  else
    begin
//      Edit_Key.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isKey:= Integer(CheckBox_Key.isChecked);
end;

procedure TFMain.CheckBox_MinimizeChange(Sender: TObject);
begin
  PublicVar.Minimize:= Integer(CheckBox_Minimize.isChecked);
  if not PublicVar.CanModifyXML then
    Exit;
  PublicVar.ProgramNode.ChildNodes['minimize'].NodeValue:= PublicVar.Minimize;
  PublicVar.XMLDocument_Para.SaveToFile;
end;

procedure TFMain.CheckBox_ModeChange(Sender: TObject);
begin
  Label_Mode.Enabled:= CheckBox_Mode.isChecked;
  ComboBox_Mode.Enabled:= CheckBox_Mode.isChecked;
  if CheckBox_Mode.isChecked then
    begin
      if PublicVar.CanFoucs then
        ComboBox_Mode.SetFocus;
    end;
  PublicVar.ModeCanFouse:= False;
  if (ComboBox_Mode.Selected <> nil) and (ComboBox_Mode.Selected.Text = 'manual') and (CheckBox_Mode.isChecked) then
    begin
      Interface_op.Enable_DisableModePara(True);
    end
  else
    begin
      Interface_op.Enable_DisableModePara(False);
    end;
  PublicVar.ModeCanFouse:= True;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isMode:= Integer(CheckBox_Mode.isChecked);
end;

procedure TFMain.CheckBox_MTUChange(Sender: TObject);
begin
  Label_MTU.Enabled:= CheckBox_MTU.isChecked;
  Edit_MTU.Enabled:= CheckBox_MTU.isChecked;
  if CheckBox_MTU.isChecked then
    begin
//      Edit_MTU.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_MTU.SetFocus;
    end
  else
    begin
//      Edit_MTU.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isMTU:= Integer(CheckBox_MTU.isChecked);
end;

procedure TFMain.CheckBox_NCChange(Sender: TObject);
begin
  if (CheckBox_Mode.isChecked) and (ComboBox_Mode.Selected <> nil) and (ComboBox_Mode.Selected.Text = 'manual') and (CheckBox_NC.isChecked) then
    begin
      Label_NC.Enabled:= True;
    end
  else
    begin
      Label_NC.Enabled:= False;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isNC:= Integer(CheckBox_NC.isChecked);
end;

procedure TFMain.CheckBox_NoCompChange(Sender: TObject);
begin
  Label_NoComp.Enabled:= CheckBox_NoComp.isChecked;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isNoComp:= Integer(CheckBox_NoComp.isChecked);
end;

procedure TFMain.CheckBox_NoDelayChange(Sender: TObject);
begin
  if (CheckBox_Mode.isChecked) and (ComboBox_Mode.Selected <> nil) and (ComboBox_Mode.Selected.Text = 'manual') and (CheckBox_NoDelay.isChecked) then
    begin
      Label_NoDelay.Enabled:= True;
    end
  else
    begin
      Label_NoDelay.Enabled:= False;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isNoDelay:= Integer(CheckBox_NoDelay.isChecked);
end;

procedure TFMain.CheckBox_ParityShardChange(Sender: TObject);
begin
  Label_ParityShard.Enabled:= CheckBox_ParityShard.isChecked;
  Edit_ParityShard.Enabled:= CheckBox_ParityShard.isChecked;
  if CheckBox_ParityShard.isChecked then
    begin
//      Edit_ParityShard.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_ParityShard.SetFocus;
    end
  else
    begin
//      Edit_ParityShard.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isParityShard:= Integer(CheckBox_ParityShard.isChecked);
end;

procedure TFMain.CheckBox_RcvWndChange(Sender: TObject);
begin
  Label_RcvWnd.Enabled:= CheckBox_RcvWnd.isChecked;
  Edit_RcvWnd.Enabled:= CheckBox_RcvWnd.isChecked;
  if CheckBox_RcvWnd.isChecked then
    begin
//      Edit_RcvWnd.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_RcvWnd.SetFocus;
    end
  else
    begin
//      Edit_RcvWnd.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isRcvWnd:= Integer(CheckBox_RcvWnd.isChecked);
end;

procedure TFMain.CheckBox_ResendChange(Sender: TObject);
begin
  if (CheckBox_Mode.isChecked) and (ComboBox_Mode.Selected <> nil) and (ComboBox_Mode.Selected.Text = 'manual') and (CheckBox_Resend.isChecked) then
    begin
      Label_Resend.Enabled:= True;
//      Edit_Resend.Color:= clWindow;
      Edit_Resend.Enabled:= True;
      if PublicVar.CanFoucs and PublicVar.ModeCanFouse then
        Edit_Resend.SetFocus;
    end
  else
    begin
      Label_Resend.Enabled:= False;
//      Edit_Resend.Color:= clBtnFace;
      Edit_Resend.Enabled:= False;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isResend:= Integer(CheckBox_Resend.isChecked);
end;

procedure TFMain.CheckBox_SndWndChange(Sender: TObject);
begin
  Label_SndWnd.Enabled:= CheckBox_SndWnd.isChecked;
  Edit_SndWnd.Enabled:= CheckBox_SndWnd.isChecked;
  if CheckBox_SndWnd.isChecked then
    begin
//      Edit_SndWnd.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_SndWnd.SetFocus;
    end
  else
    begin
//      Edit_SndWnd.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isSndWnd:= Integer(CheckBox_SndWnd.isChecked);
end;

procedure TFMain.CheckBox_SockBufChange(Sender: TObject);
begin
  Label_SockBuf.Enabled:= CheckBox_SockBuf.isChecked;
  Edit_SockBuf.Enabled:= CheckBox_SockBuf.isChecked;
  if CheckBox_SockBuf.isChecked then
    begin
//      Edit_SockBuf.Color:= clWindow;
      if PublicVar.CanFoucs then
        Edit_SockBuf.SetFocus;
    end
  else
    begin
//      Edit_SockBuf.Color:= clBtnFace;
    end;
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).isSockBuf:= Integer(CheckBox_SockBuf.isChecked);
end;

procedure TFMain.ComboBox_CryptChange(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  if ComboBox_Crypt.Selected = nil  then
    TClientNode(ListBox_Node.Selected.Data).Crypt:= ''
  else
    TClientNode(ListBox_Node.Selected.Data).Crypt:= ComboBox_Crypt.Selected.Text;
end;

procedure TFMain.ComboBox_ModeChange(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  if ComboBox_Mode.Selected = nil then
    begin
      TClientNode(ListBox_Node.Selected.Data).Mode:= '';
    end
  else
    begin
      TClientNode(ListBox_Node.Selected.Data).Mode:= ComboBox_Mode.Selected.Text;
      if (ComboBox_Mode.Selected.Text = 'manual') then
        begin
          Enable_DisableModePara(True);
        end
      else
        begin
          Enable_DisableModePara(False);
        end;
    end;
end;

procedure TFMain.Edit_AutoExpireChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).AutoExpire:= Edit_AutoExpire.Text;
end;

procedure TFMain.Edit_ClientEXEDirChangeTracking(Sender: TObject);
begin
  if not PublicVar.CanModifyXML then
    Exit;
  PublicVar.ProgramNode.ChildNodes['clientexedir'].NodeValue:= Edit_ClientEXEDir.Text;
  PublicVar.XMLDocument_Para.SaveToFile;
end;

procedure TFMain.Edit_ConfigFileDirChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).Json:= Edit_ConfigFileDir.Text;
end;

procedure TFMain.Edit_ConnChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).Conn:= Edit_Conn.Text;
end;

procedure TFMain.Edit_DataShardChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).DataShard:= Edit_DataShard.Text;
end;

procedure TFMain.Edit_DSCPChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).DSCP:= Edit_DSCP.Text;
end;

procedure TFMain.Edit_IntervalChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).Interval:= Edit_Interval.Text;
end;

procedure TFMain.Edit_KCPServerIPChangeTracking(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListBox_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListBox_Node.Selected.Data);
  ClientNode.KCPServerIP:= Edit_KCPServerIP.Text;
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListBox_Node.Selected.Text:= ShowCaption;
end;

procedure TFMain.Edit_KCPServerPortChangeTracking(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListBox_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListBox_Node.Selected.Data);
  ClientNode.KCPServerPort:= Edit_KCPServerPort.Text;
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListBox_Node.Selected.Text:= ShowCaption;
end;

procedure TFMain.Edit_KCPServerPortMouseEnter(Sender: TObject);
begin
  Popup_Hint.IsOpen:= True;
end;

procedure TFMain.Edit_KCPServerPortMouseLeave(Sender: TObject);
begin
  Popup_Hint.IsOpen:= False;
end;

procedure TFMain.Edit_KeepAliveChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).KeepAlive:= Edit_KeepAlive.Text;
end;

procedure TFMain.Edit_KeyChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).Key:= Edit_Key.Text;
end;

procedure TFMain.Edit_LocalPortChangeTracking(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListBox_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListBox_Node.Selected.Data);
  ClientNode.LocalPort:= Trim(Edit_LocalPort.Text);
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListBox_Node.Selected.Text:= ShowCaption;
end;

procedure TFMain.Edit_LocalPortKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8]) then
    Key:= #0;
end;

procedure TFMain.Edit_MTUChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).MTU:= Edit_MTU.Text;
end;

procedure TFMain.Edit_ParityShardChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).ParityShard:= Edit_ParityShard.Text;
end;

procedure TFMain.Edit_RcvWndChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).RcvWnd:= Edit_RcvWnd.Text;
end;

procedure TFMain.Edit_RemarkChangeTracking(Sender: TObject);
var
  ClientNode: TClientNode;
  ShowCaption: string;
begin
  if ListBox_Node.Selected = nil then
    Exit;
  ClientNode:= TClientNode(ListBox_Node.Selected.Data);
  ClientNode.Remark:= Edit_Remark.Text;
  ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
  ListBox_Node.Selected.Text:= ShowCaption;
end;

procedure TFMain.Edit_ResendChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).Resend:= Edit_Resend.Text;
end;

procedure TFMain.Edit_SndWndChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).SndWnd:= Edit_SndWnd.Text;
end;

procedure TFMain.Edit_SockBufChangeTracking(Sender: TObject);
begin
  if ListBox_Node.Selected = nil then
    Exit;
  TClientNode(ListBox_Node.Selected.Data).SockBuf:= Edit_SockBuf.Text;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  ClientNode: TClientNode;
begin
  for i := 0 to (ListBox_Node.Count - 1) do
    begin
      if (ListBox_Node.ListItems[i] is TListBoxGroupHeader) then
        Continue;
      ClientNode:= TClientNode(ListBox_Node.ListItems[i].Data);
      if (ClientNode.isRunCMD = 1) then
        begin
          ClientNode.CorrectQuit:= True;
          ClientNode.StopCommand;
        end;
      ClientNode.Free;
    end;
end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= PublicVar.CanCloseMain;
  if not PublicVar.CanCloseMain then
    Self.Hide;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
  FilePath: string;
//  MyMenu_Photo: HMENU;
  i: Integer;
  ClientXMLNode: IXMLNode;
  ClientNode: TClientNode;
//  NodeItem: TListItem;
  NodeItem: TListBoxItem;
  ShowCaption, CommandLine: string;
begin
  PublicVar.CanCloseMain:= False;
//  DragAcceptFiles(Handle, True);
  Interface_op.WriteHint_ModeDefault;
  Self.Caption:= Self.Caption + '      程序版本：' + PublicVar.FileVer;

//  MyMenu_Photo:= GetSystemMenu(Handle, False);
//  AppendMenu(MyMenu_Photo, MF_SEPARATOR, 0, nil);
//  AppendMenu(MyMenu_Photo, MF_STRING, WM_PHOTO, '激励师玉照 ^_^');

  Interface_op.Enable_DisableAllCheckbox(False);
  Interface_op.DisableAllInterface;
  Label_Remark.Enabled:= False;
  Edit_Remark.Enabled:= False;
//  Edit_Remark.Color:= clBtnFace;

//  OpenDialog_ClientEXE.InitialDir:= ExtractFilePath(ParamStr(0));
//  OpenDialog_JSON.InitialDir:= ExtractFilePath(ParamStr(0));
//  SaveDialog_JSON.InitialDir:= ExtractFilePath(ParamStr(0));
//  PublicVar.ParaXMLPathName:= ExtractFilePath(ParamStr(0)) + 'kcptun.xml';
//  FilePath:= ExtractFilePath(string(TNSBundle.Wrap(TNSBundle.OCClass.mainBundle).bundlePath.UTF8String));
  FilePath:= ExtractFilePath(string(TNSBundle.Wrap(TNSBundle.OCClass.mainBundle).bundlePath.cString));
  OpenDialog_ClientEXE.InitialDir:= FilePath;
  OpenDialog_JSON.InitialDir:= FilePath;
  SaveDialog_JSON.InitialDir:= FilePath;
  PublicVar.ParaXMLPathName:= FilePath + 'kcptun.xml';
  if not FileExists(PublicVar.ParaXMLPathName) then
    begin
      //参数文件不存在，新建文件
      PublicFun.CreateBlankParaXML(PublicVar.ParaXMLPathName);
    end
  else
    begin
      //参数文件存在，检查参数文件，添加或删除其中的参数项
      PublicFun.RepaireParaXML(PublicVar.ParaXMLPathName);
    end;

  PublicVar.XMLDocument_Para:= TXMLDocument.Create(Application);
  PublicVar.XMLDocument_Para.NodeIndentStr:= #9;
  PublicVar.XMLDocument_Para.Options:= PublicVar.XMLDocument_Para.Options + [doNodeAutoIndent];
  if (Interface_op.GetPublicVarFromXML(ParaXMLPathName) <> 0)  then
    begin
//      MessageDlg('系统参数xml文件损坏，请还原xml文件后重试！', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      TDialogService.MessageDialog('系统参数xml文件损坏，请还原xml文件后重试！',
        TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
      Application.Terminate;
    end;

//  if (PublicVar.Minimize = 1) then
//    begin
//      FMain.WindowState:= TWindowState.wsMinimized;
//      FMain.Hide;
//    end
//  else
//    begin
//      FMain.WindowState:= TWindowState.wsNormal;
//    end;

  for i := 0 to (PublicVar.ClientNodes.ChildNodes.Count - 1) do
    begin
      ClientXMLNode:= PublicVar.ClientNodes.ChildNodes[i];
      ClientNode:= TClientNode.Create;
      ClientNode.MainFormHandle:= Self.Handle;
      ClientNode.XMLDocument_Para:= PublicVar.XMLDocument_Para;
      ClientNode.XMLNode:= ClientXMLNode;
      if (ClientNode.ReadFromXMLNode(ClientXMLNode) <> 0)  then
        begin
//          MessageDlg('读取clientnodes节点时出现错误，请检查或还原xml文件后重试！', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
          TDialogService.MessageDialog('读取clientnodes节点时出现错误，请检查或还原xml文件后重试！',
            TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
          Application.Terminate;
        end;
      NodeItem:= TListBoxItem.Create(ListBox_Node);
      NodeItem.Parent:= ListBox_Node;
      ShowCaption:= ClientNode.KCPServerIP + ':' + ClientNode.KCPServerPort + '——' + ClientNode.LocalPort;
      if (ClientNode.Remark.Trim <> '') then
        ShowCaption:= ClientNode.Remark.Trim + '(' + ShowCaption + ')';
      NodeItem.Text:= ShowCaption;
      NodeItem.Data:= ClientNode;

      if ClientNode.RunState = '1' then
        begin
          CommandLine:= ClientNode.CreateCMDLine(PublicVar.ClientEXEDir);
          ClientNode.RunCommand(CommandLine);
          ClientNode.RunState:= '1';
        end;
    end;
  ListBox_Node.Repaint;
end;

procedure TFMain.Label_KcpTunClick(Sender: TObject);
//var
//  URL: NSURL;
begin
//  URL:= TNSURL.Wrap(TNSURL.OCClass.FileURLWithPath(StrToNSStr(KcpTunClientDownloadURL)));
//  TNSWorkspace.Wrap(TNSWorkspace.OCClass.sharedWorkspace).openURL(URL);
end;

procedure TFMain.ListBox_NodeClick(Sender: TObject);
var
  i: Integer;
  ClientNode: TClientNode;
begin
  PublicVar.CanFoucs:= False;
  Memo_CMDLine.Lines.Clear;
//  StatusBar_Status.Panels[0].Text:= '';
  for i := 0 to (ListBox_Node.Count - 1) do
    begin
      if (ListBox_Node.ListItems[i] is TListBoxGroupHeader) then
        Continue;
      ClientNode:= TClientNode(ListBox_Node.ListItems[i].Data);
      ClientNode.Memo_Log:= nil;
    end;
  Memo_Log.Lines.Clear;

  if (ListBox_Node.Selected = nil) then
    begin
      Interface_op.DisableAllInterface;
      Exit;
    end;
  ClientNode:= TClientNode(ListBox_Node.Selected.Data);
  ClientNode.CanModifyXML:= False;
  Interface_op.ShowClientInfoToInterface(ClientNode);

  ClientNode.Memo_Log:= Memo_Log;
  Memo_Log.Lines.Text:= ClientNode.WholeLog + ClientNode.GetWholeCommandOutput;
  Memo_Log.SelStart:= Length(Memo_Log.Lines.Text);
//  SendMessage(Memo_Log.Handle, WM_VSCROLL, MAKELONG(SB_BOTTOM, 0), 0);

  Btn_DeleteNode.Enabled:= True;

  CheckBox_ConfigFileDir.Enabled:= True;
  CheckBox_ConfigFileDirChange(Self);

  Label_Remark.Enabled:= True;
  Edit_Remark.Enabled:= True;
//  Edit_Remark.Color:= clWhite;

  SpeedBtn_CMDLine.Enabled:= True;
  SpeedBtn_ClearLog.Enabled:= True;

  ClientNode.CanModifyXML:= True;
  PublicVar.CanFoucs:= True;
end;

procedure TFMain.ListBox_NodeDblClick(Sender: TObject);
begin
  FPhoto.ShowModal;
end;

procedure TFMain.Menu_StartClick(Sender: TObject);
begin
  Btn_StartClick(Self);
end;

procedure TFMain.Menu_StopClick(Sender: TObject);
begin
  Btn_StopClick(Self);
end;

procedure TFMain.SpeedBtn_ClearLogClick(Sender: TObject);
begin
  TClientNode(ListBox_Node.Selected.Data).WholeLog:= '';
  Memo_Log.Lines.Clear;
end;

procedure TFMain.SpeedBtn_CMDLineClick(Sender: TObject);
var
  CMDLineStr: string;
begin
  CMDLineStr:= TClientNode(ListBox_Node.Selected.Data).CreateCMDLine(Edit_ClientEXEDir.Text);
  Memo_CMDLine.Lines.Text:= CMDLineStr;
end;

procedure TFMain.Memo_CMDLineDblClick(Sender: TObject);
begin
  Memo_CMDLine.SelectAll;
end;

procedure TFMain.Menu_CopyClick(Sender: TObject);
var
  SouClientNode, NewClientNode: TClientNode;
  NewXMLNode: IXMLNode;
  NewNodeItem: TListBoxItem;
  NewRemarkStr, ShowCaption: string;
begin
  //克隆一个节点并保存到xml文件
  SouClientNode:= TClientNode(ListBox_Node.Selected.Data);
  NewXMLNode:= SouClientNode.XMLNode.CloneNode(True);
  PublicVar.ClientNodes.ChildNodes.Add(NewXMLNode);
  PublicVar.XMLDocument_Para.SaveToFile();

  if (SouClientNode.Remark.Trim = '') then
    NewRemarkStr:= 'COPY'
  else
    NewRemarkStr:= SouClientNode.Remark + ' COPY';

  NewClientNode:= TClientNode.Create;
  NewClientNode.XMLDocument_Para:= PublicVar.XMLDocument_Para;
  NewClientNode.XMLNode:= NewXMLNode;
  NewClientNode.Remark:= NewRemarkStr;
  NewClientNode.ReadFromXMLNode(NewXMLNode);

  ShowCaption:= NewClientNode.KCPServerIP + ':' + NewClientNode.KCPServerPort + '——' + NewClientNode.LocalPort;
  if (NewClientNode.Remark.Trim <> '') then
    ShowCaption:= NewClientNode.Remark.Trim + '(' + ShowCaption + ')';

  NewNodeItem:= TListBoxItem.Create(ListBox_Node);
  NewNodeItem.Text:= ShowCaption;
  NewNodeItem.Data:= NewClientNode;
end;

procedure TFMain.Menu_DeleteClick(Sender: TObject);
begin
  Btn_DeleteNodeClick(Self);
end;

procedure TFMain.Menu_JSONClick(Sender: TObject);
var
  ClientNode: TClientNode;
  DefaultJSONFileName: string;
  JSONStr: string;
  JSONFile: TextFile;
  isExcept: Boolean;
  ErrorInfoStr, HintStr: string;
begin
  ClientNode:= TClientNode(ListBox_Node.Selected.Data);
  DefaultJSONFileName:= ClientNode.KCPServerIP + '.' + ClientNode.KCPServerPort + '--' + ClientNode.LocalPort;
  if (ClientNode.Remark.Trim <> '') then
    DefaultJSONFileName:= ClientNode.Remark.Trim + '(' + DefaultJSONFileName + ')';
  SaveDialog_JSON.FileName:= DefaultJSONFileName;
  if not SaveDialog_JSON.Execute then
    Exit;
  JSONStr:= ClientNode.CreateJSONConfig();

  isExcept:= False;
  ErrorInfoStr:= '';
  AssignFile(JSONFile, SaveDialog_JSON.FileName);
  try
    try
      Rewrite(JSONFile);
      Append(JSONFile);
      Write(JSONFile, JSONStr);
      Flush(JSONFile);
    except
      on E: Exception  do
        begin
          ErrorInfoStr:= E.Message;
          isExcept:= True;
        end;
    end;
  finally
    CloseFile(JSONFile);
  end;

  if isExcept then
    begin
      HintStr:= '导出参数JSON文件时出现错误，请稍后重试！错误原因为：' + ErrorInfoStr;
//      MessageDlg(HintStr, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
      TDialogService.MessageDialog(HintStr, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end
  else
    begin
//      StatusBar_Status.Panels[0].Text:= '导出参数JSON文件成功！';
//      Application.MessageBox('导出参数JSON文件成功！', '提示', MB_OK);
    end;
end;

procedure TFMain.TrayIcon_SysClick(Sender: TObject);
begin
  FMain.Visible:= not FMain.Visible;
  if FMain.Visible then
    begin
      FMain.WindowState:= TWindowState.wsNormal;
    end;
end;

initialization
  TrayItem:= TFMXTrayItem.Create;

finalization
  TrayItem.Free;

end.



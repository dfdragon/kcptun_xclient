unit Interface_op;

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

  Class_ClientNode;



//**   Original VCL Uses section : 


//**   System.SysUtils, System.Variants, Vcl.Forms, Vcl.Graphics, System.TypInfo,
//**   Class_ClientNode;


function GetPublicVarFromXML(ParaXMLPathName: string): Integer;

procedure Enable_DisableAllCheckbox(State: Boolean);

procedure Enable_DisableBasePara(State: Boolean);
procedure Enable_DisableSelectPara(State: Boolean);
procedure Enable_DisableModePara(State: Boolean);
procedure Enable_DisableHiddenPara(State: Boolean);

procedure DisableAllInterfaceExceptJSON;
procedure DisableAllInterface;

procedure ShowClientInfoToInterface(ClientNode: TClientNode);

procedure WriteHint_ModeDefault;

implementation

uses
  PublicVar, Main;

function GetPublicVarFromXML(ParaXMLPathName: string): Integer;
begin
  Result:= 0;
  PublicVar.CanModifyXML:= False;
  try
    PublicVar.XMLDocument_Para.LoadFromFile(ParaXMLPathName);
    PublicVar.XMLDocument_Para.Active:= True;

    PublicVar.MainNode:= XMLDocument_Para.DocumentElement;
    PublicVar.ProgramNode:= MainNode.ChildNodes.FindNode('programpara');
    PublicVar.ClientNodes:= MainNode.ChildNodes.FindNode('clientnodes');

    PublicVar.AutoStart:= StrToInt(ProgramNode.ChildNodes.FindNode('autostart').NodeValue);
    FMain.CheckBox_AutoStart.isChecked:= Boolean(PublicVar.AutoStart);

    PublicVar.Minimize:= StrToInt(ProgramNode.ChildNodes.FindNode('minimize').NodeValue);
    FMain.CheckBox_Minimize.isChecked:= Boolean(PublicVar.Minimize);

    PublicVar.ClientEXEDir:= VarToStr(ProgramNode.ChildNodes.FindNode('clientexedir').NodeValue);
    FMain.Edit_ClientEXEDir.Text:= PublicVar.ClientEXEDir;
  except
    Result:= 1;
  end;
  PublicVar.CanModifyXML:= True;
end;

procedure Enable_DisableAllCheckbox(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_Key.Enabled:= State;
      CheckBox_Crypt.Enabled:= State;
      CheckBox_NoComp.Enabled:= State;
      CheckBox_DataShard.Enabled:= State;
      CheckBox_ParityShard.Enabled:= State;
      CheckBox_Conn.Enabled:= State;
      CheckBox_MTU.Enabled:= State;
      CheckBox_SndWnd.Enabled:= State;
      CheckBox_RcvWnd.Enabled:= State;
      CheckBox_DSCP.Enabled:= State;
      CheckBox_AutoExpire.Enabled:= State;

      CheckBox_Mode.Enabled:= State;
      CheckBox_NoDelay.Enabled:= State;
      CheckBox_Interval.Enabled:= State;
      CheckBox_Resend.Enabled:= State;
      CheckBox_NC.Enabled:= State;

      CheckBox_ACKNoDelay.Enabled:= State;
      CheckBox_KeepAlive.Enabled:= State;
      CheckBox_SockBuf.Enabled:= State;
    end;
end;

//界面上禁用或启用基础参数
procedure Enable_DisableBasePara(State: Boolean);
begin
  with FMain  do
    begin
      if State then
        begin
//          Edit_LocalPort.Color:= clWindow;
//          Edit_KCPServerIP.Color:= clWindow;
//          Edit_KCPServerPort.Color:= clWindow;
        end
      else
        begin
//          Edit_LocalPort.Color:= clBtnFace;
//          Edit_KCPServerIP.Color:= clBtnFace;
//          Edit_KCPServerPort.Color:= clBtnFace;
        end;
      Label_LocalPort.Enabled:= State;            Edit_LocalPort.Enabled:= State;
      Label_KCPServerIP.Enabled:= State;          Edit_KCPServerIP.Enabled:= State;
      Label_KCPServerPort.Enabled:= State;        Edit_KCPServerPort.Enabled:= State;
    end;
end;

//界面上禁用或启用可选参数
procedure Enable_DisableSelectPara(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_Key.Enabled:= State;           CheckBox_KeyChange(FMain);
      CheckBox_Crypt.Enabled:= State;         CheckBox_CryptChange(FMain);
      CheckBox_NoComp.Enabled:= State;        CheckBox_NoCompChange(FMain);
      CheckBox_DataShard.Enabled:= State;     CheckBox_DataShardChange(FMain);
      CheckBox_ParityShard.Enabled:= State;   CheckBox_ParityShardChange(FMain);
      CheckBox_Conn.Enabled:= State;          CheckBox_ConnChange(FMain);
      CheckBox_MTU.Enabled:= State;           CheckBox_MTUChange(FMain);
      CheckBox_SndWnd.Enabled:= State;        CheckBox_SndWndChange(FMain);
      CheckBox_RcvWnd.Enabled:= State;        CheckBox_RcvWndChange(FMain);
      CheckBox_DSCP.Enabled:= State;          CheckBox_DSCPChange(FMain);
      CheckBox_AutoExpire.Enabled:= State;    CheckBox_AutoExpireChange(FMain);
    end;
end;

//界面上禁用或启用模式参数
procedure Enable_DisableModePara(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_NoDelay.Enabled:= State;     CheckBox_NoDelayChange(FMain);
      CheckBox_Interval.Enabled:= State;    CheckBox_IntervalChange(FMain);
      CheckBox_Resend.Enabled:= State;      CheckBox_ResendChange(FMain);
      CheckBox_NC.Enabled:= State;          CheckBox_NCChange(FMain);
    end;
end;

//界面上禁用或启用隐藏参数
procedure Enable_DisableHiddenPara(State: Boolean);
begin
  with FMain  do
    begin
      CheckBox_ACKNoDelay.Enabled:= State;    CheckBox_ACKNoDelayChange(FMain);
      CheckBox_KeepAlive.Enabled:= State;     CheckBox_KeepAliveChange(FMain);
      CheckBox_SockBuf.Enabled:= State;       CheckBox_SockBufChange(FMain);
    end;
end;

procedure DisableAllInterfaceExceptJSON;
begin
  with FMain  do
    begin
      Label_Key.Enabled:= False;          Edit_Key.Enabled:= False;         //Edit_Key.Color:= clBtnFace;
      Label_Crypt.Enabled:= False;        ComboBox_Crypt.Enabled:= False;
      Label_NoComp.Enabled:= False;
      Label_DataShard.Enabled:= False;    Edit_DataShard.Enabled:= False;   //Edit_DataShard.Color:= clBtnFace;
      Label_ParityShard.Enabled:= False;  Edit_ParityShard.Enabled:= False; //Edit_ParityShard.Color:= clBtnFace;
      Label_Conn.Enabled:= False;         Edit_Conn.Enabled:= False;        //Edit_Conn.Color:= clBtnFace;
      Label_MTU.Enabled:= False;          Edit_MTU.Enabled:= False;         //Edit_MTU.Color:= clBtnFace;
      Label_SndWnd.Enabled:= False;       Edit_SndWnd.Enabled:= False;      //Edit_SndWnd.Color:= clBtnFace;
      Label_RcvWnd.Enabled:= False;       Edit_RcvWnd.Enabled:= False;      //Edit_RcvWnd.Color:= clBtnFace;
      Label_DSCP.Enabled:= False;         Edit_DSCP.Enabled:= False;        //Edit_DSCP.Color:= clBtnFace;
      Label_AutoExpire.Enabled:= False;   Edit_AutoExpire.Enabled:= False;  //Edit_AutoExpire.Color:= clBtnFace;

      Label_Mode.Enabled:= False;         ComboBox_Mode.Enabled:= False;
      Label_NoDelay.Enabled:= False;
      Label_Interval.Enabled:= False;     Edit_Interval.Enabled:= False;    //Edit_Interval.Color:= clBtnFace;
      Label_Resend.Enabled:= False;       Edit_Resend.Enabled:= False;      //Edit_Resend.Color:= clBtnFace;
      Label_NC.Enabled:= False;

      Label_ACKNoDelay.Enabled:= False;
      Label_KeepAlive.Enabled:= False;    Edit_KeepAlive.Enabled:= False;   //Edit_KeepAlive.Color:= clBtnFace;
      Label_SockBuf.Enabled:= False;      Edit_SockBuf.Enabled:= False;     //Edit_SockBuf.Color:= clBtnFace;
    end;
end;

procedure DisableAllInterface;
begin
  with FMain  do
    begin
      Btn_DeleteNode.Enabled:= False;

      CheckBox_ConfigFileDir.Enabled:= False;
      Label_ConfigFileDir.Enabled:= False;
      Edit_ConfigFileDir.Enabled:= False;
      Btn_FindConfigFileDir.Enabled:= False;

      Label_Remark.Enabled:= False;
      Edit_Remark.Enabled:= False;
//      Edit_Remark.Color:= clBtnFace;

      SpeedBtn_CMDLine.Enabled:= False;
      SpeedBtn_ClearLog.Enabled:= False;
      Btn_Start.Enabled:= False;
      Btn_Stop.Enabled:= False;

      Interface_op.Enable_DisableAllCheckbox(False);
      Interface_op.Enable_DisableBasePara(False);
      DisableAllInterfaceExceptJSON;
//      Interface_op.Enable_DisableSelectPara(False);
//      Interface_op.Enable_DisableModePara(False);
//      Interface_op.Enable_DisableHiddenPara(False);
    end;
end;

procedure ShowClientInfoToInterface(ClientNode: TClientNode);
begin
  with FMain  do
    begin
      Edit_LocalPort.Text:= ClientNode.LocalPort;
      Edit_KCPServerIP.Text:= ClientNode.KCPServerIP;
      Edit_KCPServerPort.Text:= ClientNode.KCPServerPort;

      CheckBox_Key.isChecked:= Boolean(ClientNode.isKey);
      Edit_Key.Text:= ClientNode.Key;
      CheckBox_KeyChange(FMain);

      CheckBox_Crypt.isChecked:= Boolean(ClientNode.isCrypt);
      ComboBox_Crypt.ItemIndex:= ComboBox_Crypt.Items.IndexOf(ClientNode.Crypt);
      CheckBox_CryptChange(FMain);

      CheckBox_NoComp.isChecked:= Boolean(ClientNode.isNoComp);
      CheckBox_NoCompChange(FMain);

      CheckBox_DataShard.isChecked:= Boolean(ClientNode.isDataShard);
      Edit_DataShard.Text:= ClientNode.DataShard;
      CheckBox_DataShardChange(FMain);

      CheckBox_ParityShard.isChecked:= Boolean(ClientNode.isParityShard);
      Edit_ParityShard.Text:= ClientNode.ParityShard;
      CheckBox_ParityShardChange(FMain);

      CheckBox_Conn.isChecked:= Boolean(ClientNode.isConn);
      Edit_Conn.Text:= ClientNode.Conn;
      CheckBox_ConnChange(FMain);

      CheckBox_MTU.isChecked:= Boolean(ClientNode.isMTU);
      Edit_MTU.Text:= ClientNode.MTU;
      CheckBox_MTUChange(FMain);

      CheckBox_SndWnd.isChecked:= Boolean(ClientNode.isSndWnd);
      Edit_SndWnd.Text:= ClientNode.SndWnd;
      CheckBox_SndWndChange(FMain);

      CheckBox_RcvWnd.isChecked:= Boolean(ClientNode.isRcvWnd);
      Edit_RcvWnd.Text:= ClientNode.RcvWnd;
      CheckBox_RcvWndChange(FMain);

      CheckBox_DSCP.isChecked:= Boolean(ClientNode.isDSCP);
      Edit_DSCP.Text:= ClientNode.DSCP;
      CheckBox_DSCPChange(FMain);

      CheckBox_AutoExpire.isChecked:= Boolean(ClientNode.isAutoExpire);
      Edit_AutoExpire.Text:= ClientNode.AutoExpire;
      CheckBox_AutoExpireChange(FMain);

//-------------------------------------------------------------------------------------
      ComboBox_Mode.ItemIndex:= ComboBox_Mode.Items.IndexOf(ClientNode.Mode);

      CheckBox_NoDelay.isChecked:= Boolean(ClientNode.isNoDelay);
      CheckBox_NoDelayChange(FMain);

      CheckBox_Interval.isChecked:= Boolean(ClientNode.isInterval);
      Edit_Interval.Text:= ClientNode.Interval;
      CheckBox_IntervalChange(FMain);

      CheckBox_Resend.isChecked:= Boolean(ClientNode.isResend);
      Edit_Resend.Text:= ClientNode.Resend;
      CheckBox_ResendChange(FMain);

      CheckBox_NC.isChecked:= Boolean(ClientNode.isNC);
      CheckBox_NCChange(FMain);

      CheckBox_Mode.isChecked:= Boolean(ClientNode.isMode);
      CheckBox_ModeChange(FMain);
//-------------------------------------------------------------------------------------

      CheckBox_ACKNoDelay.isChecked:= Boolean(ClientNode.isACKNoDelay);
      CheckBox_ACKNoDelayChange(FMain);

      CheckBox_KeepAlive.isChecked:= Boolean(ClientNode.isKeepAlive);
      Edit_KeepAlive.Text:= ClientNode.KeepAlive;
      CheckBox_KeepAliveChange(FMain);

      CheckBox_SockBuf.isChecked:= Boolean(ClientNode.isSockBuf);
      Edit_SockBuf.Text:= ClientNode.SockBuf;
      CheckBox_SockBufChange(FMain);

      Edit_Remark.Text:= ClientNode.Remark;

      Btn_Start.Enabled:= not Boolean(ClientNode.isRunCMD);
      Btn_Stop.Enabled:= Boolean(ClientNode.isRunCMD);

      CheckBox_ConfigFileDir.isChecked:= Boolean(ClientNode.isJson);
      Edit_ConfigFileDir.Text:= ClientNode.Json;
      CheckBox_ConfigFileDirChange(FMain);
    end;
end;

procedure WriteHint_ModeDefault;
var
  NoDelayStr, IntervalStr, ResendStr, NCStr: string;
begin
  with FMain  do
    begin
//      NoDelayStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
//        'fast：不开启' + #13 + #10 + 'normal：不开启' + #13 + #10 + 'manual：不开启';
//      IntervalStr:= '默认值：' + #13 + #10 + 'fast3：10' + #13 + #10 + 'fast2：20' + #13 + #10 +
//        'fast：20' + #13 + #10 + 'normal：30' + #13 + #10 + 'manual：40';
//      ResendStr:= '默认值：' + #13 + #10 + 'fast3：2' + #13 + #10 + 'fast2：2' + #13 + #10 +
//        'fast：2' + #13 + #10 + 'normal：2' + #13 + #10 + 'manual：0';
//      NCStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
//        'fast：开启' + #13 + #10 + 'normal：开启' + #13 + #10 + 'manual：不开启';

      NoDelayStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
        'fast：不开启' + #13 + #10 + 'normal：不开启';
      IntervalStr:= '默认值：' + #13 + #10 + 'fast3：10' + #13 + #10 + 'fast2：20' + #13 + #10 +
        'fast：20' + #13 + #10 + 'normal：30';
      ResendStr:= '默认值：' + #13 + #10 + 'fast3：2' + #13 + #10 + 'fast2：2' + #13 + #10 +
        'fast：2' + #13 + #10 + 'normal：2';
      NCStr:= '默认值：' + #13 + #10 + 'fast3：开启' + #13 + #10 + 'fast2：开启' + #13 + #10 +
        'fast：开启' + #13 + #10 + 'normal：开启';

//      CheckBox_NoDelay.Hint:= NoDelayStr;       Label_NoDelay.Hint:= NoDelayStr;
//      CheckBox_Interval.Hint:= IntervalStr;     Label_Interval.Hint:= IntervalStr;   Edit_Interval.Hint:= IntervalStr;
//      CheckBox_Resend.Hint:= ResendStr;         Label_Resend.Hint:= ResendStr;        Edit_Resend.Hint:= ResendStr;
//      CheckBox_NC.Hint:= NCStr;                 Label_NC.Hint:= NCStr;
    end;
end;


end.

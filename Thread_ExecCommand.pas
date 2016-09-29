unit Thread_ExecCommand;

interface

//** Converted with Mida BASIC 275     http://www.midaconverter.com



uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IniFiles,

  System.SyncObjs,

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


//**   Classes, Windows, Messages, SysUtils, ExtCtrls, StdCtrls, Forms, System.SyncObjs;

const
  libc = '/usr/lib/libc.dylib';

  F_SETFL = 4;
  O_NONBLOCK = $0004;

type
  PIOFile = Pointer;

type
  TArg<T> = reference to procedure(const Arg: T);

type
  TExecCommand_Thread = class(TThread)
  private
    FThreadState: Integer;      //线程运行状态

    FOwner: TObject;            //所有者，这里是TClientNode对象
    FMainFormHandle: TWindowHandle;   //主窗口句柄

    FLock: TCriticalSection;    //锁对象
    FCMDLog: string;            //完整的输出日志
    FReadFromPipeStr: string;   //从控制台管道中读出的字符串
    FCommandLine: string;       //待执行的命令行
//    FCMDHandle: THandle;        //控制台程序句柄
    FOutput: PIOFile;
    FCMDPID: Integer;
    FMemo_Log: TMemo;
    FCorrectQuit: Boolean;      //是否是正常的退出

    procedure SetMemo_log(const Value: TMemo);

    procedure InputToMemo;
    procedure CaptureConsoleOutput(const ACommand, AParameters: string);
    procedure AppendOutputToLog(AppendStr: string);
  protected
    procedure Execute; override;
  public
    property ThreadState: Integer read FThreadState;
    property Owner: TObject read FOwner write FOwner;
    property MainFormHandle: TWindowHandle read FMainFormHandle write FMainFormHandle;
//    property CMDHandle: THandle read FCMDHandle;
    property Output: PIOFile read FOutput;
    property CMDPID: Integer read FCMDPID;
    property Memo_Log: TMemo read FMemo_Log write SetMemo_log;
    property CorrectQuit: Boolean read FCorrectQuit write FCorrectQuit;

    constructor Create(CommandLine: string; CreateSuspended: Boolean);
    destructor Destroy; override;

    function GetWholeLog: string;
  end;

const
  MaxCommandLen = 8191;

//Create a new stream connected to a pipe running the given command.
function popen(const Command: PAnsiChar; Modes: PAnsiChar): PIOFile; cdecl; external libc name '_popen';

//Close a stream opened by popen and return the status of its child.
function pclose(Stream: PIOFile): Integer; cdecl; external libc name '_pclose';

//Return the EOF indicator for STREAM.
function feof(Stream: PIOFile): Integer; cdecl; external libc name '_feof';

//Read chunks of generic data from STREAM.
function fread(Ptr: Pointer; Size: LongWord; N: LongWord; Stream: PIOFile): LongWord; cdecl; external libc name '_fread';

//Wait for a child to die.  When one does, put its status in *STAT_LOC
//and return its process ID.  For errors, return (pid_t) -1.
function wait(__stat_loc: PInteger): Integer; cdecl; external libc name '_wait';

function getpid(): Integer; cdecl; external libc name '_getpid';

function fgets(Ptr: Pointer; N: LongWord; Stream: PIOFile): LongWord; cdecl; external libc name '_fgets';

function fileno(Stream: PIOFile): Integer; cdecl; external libc name '_fileno';
function fcntl(fd: Integer; cmd: Integer; arg: Integer): LongWord; cdecl; external libc name '_fcntl';

function pipe(fd: Pointer): Integer; cdecl; external libc name '_pipe';
function fork(): Integer; cdecl; external libc name '_fork';
procedure perror(char: PAnsiChar); cdecl; external libc name '_perror';
function close(fd: Integer): Integer; cdecl; external libc name '_close';
function dup2(oldfd: Integer; newfd: Integer): Integer; cdecl; external libc name '_dup2';
function execl(path: PAnsiChar; argv1: PAnsiChar; argv2: PAnsiChar; argv3: PAnsiChar; argv4: PAnsiChar): Integer; cdecl; external libc name '_execl';
function fdopen(fd: Integer; mode: PAnsiChar): Integer; cdecl; external libc name '_fdopen';
function kill(pid: Integer; sig: Integer): Integer; cdecl; external libc name '_kill';
function killpg(pid: Integer; sig: Integer): Integer; cdecl; external libc name '_killpg';
function getpgrp(): Integer; cdecl; external libc name '_getpgrp';

implementation

uses
  PublicVar;

{ TExecCommand_Thread }

function popen2(const Command: PAnsiChar; Modes: PAnsiChar; var pid: Integer): PIOFile;
const
  m_READ = 0;
  m_WRITE = 1;
var
  child_pid: Integer;
  fd: array[0..2] of Integer;
begin
  pipe(@fd);
  child_pid:= fork();
  if (child_pid = -1) then
    begin
      perror('fork');
      Result:= Pointer(1);
      Exit;
    end;

  if (child_pid = 0) then
    begin
      if (Modes = 'r')  then
        begin
          close(fd[m_READ]);    //Close the READ end of the pipe since the child's fd is write-only
          dup2(fd[m_WRITE], 1); //Redirect stdout to pipe
        end
      else
        begin
          close(fd[m_WRITE]);    //Close the WRITE end of the pipe since the child's fd is read-only
          dup2(fd[m_READ], 0);   //Redirect stdin to pipe
        end;
      execl('/bin/sh', 'sh', '-c', command, nil);
      Result:= Pointer(0);
      Exit;
    end
  else
    begin
      if (Modes = 'r')  then
        begin
          close(fd[m_WRITE]); //Close the WRITE end of the pipe since parent's fd is read-only
        end
      else
        begin
          close(fd[m_READ]); //Close the READ end of the pipe since parent's fd is write-only
        end;
    end;
  pid:= child_pid;
//  pid:= getpgrp();    //取GPID

  if (Modes = 'r')  then
    begin
      Result:= Pointer(fdopen(fd[m_READ], 'r'));
      Exit;
    end;
  Result:= Pointer(fdopen(fd[m_WRITE], 'w'));
end;

function popen3(const Command: PAnsiChar; Modes: PAnsiChar; var pid: Integer): PIOFile;
const
  m_READ = 0;
  m_WRITE = 1;
  m_ERROR = 2;
var
  child_pid: Integer;
  fd: array[0..2] of Integer;
begin
  pipe(@fd);
  child_pid:= fork();
  if (child_pid = -1) then
    begin
      perror('fork');
      Result:= Pointer(1);
      Exit;
    end;

  if (child_pid = 0) then     //子进程
    begin
      if (Modes = 'r')  then
        begin
          close(fd[m_READ]);    //Close the READ end of the pipe since the child's fd is write-only
          dup2(fd[m_WRITE], 2); //Redirect stdout to pipe
        end
      else
        begin
          close(fd[m_WRITE]);    //Close the WRITE end of the pipe since the child's fd is read-only
          dup2(fd[m_READ], 0);   //Redirect stdin to pipe
        end;
      execl('/bin/sh', 'sh', '-c', command, nil);
      Result:= Pointer(0);
      Exit;
    end
  else
    begin                     //父进程
      if (Modes = 'r')  then
        begin
          close(fd[m_WRITE]); //Close the WRITE end of the pipe since parent's fd is read-only
        end
      else
        begin
          close(fd[m_READ]); //Close the READ end of the pipe since parent's fd is write-only
        end;
    end;
  pid:= child_pid;

  if (Modes = 'r')  then
    begin
      Result:= Pointer(fdopen(fd[m_READ], 'r'));
      Exit;
    end;
  Result:= Pointer(fdopen(fd[m_WRITE], 'w'));
end;

procedure TExecCommand_Thread.SetMemo_log(const Value: TMemo);
begin
  FLock.Acquire;
  try
    try
      FMemo_Log:= Value;
    except
      ;
    end;
  finally
    FLock.Release;
  end;
end;

procedure TExecCommand_Thread.InputToMemo;
begin
  if (FMemo_Log = nil) then
    Exit;
  FMemo_Log.Lines.Text:= FMemo_Log.Lines.Text + FReadFromPipeStr;
  FMemo_Log.SelStart:= Length(FMemo_Log.Lines.Text);
//  SendMessage(FMemo_Log.Handle, WM_VSCROLL, MAKELONG(SB_BOTTOM, 0), 0);
end;

procedure TExecCommand_Thread.CaptureConsoleOutput(const ACommand, AParameters: string);
const
  BufferSize: Integer = 115200;
var
  Buffer: PAnsiChar;
  TempString: AnsiString;
  BytesRead: Integer;
begin
  TempString:= '';
//  FOutput:= popen(PAnsiChar(Ansistring(ACommand + ' ' + AParameters)), 'r');
//  FOutput:= popen2(PAnsiChar(Ansistring(ACommand + ' ' + AParameters)), 'r', FCMDPID);
  FOutput:= popen3(PAnsiChar(Ansistring(ACommand + ' ' + AParameters)), 'r', FCMDPID);
//  FReadFromPipeStr:= Integer(FCMDPID).ToString + #13 + #10;
//  AppendOutputToLog(FReadFromPipeStr);
//  Synchronize(InputToMemo);

  GetMem(Buffer, BufferSize);
  if Assigned(FOutput) then
    try
      fcntl(fileno(FOutput), F_SETFL, O_NONBLOCK);
      while feof(FOutput) = 0 do
        begin
          BytesRead:= fread(Buffer, 1, BufferSize, FOutput);
          if (BytesRead > 0) then
            begin
              SetLength(TempString, Length(TempString) + BytesRead);
              Move(Buffer^, TempString[length(TempString) - (BytesRead - 1)], BytesRead);
              FReadFromPipeStr:= string(TempString);
              AppendOutputToLog(FReadFromPipeStr);
              Synchronize(InputToMemo);
              TempString:= '';
            end;
          Sleep(200);

//          if fgets(Buffer, BufferSize, FOutput) <> null  then
//            begin
//              FReadFromPipeStr:= string(Buffer);
//              AppendOutputToLog(FReadFromPipeStr);
//              Synchronize(InputToMemo);
//            end;
        end;
    finally
      pclose(FOutput);
      wait(nil);
      FreeMem(Buffer, BufferSize);
    end;
end;

procedure TExecCommand_Thread.AppendOutputToLog(AppendStr: string);
begin
  FLock.Acquire;
  try
    try
      FCMDLog:= FCMDLog + AppendStr;
    except
      ;
    end;
  finally
    FLock.Release;
  end;
end;

function TExecCommand_Thread.GetWholeLog: string;
begin
  FLock.Acquire;
  try
    Result:= FCMDLog;
  finally
    FLock.Release;
  end;
end;

constructor TExecCommand_Thread.Create(CommandLine: string; CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);

  FLock:= TCriticalSection.Create;
  FCMDLog:= '';
  FMemo_Log:= nil;
  FCorrectQuit:= False;
  FCommandLine:= CommandLine;
  FThreadState:= 0;
end;

destructor TExecCommand_Thread.Destroy;
begin
  FLock.Free;
  inherited;
end;

procedure TExecCommand_Thread.Execute;
begin
  FThreadState:= 1;
  FCorrectQuit:= False;
  try
    FReadFromPipeStr:= '执行命令：' + FCommandLine + #13 + #10;
    AppendOutputToLog(FReadFromPipeStr);
    Synchronize(InputToMemo);
    if Length(FCommandLine) > MaxCommandLen then
      begin
        FReadFromPipeStr:= '命令行字符数大于所允许的最大长度，命令中止！' + #13 + #10;
        AppendOutputToLog(FReadFromPipeStr);
        Synchronize(InputToMemo);
      end
    else
      begin
        FReadFromPipeStr:= '*************************** begin ***************************' + #13 + #10;
        AppendOutputToLog(FReadFromPipeStr);
        Synchronize(InputToMemo);

        CaptureConsoleOutput(FCommandLine, '');
      end;
    FReadFromPipeStr:= '**************************** end ****************************' + #13 + #10 + #13 + #10;
    AppendOutputToLog(FReadFromPipeStr);
    Synchronize(InputToMemo);

//    if (not FCorrectQuit) then
//      PostMessage(FMainFormHandle, WM_DOSCOMMANDSTOP, 0, LPARAM(FOwner));

    FThreadState:= 2;
    while not Terminated do
      begin
        Application.ProcessMessages;
        Sleep(200);
      end;
  finally
    FThreadState:= 0;
  end;//try
end;

end.

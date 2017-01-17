unit OSXFun;

interface

const
  libc = '/usr/lib/libc.dylib';
  F_SETFL = 4;
  O_NONBLOCK = $0004;

type
  PIOFile = Pointer;

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

procedure signal(signum: Integer; handler: Integer); cdecl; external libc name '_signal';

procedure chdir(path: PAnsiChar); cdecl; external libc name '_chdir';

function popen2(const Command: PAnsiChar; Modes: PAnsiChar; var pid: Integer): PIOFile;
function popen3(const Command: PAnsiChar; Modes: PAnsiChar; var pid: Integer): PIOFile;




//function LSSharedFileListInsertItemURL( inList: LSSharedFileListRef;
//  insertAfterThisItem: LSSharedFileListItemRef;
//  inDisplayName: CFStringRef;
//  inIconRef: IconRef;
//  inURL: CFURLRef;
//  inPropertiesToSet: CFDictionaryRef;
//  inPropertiesToClear: CFArrayRef ): LSSharedFileListItemRef; external name '_LSSharedFileListInsertItemURL';

implementation

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

  SIGCHLD = 17;
  SIG_IGN = (1);
var
  child_pid: Integer;
  fd: array[0..2] of Integer;
begin
  pipe(@fd);
  child_pid:= fork();
  signal(SIGCHLD, SIG_IGN);
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

end.

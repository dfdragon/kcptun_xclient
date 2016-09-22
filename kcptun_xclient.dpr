program kcptun_xclient;

uses
  FMX.Forms,
  Main in 'Main.pas' {FMain},
  Class_ClientNode in 'Class_ClientNode.pas',
  Interface_op in 'Interface_op.pas',
  OneCopy in 'OneCopy.pas',
  Photo in 'Photo.pas' {FPhoto},
  PublicFun in 'PublicFun.pas',
  PublicVar in 'PublicVar.pas',
  Thread_ExecCommand in 'Thread_ExecCommand.pas';

{$R *.res}

begin
  Application.Initialize;
  PublicVar.FileVer:= PublicFun.GetAppVersionStr;
//  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFPhoto, FPhoto);
  Application.Run;
end.

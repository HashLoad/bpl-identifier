program BplIdentifier;

{$APPTYPE CONSOLE}
{$R *.res}

uses
{$IFDEF VER220}
  SysUtils
{$ELSE}
  System.SysUtils
{$ENDIF}
  ;

var
  LBpl: string;
  LFlag: Integer;
  LHnd: NativeUInt;

begin
  LBpl := ParamStr(1);
  try
    LHnd := LoadPackage(LBpl);
    GetPackageInfo(LHnd, nil, LFlag, nil);
    UnloadPackage(LHnd);
  except
    ExitCode := 1;
  end;

  if not(LFlag and pfRunOnly = pfRunOnly) then
  begin
    WriteLn('Design time: ' + LBpl);
    ExitCode := 0;
  end
  else
  begin
    WriteLn('Run time: ' + LBpl);
    ExitCode := 1;
  end;


end.

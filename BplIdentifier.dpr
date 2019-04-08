program BplIdentifier;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

procedure PackageInfoProc(const Name: string; NameType: TNameType; Flags: Byte; Param: Pointer);
begin

end;

var
  LBpl: string;
  LFlag: Integer;
  LHnd: NativeUInt;

begin
  LBpl := ParamStr(1);
  try
    LHnd := LoadPackage(LBpl);
    GetPackageInfo(LHnd, nil, LFlag, PackageInfoProc);
    UnloadPackage(LHnd);
  except
    ExitCode := 1;
  end;

  if not(LFlag and pfRunOnly = pfRunOnly) then
    WriteLn('Design time: ' + LBpl)
  else
    WriteLn('Run time: ' + LBpl);


end.

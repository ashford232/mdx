
#define AppName "MDX"
#define AppVersion "0.1.0"
#define AppPublisher "Room06Tech"
#define AppExeName "mdx.exe"

[Setup]
AppId={{A5B9E1D2-7C43-4F86-9A21-6D8B3C0E2F51}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
DefaultDirName={autopf}\Room06Tech\MDX
DefaultGroupName=MDX
OutputDir=build\installer
OutputBaseFilename=MDX-Setup-{#AppVersion}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
UninstallDisplayIcon={app}\{#AppExeName}
ChangesEnvironment=yes

[Files]
Source: "build\mdx.exe"; DestDir: "{app}"; Flags: ignoreversion

[Tasks]
Name: "addtopath"; Description: "Add MDX to the system PATH"; GroupDescription: "Additional options:"; Flags: checkedonce

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; \
    ValueData: "{olddata};{app}"; Tasks: addtopath; \
    Check: NeedsAddPath(ExpandConstant('{app}'))

[Code]

function NormalizePathEntry(Value: string): string;
begin
  Result := Trim(Value);

  while (Length(Result) > 0) and
        (Copy(Result, Length(Result), 1) = '\') do
    Delete(Result, Length(Result), 1);
end;

function NeedsAddPath(Param: string): Boolean;
var
  Paths: string;
  Entry: string;
  P: Integer;
begin
  Result := True;

  if RegQueryStringValue(
    HKLM,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path',
    Paths
  ) then
  begin
    while Paths <> '' do
    begin
      P := Pos(';', Paths);

      if P > 0 then
      begin
        Entry := Copy(Paths, 1, P - 1);
        Delete(Paths, 1, P);
      end
      else
      begin
        Entry := Paths;
        Paths := '';
      end;

      if CompareText(
        NormalizePathEntry(Entry),
        NormalizePathEntry(Param)
      ) = 0 then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

procedure CurUninstallStepChanged(
  CurUninstallStep: TUninstallStep
);
var
  Paths: string;
  Remaining: string;
  Entry: string;
  AppPath: string;
  P: Integer;
begin
  if CurUninstallStep = usUninstall then
  begin
    AppPath := NormalizePathEntry(ExpandConstant('{app}'));

    if RegQueryStringValue(
      HKLM,
      'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
      'Path',
      Paths
    ) then
    begin
      Remaining := '';

      while Paths <> '' do
      begin
        P := Pos(';', Paths);

        if P > 0 then
        begin
          Entry := Copy(Paths, 1, P - 1);
          Delete(Paths, 1, P);
        end
        else
        begin
          Entry := Paths;
          Paths := '';
        end;

        if CompareText(
          NormalizePathEntry(Entry),
          AppPath
        ) <> 0 then
        begin
          if Remaining <> '' then
            Remaining := Remaining + ';';

          Remaining := Remaining + Entry;
        end;
      end;

      RegWriteExpandStringValue(
        HKLM,
        'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
        'Path',
        Remaining
      );
    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
    MsgBox(
      'MDX has been installed successfully!' + #13#10 +
      'Open a new terminal and run: mdx --help',
      mbInformation,
      MB_OK
    );
end;

unit Logger;

interface

procedure Log(const Msg: string);
procedure LogError(const Msg: string);

implementation

uses
  System.SysUtils, System.Classes;

const
  LOG_FOLDER = 'Logs';
  LOG_FILE   = 'app.log';

function GetLogFilePath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
            LOG_FOLDER + PathDelim + LOG_FILE;
end;

procedure WriteLog(const Level, Msg: string);
var
  LogFile: TextFile;
  FilePath: string;
begin
  FilePath := GetLogFilePath;

  // Cria a pasta Logs se não existir
  if not DirectoryExists(ExtractFileDir(FilePath)) then
    ForceDirectories(ExtractFileDir(FilePath));

  AssignFile(LogFile, FilePath);

  if FileExists(FilePath) then
    Append(LogFile)
  else
    Rewrite(LogFile);

  try
    Writeln(LogFile,
      FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) +
      ' [' + Level + '] ' + Msg);
  finally
    CloseFile(LogFile);
  end;
end;

procedure Log(const Msg: string);
begin
  WriteLog('INFO', Msg);
end;

procedure LogError(const Msg: string);
begin
  WriteLog('ERROR', Msg);
end;

end.


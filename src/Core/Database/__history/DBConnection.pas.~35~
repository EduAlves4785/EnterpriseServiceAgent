unit DBConnection;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  Logger, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Pool, FireDAC.VCLUI.Wait,
  Data.DB,
  AppConfig;

type
  TDBConnection = class(TDataModule)
    FDConnection: TFDConnection;
  private
    { Private declarations }
  public
    procedure Connect;
    procedure Disconnect;
  end;

var
  DataBaseConnection: TDBConnection;

implementation
{$R *.dfm}
procedure TDBConnection.Connect;
var
  Cfg: TDatabaseConfig;
begin
  if FDConnection.Connected then
    Exit;

    Cfg := GetDatabaseConfig;

    Log('Database configurado: '+Cfg.Database+' em '+Cfg.Server+':'+IntToStr(Cfg.Port));

    Log('Iniciando conexão com banco de dados');

    FDConnection.Params.Clear;

  FDConnection.Params.Add('DriverID='+Cfg.DriverID);
  FDConnection.Params.Add('Server='+Cfg.Server);
  FDConnection.Params.Add('Port='+IntToStr(Cfg.Port));
  FDConnection.Params.Add('Database='+Cfg.Database);
  FDConnection.Params.Add('User_Name='+Cfg.User);
  FDConnection.Params.Add('Password=postgres'+Cfg.Password);
  FDConnection.LoginPrompt := False;

  FDConnection.Connected := True;
end;

procedure TDBConnection.Disconnect;
begin
  if FDConnection.Connected then
    FDConnection.Connected:=False;
end;

end.



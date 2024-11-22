unit dmPrincipal;

interface

uses
  System.SysUtils, Data.DB, Data.SqlExpr;

procedure InserirDadosBD(const strSQL: string);
procedure ExecutarSql(const strSQL: string);

implementation

procedure InserirDadosBD(const strSQL: string);
var
  SQLConnection: TSQLConnection;
  SQLQuery: TSQLQuery;
begin
  SQLConnection := TSQLConnection.Create(nil);
  SQLQuery := TSQLQuery.Create(nil);
  try
    SQLConnection.DriverName := 'MSSQL';
    SQLConnection.Params.Values['OSAuthent'] := 'Yes';
    SQLConnection.Params.Values['Database'] := 'PadraoTestes';
    SQLConnection.Params.Values['Server'] := 'DESKTOP-LQTA0BU\SQLEXPRESS';
    SQLConnection.LoginPrompt := False;

    SQLConnection.Open;

    SQLQuery.SQLConnection := SQLConnection;
    SQLQuery.SQL.Text := strSQL;

    SQLQuery.ExecSQL;
  finally
    SQLQuery.Free;
    SQLConnection.Free;
  end;
end;

procedure ExecutarSql(const strSQL: string);
var
  SQLConnection: TSQLConnection;
  SQLQuery: TSQLQuery;
begin
  SQLConnection := TSQLConnection.Create(nil);
  SQLQuery := TSQLQuery.Create(nil);
  try
    SQLConnection.DriverName := 'MSSQL';
    SQLConnection.Params.Values['OSAuthent'] := 'Yes';
    SQLConnection.Params.Values['Database'] := 'PadraoTestes';
    SQLConnection.Params.Values['Server'] := 'DESKTOP-LQTA0BU\SQLEXPRESS';
    SQLConnection.LoginPrompt := False;

    SQLConnection.Open;

    SQLQuery.SQLConnection := SQLConnection;
    SQLQuery.SQL.Text := strSQL;

    SQLQuery.Open;
  finally
    SQLQuery.Free;
    SQLConnection.Free;
  end;
end;

end.

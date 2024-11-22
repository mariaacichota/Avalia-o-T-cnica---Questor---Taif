unit Cliente;

interface

type
  TCliente = class
  private
    FClienteID: Integer;
    FNome: string;
    FCPF: string;
    FDataCadastro: TDate;
  public
    constructor Create(AClienteID: Integer; ANome, ACPF: string; ADataCadastro: TDate);
    procedure InserirDadosBD;
    procedure ExecutarSql;
  end;

implementation

uses
  dmPrincipal, System.SysUtils;

{ TCliente }

constructor TCliente.Create(AClienteID: Integer; ANome, ACPF: string; ADataCadastro: TDate);
begin
  FClienteID := AClienteID;
  FNome := ANome;
  FCPF := ACPF;
  FDataCadastro := ADataCadastro;
end;

procedure TCliente.ExecutarSql;
begin
  dmPrincipal.ExecutarSql('SELECT * FROM Clientes');
end;

procedure TCliente.InserirDadosBD;
begin
  dmPrincipal.InserirDadosBD(
  Format('INSERT INTO Clientes (Nome, CPF, DataCadastro) VALUES (''%s'', ''%s'', ''%s'')',
   [FNome, FCPF, DateToStr(FDataCadastro)]));
end;

end.

unit Venda;

interface

uses
  System.SysUtils, System.Classes;

type
  TVenda = class
  private
    FVendaID: Integer;
    FClienteID: Integer;
    FCarroID: Integer;
    FDataVenda: TDate;
  public
    constructor Create(AVendaID, AClienteID, ACarroID: Integer; ADataVenda: TDate);
    procedure InserirDadosBD;
    procedure ExecutarSql;
  end;

implementation

uses
  dmPrincipal;

constructor TVenda.Create(AVendaID, AClienteID, ACarroID: Integer; ADataVenda: TDate);
begin
  FVendaID := AVendaID;
  FClienteID := AClienteID;
  FCarroID := ACarroID;
  FDataVenda := ADataVenda;
end;

procedure TVenda.ExecutarSql;
begin
  dmPrincipal.ExecutarSql('SELECT * FROM Vendas');
end;

procedure TVenda.InserirDadosBD;
begin
  dmPrincipal.InserirDadosBD(Format('INSERT INTO Vendas (ClienteID, CarroID, DataVenda) VALUES (%d, %d, ''%s'')',
                                  [FClienteID, FCarroID, DateToStr(FDataVenda)]));
end;


end.

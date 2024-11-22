unit Carro;

interface

uses
  System.SysUtils, System.Classes;

type
  TCarro = class
  private
    FCarroID: Integer;
    FModelo: string;
    FDataLancamento: TDate;
  public
    constructor Create(ACarroID: Integer; AModelo: string; ADataLancamento: TDate);
    procedure InserirDadosBD;
    procedure ExecutarSql;
  end;

implementation

uses
  dmPrincipal;

constructor TCarro.Create(ACarroID: Integer; AModelo: string; ADataLancamento: TDate);
begin
  FCarroID := ACarroID;
  FModelo := AModelo;
  FDataLancamento := ADataLancamento;
end;

procedure TCarro.ExecutarSql;
begin
  dmPrincipal.ExecutarSql('SELECT * FROM Carros');
end;

procedure TCarro.InserirDadosBD;
begin
  dmPrincipal.InserirDadosBD(Format('INSERT INTO Carros (Modelo, DataLancamento) VALUES (\'%s\', \'%s\')'
                                , [FModelo, DateToStr(FDataLancamento)]));
end;

end.

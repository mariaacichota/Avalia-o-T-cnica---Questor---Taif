unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Venda, Cliente, Carro;

type
  TfrmPrincipal = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    procedure InserirNovosClientes;
    procedure InserirNovosCarros;
    procedure InserirVendasParaClientes;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  InserirNovosClientes;
end;

procedure TfrmPrincipal.InserirNovosCarros;
var
  Carros: array[1..5] of TCarro;
  I: integer;
begin
  Carros[1] := TCarro.Create(0, 'Modelo A', EncodeDate(2024, 1, 1));
  Carros[2] := TCarro.Create(0, 'Modelo B', EncodeDate(2024, 1, 2));
  Carros[3] := TCarro.Create(0, 'Modelo C', EncodeDate(2024, 1, 3));
  Carros[4] := TCarro.Create(0, 'Modelo D', EncodeDate(2024, 1, 4));
  Carros[5] := TCarro.Create(0, 'Modelo E', EncodeDate(2024, 1, 5));

  for I := Low(Carros) to High(Carros) do
    Carros[I].InserirDadosBD;
end;

procedure TfrmPrincipal.InserirNovosClientes;
var
  Clientes: array[1..5] of TCliente;
  I: integer;
begin
  Clientes[1] := TCliente.Create(0, 'Cliente 1', '01234567890', Date);
  Clientes[2] := TCliente.Create(0, 'Cliente 2', '09876543210', Date);
  Clientes[3] := TCliente.Create(0, 'Cliente 3', '02345678901', Date);
  Clientes[4] := TCliente.Create(0, 'Cliente 4', '03456789012', Date);
  Clientes[5] := TCliente.Create(0, 'Cliente 5', '04567890123', Date);

  for I := Low(Clientes) to High(Clientes) do
    Clientes[I].InserirDadosBD;
end;

procedure TfrmPrincipal.InserirVendasParaClientes;
var
  Vendas: array[1..5] of TVenda;
  I: integer;
begin
  Vendas[1] := TVenda.Create(0, 1, 1, Date);
  Vendas[2] := TVenda.Create(0, 2, 2, Date);
  Vendas[3] := TVenda.Create(0, 3, 3, Date);
  Vendas[4] := TVenda.Create(0, 4, 4, Date);
  Vendas[5] := TVenda.Create(0, 5, 5, Date);

  for I := Low(Vendas) to High(Vendas) do
    Vendas[I].InserirDadosBD;
end;

end.

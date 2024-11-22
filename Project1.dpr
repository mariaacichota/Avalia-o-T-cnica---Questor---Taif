program Project1;

uses
  Vcl.Forms,
  Carro in 'Carro.pas',
  Cliente in 'Cliente.pas',
  dmPrincipal in 'dmPrincipal.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Venda in 'Venda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

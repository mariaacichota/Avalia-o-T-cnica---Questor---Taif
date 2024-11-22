program Project1;

uses
  Vcl.Forms,
  uPrincipal in '..\uPrincipal.pas' {frmPrincipal},
  Cliente in '..\Cliente.pas',
  dmPrincipal in '..\dmPrincipal.pas',
  Venda in '..\Venda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

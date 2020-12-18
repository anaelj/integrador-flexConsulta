program IntegradorFlex;

uses
  Vcl.Forms,
  uAutenticacao in 'uAutenticacao.pas' {FormAutenticacao},
  uDrivers in 'uDrivers.pas' {FormDrivers},
  uTravels in 'uTravels.pas' {FormTravels},
  uPrincipal in 'uPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormAutenticacao, FormAutenticacao);
  Application.CreateForm(TFormDrivers, FormDrivers);
  Application.CreateForm(TFormTravels, FormTravels);
  Application.Run;
end.

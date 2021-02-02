program CarSys;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  uDM_testePratico in 'uDM_testePratico.pas' {DM_DB: TDataModule},
  CadCliente in 'CadCliente.pas' {fCadCliente},
  uBusca in 'uBusca.pas' {FBusca},
  URegPedidos in 'URegPedidos.pas' {FProspects},
  Ulogin in 'Ulogin.pas' {FLogin},
  InscricaoFiscal in 'InscricaoFiscal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_DB, DM_DB);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.

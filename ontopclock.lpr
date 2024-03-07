program ontopclock;

{$MODE Delphi}

uses
  Forms, Interfaces,
  uMain {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.

program praktikumPBD;

uses
  Forms,
  Login in 'Login.pas' {Form1},
  Unit1 in 'Unit1.pas' {DataUser: TDataModule},
  Unit2 in 'Unit2.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit3 in 'Unit3.pas' {DataAdmin: TDataModule},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataUser, DataUser);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TDataAdmin, DataAdmin);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.

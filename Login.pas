unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TButton;
    CheckBox1: TCheckBox;
    lbl4: TLabel;
    btn2: TButton;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    img1: TImage;
    procedure btn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i, z : Integer;
  b, c, a : string;

implementation

uses Unit1, Unit2, Unit4, Unit5, Unit6, Unit3;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  a, b, c: string;
  z: Integer;
begin
  DataUser.zqry1.SQL.Text := 'select * from user';
  DataUser.zqry1.Active := True;

  z := 0; // Mengatur nilai awal z menjadi 0

  for i := 1 to DataUser.zqry1.RecordCount do
  begin
    a := DataUser.zqry1['level'];
    b := DataUser.zqry1['username'];
    c := DataUser.zqry1['Password'];

    if (edt1.Text = b) and (edt2.Text = c) then
    begin
      if a = 'admin' then
        z := 1
      else if a = 'user' then
        z := 2;

      Break; // Keluar dari loop jika sudah menemukan data yang cocok
    end
    else
      DataUser.zqry1.Next;
  end;

  case z of
    1:
    begin
      MessageDlg('Selamat Datang Admin', mtInformation, [mbOK], 0);
      Form1.Hide;
      Form3.Show;
    end;
    2:
    begin
      MessageDlg('Selamat Datang User', mtInformation, [mbOK], 0);
      Form1.Hide;
      Form6.Show;
    end;
    else
      MessageDlg('Username atau Password salah. Silahkan cek kembali.', mtError, [mbOK], 0);
  end;
  edt1.Clear;
  edt2.Clear;
  begin
    DataAdmin.zqry1.Active := True;
    DataAdmin.zqry2.Active := True;

  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
begin
edt2.PasswordChar:=#0;
end
else begin
edt2.PasswordChar:='*';
end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
 Form1.Hide;
 Form5.Show;
end;

end.


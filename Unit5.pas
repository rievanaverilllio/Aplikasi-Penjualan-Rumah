unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm5 = class(TForm)
    lbl1: TLabel;
    ed1: TEdit;
    ed2: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TButton;
    btn2: TButton;
    lbl4: TLabel;
    lbl5: TLabel;
    img1: TImage;
    lbl6: TLabel;
    ed3: TEdit;
    lbl7: TLabel;
    ed4: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1, Login;

{$R *.dfm}

procedure TForm5.btn1Click(Sender: TObject);
begin
  // Memeriksa apakah semua kolom telah diisi
  if (Trim(ed1.Text) = '') or (Trim(ed2.Text) = '') then
  begin
    ShowMessage('Silahkan isi semua kolom!');
    Exit;
  end;

  DataUser.zqry1.Active := False;
  DataUser.zqry1.SQL.Clear;
  DataUser.zqry1.SQL.Text :=
    'INSERT INTO user (username, password, nama, email) ' +
    'VALUES ("' + Ed1.Text + '","' + Ed2.Text + '","' + Ed3.Text + '","' + Ed4.Text + '")';
  DataUser.zqry1.ExecSQL;

  DataUser.zqry1.Active := False;
  DataUser.zqry1.SQL.Text := 'SELECT * FROM user ';
  DataUser.zqry1.Active := True;

  Application.MessageBox('Berhasil Register', 'Tambah Data', MB_OK + MB_ICONINFORMATION);

  Ed1.Clear;
  Ed2.Clear;
  Ed3.Clear;
  Ed4.Clear;
  Form5.Hide;
  Form1.Show;
end;

procedure TForm5.btn2Click(Sender: TObject);
begin
 Form5.Hide;
 Form1.Show;
end;

end.

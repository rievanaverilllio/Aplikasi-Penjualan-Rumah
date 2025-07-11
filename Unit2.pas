unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, StdCtrls, jpeg,
  frxClass, frxDBSet;

type
  TForm3 = class(TForm)
    smdbgrd1: TSMDBGrid;
    SMDBNavigator1: TSMDBNavigator;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    btn1: TButton;
    btn3: TButton;
    edt5: TEdit;
    btn2: TButton;
    img1: TImage;
    btn4: TButton;
    frxReport1: TfrxReport;
    frxDataset1: TfrxDBDataset;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure SMDBNavigator1Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure SMDBNavigator2Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure SMDBNavigator3Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  Unit1, Login, Unit3, Unit4;

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
DataAdmin.zqry1.Active := False ;
DataAdmin.zqry1.SQL.Clear;
DataAdmin.zqry1.SQL.Text := 'insert into kontrakan(id_kontrakan,kategori,nama,luas,harga_kontrakan) VALUES("'+Edt1.Text+'","'+Edt2.Text+'","'+Edt3.Text+'","'+Edt4.Text+'","'+Edt5.Text+'")';
DataAdmin.zqry1.ExecSQL;
DataAdmin.zqry1.Active := False ;
DataAdmin.zqry1.SQL.Text := 'SELECT * FROM kontrakan ';
DataAdmin.zqry1.Active := True ;
Application.MessageBox('Berhasil menambahkan data','Tambah Data',MB_OK + MB_ICONINFORMATION);
Edt1.Clear;
Edt2.Clear;
Edt3.Clear;
Edt4.Clear;
Edt5.Clear;
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
DataAdmin.zqry1.Active := False ;
DataAdmin.zqry1.SQL.Clear;
DataAdmin.zqry1.SQL.Text := 'UPDATE kontrakan SET kategori = "'+Edt2.Text+'" , nama = "'+Edt3.Text+'" , luas = "'+Edt4.Text+'" , harga_kontrakan = "'+Edt5.Text+'" WHERE id_kontrakan = "'+Edt1.Text+'"';
DataAdmin.zqry1.ExecSQL;
DataAdmin.zqry1.Active := False ;
DataAdmin.zqry1.SQL.Text := 'SELECT * FROM kontrakan ';
DataAdmin.zqry1.Active := True ;
Application.MessageBox('Berhasil Mengedit data','Edit Data',MB_OK + MB_ICONINFORMATION);
Edt1.Clear;
Edt2.Clear;
Edt3.Clear;
Edt4.Clear;
Edt5.Clear;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
DataAdmin.zqry1.Active := False ;
DataAdmin.zqry1.SQL.Clear;
DataAdmin.zqry1.SQL.Text := 'DELETE FROM kontrakan WHERE id_kontrakan = "'+edt1.Text+'"';
DataAdmin.zqry1.ExecSQL;
DataAdmin.zqry1.Active := False ;
DataAdmin.zqry1.SQL.Text := 'SELECT * FROM kontrakan ';
DataAdmin.zqry1.Active := True ;
Application.MessageBox('Berhasil Menghapus Data','Hapus Data',MB_OK + MB_ICONINFORMATION);
Edt1.Clear;
Edt2.Clear;
Edt3.Clear;
Edt4.Clear;
Edt5.Clear;
end;


procedure TForm3.SMDBNavigator1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
case Button of
sbFind:DataAdmin.find1.Execute;
sbFilter:DataAdmin.filter1.Execute;
sbExport:
 begin
   if Application.MessageBox('"apakah anda ingin export latihan?"', '',
     MB_OKCANCEL) = IDOK then
   begin
     DataAdmin.export1.Select;
   end;

 end;
sbPrint:
begin
   frxReport1.ShowReport();
 end;
end;
end;

procedure TForm3.SMDBNavigator2Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
sbFind:DataAdmin.find2.Execute;
sbFilter:DataAdmin.filter2.Execute;
sbExport:
begin
if Application.MessageBox('"apakah anda ingin export?"', '', MB_OKCANCEL) =
  IDOK then
begin
  DataAdmin.export2.Select;
end;
end;
end;
end;

procedure TForm3.SMDBNavigator3Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
sbFind:DataAdmin.find3.Execute;
sbFilter:DataAdmin.filter3.Execute;
sbExport:
begin
if Application.MessageBox('"apakah anda ingin export?"', '', MB_OKCANCEL) =
  IDOK then
begin
  DataAdmin.export3.Select;
end;
end;
end;
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
form3.Hide;
form1.Show;
end;

procedure TForm3.btn5Click(Sender: TObject);
begin
form3.Hide;
form4.Show;
end;

end.


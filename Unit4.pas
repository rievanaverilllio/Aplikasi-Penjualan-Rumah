unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid,
  frxClass, frxDBSet, Mask, DBCtrls, jpeg;

type
  TForm4 = class(TForm)
    SMDBNavigator: TSMDBNavigator;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    frx: TfrxReport;
    edt5: TEdit;
    lbl5: TLabel;
    smdbgrd1: TSMDBGrid;
    lbl6: TLabel;
    btn4: TButton;
    btn5: TButton;
    lbl7: TLabel;
    img1: TImage;
    edt6: TEdit;
    procedure SMDBNavigatorClick(Sender: TObject; Button: TSMNavigateBtn);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses Unit1, Unit2, Unit3;

{$R *.dfm}

procedure TForm4.SMDBNavigatorClick(Sender: TObject;
  Button: TSMNavigateBtn);
begin
case Button of
sbFind:DataUser.find1.Execute;
sbFilter:DataUser.filter1.Execute;
sbExport:
begin
if Application.MessageBox('"apakah anda ingin export?"', '', MB_OKCANCEL) =
  IDOK then
begin
  DataUser.export1.Select;
end;
end;
end;
end;
procedure TForm4.btn5Click(Sender: TObject);
begin
form4.Hide;
form3.Show;
end;

procedure TForm4.btn4Click(Sender: TObject);
begin
frx.LoadFromFile('transaksi.fr3');
  TfrxMemoView(frx.FindObject('Memo8')).Memo.Text := edt1.Text;
  TfrxMemoView(frx.FindObject('Memo9')).Memo.Text := edt2.Text;
  TfrxMemoView(frx.FindObject('Memo10')).Memo.Text := edt3.Text;
  TfrxMemoView(frx.FindObject('Memo11')).Memo.Text := edt4.Text;
  TfrxMemoView(frx.FindObject('Memo12')).Memo.Text := edt5.Text;
  TfrxMemoView(frx.FindObject('Memo13')).Memo.Text := edt6.Text;
  frx.ShowReport();
end;

end.

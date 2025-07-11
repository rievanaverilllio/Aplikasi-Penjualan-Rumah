unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm6 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    lbl3: TLabel;
    btn1: TButton;
    btn2: TButton;
    lbl4: TLabel;
    Spesifikasi_TipeA: TComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lst1: TListBox;
    lbl5: TLabel;
    lbl9: TLabel;
    Spesifikasi_TipeB: TComboBox;
    lbl10: TLabel;
    lbl11: TLabel;
    lst2: TListBox;
    lbl12: TLabel;
    Spesifikasi1: TComboBox;
    lbl13: TLabel;
    lbl14: TLabel;
    lst3: TListBox;
    lbl15: TLabel;
    Spesifikasi2: TComboBox;
    lbl16: TLabel;
    lbl17: TLabel;
    lst4: TListBox;
    lbl18: TLabel;
    img5: TImage;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1, Login, Unit7;

{$R *.dfm}

procedure TForm6.btn2Click(Sender: TObject);
begin
Form6.Hide;
form1.Show;
end;

procedure TForm6.btn1Click(Sender: TObject);
begin
Form6.Hide;
Form7.Show;
end;



end.

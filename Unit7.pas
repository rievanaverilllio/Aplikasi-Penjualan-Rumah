unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, jpeg, ExtCtrls;

type
  TForm7 = class(TForm)
    lbl1: TLabel;
    ed1: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    ed2: TEdit;
    ed3: TEdit;
    lbl4: TLabel;
    lst1: TListBox;
    lbl5: TLabel;
    btn1: TButton;
    lbl6: TLabel;
    ed4: TEdit;
    lbl7: TLabel;
    btn2: TButton;
    ed5: TEdit;
    ed6: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lst2: TListBox;
    btn3: TButton;
    img1: TImage;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Login, Unit6;


{$R *.dfm}

procedure TForm7.btn1Click(Sender: TObject);
var
  durasi, hargaKontrakan, totalHarga: Integer;
begin
  // Menonaktifkan query
  DataUser.zqry1.Active := False;

  // Mengambil durasi dari input pengguna
  durasi := StrToInt(Ed4.Text);

  // Mengambil harga_kontrakan dari tabel kontrakan
  DataUser.zqry1.SQL.Clear;
  DataUser.zqry1.SQL.Text := 'SELECT harga_kontrakan FROM kontrakan WHERE id_kontrakan = ' + Ed1.Text;
  DataUser.zqry1.Open;

  // Memeriksa apakah id_kontrakan ditemukan
  if DataUser.zqry1.IsEmpty then
  begin
    // Menampilkan pesan popup jika id_kontrakan tidak ditemukan
    Application.MessageBox('ID Kontrakan tidak ditemukan. Silahkan cek kembali.', 'Error', MB_OK + MB_ICONERROR);
    Exit;
  end;

  // Mengambil harga_kontrakan dari hasil query
  hargaKontrakan := DataUser.zqry1.FieldByName('harga_kontrakan').AsInteger;

  // Menghitung total harga
  totalHarga := durasi * hargaKontrakan;

  // Menyimpan total harga di entitas total_harga pada tabel sewa
  DataUser.zqry1.SQL.Clear;
  DataUser.zqry1.SQL.Text := 'INSERT INTO sewa(id_kontrakan, tanggal_mulai, tanggal_berakhir, durasi, total_harga, nama, email) ' +
                             'VALUES ("' + Ed1.Text + '","' + Ed2.Text + '","' + Ed3.Text + '","' + Ed4.Text + '","' + IntToStr(totalHarga) + '","' + Ed5.Text + '","' + Ed6.Text + '")';
  DataUser.zqry1.ExecSQL;

  // Menampilkan data durasi * harga_kontrakan di dalam ListBox
  lst1.Items.Add('Durasi: ' + IntToStr(durasi) + ' tahun | Harga Kontrakan: ' +
                 FormatFloat('#,##0', hargaKontrakan) + ' | Total Harga: ' + FormatFloat('Rp #,##0', totalHarga));

  // Menampilkan pesan berhasil
  Application.MessageBox('Berhasil Melakukan Pembayaran', 'Tambah Data', MB_OK + MB_ICONINFORMATION);

  // Mengosongkan input dan ListBox
  Ed1.Clear;
  Ed2.Clear;
  Ed3.Clear;
  Ed4.Clear;
  Ed5.Clear;
  Ed6.Clear;
  lst1.Clear;
end;

procedure TForm7.btn2Click(Sender: TObject);
begin
  Ed1.Clear;
  Ed2.Clear;
  Ed3.Clear;
  Ed4.Clear;
  Ed5.Clear;
  Ed6.Clear;
  lst1.Clear;
  lst2.Clear;
Form7.Hide;
Form6.Show;
end;

procedure TForm7.btn3Click(Sender: TObject);
var
  durasi, hargaKontrakan, totalHarga: Integer;
begin
  lst2.Clear;
  // Mengambil durasi dari input pengguna
  durasi := StrToInt(Ed4.Text);

  // Mengambil harga_kontrakan dari tabel kontrakan
  DataUser.zqry1.SQL.Clear;
  DataUser.zqry1.SQL.Text := 'SELECT harga_kontrakan FROM kontrakan WHERE id_kontrakan = ' + Ed1.Text;
  DataUser.zqry1.Open;
  hargaKontrakan := DataUser.zqry1.FieldByName('harga_kontrakan').AsInteger;

  // Menghitung total harga tanpa menyimpan ke database
  totalHarga := durasi * hargaKontrakan;

  // Menampilkan data durasi * harga_kontrakan di dalam ListBox lst2 dengan format ribuan
  lst2.Items.Add('Total Harga: ' + FormatFloat('Rp #,##0', totalHarga));
end;

end.

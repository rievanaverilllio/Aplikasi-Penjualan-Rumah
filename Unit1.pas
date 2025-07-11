unit Unit1;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, SMDBFltr, SMDBFind, mxExport;

type
  TDataUser = class(TDataModule)
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    find1: TSMDBFindDialog;
    filter1: TSMDBFilterDialog;
    export1: TmxDBGridExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataUser: TDataUser;

implementation

{$R *.dfm}

end.

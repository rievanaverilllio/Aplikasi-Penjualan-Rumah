unit Unit3;

interface

uses
  SysUtils, Classes, mxExport, SMDBFltr, SMDBFind, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TDataAdmin = class(TDataModule)
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    find1: TSMDBFindDialog;
    filter1: TSMDBFilterDialog;
    export1: TmxDBGridExport;
    zqry2: TZQuery;
    ds2: TDataSource;
    find2: TSMDBFindDialog;
    filter2: TSMDBFilterDialog;
    export2: TmxDBGridExport;
    zqry3: TZQuery;
    ds3: TDataSource;
    find3: TSMDBFindDialog;
    filter3: TSMDBFilterDialog;
    export3: TmxDBGridExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataAdmin: TDataAdmin;

implementation

{$R *.dfm}

end.

unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, ZAbstractConnection, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    ZQuery1: TZQuery;
    ZConnection1: TZConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    CoffeeMachine1: TMenuItem;
    Cus1: TMenuItem;
    Supplier1: TMenuItem;
    Drinks1: TMenuItem;
    Statistics1: TMenuItem;
    Products1: TMenuItem;
    M1: TMenuItem;
    Maintenance1: TMenuItem;
    Manufacturer1: TMenuItem;
    Overview1: TMenuItem;
    atCustomer1: TMenuItem;
    atCustomer2: TMenuItem;
    ZQuery2: TZQuery;
    List1: TMenuItem;
    Add1: TMenuItem;
    DBNavigator1: TDBNavigator;
    Overview2: TMenuItem;
    Cleaning1: TMenuItem;
    Repair1: TMenuItem;
    Search1: TMenuItem;
    searchText: TEdit;
    searchColText: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure atCustomer2Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atCustomer1Click(Sender: TObject);
    procedure Overview2Click(Sender: TObject);
    procedure Cleaning1Click(Sender: TObject);
    procedure ZQuery1AfterOpen(DataSet: TDataSet);
    procedure Search1Click(Sender: TObject);
  private
    procedure SetupDBGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure FitGrid(Grid: TDBGrid);
const
  C_Add=3;
var
  ds: TDataSet;
  bm: TBookmark;
  i: Integer;
  w: Integer;
  a: Array of Integer;
begin
  ds := Grid.DataSource.DataSet;
  if Assigned(ds) then
  begin
    ds.DisableControls;
    bm := ds.GetBookmark;
    try
      ds.First;
      SetLength(a, Grid.Columns.Count);
      while not ds.Eof do
      begin
        for I := 0 to Grid.Columns.Count - 1 do
        begin
          if Assigned(Grid.Columns[i].Field) then
          begin
            w :=  Grid.Canvas.TextWidth(ds.FieldByName(Grid.Columns[i].Field.FieldName).DisplayText);
            if a[i] < w  then
               a[i] := w ;
          end;
        end;
        ds.Next;
      end;
      for I := 0 to Grid.Columns.Count - 1 do
      begin
        w := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption);
        if a[i] > w then
          Grid.Columns[i].Width := a[i] + C_Add
        else
          Grid.Columns[i].Width := w + C_Add;
      end;
      ds.GotoBookmark(bm);
    finally
      ds.FreeBookmark(bm);
      ds.EnableControls;
    end;
  end;
end;

procedure TForm1.Add1Click(Sender: TObject);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  try
    ZQuery1.ExecSQL;
  except on E : Exception do
    ShowMessage(E.Message);
  end;
  SetupDBGrid;

end;

procedure TForm1.atCustomer1Click(Sender: TObject);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(
  'select * from coffemachine');
  ZQuery1.Open;
  SetupDBGrid;
end;

procedure TForm1.atCustomer2Click(Sender: TObject);
begin
  //ZQuery2.Close;
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(
  'select Model,cleanDate, leaseRate, Name, Address, Phone, `e-mail`'+
  ' from coffemachine inner join customer on'+
  ' coffemachine.customer_id = customer.id;');
  ZQuery1.Open;
  SetupDBGrid;
  //ZQuery1.ExecSQL;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(
  'select    ');
  ZQuery1.Open;
end;



procedure TForm1.Cleaning1Click(Sender: TObject);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(
  'select    id,Model,cleanDate,leaseRate,'+
'(julianday(date(''now'')) - julianday(date(cleanDate)) > 30) as NeedToClean from coffemachine;');
  ZQuery1.Open;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    ZConnection1.Disconnect;
  except
  on E : Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Caption := 'Connecting to '+ ZConnection1.Database;
  try
    ZConnection1.Properties.Add('foreign_keys=TRUE');
    ZConnection1.Connect;
  except on E : Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TForm1.List1Click(Sender: TObject);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(
  'select Model from coffemachine');
  ZQuery1.Open;
end;

procedure TForm1.Overview2Click(Sender: TObject);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(
  'select * from customer');
  ZQuery1.Open;
end;

procedure TForm1.Search1Click(Sender: TObject);
var
  sqlStr : string;
begin
  sqlStr := 'select * from customer where ' +
      searchColText.Text + '=' + QuotedStr(searchText.Text);
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(sqlStr);
  ZQuery1.Open;

end;

procedure TForm1.SetupDBGrid;
var
  i : integer;
begin
  FitGrid(DBGrid1);
  {for I := 0 to DBGrid1.Columns.Count-1 do
  begin
    DBGrid1.Columns[i].Width:=100;
  end;
  }

end;

procedure TForm1.ZQuery1AfterOpen(DataSet: TDataSet);
begin
  SetupDBGrid;
end;



end.

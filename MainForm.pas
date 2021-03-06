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
    Maintenance1: TMenuItem;
    Manufacturer1: TMenuItem;
    Overview1: TMenuItem;
    atCustomer1: TMenuItem;
    atCustomer2: TMenuItem;
    List1: TMenuItem;
    DBNavigator1: TDBNavigator;
    Overview2: TMenuItem;
    Cleaning1: TMenuItem;
    Repair1: TMenuItem;
    Search1: TMenuItem;
    searchText: TEdit;
    searchColText: TEdit;
    Edit1: TMenuItem;
    Overview3: TMenuItem;
    Ingrediants1: TMenuItem;
    Edit2: TMenuItem;
    Search2: TMenuItem;
    Selectionbydrinks1: TMenuItem;
    Selectionbycustomer1: TMenuItem;
    Selectionbydrink1: TMenuItem;
    Edit3: TMenuItem;
    Edit4: TMenuItem;
    List2: TMenuItem;
    Edit5: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    List3: TMenuItem;
    Search3: TMenuItem;
    Edit6: TMenuItem;
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
    procedure Edit1Click(Sender: TObject);
    procedure Overview3Click(Sender: TObject);
    procedure Ingrediants1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Search2Click(Sender: TObject);
    procedure SelectionbyMachineClick(Sender: TObject);
    procedure Selectionbycustomer1Click(Sender: TObject);
    procedure Selectionbydrink1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure List2Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure List3Click(Sender: TObject);
    procedure Search3Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
  private
    procedure SetupDBGrid;
    procedure ListDBTable(name : string);
    procedure ExecSearchQuery(tableName:string);
    procedure OpenQuery(query : string);
    procedure DisableEdit;
    procedure EnableEdit;
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

procedure TForm1.EnableEdit;
begin
  DBNavigator1.Enabled := true;
  DbGrid1.ReadOnly := false;
end;

procedure TForm1.OpenQuery(query : string);
begin
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(query);
  ZQuery1.Open;
  SetupDBGrid;
end;

procedure TForm1.DisableEdit;
begin
  DBNavigator1.Enabled := false;
  DbGrid1.ReadOnly := true;
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
  ListDBTable('coffemachine');
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
  'select id,Model,cleanDate,leaseRate'+
' from coffemachine where (julianday(date(''now'')) - julianday(date(cleanDate)) > 30)');
  ZQuery1.Open;
  DisableEdit;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  ListDBTable('coffemachine');
  DBNavigator1.Enabled := true;
  DbGrid1.ReadOnly := false;
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
  ListDBTable('drink');
  DBNavigator1.Enabled := true;
  DbGrid1.ReadOnly := false;
end;

procedure TForm1.Edit3Click(Sender: TObject);
begin
  ListDBTable('customer');
  DBNavigator1.Enabled := true;
  DbGrid1.ReadOnly := false;
end;

procedure TForm1.Edit4Click(Sender: TObject);
begin
  ListDBTable('ingredients');
  DBNavigator1.Enabled := true;
  DbGrid1.ReadOnly := false;
end;

procedure TForm1.Edit5Click(Sender: TObject);
begin
  ListDBTable('repairParts');
  EnableEdit;
end;

procedure TForm1.Edit6Click(Sender: TObject);
begin
  ListDBTable('supplier');
  EnableEdit;
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

procedure TForm1.Ingrediants1Click(Sender: TObject);
begin
  ListDBTable('ingredients');
end;

procedure TForm1.List1Click(Sender: TObject);
begin
  DBNavigator1.Enabled := false;
  DbGrid1.ReadOnly := true;
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(
  'select Model from coffemachine');
  ZQuery1.Open;
end;

procedure TForm1.List2Click(Sender: TObject);
begin
  OpenQuery('select coffemachine.Model, repairparts.date, repairParts.description from coffemachine '+
	 'inner join repairParts on repairParts.machine_id = coffemachine.id');
  DisableEdit;
end;

procedure TForm1.List3Click(Sender: TObject);
begin
  ListDBTable('supplier');
end;

procedure TForm1.ListDBTable(name : string);
begin
  OpenQuery('select * from '+ name);
  DisableEdit;
end;

procedure TForm1.Overview2Click(Sender: TObject);
begin
  ListDBTable('customer');
end;

procedure TForm1.Overview3Click(Sender: TObject);
begin
  ListDBTable('drink');
end;

procedure TForm1.ExecSearchQuery(tableName : string);
var
  sqlStr : string;
begin
  sqlStr := 'select * from '+ tableName +' where ' +
      searchColText.Text + '=' + quotedstr(searchText.Text);
  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add(sqlStr);
  ZQuery1.Open;
  DisableEdit;
end;

procedure TForm1.Search1Click(Sender: TObject);
begin
  ExecSearchQuery('customer');
end;

procedure TForm1.Search2Click(Sender: TObject);
begin
    ExecSearchQuery('drink');
end;

procedure TForm1.Search3Click(Sender: TObject);
begin
  ExecSearchQuery('supplier');
end;

procedure TForm1.Selectionbycustomer1Click(Sender: TObject);
begin
  OpenQuery('select customer.Name, sum(sale.quantity) as `total sales` from coffemachine '+
	'inner join customer on coffemachine.customer_id = customer.id '+
	'inner join sale on sale.machine_id = coffemachine.id '+
  'group by customer.id order by `total sales` desc ');
end;

procedure TForm1.Selectionbydrink1Click(Sender: TObject);
begin
  OpenQuery('select drink.name, sum(sale.quantity) as `total sales` from drink '+
	'inner join sale on sale.drink_id = drink.id '+
  'group by drink.id');
end;

procedure TForm1.SelectionbyMachineClick(Sender: TObject);
begin
  OpenQuery('select coffemachine.Model, sum(sale.quantity) as `total sales` from coffemachine'+
	' inner join sale on sale.machine_id = coffemachine.id'+
  ' group by coffemachine.id');
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

object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 338
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 530
    Height = 207
    Align = alTop
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 530
    Height = 25
    DataSource = DataSource1
    Align = alTop
    Enabled = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 100
    ExplicitWidth = 240
  end
  object searchText: TEdit
    Left = 151
    Top = 254
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'searchText'
  end
  object searchColText: TEdit
    Left = 8
    Top = 254
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'searchColText'
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    AfterOpen = ZQuery1AfterOpen
    Params = <>
    Left = 368
    Top = 16
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    HostName = ''
    Port = 0
    Database = 'C:\Users\asus\Documents\sql\coffee_machine\coffee_light_ex.db'
    User = ''
    Password = ''
    Protocol = 'sqlite-3'
    LibraryLocation = 'sqlite3.dll'
    Left = 448
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 408
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 8
    object CoffeeMachine1: TMenuItem
      Caption = 'CoffeeMachine'
      object Manufacturer1: TMenuItem
        Caption = 'Manufacturer'
        object List1: TMenuItem
          Caption = 'List'
          OnClick = List1Click
        end
      end
      object Overview1: TMenuItem
        Caption = 'Overview'
        object atCustomer1: TMenuItem
          Caption = 'List'
          OnClick = atCustomer1Click
        end
        object atCustomer2: TMenuItem
          Caption = 'atCustomer'
          OnClick = atCustomer2Click
        end
      end
      object Edit1: TMenuItem
        Caption = 'Edit'
        OnClick = Edit1Click
      end
    end
    object Cus1: TMenuItem
      Caption = 'Customer'
      object Overview2: TMenuItem
        Caption = 'Overview'
        OnClick = Overview2Click
      end
      object Search1: TMenuItem
        Caption = 'Search'
        OnClick = Search1Click
      end
    end
    object Supplier1: TMenuItem
      Caption = 'Supplier'
    end
    object Drinks1: TMenuItem
      Caption = 'Drinks'
      object Overview3: TMenuItem
        Caption = 'List'
        OnClick = Overview3Click
      end
      object Ingrediants1: TMenuItem
        Caption = 'Ingredients'
        OnClick = Ingrediants1Click
      end
      object Search2: TMenuItem
        Caption = 'Search'
        OnClick = Search2Click
      end
      object Edit2: TMenuItem
        Caption = 'Edit'
        OnClick = Edit2Click
      end
    end
    object Statistics1: TMenuItem
      Caption = 'Statistics'
    end
    object Products1: TMenuItem
      Caption = 'Products'
      object M1: TMenuItem
      end
    end
    object Maintenance1: TMenuItem
      Caption = 'Maintenance'
      object Cleaning1: TMenuItem
        Caption = 'Cleaning'
        OnClick = Cleaning1Click
      end
      object Repair1: TMenuItem
        Caption = 'Repair'
      end
    end
  end
end

object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 338
  ClientWidth = 785
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
    Top = 131
    Width = 785
    Height = 207
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 16
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    AfterOpen = ZQuery1AfterOpen
    Params = <>
    Left = 664
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
    Left = 744
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 704
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 624
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
      object Add1: TMenuItem
        Caption = 'Add'
        OnClick = Add1Click
      end
    end
    object Cus1: TMenuItem
      Caption = 'Customer'
      object Overview2: TMenuItem
        Caption = 'Overview'
        OnClick = Overview2Click
      end
    end
    object Supplier1: TMenuItem
      Caption = 'Supplier'
    end
    object Drinks1: TMenuItem
      Caption = 'Drinks'
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
  object ZQuery2: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 576
    Top = 8
  end
end

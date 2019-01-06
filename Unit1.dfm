object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 448
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 153
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 136
      Height = 151
      Align = alLeft
      TabOrder = 0
      object Edit2: TEdit
        Left = 9
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'yuhi'
      end
      object Edit3: TEdit
        Left = 9
        Top = 30
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'm0jpw10p'
      end
      object Button2: TButton
        Left = 55
        Top = 57
        Width = 75
        Height = 25
        Caption = #25509#32154
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 55
        Top = 88
        Width = 75
        Height = 25
        Caption = #25991#23383#12467#12540#12489#30906#35469
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 56
        Top = 120
        Width = 75
        Height = 25
        Caption = 'Button4'
        TabOrder = 4
      end
    end
    object ListBox1: TListBox
      Left = 137
      Top = 1
      Width = 104
      Height = 151
      Align = alLeft
      ItemHeight = 13
      TabOrder = 1
      OnClick = ListBox1Click
    end
    object ListBox2: TListBox
      Left = 241
      Top = 1
      Width = 112
      Height = 151
      Align = alLeft
      ItemHeight = 13
      TabOrder = 2
      OnClick = ListBox2Click
    end
    object Memo1: TMemo
      Left = 353
      Top = 1
      Width = 342
      Height = 151
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 3
    end
    object Button1: TButton
      Left = 695
      Top = 1
      Width = 39
      Height = 151
      Align = alRight
      Caption = 'SQL'
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 153
    Width = 735
    Height = 295
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADOConnection1: TADOConnection
    Provider = 'MSDASQL.1'
    Left = 344
    Top = 232
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 344
    Top = 336
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 464
    Top = 272
  end
end

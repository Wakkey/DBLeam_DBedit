unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Memo1: TMemo;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button4: TButton;
    DBGrid1: TDBGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    procedure get_sqllist(sql: String; st_query: TStringlist);
    procedure get_query(sql: string);
    procedure get_QueryToGrid();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.get_query(sql: string);

begin
  ADOQuery1.sql.Text := sql;
  ADOQuery1.Active := True;
  //get_QueryToGrid;
end;

procedure TForm1.get_QueryToGrid();
var
  i, j: integer;
begin
{  ADOQuery1.First;
  StringGrid1.RowCount := ADOQuery1.RecordCount;
  StringGrid1.ColCount := ADOQuery1.FieldCount;

  j := 0;

  while j <= ADOQuery1.FieldCount - 1 do
  begin
    StringGrid1.Cells[j, 0] := ADOQuery1.Fields[j].FieldName;
    inc(j);
  end;
  i := 1;
  j := 0;
  while not ADOQuery1.Eof do
  begin
    while j <= ADOQuery1.FieldCount - 1 do
    begin
      StringGrid1.Cells[j, i] := (ADOQuery1.Fields[j].AsString);
      inc(j);
    end;
    inc(i);
    ADOQuery1.Next;
  end;}
end;

procedure TForm1.get_sqllist(sql: String; st_query: TStringlist);
begin
  ADOQuery1.sql.Text := sql;
  ADOQuery1.Active := True;

  ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
    st_query.Add(ADOQuery1.Fields[0].AsString);
    ADOQuery1.Next;
  end;
  ADOQuery1.Active := false;
  ADOQuery1.sql.Text := '';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ADOQuery1.sql.Text := Memo1.Lines.Text;
  ADOQuery1.Active := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  st: TStringlist;
begin
  ADOConnection1.ConnectionString := 'Provider=MSDASQL.1;Password=' + Edit3.Text
    + ';Persist Security Info=True;User ID=' + Edit2.Text +
    ';Data Source=mysql53;Extended Properties="DSN=mysql53;UID=' + Edit2.Text +
    ';PWD=' + Edit3.Text + ';"';
  ADOConnection1.Connected := True;

  st := TStringlist.Create;
  st.Clear;
  get_sqllist('SHOW DATABASES;', st);
  ListBox1.Items.Text := st.Text;
  st.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  get_query('show variables like "character%";');
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  st: TStringlist;
begin
  ListBox2.Items.Clear;

  st := TStringlist.Create;
  st.Clear;
  get_sqllist('SHOW TABLES FROM ' + ListBox1.Items[ListBox1.ItemIndex]
    + ';', st);
  ListBox2.Items.Text := st.Text;
  st.Free;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
  get_query('SELECT * FROM ' + ListBox1.Items[ListBox1.ItemIndex] + '.' +
    ListBox2.Items[ListBox2.ItemIndex] + ';');
  //memo1.Text := 'SELECT * FROM ' + ListBox1.Items[ListBox1.ItemIndex] + '.' +
  //  ListBox2.Items[ListBox2.ItemIndex] + ';';
end;

end.

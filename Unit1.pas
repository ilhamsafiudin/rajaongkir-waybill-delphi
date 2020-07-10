unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    NetHTTPClient1: TNetHTTPClient;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  API_URL= 'https://pro.rajaongkir.com/api/waybill';
  API_KEY= '';  //register dulu

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Params: TStringList;
begin
  Params := TStringList.Create;
  try
    Params.Add('waybill='+edit1.Text);
    Params.Add('courier=jne');
    Memo1.Lines.Text := NetHTTPClient1.Post(API_URL, Params).ContentAsString;
  finally
    Params.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  NetHTTPClient1.CustomHeaders['content-type']:= 'application/x-www-form-urlencoded';
  NetHTTPClient1.CustomHeaders['key']:= API_KEY;
  NetHTTPClient1.ContentType := 'application/json';
end;

end.

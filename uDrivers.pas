unit uDrivers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TFormDrivers = class(TForm)
    RESTClientDriver: TRESTClient;
    RESTRequestDriver: TRESTRequest;
    RESTResponseDriver: TRESTResponse;
    RESTResponseDataSetAdapterDriver: TRESTResponseDataSetAdapter;
    FDMemTableDriver: TFDMemTable;
    FDMemTableDriverid: TStringField;
    FDMemTableDrivername: TStringField;
    FDMemTableDrivercpf: TStringField;
    FDMemTableDrivermessage: TStringField;
  private
    { Private declarations }
  public
  { Public declarations }
    const
    jsonDriver = '';
    function addMotorista(const pName, pCPF, pToken: string): string;
  end;

var
  FormDrivers: TFormDrivers;

implementation

{$R *.dfm}
{ TFormDrivers }

function TFormDrivers.addMotorista(const pName, pCPF, pToken: string): string;
const jsonCreateDriver = '{ "name" : "%s", "cpf" : "%s"}';
begin
  try
    FDMemTableDriver.Open;

    RESTRequestDriver.Params.Items[0].Value := 'Bearer '+ pToken;
    RESTRequestDriver.Params.Items[1].Value := Format(jsonCreateDriver, [pName, pCPF]);

    RESTRequestDriver.Execute;
//    ShowMessage( RESTResponseDriver.Content);

    Result := FDMemTableDriverid.AsString;

  except
    on E: Exception do
      Result := E.Message;
  end;

end;

end.

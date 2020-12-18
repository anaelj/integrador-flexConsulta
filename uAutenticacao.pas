unit uAutenticacao;

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
  TFormAutenticacao = class(TForm)
    RESTClientToken: TRESTClient;
    RESTRequestToken: TRESTRequest;
    RESTResponseToken: TRESTResponse;
    RESTResponseDataSetAdapterToken: TRESTResponseDataSetAdapter;
    FDMemTableToken: TFDMemTable;
    FDMemTableTokenJSONString: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function autenticar(const pUsuario: string; const pSenha: string): string;
  end;

var
  FormAutenticacao: TFormAutenticacao;

implementation

{$R *.dfm}
{ TFormAutenticacao }

function TFormAutenticacao.autenticar(const pUsuario: string;
  const pSenha: string): string;
const
  jsonUser = '{ "email" : "%s", "password" : "%s"}';
begin
  try

    RESTRequestToken.Params.Items[0].Value := format(jsonUser, [pUsuario, pSenha]);
    RESTRequestToken.Execute;
    Result := FDMemTableTokenJSONString.AsString;
  except
    on E: Exception do
      Result := '';
  end;

end;

end.

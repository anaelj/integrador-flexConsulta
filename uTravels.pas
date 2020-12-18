unit uTravels;

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
  TFormTravels = class(TForm)
    RESTClientTravels: TRESTClient;
    RESTRequestTravels: TRESTRequest;
    RESTResponseTravels: TRESTResponse;
    RESTResponseDataSetAdapterTravels: TRESTResponseDataSetAdapter;
    FDMemTableTravels: TFDMemTable;
    FDMemTableTravelsid: TStringField;
    FDMemTableTravelscte: TStringField;
    FDMemTableTravelsnumeroviagem: TStringField;
    FDMemTableTravelsorigem: TStringField;
    FDMemTableTravelsdestino: TStringField;
    FDMemTableTravelsmercadoria: TStringField;
    FDMemTableTravelsplaca: TStringField;
    FDMemTableTravelstransportadora_id: TStringField;
    FDMemTableTravelscpfmotorista: TStringField;
    FDMemTableTravelsdata: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function addTravel(const pCte, pNumeroviagem, pOrigem, pDestino, pMercadoria,
  pPlaca, pTransportadora_id, pCpfMotorista, pData, pToken: string): string;
  end;

var
  FormTravels: TFormTravels;

implementation

{$R *.dfm}
{ TForm2 }

function TFormTravels.addTravel(const pCte, pNumeroviagem, pOrigem, pDestino, pMercadoria,
  pPlaca, pTransportadora_id, pCpfMotorista, pData, pToken: string): string;
const
  jsonCreateTravel =
    '{ "cte": "%s", "numeroviagem": "%s", "origem": "%s", "destino": "%s", "mercadoria": "%s","placa": "%s","transportadora_id": "%s", "cpfmotorista": "%s", "data": "%s" }';
begin

  // 2020-08-09

  try
    FDMemTableTravels.Open;

    RESTRequestTravels.Params.Items[0].Value := 'Bearer '+ pToken;
    RESTRequestTravels.Params.Items[1].Value := Format(jsonCreateTravel, [pCte, pNumeroviagem, pOrigem, pDestino, pMercadoria,
  pPlaca, pTransportadora_id, pCpfMotorista, pData+ 'T00:00:00.000Z']);

    RESTRequestTravels.Execute;
//    ShowMessage( RESTRequestTravels.Content);

    Result := FDMemTableTravelsid.AsString;

  except
    on E: Exception do
      Result := '';
  end;


end;

end.

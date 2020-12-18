object FormTravels: TFormTravels
  Left = 0
  Top = 0
  Caption = 'FormTravels'
  ClientHeight = 335
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RESTClientTravels: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.flexconsulta.com.br/travels'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 80
    Top = 88
  end
  object RESTRequestTravels: TRESTRequest
    Client = RESTClientTravels
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'Authorization'
        Options = [poDoNotEncode]
        Value = 
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MDgyMjQ3' +
          'NjMsImV4cCI6MTYwODMxMTE2Mywic3ViIjoiMjE1OTUwMmYtZGJjNC00MDgwLWFi' +
          'YTgtNWEyOWM4MjliZDQxIn0.SsYkMDG3Ugl21-Yvbc96JPP97uSKFWKqDAP_fd18' +
          '1u0'
      end
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponseTravels
    SynchronizedEvents = False
    Left = 80
    Top = 32
  end
  object RESTResponseTravels: TRESTResponse
    ContentType = 'application/json'
    Left = 80
    Top = 144
  end
  object RESTResponseDataSetAdapterTravels: TRESTResponseDataSetAdapter
    Dataset = FDMemTableTravels
    FieldDefs = <>
    Response = RESTResponseTravels
    Left = 80
    Top = 208
  end
  object FDMemTableTravels: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 224
    Top = 96
    object FDMemTableTravelsid: TStringField
      FieldName = 'id'
      Size = 50
    end
    object FDMemTableTravelscte: TStringField
      FieldName = 'cte'
    end
    object FDMemTableTravelsnumeroviagem: TStringField
      FieldName = 'numeroviagem'
    end
    object FDMemTableTravelsorigem: TStringField
      FieldName = 'origem'
      Size = 250
    end
    object FDMemTableTravelsdestino: TStringField
      FieldName = 'destino'
      Size = 250
    end
    object FDMemTableTravelsmercadoria: TStringField
      FieldName = 'mercadoria'
      Size = 50
    end
    object FDMemTableTravelsplaca: TStringField
      FieldName = 'placa'
      Size = 50
    end
    object FDMemTableTravelstransportadora_id: TStringField
      FieldName = 'transportadora_id'
      Size = 50
    end
    object FDMemTableTravelscpfmotorista: TStringField
      FieldName = 'cpfmotorista'
    end
    object FDMemTableTravelsdata: TStringField
      FieldName = 'data'
    end
    object FDMemTableTravelsmessage: TStringField
      FieldName = 'message'
      Size = 250
    end
  end
end

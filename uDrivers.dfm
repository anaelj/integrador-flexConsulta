object FormDrivers: TFormDrivers
  Left = 0
  Top = 0
  Caption = 'FormDrivers'
  ClientHeight = 240
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RESTClientDriver: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.flexconsulta.com.br/drivers'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 48
    Top = 40
  end
  object RESTRequestDriver: TRESTRequest
    Client = RESTClientDriver
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
    Response = RESTResponseDriver
    SynchronizedEvents = False
    Left = 48
    Top = 136
  end
  object RESTResponseDriver: TRESTResponse
    ContentType = 'application/json'
    Left = 48
    Top = 184
  end
  object RESTResponseDataSetAdapterDriver: TRESTResponseDataSetAdapter
    Dataset = FDMemTableDriver
    FieldDefs = <>
    Response = RESTResponseDriver
    Left = 48
    Top = 88
  end
  object FDMemTableDriver: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 176
    Top = 16
    object FDMemTableDriverid: TStringField
      FieldName = 'id'
      Size = 100
    end
    object FDMemTableDrivername: TStringField
      FieldName = 'name'
      Size = 250
    end
    object FDMemTableDrivercpf: TStringField
      FieldName = 'cpf'
    end
  end
end

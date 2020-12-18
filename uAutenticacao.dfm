object FormAutenticacao: TFormAutenticacao
  Left = 0
  Top = 0
  Caption = 'FormAutenticacao'
  ClientHeight = 376
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RESTClientToken: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.flexconsulta.com.br/sessions'
    ContentType = 'application/json'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 56
    Top = 64
  end
  object RESTRequestToken: TRESTRequest
    Client = RESTClientToken
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        Value = '{ "email" : "anaelj@gmail.com", "password" : "123456"}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponseToken
    SynchronizedEvents = False
    Left = 56
    Top = 112
  end
  object RESTResponseToken: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'token'
    Left = 56
    Top = 216
  end
  object RESTResponseDataSetAdapterToken: TRESTResponseDataSetAdapter
    Dataset = FDMemTableToken
    FieldDefs = <>
    Response = RESTResponseToken
    Left = 56
    Top = 160
  end
  object FDMemTableToken: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 64
    Top = 16
    object FDMemTableTokenJSONString: TStringField
      FieldName = 'JSONString'
      Size = 250
    end
  end
end

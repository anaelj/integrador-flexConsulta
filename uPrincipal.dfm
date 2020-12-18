object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 642
  ClientWidth = 1180
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsuarioFlex: TLabel
    Left = 120
    Top = 112
    Width = 101
    Height = 13
    Caption = 'Usu'#225'rio FlexConsulta'
    FocusControl = dbedtUSUARIO_FLEX
  end
  object lblSenhaFlex: TLabel
    Left = 526
    Top = 112
    Width = 95
    Height = 13
    Caption = 'Senha FlexConsulta'
    FocusControl = dbedtSENHA_FLEX
  end
  object lblTransportadoraID: TLabel
    Left = 120
    Top = 69
    Width = 89
    Height = 13
    Caption = 'ID Transportadora'
    FocusControl = dbedtTRANSPORTADORA_ID
  end
  object lblUsuarioPG: TLabel
    Left = 120
    Top = 156
    Width = 52
    Height = 13
    Caption = 'Usu'#225'rio PG'
    FocusControl = dbedtUSUARIO_PG
  end
  object lblSenhaPG: TLabel
    Left = 426
    Top = 156
    Width = 46
    Height = 13
    Caption = 'Senha PG'
    FocusControl = dbedtSENHA_PG
  end
  object lblUltimoMotorista: TLabel
    Left = 120
    Top = 248
    Width = 99
    Height = 13
    Caption = #218'ltimo Motorista SAT'
    FocusControl = dbedtULTIMO_MOTORISTA_SAT
  end
  object lblMotoristaFlex: TLabel
    Left = 120
    Top = 296
    Width = 110
    Height = 13
    Caption = 'Motorista FlexConsulta'
    FocusControl = dbedtMOTORISTA_FLEX
  end
  object lblViagemFlex: TLabel
    Left = 526
    Top = 296
    Width = 99
    Height = 13
    Caption = 'Viagem FlexConsulta'
    FocusControl = dbedtVIAGEM_FLEX
  end
  object lblViagemSAT: TLabel
    Left = 260
    Top = 248
    Width = 88
    Height = 13
    Caption = #218'ltima Viagem SAT'
    FocusControl = dbedtULTIMA_VIAGEM_SAT
  end
  object lblCaminhoPG: TLabel
    Left = 120
    Top = 200
    Width = 57
    Height = 13
    Caption = 'Caminho PG'
    FocusControl = dbedtCAMINHO_PG
  end
  object dbedtUSUARIO_FLEX: TDBEdit
    Left = 120
    Top = 128
    Width = 400
    Height = 21
    DataField = 'USUARIO_FLEX'
    DataSource = dsConfiguracoes
    TabOrder = 1
  end
  object dbedtSENHA_FLEX: TDBEdit
    Left = 526
    Top = 128
    Width = 300
    Height = 21
    DataField = 'SENHA_FLEX'
    DataSource = dsConfiguracoes
    TabOrder = 2
  end
  object dbedtTRANSPORTADORA_ID: TDBEdit
    Left = 120
    Top = 85
    Width = 400
    Height = 21
    DataField = 'TRANSPORTADORA_ID'
    DataSource = dsConfiguracoes
    TabOrder = 0
  end
  object dbedtUSUARIO_PG: TDBEdit
    Left = 120
    Top = 172
    Width = 300
    Height = 21
    DataField = 'USUARIO_PG'
    DataSource = dsConfiguracoes
    TabOrder = 3
  end
  object dbedtSENHA_PG: TDBEdit
    Left = 426
    Top = 172
    Width = 300
    Height = 21
    DataField = 'SENHA_PG'
    DataSource = dsConfiguracoes
    TabOrder = 4
  end
  object dbedtULTIMO_MOTORISTA_SAT: TDBEdit
    Left = 120
    Top = 264
    Width = 134
    Height = 21
    DataField = 'ULTIMO_MOTORISTA_SAT'
    DataSource = dsConfiguracoes
    TabOrder = 6
  end
  object dbedtMOTORISTA_FLEX: TDBEdit
    Left = 120
    Top = 312
    Width = 400
    Height = 21
    DataField = 'MOTORISTA_FLEX'
    DataSource = dsConfiguracoes
    TabOrder = 8
  end
  object dbedtVIAGEM_FLEX: TDBEdit
    Left = 526
    Top = 312
    Width = 400
    Height = 21
    DataField = 'VIAGEM_FLEX'
    DataSource = dsConfiguracoes
    TabOrder = 9
  end
  object dbedtULTIMA_VIAGEM_SAT: TDBEdit
    Left = 260
    Top = 264
    Width = 134
    Height = 21
    DataField = 'ULTIMA_VIAGEM_SAT'
    DataSource = dsConfiguracoes
    TabOrder = 7
  end
  object dbedtCAMINHO_PG: TDBEdit
    Left = 120
    Top = 219
    Width = 606
    Height = 21
    DataField = 'CAMINHO_PG'
    DataSource = dsConfiguracoes
    TabOrder = 5
  end
  object dbnvgr1: TDBNavigator
    Left = 120
    Top = 8
    Width = 455
    Height = 55
    DataSource = dsConfiguracoes
    VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
    TabOrder = 10
  end
  object btnTeste: TButton
    Left = 936
    Top = 568
    Width = 75
    Height = 25
    Caption = 'btnTeste'
    TabOrder = 11
    OnClick = btnTesteClick
  end
  object FDConnectionSqlLite: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      
        'Database=C:\Users\Gabriela\Documents\flex-integrador\Win32\Debug' +
        '\flexconsulta.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 688
    Top = 384
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 592
    Top = 384
  end
  object fdQryConfiguracoes: TFDQuery
    Connection = FDConnectionSqlLite
    SQL.Strings = (
      'select * from configuracoes')
    Left = 472
    Top = 400
    object fdQryConfiguracoesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryConfiguracoesUSUARIO_FLEX: TStringField
      FieldName = 'USUARIO_FLEX'
      Origin = 'USUARIO_FLEX'
      Size = 100
    end
    object fdQryConfiguracoesSENHA_FLEX: TStringField
      FieldName = 'SENHA_FLEX'
      Origin = 'SENHA_FLEX'
      Size = 50
    end
    object fdQryConfiguracoesUSUARIO_PG: TStringField
      FieldName = 'USUARIO_PG'
      Origin = 'USUARIO_PG'
      Size = 50
    end
    object fdQryConfiguracoesSENHA_PG: TStringField
      FieldName = 'SENHA_PG'
      Origin = 'SENHA_PG'
      Size = 50
    end
    object fdQryConfiguracoesULTIMO_MOTORISTA_SAT: TIntegerField
      FieldName = 'ULTIMO_MOTORISTA_SAT'
      Origin = 'ULTIMO_MOTORISTA_SAT'
    end
    object fdQryConfiguracoesMOTORISTA_FLEX: TStringField
      FieldName = 'MOTORISTA_FLEX'
      Origin = 'MOTORISTA_FLEX'
      Size = 100
    end
    object fdQryConfiguracoesVIAGEM_FLEX: TStringField
      FieldName = 'VIAGEM_FLEX'
      Origin = 'VIAGEM_FLEX'
      Size = 100
    end
    object fdQryConfiguracoesULTIMA_VIAGEM_SAT: TIntegerField
      FieldName = 'ULTIMA_VIAGEM_SAT'
      Origin = 'ULTIMA_VIAGEM_SAT'
    end
    object fdQryConfiguracoesCAMINHO_PG: TStringField
      FieldName = 'CAMINHO_PG'
      Origin = 'CAMINHO_PG'
      Size = 100
    end
    object fdQryConfiguracoesTRANSPORTADORA_ID: TStringField
      FieldName = 'TRANSPORTADORA_ID'
      Origin = 'TRANSPORTADORA_ID'
      Size = 100
    end
  end
  object dsConfiguracoes: TDataSource
    DataSet = fdQryConfiguracoes
    Left = 360
    Top = 392
  end
  object FDConnectionPG: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=GACLA0923'
      'DriverID=PG')
    LoginPrompt = False
    Left = 896
    Top = 408
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 1000
    Top = 440
  end
end

object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 470
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
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
    Top = 244
    Width = 99
    Height = 13
    Caption = #218'ltimo Motorista SAT'
    FocusControl = dbedtULTIMO_MOTORISTA_SAT
  end
  object lblMotoristaFlex: TLabel
    Left = 120
    Top = 288
    Width = 110
    Height = 13
    Caption = 'Motorista FlexConsulta'
    FocusControl = dbedtMOTORISTA_FLEX
  end
  object lblViagemFlex: TLabel
    Left = 526
    Top = 288
    Width = 99
    Height = 13
    Caption = 'Viagem FlexConsulta'
    FocusControl = dbedtVIAGEM_FLEX
  end
  object lblViagemSAT: TLabel
    Left = 260
    Top = 244
    Width = 88
    Height = 13
    Caption = #218'ltima Viagem SAT'
    FocusControl = dbedtULTIMA_VIAGEM_SAT
  end
  object lblServidorPG: TLabel
    Left = 120
    Top = 199
    Width = 56
    Height = 13
    Caption = 'Servidor PG'
    FocusControl = dbedtServidor_PG
  end
  object Label1: TLabel
    Left = 426
    Top = 199
    Width = 45
    Height = 13
    Caption = 'Banco PG'
    FocusControl = dbedtBANCO_PG
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
    Top = 260
    Width = 134
    Height = 21
    DataField = 'ULTIMO_MOTORISTA_SAT'
    DataSource = dsConfiguracoes
    TabOrder = 7
  end
  object dbedtMOTORISTA_FLEX: TDBEdit
    Left = 120
    Top = 304
    Width = 400
    Height = 21
    DataField = 'MOTORISTA_FLEX'
    DataSource = dsConfiguracoes
    TabOrder = 9
  end
  object dbedtVIAGEM_FLEX: TDBEdit
    Left = 526
    Top = 304
    Width = 400
    Height = 21
    DataField = 'VIAGEM_FLEX'
    DataSource = dsConfiguracoes
    TabOrder = 10
  end
  object dbedtULTIMA_VIAGEM_SAT: TDBEdit
    Left = 260
    Top = 260
    Width = 134
    Height = 21
    DataField = 'ULTIMA_VIAGEM_SAT'
    DataSource = dsConfiguracoes
    TabOrder = 8
  end
  object dbnvgr1: TDBNavigator
    Left = 120
    Top = 8
    Width = 455
    Height = 55
    DataSource = dsConfiguracoes
    VisibleButtons = [nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
    TabOrder = 11
  end
  object btnTeste: TButton
    Left = 776
    Top = 379
    Width = 75
    Height = 25
    Caption = 'btnTeste'
    TabOrder = 12
    Visible = False
    OnClick = btnTesteClick
  end
  object btnEnviaMotoristas: TButton
    Left = 176
    Top = 379
    Width = 129
    Height = 25
    Caption = 'Envia Motoristas'
    TabOrder = 13
    Visible = False
    OnClick = btnEnviaMotoristasClick
  end
  object btnEnviaViagens: TButton
    Left = 328
    Top = 379
    Width = 129
    Height = 25
    Caption = 'Envia Viagens'
    TabOrder = 14
    Visible = False
    OnClick = btnEnviaViagensClick
  end
  object dbedtServidor_PG: TDBEdit
    Left = 120
    Top = 217
    Width = 300
    Height = 21
    DataField = 'SERVIDOR_PG'
    DataSource = dsConfiguracoes
    TabOrder = 5
  end
  object dbedtBANCO_PG: TDBEdit
    Left = 426
    Top = 218
    Width = 300
    Height = 21
    DataField = 'BANCO_PG'
    DataSource = dsConfiguracoes
    TabOrder = 6
  end
  object FDConnectionSqlLite: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      
        'Database=C:\Users\Gabriela\Documents\integrador-flexConsulta\Win' +
        '32\Debug\configuracoes-flexconsulta.db'
      'DriverID=SQLite')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 696
    Top = 25
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 696
    Top = 57
  end
  object fdQryConfiguracoes: TFDQuery
    Connection = FDConnectionSqlLite
    SQL.Strings = (
      'select * from configuracoes')
    Left = 584
    Top = 385
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
    object fdQryConfiguracoesTRANSPORTADORA_ID: TStringField
      FieldName = 'TRANSPORTADORA_ID'
      Origin = 'TRANSPORTADORA_ID'
      Size = 100
    end
    object fdQryConfiguracoesSERVIDOR_PG: TStringField
      FieldName = 'SERVIDOR_PG'
      Origin = 'SERVIDOR_PG'
      Size = 100
    end
    object fdQryConfiguracoesBANCO_PG: TStringField
      FieldName = 'BANCO_PG'
      Origin = 'BANCO_PG'
      Size = 50
    end
  end
  object dsConfiguracoes: TDataSource
    DataSet = fdQryConfiguracoes
    Left = 360
    Top = 345
  end
  object FDConnectionPG: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=GACLA0923'
      'ApplicationName=flexConsulta'
      'DriverID=PG')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 856
    Top = 17
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = '../'
    Left = 912
    Top = 305
  end
  object fdQryConsultaMotorista: TFDQuery
    Connection = FDConnectionPG
    SQL.Strings = (
      'select codmotorista, nome, cpf from motorista '
      'where codmotorista > :codmotorista and (not cpf is null)'
      'order by codmotorista')
    Left = 896
    Top = 185
    ParamData = <
      item
        Name = 'CODMOTORISTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdQryConsultaMotoristacodmotorista: TIntegerField
      FieldName = 'codmotorista'
      Origin = 'codmotorista'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdQryConsultaMotoristanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 70
    end
    object fdQryConsultaMotoristacpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 14
    end
  end
  object fdQryConsultaViagens: TFDQuery
    Connection = FDConnectionPG
    SQL.Strings = (
      'select '
      #9'distinct'
      ''
      'ct.numero as numeroviagem, '
      'concat( ct.numeroconhecimento, '#39'-'#39' ,ct.serie )  as cte,'
      'concat (cd1.nome, '#39'-'#39', cd1.uf) as origem,'
      'concat (cd2.nome, '#39'-'#39', cd2.uf) as destino,'
      'merc.descricao as mercadoria,'
      
        'concat (vei.placa, '#39', '#39', coalesce(cr1.placa, vei.placacarreta), ' +
        #39', '#39', coalesce(cr2.placa, vei.placacarreta2) ) placa,'
      'mot.cpf as cpfmotorista,'
      'ct.data'
      ''
      'from conhecimento ct'
      #9'join cidade cd1 on ct.codcidadeorigem = cd1.codcidade  '
      #9'join cidade cd2 on ct.codcidadedestino = cd2.codcidade  '
      #9'join mercadoria merc on merc.codmercadoria = ct.codmercadoria '
      #9'join veiculo vei on ct.codveiculo = vei.codveiculo'
      #9'join motorista mot on mot.codmotorista  = ct.codmotorista '
      #9'left join veiculo cr1 on vei.codcarreta = cr1.codveiculo '
      #9'left join veiculo cr2 on vei.codcarreta2 = cr2.codveiculo '
      ''
      'where ct.numero > :numero'
      'and numeroconhecimento > 0'
      'and ct.ctestatus = '#39'2'#39
      'and ct.tipocte = '#39'0'#39
      'order by ct.numero')
    Left = 888
    Top = 144
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdQryConsultaViagensnumeroviagem: TIntegerField
      FieldName = 'numeroviagem'
      Origin = 'numeroviagem'
    end
    object fdQryConsultaViagenscte: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'cte'
      Origin = 'cte'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdQryConsultaViagensorigem: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'origem'
      Origin = 'origem'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdQryConsultaViagensdestino: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'destino'
      Origin = 'destino'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdQryConsultaViagensmercadoria: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'mercadoria'
      Origin = 'mercadoria'
      Size = 100
    end
    object fdQryConsultaViagensplaca: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'placa'
      Origin = 'placa'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdQryConsultaViagenscpfmotorista: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpfmotorista'
      Origin = 'cpfmotorista'
      Size = 14
    end
    object fdQryConsultaViagensdata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
    end
  end
  object Timer1: TTimer
    Interval = 300000
    OnTimer = Timer1Timer
    Left = 32
    Top = 408
  end
  object Timer2: TTimer
    Interval = 86400000
    OnTimer = Timer2Timer
    Left = 88
    Top = 408
  end
end

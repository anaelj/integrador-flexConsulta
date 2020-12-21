unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TFormPrincipal = class(TForm)
    FDConnectionSqlLite: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    fdQryConfiguracoes: TFDQuery;
    fdQryConfiguracoesID: TIntegerField;
    fdQryConfiguracoesUSUARIO_FLEX: TStringField;
    fdQryConfiguracoesSENHA_FLEX: TStringField;
    fdQryConfiguracoesUSUARIO_PG: TStringField;
    fdQryConfiguracoesSENHA_PG: TStringField;
    fdQryConfiguracoesULTIMO_MOTORISTA_SAT: TIntegerField;
    fdQryConfiguracoesMOTORISTA_FLEX: TStringField;
    fdQryConfiguracoesVIAGEM_FLEX: TStringField;
    fdQryConfiguracoesULTIMA_VIAGEM_SAT: TIntegerField;
    lblUsuarioFlex: TLabel;
    dbedtUSUARIO_FLEX: TDBEdit;
    dsConfiguracoes: TDataSource;
    lblSenhaFlex: TLabel;
    dbedtSENHA_FLEX: TDBEdit;
    lblTransportadoraID: TLabel;
    dbedtTRANSPORTADORA_ID: TDBEdit;
    lblUsuarioPG: TLabel;
    dbedtUSUARIO_PG: TDBEdit;
    lblSenhaPG: TLabel;
    dbedtSENHA_PG: TDBEdit;
    lblUltimoMotorista: TLabel;
    dbedtULTIMO_MOTORISTA_SAT: TDBEdit;
    lblMotoristaFlex: TLabel;
    dbedtMOTORISTA_FLEX: TDBEdit;
    lblViagemFlex: TLabel;
    dbedtVIAGEM_FLEX: TDBEdit;
    lblViagemSAT: TLabel;
    dbedtULTIMA_VIAGEM_SAT: TDBEdit;
    dbnvgr1: TDBNavigator;
    fdQryConfiguracoesTRANSPORTADORA_ID: TStringField;
    FDConnectionPG: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    fdQryConsultaMotorista: TFDQuery;
    fdQryConsultaMotoristacodmotorista: TIntegerField;
    fdQryConsultaMotoristanome: TWideStringField;
    fdQryConsultaMotoristacpf: TWideStringField;
    btnEnviaMotoristas: TButton;
    btnEnviaViagens: TButton;
    fdQryConsultaViagens: TFDQuery;
    fdQryConsultaViagensnumeroviagem: TIntegerField;
    fdQryConsultaViagenscte: TWideMemoField;
    fdQryConsultaViagensorigem: TWideMemoField;
    fdQryConsultaViagensdestino: TWideMemoField;
    fdQryConsultaViagensmercadoria: TWideStringField;
    fdQryConsultaViagensplaca: TWideMemoField;
    fdQryConsultaViagenscpfmotorista: TWideStringField;
    fdQryConsultaViagensdata: TSQLTimeStampField;
    lblServidorPG: TLabel;
    dbedtServidor_PG: TDBEdit;
    fdQryConfiguracoesSERVIDOR_PG: TStringField;
    fdQryConfiguracoesBANCO_PG: TStringField;
    Label1: TLabel;
    dbedtBANCO_PG: TDBEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure btnEnviaMotoristasClick(Sender: TObject);
    procedure btnEnviaViagensClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    procedure enviaMotoristas;
    procedure enviaViagens;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  uAutenticacao, uDrivers, uTravels;

{$R *.dfm}


procedure TFormPrincipal.enviaMotoristas;
var uuidMotorista : string;
token : string;
begin
  fdQryConfiguracoes.First;
  while not  fdQryConfiguracoes.Eof do
  begin
    fdQryConsultaMotorista.ParamByName('codmotorista').AsInteger := fdQryConfiguracoesULTIMO_MOTORISTA_SAT.AsInteger;
    fdQryConsultaMotorista.Open;
    fdQryConsultaMotorista.First;
    token := FormAutenticacao.autenticar(fdQryConfiguracoesUSUARIO_FLEX.AsString, fdQryConfiguracoesSENHA_FLEX.AsString);
    while not fdQryConsultaMotorista.Eof do
    begin
        uuidMotorista := FormDrivers.addMotorista(fdQryConsultaMotoristanome.AsString, fdQryConsultaMotoristacpf.AsString,token);
        if FormDrivers.FDMemTableDrivermessage.AsString.Equals('Driver already exists.') then
          fdQryConsultaMotorista.Next
        else
        if (uuidMotorista.Length = 36) then
        begin
          try
            fdQryConfiguracoes.Edit;
            fdQryConfiguracoesULTIMO_MOTORISTA_SAT.AsInteger := fdQryConsultaMotoristacodmotorista.AsInteger;
            fdQryConfiguracoesMOTORISTA_FLEX.AsString := uuidMotorista;
            fdQryConfiguracoes.Post;
            fdQryConsultaMotorista.Next;
            Application.ProcessMessages;
          except on E: Exception do
            Break;
          end;
        end
        else
        begin
//          ShowMessage(FormDrivers.FDMemTableDrivermessage.AsString);
          Break;
        end;
//        Sleep(300);
    end;
    fdQryConsultaMotorista.Close;
    fdQryConfiguracoes.Next;
  end;
end;

procedure TFormPrincipal.btnEnviaMotoristasClick(Sender: TObject);
begin
  enviaMotoristas;
end;

procedure TFormPrincipal.enviaViagens ;
var uuidViagem : string;
token : string;
begin
  fdQryConfiguracoes.First;
  while not  fdQryConfiguracoes.Eof do
  begin
    fdQryConsultaViagens.ParamByName('numero').AsInteger := fdQryConfiguracoesULTIMA_VIAGEM_SAT.AsInteger;
    fdQryConsultaViagens.Open;
    fdQryConsultaViagens.First;
    token := FormAutenticacao.autenticar(fdQryConfiguracoesUSUARIO_FLEX.AsString, fdQryConfiguracoesSENHA_FLEX.AsString);
    while not fdQryConsultaViagens.Eof do
    begin
        uuidViagem := FormTravels.addTravel(
                                    fdQryConsultaViagenscte.AsString,
                                    fdQryConsultaViagensnumeroviagem.AsString,
                                    fdQryConsultaViagensorigem.AsString,
                                    fdQryConsultaViagensdestino.AsString,
                                    fdQryConsultaViagensmercadoria.AsString,
                                    fdQryConsultaViagensplaca.AsString,
                                    fdQryConfiguracoesTRANSPORTADORA_ID.AsString,
                                    fdQryConsultaViagenscpfmotorista.AsString,
                                    FormatDateTime('yyyy-MM-dd', fdQryConsultaViagensdata.AsDateTime),
                                    token);
        if FormTravels.FDMemTabletravelsmessage.AsString.Equals('Travel already exists.') then
          fdQryConsultaViagens.Next
        else
        if (uuidViagem.Length = 36) then
        begin
          try
            fdQryConfiguracoes.Edit;
            fdQryConfiguracoesULTIMA_VIAGEM_SAT.AsInteger := fdQryConsultaViagensnumeroviagem.AsInteger;
            fdQryConfiguracoesVIAGEM_FLEX.AsString := uuidViagem;
            fdQryConfiguracoes.Post;
            fdQryConsultaViagens.Next;
            Application.ProcessMessages;
          except on E: Exception do
            Break;
          end;
        end
        else
        begin
//          ShowMessage(FormTravels.FDMemTabletravelsmessage.AsString);
          Break;
        end;
//        Sleep(300);
    end;
    fdQryConsultaViagens.Close;
    fdQryConfiguracoes.Next;
  end;

end;

procedure TFormPrincipal.btnEnviaViagensClick(Sender: TObject);
begin
  enviaViagens;
end;

procedure TFormPrincipal.btnTesteClick(Sender: TObject);
var token : string;
 idViagem : string;
 dataViagem : string;
begin
  token := FormAutenticacao.autenticar(dbedtUSUARIO_FLEX.Text, dbedtSENHA_FLEX.Text);

//  idMotorista := FormDrivers.addMotorista('João Barbosa ','12345', token);


  dataViagem := FormatDateTime('yyyy-MM-dd', now);

  idViagem := FormTravels.addTravel('1234567', '12334', 'São Paulo- SP',
    'Rio de Janeiro- RJ', 'Algodão', 'hro-2545, hrl-3492',
    dbedtTRANSPORTADORA_ID.Text, '123456', dataViagem, token );


end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin

  FDPhysPgDriverLink1.VendorHome := ExtractFilePath( Application.ExeName);

FDConnectionSqlLite.Params.Database :=  ExtractFilePath( Application.ExeName) +
    'configuracoes-flexconsulta.db';
  FDConnectionSqlLite.Connected := true;

  FDConnectionSqlLite.ExecSQL(' CREATE TABLE IF NOT EXISTS CONFIGURACOES ( ' +
    ' ID INTEGER PRIMARY KEY , ' +
    ' USUARIO_FLEX  VARCHAR (100), ' +
    ' SENHA_FLEX  VARCHAR (50), ' +
    ' TRANSPORTADORA_ID varchar(100),' +
    ' USUARIO_PG VARCHAR(50),' + 
    ' SENHA_PG VARCHAR(50),' +
    ' ULTIMO_MOTORISTA_SAT INTEGER,' +
    ' MOTORISTA_FLEX VARCHAR(100),' +
    ' VIAGEM_FLEX VARCHAR(100),' +
    ' ULTIMA_VIAGEM_SAT INTEGER,' +
    ' SERVIDOR_PG VARCHAR(50), '+
    ' BANCO_PG VARCHAR(50) ); ');

  FDConnectionSqlLite.Connected := False;
  FDConnectionSqlLite.Connected := true;

  fdQryConfiguracoes.Open;

  if not fdQryConfiguracoesBANCO_PG.AsString.IsEmpty then
  begin
    FDConnectionPG.Params.Database := fdQryConfiguracoesBANCO_PG.AsString;
    FDConnectionPG.Params.Password := fdQryConfiguracoesSENHA_PG.AsString;
    FDConnectionPG.Params.UserName := fdQryConfiguracoesUSUARIO_PG.AsString;
    FDConnectionPG.Params.Values['server'] := fdQryConfiguracoesSERVIDOR_PG.AsString;
    FDConnectionPG.Connected := True;
  end;


end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  try
    enviaMotoristas;
  except on E: Exception do
  end;
  try
    enviaViagens;
  except on E: Exception do
  end;
  Timer1.Enabled := true;
  Timer2.Enabled := true;
end;

procedure TFormPrincipal.Timer2Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  fdQryConfiguracoes.Edit;
  fdQryConfiguracoesULTIMA_VIAGEM_SAT.AsInteger := fdQryConfiguracoesULTIMA_VIAGEM_SAT.AsInteger - 500;
  fdQryConfiguracoesULTIMO_MOTORISTA_SAT.AsInteger := fdQryConfiguracoesULTIMO_MOTORISTA_SAT.AsInteger - 500;
  fdQryConfiguracoes.Post;
  try
    enviaMotoristas;
  except on E: Exception do
  end;
  try
    enviaViagens;
  except on E: Exception do
  end;
  Timer1.Enabled := true;
  Timer2.Enabled := true;

end;

end.

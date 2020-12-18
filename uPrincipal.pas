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
    fdQryConfiguracoesCAMINHO_PG: TStringField;
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
    lblCaminhoPG: TLabel;
    dbedtCAMINHO_PG: TDBEdit;
    dbnvgr1: TDBNavigator;
    fdQryConfiguracoesTRANSPORTADORA_ID: TStringField;
    FDConnectionPG: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    btnTeste: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
  private
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


procedure TFormPrincipal.btnTesteClick(Sender: TObject);
var token : string;
 idMotorista : string;
 idViagem : string;
 dataViagem : string;
begin
  token := FormAutenticacao.autenticar(dbedtUSUARIO_FLEX.Text, dbedtSENHA_FLEX.Text);

//  idMotorista := FormDrivers.addMotorista('Jo�o Barbosa ','12345', token);


  dataViagem := FormatDateTime('yyyy-MM-dd', now);

  idViagem := FormTravels.addTravel('1234567', '12334', 'S�o Paulo- SP',
    'Rio de Janeiro- RJ', 'Algod�o', 'hro-2545, hrl-3492',
    dbedtTRANSPORTADORA_ID.Text, '123456', dataViagem, token );


end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin

FDConnectionSqlLite.Params.Database :=  ExtractFilePath( Application.ExeName) +
    'flexconsulta.db';
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
    ' CAMINHO_PG VARCHAR(100) ); ');

  FDConnectionSqlLite.Connected := False;
  FDConnectionSqlLite.Connected := true;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  fdQryConfiguracoes.Open;
end;

end.


unit splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrProgressBar, VrControls, VrGauge,
  TFlatProgressBarUnit, ComCtrls, ExtCtrls, StdCtrls, jpeg, ExeInfo, RzPrgres, AdvShapeButton,
  dxGDIPlusClasses, acPNG, Vcl.WinXCtrls,
  //GCS_FTP,
   IdComponent, AdvGlowButton,
  IdBaseComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
   IdException, IniFiles, ShellAPI, IdFTP;

type
  Tfrmsplash = class(TForm)
    Timer_splash: TTimer;
    Image1: TImage;
    Label2: TLabel;
    ExeInfo1: TExeInfo;
    p: TRzProgressBar;
    Label3: TLabel;
    ProgressBar_splash: TProgressBar;
    Label1: TLabel;
    IdFTP1: TIdFTP;
    Label4: TLabel;
    Label7: TLabel;
    procedure Timer_splashTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    //procedure AdvGlowButton1Click(Sender: TObject);
    function ObterDiretorioDoExecutavel: string;
    function ObterNumeroVersaoLocal: smallint;
    function ObterNumeroVersaoFTP: smallint;
    function ConectarAoServidorFTP: boolean;
    procedure DescompactarAtualizacao;
    procedure AtualizarNumeroVersao;
    procedure BaixarAtualizacao;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
  FnTamanhoTotal: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsplash: Tfrmsplash;
  I: INTEGER;

implementation

{$R *.dfm}

procedure Tfrmsplash.Timer_splashTimer(Sender: TObject);
var
  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
begin

  I := I + 5;

  ProgressBar_splash.Position := ProgressBar_splash.Position + 5;
  {if (ProgressBar1.Position mod 5) = 0 then
  begin

  end;}

  if ProgressBar_splash.Position = 65 then
  begin
    LABEL7.CAPTION := 'CONEX�O COM SERVIDOR REALIZADO COM SUCESSO!';
  end;

    if ProgressBar_splash.Position = 65 then
   begin
     {Form1 := TForm1.create(self);
     Form1.showmodal;}
     WinExec('C:\ACTHAUROS\PDV\SClientes.exe', SW_SHOW);
   end;

     {Form1 := TForm1.create(self);
     Form1.showmodal;}

  if ProgressBar_splash.Position = 90 then
  begin
    LABEL1.CAPTION := 'SISTEMA CARREGADO COM SUCESSO!';
  end;

  if I = 120 then
  CLOSE;
end;

function Tfrmsplash.ConectarAoServidorFTP: boolean;
begin
  // desconecta, caso tenha sido conectado anteriormente
  if IdFTP1.Connected then
    IdFTP1.Disconnect;
  try
    IdFTP1.Connect;
    result := True;
  except
    On E:Exception do
    begin
      ShowMessage('Erro ao acessar o servidor de atualiza��o');
      //ShowMessage('Erro ao acessar o servidor de atualiza��o: ' + E.Message);
      result := False;
      close;
    end;
  end;

end;

procedure Tfrmsplash.BaixarAtualizacao;
begin
  try
    // deleta o arquivo "Atualizacao.rar", caso exista,
    // evitando erro de arquivo j� existente
    if FileExists(ObterDiretorioDoExecutavel + 'GCSLIB.FDB') then
      DeleteFile(ObterDiretorioDoExecutavel + 'GCSLIB.FDB');

    // obt�m o tamanho da atualiza��o e preenche a vari�vel "FnTamanhoTotal"
    FnTamanhoTotal := IdFTP1.Size('dados/atualizacao/GCSLIB.FDB');

    // faz o download do arquivo "Atualizacao.rar"
    IdFTP1.Get('dados/atualizacao/GCSLIB.FDB',
      ObterDiretorioDoExecutavel + 'GCSLIB.FDB', True, True);
  except
    On E:Exception do
    begin
      // ignora a exce��o "Connection Closed Gracefully"
      if E is EIdConnClosedGracefully then
        Exit;

      ShowMessage('Erro ao baixar a atualiza��o: ' + E.Message);

      // interrompe a atualiza��o
      Abort;
    end;
  end;
end;

function Tfrmsplash.ObterNumeroVersaoFTP: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // deleta o arquivo "VersaoFTP.ini" do computador, caso exista,
  // evitando erro de arquivo j� existente
  if FileExists(ObterDiretorioDoExecutavel + 'VersaoFTP.ini') then
    DeleteFile(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');

  // baixa o arquivo "VersaoFTP.ini" para o computador
  IdFTP1.Get('dados/atualizacao/VersaoFTP.ini', ObterDiretorioDoExecutavel + 'VersaoFTP.ini', True, True);
  // abre o arquivo "VersaoFTP.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');
  try
    // l� o n�mero da vers�o
    sNumeroVersao := oArquivoINI.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.1" para "101")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr, [rfReplaceAll]);

    // converte o n�mero da vers�o para n�mero
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure Tfrmsplash.FormShow(Sender: TObject);
var
  Hand : THandle;
begin
  Begin
   Image1.Picture.LoadFromFile('C:\ACTHAUROS\Server\IMG\imagem_fundo.jpeg');
   End;
  Label4.caption :='Vers�o.: '+ ExeInfo1.fileVersion;

  {Hand := FindWindow('TApplication', 'GCS_CAIXA V_2020');
  if Hand = 0 then
  begin

  end
  else
  begin
    application.MessageBox('J� existe uma sess�o aberta deste aplicativo!','Aten��o',mb_ok+MB_ICONERROR );
    ShowWindow(Hand,SW_NORMAL);
    Application.terminate;
  end;}
end;

function Tfrmsplash.ObterDiretorioDoExecutavel: string;
begin
//  result := ExtractFilePath(Application.ExeName);
end;

function Tfrmsplash.ObterNumeroVersaoLocal: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // abre o arquivo "VersaoLocal.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoLocal.ini');
  try
    // l� o n�mero da vers�o
    sNumeroVersao := oArquivoINI.ReadString('VersaoLocal', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.0" para "100")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr, [rfReplaceAll]);

    // converte o n�mero da vers�o para n�mero
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure Tfrmsplash.DescompactarAtualizacao;
var
  sNomeArquivoAtualizacao: string;
begin
  // deleta o backup anterior, ou melhor, da vers�o anterior,
  // evitando erro de arquivo j� existente
  if FileExists(ObterDiretorioDoExecutavel + 'GCSLIB.FDB') then
    DeleteFile(ObterDiretorioDoExecutavel + 'GCSLIB.FDB');

  // Renomeia o execut�vel atual (desatualizado) para "Sistema_Backup.exe"
  RenameFile(ObterDiretorioDoExecutavel + 'GCSLIB.FDB',
    ObterDiretorioDoExecutavel + 'GCSLIB.FDB');

  // armazena o nome do arquivo de atualiza��o em uma vari�vel
  sNomeArquivoAtualizacao := ObterDiretorioDoExecutavel + 'GCSLIB.FDB';

  // executa a linha de comando do 7-Zip para descompactar o arquivo baixado
  ShellExecute(0, nil, '7z',  PWideChar(' e -aoa ' +
    sNomeArquivoAtualizacao + ' -o' + ObterDiretorioDoExecutavel), '', SW_SHOW);
end;

procedure Tfrmsplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
close;
     action := cafree;
end;

procedure Tfrmsplash.FormCreate(Sender: TObject);
//var
//  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;

begin
  { if not ConectarAoServidorFTP then
    Exit;

   nNumeroVersaoLocal := ObterNumeroVersaoLocal;
   nNumeroVersaoFTP := ObterNumeroVersaoFTP;

   if nNumeroVersaoLocal < nNumeroVersaoFTP then
   begin

     BaixarAtualizacao;
     DescompactarAtualizacao;
     AtualizarNumeroVersao;

     ShowMessage('O sistema foi atualizado com sucesso!');

   end
     else
     ShowMessage('O sistema ja est� atualizado!'); }
end;

procedure Tfrmsplash.AtualizarNumeroVersao;
var
  oArquivoLocal, oArquivoFTP: TIniFile;
  sNumeroNovaVersao: string;
begin
  // abre os dois arquivos INI
  oArquivoFTP := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');
  oArquivoLocal := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoLocal.ini');
  try
    // obt�m o n�mero da nova vers�o no arquivo "VersaoFTP.ini"...
    sNumeroNovaVersao := oArquivoFTP.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // ... e grava este n�mero no arquivo "VersaoLocal.ini"
    oArquivoLocal.WriteString('VersaoLocal', 'Numero', sNumeroNovaVersao);
  finally
    FreeAndNil(oArquivoFTP);
    FreeAndNil(oArquivoLocal);
  end;
end;

end.
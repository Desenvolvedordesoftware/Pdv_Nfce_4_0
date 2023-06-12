unit protetor_tela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, AdvOfficeImage, StdCtrls;

type
  TfrmProtetor_tela = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProtetor_tela: TfrmProtetor_tela;

implementation

uses modulo, MMSystem, ComCtrls;

{$R *.dfm}

procedure TfrmProtetor_tela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmProtetor_tela.FormCreate(Sender: TObject);
begin
   playsound('som.wav',1,snd_async)
end;

procedure TfrmProtetor_tela.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close
end;

end.



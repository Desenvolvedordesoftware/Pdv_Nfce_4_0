unit Senha_suporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvMetroButton,
  AdvGlowButton, acPNG, Vcl.ExtCtrls, AdvSmoothPanel;

type
  TFrmSenha_Suporte = class(TForm)
    AdvSmoothPanel2: TAdvSmoothPanel;
    Label12: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Image6: TImage;
    Image9: TImage;
    bcancelar: TAdvGlowButton;
    AdvMetroButton2: TAdvMetroButton;
    AdvSmoothPanel1: TAdvSmoothPanel;
    Label1: TLabel;
    Label3: TLabel;
    Image2: TImage;
    AdvGlowButton1: TAdvGlowButton;
    Edsenha: TEdit;
    procedure AdvMetroButton2Click(Sender: TObject);
    procedure EdsenhaEnter(Sender: TObject);
    procedure EdsenhaExit(Sender: TObject);
    procedure EdsenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenha_Suporte: TFrmSenha_Suporte;

implementation

{$R *.dfm}
uses licenca;

procedure TFrmSenha_Suporte.AdvMetroButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmSenha_Suporte.EdsenhaEnter(Sender: TObject);
begin
  tedit(Sender).Color := $00A0FAF8;
end;

procedure TFrmSenha_Suporte.EdsenhaExit(Sender: TObject);
begin
  tedit(Sender).Color := clwindow;
end;

procedure TFrmSenha_Suporte.EdsenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
  Begin
    if edsenha.Text = FormatDateTime('yymmdd',Now) + '5' then
    Begin
     Frmlicenca := TFrmlicenca.create(self);
     Frmlicenca.showmodal;
     edsenha.Text := '';
     exit;
    End;

    Begin
     application.messagebox('Acesso não permitido!', 'Atenção',
     mb_ok + MB_ICONERROR);
     edsenha.Text := '';
     edsenha.SetFocus;
    End;

   End;

end;

end.

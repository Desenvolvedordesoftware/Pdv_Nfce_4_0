unit GCSenha_Suporte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, AdvMetroButton,
  AdvGlowButton, acPNG, Vcl.ExtCtrls, AdvSmoothPanel;

type
  TFrmSenhaSporte = class(TForm)
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
    pmMenu: TPopupMenu;
    trocaImpressao: TMenuItem;
    procedure EdsenhaEnter(Sender: TObject);
    procedure EdsenhaExit(Sender: TObject);
    procedure EdsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure trocaImpressaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenhaSporte: TFrmSenhaSporte;

implementation
uses Venda;
{$R *.dfm}

procedure TFrmSenhaSporte.EdsenhaEnter(Sender: TObject);
begin
   tedit(Sender).Color := $00A0FAF8;
end;

procedure TFrmSenhaSporte.EdsenhaExit(Sender: TObject);
begin
tedit(Sender).Color := clwindow;
end;

procedure TFrmSenhaSporte.EdsenhaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  Begin
    if edsenha.Text = FormatDateTime('yymmdd',Now) + '8' then
    Begin
     frmVenda.cb_forma1.setfocus;
     edsenha.Text := '';
     exit;
     Close;
    End;

    Begin
     application.messagebox('Acesso n�o permitido!', 'Aten��o',
     mb_ok + MB_ICONERROR);
     edsenha.Text := '';
     edsenha.SetFocus;
    End;

   End;
end;

procedure TFrmSenhaSporte.trocaImpressaoClick(Sender: TObject);
begin
   Close;
end;

end.
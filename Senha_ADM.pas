unit Senha_ADM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.Menus;

type
  TfrmSenha_adm = class(TForm)
    Image1: TImage;
    EditSenha: TEdit;
    Lbsenha: TLabel;
    pmPopMenu_SenhaADM: TPopupMenu;
    trocaImpressao: TMenuItem;
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure trocaImpressaoClick(Sender: TObject);
    procedure Retornar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha_adm: TfrmSenha_adm;

implementation
uses Caixa_Fechamento;
{$R *.dfm}

procedure TfrmSenha_adm.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
  Begin
    if EditSenha.Text = FormatDateTime('yymmdd',Now) + FormatDateTime('hhmm',Now) then
     Begin
     frmCaixa_Fechamento := tfrmcaixa_fechamento.create(self);
     frmCaixa_fechamento.showmodal;
     Close;
    End
    else
    Begin
     application.messagebox('Acesso não permitido!', 'Atenção',
     mb_ok + MB_ICONERROR);
     EditSenha.Text := '';
     EditSenha.SetFocus;
     close
    End;

  End;

end;

procedure TfrmSenha_adm.Retornar1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmSenha_adm.trocaImpressaoClick(Sender: TObject);
begin
  Close;
end;

end.

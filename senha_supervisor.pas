unit senha_supervisor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, AdvOfficeImage, ExtCtrls,
  pngimage, JvGIF, Data.DB, MemDS, DBAccess, Uni, Vcl.Menus, AdvMenus,
  AdvGlowButton;

type
  TfrmSenha_Supervisor = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    ed_senha: TRzEdit;
    Label1: TLabel;
    AdvOfficeImage3: TAdvOfficeImage;
    qrsenha_sup: TUniQuery;
    qrconfig: TUniQuery;
    pop_principal: TAdvPopupMenu;
    Retornar1: TMenuItem;
    btvoltar: TAdvGlowButton;
    procedure ed_senhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ed_senhaEnter(Sender: TObject);
    procedure ed_senhaExit(Sender: TObject);
    procedure Retornar1Click(Sender: TObject);
    procedure btvoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha_Supervisor: TfrmSenha_Supervisor;

implementation

uses principal, funcoes, venda, modulo;

{$R *.dfm}

procedure TfrmSenha_Supervisor.ed_senhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
 Begin

    qrconfig.close;
    qrconfig.sql.clear;
    qrconfig.sql.add('select * from CONFIG');
    qrconfig.open;

  if qrconfig.fieldbyname('senha_criptografada').asstring = '1' then
  begin
    qrsenha_sup.close;
    qrsenha_sup.sql.clear;
    qrsenha_sup.sql.add('select * from c000008');
    qrsenha_sup.sql.add('where SENHA_CRIPTOGRAFADA =:senha ');
    qrsenha_sup.ParamByName('senha').AsString := ed_senha.Text;
    qrsenha_sup.open;

   if qrsenha_sup.fieldbyname('SENHA_CRIPTOGRAFADA').asstring = ed_senha.text then
   Begin
     bSupervisor_autenticado := true;
      close;
   End
   else
    begin
      application.messagebox('Acesso não autorizado!','Erro',mb_ok+mb_iconerror);
      bSair_campo := true;
      close;
    end;

  end
  else
  begin
    if key = #27 then
    begin
      // aborta o cancelamento do item
      bSair_campo := true;
      close;
    end
    else
    begin
      if iTeclado_Modelo = 1 then
      begin
        if key = #8 then strpcopy(@men,key) else strpcopy(@men,'*');
        DispStr(@men);
      end;
    end;
  end;

  if qrconfig.fieldbyname('senha_criptografada').asstring = '0' then
  begin
    if Executa_Login('DELPHOS',ed_senha.text,'') then
    begin
      bSupervisor_autenticado := true;
      close;
    end
    else
    begin
      application.messagebox('Acesso não autorizado!','Erro',mb_ok+mb_iconerror);
      bSair_campo := true;
      close;
    end;
  end
  else
  begin
    if key = #27 then
    begin
      // aborta o cancelamento do item
      bSair_campo := true;
      close;
    end
    else
    begin
      if iTeclado_Modelo = 1 then
      begin
        if key = #8 then strpcopy(@men,key) else strpcopy(@men,'*');
        DispStr(@men);
      end;
    end;
  end;
 End;
end;

procedure TfrmSenha_Supervisor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CLOSE;
   action := cafree;
end;

procedure TfrmSenha_Supervisor.FormShow(Sender: TObject);
begin
  bsupervisor_autenticado := false;
end;

procedure TfrmSenha_Supervisor.Retornar1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmSenha_Supervisor.btvoltarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSenha_Supervisor.ed_senhaEnter(Sender: TObject);
begin
  if iTeclado_Modelo = 1 then
  begin
    LineFeed;
    CarRet;
  end;
  PopupMenu := nil;
  // controlar a saida do edit de cancelamento de item
  bSair_campo := false;
end;

procedure TfrmSenha_Supervisor.ed_senhaExit(Sender: TObject);
begin
  // nao permitir a saida do campo clicando com o mouse em outro lugar
  // ou pressionando tab
  if not bsair_campo then ed_senha.setfocus;
end;

end.

unit Identifica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ACBrValidador, maskutils, AdvMetroButton,
  AdvSmoothPanel, AdvSmoothExpanderPanel, AdvGlowButton, dxGDIPlusClasses;

type
  TfrmIdentifica = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    bt_ok1: TButton;
    bt_cancelar1: TButton;
    bt_ok: TAdvGlowButton;
    bt_cancelar: TAdvGlowButton;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label53: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    ed_cpf: TEdit;
    ed_nome: TEdit;
    ed_endereco: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_cancelar1Click(Sender: TObject);
    procedure bt_ok1Click(Sender: TObject);
    procedure ed_cpfKeyPress(Sender: TObject; var Key: Char);
    procedure ed_cpfExit(Sender: TObject);
    procedure ed_nomeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_enderecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIdentifica: TfrmIdentifica;

implementation

uses modulo, principal, funcoes, venda;

{$R *.dfm}

procedure TfrmIdentifica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //BlockInput(true);
  action := cafree;
end;

procedure TfrmIdentifica.bt_cancelar1Click(Sender: TObject);
begin
   if bLanca_OS = true then
  Begin
    if ed_cpf.Text = '' then
    begin
       ed_cpf.text := '81746903287';
    end;


    if ed_cpf.Text <> '' then
    begin

      if Length(ed_cpf.Text) > 11 then
        sConsumidor_CPF := FormatMaskText('99.999.999/9999-99;0;_',ed_cpf.text)
      else
        sConsumidor_CPF := FormatMaskText('999.999.999-99;0;_',ed_cpf.text);

      frmModulo.docValidador.Documento := sConsumidor_CPF;
      frmModulo.docValidador.TipoDocto := docCPF;
      if not frmmodulo.docValidador.Validar then
      begin
        frmModulo.docValidador.TipoDocto := docCnpj;
        if not frmmodulo.docValidador.Validar then
        begin
          Application.MessageBox('Documento inv�lido!','Erro',mb_ok+mb_iconerror);
          ed_cpf.SetFocus;
          exit;
        end;
      end;
      sConsumidor_Nome := ed_nome.text;
      sConsumidor_Endereco := ed_endereco.text;

      close;
    end

   End;

  close;
end;

procedure TfrmIdentifica.bt_ok1Click(Sender: TObject);
begin
  if ed_cpf.Text = '' then
  begin
     ed_cpf.text := '81746903287';
  end;


  if ed_cpf.Text <> '' then
  begin

    if Length(ed_cpf.Text) > 11 then
      sConsumidor_CPF := FormatMaskText('99.999.999/9999-99;0;_',ed_cpf.text)
    else
      sConsumidor_CPF := FormatMaskText('999.999.999-99;0;_',ed_cpf.text);

    frmModulo.docValidador.Documento := sConsumidor_CPF;
    frmModulo.docValidador.TipoDocto := docCPF;
    if not frmmodulo.docValidador.Validar then
    begin
      frmModulo.docValidador.TipoDocto := docCnpj;
      if not frmmodulo.docValidador.Validar then
      begin
        Application.MessageBox('Documento inv�lido!','Erro',mb_ok+mb_iconerror);
        ed_cpf.SetFocus;
        exit;
      end;
    end;
    sConsumidor_Nome := ed_nome.text;
    sConsumidor_Endereco := ed_endereco.text;

    close;
  end
  else
    close;
end;

procedure TfrmIdentifica.ed_cpfKeyPress(Sender: TObject; var Key: Char);
begin
  if key <> #8 then
  if key = #27 then close
  else
  if key = #13 then perform(wm_nextdlgctl,0,0)
  else
    if key in ['0'..'9'] then

    else
      abort;
end;

procedure TfrmIdentifica.ed_cpfExit(Sender: TObject);
begin
  if ed_cpf.text = '' then bt_ok.setfocus;
end;

procedure TfrmIdentifica.ed_nomeExit(Sender: TObject);
begin
  if ed_nome.text = '' then bt_ok.SetFocus;
end;

procedure TfrmIdentifica.FormShow(Sender: TObject);
begin
  //BlockInput(false);
  sConsumidor_Nome := '';
  sConsumidor_Endereco := '';
  sConsumidor_CPF := '';
  ed_cpf.SetFocus;
end;

procedure TfrmIdentifica.ed_nomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  if ed_nome.text = '' then bt_ok.setfocus else ed_endereco.setfocus;
end;

procedure TfrmIdentifica.ed_enderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then bt_ok.setfocus;
end;

end.

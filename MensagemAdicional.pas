unit MensagemAdicional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmMensagemAdicional = class(TForm)
    Panel1: TPanel;
    edtexto: TMemo;
    btn1: TAdvGlowButton;
    btn2: TAdvGlowButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edtextoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Confirma:Boolean;
  public
    { Public declarations }
  end;
  function MessagemAdcionalCupom(var Mensagem:TMemo):Boolean;
var
  frmMensagemAdicional: TfrmMensagemAdicional;

implementation

uses modulo;

{$R *.dfm}

function MessagemAdcionalCupom(var Mensagem:TMemo):Boolean;
begin
  Application.CreateForm(TfrmMensagemAdicional, frmMensagemAdicional);
  with frmMensagemAdicional do begin
    Confirma := False;
    ShowModal;
    Mensagem.Lines := edtexto.Lines;

  end;
  FreeAndNil(frmMensagemAdicional);
end;


procedure TfrmMensagemAdicional.btn1Click(Sender: TObject);
begin
  if Length(edtexto.Lines.Text) <= 0 then begin
    Application.MessageBox('Informe o ENDEREÇO/OBSERVAÇÃO a ser impressa no cupom!','Atenção',MB_ICONINFORMATION);
    edtexto.SetFocus;
    Exit;
  end;
  Confirma := True;
  Close;
end;

procedure TfrmMensagemAdicional.btn2Click(Sender: TObject);
begin
  Confirma := False;
  edtexto.Lines.Clear;
  Close;
end;

procedure TfrmMensagemAdicional.edtextoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Length(edtexto.Lines[edtexto.CaretPos.Y]) >= iLarguraBobina) then
    key := #13;
end;

end.

unit msg_Operador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxGDIPlusClasses, JvExControls, JvAnimatedImage, JvGIFCtrl;

type
  TfrmMsg_Operador = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    JvGIFAnimator2: TJvGIFAnimator;
    lb_msg: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure lb_msgClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMsg_Operador: TfrmMsg_Operador;

implementation

{$R *.dfm}

// -------------------------------------------------------------------------- //
procedure TfrmMsg_Operador.FormShow(Sender: TObject);
begin
  application.ProcessMessages;
   JvGIFAnimator2.Animate := true;
end;

procedure TfrmMsg_Operador.lb_msgClick(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //
procedure TfrmMsg_Operador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  close;
  action := cafree;
end;

procedure TfrmMsg_Operador.FormHide(Sender: TObject);
begin
  application.ProcessMessages;
  JvGIFAnimator2.Animate := false;
  //action := cafree;
end;

end.

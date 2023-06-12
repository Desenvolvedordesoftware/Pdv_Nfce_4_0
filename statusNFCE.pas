unit statusNFCE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg,JvAnimatedImage,
  JvGIFCtrl, JvExControls;

type
  TfrmStatus = class(TForm)
    JvGIFAnimator2: TJvGIFAnimator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStatus: TfrmStatus;

implementation

{$R *.dfm}

procedure TfrmStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    JvGIFAnimator2.Animate := false;
    JvGIFAnimator2.Free;
    close;

end;

procedure TfrmStatus.FormShow(Sender: TObject);
begin
 //  JvGIFAnimator2.Animate := true;
end;

end.

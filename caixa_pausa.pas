unit caixa_pausa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvAnimatedImage, JvGIFCtrl,
  Vcl.Menus, AdvMenus, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Tfrmcaixapausa = class(TForm)
    pop_principal: TAdvPopupMenu;
    R1: TMenuItem;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure R1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcaixapausa: Tfrmcaixapausa;
  I: INTEGER;
implementation

{$R *.dfm}

procedure Tfrmcaixapausa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;


procedure Tfrmcaixapausa.FormShow(Sender: TObject);
begin
Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\img\LogoEmpresa_caixa.jpg');
Timer1.Enabled := true;
end;

procedure Tfrmcaixapausa.R1Click(Sender: TObject);
begin
 Close;
end;

procedure Tfrmcaixapausa.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := true;
  I := I + 5;

  ProgressBar1.Position := ProgressBar1.Position + 5;
  {if (ProgressBar1.Position mod 5) = 0 then
  begin

  end;}


  //1
  if ProgressBar1.Position = 6 then
  begin
    Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\1.jpg');
  end;
  //2
    if ProgressBar1.Position = 15 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\2.jpg');
   end;
   //3
   if ProgressBar1.Position = 30 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\3.jpg');
   end;
   //4
   if ProgressBar1.Position = 45 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\4.jpg');
   end;
   //5
   if ProgressBar1.Position = 60 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\5.jpg');
   end;
   //6
   if ProgressBar1.Position = 75 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\6.jpg');
   end;
   //7
   if ProgressBar1.Position = 90 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\img\LogoEmpresa_caixa.jpg');
   end;
  if I = 150 then
  Timer1.Enabled := false;
  Timer2.OnTimer := Timer2Timer;
end;

procedure Tfrmcaixapausa.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := true;
  I := I + 5;

  ProgressBar1.Position := ProgressBar1.Position + 5;
  {if (ProgressBar1.Position mod 5) = 0 then
  begin

  end;}


  //1
  if ProgressBar1.Position = 6 then
  begin
    Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\1.jpg');
  end;
  //2
    if ProgressBar1.Position = 15 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\2.jpg');
   end;
   //3
   if ProgressBar1.Position = 30 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\3.jpg');
   end;
   //4
   if ProgressBar1.Position = 45 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\4.jpg');
   end;
   //5
   if ProgressBar1.Position = 60 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\5.jpg');
   end;
   //6
   if ProgressBar1.Position = 75 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\Img\Divulgacao\6.jpg');
   end;
   //7
   if ProgressBar1.Position = 90 then
   begin
     Image1.Picture.LoadFromFile('C:\ACTHAUROS\PDV\img\LogoEmpresa_caixa.jpg');
   end;

  if I = 150 then
  Timer2.Enabled := false;
  Timer1.OnTimer := Timer1Timer;
end;

end.

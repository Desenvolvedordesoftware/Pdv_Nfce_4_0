unit Bloqueio_estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmBloqueio_semestoque = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBloqueio_semestoque: TfrmBloqueio_semestoque;

implementation

{$R *.dfm}

uses venda;

procedure TfrmBloqueio_semestoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then close
end;

procedure TfrmBloqueio_semestoque.FormShow(Sender: TObject);
begin
  Panel2.Caption := frmvenda.ED_barra.TEXT;
end;

end.

unit cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, consumidor, Vcl.Menus, AdvMenus,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, AdvGlowButton, Vcl.ExtCtrls, RzLabel,
  TFlatPanelUnit;

type
  TfrmConsumidor1 = class(TfrmConsumidor)
    ed_consumid_codigo: TRzEdit;
    RzLabel1: TRzLabel;
    Shape1: TShape;
    ed_consumid_telefone: TRzEdit;
    Shape2: TShape;
    Shape3: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsumidor1: TfrmConsumidor1;

implementation

{$R *.dfm}

end.
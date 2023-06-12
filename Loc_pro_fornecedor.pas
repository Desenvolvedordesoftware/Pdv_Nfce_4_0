unit Loc_pro_fornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, RzLabel,
  Vcl.Mask, RzEdit, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid;

type
  TLoc_Pro_cod_original = class(TForm)
    grid: TNextGrid;
    NxNumberColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    NxNumberColumn3: TNxNumberColumn;
    NxNumberColumn2: TNxNumberColumn;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    NxTextColumn6: TNxTextColumn;
    NxTextColumn7: TNxTextColumn;
    ed_barra: TRzEdit;
    RzLabel1: TRzLabel;
    lb_cliente: TRzLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    lb_status: TRzLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Loc_Pro_cod_original: TLoc_Pro_cod_original;

implementation

{$R *.dfm}

end.

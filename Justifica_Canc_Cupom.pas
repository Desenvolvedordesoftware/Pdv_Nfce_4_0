unit Justifica_Canc_Cupom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.StdCtrls,
  AdvSmoothPanel, AdvSmoothExpanderPanel, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmJustifica_Canc_cupom = class(TForm)
    edTexto: TMemo;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label53: TLabel;
    AdvSmoothExpanderPanel2: TAdvSmoothExpanderPanel;
    bt_confirmar_fechamento: TAdvGlowButton;
    qrJustifica: TUniQuery;
    procedure edTextoKeyPress(Sender: TObject; var Key: Char);
    procedure bt_confirmar_fechamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJustifica_Canc_cupom: TfrmJustifica_Canc_cupom;

implementation

uses funcoes, modulo, cupom_impressao, menu_fiscal;
{$R *.dfm}

procedure TfrmJustifica_Canc_cupom.bt_confirmar_fechamentoClick(
  Sender: TObject);
begin
close;
end;

procedure TfrmJustifica_Canc_cupom.edTextoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin


     if edTexto.Text <= '' then begin
      Application.MessageBox('Favor informar a Justificativa!','Erro',mb_ok+mb_iconerror);
      exit;
    end;


             qrJustifica.Close;
             qrJustifica.sql.clear;
             qrJustifica.sql.add('update CUPOM set PEGO_PORQUEM = :OBS ');
             qrJustifica.sql.add('where ');
             {qrJustifica.sql.add('codigo = ''' +
             +Cupom_Menu.grid_cupom.Cell[4,grid_cupom.selectedrow].asstring+ + '''');}
             qrJustifica.Parambyname('OBS').asstring := edTexto.Text;
             qrJustifica.ExecSQL;
             close;

  end;

end;

end.

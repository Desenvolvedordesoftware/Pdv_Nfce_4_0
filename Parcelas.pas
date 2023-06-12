unit Parcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  Vcl.ExtCtrls, System.Math;

type
  TParcelas = record
    Parcelas:Integer;
    Valor:Double;
    Diferenca:Double;
  end;
type
  TfrmParcelas = class(TForm)
    Panel1: TPanel;
    Label53: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    edParcelas: TRzNumericEdit;
    lbResultado: TLabel;
    lbTotal: TLabel;
    procedure edParcelasChange(Sender: TObject);
    procedure edParcelasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vtotal, VValor, VDiferenca:Double;
    iParcelas:Integer;
    Continua:Boolean;
  public
    { Public declarations }
  end;
  function RetornaParcelas(Total:double):TParcelas;

var
  frmParcelas: TfrmParcelas;

implementation

{$R *.dfm}

function RetornaParcelas(Total:double):TParcelas;
begin
  Application.CreateForm(TfrmParcelas, frmParcelas);
  with frmParcelas do begin
    Continua := False;
    vtotal := Total;
    lbTotal.Caption := FormatFloat('#,##0.00',Total);
    edParcelas.Text := '1';
    edParcelasChange(edParcelas);
    ShowModal;
    if Continua then begin
      Result.Parcelas := iParcelas;
      Result.Valor := VValor;
      Result.Diferenca := VDiferenca;
    end else begin
      Result.Parcelas := -1;
      Result.Valor := 0;
      Result.Diferenca := 0;
    end;
  end;
  FreeAndNil(frmParcelas);
end;


procedure TfrmParcelas.edParcelasChange(Sender: TObject);
var
  Parcela, diferenca:Double;
begin
  if edParcelas.Text <> '' then begin
    Parcela := Roundto(vtotal/StrToInt(edParcelas.Text),-2);
    diferenca := vtotal - (Parcela * StrToInt(edParcelas.Text));
    lbResultado.Caption := edParcelas.Text + ' X de R$ ' + FormatFloat('#,##0.00',Parcela);
    iParcelas := StrToInt(edParcelas.Text);
    VValor := Parcela;
    VDiferenca := diferenca;
  end else
    lbResultado.Caption := '';
end;

procedure TfrmParcelas.edParcelasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Continua := True;
    Close;
  end;
  if Key = #27 then begin
    Continua := False;
    Close;
  end;

end;

end.

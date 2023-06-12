unit pix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cefvcl, dxGDIPlusClasses,
  Vcl.ExtCtrls, RLReport, RLBarcode, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxBarCode, AdvGlowButton, RzLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFrm_pix = class(TForm)
    Label1: TLabel;
    edtChave: TEdit;
    Label2: TLabel;
    edtBeneficiario: TEdit;
    Label3: TLabel;
    edtCidade: TEdit;
    Label4: TLabel;
    edtValor: TEdit;
    LabelPayLoad: TLabel;
    edtpayload: TEdit;
    edtCodTrans: TEdit;
    Label5: TLabel;
    Image1: TImage;
    Panel_pix: TPanel;
    dxBarCode_QrCode_pix: TdxBarCode;
    Pn_gerar_nfce: TPanel;
    btsair: TAdvGlowButton;
    btgerar_pix: TAdvGlowButton;
    RzLabel49: TRzLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RzLabel1: TRzLabel;
    Panel3: TPanel;
    lbchaverpix: TRzLabel;
    Panel4: TPanel;
    RzLabel2: TRzLabel;
    Panel5: TPanel;
    lbvalor_pix: TRzLabel;
    Panel6: TPanel;
    lbstatus_pix: TRzLabel;
    Timer1: TTimer;
    RzLabel3: TRzLabel;
    function PayLoad(ChavePIX: String;Beneficiario: String;Cidade: String;CodTransferencia: String;Valor: Real): String;
    procedure btsairClick(Sender: TObject);
    procedure btgerar_pixClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure lbstatus_pixClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pix: TFrm_pix;

implementation

uses venda, modulo;

{$R *.dfm}
function CRC16CCITT(texto: string): WORD;
 const
  polynomial = $1021;
 var
 crc: WORD;
 i, j: Integer;
 b: Byte;
 bit, c15: Boolean;
 begin
  crc := $FFFF;
   for i := 1 to length(texto) do
   begin
   b := Byte(texto[i]);
   for j := 0 to 7 do
    begin
    bit := (((b shr (7 - j)) and 1) = 1);
    c15 := (((crc shr 15) and 1) = 1);
    crc := crc shl 1;
    if (c15 xor bit) then
    crc := crc xor polynomial;
    end;
   end;
   Result := crc and $FFFF;
end;
//////////////////////////////////// Função para gerar o PayLoad //////////////////
procedure TFrm_pix.btgerar_pixClick(Sender: TObject);
Begin
close;
end;

procedure TFrm_pix.btsairClick(Sender: TObject);
begin
close;
   frmvenda.bt_cancelar_fechamento.Click;
end;

procedure TFrm_pix.FormShow(Sender: TObject);
 var
QrCode :String;
scod_cupom: string;
begin
  Begin
    frmvenda.qremitente.close;
    frmvenda.qremitente.SQL.clear;
    frmvenda.qremitente.SQL.add('select * from c999999');
    frmvenda.qremitente.open;
    edtBeneficiario.Text := frmvenda.qremitente.FieldByName('RESPONSAVEL').asstring;
    End;


//limpar os campos
  Begin
   edtChave.Text := frmvenda.qremitente.FieldByName('CHAVE_PIX').asstring;

   edtCidade.Text := 'MARABA';

   edtCodTrans.Text := '';
   edtpayload.Text := '';
   lbchaverpix.Caption := frmvenda.qremitente.FieldByName('CHAVE_PIX').asstring;
  End;

  if frmvenda.cb_forma1.Items.Text = 'PIX' then
  Begin
   Frm_pix.edtValor.Text := frmvenda.ed_forma1.Text;
  End;


  if frmvenda.cb_forma2.Items.Text = 'PIX' then
  Begin
   Frm_pix.edtValor.Text := frmvenda.ed_forma2.Text;
  End;


  if frmvenda.cb_forma3.Items.Text = 'PIX' then
  Begin
   Frm_pix.edtValor.Text := frmvenda.ed_forma3.Text;
  End;

   edtCodTrans.Text := 'NV'+frmvenda.lbcod_operador.Caption + frmvenda.edtCodTrans.Text+'OP'+frmvenda.lbcod_operador.Caption;
   lbvalor_pix.Caption := edtValor.Text;
 //gerando chaver
 Begin
 edtPayLoad.Clear;
 edtPayLoad.Text:=PayLoad(edtChave.Text,edtBeneficiario.Text,edtCidade.Text,edtCodTrans.Text,StrToFloat(edtValor.Text));
 end;
 //gerar QRCode
 Begin
  dxBarCode_QrCode_pix.Visible := True;
  dxBarCode_QrCode_pix.text := edtPayLoad.Text;
 end;

   Panel6.Color := clGreen;
   lbstatus_pix.Caption := 'Confimar Pagamento pix !';


end;

procedure TFrm_pix.lbstatus_pixClick(Sender: TObject);
begin
 close;
end;

function TFrm_pix.PayLoad(ChavePIX: String;Beneficiario: String;Cidade: String;CodTransferencia: String;Valor: Real): String;
const Payload_Format_Indicator: String = '000201';
const Merchant_Account_Information: String = '26';
const Merchant_Category_Code :  String = '52040000';
const Transaction_Currency  : String = '530398654';
const Country_Code : String = '5802BR';
const Merchant_Name : String = '59';
const Merchant_City : String = '60';
const Additional_Data_Field_Template : String = '62';
const CRC162 : String = '6304';
Var
 CODPayLoad,Merchant_Account_Information_String,Valor_Total,txid,CRC: String;
begin
  Merchant_Account_Information_String:= '0014BR.GOV.BCB.PIX01'+Length(ChavePIX).ToString+
  ChavePIX;
  Valor_Total:=FormatFloat('#####0.00;00.00',Valor);
  Valor_Total:=StringReplace(Valor_Total,',','.',[]);
  txid:='05'+FormatFloat('00',LengTh(CodTransferencia))+CodTransferencia;
  CODPayLoad:=Payload_Format_Indicator+
  Merchant_Account_Information+Length(Merchant_Account_Information_String).ToString+
  Merchant_Account_Information_String+Merchant_Category_Code+Transaction_Currency+
  FormatFloat('00',Length(Valor_Total))+Valor_Total+Country_Code+Merchant_Name+
  FormatFloat('00',LengTh(Beneficiario))+Beneficiario+Merchant_City+FormatFloat('00',Length(Cidade))+
  cidade+Additional_Data_Field_Template+FormatFloat('00',LengTh(txid))+txid+'6304';
  CRC:=inttohex(CRC16CCITT(CODPayLoad), 4);
  result:=CODPayLoad+CRC;
end;
procedure TFrm_pix.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := False;
   Panel6.Color := clGreen;
   lbstatus_pix.Caption := 'Pagamento pix Confimado!';
   Showmessage('Pagamento realizado!' + #13 + 'Venda será liberada!');
   btgerar_pix.Click;
end;

end.


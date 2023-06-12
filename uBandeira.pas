unit uBandeira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, MemDS, DBAccess, Uni, Parcelas, pcnConversao,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxDataControllerConditionalFormattingRulesManagerDialog,
  acPNG, dxGDIPlusClasses, AdvGlowButton, JvExControls, JvAnimatedImage,
  JvGIFCtrl;

type
  TBaneira = record
    Bandeira:TpcnBandeiraCartao;
    Numero:Integer;
    Parcela:TParcelas;
  end;
  TTipoCartao = (tcCredito, tcDebito);

type
  TfrmBandeira = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    Label53: TLabel;
    DataSource1: TDataSource;
    qrBanco: TUniQuery;
    qrBancoNUMERO: TIntegerField;
    qrBancoBANCO: TStringField;
    qrBancoLOGO: TBlobField;
    qrBancoCARTAO_CREDITO: TIntegerField;
    qrBancoFINANCEIRA: TIntegerField;
    cxGrid1DBTableView1BANCO: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Panel2: TPanel;
    Label1: TLabel;
    qrBancoADMINISTRADORA: TStringField;
    bt_cancelar_item_nao: TAdvGlowButton;
    Panel4: TPanel;
    AdvGlowButton2: TAdvGlowButton;
    Image3: TImage;
    Image2: TImage;
    Image4: TImage;
    Image1: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Panel5: TPanel;
    AdvGlowButton3: TAdvGlowButton;
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure bt_cancelar_item_naoClick(Sender: TObject);
  private
    { Private declarations }
    Continua:Boolean;
    Parcela:TParcelas;
    Vtotal:Double;
    vTipoCartac:TTipoCartao;
  public
    { Public declarations }
  end;
  function RetBandeira(Total:Double; Tipo:TTipoCartao):TBaneira;


var
  frmBandeira: TfrmBandeira;

implementation

uses
  modulo, Venda;

{$R *.dfm}

function RetBandeira(Total:Double; Tipo:TTipoCartao):TBaneira;
begin
  Application.CreateForm(TfrmBandeira, frmBandeira);
  with frmBandeira do begin
    vTipoCartac := Tipo;
    Vtotal := Total;
    ShowModal;
    if Continua then begin
      if UpperCase(qrBancoADMINISTRADORA.AsString) = 'VISA' then
        Result.Bandeira := bcVisa
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'MASTERCARD' then
        Result.Bandeira := bcMasterCard
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'AMERICAN EXPRESS' then
        Result.Bandeira := bcAmericanExpress
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'SOROCRED' then
        Result.Bandeira := bcSorocred
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'DINERS CLUB' then
        Result.Bandeira := bcDinersClub
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'ELO' then
        Result.Bandeira := bcElo
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'HIPERCARD' then
        Result.Bandeira := bcHipercard
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'AURA' then
        Result.Bandeira := bcAura
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'CABAL' then
        Result.Bandeira := bcCabal
      else if UpperCase(qrBancoADMINISTRADORA.AsString) = 'OUTROS' then
        Result.Bandeira := bcOutros;
      Result.Numero := qrBancoNUMERO.AsInteger;
      Result.Parcela := Parcela;
    end else begin
      Result.Bandeira := bcVisa;
      Result.Numero := -1;
      Result.Parcela.Parcelas := -1;
      Result.Parcela.Valor := 0;
      Result.Parcela.Diferenca := 0;

      frmVenda.cb_forma1.ItemIndex := 0;
      frmVenda.ed_forma1.value := frmVenda.ed_total_pagar.value;
      frmVenda.cb_forma2.Visible := false;
      frmVenda.ed_forma2.Visible := false;
      frmVenda.cb_forma3.Visible := false;
      frmVenda.ed_forma3.Visible := false;

      frmVenda.cb_forma2.itemindex := -1;
      frmVenda.cb_forma3.itemindex := -2;

      frmVenda.ed_forma2.value := 0;
      frmVenda.ed_forma3.value := 0;
      frmVenda.pn_principal.Enabled := false;
      //frmVenda.CentralizarPanel(pn_fechamento);
      frmVenda.pn_fechamento.Visible := true;
      frmVenda.ed_desc_acre.DisplayFormat := '##0.00%';
      frmVenda.ED_DESC_ACRE.SetFocus;
    end;

  end;
  FreeAndNil(frmBandeira);
end;

procedure TfrmBandeira.bt_cancelar_item_naoClick(Sender: TObject);
begin
 close;

end;

procedure TfrmBandeira.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then begin
    if vTipoCartac = tcCredito then
      Parcela := RetornaParcelas(Vtotal)
    else begin
      Parcela.Parcelas := 1;
      Parcela.Valor := Vtotal;
      Parcela.Diferenca := 0;
    end;
    if Parcela.Parcelas > 0 then
       Continua := True
    else
      Continua := False;
    Close;
  end;
  if Key = #27 then begin
    Continua := False;
    Close;
  end;
end;

end.

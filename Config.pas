unit Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, ACBrNFeDANFEFRDM, ACBrNFeDANFEClass, ACBrNFeDANFEFR, ACBrBase,
  ACBrDFe, ACBrNFe, Data.DB, DBAccess, Uni, MemDS, Vcl.Dialogs, Vcl.ExtDlgs,
  AdvMetroButton, AdvSmoothPanel, AdvSmoothExpanderPanel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, dxGDIPlusClasses, AdvEdit, AdvEdBtn,
  AdvDirectoryEdit, Vcl.Mask, Vcl.DBCtrls, PageView, AdvGlowButton,Printers,
  system.IniFiles, pcnConversao, JvBaseDlg, JvSelectDirectory, Vcl.FileCtrl,
  ACBrDFeSSL, blcksock, System.TypInfo, pcnConversaoNFe, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, ACBrDFeReport, ACBrDFeDANFeReport,
  dxSkinTheBezier;

const
  SELDIRHELP = 1000;

type
  TfrmConfig = class(TForm)

    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pageview1: TPageView;
    PageSheet1: TPageSheet;
    PageSheet2: TPageSheet;
    PageSheet3: TPageSheet;
    GroupBox2: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    GroupBox5: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox3: TGroupBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    CheckHabilitaFotoProduto: TCheckBox;
    Label5: TLabel;
    EditImgProdutos: TAdvDirectoryEdit;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    CheckLogoMarca: TCheckBox;
    EditLogoMarca: TAdvEditBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    GroupBox7: TGroupBox;
    Combo_Usuario: TComboBox;
    Label8: TLabel;
    EditSenhaUsuario: TEdit;
    Label10: TLabel;
    GroupBox8: TGroupBox;
    Label11: TLabel;
    Label9: TLabel;
    Combo_Tesouraria: TComboBox;
    Combo_Caixa: TComboBox;
    btn1: TAdvGlowButton;
    btn2: TAdvGlowButton;
    PageSheet4: TPageSheet;
    AdvSmoothExpanderPanel1: TAdvSmoothExpanderPanel;
    Label53: TLabel;
    AdvMetroButton1: TAdvMetroButton;
    Image1: TImage;
    Panel2: TPanel;
    bttconf001: TAdvGlowButton;
    bttconf002: TAdvGlowButton;
    bttconf003: TAdvGlowButton;
    qrconfig: TUniQuery;
    dsconfig: TUniDataSource;
    btnNFCe: TAdvGlowButton;
    PageSheet5: TPageSheet;
    grp1: TGroupBox;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    grp3: TGroupBox;
    ts3: TTabSheet;
    ts4: TTabSheet;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitRazao: TEdit;
    edtEmitFantasia: TEdit;
    edtEmitFone: TEdit;
    edtEmitCEP: TEdit;
    edtEmitLogradouro: TEdit;
    edtEmitNumero: TEdit;
    edtEmitComp: TEdit;
    edtEmitBairro: TEdit;
    edtEmitCodCidade: TEdit;
    edtEmitCidade: TEdit;
    edtEmitUF: TEdit;
    ACBrNFe1: TACBrNFe;
    dlgOpen1: TOpenDialog;
    OpenDialog1: TOpenDialog;
    TabSheet1: TTabSheet;
    ACBRDANFENFCe: TACBrNFeDANFEFR;
    edSequencia: TEdit;
    Label21: TLabel;
    edSerie: TEdit;
    Label22: TLabel;
    edCFOP: TEdit;
    Label23: TLabel;
    DBEdit5: TDBEdit;
    Label24: TLabel;
    DBEdit7: TDBEdit;
    Label25: TLabel;
    EdFormatoOff: TRadioGroup;
    DBCheckBox10: TDBCheckBox;
    edVenedor: TRadioGroup;
    Label29: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    cbFormaEmissao: TComboBox;
    cbxAtualizarXML: TCheckBox;
    cbxExibirErroSchema: TCheckBox;
    edtFormatoAlerta: TEdit;
    cbModeloDF: TComboBox;
    sbtnPathSalvar: TSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label42: TLabel;
    spPathSchemas: TSpeedButton;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    cbxRetirarAcentos: TCheckBox;
    cbVersaoDF: TComboBox;
    edtIdToken: TEdit;
    edtToken: TEdit;
    edtPathSchemas: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    lTimeOut: TLabel;
    lSSLLib1: TLabel;
    cbxVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    cbxSalvarSOAP: TCheckBox;
    seTimeOut: TSpinEdit;
    cbSSLType: TComboBox;
    gbxRetornoEnvio: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cbxAjustarAut: TCheckBox;
    edtTentativas: TEdit;
    edtIntervalo: TEdit;
    edtAguardar: TEdit;
    gbProxy: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    TabSheet2: TTabSheet;
    cbxSalvarArqs: TCheckBox;
    cbxPastaMensal: TCheckBox;
    cbxAdicionaLiteral: TCheckBox;
    cbxEmissaoPathNFe: TCheckBox;
    cbxSalvaPathEvento: TCheckBox;
    cbxSepararPorCNPJ: TCheckBox;
    cbxSepararPorModelo: TCheckBox;
    sbPathNFe: TSpeedButton;
    Label47: TLabel;
    Label48: TLabel;
    sbPathCan: TSpeedButton;
    Label52: TLabel;
    sbPathEvento: TSpeedButton;
    edtPathNFe: TEdit;
    edtPathCan: TEdit;
    edtPathEvento: TEdit;
    grp2: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    lbl3: TLabel;
    btnGetCert: TSpeedButton;
    lXmlSign: TLabel;
    lHttpLib: TLabel;
    lCryptLib: TLabel;
    lSSLLib: TLabel;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    cbXmlSignLib: TComboBox;
    cbHttpLib: TComboBox;
    cbCryptLib: TComboBox;
    cbSSLLib: TComboBox;
    edtPathInu: TEdit;
    Label50: TLabel;
    sbPathInu: TSpeedButton;
    edImpressora: TComboBox;
    Label19: TLabel;
    edDescEsta: TEdit;
    Label20: TLabel;
    edPreview: TCheckBox;
    Label26: TLabel;
    edMargem: TSpinEdit;
    GroupBox9: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    edMargDir: TcxCalcEdit;
    edMargEsq: TcxCalcEdit;
    edMargSup: TcxCalcEdit;
    edMarginf: TcxCalcEdit;
    qrdav: TUniQuery;
    dsdav: TUniDataSource;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    Label40: TLabel;
    ed_VIS_F_CAIXA: TDBEdit;
    Label41: TLabel;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit9: TDBEdit;
    Label56: TLabel;
    btVendaNormal: TButton;
    btVendaAtacadoOpecao: TButton;
    btVendaAtacadoQTDe: TButton;
    qropcao_venda: TUniQuery;
    Label45: TLabel;
    Label46: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    GroupBox12: TGroupBox;
    DBCheckBox4: TDBCheckBox;
    Label60: TLabel;
    DBCheckBox11: TDBCheckBox;
    Label61: TLabel;
    DBCheckBox12: TDBCheckBox;
    Label62: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckHabilitaFotoProdutoClick(Sender: TObject);
    procedure EditLogoMarcaClickBtn(Sender: TObject);
    procedure CheckLogoMarcaClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bttconf001Click(Sender: TObject);
    procedure bttconf002Click(Sender: TObject);
    procedure bttconf003Click(Sender: TObject);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure btnNFCeClick(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure btnGetCertClick(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure cbCryptLibChange(Sender: TObject);
    procedure cbHttpLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
    procedure cbSSLTypeChange(Sender: TObject);
    procedure sbPathNFeClick(Sender: TObject);
    procedure sbPathCanClick(Sender: TObject);
    procedure sbPathInuClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btVendaNormalClick(Sender: TObject);
    procedure btVendaAtacadoOpecaoClick(Sender: TObject);
    procedure btVendaAtacadoQTDeClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravaConfiguracoesLocais;
    procedure LerConfiguracoes;
    procedure LerCaixa;
    procedure AtualizaSSLLibsCombo;
    procedure PathClick(Sender: TObject);

    procedure GravarConfiguracao;
    procedure LerConfiguracao;
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses modulo, Funcoes, UFuncoes, principal;

{$R *.dfm}

procedure TfrmConfig.FormActivate(Sender: TObject);
begin
  pageview1.ActivePageIndex := 3;
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
var
 T : TSSLLib;
 I : TpcnTipoEmissao ;
 J : TpcnModeloDF;
 K : TpcnVersaoDF;
 U: TSSLCryptLib;
 V: TSSLHttpLib;
 X: TSSLXmlSignLib;
 Y: TSSLType;
begin
  cbSSLLib.Items.Clear ;
  For T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) ) ;
  cbSSLLib.ItemIndex := 0 ;

  cbCryptLib.Items.Clear ;
  For U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) ) ;
  cbCryptLib.ItemIndex := 0 ;

  cbHttpLib.Items.Clear ;
  For V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) ) ;
  cbHttpLib.ItemIndex := 0 ;

  cbXmlSignLib.Items.Clear ;
  For X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) ) ;
  cbXmlSignLib.ItemIndex := 0 ;

  cbSSLType.Items.Clear ;
  For Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) ) ;
  cbSSLType.ItemIndex := 0 ;

  cbFormaEmissao.Items.Clear ;
  For I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) ) ;
  cbFormaEmissao.Items[0] := 'teNormal' ;
  cbFormaEmissao.ItemIndex := 0 ;

  cbModeloDF.Items.Clear ;
  For J := Low(TpcnModeloDF) to High(TpcnModeloDF) do
     cbModeloDF.Items.Add( GetEnumName(TypeInfo(TpcnModeloDF), integer(J) ) ) ;
  cbModeloDF.Items[0] := 'moNFe' ;
  cbModeloDF.ItemIndex := 0 ;

  cbVersaoDF.Items.Clear ;
  For K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
     cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), integer(K) ) ) ;
  cbVersaoDF.Items[0] := 've200' ;
  cbVersaoDF.ItemIndex := 0 ;

  ACBrNFe1.Configuracoes.WebServices.Salvar := true;

end;

procedure TfrmConfig.BitBtn2Click(Sender: TObject);
begin
  if qrconfig.state = dsedit then qrconfig.cancel;
  close;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
var
  I:integer;
begin
  edVenedor.ItemIndex := LerParametro('INFORMAR_VENDEDOR', 'I', 0);
  qrconfig.open;
  edImpressora.items.clear;
  for I := 1 to Printer.Printers.Count do begin
    edImpressora.items.add(Printer.Printers.Strings[I-1]);
  end;
  with frmModulo do begin
    qradic_mestre.open;
    qradic_mestre.Refresh;
    if qradic_mestre.Locate('codigo', '888888', [loCaseInsensitive]) then
      edSequencia.Text := qradic_mestre.FieldByName('sequencia').Text
    else
      edSequencia.Clear;
  end;
  LerConfiguracoes;
  LerConfiguracao;
end;

procedure TfrmConfig.AdvMetroButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfig.AtualizaSSLLibsCombo;
begin
  cbSSLLib.ItemIndex := Integer( ACBrNFe1.Configuracoes.Geral.SSLLib );
  cbCryptLib.ItemIndex := Integer( ACBrNFe1.Configuracoes.Geral.SSLCryptLib );
  cbHttpLib.ItemIndex := Integer( ACBrNFe1.Configuracoes.Geral.SSLHttpLib );
  cbXmlSignLib.ItemIndex := Integer( ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib );
  cbSSLType.Enabled := (ACBrNFe1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]) ;
end;

procedure TfrmConfig.BitBtn1Click(Sender: TObject);
begin
  GravarParametro('INFORMAR_VENDEDOR', 'I', edVenedor.ItemIndex);

  if qrconfig.state = dsedit then
    qrconfig.post;

  application.messagebox('� necess�rio reiniciar o sistema para atualizar as novas configura��es!',
    'Aviso', mb_ok+MB_ICONINFORMATION);

   GravaConfiguracoesLocais;

  Close;

end;

procedure TfrmConfig.CheckHabilitaFotoProdutoClick(Sender: TObject);
begin
  EditimgProdutos.Enabled := CheckHabilitaFotoProduto.Checked;
end;

procedure TfrmConfig.GravaConfiguracoesLocais;
begin
  {: FOTO PRODUTOS}
  GravaINI(sConfiguracoes,'PDV','HAB_IMG', BoolToStr(CheckHabilitaFotoProduto.Checked));
  GravaINI(sConfiguracoes,'PDV','CAMINHO_IMG', EditImgProdutos.Text);

  {: LOGO MARCA}
  GravaINI(sConfiguracoes,'PDV','HAB_LOGO', BoolToStr(CheckLogoMarca.Checked));
  GravaINI(sConfiguracoes,'PDV','CAMINHO_LOGO', EditLogoMarca.Text);

  {: USUARIO}
  GravaINI(sConfiguracoes,'LOGIN','USUARIO', Combo_Usuario.Text);
  GravaINI(sConfiguracoes,'LOGIN','SENHA', Cript('C',EditSenhaUsuario.Text));

  {: CAIXA}
  GravaINI(sConfiguracoes,'CAIXA','NUMERO', Combo_Caixa.Text);
  GravaINI(sConfiguracoes,'CAIXA','TESOURARIA', Combo_Tesouraria.Text);

end;

procedure TfrmConfig.GravarConfiguracao;
Var
  IniFile: String;
  Ini: TIniFile;
  StreamMemo: TMemoryStream;
begin
  IniFile := sConfiguracoes;
  Ini := TIniFile.Create(IniFile);
  try
    Ini.WriteInteger( 'Certificado','SSLLib' , cbSSLLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','CryptLib' , cbCryptLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','HttpLib' , cbHttpLib.ItemIndex) ;
    Ini.WriteInteger( 'Certificado','XmlSignLib' , cbXmlSignLib.ItemIndex) ;
    Ini.WriteString( 'Certificado','Caminho' ,edtCaminho.Text) ;
    Ini.WriteString( 'Certificado','Senha'   ,edtSenha.Text) ;
    Ini.WriteString( 'Certificado','NumSerie',edtNumSerie.Text) ;

    Ini.WriteBool(   'Geral','AtualizarXML'      ,cbxAtualizarXML.Checked) ;
    Ini.WriteBool(   'Geral','ExibirErroSchema'  ,cbxExibirErroSchema.Checked) ;
    Ini.WriteString( 'Geral','FormatoAlerta'  ,edtFormatoAlerta.Text) ;
    Ini.WriteInteger( 'Geral','FormaEmissao',cbFormaEmissao.ItemIndex) ;
    Ini.WriteInteger( 'Geral','ModeloDF',cbModeloDF.ItemIndex) ;
    Ini.WriteInteger( 'Geral','VersaoDF',cbVersaoDF.ItemIndex) ;
    Ini.WriteString( 'Geral','IdToken'  ,edtIdToken.Text) ;
    Ini.WriteString( 'Geral','Token'  ,edtToken.Text) ;
    Ini.WriteBool(   'Geral','RetirarAcentos'      ,cbxRetirarAcentos.Checked) ;
    Ini.WriteBool(   'Geral','Salvar'      ,ckSalvar.Checked) ;
    Ini.WriteString( 'Geral','PathSalvar'  ,edtPathLogs.Text) ;
    Ini.WriteString( 'Geral','PathSchemas'  ,edtPathSchemas.Text) ;
    Ini.WriteString('Geral', 'CFOP_PADRAO', edCFOP.Text);

    Ini.WriteString( 'WebService','UF'        ,cbUF.Text) ;
    Ini.WriteInteger( 'WebService','Ambiente'  ,rgTipoAmb.ItemIndex) ;
    Ini.WriteBool(   'WebService','Visualizar',cbxVisualizar.Checked) ;
    Ini.WriteBool(   'WebService','SalvarSOAP',cbxSalvarSOAP.Checked) ;
    Ini.WriteBool(   'WebService','AjustarAut',cbxAjustarAut.Checked) ;
    Ini.WriteString( 'WebService','Aguardar'    ,edtAguardar.Text) ;
    Ini.WriteString( 'WebService','Tentativas'  ,edtTentativas.Text) ;
    Ini.WriteString( 'WebService','Intervalo'  ,edtIntervalo.Text) ;
    Ini.WriteInteger( 'WebService','TimeOut'   ,seTimeOut.Value) ;
    Ini.WriteInteger( 'WebService','SSLType' , cbSSLType.ItemIndex) ;
    Ini.WriteInteger('WebService', 'FormatoOFF', EdFormatoOff.ItemIndex);

    Ini.WriteString( 'Proxy','Host'   ,edtProxyHost.Text) ;
    Ini.WriteString( 'Proxy','Porta'  ,edtProxyPorta.Text) ;
    Ini.WriteString( 'Proxy','User'   ,edtProxyUser.Text) ;
    Ini.WriteString( 'Proxy','Pass'   ,edtProxySenha.Text) ;

    Ini.WriteBool(   'Arquivos','Salvar'          ,cbxSalvarArqs.Checked) ;
    Ini.WriteBool(   'Arquivos','PastaMensal'     ,cbxPastaMensal.Checked) ;
    Ini.WriteBool(   'Arquivos','AddLiteral'      ,cbxAdicionaLiteral.Checked) ;
    Ini.WriteBool(   'Arquivos','EmissaoPathNFe'  ,cbxEmissaoPathNFe.Checked) ;
    Ini.WriteBool(   'Arquivos','SalvarPathEvento',cbxSalvaPathEvento.Checked) ;
    Ini.WriteBool(   'Arquivos','SepararPorCNPJ'  ,cbxSepararPorCNPJ.Checked) ;
    Ini.WriteBool(   'Arquivos','SepararPorModelo',cbxSepararPorModelo.Checked) ;
    Ini.WriteString( 'Arquivos','PathNFe'    ,edtPathNFe.Text) ;
    Ini.WriteString( 'Arquivos','PathCan'    ,edtPathCan.Text) ;
    Ini.WriteString( 'Arquivos','PathInu'    ,edtPathInu.Text) ;
    Ini.WriteString( 'Arquivos','PathEvento' ,edtPathEvento.Text) ;

    Ini.WriteString('Impressao', 'Impressora', edImpressora.Text);
    Ini.WriteString('Impressao', 'Descricao via estabelecimento', edDescEsta.Text);
    //Ini.WriteString('Impressao', 'Tipo Impressora', Tipo_impressoraNF.Text);
    Ini.WriteBool('Impressao', 'Preview', edPreview.Checked);
    Ini.WriteInteger('Impressao', 'Espessura Margem', edMargem.Value);
    Ini.WriteFloat('Impressao', 'Margem Esquerda', edMargEsq.Value);
    Ini.WriteFloat('Impressao', 'Margem Direita', edMargDir.Value);
    Ini.WriteFloat('Impressao', 'Margem Superior', edMargSup.Value);
    Ini.WriteFloat('Impressao', 'Margem Inferior', edMarginf.Value);

    Ini.WriteString('Emitente', 'CNPJ', edtEmitCNPJ.Text);
    Ini.WriteString('Emitente', 'IE', edtEmitIE.Text);
    Ini.WriteString('Emitente', 'RazaoSocial', edtEmitRazao.Text);
    Ini.WriteString('Emitente', 'Fantasia', edtEmitFantasia.Text);
    Ini.WriteString('Emitente', 'Fone', edtEmitFone.Text);
    Ini.WriteString('Emitente', 'CEP', edtEmitCEP.Text);
    Ini.WriteString('Emitente', 'Logradouro', edtEmitLogradouro.Text);
    Ini.WriteString('Emitente', 'Numero', edtEmitNumero.Text);
    Ini.WriteString('Emitente', 'Complemento', edtEmitComp.Text);
    Ini.WriteString('Emitente', 'Bairro', edtEmitBairro.Text);
    Ini.WriteString('Emitente', 'CodCidade', edtEmitCodCidade.Text);
    Ini.WriteString('Emitente', 'Cidade', edtEmitCidade.Text);
    Ini.WriteString('Emitente', 'UF', edtEmitUF.Text);
    Ini.WriteString('Emitente', 'Serie', edSerie.Text);
  finally
    Ini.Free;
  end;
end;

procedure TfrmConfig.LerConfiguracao;
Var
  IniFile: String;
  Ini: TIniFile;
  Ok: Boolean;
  StreamMemo: TMemoryStream;
begin
  IniFile := sConfiguracoes;

  Ini := TIniFile.Create(IniFile);
  try
    cbSSLLib.ItemIndex := Ini.ReadInteger('Certificado','SSLLib',0);
    cbCryptLib.ItemIndex := Ini.ReadInteger('Certificado','CryptLib',0);
    cbHttpLib.ItemIndex := Ini.ReadInteger( 'Certificado','HttpLib',0);
    cbXmlSignLib.ItemIndex := Ini.ReadInteger('Certificado','XmlSignLib',0);
    edtCaminho.Text := Ini.ReadString('Certificado','Caminho','');
    edtSenha.Text := Ini.ReadString('Certificado','Senha','');
    edtNumSerie.Text := Ini.ReadString('Certificado','NumSerie','');

    cbxAtualizarXML.Checked := Ini.ReadBool('Geral','AtualizarXML',False);
    cbxExibirErroSchema.Checked := Ini.ReadBool('Geral','ExibirErroSchema',False);
    edtFormatoAlerta.Text := Ini.ReadString('Geral','FormatoAlerta'  ,'');
    cbFormaEmissao.ItemIndex := Ini.ReadInteger('Geral','FormaEmissao', 0 );
    cbModeloDF.ItemIndex := Ini.ReadInteger('Geral','ModeloDF',0);
    cbVersaoDF.ItemIndex := Ini.ReadInteger('Geral','VersaoDF',0);
    edtIdToken.Text := Ini.ReadString('Geral','IdToken','');
    edtToken.Text := Ini.ReadString('Geral','Token','');
    cbxRetirarAcentos.Checked := Ini.ReadBool('Geral','RetirarAcentos',False);
    ckSalvar.Checked := Ini.ReadBool('Geral','Salvar',False);
    edtPathLogs.Text := Ini.ReadString('Geral','PathSalvar','');
    edtPathSchemas.Text := Ini.ReadString('Geral','PathSchemas','');
    edCFOP.Text := Ini.ReadString('Geral','CFOP_PADRAO','');

    cbUF.ItemIndex := cbUF.Items.IndexOf(Ini.ReadString( 'WebService','UF','SP'));
    rgTipoAmb.ItemIndex := Ini.ReadInteger('WebService','Ambiente',0);
    cbxVisualizar.Checked := Ini.ReadBool('WebService','Visualizar',False);
    cbxSalvarSOAP.Checked := Ini.ReadBool('WebService','SalvarSOAP',False);
    cbxAjustarAut.Checked := Ini.ReadBool('WebService','AjustarAut',False);
    edtAguardar.Text := Ini.ReadString('WebService','Aguardar','');
    edtTentativas.Text := Ini.ReadString('WebService','Tentativas','');
    edtIntervalo.Text := Ini.ReadString('WebService','Intervalo','');
    seTimeOut.Value := Ini.ReadInteger( 'WebService','TimeOut',0);
    cbSSLType.ItemIndex := Ini.ReadInteger( 'WebService','SSLType',0) ;
    EdFormatoOff.ItemIndex := Ini.ReadInteger('WebService', 'FormatoOFF',0);

    edtProxyHost.Text := Ini.ReadString('Proxy','Host','');
    edtProxyPorta.Text := Ini.ReadString('Proxy','Porta','');
    edtProxyUser.Text := Ini.ReadString('Proxy','User','');
    edtProxySenha.Text := Ini.ReadString('Proxy','Pass','');

    cbxSalvarArqs.Checked := Ini.ReadBool('Arquivos','Salvar',False);
    cbxPastaMensal.Checked := Ini.ReadBool('Arquivos','PastaMensal',False);
    cbxAdicionaLiteral.Checked := Ini.ReadBool('Arquivos','AddLiteral',False);
    cbxEmissaoPathNFe.Checked := Ini.ReadBool('Arquivos','EmissaoPathNFe',False);
    cbxSalvaPathEvento.Checked := Ini.ReadBool('Arquivos','SalvarPathEvento',False);
    cbxSepararPorCNPJ.Checked := Ini.ReadBool('Arquivos','SepararPorCNPJ',False);
    cbxSepararPorModelo.Checked := Ini.ReadBool('Arquivos','SepararPorModelo',False);
    edtPathNFe.Text := Ini.ReadString( 'Arquivos','PathNFe','');
    edtPathCan.Text := Ini.ReadString('Arquivos','PathCan','');
    edtPathInu.Text := Ini.ReadString('Arquivos','PathInu','');
    edtPathEvento.Text := Ini.ReadString('Arquivos','PathEvento','');

    edImpressora.Text := Ini.ReadString('Impressao','Impressora','');
    edDescEsta.Text := Ini.ReadString('Impressao','Descricao via estabelecimento','');
    //Tipo_impressoraNF.Text := Ini.ReadString('Impressao','Tipo Impressora','');
    edPreview.Checked := Ini.ReadBool('Impressao','Preview', False);
    edMargem.Value := Ini.ReadInteger('Impressao','Espessura Margem',1);
    edMargEsq.Value := Ini.ReadFloat('Impressao','Margem Esquerda',0.6);
    edMargDir.Value := Ini.ReadFloat('Impressao','Margem Direita',0.51);
    edMargSup.Value := Ini.ReadFloat('Impressao','Margem Superior',0.8);
    edMarginf.Value := Ini.ReadFloat('Impressao','Margem Inferior',0.8);

    edtEmitCNPJ.Text := Ini.ReadString('Emitente','CNPJ','');
    edtEmitIE.Text := Ini.ReadString('Emitente','IE','');
    edtEmitRazao.Text := Ini.ReadString('Emitente','RazaoSocial','');
    edtEmitFantasia.Text := Ini.ReadString('Emitente','Fantasia','');
    edtEmitFone.Text := Ini.ReadString('Emitente','Fone','');
    edtEmitCEP.Text := Ini.ReadString('Emitente','CEP','');
    edtEmitLogradouro.Text := Ini.ReadString('Emitente','Logradouro','');
    edtEmitNumero.Text := Ini.ReadString('Emitente','Numero','');
    edtEmitComp.Text := Ini.ReadString('Emitente','Complemento','');
    edtEmitBairro.Text := Ini.ReadString('Emitente','Bairro','');
    edtEmitCodCidade.Text := Ini.ReadString('Emitente','CodCidade','');
    edtEmitCidade.Text := Ini.ReadString('Emitente','Cidade','');
    edtEmitUF.Text := Ini.ReadString('Emitente','UF','');
    edSerie.Text := Ini.ReadString('Emitente','Serie','');
  finally
    Ini.Free;
  end;


end;

procedure TfrmConfig.LerConfiguracoes;
begin

  {: FOTO PRODUTOS}
  CheckHabilitaFotoProduto.Checked := StrToBool( LerINI(sConfiguracoes,'PDV','HAB_IMG', BoolToStr(false)) );
  EditImgProdutos.Text  := LerINI(sConfiguracoes,'PDV','CAMINHO_IMG',ExtractFilePath(Application.ExeName) + '\img\produtos\');

  {: LOGO MARCA}
  CheckLogoMarca.Checked := StrToBool( LerINI(sConfiguracoes,'PDV','HAB_LOGO', BoolToStr(false)) );
  EditLogoMarca.Text  := LerINI(sConfiguracoes,'PDV','CAMINHO_LOGO', '');

  LerCaixa;

end;

procedure TfrmConfig.PathClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(TEdit(Sender).Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := TEdit(Sender).Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    TEdit(Sender).Text := Dir;
end;

procedure TfrmConfig.sbPathCanClick(Sender: TObject);
begin
 PathClick(edtPathCan);
end;

procedure TfrmConfig.sbPathEventoClick(Sender: TObject);
begin
 PathClick(edtPathEvento);
end;

procedure TfrmConfig.sbPathInuClick(Sender: TObject);
begin
 PathClick(edtPathInu);
end;

procedure TfrmConfig.sbPathNFeClick(Sender: TObject);
begin
 PathClick(edtPathNFe);
end;

procedure TfrmConfig.sbtnCaminhoCertClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter :=
    'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edtCaminho.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmConfig.sbtnPathSalvarClick(Sender: TObject);
begin
  PathClick(edtPathLogs);
end;

procedure TfrmConfig.spPathSchemasClick(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure TfrmConfig.EditLogoMarcaClickBtn(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    EditLogoMarca.Text := OpenPictureDialog1.FileName;
end;

procedure TfrmConfig.CheckLogoMarcaClick(Sender: TObject);
begin
  EditLogoMarca.Enabled := CheckLogoMarca.Checked;
end;

procedure TfrmConfig.LerCaixa;
begin

   frmmodulo.query.close;
   frmmodulo.query.sql.clear;
   frmmodulo.query.sql.add('select * from adm');
   frmmodulo.query.sql.add('where codigo < ' + QuotedStr('100'));
   frmmodulo.query.sql.add('order by codigo');
   frmmodulo.query.open;

   Combo_Usuario.Items.Clear;

   Combo_Caixa.Items.Clear;
   Combo_Tesouraria.Items.Clear;
   Combo_Tesouraria.Items.Add('DESATIVADO');

   while not frmmodulo.query.Eof do
   begin
     IF frmmodulo.query.Fieldbyname('INFO1').AsString <> 'DELPHOS_1' THEN
     Combo_Usuario.Items.Add(frmmodulo.query.Fieldbyname('INFO1').AsString);

     Combo_Caixa.Items.Add(frmmodulo.query.Fieldbyname('CODIGO').AsString);

     Combo_Tesouraria.Items.Add(frmmodulo.query.Fieldbyname('CODIGO').AsString);
     frmmodulo.query.Next;
     Application.ProcessMessages;
   end;

  Combo_Usuario.Text :=  LerIni(sConfiguracoes,'LOGIN','USUARIO', '');
  EditSenhaUsuario.Text := Cript('D',LerIni(sConfiguracoes,'LOGIN','SENHA', ''));

  Combo_Tesouraria.Text := LerIni(sConfiguracoes,'CAIXA','TESOURARIA', '');
  Combo_Caixa.Text := LerIni(sConfiguracoes,'CAIXA','NUMERO', '99') ;
  iNumCaixa := frmPrincipal.IsInteger(Combo_Caixa.Text);


end;

procedure TfrmConfig.btn1Click(Sender: TObject);
begin
  if Trim(edtEmitCNPJ.Text) = '' then begin
    Application.MessageBox('Informe o CNPJ do Emitente','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edtEmitCNPJ.SetFocus;
    exit;
  end;
  if Trim(edtEmitRazao.Text) = '' then begin
    Application.MessageBox('Informe a Raz�o do Emitente','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edtEmitRazao.SetFocus;
    exit;
  end;
  if Trim(edtEmitFantasia.Text) = '' then begin
    Application.MessageBox('Informe o Nome Fantasia  do Emitente','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edtEmitFantasia.SetFocus;
    exit;
  end;
  if Trim(edtEmitCodCidade.Text) = '' then begin
    Application.MessageBox('Informe o C�digo da Cidade do Emitente','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edtEmitCodCidade.SetFocus;
    exit;
  end;
  if Trim(edtEmitCodCidade.Text) = '' then begin
    Application.MessageBox('Informe o C�digo da Cidade do Emitente','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edtEmitCodCidade.SetFocus;
    exit;
  end;
  if Trim(edtEmitCidade.Text) = '' then begin
    Application.MessageBox('Informe o a Cidade do Emitente','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edtEmitCidade.SetFocus;
    exit;
  end;

  if Trim(edtNumSerie.Text) = '' then begin
    Application.MessageBox('Informe o N�mero de S�rie do Certificado clicando no Bot�o na frente do campos','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts1;
    edtNumSerie.SetFocus;
    exit;
  end;

  if (rgTipoAmb.ItemIndex = 0) and  (Trim(edtToken.Text) = '') then begin
    Application.MessageBox('Informe o N�mero CSC para emiss�o em Produ��o','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts2;
    edtToken.SetFocus;
    exit;
  end;

  if (rgTipoAmb.ItemIndex = 0) and  (Trim(edtIdToken.Text) = '') then begin
    Application.MessageBox('Informe o ID CSC para emiss�o em Produ��o','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts1;
    edtIdToken.SetFocus;
    exit;
  end;

  if (ckSalvar.Checked) and  (Trim(edtPathLogs.Text) = '') then begin
    Application.MessageBox('Informe o Caminho para salvar os XMLs','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts2;
    edtPathLogs.SetFocus;
    exit;
  end;

  if (ckSalvar.Checked) and  not(DirectoryExists(Trim(edtPathLogs.Text))) then begin
    Application.MessageBox('Informe um Caminho valido para salvar os Envios e Respostas','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts2;
    edtPathLogs.SetFocus;
    exit;
  end;

  if not(DirectoryExists(Trim(edtPathNFe.Text))) then begin
    Application.MessageBox('Informe um Caminho valido para salvar os XMLs','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := TabSheet2;
    edtPathNFe.SetFocus;
    exit;
  end;


  if (Trim(edtPathSchemas.Text) = '') or not(DirectoryExists(Trim(edtPathSchemas.Text))) then begin
    Application.MessageBox('Informe um Caminho valido de localiza��o do Schemas','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts2;
    edtPathSchemas.SetFocus;
    exit;
  end;


  if Trim(edtEmitUF.Text) = '' then begin
    Application.MessageBox('Informe o UF do Emitente','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edtEmitUF.SetFocus;
    exit;
  end;

  if Trim(edSequencia.Text) = '' then begin
    Application.MessageBox('Informe a Sequencia da NFC-e','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edSequencia.SetFocus;
    exit;
  end;
  if Trim(edSerie.Text) = '' then begin
    Application.MessageBox('Informe a S�rie da NFC-e','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edSerie.SetFocus;
    exit;
  end;
  if Trim(edCFOP.Text) = '' then begin
    Application.MessageBox('Informe o CFOP Padr�o','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts2;
    edCFOP.SetFocus;
    exit;
  end;

  try
    StrToInt(edSequencia.Text);
  except
    Application.MessageBox('Informe uma Sequencia da NFC-e V�lida','Aten��o!',MB_ICONINFORMATION);
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := ts4;
    edSequencia.SetFocus;
    exit;
  end;
  if edImpressora.Text = '' then begin
    pageview1.ActivePage := PageSheet5;
    pgc1.ActivePage := TabSheet1;
    edImpressora.SetFocus;
    exit;
  end;

  GravarConfiguracao;
  LerConfiguracao;

  with frmModulo do begin
    qradic_mestre.open;
    qradic_mestre.Refresh;
    if qradic_mestre.Locate('codigo', '888888', [loCaseInsensitive]) then begin
      if qradic_mestre.FIELDBYNAME('sequencia').AsInteger <> StrToInt(edSequencia.Text) then begin
        qradic_mestre.Edit;
        qradic_mestre.FIELDBYNAME('sequencia').AsInteger := StrToInt(edSequencia.Text);
        qradic_mestre.Post;
      end;
      Conexao_Servidor.Commit;
    end else begin
      qradic_mestre.Insert;
      qradic_mestre.FIELDBYNAME('CODIGO').AsString := '888888';
      qradic_mestre.FIELDBYNAME('TABELA').AsString := 'Sequencia da NFC-e';
      qradic_mestre.FIELDBYNAME('sequencia').AsInteger := StrToInt(edSequencia.Text);
      qradic_mestre.Post;
    end;
  end;



  GravarParametro('INFORMAR_VENDEDOR', 'I', edVenedor.ItemIndex);

  if qrconfig.state = dsedit then
    qrconfig.post;

  application.messagebox('� necess�rio reiniciar o sistema para atualizar as novas configura��es!',
    'Aviso', mb_ok+MB_ICONINFORMATION);

   GravaConfiguracoesLocais;

  Close;

end;

procedure TfrmConfig.btn2Click(Sender: TObject);
begin
  if qrconfig.state = dsedit then qrconfig.cancel;
  close;

end;

procedure TfrmConfig.btnGetCertClick(Sender: TObject);
begin
//{$IFNDEF ACBrNFeOpenSSL}
  edtNumSerie.Text := ACBrNFe1.SSL.SelecionarCertificado;//ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
//{$ENDIF}
end;

procedure TfrmConfig.btnNFCeClick(Sender: TObject);
begin
  pageview1.ActivePageIndex := 4;
end;

procedure TfrmConfig.bttconf001Click(Sender: TObject);
begin
  pageview1.ActivePageIndex := 0;
end;

procedure TfrmConfig.bttconf002Click(Sender: TObject);
begin
  pageview1.ActivePageIndex := 1;
end;

procedure TfrmConfig.bttconf003Click(Sender: TObject);
begin
  pageview1.ActivePageIndex := 2;
end;

procedure TfrmConfig.btVendaAtacadoOpecaoClick(Sender: TObject);
begin
    qropcao_venda.close;
   qropcao_venda.sql.clear;
   qropcao_venda.sql.add('update CONFIG set avisosonoro = 1');
   qropcao_venda.ExecSQL;
  // frmModulo.conexao.Commit;
end;

procedure TfrmConfig.btVendaAtacadoQTDeClick(Sender: TObject);
begin
    qropcao_venda.close;
   qropcao_venda.sql.clear;
   qropcao_venda.sql.add('update CONFIG set avisosonoro = 2');
   qropcao_venda.ExecSQL;
   //frmModulo.conexao.Commit;
end;

procedure TfrmConfig.btVendaNormalClick(Sender: TObject);
begin
   qropcao_venda.close;
   qropcao_venda.sql.clear;
   qropcao_venda.sql.add('update CONFIG set avisosonoro = 0');
   qropcao_venda.ExecSQL;
   //frmModulo.conexao.Commit;
end;

procedure TfrmConfig.cbCryptLibChange(Sender: TObject);
begin
  try
    if cbCryptLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TfrmConfig.cbHttpLibChange(Sender: TObject);
begin
  try
    if cbHttpLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TfrmConfig.cbSSLLibChange(Sender: TObject);
begin
  try
    if cbSSLLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

procedure TfrmConfig.cbSSLTypeChange(Sender: TObject);
begin
  if cbSSLType.ItemIndex <> -1 then
     ACBrNFe1.SSL.SSLType := TSSLType(cbSSLType.ItemIndex);
end;

procedure TfrmConfig.cbXmlSignLibChange(Sender: TObject);
begin
  try
    if cbXmlSignLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
  finally
    AtualizaSSLLibsCombo;
  end;
end;

end.

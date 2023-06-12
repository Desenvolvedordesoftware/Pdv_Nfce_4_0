unit venda;

interface

uses
  Windows, Messages, Variants, Classes, Graphics, Controls, Vcl.Forms,
  Dialogs, StdCtrls, pcnConversaoNFe, Thread.CheckConnection, Data.DB,
  MemDS, DBAccess, Uni, System.Actions, Vcl.ActnList, Vcl.XPStyleActnCtrls,
  Vcl.ActnMan, Vcl.Menus, AdvMenus, Vcl.ExtCtrls, NxColumnClasses,
  AdvGlowButton, TFlatComboBoxUnit, AdvTimePickerDropDown, RzEdit, RzPanel,
  NxColumns, NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,
  Vcl.Mask, dxGDIPlusClasses, AdvOfficeImage, AdvReflectionLabel, RzLabel,
  acPNG, TFlatPanelUnit, Vcl.FileCtrl, pcnAuxiliar, principal,
  IdIPWatch, pcnConversao, ACBrUtil, ACBrBAL, Clipbrd, JvComponentBase,
  JvThreadTimer, System.SysUtils, FlCtrlEx,JPEG, Consts, AdvMetroButton,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxStatusBar,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxImageComboBox, System.ImageList, Vcl.ImgList,
  uBandeira, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light,
  cxDataControllerConditionalFormattingRulesManagerDialog, frxClass, frxDBSet,
  Vcl.ComCtrls, dxSkinTheBezier;

const
  OffsetMemoryStream : Int64 = 0;

type
  // tipo de imagens do dislplay
  Tipo_Imagem = (tiNenhum, tiLivre, tiErro, tiOk, tiAlerta,
    tiInfo, tiFechado, tiExcluir, tiPergunta,
    tiPgto, tiCliente, tiPeso);

type
  // tipo de transacao tef
  TTef_Tipo = (Tef_Venda_Cartao, Tef_Venda_Cheque);

type
  TfrmVenda = class(TForm)
    pn_tampa: TFlatPanel;
    pnFundo: TPanel;
    pn_principal: TPanel;
    ed_foco: TEdit;
    timer_balanca: TTimer;
    pop_principal: TAdvPopupMenu;
    Opes1: TMenuItem;
    PesquisadeProdutos1: TMenuItem;
    FecharCupom1: TMenuItem;
    CancelarCupom1: TMenuItem;
    CancelarItem1: TMenuItem;
    ConsultadePreos1: TMenuItem;
    ConsultadeClientes1: TMenuItem;
    menu_Prevenda: TMenuItem;
    AcionaBalana1: TMenuItem;
    AcionaGaveta1: TMenuItem;
    Cupons1: TMenuItem;
    Atendimento1: TMenuItem;
    Oramento1: TMenuItem;
    menu_mesa: TMenuItem;
    Comandas1: TMenuItem;
    Caixa1: TMenuItem;
    FecharCaixa1: TMenuItem;
    Suprimento1: TMenuItem;
    Sangria1: TMenuItem;
    CaixaIndisponvel1: TMenuItem;
    rocarOperador1: TMenuItem;
    EF1: TMenuItem;
    EFModoAdministrativo1: TMenuItem;
    EFCancelamento1: TMenuItem;
    N2: TMenuItem;
    Retornar1: TMenuItem;
    Sair1: TMenuItem;
    pop_fechamento: TAdvPopupMenu;
    Voltar1: TMenuItem;
    DescontoouAcrscimo1: TMenuItem;
    Cancelar1: TMenuItem;
    timer_bico: TTimer;
    timer_abastecimento: TTimer;
    timer_resposta: TTimer;
    timer_carga: TTimer;
    pmPopMenuECF: TPopupMenu;
    trocaImpressao: TMenuItem;
    actmgr1: TActionManager;
    act1: TAction;
    TimerTroco: TTimer;
    SaveDialog1: TSaveDialog;
    query: TUniQuery;
    query2: TUniQuery;
    qrForma: TUniQuery;
    query3: TUniQuery;
    qrAbastecimento: TUniQuery;
    qrapoio: TUniQuery;
    qrProdNCFE: TUniQuery;
    QRCSOSN: TUniQuery;
    tmContigencia: TJvThreadTimer;
    qryEnviaContigencia: TUniQuery;
    qryEnviaContigenciaNUMERO: TIntegerField;
    qryEnviaContigenciaDATA: TDateField;
    qryEnviaContigenciaTOTAL: TFloatField;
    qryEnviaContigenciaCLIENTE: TStringField;
    qryEnviaContigenciaCHAVE: TStringField;
    qryEnviaContigenciaXML: TStringField;
    qryEnviaContigenciaSITUACAO: TIntegerField;
    qryEnviaContigenciaTROCO: TFloatField;
    qryEnviaContigenciaHORA: TStringField;
    qryEnviaContigenciaXML_CANCELAMENTO: TStringField;
    qryEnviaContigenciaCONTINGENCIA: TStringField;
    qryEnviaContigenciaENVIADOCONTINGENCIA: TStringField;
    qrContingencia: TUniQuery;
    qrContingenciaNUMERO: TIntegerField;
    qrContingenciaDATA: TDateField;
    qrContingenciaTOTAL: TFloatField;
    qrContingenciaCLIENTE: TStringField;
    qrContingenciaCHAVE: TStringField;
    qrContingenciaXML: TStringField;
    qrContingenciaSITUACAO: TIntegerField;
    qrContingenciaTROCO: TFloatField;
    qrContingenciaHORA: TStringField;
    qrContingenciaXML_CANCELAMENTO: TStringField;
    qrContingenciaCONTINGENCIA: TStringField;
    qrContingenciaENVIADOCONTINGENCIA: TStringField;
    qrContingenciaMOTIVOCONTIGENCIA: TStringField;
    qrContingenciaXMLENVIO: TBlobField;
    qrContingenciaXMLCACNELAMENTO: TBlobField;
    C1: TMenuItem;
    Panel7: TPanel;
    lb_produto: TRzLabel;
    pnBarra: TPanel;
    lbCodBarras: TRzLabel;
    AdvMetroButton2: TAdvMetroButton;
    AdvMetroButton1: TAdvMetroButton;
    Panel1: TPanel;
    Button1: TButton;
    grid_topo: TNextGrid;
    NxHtmlColumn2: TNxHtmlColumn;
    NxNumberColumn9: TNxNumberColumn;
    NxNumberColumn10: TNxNumberColumn;
    NxTextColumn3: TNxTextColumn;
    NxNumberColumn11: TNxNumberColumn;
    NxNumberColumn12: TNxNumberColumn;
    NxNumberColumn13: TNxNumberColumn;
    NxNumberColumn14: TNxNumberColumn;
    NxNumberColumn15: TNxNumberColumn;
    NxNumberColumn16: TNxNumberColumn;
    NxTextColumn4: TNxTextColumn;
    grid: TNextGrid;
    NxHtmlColumn1: TNxHtmlColumn;
    NxNumberColumn8: TNxNumberColumn;
    NxNumberColumn1: TNxTextColumn;
    NxNumberColumn17: TNxNumberColumn;
    NxTextColumn1: TNxTextColumn;
    NxNumberColumn2: TNxNumberColumn;
    NxNumberColumn3: TNxNumberColumn;
    NxNumberColumn5: TNxNumberColumn;
    NxNumberColumn6: TNxNumberColumn;
    NxNumberColumn4: TNxNumberColumn;
    NxNumberColumn7: TNxNumberColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    NxNumberColumn18: TNxNumberColumn;
    nxTamanho: TNxTextColumn;
    nxCor: TNxTextColumn;
    bvGrid: TBevel;
    UniDataSource1: TUniDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ITEM: TcxGridDBColumn;
    cxGrid1DBTableView1COD_BARRA: TcxGridDBColumn;
    cxGrid1DBTableView1CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    cxGrid1DBTableView1UNIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1QTDE: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_UNITARIO: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_ACRESCIMO: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_TOTAL: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1ITEM: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1COD_BARRA: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NOME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1UNIDADE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1QTDE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VALOR_UNITARIO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VALOR_DESCONTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VALOR_ACRESCIMO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1VALOR_TOTAL: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CANCELADO: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    stLinhas: TcxStyle;
    stTitulo: TcxStyle;
    pn_fechamento: TPanel;
    Panel16: TPanel;
    RzLabel2: TRzLabel;
    RzLabel49: TRzLabel;
    RzLabel50: TRzLabel;
    Panel2: TPanel;
    ED_DESC_ACRE: TRzNumericEdit;
    ed_total_pagar: TRzNumericEdit;
    ed_forma1: TRzNumericEdit;
    cb_forma1: TFlatComboBox;
    cb_desc_acre: TFlatComboBox;
    ed_forma2: TRzNumericEdit;
    cb_forma2: TFlatComboBox;
    ed_forma3: TRzNumericEdit;
    cb_forma3: TFlatComboBox;
    ed_totalizador: TRzNumericEdit;
    ed_troco: TRzNumericEdit;
    Panel4: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel17: TPanel;
    bt_confirmar_fechamento: TAdvGlowButton;
    bt_cancelar_fechamento: TAdvGlowButton;
    pn_senha_cancelar: TPanel;
    Shape2: TShape;
    AdvOfficeImage3: TAdvOfficeImage;
    lb_cancelar: TRzLabel;
    ed_senha: TRzEdit;
    pn_cancelar_item: TPanel;
    Shape4: TShape;
    lb_cancelar_item: TRzLabel;
    AdvOfficeImage1: TAdvOfficeImage;
    pn_cancelar_item_botoes: TFlatPanel;
    bt_cancelar_item_sim: TAdvGlowButton;
    bt_cancelar_item_nao: TAdvGlowButton;
    ed_cancelar_item: TRzNumericEdit;
    ImageList1: TImageList;
    texto: TcxStyle;
    Image1: TImage;
    Frx_ImpressaoVenda: TfrxReport;
    frxEmitente: TfrxDBDataset;
    frxCupom_itens: TfrxDBDataset;
    frxDB: TfrxDBDataset;
    UniQuery1: TUniQuery;
    frxOr�amento: TfrxReport;
    frxDBDorcamento: TfrxDBDataset;
    frxReport1: TfrxReport;
    AdvGlowButton1: TAdvGlowButton;
    frxDBDCLIENT1: TfrxDBDataset;
    Queryclie2: TUniQuery;
    frxDBDclient: TfrxDBDataset;
    Edit2: TEdit;
    Label7: TLabel;
    qrobs: TUniQuery;
    frxDBDobs: TfrxDBDataset;
    Panel8: TPanel;
    Panel10: TPanel;
    RzLabel3: TRzLabel;
    ed_qtde: TRzNumericEdit;
    Panel12: TPanel;
    Panel15: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel9: TPanel;
    RzLabel1: TRzLabel;
    ed_unitario: TRzNumericEdit;
    pnBaseFoto: TBevel;
    img_produto: TImage;
    img_logo: TAdvOfficeImage;
    Panel13: TPanel;
    lb_total: TRzLabel;
    lbTotal: TRzLabel;
    Panel14: TPanel;
    lb_item: TRzLabel;
    RzLabel7: TRzLabel;
    Or�amento: TAdvGlowButton;
    Panel11: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    cpBarra: TdxStatusBar;
    barraAtalho: TdxStatusBar;
    Panel22: TPanel;
    Panel23: TPanel;
    imgFundo: TImage;
    ed_barra: TRzEdit;
    Querypro: TUniQuery;

    function TEF_Cartao(bandeira: Tbandeira_tef): boolean;
    function TEF_Cheque(bandeira: Tbandeira_tef): boolean;


    procedure Cancela_cupom_aberto();
    procedure Cancela_cupom_fechado();
    procedure Cancela_Item(sItem: string);
    procedure Registra_Item();
    procedure Limpa_controles();
    procedure Imprime_display(texto: string; cor_da_fonte: tcolor; Imagem: Tipo_Imagem);
    procedure Imprime_display_anterior;
    function Abre_Venda(): boolean;
    function Truncar_Valor(valor: real): real;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ed_barraKeyPress(Sender: TObject; var Key: Char);
    procedure CancelarItem1Click(Sender: TObject);
    procedure ed_cancelar_itemEnter(Sender: TObject);
    procedure ed_cancelar_itemExit(Sender: TObject);
    procedure ed_cancelar_itemKeyPress(Sender: TObject; var Key: Char);
    procedure bt_cancelar_item_naoClick(Sender: TObject);
    procedure ed_barraEnter(Sender: TObject);
    procedure bt_cancelar_item_simClick(Sender: TObject);
    procedure MenuFiscal2Click(Sender: TObject);
    procedure Retornar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure CancelarCupom1Click(Sender: TObject);
    procedure ed_barraExit(Sender: TObject);
    procedure ED_DESC_ACREEnter(Sender: TObject);
    procedure ED_DESC_ACREExit(Sender: TObject);
    procedure FecharCupom1Click(Sender: TObject);
    procedure ed_total_pagarEnter(Sender: TObject);
    procedure ed_forma1Enter(Sender: TObject);
    procedure ed_forma2Enter(Sender: TObject);
    procedure ed_forma3Enter(Sender: TObject);
    procedure ed_totalizadorEnter(Sender: TObject);
    procedure ed_trocoEnter(Sender: TObject);
    procedure ed_total_pagarExit(Sender: TObject);
    procedure ed_forma1Exit(Sender: TObject);
    procedure ed_forma2Exit(Sender: TObject);
    procedure ed_forma3Exit(Sender: TObject);
    procedure ed_totalizadorExit(Sender: TObject);
    procedure ed_trocoExit(Sender: TObject);
    procedure cb_desc_acreChange(Sender: TObject);
    procedure DescontoouAcrscimo1Click(Sender: TObject);
    procedure ED_DESC_ACREKeyPress(Sender: TObject; var Key: Char);
    procedure cb_forma1KeyPress(Sender: TObject; var Key: Char);
    procedure cb_forma2KeyPress(Sender: TObject; var Key: Char);
    procedure cb_forma3KeyPress(Sender: TObject; var Key: Char);
    procedure cb_forma2Exit(Sender: TObject);
    procedure cb_forma3Exit(Sender: TObject);
    procedure ed_forma3KeyPress(Sender: TObject; var Key: Char);
    procedure bt_confirmar_fechamentoEnter(Sender: TObject);
    procedure bt_cancelar_fechamentoEnter(Sender: TObject);
    procedure bt_confirmar_fechamentoClick(Sender: TObject);
    procedure ed_trocoChange(Sender: TObject);
    procedure ed_qtdeEnter(Sender: TObject);
    procedure ed_unitarioEnter(Sender: TObject);
    procedure ed_total_itemEnter(Sender: TObject);
    procedure ed_senhaEnter(Sender: TObject);
    procedure ed_senhaExit(Sender: TObject);
    procedure ed_senhaKeyPress(Sender: TObject; var Key: Char);
    procedure timer_balancaTimer(Sender: TObject);
    procedure AcionaBalana1Click(Sender: TObject);
    procedure cb_forma1Enter(Sender: TObject);
    procedure cb_forma1Change(Sender: TObject);
    procedure cb_forma2Enter(Sender: TObject);
    procedure cb_forma2Change(Sender: TObject);
    procedure cb_forma3Change(Sender: TObject);
    procedure cb_forma3Enter(Sender: TObject);
    procedure ed_forma1KeyPress(Sender: TObject; var Key: Char);
    procedure ed_forma2KeyPress(Sender: TObject; var Key: Char);
    procedure ConsultadeClientes1Click(Sender: TObject);
    procedure ConsultadePreos1Click(Sender: TObject);
    procedure Opes1Click(Sender: TObject);
    procedure PesquisadeProdutos1Click(Sender: TObject);
    procedure Cupons1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure bt_cancelar_fechamentoClick(Sender: TObject);
    procedure AcionaGaveta1Click(Sender: TObject);
    procedure FecharCaixa1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Sangria1Click(Sender: TObject);
    procedure Suprimento1Click(Sender: TObject);
    procedure EFCancelamento1Click(Sender: TObject);
    procedure EFModoAdministrativo1Click(Sender: TObject);
    procedure rocarOperador1Click(Sender: TObject);
    procedure CaixaIndisponvel1Click(Sender: TObject);
    procedure menu_PrevendaClick(Sender: TObject);
    procedure MeiosdePagamento1Click(Sender: TObject);
    procedure AtualizarPDV1Click(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure Assinararquivo1Click(Sender: TObject);
    procedure Recebimento1Click(Sender: TObject);
    procedure Menu_osClick(Sender: TObject);
    procedure timer_bicoTimer(Sender: TObject);
    procedure timer_abastecimentoTimer(Sender: TObject);
    procedure grid_abastecimentoKeyPress(Sender: TObject; var Key: Char);
    procedure grid_abastecimentoEnter(Sender: TObject);
    procedure menu_mesaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    procedure timer_cargaTimer(Sender: TObject);
    procedure ed_unitarioKeyPress(Sender: TObject; var Key: Char);
    procedure trocaImpressaoClick(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure Comandas1Click(Sender: TObject);
    procedure TimerTrocoTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sp_total_pagarContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure ed_barraKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_qtdeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_qtdeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pn_fechamentoClick(Sender: TObject);
    procedure tmContigenciaTimer(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure AdvMetroButton1Click(Sender: TObject);
    procedure AdvMetroButton2Click(Sender: TObject);
    procedure bt_confirmar_fechamentoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Or�amentoClick(Sender: TObject);
    procedure Frx_ImpressaoVendaPreview(Sender: TObject);
//    procedure Cod_VendaKeyPress(Sender: TObject; var Key: Char);
//    procedure Cod_VendaEnter(Sender: TObject);
//    procedure Cod_VendaExit(Sender: TObject);
//    procedure Cod_VendaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure Cod_VendaChange(Sender: TObject);
  private
    { Private declarations }
    a, b: word;
    Carregando:Boolean;
    iImpressora: integer;
    CheckConnect : TThreadCheckConnection;
    tBanceira01,tBanceira02,tBanceira03:TBaneira;
    function ImgTipoImpressora(i: Integer): TImpressora;
    procedure MostraFotoProduto(b: boolean);
    procedure MostraLogoMarca(b: boolean);
    procedure CentralizarPanel(p: TPanel);
    procedure PrepararNFCE;
    procedure GerarNFCe(NumNFe: String);
    procedure CorEditTotaL;
    procedure OnInternetChange(LANStatus:TLANStatus;InternetStatus:TInternetStatus;xMsg:String='');
  public
    { Public declarations }
    procedure EnviaComando(comando: string; timeout: integer);
    function Localizar_Produto(referencia: string): boolean;
    function TEF_Pagamento(Tef_tipo: TTef_Tipo): boolean;
    procedure EnviaContingencia;
  end;

const
  SEPARADOR = '-----------------------------------------' + #10;

var
  frmtOffLine:TpcnTipoEmissao;
  frmVenda: TfrmVenda;
 // resolu��o da tela
  OldWidth: Integer;
  OldHeight: Integer;

  // totalizadoras
  rTotal_Venda: real;
  rTotal_Desconto: real;
  rTotal_Acrescimo: real;
  iTotal_Itens: integer;
  iItem: Integer;
  // STATUS das funcoes
  bVenda: boolean; // venda aberta
  bTotalizado: boolean; // cupom totalizado
  bPago1, bPago2, bPago3: boolean; // lancado cada forma de pagamento
  bFinalizado: boolean; // Cupom Finalizado (Totalizado);
  // Outras
  baltera_tipo_desconto: boolean; // permitir/bloquear a tecla F3 no desconto
  blimpa_edit_display: boolean;

  // Armazenar dados anteriores do display
  sTexto_anterior : string;
  sMensagem_Cupom :TMemo;
  clCor_anterior: Tcolor;
  TiImagem_anterior: Tipo_Imagem;

  // flag de finalizacao do tef
  bTef_finaliza: boolean;
  // totalizadores das formas que exigem tratamento especial
  rValor_Total_Cartao, rvalor_total_cheque, rvalor_total_crediario: real;

  // variaveis do posto
  sPosto_Resposta, sPosto_Comando, str: string;
  iQtde_bico: integer;
  bPosto_ok: boolean;

  dtContingencia:TDate;
  hrContingencia:TTime;
  // focar no campo anterior
  bVolta_foco: boolean;

  // Dados do Vendedor
  iVendedorCodigo: Integer;
  sVendedorNome: string;

    // variaveis nfce
  vAux, vNumLote, vSincrono, vcontingencia, vgerado_nfce: String;
  vNumNFCe:Integer;
  Sincrono: boolean;
  bc: TBitmap;
  url, cDest, tpAmb: string;
  Hash_SHA1: string;
  X: Integer;
  S: AnsiString;
  tipo_pgto: Integer;
  nfce_autorizada: boolean;
  bContinuaNFCE: boolean;
  cStatus: Integer;
  ChaveNFCE: string;
  NumeroNFCe: Integer;

implementation

uses modulo, Math, funcoes, cliente_consulta, preco_consulta, xloc_modelo,
  produto_consulta, protetor_tela, consumidor, consumidor1, venda_crediario, unECF,
  Leitura_Memoria_Fiscal, Download_MFD, Arquivo_Fiscal,
  Identifica, Tef_bandeira, unTEF, caixa_fechamento, sangria, suprimento,
  TEF_Cancelamento, senha, menu_cupom, Lista_DAV, pre_venda, msg_Operador,
  Meios_pagamento, Orcamento_Abrir, menu_fiscal, IniFiles, contasreceber,
  os, caixa_abertura, mesas, senha_supervisor, ComObj,
  Constantes, Vendedor, UFuncoes, Comanda, frmNFCEs, MensagemAdicional,
  xloc_servico, Config;

{$R *.dfm}


// -------------------------------------------------------------------------- //


function TrocaResolucao(X, Y, a, b: word): Boolean;
var lpDevMode: TDeviceMode;
begin
  if EnumDisplaySettings(nil, 0, lpDevMode) then begin
    lpDevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    lpDevMode.dmPelsWidth := x; // altera a resolu��o para a que voce voce desejou
    lpDevMode.dmPelsHeight := y; // altera a resolu��o para a que voce voce desejou
    Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end;


function VoltaResolucao(a, b: word): Boolean;
var lpDevMode: TDeviceMode;
begin
  if EnumDisplaySettings(nil, 0, lpDevMode) then begin
    lpDevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
    lpDevMode.dmPelsWidth := a; // ao fechar o programa recupera a resolu��o que vinha sendo usada
    lpDevMode.dmPelsHeight := b; // ao fechar o programa recupera a resolu��o que vinha sendo usada
    Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
  Result := True;
end;


procedure Tfrmvenda.OnInternetChange(LANStatus:TLANStatus;InternetStatus:TInternetStatus;xMsg:String='');
var
  ok:Boolean;
BEGIN
  if InternetStatus = tiOnline then begin
    tmContigencia.Enabled := false;
    TdxStatusBarStateIndicatorPanelStyle(cpBarra.Panels[7].PanelStyle).Indicators[0].IndicatorType := sitGreen;
    cpBarra.Panels[9].Text := 'ON-LINE(com Internet)' ;
    frmModulo.ACBRNFCe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(Ok, IntToStr(rgFormaEmissao + 1));
    frmModulo.ACBRDANFENFCe.ViaConsumidor := True;
    if not bVenda then
      EnviaContingencia;
  end else begin
    if frmModulo.ACBRNFCe.Configuracoes.Geral.FormaEmissao <> frmtOffLine then begin
      TdxStatusBarStateIndicatorPanelStyle(cpBarra.Panels[7].PanelStyle).Indicators[0].IndicatorType := sitRed;
      cpBarra.Panels[9].Text := 'OFF-LINE(sem Internet)';
      tmContigencia.Enabled := True;
      frmModulo.ACBRNFCe.Configuracoes.Geral.FormaEmissao := frmtOffLine;
    end;
  end;
END;

procedure Tfrmvenda.EnviaComando(comando: string; timeout: integer);
begin
  sPosto_comando := comando;
//  comport1.WriteStr(comando);
  timer_resposta.Interval := Timeout;
  timer_resposta.Enabled := true;
end;


procedure TfrmVenda.EnviaContingencia;
begin
  if Carregando then
    Exit;
  if TdxStatusBarStateIndicatorPanelStyle(cpBarra.Panels[7].PanelStyle).Indicators[0].IndicatorType = sitGreen then begin
    qrContingencia.Close;
    qrContingencia.Open;
    if not qrContingencia.IsEmpty then begin
      try
        ed_barra.Enabled := False;
        while not qrContingencia.Eof do begin
          Imprime_display('   AGUARDE...  ENVIENDO CONTINGENCIAS',clGreen, tiLivre);
          with frmModulo do begin
            LerConfiguracao;
            if EdFormatoOff = 0 then
              frmtOffLine := teContingencia
            else
              frmtOffLine := teOffLine;
            ACBRNFCe.NotasFiscais.Clear;
            ACBRNFCe.NotasFiscais.LoadFromFile(qrContingenciaXML.AsString);
            ACBRNFCe.Enviar(ACBRNFCe.NotasFiscais.Items[0].NFe.Ide.nNF, False, True);
            if ACBRNFCe.NotasFiscais.Items[0].Confirmada then begin
              if ACBRNFCe.WebServices.Enviar.cStat = 100 then begin
                qrContingencia.Edit;
                qrContingenciaENVIADOCONTINGENCIA.AsString := 'S';
                qrContingencia.Post;
                qrContingencia.ApplyUpdates;
              end;
            end else begin
              Imprime_display('AGUARDE... ERRO AO ENVIAR NFC-E: ' + qrContingenciaNUMERO.AsString, clRed,tiAlerta);
            end;
          end;
          qrContingencia.Next;
        end;
      finally
        ed_barra.Enabled := True;
        ed_barra.SetFocus;
        Imprime_display('C A I X A    L I V R E', clWhite, tiLivre);
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------- //
// Funcao de busca de produtos

function TfrmVenda.Localizar_Produto(referencia: string): boolean;
var bBusca_codigo: boolean; // variavel de para ativar ou nao a busca pelo campo codigo
  iPosicao: integer;
begin
  try
    // limpar a variaveis de retorno
    sProd_nome := '';
    sProd_barra := '';
    sProd_unidade := '';
    sProd_CST := '';
    iProd_codigo := -1;
    rProd_aliquota := -1;
    rProd_Estoque := 0;
    rProd_preco := 0;
    rProd_qtde := 1;
    rProd_total := 0;
    bProd_promocao := false;
    sProd_Tamanho := '';
    sProd_Cor := '';
    Edit2.text:= '';
    // verificar se foi digitado a quantidade no campo de busca do produto utilizando os
    // caracteres "X" ou "*"

    if (pos('X', ansiuppercase(referencia)) > 0) or
      (pos('*', ansiuppercase(referencia)) > 0) then
    begin
      iPosicao := pos('X', ansiuppercase(referencia));
      if iPosicao = 0 then
        iPosicao := pos('*', ansiuppercase(referencia));
      try
        // alimenta a varivel de qtde
        rProd_Qtde := Strtofloat(copy(referencia, 1, iPosicao - 1));
        // copia apenas a parte que contem a informacao da busca do produto
        referencia := copy(referencia, iPosicao + 1, 99);
      except
        // retornou erro, zera a qtde e deixa a referencia como estah.
        rProd_qtde := 1;
      end;
    end;

    // verificar ha possibilidade do texto ser um numero inteiro ou
    // nao ser um produto pesado em balanca --> iniciado por 2
    if length(referencia) < 8 then
    begin
      // verificar se o campo referencia eh um numero inteiro valido
      try
        strtoint(referencia);
        bBusca_codigo := true;
      except
        on EConvertError do
          Bbusca_codigo := false;
      end;
      if Bbusca_codigo then
      begin
        // comando SQL para filtrar o produto pelo codigo de barras
        query.close;
        query.sql.clear;
        query.sql.add('select * from c000025');
        query.sql.add('where codbarra = ''' + referencia + '''');
        query.Open;
        if query.recordcount > 0 then
        begin
          // econtrou o registro pelo codigo de barras
          result := true;
        end
        else
        begin
          // nao achou pelo codigo de barras, procurar pelo codigo
          try
            query.close;
            query.sql.clear;
            query.sql.add('select * from c000025');
            query.sql.add('where codigo = ' + referencia);
            query.open;
            if query.RecordCount > 0 then
            begin
              // encontrou o registro pelo codigo
              result := true;
            end
            else
            begin
              // nao encontrou nenhum produto
              result := false;
            end;
          except
            result := false;
          end;
        end;
      end
      else
      begin
        // BUSCAR PELO CODIGO DE BARRAS
        query.close;
        query.sql.clear;
        query.sql.add('select * from c000025');
        query.sql.add('where codbarra = ''' + referencia + '''');
        query.Open;

        if query.recordcount > 0 then
        begin
          // econtrou o registro pelo codigo de barras
          result := true;
        end
        else
        begin
          // nao achou pelo codigo de barras, procurar pelo nome
          query.close;
          query.sql.clear;
          query.sql.add('select * from c000025');
          query.sql.add('where upper(REFERENCIA) LIKE ''' + ANSIUPPERCASE(referencia) + '%''');
          query.sql.add('order by REFERENCIA, COR, TAMANHO');
          query.open;

          if query.RecordCount > 0 then
          begin
            Result := True;
          end
          else
          begin
            // nao achou pelo codigo de barras, procurar pelo nome
            query.close;
            query.sql.clear;
            query.sql.add('select * from c000025');
            query.sql.add('where upper(PRODUTO) like ''' + ANSIUPPERCASE(referencia) + '%''');
            query.sql.add('order by PRODUTO');
            query.open;

            if query.RecordCount > 0 then
            begin
              if query.recordcount > 1 then
              begin
                iprod_codigo := 0;
                // encontrou varios registros
                if iPesquisa_produto = 1 then
                begin
                  frmProduto_consulta := TfrmProduto_consulta.create(self);
                  frmproduto_consulta.ed_barra.text := ed_barra.text;
                  frmProduto_consulta.showmodal;
                  if iProd_codigo > 0 then
                  begin
                    query.Close;
                    query.sql.Clear;
                    query.sql.add('select * from c000025 where codigo = ' + inttostr(iprod_codigo));
                    query.open;
                    result := true;
                  end
                  else
                    result := false;
                end
                else
                  result := True;
              end
              else
                // encontrou o registro pelo nome
                result := true;
            end
            else
            begin
              // nao encontrou nenhum produto
              result := false;
            end;
          end;
        end;
      end;
    end
    else
    begin
      // verificar se o produto � pesado em balanca
      if (copy(referencia, 1, 1) = '2') and (length(referencia) <= 13) then begin
        try //Exemplo de codigo na etiqueta: 2000010002550 -> Codigo = 00001 Valor = 000255 = 2,55
          query.close;
          query.sql.clear;
          query.sql.add('select * from c000025');
           // extrair o codigo do produto na etiqueta de codigo de barras conf. o tamanho
           // do codigo da balanca configurado previamente
          query.sql.add('where codigo = ''' + Zerar(copy(referencia, 2, iTamanho_codigo_balanca),6) + '''');
          query.open;
          if query.RecordCount > 0 then
          begin
             // encontrou um registro e estah lancando o valor contido na etiqueta de cod.barras
            rProd_total := strtofloat(copy(referencia, 8, 5)) / 100;
            result := true;
          end
          else
             // nao encontrou nenhum registro
            result := false;
        except
           // retornou erro ao tentar buscar pelo codigo do produto pesasdo
          result := false;
        end;
      end else if (copy(referencia, 1, 1) = 'P') and (length(referencia) = 14) then begin
        query.close;
        query.sql.clear;
        query.sql.add('select * from c000025');
        query.sql.add('where codbarra = ''' + Copy(referencia,2,13) + '''');
        query.Open;
        if query.recordcount > 0 then begin
          result := true;
          bMudouProvisorio := True;
          bMuda_unitario := True;
        end else
          result := False;
      end else begin
        // nao achou pelo codigo de barras, procurar pelo nome
        query.close;
        query.sql.clear;
        query.sql.add('select * from c000025');
        query.sql.add('where upper(REFERENCIA) LIKE ''' + ANSIUPPERCASE(referencia) + '%''');
        query.sql.add('order by REFERENCIA, COR, TAMANHO');
        query.open;

        if query.RecordCount > 0 then
        begin
          // nao encontrou nenhum produto
          result := false;
        end
        else
        begin
          // busca normal pelo codigo de barras e pelo nome do produto
          // comando SQL para filtrar o produto pelo codigo de barras
          query.close;
          query.sql.clear;
          query.sql.add('select * from c000025');
          query.sql.add('where codbarra = ''' + referencia + '''');
          query.Open;

          if query.recordcount > 0 then
          begin
            // econtrou o registro pelo codigo de barras
            result := true;
          end
          else
          begin
            // nao achou pelo codigo de barras, procurar pelo nome
            query.close;
            query.sql.clear;
            query.sql.add('select * from c000025');
            query.sql.add('where upper(PRODUTO) like ''' + referencia + '%''');
            query.sql.add('order by PRODUTO');
            query.open;
            if query.RecordCount > 0 then
            begin
              // encontrou o registro pelo nome
              result := true;
            end
            else
            begin
              // nao encontrou nenhum produto
              result := false;
            end;
          end;
        end;
      end;
    end;
  finally
    if result then
    begin
      // encontrou o produto, alimentar as variaveis de retorno
      sProd_nome := query.fieldbyname('PRODUTO').asstring;
      sProd_barra := query.fieldbyname('codbarra').asstring;
      sprod_unidade := query.fieldbyname('unidade').asstring;
      iProd_codigo := query.fieldbyname('codigo').asinteger;
      sProd_CST := query.fieldbyname('cst').asstring;
      rProd_aliquota := query.fieldbyname('aliquota').asfloat;
      rProd_Estoque := query.fieldbyname('estoque').asfloat;
      rProd_preco := query.fieldbyname('precovenda').asfloat;
      //rProd_desconto_maximo := query.fieldbyname('desconto_maximo').asfloat;
     // rProd_acrescimo_maximo := query.fieldbyname('acrecimo_maximo').asfloat;

      //bProd_promocao := false;
      //rprod_desconto := 0;
      //rprod_acrescimo := 0;
      //sProd_Tamanho := Query.FieldByName('TAMANHO').AsString;
      //sProd_Cor := Query.FieldByName('COR').AsString;

      // verificar se o produto estah em promocao
      if query.fieldbyname('preco_promocao').asfloat > 0 then
      begin
        if (dData_Sistema >= query.fieldbyname('inicio_promocao').AsDateTime) and
          (dData_Sistema <= query.fieldbyname('final_promocao').ASDATETIME) then
        begin
          rProd_preco := query.fieldbyname('preco_promocao').asfloat;
          bProd_promocao := true;
        end;
      end;
      if rProd_Total > 0 then
      begin
        // o valor total foi achado caso o produto foi pesado
        // encontrar a qtde do produto
        rProd_qtde := rProd_total / rProd_preco;
      end;

      // verificar seh eh para truncar o valor total
      if bTruncar_valor then
      begin
        rProd_total := Truncar_Valor(rProd_Qtde * rProd_preco);
      end
      else
      begin
        if rProd_total = 0 then
          rProd_total := rProd_qtde * rProd_preco;
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------- //

function tfrmVenda.TEF_Pagamento(Tef_tipo: TTef_tipo): boolean;
begin
  if (Tef_tipo = Tef_Venda_Cartao) then
  begin
    // apontar por default o gp redecard/visanet/amex
    Tef_Bandeira_escolhida := Tef_Redecard;

    if bTEF_TecBan then
    begin
      frmTef_bandeira := tfrmTef_Bandeira.create(self);
      frmTef_bandeira.showmodal;
    end;

    result := TEF_Cartao(Tef_Bandeira_escolhida);
  end
  else
  begin
    if (Tef_tipo = Tef_Venda_Cheque) then
    begin
     // apontar por default o gp redecard/visanet/amex
      Tef_Bandeira_escolhida := Tef_Redecard;

      if bTEF_TecBan then
      begin
        frmTef_bandeira := tfrmTef_Bandeira.create(self);
        frmTef_Bandeira.rb_visanet.Enabled := false;
        frmTef_Bandeira.rb_amex.Enabled := false;
        frmTef_Bandeira.rb_hipercard.Enabled := false;
        frmTef_Bandeira.rb_tribanco.Enabled := false;
        frmTef_bandeira.showmodal;
      end;

      result := TEF_Cheque(Tef_Bandeira_escolhida);
    end;
  end;
end;

// -------------------------------------------------------------------------- //
// venda no cartao via tef

function tfrmVenda.TEF_Cartao(bandeira: Tbandeira_tef): boolean;
var txt: textfile;
begin
  // armazenar no arquivo temporario a bandeira
  if bandeira = Tef_TecBan then
  begin
    assignfile(txt, sTEFTemp_Path + 'gp.tmp');
    rewrite(txt);
    writeln(txt, 'TECBAN');
    closefile(txt);
    iTEFTecban := 1;
  end
  else
  begin
    if bandeira = Tef_Hipercard then
    begin
      assignfile(txt, sTEFTemp_Path + 'gp.tmp');
      rewrite(txt);
      writeln(txt, 'HIPERCARD');
      closefile(txt);
      iTEFTecban := 2;
    end
    else
    begin
      assignfile(txt, sTEFTemp_Path + 'gp.tmp');
      rewrite(txt);
      writeln(txt, 'REDECARD');
      closefile(txt);
      iTEFTecban := 0;
    end;
  end;
  bContinua := true;

  TEFLimpaVariaveis;

  // passar os parametros para as variaveis do tef
  sTefDoctoVinculado := sNumero_Cupom;
  sTefValorTotal := somenteNumero(formatfloat('##########0.00', rvalor_total_cartao));
  sTEFMoeda := '0';

  // Primeiro passo do TEF
  TEFVendaCartao;

  // verificar retorno do TEF
  if sTEFRetorno = '0' then
    result := true
  else
    result := false;
end;

// -------------------------------------------------------------------------- //
// consulta de cheque via tef

function tfrmVenda.TEF_Cheque(bandeira: Tbandeira_tef): boolean;
var txt: textfile;
begin
  // armazenar no arquivo temporario a bandeira

  // armazenar no arquivo temporario a bandeira
  if bandeira = Tef_TecBan then
  begin
    assignfile(txt, sTEFTemp_Path + 'gp.tmp');
    rewrite(txt);
    writeln(txt, 'TECBAN');
    closefile(txt);
    iTEFTecban := 1;
  end
  else
  begin
    if bandeira = Tef_Hipercard then
    begin
      assignfile(txt, sTEFTemp_Path + 'gp.tmp');
      rewrite(txt);
      writeln(txt, 'HIPERCARD');
      closefile(txt);
      iTEFTecban := 2;
    end
    else
    begin
      assignfile(txt, sTEFTemp_Path + 'gp.tmp');
      rewrite(txt);
      writeln(txt, 'REDECARD');
      closefile(txt);
      iTEFTecban := 0;
    end;
  end;





  if (bandeira = Tef_Redecard) or
    (bandeira = Tef_TecBan) then
  begin
    bContinua := true;

    TEFLimpaVariaveis;

    // passar os parametros para as variaveis do tef
    sTefDoctoVinculado := sNumero_Cupom;
    sTefValorTotal := somenteNumero(formatfloat('##########0.00', rvalor_total_cheque));
    sTEFMoeda := '0';

    // Primeiro passo do TEF do cheque
    TEFVendaCheque;

    // verificar retorno do TEF
    if sTEFRetorno = '0' then
      result := true
    else
      result := false;
  end
  else
    result := false;
end;

// -------------------------------------------------------------------------- //
// Cancela cupom aberto

procedure tFrmvenda.cancela_cupom_aberto();
var
  i: integer;
  scod_cupom: string;
begin
  Imprime_display('Aguarde! Cancelando cupom ' + sNumero_Cupom + '!', clYellow, tiAlerta);

  if (bLanca_pre_venda) or (bLanca_OS) or (bLanca_Abastecimento) then
  begin
     // venda foi feito por uma pre-venda
     //finalizar o cupom e depois cancelar
    sMsg := ok;

    if frmPrincipal.TipoImpressora = Fiscal then
      sMsg := cECF_Fecha_Cupom_Resumido(iECF_Modelo, 'DINHEIRO', sPAF_MD5 + #10 + sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero, rTotal_Venda)
    else
      sMsg := Imp_Fecha_Cupom_Resumido(sPortaNaoFiscal, 'DINHEIRO', #10 + sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero, rTotal_Venda);

    if sMsg = OK then
    begin

      with frmmodulo do
      begin
        // lancamento do cupom no banco de dados
        sCod_Cupom := codifica_cupom;
        spCupom.close;
        spCupom.ParamByName('codigo').asstring := sCod_Cupom;
        if vNumNFCe > 0 then
          spCupom.ParamByName('numero').asstring := IntToStr(vNumNFCe)
        else
          spCupom.ParamByName('numero').asstring := sNumero_Cupom;
        spCupom.ParamByName('ccf').asstring := sNumero_contador_cupom;
        spCupom.ParamByName('ECF').AsString := sECF_Serial;
        spCupom.ParamByName('data').asdate := dData_Sistema;
        spCupom.ParamByName('hora').AsTime := hHora_Cupom;
        spCupom.ParamByName('qtde_item').asinteger := iTotal_Itens;
        spCupom.ParamByName('valor_produto').asfloat := rTotal_Venda;
        spCupom.ParambyName('Valor_Desconto').asfloat := rTotal_Desconto;
        spCupom.ParambyName('Valor_Acrescimo').asfloat := rTotal_Acrescimo;
        spCupom.ParamByName('valor_total').asfloat := rTotal_Venda;
        spCupom.ParamByName('valor_pago').asfloat := rTotal_Venda;
        spCupom.ParamByName('valor_troco').asfloat := 0;
        if sCli_codigo <> '' then
          spCupom.ParamByName('cod_cliente').asstring := sCli_codigo
        else
          spCupom.ParamByName('cod_cliente').Clear;

        spCupom.ParamByName('cancelado').asinteger := 0;
        spcupom.parambyname('cpf_consumidor').asstring := sConsumidor_CPF;
        spcupom.ParamByName('nome_consumidor').asstring := copy(sConsumidor_Nome, 1, 40);
        spcupom.parambyname('cod_caixa').asinteger := iNumCaixa;
        spCupom.ParamByName('ecf_caixa').asstring := Copy(sECF_Caixa, 1, 3);
        if iVendedorCodigo <= 0 then
          iVendedorCodigo :=  icodigo_Usuario;
        spcupom.parambyname('cod_vendedor').asinteger := iVendedorCodigo;
        spcupom.parambyname('contingencia').asstring := vcontingencia;
        spcupom.parambyname('gerado_nfce').asstring := vgerado_nfce;
        spCupom.Prepare;
        spCupom.Execute;

        if iCodigo_abastecimento > 0 then
        begin
          frmvenda.timer_abastecimento.Enabled := false;
          query.close;
          query.sql.clear;
          query.sql.add('update posto_abastecimento set situacao = 1');
          query.SQL.add('where codigo = ' + inttostr(iCodigo_abastecimento));
          query.ExecSQL;

          // atualizacao do encerrante
          query.close;
          query.sql.clear;
          query.sql.add('select posto_abastecimento.*, posto_bico.codigo as codigo_bico');
          query.sql.add('from posto_abastecimento, posto_bico');
          query.sql.add('where posto_abastecimento.bico = posto_bico.bico');
          query.sql.add('and posto_abastecimento.codigo = ' + inttostr(iCodigo_abastecimento));
          query.Open;

          frmModulo.st_bico_movimento.Close;
          frmmodulo.st_bico_movimento.ParamByName('cod_bico').asinteger := query.fieldbyname('codigo_bico').asinteger;
          frmmodulo.st_bico_movimento.ParamByName('EF').asFLOAT := query.fieldbyname('ef').asfloat;
          frmmodulo.st_bico_movimento.parambyname('volume').asfloat := query.fieldbyname('qtde').asfloat;
          frmmodulo.st_bico_movimento.parambyname('data').asdatetime := query.fieldbyname('data').asfloat;
          FRMMODULO.st_bico_movimento.Prepare;
          frmModulo.st_bico_movimento.Execute;

          frmvenda.timer_abastecimento.Enabled := true;


        // lancamento dos items do cupom no banco de dados
          for i := 0 to grid.RowCount - 1 do
          begin
          // situacoes
          // 1 - Venda do Item
          // 3 - Cancelamento do Item
          // 4 - Desconto no Item
          // 5 - Acrescimo no Item

            if grid.Cell[1, i].asinteger = 1 then
            begin
              spCupom_Item.close;
              spCupom_Item.ParamByName('codigo').AsString := codifica_item(grid.Cell[2, i].asinteger);
              spCupom_Item.parambyname('cod_cupom').asstring := sCod_Cupom;
              spCupom_Item.parambyname('item').asinteger := grid.cell[2, i].asinteger;
              spCupom_Item.ParamByName('cod_produto').asinteger := grid.cell[3, i].asinteger;
              spCupom_Item.parambyname('unidade').asstring := grid.cell[12, i].asstring;
              spCupom_Item.parambyname('qtde').asfloat := grid.cell[5, i].asfloat;
              spCupom_Item.parambyname('valor_unitario').asfloat := grid.cell[6, i].asfloat;
              spCupom_Item.parambyname('valor_subtotal').asfloat := grid.cell[5, i].asfloat *
                grid.cell[6, i].asfloat;
              spCupom_Item.parambyname('valor_desconto').asfloat := grid.cell[7, i].asfloat;
              spCupom_Item.parambyname('valor_acrescimo').asfloat := grid.cell[8, i].asfloat;
              spCupom_Item.parambyname('valor_total').asfloat := grid.cell[9, i].asfloat;
              spCupom_Item.parambyname('cst').asstring := grid.cell[11, i].asstring;
              spCupom_Item.parambyname('aliquota').asfloat := grid.cell[10, i].asfloat;
              spCupom_Item.parambyname('cancelado').asinteger := grid.cell[13, i].asinteger;
              spCupom_Item.parambyname('tamanho').AsString := grid.cell[14, i].AsString;
              spCupom_Item.parambyname('cor').AsString := grid.cell[15, i].AsString;

              if (grid.cell[11, i].asstring = '060') or
                (grid.cell[11, i].asstring = '010') or
                (grid.cell[11, i].asstring = '070') then
                spCupom_item.ParamByName('cod_totalizador').asstring := 'F1'
              else
                if (grid.cell[11, i].asstring = '040') or
                  (grid.cell[11, i].asstring = '030') then
                  spCupom_item.ParamByName('cod_totalizador').asstring := 'I1'
                else
                  if (grid.cell[11, i].asstring = '041') or
                    (grid.cell[11, i].asstring = '050') or
                    (grid.cell[11, i].asstring = '051') or
                    (grid.cell[11, i].asstring = '090') then
                    spCupom_item.ParamByName('cod_totalizador').asstring := 'N1'
                  else
                    if (grid.cell[11, i].asstring = 'ISS') then
                      spCupom_item.ParamByName('cod_totalizador').asstring := '01S' +
                        Retorna_aliquota(grid.cell[11, i].asstring, grid.cell[10, i].asfloat)
                    else
                      spCupom_item.ParamByName('cod_totalizador').asstring :=
                        retorna_codigo_aliquota(grid.cell[10, i].asfloat);


              spCupom_Item.Prepare;
              spCupom_Item.Execute;
            end;
          end;
        // lancar a forma de pagamento - DINHEIRO
          spCupom_Forma.close;
          spCupom_Forma.ParamByName('codigo').asstring := codifica_forma(1);
          spCupom_Forma.ParamByName('cod_cupom').asstring := sCod_Cupom;
          spCupom_Forma.ParamByName('forma').asstring := 'DINHEIRO';
          spCupom_Forma.ParamByName('valor').asfloat := rTotal_Venda;
          spCupom_Forma.ParamByName('prestacao').asinteger := 1;

          if frmPrincipal.TipoImpressora = Fiscal then
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM FISCAL'
          else
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM NAO FISCAL';

          spCupom_Forma.Prepare;
          spCupom_Forma.Execute;
        end;

       // cancelar se for prevenda e os, abastecimento nao
        if (bLanca_pre_venda) or (bLanca_OS) then
        begin

       // fazer o cancelamento do cupom
          Cancela_cupom_fechado;

          if bLanca_pre_venda then
          begin
              // atualizar situacao da pre-venda para 3 = cancelada
            frmModulo.query_servidor.close;
            frmModulo.query_servidor.sql.clear;
            frmModulo.query_servidor.sql.add('update c000074 set situacao = 3  where codigo = ''' +
              Zerar(inttostr(iPre_venda_codigo), 6) + '''');
            frmmodulo.query_servidor.ExecSQL;

            bLanca_pre_venda := false;
          end
          else
          begin
              // atualizar situacao da OS para CANCELADA
            frmModulo.query_servidor.close;
            frmModulo.query_servidor.sql.clear;
            frmModulo.query_servidor.sql.add('update c000051 set situacao = ''CANCELADA''  where codigo = ''' +
              Zerar(inttostr(iOS_codigo), 6) + '''');
            frmmodulo.query_servidor.ExecSQL;

            bLanca_OS := false;
          end;
        end
        else
        begin
         // atualizar o totalizar qdo for abastecimento, os demais serao feitos apos o cancelamento
          if frmPrincipal.TipoImpressora = Fiscal then
          begin

          end;
          repeat
            SMSG := cECF_Grande_Total(iECF_Modelo);
            if Smsg = 'ERRO' then
            begin
              if application.messagebox
                (pwidechar('Erro ao verificar totalizador do ECF!' + #13 +
                'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'), 'Erro',
                mb_yesno + MB_ICONERROR) = idno then
                break;


            end
            else
              atualiza_totalizador(SMSG);
          until SmSG <> 'ERRO';

        end;
      end;

       // limpar o form de venda
      if bBusca_foto_produto then
      begin
        img_produto.Picture := nil;
      end;
      bVenda := false;
      Limpa_controles;
    end
    else
    begin
      Application.MessageBox('Erro ao tentar fechar o cupom!', 'Erro', mb_ok + mb_iconerror);
      exit;
    end;
  end
  else
  begin

    if frmPrincipal.TipoImpressora = Fiscal then
      sMsg := cECF_Cancela_Cupom(iECF_Modelo)
    else
      sMsg := Imp_Cancela_Cupom(sPortaNaoFiscal);

    if sMsg = OK then
    begin
      // Excluir os arquivos temporarios

      frmModulo.spCupom_Temp_delete.prepare;
      frmModulo.spCupom_Temp_delete.execute;

      // lancar o cupom no banco de dados como cancelado
      with frmmodulo do
      begin
        sCod_Cupom := codifica_cupom;
        spCupom.close;
        spCupom.ParamByName('codigo').asstring := sCod_Cupom;
        if vNumNFCe > 0 then
          spCupom.ParamByName('numero').asstring := IntToStr(vNumNFCe)
        else
          spCupom.ParamByName('numero').asstring := sNumero_Cupom;
        spCupom.ParamByName('ccf').asstring := sNumero_contador_cupom;
        spCupom.ParamByName('ECF').AsString := sECF_Serial;
        spCupom.ParamByName('data').asdate := dData_Sistema;
        spCupom.ParamByName('hora').AsTime := hHora_Cupom;
        spCupom.ParamByName('qtde_item').asinteger := iTotal_Itens;
        spCupom.ParamByName('valor_produto').asfloat := 0;
        spCupom.ParambyName('Valor_Desconto').asfloat := 0;
        spCupom.ParambyName('Valor_Acrescimo').asfloat := 0;
        spCupom.ParamByName('valor_total').asfloat := 0;
        spCupom.ParamByName('valor_pago').asfloat := 0;
        spCupom.ParamByName('valor_troco').asfloat := 0;
        spCupom.ParamByName('cod_cliente').Clear;
        spCupom.ParamByName('cancelado').asinteger := 1;
        spcupom.parambyname('CPF_consumidor').clear;
        spcupom.ParamByName('nome_consumidor').clear;
        spcupom.parambyname('cod_caixa').asinteger := iNumCaixa;
        spCupom.ParamByName('ecf_caixa').asstring := Copy(sECF_Caixa, 1, 3);
        if iVendedorCodigo <= 0 then
          iVendedorCodigo :=  icodigo_Usuario;
        spcupom.parambyname('cod_vendedor').asinteger := iVendedorCodigo;
        spcupom.parambyname('contingencia').asstring := vcontingencia;
        spcupom.parambyname('gerado_nfce').asstring := vgerado_nfce;
        spCupom.Prepare;
        spCupom.Execute;

        // lancar os itens no banco de dados como cancelado
        for i := 0 to grid.RowCount - 1 do
        begin
          if grid.Cell[1, i].asinteger = 1 then
          begin
            spCupom_Item.close;
            spCupom_Item.ParamByName('codigo').AsString := codifica_item(grid.Cell[2, i].asinteger);
            spCupom_Item.parambyname('cod_cupom').asstring := sCod_Cupom;
            spCupom_Item.parambyname('item').asinteger := grid.cell[2, i].asinteger;
            spCupom_Item.ParamByName('cod_produto').asinteger := grid.cell[3, i].asinteger;
            spCupom_Item.parambyname('unidade').asstring := grid.cell[12, i].asstring;
            spCupom_Item.parambyname('qtde').asfloat := grid.cell[5, i].asfloat;
            spCupom_Item.parambyname('valor_unitario').asfloat := grid.cell[6, i].asfloat;
            spCupom_Item.parambyname('valor_subtotal').asfloat := grid.cell[5, i].asfloat *
              grid.cell[6, i].asfloat;
            spCupom_Item.parambyname('valor_desconto').asfloat := grid.cell[7, i].asfloat;
            spCupom_Item.parambyname('valor_acrescimo').asfloat := grid.cell[8, i].asfloat;
            spCupom_Item.parambyname('valor_total').asfloat := grid.cell[9, i].asfloat;
            spCupom_Item.parambyname('cst').asstring := grid.cell[11, i].asstring;
            spCupom_Item.parambyname('aliquota').asfloat := grid.cell[10, i].asfloat;
            spCupom_Item.parambyname('tamanho').AsString := grid.cell[14, i].AsString;
            spCupom_Item.parambyname('cor').AsString := grid.cell[15, i].AsString;

            if (grid.cell[11, i].asstring = '060') or
              (grid.cell[11, i].asstring = '010') or
              (grid.cell[11, i].asstring = '070') then
              spCupom_item.ParamByName('cod_totalizador').asstring := 'F1'
            else
              if (grid.cell[11, i].asstring = '040') or
                (grid.cell[11, i].asstring = '030') then
                spCupom_item.ParamByName('cod_totalizador').asstring := 'I1'
              else
                if (grid.cell[11, i].asstring = '041') or
                  (grid.cell[11, i].asstring = '050') or
                  (grid.cell[11, i].asstring = '051') or
                  (grid.cell[11, i].asstring = '090') then
                  spCupom_item.ParamByName('cod_totalizador').asstring := 'N1'
                else
                  if (grid.cell[11, i].asstring = 'ISS') then
                    spCupom_item.ParamByName('cod_totalizador').asstring := '01S' +
                      Retorna_aliquota(grid.cell[11, i].asstring, grid.cell[10, i].asfloat)
                  else
                    spCupom_item.ParamByName('cod_totalizador').asstring :=
                      retorna_codigo_aliquota(grid.cell[10, i].asfloat);

            spCupom_Item.parambyname('cancelado').asinteger := 1;
            spCupom_Item.Prepare;
            spCupom_Item.Execute;
          end;
        end;




      end;

      if bBusca_foto_produto then
      begin
        img_produto.Picture := nil;
      end;
      bVenda := false;
      Limpa_controles;
    end
    else
    begin
      Imprime_display(sMsg, clred, tierro);
      sleep(1500);
      ed_barra.setfocus;
    end;

    // atualizar o totalizador geral do PAF com a do ECF
    repeat
      SMSG := cECF_Grande_Total(iECF_Modelo);
      if Smsg = 'ERRO' then
      begin
        if application.messagebox
          (pwidechar('Erro ao verificar totalizador do ECF!' + #13 +
          'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'), 'Erro',
          mb_yesno + MB_ICONERROR) = idno then
          break;
      end
      else
        atualiza_totalizador(SMSG);
    until SmSG <> 'ERRO';

//    // POSTO
//    if sRamo_Tipo = '3' then
//    begin
//      ilinha_abastecimento := 0;
//      iCodigo_abastecimento := 0;
//      timer_abastecimento.Enabled := true;
//      PN_POSTO.Visible := true;
//      grid_abastecimento.setfocus;
//    end;
  end;

  if pn_fechamento.Visible then
    pn_fechamento.Visible := False;

  if bVenda then
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'SIM')
  else
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'NAO');

end;

// -------------------------------------------------------------------------- //
// Cancela cupom fechaDO

procedure tFrmvenda.cancela_cupom_fechado();
var
  scod_cupom: string;
  i: integer;

begin
   // localizando o cupom no banco de dados
  if not bLanca_pre_venda then
    if (iECF_Modelo <> BEMATECH) and (iECF_Modelo <> EPSON) then
      sNumero_cupom := Zerar(inttostr(strtoint(snumero_cupom) - 1), 6);


  for i := 0 to 2 do
  begin
    sNumero_cupom := zerar(inttostr(strtoint(sNumero_cupom) - i), 6);

    query.close;
    query.sql.clear;
    query.sql.add('select numero, codigo from cupom where numero = ''' + sNumero_cupom + '''');
    query.sql.add('and ecf = ''' + sECF_Serial + ''' and data = :data');
    query.parambyname('data').asdatetime := dData_Sistema;
    query.open;
    if query.RecordCount > 0 then
    begin
      break;
    end;
  end;

  if query.RecordCount = 0 then
  begin
    Imprime_display('Cupom n�o encontrado!', clred, tierro);
    sleep(1500);
    ed_barra.setfocus;
    exit;
  end;

  Imprime_display('Aguarde! Cancelando cupom ' + sNumero_Cupom + '!', clYellow, tiAlerta);
  sleep(1000);

  if frmPrincipal.TipoImpressora = Fiscal then
    sMsg := cECF_Cancela_Cupom(iECF_Modelo)
  else
    sMsg := Imp_Cancela_Cupom(sPortaNaoFiscal);

  if sMsg = OK then
  begin
    scod_cupom := query.fieldbyname('codigo').asstring;

     // cancelar cupom no banco de dados
    query.close;
    query.sql.clear;
    query.sql.add('update cupom set cancelado = 1 where numero = ''' + sNumero_cupom + '''');
    query.sql.add('and ecf = ''' + sECF_Serial + ''' and data = :data');
    query.parambyname('data').asdatetime := dData_Sistema;
    query.execsql;

    query.Close;
    query.sql.clear;
    query.sql.add('update cupom_item set cancelado = 1 where cod_cupom = ''' +
      scod_cupom + '''');
    query.ExecSQL;

    if bBusca_foto_produto then
    begin
      img_produto.Picture := nil;
    end;

    bVenda := false;
    Limpa_controles;
  end
  else
  begin
    Imprime_display(sMsg, clred, tierro);
    sleep(1500);
    ed_barra.setfocus;
  end;

  // atualizar o totalizador geral do PAF com a do ECF
  if frmPrincipal.TipoImpressora = Fiscal then
    REPEAT
      sMsg := cECF_Grande_Total(iECF_Modelo);
      iF sMsg = 'ERRO' then
      begin
        if application.messagebox
          (pwidechar('Erro ao verificar totalizador do ECF!' + #13 +
          'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'), 'Erro',
          mb_yesno + MB_ICONERROR) = idno then
          break;

      end
      else
        atualiza_totalizador(sMsg);
    UNTIL sMsg <> 'ERRO';
  if pn_fechamento.Visible then
    pn_fechamento.Visible := False;
  if bVenda then
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'SIM')
  else
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'NAO');
end;

// -------------------------------------------------------------------------- //

procedure tFrmvenda.Cancela_Item(sItem: string);
var i: integer;
begin
  // inicia o cancelamento
  if frmPrincipal.TipoImpressora = Fiscal then
    sMsg := cECF_Cancela_Item(iECF_Modelo, zerar(sItem, 3))
  else
    sMsg := Imp_Cancela_Item(sPortaNaoFiscal, zerar(sItem, 3));

  if sMsg <> OK then
  begin
    Imprime_display(sMsg, clRed, tiErro);
    SLEEP(1000);
    Imprime_display('INFORME O PRODUTO...', CLWHITE, tiLivre);
    ED_BARRA.SETFOCUS;
    exit;
  end;

  pn_cancelar_item.Visible := FALSE;
  APPLICATION.ProcessMessages;
  // alimenta as variaveis
  iProd_codigo := grid.cell[3, grid.SelectedRow].asinteger;
  sProd_nome := grid.Cell[4, grid.selectedRow].asstring;
  rprod_Qtde := grid.Cell[5, grid.SelectedRow].asfloat;
  rprod_Preco := grid.Cell[6, grid.SelectedRow].asfloat;
  rprod_Total := grid.Cell[9, grid.SelectedRow].asfloat;
  rProd_aliquota := grid.Cell[10, grid.SelectedRow].asfloat;
  sProd_CST := grid.Cell[11, grid.SelectedRow].asstring;
  sProd_unidade := grid.cell[12, grid.selectedRow].asstring;
  sProd_Tamanho := grid.cell[14, grid.selectedRow].asstring;
  sProd_Cor := grid.cell[15, grid.selectedRow].asstring;
  // cancelar o item na linha do grid
  grid.cell[13, grid.SelectedRow].AsInteger := 3;
  grid.cell[1, grid.SelectedRow].AsInteger := 3;
  // diminui os totalizadores
  Dec(iTotal_Itens);
  rTotal_Venda := rtotal_venda - rprod_total;
  // Registrar item no Grid
  i := grid.AddRow(1);
  grid.cell[0, grid.LastAddedRow].asstring := '<FONT color="#FF0000">Cancelamento do Item ' + ZERAR(ed_cancelar_item.Text, 4) + '  ' +
    texto_justifica(formatfloat(
    '###,###,##0.000', -rprod_qtde),
    10, ' ', taDireita) +
    texto_justifica(formatfloat(
    '###,###,##0.00', rprod_preco),
    9, ' ', taDireita) +
    texto_justifica(formatfloat(
    '###,###,##0.00', -rprod_total),
    9, ' ', taDireita) + '</FONT>';

  // alimentar os campos invisiveis do grid com as informacoes do produto
  grid.cell[1, grid.LastAddedRow].asinteger := 3; // cancelamento de item
  grid.cell[2, grid.LastAddedRow].asSTRING := ZERAR(INTTOSTR(ed_cancelar_item.IntValue), 3);
  grid.cell[3, grid.LastAddedRow].asinteger := iProd_codigo;
  grid.Cell[4, grid.LastAddedRow].asstring := sProd_nome;
  grid.Cell[5, grid.LastAddedRow].asfloat := rprod_Qtde;
  grid.Cell[6, grid.LastAddedRow].asfloat := rprod_Preco;
  grid.Cell[9, grid.LastAddedRow].asfloat := rprod_Total;
  grid.Cell[10, grid.LastAddedRow].asfloat := rProd_aliquota;
  grid.Cell[11, grid.LastAddedRow].asstring := sProd_CST;
  grid.cell[12, grid.LastAddedRow].asstring := sProd_unidade;
  grid.cell[13, grid.LastAddedRow].asinteger := 1;
  grid.Cell[14, grid.LastAddedRow].asstring := sProd_Tamanho;
  grid.cell[15, grid.LastAddedRow].asstring := sProd_Cor;

  query.SQL.Clear;
  query.SQL.Add('update CUPOM_ITEM_TEMP set cancelado = 1 where item = ' + IntToStr(StrToInt(sItem)));
  query.ExecSQL;

  with frmModulo do begin
    qrItens.DisableControls;
    qrItens.Close;
    qrItens.Open;
    qrItens.Last;
    qrItens.EnableControls;
  end;

  // lancar item no banco de dados temporario
{  frmmodulo.spCupom_item_temp.close;
  frmmodulo.spCupom_item_temp.ParamByName('codigo').AsString := codifica_item(grid.Cell[2, i].asinteger) + 'C';
  frmmodulo.spCupom_item_temp.parambyname('cod_cupom').asstring := sNumero_Cupom;
  frmmodulo.spCupom_item_temp.parambyname('item').asinteger := grid.cell[2, i].asinteger;
  frmmodulo.spCupom_item_temp.ParamByName('cod_produto').asinteger := grid.cell[3, i].asinteger;
  frmmodulo.spCupom_item_temp.parambyname('unidade').asstring := grid.cell[12, i].asstring;
  frmmodulo.spCupom_Item_temp.parambyname('qtde').asfloat := grid.cell[5, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_unitario').asfloat := grid.cell[6, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_subtotal').asfloat := grid.cell[5, i].asfloat * grid.cell[6, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_desconto').asfloat := grid.cell[7, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_acrescimo').asfloat := grid.cell[8, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_total').asfloat := grid.cell[9, i].asfloat;
  frmmodulo.spCupom_item_temp.parambyname('cst').asstring := grid.cell[11, i].asstring;
  frmmodulo.spCupom_item_temp.parambyname('aliquota').asfloat := grid.cell[10, i].asfloat;
  frmmodulo.spCupom_item_temp.parambyname('cancelado').asinteger := grid.cell[13, i].asinteger;
  frmmodulo.spCupom_item_temp.parambyname('tamanho').asstring := grid.cell[14, i].AsString;
  frmmodulo.spCupom_item_temp.parambyname('cor').asstring := grid.cell[15, i].AsString;

  if (grid.cell[11, i].asstring = '060') or
    (grid.cell[11, i].asstring = '010') or
    (grid.cell[11, i].asstring = '070') then
    frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := 'F1'
  else
    if (grid.cell[11, i].asstring = '040') or
      (grid.cell[11, i].asstring = '030') then
      frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := 'I1'
    else
      if (grid.cell[11, i].asstring = '041') or
        (grid.cell[11, i].asstring = '050') or
        (grid.cell[11, i].asstring = '051') or
        (grid.cell[11, i].asstring = '090') then
        frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := 'N1'
      else
        if (grid.cell[11, i].asstring = 'ISS') then
          frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := '01S' +
            Retorna_aliquota(grid.cell[11, i].asstring, grid.cell[10, i].asfloat)
        else
          frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring :=
            retorna_codigo_aliquota(grid.cell[10, i].asfloat);

 }
  GRID.SelectLastRow;
  GRID.SetFocus;

{  frmmodulo.spCupom_item_temp.Prepare;
  frmmodulo.spCupom_item_temp.Execute;
}
  // atualizar os labels de totais e itens
  lb_item.Caption := inttostr(itotal_itens);
  lb_total.Caption := 'R$ ' + formatfloat('###,###,##0.00', rTotal_venda);


  Imprime_display('ITEM ' + ZERAR(ed_cancelar_item.Text, 4) + ' CANCELADO!', CLWHITE, tiOk);
  SLEEP(1000);
  Imprime_display('INFORME O PRODUTO...', CLWHITE, tiLivre);
  ED_BARRA.SETFOCUS;
end;

// -------------------------------------------------------------------------- //
// Registrar item no Grid

procedure tFrmVenda.Registra_Item;
var
  sAliquota: string;
  i: integer;

begin
{  if img_produto.Picture.Bitmap <> nil then begin
    MostraFotoProduto(false);
    MostraLogoMarca(true);
  end else begin
    MostraFotoProduto(true);
    MostraLogoMarca(false);
  end;
}
  sAliquota := Retorna_aliquota(sprod_cst, rprod_aliquota, iECF_Modelo);

  // verificar se o item tem acrescimo

  sMsg := Imp_Vende_item(sPortaNaoFiscal, Zerar(inttostr(iProd_codigo), 6),
    sProd_Nome,
    copy(sProd_unidade, 1, 2),
    sAliquota,
    rprod_qtde,
    rProd_preco,
    rprod_desconto * rprod_qtde,
    rProd_acrescimo * rprod_qtde,
    '$',
    rProd_total);

  if sMsg <> OK then
  begin
    Imprime_display(sMsg, clred, tiErro);
    sleep(1500);
    exit;
  end;

  // Registrar item no Grid
  i := grid.AddRow(1);
  grid.cell[0, grid.LastAddedRow].asstring := zerar(inttostr(iItem), 4) + ' ' +
    zerar(inttostr(iProd_codigo), 6) + ' ' +
    texto_justifica(sProd_Nome, 15, ' ', taEsquerda) + ' ' +
    texto_justifica(sprod_unidade, 2, ' ', taEsquerda) +
    texto_justifica(formatfloat('########0.000', rprod_qtde), 9, ' ', taDireita) +
    texto_justifica(formatfloat('########0.00', rprod_preco), 8, ' ', taDireita) +
    texto_justifica(formatfloat('########0.00', rprod_total), 8, ' ', taDireita);


  // alimentar os campos invisiveis do grid com as informacoes do produto
  grid.cell[1, grid.LastAddedRow].asinteger := 1; // venda de item
  grid.cell[2, grid.LastAddedRow].asSTRING := ZERAR(INTTOSTR(iItem), 3);
  grid.cell[3, grid.LastAddedRow].asinteger := iProd_codigo;
  grid.Cell[4, grid.LastAddedRow].asstring := sProd_nome;
  grid.Cell[5, grid.LastAddedRow].asfloat := rprod_Qtde;
  grid.Cell[6, grid.LastAddedRow].asfloat := rprod_Preco;
  grid.Cell[7, grid.LastAddedRow].asfloat := rprod_desconto;
  grid.Cell[8, grid.LastAddedRow].asfloat := rprod_acrescimo;
  grid.Cell[9, grid.LastAddedRow].asfloat := rprod_Total;
  grid.Cell[10, grid.LastAddedRow].asfloat := rProd_aliquota;
  grid.Cell[11, grid.LastAddedRow].asstring := sProd_CST;
  grid.cell[12, grid.LastAddedRow].AsString := sProd_unidade;
  grid.cell[13, grid.LastAddedRow].asinteger := 0;
  grid.Cell[14, grid.LastAddedRow].asstring := sProd_Tamanho;
  grid.cell[15, grid.LastAddedRow].AsString := sProd_Cor;

  // registrar o desconto e acrescimo em outra linha
  if rprod_desconto > 0 then
  begin
    grid.AddRow(1);
    grid.cell[0, grid.LastAddedRow].asstring := '<i><FONT color="#FF0000">            ' +
      'Desconto em R$ ' + '          ' +
      texto_justifica(formatfloat('###,###,##0.00', -rprod_desconto * rprod_qtde),
      9, ' ', taDireita) + '</i></FONT>';
    grid.cell[1, grid.LastAddedRow].asinteger := 4; // desconto
  end;
  if Rprod_acrescimo > 0 then
  begin
    grid.AddRow(1);
    grid.cell[0, grid.LastAddedRow].asstring := '<i><FONT color="#0000FF">            ' +
      'Acr�scimo em R$' +
      '          ' +
      texto_justifica(formatfloat(
      '###,###,##0.00', rprod_acrescimo * rprod_qtde),
      9, ' ', taDireita) + '</i></FONT>';
    grid.cell[1, grid.LastAddedRow].asinteger := 5; // acrescimo
  end;



  // lancar item no banco de dados temporario

  frmmodulo.spCupom_item_temp.close;
  frmmodulo.spCupom_item_temp.ParamByName('codigo').AsString := codifica_item(grid.Cell[2, i].asinteger);
  frmmodulo.spCupom_item_temp.parambyname('cod_cupom').asstring := sNumero_Cupom;
  frmmodulo.spCupom_item_temp.parambyname('item').asinteger := grid.cell[2, i].asinteger;
  frmmodulo.spCupom_item_temp.ParamByName('cod_produto').asinteger := grid.cell[3, i].asinteger;
  frmmodulo.spCupom_item_temp.parambyname('unidade').asstring := grid.cell[12, i].asstring;
  frmmodulo.spCupom_Item_temp.parambyname('qtde').asfloat := grid.cell[5, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_unitario').asfloat := grid.cell[6, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_subtotal').asfloat := grid.cell[5, i].asfloat * grid.cell[6, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_desconto').asfloat := grid.cell[7, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_acrescimo').asfloat := grid.cell[8, i].asfloat;
  frmmodulo.spCupom_Item_temp.parambyname('valor_total').asfloat := grid.cell[9, i].asfloat;
  frmmodulo.spCupom_item_temp.parambyname('cst').asstring := grid.cell[11, i].asstring;
  frmmodulo.spCupom_item_temp.parambyname('aliquota').asfloat := grid.cell[10, i].asfloat;
  frmmodulo.spCupom_item_temp.parambyname('cancelado').asinteger := grid.cell[13, i].asinteger;
  frmModulo.spCupom_Item_temp.parambyname('tamanho').AsString := grid.cell[14, i].AsString;
  frmModulo.spCupom_Item_temp.parambyname('cor').AsString := grid.cell[15, i].AsString;

  if (grid.cell[11, i].asstring = '060') or
    (grid.cell[11, i].asstring = '010') or
    (grid.cell[11, i].asstring = '070') then
    frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := 'F1'
  else
    if (grid.cell[11, i].asstring = '040') or
      (grid.cell[11, i].asstring = '030') then
      frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := 'I1'
    else
      if (grid.cell[11, i].asstring = '041') or
        (grid.cell[11, i].asstring = '050') or
        (grid.cell[11, i].asstring = '051') or
        (grid.cell[11, i].asstring = '090') then
        frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := 'N1'
      else
        if (grid.cell[11, i].asstring = 'ISS') then
          frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring := '01S' +
            Retorna_aliquota(grid.cell[11, i].asstring, grid.cell[10, i].asfloat)
        else
          frmmodulo.spCupom_item_temp.ParamByName('cod_totalizador').asstring :=
            retorna_codigo_aliquota(grid.cell[10, i].asfloat);

  frmmodulo.spCupom_item_temp.Prepare;
  frmmodulo.spCupom_item_temp.Execute;

  // selecionar a linha incluida no grid
  grid.SelectLastRow;
  // focar no grid para ele ir para ultima linha incluida
  grid.SetFocus;
  ed_barra.SetFocus;

  // acumluar o item nas variaveis de totalizacao
  rTotal_Venda := rTotal_venda + rProd_total;
  Inc(iTotal_Itens);
  Inc(iItem);
  // lancar no dislpay o produto
  Imprime_display(sProd_NOme, clWhite, tiOk);
  Imprime_display_teclado(lb_produto.caption,
    formatfloat('###,###,##0.000', rprod_qtde) + ' x R$ ' +
    formatfloat('###,###,##0.000', rprod_preco) + ' = R$ ' +
    formatfloat('###,###,##0.00', rprod_total));
  // atualizar os labels de totais e itens
  lb_item.Caption := inttostr(itotal_itens);
  lb_total.Caption := 'R$ ' + formatfloat('###,###,##0.00', rTotal_venda);
  ed_barra.text := '';
end;

// -------------------------------------------------------------------------- //
// Limpar os controles para receber uma nova venda/comando

procedure tFrmVenda.Limpa_controles();
begin
  sCli_Nome := '';
  sCli_Endereco := '';
  sCli_Cidade := '';
  sCli_uf := '';
  scli_cep := '';
  sCli_CPF := '';
  sCli_Placa := '';
  sCli_Km := '';
  sCli_vendedor := '';

  sConsumidor_CPF := '';
  sConsumidor_Nome := '';
  sConsumidor_Endereco := '';

  grid.ClearRows;
  grid_topo.ClearRows;
  ed_barra.Text := '';
  ed_qtde.value := 0;
  ed_unitario.value := 0;
  lb_total.caption := 'R$ 0,00';
  lb_item.Caption := '0';
  Imprime_display('C A I X A    L I V R E', clWhite, tiLivre);
  MostraFotoProduto(false);
  MostraLogoMarca(true);
  ed_barra.setfocus;
end;

// -------------------------------------------------------------------------- //
// funcao para alimentar o display superior da tela

procedure tFrmVenda.Imprime_display(texto: string; cor_da_fonte: tcolor; Imagem: Tipo_Imagem);
begin
  // armazena os dados atuais do display para enventual uso
  sTexto_anterior := lb_produto.Caption;
  clCor_anterior := lb_produto.Font.color;

  // inicia a impressao do display

  lb_produto.Caption := texto;
  lb_produto.Font.Color := cor_da_fonte;



  lb_produto.Font.Size := 28;
  application.ProcessMessages;
   // redimensionando o tamanho do label para caber dentro do display independente do
   // tamanho do texto;
{  try
    while lb_produto.Width > 668 do begin
      lb_produto.Font.Size := lb_produto.Font.Size - 1;
    end;
  except
    lb_produto.Font.Size := 28;
  end;
}
  Imprime_display_teclado(COPY(trimleft(trimright(lb_produto.caption)), 1, 40), '');
end;

// -------------------------------------------------------------------------- //

procedure tfrmVenda.Imprime_display_anterior();
begin
  Imprime_display(sTexto_anterior, clCor_anterior, TiImagem_anterior);
end;

// -------------------------------------------------------------------------- //
// Funcao para iniciar a venda

function tFrmVenda.Abre_Venda(): boolean;
begin
  TimerTroco.Enabled := false;
  try
    tBanceira01.Bandeira := bcOutros;
    tBanceira01.Numero := -1;
    tBanceira01.Parcela.Parcelas := -1;
    tBanceira01.Parcela.Valor := 0;
    tBanceira01.Parcela.Diferenca := 0;

    tBanceira02.Bandeira := bcOutros;
    tBanceira02.Numero := -1;
    tBanceira02.Parcela.Parcelas := -1;
    tBanceira02.Parcela.Valor := 0;
    tBanceira02.Parcela.Diferenca := 0;

    tBanceira03.Bandeira := bcOutros;
    tBanceira03.Numero := -1;
    tBanceira03.Parcela.Parcelas := -1;
    tBanceira03.Parcela.Valor := 0;
    tBanceira03.Parcela.Diferenca := 0;

    if frmPrincipal.TipoImpressora <> Fiscal then
    begin
      // Pega Menor numero cupom
      sNumero_Cupom := Zerar(FloatToStr(Max('')), 5);
      sNumero_contador_cupom := Zerar(sNumero_Cupom, 5);

      if Length(sNumero_Cupom) = 5 then
        sNumero_Cupom := '9' + sNumero_Cupom;

      if Length(sNumero_contador_cupom) = 5 then
        sNumero_contador_cupom := '9' + sNumero_contador_cupom;

    end;


    // VERIFICAR O TOTALIZADOR

    if frmPrincipal.TipoImpressora = Fiscal then
      if not compara_totalizador then
      begin
        result := false;
        close;
        exit;
      end;


    if (bLanca_pre_venda) or (bLanca_os) or (bLanca_abastecimento) then
    begin
      if blanca_pre_venda then
      begin
        query.close;
        query.sql.clear;
        query.sql.add('select * from cliente where codigo = ' + IntToStr(iPre_venda_cliente));
        query.open;
      end
      else
      begin
        if blanca_os then
        begin
          query.close;
          query.sql.clear;
          query.sql.add('select * from cliente where codigo = ' + IntToStr(iOs_cliente));
          query.open;
        end;
      end;

      if (blanca_os) or (blanca_pre_venda) then
      begin
        sConsumidor_CPF := query.fieldbyname('cpf').asstring;
        sConsumidor_Nome := query.fieldbyname('nome').asstring;
        sConsumidor_Endereco := query.fieldbyname('endereco').asstring + ' ' +
          query.fieldbyname('bairro').asstring + '  ' +
          query.fieldbyname('cidade').asstring + '  ' +
          query.fieldbyname('uf').asstring;
      end
      else
      begin
        sConsumidor_CPF := '';
        sConsumidor_Nome := '';
        sConsumidor_Endereco := '';
      end;
    end
    else
    begin
      if bIdentifica_consumidor then begin
        frmIdentifica := TfrmIdentifica.Create(self);
        frmIdentifica.ShowModal;
        if sConsumidor_CPF <> '' then
          frmPrincipal.TipoImpressora := SemImpressora;
        CorEditTotaL;
      end;
    end;

    iVendedorCodigo := 0;
    sVendedorNome := '';

    if bIdentificarVendedor = 1 then begin
      Application.CreateForm(TFrmVendedor, FrmVendedor);
      try
        if FrmVendedor.ShowModal = mrOk then begin
          iVendedorCodigo := StrToInt(frmModulo.Query.FieldByName('CODIGO').AsString);
          sVendedorNome := frmModulo.Query.FieldByName('NOME').AsString;
        end else begin
          result := false;
          close;
          exit;
        end
      finally
        FreeAndNil(FrmVendedor);
      end;
    end;


    if frmPrincipal.TipoImpressora = Fiscal then
      if iECF_Modelo = 2 then // DARUMA - COMANDO PROVISORIO
      begin
        //sConsumidor_CPF := '';
        //sConsumidor_Nome := '';
       // sConsumidor_Endereco := '';
      end;

    if frmPrincipal.TipoImpressora = Fiscal then
      sMsg := cECF_Abre_Cupom(iECF_Modelo, sConsumidor_CPF, sConsumidor_Nome, sConsumidor_Endereco, bIdentifica_Consumidor)
    else
      sMsg := Imp_Abre_Cupom(sPortaNaoFiscal, sConsumidor_CPF, sConsumidor_Nome, sConsumidor_Endereco, bIdentifica_Consumidor);
//     xcpf.Caption :='CPF:' + sConsumidor_CPF;
    if sMsg <> OK then
    begin
      Imprime_display(smsg, clred, tiErro);
      sleep(1500);
      result := false;
    end
    else
    begin
      // buscar variaveis do ECF
      // numero do cupom
      if frmPrincipal.TipoImpressora <> Fiscal then
        sMsg := sNumero_Cupom;


      if frmPrincipal.TipoImpressora = Fiscal then
        sMsg := cECF_Numero_Cupom(iECF_Modelo);

      if Length(sMsg) <> 6 then
      begin
        Imprime_display(smsg, clred, tiErro);
        result := false;
        exit;
      end
      else
      begin
        sNumero_Cupom := sMsg;
        sNumero_Venda := sMsg;
      end;

      // numero do contador de cupom fiscal
      if frmPrincipal.TipoImpressora = Fiscal then
        sMsg := cECF_Numero_Contador_Cupom(iECF_Modelo)
      else
        sMsg := sNumero_contador_cupom;

      if Length(sMsg) <> 6 then
      begin
        Imprime_display(smsg, clred, tiErro);
        result := false;
        exit;
      end
      else
        sNumero_contador_cupom := sMsg; //        sNumero_contador_cupom := sMsg;

      // temporario
      frmmodulo.spCodigo_Global.Prepare;
      frmmodulo.spCodigo_Global.Execute;

      // hora do cupom
      if frmPrincipal.TipoImpressora = Fiscal then
        sMsg := copy(cECF_Data_Hora(iECF_Modelo), 12, 8)
      else
        sMsg := TimeToStr(Now);

      try
        hHora_Cupom := strtotime(smsg);
      except
        Imprime_display('Hora inv�lida!', clred, tiErro);
        result := false;
        exit;
      end;

      // lancar abertura do cupom na tabela temporaria


      frmModulo.spCupom_Temp.Close;
      frmModulo.spCupom_Temp.ParamByName('numero').asstring := sNumero_Cupom;
      frmModulo.spCupom_Temp.ParamByName('ccf').asstring := sNumero_contador_cupom;
      frmModulo.spCupom_Temp.ParamByName('ecf').asstring := sECF_Serial;
      frmModulo.spCupom_Temp.ParamByName('data').AsDate := dData_Sistema;
      frmModulo.spCupom_Temp.ParamByName('hora').AsTime := hHora_Cupom;
      frmModulo.spCupom_temp.Prepare;
      frmModulo.spCupom_temp.Execute;

      Imprime_display('ABRINDO O CUPOM...', clwhite, tiInfo);
      // alimentar as variaveis de status
      bVenda := true;
      bTotalizado := false;
      bPago1 := false;
      bPago2 := false;
      bPago3 := false;
      bFinalizado := false;
      // alimentar as variaveis de totais
      rTotal_Venda := 0;
      iTotal_itens := 0;
      lb_item.Caption := '000';
      lb_total.Caption := 'R$ 0,00';
      iItem := 1;
      // imprimir no grid o cabechalho do cupom
      grid_topo.ClearRows;
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        datetostr(dData_sistema) + '  ' + timetostr(hHora_Cupom) +
        '                         COO: ' + zerar(sNumero_cupom, 6);
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        '--------------------------------------------------------';
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        '<B><FONT size="12">             CUPOM FISCAL</FONT></B>';
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        'ITEM C�DIGO DESCRI��O       UN.    QTDE.  PRE�O   TOTAL';
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        '--------------------------------------------------------';
      // limpar o grid dos itens
      grid.ClearRows;

      if bBusca_foto_produto then
      begin
        img_produto.Picture := nil;
      end;

      result := true;
    end;
  except
    result := false;
  end;

  gravaINI(sConfiguracoes, 'PDV', 'NumCupom', sNumero_Cupom);

  if bVenda then
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'SIM')
  else
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'NAO');

end;

// -------------------------------------------------------------------------- //
// Funcao para truncar o valor para nao dar diferencao no ECF

function tfrmVenda.Truncar_Valor(valor: real): real;
var txt_desconto: string;
  i: integer;
begin
  txt_desconto := formatfloat('#############0.00000000000', valor);
  i := pos(',', txt_desconto);
  if i > 0 then
  begin
    txt_desconto :=
      copy(txt_desconto, 1, i - 1) + ',' +
      copy(txt_desconto, i + 1, 2);
    result := strtofloat(txt_desconto);
  end
  else
    result := valor;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // verificar se ha cupom aberto, nao permitindo a saida do sistema
  if bVenda then
  begin
    Imprime_display('CUPOM ABERTO!', clYellow, tiAlerta);
    sleep(1500);
    Imprime_display('INFORME O PRODUTO...', clWhite, tiLivre);
    ed_barra.SetFocus;
    abort;
  end
  else
  begin
    Imprime_display_teclado('ACTHAUROS V-2019', 'ACTHAUROS V-2019');
    if iteclado_modelo = 1 then
    begin
      CloseTec44;
    end;

    action := cafree;
  end;
//  voltaResolucao(a, b);
  FreeAndNil(sMensagem_Cupom);
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
  sMensagem_Cupom := TMemo.Create(Self);
  sMensagem_Cupom.Visible := False;
  sMensagem_Cupom.Parent := self;
  sMensagem_Cupom.WordWrap := False;
  vNumNFCe := 0;
  Carregando := True;
  frmmodulo.LerConfiguracao;
  if EdFormatoOff = 0 then
    frmtOffLine := teContingencia
  else
    frmtOffLine := teOffLine;
  CheckConnect  :=  TThreadCheckConnection.GetInstance;
  with CheckConnect do begin
    OnStatusChange  :=  OnInternetChange;
    Start;
  end;

  pn_principal.DoubleBuffered := True;

  // data e hora da ultima carga
  if sCarga_data <> '' then begin
    cpBarra.Panels.Items[11].Text := sCarga_data + ' �s ' + scarga_hora;
  end else
    cpBarra.Panels.Items[11].Text := '';

  // verificar a ativacao/desativacao da pre-venda e ordem de servico
  menu_Prevenda.Visible := bPermite_Prevenda;


  pn_tampa.visible := false;
  pn_tampa.Align := alClient;

  grid.ClearRows;

  // alimentar os combos com as formas de pagamento
  cb_forma1.Items.Clear;
  cb_forma2.Items.Clear;
  cb_forma3.Items.Clear;
  frmmodulo.tbForma_Pgto.open;
  frmmodulo.tbForma_Pgto.First;
  while not frmModulo.tbForma_Pgto.Eof do begin
    sMsg := TrimLeft(TrimRight(frmmodulo.tbForma_Pgto.fieldbyname('nome').asstring));
    if (sMsg = '') or (ansiuppercase(sMsg) = 'VALOR RECEBIDO') or (ansiuppercase(sMsg) = 'TROCO') then begin
       // nao copiar
    end else begin
      cb_forma1.Items.Add(sMsg);
      cb_forma2.Items.Add(sMsg);
      cb_forma3.Items.Add(sMsg);
    end;
    frmModulo.tbForma_Pgto.Next;
  end;

  frmModulo.tbForma_Pgto.Close;

  // verificar se a funcao de buscar a foto do produto esta habilitada
  MostraFotoProduto(bBusca_foto_produto);
  MostraLogoMarca(bHabLogoMarca);

  // verificar se ha teclado instaldao
  // modelo 1 - Gertec tec 44 com display
  if iTeclado_modelo = 1 then begin
    // abrir a comunicacao
    OpenTec44;
    Imprime_display_teclado('ACTHAUROS V-2019', 'Terminal iniciado com sucesso!');
  end;

  Carregando := False;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_barraKeyPress(Sender: TObject; var Key: Char);
var bDados_balanca: boolean;
  sx_barra: string;
  MemoryStream : TMemoryStream;
  Jpg : TJpegImage;
  Bitmap : TBitmap;
  ext : string;
begin
  if key = #13 then
  begin
    sx_barra := Trim(ed_barra.text);

    if sx_barra = '' then
    begin
      ed_barra.setfocus;
      exit;
    end;

    if timer_balanca.Enabled then
    begin
      timer_balanca.Enabled := false;
      try
        frmmodulo.balanca.desativar;
        frmmodulo.Balanca.Ativo := false;
      except
      end;
      bDados_balanca := true;
    end
    else
      bDados_balanca := false;

    if not bVenda then
    begin
      try
        BlockInput(TRUE);
        // verificar o serial do ecf
        if frmPrincipal.TipoImpressora = Fiscal then
          if not verifica_ecf then
          begin
            close;
            exit;
          end;
        // Abrir o cupom fiscal
        // bloquear ao teclado

        if not Abre_Venda then
        begin
          bLanca_pre_venda := false;
          bLanca_OS := false;
          bLanca_Mesa := false;
          bLanca_Abastecimento := false;
          // Caso o comando de abertura de venda retornou false, abortar o processo;
          Imprime_display('ERRO AO ABRIR O CUPOM!', clRed, tiErro);
          exit;
        end;
      finally
        // desbloquear o teclado
        BlockInput(FALSE);
      end;
    end;


    iPesquisa_produto := 1;
    // fazer a busca do produto
    sProd_barra := ed_barra.text;
    if frmVenda.Localizar_Produto(ed_barra.Text) then
    begin

      if bBusca_foto_produto then
      begin
        if not query.FieldByName('fotobd').IsNull then begin
          MostraLogoMarca(false);
          MostraFotoProduto(True);
          MemoryStream := TMemoryStream.Create;
          Jpg := TJpegImage.Create;
          TBlobField(query.FieldByName('fotobd')).savetostream(MemoryStream);
          MemoryStream.Position := OffsetMemoryStream;
          Jpg.LoadFromStream(MemoryStream);
          img_produto.Picture.Assign(Jpg);
          freeandnil(MemoryStream);
        end else begin
          img_produto.Picture := nil;
          MostraLogoMarca(True);
          MostraFotoProduto(False);
        end;
      end else begin
        MostraLogoMarca(True);
        MostraFotoProduto(False);
      end;


      // achou o produto
      // alimentar os edits da tela
      if bDados_balanca then
      begin
        rprod_qtde := rBal_peso;
        // se for pesado
        if bTruncar_valor then
          rprod_total := Truncar_Valor(rprod_qtde * rprod_preco)
        else
          rprod_total := rprod_qtde * rprod_preco;

        ed_qtde.value := rprod_qtde;
        ed_unitario.Value := rProd_preco;
      end
      else
      begin
        // se for normal
        ed_qtde.value := rProd_qtde;
        ed_unitario.Value := rProd_preco;
      end;
      // verificar se o sistema permite edicao dos edit's de valores
      if bMuda_qtde or bMuda_unitario then
      begin
        Imprime_display(sProd_nome, clWhite, tiInfo);
        ed_qtde.ReadOnly := false;
        ed_unitario.ReadOnly := false;
        if bMuda_qtde then ed_qtde.ReadOnly := false else ed_qtde.ReadOnly := true;
        if bMuda_unitario then ed_unitario.ReadOnly := false else ed_unitario.ReadOnly := true;

        if bProd_promocao then
        begin
          ed_unitario.ReadOnly := TRUE;
          exit;
        end;
        if bMuda_qtde then begin
          ed_qtde.setfocus;
          exit;
        end;
        if bMuda_unitario then begin
          ed_unitario.setfocus;
          exit;
        end;
      end
      else
      begin
        // verificar se existe algum valor zerado
        if (rprod_total <= 0) or (rprod_qtde <= 0) or (rProd_preco <= 0) then
        begin

          FComanda := TFComanda.create(self);
          FComanda.showmodal;
          Imprime_display('INFORME O PRE�O DE VENDA DO PRODUTO!', CLRED, TIERRO);
          EXIT;

          {ed_unitario.ReadOnly := false;
          ed_unitario.SetFocus;
          Imprime_display('INFORME O PRE�O DE VENDA DO PRODUTO!', CLRED, TIERRO);
          EXIT;}
        end;
        ed_barra.text := '';
        Registra_Item;
      end;
    end
    else
    begin
      // nao achou o produto
      // lancar no display do produto
      frmProtetor_tela := TfrmProtetor_tela.Create(self);
      frmProtetor_tela.ShowModal;
      Imprime_display('PRODUTO N�O ENCONTRADO!', clRed, tiErro);
      exit;
      ed_barra.SelectAll;

    end;
  end
  else
  begin
    if (key in ['0'..'9', 'a'..'z', 'A'..'Z']) or (key = '*') or (key = ',') then
    begin
      if blimpa_edit_display then
      begin
        if iTeclado_Modelo = 1 then
        begin
          Imprime_display_teclado('', '');
          blimpa_edit_display := false;
          CarRet;
        end;

        if iteclado_modelo = 1 then
        begin
          strpcopy(@men, key);
          DispStr(@men);
        end;
      end;
    end
    else
    begin
      if (key = #7) or (key = #8) or (key = #32) then
      else
        Abort;
    end;
  end;

end;

procedure TfrmVenda.ed_barraKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.CancelarItem1Click(Sender: TObject);
begin
  // verificar se existe um cupom aberto
  if bVenda then
  begin
    // verificar se existe itens lancados
    if iTotal_Itens > 0 then
    begin
      Imprime_display('CANCELAR ITEM...', CLWHITE, tiExcluir);
      ed_cancelar_item.Visible := true;
      lb_cancelar_item.Caption := 'N�mero do Item:';
      CentralizarPanel(pn_cancelar_item);
      pn_cancelar_item.Visible := true;
      pn_cancelar_item_botoes.Visible := false;
      ed_cancelar_item.IntValue := 0;
      ed_cancelar_item.SetFocus;
      ed_cancelar_item.SelectAll;
    end
    else
    begin
      Imprime_display('N�O EXISTEM ITENS LAN�ADOS!', CLRED, tiErro);
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_cancelar_itemEnter(Sender: TObject);
begin
  if iTeclado_Modelo = 1 then
  begin
    strpcopy(@men, 'Informe o numero do item:');
    DispStr(@men);
    LineFeed;
    CarRet;
  end;


  // controlar a saida do edit de cancelamento de item
  bSair_campo := false;
  PopupMenu := nil;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_cancelar_itemExit(Sender: TObject);
begin
  // nao permitir a saida do campo clicando com o mouse em outro lugar
  // ou pressionando tab
  if not bsair_campo then ed_cancelar_item.setfocus;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_cancelar_itemKeyPress(Sender: TObject;
  var Key: Char);
var iLinha: integer;
  sItem_c: string;
begin

  if key = #13 then
  begin
    BlockInput(true);


    sItem_c := zerar(ed_cancelar_item.text, 3);


    // confirmacao do cancelamento do item
    // Localizar o item no grid
    if Grid.FindText(2, sItem_c, [soCaseInsensitive]) then
    begin
      // Encontrou o item
      iLinha := grid.SelectedRow;
      // Fazer nova busca para achar o mesmo item no grid, caso jah foi cancelado
      if grid.SearchNext(2, sItem_C) then
      begin
         // Comparar o novo item encontrado, verificar se eh o mesmo
        if grid.SelectedRow = iLinha then
        begin
           //Confirma��o do cancelamento
          Imprime_display('Cancelar: ' + zerar(ed_cancelar_item.text, 3) + ' ' +
            copy(grid.Cell[4, grid.SelectedRow].asstring, 1, 15) + ' ' +
            formatfloat('###,###,##0.000',
            grid.Cell[5, grid.SelectedRow].asfloat) + ' x ' +
            'R$ ' + formatfloat('###,###,##0.00',
            grid.Cell[6, grid.SelectedRow].asfloat) + ' = ' +
            'R$ ' + formatfloat('###,###,##0.00',
            grid.Cell[9, grid.SelectedRow].asfloat),
            clwhite, tiExcluir);


          bsair_campo := true;
           // mostra o panel com os botoes SIM e NAO
          ed_cancelar_item.Visible := false;
          lb_cancelar_item.caption := 'Confirma?';


          pn_cancelar_item_botoes.visible := true;

          BlockInput(false);
          bt_cancelar_item_sim.setfocus;
        end
        else
        begin
           // item jah foi cancelado, volta para o edit de cancelamento de item
          Imprime_display('ITEM J� CANCELADO!', CLRED, TIERRO);
          SLEEP(1000);
          Imprime_display('CANCELAR ITEM...', CLWHITE, tiExcluir);
            // selecionar a linha incluida no grid
          grid.SelectLastRow;
            // focar no grid para ele ir para ultima linha incluida
          grid.SetFocus;

          BlockInput(false);
          ed_cancelar_item.Setfocus;
          ed_cancelar_item.SelectAll;
        end;
      end;

    end
    else
    begin
      // item n�o encontrado. Volta para o edit de cancelamento de item
      Imprime_display('ITEM N�O ENCONTRADO!', CLRED, TIERRO);
      SLEEP(1000);
      Imprime_display('CANCELAR ITEM...', CLWHITE, tiExcluir);
      BlockInput(false);
      ed_cancelar_item.Setfocus;
      ed_cancelar_item.SelectAll;
    end;

  end
  else
  begin
    if key = #27 then
    begin
      // aborta o cancelamento do item
      bSair_campo := true;
      Imprime_display('INFORME O PRODUTO...', CLWHITE, tiLivre);
      pn_cancelar_item.Visible := FALSE;
      BlockInput(false);
      ED_BARRA.SETFOCUS;
    end
    else
    begin
      if iTeclado_Modelo = 1 then
      begin
        strpcopy(@men, key);
        DispStr(@men);
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.bt_cancelar_item_naoClick(Sender: TObject);
begin
  // aborta o cancelamento do item
  Imprime_display('INFORME O PRODUTO...', CLWHITE, tiLivre);
  pn_cancelar_item.Visible := FALSE;
  ED_BARRA.SETFOCUS;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_barraEnter(Sender: TObject);
begin
  // ativar os atalhos das funcoes OPCOES
  PopupMenu := pop_principal;
  blimpa_edit_display := true;
  ed_barra.SelectAll;
  sProd_barra := '';
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.bt_cancelar_item_simClick(Sender: TObject);
begin
  if bSenha_Cancel_Item then
  begin
    pn_cancelar_item.Visible := False;
    CentralizarPanel(pn_senha_cancelar);
    pn_senha_cancelar.Visible := true;
    lb_cancelar.Caption := 'Cancelar Item';
    ed_senha.text := '';
    ed_senha.setfocus;
  end
  else
  begin
    Cancela_Item(ed_cancelar_item.text);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.MenuFiscal2Click(Sender: TObject);
begin

  if not bVenda then
  begin
    // caso nao haja cupom aberto, aciona o menu fiscal
    frmmenu_fiscal := tfrmMenu_fiscal.create(self);
    frmMenu_fiscal.showModal;
  end
  else
  begin
    // venda aberta, nao permitir o uso do menu fiscal
    Imprime_display('DOCUMENTO SENDO EMITIDO!', CLYELLOW, tiAlerta);
    SLEEP(1000);
    Imprime_display('INFORME O PRODUTO...', clWhite, tiLIVRE);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Retornar1Click(Sender: TObject);
begin
  ed_barra.setfocus;
  if timer_balanca.Enabled then
  begin
    timer_balanca.Enabled := false;
    frmmodulo.Balanca.Ativo := false;
    frmmodulo.balanca.Desativar;
    Imprime_display('Informe o Produto...', clwhite, tiLivre);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Sair1Click(Sender: TObject);
begin
  if application.messagebox('Confirma a sa�da do sistema?', 'Aten��o', MB_YESNO + MB_ICONWARNING +
    MB_DEFBUTTON2) = idyes then
    CLOSE;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.CancelarCupom1Click(Sender: TObject);
var
  str: string;
begin
  if bVenda then
  begin
    //Caso exista cupom aberto
    if bSenha_Cancel_Cupom then
    begin
      CentralizarPanel(pn_senha_cancelar);
      pn_senha_cancelar.visible := true;
      lb_cancelar.Caption := 'Cancelar Cupom';
      ed_senha.text := '';
      ed_senha.setfocus;
    end
    else
    begin
      Cancela_cupom_aberto;
    end;
  end
  else
  begin
    sMsg := cECF_Numero_Cupom(iECF_Modelo);
    if Length(sMsg) <> 6 then
    begin
      Imprime_display(smsg, clred, tiErro);
      exit;
    end
    else
      sNumero_Cupom := sMsg;
    //Cupom jah fechado, cancelar o ultimo cupom
    //Caso exista cupom aberto
    if bSenha_Cancel_Cupom then
    begin
      CentralizarPanel(pn_senha_cancelar);
      pn_senha_cancelar.visible := true;
      lb_cancelar.Caption := 'Cancelar Cupom';
      ed_senha.text := '';
      ed_senha.setfocus;
    end
    else
    begin
      Cancela_cupom_fechado;
    end;
  end;

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_barraExit(Sender: TObject);
begin
  // Desativa os comandos do Menu OPCOES
  PopupMenu := nil;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ED_DESC_ACREEnter(Sender: TObject);
begin
  // liberar a tecla F#
  baltera_tipo_desconto := true;
  // pintar o shape do edit de azul
  Imprime_display('Informe o Desconto em R$... (F3 Altera)', clwhite, tiPgto);
  if iTeclado_modelo = 1 then
  begin
    blimpa_edit_display := true;
    strpcopy(@men, '0,00');
    DispStr(@men);
  end;


end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ED_DESC_ACREExit(Sender: TObject);
begin

  //bloquear a tecla F3
  baltera_tipo_desconto := false;
  // verificar se o pn_fechamento jah fechou
  if not pn_fechamento.Visible then exit;

  // Nao permitir lancar valor negativo
  if ed_desc_acre.value < 0 then
  begin
    Imprime_display('Valor n�o pode ser negativo!', clred, tiErro);
    sleep(2000);
    ed_desc_acre.SetFocus;
    Imprime_display_anterior;
    exit;
  end;

  rTotal_Desconto := 0;
  rTotal_Acrescimo := 0;

  if ED_DESC_ACRE.Value > 0 then
  begin
    case cb_desc_acre.ItemIndex of
      0: begin // Desconto por R$
          rtotal_desconto := ed_desc_acre.value;
          ed_total_pagar.value := rTotal_Venda - rtotal_desconto;
        end;
      1: begin // Desconto por %
          if bTruncar_valor then
            rTotal_Desconto := truncar_valor(rTotal_Venda * (ed_desc_acre.value / 100))
          else
            rTotal_Desconto := (rTotal_Venda * (ed_desc_acre.value / 100));



          ed_total_pagar.value := rTotal_Venda - rTotal_desconto;
        end;

      2: begin // Acrescimo por %

          if bTruncar_valor then
            rTotal_acrescimo := truncar_valor(rTotal_Venda * (ed_desc_acre.value / 100))
          else
            rtotal_acrescimo := (rTotal_Venda * (ed_desc_acre.value / 100));
          ed_total_pagar.value := rTotal_Venda + rtotal_acrescimo;
        end;
      3: begin // Acrescimo por R$
          rtotal_acrescimo := ed_desc_acre.value;
          ed_total_pagar.value := rTotal_Venda + rtotal_acrescimo;
        end;
    end;
    if bTruncar_valor then ed_total_pagar.value := Truncar_Valor(ed_total_pagar.Value);
    // alimentar os valores
    ed_troco.value := 0;
    ed_forma1.value := ed_total_pagar.value;
    ed_totalizador.Value := ed_total_pagar.value;
    // soh aparecer uma forma de pagametno
    cb_forma2.Visible := false;
    ed_forma2.Visible := false;
    //img_forma2.visible := false;
    cb_forma3.Visible := false;
    ed_forma3.Visible := false;
   // img_forma3.visible := false;
    ed_forma2.value := 0;
    ed_forma3.value := 0;

  end
  else
  begin
    // alimentar os valores
    ed_total_pagar.Value := rTotal_Venda;
    ed_totalizador.Value := rTotal_Venda;
    ed_troco.value := 0;
    // soh aparecer uma forma de pagametno
    ed_forma1.value := rTotal_venda;

    cb_forma2.Visible := false;
    ed_forma2.Visible := false;
    //img_forma2.visible := false;
    cb_forma3.Visible := false;
    ed_forma3.Visible := false;
   // img_forma3.visible := false;
    ed_forma2.value := 0;
    ed_forma3.value := 0;
  end;


end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.FecharCupom1Click(Sender: TObject);
begin
  if bVenda then
  begin
    // verificar se o valor da venda eh maior que zero
    if rTotal_Venda <= 0 then
    begin
      Imprime_display('CUPOM EST� ZERADO!', clRed, tiErro);
      SLEEP(1000);
      Imprime_display_anterior;
      EXIT;
    end;


    img_produto.Visible := false;


    // ativar o panel de fechamento
    pn_fechamento.Enabled := true;
//    pn_fechamento.Top := 89;
//    pn_fechamento.Left := 4;
    cb_desc_acre.ItemIndex := 0;
    // alimentar os valores
    ED_DESC_ACRE.Value := 0;
    ed_total_pagar.Value := rTotal_Venda;
    ed_totalizador.Value := rTotal_Venda;
    ed_troco.value := 0;
    ed_forma1.value := rTotal_venda;

    if bLanca_pre_venda then
    begin
      if rPre_venda_desconto > 0 then
      begin
        cb_desc_acre.ItemIndex := 1;
        ED_DESC_ACRE.Value := rPre_venda_desconto;
        ed_total_pagar.Value := rTotal_Venda - ED_DESC_ACRE.value;
        ed_totalizador.value := ed_total_pagar.value;
        ed_troco.value := 0;
        ed_forma1.Value := ed_total_pagar.value;
      end
      else
      begin
        if rpre_venda_acrescimo > 0 then
        begin
          cb_desc_acre.ItemIndex := 3;
          ED_DESC_ACRE.Value := rPre_venda_acrescimo;
          ed_total_pagar.Value := rTotal_Venda + ED_DESC_ACRE.value;
          ed_totalizador.value := ed_total_pagar.value;
          ed_troco.value := 0;
          ed_forma1.Value := ed_total_pagar.value;
        end;
      end;
    end;
    // soh aparecer uma forma de pagametno
    cb_forma1.ItemIndex := 0;
    cb_forma2.Visible := false;
    ed_forma2.Visible := false;
    cb_forma3.Visible := false;
    ed_forma3.Visible := false;

    cb_forma2.itemindex := -1;
    cb_forma3.itemindex := -2;

    ed_forma2.value := 0;
    ed_forma3.value := 0;
    pn_principal.Enabled := false;
    CentralizarPanel(pn_fechamento);
    pn_fechamento.Visible := true;
    ed_desc_acre.DisplayFormat := '##0.00';
    ED_DESC_ACRE.SetFocus;
    // mudar o menu para utilizar as teclas de atalho no fechamento
    FRMVENDA.PopupMenu := pop_fechamento;
  end
  else
  begin
    Imprime_display('N�o h� cupom aberto!', clyellow, tiAlerta);
    sleep(1000);
    Imprime_display_anterior;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_total_pagarEnter(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma1Enter(Sender: TObject);
begin

  Imprime_display('Informe o valor para ' + cb_forma1.text + '...(F11 Retorna)', clwhite, tiPgto);

  if iTeclado_modelo = 1 then
  begin
    blimpa_edit_display := true;
    strpcopy(@men, formatfloat('###,###,##0.00', ed_forma1.value));
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma2Enter(Sender: TObject);
begin
  Imprime_display('Informe o valor para ' + cb_forma2.text + '...(F11 Retorna)', clwhite, tiPgto);

  if iTeclado_modelo = 1 then
  begin
    strpcopy(@men, formatfloat('###,###,##0.00', ed_forma2.value));
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma3Enter(Sender: TObject);
begin
  Imprime_display('Informe o valor para ' + cb_forma3.text + '...(F11 Retorna)', clwhite, tiPgto);

  if iTeclado_modelo = 1 then
  begin
    strpcopy(@men, formatfloat('###,###,##0.00', ed_forma3.value));
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_totalizadorEnter(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_trocoEnter(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_total_pagarExit(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma1Exit(Sender: TObject);
begin
  try
    if ed_forma1.Value > 0 then begin
      if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then begin

        if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
          tBanceira01 := RetBandeira(ed_forma1.Value,tcDebito);
        if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
          tBanceira01 := RetBandeira(ed_forma1.Value, tcCredito);

        if tBanceira01.Numero <= 0 then begin
          ed_forma1.SetFocus;
          Exit;
        end;
      end;
    end;

    // verificar se nao fechou o pn_fechamento para nao dar erro de foco
    if not pn_fechamento.Visible then
      exit;
    if ed_forma1.value >= ed_total_pagar.value then begin
      // forma de pagamento atingiu ou ultrapassou o valor da venda
      // esconder os demais edits de forma de pagamento e focar no bota gravar
      ed_totalizador.value := ed_forma1.value;
      cb_forma2.Visible := false;
      ed_forma2.Visible := false;
      cb_forma3.Visible := false;
      ed_forma3.Visible := false;
      cb_forma2.itemindex := -1;
      cb_forma3.itemindex := -2;
      ed_forma2.value := 0;
      ed_forma3.value := 0;
      ed_troco.value := ed_totalizador.value - ed_total_pagar.value;
      bt_confirmar_fechamento.setfocus;
    end else begin
      ed_totalizador.Value := ed_forma1.value + ed_forma2.value + ed_forma3.value;
      if not cb_forma2.Visible then begin
        cb_forma3.Visible := false;
        ed_forma3.Visible := false;
        cb_forma3.itemindex := -2;
        ed_forma3.value := 0;
        cb_forma2.Visible := true;
        ed_forma2.Visible := true;
        // acrestar um no combo da forma, caso seja a ultima, retorna para a primeira
        if (cb_forma1.ItemIndex = (cb_forma1.Items.Count - 1)) then
          cb_forma2.ItemIndex := 0
        else
          cb_forma2.ItemIndex := cb_forma1.ItemIndex + 1;
        ed_forma2.value := ed_total_pagar.value - ed_totalizador.value;
      end;
      ed_troco.value := ed_totalizador.value - ed_total_pagar.value;
      cb_forma2.SetFocus;
    end;
  finally
    if bVolta_foco then begin
      cb_forma1.SetFocus;
      bVolta_foco := false;
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma2Exit(Sender: TObject);
begin
  try
    if ed_forma2.Value > 0 then begin
      if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then begin

        if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
          tBanceira02 := RetBandeira(ed_forma2.Value,tcDebito);
        if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
          tBanceira02 := RetBandeira(ed_forma2.Value, tcCredito);

        if tBanceira02.Numero <= 0 then begin
          ed_forma2.SetFocus;
          Exit;
        end;
      end;
    end;

    // verificar se nao fechou o pn_fechamento para nao dar erro de foco
    if not pn_fechamento.Visible then exit;
    if (ed_forma1.value + ed_forma2.value) >= ed_total_pagar.value then
    begin
      // forma de pagamento atingiu ou ultrapassou o valor da venda
      // esconder os demais edits de forma de pagamento e focar no bota gravar
      ed_totalizador.value := ed_forma1.value + ed_forma2.value;
      cb_forma3.Visible := false;
      ed_forma3.Visible := false;
      cb_forma3.itemindex := -2;
      ed_forma3.value := 0;
      ed_troco.value := ed_totalizador.value - ed_total_pagar.value;
      bt_confirmar_fechamento.setfocus;
    end
    else
    begin
      ed_totalizador.Value :=
        ed_forma1.value +
        ed_forma2.value +
        ed_forma3.value;

      if not cb_forma3.Visible then
      begin
        cb_forma3.Visible := true;
        ed_forma3.Visible := true;
        // acrestar um no combo da forma, caso seja a ultima, retorna para a primeira
        if (cb_forma2.ItemIndex = (cb_forma2.Items.Count - 1)) then
          cb_forma3.ItemIndex := 0
        else
          cb_forma3.ItemIndex := cb_forma2.ItemIndex + 1;

        ed_forma3.value := ed_total_pagar.value - ed_totalizador.value;
      end;
      ed_troco.value := ed_totalizador.value - ed_total_pagar.value;
      cb_forma3.SetFocus;
    end;
  finally
    if bVolta_foco then
    begin
      cb_forma1.SetFocus;
      bVolta_foco := false;
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma3Exit(Sender: TObject);
begin
  if ed_forma3.Value > 0 then begin
    if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
       (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then begin

        if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
          tBanceira03 := RetBandeira(ed_forma3.Value,tcDebito);
        if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
          tBanceira03 := RetBandeira(ed_forma3.Value, tcCredito);

      if tBanceira03.Numero <= 0 then begin
        ed_forma3.SetFocus;
        Exit;
      end;
    end;
  end;
  ed_totalizador.value := ed_forma1.value + ed_forma2.value + ed_forma3.value;
  ed_troco.Value := ed_totalizador.value - ed_total_pagar.value;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_totalizadorExit(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_trocoExit(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_desc_acreChange(Sender: TObject);
begin
  case cb_desc_acre.ItemIndex of
    0: begin // Desconto por R$
        ed_desc_acre.DisplayFormat := '###,###,##0.00';
        Imprime_display('Informe o valor do Desconto em R$... (F3 Altera)', clwhite, tipgto);
      end;
    1: begin // Desconto por %
        ED_DESC_ACRE.DisplayFormat := '##0.00%';
        Imprime_display('Informe o valor do Desconto em %... (F3 Altera)', clwhite, tipgto);
      end;
    2: begin // Acrescimo por %
        ED_DESC_ACRE.DisplayFormat := '##0.00%';
        Imprime_display('Informe o valor do Acr�scimo em %... (F3 Altera)', clwhite, tipgto);
      end;
    3: begin // Acrescimo por R$
        ed_desc_acre.DisplayFormat := '###,###,##0.00';
        Imprime_display('Informe o valor do Acr�scimo em R$... (F3 Altera)', clwhite, tipgto);
      end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.DescontoouAcrscimo1Click(Sender: TObject);
begin
  if bAltera_tipo_desconto then begin
    if cb_desc_acre.ItemIndex = 3 then
      cb_desc_acre.ItemIndex := 0
    else
      cb_desc_acre.ItemIndex := cb_desc_acre.ItemIndex + 1;
    cb_desc_acreChange(FRMVENDA);
    ED_DESC_ACRE.SelectAll;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ED_DESC_ACREKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    cb_forma1.setfocus
  else begin
    if iTeclado_Modelo = 1 then begin
      if blimpa_edit_display then begin
        CarRet;
        strpcopy(@men, '                       ');
        DispStr(@men);
        CarRet;
        bLimpa_edit_display := false;
      end;
      strpcopy(@men, key);
      DispStr(@men);
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then ed_forma1.setfocus;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then ed_forma2.setfocus;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then ed_forma3.setfocus;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma2Exit(Sender: TObject);
begin
  try

  // verificar se nao fechou o pn_fechamento para nao dar erro de foco
    if not pn_fechamento.Visible then exit;

    if (cb_forma2.ItemIndex = cb_forma1.ItemIndex) or
      (cb_forma2.ItemIndex = cb_forma3.ItemIndex) then
    begin
      cb_forma2.SetFocus;
      Imprime_display('Meio de Pagamento j� utilizado!', clred, tierro);
      sleep(1000);
      Imprime_display_anterior;
      abort;
    end;
  finally
    if bVolta_foco then
    begin
      ed_forma1.SetFocus;
      bVolta_foco := false;
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma3Exit(Sender: TObject);
begin
  try // verificar se nao fechou o pn_fechamento para nao dar erro de foco
    if not pn_fechamento.Visible then exit;

    if (cb_forma3.ItemIndex = cb_forma1.ItemIndex) or
      (cb_forma2.ItemIndex = cb_forma3.ItemIndex) then
    begin
      cb_forma3.SetFocus;
      Imprime_display('Meio de Pagamento j� utilizado!', clred, tierro);
      sleep(1000);
      Imprime_display_anterior;
      abort;
    end;
  finally
    if bVolta_foco then
    begin
      ed_forma2.SetFocus;
      bVolta_foco := false;
    end;
  end;

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then bt_confirmar_fechamento.SetFocus
  else
  begin
    if iTeclado_Modelo = 1 then
    begin
      strpcopy(@men, key);
      DispStr(@men);
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.bt_confirmar_fechamentoEnter(Sender: TObject);
begin
  if ed_troco.value > 0 then
    Imprime_display('Troco: R$ ' + formatfloat('###,###,##0.00', ed_troco.value) +
      '  - [ENTER] Confirmar', clwhite, tiPgto)
  else
    Imprime_display('[ENTER] Confirma o fechamento...', clwhite, tiPgto);
end;

procedure TfrmVenda.bt_confirmar_fechamentoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 27) then
    bt_cancelar_fechamento.Click;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.bt_cancelar_fechamentoEnter(Sender: TObject);
begin
  Imprime_display('[ENTER] Cancela o fechamento...', clwhite, tiErro);
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.bt_confirmar_fechamentoClick(Sender: TObject);
var
  rValor_Temp: real;
  i, icont: integer;
  rvalor_total_convenio: real;
  NomeArquivo, sCod_Cupom: string;
  bLanca_comprovante_crediario,
    bLanca_Comprovante_Prestacao: boolean;
  sCOO_crediario, sGNF_Crediario: string;
  sCOO_Prestacao, sGNF_Prestacao, sGRG_Prestacao: string;
  sIdentificarVendedor: string;

  str: string;
  SR: TSearchRec;
  Origem, Destino: string;

begin
  bt_confirmar_fechamento.Enabled := False;
  sMensagem_Cupom.Lines.Clear;
  bfinalizado := false;
  try
    if ed_troco.Value < 0 then
    begin
      Imprime_display('Troco n�o pode ser negativo!', clred, tiErro);
      sleep(1500);
      Imprime_display_anterior;
      bt_confirmar_fechamento.Enabled := true;
      bt_confirmar_fechamento.SetFocus;
      exit;
    end;

    if (ed_forma1.value < 0) or
      (ed_forma2.value < 0) or
      (ed_forma3.value < 0)
      then
    begin
      Imprime_display('Pagamento n�o pode ser negativo!', clred, tiErro);
      sleep(1500);
      Imprime_display_anterior;
      bt_confirmar_fechamento.Enabled := true;
      bt_confirmar_fechamento.SetFocus;
      exit;
    end;


    if (ED_DESC_ACRE.Value < 0) or
      (ed_total_pagar.Value < 0) or
      (ed_totalizador.Value < 0) then
    begin
      Imprime_display('Existe valor negativo!', clred, tiErro);
      sleep(1500);
      Imprime_display_anterior;
      bt_confirmar_fechamento.Enabled := true;
      bt_confirmar_fechamento.SetFocus;
      exit;
    end;


    bt_confirmar_fechamento.Enabled := false;
    bTef_finaliza := false;


    begin

    end;

    // Verificar se o total lancado nas formas de pagamento � maior ou igual ao total da venda
    if ed_totalizador.value < ed_total_pagar.value then
    begin
      Imprime_display('Valor lan�ado � inferior ao total do cupom!', clred, tiErro);
      sleep(1500);
      Imprime_display_anterior;
      bt_confirmar_fechamento.Enabled := true;
      bt_confirmar_fechamento.SetFocus;
      exit;
    end;

    // Verificar se o valor lancado nas formas de pagamento de Cartao n�o ultrapassa o valor
    // do cupom
    rValor_Total_Cartao := 0;
    icont := 0;
    if ed_forma1.value > 0 then begin
      if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
      begin
        rValor_Total_Cartao := rValor_Total_Cartao + ed_forma1.Value;
        inc(icont);
      end;
    end;
    if ed_forma2.value > 0 then
    begin
      if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
      begin
        rValor_Total_Cartao := rValor_Total_Cartao + ed_forma2.Value;
        inc(icont);
      end;
    end;
    if ed_forma3.value > 0 then
    begin
      if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
      begin
        rValor_Total_Cartao := rValor_Total_Cartao + ed_forma3.Value;
        inc(icont);
      end;
    end;
    // verificar se o pagamento est� sendo feito com m�ltiplos cart�es pelo TEF
    if (icont > 1) and (bTef) then
    begin
      application.messagebox('O sistema n�o permite pagamento com m�ltiplos cart�es pelo TEF!',
        'Erro', mb_ok + mb_iconerror);
      bt_confirmar_fechamento.Enabled := true;
      bt_confirmar_fechamento.SetFocus;
      exit;
    end;


    if rValor_Total_Cartao > (ed_total_pagar.value + 0.0001) then
    begin
      Imprime_display('Valor em Cart�o maior que o cupom!', clred, tiErro);
      sleep(1500);
      Imprime_display_anterior;
      bt_confirmar_fechamento.Enabled := true;
      bt_confirmar_fechamento.SetFocus;
      exit;
    end;


    if btef then
    begin
      bContinua := true;
      // rodar as formas de pagamento para verificar se eh cartao
      if (ed_forma1.value > 0) and
        (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
        (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
      begin
        if ed_forma2.Value > 0 then
        begin
          Application.MessageBox('Favor informar a forma de pagamento Cart�o ou Cheque (Consultado) por �ltimo!', 'Erro',
            MB_OK + mb_iconerror);
          bContinua := false;
        end;
      end
      else
      begin
        if (ed_forma2.value > 0) and
          (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
          (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
        begin
          if (ed_forma3.value > 0) then
          begin
            Application.MessageBox('Favor informar a forma de pagamento Cart�o ou Cheque (Consultado) por �ltimo!', 'Erro',
              MB_OK + mb_iconerror);
            bContinua := false;
          end;
        end;
      end;

      if not bcontinua then exit;
    end;

    // verificar se tem lancamento para cheque...
    rValor_Total_cheque := 0;
    if ed_forma1.value > 0 then
    begin
      if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
      begin
        rValor_Total_cheque := rValor_Total_cheque + ed_forma1.Value;
      end;
    end;
    if ed_forma2.value > 0 then
    begin
      if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
      begin
        rValor_Total_cheque := rValor_Total_cheque + ed_forma2.Value;
      end;
    end;
    if ed_forma3.value > 0 then
    begin
      if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
         (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then
      begin
        rValor_Total_cheque := rValor_Total_cheque + ed_forma3.Value;
      end;
    end;
    // verificar se o cheque serah consultado pelo tef e se existe venda no cartao conjugado
    if bTEF then
    begin
      bTEF_Cheque := false;
      if rvalor_total_cheque > 0 then
      begin
        if application.MessageBox('O cheque ser� consultado via TEF?', 'Mensagem TEF', mb_yesno +
          MB_ICONQUESTION) = idYes then
        begin
          if rValor_Total_Cartao > 0 then
          begin
            if application.MessageBox('O sistema n�o permite utilizar duas formas' +
              ' de pagamento por TEF! Deseja prosseguir apenas com o cart�o?',
              'Aten��o', mb_yesno + mb_iconwarning) = idNo then
            begin
              bt_confirmar_fechamento.Enabled := true;
              bt_confirmar_fechamento.SetFocus;
              exit;
            end
            else
              bTef_cheque := false;
          end
          else
            bTEF_Cheque := true;
        end
        else
          bTEF_Cheque := false;
      end;
    end;

    // verificar se tem lancamento para crediario
    rValor_Total_crediario := 0;
    if ed_forma1.value > 0 then
    begin
      if AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Crediario) then
      begin
        rValor_Total_crediario := rValor_Total_crediario + ed_forma1.Value;
        sCrediario_Nome := cb_forma1.text;
      end;
    end;
    if ed_forma2.value > 0 then
    begin
      if AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Crediario) then
      begin
        rValor_Total_crediario := rValor_Total_crediario + ed_forma2.Value;
        sCrediario_Nome := cb_forma2.text;
      end;
    end;
    if ed_forma3.value > 0 then
    begin
      if AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Crediario) then
      begin
        rValor_Total_crediario := rValor_Total_crediario + ed_forma3.Value;
        sCrediario_Nome := cb_forma3.text;
      end;
    end;
    // SADRAQUE: Identifica��o do Vendedor, caso o parametro para identifica��o
    // esteja habilidade no programa

    if bIdentificarVendedor = 2 then begin
      Application.CreateForm(TFrmVendedor, FrmVendedor);
      try
        if FrmVendedor.ShowModal = mrOk then begin
          iVendedorCodigo := StrToInt(frmModulo.Query.FieldByName('CODIGO').AsString);
          sVendedorNome := frmModulo.Query.FieldByName('NOME').AsString;
        end else begin
          bt_confirmar_fechamento.enabled := True;
          bt_confirmar_fechamento.setfocus;
          exit;
        end
      finally
        FreeAndNil(FrmVendedor);
      end;
    end;


    // identificacao do Consumidor


    sCli_Nome := ''; sCli_Endereco := ''; sCli_CPF := ''; sCli_Cidade := '';
    sCli_Placa := ''; sCli_Km := ''; sCli_cep := ''; sCli_uf := ''; sCli_codigo := '';

    if (bCadastra_Crediario) and (rvalor_total_crediario > 0) then
    begin
      // abrir tela de lancamento de cliente e de crediario
      bcontinua := false;

      frmvenda_crediario := tfrmvenda_crediario.Create(self);
      if sConsumidor_CPF <> '' then
        frmVenda_Crediario.ed_cred_cliente.Text := sConsumidor_CPF;
      frmvenda_crediario.ShowModal;


      if not bcontinua then
      begin
        bt_confirmar_fechamento.enabled := true;
        bt_confirmar_fechamento.setfocus;
        exit;
      end;
    end
    else
    begin
       // abrir tela simples de identificacao de Cliente
      bContinua := false;
      frmconsumidor := tfrmconsumidor.create(self);

      if sConsumidor_CPF <> '' then
      begin
        frmConsumidor.ed_consumid_cpf.Text := sConsumidor_CPF;
        if sConsumidor_Nome = '' then
        begin
          sConsumidor_Nome := 'CONSUMIDOR FINAL';
          sCli_Nome := 'CONSUMIDOR FINAL';
        end;

        frmConsumidor.ed_consumid_nome.Text := sConsumidor_Nome;
        frmConsumidor.ed_consumid_endereco.Text := sConsumidor_Endereco;
      end
      else
      begin
        sConsumidor_Nome := 'CONSUMIDOR FINAL';
        sCli_Nome := 'CONSUMIDOR FINAL';
        sCli_codigo := '000001';
      end;

      try
        if not bIdentifica_consumidor and (frmPrincipal.TipoImpressora = Fiscal) then
        begin
          frmconsumidor.showmodal;
        end
        else
          bcontinua := True;

      finally
        FreeAndNil(frmconsumidor);
      end;

      if not bcontinua then
      begin
        bt_confirmar_fechamento.enabled := true;
        bt_confirmar_fechamento.setfocus;
        exit;
      end;
    end;

    application.ProcessMessages;

    // verificar se tem lancamento para convenio
    rValor_Total_convenio := 0;
    if ed_forma1.value > 0 then
    begin
      if AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Convenio) then
      begin
        rValor_Total_convenio := rValor_Total_convenio + ed_forma1.Value;
      end;
    end;
    if ed_forma2.value > 0 then
    begin
      if AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Convenio) then
      begin
        rValor_Total_convenio := rValor_Total_convenio + ed_forma2.Value;
      end;
    end;
    if ed_forma3.value > 0 then
    begin
      if AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Convenio) then
      begin
        rValor_Total_convenio := rValor_Total_convenio + ed_forma3.Value;
      end;
    end;

    if ed_forma1.value > 0 then begin
      if (ed_forma1.value > 0) and
        (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
        (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then begin
          frmPrincipal.TipoImpressora := SemImpressora;
          CorEditTotaL;
        end;
    end;
    if ed_forma2.value > 0 then begin
      if (ed_forma2.value > 0) and
        (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
        (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then begin
          frmPrincipal.TipoImpressora := SemImpressora;
          CorEditTotaL;
        end;
    end;
    if ed_forma3.value > 0 then begin
      if (ed_forma3.value > 0) and
        (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
        (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo)) then begin
          frmPrincipal.TipoImpressora := SemImpressora;
          CorEditTotaL;
        end;
    end;

    (*************** F E C H A M E N T O   D O   C U P O M ********************)
    //---> IN�CIO

    //-----> TOTALIZAR O CUPOM (lancar o desconto e acrescimo e fechar total do cupom);

    if not bTotalizado then
    begin

      // Abrir a gaveta...
      AcionaGaveta1.Click;


      {Desconto - %:
       Desconto - R$:
       Acr�scimo - %:
       Acr�scimo - R$:
      }

      if frmPrincipal.TipoImpressora = Fiscal then
      begin
        repeat
          case cb_desc_acre.ItemIndex of
            0: sMsg := cECF_Inicia_Fechamento(iECF_Modelo, 'D', '$', ED_DESC_ACRE.value);
            1: sMsg := cECF_Inicia_Fechamento(iECF_Modelo, 'D', '%', ED_DESC_ACRE.value);
            2: sMsg := cECF_Inicia_Fechamento(iECF_Modelo, 'A', '%', ED_DESC_ACRE.value);
            3: sMsg := cECF_Inicia_Fechamento(iECF_Modelo, 'A', '$', ED_DESC_ACRE.value);
          end;

          if sMsg = OK then
          begin
            bTotalizado := true;
            frmModulo.spCupom_Temp_Edit.Close;
            frmModulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring := 'TOTALIZADO';
            frmModulo.spCupom_Temp_Edit.Prepare;
            frmModulo.spCupom_Temp_Edit.execute;
          end
          else
          begin
            if application.messagebox
              (pwidechar('Erro no ECF!' + #13 + 'Mensagem: ' + sMsg + #13 +
              'Deseja tentar outra vez?'), 'Erro', mb_yesno + MB_ICONERROR) = idno
            then
            begin
              break;
            end;
          end;
        until sMsg = OK;

      end
      else // Se nao for fiscal ou sem impressora
      begin
        bTotalizado := true;
        frmModulo.spCupom_Temp_Edit.Close;
        frmModulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring := 'TOTALIZADO';
        frmModulo.spCupom_Temp_Edit.Prepare;
        frmModulo.spCupom_Temp_Edit.execute;

        case cb_desc_acre.ItemIndex of
          0: sMsg := cECF_Inicia_Fechamento(iECF_Modelo, 'D', '$', ED_DESC_ACRE.value);
          1: sMsg := Imp_Inicia_Fechamento(sPortaNaoFiscal, 'D', '%', ED_DESC_ACRE.value);
          2: sMsg := Imp_Inicia_Fechamento(sPortaNaoFiscal, 'A', '%', ED_DESC_ACRE.value);
          3: sMsg := Imp_Inicia_Fechamento(sPortaNaoFiscal, 'A', '$', ED_DESC_ACRE.value);
        end;

      end;



      if sMsg <> OK then
      begin
        Imprime_display(sMsg, clRed, tiErro);
        bt_confirmar_fechamento.enabled := true;
        bt_confirmar_fechamento.SetFocus;
        exit;
      end;
    // habilitar o panel para focar no grid apos a sua atualizacao para ele posicionar na
    // ultima linha registrada
      pn_principal.ENABLED := TRUE;

      Imprime_display('Iniciando o fechamento do Cupom...', clwhite, tiInfo);
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring :=
        '--------------------------------------------------------';
      try
        // verificar se possue desconto ou acrescimo
        if ed_desc_acre.Value > 0 then
        begin
          grid.AddRow(1);
          grid.cell[0, grid.LastAddedRow].asstring := '</i><b>TOTAL DOS PRODUTOS R$' +
            '                        ' +
            texto_justifica(
            formatfloat('###,###,##0.00', rTotal_Venda),
            10, ' ', taDireita) + '</b>';
          case cb_desc_acre.ItemIndex of
            0: begin // Desconto por R$
                rValor_temp := ed_desc_acre.value;
                  // registrar o desconto em vermelho no grid
                grid.AddRow(1);
                grid.cell[0, grid.LastAddedRow].asstring := '</b></i><FONT color="#FF0000">' +
                  'DESCONTO R$' +
                  '                                  ' +
                  texto_justifica(
                  formatfloat('###,###,##0.00',
                  -rvalor_temp),
                  10, ' ', taDireita) + '</FONT></b></i>';
              end;
            1: begin // Desconto por %
                rValor_Temp := (rTotal_Venda * (ed_desc_acre.value / 100));
                  // registrar o desconto em vermelho no grid
                grid.AddRow(1);
                grid.cell[0, grid.LastAddedRow].asstring := '</b></i><FONT color="#FF0000">' +
                  'DESCONTO R$' +
                  '                                  ' +
                  texto_justifica(
                  formatfloat('###,###,##0.00',
                  -rvalor_temp),
                  10, ' ', taDireita) + '</FONT></b></i>';
              end;

            2: begin // Acrescimo por %
                rValor_temp := (rTotal_Venda * (ed_desc_acre.value / 100));
                  // registrar o acrescimo em  no grid
                grid.AddRow(1);
                grid.cell[0, grid.LastAddedRow].asstring := '</b></i>' +
                  'ACR�SCIMO R$' +
                  '                                 ' +
                  texto_justifica(
                  formatfloat('###,###,##0.00',
                  rvalor_temp),
                  10, ' ', taDireita) + '</b></i>';
              end;
            3: begin // Acrescimo por R$
                rValor_temp := ed_desc_acre.value;
                  // registrar o acrescimo em  no grid
                grid.AddRow(1);
                grid.cell[0, grid.LastAddedRow].asstring := '</b></i>' +
                  'ACR�SCIMO R$' +
                  '                                 ' +
                  texto_justifica(
                  formatfloat('###,###,##0.00',
                  rvalor_temp),
                  10, ' ', taDireita) + '</b></i>';
              end;
          end;
          grid.AddRow(1);
          grid.cell[0, grid.LastAddedRow].asstring :=
            '                                        ----------------';
        end;
        grid.AddRow(1);
        grid.cell[0, grid.LastAddedRow].asstring := '<b></i>T O T A L   D O   C U P O M   R$' +
          '             ' +
          texto_justifica(
          formatfloat('###,###,##0.00',
          ed_total_pagar.value),
          10, ' ', taDireita) + '</b>';
        grid.SelectLastRow;
        try
          grid.SetFocus;
        except
        end;
        Application.ProcessMessages;
        // mudar o status da variavel para nao permitir nova totalizacao para este cupom
        bTotalizado := true;
        frmModulo.spCupom_Temp_Edit.Close;
        frmModulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring := 'TOTALIZADO';
        frmModulo.spCupom_Temp_Edit.Prepare;
        frmModulo.spCupom_Temp_Edit.execute;

      except
        // funcao gerou erro, nao mudar o status da variavel de totalizacao
        bTotalizado := false;
      end;
    end; // j� totalizado

    // zerar variaveis de verificao de formas de pagamento
    bVenda_cheque := false;
    bVenda_Cartao := false;
    bVenda_Crediario := false;


    // verificar se a forma1 jah foi lancado no ecf
    if not bPago1 then
    begin
      // Lancar os meios de pagamento
      // registrar Meio de Pagamento N� 1
      if ed_forma1.value > 0 then
      begin
         // TEF
        if btef then
        begin
           // rodar as formas de pagamento para verificar se eh cartao
          if (ed_forma1.value > 0) and
            ((AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) or
             (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito))) then
          begin
             // armazenar o nome da forma de pagamento para CNFV
            sForma_Temp := cb_forma1.Text;
            Imprime_display('TEF', CLWHITE, tiPgto);
            if not TEF_Pagamento(Tef_Venda_Cartao) then
            begin
              application.messagebox
                (pwidechar
                ('N�o foi poss�vel prosseguir com a venda no cart�o!' + #13 +
                'Favor tentar outra vez ou utilizar outra' +
                ' forma de pagamento!'), 'Mensagem TEF',
                mb_ok + MB_ICONERROR);
              bt_confirmar_fechamento.Enabled := true;
              bt_confirmar_fechamento.setfocus;
              exit;
            end
            else
            begin
              bTef_finaliza := true;
            end;
          end;
           // verificar se vai consultar o cheque pelo tef
          if bTEF_Cheque then
          begin

             // rodar as formas de pagamento para verificar se eh cheque
            if (ed_forma1.value > 0) and
              ((AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
              (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Aprazo))) then
            begin
              Imprime_display('TEF', CLWHITE, tiPgto);
               // armazenar o nome da forma de pagamento para CNFV
              sForma_Temp := cb_forma1.Text;

              if not TEF_Pagamento(Tef_Venda_Cheque) then
              begin
                application.messagebox
                  (pwidechar
                  ('N�o foi poss�vel prosseguir com a venda no cart�o!' + #13
                  + 'Favor tentar outra vez ou utilizar outra' +
                  ' forma de pagamento!'), 'Mensagem TEF',
                  mb_ok + MB_ICONERROR);
                bt_confirmar_fechamento.Enabled := true;
                bt_confirmar_fechamento.setfocus;
                exit;
              end
              else
              begin
                bTef_finaliza := true;
              end;
            end;
          end;
        end; // final do tef

          // enviar para o ecf
        repeat
          if frmPrincipal.TipoImpressora = Fiscal then
            sMsg := cECF_Forma_Pgto(iECF_Modelo, cb_forma1.Text, ed_forma1.Value)
          else
            sMsg := Imp_Forma_Pgto(sPortaNaoFiscal, cb_forma1.Text, ed_forma1.Value);

          if sMsg = OK then
          begin
            grid.AddRow(1);
            grid.cell[0, grid.LastAddedRow].asstring := '</b></i>' + texto_justifica(
              ansiuppercase(cb_forma1.Text),
              45, ' ', taEsquerda) + texto_justifica(
              formatfloat('###,###,##0.00', ed_forma1.Value),
              10, ' ', taDireita) + '</b></i>';
            grid.SelectLastRow;

            try
              grid.SetFocus;
            except
            end;
            bPago1 := true;
            frmModulo.spCupom_Temp_Edit.Close;
            frmModulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring := 'PAGO1';
            frmModulo.spCupom_Temp_Edit.Prepare;
            frmModulo.spCupom_Temp_Edit.execute;


            Application.ProcessMessages;
          end
          else
          begin
            BlockInput(false);
            if application.messagebox
              (pwidechar('Erro ao lan�ar o ' + cb_forma1.text + '!' + #13 +
              'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'), 'Erro',
              mb_yesno + MB_ICONERROR) = idno then
            begin
              // BlockInput(true);
              if bTEF and bTef_finaliza then
              begin
                    // TEF apresentou erro
                Imprime_display('Cancelando TEF', clred, tiErro);
                TEFVerificaGerenciadorAtivo;
                TEFNaoConfirmaOperacao;
                TEFVerificaArquivosPendentes;
                TEFVerificaOperacaoPendente;
              end;
              break;
            end;
          end;
        until sMsg = OK;
      end;

      if sMsg <> OK then
      begin
        Imprime_display(sMsg, clred, tiErro);
        bt_confirmar_fechamento.Enabled := true;
        bt_confirmar_fechamento.SetFocus;
        exit;
      end;
    end;

    // verificar se a forma1 jah foi lancado no ecf
    if not bPago2 then begin
         // TEF
      if btef then begin
           // rodar as formas de pagamento para verificar se eh cartao
        if (ed_forma2.value > 0) and
          ((AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) or
          (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito))) then
        begin
          Imprime_display('TEF', CLWHITE, tiPgto);
             // armazenar o nome da forma de pagamento para CNFV
          sForma_Temp := cb_forma2.Text;

          if not TEF_Pagamento(Tef_Venda_Cartao) then
          begin
            BlockInput(false);
            application.messagebox
              (pwidechar('N�o foi poss�vel prosseguir com a venda no cart�o!'
              + #13 + 'Favor tentar outra vez ou utilizar outra' +
              ' forma de pagamento!'), 'Mensagem TEF', mb_ok + MB_ICONERROR);
            bt_confirmar_fechamento.Enabled := true;
            bt_confirmar_fechamento.setfocus;
            exit;
          end
          else
          begin
            bTef_finaliza := true;
          end;
        end;
           // verificar se vai consultar o cheque pelo tef

        if bTEF_Cheque then
        begin
             // rodar as formas de pagamento para verificar se eh cheque
          if (ed_forma2.value > 0) and
            ((AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
            (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista))) then
          begin
            Imprime_display('TEF', CLWHITE, tiPgto);
               // armazenar o nome da forma de pagamento para CNFV
            sForma_Temp := cb_forma2.Text;
            if not TEF_Pagamento(Tef_Venda_Cheque) then
            begin
             BlockInput(false);
              application.messagebox
                (pwidechar
                ('N�o foi poss�vel prosseguir com a venda no cheque!' + #13 +
                'Favor tentar outra vez ou utilizar outra' +
                ' forma de pagamento!'), 'Mensagem TEF',
                mb_ok + MB_ICONERROR);
              bt_confirmar_fechamento.Enabled := true;
              bt_confirmar_fechamento.setfocus;
              exit;
            end
            else
            begin
              bTef_finaliza := true;
            end;
          end;
        end;
      end; // final do tef


      //BlockInput(true);
     // Lancar os meios de pagamento
      // registrar Meio de Pagamento N� 2
      if ed_forma2.value > 0 then
      begin
         // enviar para o ecf
        repeat
          if frmPrincipal.TipoImpressora = fiscal then
            sMsg := cECF_Forma_Pgto(iECF_Modelo, cb_forma2.Text, ed_forma2.Value)
          else
            sMsg := Imp_Forma_Pgto(sPortaNaoFiscal, cb_forma2.Text, ed_forma2.Value);

          if sMsg = OK then
          begin
            grid.AddRow(1);
            grid.cell[0, grid.LastAddedRow].asstring := '</b></i>' + texto_justifica(
              ansiuppercase(cb_forma2.Text),
              45, ' ', taEsquerda) + texto_justifica(
              formatfloat('###,###,##0.00',
              ed_forma2.Value),
              10, ' ', taDireita) + '</b></i>';
            grid.SelectLastRow;

            try
              grid.SetFocus;
            except
            end;
            bPago2 := true;
            frmModulo.spCupom_Temp_Edit.Close;
            frmModulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring := 'TOTALIZADO';
            frmModulo.spCupom_Temp_Edit.Prepare;
            frmModulo.spCupom_Temp_Edit.execute;

            Application.ProcessMessages;
          end
          else
          begin
            BlockInput(false);
            if application.messagebox
              (pwidechar('Erro ao lan�ar o ' + cb_forma2.text + '!' + #13 +
              'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'), 'Erro',
              mb_yesno + MB_ICONERROR) = idno then
            begin
              break;
            end;
          end;
        until sMsg = ok;
      end;



      //BlockInput(true);
      if sMsg <> OK then
      begin
        Imprime_display(sMsg, clred, tiErro);
        bt_confirmar_fechamento.Enabled := true;
        bt_confirmar_fechamento.SetFocus;
        exit;
      end;
    end;

    // verificar se a forma1 jah foi lancado no ecf
    if not bPago3 then
    begin
         // TEF
      if btef then
      begin
           // rodar as formas de pagamento para verificar se eh cartao

        if (ed_forma3.value > 0) and
          ((AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) or
          (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito))) then
        begin
          Imprime_display('TEF', CLWHITE, tiPgto);
             // armazenar o nome da forma de pagamento para CNFV
          sForma_Temp := cb_forma3.Text;

          if not TEF_Pagamento(Tef_Venda_Cartao) then
          begin
            BlockInput(false);
            application.messagebox
              (pwidechar('N�o foi poss�vel prosseguir com a venda no cart�o!'
              + #13 + 'Favor tentar outra vez ou utilizar outra' +
              ' forma de pagamento!'), 'Mensagem TEF', mb_ok + MB_ICONERROR);
            bt_confirmar_fechamento.Enabled := true;
            bt_confirmar_fechamento.setfocus;
            exit;
          end
          else
          begin
            bTef_finaliza := true;
          end;
        end;

           //BlockInput(true);
           // verificar se vai consultar o cheque pelo tef
        if bTEF_Cheque then
        begin

             // rodar as formas de pagamento para verificar se eh cheque
          if (ed_forma3.value > 0) and
            ((AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
            (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista))) then
          begin
            Imprime_display('TEF', CLWHITE, tiPgto);
               // armazenar o nome da forma de pagamento para CNFV
            sForma_Temp := cb_forma3.Text;
            if not TEF_Pagamento(Tef_Venda_Cheque) then
            begin
              BlockInput(false);
              application.messagebox
                (pwidechar
                ('N�o foi poss�vel prosseguir com a venda no cart�o!' + #13 +
                'Favor tentar outra vez ou utilizar outra' +
                ' forma de pagamento!'), 'Mensagem TEF',
                mb_ok + MB_ICONERROR);
              bt_confirmar_fechamento.Enabled := true;
              bt_confirmar_fechamento.setfocus;
              exit;
            end
            else
            begin
              bTef_finaliza := true;
            end;
          end;
        end;
      end; // final do tef



      //BlockInput(true);



      // Lancar os meios de pagamento
      // registrar Meio de Pagamento N� 3
      if ed_forma3.value > 0 then
      begin
         // enviar para o ecf
        repeat
          if frmPrincipal.TipoImpressora = Fiscal then
            sMsg := cECF_Forma_Pgto(iECF_Modelo, cb_forma3.Text, ed_forma3.Value)
          else
            sMsg := Imp_Forma_Pgto(sPortaNaoFiscal, cb_forma3.Text, ed_forma3.Value);

          if sMsg = OK then
          begin
            grid.AddRow(1);
            grid.cell[0, grid.LastAddedRow].asstring := '</b></i>' + texto_justifica(
              ansiuppercase(cb_forma3.Text),
              45, ' ', taEsquerda) + texto_justifica(
              formatfloat('###,###,##0.00', ed_forma3.Value),
              10, ' ', taDireita) + '</b></i>';
            grid.SelectLastRow;

            try
              grid.SetFocus;
            except
            end;
            bPago3 := true;
            frmModulo.spCupom_Temp_Edit.Close;
            frmModulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring := 'PAGO3';
            frmModulo.spCupom_Temp_Edit.Prepare;
            frmModulo.spCupom_Temp_Edit.execute;

            Application.ProcessMessages;
          end
          else
          begin
            BlockInput(false);
            if application.messagebox
              (pwidechar('Erro ao lan�ar o ' + cb_forma3.text + '!' + #13 +
              'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'), 'Erro',
              mb_yesno + MB_ICONERROR) = idno then
            begin
              break;
            end;
          end;
        until sMsg = ok;
      end;

      if sMsg <> OK then
      begin
        Imprime_display(sMsg, clred, tiErro);
        bt_confirmar_fechamento.Enabled := true;
        bt_confirmar_fechamento.SetFocus;
        exit;
      end;
    end;

    //BlockInput(true);

    // TROCO
    if ed_troco.Value > 0 then
    begin
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring := '</b></i><FONT color="#FF0000">' +
        'T R O C O   R$                               ' +
        texto_justifica(
        formatfloat('###,###,##0.00', ed_troco.Value),
        10, ' ', taDireita) + '</b></i></FONT>';

      grid.SelectLastRow;
      try
        grid.SetFocus;
      except
      end;
      Application.ProcessMessages;
    end;

    //if bMensagem_Cupom then
      // MessagemAdcionalCupom(sMensagem_Cupom);;


    // GUIO: Caso haja a identifica��o do vendedor, uma string com os dados
    // ser� montada para ser impressa no cupom fiscal
    if bIdentificarVendedor > 0 then
      sIdentificarVendedor := 'Vendedor ' + texto_justifica(FormatFloat('000', iVendedorCodigo) + ' - ' + sVendedorNome, 37, ' ', taEsquerda)
        + #10
    else
      sIdentificarVendedor := '';

    if frmPrincipal.TipoImpressora = SemImpressora then begin
      try
        Imprime_display('AGUARDE...  PREPARANDO NFC-E',
          CLWHITE, tiLivre);
        grid.Repaint;

        PrepararNFCE;
        Imprime_display('AGUARDE...  GRAVANDO NFC-E NO BANCO',
          CLWHITE, tiLivre);
        grid.Repaint;
        if nfce_autorizada then
        begin
          // lancar nfce no banco de dados do servidor
          vgerado_nfce := 'S';

          with frmmodulo do
          begin
//            NomeArquivo := ACBRNFCe.NotasFiscais.
            NomeArquivo := ACBRNFCe.Configuracoes.Arquivos.PathNFe;
            if ACBRNFCe.Configuracoes.Arquivos.SepararPorCNPJ then
              NomeArquivo := NomeArquivo + '\' + edtEmitCNPJ;
            if ACBRNFCe.Configuracoes.Arquivos.SepararPorModelo then
              NomeArquivo := NomeArquivo + '\NFCe';
            if ACBRNFCe.Configuracoes.Arquivos.SepararPorMes then
              NomeArquivo := NomeArquivo + '\' + FormatDateTime('YYYYMM',Date);
            if ACBRNFCe.Configuracoes.Arquivos.AdicionarLiteral then
              NomeArquivo := NomeArquivo + '\NFCe';
            NomeArquivo := NomeArquivo + '\' + copy(ChaveNFCE, 4, 47) + '-nfe.xml';

            qrNFCEInsert.Open;
            qrNFCEInsert.Insert;
            qrNFCEInsertNUMERO.asinteger := NumeroNFCe;
            qrNFCEInsertDATA.AsDateTime := Date;
            qrNFCEInsertHORA.AsString := FormatDateTime('HH:MM:SS',Time);
            qrNFCEInsertTOTAL.AsFloat := ed_total_pagar.value;
            qrNFCEInsertCLIENTE.AsString := sCli_Nome;
            qrNFCEInsertCHAVE.AsString := copy(ChaveNFCE, 4, 47);
            qrNFCEInsertXML.asstring := NomeArquivo;
            qrNFCEInsertSITUACAO.AsInteger := 0;
            qrNFCEInsertTROCO.AsFloat := ed_troco.value;
            if frmModulo.ACBRNFCe.Configuracoes.Geral.FormaEmissao = frmtOffLine then begin
              vcontingencia := 'S';
              qrNFCEInsertCONTINGENCIA.AsString := 'S';
              qrNFCEInsertMOTIVOCONTIGENCIA.AsString := MotivoContigencia;
            end else begin
              vcontingencia := 'N';
              qrNFCEInsertCONTINGENCIA.AsString := 'N';
              qrNFCEInsertMOTIVOCONTIGENCIA.AsString := '';
            end;
            qrNFCEInsertENVIADOCONTINGENCIA.AsString := 'N';
            qrNFCEInsertXMLENVIO.LoadFromFile(NomeArquivo);
            qrNFCEInsertXMLCACNELAMENTO.Clear;
            qrNFCEInsert.Post;
            qrNFCEInsert.ApplyUpdates;
            Conexao_Servidor.AutoCommit := false;
            Conexao_Servidor.Commit;
          end;

        end ELSE BEGIN
          Imprime_display('ERRO ' + frmmodulo.ACBRNFCe.WebServices.Enviar.xMotivo,CLWHITE, tiLivre);
          exit;
        END;

      Except
        on e: exception do
        begin
          Imprime_display('ERRO NFCE: ' + e.Message, CLWHITE, tiLivre);
          bt_confirmar_fechamento.Enabled := true;
          bt_confirmar_fechamento.SetFocus;
          exit;
        end;
      end;
    end else begin
      vgerado_nfce := 'N';
      vcontingencia := 'N';
    end;
    // identificacao do consumidor no cupom
    if sCli_nome <> '' then
    begin
      repeat
        if sConsumidor_CPF = '' then
        begin
          if not bCadastra_Placa then
          begin

            if frmPrincipal.TipoImpressora = Fiscal then
              sMsg := cECF_Termina_Fechamento(iECF_Modelo, sPAF_MD5 + #10 + sPre_Venda_Numero + sDav_numero +
                sPosto_rodape + sMesa_numero + #10 + SEPARADOR + sIdentificarVendedor +
                'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                'Cida/UF: ' + texto_justifica(sFF + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                'CPF....: ' + texto_justifica(sCli_cpf, 30, ' ', taEsquerda))
            else
              sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal, sPre_Venda_Numero + sDav_numero +
                sPosto_rodape + sMesa_numero + #10 + SEPARADOR + sIdentificarVendedor +
                'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                'Cida/UF: ' + texto_justifica(sCli_cidade + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                'CPF....: ' + texto_justifica(sCli_cpf, 30, ' ', taEsquerda), ed_totalizador.Value, ed_troco.Value);

          end
          else
          begin

            if frmPrincipal.TipoImpressora = Fiscal then
              sMsg := cECF_Termina_Fechamento(iECF_Modelo,
                sPAF_MD5 + #10 +
                sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                SEPARADOR + sIdentificarVendedor +
                'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                'Cida/UF: ' + texto_justifica(sCli_cidade + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                'CPF....: ' + texto_justifica(sCli_cpf, 30, ' ', taEsquerda) + #10 +
                'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
                'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
                'VD: ' + texto_justifica(scli_vendedor, 10, ' ', taEsquerda))
            else
              sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal,
                sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                SEPARADOR + sIdentificarVendedor +
                'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                'Cida/UF: ' + texto_justifica(sCli_cidade + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                'CPF....: ' + texto_justifica(sCli_cpf, 30, ' ', taEsquerda) + #10 +
                'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
                'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
                'VD: ' + texto_justifica(scli_vendedor, 10, ' ', taEsquerda), ed_totalizador.Value, ed_troco.Value);

          end;
        end
        else
        begin
          if sConsumidor_Nome = '' then
          begin
            if not bCadastra_Placa then
            begin

              if frmPrincipal.TipoImpressora = Fiscal then
                sMsg := cECF_Termina_Fechamento(iECF_Modelo,
                  sPAF_MD5 + #10 +
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                  SEPARADOR + sIdentificarVendedor +
                  'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                  'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                  'Cida/UF: ' + texto_justifica(sCli_cidade + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                  'CPF....: ' + texto_justifica(sCli_cpf, 30, ' ', taEsquerda))
              else
                sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal,
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                  SEPARADOR + sIdentificarVendedor +
                  'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                  'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                  'Cida/UF: ' + texto_justifica(sCli_cidade + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                  'CPF....: ' + texto_justifica(sCli_cpf, 30, ' ', taEsquerda), ed_totalizador.Value, ed_troco.Value);



            end
            else
            begin

              if frmPrincipal.TipoImpressora = Fiscal then
                sMsg := cECF_Termina_Fechamento(iECF_Modelo,
                  sPAF_MD5 + #10 +
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                  SEPARADOR + sIdentificarVendedor +
                  'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                  'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                  'Cida/UF: ' + texto_justifica(sCli_cidade + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                  'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
                  'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
                  'VD: ' + texto_justifica(scli_vendedor, 10, ' ', taEsquerda))
              else
                sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal,
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                  SEPARADOR + sIdentificarVendedor +
                  'Cliente: ' + texto_justifica(sCli_nome, 30, ' ', taEsquerda) + #10 +
                  'Enderec: ' + texto_justifica(sCli_endereco, 30, ' ', taEsquerda) + #10 +
                  'Cida/UF: ' + texto_justifica(sCli_cidade + ' ' + sCli_uf, 30, ' ', taEsquerda) + #10 +
                  'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
                  'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
                  'VD: ' + texto_justifica(scli_vendedor, 10, ' ', taEsquerda), ed_totalizador.Value, ed_troco.Value);

            end;
          end
          else
          begin

            if not bCadastra_Placa then
            begin
              if frmPrincipal.TipoImpressora = Fiscal then
                sMsg := cECF_Termina_Fechamento(iECF_Modelo,
                  sPAF_MD5 + #10 +
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10
                  + SEPARADOR + sIdentificarVendedor)
              else
                sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal,
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10
                  + SEPARADOR + sIdentificarVendedor, ed_totalizador.Value, ed_troco.Value);

            end
            else
            begin
              if frmPrincipal.TipoImpressora = Fiscal then
                sMsg := cECF_Termina_Fechamento(iECF_Modelo,
                  sPAF_MD5 + #10 +
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                  SEPARADOR + sIdentificarVendedor +
                  'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
                  'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
                  'VD: ' + texto_justifica(scli_vendedor, 10, ' ', taEsquerda))
              else
                sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal,
                  sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
                  SEPARADOR + sIdentificarVendedor +
                  'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
                  'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
                  'VD: ' + texto_justifica(scli_vendedor, 10, ' ', taEsquerda), ed_totalizador.Value, ed_troco.Value);

            end;
          end;
        end;

        if sMsg = ok then
        begin
          bFinalizado := true;
          frmmodulo.spCupom_Temp_Edit.close;
          frmmodulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring :=
            'FINALIZADO';
          frmmodulo.spCupom_Temp_Edit.Prepare;
          frmmodulo.spCupom_Temp_Edit.Execute;
        end
        else
        begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Erro no ECF!' + #13 + 'Mensagem: ' + sMsg + #13 +
            'Deseja tentar outra vez?'), 'Erro', mb_yesno + MB_ICONERROR) = idno
          then
          begin
            break;
          end;
        end;
      until sMsg = ok;


      //BlockInput(true);

      sPre_Venda_Numero := '';
      sDav_numero := '';
      sPosto_rodape := '';
      sMesa_numero := '';


      if sMsg <> OK then
      begin
        bt_confirmar_fechamento.Enabled := true;
        bt_confirmar_fechamento.setfocus;
        Imprime_display(sMsg, clred, tierro);
        exit;
      end;
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring :=
        '--------------------------------------------------------';
      if bIdentificarVendedor > 0 then
      begin
        grid.AddRow(1);
        grid.cell[0, grid.LastAddedRow].asstring := 'Vended. '
          + texto_justifica(FormatFloat('000', iVendedorCodigo)
          + ' - ' + sVendedorNome, 47, ' ', taEsquerda);
      end;

      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring := 'Cliente ' +
        texto_justifica(sCli_nome, 47, ' ', taEsquerda);
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring := 'Endere: ' +
        texto_justifica(sCli_endereco, 47, ' ', taEsquerda);
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring := 'Cid/UF: ' +
        texto_justifica(sCli_cidade + '/' + sCli_uf + ' ' + scli_cep, 47, ' ', taEsquerda);
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring := 'CPF...: ' +
        texto_justifica(sCli_cpf, 47, ' ', taEsquerda);
      if bCadastra_Placa then
      begin
        GRID.ADDROW(1);
        grid.cell[0, grid.LastAddedRow].asstring := 'Placa.: ' +
          texto_justifica(sCli_placa + '  Km: ' + scli_km + '  Vendedor: ' +
          scli_vendedor, 47, ' ', taEsquerda);
      end;
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring :=
        '--------------------------------------------------------';
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring :=
        '              Obrigado!!! Volte Sempre!!!               ';
    end
    else
    begin


      repeat
        //BlockInput(true);
        if not bCadastra_Placa then
        begin

          if frmPrincipal.TipoImpressora = Fiscal then
            sMsg := cECF_Termina_Fechamento(iECF_Modelo, sPAF_MD5 + #10 + sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero
              + SEPARADOR + sIdentificarVendedor)
          else
            sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal, sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero
              + SEPARADOR + sIdentificarVendedor, ed_totalizador.Value, ed_troco.Value);

        end
        else
        begin

          if frmPrincipal.TipoImpressora = Fiscal then
            sMsg := cECF_Termina_Fechamento(iECF_Modelo,
              sPAF_MD5 + #10 +
              sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
              SEPARADOR + sIdentificarVendedor +
              'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
              'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
              'VD: ' + texto_justifica(scli_vendedor, 17, ' ', taEsquerda))
          else
            sMsg := Imp_Termina_Fechamento(sPortaNaoFiscal,
              sPre_Venda_Numero + sDav_numero + sPosto_rodape + sMesa_numero + #10 +
              SEPARADOR + sIdentificarVendedor +
              'Placa..: ' + texto_justifica(sCli_Placa, 10, ' ', taEsquerda) +
              'KM: ' + texto_justifica(sCli_Km, 10, ' ', taEsquerda) +
              'VD: ' + texto_justifica(scli_vendedor, 17, ' ', taEsquerda), ed_totalizador.Value, ed_troco.Value);

        end;

        if sMsg = OK then
        begin
          bFinalizado := true;

          frmModulo.spCupom_Temp_Edit.Close;
          frmModulo.spCupom_Temp_Edit.ParamByName('procedimento').asstring := 'FINALIZADO';
          frmModulo.spCupom_Temp_Edit.Prepare;
          frmModulo.spCupom_Temp_Edit.execute;

        end
        else
        begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Erro no ECF!' + #13 + 'Mensagem: ' + sMsg + #13 +
            'Deseja tentar outra vez?'), 'Erro', mb_yesno + MB_ICONERROR) = idno
          then
          begin
            break;
          end;
        end;
      until sMsg = ok;

      if sMsg <> OK then
      begin
        bt_confirmar_fechamento.Enabled := true;
        bt_confirmar_fechamento.setfocus;
        Imprime_display(sMsg, clred, tierro);
        exit;
      end;



      // sem consumidor
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring :=
        '--------------------------------------------------------';
      grid.AddRow(1);
      grid.cell[0, grid.LastAddedRow].asstring :=
        '              Obrigado!!! Volte Sempre!!!               ';
    end;

    grid.SelectLastRow;
    try
      grid.SetFocus;
    except
    end;
    Application.ProcessMessages;
    bFinalizado := true;



   // atualizar o totalizador geral do PAF com a do ECF
    if frmPrincipal.TipoImpressora = Fiscal then
    begin
      repeat
        // BlockInput(true);
        sMsg := cECF_Grande_Total(iECF_Modelo);
        iF sMsg = 'ERRO' then
        begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Erro ao verificar totalizador do ECF!' + #13 +
            'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'), 'Erro',
            mb_yesno + MB_ICONERROR) = idno then
            break;

        end
        else
          atualiza_totalizador(SMSG);
      until SmSG <> 'ERRO';
    end;


    //---> FIM
    (**************************************************************************)

    //BlockInput(true);

    if bTEF and bTef_finaliza then
    begin
      if (FileExists(sTEFTemp_Path + 'TEF.Imp')) then
      begin
        Imprime_display('Impress�o comprovante TEF', clwhite, tiInfo);
        TEFImprimeTransacao('V');
      end;
      if sTEFRetorno = '0' then
      begin
         // TEF ok
        Imprime_display('Confirmando TEF', clwhite, tiInfo);
        TEFVerificaGerenciadorAtivo;
        TEFFechaOperacao;
      end
      else
      begin
        // TEF apresentou erro
        Imprime_display('Cancelando TEF', clred, tiErro);
        TEFVerificaGerenciadorAtivo;
        TEFNaoConfirmaOperacao;
        TEFVerificaArquivosPendentes;
        TEFVerificaOperacaoPendente;
      end;
    end;




    //--> (C U P O M    N A O   F I S C A L )
    bLanca_comprovante_crediario := false;
    // comprovante do crediario
    if (bCadastra_Crediario) and (rvalor_total_crediario > 0) and (iComprovente_Crediario = 1) then
    begin
      Imprime_display('Aguarde! Imprimindo Comprovante...', clwhite, tiInfo);
      bLanca_comprovante_crediario := false;
      sMsg := OK;
      if sMSG = OK then
      begin

        repeat
          //BlockInput(true);
          if frmprincipal.TipoImpressora = fiscal then
          begin
            sMsg := cECF_Abre_Gerencial(iECF_Modelo, 'CREDI�RIO                                       ');
            sCOO_prestacao := cECF_Numero_Cupom(iECF_Modelo);
            sGNF_prestacao := cECF_Numero_Contador_Operacao_NF(iECF_Modelo);
            sGRG_prestacao := cECF_Numero_Contador_Relatorio_Gerencial(iECF_Modelo);
          end
          else
          begin
            sMsg := Imp_Abre_Gerencial(sPortaNaoFiscal, 'CREDI�RIO                                       ');
            sCOO_prestacao := snumero_cupom;
            sGNF_prestacao := sGNF;
            sGRG_prestacao := sGRG;
          end;

          if sMsg = 'ERRO' then
          begin
            BlockInput(false);
            if application.messagebox
              (pwidechar('N�o foi poss�vel abrir o comprovante de Credi�rio' +
              #13 + 'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'),
              'Erro', mb_yesno + MB_ICONERROR) = idno then
            begin
              break;
            end;
          end;
        until sMsg = ok;


        // imprimir o comprovante com os produtos
        if iComprovante_Crediario_produto = 1 then
        begin
          if frmprincipal.TipoImpressora = fiscal then
          begin
            sMsg := cECF_Usa_Gerencial(iECF_Modelo, texto_justifica('S E G U N D A   V I A   D O     C U P O M', 48, ' ', taCentralizado));
            SMsg := cECF_Usa_Gerencial(iECF_Modelo,
              texto_justifica('No: ' + sNumero_Cupom +
              ' Data:' + DateToStr(dData_Sistema) +
              ' Hora:' + TimeToStr(time), 48,
              ' ', taCentralizado));

            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '------------------------------------------------');
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, 'Item Codigo        Descricao');
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '                    Qtde Un.  Vl.Unit    Vl.Item');
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '------------------------------------------------');

          end
          else
          begin
            sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, texto_justifica('SEGUNDA VIA DO CUPOM', 41, ' ', taCentralizado));
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
              texto_justifica('No: ' + sNumero_Cupom +
              ' Data:' + DateToStr(dData_Sistema) +
              ' Hora:' + TimeToStr(time), 41,
              ' ', taCentralizado));

            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '-----------------------------------------');
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, 'Item Codigo        Descricao');
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '             Qtde Un.  Vl.Unit    Vl.Item');
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '-----------------------------------------');

          end;



          for i := 0 to grid.RowCount - 1 do
          begin
            if (grid.Cell[1, i].asinteger = 1) and (grid.cell[13, i].asinteger = 0) then
            begin

              if frmprincipal.TipoImpressora = fiscal then
              begin
                SMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  texto_justifica(GRID.CELL[2, I].ASSTRING, 3, '0', taDireita) + ' ' +
                  texto_justifica(GRID.CELL[3, I].ASSTRING, 13, '0', taDireita) + ' ' +
                  texto_justifica(GRID.CELL[4, I].ASSTRING, 30, ' ', taEsquerda));

                SMsg := cECF_Usa_Gerencial(iECF_Modelo, '              ' +
                  texto_justifica(formatfloat('###,###,##0.000', GRID.CELL[5, I].ASFLOAT), 10, ' ', taDireita) +
                  texto_justifica(GRID.CELL[12, I].ASSTRING, 2, ' ', taEsquerda) + ' ' +
                  texto_justifica(formatfloat('###,###,##0.000', GRID.CELL[6, I].ASFLOAT), 10, ' ', taDireita) +
                  texto_justifica(formatfloat('###,###,##0.00', GRID.CELL[9, I].ASFLOAT), 11, ' ', taDireita));

                if GRID.CELL[7, I].ASFLOAT > 0 then
                begin
                  SMsg := cECF_Usa_Gerencial(iECF_Modelo, '              ' +
                    'Desconto:  -' + texto_justifica(formatfloat('###,###,##0.00', GRID.Cell[7, I].ASFLOAT), 8, ' ', taDireita));
                end;
                if GRID.CELL[8, I].ASFLOAT > 0 then
                begin

                  SMsg := cECF_Usa_Gerencial(iECF_Modelo, '              ' +
                    'Acr�scimo: +' + texto_justifica(formatfloat('###,###,##0.00', GRID.CELL[8, I].ASFLOAT), 8, ' ', taDireita));
                end;

              end
              else
              begin
                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  texto_justifica(GRID.CELL[2, I].ASSTRING, 3, '0', taDireita) + ' ' +
                  texto_justifica(GRID.CELL[3, I].ASSTRING, 13, '0', taDireita) + ' ' +
                  texto_justifica(GRID.CELL[4, I].ASSTRING, 30, ' ', taEsquerda));

                SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '              ' +
                  texto_justifica(formatfloat('###,###,##0.000', GRID.CELL[5, I].ASFLOAT), 10, ' ', taDireita) +
                  texto_justifica(GRID.CELL[12, I].ASSTRING, 2, ' ', taEsquerda) + ' ' +
                  texto_justifica(formatfloat('###,###,##0.000', GRID.CELL[6, I].ASFLOAT), 10, ' ', taDireita) +
                  texto_justifica(formatfloat('###,###,##0.00', GRID.CELL[9, I].ASFLOAT), 11, ' ', taDireita));

                if GRID.CELL[7, I].ASFLOAT > 0 then
                begin
                  SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '              ' +
                    'Desconto:  -' + texto_justifica(formatfloat('###,###,##0.00', GRID.Cell[7, I].ASFLOAT), 8, ' ', taDireita));
                end;
                if GRID.CELL[8, I].ASFLOAT > 0 then
                begin

                  SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '              ' +
                    'Acr�scimo: +' + texto_justifica(formatfloat('###,###,##0.00', GRID.CELL[8, I].ASFLOAT), 8, ' ', taDireita));
                end;

              end;

            end;
          end;

          if frmprincipal.TipoImpressora = fiscal then
          begin
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '------------------------------------------------');
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '                   Subtotal do Cupom:' + texto_justifica(formatfloat('###,###,##0.00', rTotal_Venda), 11, ' ', taDireita));
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '                            Desconto:' + texto_justifica(formatfloat('###,###,##0.00', rTotal_Desconto), 11, ' ', taDireita));
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '                           Acrescimo:' + texto_justifica(formatfloat('###,###,##0.00', rTotal_Acrescimo), 11, ' ', taDireita));
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '                      Total do Cupom:' + texto_justifica(formatfloat('###,###,##0.00', ed_total_pagar.VALUE), 11, ' ', taDireita));
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, '------------------------------------------------');

            if cb_forma1.Text <> '' then
            begin
              SMsg := cECF_Usa_Gerencial(iECF_Modelo, texto_justifica(cb_forma1.text + ':', 20, ' ', taEsquerda) + ' ' +
                texto_justifica(formatfloat('###,###,##0.00', ed_forma1.value), 11, ' ', taDireita));
            end;
            if cb_forma2.Text <> '' then
            begin
              SMsg := cECF_Usa_Gerencial(iECF_Modelo, texto_justifica(cb_forma2.text + ':', 20, ' ', taEsquerda) + ' ' +
                texto_justifica(formatfloat('###,###,##0.00', ed_forma2.value), 11, ' ', taDireita));
            end;
            if cb_forma3.Text <> '' then
            begin
              SMsg := cECF_Usa_Gerencial(iECF_Modelo, texto_justifica(cb_forma3.text + ':', 20, ' ', taEsquerda) + ' ' +
                texto_justifica(formatfloat('###,###,##0.00', ed_forma3.value), 11, ' ', taDireita));
            end;
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, ' ');
            SMsg := cECF_Usa_Gerencial(iECF_Modelo, ' ');


          end
          else
          begin //Nao Fiscal
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '-----------------------------------------');
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '            Subtotal do Cupom:' + texto_justifica(formatfloat('###,###,##0.00', rTotal_Venda), 11, ' ', taDireita));
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '                     Desconto:' + texto_justifica(formatfloat('###,###,##0.00', rTotal_Desconto), 11, ' ', taDireita));
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '                    Acrescimo:' + texto_justifica(formatfloat('###,###,##0.00', rTotal_Acrescimo), 11, ' ', taDireita));
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '               Total do Cupom:' + texto_justifica(formatfloat('###,###,##0.00', ed_total_pagar.VALUE), 11, ' ', taDireita));
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, '-----------------------------------------');

            if cb_forma1.Text <> '' then
            begin
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, texto_justifica(cb_forma1.text + ':', 20, ' ', taEsquerda) + ' ' +
                texto_justifica(formatfloat('###,###,##0.00', ed_forma1.value), 11, ' ', taDireita));
            end;
            if cb_forma2.Text <> '' then
            begin
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, texto_justifica(cb_forma2.text + ':', 20, ' ', taEsquerda) + ' ' +
                texto_justifica(formatfloat('###,###,##0.00', ed_forma2.value), 11, ' ', taDireita));
            end;
            if cb_forma3.Text <> '' then
            begin
              SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, texto_justifica(cb_forma3.text + ':', 20, ' ', taEsquerda) + ' ' +
                texto_justifica(formatfloat('###,###,##0.00', ed_forma3.value), 11, ' ', taDireita));
            end;
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, ' ');
            SMsg := Imp_Usa_Gerencial(sPortaNaoFiscal, ' ');


          end;

        end;

        // rodar conforme a variavel icrediario_prestacao = qtde de prestacoes
        for i := 1 to iCrediario_prestacao do
        begin


          if sMsg = OK then
          begin
            repeat
              if frmprincipal.TipoImpressora = fiscal then
              begin
                  //BlockInput(true);
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '------------------------------------------------');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '             COMPROVANTE DE D�BITO              ');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '------------------------------------------------');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('CUPOM.....: ' +
                  zerar(sNumero_Cupom, 6), 48, ' ', taEsquerda));
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('DOCUMENTO.: ' +
                  zerar(sNumero_Cupom, 6) + '/' + inttostr(i), 48,
                  ' ', taEsquerda));
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '------------------------------------------------');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('CLIENTE...: ' +
                  sCli_codigo + '-' + sCli_Nome, 48, ' ', taEsquerda));
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('ENDERECO..: ' + sCli_Endereco, 48, ' ', taEsquerda));
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('CPF/CNPJ..: ' + sCli_CPF, 48, ' ', taEsquerda));

                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '------------------------------------------------');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('PARCELA...: ' + Zerar(INTTOSTR(I), 2) + '/' +
                  ZERAR(IntToStr(iCrediario_prestacao), 2), 48, ' ', taEsquerda));
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('VENCIMENTO: ' +
                  datetostr(IncMonth(dData_sistema, i))
                  , 48, ' ', taEsquerda));
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  Texto_Justifica('VALOR.....: ' +
                  FORMATFLOAT('R$ ###,###,##0.00', rvalor_total_crediario /
                  iCrediario_prestacao), 48, ' ', taEsquerda));

                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '------------------------------------------------');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '                                                ');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '                                                ');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '                                                ');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '                                                ');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '------------------------------------------------');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '            Assinatura do Cliente               ');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '                                                ');
                sMsg := cECF_Usa_Gerencial(iECF_Modelo,
                  '                                                ');
              end
              else
              begin // Nao Fiscal
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '-----------------------------------------');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '             COMPROVANTE DE D�BITO              ');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '-----------------------------------------');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('CUPOM.....: ' +
                  zerar(sNumero_Cupom, 6), 41, ' ', taEsquerda));
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('DOCUMENTO.: ' +
                  zerar(sNumero_Cupom, 6) + '/' + inttostr(i), 41,
                  ' ', taEsquerda));
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '-----------------------------------------');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('CLIENTE...: ' +
                  sCli_codigo + '-' + sCli_Nome, 41, ' ', taEsquerda));
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('ENDERECO..: ' + sCli_Endereco, 41, ' ', taEsquerda));
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('CPF/CNPJ..: ' + sCli_CPF, 41, ' ', taEsquerda));

                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '-----------------------------------------');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('PARCELA...: ' + Zerar(INTTOSTR(I), 2) + '/' +
                  ZERAR(IntToStr(iCrediario_prestacao), 2), 41, ' ', taEsquerda));
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('VENCIMENTO: ' +
                  datetostr(IncMonth(dData_sistema, i))
                  , 41, ' ', taEsquerda));
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  Texto_Justifica('VALOR.....: ' +
                  FORMATFLOAT('R$ ###,###,##0.00', rvalor_total_crediario /
                  iCrediario_prestacao), 41, ' ', taEsquerda));

                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '-----------------------------------------');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '                                                ');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '                                                ');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '                                                ');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '                                                ');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '-----------------------------------------');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '            Assinatura do Cliente               ');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '                                                ');
                sMsg := Imp_Usa_Gerencial(sPortaNaoFiscal,
                  '                                                ');

              end;

              if sMsg = 'ERRO' then
              begin
                BlockInput(false);
                if application.messagebox
                  (pwidechar('N�o foi poss�vel imprimir o comprovante ' +
                  'de Credi�rio!' + #13 + 'Mensagem: ' + sMsg + #13 +
                  'Deseja tentar outra vez?'), 'Erro', mb_yesno + MB_ICONERROR)
                  = idno then
                  break;

              end;
            until sMsg = OK;
          end;
        end;

        bLanca_Comprovante_Prestacao := false;


        if sMsg = OK then
        begin
          // fechar o gerencial
          repeat
            //BlockInput(true);
            if frmprincipal.TipoImpressora = fiscal then
              sMsg := cECF_Fecha_Gerencial(iECF_Modelo)
            else
              sMsg := Imp_Fecha_Gerencial(sPortaNaoFiscal);

            if sMsg = 'ERRO' then
            begin
              BlockInput(false);
              if application.messagebox
                (pwidechar('N�o foi poss�vel finalizar o comprovante ' +
                'de Credi�rio!' + #13 + 'Mensagem: ' + sMsg + #13 +
                'Deseja tentar outra vez?'), 'Erro', mb_yesno + MB_ICONERROR) = idno
              then
                break;


            end
            else
            begin
              bLanca_Comprovante_Prestacao := true;
            end;
          until sMsg = OK;
        end
        else
          Imprime_display('Erro na impressa�o do credi�rio!', clRed, tiErro);
      end;
    end;

    if frmprincipal.TipoImpressora = NaoFiscal then begin
      for i := 0 to sMensagem_Cupom.Lines.Count -1 do
        Imp_Usa_Gerencial(sPortaNaoFiscal, texto_justifica(sMensagem_Cupom.Lines.Strings[i],41,' ',taEsquerda));
    end;

    //BlockInput(true);

    if bFinalizado then
    begin
      Imprime_display('Aguarde!Finalizando Venda!', clwhite, tiInfo);

      // cadastrar cheques
      if (bCadastra_Cheque) and (rvalor_total_cheque > 0) then
      begin


      end;
      // lancar convenio
      if (bcadastra_convenio) and (rvalor_total_convenio > 0) then
      begin


      end;

      with frmmodulo do
      begin
        // lancamento do cupom no banco de dados
        sNumero_Cupom := sNumero_Venda;
        sCod_Cupom := codifica_cupom;
        spCupom.close;
        spCupom.ParamByName('codigo').asstring := sCod_Cupom;
        if vNumNFCe > 0 then
          spCupom.ParamByName('numero').asstring := IntToStr(vNumNFCe)
        else
          spCupom.ParamByName('numero').asstring := sNumero_Cupom;
        spCupom.ParamByName('ccf').asstring := sNumero_contador_cupom;
        spCupom.ParamByName('ECF').AsString := sECF_Serial;
        spCupom.ParamByName('data').asdate := dData_Sistema;
        spCupom.ParamByName('hora').AsTime := hHora_Cupom;
        spCupom.ParamByName('qtde_item').asinteger := iTotal_Itens;
        spCupom.ParamByName('valor_produto').asfloat := rTotal_Venda;
        spCupom.ParambyName('Valor_Desconto').asfloat := rTotal_Desconto;
        spCupom.ParambyName('Valor_Acrescimo').asfloat := rTotal_Acrescimo;
        spCupom.ParamByName('valor_total').asfloat := ed_total_pagar.Value;
        spCupom.ParamByName('valor_pago').asfloat := ed_totalizador.value;
        spCupom.ParamByName('valor_troco').asfloat := ed_troco.value;
        if sCli_codigo <> '' then
          spCupom.ParamByName('cod_cliente').asstring := sCli_codigo
        else
          spCupom.ParamByName('cod_cliente').Clear;

        spCupom.ParamByName('cancelado').asinteger := 0;
        spcupom.parambyname('cpf_consumidor').asstring := sConsumidor_CPF;
        spcupom.ParamByName('nome_consumidor').asstring := copy(sConsumidor_Nome, 1, 40);
        spcupom.ParamByName('cod_caixa').asinteger := iNumCaixa;
        spCupom.ParamByName('ecf_caixa').asstring := Copy(sECF_Caixa, 1, 3);
        if iVendedorCodigo <= 0 then
          iVendedorCodigo :=  icodigo_Usuario;
        spcupom.parambyname('cod_vendedor').asinteger := iVendedorCodigo;
        spcupom.parambyname('contingencia').asstring := vcontingencia;
        spcupom.parambyname('gerado_nfce').asstring := vgerado_nfce;
        spCupom.Prepare;
        spCupom.Execute;

        // Excluir os arquivos temporarios
        frmModulo.spCupom_Temp_delete.prepare;
        frmModulo.spCupom_Temp_delete.execute;


        if bLanca_pre_venda then
        begin
          // atualizar situacao da pre-venda para 2 = concluida
          frmModulo.query_servidor.close;
          frmModulo.query_servidor.sql.clear;
          frmModulo.query_servidor.sql.add('update c000074 set situacao = 2 where codigo = ''' +
            Zerar(inttostr(iPre_venda_codigo), 6) + '''');
          frmmodulo.query_servidor.ExecSQL;

          bLanca_pre_venda := false;
        end;
        if blanca_os then
        begin
          // atualizar a situacao da os para FECHADA
          frmModulo.query_servidor.close;
          frmModulo.query_servidor.sql.clear;
          frmModulo.query_servidor.sql.add('update c000051 set situacao = ''FECHADA'' where codigo = ''' +
            Zerar(inttostr(iOS_codigo), 6) + '''');
          frmmodulo.query_servidor.ExecSQL;
          bLanca_OS := false;
        end;

        if bLanca_mesa or bLanca_Comanda then
        begin
          // excluir a mesa e os itens
          frMmodulo.query_servidor.close;
          frmmodulo.query_servidor.sql.clear;
          frmmodulo.query_servidor.sql.add('delete from r000002 where cod_mesa =' + IntToStr(iMesa_codigo));
          frmmodulo.query_servidor.ExecSQL;

          frMmodulo.query_servidor.close;
          frmmodulo.query_servidor.sql.clear;
          frmmodulo.query_servidor.sql.add('delete from r000001 where codigo =' + IntToStr(imesa_codigo));
          frmmodulo.query_servidor.ExecSQL;
          // inserir a liberacao da mesa para nao aparecer no sistema de frente
          try
            frMmodulo.query_servidor.close;
            frmmodulo.query_servidor.sql.clear;
            frmmodulo.query_servidor.sql.add('insert into r000003 (mesa) values (' + IntToStr(imesa_codigo) + ')');
            frmmodulo.query_servidor.ExecSQL;
          except
          end;

        end;

        // lancamento dos items do cupom no banco de dados
        for i := 0 to grid.RowCount - 1 do
        begin
          // situacoes
          // 1 - Venda do Item
          // 3 - Cancelamento do Item
          // 4 - Desconto no Item
          // 5 - Acrescimo no Item

          if grid.Cell[1, i].asinteger = 1 then
          begin
            spCupom_Item.close;
            spCupom_Item.ParamByName('codigo').AsString := codifica_item(grid.Cell[2, i].asinteger);
            spCupom_Item.parambyname('cod_cupom').asstring := sCod_Cupom;
            spCupom_Item.parambyname('item').asinteger := grid.cell[2, i].asinteger;
            spCupom_Item.ParamByName('cod_produto').asinteger := grid.cell[3, i].asinteger;
            spCupom_Item.parambyname('unidade').asstring := grid.cell[12, i].asstring;
            spCupom_Item.parambyname('qtde').asfloat := grid.cell[5, i].asfloat;
            spCupom_Item.parambyname('valor_unitario').asfloat := grid.cell[6, i].asfloat;
            spCupom_Item.parambyname('valor_subtotal').asfloat := grid.cell[5, i].asfloat *
              grid.cell[6, i].asfloat;
            spCupom_Item.parambyname('valor_desconto').asfloat := grid.cell[7, i].asfloat;
            spCupom_Item.parambyname('valor_acrescimo').asfloat := grid.cell[8, i].asfloat;
            spCupom_Item.parambyname('valor_total').asfloat := grid.cell[9, i].asfloat;
            spCupom_Item.parambyname('cst').asstring := grid.cell[11, i].asstring;
            spCupom_Item.parambyname('aliquota').asfloat := grid.cell[10, i].asfloat;
            spCupom_Item.parambyname('cancelado').asinteger := grid.cell[13, i].asinteger;
            spCupom_Item.parambyname('tamanho').AsString := grid.cell[14, i].AsString;
            spCupom_Item.parambyname('cor').AsString := grid.cell[15, i].AsString;

            if (grid.cell[11, i].asstring = '060') or
              (grid.cell[11, i].asstring = '010') or
              (grid.cell[11, i].asstring = '070') then
              spCupom_item.ParamByName('cod_totalizador').asstring := 'F1'
            else
              if (grid.cell[11, i].asstring = '040') or
                (grid.cell[11, i].asstring = '030') then
                spCupom_item.ParamByName('cod_totalizador').asstring := 'I1'
              else
                if (grid.cell[11, i].asstring = '041') or
                  (grid.cell[11, i].asstring = '050') or
                  (grid.cell[11, i].asstring = '051') or
                  (grid.cell[11, i].asstring = '090') then
                  spCupom_item.ParamByName('cod_totalizador').asstring := 'N1'
                else
                  if (grid.cell[11, i].asstring = 'ISS') then
                    spCupom_item.ParamByName('cod_totalizador').asstring := '01S' +
                      Retorna_aliquota(grid.cell[11, i].asstring, grid.cell[10, i].asfloat)
                  else
                    spCupom_item.ParamByName('cod_totalizador').asstring :=
                      retorna_codigo_aliquota(grid.cell[10, i].asfloat);


            spCupom_Item.Prepare;
            spCupom_Item.Execute;
          end;
        end;

        // lancamento das formas de pagamento
        if ed_forma1.Value > 0 then
        begin
          spCupom_Forma.close;
          spCupom_Forma.ParamByName('codigo').asstring := codifica_forma(1);
          spCupom_Forma.ParamByName('cod_cupom').asstring := sCod_Cupom;
          spCupom_Forma.ParamByName('forma').asstring := copy(cb_forma1.text, 1, 30);
          spCupom_Forma.ParamByName('valor').asfloat := ed_forma1.Value;
          if tBanceira01.Numero <= 0 then begin
            spCupom_Forma.ParamByName('prestacao').asinteger := 1;
            spCupom_Forma.ParamByName('banco').asstring := '';
          end else begin
            spCupom_Forma.ParamByName('prestacao').asinteger := tBanceira01.Parcela.Parcelas;
            spCupom_Forma.ParamByName('banco').asstring := Zerar(IntToStr(tBanceira01.Numero),3);
          end;
          if frmPrincipal.TipoImpressora = Fiscal then
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM FISCAL'
          else
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM NAO FISCAL';

         if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) then
           spCupom_Forma.ParamByName('tipocartao').asstring := 'D'
         else if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
           spCupom_Forma.ParamByName('tipocartao').asstring := 'C'
         else
           spCupom_Forma.ParamByName('tipocartao').asstring := '';

          spCupom_Forma.Prepare;
          spCupom_Forma.Execute;
        end;
        if ed_forma2.Value > 0 then
        begin
          spCupom_Forma.close;
          spCupom_Forma.ParamByName('codigo').asstring := codifica_forma(2);
          spCupom_Forma.ParamByName('cod_cupom').asstring := sCod_Cupom;
          spCupom_Forma.ParamByName('forma').asstring := copy(cb_forma2.text, 1, 30);
          spCupom_Forma.ParamByName('valor').asfloat := ed_forma2.Value;
          if tBanceira02.Numero <= 0 then begin
            spCupom_Forma.ParamByName('prestacao').asinteger := 1;
            spCupom_Forma.ParamByName('banco').asstring := '';
          end else begin
            spCupom_Forma.ParamByName('prestacao').asinteger := tBanceira02.Parcela.Parcelas;
            spCupom_Forma.ParamByName('banco').asstring := Zerar(IntToStr(tBanceira02.Numero),3);
          end;

          if frmPrincipal.TipoImpressora = Fiscal then
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM FISCAL'
          else
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM NAO FISCAL';

         if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) then
           spCupom_Forma.ParamByName('tipocartao').asstring := 'D'
         else if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
           spCupom_Forma.ParamByName('tipocartao').asstring := 'C'
         else
           spCupom_Forma.ParamByName('tipocartao').asstring := '';

          spCupom_Forma.Prepare;
          spCupom_Forma.Execute;
        end;
        if ed_forma3.Value > 0 then
        begin
          spCupom_Forma.close;
          spCupom_Forma.ParamByName('codigo').asstring := codifica_forma(3);
          spCupom_Forma.ParamByName('cod_cupom').asstring := sCod_Cupom;
          spCupom_Forma.ParamByName('forma').asstring := copy(cb_forma3.text, 1, 30);
          spCupom_Forma.ParamByName('valor').asfloat := ed_forma3.Value;
          if tBanceira03.Numero <= 0 then begin
            spCupom_Forma.ParamByName('prestacao').asinteger := 1;
            spCupom_Forma.ParamByName('banco').asstring := '';
          end else begin
            spCupom_Forma.ParamByName('prestacao').asinteger := tBanceira03.Parcela.Parcelas;
            spCupom_Forma.ParamByName('banco').asstring := Zerar(IntToStr(tBanceira03.Numero),3);
          end;

          if frmPrincipal.TipoImpressora = Fiscal then
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM FISCAL'
          else
            spCupom_Forma.ParamByName('tipo').asstring := 'CUPOM NAO FISCAL';

         if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) then
           spCupom_Forma.ParamByName('tipocartao').asstring := 'D'
         else if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
           spCupom_Forma.ParamByName('tipocartao').asstring := 'C'
         else
           spCupom_Forma.ParamByName('tipocartao').asstring := '';

          spCupom_Forma.Prepare;
          spCupom_Forma.Execute;
        end;

        // lancamento do crediario
        if (bCadastra_Crediario) and (rvalor_total_crediario > 0) then
        begin
          // rodar conforme a variavel icrediario_prestacao = qtde de prestacoes
          for i := 1 to iCrediario_prestacao do
          begin
            spCupom_Crediario.close;
            spCupom_Crediario.ParamByName('codigo').asstring := codifica_crediario(i);
            spCupom_Crediario.ParamByName('cod_cupom').asstring := scod_cupom;
            spCupom_Crediario.ParamByName('data').asdate := dData_Sistema;
            spCupom_Crediario.ParamByName('Hora').astime := Time;
            spCupom_Crediario.ParamByName('cod_cliente').asinteger := strtoint(sCli_codigo);
            spCupom_crediario.ParamByName('vencimento').asdatetime := IncMonth(dData_sistema, i);
            spCupom_Crediario.parambyname('valor').asfloat := rvalor_total_crediario /
              iCrediario_prestacao;
            spCupom_Crediario.ParamByName('descricao').asstring := copy(sCrediario_Nome, 1, 30);
            spCupom_Crediario.Prepare;
            spCupom_Crediario.Execute;
          end;
        end;
        // lancamento do comprovante do crediario
        if bLanca_comprovante_crediario then
        begin
          sNumero_Cupom := zerar(somenteNumero(scoo_crediario), 6);

          if sNumero_Cupom <> '000000' then
          begin
            spNao_Fiscal.close;
            spNao_Fiscal.parambyname('codigo').asstring := codifica_cupom;
            spNao_fiscal.ParamByName('ecf').asstring := sECF_Serial;
            spNao_fiscal.ParamByName('data').asdatetime := dData_Sistema;
            spNao_Fiscal.ParamByName('indice').AsString := sTotalizador_Crediario;
            spNao_Fiscal.ParamByName('descricao').AsString := sNome_Totalizador_Crediario;
            spNao_fiscal.ParamByName('valor').asfloat := rvalor_total_crediario;
            spNao_fiscal.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo), 12, 8));
            spNao_fiscal.ParamByName('COO').asstring := sCOO_crediario;
            spNao_fiscal.ParamByName('GNF').asstring := sGNF_Crediario;
            spNao_fiscal.ParamByName('CDC').Clear;
            spNao_fiscal.ParamByName('GRG').clear;
            spNao_fiscal.ParamByName('DENOMINACAO').asstring := 'CN';
            spnao_fiscal.Prepare;
            spNao_Fiscal.Execute;
          end;
        end;

        // lancamento do comprovante da prestacao

        if bLanca_Comprovante_Prestacao then
        begin
          sNumero_cupom := zerar(somenteNumero(sCOO_Prestacao), 6);

          if sNumero_Cupom <> '000000' then
          begin
            spNao_Fiscal.close;
            spNao_Fiscal.parambyname('codigo').asstring := codifica_cupom;
            spNao_fiscal.ParamByName('ecf').asstring := sECF_Serial;
            spNao_fiscal.ParamByName('data').asdatetime := dData_Sistema;
            spNao_fiscal.ParamByName('hora').Astime := strtotime(copy(cECF_Data_Hora(iECF_Modelo), 12, 8));
            spNao_fiscal.ParamByName('indice').asstring := 'RG';
            spNao_fiscal.ParamByName('Descricao').asstring := 'RELAT�RIO GERENCIAL';
            spNao_fiscal.ParamByName('valor').asfloat := 0;
            spNao_fiscal.ParamByName('COO').asstring := sCOO_Prestacao;
            spNao_fiscal.ParamByName('GNF').asstring := sGNF_prestacao;
            spNao_fiscal.ParamByName('GRG').asstring := sGRG_prestacao;
            spNao_fiscal.ParamByName('CDC').Clear;
            spNao_fiscal.ParamByName('DENOMINACAO').asstring := 'RG';
            spnao_fiscal.Prepare;
            spNao_Fiscal.Execute;
          end;
        end;

        // lancar os dados do comprador, mesmo sem cadastro ou a vista
        spCupom_consumidor.Close;
        spCupom_consumidor.parambyname('codigo').Asstring := sCod_Cupom;
        if sCli_codigo <> '' then
          spCupom_consumidor.parambyname('cod_cliente').Asinteger := strtoint(scli_codigo)
        else
          spCupom_consumidor.parambyname('cod_cliente').Clear;
        spCupom_consumidor.parambyname('nome').asstring := copy(sCli_Nome, 1, 80);
        spCupom_consumidor.parambyname('endereco').asstring := copy(sCli_Endereco, 1, 80);
        spCupom_consumidor.parambyname('cidade').asstring := copy(sCli_Cidade, 1, 50);
        spCupom_consumidor.parambyname('uf').asstring := copy(sCli_uf, 1, 2);
        spCupom_consumidor.parambyname('cep').asstring := copy(scli_cep, 1, 9);
        spCupom_consumidor.parambyname('cpf').asstring := copy(sCli_CPF, 1, 18);
        spCupom_consumidor.parambyname('placa').asstring := copy(sCli_Placa, 1, 10);
        spCupom_consumidor.parambyname('km').asstring := copy(sCli_Km, 1, 10);
        spCupom_consumidor.parambyname('vendedor').asstring := copy(scli_vendedor, 1, 50);
        spCupom_consumidor.Prepare;
        spCupom_consumidor.Execute;

      end;

      pn_fechamento.Visible := false;
      FRMVENDA.PopupMenu := pop_principal;
      pn_principal.Enabled := true;

      bVenda := false;
      if bBusca_foto_produto then
      begin
        img_produto.Picture := nil;
      end;
      if bBusca_foto_produto then
      begin
        img_produto.Visible := true;
      end;

      Limpa_controles;

      if ed_troco.value > 0 then
        Imprime_display('Pago: R$ ' + formatfloat('###,###,##0.00', ed_totalizador.value) + '            ' + 'Troco: R$ ' + formatfloat('###,###,##0.00', ed_troco.value), clwhite, tiPgto)
      else
        Imprime_display('C A I X A    L I V R E', clWhite, tiLivre);

      TimerTroco.Enabled := true; // Apos 5 segundos

      MostraFotoProduto(false);
      MostraLogoMarca(true);

      if sRamo_Tipo = '3' then
         begin
//         if iCodigo_abastecimento > 0 then
//            begin
//            timer_abastecimento.Enabled := false;
//            query.close;
//            query.sql.clear;
//            query.sql.add('update posto_abastecimento set situacao = 1');
//            query.SQL.add('where codigo = ' + inttostr(iCodigo_abastecimento));
//            query.ExecSQL;
//            grid_abastecimento.DeleteRow(ilinha_abastecimento);
//            ilinha_abastecimento := 0;
//            iCodigo_abastecimento := 0;
//            timer_abastecimento.Enabled := true;
//            end;
//         PN_POSTO.Visible := true;
//         grid_abastecimento.setfocus;
         end
      else
         begin

        if bLanca_Mesa then
          menu_mesaClick(frmvenda)
        else
          if bLanca_Comanda then
            Comandas1Click(frmvenda)
          else
            ED_BARRA.SETFOCUS;

         end;
    end;
  finally
    BlockInput(false);
    bt_confirmar_fechamento.Enabled := true;
  end;

  if bVenda then begin
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'SIM');
  end else begin
    gravaINI(sConfiguracoes, 'PDV', 'Aberto', 'NAO');
    CorEditTotaL;
  end;

  {: ACIONAR GUILHOTINA}
  if frmprincipal.TipoImpressora = NaoFiscal then
    AcionarGuilhotinaNaoFiscal;
  vcontingencia := 'N';
  vgerado_nfce := 'N';
  vNumNFCe := 0;

            qrobs.Close;
             qrobs.sql.clear;
             qrobs.sql.add('update CUPOM set PEGO_PORQUEM = :OBS ');
             qrobs.sql.add('where ');
             qrobs.sql.add('codigo = ''' +
             scod_cupom + '''');
             qrobs.Parambyname('OBS').asstring := Edit2.text;
             qrobs.ExecSQL;

  if frmPrincipal.TipoImpressora = SemImpressora then begin
    barraAtalho.Color := $006A3500;
    exit
  end;

          if frmprincipal.TipoImpressora = NaoFiscal then
          begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Imprimir Venda?' + #13 ), 'Aviso', mb_yesno) = idno then
            exit;


          end;

  UniQuery1.close;
      UniQuery1.sql.clear;
      UniQuery1.sql.add('select CUPOM.*, CUPOM_FORMA.*');
      UniQuery1.sql.add('FROM CUPOM, CUPOM_FORMA');
      UniQuery1.sql.add('where ');
      UniQuery1.sql.add('cupom.codigo = CUPOM_FORMA.cod_cupom');
      UniQuery1.sql.add('and CUPOM_FORMA.cod_cupom = ''' +
      scod_cupom + '''');
      UniQuery1.ExecSQL;
      UniQuery1.open;

  query.close;
      query.sql.clear;
      query.sql.add('select item.*, prod.nome produto');
      query.sql.add('from cupom_item item, estoque prod');
      query.sql.add('where item.cod_produto = prod.codigo');
      query.sql.add('and item.cod_cupom = ''' +
      scod_cupom + '''');
      query.ExecSQL;
      query.open;

      Query3.close;
      Query3.sql.clear;
      Query3.sql.add('select CLI.NOME, CLI.cpf, CLI.CODIGO, CLI.ENDERECO, CLI.BAIRRO ');
      Query3.sql.add('from cupom CUP, CLIENTE CLI');
      Query3.sql.add('where cup.COD_CLIENTE = CLI.CODIGO AND');
      Query3.sql.add('cup.codigo = ''' +
      scod_cupom + '''');
      Query3.ExecSQL;
      Query3.open;


      Queryclie2.close;
      Queryclie2.sql.clear;
      Queryclie2.sql.add('select nome_consumidor, cpf_consumidor');
      Queryclie2.sql.add('from cupom');
      Queryclie2.sql.add('where');
      Queryclie2.sql.add('codigo = ''' +
      scod_cupom + '''');
      Queryclie2.ExecSQL;
      Queryclie2.open;

      qrobs.close;
      qrobs.sql.clear;
      qrobs.sql.add('select pego_porquem');
      qrobs.sql.add('from cupom');
      qrobs.sql.add('where');
      qrobs.sql.add('codigo = ''' +
      scod_cupom + '''');
      qrobs.ExecSQL;
      qrobs.open;

      //frxReport1.ShowReport();
    Frx_ImpressaoVenda.PrepareReport;
    Frx_ImpressaoVenda.Print;
   end;
    //  ACBRDANFENFCe.MostrarPreview := edPreview;
    //  ACBRNFCe.NotasFiscais.Imprimir;

procedure TfrmVenda.GerarNFCe(NumNFe: String);
var
   i, nItem, TItens: Integer;
  total_desconto, total_desconto_itens, total_produtos, a, total_icms, total_base, total_trib, PTroco: real;

  qtdCom: Currency;
  vlUnCom: Double;
  vlProd: Currency;
  qtdTrib: Currency;
  vlUnTrib: Double;
  vlDesc: Currency;
  vlOutro: Currency;

begin

  try
    with frmmodulo do
         begin
         qrfilial.Open;
         with ACBRNFCe.NotasFiscais.add.NFe do
              begin
              Ide.cNF := strtoint(NumNFe);
              Ide.natOp := 'VENDA AO CONSUMIDOR FINAL';
              if tipo_pgto = 1 then
                 Ide.indPag := ipPrazo
              else
                 Ide.indPag := ipVista; //mudar forma de pagamento
              Ide.Modelo := 65;
              Ide.Serie := StrToInt(edtSerie);
              Ide.nNF := strtoint(NumNFe);
              Ide.dEmi := Now;
              Ide.dSaiEnt := Now;
              Ide.hSaiEnt := Now;
              if frmModulo.ACBRNFCe.Configuracoes.Geral.FormaEmissao = frmtOffLine then
                 begin
                 Ide.dhCont  := Now;
                 Ide.xJust := MotivoContigencia;
                 end;
              Ide.tpNF := tnSaida;
              Ide.tpEmis := frmModulo.ACBRNFCe.Configuracoes.Geral.FormaEmissao;
              Ide.tpAmb := ACBRNFCe.Configuracoes.WebServices.Ambiente;
              Ide.cUF := UFtoCUF(edtEmitUF);
              Ide.cMunFG := strtoint(edtEmitCodCidade);
              Ide.finNFe := fnNormal;
              Ide.tpImp := tiNFCe;
              Ide.indFinal := cfConsumidorFinal;
              Ide.indPres := pcPresencial;
              ACBRNFCe.Configuracoes.Geral.ModeloDF := moNFCe;
              ACBRNFCe.Configuracoes.Geral.VersaoDF := ve400;
              ACBRNFCe.Configuracoes.Geral.VersaoQRCode := veqr200;

              Ide.verProc := '4.00';
              Emit.CNPJCPF := edtEmitCNPJ;
              Emit.IE := edtEmitIE;
              Emit.xNome := edtEmitRazao;
              Emit.xFant := edtEmitFantasia;

              Emit.EnderEmit.fone := edtEmitFone;
              Emit.EnderEmit.CEP := strtoint(edtEmitCEP);
              Emit.EnderEmit.xLgr := edtEmitLogradouro;
              Emit.EnderEmit.nro := edtEmitNumero;
              Emit.EnderEmit.xCpl := edtEmitComp;
              Emit.EnderEmit.xBairro := edtEmitBairro;
              Emit.EnderEmit.cMun := strtoint(edtEmitCodCidade);
              Emit.EnderEmit.xMun := edtEmitCidade;
              Emit.EnderEmit.UF := edtEmitUF;
              Emit.EnderEmit.cPais := 1058;
              Emit.EnderEmit.xPais := 'BRASIL';
              Emit.IEST := '';

              // regime tributario da empresa
              // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
              if qrfilial.fieldbyname('CRT').asinteger = 1 then
                 Emit.CRT := crtSimplesNacional
              else
              if qrfilial.fieldbyname('CRT').asinteger = 2 then
                 Emit.CRT := crtSimplesExcessoReceita
              else
                 Emit.CRT := crtRegimeNormal;

              // dados destinatarios sadraque@inovarem.com.br

              Dest.CNPJCPF := OnlyNumber(sConsumidor_CPF);
              Dest.ISUF := '';
              Dest.xNome := sConsumidor_Nome;
              Dest.indIEDest := inNaoContribuinte;
              Dest.EnderDest.fone := '';
              if scli_cep <> '' then
                 Dest.EnderDest.CEP := strtoint(OnlyNumber(scli_cep))
              else
                 Dest.EnderDest.CEP := 0;

              Dest.EnderDest.xLgr := '';
              Dest.EnderDest.nro := '';
              Dest.EnderDest.xCpl := sConsumidor_Endereco;
              Dest.EnderDest.xBairro := '';
              Dest.EnderDest.cMun := 0; // analisar funcao
              Dest.EnderDest.xMun := '';
              Dest.EnderDest.UF := sCli_uf;
              Dest.EnderDest.cPais := 1058;
              Dest.EnderDest.xPais := 'BRASIL';

              // Adicionando Produtos
              nItem := 1;
              total_produtos := 0;
              total_icms := 0;
              total_base := 0;
              total_trib := 0;
              total_desconto := 0;

              TItens := iTotal_Itens;
              total_desconto_itens :=  rTotal_Desconto / TItens ;

              for i := 0 to grid.RowCount - 1 do
                  begin
                  // prepar query
                  qrProdNCFE.close;
                  qrProdNCFE.sql.clear;
                  qrProdNCFE.sql.add('select CODIGO, NOME,COD_BARRA,NCM,CST,ALIQNACIONAL,CFOP from ESTOQUE ');
                  qrProdNCFE.sql.add('where CODIGO = :pcodigo');
                  qrProdNCFE.ParamByName('pcodigo').asinteger := grid.Cell[3, i].asinteger;
                  qrProdNCFE.Open;

                  if grid.Cell[1, i].asinteger = 1 then
                     begin
                     // if grid.Cell[13, grid.SelectedRow].asinteger <> 1 then
                     with Det.add do
                          begin
                          Prod.nItem := nItem;
                          nItem := nItem + 1;
                          Prod.cProd := inttostr(grid.Cell[3, i].asinteger);
                          Prod.uCom := grid.Cell[12, i].asstring;
                          Prod.uTrib := grid.Cell[12, i].asstring;

                          if length(qrProdNCFE.fieldbyname('COD_BARRA').asstring) < 13 then
                             begin
                             Prod.cEAN := '';
                             Prod.cEANTrib := '';
                              end
                          ELSE
                             begin
                             Prod.cEAN := qrProdNCFE.fieldbyname('COD_BARRA').asstring;
                             Prod.cEANTrib := qrProdNCFE.fieldbyname('COD_BARRA').asstring;
                             end;

                          Prod.xProd := qrProdNCFE.fieldbyname('NOME').asstring;
                          Prod.NCM := somenteNumero(qrProdNCFE.fieldbyname('NCM').asstring);

                          // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
                          Prod.EXTIPI := '';
        //                Prod.CFOP := '5101';//iCFOP;

                          if trim(qrProdNCFE.fieldbyname('CFOP').AsString)  <> '' then
                             Prod.CFOP := trim(qrProdNCFE.fieldbyname('CFOP').AsString)
                          else
                             Prod.CFOP := edtcfop;

                          Prod.qCom := RoundTo(grid.Cell[5, i].asfloat,-2);
                          qtdcom := RoundTo(grid.Cell[5, i].asfloat,-2);

                          Prod.qTrib := RoundTo(grid.Cell[5, i].asfloat,-2);
                          qtdTrib := RoundTo(grid.Cell[5, i].asfloat,-2);

                          Prod.vUnCom := RoundTo(grid.Cell[6, i].asfloat + (grid.Cell[7, i].asfloat / grid.Cell[5, i].asfloat ),-2); // miza
                          vlUnCom := RoundTo(grid.Cell[6, i].asfloat + (grid.Cell[7, i].asfloat / grid.Cell[5, i].asfloat ),-2); // miza

                          Prod.vUnTrib := RoundTo(grid.Cell[6, i].asfloat + ( grid.Cell[7, i].asfloat / grid.Cell[5, i].asfloat ),-2);
                          vlUnTrib := RoundTo(grid.Cell[6, i].asfloat + ( grid.Cell[7, i].asfloat / grid.Cell[5, i].asfloat ),-2);

                          Prod.vProd := RoundTo(Prod.vUnCom * Prod.qCom,-2);
                          vlProd := RoundTo(Prod.vUnCom * Prod.qCom,-2);

                          Prod.vDesc := RoundTo(grid.Cell[7, i].asfloat,-2);
                          vlDesc := RoundTo(grid.Cell[7, i].asfloat,-2);
                          //rTotal_Desconto := rTotal_Desconto +  grid.Cell[7, i].asfloat;

                          Prod.vOutro := RoundTo((Prod.vProd/rTotal_Venda)*rTotal_Acrescimo,-2);
                          vlOutro := RoundTo((Prod.vProd/rTotal_Venda)*rTotal_Acrescimo,-2);

                          if rTotal_Desconto > 0 then // Prod.vDesc + total_desconto_itens
                             begin
                             a := vlProd - vlDesc;
                             a := a /rTotal_Venda;
                             a := a * rTotal_Desconto ;
                             Prod.vDesc := RoundTo(( Prod.vDesc + a ),-2);
                             a := Prod.vDesc ;
                             end;



                          // prepar query
                          QRCSOSN.close;
                          QRCSOSN.sql.clear;
                          QRCSOSN.sql.add('select csosn, aliquota icms, cest from C000025 ');
                          QRCSOSN.sql.add('where codigo = :pcodigo');
                          QRCSOSN.ParamByName('pcodigo').asstring := IntToStrZero(grid.Cell[3, i].asinteger, 6);
                          QRCSOSN.Open;


                          if (trim(QRCSOSN.fieldbyname('cest').asstring) <> '') and (trim(QRCSOSN.fieldbyname('cest').asstring)<>'0') then
                             Prod.CEST   := QRCSOSN.fieldbyname('cest').asstring;

                          Prod.vFrete := 0;
                          Prod.vSeg := 0;
                          total_produtos := RoundTo(total_produtos + Prod.vProd,-2);
                          total_desconto := RoundTo(total_desconto + Prod.vDesc,-2);
                          with Imposto do
                               begin
                               vTotTrib := RoundTo((Prod.vProd * qrProdNCFE.fieldbyname('ALIQNACIONAL').AsFloat) / 100,-2);
                               total_trib := total_trib + vTotTrib;
                               // simples nacional
                               if qrfilial.fieldbyname('CRT').asinteger < 3 then
                                  begin
                                  with ICMS do
                                       begin
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '101') then
                                          ICMS.CSOSN := csosn101
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '102') then
                                          ICMS.CSOSN := csosn102
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '103') then
                                          ICMS.CSOSN := csosn103
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '300') then
                                          ICMS.CSOSN := csosn300
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '400') then
                                          ICMS.CSOSN := csosn400
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '201') then
                                          ICMS.CSOSN := csosn201
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '202') then
                                          ICMS.CSOSN := csosn202
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '500') then
                                          ICMS.CSOSN := csosn500
                                       else
                                       if (QRCSOSN.fieldbyname('csosn').asstring = '900') then
                                          ICMS.CSOSN := csosn900;

                                       case ICMS.CSOSN of

                                            csosn101: begin
                                                      ICMS.orig    := oeNacional;
                                                      ICMS.pCredSN := 0.0; // Colocar o percentual do Cr�dito
                                                      ICMS.vCredICMSSN := 0.0; // Colocar o valor do Cr�dito
                                                      end;

                                            csosn102: begin
                                                      ICMS.orig    := oeNacional;
                                                      end;
                                            csosn201: begin
                                                      ICMS.orig    := oeNacional;
                                                      ICMS.modBCST := dbisMargemValorAgregado;
                                                      ICMS.pMVAST := 0;
                                                      ICMS.pRedBCST := 00.00;
                                                      ICMS.vBCST := 0;
                                                      ICMS.pICMSST := 00.00;
                                                      ICMS.vICMSST := 0;
                                                      ICMS.pCredSN := 0.0; // Colocar o percentual do Cr�dito
                                                      ICMS.vCredICMSSN := 0.0; // Colocar o valor do Cr�dito
                                                      end;
                                            csosn202: begin
                                                      ICMS.orig    := oeNacional;
                                                      ICMS.modBCST := dbisMargemValorAgregado;
                                                      ICMS.pMVAST := 0;
                                                      ICMS.pRedBCST := 00.00;
                                                      ICMS.vBCST := 0;
                                                      ICMS.pICMSST := 00.00;
                                                      ICMS.vICMSST := 0;
                                                      end;
                                            csosn500: begin
                                                      ICMS.orig    := oeNacional;
                                                      ICMS.vBCSTRet := 0;
                                                      ICMS.vICMSSTRet := 0;
                                                      end;
                                            csosn900: begin
                                                      ICMS.orig    := oeNacional;
                                                      ICMS.modBC := dbiValorOperacao;
                                                      ICMS.vBC := RoundTo(grid.Cell[9, i].asfloat,-2);
                                                      ICMS.pRedBC := 0;
                                                      ICMS.pICMS := RoundTo(QRCSOSN.FieldByName('icms').AsFloat,-2);
                                                      ICMS.vICMS := RoundTo((ICMS.vBC * ICMS.pICMS) / 100,-2);
                                                      ICMS.modBCST := dbisMargemValorAgregado;
                                                      ICMS.pMVAST := 0;
                                                      ICMS.pRedBCST := 00.00;
                                                      ICMS.vBCST := 0;
                                                      ICMS.pICMSST := 00.00;
                                                      ICMS.vICMSST := 0;
                                                      ICMS.pCredSN := 0.0; // Colocar o percentual do Cr�dito
                                                      ICMS.vCredICMSSN := 0.0; // Colocar o valor do Cr�dito
                                                      end;

                                       end;
                                       with ICMSUFDest do
                                            begin
                                            vBCUFDest      := 0.00;
                                            pFCPUFDest     := 0.00;
                                            pICMSUFDest    := 0.00;
                                            pICMSInter     := 0.00;
                                            pICMSInterPart := 0.00;
                                            vFCPUFDest     := 0.00;
                                            vICMSUFDest    := 0.00;
                                            vICMSUFRemet   := 0.00;
                                            end;
                                       end;
                                  end
                               else
                                  begin
                                  with ICMS do
                                       begin
                                       if (grid.Cell[11, i].asstring = '000') then
                                          CST := cst00
                                       else
                                       if (grid.Cell[11, i].asstring = '010') then
                                          CST := cst10
                                       else
                                       if (grid.Cell[11, i].asstring = '020') then
                                          CST := cst20
                                       else
                                       if (grid.Cell[11, i].asstring = '030') then
                                          CST := cst30
                                       else
                                       if (grid.Cell[11, i].asstring = '040') then
                                          CST := cst40
                                       else
                                       if (grid.Cell[11, i].asstring = '050') then
                                          CST := cst50
                                       else
                                       if (grid.Cell[11, i].asstring = '060') then
                                          CST := cst60
                                       else
                                       if (grid.Cell[11, i].asstring = '070') then
                                          CST := cst70
                                       else
                                       if (grid.Cell[11, i].asstring = '080') then
                                          CST := cst80
                                       else
                                       if (grid.Cell[11, i].asstring = '090') then
                                          CST := cst90;
                                       case ICMS.CST of
                                            cst00 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.modBC := dbiValorOperacao;
                                                    ICMS.vBC := RoundTo(grid.Cell[9, i].asfloat,-2);;
                                                    ICMS.pICMS := RoundTo(grid.Cell[10, i].asfloat,-2);
                                                    ICMS.vICMS := RoundTo((ICMS.vBC * ICMS.pICMS) / 100,-2);
                                                    total_icms := total_icms + ICMS.vICMS;
                                                    total_base := total_base + ICMS.vBC;
                                                    end;
                                            cst10 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.modBC := dbiValorOperacao;
                                                    ICMS.vBC := RoundTo(grid.Cell[9, i].asfloat,-2);;
                                                    ICMS.pICMS := RoundTo(grid.Cell[10, i].asfloat,-2);;
                                                    ICMS.vICMS := RoundTo((ICMS.vBC * ICMS.pICMS) / 100,-2);
                                                    ICMS.modBCST := dbisMargemValorAgregado;
                                                    ICMS.pMVAST := 0;
                                                    ICMS.pRedBCST := 00.00;
                                                    ICMS.vBCST := 0;
                                                    ICMS.pICMSST := 00.00;
                                                    ICMS.vICMSST := 0;
                                                    total_icms := total_icms + ICMS.vICMS;
                                                    total_base := total_base + ICMS.vBC;
                                                    end;
                                            cst20 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.modBC := dbiValorOperacao;
                                                    ICMS.pRedBC := 0.00;
                                                    ICMS.vBC := RoundTo(grid.Cell[9, i].asfloat,-2);;
                                                    ICMS.pICMS := RoundTo(grid.Cell[10, i].asfloat,-2);;
                                                    ICMS.vICMS := RoundTo((ICMS.vBC * ICMS.pICMS) / 100,-2);
                                                    ICMS.vICMSDeson := 0.00;
                                                    //icms.motDesICMS :=
                                                    total_icms := total_icms + ICMS.vICMS;
                                                    total_base := total_base + ICMS.vBC;
                                                    end;
                                            cst30 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.modBCST := dbisMargemValorAgregado;
                                                    ICMS.pMVAST := 0.00;
                                                    ICMS.pRedBCST := 0.00;
                                                    ICMS.vBCST := 0;
                                                    ICMS.pICMSST := 0;
                                                    ICMS.vICMSST := 0;
                                                    ICMS.vICMSDeson := 0.00;
                                                    //icms.motDesICMS :=
                                                    end;
                                            cst40, cst41, cst50 : begin
                                                                  ICMS.orig    := oeNacional;
                                                                  ICMS.vICMSDeson := 0.00;
                                                                  //icms.motDesICMS :=
                                                                  end;
                                            cst51 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.modBC := dbiValorOperacao;
                                                    ICMS.pRedBC := 0.00;
                                                    ICMS.vBC := RoundTo(grid.Cell[9, i].asfloat,-2);;
                                                    ICMS.pICMS := RoundTo(grid.Cell[10, i].asfloat,-2);;
                                                    ICMS.vICMSOp := 0.00;
                                                    ICMS.pDif := 0.00;
                                                    ICMS.vICMSDif := 0.00;
                                                    ICMS.vICMS :=RoundTo((ICMS.vBC * ICMS.pICMS) / 100,-2);
                                                    total_icms := total_icms + ICMS.vICMS;
                                                    total_base := total_base + ICMS.vBC;
                                                    end;
                                            cst60 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.vBCSTRet := 0.00;
                                                    ICMS.vICMSSTRet := 0.00;
                                                    end;
                                            cst70 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.modBC := dbiValorOperacao;
                                                    ICMS.pRedBC := 0.00;
                                                    ICMS.vBC := RoundTo(grid.Cell[9, i].asfloat,-2);;
                                                    ICMS.pICMS := RoundTo(grid.Cell[10, i].asfloat,-2);;
                                                    ICMS.vICMS := RoundTo((ICMS.vBC * ICMS.pICMS) / 100,-2);
                                                    ICMS.modBCST := dbisMargemValorAgregado;
                                                    ICMS.pMVAST := 0.00;
                                                    ICMS.pRedBCST := 0.00;
                                                    ICMS.vBCST := 0.00;
                                                    ICMS.pICMSST := 0.00;
                                                    ICMS.vICMSST := 0.00;
                                                    ICMS.vICMSDeson := 0.00;
                                                    //ICMS.motDesICMS
                                                    total_icms := total_icms + ICMS.vICMS;
                                                    total_base := total_base + ICMS.vBC;
                                                    end;
                                            cst90 : begin
                                                    ICMS.orig    := oeNacional;
                                                    ICMS.modBC := dbiValorOperacao;
                                                    ICMS.vBC := RoundTo(grid.Cell[9, i].asfloat,-2);;
                                                    ICMS.pRedBC := 0.00;
                                                    ICMS.pICMS := RoundTo(grid.Cell[10, i].asfloat,-2);;
                                                    ICMS.vICMS := RoundTo((ICMS.vBC * ICMS.pICMS) / 100,-2);
                                                    ICMS.modBCST := dbisMargemValorAgregado;
                                                    ICMS.pMVAST := 0.00;
                                                    ICMS.pRedBCST := 0.00;
                                                    ICMS.vBCST := 0.00;
                                                    ICMS.pICMSST := 0.00;
                                                    ICMS.vICMSST := 0.00;
                                                    ICMS.vICMSDeson := 0.00;
                                                    //ICMS.motDesICMS
                                                    total_icms := total_icms + ICMS.vICMS;
                                                    total_base := total_base + ICMS.vBC;
                                                    end;
                                       end;
                                       end;
                                  end;
                               end;
                          end;
                     end;

                  end;
                  //total_desconto := total_desconto + rTotal_desconto;
                  Total.ICMSTot.vBC := total_base;
                  Total.ICMSTot.vICMS := total_icms;
                  Total.ICMSTot.vBCST := 0;
                  Total.ICMSTot.vST := 0;
                  Total.ICMSTot.vProd := total_produtos;
                  Total.ICMSTot.vFrete := 0;
                  Total.ICMSTot.vSeg := 0;
                  Total.ICMSTot.vDesc := RoundTo(total_desconto,-2);
                  Total.ICMSTot.vII := 0;
                  Total.ICMSTot.vIPI := 0;
                  Total.ICMSTot.vPIS := 0;
                  Total.ICMSTot.vCOFINS := 0;
                  Total.ICMSTot.vOutro := rTotal_Acrescimo;
                  Total.ICMSTot.vNF := RoundTo(total_produtos-total_desconto+rTotal_Acrescimo,-2);

                  // partilha do icms e fundo de pobreza
                  Total.ICMSTot.vFCPUFDest   := 0.00;
                  Total.ICMSTot.vICMSUFDest  := 0.00;
                  Total.ICMSTot.vICMSUFRemet := 0.00;

                  Total.ISSQNtot.vServ := 0;
                  Total.ISSQNtot.vBC := 0;
                  Total.ISSQNtot.vISS := 0;
                  Total.ISSQNtot.vPIS := 0;
                  Total.ISSQNtot.vCOFINS := 0;
                  Total.ICMSTot.vTotTrib := total_trib;

                  Transp.modFrete := mfSemFrete; // NFC-e n�o pode ter FRETE
                  PTroco := 0;
                  PTroco := ed_troco.Value;
                  pag.vTroco := PTroco;

                    {
                    if ed_troco.Value > 0 then begin
                      if ed_forma1.value > 0 then begin
                        if ed_forma2.value > 0 then begin
                          if ed_forma3.value > 0 then begin
                            PTroco := (ed_troco.Value/3);
                          end else begin
                            PTroco := (ed_troco.Value/2);
                          end;
                        end else begin
                          PTroco := ed_troco.Value;
                        end;
                      end;
                      pag.vTroco := PTroco;
                    end; }

                  if ed_forma1.value > 0 then
                     begin
                     with pag.add do // PAGAMENTOS apenas para NFC-e
                          begin
                          if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
                             (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
                            tPag := fpCheque;
                          if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Crediario)) then
                            tPag := fpCreditoLoja;
                          if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) then
                              begin
                              tPag := fpCartaoDebito;
                              tBand := tBanceira01.Bandeira;
                              tpIntegra := tiPagNaoIntegrado;
                              end;
                          if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
                              begin
                              tPag := fpCartaoCredito;
                              tBand := tBanceira01.Bandeira;
                              tpIntegra := tiPagNaoIntegrado;
                              end;
                          if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_dinheiro)) then
                              tPag := fpDinheiro;
                          if (AnsiUpperCase(cb_forma1.text) = AnsiUpperCase(lForma_pgto_Convenio)) then
                              tPag := fpCreditoLoja;
                              vPag := ed_forma1.value {- PTroco};
                          end;
                      end;

                  if ed_forma2.value > 0 then
                     begin
                     with pag.add do // PAGAMENTOS apenas para NFC-e
                          begin
                          if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
                               (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
                             tPag := fpCheque;
                          if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Crediario)) then
                             tPag := fpCreditoLoja;
                          if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) then
                              begin
                              tPag := fpCartaoDebito;
                              tBand := tBanceira02.Bandeira;
                              tpIntegra := tiPagNaoIntegrado;
                              end;
                          if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
                              begin
                              tPag := fpCartaoCredito;
                              tBand := tBanceira02.Bandeira;
                              tpIntegra := tiPagNaoIntegrado;
                              end;
                          if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_dinheiro)) then
                              tPag := fpDinheiro;
                          if (AnsiUpperCase(cb_forma2.text) = AnsiUpperCase(lForma_pgto_Convenio)) then
                              tPag := fpCreditoLoja;
                              vPag := ed_forma2.value {- PTroco};
                          end;
                     end;

                    if ed_forma3.value > 0 then
                       begin
                       with pag.add do // PAGAMENTOS apenas para NFC-e
                            begin
                            if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) or
                               (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cheque_Avista)) then
                               tPag := fpCheque;
                            if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Crediario)) then
                               tPag := fpCreditoLoja;
                            if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cartao_Debito)) then
                               begin
                               tPag := fpCartaoDebito;
                               tBand := tBanceira03.Bandeira;
                               tpIntegra := tiPagNaoIntegrado;
                               end;
                            if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Cartao_Credito)) then
                               begin
                               tPag := fpCartaoCredito;
                               tBand := tBanceira03.Bandeira;
                               tpIntegra := tiPagNaoIntegrado;
                               end;
                            if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_dinheiro)) then
                              tPag := fpDinheiro;
                            if (AnsiUpperCase(cb_forma3.text) = AnsiUpperCase(lForma_pgto_Convenio)) then
                              tPag := fpCreditoLoja;
                            vPag := ed_forma3.value {- PTroco};
                            end;
                       end;
                       InfAdic.infCpl := 'Atendente: ' + sNome_Operador;
                       if sVendedorNome <> '' then
                          InfAdic.infCpl := InfAdic.infCpl + ';Vendedor: ' + sVendedorNome;
                       if sMensagem_Cupom.Lines.Text <> '' then
                          InfAdic.infCpl := InfAdic.infCpl + ';' + sMensagem_Cupom.Lines.Text;
                          InfAdic.infAdFisco := '';
              end;
         end;

  except
    on e: exception do
      application.messagebox(pwidechar('Erro na gera��o da NFCE' + #13 +
        'Erro: ' + e.Message), 'Erro', mb_ok + MB_ICONERROR);
  end;
end;

procedure TfrmVenda.PrepararNFCE;
begin
  nfce_autorizada := false;
  frmmodulo.LerConfiguracao;
  if EdFormatoOff = 0 then
    frmtOffLine := teContingencia
  else
    frmtOffLine := teOffLine;

  vAux := frmmodulo.codifica('888888');
  vNumNFCe := StrToInt(vAux);
  vSincrono := '1';
  vNumLote := vAux;
  Sincrono := true;
  with frmmodulo do
  begin
    try
      ACBRNFCe.NotasFiscais.clear;

      Imprime_display('AGUARDE...  GERANDO NFC-E', CLWHITE, tiLivre);
      grid.Repaint;
      GerarNFCe(vAux);

      Imprime_display('AGUARDE...  ASSINANDO NFC-E', CLWHITE, tiLivre);
      grid.Repaint;
      ACBRNFCe.NotasFiscais.Assinar;

      Imprime_display('AGUARDE...  VALIDANDO NFC-E', CLWHITE, tiLivre);
      grid.Repaint;
      ACBRNFCe.NotasFiscais.Validar;

      if ACBRNFCe.Configuracoes.Geral.FormaEmissao <> frmtOffLine then begin
        Imprime_display('AGUARDE...  ENVIANDO NFC-E', CLWHITE, tiLivre);
        grid.Repaint;
        try
          ACBRNFCe.Enviar(vNumLote, false, Sincrono);
        except
          on e: exception do begin
            Application.MessageBox(PWideChar(e.Message),'Aten��o!',MB_ICONINFORMATION);
            bt_cancelar_fechamento.Click;
            Exit;
          end;
        end;
        if ACBRNFCe.NotasFiscais.Items[0].Confirmada then begin
          If ACBRNFCe.WebServices.Enviar.cStat = 100 then
          begin
            cStatus := 100;
            ChaveNFCE := ACBRNFCe.NotasFiscais.Items[0].NFe.infNFe.Id;
            NumeroNFCe := strtoint(vAux);
          end;
        end else begin
          Imprime_display(ACBRNFCe.WebServices.Enviar.xMotivo, CLWHITE, tiLivre);
        end;
      end else begin
        ChaveNFCE := ACBRNFCe.NotasFiscais.Items[0].NFe.infNFe.Id;
        NumeroNFCe := strtoint(vAux);
      end;
      ACBRDANFENFCe.FastFile := 'C:\ACTHAUROS\PDV\Schemas\DANFeNFCe.fr3';
      if FileExists(frmPrincipal.LerINi(sConfiguracoes, 'PDV',
        'CAMINHO_LOGO', '')) then
        ACBRDANFENFCe.Logo := frmPrincipal.LerINi(sConfiguracoes, 'PDV',
          'CAMINHO_LOGO', '');
      ACBRDANFENFCe.Detalhado := true;
      ACBRDANFENFCe.vTroco := ed_troco.value;

      ACBRDANFENFCe.vTroco := ed_troco.Value;
      ACBRDANFENFCe.Impressora := edImpressora;
      ACBRDANFENFCe.DescricaoViaEstabelec := edDescEsta;
      ACBRDANFENFCe.EspessuraBorda := edMargem;
      ACBRDANFENFCe.MargemDireita := edMargDir;
      ACBRDANFENFCe.MargemEsquerda := edMargEsq;
      ACBRDANFENFCe.MargemSuperior := edMargSup;
      ACBRDANFENFCe.MargemInferior := edMarginf;
      ACBRDANFENFCe.MostrarPreview := edPreview;
      ACBRNFCe.NotasFiscais.Imprimir;
      ACBRNFCe.NotasFiscais.clear;

      if (cStatus = 100) or (frmModulo.ACBRNFCe.Configuracoes.Geral.FormaEmissao = frmtOffLine)  then
        nfce_autorizada := true
      else
        nfce_autorizada := false;
    except
      on e: exception do
      begin
        frmmodulo.codifica('888888','D');
        application.messagebox(pwidechar('Erro na gera��o da NFCE' + #13 +
          'Erro: ' + e.Message), 'Erro', mb_ok + MB_ICONERROR);
        nfce_autorizada := false;
      end;

    end;

  end;

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_trocoChange(Sender: TObject);
begin
  if ed_troco.value > 0 then
    ed_troco.Font.Color := clred else
    ed_troco.Font.Color := clwhite;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_qtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    if rProd_qtde <> ed_qtde.value then begin
      rProd_qtde := ed_qtde.value;
      if bTruncar_valor then
        rprod_total := Truncar_Valor(rprod_qtde * rprod_preco)
      else
        rprod_total := rprod_qtde * rprod_preco;
    end;
    if (bMuda_unitario) and not(bProd_promocao) then begin
      Imprime_display(sProd_nome, clWhite, tiInfo);
      ed_unitario.ReadOnly := false;
      ed_unitario.setfocus;
      exit;
    end else begin
      if (rprod_total <= 0) or (rprod_qtde <= 0) or (rProd_preco <= 0) then begin
        Imprime_display('TOTAL N�O PODE SER ZERADO OU NEGATIVO!', CLRED, TIERRO);
        SLEEP(2000);
        EXIT;
      end;
      ed_barra.text := '';
      Registra_Item;
    end;
  end;
end;

procedure TfrmVenda.ed_qtdeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_qtdeEnter(Sender: TObject);
begin
//  Imprime_display('QUANTIDADE...',CLWHITE,tiInfo);
  // ativar os atalhos das funcoes OPCOES
  PopupMenu := pop_principal;
  // esconder o panel de cancelamento de item, caso esteja visivel
  if pn_cancelar_item.Visible then
  begin
    pn_cancelar_item.Visible := false;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_unitarioEnter(Sender: TObject);
begin
//  Imprime_display('VALOR UNIT�RIO...',CLWHITE,tiInfo);
  // ativar os atalhos das funcoes OPCOES
  PopupMenu := pop_principal;
  // esconder o panel de cancelamento de item, caso esteja visivel
  if pn_cancelar_item.Visible then
  begin
    pn_cancelar_item.Visible := false;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_total_itemEnter(Sender: TObject);
begin
//  Imprime_display('VALOR TOTAL...',CLWHITE,tiInfo);
  // ativar os atalhos das funcoes OPCOES
  PopupMenu := pop_principal;
  // esconder o panel de cancelamento de item, caso esteja visivel
  if pn_cancelar_item.Visible then
  begin
    pn_cancelar_item.Visible := false;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_senhaEnter(Sender: TObject);
begin
  if iTeclado_Modelo = 1 then
  begin
    LineFeed;
    CarRet;
  end;
  PopupMenu := nil;
  Imprime_display('SENHA/CART�O DE CANCELAMENTO...', clYellow, tiAlerta);
  // controlar a saida do edit de cancelamento de item
  bSair_campo := false;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_senhaExit(Sender: TObject);
begin
  // nao permitir a saida do campo clicando com o mouse em outro lugar
  // ou pressionando tab
  if not bsair_campo then ed_senha.setfocus;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_senhaKeyPress(Sender: TObject; var Key: Char);
begin


  if key = #13 then
  begin
    if iTeclado_modelo = 1 then
    begin
       //frmModulo.teclado_display.ExibirLinha(2,'',TACBrDISAlinhamento( 2) ) ;
    end;
    if Executa_Login('DELPHOS', ed_senha.text, '') then
    begin
      bSair_campo := true;
      pn_senha_cancelar.Visible := false;
      if lb_cancelar.caption = 'Cancelar Item' then Cancela_Item(ed_cancelar_item.text);
      if lb_cancelar.caption = 'Cancelar Cupom' then
        if bVenda then
          Cancela_cupom_aberto
        else
          Cancela_cupom_fechado;
    end
    else
    begin
      Imprime_display('N�O AUTORIZADO!', CLRED, tiErro);
      Sleep(1500);
      Imprime_display_anterior;
      ed_senha.Text := '';
    end;
  end
  else
  begin
    if key = #27 then
    begin
      // aborta o cancelamento do item
      bSair_campo := true;
      pn_senha_cancelar.Visible := false;
      Imprime_display('INFORME O PRODUTO...', CLWHITE, tiLivre);
      pn_cancelar_item.Visible := FALSE;
      ED_BARRA.SETFOCUS;
    end
    else
    begin
      if iTeclado_Modelo = 1 then
      begin
        if key = #8 then strpcopy(@men, key) else strpcopy(@men, '*');
        DispStr(@men);
      end;
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.timer_balancaTimer(Sender: TObject);
begin
  frmModulo.balanca.LePeso(ibal_time);
  Imprime_display('Peso: ' + formatfloat('###,###,##0.000', rbal_peso), clyellow, tipeso);
  application.ProcessMessages;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.AcionaBalana1Click(Sender: TObject);
begin
  if frmmodulo.balanca.Modelo <> balNenhum then
  begin
    try
      frmmodulo.balanca.ativar;
      frmmodulo.balanca.Ativo := true;
    except
    end;
    timer_balanca.Enabled := true;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma1Enter(Sender: TObject);
begin
  Imprime_display('Escolha a Forma de Pagamento...(F11 Retorna)', clwhite, tiPgto);
  if iTeclado_modelo = 1 then
  begin
    strpcopy(@men, '----> ' + trimleft(trimright(tiraacento_display(cb_forma1.text)))
      + '                          ');
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma1Change(Sender: TObject);
begin
  if iTeclado_Modelo = 1 then
  begin
    CarRet;
    strpcopy(@men, '----> ' + trimleft(trimright(tiraacento_display(cb_forma1.text)))
      + '                          ');
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma2Enter(Sender: TObject);
begin
  Imprime_display('Escolha a 2a. Forma de Pgto...(F11 Retorna)', clwhite, tiPgto);
  if iTeclado_modelo = 1 then
  begin
    strpcopy(@men, '----> ' + trimleft(trimright(tiraacento_display(cb_forma2.text)))
      + '                          ');
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma2Change(Sender: TObject);
begin
  if iTeclado_Modelo = 1 then
  begin
    CarRet;
    strpcopy(@men, '----> ' + trimleft(trimright(tiraacento_display(cb_forma2.text)))
      + '                          ');
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma3Change(Sender: TObject);
begin
  if iTeclado_Modelo = 1 then
  begin
    CarRet;
    strpcopy(@men, '----> ' + trimleft(trimright(tiraacento_display(cb_forma3.text)))
      + '                          ');
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.cb_forma3Enter(Sender: TObject);
begin
  Imprime_display('Escolha a 3a. Forma de Pgto...(F11 Retorna)', clwhite, tiPgto);
  if iTeclado_modelo = 1 then
  begin
    strpcopy(@men, '----> ' + trimleft(trimright(tiraacento_display(cb_forma3.text)))
      + '                          ');
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma1KeyPress(Sender: TObject; var Key: Char);
begin
  if iTeclado_Modelo = 1 then
  begin
    if blimpa_edit_display then
    begin
      CarRet;
      strpcopy(@men, '                       ');
      DispStr(@men);
      CarRet;
      bLimpa_edit_display := false;
    end;
    strpcopy(@men, key);
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_forma2KeyPress(Sender: TObject; var Key: Char);
begin
  if iTeclado_Modelo = 1 then
  begin
    strpcopy(@men, key);
    DispStr(@men);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ConsultadeClientes1Click(Sender: TObject);
begin
  Imprime_display('Consulta Cliente', clwhite, tiCliente);
  frmCliente_consulta := tfrmCliente_consulta.create(self);
  frmCliente_consulta.showmodal;
  FreeAndNil(frmCliente_consulta);
  Imprime_display_anterior;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ConsultadePreos1Click(Sender: TObject);
begin
  Imprime_display('Consulta de Pre�o', clwhite, tiPgto);
  //abre a tela de consulta de preco
  frmpreco_consulta := tfrmpreco_consulta.create(self);
  frmpreco_consulta.showmodal;
  Imprime_display_anterior;
end;

procedure TfrmVenda.CorEditTotaL;
begin
  if frmPrincipal.TipoImpressora = SemImpressora then begin
    barraAtalho.Color := $006A3500;
//    ed_barra.Color := $00824100;
//    ed_barra.DisabledColor := $00824100;
//    ed_barra.FocusColor := $00824100;
//    ed_barra.FrameColor := $00824100;
//    ed_barra.FrameHotColor := $00824100;
  end else begin
    barraAtalho.Color := $00134017;
//    ed_barra.Color := $00134017;
//    ed_barra.DisabledColor := $00134017;
//    ed_barra.FocusColor := $00134017;
//    ed_barra.FrameColor := $00134017;
//    ed_barra.FrameHotColor := $00134017;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Opes1Click(Sender: TObject);
begin
  // mostrar o panel contendo a legenda dos comandos do menu OPCOES
  pop_principal.Popup(frmvenda.left + 360, frmvenda.top + 330);
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.PesquisadeProdutos1Click(Sender: TObject);
begin
  frmProduto_consulta := tfrmproduto_consulta.create(self);
  iPesquisa_produto := 0;
  frmProduto_consulta.showmodal;

  if iProd_codigo > 0 then
    ed_barra.Text := IntToStr(iProd_codigo);

end;

procedure TfrmVenda.pn_fechamentoClick(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Cupons1Click(Sender: TObject);
begin
  if not bVenda then
  begin
  frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;
  if not bSupervisor_autenticado then
     Exit;
  frmcupom_menu := tfrmcupom_menu.create(self);
  frmcupom_menu.showmodal;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Cancelar1Click(Sender: TObject);
begin
  if bBusca_foto_produto then
  begin
    img_produto.Visible := true;
  end;

  pn_fechamento.Visible := false;
  FRMVENDA.PopupMenu := pop_principal;
  pn_principal.Enabled := true;
  ed_barra.setfocus;
  if not bTotalizado then
    Imprime_display('INFORME O PRODUTO...', clwhite, tiLivre);

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.bt_cancelar_fechamentoClick(Sender: TObject);
begin
  if bBusca_foto_produto then
  begin
    img_produto.Visible := true;
  end;

  pn_fechamento.Visible := false;
  FRMVENDA.PopupMenu := pop_principal;
  pn_principal.Enabled := true;
  ed_barra.setfocus;
  if not bTotalizado then
    Imprime_display('INFORME O PRODUTO...', clwhite, tiLivre);
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.AcionaGaveta1Click(Sender: TObject);
begin
  try

    if frmPrincipal.GavetaImpressora = GavImpFiscal then
      cECF_Abre_Gaveta(iECF_Modelo)
    else
      if frmPrincipal.GavetaImpressora = GavImpNaoFiscal then
        AcionaGavetaNaoFiscal(sPortaGaveta);

  except
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.FecharCaixa1Click(Sender: TObject);
begin
  frmsenha_supervisor := tfrmsenha_supervisor.create(self);
  frmsenha_supervisor.showmodal;
  frmvenda.Imprime_display_anterior;

  if not bSupervisor_autenticado then
    Exit;

  try
    pn_tampa.Visible := true;
    frmCaixa_Fechamento := tfrmcaixa_fechamento.create(self);
    frmCaixa_fechamento.showmodal;
  finally
    pn_tampa.visible := false;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.FormShow(Sender: TObject);
var
  I: integer;
  sImgFundo: string;
  sCupomAbertoECF: string;
begin
  Limpa_controles;
  bMudouProvisorio := False;
  if frmPrincipal.LerINi(ExtractFilePath(Application.ExeName) + 'CFG\cfg.ini', 'PDV', 'Inicia', 'F') = 'F' then
    iImpressora := 0
  else
    iImpressora := 1;

  ImgTipoImpressora(iImpressora);
  CorEditTotaL;
 // CentralizarPanel(pnFundo);
  sCupomAbertoECF := '';
  cpBarra.Panels[5].Text := frmModulo.Conexao_Servidor.Server;

  sImgFundo := ExtractFilePath(Application.ExeName) + 'img\fundo_venda.jpg';

  if FileExists(sImgFundo) then
    imgFundo.Picture.LoadFromFile(sImgFundo);

  bIdentificarVendedor := LerParametro('INFORMAR_VENDEDOR', 'I', 0);
  iColunaCOnsultaProdutos := LerParametro('COLUNA_CONSULTA_PRODUTOS', 'I', 0);

  timer_cargaTimer(frmvenda);

  grid.ClearRows;

  frmMsg_Operador.lb_msg.caption := 'Aguarde! Verificando status do Cupom Fiscal...';
  frmMsg_Operador.Show;
  frmMsg_Operador.Refresh;
  Application.ProcessMessages;

  if not bCaixa_aberto then
  begin
    frmcaixa_abertura := tfrmcaixa_abertura.create(self);
    frmcaixa_abertura.showmodal;

    if not bCaixa_aberto then
    begin
      application.messagebox(pwidechar('As fun��es de venda ser�o bloqueadas!'),
        'Aten��o', mb_ok + MB_ICONWARNING);

    end;
  end;

  // verificar se existem cupons abertos e fazer o tratamento //**
  if (frmPrincipal.TipoImpressora = Fiscal) then
    sCupomAbertoECF := cECF_Cupom_Fiscal_Aberto(iECF_Modelo)
  else
    sCupomAbertoECF := lerINI(sConfiguracoes, 'PDV', 'Aberto', 'NAO');

  if (sCupomAbertoECF = 'SIM') or (bcupom_aberto) then
  begin
    frmMsg_Operador.lb_msg.caption := 'Aguarde! Recuperando dados do cupom em aberto...';
    frmMsg_Operador.Show;
    frmMsg_Operador.Refresh;
    Application.ProcessMessages;

    query.close;
    query.sql.clear;
    query.sql.add('select * from cupom_temp');
    query.open;

    if query.RecordCount > 0 then
    begin
      sNumero_Cupom := query.fieldbyname('numero').asstring;
      sNumero_Venda := QUERY.FIELDBYNAME('NUMERO').asstring;
      hHora_Cupom := query.fieldbyname('hora').AsDateTime;
      sNumero_contador_cupom := query.fieldbyname('ccf').asstring;

            // alimentar as variaveis de status
      bVenda := true;

      if query.fieldbyname('totalizado').asinteger = 0 then
        bTotalizado := false
      else
        bTotalizado := true;
      if query.fieldbyname('pago1').asinteger = 0 then
        bPago1 := false
      else
        bPago1 := true;

      if query.fieldbyname('pago2').asinteger = 0 then
        bPago2 := false
      else
        bPago2 := true;
      if query.fieldbyname('pago3').asinteger = 0 then
        bPago3 := false
      else
        bPago3 := true;
      if query.fieldbyname('finalizado').asinteger = 0 then
        bFinalizado := false
      else
        bFinalizado := true;
            // alimentar as variaveis de totais
      rTotal_Venda := 0;
      iTotal_itens := 0;
      lb_item.Caption := '000';
      lb_total.Caption := 'R$ 0,00';
      iItem := 1;
            // imprimir no grid o cabechalho do cupom
      grid_topo.ClearRows;
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        datetostr(dData_sistema) + '  ' + timetostr(hHora_Cupom) +
        '                         COO: ' + Zerar(sNumero_cupom, 6);
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        '--------------------------------------------------------';
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        '<B><FONT size="12">             CUPOM FISCAL</FONT></B>';
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        'ITEM C�DIGO DESCRI��O            QTDE.   PRE�O    TOTAL';
      grid_topo.AddRow(1);
      grid_topo.cell[0, grid_topo.LastAddedRow].asstring :=
        '--------------------------------------------------------';
            // limpar o grid dos itens
      grid.ClearRows;

      if bBusca_foto_produto then
      begin
              // img_shape.Visible := true;
        img_produto.Picture := nil;
      end;


            // alimentar o grid...

      query.close;
      query.sql.clear;
      query.sql.add('select item.*, prod.nome produto');
      query.sql.add('from cupom_item_temp item, estoque prod');
      query.sql.add('where item.cod_produto = prod.codigo');
      query.sql.add('order by item.item');
      query.open;

      query.first;
      while not query.eof do
      begin
        if query.fieldbyname('cancelado').asinteger = 0 then
        begin
                // Registrar item no Grid
          grid.AddRow(1);
          grid.cell[0, grid.LastAddedRow].asstring := zerar(query.fieldbyname('item').asstring, 4) + ' ' +
            zerar(query.fieldbyname('cod_produto').asstring, 6) + ' ' +
            texto_justifica(query.fieldbyname('produto').asstring, 15, ' ', taEsquerda) + ' ' +
            texto_justifica(query.fieldbyname('unidade').asstring, 2, ' ', taEsquerda) +
            texto_justifica(formatfloat(
            '###,###,##0.000', query.fieldbyname('qtde').asfloat),
            9, ' ', taDireita) +
            texto_justifica(formatfloat(
            '###,###,##0.00', query.fieldbyname('valor_unitario').asfloat),
            8, ' ', taDireita) +
            texto_justifica(formatfloat(
            '###,###,##0.00', query.fieldbyname('valor_total').asfloat),
            8, ' ', taDireita);



                // alimentar os campos invisiveis do grid com as informacoes do produto
          grid.cell[1, grid.LastAddedRow].asinteger := 1; // venda de item
          grid.cell[2, grid.LastAddedRow].asSTRING := ZERAR(INTTOSTR(query.fieldbyname('item').asinteger), 3);
          grid.cell[3, grid.LastAddedRow].asinteger := query.fieldbyname('cod_produto').asinteger;
          grid.Cell[4, grid.LastAddedRow].asstring := query.fieldbyname('produto').asstring;
          grid.Cell[5, grid.LastAddedRow].asfloat := query.fieldbyname('qtde').asfloat;
          grid.Cell[6, grid.LastAddedRow].asfloat := query.fieldbyname('valor_unitario').asfloat;
          grid.Cell[7, grid.LastAddedRow].asfloat := query.fieldbyname('valor_desconto').asfloat;
          grid.Cell[8, grid.LastAddedRow].asfloat := query.fieldbyname('valor_acrescimo').asfloat;
          grid.Cell[9, grid.LastAddedRow].asfloat := query.fieldbyname('valor_total').asfloat;
          grid.Cell[10, grid.LastAddedRow].asfloat := query.fieldbyname('aliquota').asfloat;
          grid.Cell[11, grid.LastAddedRow].asstring := query.fieldbyname('cst').asstring;
          grid.cell[12, grid.LastAddedRow].AsString := query.fieldbyname('unidade').asstring;
          grid.cell[13, grid.LastAddedRow].asinteger := 0;
                // registrar o desconto e acrescimo em outra linha
          if query.fieldbyname('valor_desconto').asfloat > 0 then
          begin
            grid.AddRow(1);
            grid.cell[0, grid.LastAddedRow].asstring := '<i><FONT color="#FF0000">            ' +
              'Desconto em R$ ' +
              '          ' +
              texto_justifica(formatfloat(
              '###,###,##0.00', -query.fieldbyname('valor_desconto').asfloat),
              9, ' ', taDireita) + '</i></FONT>';
            grid.cell[1, grid.LastAddedRow].asinteger := 4; // desconto
          end;
          if query.fieldbyname('valor_acrescimo').asfloat > 0 then
          begin
            grid.AddRow(1);
            grid.cell[0, grid.LastAddedRow].asstring := '<i><FONT color="#0000FF">            ' +
              'Acr�scimo em R$' +
              '          ' +
              texto_justifica(formatfloat(
              '###,###,##0.00', query.fieldbyname('valor_acrescimo').asfloat),
              9, ' ', taDireita) + '</i></FONT>';
            grid.cell[1, grid.LastAddedRow].asinteger := 5; // acrescimo
          end;
                // acumluar o item nas variaveis de totalizacao
          rTotal_Venda := rTotal_venda + query.fieldbyname('valor_total').asfloat;
          Inc(iTotal_Itens);
          Inc(iItem);

        end
        else
        begin
                // I T E M   C A N C E L A D O


                // diminui os totalizadores
          Dec(iTotal_Itens);
          rTotal_Venda := rtotal_venda - query.fieldbyname('valor_total').asfloat;

                // Registrar item no Grid
          grid.AddRow(1);
          grid.cell[0, grid.LastAddedRow].asstring := '<FONT color="#FF0000">Cancelamento do Item ' + ZERAR(query.fieldbyname('item').asstring, 4) + '  ' +
            texto_justifica(formatfloat(
            '###,###,##0.000', -query.fieldbyname('qtde').asfloat),
            10, ' ', taDireita) +
            texto_justifica(formatfloat(
            '###,###,##0.00', query.fieldbyname('valor_unitario').asfloat),
            9, ' ', taDireita) +
            texto_justifica(formatfloat(
            '###,###,##0.00', -query.fieldbyname('valor_total').asfloat),
            9, ' ', taDireita) + '</FONT>';

                // alimentar os campos invisiveis do grid com as informacoes do produto

          grid.cell[1, grid.LastAddedRow].asinteger := 3; // cancelamento do item
          grid.cell[2, grid.LastAddedRow].asSTRING := ZERAR(INTTOSTR(query.fieldbyname('item').asinteger), 3);
          grid.cell[3, grid.LastAddedRow].asinteger := query.fieldbyname('cod_produto').asinteger;
          grid.Cell[4, grid.LastAddedRow].asstring := query.fieldbyname('produto').asstring;
          grid.Cell[5, grid.LastAddedRow].asfloat := query.fieldbyname('qtde').asfloat;
          grid.Cell[6, grid.LastAddedRow].asfloat := query.fieldbyname('valor_unitario').asfloat;
          grid.Cell[7, grid.LastAddedRow].asfloat := query.fieldbyname('valor_desconto').asfloat;
          grid.Cell[8, grid.LastAddedRow].asfloat := query.fieldbyname('valor_acrescimo').asfloat;
          grid.Cell[9, grid.LastAddedRow].asfloat := query.fieldbyname('valor_total').asfloat;
          grid.Cell[10, grid.LastAddedRow].asfloat := query.fieldbyname('aliquota').asfloat;
          grid.Cell[11, grid.LastAddedRow].asstring := query.fieldbyname('cst').asstring;
          grid.cell[12, grid.LastAddedRow].AsString := query.fieldbyname('unidade').asstring;
          grid.cell[13, grid.LastAddedRow].asinteger := 1;



        end;
        query.next;
      end;
            // atualizar os labels de totais e itens
      lb_item.Caption := inttostr(itotal_itens);
      lb_total.Caption := 'R$ ' + formatfloat('###,###,##0.00', rTotal_venda);


      frmMsg_Operador.hide;

      query.close;
      query.sql.clear;
      query.sql.add('select * from cupom_temp');
      query.open;

      if application.messagebox
        (pwidechar('Existe um cupom que n�o foi finalizado!' + #13 + 'N�mero: '
        + query.fieldbyname('numero').asstring + #13 + 'Data: ' +
        query.fieldbyname('data').asstring + #13 + 'Hora: ' +
        query.fieldbyname('hora').asstring + #13 +
        'Deseja prosseguir com o seu fechamento?'), 'Aten��o',
        mb_yesno + MB_ICONWARNING) = idyes then
      begin
            // prosseguir com a edicao do cupom
        ed_barra.SetFocus;
        with frmModulo do begin
          qrItens.DisableControls;
          qrItens.Close;
          qrItens.Open;
          qrItens.Last;
          qrItens.EnableControls;
        end;

      end
      else
      begin
              // cancelar cupom
        Cancela_cupom_aberto;
      end;
    end //     if query.RecordCount > 0 then
    else
    begin
      if (frmPrincipal.TipoImpressora = Fiscal) then
      begin
        sNumero_Cupom := cECF_Numero_Cupom(EPSON);
        sNumero_contador_cupom := cECF_Numero_Contador_Cupom(EPSON);
      end
      else
      begin
        sNumero_Cupom := Zerar(FloatToStr(Max('')), 5);
        sNumero_contador_cupom := Zerar(sNumero_Cupom, 5);
      end;

      // GUIO: Caso n�o tenha itens, simplesmente cancela
      application.messagebox(pwidechar('Existe um cupom que n�o foi finalizado!'
        + #13 + 'N�mero: ' + sNumero_Cupom + #13 +
        'O cupom ser� cancelado automaticamente!'), 'Aten��o',
        mb_ok + MB_ICONWARNING);
      Cancela_Cupom_Aberto;
    end;

  end // final da verificacao do cupom aberto no comando da ecf
  else // NORMAL
    frmMsg_Operador.Hide;

  frmMsg_Operador.Hide;
  if sRamo_Tipo = '1' then
     begin

     ed_barra.setfocus;
     end
  else // AUTO PECAS
  if sRamo_Tipo = '2' then
     begin

      ed_barra.setfocus;
     end
  else // POSTO
  if sRamo_Tipo = '3' then
      begin

      end
  else // RESTAURANTES
  if sRamo_Tipo = '4' then
     begin
     ed_barra.setfocus;
     end;

end;

procedure TfrmVenda.Frx_ImpressaoVendaPreview(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Sangria1Click(Sender: TObject);
begin
  if not bVenda then
  begin
    frmsangria := tfrmsangria.create(self);
    frmsangria.showmodal;
  end;
end;

procedure TfrmVenda.sp_total_pagarContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Suprimento1Click(Sender: TObject);
begin
  if not bVenda then
  begin
    frmsuprimento := tfrmsuprimento.create(self);
    frmsuprimento.showmodal;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.EFCancelamento1Click(Sender: TObject);
begin
  if bTEF then
  begin
    frmTEF_Cancelamento := tfrmTEF_Cancelamento.create(self);
    frmTEF_Cancelamento.showmodal;
  end
  else
  begin
    Application.messagebox('M�dulo TEF n�o foi instalado!', 'Erro', mb_ok + mb_iconerror);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.EFModoAdministrativo1Click(Sender: TObject);
var txt: textfile;
begin
  if bTEF then
  begin
    frmTef_Bandeira := TfrmTef_Bandeira.create(self);
    frmTef_Bandeira.ShowModal;

    if (Tef_Bandeira_escolhida = Tef_Redecard) or
      (Tef_Bandeira_escolhida = Tef_visanet) or
      (Tef_Bandeira_escolhida = Tef_amex) then
    begin
      assignfile(txt, sTEFTemp_Path + 'gp.tmp');
      rewrite(txt);
      writeln(txt, 'REDECARD');
      closefile(txt);
      iTEFTecban := 0;
      TEFLimpaVariaveis;
      TEFModoAdministrativo;
      BlockInput(false);


      if (sTEFRetorno = '0') and (FileExists(sTEFTemp_Path + 'TEF.Imp')) then
      begin
        TEFImprimeTransacao('R');
        if sTEFRetorno = '0' then
          TEFFechaOperacao
        else
        begin
          TEFVerificaGerenciadorAtivo;
          TEFNaoConfirmaOperacao;
        end;
      end;
    end;

    if (Tef_Bandeira_escolhida = Tef_tecban) or
      (Tef_Bandeira_escolhida = Tef_tribanco) then
    begin
      if bTEF_TecBan then
      begin
        assignfile(txt, sTEFTemp_Path + 'gp.tmp');
        rewrite(txt);
        writeln(txt, 'TECBAN');
        closefile(txt);
        iTEFTecban := 1;
        TEFLimpaVariaveis;
        TEFModoAdministrativo;




        if (sTEFRetorno = '0') and (FileExists(sTEFTemp_Path + 'TEF.Imp')) then
        begin
          TEFImprimeTransacao('R');
          if sTEFRetorno = '0' then
            TEFFechaOperacao
          else
          begin
            TEFVerificaGerenciadorAtivo;
            TEFNaoConfirmaOperacao;
          end;
        end;
      end
      else
      begin
        application.messagebox('M�dulo do TecBan n�o foi instalado!', 'Erro', mb_ok + mb_iconerror);
      end;
    end;
    if Tef_Bandeira_escolhida = Tef_Hipercard then
    begin
      assignfile(txt, sTEFTemp_Path + 'gp.tmp');
      rewrite(txt);
      writeln(txt, 'HIPERCARD');
      closefile(txt);
      iTEFTecban := 2;
      TEFLimpaVariaveis;
      TEFModoAdministrativo;

      if (sTEFRetorno = '0') and (FileExists(sTEFTemp_Path + 'TEF.Imp')) then
      begin
        TEFImprimeTransacao('R');
        if sTEFRetorno = '0' then
          TEFFechaOperacao
        else
        begin
          TEFVerificaGerenciadorAtivo;
          TEFNaoConfirmaOperacao;
        end;
      end;
    end;
  end
  else
  begin
    Application.messagebox('M�dulo TEF n�o foi instalado!', 'Erro', mb_ok + mb_iconerror);
  end;

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.rocarOperador1Click(Sender: TObject);
begin
  sFuncao_Senha := '001';
  frmsenha := tfrmsenha.create(self);
  frmsenha.showmodal;


  if busuario_Autenticado then
  begin
    // mudar o nome do usuario na tela de venda
    cpBarra.Panels.Items[1].Text := copy(sNome_Operador, 1, 10);

    if frmPrincipal.TipoImpressora = Fiscal then
    begin
      application.MessageBox('Ser� emitida um leitura X para efeito de confer�ncia de caixa.',
        'Aviso', mb_ok + mb_iconinformation);



    // emitir uma leitura x
      repeat
        sMsg := cECF_LeituraX(iECf_modelo);
        if sMsg <> OK then
        begin
          if application.messagebox(pwidechar('Erro na impress�o da Leitura X' +
            #13 + 'Mensagem: ' + sMsg + #13 + 'Deseja tentar outra vez?'),
            'ECF', mb_yesno + MB_ICONERROR) = idno then
          begin
            break;
          end;
        end;
      until
        sMsg = OK;

    end; { fim impressora fiscal - leitura X}

    application.MessageBox('Troca efetuada com sucesso!', 'Aviso', mb_ok + mb_iconinformation);

  end;

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.C1Click(Sender: TObject);
begin
  frmIdentifica := TfrmIdentifica.Create(self);
  frmIdentifica.ShowModal;
  if sConsumidor_CPF <> '' then
    frmPrincipal.TipoImpressora := SemImpressora;
  CorEditTotaL;

end;

procedure TfrmVenda.CaixaIndisponvel1Click(Sender: TObject);
begin
  if bVenda then exit;
  if timer_balanca.Enabled then exit;

  frmProtetor_tela := TfrmProtetor_tela.Create(self);
  frmProtetor_tela.ShowModal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.menu_PrevendaClick(Sender: TObject);
begin
  if menu_Prevenda.Visible = false then exit;


  if bVenda then
  begin
    Imprime_display('Venda Aberta!', clred, tiErro);
    sleep(1500);
    Imprime_display_anterior;
    exit;
  end;

  if not bServidor_Conexao then
  begin
    repeat
      try
        frmModulo.Conexao_Servidor.Connected := false;
        frmModulo.Conexao_Servidor.Connected := true;
        bServidor_Conexao := true;
      except
        on E: exception do
        begin
          if application.messagebox
            (pwidechar('Erro na conex�o com o banco de dados do servidor!' + #13
            + 'Mensagem: ' + E.Message + #13 + 'Deseja tentar outra vez?'),
            'Erro', mb_yesno + MB_ICONERROR) = idno then
          begin
            break;
          end;
        end;
      end;
    until bServidor_Conexao = true;
  end;
  if not bServidor_Conexao then exit;

  bLanca_pre_venda := false;

  frmPre_Venda := tfrmPre_venda.create(self);
  frmPre_venda.showmodal;

  // iniciar a impressao da pre-venda
  if bLanca_pre_venda then
  begin
    Imprime_display('Iniciando impress�o da Pr�-venda!', clWhite, tiInfo);
    try
      // verificar o serial do ecf
      if frmPrincipal.TipoImpressora = Fiscal then
        if not verifica_ecf then exit;
      // Abrir o cupom fiscal
      // bloquear ao teclado
      //BlockInput(true);
      if not Abre_Venda then
      begin
        // Caso o comando de abertura de venda retornou false, abortar o processo;
        Imprime_display('ERRO AO ABRIR O CUPOM!', clRed, tiErro);
        exit;
      end;
    finally
      // desbloquear o teclado
      BlockInput(False);
    end;

    // vender os itens
    // rodar a query do modulo filtrada com os produtos da pre-venda
    frmmodulo.query_servidor.first;
    while not frmmodulo.query_servidor.eof do
    begin
      sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
      sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
      sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
      rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
      iProd_codigo := frmmodulo.query_servidor.fieldbyname('codproduto').asinteger;
      sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
      rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
      rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
      rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
      rProd_desconto := frmmodulo.query_servidor.fieldbyname('desconto').asfloat;
      rProd_acrescimo := frmmodulo.query_servidor.fieldbyname('acrescimo').asfloat;
      sProd_Tamanho := '';
      sProd_Cor := '';

      // registrar o item
      Registra_Item;
      Application.ProcessMessages;
      frmmodulo.query_servidor.next;
    end;
    FecharCupom1Click(frmVenda);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.MeiosdePagamento1Click(Sender: TObject);
begin
  frmMeios_pagamento := tfrmMeios_pagamento.create(self);
  frmMeios_pagamento.showmodal;


end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.AtualizarPDV1Click(Sender: TObject);
begin
{ if bVenda then
  begin
    Imprime_display('CUPOM ABERTO!',clYellow,tiAlerta);
    sleep(1500);
    Imprime_display('INFORME O PRODUTO...',clWhite,tiLivre);
    ed_barra.SetFocus;
    exit;
  end;

  Imprime_display('Aguarde! Atualizando PDV',clYellow,tiAlerta);
//Atualizar_PDV;
  Imprime_display_anterior;
}
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Oramento1Click(Sender: TObject);
begin
  if oramento1.visible = false then exit;

  if not bServidor_Conexao then
  begin
    repeat
      try
        frmModulo.Conexao_Servidor.Connected := false;
        frmModulo.Conexao_Servidor.Connected := true;
      except
        if application.messagebox
          (pwidechar('N�o foi poss�vel se conectar ao servidor!' + #13 +
          'Deseja tentar outra vez?'), 'Erro', mb_yesno + MB_ICONERROR) = idno
        then
          break;
      end;
    until frmModulo.conexao_servidor.Connected;
  end;

  if not bServidor_Conexao then exit;

  bLanca_OS := false;
  frmOrcamento_abrir := tfrmOrcamento_abrir.create(self);
  frmOrcamento_abrir.showmodal;

  // iniciar a impressao da pre-venda
  if bLanca_OS then
  begin
    Imprime_display('Iniciando impress�o do Cupom!', clWhite, tiInfo);
    try
      // verificar o serial do ecf
      if frmprincipal.TipoImpressora = fiscal then
        if not verifica_ecf then exit;
      // Abrir o cupom fiscal
      // bloquear ao teclado
      //BlockInput(true);
      if not Abre_Venda then
      begin
        // Caso o comando de abertura de venda retornou false, abortar o processo;
        Imprime_display('ERRO AO ABRIR O CUPOM!', clRed, tiErro);
        exit;
      end;
    finally
      // desbloquear o teclado
      BlockInput(False);
    end;

    // vender os itens
    // rodar a query do modulo filtrada com os produtos da pre-venda
    frmmodulo.query_servidor.first;
    while not frmmodulo.query_servidor.eof do
    begin
      sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
      sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
      sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
      rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
      iProd_codigo := frmmodulo.query_servidor.fieldbyname('codproduto').asinteger;
      sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
      rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
      rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
      rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
      rProd_desconto := frmmodulo.query_servidor.fieldbyname('desconto').asfloat;
      rProd_acrescimo := frmmodulo.query_servidor.fieldbyname('acrescimo').asfloat;
      sProd_Tamanho := '';
      sProd_Cor := '';

      // registrar o item
      Registra_Item;
      Application.ProcessMessages;
      frmmodulo.query_servidor.next;
    end;

    query.CLOSE;
    QUERY.SQL.CLEAR;
    QUERY.SQL.ADD('UPDATE DAV SET COO_CUPOM_FISCAL = ''' + sNumero_Cupom + ''',');
    QUERY.SQL.ADD('CCF = ''' + sNumero_contador_cupom + ''' where numero = ''' + SDAV_ATUALIZADO + '''');
    QUERY.ExecSQL;

    frmmodulo.query_servidor.close;
    frmmodulo.query_servidor.sql.clear;
    frmmodulo.query_servidor.sql.add('update c000074 set tipo = 10 where codigo = ''' + zerar(inttostr(iOS_codigo), 6) + '''');
    frmmodulo.query_servidor.ExecSQL;


    FecharCupom1Click(frmVenda);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Or�amentoClick(Sender: TObject);
var
  rValor_Temp: real;
  i, icont: integer;
  rvalor_total_convenio: real;
  NomeArquivo, sCod_Cupom: string;
  bLanca_comprovante_crediario,
    bLanca_Comprovante_Prestacao: boolean;
  sCOO_crediario, sGNF_Crediario: string;
  sCOO_Prestacao, sGNF_Prestacao, sGRG_Prestacao: string;
  sIdentificarVendedor: string;

  str: string;
  SR: TSearchRec;
  Origem, Destino: string;
begin
if frmprincipal.TipoImpressora = NaoFiscal then
          begin
          BlockInput(false);
          if application.messagebox
            (pwidechar('Confirma a Impressao do Or�amento?' + #13 ), 'Aviso', mb_yesno) = idno then

            exit;
          end;

      frmxloc_modelo := tfrmxloc_modelo.create(self);
      frmxloc_modelo.showmodal;

      query.close;
      query.sql.clear;
      query.sql.add('select TEMP.*, PRO.NOME');
      query.sql.add('FROM CUPOM_ITEM_TEMP TEMP, ESTOQUE PRO');
      query.sql.add('where TEMP.cod_produto = PRO.codigo AND');
      query.sql.add('TEMP.CANCELADO = 0 AND');
      query.sql.add('TEMP.cod_cupom = ''' +
      sNumero_Cupom + '''');
      query.ExecSQL;
      query.open;

      qrobs.close;
      qrobs.sql.clear;
      qrobs.sql.add('select pego_porquem');
      qrobs.sql.add('from cupom_item_temp');
      qrobs.sql.add('where');
      qrobs.sql.add('cod_cupom = ''' +
      sNumero_Cupom + '''');
      qrobs.ExecSQL;
      qrobs.open;

    FrxOr�amento.ShowReport();

    Cancela_Cupom_Aberto;
   end;

procedure TfrmVenda.AdvMetroButton1Click(Sender: TObject);
begin
  Sair1.Click;
end;

procedure TfrmVenda.AdvMetroButton2Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmVenda.Assinararquivo1Click(Sender: TObject);
begin
  frmmodulo.Dlg_arquivo.Filter := 'Arquivo Texto|*.txt';
  frmmodulo.Dlg_arquivo.Title := 'Assinar arquivo';
  if frmmodulo.Dlg_arquivo.Execute then
  begin
    assinatura_digital(frmmodulo.Dlg_arquivo.FileName);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Recebimento1Click(Sender: TObject);
begin
  if not bServidor_Conexao then
  begin
    repeat
      try
        frmModulo.Conexao_Servidor.Connected := false;
        frmModulo.Conexao_Servidor.Connected := true;
      except
        if application.messagebox
          (pwidechar('N�o foi poss�vel se conectar ao servidor!' + #13 +
          'Deseja tentar outra vez?'), 'Erro', mb_yesno + MB_ICONERROR) = idno
        then
          break;
      end;
    until frmModulo.conexao_servidor.Connected;
  end;

  if not bServidor_Conexao then exit;


//  frmContasReceber := tfrmcontasReceber.create(self);
  Application.CreateForm(tfrmcontasReceber, frmcontasReceber);
  frmContasReceber.showmodal;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Menu_osClick(Sender: TObject);
begin
//  if Menu_os.Visible = false then exit;


  if bVenda then
  begin
    Imprime_display('Venda Aberta!', clred, tiErro);
    sleep(1500);
    Imprime_display_anterior;
    exit;
  end;

  if not bServidor_Conexao then
  begin
    repeat
      try
        frmModulo.Conexao_Servidor.Connected := false;
        frmModulo.Conexao_Servidor.Connected := true;
        bServidor_Conexao := true;
      except
        on E: exception do
        begin
          if application.messagebox
            (pwidechar('Erro na conex�o com o banco de dados do servidor!' + #13
            + 'Mensagem: ' + E.Message + #13 + 'Deseja tentar outra vez?'),
            'Erro', mb_yesno + MB_ICONERROR) = idno then
          begin
            break;
          end;
        end;
      end;
    until bServidor_Conexao = true;
  end;
  if not bServidor_Conexao then exit;

  bLanca_OS := false;

  frmOS := tfrmOS.create(self);
  frmOS.showmodal;

  // iniciar a impressao da pre-venda
  if bLanca_OS then
  begin
    Imprime_display('Iniciando impress�o da O.S.!', clWhite, tiInfo);
    try
      // verificar o serial do ecf
      if not verifica_ecf then exit;
      // Abrir o cupom fiscal
      // bloquear ao teclado
      //BlockInput(true);
      if not Abre_Venda then
      begin
        // Caso o comando de abertura de venda retornou false, abortar o processo;
        Imprime_display('ERRO AO ABRIR O CUPOM!', clRed, tiErro);
        exit;
      end;
    finally
      // desbloquear o teclado
      BlockInput(False);
    end;

    // vender os servicos
    // fazer a soma dos serviso e lancar comO:
    // 9999999999999 Presta��o de Servi�o Municipal    Valor Unitario R$ 1,00   Nao Tributado

    frmmodulo.query_servidor2.SQL.CLEAR;
    frmmodulo.query_servidor2.SQL.ADD('select sum(valor) total from c000053');
    frmmodulo.query_servidor2.sql.add('where codos = ''' + zerar(inttostr(iOS_codigo), 6) + '''');
    frmmodulo.query_servidor2.OPEN;


    query.CLOSE;
    QUERY.SQL.CLEAR;
    QUERY.SQL.ADD('UPDATE DAV SET COO_CUPOM_FISCAL = ''' + sNumero_Cupom + ''',');
    QUERY.SQL.ADD('CCF = ''' + sNumero_contador_cupom + ''' where numero = ''' + SDAV_ATUALIZADO + '''');
    QUERY.ExecSQL;


    if frmmodulo.query_servidor2.fieldbyname('total').asfloat > 0 then
    begin
      sProd_nome := 'PRESTAC.DE SERVICO MUNICIPAL';
      sProd_unidade := 'UN';
      sProd_CST := '041';
      rProd_aliquota := 0;
      iProd_codigo := 999999;
      sProd_barra := '9999999999999';
      rProd_qtde := frmmodulo.query_servidor2.fieldbyname('total').asfloat;
      rProd_preco := 1;
      rProd_total := frmmodulo.query_servidor2.fieldbyname('total').asfloat;
      rProd_desconto := 0;
      rProd_acrescimo := 0;
      sProd_Tamanho := '';
      sProd_Cor := '';

      // registrar o item
      Registra_Item;
      Application.ProcessMessages;
    end;


    // vender os itens
    // rodar a query do modulo filtrada com os produtos da pre-venda
    frmmodulo.query_servidor.first;
    while not frmmodulo.query_servidor.eof do
    begin
      sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
      sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
      sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
      rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
      iProd_codigo := frmmodulo.query_servidor.fieldbyname('codproduto').asinteger;
      sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
      rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
      rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
      rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
      rProd_desconto := frmmodulo.query_servidor.fieldbyname('desconto').asfloat;
      rProd_acrescimo := frmmodulo.query_servidor.fieldbyname('acrescimo').asfloat;
      sProd_Tamanho := '';
      sProd_Cor := '';

      // registrar o item
      Registra_Item;
      Application.ProcessMessages;
      frmmodulo.query_servidor.next;
    end;
    FecharCupom1Click(frmVenda);
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.timer_bicoTimer(Sender: TObject);
begin
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.timer_abastecimentoTimer(Sender: TObject);

begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.grid_abastecimentoKeyPress(Sender: TObject;
  var Key: Char);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.grid_abastecimentoEnter(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.menu_mesaClick(Sender: TObject);
var nItem: integer;
begin
  if Menu_Mesa.Visible = false then exit;


  if bVenda then
  begin
    Imprime_display('Venda Aberta!', clred, tiErro);
    sleep(1500);
    Imprime_display_anterior;
    exit;
  end;

  if not bServidor_Conexao then
  begin
    repeat
      try
        frmmodulo.Conexao_Servidor.Connected := false;
        frmmodulo.Conexao_Servidor.Connected := true;
        bServidor_Conexao := true;
      except
        On E: exception do
        begin
          if application.messagebox
            (pwidechar('Erro na conex�o com o banco de dados do servidor!' + #13
            + 'Mensagem: ' + E.Message + #13 + 'Deseja tentar outra vez?'),
            'Erro', mb_yesno + MB_ICONERROR) = idno then
          begin
            break;
          end;
        end;
      end;
    until bServidor_Conexao = true;
  end;
  if not bServidor_Conexao then exit;

  bLanca_Mesa := false;

  frmMesas := tfrmMesas.create(self);
  frmMesas.showmodal;

  // iniciar a impressao da pre-venda
  if bLanca_Mesa then
  begin
    Imprime_display('Iniciando impress�o do Consumo!', clWhite, tiInfo);
    try
      // verificar o serial do ecf

      if frmPrincipal.TipoImpressora = Fiscal then
        if not verifica_ecf then
          exit;
      // Abrir o cupom fiscal
      // bloquear ao teclado
      BlockInput(True);
      if not Abre_Venda then
      begin
        // Caso o comando de abertura de venda retornou false, abortar o processo;
        Imprime_display('ERRO AO ABRIR O CUPOM!', clRed, tiErro);
        exit;
      end;
    finally
      // desbloquear o teclado
      BlockInput(False);
    end;


    // vender os itens
    // rodar a query do modulo filtrada com os produtos da pre-venda
    frmmodulo.query_servidor.first;
    nitem := 1;
    while not frmmodulo.query_servidor.eof do
    begin

      if frmmodulo.query_servidor.fieldbyname('cancelado').asfloat = 0 then
      begin
        sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
        sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
        sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
        rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
        iProd_codigo := frmmodulo.query_servidor.fieldbyname('cod_produto').asinteger;
        sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
        rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
        rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
        rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
        rProd_desconto := 0;
        rProd_acrescimo := 0;
        sProd_Tamanho := '';
        sProd_Cor := '';

        // registrar o item
        Registra_Item;
        inc(nitem);
      end
      else
      begin
        sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
        sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
        sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
        rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
        iProd_codigo := frmmodulo.query_servidor.fieldbyname('cod_produto').asinteger;
        sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
        rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
        rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
        rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
        rProd_desconto := 0;
        rProd_acrescimo := 0;
        sProd_Tamanho := '';
        sProd_Cor := '';

        // registrar o item
        Registra_Item;
        // cancelar o item

        sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
        sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
        sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
        rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
        iProd_codigo := frmmodulo.query_servidor.fieldbyname('cod_produto').asinteger;
        sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
        rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
        rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
        rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
        rProd_desconto := 0;
        rProd_acrescimo := 0;
        sProd_Tamanho := '';
        sProd_Cor := '';

        ed_cancelar_item.IntValue := nitem;
        Cancela_Item(inttostr(nitem));
        inc(nitem);
      end;

      Application.ProcessMessages;
      frmmodulo.query_servidor.next;
    end;

    if rTotal_Venda <= 0 then
    begin
      Cancela_cupom_aberto;

      // excluir a mesa e os itens
      frMmodulo.query_servidor.close;
      frmmodulo.query_servidor.sql.clear;
      frmmodulo.query_servidor.sql.add('delete from r000002 where cod_mesa =' + IntToStr(iMesa_codigo));
      frmmodulo.query_servidor.ExecSQL;

      frMmodulo.query_servidor.close;
      frmmodulo.query_servidor.sql.clear;
      frmmodulo.query_servidor.sql.add('delete from r000001 where codigo =' + IntToStr(imesa_codigo));
      frmmodulo.query_servidor.ExecSQL;
      // inserir a liberacao da mesa para nao aparecer no sistema de frente
      try
        frMmodulo.query_servidor.close;
        frmmodulo.query_servidor.sql.clear;
        frmmodulo.query_servidor.sql.add('insert into r000003 (mesa) values (' + IntToStr(imesa_codigo) + ')');
        frmmodulo.query_servidor.ExecSQL;
      except
      end;
    end
    else
    begin
      FecharCupom1Click(frmVenda);
    end;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.tmContigenciaTimer(Sender: TObject);
begin
  if TdxStatusBarStateIndicatorPanelStyle(cpBarra.Panels[7].PanelStyle).Indicators[0].IndicatorType = sitRed then
    TdxStatusBarStateIndicatorPanelStyle(cpBarra.Panels[7].PanelStyle).Indicators[0].IndicatorType := sitYellow
  else
    TdxStatusBarStateIndicatorPanelStyle(cpBarra.Panels[7].PanelStyle).Indicators[0].IndicatorType := sitRed;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.FormDestroy(Sender: TObject);
begin
  try
    FreeAndNil(CheckConnect);

  except
  end;
end;

procedure TfrmVenda.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 66) and (Shift = [ssCtrl]) then begin
    if (sConsumidor_CPF <> '') and (frmPrincipal.TipoImpressora = SemImpressora) then begin
      Application.MessageBox('Impossivel Realizar a a��o CPF do Cliente j� Informado!', 'Erro', mb_ok + mb_iconerror);
      Exit;
    end;
    if frmPrincipal.TipoImpressora = SemImpressora then
      frmPrincipal.TipoImpressora := NaoFiscal
    else
      frmPrincipal.TipoImpressora := SemImpressora;
    CorEditTotaL;
  end;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Abastecimento1Click(Sender: TObject);
begin

end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.Button2Click(Sender: TObject);
begin

  ed_barra.setfocus;

end;

procedure TfrmVenda.Voltar1Click(Sender: TObject);
begin

  bVolta_foco := true;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.timer_cargaTimer(Sender: TObject);
begin
  frmmodulo.query.close;
  frmmodulo.query.sql.clear;
  frmmodulo.query.SQL.add('select carga_data, carga_hora from config');
  frmmodulo.query.open;
  frmmodulo.qrconfig.open;
  cpBarra.Panels.Items[11].Text := frmModulo.query.fieldbyname('carga_data').asstring + ' �s ' + frmModulo.query.fieldbyname('carga_hora').asstring;
  frmModulo.qrconfig.Close;
end;

// -------------------------------------------------------------------------- //

procedure TfrmVenda.ed_unitarioKeyPress(Sender: TObject; var Key: Char);
var rd: real;
begin
  if key = #13 then begin
    if ed_unitario.value <= 0 then begin
      ed_unitario.SetFocus;
      Exit;
    end;
    if (formatfloat('##########0.00', rProd_preco) <> formatfloat('##########0.00', ed_unitario.value)) and (rProd_preco > 0) then begin
      // verificar seh eh desconto ou acrescimo
      if rProd_preco < ed_unitario.value then begin
        // foi acrescimo
        rProd_acrescimo := ed_unitario.value - rProd_preco;
        if rProd_acrescimo_maximo > 0 then begin
          rd := (rProd_acrescimo/rProd_preco)*100;
          if rd > rProd_acrescimo_maximo then begin
            frmsenha_supervisor := tfrmsenha_supervisor.create(self);
            frmsenha_supervisor.showmodal;
            if not bSupervisor_autenticado then exit;
          end;
        end else begin
          frmsenha_supervisor := tfrmsenha_supervisor.create(self);
          frmsenha_supervisor.showmodal;
          if not bSupervisor_autenticado then exit;
        end;
      end else begin
        // foi desconto
        rProd_desconto := rProd_preco - ed_unitario.value;
        rProd_desconto := rProd_desconto * rprod_Qtde;

        if rProd_desconto_maximo > 0 then
           begin
           rd := (rProd_desconto/rProd_preco)*100;
           if rd > rProd_desconto_maximo then
              begin
              frmsenha_supervisor := tfrmsenha_supervisor.create(self);
              frmsenha_supervisor.showmodal;
              if not bSupervisor_autenticado then
                 exit;
              end;
           end
        else
           begin
           frmsenha_supervisor := tfrmsenha_supervisor.create(self);
           frmsenha_supervisor.showmodal;
           if not bSupervisor_autenticado then
              exit;
           end;
      end;
      rProd_preco := ed_unitario.value;
      if bTruncar_valor then
        rprod_total := Truncar_Valor(rprod_qtde * rprod_preco)
      else
        rprod_total := rprod_qtde * rprod_preco;
    end;
    if rProd_preco = 0 then begin
      rProd_preco := ed_unitario.value;
      if bTruncar_valor then
        rprod_total := Truncar_Valor(rprod_qtde * rprod_preco)
      else
        rprod_total := rprod_qtde * rprod_preco;
    end;
    Registra_Item;
    if bMudouProvisorio then begin
      bMuda_unitario := False;
      bMudouProvisorio := False;
    end;
  end;
end;

function TfrmVenda.ImgTipoImpressora(i: Integer): TImpressora;
begin
  case i of
    0: Frmprincipal.TipoImpressora := SemImpressora;
    1: Frmprincipal.TipoImpressora := NaoFiscal;
    2: Frmprincipal.TipoImpressora := Fiscal;
  end;
  result := Frmprincipal.TipoImpressora;
end;

procedure TfrmVenda.trocaImpressaoClick(Sender: TObject);
begin

  inc(iImpressora);

  ImgTipoImpressora(iImpressora);

  frmPrincipal.GravaIni(sConfiguracoes, 'Impressora', 'TIPO', IntToStr(iImpressora));


  if iImpressora >= 2 then
    iImpressora := -1;


end;

procedure TfrmVenda.act1Execute(Sender: TObject);
begin
  trocaImpressao.Click;
end;



procedure TfrmVenda.Comandas1Click(Sender: TObject);
var nItem: integer;
  str: string;
begin

  if Comandas1.Visible = false then exit;


  if bVenda then
  begin
    Imprime_display('Venda Aberta!', clred, tiErro);
    sleep(1500);
    Imprime_display_anterior;
    exit;
  end;

  if not bServidor_Conexao then
  begin
    repeat
      try
        frmModulo.Conexao_Servidor.Connected := false;
        frmModulo.Conexao_Servidor.Connected := true;
        bServidor_Conexao := true;
      except
        on E: exception do
        begin
          if application.messagebox
            (pwidechar('Erro na conex�o com o banco de dados do servidor!' + #13
            + 'Mensagem: ' + E.Message + #13 + 'Deseja tentar outra vez?'),
            'Erro', mb_yesno + MB_ICONERROR) = idno then
          begin
            break;
          end;
        end;
      end;
    until bServidor_Conexao = true;
  end;
  if not bServidor_Conexao then exit;

  bLanca_Comanda := false;

  frmxloc_servico := Tfrmxloc_servico.create(self);
  frmxloc_servico.showmodal;

  // iniciar a impressao da pre-venda
  if bLanca_Comanda then
  begin
    Imprime_display('Iniciando impress�o do Consumo!', clWhite, tiInfo);
    try
      // verificar o serial do ecf

      if frmPrincipal.TipoImpressora = Fiscal then
        if not verifica_ecf then
          exit;
      // Abrir o cupom fiscal
      // bloquear ao teclado
      BlockInput(True);
      if not Abre_Venda then
      begin
        // Caso o comando de abertura de venda retornou false, abortar o processo;
        Imprime_display('ERRO AO ABRIR O CUPOM!', clRed, tiErro);
        exit;
      end;
    finally
      // desbloquear o teclado
      BlockInput(False);
    end;


    // vender os itens
    // rodar a query do modulo filtrada com os produtos da pre-venda
    frmmodulo.query_servidor.first;
    nitem := 1;
    while not frmmodulo.query_servidor.eof do
    begin

      if frmmodulo.query_servidor.fieldbyname('cancelado').asfloat = 0 then
      begin
        sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
        sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
        sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
        rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
        iProd_codigo := frmmodulo.query_servidor.fieldbyname('cod_produto').asinteger;
        sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
        rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
        rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
        rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
        rProd_desconto := 0;
        rProd_acrescimo := 0;
        sProd_Tamanho := '';
        sProd_Cor := '';

        // registrar o item
        Registra_Item;
        inc(nitem);
      end
      else
      begin
        sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
        sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
        sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
        rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
        iProd_codigo := frmmodulo.query_servidor.fieldbyname('cod_produto').asinteger;
        sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
        rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
        rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
        rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
        rProd_desconto := 0;
        rProd_acrescimo := 0;
        sProd_Tamanho := '';
        sProd_Cor := '';

        // registrar o item
        Registra_Item;
        // cancelar o item

        sProd_nome := frmmodulo.query_servidor.fieldbyname('produto').asstring;
        sProd_unidade := frmmodulo.query_servidor.fieldbyname('unidade').asstring;
        sProd_CST := frmmodulo.query_servidor.fieldbyname('cst').asstring;
        rProd_aliquota := frmmodulo.query_servidor.fieldbyname('aliquota').asfloat;
        iProd_codigo := frmmodulo.query_servidor.fieldbyname('cod_produto').asinteger;
        sProd_barra := frmmodulo.query_servidor.fieldbyname('codbarra').asstring;
        rProd_qtde := frmmodulo.query_servidor.fieldbyname('qtde').asfloat;
        rProd_preco := frmmodulo.query_servidor.fieldbyname('unitario').asfloat;
        rProd_total := frmmodulo.query_servidor.fieldbyname('total').asfloat;
        rProd_desconto := 0;
        rProd_acrescimo := 0;
        sProd_Tamanho := '';
        sProd_Cor := '';

        ed_cancelar_item.IntValue := nitem;
        Cancela_Item(inttostr(nitem));
        inc(nitem);
      end;

      Application.ProcessMessages;
      frmmodulo.query_servidor.next;
    end;




    if rTotal_Venda <= 0 then
    begin
      Cancela_cupom_aberto;

      // excluir a mesa e os itens
      frMmodulo.query_servidor.close;
      frmmodulo.query_servidor.sql.clear;
      frmmodulo.query_servidor.sql.add('delete from r000002 where cod_mesa =' + IntToStr(iMesa_codigo));
      frmmodulo.query_servidor.ExecSQL;

      frMmodulo.query_servidor.close;
      frmmodulo.query_servidor.sql.clear;
      frmmodulo.query_servidor.sql.add('delete from r000001 where codigo =' + IntToStr(imesa_codigo));
      frmmodulo.query_servidor.ExecSQL;
      // inserir a liberacao da mesa para nao aparecer no sistema de frente
      try
        frMmodulo.query_servidor.close;
        frmmodulo.query_servidor.sql.clear;
        frmmodulo.query_servidor.sql.add('insert into r000003 (mesa) values (' + IntToStr(imesa_codigo) + ')');
        frmmodulo.query_servidor.ExecSQL;
      except
      end;

      frmModulo.mesa_comanda := '';

    end
    else
    begin
      begin
      end;
      FecharCupom1Click(frmVenda);
    end;
  end;

end;

procedure TfrmVenda.MostraFotoProduto(b: boolean);
begin
  if bBusca_foto_produto then
    if b then
    begin
      img_produto.Visible := true;
    end
    else
    begin
      img_produto.Visible := false;
    end;
end;

procedure TfrmVenda.MostraLogoMarca(b: boolean);
begin
  if bHabLogoMarca then
    img_logo.Visible := b;

  if bHabLogoMarca then
    if b then
      if FileExists(EditLogoMarca) then
        img_logo.Picture.LoadFromFile(EditLogoMarca);


end;

procedure TfrmVenda.TimerTrocoTimer(Sender: TObject);
begin
  TimerTroco.Enabled := false;

  Imprime_display('C A I X A    L I V R E', clWhite, tiLivre);

end;

procedure TfrmVenda.CentralizarPanel(p: TPanel);
begin
  p.Top := (Height - p.Height) div 2;
  p.Left := (Width - p.Width) div 2;
end;

procedure TfrmVenda.FormResize(Sender: TObject);
begin
  img_produto.Top := pnBaseFoto.Top + (pnBaseFoto.Height - img_produto.Height) div 2;
  img_produto.Left := pnBaseFoto.Left  + (pnBaseFoto.Width - img_produto.Width) div 2;

  img_logo.Top := pnBaseFoto.Top + (pnBaseFoto.Height - img_logo.Height) div 2;
  img_logo.Left := pnBaseFoto.Left + (pnBaseFoto.Width - img_logo.Width) div 2;

  Panel1.Left := bvGrid.Left + (bvGrid.Width - Panel1.Width) div 2;

end;

end.
